Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A383BE146
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 08:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387709; cv=none; b=YyvM0z4IoaMyKhYwkJWelcOpFawAC4bdlA5xp64C1+d0PZ4XtCkN2dez0suTBw7TdnLGOaqdEe44Tyt076cvOoSrLw2s2rEKKTjlF3/VDBarmG8KFc+zuClVg3xRoG3p2RRsg8S28MXEreMg/hL2VJcTVU6683p7f1wd8sXoT28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387709; c=relaxed/simple;
	bh=wsIfzYkqIgUdZWrV5+PdN0Qh7eYY91KcaR7Usw26blQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t3FoKOCsWk7+9lj+lNV6tPrL1f0zRVj7w8JvjgCkTOOeWrmOxPRSCqmq301e1hbLVmbpHoR5engcWG0aV5gVJYquGe2dZjUzGP0XXMPF4EidXzcmexLaG7egic6l4Iow7ScpsLDoZ5n3Om7lWdIfYMqVoYp+YM8yL71sFYtTs6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fLvEfBvG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/c0xFoz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fLvEfBvG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/c0xFoz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65245hSq2691980
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 08:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ERneOOSqk3fJDl/IDfF7U0+PswB+KENJBSCUoP3GiDM=; b=fLvEfBvG/TaR+R3K
	HGUyBkheh73D3VdZhYc5DMl1KZqvqzSleg5sLspy087sFEy1U4u+4zlTKvqB9CCa
	lQltlRsPR84BjjZV8iGAMiS+qKXLxkKaAqjxPhBpCSTgQhE8cEHm+HHGSt6JYxwd
	aTJonDITC9qjw2i/rUU7eRrH6X5CKQgnKcmXbPZhQsmAnGUhgdpc1PWZRv/tjgH/
	fPhOdP0X2hm+6bybZGdP/TuvqdMyj+XhV+wUqzOxFoQ+xpE5dSscBn0/v7BvHsYO
	L0qGJp6V+rBMCv6g4HXVlQzGojd0V4ieXbYXYGGs1Jkm/hRSK+OqfA2tLqAxt9c4
	LFis4A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehqumgwph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 08:08:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304d8613efbso5571163eec.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 01:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780387703; x=1780992503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERneOOSqk3fJDl/IDfF7U0+PswB+KENJBSCUoP3GiDM=;
        b=P/c0xFozhRSaP7Id2F4WHX+9YxSHyT2NO83rgvKdyZ3teUmkrQ6IuFDzbV0v6RSMN3
         uvqbAGA+01F6WN6MbD4rJ1cZcNwdRbolmfrpyI6wfEGZeLb9mGXY3jdlxqgo+W/mRYot
         mA9QnSGoEEPgzTWBaQBRUzP0PhD056OPSJxtxzEE7BL8gkxEObhgbG07NITgbVfpvOjj
         33u7Xk2hQvdkJZ7zmW2mr8/j9bSufDt/m4dhmAQgoM7MAdqIelVILPMcXj+iy9rV0+3J
         emKOty3n2d+nlGgcqKXimzajKHG9mmh97mc+PDdIKj0ckcveAjJuGvEKbMjjT0rPDSel
         k2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780387703; x=1780992503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ERneOOSqk3fJDl/IDfF7U0+PswB+KENJBSCUoP3GiDM=;
        b=T8VMOzd0h8VFYcyjNSKgTjSbLfifhDPWobPy5YO5SKZ1jODQXzY+d9rH4t9q17rqXT
         wufEHhbVBtbirqR91//T/PceOkqHH+po3IFhLvVzh78PKehG2LOPmoUHnkTmvtG2bDXb
         P3SvcbgmRKMhAVy9ZAnm5YhUS+EIpKtWJtWTYLZ4BJCbYM3cHlwbkUrXDggHA0SCtEx1
         BMos0oNJDTWHvLur/nQQ80TSEbfsSSE4ci3LK4Rp1T/Pl/9hoHeKPHh3y9R6EtNfTORe
         pv1crHywGhMEiTpl/pzu7A87mhgdoX4Qgchvg3y0B3gPh4+3/3qJCfVlIS/lUNF961Ju
         Fpzg==
X-Forwarded-Encrypted: i=1; AFNElJ80JkHgh5tCt7YR40mhPC0aBImXJXFnfSqG43kdgVPn1IDTn1Z2GEW0cWJErgSCAElc2RM7yoTDzkC1@vger.kernel.org
X-Gm-Message-State: AOJu0YxFp0gMVcrN2Xl7ipJ2MLdx8NJpv0LpjcxwFBAwLJamy09BPB5C
	Uinrmq/nievG62FDgD0XyI8t0boYhGU6lPaGVNo0ukwDu3AxYaN+cExdiQFC+50UOe9cDAAM0d8
	usEwyb+yJJPElrRccf1NyYC9Qv4OsBWdR09KrUKRZwYewSyZ0zyNUYSdSnhccrOR1
