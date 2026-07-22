Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD27D4D90CA;
	Wed, 22 Jul 2026 11:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784720798; cv=none; b=hF7DPSNh3PM6m+II+C3+XiLsxgCW58mR+VMwf9Q0pMeUB5k86TAo2GVcZ5/4RCvWtLp+YRhhGJFCCMNxZWFZ1Aqzm3TUXPB8la3aHIrjXAEj8tm2oF4J/z62H3JRdx0Whwf+5suXKRwgUGVVhVG7+O7cXQThS8YB1O5ZRuyvsnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784720798; c=relaxed/simple;
	bh=DFSPlMdXZGbpbf2dEcjIrQO2cm9nE+2xVW2iM9miGko=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SzUXgP0lXQ/z52M6olTOBLrvywtHUQT93QvfJZbIYAoXwqvwzT/NJEghG8wgEt3mgZd5F+XDs/6rKOUUO7lganR6ztLIninTuJ7JzkrySPtXLVoT95NYC2LcZiCk1cGadHzG5vjZ+dHOudnmAsqySQObyt9FnHlTEnctnfg5ybg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=JkpvVUfU; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="JkpvVUfU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784720794;
	bh=BWcCusQ28FbVznAVl+tc3Bd3miMXsSj/x/rAhqbfUa4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JkpvVUfUdMIzlFefv4cRZkhynvd7wAubwbSMBmvFJ0Q/21oUq6YfApbKZ2Z0m/eJt
	 ogG3DApQoHwMFnVc5Xr34XUsOpmAPxRSuYzscQviykpMsgO8TJpMg2F6nWr/AAbzkh
	 GuZw4E0wvX8lCTatFcpdWz8bOljjcmbs0i0WKUkmPO1cWYw4uauY/tb1S5BHDk1JnL
	 R9n14gFWYxA/DXpssirUUjl3o1mdkZ1qaBwTqh1ZUdfgxohrbir6sbZMGUQtWqXdnG
	 R7pVczUByMRRndbcPq/N5w+bsWqs1qZ0aYPXlyhxFTvzjWCgmyhjziiqvy2551u5ZT
	 k0IxNzNLX4QwQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6DB93662E1;
	Wed, 22 Jul 2026 19:46:34 +0800 (AWST)
Message-ID: <de6f82c5601a4481e418270171e803340368bd2a.camel@codeconstruct.com.au>
Subject: Re: [PATCH v8 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kyle Hsieh <kylehsieh1995@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Wed, 22 Jul 2026 21:16:34 +0930
In-Reply-To: <20260615-ventura2_initial_dts-v8-2-c89f92c80447@gmail.com>
References: <20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com>
	 <20260615-ventura2_initial_dts-v8-2-c89f92c80447@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-06-15 at 10:46 +0800, Kyle Hsieh wrote:
> Ventura2 is a Rack Management Controller. It is a modular
> device designed to manage liquid cooling systems and monitor hardware
> states within an IT rack. The system uses an AST2600 BMC for management.
>=20
> RMCv2 serves several critical roles:
> - Detects liquid leakage at both tray and rack levels.
> - Communicates with and controls liquid cooling equipment.
> - Manages leakage events and executes system recovery protocols.
>=20
> Key hardware features include:
> - An extensive I2C and IO expander topology to support comprehensive
> =C2=A0 sensor monitoring and backward compatibility with legacy trays.
> - MCTP over I2C support for asynchronous device communications.
> - A dual-flash design for BMC firmware redundancy.
>=20
> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 1 +
> =C2=A0.../dts/aspeed/aspeed-bmc-facebook-ventura2.dts=C2=A0=C2=A0=C2=A0 |=
 2903 ++++++++++++++++++++
> =C2=A02 files changed, 2904 insertions(+)

We now have scripts/dtc/dt-check-style. Running it over the dts with '-
-mode relaxed' yields 49 instances of 'mixed-indent-chars' - these must
be fixed. Further, can you please look at the output with '--mode
strict', address all the warnings that are reasonable, and then discuss
what's left?

Otherwise, there are still some concerns reported against the bindings:

   $ make CHECK_DTBS=3Dy aspeed/aspeed-bmc-facebook-ventura2.dtb W=3D1
   ...
     DTC [C] arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /ahb/apb/lpc@=
1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast26=
00-lhc']
   /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/bo=
ot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: fan-controller@20 (maxim,ma=
x31790): 'channel@2', 'channel@5' do not match any of the regexes: '^fan@[0=
-9]+$', '^pinctrl-[0-9]+$'
           from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31=
790.yaml
   /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/bo=
ot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: i2c@400 (aspeed,ast2600-i2c=
-bus): Unevaluated properties are not allowed ('aspeed,hw-timeout-ms' was u=
nexpected)
           from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.ya=
ml
   /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/bo=
ot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: adc@48 (ti,ads1015): '#addr=
ess-cells' is a required property
           from schema $id: http://devicetree.org/schemas/iio/adc/ti,ads101=
5.yaml
   /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/bo=
ot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: adc@48 (ti,ads1015): '#size=
-cells' is a required property
           from schema $id: http://devicetree.org/schemas/iio/adc/ti,ads101=
5.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /ahb/apb/bus@=
1e78a000/i2c@580/power-monitor@69: failed to match any schema with compatib=
le: ['pmbus']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /ahb/apb/bus@=
1e7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,ast=
2600-i3c-global', 'syscon']

Can you please tidy these up?

Thanks,

Andrew
