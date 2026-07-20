Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3143D5226
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 09:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784540567; cv=none; b=IcPAeAB3PKvqVIeNsB/aDpIcPOpfQrBXuzHx6FaG2sYweG2j94W63gr5CbJp4DU+F6vJ2dMBbsLZDJumF8gBY1XrZlSFXRmKFKJOflgKaFERfc1Fyy5QQ8khmcskaBZYO4v2wt0Mj529my7lQOQMpcruspP5EzxmKAOIyBx9mwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784540567; c=relaxed/simple;
	bh=/d7jaDoz3OWU2Kuj+2V/XZEZUVY4bWaCSbXIueNvke8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FfQaAXmd/SPELC/jFFqKa7jPFQ6E2vCGql/VBJDYBsUniims4ePgtUbwlRTA+/iaJTIZTGDuPaghX3JbDQ6QfoCkGm2v2NFQEAj4JvPB5+gExINqRetim0frKfueufi8TC8gHxovGYbAicRJ1NJ9yiUy9Me1JnnpO4qzPr9ThRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DDuwspWG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DDuwspWG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E4A1F000E9;
	Mon, 20 Jul 2026 09:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784540566;
	bh=2OU0sNTgvYQ3rX9NHPF5dOZpEjpVCQzwnXAiRgEMU2M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DDuwspWG9sVwTtEIeceNTV6qTTeHpXKV2q02zUWnluwNu0l2e2z++iA7sqZBfDdjF
	 EUIyvH8WjRjHV5d2hE/YfQI+jceFciwMNYQVtAxr/7CyaAFzWVeEwTZsLlW7BGqopv
	 UZS/pafY30M6DjaR/vb9+OF32wQo988ScVsXKrqFJhuYGqme0fORjw4s3DaSxxYH7X
	 hs1x0ipoHpYT/vGE2KKskrYWfYTdNJJUl1WffAfAMIWgsMZU58HS2FF5u+FCqEJac/
	 HipAd6TZLB5QEznjD+X6C+PLBON85RU7Xn4ZlZ22wzh9RK1MFohwoNhYtn9ds9DHoI
	 F0+0V4d8liTFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: Add slim nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: XiaoYeZi <qaz6750@qq.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <tencent_DF2E181B86AC588DD7B70DE904F6670BC207@qq.com>
References: <tencent_DF2E181B86AC588DD7B70DE904F6670BC207@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 09:42:45 +0000
Message-Id: <20260720094245.E2E4A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added `slimbam` and `slim` device tree nodes are not sort=
ed by their unit address, violating standard DT conventions.
--

--- Patch [1]: [PATCH] arm64: dts: qcom: sm8150: Add slim nodes ---
commit 47169c779220744d341492a384ae3d049c3c3c92
Author: XiaoYeZi <qaz6750@qq.com>

arm64: dts: qcom: sm8150: Add slim nodes
   =20
This commit adds the slimbus node which is an important node in audio.

> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/q=
com/sm8150.dtsi
> index 0e101096209ab..941043e0139a1 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -4410,6 +4410,18 @@ watchdog@17c10000 {
>  			interrupts =3D <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
>  		};
> =20
> +		slimbam: dma-controller@17184000 {

[Severity: Low]
This isn't a bug, but are these nodes placed out of order? Device tree nodes
within a bus are typically sorted alphanumerically by their unit address in
ascending order. The dma-controller@17184000 node is being inserted after
the watchdog@17c10000 node (17184000 < 17c10000). Should it be moved
earlier in the file?

[ ... ]

> @@ -4577,6 +4589,20 @@ cpufreq_hw: cpufreq@18323000 {
>  			#clock-cells =3D <1>;
>  		};
> =20
> +		slim: slim-ngd@171c0000 {

[Severity: Low]
Similarly, the slim-ngd@171c0000 node is being placed after the
cpufreq@18323000 node (171c0000 < 18323000). Should this node also be placed
earlier to maintain standard unit-address sorting?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_DF2E181B86A=
C588DD7B70DE904F6670BC207@qq.com?part=3D1
