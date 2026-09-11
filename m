Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C658476CF6
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141136; cv=none; b=bv6UlZL9PfkBT5uCtdnwzD30tOwHzbeKfIytDeNoO7HaKQav4d+42VYwR3j8x7Qh1NApy4H7PEGqN9T4jWRYOiqRMW2YewmUgDOi7h+s8cCPWfE4+/Q7EeSB4PuPenL8CozSGsa87/dTsiMZ85tTJJ3PQRdvHn/M69cMA8RI5Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141136; c=relaxed/simple;
	bh=CrKvfbaILEML0/XxKBQWTQNqscCnfIE0NSr6QPB6VwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pfp8EtaRAl3KD6wLhmEXI3uvRAV6jTpTuxDAbftbYOEcVBOOGaZRGL5QDEGxhMc1iVyFHiFHAVYeOs5cb1rkkooyl1RS61DryQXW1bAAT7SR5EGclL/XazJimao2hDzXlyB4mIBEs97pDGaPyVjaMYONn0KeenCoihDqVbbln+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cAwVgFbr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gOeOfqU3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cAwVgFbr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gOeOfqU3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BFA9pN658467
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5NxuIBW575W0eOajYRS3D3fuU11r9CtXlXrtxeBTWyI=; b=cAwVgFbrxyx1ddw1
	WrNGrpTh836+8VxMQDkvHRfWVkIIOrYKxX/cICdOiwy8lC67CrYUJH3tA3aOgCC1
	UDu6atn1GvanNEYh/IquKYfs7qFBL75gfsaa8+GbJgzbpTSMZdKKRZ4Uk7Fr8rk1
	MuEKiTBHTG2ixukBphSsSHMsBC72UMYc5IxWTfD4F6jNYQgWgqnTcUYxkRfMrDax
	FLqXPlQJ7TSmRb+2KVp9DV8JMB9hrABGk3oY0GQtZIDmzvJGTCzAuQZctE19nIrw
	GTzoBOG+9mzBgs5UhiFja5YHpphJMxUF/yrvZYK0bzg6R+J2EP1gfvBAxK6Xksqo
	m6wGMQ==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmm22r445-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:38:47 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1b27d7ab2so1216951eaf.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141126; x=1789745926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5NxuIBW575W0eOajYRS3D3fuU11r9CtXlXrtxeBTWyI=;
        b=gOeOfqU32+cJ6QZ/JJlY9MGwXq6NbEbUDaOxy/jy/vrQjn3YKJu6D4VSa7f4p53+XV
         2DP+WSMzBu5glItBCnPDmPfFfUKc/Cmlz3S7q92R+elXXn4b4zLsQD0L21pklkh+loPM
         HzfkPXjfob/QjyVvbmZ2WXme36z/ztdA3N4GNn3WYvy8qXIzlUDrU92x7iiRxCay7AAB
         Ao6DfLT0MV93XM+WjApAdPE/2iasXZsNGBsmbiNIEsqaMu4h8WQBd4aTNJL7gsh1BCL+
         MspvqiLL4VWTn2lnnu7OqbA2BQwgz5fSz90l2sLW5jVzV/FOit0ogYfvi51fDFpiWIRJ
         qnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141126; x=1789745926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5NxuIBW575W0eOajYRS3D3fuU11r9CtXlXrtxeBTWyI=;
        b=ZN6AzCsBnRLYu23mAQkBttnipsu+J6RgeXnT6VVDPe9Akmm6MVRUpVE6SHKCq0/Ulz
         hYhZf836FItt2zzDdnsjqaV7gPLE3YuEvfB6mfv+eSKHGMzZfY9uQJh3dZSb1uyMDT+W
         u/E2JTYNydwIf5va6HwKMZoefRKpMqwvFMZ1cyTpWFRIOZKVduTNWTBCpWtY83+vPYZd
         MT5/R+cQ3sDbs4/7Z1xECE8fFOhhCuC9R8d8L3Tk70P+XkdeHfvmYMlwlZ1tzkoKCbj4
         Ibf4/ErGsulhteSCbO1n6TNJ76eBSrBI5668WdQg6H52/U/OOOL/Qs0enxfL8hIUrqbx
         RRUg==
X-Forwarded-Encrypted: i=1; AKwUvBzMeBlGsrdvneM8bwhqaQYeXne2OT+STcvyEnviXCqVGUaiB/r83QrNFYnD9Kq8DoWdC/rER1l117q6@vger.kernel.org
X-Gm-Message-State: AFuF++lyuZm/y+1ynNZ4mm5BtEckrWchuvCwBJwucLzOw/J4KSNrbCjK
	+xP9YOOt3L+IQKDM3jNsoj8SYMxMlcKpOzHL1FVJcaH3yNSFR4t5peVJyEt4KYYvJB0ykBNFqUg
	Jtbnn5Kn1p/i1zG+4wnQXU/ZJ86/d55vygebqLV0DXeSHD1CCjMQrSqBzYsxqTXDz