X-Gm-Gg: Acq92OF+h/NdvLw7J1XnvMgRUz1Gehvf1iQJX764K4Y0xC5VfbWKBs/vnpISC31egu2
	JITh5D7+DEZPDLTGHwVBu20cugLySzQMthL5HLhRp0VpTelHPExr+aJNrOOJk8O98BGSbzXHtqR
	/P+1hfwXs6T79/0KKHimERRYKlSxL0hfDXr+WhPw6GLjjHTgpBUExUPZtI8Lf9ClslwqAMVRAb7
	bUquJc9CW4amzrGkwGzigJxJCz+OZ+JPumJn/UFpXR5VoHfM5WtieO2Ax+75Hxi5OgbLAbZ6tyh
	OlvVGsEeNsZ7kxtJNlbdf9NyQq+jyNZzHCwlX6hM5eKGy0IJBd43AqJW96LH1SBaD2cxSHAo+wu
	eprVJ3dchFZNAmNJyqOG7BKp+6pSId+RjgZw2jSeBTI6hMTwDjOUC8SI1M3juH3TvL2/YscD+W8
	fO0hE=
X-Received: by 2002:a05:7022:7a0:b0:132:956b:3c6 with SMTP id a92af1059eb24-137d424f2c8mr6356012c88.33.1780387702627;
        Tue, 02 Jun 2026 01:08:22 -0700 (PDT)
X-Received: by 2002:a05:7022:7a0:b0:132:956b:3c6 with SMTP id a92af1059eb24-137d424f2c8mr6355997c88.33.1780387702041;
        Tue, 02 Jun 2026 01:08:22 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3d8f839sm8006025c88.15.2026.06.02.01.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:08:20 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 01:02:20 -0700
Subject: [PATCH v5 4/7] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-tcsr_qref_0527-v5-4-8ea174a59d7e@oss.qualcomm.com>
References: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
In-Reply-To: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780387692; l=4461;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=wsIfzYkqIgUdZWrV5+PdN0Qh7eYY91KcaR7Usw26blQ=;
 b=aDFb2uVNTxQj7Yxbj/PImvdLe9Kb5iRz86HHuzbnJmYu0NYzzeNpnqkVBWfIONgVzSG7vUnq3
 SIl1pNt/dyCAAh+K9dwNOeywAelHuri650T08PaOY71F1fnYiq87LWo
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3NSBTYWx0ZWRfX0eOdGPltepyF
 8yJfH+MElRVu27y198Ky1ySAzRb1hO1yw7QIVOhs6trkgOpvqArYGjjw5rSAliqbUTD3ji3HMAM
 fgWT0hfD7wENnPeTlvEJiGWDyoa8UFFSxWBzkhPPtH/k9TUkA5dF6QRwiHoRz41XW+EIr6bRoUZ
 WNZ7p8oh783Ok8Y6UXCRG4kyd/UTzS9/58nAXAPu2fXGhv8LcI8yfOKZH7CZ+DygaY7Rappztyv
 ZXou1xgx9/b85Z1TfzfiV5z61N9KPbuptRlwzqVkNU6eA00cwK7NCuxYa6+INroNEPPW18K99xd
 lXwEQyj86H0DjXBl4I+VFvE6ALFJtpvDlXzKnvh1Jh6QxRW2JVHN7GQQAYYzFgjUZxh2fgl/aEf
 S8Xu+XKh8pzUQN5FYyhxUeHvzD2ccmQIXF352QPrUxplwrs2Z0vza2rWPG/2/zlWl1uWlhDxf6X
 4KtPQZOMrAHLV+o7LcA==
X-Proofpoint-ORIG-GUID: XKvW-0kOGkipHtDnLh9P3LxAC_g94a4l
X-Proofpoint-GUID: XKvW-0kOGkipHtDnLh9P3LxAC_g94a4l
X-Authority-Analysis: v=2.4 cv=Rrv16imK c=1 sm=1 tr=0 ts=6a1e8f77 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ejsaoIeHybvuXmj4E6UA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020075

Mahua is based on Glymur but uses a different QREF topology, requiring
distinct regulator lists and clock descriptors for its PCIe clock
references.

Add mahua-specific regulator arrays and clk descriptor table, and use
match_data to select the correct descriptor table per compatible string at
probe time.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/clk/qcom/tcsrcc-glymur.c | 99 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 96 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index e317003398d1..deca9b8794b4 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -13,6 +13,11 @@
 
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
 
