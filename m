Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3F03DA7D9
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 07:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789457002; cv=none; b=T8eV3AjOh3y0Xo6VqVcHEp+19T2xGnznGF53iU/hiX/mptUDb6rnjw6XllEBGaBRML+CAQMijTXCe34zeo+zyA1wRFy+9U2G1HYK4noetErlItEyhQobyGNx6w5p4k8lVDDoRRgE1N7ENYcC3JDC3qJJqvkEzaeTMBa9FlEpVMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789457002; c=relaxed/simple;
	bh=1CwEh8Q/rE1NnBMoNQNfgUNpKNcbygdha/9UWzt5FEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rkxc4b45BGfHbg4W0b9Sg2BaRBtMHf3/6IHDU5qmbknan4TPQjpYfFUj9NANYErSwUGQreF4XjlThAVbSKPIauxP+uYSlmeBvavbPYG8EzUwHZF96LhdWreDb2/rxCYRAVu3QpPjvfMs/icfMYXM4zJ+kmgQRknbtOqG6vD8rlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBvNlURH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PegByyBH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GBvNlURH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PegByyBH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6YsIa4048596
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 07:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3ATNw/rTlAf7RUOzSgyQZetgiqkf6IsOoJF
	plso21Xs=; b=GBvNlURHys0JKR9lSkOpSc3CedUF3nzxz0c/Qr9yV/tXmwRWGEf
	OK+FnCXK70zkftAUk8mV+CCt4NM0LhRTd5dRxB158Cb+/jBKJpDf5hGSj1ByOm1p
	J73U7C+XY/Hs0gFfiVuvi+uEO1HMGIQG5BHWpd2qPQQcaT21Js8z7TKbumjIrKSW
	J9Hi7FibSnJAr3DcJsNvpeqzxMzgM95S0ACpwvoeRnczC12Rf2zBNUqX/vfyfrSQ
	EJ7SBWd0GTMcFDX/FnUUmiCgAq9tFXT0yPpYWkDFCV5UmKPzHpKy7eFRaM6ToHDb
	eEnPFJm9fHn/Is70FfvP/q42n/I1OSm+VDw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyea0j4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 07:23:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936e393061dso670541785a.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 00:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456998; x=1790061798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ATNw/rTlAf7RUOzSgyQZetgiqkf6IsOoJFplso21Xs=;
        b=PegByyBHMJjqUqDnYE+8rYvtB1pfIl+JEF2XUZjzKM80mSjtvJY656CvS9Xbj9JQ/N
         zvhH4s4YkDLMV4JmWYO00iFry3ZZXm/SfOnZCI2vG1SAwqc9v5lYwEF5BzuZRF8mEGS6
         iLoyygn0Em1HOyQzWXlicW+L/OPBXjRsmJTQYp71uqzQpFAz+ENkyiniTbv5Dl27ZrEP
         GeDBUiysj+47ZfCaCmA6JQnG+4+TFUz/7CCgBkgTBEdGXo/pMELKz7BbqsJbX8oH0deF
         b83FI+DOTpuWF1prGV5aUBuF7tRn1i8V6jMBmg7ciGhTDbYbqpgCnA+CwH8p7Qp3bZkE
         Oocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456998; x=1790061798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ATNw/rTlAf7RUOzSgyQZetgiqkf6IsOoJFplso21Xs=;
        b=GwN2yAkSAH+TYLDj8O87yBx/BcNybs1g/25Srghj1m95OG+yUCAIGvMv3uCwDmVLXq
         xByfMiFGvdVNGi5ObPEPOOSGYpePbpErnXrpuv+QfRbz8MiXNkNcvXEKa0hQvR9Xtzib
         J02wknhF6cNyLcBENLz6xFD7s9fGBODPZMR/Qoqunoy63d32RH+jTHFuXaMCDeExiCT9
         KhJwFYE9bn7MPFZLWLTZS6j7uEtwjN9KYJR7dxAibcekG4GmgnTpnjnlRhW2HO20S9qm
         12zp+oTco3WGUwE6tnGH8niXGuO0wQNh/HS1d1Ndkgiq3Xqy80dtDSQPjr6CuTTYlygs
         1FWg==
