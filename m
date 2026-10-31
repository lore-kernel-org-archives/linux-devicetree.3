Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453028;
	b=KuX/hW5c0++/H+q29G9Xwzw1jDFeEnJ+rxrBUudf19A9zifwni1fmIppA5bqQCxNf78d
	 gxygEkiMQo0RIOaklXmB7qHOJB2qJQiwnB1D+TB44JSsWBziIeSqsbaYYNhyQ7kDsTrRU
	 mtrhfpCUvzzHx4VHNQn9pbl22kbFvHyG2DOoSF9nWe8mk5UAZMqhcKmOkMbFgUpG1zyy7
	 0Xh8fSpAV7av8EzAkDOo/SWFne3H/0ikStl3vaGNYAxwUUFofva0U9UC7lMDlbKb/SmGx
	 5smlYw0Z4veG/gScFRBDDVBd1LIi6FGDOb4RXEjfrfETW0cqMOi9TZqXU3A8mzDS1kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453028;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QK/sB9dSAJ/2G2Zrti3sXc4ovzV/2wnifjT8fx0zQuk=;
	b=bhho57A4e8o5EoIvxUP7ABT9nfYcduSxhab8V6TB1Cv+Xgts1zL3Yc7L3ajFO3d2c90i
	 iT9NUKxqlo0Hy0r9AJhqOhbGhir11D6w2ku5ORrTlMteMulxvtmVJIhfBFTyUkRieRQ3V
	 FRQ0PWBtpisugwyykyAN+T39Av2/dgrWJ7mnAaqW8Xz7PE4SX1M1S1XWMWV1DjwPOoay4
	 lh01h9GdIiR26voBGZ8aVuC5QsvhQcho1D2Z8wlquxYHLItwgSzynSGqMdIa7Co7ovo64
	 gJgFjQc9iAeUKddzuZGUPgckWu9rh0YAemm0GyYAwjowSZACD7Cdet0cTjIiQmbA0LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAiH6qaW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K94VOunY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AE0606A324
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99AE0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAiH6qaW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K94VOunY
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VCxxPZ1232676
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QK/sB9dSAJ/2G2Zrti3sXc4ovzV/2wnifjT8fx0zQuk=; b=DAiH6qaWy3OIoFXK
	tjVtIZQJMMM3ei6OwfCf4EAUNyUcswW+pMQ3QXnvzl1y5jRjxg6miU3yhBdJmScY
	rrMXoPwcY1JjK2a8MYTqaFyDTT0hkRw1fCHbd2GdHhV/czB0pv/xe09CfqLlJsuD
	ltQNEB2UxIUMrvzhbMH7MRZxEXUwIwHxxUgyDLeeofAim6FIXgP1GtnWvGros8QJ
	V9Hoesmrozfe8mQgLlEu+TX7RZQ4LfsVSmU8YOIRuq5Oa6oHvSh5hAsYPbRSZJKm
	H/cHbzGwZCzDjDJW+6Z14zy+je+E85A4ZZfJxmDlpUoeQpYKUKJc92s6jo/Et4oA
	I6zwSw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9m98yve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:23:46 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a26fe9521so2511548eec.1
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 06:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793453026; x=1794057826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QK/sB9dSAJ/2G2Zrti3sXc4ovzV/2wnifjT8fx0zQuk=;
        b=K94VOunYFCTJucjPgXdzzsE1i6nKnoHTpICFaG0+o72a3j+IdhQ8ITjJiKoZ3JLCCU
         c0Nbd7b60tGtkGbZXWS4nREbu3TnddXR72zquVuHjB8I53KPsqHPXp0geLVAiy6RnCmQ
         tZl8kQ9c/zXejB4hPsikFgemTX8y38DeV/oIxieEV0UVAftf7swrfdnEuh8VkaeahYY0
         D1e7QlNXKxJk6nZ2cZBg242thMw/rKeHdW/96aSHNSRQfyrFqBSmpdU3VgRaERX7+X/L
         UZSuvwLtt1lbNdLhgy0x32FFptYcze7FZ7bZ7Cos95kjdAWJSC/5jHqj7TFYeEkzLV0p
         blJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793453026; x=1794057826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QK/sB9dSAJ/2G2Zrti3sXc4ovzV/2wnifjT8fx0zQuk=;
        b=RvalFRg+kC2IEGkxH+r2Iuj1fZpLOUsR/2vBTNk5fWtGB6VXSOH0iVPQxKwCKJMb3A
         Ht6ZAuFXvdJ71fDItp60MH5LV/mn2QrG489LSzQJJ+YwH7i46DZndbqURIKkylQ7yKjY
         HzRlhkG0gR9uaCbRV9gE9aZ7ZDOoMf1Qe9YBzEoOxAelMCSRP7Fck+HHBQXynVXtmgG5
         XJFg26Wlu1mOTZcPefzQOJM7uQR6YTqrt1EYlTRYpLmpJd+ZWvm9v68Xp0FHDWX0mtM9
         DoXGubXCCEbpk0BCqA+YBtZDYwGJWjEdAvlm0ghABS77RerKsMmFdOLisoojjfLyxnHh
         HFxw==
