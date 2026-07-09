Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7F83F39FE
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 09:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590282; cv=none; b=QgMIrhDSBoOep9tBmPRsb64V+mCJKwWt6z4H1+gSUhjLp9jr+zCJHBv7N4vZIH1k00iK02QtdiJreMNosT3h2gJG1wFh6PC2aUKiH5AIPF8+IgxvP9TvPDgLMzJ/OckPspQCuDhlz8l0zOIUUqjB/EC/q3NdmjCwFcV7GmzbMcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590282; c=relaxed/simple;
	bh=BQGgbLfMl6tLJ37KwhZa1C5lBH005bZDh0AvDOmBwW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jyiuG/1svzOctUO5n1j4hMsNURDBLF7XeBM6WYuCZl+rui20UE5dbBKOWyRAjNJh6/NG1Its2QtosJerLJRavcPl3xeiJ7FsYQx/eFgloq5QPGEHe7xlMxoC4KnHzNgypI9sS5ocm+349800wYDNnKcKXPRuc+GWEJeyY+7KUSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UwYpEmxr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DyXtXCqq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UwYpEmxr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DyXtXCqq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960I20972678
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 09:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Oz0dvj1+OD5sW9/RQ5AWJU3MfixxzTPnJDPz3kJ+Vw=; b=UwYpEmxroPsqOZ+P
	UjVhHpbtWoURnrBOmDZmcFSsKuqc0sqnKOLxO8VdWgycacO378PwFxflt9/xaF9J
	AKUr9iCqnn9nMamkYZ9WWUWnDZaWlAzUGfNiyoIEcbdECQMOPHxMsDR7T/vk07GZ
	7kpvZbtjf+t1gbyI3bjEd3LzjXhT8RpzCpp/3+CR7yoNWOCPiFOfFHQQzNkJ0/Uq
	pcwzN8qRFP0OyQ2kUtyv67RYvnjoxGCDot2EvLzzvePbPW1dgC1X+BMqFzJnauLX
	FKrLnO9UJ9MusD9yps/Xs5JXDbkh7ml2JouPmiJnxSlh2Fg++d+SIpU6whtY3bzl
	CXyE4Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vu2d6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 09:44:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8895156101so2529573a12.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 02:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783590277; x=1784195077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Oz0dvj1+OD5sW9/RQ5AWJU3MfixxzTPnJDPz3kJ+Vw=;
        b=DyXtXCqq2zp/NdeISjhgz5yJ94oW6kEkX146hY6gCWSoKDEUKK1Q01xU0sEXP7oh6y
         dtqDZw7rlCHybUWHz/p6m48XJ9alP9m3abtLp5MrhnH5nOVbW2Zb+lZ+5Fd1LAng4i/3
         wnmLfbjzvFVj6SV8EiqNXYhQdZXY82acsrpUCqmXQJHfcGoYk0IrL7a7UFSVIdf83eNu
         TA6gmRUghyEJob9xPzHTzl/o3jdAVEhuarprYjRqUwehkCYTeQIWH9QfzYKkNBKL6v+P
         GGW2QDtuuPVA3DTweuD2HnKLL+TV14mJNExTGUOMwZ7sYDX3rqR5Vq+CnNjiHhB1aWhS
         2LFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783590277; x=1784195077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Oz0dvj1+OD5sW9/RQ5AWJU3MfixxzTPnJDPz3kJ+Vw=;
        b=LaqmWUIG9AffqY7g6IGme2zww32eJNf1FL/6vs2qzJr1prfq+MDr+23d0ZyxIPYtAb
         TuVPStLdK3JT7jXla1FCRGZSEIsqHire/vnAiLQD4EV332iU8J1IjWh6TC+UqZjL1Tv4
         X5yPlv68UHQ9NcUiKoHvqQUUPMGwWafYpx0rOvKbjMEiJ6jvj2u0tSutyj2SjnCF0L00
         jwcYre2KDuchEho0CYRSe3MyywifSa1ZPvSunToDBZUnwyd4YWmmicTF2SxE3kV9MisK
         99QGrc2onBH5Vk4ERNvEMm6dBZkyu+M6/izcBYAm9as+WVmsnEHv+xKkRGGlY+xbWjTK
         ZZpA==
X-Forwarded-Encrypted: i=1; AHgh+RoEq656tI6GVLWPI5nbyEQ7M6KjpWGS8w9rImNhxTiqq9yVQLVU1saA7jR1LJkLvRLvwDyssZv3adqG@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi3c8dm6Ny6ewHq6kbbPxmnonfjV6vz5XwzWqO++JnmqtcK7yh
	k/CuM6P42MZDolOGBpH8Z7v0VAZc+rewK5sllvBGuAgXQ/UImElK53IDHFu1CYWwbeusQw4Psbp
	RT0feW14BMwvZ8KklIJAvrVQGbPv7gNd15TYoel8dmU/oLA3FCHi+Jy8EneDhCKcK
