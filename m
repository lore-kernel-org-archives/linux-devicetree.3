Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D9F35A385
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 17:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775497600; cv=none; b=HXkDtB9eUYMjOF+cMZwxrioxwOSIudtw7zWhQRPVoQQmbC8/w9OVpvcOLmAuFPFvC2f3YQZRZaUzEOezEMTvSwAvGLrGhJ3c66UKByLtaIyohqMItXHlIa1w4Ia5okSBKffD4Ta3I1cBvCqW+XeGhFZi1Q15c4GfKdLV3FUrbvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775497600; c=relaxed/simple;
	bh=4fiNNq/Emf8/pIwO2FmC9gxHuXnHVSbaafeVigMF7fM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YR+lgtYJtDSY5wh+fkAnIgW827aL7SdEDayxgaiiSZcgc+L85bf/IxpVUDaLJIvu/B/lCrZRnBVyaCAjalBMhlqJZuMIlFDDvFoCsrc/sr0+iH9TogEU65ey6zFiBAobrbWzZTp4AA70tS68V6f2G/P4GAePFGoHIv25jL6wLRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQOQcRXS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kOmUr3RW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQOQcRXS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kOmUr3RW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636F0twp582233
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 17:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yoboWPPRyhP
	B0PHvoULmtXDdCQ24aXjLZSkK+ON6WXg=; b=cQOQcRXSQFE3nDBmBrKsamhCv7i
	yVpoJH5hpmrH8x0DTIeJwVuuKQUeRr2SlPfF54ZveXDdh1Rk2uW2uqtSDWKkodXZ
	f9MhgPM1AFJie1Gq6zK3HTrxys1g+78WtxgJM+fY5eJTyUwst0tjhkpEW9/JU3dA
	P1NQ7VSDjwVoBmRoyIBTz08oATBudBhciyxyPWuJONHb+osd5uXpV2hBa0wnzi3q
	n7luvkoHBka4zmiX7YjCRcafibCmHsm12XupE6uY+XLfk6Rd+kfzLSMzFsX1hinl
	eUsPuC/X6f7ilUyZ0bIgvojoxyaO1yG/BR0QnfAh2cTlkq5j4WSU1r6ucZQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcf3r0hy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 17:46:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82cf0130d17so2461930b3a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 10:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775497597; x=1776102397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yoboWPPRyhPB0PHvoULmtXDdCQ24aXjLZSkK+ON6WXg=;
        b=kOmUr3RWFwdGKj7EsoOiDIBhEYNUo7+bnNMpSNRFNHPz9YOMh0r3MdXmKG3UDhNHdq
         vVc5c4BV6skDND/3mgT52w2L3Dajx9PtnJ1n6iG8DH8KOgaSG+04jqEiLF05qR3vDVsO
         BxaY3XwXS5k9WF8UDef2WywpDYwuqm1c0lWyuFKbSCPIU4YcUsPUu/WKWKBRl9yjyx3z
         tWqIRKqrdL8gSNwbpR3n1NoW/gTlccikIhcIFWbX11QEmHRUz9Pi+PwdFh4J+cUtryDH
         q1MSu/d/H0eG3SKESWPgWpqNNBuHOfdewM4fXRoDdOqc6FVTI7oGYAY6vXKpWi9UJUQV
         FYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775497597; x=1776102397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yoboWPPRyhPB0PHvoULmtXDdCQ24aXjLZSkK+ON6WXg=;
        b=HTRJqFJzfuSls9MzvoAa/YOfUv2SDebkHRQZQ6j4WKjRsWPGRL9290sue1indS54V2
         Z0FkApPQZ4ZEsW7XISHEM+xt60GSMKjkzhNv9jvZM+fry4MgNGevScgrQ7swukHGBwfI
         g32183J2Vdq7lEQZzy8nzbrFe+jCRLrDhWfgnJmZsl74d7tUuzCpsQRr1GaDsNbNKZCX
         OBG9DDRLnZ9j9QNoHvig+bU4L4Z30yl/HB1vsTXr+/bW+MeuYzRzXECO40nqcRlNh7JU
         OoY0pLCTpn3T8/tz7NNTe8sYhzFQPjQrJgpzPuqplhaErM65sx+ccIGmSOp/zhWoXEVP
         FcqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJhUNbNbSdCoic3LKihmB1eakZlMqW3DjMc9Knbl906rqSxRTZhaAN8jxPXBKAdoC4YBgQ/N+ZG1YE@vger.kernel.org