X-Forwarded-Encrypted: i=1; AKwUvBxEM2e7pncazSBcmwD6Kk9DXkFg5pkcZoarMiGDTEJRCxN4od20YrlqaL8qO3B2WACRfLyZWliNyzeQ@vger.kernel.org
X-Gm-Message-State: AFq9FYIosMJpOhPa7yhAy85+htf1l2GGbc9KmnO8yaHzGfWOqT4PoVhB
	zWKNU7Ko84dekInkXYD0XjDyn9o6TLUlLFMrErpfXHhGgi2en3HH8qsoOA22yeO7M7GgfElQPgL
	SgOtiCBt7F/Z6FYR2GL462eFYaVgsGc30F0lXxSYSltYXFu4DjpCXIPdP6x7p6gAu
X-Gm-Gg: AYBFou0K6XWUA5DZIRldLlpkDSVeNYVy1xpkBlrGjjld67/XznTTwqj1uu53DIru72k
	SgPQ2QoCJutry6kODxMH0mg+LUs14PI/HRZUhb+MU2BbQBdeO0CGDRKBaBQrBf0G3i8hOcpDkaR
	uUm634Ke288wxHqkwqI56+cwmCjeSki6CHJyduIhNsmEsQEp2MXRgEaNJgt9MfKHy83OU06bhLy
	hx8l8zBBEBMuc2qIatPBcD599LzLczVSnwgUg5bCEU4tp1RQICr5R1sf/YdzAej21NDFeCD72+/
	nunon6vhOoQL5lxoKGfsGmJwSSubDXJtEK9HOkOAEARNHXY/xj7dwla9dFDHExwpaknIcFhVVHv
	1gZMaoh0UiH8iGP0RzzKFndzcD1tVVORXb0MAgBlt7GEPqB8WEMlKCTDaRDjUHIwh+GJ70TP1sY
	S7Yjw=
X-Received: by 2002:a05:7022:619b:b0:144:eb3f:563a with SMTP id a92af1059eb24-1a9497b9d52mr16175352c88.15.1793453025787;
        Sat, 31 Oct 2026 06:23:45 -0700 (PDT)
X-Received: by 2002:a05:7022:619b:b0:144:eb3f:563a with SMTP id a92af1059eb24-1a9497b9d52mr16175303c88.15.1793453025137;
        Sat, 31 Oct 2026 06:23:45 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm18234699c88.11.2026.10.31.06.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:23:44 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 18:52:51 +0530
Subject: [PATCH v2 5/6] arm64: dts: qcom: kodiak: use thermal hw-bin trips
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
Message-Id: <20261031-thermal_bin-v2-5-d76fd073ae98@oss.qualcomm.com>
References: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
In-Reply-To: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793452983; l=6059;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=zx/+KrnPBXqW3IXQIcYA1/rGyuK8dpGWYkITAXNPsCY=;
 b=landNCcP2nN/nDJm9jEwbRau0/QrQklY7co+ps2J8y2O/5eYr/NHeZXlWxOMXFTITaO7Ec188
 lgLUtKStI5oCbtZuCH6veO9WX5jrTp459fVs3SQ3tsKgkFER7dO397L
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-ORIG-GUID: 54lkpgBFK6R8FFa2QgwBelwZ56VfvXhT
X-Proofpoint-GUID: 54lkpgBFK6R8FFa2QgwBelwZ56VfvXhT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX7sdr5j5/duZr
 AqOJ7BO+W8bOdVGchl+TZjtd9xfRekwYE7SW4Q6pg1W5tjlHOdEASxBxSg6wH0wOuhZN3U4X26K
 sX/ACpvu7np+i4bb0pZ6t51778BtWy+rvh+U+FIhfl1wu7xJp9PhVPBkEepLIuKzs1+Q2fgvRVD
 w2hm3xg5qOYpiM9PWS6fHqBV6cimgXeJf6qX5p9YwTm3bJkaH0TDZwY4h6LmyFdyXmZteqZLRF5
 sH0hHnqRjpI8ybZu+VCgjIewqIXcfABXNXHqReOsugg+xuoaFxNFk/ZVF/Ucw0chbNV8HIzyxbC
 7xWAaHccwfVjjt/qxuJ7YW9yxJh4qObSyj389dXlgyVMKZ/1GMdVucEe+VacN2Zjqfsy+Wj7Gel
 GfKVC18wySHaf5dIPvs5pFw//snJTA3JbFt71QMimGkq5PF0HIc756QHHPVKjAg02A4qTSDKqQO
 GoNM4eu2CeQ/nKxCjYQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX7FL6kzga7kIp
 E4QTcXL6UjH48j91RlOsnIOvvMg0Fwo0tGy5WlsV9f0a90CsYO8ZLiLBLOj3DqUqdanBwpfzbmO
 lwHTCSAi88s3rsyzb4VcaGPyLdhKUUo=
