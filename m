Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB4B423A95
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 17:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655209; cv=none; b=Yw4SSLMfyNouvFHanKCcxba/ycb2IhFALcLgptlS/NxQmKjGzRxcMGFfVGhaxSIlDuWPvssUZTLq7knG3DP7YkFAg8w2RK99xXOsV+iB6g1hHRLIseYreoJBaXHJuKpfdNH/OZcoiK6BRUN+0HiaYfNX04Rnws+iUayGqCyic8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655209; c=relaxed/simple;
	bh=Y1WK4FOxLS2Z8JGTPQKxCLLaX1hY2Z4D8mCYOE3lAX4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C936cE4MGFcihhRCAva8/7I1cCkW37j4Fnw3pAdMv4jajtcvvx2kw9mFrso9V04CW6TDljgufuXufO86bWCFBcKkEX1ggX1QiyrAZyLiODcvRQZ6ZGzX/P+Vhn+2NU1TUv8kcr3bgxl5YqFCOFVBHkJqwe655KQ2jn1cC2rI2+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJ68d7ec; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JHxT3As9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJ68d7ec";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JHxT3As9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLW23497912
	for <devicetree@vger.kernel.org>; Fri, 1 May 2026 17:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=X8L41HTjzwq
	EAHHTicu9WDnxJN0Uofe905/Soc4E8Ak=; b=JJ68d7ecr92fhgl/HWK/jDP+OHC
	6Db4pkn+9aHdJUYi84pIFOP2QZMtTpoxPPAhjmA8Ge36aVkWLPDDDQQAxUSjt9O4
	KCqtRStv173QG0nQ58qswXJ7lkkuooAKI26g5XZIdGL7T6LAMZ1PfnHnrm3TmScK
	x1abk81zRyPZ18SiFn/mg/w6MYm7r5OnU4KQuHYafXaqiGlcH1JHsSkTVNK67+xg
	TVYYcEXU3VqwZMf2pEAuv8aocNs8LXaTPCpfBnR4G6aBTfsTRiMcWrmUoum8yhqP
	O80aYu9/AE89+D6Ipr9F5eLvyqltCAofhbiXkxuaze8amuXBKacpobUcP8A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvchkbc35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 01 May 2026 17:06:46 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c35f2c09dso2905065c88.0
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 10:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655205; x=1778260005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8L41HTjzwqEAHHTicu9WDnxJN0Uofe905/Soc4E8Ak=;
        b=JHxT3As94VHYIqFCzxd889OfCbA47FVKKm0mA1IHm5fj3/WqqpJXjJhep6/hAklsBx
         Rlog9zcQGIHaEHi75XfAyGzKQJ6iPxynhXCBsjigpA8Svm+dxU1tuzjpa7mh3hkHU3Qe
         FsKBF1l8wm/8ytTQt/+uEBTmORJcZ1a7INQmaUrgLuwL7HYLfWYZSqMl5x++opoEXUt5
         oAKpQrV/Xu3DkLrGoHfZoXh/jBg1cHgbJmfAlu6mkfxehVp1ale+yLPD2wxyQYoqBXBe
         149kpRrUcSnbJa2fJkyG3F/c2uyTeltFVfWI1h0eW+i+J9D2U6t4RUyM/5gVMcAHx2a6
         iTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655205; x=1778260005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X8L41HTjzwqEAHHTicu9WDnxJN0Uofe905/Soc4E8Ak=;
        b=NN1Rf8DX4iRQ+Ljh65YPCS5RZNdmAXg/tJhILhYe8THvfDk1qNYUo5I1+KnMS5kduP
         V5ZRTI2TtVwKl17A5xCMdtsnv6opt43EvqeJCsEJHkS8LbaVLipnjpDlxVKBH6qTGMxI
         ShYlO08a9sfMtu5lCPSADmDHK0qA7Rl1Ma3xIq+URi/eyeCw6bY3VANhGF33IUWgJPkH
         UbDeIkcJ+Fc7W+TW8b5163v0ng/qa1murojeRttLUXuUdA6ZJX1FTyR5+04DbDE0LXxe
         vWT8WN0/GK50NsML6+Trhzu1wMU2KxoRGru57MEda/bVRJF2dPVvNCn6l19PPS9P9zAz
         GalQ==
X-Forwarded-Encrypted: i=1; AFNElJ+rAv/Gkmfc8m2UJBv+MDu6UG09jcr4jH540LHQsWXNzTDQ9PbuAvs5lixeP5UYPDRzV/zlpEfEWW0K@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0QBKxgHSXMYg/z1h6WMw8uEZBydIrJ5kQy+8+yYZGaLMqIUwE
	4bZg+rYdReVBA2IFpKiADWZndcDez8jiQ13/imxONIpZM1kxgzbKQYMuAtau+V3fx+RINGj/LfY
	29t7MtBnH6UsZVyp4ThgsuRHgxRFOhnz+2i9vD+rkO5xPcCPnkdXBU/DJFFPXDrgI
