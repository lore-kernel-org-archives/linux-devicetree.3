Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B3E3612CF
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 05:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784266341; cv=none; b=qXnfGMTX+Xlh9pxSk5/oYhbcaYaR7aIh5fEha7abJvfrTlLLChjwCm6d3JzRFJL41iRN61rTM2bCrysomzd4WnlO3/Z8d865zx9cjtwib7KNU/6/1Xzhr2scrLlZOFje2GNPkF6GJRdyRxB+kTImhz0mSNLgikKUWZVW3tKSwlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784266341; c=relaxed/simple;
	bh=5BgMmkdVjopC7iz+UFY1Q8cQUXbJ6LxqhIzuTTGByDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vw94SvC0XW/7Zn2zo5Zwahl42OfWqvwzxZbDZKtlsR/vMna7ExrI+8/ZKe6HXK9NukLoxXY4HYLKcXSMwZDJgfwt736MNwUsZtlarN67nVezv0D/9L8qgai39pCNpRZo1I01F5X/UsT/CLKGSfp00cyY0nEc7Cq5Md0tFmPCedM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mTWq9yyk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PD0DCpBT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mTWq9yyk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PD0DCpBT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33drw580712
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 05:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ae5u/dHS2SFjXOLBjsZuju0TPA5cUawbhYuxTtlOwac=; b=mTWq9yyk0tPN8+lA
	1NJ3GbskqZu67pMX4YLb05/HFWLXrS2D9NVnUsO0Hp8PbC7Pobj4fa5QCmtQdneK
	nilUKOPIgCeQPvG8HwFmQ4VSB6wCxNiy16RmxwFXMUMArFbGdoGyarV8D9RpXDLX
	dz7L0r9/UutNJnG4KU7n2GFSPtMSE+0fpbc2Y5OgvRHOZ5MdNhjDTYQUywSH63IT
	DeIMsyXqoy3skFsZPwfmQ7xoMz4xbwN5jOWC7IQBbiiYcoylPn2HuL82rSzhIXfl
	xD8+KcdUKqC4FmcWSDJO/wcnONEqv1BAVJARt5c3XoTEV6GXSppd7ob2RoeNGe6i
	1OSoww==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffbquggwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 05:32:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb6823efcso67745275ad.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 22:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784266339; x=1784871139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ae5u/dHS2SFjXOLBjsZuju0TPA5cUawbhYuxTtlOwac=;
        b=PD0DCpBTPtQU/nalx8qDPmj6H90nmiU9hlStWx7ece4sKoGJL96Yq33x+lfu7+YilM
         s5XZIEHiTILPLc/w0/IUrd0msvdGD/V9sUTOhW/TJl++6oqXAR7yszyPqvk2BX3MyP1g
         9SsF4AZcNjmBQyuayg75Evu/szq0xANbOo6c7X+o+2FS9X9d2b6CqZ6ezXf4PFOsEZAX
         Rbu+6vEXdnZipnjx28uqp51+WCq0+DxpDhqOC+8/i5Je8gQYtwgLVIYYCwqCE/1X9xog
         DyDOg42Ng7wUBnfkJnTr4Q4G5/rnsWBfiV3+S21FzFPtgdZq9xXRvErt9FStNUkXeNIH
         CfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784266339; x=1784871139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ae5u/dHS2SFjXOLBjsZuju0TPA5cUawbhYuxTtlOwac=;
        b=ECMs4aYSz521qnT+Vrnv+1d6KveedMzW9ma0ZMRLX9KGiRD0QzMrGohdJhPPSd0sRg
         agesnGOzgWXJ0I7pBWQ4NcPy2ymjLHayW6eQtu6eJAn2YXkpx6NVf9ecf/bqSalVfIQg
         lBeb4LOhjeSDWzPBBuVYTOvXtVd+e7p5lqr6zyOayeyLE1hwZ5B2hVwzcvQADkEKJzw3
         ZJTmkZDGhlBRY01f8XKABFwaIHmJTSjdUqjB92UJ38I6ao5TcMVZMT1PxBhYfVLbGx6Z
         I84wtXXN5aPNUuKGDCxwPOze25W9kqjR+ykc5A5nu46F296o/1mGa5Bw+H9mzwCgY+ZE
         rAsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7F5aeR+AoGlxmrSXP13f7TmFflBPsGkY/AuCfsZd8TiBPiGeZ19Xt9hK3UgUCSgV+XfIp0in3VZCg@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe1R1nZ6ZH1LW7l2cmo5FN5xy1jJXpdY5u5lgQcllMa8aRF1I6
	ffDo5WBXleIwzZowInB5NMwmI00JFphP6zhC9K2vUFanofm9/Es35soQqD6x5D5dv+jtPeQrpNz
	M1HlNjoBRzt8+nflOgrfrlQkxIk2VyFRzg6X7W1+H84j2rz2bX9rv0IOfVT0Yfqw=
X-Gm-Gg: AfdE7cmSn1AetxOzyBNBVh73/yJebiSiGHNqUwePlefy++b2Pl+kQ0MA4b9AujvuVGZ
	LrQqhcuW9AtMQAA76+c//k7fwsS1Sb5K9y2s+AF88o3TwL/tXGwByqctV/FGi8d0CqzPuONWwOb
	QSXjovrpvw6bwEiat0HT0L1OE8MtQ8lcrqhVMRXDgNaQfQD+Iq2wIN679NisHS5wa1cBNV2XCBe
	dbWfZNTYaFQ+jmgQ8SE3fmTTXwGCvmKZwepa1WyMpUS6xTnX2/6JUvZfBpf4OgGP8nUFo6vLeqQ
	CcMci0KwJAUEZOcYq4Dw8hNoOfSJv0eNgXWw5MBYeFPIE85Az29DiAq+x4oDNsoTeUlb0VOrhXr
	5l+zKE9/EFlPADl0xYFAog2zENMH1zA==
