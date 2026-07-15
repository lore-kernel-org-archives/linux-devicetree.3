Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EB93C2BBA
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101373; cv=none; b=iXwBF2sX3v2NHOSEA9NRby+ubpOoUk+gTw9fk5oDE1eV/dPm941aVqau9J6MtU3S6QMyBhb+U9ocDopoK6t4AUBvgTC+MUeMGXfpJRJ5ap7IRlMqwetDSwpo8weV4JuPqH/Sv7ARp+tS9GhDWE9iqoRYP+gdEgTTMQZTSqYOodU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101373; c=relaxed/simple;
	bh=i9gyaCSGcZOLMFzpkX9pMEGs5t8BqZLpmvcfMVigjg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sBcZqCMx/MJ/1i/OY2Q8MTDPaeGgsdV3T6uNWj1NPEUqMecLu7TmJ9963eFMeU0Q+7e/IClETI2hHkqJBiDQn0iwdcDClYFYwx79Va1TWstlr8okKJbPCw0hKHl8NcbS9l5arWeh+/PbCF6td9sKLIN7twDR+kDG15R68Y+WjDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=amcVyqUO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GBX8p1HC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="amcVyqUO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GBX8p1HC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3l1uB2372497
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jOr7lTwFEygp+BaB9Chwl6H+KHehijdYFWbNkSZj7CQ=; b=amcVyqUOPUfa4hQL
	P6+jQjYgf1M8u8JxUpu7+FcMJGeOm6y5Gk54QelWApI8+Y+8LAxEAJuQ2aM4Ye7a
	cIEruMpZmuM5bGqr+T+yn/WHAHAEwV4nBsMgKrOwqd5iCy4I25khZ/YBdRZlJ0OV
	XxHV47IILSE+2hiCFLmEkgur2t6dZFJP6f1XyezD22gud1Jkn/MzVe+tlEAgxL2y
	RY+zuHCxJ9kXcHLjZex+9i2HamOuEfzGq56wuzSf57VEt1dFs7u7jyAFpxRVGK7+
	L2YLflKs5GXRYf44iaMJa+fzrmaz5VXz9D+HD5ni/oX8V48XKV7Op0OlBfRfNXCx
	wUdttg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmkk3w63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:42:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so7697256a12.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 00:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784101371; x=1784706171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jOr7lTwFEygp+BaB9Chwl6H+KHehijdYFWbNkSZj7CQ=;
        b=GBX8p1HChZyJwqi78ocIc/1Gng6Ioch+Q+1kGSUQtuxM1VeeJtJPklbYgVXVMNKJGG
         M8rout0sTXS/xvIerw89QspmCZLpt5ziyPta1lV57ejDAXxfKIHiTJrcPss47Usc1AT8
         EzApT/a3VP3HpCakpamga+SzCco1twW3tkGAFYUs5KqyUnz3N6ynnjAr8P/IdFKqh3Jh
         U1ajijefVL9Vtm5P5dE8l9yZZe0qrZRh1cM4qeSNYdxBva158gFox76mt1G/rqntQwIz
         s1FIEDpx+u6P8uI/654j42loYpzF/yBlEtjUbFoHad82wWGEwVppk64k0AYp2jzzidK2
         f8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784101371; x=1784706171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jOr7lTwFEygp+BaB9Chwl6H+KHehijdYFWbNkSZj7CQ=;
        b=f0Nzu1H3Y+f2c6i055ihpWy6nJvp2Cq5g6N+gQ2D5i/l/pG8pX3n5eYX7M/SL1B1/+
         losr5H4uPZN+/DEYKtFj5dIihbkzSyqY1z9dCWxK9IDamKp49EHeoiP44ge0mRUN9Ti5
         SHgyR2XI7RLQdnJ3q/LYzL1aJEARmX9vN5e24Br0aOX+Bfw9R3BqeQkMiHYq5ZxkeCDs
         ljeOcEO2ASIfRfWsgVRKcs/rwaSnU/GHhHCd877mYbY40RSpMnHx7pNwDN7chEKkXRly
         8emlbwDRxot5545ksycLs+SfFFJCi2CVoZ1e7ceRmmvJ9g7FapXgDJv0z/GbOxPWghUf
         Dr6w==
X-Forwarded-Encrypted: i=1; AHgh+Rpko887GE3xNyPWl2sEeDhxgvMhoOazKkLG1cmmpzawOoHUjLSbb8kWDTpXfQ7IzvCBrawoN1yuBCAR@vger.kernel.org
X-Gm-Message-State: AOJu0YxOxBms5NPA0/SNJFKhYgdzXn+Cw8ysGNN/xnjKFlkACe8apsPZ
	xVddKXzACQsRIrhE3VjRg3Il6tpitBY7bYA5Y7e3kD7CGNWIsrZJLshdbwWqWknRYkj4oQ3xEeF
	UWy1HkN5i0J3R7yTTD/3crBzXs0u4j0SEBHx6KS/ljg/yX4fpHTc6hdgXCwG1ENn7
