Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944642F8EA4
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784005201; cv=none; b=jUDjQHwpyAZQ5+DHmP1rHV+kIw+abNfeH/rSG5NFHpfXgGk/HPYwPZZUvbNgQjnkYcgeP02ZhDsl+Xr0Aj4qlYDCr4vRmXoNDtZW0MtjdLG9LwRzRB2IEddcMf3jCQuZxwPlfpSo1LCFnM+3iAXyhkdlFdStKseesVVHo1J+wMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784005201; c=relaxed/simple;
	bh=mWA8/QzJVw/Z7Z45NGEAV1BRxr53CZ6L3rVVpjHn2gw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vms9JPJlsYhxRBMK47m9oDqtz/CIVbt4QhNZT/50yGaWaYAJ/8X6p2MNHfzdR0ZksK0VUuuJHZpFenqZ1p1sD06LpHcocknpqM+1WkFVXlxeRHtR8bOIqRW9ZHWNcPzTStq6gXnX0fxtKUUMlVGisYrRJHem6MPLXKw5q1qphrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ChsohAib; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GUw50QvY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ChsohAib";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GUw50QvY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38Kml3441444
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kjEckMXmIg3lTxAMQEusLsfGlV6CVK9DEapraoZ5Zsk=; b=ChsohAibkEY8PfDz
	wsUqMPYeCFJ4j0JxqwLjaq5aFzzR8z8cLZg9N1vSHD0aITFa2rHhbDpnXSNdeOuI
	VF84pIA2XSfkPI9HRfYRyzboJ2X8XpwJtfN7ZqtvKPJXeLmGH4UWeFikd0gz4aMl
	VvDVPR3idX9CHbTaxZQH/J2+ZVSV0DL+ANrY1J4XwZg2vz0YFLB1gPt7m+HWYFJz
	/R8KPQ/nULxN9q/05NOYB/B57h1gSDINgAc5mbRPa/LXliHpEl2BaVz8ny9uL6im
	+JLYnben9EIMnrigsvF8QMYuo0Fw1HdM/gozabf1U1w5r9MUEhCzz/vDYEgH7aWd
	eZhi4w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr48jfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:59:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8952346bb9so3288227a12.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 21:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784005197; x=1784609997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjEckMXmIg3lTxAMQEusLsfGlV6CVK9DEapraoZ5Zsk=;
        b=GUw50QvYcKumlegxpOY1KJ7a616iqLUgYeUDYqT/RD+W356I/pPmR3BM8ZNXw149ip
         /QIKihda23PwUNU55sZCk/tTMaw73l761SIYV3b8HKQGC1L15LD+7O3CQnPlxtCkHrrZ
         G5whiG1vJoCvBoP6s4kzd7Jb1wO/Ex3Yu4Izh/uCOswGj00yv/XvsM39zOVybxmaiIpl
         A4GADU8efNjnCbbvhqmpguf+BtrEtRksP17HZzuWXkfr6X+1qTUDfWPs77yU7hats69Y
         g9r6jXYzaWpJncxm+muUnHkRlHt2GqlkDEgNdFXATMEDQLa6/1/2rvtLZsXDPhBORT9a
         flHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005197; x=1784609997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjEckMXmIg3lTxAMQEusLsfGlV6CVK9DEapraoZ5Zsk=;
        b=fpVTdAp0Ql9/S7VlZE+CHxUw6FYqEb/FfjkcPrrH3b3ndc+nORF7oyY3U2P0gcfArg
         3lNj+KW/sJ/MQ9k75iHf9L1mgM7e8OId0/fMs0S/JEoUBC+PZxmn4QcMluth4zcrPVhz
         4QzpTENmcuH74appXAuJ3EP/pUWh5kfju72MmRGUGnz/+Sp2zlUN+Mb74YTzgH0G6thk
         2NrHYOhRhURSn+qQUho2dx6sl+Sc2akOmsRaxPG2VEAeihyu7Of/DS+/MfWHO34I8MDr
         Wo8re8QGc+LhTQug/572yZ0rRX7gXQjYiyrKsfDoFjatxaUXnq5NYCLeAGUsX/DXEu65
         HOgQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro2WYg8gtVV0KSX/H2d+iVeVVxBFcXGw4DNqqf+lltwq9Vd7vksRRV04htr1a1kap5NWAN8nwPic/Rq@vger.kernel.org
