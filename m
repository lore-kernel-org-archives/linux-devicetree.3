Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9843D3327
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 09:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784538328; cv=none; b=KQ4ihhP+FHA3+sBt3qupV69O7Qg5qaa2EQ6sicisfiRqS4FFeR0oDTJXXUymbHVTdmuVC87MXAB/Ls8Q1Iy3JeCOEj3Gu+DAxXYYbOLYJqm2CMRgewftr4bLd4nOUIueJ8FrIeSk1hlsupm21eaDZwglxolww2CMxMhNkEt9Ic0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784538328; c=relaxed/simple;
	bh=gcezvyoO8gOEokEOSuOZ36sMhs6okJ0NBH4X+VnQv+0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W5mAQwCLPY335jKbn67FbGFwH5WuLaP7tiqdSno/LM5nL8XBFhD31fwWz/PvYJ9qL9804fW+jRAPeFoL/LCM/BBWQnQJ+T/jN4mn5kYR3LVqFTMZprzysQFi6jMuu3XPSkcwHbWa1+ZobDYcSzzV7KLgN7cKlilCzHA1Fzo0HbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFf3VelS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFf3VelS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8B61F000E9;
	Mon, 20 Jul 2026 09:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784538327;
	bh=KVmhOsXO3bKuVS2vuBCENY+jTVz8iDNtZdafOD1GtVk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nFf3VelSVlF6Q1eKH++JQKjEUmHIdGDf9QqetCiFmmfiJkIGa8juP6ko2I97nOLFL
	 5COA65kyCxpbkaO+LvmbAyxej5v+WT/D3nFulSW3FxdQzZQA0uNduigvfjWo9rHAI+
	 ePpzvm59y/N3itf/+mtuqVwVaTxTbQo97m/iBr/VklM6bONcpp+0CQuEQYccfsPUpY
	 iaEpXWdAseBIjot2iQaHuxcImmhtnKNb1votEjvZJRn126dqwDSNAgnT9tWJ8GiF0K
	 Bxg5mh0ZSXAJWIQXAzvT8zkNLjmCeUouH7yBZeA8WjXiOpOmV49FN/3AQOKOepbHRY
	 6zH6MaGv9E3qw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add INT2_GDSC to MDSS on
 Kaanapali and Glymur
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yongxing Mou" <yongxing.mou@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260720-msm_gdsc2-v1-3-4687866d6cb0@oss.qualcomm.com>
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-3-4687866d6cb0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 09:05:26 +0000
Message-Id: <20260720090527.2C8B61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The patch omits `sm8750.dtsi`, failing to add the `INT2_GDSC` powe=
r domain for SM8750 despite the commit message explicitly declaring that SM=
8750 requires it.
- [High] Missing cleanup of the IRQ domain and chained handler when power d=
omain attachment fails, leading to a Use-After-Free.
--

--- Patch [3]: [PATCH 3/3] arm64: dts: qcom: Add INT2_GDSC to MDSS on Kaana=
pali and Glymur ---
commit a757d0e4c829d9c4eb6cdd0c681fb7e3459e226e
Author: Yongxing Mou <yongxing.mou@oss.qualcomm.com>

arm64: dts: qcom: Add INT2_GDSC to MDSS on Kaanapali and Glymur

Kaanapali (SM8750) and Glymur use two display power domains.
CORE_GDSC powers the main display hardware while INT2_GDSC powers
a subset of SSPP blocks (VIG2/VIG3/DMA5/DMA6).

Add DISP_CC_MDSS_CORE_INT2_GDSC alongside the existing CORE_GDSC
reference in the MDSS node on both platforms and provide matching
power-domain-names entries for the display power domains.

> Kaanapali (SM8750) and Glymur use two display power domains.
> CORE_GDSC powers the main display hardware while INT2_GDSC powers
> a subset of SSPP blocks (VIG2/VIG3/DMA5/DMA6).

[Severity: High]
The commit message explicitly states that Kaanapali (SM8750) requires the
INT2_GDSC power domain. However, the patch omits updating sm8750.dtsi.

Could this omission cause SM8750 platforms using sm8750.dtsi to fall back
to single-domain mode and fail to attach the secondary power domain, leaving
a subset of SSPP blocks (VIG2/VIG3/DMA5/DMA6) unpowered and inaccessible?

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9087c4b290dba..63ece55c4f2ec 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
[ ... ]
@@ -421,6 +451,27 @@ static struct msm_mdss *msm_mdss_init(struct platform_=
device *pdev, bool is_mdp5
 	irq_set_chained_handler_and_data(irq, msm_mdss_irq,
 					 msm_mdss);
=20
+	/*
+	 * When two power domains are listed in DT, the core framework does not
+	 * auto-attach either of them.  Attach and manage both explicitly so
+	 * that INT2_GDSC (needed for VIG2/VIG3) is enabled alongside the main
+	 * CORE_GDSC.  Single-domain platforms are unaffected.
+	 */
+	if (of_count_phandle_with_args(pdev->dev.of_node, "power-domains",
+				       "#power-domain-cells") > 1) {
+		static const char * const mdss_pd_names[] =3D { "core", "int2" };
+		static const struct dev_pm_domain_attach_data pd_data =3D {
+			.pd_names =3D mdss_pd_names,
+			.num_pd_names =3D ARRAY_SIZE(mdss_pd_names),
+			.pd_flags =3D PD_FLAG_NO_DEV_LINK,
+		};
+
+		ret =3D devm_pm_domain_attach_list(&pdev->dev, &pd_data,
+						 &msm_mdss->pd_list);
+		if (ret < 0)
+			return ERR_PTR(ret);

[Severity: High]
Is it possible this error path leaves a dangling pointer registered in the =
IRQ
subsystem?

In msm_mdss_init(), irq_set_chained_handler_and_data() is called earlier to
install the chained handler with msm_mdss as the data pointer, and the IRQ
domain is created via irq_domain_create_linear(). If
devm_pm_domain_attach_list() fails (e.g., due to probe deferral), this block
directly returns an error without calling irq_set_chained_handler_and_data()
with NULL to clean it up, or calling irq_domain_remove().

Because msm_mdss is devres-allocated, it will be freed upon probe failure.
If a spurious or shared interrupt fires on that IRQ line, will the kernel
execute msm_mdss_irq() and dereference the freed msm_mdss pointer, causing a
use-after-free and a kernel panic?

+	}
+
 	pm_runtime_enable(&pdev->dev);
=20
 	return msm_mdss;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-msm_gdsc2-=
v1-0-4687866d6cb0@oss.qualcomm.com?part=3D3
