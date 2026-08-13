Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EE119C54E
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 00:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786581085; cv=none; b=qy4ST+yEDEMEZnU94bubqjk27CHYWZULbiUYxEehC7CULh9OKV/OO2Azl9Bh36eqofz8ek3300GXUJ87o/x0w4S6djcU2V5nGw5S2Mj/5/FB6BkehAGoZu1Z2xxlEfsTloNdkNlI9/2sstam1XcmM1SUJGE5PFBA6MWnMe0mV+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786581085; c=relaxed/simple;
	bh=OXd1GRywzQa+S+Pl7q81v5eNsaVNBZJN3V4nGOToixw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rrcE3raoj5snrOREBcz+ldkxmeRhZro1kueUpRcpCA2qSnyWrnrQUEDm2FzVlLsrqPfTVgC8w4XXB7zOdjYfztuU1oV6dDlizbcR3Jo47Ghm15kIrPUkFpoG3dTQIuRaJ7+ZlEsLdW8ouUIVRzFwHPi6wAdqnqckvZ2K9LtCfdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZOV/QJE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZOV/QJE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4045E1F000E9;
	Thu, 13 Aug 2026 00:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786581084;
	bh=ABNWW+rxgRZRG6myV9f0V7Dbkq1mXTr1HPcuACbw5v4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YZOV/QJEZEaXOeBKrcByD+CNlENS0m/LFZkmGL1n+PM9khwQRoT6YJeXVk0YQCBOh
	 Lbyic6y46b/Yc/W2onASmK4r42lvEDqkXyOMICz6lVKzmllL0E333f6oXV16vcbOIM
	 cJl/vB4z5nXM6QwSpmKjSnfm2nkL8qSdORXV+Q95VGx15qGN4ioBINnmpLakolqxFU
	 +zlCuZ5XNYTgv/2MxoPGrUOboSgIlxzWNyZI1G/l64qtiuRFV9XE/qkQfISn3lFL3i
	 ANQMnSt3kCShyoxNMil3cNulI8DKbCp9cEyiC4AWwOpHXAtwZTRRdALFzoBihLvuFh
	 J41MFfseqyXZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: power: reset: ti,keystone-reset: Convert
 to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260813-ti-keystone-reset-v1-1-189389503324@gmail.com>
References: <20260813-ti-keystone-reset-v1-1-189389503324@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 00:31:23 +0000
Message-Id: <20260813003124.4045E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The 'reg' property is newly marked as strictly required in the s=
chema, which breaks backward compatibility with existing out-of-tree device=
 trees.
--

--- Patch [1]: [PATCH] dt-bindings: power: reset: ti,keystone-reset: Conver=
t to DT schema ---
commit 63d9431256b9847ef3ca6d5aacac09610df2a267
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: power: reset: ti,keystone-reset: Convert to DT schema

This commit converts the Texas Instruments Keystone SoC Reset Controller
binding from a text document to a DT schema. The commit message notes
there are no new functional changes.

> diff --git a/Documentation/devicetree/bindings/power/reset/ti,keystone-re=
set.yaml b/Documentation/devicetree/bindings/power/reset/ti,keystone-reset.=
yaml
> new file mode 100644
> index 0000000000000..ecc68d37f07e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/reset/ti,keystone-reset.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg

[Severity: Medium]
Does adding 'reg' to the required list break backward compatibility with
existing device trees?

The old text binding did not document or include a 'reg' property in its
examples, meaning existing device trees following the old binding will now
fail validation during `make dtbs_check` with this new schema. Since the
kernel driver does not parse or map the 'reg' property and relies on syscon
offsets instead, is it necessary to mark 'reg' as strictly required here?

> +  - ti,syscon-pll
> +  - ti,syscon-dev
> +
> +additionalProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-ti-keyston=
e-reset-v1-1-189389503324@gmail.com?part=3D1