X-Gm-Gg: AfdE7clV/2hbgqZKAmtv1R+3PvvYnT/hhZf4EFX5tVF5o/ep7Darh9jY+UbtxTBQ61y
	5T4KJRvcyUI1nqHaszLlnE5FV5hZ6t8S3pl4rpZ9Mucr20TSOKNlRYQjFXrWHzT0y+yRjtUWONW
	BAYhcODmKzCceJrtZLl55VlSl0VLwANFQjRK/Wf6D2KJHs1r5OsS91sp8drK5Oht06PVrHSGEac
	jUwYzFGnE1NH7qU9WfNzwJG62LkMGa53E/eANAoRFYENm/pbRV4yPq/BmEqYZO1GnPtdhx/bODd
	jP5/95xTesxY0CLKYIJBl1vykwdQHQpa+hEpleJckVb9McqHSCzVNZChpEVoEvBwixdBVd2yBFF
	W2f/TgTCjdbNPHjzW8oK/L3tjl97XIQ==
X-Received: by 2002:a05:6a20:748a:b0:3bf:ab02:439e with SMTP id adf61e73a8af0-3c0bd0420b3mr8101007637.27.1783590276661;
        Thu, 09 Jul 2026 02:44:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:748a:b0:3bf:ab02:439e with SMTP id adf61e73a8af0-3c0bd0420b3mr8100973637.27.1783590276223;
        Thu, 09 Jul 2026 02:44:36 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afeb060bsm3493075a12.14.2026.07.09.02.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:44:35 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 15:14:03 +0530
Subject: [PATCH v2 2/4] arm64: dts: qcom: pm8005: Add temp alarm node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-shikra_adc_support-v2-2-8dda38f7bf3d@oss.qualcomm.com>
References: <20260709-shikra_adc_support-v2-0-8dda38f7bf3d@oss.qualcomm.com>
In-Reply-To: <20260709-shikra_adc_support-v2-0-8dda38f7bf3d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783590264; l=1774;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=BQGgbLfMl6tLJ37KwhZa1C5lBH005bZDh0AvDOmBwW8=;
 b=xan5S0uM4StAUrcbTXNTn8RpJ1fpKHZ+kwNYkdmIR/KlwSeeeniVNpNfo6AUinaf0OTHGCA/b
 MoerxZQ3XLTAGWhX2OSW19rrOfWLa43u7YJHkw5n23Nx2uY3aCdZPXa
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: wJj6a3BAtWnaYzX08IATuenNYh8c9wT1
X-Proofpoint-ORIG-GUID: wJj6a3BAtWnaYzX08IATuenNYh8c9wT1
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4f6d85 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1cSftZPrRki1B16PJQgA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA5MyBTYWx0ZWRfX3mA/LOGUGUyz
 XaTxBoqFhxtbM9PmPaqt5kIo+EUjVx447O4SVZLPNm9A7oD2TA7PQW6mcNY7Xrc+UJJ8MRLj/kQ
 QjTqjA8VtNWjnfdnrW1jUOttnBY6RGuxVxeGv/B79KOMf3Yq0Sg5GIB5F8ZWy/obbODCbFxXUR8
 z8wFvDhwdkvGR5nXqL5X9qD1+fauhqPT/WFySMdBSnX0tMY4AtUd+gzLTcUj0OowTOzgGI1YM2N
 6mfb8zxo6Pb2Y7c0ZQLRq/CcoXmbG+fyKSHV4/dmlSNnFGI/mmj3wSiWCT938N1qQb38Vikxeyk
 8e/IKEZwo+LWfJC7iVZ+c2vuCqce056rJKl214/ywBlXUmHi9C6eoNWfERqiUIopFlvB5Z4/Lwl
 OhVtCe7ljsHuQSUfhTIwSIh9y+RQQzdGY+VXAsxYC9NNAWBfrOBYTKZJmYJIZTUf5Ij8j+ErK95
 wrPGvbyKwARCpHSD/XQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA5MyBTYWx0ZWRfX/4huafcvGHJ6
 nJ0n1nM368+YgCrBPBTqj8HFVBcHGIKnCR2qjkPJ+Dp5IFb7tJofE8BbHeOd29+oXJj7QD9Ry91
 fLGQjwOQcIaKuaazM205K0SK6YOAKsM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090093

Add temperature alarm node along with thermal zone used
for PMIC thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8005.dtsi | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8005.dtsi b/arch/arm64/boot/dts/qcom/pm8005.dtsi
index 0f0ab2da8305..051cbde20983 100644
--- a/arch/arm64/boot/dts/qcom/pm8005.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8005.dtsi
@@ -4,6 +4,36 @@
 #include <dt-bindings/spmi/spmi.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
+/ {
+	thermal-zones {
+		pm8005-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
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
+					type = "passive";
+				};
+
+				pm8005_trip2: trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pm8005_lsid0: pmic@4 {
 		compatible = "qcom,pm8005", "qcom,spmi-pmic";
@@ -11,6 +41,13 @@ pm8005_lsid0: pmic@4 {
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

