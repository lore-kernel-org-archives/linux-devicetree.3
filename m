Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D663BBA05
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609501; cv=none; b=ptDTqo8eDj0ucHoKVXmjurlRm02JSlmQ/1Jqfu8UuApWqYmLX1U6lw72sANyhH9WeqAkfcXyjdcKN0NjRlKtdfWhlxc8wjz1qJmqoIQT77qcvbMVDyojaKxeB7BxcFBW+NswbIRWZbTh8JNw2uZNOXr0YFsKO0m/b4ikEmxvp20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609501; c=relaxed/simple;
	bh=zmTrx4BEFpHl2vUPXnF+HrCB6o5grW81ptzF8zyZisg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VWSxWJw/gelZQEItj0wfZLPdvCugDJ0LBI3mo2RaL6Ohi9AvGbi5/+kMWBPiORlxxzs8UG6nO7qqVzuLKN4N/N+dus3KKb1NsVFzUaaXN4t25BTBVhvd8wPpfzwTeX7dFsby/udbdzVd+reCZ97orqOECWrZ5ctMVXapshDTipo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cCG0V76K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIynvkIp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cCG0V76K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIynvkIp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNDCNO4150299
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WIQSVQa7SgN8IyDhJ3Xm6uhLiwBR83zKu8arMD1TNIA=; b=cCG0V76K2LNJ6gN+
	bJBny094JrII9GDHqefKlIaUo9UugpZ7ZFRW49zVkvtn11eCC1fglTmKQxihOZo/
	1/Ss2igRxCEuxwBy+waFmfZ4soQ3xJxhPk23tYcdR+O7qgWb2BZHgpl5in+dv6QO
	y4hFvJRtlvgkCN+GZDi3VbSB4wCn5Hpy8RjFWHBYGaeo+sppILuSV6o2mH6tEbx7
	F+nZStvl3TM8TbVa6MPZOU2FKrt7nVkcO1bH78xMXTFz/6L9wl99TQu07n0csbmZ
	sMpiyprWX6wu3QO8rumJqFRPDbiWW6YhXoikAUceGArLQOBddOZ4blpSwJlRfoys
	Xs2wJQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqff2h2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:51:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-384419c6c74so13819034a91.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 21:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784609489; x=1785214289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WIQSVQa7SgN8IyDhJ3Xm6uhLiwBR83zKu8arMD1TNIA=;
        b=NIynvkIpzkcQe/ByVwCfIe25s850CRWGSQC5zvSS6rvXIwvN7OEbJoMHqY1ra42ztT
         /cdMoqNrZLM0rgoKSnBsmsKpY97j11466VIoa2rQ5peEpd5DGO9m1CzPda/ZpDj7hsij
         F+0f/HvU7Z+InKmPOQZZDwm9mLpHgYRhR/xeF2Vgsi86U77RHGluGFKOAcfO0b73svIY
         UTLJ+q/5Nk+aOC3cC7AQDzNbogaRKFg8C1OOb9RS3KNcshEdsCQHiBOsY1MA9Nc79xsf
         dR7uQ9i96pzS62ejlcP3e8tHKK1LGHYx0MJVtWHkHXTmkXIkeRoyCy4HE2ZVTo5yJ+lq
         tDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784609489; x=1785214289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WIQSVQa7SgN8IyDhJ3Xm6uhLiwBR83zKu8arMD1TNIA=;
        b=blXSfpsnrzXmPwKBKgGwe9hf8sOclx0KOs75RAsOXuDCNrxZ8kegb4ihRqvD15+AO8
         5xhtnTB8RfxGjSrLRNCL0UDFR/sjCo+dBKOj3bunYNVPz3ovankk9xAtH3aeG4LFG0WY
         1UzEfWzEoSSPk5HPi9PXI2SSPFL58VG3XG6k8wDXEefWLi0VFBpim9Jy+v4dFzdiyP5h
         8UfdAImWhJ8Z9rv5DdijHTljX2IXl2cQqB6P/KOVp5RK2tcG9WDSUskLhyOxXqik7lEJ
         H0bOAc0uhBwGnlS64gd35bQk/J8DMRTnlkME0BOdkUYwiFPg0UXQ9Xf+iiAECha2EHhN
         kbRA==
X-Forwarded-Encrypted: i=1; AHgh+RqAO8Aqkai/Tkm1OXoSlDQFKrgr+y3tTAlbruwi+lgc96yl0qPdoePJpDSYW+Uo3fkLV4aLo38MlwYL@vger.kernel.org
X-Gm-Message-State: AOJu0YwvK5oI5OOe01ANvhsl4xVUJ8cUjka08wu+CUu7m+T40dVCsGke
	rmv8axnr3bTFiQ/pSqeZTlR/3TKB6nNixu4SoS6WB7r5X6pkcfeGT8VUzRaFv1wLp2U2kZ0MJ6m
	aMaOTO7i/LhprzrUArbZsbY9EvAM7HoP9cfhdrbJHyNENNkJn0WI/vbBiClOmO1no
