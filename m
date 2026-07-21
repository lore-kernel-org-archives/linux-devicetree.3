Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BD42F616A
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784618061; cv=none; b=kW/2I6MCuhkdYFlcKqEpnDaOm+ZGbv3f7O9ukP9Tm6Qyqxcq4P+NIAto4zSWoTfuu4UBJfl2wEw65xfv72WGaIdDfbUMWLgZ2MPvw3dOvkcwhkojUzM4B9d0UCAvNUYq+qNq7jymnw94J1H07J3WAxzuK7GpTKSLsMXwAqKdSLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784618061; c=relaxed/simple;
	bh=zxDgllrmjJBFtbb21SV9YutBSF+I06FNJ4HaF3EiJR0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=My6eGKRhw7X4SA8sq7mjWfLgpY//7d/bZtXlBR2tZePPftOBWOxeHykxtmxISkfxGZ5TmjZpHdWgffCS/kx8Mcfm5YT6sregPwTScLOIiAU0+FUbLknOSmZxs8byK6Masbaaybr8u6FyZGLX6VpKRLiGSx/behF21gt+feY1X40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJImzTCG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJImzTCG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2FD1F000E9;
	Tue, 21 Jul 2026 07:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784618060;
	bh=tmKAZ8k2485wgzwWAi+8/m/HoJSkPLG5VOjXhtZt+XM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hJImzTCGQJCuDJJqj5G5V5AUcbVlb6YsSS0yuR82UD6jNNVT19RoA1agjw8J3xLc2
	 5T4Hnpc1Bzjy//Zc6leGzdWCqQAfyS3XzhVUSWT7YHHYNMCdbfAS4u0Ogv7VxFSWPo
	 HSXy+BxwLLpAum1UU0+jJxWOc74i3OoGcCJh23e78NrgmGjNzQkQi1DL0699LN87th
	 yxNaqw0zjZzfex24UKbt4Z4Y99worsNH6stdlVi7uXq3Vpdv5JS18mDi/QQVCrFKaK
	 jhVOAs73MqXp9wRmid41a/Zse3Bj4jxduML7rZ7l9utvAtEcccxtHLCNUFPBWbyHYx
	 YAxQcHhyirXgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] dt-bindings: clock: qcom: Document Nord GPU
 clock controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721-nords_mm_v1-v2-5-17e5a445a512@oss.qualcomm.com>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-5-17e5a445a512@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 07:14:19 +0000
Message-Id: <20260721071419.CA2FD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added header file `qcom,nord-gpu2cc.h` is missing from th=
e `See also:` description list in the binding YAML.
--

--- Patch [5]: [PATCH v2 5/6] dt-bindings: clock: qcom: Document Nord GPU c=
lock controllers ---
commit 478c81620fe4a48a58e658fce1f3422dbf8f168b
Author: Taniya Das <taniya.das@oss.qualcomm.com>

dt-bindings: clock: qcom: Document Nord GPU clock controllers

This commit adds Device Tree binding documentation for the GPU clock contro=
llers
on the Qualcomm Nord platform. It introduces compatible strings and header
files for both the GPUCC and GPUCC2 instances.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.ya=
ml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> index fdbdf605ee695..ba85692240e07 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> @@ -18,6 +18,7 @@ description: |
>      include/dt-bindings/clock/qcom,glymur-gpucc.h
>      include/dt-bindings/clock/qcom,kaanapali-gpucc.h
>      include/dt-bindings/clock/qcom,milos-gpucc.h
> +    include/dt-bindings/clock/qcom,nord-gpucc.h

[Severity: Low]
This isn't a bug, but since this patch adds support for both GPUCC and
GPUCC2, should include/dt-bindings/clock/qcom,nord-gpu2cc.h also be added
to this description list alongside qcom,nord-gpucc.h?

>      include/dt-bindings/clock/qcom,sar2130p-gpucc.h
>      include/dt-bindings/clock/qcom,sm4450-gpucc.h
>      include/dt-bindings/clock/qcom,sm8450-gpucc.h

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-nords_mm_v=
1-v2-0-17e5a445a512@oss.qualcomm.com?part=3D5
