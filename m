Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6083A59A8
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 19:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786216019; cv=none; b=TqMxL9H7T13aAKyqX4dAu8GLbBnMdmOFil0Esrq+3v9s9RIHQSH63hO30eYFOBvq15b0FhchcEOsXHhVi3TeTBnk+UpQLL7Nm95jWISoEKqhGeN6UzK7hRZAV0QS8mFlwQiJfi3XhDt9SxQBR4KJTWkF0Xjl4YS+tVA5CTNt26Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786216019; c=relaxed/simple;
	bh=ErhJwoafrwLkeei9/IvJlpupJojH2F2xnU7hf8WR17k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gQxWZrZXJJWwxPQECFhFL2o+NffsdJ/vIhn5wSTx7Zc+6p68rgH6Q1qCd8oi7Gsp4hDKs4RnK7H70PfM8HnePLSUuOYlQ3isq25hMAIErLqknGVQ3k4X3XkTJZhSAXa4RWwbTbInCdg3mKp8xES9KyY6xX+XpkU5osvUiRplbpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1yKt2Je; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N1yKt2Je"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED1911F000E9;
	Sat,  8 Aug 2026 19:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786216018;
	bh=TP5PC3Fnz00RrBL1TKDcW5utjWZomDFwgs70A2DAmEE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N1yKt2JejwlLEj3uoI4wukhufiW0f0zDYwTl3ayJX8d1xRsIFHiWqv3pkU+toMEn3
	 XR3cswc0kIE7gA6epxZ8tftSe8AUbP3JAXdvna1vCIiPYFri/qmlZG55uTj67xUAKP
	 p5xRseV9N/Sg3oyitLiNvGNILh0gABofaBsFH5KzxWf5gEv+Ge2Owr4pzq4/G/vpnb
	 h4L5vQejXG1LFE/8yFYHGcEkuk73ymBt+Tm7x46NC8fSlnHP4lxnz59/wJhOdIq3G5
	 U2iqbGzKZ84bPo7QCoVDubQHFlmqq06FHdSLHVVPQhxrSpPrSKbyqBGjV8lYp2AUGO
	 VyMvQFdqWS8hA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add Ilitek ILI7836A
 OLED driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling" <webgeek1234@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260808-ili7836a-v1-1-07a7becc5636@gmail.com>
References: <20260808-ili7836a-v1-0-07a7becc5636@gmail.com>
 <20260808-ili7836a-v1-1-07a7becc5636@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 19:06:57 +0000
Message-Id: <20260808190657.ED1911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The vendor prefix `retroidpocket` used in the new compatible string=
 is not documented in `vendor-prefixes.yaml`.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: display: panel: add Ilitek ILI7836A=
 OLED driver ---
commit aacb89a0d4e50af14a474c3071ac0dce394b199e
Author: Aaron Kling <webgeek1234@gmail.com>

dt-bindings: display: panel: add Ilitek ILI7836A OLED driver
   =20
This commit introduces a new device tree binding for the Ilitek ILI7836A
OLED driver. It documents the properties and compatible strings required=20
for the MIPI-DSI display used on the Retroid Pocket Nova.

> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili78=
36a.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili7836a.=
yaml
> new file mode 100644
> index 0000000000000..962cf257ed8d3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili7836a.yaml
[ ... ]
> +properties:
> +  compatible:
> +    items:
> +      - const: retroidpocket,nova-panel

[Severity: Low]
Is the retroidpocket vendor prefix documented in vendor-prefixes.yaml?
Adding a compatible string with an undocumented vendor prefix will cause a
build warning when running make dt_binding_check.

> +      - const: ilitek,ili7836a
> +
> +  reg:
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808-ili7836a-v=
1-0-07a7becc5636@gmail.com?part=3D1