X-Gm-Gg: AfdE7cm0kxjXEMB7BtK9dnSQ01NV4n15kfo68KldO5xNVVvxwSpCAqBkcveJXjt4E/D
	Ac5nW7bqELwvH8AZ/lTsD5OcnjUHDBfjk/Tz8vr5d0Kn0MCACS9LgN7/NtjC7MPq3gNk42plkZP
	oI5AsVVMyzL6+RP1IIg2Q0+KiEUb3N/WqU5/FISnV03H2MXrbyfmEXl/gU0SOXnxnED1ll16wNf
	S+rPZF35pSJ9uLzvHuj5n+oXR+RWfyogV0lLo6aTFYH36zaJ22ATxdi0rs3y+kjXp1qTcBK3iNM
	YFqMapIhlgUODrjuMzoPM1kk0BY0v0an3nHCLsBU8Nk9GOWRiuRLOW5+emPp6jc/Ca8L1dZCaSB
	BJAv25Tu4kZBS1u0bjf6GuCY43A0T4lNl6WAQ5D4xYBTxFCrz5eyaa3s=
X-Received: by 2002:a05:6a21:7d06:b0:3b4:6cae:4a50 with SMTP id adf61e73a8af0-3c3ad7d2491mr18271040637.20.1784609489284;
        Mon, 20 Jul 2026 21:51:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:7d06:b0:3b4:6cae:4a50 with SMTP id adf61e73a8af0-3c3ad7d2491mr18271011637.20.1784609488800;
        Mon, 20 Jul 2026 21:51:28 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2ddfb35sm37963183c88.14.2026.07.20.21.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:51:27 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:50:38 -0700
Subject: [PATCH v15 5/8] media: qcom: camss: csiphy: Add support for v2.4.0
 two-phase CSIPHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-kaanapali-camss-v15-5-c0b1c1167c5d@oss.qualcomm.com>
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
In-Reply-To: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfXyFpHSBE4GsLY
 M8w8jnhP/iWGnCylMMub/un8FxXSR1m/bcBoA9oQ6Kaik7vV+x4xLTd9yTvSBNlVC7a5me2W1UV
 l4j/hBFN+b3zN8Ckt3Wo4y38aMbbqfs=
X-Proofpoint-GUID: iYzyb5j_S7xs2msLhjVTB5pRzsezHf3L
X-Authority-Analysis: v=2.4 cv=FJErAeos c=1 sm=1 tr=0 ts=6a5efad2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=YI0lirVkik_cQ8OgtUwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfX20tyDd1Sw8G2
 FnRRqO1568ACy3wSrvYUl2CMXbvbZM31Lr/gpH/wx1t4+tlyFeYWI5JO7z0WBbmpBtLf6YFI+YS
 qs9RpZL4+GocxgDKCxRWurbS1m+W6v0iqT7Z7TmaocpwPB2DYUetjId3pDX5NDkswFuBmTglot2
 bH4U4mrGTREQ3mwbwdC/gtVF9mFHM3kYCTNRntSEBI9TJrP7QAyqTiT7ugX/Ok2xNkkVJ7/qMaa
 usciNMwx7lWY/c6DrfAe2D5vKeY4LXtASWXLWAN0yrM9gSU8KuvMciXWTPfDwjGes2zPBiJ+sAR
 C1yd9wym6ep/frD0CtKEaDdHiWKDbpznuCnUzzVCRcdPPGdK65u9ur2XhNCim6h481G3C59rqlX
 XLJZPPNNbr3p74FLmMHUqfCf8vpvySIqb4zombZn6knAedkhbua8v6YrDgUfHl25NsYduLVXxHK
 sjcE1oaeIwfgrjqg7yQ==
X-Proofpoint-ORIG-GUID: iYzyb5j_S7xs2msLhjVTB5pRzsezHf3L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210046

Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configuration,
which reuses the x1e80100 lane sequence, clocks, supplies and power
domains but selects the v2.4.0 common status offset, and register the
"qcom,kaanapali-csi2-phy" compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c          | 53 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 +++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 4 files changed, 71 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index d41ac42919f2..c19190f2a439 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -35,6 +35,57 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
+	/* CSIPHY0 */
+	{
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY1 */
+	{
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY2 */
+	{
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY3 */
+	{
+		.csiphy = {
+			.id = 3,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY4 */
+	{
+		.csiphy = {
+			.id = 4,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY5 */
+	{
+		.csiphy = {
+			.id = 5,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+};
+
 static const struct resources_icc icc_res_kaanapali[] = {
 	{
 		.name = "ahb",
@@ -5549,8 +5600,10 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
 };
 
 static const struct camss_resources msm8916_resources = {
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 8cd331cfb4b3..658a39463104 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -389,3 +389,19 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 	.genpds = x1e_genpds,
 	.num_genpds = ARRAY_SIZE(x1e_genpds),
 };
+
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_x1e80100,
+		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
+		.common_regs_offset = 0x1000,
+		.common_status_offset = 0x138,
+	},
+	.supply_names = (const char **)x1e_supplies,
+	.num_supplies = ARRAY_SIZE(x1e_supplies),
+	.clk_names = (const char **)x1e_clks,
+	.num_clk = ARRAY_SIZE(x1e_clks),
+	.genpds = x1e_genpds,
+	.num_genpds = ARRAY_SIZE(x1e_genpds),
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index aae049f0ec16..aaa81bbb4862 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -430,6 +430,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
+	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, phy_qcom_mipi_csi2_of_match_table);
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index d6366f809e51..2355a1db9b94 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -94,5 +94,6 @@ struct mipi_csi2phy_device {
 };
 
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali;
 
 #endif /* __PHY_QCOM_MIPI_CSI2_H__ */

-- 
2.34.1