X-Gm-Gg: AfdE7cljRvhsUonGmfBWRS0ZtwWQzf+KP1cDvbBKtW+/oAXjpO0xDBa0R6AypA/Wm3U
	kj4p7yw/Q/tF5SwI+ci+RKMTTntj+vKqjlfPIpeLjd8vZku6ZvIzFFmLtlpElAd/pmmn4X24SAc
	FBatz94BchSo9pEAzYs9XBGzixMWbmGdz42ppDMZ4tEqQeIG+64DsYlg684HL9ipfLl0K1fWbVV
	rgK6Rq8F9EFOhxE7z2abHMat11MiruJTD9dvMfYzR50chZk1J/ZOJQ51h8hZGoucV+3rsSAcR3P
	oCHXqCkLGfJxcUSSbMsWmr7iQMMOATcJe2hrrBFSstX4hS7gL4NqNTKagEWfkwJvxVzrU2x2a9J
	ylDQDATZaeSEteOYX3Bf+hysegezgqw==
X-Received: by 2002:a05:6a20:3d1d:b0:3bf:6acf:2940 with SMTP id adf61e73a8af0-3c357314336mr6411737637.11.1784101370730;
        Wed, 15 Jul 2026 00:42:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d1d:b0:3bf:6acf:2940 with SMTP id adf61e73a8af0-3c357314336mr6411710637.11.1784101370304;
        Wed, 15 Jul 2026 00:42:50 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d58e8sm10921751a12.2.2026.07.15.00.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:42:50 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 13:12:22 +0530
Subject: [PATCH v4 2/4] arm64: dts: qcom: pm8005: Add temp alarm node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-shikra_adc_support-v4-2-5e07b6d21429@oss.qualcomm.com>
References: <20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com>
In-Reply-To: <20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784101358; l=1710;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=i9gyaCSGcZOLMFzpkX9pMEGs5t8BqZLpmvcfMVigjg8=;
 b=0fyoYofErkURLnaZ8n+sUr8k4DItYHGG4jF/4JxX/F8C7UbMul3/jnTdF9mhbzMIz02C9vOLh
 S6d3Xml6ywwDnVE9zQZiv+StQADUf+UnZQ+6GwDSN3CetK+9XHMPzLP
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: HRFSZtIER5I1fWmW3Wq88er08L610W1f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3MiBTYWx0ZWRfX080K6wZ/POI2
 hTQT8ddyjfDt2bMxV7SEuhQExa4EZxTK5x0eTD5yiu0xCPSTTVgPMn1L3FUYi8JgpbJQTJ3EVH/
 xkX70MK0EcA8AgUB6hxzDQ3U7ezvoxOCpUb8ievpI5KdZDEQWp9Lrx/7Pd/twPQq23j84DAX7gZ
 rxwxG2Fu6cV/o3rU0CjtDUShCP1WRC4Oix4rUz8FKQTbc31XuaZhrNV5WGTkpFglkCnsdI+xON1
 V629h0/3g90Z5+j8qGTmJs6gErEVZUzTYvn8zwFPl2qdoWcUDeYs4sk/NtuqswUJK5aoS7ZlmRf
 eOpX84vCOPuypKwkzdgieUU7EKvKDgqDsxWWGBbgF6h+q72AYocCZ0lchXFtknbz4tr3rm1wt0A
 fdxPoDx8V/GVQolHyJurZ/M6zQYCvsn2XuDsQvrQewcfhRtOBmfwcgKfgW0zL3sYLd/hCTn9tC1
 ggjISZHw/7tVi2ut5Ew==
X-Authority-Analysis: v=2.4 cv=NszhtcdJ c=1 sm=1 tr=0 ts=6a5739fb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1cSftZPrRki1B16PJQgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: HRFSZtIER5I1fWmW3Wq88er08L610W1f
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3MiBTYWx0ZWRfX/KYoZYcRmHm6
 o0/KfEqrKM1XCj2q5gl97+m8uErWGXIlXzB9xJjRxHk5Tlx35e1VWg8oBL6KWuPfclwyW6RtCbo
 0oHa8JWDkTWZoga930232Rt6KWDXGRI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150072

Add temperature alarm node along with thermal zone used
for PMIC thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8005.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8005.dtsi b/arch/arm64/boot/dts/qcom/pm8005.dtsi
index 0f0ab2da8305..ce31a8545020 100644
--- a/arch/arm64/boot/dts/qcom/pm8005.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8005.dtsi
@@ -4,6 +4,34 @@
 #include <dt-bindings/spmi/spmi.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
+/ {
+	thermal-zones {
+		pm8005-thermal {
+			thermal-sensors = <&pm8005_tz>;
+
+			trips {
+				pm8005_trip0: trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm8005_trip1: trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				pm8005_trip2: trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pm8005_lsid0: pmic@4 {
 		compatible = "qcom,pm8005", "qcom,spmi-pmic";
@@ -11,6 +39,13 @@ pm8005_lsid0: pmic@4 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8005_tz: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x4 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		pm8005_gpios: gpio@c000 {
 			compatible = "qcom,pm8005-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;

-- 
2.43.0

