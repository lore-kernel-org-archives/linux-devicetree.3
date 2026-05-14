Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1F13932CC
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 18:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778783670; cv=none; b=WFbd1y1Ra2LJu0CNqlPre+/Zhv20rpGzu4RQxDBCxkS3Ix3jXYmJe+ZzSmD79UEX7IceAWyfo4kPxi1CmpX/DTsWaZenX4mE7aM0KnD33Uzrh82APetilV71ly+UzY2dZKc2MvfJZG0JPuKv1Dex3ZQ21KXu2SPlENKpVladfXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778783670; c=relaxed/simple;
	bh=gTPCwwjS8l6KekjY7pr/CkOGCTZYthkWXt/ENpIlrg0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gzrg33tPwD9zhBmH+TybWTJLRlX0o/hgQyTF4EDgvhzpyXtai/bbULv0AfvovTxMhKWjOd+wluJHlKRrIT8sgwwHMQIG6AgyvgYakqy1dgfRReB+LjjpTphNlZ/Wuda2U/rIcBIFnpAKKP6v4eZAldPM4qC8weW9ChpwAF/FIEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kboVcVcq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kboVcVcq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F56DC2BCB3;
	Thu, 14 May 2026 18:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778783669;
	bh=gTPCwwjS8l6KekjY7pr/CkOGCTZYthkWXt/ENpIlrg0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=kboVcVcq8+CVOs7wyzZNn2WSev8p/CSRWGW+FmG8GIWIc2p/ffxaK8cVQVQqnDSKr
	 WT4dxtl8cwih1V4ASJkjDIEILHnvb8ccvZLw6QvzMSoy7hmNuruFUNF29gy09HZund
	 VVYze7D8MH5r8PXNpfsJ8wkLnBJqOCaLxsRzCbSwloc86V3Zrdfsf/z8erDjG8sAVc
	 mX4xjP+AFpjtzIK2V7+bb1r6zWzTj2Y0AFNaXks2j8I6+F4/24aW29aCrgBfqBI5b2
	 UdXR6BZfKOgQT45nB3pNxcxLcwJ9LYsQZn5ML6f69dkIRxKgn4Ik91g6v0NxKyVDDR
	 nMlYBoP6gIeSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/6] regulator: mt6359: Add regulator supply names
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260514091520.2718987-6-wenst@chromium.org>
References: <20260514091520.2718987-6-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 18:34:28 +0000
Message-Id: <20260514183429.5F56DC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The supply name for 'vbbck' in 'mt6359p_regulators' was incorrectly=
 set to 'LDO_VIO18' instead of 'VIO18'.
--

commit c863063b2f41de345a843312e3b866262b280224
Author: Chen-Yu Tsai <wenst@chromium.org>

regulator: mt6359: Add regulator supply names

The MT6359 regulator DT binding defines the supply names for the PMIC.
This commit adds support for them by introducing .supply_name field
settings for each regulator. The LDOs share supplies, while buck
regulators have their own supplies related to their names.

> diff --git a/drivers/regulator/mt6359-regulator.c b/drivers/regulator/mt6=
359-regulator.c
> index bcf9a476a34e1..46cafe93b24e4 100644
> --- a/drivers/regulator/mt6359-regulator.c
> +++ b/drivers/regulator/mt6359-regulator.c
[ ... ]
> @@ -871,11 +879,11 @@ static const struct mt6359_regulator_info mt6359p_r=
egulators[] =3D {
>  		   MT6359P_RG_LDO_VM18_EN_ADDR, MT6359P_RG_LDO_VM18_EN_SHIFT,
>  		   MT6359P_DA_VM18_B_EN_ADDR, MT6359P_RG_VM18_VOSEL_ADDR,
>  		   MT6359_RG_VM18_VOSEL_MASK << MT6359_RG_VM18_VOSEL_SHIFT,
>  		   1920),
> -	MT6359_LDO("ldo_vbbck", VBBCK, vbbck_voltages,
> +	MT6359_LDO("ldo_vbbck", VBBCK, "LDO_VIO18", vbbck_voltages,

In mt6359p_regulators, the supply name for vbbck was introduced as "LDO_VIO=
18",
whereas in mt6359_regulators it is set to "VIO18".

Because the descriptor name for vio18 is "VIO18", the condition
strcmp(desc->supply_name, vio18_name) !=3D 0 in mt6359_regulator_probe() wi=
ll
evaluate to true for the MT6359P variant on every boot.

This discrepancy triggers the fallback execution path inside the probe loop,
performing an unnecessary devm_kzalloc() to allocate a new regulator_desc a=
nd
correct the supply name dynamically.

Should this also be "VIO18" to prevent the permanent, unintended memory
allocation on MT6359P platforms?

>  		   MT6359P_RG_LDO_VBBCK_EN_ADDR, MT6359P_RG_LDO_VBBCK_EN_SHIFT,
>  		   MT6359P_DA_VBBCK_B_EN_ADDR, MT6359P_RG_VBBCK_VOSEL_ADDR,
>  		   MT6359P_RG_VBBCK_VOSEL_MASK << MT6359P_RG_VBBCK_VOSEL_SHIFT,
>  		   480),

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514091520.2718=
987-1-wenst@chromium.org?part=3D5