X-Gm-Message-State: AOJu0YwrVeXHUhcciOWTDqJdWWP33RE6tSZKwKbMreWRl9oIL4FAOsCI
	RKSmAE+H+pr05r31OMszTeW5kNBLRHs/aiiSZKlQMhGFFn3PCJl010vpq5yxMcWRdSU3fGDxcPd
	iIpjOkx4qaBJ7nWBFxQbxpqwHzkD8aAKrbehc7JXBD+IRLQtfj/mfjUTZzAuVeBk7
X-Gm-Gg: AfdE7ckDPgXaZy6ca4YlBIp9QjckLa56oBzg6UhcpcM/KIpe+BMZZT9s2mnk9+AF6V4
	mbrHgog+o7fJbxvPHR8ixjtHb8g6f+k/iPkWIdUEK0N+RA5eAlsdAMAPKN7GNhztMM7q206HNFm
	TvlzNzgHN7JIcwPoVWc4gwAn30l+TCMqvLcv+QWRBM04TbD/7xm11ciPlgZMbIIIc+yqOe2G1sT
	mvIQY1fB9j3ftmkNLFYTvHFetzoQoH3NNp536bMfQYp+HKBXe7n9aVp4bL56euxxwWsvW1odH90
	YoXOmKruZUMi8qR8u70EDcvrbWEbTyzmfaSyMVaBTq3CdfO6SACWp8wUvpfxDcMCjE0PMHK/hbG
	8T/FcmdCTDUqlRcwjhzdAJoPlaILxle58L1cRRIZBC1a1/YE8oetO1Zrc6A==
X-Received: by 2002:a05:6a21:9d4c:b0:3b3:fc6:6226 with SMTP id adf61e73a8af0-3c110778416mr12506235637.24.1784005197516;
        Mon, 13 Jul 2026 21:59:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:9d4c:b0:3b3:fc6:6226 with SMTP id adf61e73a8af0-3c110778416mr12506199637.24.1784005197077;
        Mon, 13 Jul 2026 21:59:57 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3120c8e41fcsm41874021eec.15.2026.07.13.21.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:59:56 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 21:59:41 -0700
Subject: [PATCH v9 6/7] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-tcsr_qref_0714-v9-6-373670ab15f9@oss.qualcomm.com>
References: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
In-Reply-To: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784005189; l=1658;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=mWA8/QzJVw/Z7Z45NGEAV1BRxr53CZ6L3rVVpjHn2gw=;
 b=doXDPI60X4ekfOU0fTFxqHfYME2KrZT0grUAy9KcmmZGE3pE0qPJrm/2tIMdQuohv5L0fqM/H
 Jn8yIF1nsulCs8zxTuwTNhBa+NrEfKGl07fgF6RuyNd2Ab9lYdVRNqp
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: lhTu0R_pZh0pqPaXp_JA9Y_0Fp6yJACX
X-Proofpoint-ORIG-GUID: lhTu0R_pZh0pqPaXp_JA9Y_0Fp6yJACX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfXyipQHYnNWUvH
 EWOfbmjCQ4jTXfwSsVPxQ4COQAuxJJi57OYP9eh53Cmb8jxVGlyQNra/ucuCKaMO2fj9DDaM6iE
 8PwbIJgve1nOnzhHdQr6RUZVeo/OYmnAZlS69V3ncXhhO/8rbIlY6unAZ0m99N7CaiSFbvUXFI6
 ui2BLDiFO7rHlWk/V3FMwZrqifeAtknKVDp9IUJF5kHKy+uLAOtoaZxlAI79XkcfFM7Eeeqb+/n
 GwlTiHPJHt11Su9sXHPU5+6gpEiX74oFEVYbxQzOCIvRI0e/beandOZ5GGOp0cQr/zqit4jzPt1
 WX+1wcZqQStDHPVUoZydMN3FoLVCm+cFEOc959dfO2hvFyhKRgF85XOD9GYGkylHEBWgi5nvt//
 L47aX2mLEocgJqFCACdzxNxazYhvtUCYXReHFM7jaU09qSN0yg/XYSq+vg8WM9BLGb3YCZoHrao
 xrmrCi/gYC4A4VPHs5g==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a55c24e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=n5gI8yOKKvUJs91qd4MA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX9B69MsE3qxhq
 Oi9xkqAJVOdLzGIZHewR3AlWfGyT+Y7fmoHAVOV+Rj5jDPhMqMHNvmMrGDGjtaEawa8Ips2gI+1
 mi+QN88sCCIzGGvU5z4fX0eXFMk8t6E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140047

The TCSR clkref_en clocks gate the QREF block which provides reference
clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
and refgen blocks on the CRD board.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 6125617de82a..44766a73b0d1 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -28,3 +28,23 @@ &mdss_dp1 {
 &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p08>;
+};

-- 
2.34.1

