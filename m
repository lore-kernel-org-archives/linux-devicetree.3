Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C3A42AD9F
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 23:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792194909; cv=none; b=jF76X1/BW7lljc6OIJaR7HNVea6NtgZK5zJ1nsPx/KE3BqLf5hdDhnXKrQwQ9u+rD+VqEYCY2e6Wo+aPQoCo+36RA5/VyUK7TGVicpUGIkul6QRlKZu97R9LgkgOv9ahbLAlCuvIcP9sFx5wC4OjQJ7OvA/PHnKANhsA0RPvVE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792194909; c=relaxed/simple;
	bh=+KBYF75J66rNJuehf1zpGVZaozegQBHZso6yi8zHo5E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hsoTQcH8WE0uY38sAVDJeVqfeS0caQhKS63tylitdDNsLUU/MP/QpiHA0RdgjQk5TJiOAAfbA/h9TfDwsI1l+vj+wKtK0uCJQUNnU4bsET/ulO3aj1bKmE2Fq1u+gsEJrtgWHt0Cqvowor9dJIJwv6SkD8IdR78Rr1RSdC9iJR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6tCCfI6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i44wQogA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6tCCfI6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i44wQogA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNFJCp552057
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 23:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qedLgstS3gt
	vnc8k0/THvcA4SPaoe9apJzndlL1Fd8Q=; b=R6tCCfI6INMnbSklELJE70qfOPY
	/4ANoeEhAN3uBss9uTpg+DlG+NJTzVxxDWNuI4YiFLNnp/I7w0mGyhea4X5BNIeO
	rJZNLpJ/308HpITn8wBST7eR1BrRSUlPp754rxeiSISho0JTl7osN7tdex8V1Eo9
	46tVMA3akcgNXfJJp7Cxxzpobnuz8Y2fdWp2rOXfNDJMeXRyamyNQLlyM9Ph2yy4
	0pWCHtLF2zXBWQwTvwy/x46vG9baoCeAOd2n/m+ei2D8hGLvls3JwRFvLuVRHYZB
	Yy0usMJqiyqQlWHnI2NYfeWxKdjX9EyGRYU+vghikxVANiTQWjcrJCLflAw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbrw710jq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 23:55:06 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so1455330c88.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 16:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792194906; x=1792799706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qedLgstS3gtvnc8k0/THvcA4SPaoe9apJzndlL1Fd8Q=;
        b=i44wQogA4NVQx+sBMrJDKk92hNM6ecP0ULfePTKrlfPB3J+/S8wHFTy095/KTP0t6w
         HcjqCGeQJyPToEJ9P3abSOaWGvAZesT3+zrbt7RR+zyHtZWNGlbw1vLGrDVbaVwPk9qL
         8LU5+YfOG+uM1i9oO27Cr0TqOQvARwrheDadq3A3O/pIcxgSmWSsJjvvV1L7R4DlCX/P
         RjWrDZmmvyAaLs8HikeW0WPXyYcPBSQvfXA4gvggj3TU6gWV1kREYywzvrrmfJefqAjS
         OcWQylD17xpAl1xox/B8dG0/g/Vv6pGCFDOWRjZ9Tv0J2vFCaI8yoYR/kwpNqmmqky9J
         0+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792194906; x=1792799706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qedLgstS3gtvnc8k0/THvcA4SPaoe9apJzndlL1Fd8Q=;
        b=b3Ir6Yks0h3AGpO9SMEhYCr8JB5x4VuZ29D8XvfbZPUTnazagRNLCT3quOyu8ykvMm
         rSmLSS6HtyJeM1LtaPr118WDz411O13pBKDwJYVJsvI2r/euZSpZSL+HfpyTiMNGnYiR
         ojqV3a0RJLFA/1Ky+JIJ3hkU9GxXa5F/UK2PSOOP3/qoV5UGmL+tTCWF0o8ECmzwOFcJ
         6XKIZ81Ui2VFWkI3PSp65Sb/S4UWLk4SJAkYBdijmWEq3m4PCW2LMlJepHjBozXqiPdK
         DWgo3ICczX/Yw6iLZV+cP1kAH5+VkVuztf4la3zx3gnDTwNpzrtzA5FKx2zbk0lcA78x
         lnKA==
