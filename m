Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FDB396585
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 18:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780425128; cv=none; b=MD+kbP3BcLOkhnSFnzuWFU7zDi74+VHlBRSqYhutP/u4hTopBaK+AHURLhmT6W2tDeMBiZlAEmdv0bD5DtsavhmL+4eXnTSs4KifZKNZDnKOLk8capvSGBjJv1wv9Wh+CyiOkrWx+0laStXtr085E0eFHjpdlMm7PYhvjUGWmmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780425128; c=relaxed/simple;
	bh=CQSYuECG9EefKD0YtNkUZwSrtj6hxQDo4zKaaqWZsFw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eR8mq1aJ5KVk7ouCq4kbK7pqpV5i6YUQt9xsWmcAjZD1SneBvOmLT6zUzB8voGatwN62Wv0PaHt0Tk6lSXIDGWcNCtbaeJixJMiOQEQqV1kZ6NPVqwOU0yPs9mrlKHjMu9A/pkUgLFkwn2wGCfHu56v8XGn4io4Dl/Dv9IQwO+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dvvXgf+d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dvvXgf+d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40FAB1F00898;
	Tue,  2 Jun 2026 18:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780425127;
	bh=UxJ571fSRUxUH36Ap2QIHASwYXWKj9EU/H9x1gnKshA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dvvXgf+d4HtspVB12gRR7xla6L62BvcEcC5mebYy6bm/HObIwfnkFkToA/VFav+4e
	 qrsDc8mnHsmhCLoNPpLEbrsPpgHemATSPvHOulae8eLe/ejCE/TOH8uhD2K1XiS7e7
	 EvGgF4mGxvxaJTYMeD0gz6/B2tAyWNg3YnZU5dooZmL6yXkNxAPrkokdsX2bI8viMr
	 78E2X4o4otbERCpdqXjxUiwDNGTBkRkKRGvDVCWN7frFT/UmgKJU4PZjujiQLiU55U
	 4bxUB7lHFI/wo7tpUI1o+/ANiXT51WTPw1lPEZ/Di/g/AX5ngkxK3BpS3rFQzwVrNp
	 0/NUOQTfqB5qQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] arm64: renesas: r8a779g0: add MFIS node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org
In-Reply-To: <20260602182157.304964-2-wsa+renesas@sang-engineering.com>
References: <20260602182157.304964-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 18:32:06 +0000
Message-Id: <20260602183207.40FAB1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly introduced `renesas,r8a779g0-mfis` compatible string lack=
s corresponding device tree binding documentation.
--

commit 115f5a17688f2c0823c49f8d37bc7d1f7b1d6a27
Author: Wolfram Sang <wsa+renesas@sang-engineering.com>

arm64: renesas: r8a779g0: add MFIS node

This commit adds the MFIS core node, which is used for tasks such as
inter-processor communication, to the r8a779g0 device tree.

> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/=
dts/renesas/r8a779g0.dtsi
> index 82a7278836e57..8846bac990864 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
[ ... ]
> @@ -589,6 +589,23 @@ tmu4: timer@ffc00000 {
>  			status =3D "disabled";
>  		};
> =20
> +		mfis: system-controller@e6260000 {
> +			compatible =3D "renesas,r8a779g0-mfis";

[Severity: Low]
Does this new compatible string have corresponding device tree binding
documentation?

This isn't a bug, but introducing "renesas,r8a779g0-mfis" without an
accompanying schema update will trigger dtbs_check and checkpatch.pl
warnings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602182157.3049=
64-2-wsa+renesas@sang-engineering.com?part=3D1
