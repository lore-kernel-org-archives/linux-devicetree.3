Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4102A28641E
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670981; cv=none; b=pYe7cRMH3IS4SKfwWtqBDjJi3IkQEWYdMWxxGt0CXk7tOgtS5/S8ZDp8N855s7MyF0p9Xrwf3AGwmjoHrFFc2CJXtHHqS25qijH2IyTBEw27Mf6unpUxWJ42eIf0m+aaX0XohBzI0sie6j/XRc8IKm91zQogscaBk8ssq0Ld9Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670981; c=relaxed/simple;
	bh=yyksNRbGKOAS3rMbPtNPWOGGGB0beDwIaP5hEkpK2Zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=myyPI94roLjiBPB82/G1HPnHkRrm1f+aZW7bayI4XmA3BsJLB+tVGa5rIA0Rfufd5ZImqHudROEjsha+pNZz5znOzIP9rP2N78BuUH4AB9BglJbOKDAYAzmwEwiIfAc2JoQY43KjUN1jepjG4AvaH94lOZIXJGBnfq1g8xBIQY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LHqnoqjD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UwX5jEpe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LHqnoqjD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UwX5jEpe"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K79CrA1598147
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aax74Xsy1hxYCxPdadlpSBnofeDzZn5V1X3zjKrLfVg=; b=LHqnoqjDEwiKpuvP
	hVpI6dnRvdPA929YB8cYxZfNMJ/sPa2fMXPQCBVyGC/ROMFALcnCOre4kF1xj3RN
	Ir7JhSBm9tS+6IRZzOsrbQPTkZ+ep8NDzjkMJYBG6OwC0MvTeEGpbV5SiKLhqOvy
	OqrZbkXVF7Sn4pSVf4E34eCglHD0WtucdFCsxmHDYuyjhNRdjtrpJRvLdf76eHAo
	dd47p5RCOplDE8W72/fLKtEpZbWAOiSGa6ja+t/18fCllumeYg5BU13ffMMPnxCH
	oHb3OF+O2wbaDORSdVAie6uE50nWsQz8nfn0jCH6iZL4j64P/5fDa97f8Kf593v7
	3rC0EQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfgng6pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:42:59 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c91ef7009so301085c88.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 00:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776670979; x=1777275779; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aax74Xsy1hxYCxPdadlpSBnofeDzZn5V1X3zjKrLfVg=;
        b=UwX5jEpepmXk1GNBKHxas8/3N/mjSpYzdpGyEwYgql7vsKs1bqHItkey4qdWUm1Iex
         gut8DOrC+kfbVoXMAFPl1fCYHgBH58olHDWme7bZI40qt9WZczJfl27YT+VSw6qyTcqL
         FJCn7bIWfL/IxUTC1huYoly9ikzoXeKziX+D1AkafOTSnSlNrLRlaaKKCcNWFS7d5ay/
         thSATAJT+p07Bz8r/SQX8iAFpayr94HDGBN6CBX0jXXRCR3ceN8NJ+7G3DTioP8lADfb
         VHNqY2aNnvsQfiwX2GUEHINNIoC01oKqeOkFYmBLU4BPSCtsr5qaWOjAzRdP/0R/UHMA
         JfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776670979; x=1777275779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aax74Xsy1hxYCxPdadlpSBnofeDzZn5V1X3zjKrLfVg=;
        b=AKqQRgxL9zKhaToOjLAo9L0SlBNWXfIcgkQEqtZGDfrYJHwfcX9gEMcdi0v7N+qXbu
         PDdwFZOEVIPWvIWQVQA2h/v39ZyXdwNwhxPl+v9DicCsPRDfXvSrAp9D9d4exJ6SoVIF
         fjr6bKcyFnL7ybTMsC0sl9uCCLDuGQOwSrfcMRsF6ddLBofljHuFDooWgMufKGw2OuE9
         /26yUeEMZm1OUaNqQZvV6doo3yhitPOwSlgplZTpnrFG2RM/fb7wCzN0FTMqdxch4OBL
         t53ORrapG1TantCvb9gy9wJC+3FYLUGhrsecnaJ0zubt1FwGeQ+o0bFFcEMTHG+ljDb9
         Q1Sg==
X-Forwarded-Encrypted: i=1; AFNElJ9wlxJTJ4CMQ9IuFmOnA4ErakfeZw7QQ372YcQMY/SxBCUhmbPSJ73ZB2WB81o5WzC7jjAJF5IvU5iL@vger.kernel.org
X-Gm-Message-State: AOJu0YyN0qik1Zf7rFYssS6BVcsjlk3MwxlrpO7LLfI9KtxkRZ/aJ6am
	/skzQA/OxcuKX1OhQh8JrhKah5M2VPunBczW4f/wcXUqi+gksC6uHPUiwOEYLMmRXIqgibYLddU
	UMkzfTp6W0O1lnVR1sulQywdkWrwGCyjhlOUcwD+hVV66G/3LZPF30vtKVtrc0PGd
