Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616144;
	b=N2G5jzHcc3XoqUxrI0tVBlmtOgp+sQw4LtGrlIoFmj8PdkbV1e2JXlwf/tNzu0ANHjLZ
	 /NAIMb/e3DCgRgsXvu+p8ePcB9orfKimRdPwbXwCdEn2+H+Ip1mrTRSWfRle9evNrB4y/
	 ue8G8GbPT31PPnPfMNdjhZCDUrtHr5Z+dD/Q50/NSyThx1q+YioTTHHpLAUnzf85k0KvB
	 /kxjK3Inh+vEyrcgqk63crmkHDq+yH4Ixaasc/7BxLIGFnx/6o7zcw6uiKCYd4+FdCrTH
	 +DQkQmzjrCmtwPLYl4LtVbr/qzLg36qhIPBluwea0ZA3/BwdLt8r78zhp/4I8alDMZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616144;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MID0gSdRFYEtOdMRf2Fnw6acFNQMV+62kE4jNStcaWI=;
	b=oRXGT9Rg3FKlGOfy/q5E2u90C9R1vkHbeaV4CCA89iC2eeo4XFJ0Gm8tf1wy9zKbJIq+
	 S6/eZU32n7dWB5nhh8zYkNsNX8kcUptUTqRK5yj7q9dRIKZRr0Ave3xbQpDT1p4UsPoTi
	 AokFL8vpwFtZuUGPAMzDWgkdAIMtff0E30dacPLpSatbuYJ+25mjDAqKjPEF5Qd15Yd3K
	 S/QDKO/nMF7ZvMb6KuSywL7ODNAI4MSSwFA1uBkO8X8T6Tprd8lw7oPIF1CZTHXaeoLbj
	 1dry6rwWfTtGspcZxiYdXg3qr4BRyz/HVshfYgLFMFSkMbVrjx0G9tkcjmL/3QZy9Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pJUbaKvP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqGmYOtZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B42606A33B
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 10:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98B42606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pJUbaKvP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqGmYOtZ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AG842880725
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 10:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MID0gSdRFYEtOdMRf2Fnw6acFNQMV+62kE4jNStcaWI=; b=pJUbaKvPrrcSeGWp
	Fpdcp3GwLwIwJTuFEuG9cwnvINisD9IPIgcsII4SdQyGFX9xf6HahdObMi4g6XWu
	wcZ5OvC1vRXtFTk4RRwKgz0qz1Ycdgs1RpNX1/UQse7ItspMfZJwog593Wee7XZX
	xn6gICP5YSKNdURe/zwvfw1Jg47C9rR8bBJ2ap2E5ij9s+aAskQu3tJp7yEUKeGu
	ssg0XeQi6Kd7aMddybhXfM0lAq1PO2JMvg6C9W6AJZmu6N3qh52lqccPTQehqD1g
	9X2Xlz3nmcWG9ofUdq/unY5FE+Enb/Kb5WmbCyqAuTnQQERt81mgY4MLQHbKtOeb
	7X7k+g==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgduc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 10:42:22 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c734afb8deso3645116b6e.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 02:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616142; x=1794220942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MID0gSdRFYEtOdMRf2Fnw6acFNQMV+62kE4jNStcaWI=;
        b=iqGmYOtZXJo/+xupZeV8JrfLw973pMHZB6ERSEAK0C5ZZif2Zs4tFyoK7DHV4UX8NT
         Qocw7vt0Xpkc+tHNeWK5E/0VWiOsiv9O8cLH4GPxGc47nF6QX8GEOEs0byB5sksmYzoU
         AojvrRfXDqFb94lmYQDjPAwWS5ImsXLzhAB4gj+RUgk46g5NzSGFLJ0m4tajiihR0HNt
         jHm7y+DdlR2Sw78UMjjlxwHucZMoEErpaky8HThBa0F89b1va4A4RteKhpmC0v28+93D
         VkmB69g4DsU5IEenJP1GDtjaCmu9hTl51/KECaMCVeNYUSbBp5lIKn8F6EVF2UktSq8O
         RRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616142; x=1794220942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MID0gSdRFYEtOdMRf2Fnw6acFNQMV+62kE4jNStcaWI=;
        b=lC3xEIBm6MXRPqa6x2yDzJdxZvnxJrZTsxIMoCaHZ4tVPEHhuH3T2VXaoTLfek30Vf
         dUB9GUvcvYkVL6E//6MSqmB4pVn2iJdxqHv0FQjJMJVwhCK1P2CRzjf4xXLK0NSICvrW
         rJeD8JVzY5WnSbZ5i/C+b9knGDNdt2HFCFGQFyD5nTTUBz8wMLjYnTIrQt3Kec7Fvljs
         Dc6hO3IFjtBFlpnZLwxH9EUICGccXmj3WHoO8NgF665+JMwzX/Wlz0XWVdJXPViymmDD
         uTOwtNkH8lJSlLdag+uzz1hdPJUBzZhORLrZIS4maLt0763YGtojDoHniooUGVCi3nzJ
         tdBQ==