+struct tcsrcc_glymur_data {
+	const struct qcom_clk_ref_desc *descs;
+	size_t num_descs;
+};
+
 static const char * const glymur_tcsr_tx0_rx5_regulators[] = {
 	"vdda-refgen3-0p9",
 	"vdda-refgen3-1p2",
@@ -40,6 +45,25 @@ static const char * const glymur_tcsr_tx1_rpt012_rx2_regulators[] = {
 	"vdda-qrefrx2-0p9",
 };
 
+static const char * const mahua_tcsr_tx1_rpt01_rx1_regulators[] = {
+	"vdda-refgen3-0p9",
+	"vdda-refgen3-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrx1-0p9",
+};
+
+static const char * const mahua_tcsr_tx1_rpt012_rx2_regulators[] = {
+	"vdda-refgen3-0p9",
+	"vdda-refgen3-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrpt2-0p9",
+	"vdda-qrefrx2-0p9",
+};
+
 static const struct regmap_config tcsr_cc_glymur_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -111,17 +135,86 @@ static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
 	},
 };
 
+static const struct qcom_clk_ref_desc tcsr_cc_mahua_clk_descs[] = {
+	[TCSR_EDP_CLKREF_EN] = {
+		.name = "tcsr_edp_clkref_en",
+		.offset = 0x60,
+	},
+	[TCSR_PCIE_2_CLKREF_EN] = {
+		.name = "tcsr_pcie_2_clkref_en",
+		.offset = 0x4c,
+		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
+	},
+	[TCSR_PCIE_3_CLKREF_EN] = {
+		.name = "tcsr_pcie_3_clkref_en",
+		.offset = 0x54,
+		.regulator_names = mahua_tcsr_tx1_rpt012_rx2_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt012_rx2_regulators),
+	},
+	[TCSR_PCIE_4_CLKREF_EN] = {
+		.name = "tcsr_pcie_4_clkref_en",
+		.offset = 0x58,
+		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
+	},
+	[TCSR_USB2_1_CLKREF_EN] = {
+		.name = "tcsr_usb2_1_clkref_en",
+		.offset = 0x6c,
+	},
+	[TCSR_USB2_2_CLKREF_EN] = {
+		.name = "tcsr_usb2_2_clkref_en",
+		.offset = 0x70,
+	},
+	[TCSR_USB2_3_CLKREF_EN] = {
+		.name = "tcsr_usb2_3_clkref_en",
+		.offset = 0x74,
+	},
+	[TCSR_USB2_4_CLKREF_EN] = {
+		.name = "tcsr_usb2_4_clkref_en",
+		.offset = 0x88,
+	},
+	[TCSR_USB3_0_CLKREF_EN] = {
+		.name = "tcsr_usb3_0_clkref_en",
+		.offset = 0x64,
+	},
+	[TCSR_USB3_1_CLKREF_EN] = {
+		.name = "tcsr_usb3_1_clkref_en",
+		.offset = 0x68,
+	},
+	[TCSR_USB4_1_CLKREF_EN] = {
+		.name = "tcsr_usb4_1_clkref_en",
+		.offset = 0x44,
+	},
+	[TCSR_USB4_2_CLKREF_EN] = {
+		.name = "tcsr_usb4_2_clkref_en",
+		.offset = 0x5c,
+	},
+};
+
+static const struct tcsrcc_glymur_data tcsr_cc_glymur_data = {
+	.descs     = tcsr_cc_glymur_clk_descs,
+	.num_descs = ARRAY_SIZE(tcsr_cc_glymur_clk_descs),
+};
+
+static const struct tcsrcc_glymur_data tcsr_cc_mahua_data = {
+	.descs     = tcsr_cc_mahua_clk_descs,
+	.num_descs = ARRAY_SIZE(tcsr_cc_mahua_clk_descs),
+};
+
 static const struct of_device_id tcsr_cc_glymur_match_table[] = {
-	{ .compatible = "qcom,glymur-tcsr" },
+	{ .compatible = "qcom,glymur-tcsr", .data = &tcsr_cc_glymur_data },
+	{ .compatible = "qcom,mahua-tcsr",  .data = &tcsr_cc_mahua_data  },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tcsr_cc_glymur_match_table);
 
 static int tcsr_cc_glymur_probe(struct platform_device *pdev)
 {
+	const struct tcsrcc_glymur_data *data = device_get_match_data(&pdev->dev);
+
 	return qcom_clk_ref_probe(pdev, &tcsr_cc_glymur_regmap_config,
-				  tcsr_cc_glymur_clk_descs,
-				  ARRAY_SIZE(tcsr_cc_glymur_clk_descs));
+				  data->descs, data->num_descs);
 }
 
 static struct platform_driver tcsr_cc_glymur_driver = {

-- 
2.34.1