X-Gm-Gg: AeBDiesBn25uwRHL24Tdm53wFKiScKp0q9Ik6Gnv0Rj7XHqqDF/PAUtpqLIy/8FJXhN
	nI251KgGVgZaN5k40poj2wUpztSogrgH6RLNqnKAGlbZ98zvmx/2XClet6GR4ZvfS9uH0RHQATH
	nxwLgxpEqnEd6CYb70nLtnbMx7fo9b8qeemF9hMDB+fISeSMG3zU0vJgZhqH0mrkWj2EQgDAJ4W
	eHUf5nmTY7DIp5TjuEbKNm69gNGn1lS8EbPxC7ZYZ11dlA2v/s54l9ul3FczWTGyfDQR6Sh6czO
	zJRrTdlSSunKBCGquCXe3dZVXz8VeXoViJHbNnXfeHVNr4GSggWqM2hPqU0fjPFKS2jk7lDM/Yb
	Jn+4GYxpm+eo2UqAvmADHgkp0xRplzNd4o1B2KvDiaBw7T5iWOlVt8+T64B69Nblaru6z0Csb6T
	Ilu3s=
X-Received: by 2002:a05:7022:384:b0:12c:33dd:f9ff with SMTP id a92af1059eb24-12c73fb16c5mr6848825c88.33.1776670978874;
        Mon, 20 Apr 2026 00:42:58 -0700 (PDT)
X-Received: by 2002:a05:7022:384:b0:12c:33dd:f9ff with SMTP id a92af1059eb24-12c73fb16c5mr6848814c88.33.1776670978294;
        Mon, 20 Apr 2026 00:42:58 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a18a2bsm19866217c88.10.2026.04.20.00.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:42:57 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 00:42:55 -0700
Subject: [PATCH v2 4/4] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-vote_qref_in_tcsrcc-v2-4-589a23ae640a@oss.qualcomm.com>
References: <20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com>
In-Reply-To: <20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776670973; l=1676;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=yyksNRbGKOAS3rMbPtNPWOGGGB0beDwIaP5hEkpK2Zw=;
 b=UjbA4bhllGno/fFkdCg/oALlowFVUfHEJ8HcU/WnxT545RvQkiHf5PCftELeaYbzb4OhkHYLD
 ipzY2gsIbw3DYoxY/N9Hunvs+4RwTaq/bbbOb2AX9zeHpvJP8SV1TJ/
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: EewS_yOGE-RYxDgtPVN_MOsrhipMEHAQ
X-Proofpoint-GUID: EewS_yOGE-RYxDgtPVN_MOsrhipMEHAQ
X-Authority-Analysis: v=2.4 cv=TK11jVla c=1 sm=1 tr=0 ts=69e5d903 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Gcy0W0cHAWauOcWtTx0A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3NCBTYWx0ZWRfX5yYgJvS4C0e6
 qlUUZ47kfHvhANkGJpVM8b0ethMTQz07NMUsfi6mCkaQcieQVzDhdIr/e0dyNy4IbUtPKLfQq6r
 bLgqNOcq/ptAtetFWEH6gdR0QwiOXO5zZtZaAdXhETlQNlsFopTRpZE++CvyQmZbPmZ4uxweJP/
 /ofb4I3ljhk7z5P1p1wE5dpl5mwWqZqWcN217OparKyfpo8AKimbuh4Hle2TDxKRmzGz6g8ogfD
 qZGAMIg+8ahPTglUMN2juT1wMQoH6bIHbMoPdFI2P0BHbWsfLePQeyyOZvkpaGui+unMJLzUJFU
 aXjuGWQDAyx3xoepq8AnWeXf1Dbx+R0QnbmyLW996gyMQn9JPvseN2X0hShqRl1GvTJxZNtX0Xx
 emUgZm3BbbGuZw3Wek2c0K11wxkj1gS2AMSAYFE4E7hOsCULU9/jY1tZWobki+pCHsdvUOlqFnk
 HhnVprxD1ObZwvNE8NQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200074

The TCSR clkref clocks gate the QREF block which provides reference
clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
and refgen blocks on the CRD board:

- vdda-refgen_0p9/1p2: LDOs for the refgen block that generates the
  reference voltage for QREF
- vdda-qrefrx/tx/rpt: LDOs for the QREF receiver, transmitter
  and repeater circuits

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 35aaf09e4e2b..382398e44296 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -358,6 +358,25 @@ &usb_1 {
 	status = "okay";
 };
 
+&tcsr {
+	vdda-refgen-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen-1p2-supply = <&vreg_l4f_e1_1p08>;
+
+	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+};
+
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in1>;
 };

-- 
2.34.1

