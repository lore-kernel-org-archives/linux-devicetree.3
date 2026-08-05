Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75DC4399C4
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 12:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934677; cv=none; b=hrjwdDz1V4vQQlGaq4CRxZ3e2NiOBvMfNYkAfo41hgJCfipFjQ9Lucdsk4+qfMbcLsLMktGfftgN8tfFZjcbiIBxrCnLf7bej0vBEkDlHJHKHFXk+gDxx3/fkk1OOIF0RI0WhE/qD/D4tJLOkPh6gZIF01ZEBOnU7wa1UjvkYBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934677; c=relaxed/simple;
	bh=1+otrgwOpmeE6Od/gRkFxz6J4yLXjbeGELibuZJlhWo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uzNaRM+8Snf9NRLJlAN9QIkjwCRK7ut9eBMmNGBmEtYZpyot2fM12fyVPhvz78UuYm+aFCN2XqmsjVwtAQkqXil4ZKNRcyfnUi4RVQYtI84ePV6Cd/kPP5xXwLCBko4dbLoa/vpig3947xfTVnoepAmmwxB7Ax6w01gwwgyFhgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WmFc224z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WmFc224z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6D51F00A3E;
	Wed,  5 Aug 2026 12:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785934676;
	bh=2NQ783My2xDV8q9DO17q6L2F88wUOiMRSZfa1PItUpQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WmFc224zLIag6JWJpEgu7cUaF0opHVffToXApn9MKSw8PvsVZbw35zcyG+SZAQuDu
	 9nCB9j/dorz45kKC3dT/BM+07qpzaRv+sGDvLb9XAL3BoeHyiH324rFvFR/DyXWlO+
	 VW4BCvTP4iHx5Sz+Vci/f3/BFlYbcILyJvDIqa6XuKuBi1YhzMDrlK8emqpEXQS6CN
	 VWF/JoIdGD87e4XcPqg/ZuH05ejbp28FjhGwTVoRCAHliidpMPkidfHFuNebi0BEs6
	 UESYemE2oX4EwYk4+5nhj8jXuQTn8ST9+qp/3MfDs+mUGp98fWXgVUzMmxwayvWfLK
	 URrT/fR8c4mRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 11/36] pinctrl: airoha: fix I2C pin mux config for
 AN7583
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805123408.3767648-12-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-12-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 12:57:55 +0000
Message-Id: <20260805125756.1F6D51F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing Devicetree Binding Update for AN7583 'i2c0' pin group
--

--- Patch [11]: [PATCH v10 11/36] pinctrl: airoha: fix I2C pin mux config f=
or AN7583 ---
commit e28587d243bbc4921ed81a1b0233d819959a9116
Author: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>

pinctrl: airoha: fix I2C pin mux config for AN7583

This commit adds dedicated I2C pin groups and function groups for AN7583.
It introduces new groups to support both i2c0 and i2c1 because both busses
share pins with GPIO.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 2695342adfc76..7de07d002d05f 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -896,6 +896,7 @@ static const char *const uart_groups[] =3D { "uart2",=
 "uart2_cts_rts", "hsuart",
>  					   "hsuart_cts_rts", "uart4",
>  					   "uart5" };
>  static const char *const i2c_groups[] =3D { "i2c1" };
> +static const char *const an7583_i2c_groups[] =3D { "i2c0", "i2c1" };

[Severity: Medium]
Will this addition cause device tree validation failures?

Looking at Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.=
yaml,
the schema strictly limits the "i2c" function's valid groups to only "i2c1":

          - if:
              properties:
                function:
                  const: i2c
            then:
              properties:
                groups:
                  enum: [i2c1]

If a user specifies function =3D "i2c" and groups =3D "i2c0" in a board dev=
ice
tree, it will fail dtbs_check schema validation, despite being valid and
supported by the updated driver.

Should the device tree binding document be updated alongside this change to
allow the new "i2c0" group?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805123408.3767=
648-1-mikhail.kshevetskiy@iopsys.eu?part=3D11
