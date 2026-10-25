Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898255;
	b=gv244VYt0tmUh2QkPQG5pBnSsIZe+1v0GwqNHxtORZsJN/CoHMFpVXfshT8syNwDnxOp
	 sTJY3to6UaaEAEhm1mw2r9m+PSBHJKD6PUnKuX8HY0Val3UpFnDXjqMp8AqiUeUdCXor4
	 Br1KbuiLuCudY7530runwigHOLPCpoOVumZOiDbCfQlx72SMcUcervvzojPHxNHxkyV/i
	 oNSHpjtA2SfLr/0H7JIerRHDh835WqZZQhtiSFQDVvNUVicoYZpA/6g/8qZeyTGz8ZbUr
	 OINs+Mfsu8Ntbbe++weL/PpBtKw80OHe3kT8UNccB4vW8gmGbD78rrKDaczQz/p7jxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898255;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vFokErhM9Q2nJQ0re6oLwwnWeG49znjKbOg1X8oBNrw=;
	b=Z0Z/YpRaHmd2brEJ7DRg0bUvgs+K2ZW5+dQ6f6v8l7TGEjFeSo7YyQtUqrfXrDpOHeCf
	 Ho5zdh0Tbx/n16mcZA55JCR67hF3CpLF9xkFfXuX0PCDaA31M7rn/itr10LTrEts1xwor
	 2bhJ3rx3cpYpeYRsPbOXj6A66oDkZCRnoUSt3UFsonNC4+N4hf7G+NnOHBg6D/H+zD+23
	 jZuOGZoLXwGmsVVEkWKGitnhYI5pfoxtfLbIT4CNSia4YFdMzUcDzG/e0cNjJ3hyH6arp
	 eQhpvCoRqGPXoEW6pvRXFh0XB/y0+Ls77fLBzH2hW/WYwkjCIzmJnpyw8O4QvH/2yrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hrC9ZTPc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DxoRpq24;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FD560A5BC2
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 03:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8FD560A5BC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hrC9ZTPc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DxoRpq24
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P16We43584457
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 03:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vFokErhM9Q2nJQ0re6oLwwnWeG49znjKbOg1X8oBNrw=; b=hrC9ZTPcSZxqR+y/
	4egwq1okUI0CHBzrb847IFersUjlMVzc1DISsIkVwC7W+5XRNnTRAbtGBAstQWph
	AWgFgMvdIC6FkU4gQnGJTFU3I/64bId9CfwFcuiq+rkPxEnmILavMhsUL9hlntwV
	+wqg8MNYwGCM7FX0qBLGnlhNKSWc0JZXgRN+STp8Sp/RJ5Ss1o1LvOl0RpgnWVlI
	5a2yWTbRDVjeb8ejK/KzkRqZW+gsyNlhG7vhJqsoBLX3Z7T5CV5qllobI7ejJMP4
	X4roh+FYMJ/RzJ1l3RztXKjFSPQhRveVHztGwFEtVPpV6KTlntSGOiqL4gRWGEUk
	Iim45w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkp6jdue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 03:17:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3512053eec.0
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898253; x=1793503053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFokErhM9Q2nJQ0re6oLwwnWeG49znjKbOg1X8oBNrw=;
        b=DxoRpq24VmtVI/8yBMiKHgMHq1dIg3+ueWcByz15O/fkp7QQhL/0vODNAXG2KV4Bm8
         78OfE8ktO+mVKaeSajJG5gBd6Tv1i8RS3JdPvEFYcXEScrGqUoOsqFsR8dxycafc7Oyu
         Aduz5od8v4v5+xiCMy2cKb9Uq6Le2YYwHIzr6iwmD9kIJqkcrBH4kbCVsasdyk4fEySC
         EGJHaQIBMKBeGs7+iC1dkwV8fqY5Af6CLnllOhCrGgAKghzDdJ3RNWCmfnBEUdvnsPah
         35e4F7pwMIdoDBItN8r0CfS2nv+XRfnLbjyviyAo3qu/2NE+1YMRCKYXID+ABoGk44YK
         gFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898253; x=1793503053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vFokErhM9Q2nJQ0re6oLwwnWeG49znjKbOg1X8oBNrw=;
        b=GVVKMIpyc5vapPPCPXC27xcWHhYnGl5dfuBDnRpTd1CYe9Qpqb/6uFzH9VhJUo/wHR
         +r0REoNHnzw26bz0KlWZxbhvuUN5arcW+2EphjXBOgVb3+O773/8BTwR58IsRq3UvMVG
         R1/VlwK76HOL4F0hxhU/dz4y3g/u+nB0ecQL0CC2kJ2CtvR5ZL74l5XouetXbabhF/ee
         gd5yuquBHXs9r9WfaAIA2UZY5ItJ4j+fKM4VKuHbY/QpIHFCCKzQUHDSD+8xYSJ3Mb+H
         p9xuoMRa14vcxghHGrPEy5yNlGzDhNtuuf4UVzKhzvYBohGee7oXqMO04cGrnfLvhKEZ
         TNFA==