X-Forwarded-Encrypted: i=1; AKwUvBySnzjJRSnalwlZECndZ3At1rPaLBzT+ltPbt3Xb46jUDdA+vkSLnPuPGgixSTHbeedB469cfHvg9yC@vger.kernel.org
X-Gm-Message-State: AFq9FYKwt4mqhQ8SJb1W26Hy/uLPfQlb4/wFRtdKZD1gRRtOTas4rB7F
	l8VL+S0qvwfZ/DmBVSQu1t9bk28R1RQAVBy39keJBUVn8JfRM/4vQpXOjEItELvg2YyXGSzgDaW
	FmgRY1724RF3vwGJ/GkmyEYP42QrjQ37e7DEuut2AbxXtyk+0Ybmmvs4055L19Rzz
X-Gm-Gg: AYBFou1/YulitnW3wk3Ct526KgW8uxz5BxLsAqJkY934zRFuXz9LHoIFjn76r8c/35e
	XxWkxVUOlImirV5Uz8UKhGIKdcv4gyjP65XROF4iSIaAesL0sOgG4V4G4GyiFZGEkpTLd+o/LXF
	hIhaI6vHHIs4TVFDMAkxgExPKGG40G/V3g9+uUDRgWqJBslETWURt3UXGVsbCYn7tAO8VO6Dwwk
	zcq8dLefr833k64BqFszfHJYOkNKPkMjda7qTILXQUzDSsDoVA+cIUtjj70pXQJpZJMRdQQj74T
	MFc7lJivkC+TB8SNe993XgOYOCxKsyv9eIV6zQ7O0oMrFVVMGPsEBMeA3uyfQ1iDignXwsx9ls0
	Fo+jpROPMkHLxbkDx6KgmEtlCdU30RkFvsCK2ow14COmswTT0Kni9frdHffHbl3kNHjTqStdkGR
	vQAhL0H8YW9MLoFuHAX50CYbo3zdNbhgqM8f0Kclr+w3q23mUAak/8ybP5kTA=
X-Received: by 2002:a05:6808:6508:b0:4f3:36ff:e521 with SMTP id 5614622812f47-5640df1c54bmr5861947b6e.58.1793616142033;
        Mon, 02 Nov 2026 02:42:22 -0800 (PST)
X-Received: by 2002:a05:6808:6508:b0:4f3:36ff:e521 with SMTP id 5614622812f47-5640df1c54bmr5861941b6e.58.1793616141658;
        Mon, 02 Nov 2026 02:42:21 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:21 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:11 -0800
Subject: [PATCH v24 03/15] phy: qcom-mipi-csi2: Add Kaanapali support
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-kaanapali-camss-v24-3-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae8690e cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1e3Zegj4IIqRqDCgfwkA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: EzT9XkAmEBq6HR-bvc4dZQsXghG9sOFU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXxKbowXB7xeV6
 ys4B+gjkpAoP1So6DqhThcS50UdzAedDj/UQbagP5X0m8QsgyyQs/ni+hoiBSutpAGXD7s6Jhhw
 CP/ROTIe5ooflZcNRkgtGFp6BzQf9Ww=
X-Proofpoint-ORIG-GUID: EzT9XkAmEBq6HR-bvc4dZQsXghG9sOFU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX0BEqPlAS5poW
 nYT3Gw5xVoGDeKQvohcOTkmiMszfRhh87Z9UdrCWg3RkxC+F4d8G1jI33pfLaXkn5nV/wWxPkCF
 A5XURP7K34lQt48Kfoz3CtkAPB4oqDOqF06M2NTSfUDJBDPkkTxxv6OvIITLL9xvs3wVIgzl0VO
 kDegkueaEK9Yf2ADKrgLjvdPstE3XFuxkito6xh5erJQkudvW+m/CupVgYS+OWKL/PZUmEJQcmx
 OIUIwqWp7FL6ZQNnMB52NLVgbTBZxaVcC2McmFFh45CT2frgcdh4+b5OENZRmeFkpowcaySF1WT
 3QaM20ve1KGbpn2LcsgLKRvNWBJyvcVmPK5dzpWOngR9YUkhvuo01U7/C4pli/AYUl7iq+q39As
 BJk8UXfcwh6a9YyPuwrhHSu81bSwccDaDDxGmHjYzbJ2T7VnnFYulqG6IzCfG6dA5+uaE/Ds6lk
 TSA+b9eEExk4dYLxGTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020042

Add the Kaanapali 3nm configuration for the standalone CSI2 DPHY
driver, including the Kaanapali common status offset and power domain.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 ++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 3 files changed, 18 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 8cd331cfb4b3..ed40934d67ea 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -374,6 +374,22 @@ static struct mipi_csi2_genpd x1e_genpds[] = {
 	{ .name = "mx", .scaled = true },
 };
 
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
+
 const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
 	.reg_info = {
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index c0a4fa20eaf0..941f8b920b1d 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -443,6 +443,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
+	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
 	{ }
 };
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index d6366f809e51..832c8d048b77 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -93,6 +93,7 @@ struct mipi_csi2phy_device {
 	u32 hw_version;
 };
 
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali;
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
 
 #endif /* __PHY_QCOM_MIPI_CSI2_H__ */

-- 
2.34.1

