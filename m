Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E449F3E5EE4
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 21:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782336274; cv=none; b=miltR1NGRCjxAAHrCQqk3yI3VMCAaaVkxL2I5cu8ompdPWAN0V66WKSh1nt06GlDG8E4YKEK0+D9NTaiHUt7mIQ11Ef/PdErSzEWbxxQBrLXdlrSDK0q3exGUApug8QAaMMJwZI0rQpiUuVkriCpEwPIz83IN/Ng5C3Vzikuo7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782336274; c=relaxed/simple;
	bh=WNqc7VH/vhMF2b01G53gIEvwoxAsVlNNbqNDQtBQxd8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eBv4VdS5NpR4YV6S0h19iC/mQe0LO4cGweHhvdsFkuYokZuYPDDNm8VMhOxhjuDsdYlS7yEJXX3zRUTX7KW1Tg+jxCHerDGNIPuLbWkoljQIRP8ogHWxbbtfzltoqGYC4flPaPCLiSG9XryTKJKZaQYouckqygbVrAuMWbcyZqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Geog2AJr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Geog2AJr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C0C1F000E9;
	Wed, 24 Jun 2026 21:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782336273;
	bh=CUvDqEbkpUNTTdMrWLE031AHBQEREzlHofRcJ1utrg0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Geog2AJrGXtPd3WjAIrlRPYgrl0mq6lJvhf4BvCP8I+XXTgfr1gMkE1FqCrWlctAK
	 oyRAeaY/FUuro/EUHaUEdhOzpTsToijAuglSlfp7Gt10DyQo78PU0/Yhpn3PKlRYPN
	 y7Ik/guuvonkH+wzLOKCdu1v4QR5DIzM68ihHv6zPIK9Hbg96B66ug335DRvhxqmjG
	 eiTNt/XzTRZ4Ywr9Cq0r6O3CKHHOo2zy5bLkq8cr9vxbG0hPtJlAQmiB8NFKQ+ASd/
	 xKnv7D6GFQwSWGDyRWQnrtuypg6VpRxjdIANo1E3WPWPYID3Y1GUXZYGA+IyjKwCBc
	 9j6GhFOwN7sWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] ASoC: dt-bindings: Convert cirrus,cs35l36 to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg via B4 Relay" <devnull+david.ixit.cz@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260624-dt-cirrus-cs35l36-v3-1-ec451d5a2908@ixit.cz>
References: <20260624-dt-cirrus-cs35l36-v3-1-ec451d5a2908@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 21:24:32 +0000
Message-Id: <20260624212433.74C0C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `cirrus,boost-ind-nanohenry` property was incorrectly omitte=
d from the `required` list in the YAML schema.
--

commit 778c838f7518ecfc3c565efa00f1019533b91e2d
Author: David Heidelberg <david@ixit.cz>

ASoC: dt-bindings: Convert cirrus,cs35l36 to DT schema

Convert the CS35L36 Speaker Amplifier binding from text to YAML format,=20
updating the maintainer list and aligning the properties with the datasheet.

> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l36.yaml =
b/Documentation/devicetree/bindings/sound/cirrus,cs35l36.yaml
> new file mode 100644
> index 0000000000000..2a142b32acf50
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l36.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - VA-supply
> +  - cirrus,boost-ctl-millivolt
> +  - cirrus,boost-peak-milliamp

[Severity: Medium]
Should cirrus,boost-ind-nanohenry be included in this required list?

A device tree missing this property will pass schema validation, but the=20
driver will fail to probe. Looking at cs35l36_handle_of_data() in=20
sound/soc/codecs/cs35l36.c, the driver hard-fails if it's absent:

sound/soc/codecs/cs35l36.c:cs35l36_handle_of_data() {
	...
	if (of_property_read_u32(np, "cirrus,boost-ind-nanohenry", &val) >=3D 0) {
		pdata->boost_ind =3D val;
	} else {
		dev_err(&i2c_client->dev, "Inductor not specified.\n");
		return -EINVAL;
	}
	...
}

> +
> +unevaluatedProperties: false
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624-dt-cirrus-=
cs35l36-v3-1-ec451d5a2908@ixit.cz?part=3D1
