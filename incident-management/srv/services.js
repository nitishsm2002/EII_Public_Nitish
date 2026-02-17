const cds = require('@sap/cds');

module.exports = class CustomersService extends cds.ApplicationService {

  init() {

    // const { Customers } = cds.entities('CustomersService');

    this.on('READ', 'Customers', async (req) => {
      return await cds.tx(req).run(
        SELECT.from('Customers').columns('ID',{ref: ['incidents'],expand:[{ ref: ['title'] }]}));
        const { Customers } = cds.entities('CustomersService');
    });

    return super.init();
  }
};