X-Forwarded-Encrypted: i=1; AKwUvByosGmsbiyUMK3cfvcsbMRwIZ3HVO8Y7KfaURS2IZum2NEL7EZnPxirqS5bbyTmi2Cp5wVQQUpkKwxb@vger.kernel.org
X-Gm-Message-State: AFq9FYIZOZR/d0VGzKHgY8uwBt0PSWx6Y2LTUImufFVPawYiJjO1Wbtg
	7AYZmaeNspi0OiAFkYuGiAII42//GP4Qa4i/MJHICeHslyLC6tOEa4fxyvnULfvCcRWQKDyboP/
	p02WPJwAuSY0R7CNy+d3ol/TulvQf6wwehClReZuz7FA32b7nKh7j5Odx+i4syzN71T2BPwJb
X-Gm-Gg: AYBFou1iRRr17C1d4XwCbrOq9mzKCanqemeo+NYtgJXzKYRiux+1sxooyuSBlrvhLvs
	GWgspo3n4h0n8AMojFdd6K7q5J6vNOuMv8mBlSDsLBl3m0wDYfPdAgNuzWXexE4aaxiK3w+6bY4
	MB0h9+2wqqozN9I9tgJ/36kLOK6+7S5h/vQnt0JFSxymcM4L1xjEVxliVHPsO8593JJRKjGpZGm
	YSsxAhLRH12FzdNqb2YRoGQVg3YLwfkNykHU2Azp0nrCSIS8d6QU5ThJGtxxgXDo6c333eZUMDs
	GYRgjT6ACY9DjvntY4vHX3/fAb2UfMr7x+H4ZFEY2PNA+gfWGwYGCspln3XcgCb10vluw4R8LOb
	s+Cd53a/82REMfDvMev+h7PP83gCIoyLC1Q6ZGlUXx8DZ6AEyrXmpGYF7Zfvt+M6wOCgoTSPQTh
	JUzvipChYCRA==
X-Received: by 2002:a05:693c:2804:b0:368:40c6:3a01 with SMTP id 5a478bee46e88-369e8362dcbmr5169602eec.2.1792898252752;
        Sat, 24 Oct 2026 20:17:32 -0700 (PDT)
X-Received: by 2002:a05:693c:2804:b0:368:40c6:3a01 with SMTP id 5a478bee46e88-369e8362dcbmr5169583eec.2.1792898252247;
        Sat, 24 Oct 2026 20:17:32 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:31 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:26 -0700
Subject: [PATCH v22 07/14] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
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
Message-Id: <20261024-kaanapali-camss-v22-7-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: 9cTQYhbk1fuDhurSn4znpoODWgtOAYh6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfXzAEJ2zZ9lUmD
 yivTCTUYNb1Y/5oMH0Y7L4YGB4uLJTwCOIdfmeIr+99+xXoLANwbVMSRKaGMLI7veCg/wKXDphu
 nBnyOXty/Xdu3kLQw0UfG+q9h6iKz74=
X-Proofpoint-GUID: 9cTQYhbk1fuDhurSn4znpoODWgtOAYh6
X-Authority-Analysis: v=2.4 cv=bq/Zl0ai c=1 sm=1 tr=0 ts=6add74cd cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=JczS9Y7s0yypmJa40voA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfXz72g/DtbAPxS
 7X4Jn9KmoknZ8dxCw6+QY/7mrEnXV4I6eOECVsubwXmQniffwXl/QAs2ivv8e00lbBy8SUwVtMI
 kCMFOaorJUAlGR5yyTA597lZWXDNfvRCJ66jS//JR7Gr4f7ZB6zj4Ucnu09tQ48MsLJYsuEGi+G
 S2rs24vKt9+F4rfPcxqyBCa8ueLb/DeP9bMf0wcIDh3yYYSzPMKmUclKkfJ2nc5uegKq4vFRb8E
 /QO5IPS6sCD/6B2CDIOr92FOG5WJ2TkRDl4HQCioOQfJfJv5Go/hZ1++p9SGTCL3KFzHsvScvMK
 YNXmqvvC4eu21tMsZf3ig60C7KaS+N0sFY/ACc00AklUj5vn6aVizElswG8Cu87rKjIZ5/vVioE
 B5rv66wh/6OTmfcjUJQsULAlbljOwFBrkuU5Y7MiDnPeWsFdd7SmVlaGFyKiu6OG+92uLgBeT2h
 aCPsLYk+q4MH9LW5S2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610250012

Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configuration,
which reuses the x1e80100 lane sequence, clocks and supplies but selects
the v2.4.0 common status offset, adds Kaanapali power domain and register
the "qcom,kaanapali-csi2-phy" compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 47 +++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 98ec23c39fda..0358ee384012 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,51 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
+	/* CSIPHY0 */
+	{
+		.csiphy = {
+			.id = 0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY1 */
+	{
+		.csiphy = {
+			.id = 1,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY2 */
+	{
+		.csiphy = {
+			.id = 2,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY3 */
+	{
+		.csiphy = {
+			.id = 3,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY4 */
+	{
+		.csiphy = {
+			.id = 4,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY5 */
+	{
+		.csiphy = {
+			.id = 5,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+};
+
 static const struct resources_icc icc_res_kaanapali[] = {
 	{
 		.name = "ahb",
@@ -5606,8 +5651,10 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
 };
 
 static const struct camss_resources msm8916_resources = {

-- 
2.34.1