X-Forwarded-Encrypted: i=1; AKwUvBwuIql967WJROCf//0q0sk4BYzObpnWzdVNu8IKsH6BAqUpl+DHUBa+ZtoG3fMT/x9UoLA0u0vGO8sp@vger.kernel.org
X-Gm-Message-State: AFuF++nduadHEKpOQpiV/p2eig3ovhPl+hAPauq8jP7qRy/EW4+uF9+b
	Wm8Nn92kHl/EbydUwZvEIM9Usr7LrJADh1xrQXeU9KpNDSz4GKR8+FXMMUcE3G/pwuBI9pNxYWg
	WHJZolpQT3UASYpbbqA7hovAdYlBSSuDQ4f4/5RwFpgecbD5KCmLtpT2/FGW+t5Tt
X-Gm-Gg: AYBFou3sN6LjmGWMrkraeLySXB2lTOXibvcoi0EcabriHsDFtOEWmiXfLfKsBpxIUxi
	rrDLKlsL7pKDXOPJtVIYvmzJLFAygBKoUcTIvTf3dBbwHogMUhM+zJy/va8QHOp0rX9cieeh/nU
	PH3QFZCr/6ENLEK2aNP4PhhYGQfIrRPYFRxFJJO456SrZJVVTYXnIZohBharaNhtYQN7wLWKfX6
	Nn9DdhXaiB+JZX9OySvEsIzgSH2KrCKuTYjkK/p5lT0tRS//NZwk0taOg9y+zpex3QhizonNabr
	Irg9NgggH9oL1vXMgZA+1Dn0LaDAIFiYAgKdngTRHOc2SX0qeLEEg6gXir26mZcr3so/ZU6rid2
	aQsY67RlcRmIkmOs=
X-Received: by 2002:a05:620a:2548:b0:939:78ab:3c5f with SMTP id af79cd13be357-93a297c8d1cmr869986885a.9.1789456993458;
        Tue, 15 Sep 2026 00:23:13 -0700 (PDT)
X-Received: by 2002:a05:620a:2548:b0:939:78ab:3c5f with SMTP id af79cd13be357-93a297c8d1cmr869984785a.9.1789456993090;
        Tue, 15 Sep 2026 00:23:13 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef2e117sm43920095e9.1.2026.09.15.00.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:23:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: imx95: Drop unsupported opp-hz-real in OPP tables
Date: Tue, 15 Sep 2026 09:23:09 +0200
Message-ID: <20260915072308.64047-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1987; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=1CwEh8Q/rE1NnBMoNQNfgUNpKNcbygdha/9UWzt5FEA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqPJcJRY2BJd+T88jYlFk1GheN4sqq8i4Wa973
 jvqfy7SQ0qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqjyXAAKCRDBN2bmhouD
 104gD/wNqgSpuFjJGccDgJI+wE97JAS7/eb4tNGBVw27ynWMA5AqDYYnvK5X3/F0roozimR8qs8
 hDvcWCNNqHU4PBXYCOoZ5jQwYNgxs9wv//rwxKzJ5N0AfAEXebev57u30T5bc8JK5KpYeQU6RII
 RFDIPpsdytPmUNKkZ4n5llMHmoPJlasIGEzldd/SJkwV9vB35E/gIPLXlFyJtcow0uh/eB+BnY3
 bJSs8g5xZcwsRfAnwlv829d5OjgV5FvQuXUsLAuHyo0athGI64upCpApkhDeAKeap54Aot40cIR
 yfRcXxCz23sw4rw5OTQHvP4TfU9r9m/dSIPvir3kLQ5uYqJxeVnRubV7iaxukhTATBafHTZAI8O
 iAWLQinDVXqRnIm4lEDubTnN04cHVaXqmtUfdqHXm6m3v45rOwQkjB7LRRwybInr7LoqXvt2bhV
 Hf0SLRU1rHcx+lGbNCo6SKD+N0oyKqIv0jprhs0Gtxs9hPTfina9cD5+10Pnqh2Yw7g0nK9DyqY
 BBDuOUrfd/4FdUjjlPb979qdlPRLjXqlwI45/pjwvvt/8pe0P9957yxMk5ljlpzClRua4ILx08F
 5PtakefXHXbQBBpRwKLD4bguq5rEnqRW3djJQAkzymjQIQwGHO3k/IVsJ8XE0cwM1pqvufUd4Pj U3wEzs/QFSi4K0g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pg1hlqg3WUd8sI457Ddth5YE0581FnIH