X-Authority-Analysis: v=2.4 cv=cfVHPXDM c=1 sm=1 tr=0 ts=6ae5ebe2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=PCFpqnHMHODqJTmB6Q0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310053

From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

kodiak-based SoCs are binned at manufacturing time, with the bin
computed from the jtag-id and feat-id qfprom fuses.  The tsens driver
now reads these and feeds the resulting bin to the thermal core, which
selects per-bin trip temperatures.

Add the jtag-id and feat-id nvmem cells to the tsens nodes and convert
the passive mitigation trip points from a fixed 95C to per-bin values
(95C for bin 0x1, 105C for bin 0x2) using the new
temperature-bin/thermal-hw-bin properties.

Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 58 +++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 347815e5983e..b984cf47b70e 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -1019,6 +1019,18 @@ gpu_speed_bin: gpu-speed-bin@1e9 {
 				reg = <0x1e9 0x2>;
 				bits = <5 8>;
 			};
+
+			jtag_id: jtag-id@180 {
+				reg = <0x180 0x4>;
+				/* bits = <offset width>: 20 bits at offset 0 */
+				bits = <0 20>;
+			};
+
+			feat_id: feat-id@180 {
+				reg = <0x180 0x4>;
+				/* bits = <offset width>: 8 bits at offset 20 */
+				bits = <20 8>;
+			};
 		};
 
 		sdhc_1: mmc@7c4000 {
@@ -5782,6 +5794,8 @@ tsens0: thermal-sensor@c263000 {
 			compatible = "qcom,sc7280-tsens","qcom,tsens-v2";
 			reg = <0 0x0c263000 0 0x1ff>, /* TM */
 				<0 0x0c222000 0 0x1ff>; /* SROT */
+			nvmem-cells = <&jtag_id>, <&feat_id>;
+			nvmem-cell-names = "jtag-id", "feat-id";
 			#qcom,sensors = <15>;
 			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
@@ -5793,6 +5807,8 @@ tsens1: thermal-sensor@c265000 {
 			compatible = "qcom,sc7280-tsens","qcom,tsens-v2";
 			reg = <0 0x0c265000 0 0x1ff>, /* TM */
 				<0 0x0c223000 0 0x1ff>; /* SROT */
+			nvmem-cells = <&jtag_id>, <&feat_id>;
+			nvmem-cell-names = "jtag-id", "feat-id";
 			#qcom,sensors = <12>;
 			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>;
@@ -7136,7 +7152,8 @@ cpu0_alert0: trip-point0 {
 				};
 
 				cpu0_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7179,7 +7196,8 @@ cpu1_alert0: trip-point0 {
 				};
 
 				cpu1_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7222,7 +7240,8 @@ cpu2_alert0: trip-point0 {
 				};
 
 				cpu2_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7265,7 +7284,8 @@ cpu3_alert0: trip-point0 {
 				};
 
 				cpu3_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7308,7 +7328,8 @@ cpu4_alert0: trip-point0 {
 				};
 
 				cpu4_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7351,7 +7372,8 @@ cpu5_alert0: trip-point0 {
 				};
 
 				cpu5_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7394,7 +7416,8 @@ cpu6_alert0: trip-point0 {
 				};
 
 				cpu6_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7437,7 +7460,8 @@ cpu7_alert0: trip-point0 {
 				};
 
 				cpu7_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7480,7 +7504,8 @@ cpu8_alert0: trip-point0 {
 				};
 
 				cpu8_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7523,7 +7548,8 @@ cpu9_alert0: trip-point0 {
 				};
 
 				cpu9_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7566,7 +7592,8 @@ cpu10_alert0: trip-point0 {
 				};
 
 				cpu10_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7609,7 +7636,8 @@ cpu11_alert0: trip-point0 {
 				};
 
 				cpu11_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7724,7 +7752,8 @@ gpuss0-thermal {
 
 			trips {
 				gpuss0_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7751,7 +7780,8 @@ gpuss1-thermal {
 
 			trips {
 				gpuss1_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};

-- 
2.34.1