X-Gm-Gg: AeBDievXF3GXQtMuQgATlZB0I1rN0BEyQ1cPs13QKX8bG589lwf+TNAYDZREjk3Wb8K
	AAd886zJrobrvp+e2PUJGh123w4XUdkxdXvWeJDFeLw4uIp+CHTgJ6XsdT90JMLNp8XbPqnSilH
	qn/86HRTPEJg36Bdge2p/h6EYcfSRF7mqFmLIk6BJZ+/73kpAtIgvy04JSjnwgS2T0vMjbSaanW
	nYiLJjbIdW9cLrA7PLFXwcXFqxhrqhXE/1z5JtoUX1bMFy283k2c+KMaxexVHCEFJHY5n8yklfK
	fEW3XuGao3aFlVEZgdvMN5t27gOE6L9njMGtVSJ8U0sUpKOM39RYmQ/huwcdy5HBlBjm3aWjJUb
	zrSod7NqiBndcumWcsRCGazg7L76e39oHpDjfVVLwQp2x7tyXbTLG+ydkba5OAKhfjm2yHKPumf
	3Ux9lp/NgFRw==
X-Received: by 2002:a05:7022:6187:b0:12d:b2e9:b20f with SMTP id a92af1059eb24-12dfd821474mr50084c88.21.1777655205167;
        Fri, 01 May 2026 10:06:45 -0700 (PDT)
X-Received: by 2002:a05:7022:6187:b0:12d:b2e9:b20f with SMTP id a92af1059eb24-12dfd821474mr50073c88.21.1777655204606;
        Fri, 01 May 2026 10:06:44 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3537d300sm6655978eec.0.2026.05.01.10.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:06:44 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 8/9] arm64: dts: qcom: kodiak: Describe EUD UTMI path using child node
Date: Fri,  1 May 2026 10:06:34 -0700
Message-Id: <20260501170635.2641748-9-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OCBTYWx0ZWRfX/RwtdLffMyjm
 cjUnqpGxHe07YYt1Nj46QKDKqozdYIbXWpKKL2DYAzbgXw4KUGnvS533xBKORQHaZSChbdAADaG
 OiSGCwNbrhkn6lbQ79bjmK6qg1JRuNgcaHBdIg5LS6cmMcyDmeIxxS0CWQObrx56McP4S9nwjZt
 LyBLtjczn4j1Opm7e48zLHibwZptcItN4PtCU1s7xnZQnokg22DrauFqrhWTHuy8suWTTSLBqBR
 RaeBS+WTeCEXgOgrquCIu4oThB7H4PDKNQcnMk+ckmkcgQPy23+19/xrTUkmhoH0rR2LKBJd848
 BcC49LsxJIx0+GxHsdzTIJrPuzFLvssZl7MdJlpPjtMTv3z7taY+A1XvOESQhhUUvkAfwWTWKHy
 +bNmecmjCFx5LkfuKVD2roOg/tOLcB8v2bTt8kLX6uT0qkGgOpv4ifh9EJMS6tOSfajv3U+PaYF
 NvLCbn+jPeQ8M0QTgkA==
X-Authority-Analysis: v=2.4 cv=Zdkt8MVA c=1 sm=1 tr=0 ts=69f4dda6 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=-Y8wEhFFMILef-Bpc8oA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: kSqDrSxnnGVWzYHs_il5Mq8zFAHk67yB
X-Proofpoint-GUID: kSqDrSxnnGVWzYHs_il5Mq8zFAHk67yB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010168

The existing EUD description uses a legacy single-path representation
that assumes uniform UTMI routing. This was sufficient for minimal
configurations where the USB port operated only in device mode and role
switching was not considered.

Update the description to explicitly model the topology using eud path
child node and add a role-switch declaration to reflect role-dependent
UTMI routing. Also on this SoC, the EUD hardware intercepts only the
primary UTMI path. So remove the USB endpoint mapping to the secondary
controller and associate it with the primary controller.

With the UTMI path now accurately described, enable the EUD by default.
The connector side of the path is left unspecified, allowing board-level
DTS files to describe the physical connector mapping.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 35 +++++++++++++++++-----------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 988ca5f7c8a0..cad1d78f9e62 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4400,12 +4400,6 @@ usb_2: usb@8c00000 {
 			phy-names = "usb2-phy";
 			maximum-speed = "high-speed";
 			usb-role-switch;
-
-			port {
-				usb2_role_switch: endpoint {
-					remote-endpoint = <&eud_ep>;
-				};
-			};
 		};
 
 		qspi: spi@88dc000 {
@@ -4729,16 +4723,28 @@ eud: eud@88e0000 {
 			      <0 0x88e2000 0 0x1000>;
 			interrupts-extended = <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;
 
-			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
 
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
+			eud0: eud-path@0 {
+				reg = <0>;
+				usb-role-switch;
 
-				port@0 {
-					reg = <0>;
-					eud_ep: endpoint {
-						remote-endpoint = <&usb2_role_switch>;
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						eud_usb: endpoint {
+							remote-endpoint = <&usb_1_dwc3_hs>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						eud_con: endpoint {
+						};
 					};
 				};
 			};
@@ -4965,6 +4971,7 @@ port@0 {
 					reg = <0>;
 
 					usb_1_dwc3_hs: endpoint {
+						remote-endpoint = <&eud_usb>;
 					};
 				};
 
-- 
2.34.1