X-Authority-Analysis: v=2.4 cv=cehHPXDM c=1 sm=1 tr=0 ts=6aa8f267 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=LIxWyly_AihzR3FwyFQA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: pg1hlqg3WUd8sI457Ddth5YE0581FnIH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwNCBTYWx0ZWRfXyvosGmBi1BTL
 m9/YYT3a6fJJcduSnCUN/8AElJ7qpQqEsm6JAc0Cz2x2msKN2M5EGP1DhZkisxQQ33Nseta9U0O
 3XVmKwwbxc67sqZ1zXok0ecp/JHee/I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwNCBTYWx0ZWRfX14s9+oRGKREu
 oqRShLPwvdZB9eGikAkIgTqXVJHxdWSuqlirSDLE2nFvNjLzb9F1itZ9m4TfD9EhMMc4Q3tSlDK
 I+N/OExELoYVmCslrUfKKSoPpEK6tPneoFqZw8b6Syd82dpgzEaUB/3hroNy+7YDnDwvz3ETy5a
 IH1wLgwpR2oH9oPdgrXVP97nXz2GuuANJxv4by1AYReGsW7QSRyt3rIbNDkBHQ4wkHkM33jDH5L
 pHr4PjWE5NFUPiVbvLCc4qeX67YwrmSRRjgEMJasizayjILjYItP2Vu+iCI3Jd+Wfy7mMDgdo8M
 hkMugQJN8XcdaD8vfe/JjBXTMj9smO7NasPUXX8Qn68jmtsz1L4y85GyTNixnc9+yYdpSbwZ+dF
 8wasV4+OenWdBxXCczkbShUtqRtScQM7lbMfFwSnPBdPw4akK4rwXSjzaLWZLvY/BXw4PLIrkSm
 1U+EhUdJsvOhlRNs0Xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150104

There is no "opp-hz-real" property at all defined in the bindings and
new DTS is not allowed to bring undocumented properties.  Fix dtbs_check
warnings like:

  imx95-15x15-evk-pcie0-ep.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi  | 3 ---
 arch/arm64/boot/dts/freescale/imx952.dtsi | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 1cb8eb15e5c7..99c72d5cd125 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -255,19 +255,16 @@ gpu_opp_table: opp-table {
 
 		opp-500000000 {
 			opp-hz = /bits/ 64 <500000000>;
-			opp-hz-real = /bits/ 64 <500000000>;
 			opp-microvolt = <920000>;
 		};
 
 		opp-800000000 {
 			opp-hz = /bits/ 64 <800000000>;
-			opp-hz-real = /bits/ 64 <800000000>;
 			opp-microvolt = <920000>;
 		};
 
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
-			opp-hz-real = /bits/ 64 <1000000000>;
 			opp-microvolt = <920000>;
 		};
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index 887abb1c4784..306239de096e 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -323,19 +323,16 @@ gpu_opp_table: opp-table {
 
 		opp-500000000 {
 			opp-hz = /bits/ 64 <500000000>;
-			opp-hz-real = /bits/ 64 <500000000>;
 			opp-microvolt = <920000>;
 		};
 
 		opp-800000000 {
 			opp-hz = /bits/ 64 <800000000>;
-			opp-hz-real = /bits/ 64 <800000000>;
 			opp-microvolt = <920000>;
 		};
 
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
-			opp-hz-real = /bits/ 64 <1000000000>;
 			opp-microvolt = <920000>;
 		};
 	};
-- 
2.53.0