X-Gm-Gg: AYBFou2c8FGWxmDATdeuBrw562SNVXZgzMzOeY9AuJaKhJFs5d99UOp5STjWglYaveM
	A1tRuk2eWL/GAC7s/uubHfUkmYqyT7GZV2PBRoopWz/SSeMyG+RTudc2BMGnXIHt054iGyOO89Q
	6z/6Bi1Ga4ddHahw9eX1pIWbFCyWPcVowcsoydl9hgnV+9dwsHrEJ0ZUZxcEl0A8PtXujRGxsdI
	x82NS4B/22/pmGTP6fuxOrxntmVCd9YN237hyhxAPs3txPHWOl5z1dut+mwT678XPZiq3hxVpek
	aa2INUpEUXGO+LjADtREK22PhCYBinGVsjwZBdgQUSdagm03xBw8C19HZeVGSoL5yrpb7lKRCbs
	4tjRNl8z19xQmzYu6tcCysXVCToE=
X-Received: by 2002:a05:6820:7092:20b0:6b1:89ff:8a1a with SMTP id 006d021491bc7-6c0b9b541c2mr2653040eaf.3.1789141126617;
        Fri, 11 Sep 2026 08:38:46 -0700 (PDT)
X-Received: by 2002:a05:6820:7092:20b0:6b1:89ff:8a1a with SMTP id 006d021491bc7-6c0b9b541c2mr2653018eaf.3.1789141126125;
        Fri, 11 Sep 2026 08:38:46 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:38:45 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:42 +0530
Subject: [PATCH 11/17] phy: qcom: edp: Add Nord PHY power-on and reset
 state-machine callbacks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-11-e25c073cf1b6@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
In-Reply-To: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=1878;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=K21vnVfWi3gJkL/oAMBFt2meTnwDXfVTNB9ot4N0Fng=;
 b=vc3SiT3OwSc+YhqE+td40cxikmsldcWKufYbhRHCLviUwyr2w89FqbTA0uHqR50TW9d2QTk05
 tb4Vf47coz7DcwHh50iiUINbuEbeKui2v8SnRU3cwWtZ7O2+fInAqaz
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfXxdyRoclSBImG
 uFfUE1pvWoTJpgvWm58tYlhnYkl3no65NO1RuHbqRHNexDOoQgRVLujbpsINyjh7KTcD5KzlMCB
 zQ4KI3Wtta06wSL1AGq/UoFbU1tiyi0x/H2pDsbf/yUFCH61DE6vumwssq76eB2R5H0Brh5kzPD
 cLH7QUDLdxAy4YmJ/aabpcJ/veTY9egxxaWbksq5UhxddhiumyJ9xVlqXee5SjSPIivXxFuzeEc
 iyzbsZHnN+9e05LIyTuhF8OLe5wGWPOi7V2DPgGY7NMquRHA32OJ+C+uIr75cvMXE+3qj869zjC
 6g5gZVocPKLBDnhMn59fJQIKxD4n92hofBNYcKnxFlsXfWRMfXmbijRhDtjTXtmceMli1HWgVIg
 xCvmsi4/QLVWfwgaZ3h25d9k1jZdu2MovPN2UWOesvowWkPVy/yHjWi04IXAPNQBd4nMQjJl12U
 1wQRA0C5EgkNv45E0cA==
X-Authority-Analysis: v=2.4 cv=LPDz05W9 c=1 sm=1 tr=0 ts=6aa42087 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=X8Wa9jmQWlBxTcu95m0A:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: YbqmKeBSTCfQfFG83aI6Dgcm9T2TGoHs
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfXzm/FeSkvl+yi
 6qvUc1sHWt/LYv7TROCFy6oycFXUVTTONgN7rEiwKl/jqVNynhbqLkElNGDbbCnNypKadPeEbUl
 6Jw+Ngo2rjj0AMYt6eTzykP6tpuRzyM=
X-Proofpoint-GUID: YbqmKeBSTCfQfFG83aI6Dgcm9T2TGoHs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Nord relocates the QSERDES COM CMN_STATUS and C_READY_STATUS registers
so the generic sequences cannot be reused.  Add
qcom_edp_phy_power_on_nord() which powers down all lanes and polls
CMN_STATUS_NORD (0x1d0), and qcom_edp_phy_com_resetsm_cntrl_nord()
which triggers the reset SM and polls C_READY_STATUS_NORD (0x1f8).

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 64878398f43c..6cac4b55b66f 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -1612,6 +1612,31 @@ static const struct qcom_edp_swing_pre_emph_cfg nord_dp_swing_pre_emph_cfg = {
 };
 
 
+static int qcom_edp_phy_power_on_nord(const struct qcom_edp *edp)
+{
+	u32 val;
+
+	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+	       DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
+	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
+	       edp->edp + DP_PHY_PD_CTL);
+	writel(0xfc, edp->edp + DP_PHY_MODE);
+
+	return readl_poll_timeout(edp->pll + DP_QSERDES_V8_COM_CMN_STATUS_NORD,
+				 val, val & BIT(7), 5, 200);
+}
+
+static int qcom_edp_phy_com_resetsm_cntrl_nord(const struct qcom_edp *edp)
+{
+	u32 val;
+
+	writel(0x20, edp->pll + DP_QSERDES_V8_COM_RESETSM_CNTRL);
+
+	return readl_poll_timeout(edp->pll + DP_QSERDES_V8_COM_C_READY_STATUS_NORD,
+				 val, val & BIT(0), 500, 10000);
+}
+
+
 static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },

-- 
2.34.1