X-Gm-Message-State: AOJu0YwgyvGK+jyOapB6Pag1p3+V6frS7HqocH3Eiu5ryvBY4zcPaq6N
	OAI9Xtycs2xcYuRC511OiSbME9qocjUvZfyQ6WQlwL2aUUeenFcOk9LQsP6EkDNDWcsddlyxUiy
	1IbN31EtYDuAAhTzMg9wNxlrFutsQ7I0iHQ1kG7mOfhvhiSiZ3ntZT5NpyK6HLQtT
X-Gm-Gg: AeBDievAdWoMSpCJXdNdcqWX6DNlmMYqj0e7nDtP+peW+T/bfDPbcBS8WxuXAOPVlSU
	cU/PB239JvK5Q2yJkI2PrMMqIPy/NOOQm9UcuKzlPk2iogXob1LczUYO6IICjqPhpUqCj7NlNG4
	mwKNDzn3MTby1IcNgErM8u9yzwLNZmDGevC3SwPM8weaB9SWtxrtdXp+RuAVVn3vseVfTshK4wo
	pbUfMjU9Zt67RLS47JF4y+0YP6QdIOec+yZGM41ESunzS1T75dZ3eDmXj00CdmGHzFwr4S8xIwg
	YMmfqvMsQQeON2yfxaw1tTbYVWGAPyBKDgElTSXHb98xUwTSsaWfxCbZ36+1e9Bs5YfG4FDQa/s
	0ZvPtAYUgOYUbeoP4scEbTXNEtgKCrBwWDUA/N6lpVVpEjgXfPvt9ruVBQXA=
X-Received: by 2002:a05:6a00:1250:b0:82c:daa4:ce30 with SMTP id d2e1a72fcca58-82d0db72ea4mr12253264b3a.30.1775497597052;
        Mon, 06 Apr 2026 10:46:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:1250:b0:82c:daa4:ce30 with SMTP id d2e1a72fcca58-82d0db72ea4mr12253228b3a.30.1775497596515;
        Mon, 06 Apr 2026 10:46:36 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b5f1dbsm15227400b3a.27.2026.04.06.10.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 10:46:36 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3 3/3] arm64: dts: qcom: kaanpaali: Add USB support for QRD platform
Date: Mon,  6 Apr 2026 23:16:13 +0530
Message-Id: <20260406174613.3388987-4-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
References: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FeK9o076YIC_VH6gX3nX473a9z7ninAV
X-Authority-Analysis: v=2.4 cv=Us9u9uwB c=1 sm=1 tr=0 ts=69d3f17e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=xssyCF4TROwZkTjcOHoA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE3NCBTYWx0ZWRfXwCIfKgViQ1i+
 WBjqnqDUY/w77UasNvetU5OozVFCLzQUimPv82zqqmdCVHvlJfr/IlX56+BNdeAKCXN6AcvXZ1f
 mBkpU+lEDjTAg3e3U/dHdKo2+GrFnGXzPMb90EUg8lG+wSEFHH/Dj2r+LBAa8JIImXStQL666eP
 SD81hC5OGErkxX06dhP1d3sq/Zk3BkpKdcK8bHH8V/98xvJLNUlYJ6jULZ+JT3EUJIFC6akEhpA
 faWYLOb0HkbMuEdCLITvM6LJMZ/NFygzaovkJW5QfpN/sRWZ43NKv+EEO1Ead0KRhGM7WkH2VFE
 nSS1N9vUf7SPROOLUMdEuNpWvFundvyobuCNGy3uBwR22cufrwtH39W/qYVWx38umcDFBEqPIhR
 Xpfc+VG45xvBvbYGXWVmgvQYIUS/UDDYqnGb8gkTcYei+5baJerKypV6PuDJ3FoU4fpJrHONWEC
 kDRa8a09imUKlvS10IA==
X-Proofpoint-GUID: FeK9o076YIC_VH6gX3nX473a9z7ninAV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060174

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Enable USB support on Kaanapali QRD variant. Enable USB controller in
device mode till glink node is added.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index da0e8f9091c3..55d02219ef4e 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -744,6 +744,11 @@ led@3 {
 	};
 };
 
+&pmih0108_e1_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_1p8>;
+	vdd3-supply = <&vreg_l5b_3p1>;
+};
+
 &pon_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 
@@ -816,3 +821,25 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&usb {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_hsphy {
+	vdd-supply = <&vreg_l4f_0p8>;
+	vdda12-supply = <&vreg_l1d_1p2>;
+
+	phys = <&pmih0108_e1_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l1d_1p2>;
+	vdda-pll-supply = <&vreg_l4f_0p8>;
+
+	status = "okay";
+};
-- 
2.34.1