X-Forwarded-Encrypted: i=1; AKwUvBx4sooey6rKdoIQwKAewu0sdgInQByGi/DrkoaOIWHAbwq2KjmQnkvd+8r963rLJsgI1aJG4YlPxSLW@vger.kernel.org
X-Gm-Message-State: AFq9FYJIhoXWREtIx7+wfroklnfxhMmgTl9NwaS1cdLW9Px3OGololhw
	z7aIwsWUZZmjs7IiQ/dH3NYW0nhdgSZ8aFAvTlnWeCbZYwioN4DaooAT4cYktFSFz/ahCa/rHbB
	GNoR3Iu1IpZrq4e6C9nPG0HZVURvqXBb+UJzt+otSHEQ1PxS4sk6/TqjoaL9bB/4L
X-Gm-Gg: AYBFou1RwhWk2Lu26O+y7gW3YfKJRJOs966dURd3WX32oUnFBPiDEGQSum2aEVrVVnR
	rlf0TH0XVbTNIHZKzxWOxkpus3TRWxtACiMA5IrcCYay/vvJj9RL4YwRfBIspVSStSX9IV6m2Rs
	S3W2muglDs3Tl7yWXHFw2OXH/OP7sLJ/mIzJ1+x0Cbpae6YL8GTC5ZXXgri441nX4zSOEGGhWXE
	dFwqLS8cG1nhW5Sn15qjZ6OylIHM38D77PUTOybDTUF9aAwBClQWxkYT8eRrn1833ninbf58TNi
	8aI2NVbxQF3SLhoOFW/cluvRBhCYAzVZYnWYGieeMqx6pkI4E95IKC5YgORng7NwOJzQ9Y9zpaU
	KsZyALw1GseXfMGPngsgq0EKYGwWwv4NCzkXeyEAr5hjODHfB8TpNGg==
X-Received: by 2002:a05:701b:208e:b0:168:6ad8:e8b0 with SMTP id a92af1059eb24-185120a831bmr1673766c88.14.1792194905554;
        Fri, 16 Oct 2026 16:55:05 -0700 (PDT)
X-Received: by 2002:a05:701b:208e:b0:168:6ad8:e8b0 with SMTP id a92af1059eb24-185120a831bmr1673738c88.14.1792194904917;
        Fri, 16 Oct 2026 16:55:04 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm8556183c88.5.2026.10.16.16.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:55:04 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] phy: qcom-mipi-csi2: fix -EEXIST probe failure on single power-domain SoCs
Date: Fri, 16 Oct 2026 16:54:56 -0700
Message-Id: <20261016235502.2274268-2-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfX94Ici0a/vhfz
 yEdqmLQi69rb4+N1UBBfXYeLqeF+cKPWGNNBf77oY2yi3brMK8yYLGc5danyNyRm3VyMTGELBd9
 1gCHctla+Ad89cctlf0QIsfWtLvjXP4=
X-Proofpoint-ORIG-GUID: HuAiqLEt27qZeu9BTmWFRQHtwtlseVYx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfX3fVsCOR0KgVt
 qb60u+IrBuTB4+9tmijQaO+WIY8jkgIodcrjkHWvPv4J3qiXjFK/yUOuga+RQ/YEX3in+LbTsxL
 ++wJmASy2pLDny0aREuiAMRII/rLOkoz0HXG9pvSiHB5qjIosNAV+z6Ol+1+zxACDfOgZvJE5KR
 wnNFcL6nCZdt/Ar7BKF7tgMMJIpKYlQMINtdF1s9xp2Zh0nXVexd8td6kAj+45aB+EFgzgfif4G
 FEgO312gzXZuCNSpOoiUjRVGkuiE6bnfPSLXOhRpQk9ROZB3Wauh9H4D8LOkNMz/eyEJIRUYc0/
 BqM11goSvriOCjxPhRH9GWz30vwgvptxRIRCpCCjQh7V7O7iUeWppy8UsRoYG1U0K//3cNfOBc6
 04713HfJsqEPhJPY17wYGRGW/+PZrm8WwFHM3BFAyWO6yLkl9CinRj/2aoHqjDIDt8FHBIS/kQu
 Q24BHMvrZuteumMPspQ==
