Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109FC1DF736;
	Wed, 24 Jun 2026 11:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782300156; cv=none; b=usMy4dsXZf9yJM6yZuTGeH2la9Jth+ER6m1zN9RmFC+9JMtzTqR1ArOeZ8vmt5z7ux9J8FdA57Jd9cdspdxU/b7E3ZDSSrt3x0+bqLyCSECotl4x+pu9yR9kGX92CDCjJ0r7d7kzx/CQOyeCOF5+uAjMpeUj1wURBpD+KQLZ9ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782300156; c=relaxed/simple;
	bh=17LRvtbnZ5bNr9G06GQkE3rQhmLat5vO2HSqYI8gFYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QUGDfJwh4Xdi4Md6s9CXsGrP5jMEMA++l5AR3ZimRjYKsJbOJT0O9NRWqHmvEsZuz16m/xE4MrBC4PJvjbCsfMUKc0oATQ9hppEZyIgpJeLu6ruU7V8shPo8vg6IWiM8v0FdeRS9AsWACbfBiWLHPK6IBVJoIJSCdvSNNm3taag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ktzIrRt3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ktzIrRt3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A571F000E9;
	Wed, 24 Jun 2026 11:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782300154;
	bh=rJrfxapRcOfNT3hEHr5fuexYsBU02iEG2ukhI2/ioF8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ktzIrRt3UmlDd1dg5kbsC0H1aNZBnyQ3oeLlcsxabTDDO3JkF/yYObrF7uVp2ZIgq
	 08TnPtUSfF1B8ZizMKtVYb9bPLxLpaaE0E/B1Cn7DHjfuwH0s8gCtMWHeL5Nn8eKHF
	 iu/BU+8nYvljLyFqkSrVlhy9tX9qf9F0YoCvr9yDyYAQdXj39fqLhkDSM9HTVuFMS+
	 P+S+tMyUDERhPl+i3CAupKGZ/rpkMcslOegErXlcaRDsAouQfuxxSkec7+L4i0qkgO
	 7deE8xbBD+AdT3c7IczZguRv903lTiRXOhiigE7/oMbiPVj3cOgZmytWzqOtANGdMu
	 Go/Up8YAusGAQ==
Message-ID: <42760292-3a29-4600-8676-6a79d3b5d7a4@kernel.org>
Date: Wed, 24 Jun 2026 13:22:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: interrupt-controller: ti,irq-crossbar:
 Convert to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: simona.toaca@nxp.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 m-chawdhry@ti.com, daniel.baluta@gmail.com, Thomas Gleixner
 <tglx@kernel.org>, Sricharan R <r.sricharan@ti.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, goledhruva@gmail.com
References: <20260612-crossbar-v3-1-266747bc2e86@gmail.com>
 <178154975475.1640860.7016352484406221018.robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <178154975475.1640860.7016352484406221018.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/15/26 11:01 PM, Rob Herring (Arm) wrote:
> 
> On Fri, 12 Jun 2026 02:42:29 +0530, Bhargav Joshi wrote:
>> Convert TI irq-crossbar binding from text format to DT schema.
>>
>> As part of conversion following changes are made:
>>  - Add '#interrupt-cells' as a required property which was missing in
>>    text binding
>>  - As irq-crossbar is interrupt-controller. Move binding from
>>    bindings/arm/omap to bindings/interrupt-controller
>>
>> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
>> ---
>> Changes in v3:
>> - Fixed typo in property description
>> - Link to v2: https://lore.kernel.org/r/20260611-crossbar-v2-1-231d4f88298e@gmail.com
>>
>> Changes in v2:
>> - Dropped property name change and driver updates.
>> - Link to v1: https://lore.kernel.org/r/20260606-crossbar-v1-0-f67f7cb9ee50@gmail.com
>> ---
>>  .../devicetree/bindings/arm/omap/crossbar.txt      | 55 -------------
>>  .../interrupt-controller/ti,irq-crossbar.yaml      | 96 ++++++++++++++++++++++
>>  2 files changed, 96 insertions(+), 55 deletions(-)
>>
> 
> Applied, thanks!

With:

$ dt-validate --version
2026.4

on next-20260623

I'm getting:

$ LC_ALL=C make ARCH=arm64 LLVM=1 -j24 dt_binding_check
SCHEMA  Documentation/devicetree/bindings/processed-schema.json
Traceback (most recent call last):
  File "/home/konrad/.local/bin/dt-mk-schema", line 6, in <module>
    sys.exit(main())
             ~~~~^^
  File "/home/konrad/.local/share/pipx/venvs/dtschema/lib/python3.14/site-packages/dtschema/mk_schema.py", line 28, in main
    schemas = dtschema.DTValidator(args.schemas).schemas
              ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^
  File "/home/konrad/.local/share/pipx/venvs/dtschema/lib/python3.14/site-packages/dtschema/validator.py", line 399, in __init__
    self.make_property_type_cache()
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^
  File "/home/konrad/.local/share/pipx/venvs/dtschema/lib/python3.14/site-packages/dtschema/validator.py", line 528, in make_property_type_cache
    self.check_duplicate_property_types()
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^
  File "/home/konrad/.local/share/pipx/venvs/dtschema/lib/python3.14/site-packages/dtschema/validator.py", line 522, in check_duplicate_property_types
    print(f"{self.schemas[sch_id]['$filename']}: {p}: multiple incompatible types: {v['type']}", file=sys.stderr)
             ~~~~~~~~~~~~^^^^^^^^
KeyError: 'http://devicetree.org/schemas/interrupt-controller/ti,irq-crossbar.yaml#'
make[2]: *** [Documentation/devicetree/bindings/Makefile:75: Documentation/devicetree/bindings/processed-schema.json] Błąd 1
make[2]: *** Kasuję plik 'Documentation/devicetree/bindings/processed-schema.json'
make[1]: *** [<snip>/linux/Makefile:1672: dt_binding_schemas] Błąd 2
make: *** [Makefile:248: __sub-make] Error 2

Konrad
