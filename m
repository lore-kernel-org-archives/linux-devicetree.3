Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377F81DFFB
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 04:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790310269; cv=none; b=TsQQmM3ZGSKmbsf+veSIgxPraA2hupU6UxYgeLWEE2IOFQWdRN8tvMG/lpnG7M8aCAF3g+6XjSDSmsGIki+10Ju7G/MokRBK0pDLw1hZTuV7/N8Jx00yCVlJIpIOwS/T9GudGhwN0Io3dnQPFAf9yqGBDe/8wGVwKbl0hOEhjjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790310269; c=relaxed/simple;
	bh=61IwmStR6+ip7xhlKnMTAhbtPcYE3LUBnbvxknkpeas=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZK1D5QO+Uyr9SZiCxL5HonqpC9VTqIXEgtjx2q9BUv4pWyikNnSKjQwcxxePB26qeQ5KSe2WSngLjDL+YfhfER+6jNwT+R7vpwFV0cm2WvqcADQq2OVhGTmAr7aDjjq5kfrpFkIRmCFShOMmM/R9wtY+4qYGAr7dotJITnGz06w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EaKahR+8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EaKahR+8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56591F000FF;
	Fri, 25 Sep 2026 04:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790310268;
	bh=a2zTBwezpWNzpF5o9F/jfRtWi2bt5621/Kc1nhSY+Ks=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EaKahR+86f3+vN1EJou9QGkaP0w6hshLJ60fkt2s0YGqaoO686aMB4JL2/J3sU+fl
	 hRVlYIMdpWffykxuTOPGeAJ6kLOwyFVn07itcxSmc8WmK4/JKfxSmt2Amkv/mYLyET
	 ukSGzxWn5+zF6adfEVR6TZFzvD0F7+6WFj2YuJlMo0Xtvjr03zS4YtZp/FXBXbKcyw
	 5WkB7w+EHpXLnyH0mJse1edJnLBHNSOaZgumO6Rh1x0ln5+ftCBx9vqT+dgGzK51/V
	 jiMo6SfpaqNL3F+58q/0exmQUYA8mX2HcwBF0dEjBSrWFvrXjdSGgV3RX7zYXCMaNO
	 RKfpc49ws9DlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: agilex5: add support for debug
 daughter card
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ng Ho Yin" <adrian.ho.yin.ng@altera.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <3dc20b61d38e.1790308304.git.adrian.ho.yin.ng@altera.com>
References: <cover.1790308304.git.adrian.ho.yin.ng@altera.com>
 <3dc20b61d38e.1790308304.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 04:24:27 +0000
Message-Id: <20260925042427.D56591F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: undefined label usb31 causes build breakage
--

commit 9aa710e27c40d1e631b159f030bd4278c2898e97
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

arm64: dts: agilex5: add support for debug daughter card

This commit adds a new device tree for the Agilex5 SoCDK debug daughter car=
d.
It overrides several peripheral nodes including ethernet, SPI, and USB to
reflect the updated hardware wiring.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dts b/=
arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dts
> new file mode 100644
> index 0000000000000..5c36410128cf3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dts

[ ... ]

> +&usb31 {
> +	dr_mode =3D "host";
> +	status =3D "okay";
> +};

[Severity: Low]
Will this compile successfully? It looks like usb31 is an undefined label,
which will cause a syntax error (unresolved reference) during device tree
compilation.

The base socfpga_agilex5.dtsi defines the USB controller label as usb0. Sho=
uld
this node override reference &usb0 instead to prevent the dtbs build from
breaking?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790308304.gi=
t.adrian.ho.yin.ng@altera.com?part=3D2