X-Proofpoint-GUID: HuAiqLEt27qZeu9BTmWFRQHtwtlseVYx
X-Authority-Analysis: v=2.4 cv=XKKl2ghE c=1 sm=1 tr=0 ts=6ad2b95a cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=uorg23y0nfgcnAkg4s0A:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160095

sa8775p, qcs8300 and sc7280 each list exactly one power-domain ("top")
on the CSI2 PHY node. For a device with a single power-domain phandle,
the generic platform-bus code (platform_probe() ->
dev_pm_domain_attach()) auto-attaches it via genpd_dev_pm_attach()
before the driver's own probe() runs. phy_qcom_mipi_csi2_probe() then
unconditionally calls devm_pm_domain_attach_list(), which fails with
-EEXIST because dev->pm_domain is already set, and the driver treats
that as fatal:

  qcom-mipi-csi2-phy ace6000.phy: error -EEXIST: Failed to attach
  power-domain list
  qcom-mipi-csi2-phy ace6000.phy: probe with driver qcom-mipi-csi2-phy
  failed with error -17

x1e80100 is unaffected: it lists three power-domains, so the generic
code does not auto-attach any of them (auto-attach only applies to
single-power-domain devices); the driver's explicit attach is the
only one that runs.

For the single power-domain case, call dev_pm_domain_attach() instead
of devm_pm_domain_attach_list(): it returns early when dev->pm_domain
is already set, so csi2phy->pd_list is left NULL rather than built up
by hand. The three call sites that walk pd_list for genpd
performance-state scaling now guard against a NULL pd_list, which is
harmless since scaling is unused (scaled = false) on every SoC that has
a single "top" domain.

Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    | 24 +++++++++++++------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index c0a4fa20eaf0..00285be9dd64 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -43,7 +43,7 @@ phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
 	}
 
 	pstate = 0;
-	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
+	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
 		unsigned int perf;
 
 		if (!csi2phy->soc_cfg->genpds[i].scaled)
@@ -174,7 +174,7 @@ static int phy_qcom_mipi_csi2_power_on(struct phy *phy)
 unset_rate:
 	dev_pm_opp_set_rate(csi2phy->dev, 0);
 
-	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
+	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
 		if (!csi2phy->soc_cfg->genpds[i].scaled)
 			continue;
 
@@ -204,7 +204,7 @@ static int phy_qcom_mipi_csi2_power_off(struct phy *phy)
 
 	dev_pm_opp_set_rate(csi2phy->dev, 0);
 
-	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
+	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
 		if (!csi2phy->soc_cfg->genpds[i].scaled)
 			continue;
 
@@ -233,6 +233,19 @@ static int phy_qcom_mipi_csi2_attach_pm_domains(struct mipi_csi2phy_device *csi2
 	const char **pd_names;
 	int i;
 
+	/*
+	 * A device with a single power-domain entry in the devicetree is
+	 * already attached by the generic platform-bus code before probe()
+	 * runs (genpd_dev_pm_attach()), so calling devm_pm_domain_attach_list()
+	 * here would fail with -EEXIST. dev_pm_domain_attach() returns early
+	 * in that case (dev->pm_domain already set) instead of leaving
+	 * csi2phy->pd_list unset; this is fine since pd_list is only used for
+	 * performance-state scaling, which is unused ("scaled = false") on
+	 * every SoC that has a single "top" power-domain.
+	 */
+	if (csi2phy->soc_cfg->num_genpds == 1)
+		return dev_pm_domain_attach(csi2phy->dev, 0);
+
 	pd_names = devm_kzalloc(csi2phy->dev,
 				sizeof(char *) * csi2phy->soc_cfg->num_genpds,
 				GFP_KERNEL);
@@ -369,11 +382,8 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = phy_qcom_mipi_csi2_attach_pm_domains(csi2phy);
-	if (ret < 0 || csi2phy->pd_list == NULL) {
-		if (ret == 0)
-			ret = -ENODEV;
+	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to attach power-domain list\n");
-	}
 
 	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0)
-- 
2.34.1