X-Received: by 2002:a17:903:4b43:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2cf3481d1b6mr12935835ad.2.1784266338839;
        Thu, 16 Jul 2026 22:32:18 -0700 (PDT)
X-Received: by 2002:a17:903:4b43:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2cf3481d1b6mr12935495ad.2.1784266338382;
        Thu, 16 Jul 2026 22:32:18 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ef6asm4189885ad.9.2026.07.16.22.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 22:32:18 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 11:02:01 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: shikra: add vph_pwr and fix supply
 parent mappings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-pm2250-fix-supply-parent-v1-3-a6213a42a3b5@oss.qualcomm.com>
References: <20260717-pm2250-fix-supply-parent-v1-0-a6213a42a3b5@oss.qualcomm.com>
In-Reply-To: <20260717-pm2250-fix-supply-parent-v1-0-a6213a42a3b5@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784266321; l=2074;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=5BgMmkdVjopC7iz+UFY1Q8cQUXbJ6LxqhIzuTTGByDg=;
 b=R19g5XKXSraC9ySkxGTtzK75HRRkUZhAD2Wa2egasHdVD/2jf2hShXsPsFSVpVTKCd516U/Wn
 7N7f7i62d/dCxfq9Mdlw7frHbrYPlYuKQvBJ+XoZ8qoHA/YCPvPdxbv
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-GUID: LZc15-61IwjW2rIYdLDSVBit8eaQsKtW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA1MSBTYWx0ZWRfX/wM48q+f5x4k
 Dp3rmO4ASv6F7QTlwRLRadrAdl5yQrC25Prlp4seZtkU68jWJ6O+K9cWqIOANJho0oFcRFzKl3+
 Ko8K7XVf9dOijEEL6DrXIPsMbmJAJg9gxOMbPW6MLeHU4K3a1iKO1lVYAxmlyP+bXMV88WasEqK
 9LNhWW10FSeS2WwqUXReZpZ2Ewn66G9G8Lk4U3scDmmbOhmRiO0PRSVDF15zFDKL6DbPx4nvGAt
 Wc0l7u6jXKx3YQ+PQLIJWv8p1Jz5mcyilkeu6jqa06lH28z0BctgkeP+DAiE1nvqbDV4eF6JaaH
 00veBB2kXYHp0sUuwNusE4HBZpfMPxLjUuoqD4KDgGWx0sgHEOGgB/E5N+kVHGCQh16LiXUZKwW
 I883U1xnP0pHjP45X0Dzd32hz9XZFmlscnLZ+W0Z0gIOrZoqVDFiVnrmvQHtiMFgw2k/nXJnfsc
 l8hCPvHoPPJEbwr6BoQ==
X-Authority-Analysis: v=2.4 cv=NZ3WEWD4 c=1 sm=1 tr=0 ts=6a59be63 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=dptGR-0hQdtlKm4J1yIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: LZc15-61IwjW2rIYdLDSVBit8eaQsKtW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA1MSBTYWx0ZWRfX7DyNeVZ/0aH4
 U/N7ehGjQpseN5DAmbiaj3Cm5MRkmkjfahpCK+t/995ql0aEQGG17zGKUUl/WSktEMH9OegKyBA
 7RzkFKEviooctrwIbIcW5rGkZZpe+14=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170051

Add the vph_pwr fixed regulator representing the PM4125 charger output
supplied by VBAT, and add the correct per-group supply properties
matching the actual PM4125 pin connections on Shikra. Also add the
pm4125_s1 and pm4125_s4 regulator nodes.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index dc3861489f64..6e4c23a730fb 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -27,6 +27,16 @@ key-volume-up {
 			linux,can-disable;
 		};
 	};
+
+	/* PM4125 charger out, supplied by VBAT */
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
 };
 
 &pm4125_gpios {
@@ -52,12 +62,33 @@ &pm8005_regulators {
 &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-pm2250-regulators";
+		vdd_s4-supply = <&vph_pwr>;
+		vdd_l1-supply =  <&pm4125_s4>;
+		vdd_l2_l3-supply =  <&pm4125_s4>;
+		vdd_l5_l6_l7_l11_l12-supply =  <&pm4125_s4>;
+		vdd_l8_l9-supply =  <&pm4125_s4>;
+		vdd_l10-supply =  <&pm4125_s4>;
+		vdd_l13_l14-supply =  <&pm4125_s1>;
+		vdd_l15_l16-supply =  <&pm4125_s1>;
+		vdd_l17_l22-supply = <&vph_pwr>;
+		vdd_l18_l19-supply = <&vph_pwr>;
+		vdd_l4_l20_l21-supply = <&vph_pwr>;
+
+		pm4125_s1: s1 {
+			regulator-min-microvolt = <1396000>;
+			regulator-max-microvolt = <1396000>;
+		};
 
 		pm4125_s2: s2 {
 			regulator-min-microvolt = <1000000>;
 			regulator-max-microvolt = <1200000>;
 		};
 
+		pm4125_s4: s4 {
+			regulator-min-microvolt = <640000>;
+			regulator-max-microvolt = <1408000>;
+		};
+
 		pm4125_l3: l3 {
 			regulator-min-microvolt = <624000>;
 			regulator-max-microvolt = <650000>;

-- 
2.34.1

