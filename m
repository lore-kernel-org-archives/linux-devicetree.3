Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B7147F76A
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047772; cv=none; b=nD4u6Qf+FQKYI9+W9sMiB+iF6Tef0JlSKNggzMvRcr91rKTxuUO8wffCrGF5LCOsybybL3pr1EmiejZ3C95KcVqGOoax5y8P85Nap+aRvFXTBA2NpMhodYLWY+/GGrt0Fevlw2Dm9jwTjIaM6V9Yjh75bHpwvUdJtlj+SJVJ6J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047772; c=relaxed/simple;
	bh=UM2K3l0lcYy3viWbzMsnXSlszL9ImSowvmTO0yDgviY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PdaHL2m2Atu2/BD0bL050mArN7msBF9cwd5qCKRI8gHhTkjpFBr67tPucbCoT7kjiUMIuxH8l+XNSkGxTo8YERq0Rm/VmpjPNN7eP8epVHtduJGlT/4/xdsBefq9XEiqsTqWIXE6Y8bU4EPbufIihyXnF/ag0Dho4PrC5uycNAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UALoIaag; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UALoIaag"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340B11F000FF;
	Thu, 10 Sep 2026 13:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789047770;
	bh=feqURyh4osuT/D9kSjU5W/v2pP9iYc9XlKBfwd4gIoA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UALoIaagCgSZA3DWDYdz55bmj88ekXa1iZvnSMt0yzFbzUfw6gxbMBzS+L+OEE7jj
	 g7zsAAYTjQlbv7WbGxqsRCc3VEodVEcX1h0aDiGxAWpbGvjFP553pdbGIVSvz29Y6y
	 1aomtR8fwdqbOFwy/vWzgsKM8CxSk//ZDy2p41XVvxmLxsTBVHTE55+W52Pq2Pgb5H
	 qqnZUVcu+6RHv0VLjoRUQv1Lpvr/qKdEqN0G3x+MFDuMNaENlLLORXNTrTv4vFVZVI
	 yiFGs+BWVBt/KigsuuxzHkvv3tZMUIG2JDQPUlZRNcAkaRu+JBEGTi1vflmfgO0TG3
	 HdB9tyrsxSu3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 19/34] arm64: dts: qcom: kodiak: Fix PCIe wake GPIO
 polarity
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260910-root_port-v1-19-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-19-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 13:42:49 +0000
Message-Id: <20260910134250.340B11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Undocumented functional change (adding missing wake-gpios proper=
ty).
--

commit f9eaa8a25d673bb044fadcfbda30d55434544bbe
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: kodiak: Fix PCIe wake GPIO polarity

This commit fixes the PCIe wake-gpios polarity across several boards by
changing the active state from high to low. This is intended to match the
active-low requirement defined in the PCIe Base Specification.

> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch=
/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
> index 5bb33a8a98304..509fc4941a029 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
[ ... ]
> @@ -579,6 +579,7 @@ &pcie1_phy {
> =20
>  &pcie1_port0 {
>  	reset-gpios =3D <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios =3D <&tlmm 3 GPIO_ACTIVE_LOW>;

[Severity: Medium]
The commit message focuses on changing the polarity of existing wake-gpios
properties, but this addition introduces a brand new wake-gpios property to
pcie1_port0 that was completely missing before.

Is this functional addition intentional? If so, could this be documented in
the commit message so that it accurately reflects all the scope changes
introduced by the patch?

>  };
> =20
>  &pmk8350_adc_tm {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-root_port-=
v1-0-90a252ddbbfa@oss.qualcomm.com?part=3D19
