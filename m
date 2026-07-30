Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3743B71CB
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 07:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785395056; cv=none; b=e2vuTLaHp8JANIdoqQcfxDKa2kYXOvzA9MEpeXdxcqw6djqW3jkLuF1VdHVqhZvafToPGjUP5+VbJOz2TNXeRTS8/LhPV+oUwFLwm0CSJGWEwq/uvz/nbPHAXIAGHn1nEZ8goksfq4pbvxDCub48SL6szJbBq6ShmN+q3dzsPRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785395056; c=relaxed/simple;
	bh=tO0bwDk4KhrqnsYS6lRXMRLastlX/L+lMIDSzGeWyTo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vnd0UoZhktQjKrULsWUl3fwWIGpdwLnu94JG14Y0rtYbiK5VKBG9sHBJHI7GpiK82m9rMCui+W0n3bxmSwo0Pp5SNzxdZi178cLAca0rkfIvAzDXBlhP0g7JPyuVK67SdbFHv02X7WfFtHrAwc21bnkpkNyyPJy6nPAirIdN4bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CfzMonwL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CfzMonwL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C033E1F000E9;
	Thu, 30 Jul 2026 07:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785395053;
	bh=HbtfMbK2cHV9ho+jZQ3BXejqBFb/j63UkqKfMoCj/Y0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CfzMonwLNcL+0CSy34MElLoUI3hXkcqmElK+B7nWVBMZudszFVyi27dOLHC3I36HJ
	 oONvWoZmQoWM9jDAGNuPlB/GH5n7So1ud2cQcBGL5AJ80wcRLmZs4HVxAfuTTCpDes
	 lIry/eJjiym03E6NZF8yVuFnegvNPOn2JCke5qoc0x0b+6JdWSPWFFKQcqNEbwr8Ey
	 9UkpIVyRgp0wMve8EyWZ5dFcbk1CE7QfEMmbOTjMEodQAJk2gmRYROpPfJQT1QMtAa
	 uklImLSr2Yp/OdRcn35grbejc0F112n7oyfnKciqKG+cEUekM6zKLTSrBk1Xptp7sM
	 +Kwl+cnr7talA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/2] dt-bindings: media: add ITE IT6625/IT6626 HDMI
 bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hermes Wu" <Hermes.wu@ite.com.tw>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260730-upstream-it6625-it6626-v9-1-e7725db2b92f@ite.com.tw>
References: <20260730-upstream-it6625-it6626-v9-0-e7725db2b92f@ite.com.tw>
 <20260730-upstream-it6625-it6626-v9-1-e7725db2b92f@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 07:04:12 +0000
Message-Id: <20260730070412.C033E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The schema permits `bus-type =3D <1>` (C-PHY) for the `ite,it6625` =
compatible, despite the hardware only supporting D-PHY.
--

--- Patch [1]: [PATCH v9 1/2] dt-bindings: media: add ITE IT6625/IT6626 HDM=
I bridge ---
commit f6d61ed9f4634ce06509b6b075bb232fb04aed05
Author: Hermes Wu <Hermes.wu@ite.com.tw>

dt-bindings: media: add ITE IT6625/IT6626 HDMI bridge

This commit adds the device tree binding schema for the ITE IT6625 and IT66=
26=20
HDMI to MIPI CSI-2 bridges. It documents the supported properties, including
the required I2C configuration, power supplies, and port endpoints for CSI-2
outputs and HDMI input.

> diff --git a/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml =
b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
> new file mode 100644
> index 0000000000000..756fe655f534f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml

[ ... ]

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ite,it6626

[Severity: Low]
Does omitting an if block for ite,it6625 here permit invalid device trees to
pass validation?

Without a constraint for ite,it6625, it appears a configuration specifying=
=20
bus-type =3D <1> (C-PHY) would silently pass schema validation, despite the
hardware only supporting D-PHY.

> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              properties:
> +                endpoint:
> +                  required:
> +                    - bus-type

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-upstream-i=
t6625-it6626-v9-0-e7725db2b92f@ite.com.tw?part=3D1
