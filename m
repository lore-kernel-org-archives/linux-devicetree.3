Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABECF366816
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 08:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785660348; cv=none; b=UCjUH2C8hY+A0DSXJJPx+VTBJ0dXvIAbKsIy+gKrweQ293sb11KYLFcq4O6U/NsTZmEajqFIQsvWfaIhGwAaouIsxlwqrYn2LEqdAg3WhpnUu9iGhjpx0x1T8BXnenzsjdVIcE9bkE6g9jBqtiZWjxodKpW1XIQn+/5o0SovFOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785660348; c=relaxed/simple;
	bh=ZFlLG3z3MlcszCNrY5WmDudqd49xElNAGFD9EIWF1s8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AeKggqJyHltYtloxeMa4r4xozhVAxqJga4OX9PcditwcoiUoWkRRHd4hvTnrsyZ4NSgmvy3Id1/+be0hO1mrKGQRRDJA0RpYnI8P4b+gbC/nqCuXulzIlBlIiwd+r9cWUVylVZwyWoXMMa62ftf9D/ti3mSTCI8DB3LdRY5jD9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RzRAaCUp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q+vnjh/s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RzRAaCUp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q+vnjh/s"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6727llq21080851
	for <devicetree@vger.kernel.org>; Sun, 2 Aug 2026 08:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nit2svKmSnKek5KgwJ3n2a8gERZY/b5GYApAabo7+j4=; b=RzRAaCUp3G/sg9pW
	WzRanZuBnqlWLqVkdszizzjULHMRCFp2nUUDikOmiktYinitOiwobLKrKf/1QWqF
	HjX32QLGDYNPshMg//MmvtUY5XDPXjY5Ur0wxrBqV671SYBhd0MVW/Sf/qxrbpkh
	11MIahUvetae59LLTtWdqw6uLDo6C8+d12yzMMB/KXeHLKiVhgBIX0e73rfYPluW
	mY8kBSfIcLyD50gimV1H/KgFKfrJWtjvmNs16NMVa7w/q7ZfTMaJjHGOlkAIgbCz
	Wxnp11LJAcfQCjmtl4eeY1GGNbvIkL1ZW58H4imIj/Z7sWyAdDvAZOmVmYGEhPKe
	KMJPHg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8r6jjkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 08:45:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c12e43b98so22529491cf.1
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 01:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785660345; x=1786265145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nit2svKmSnKek5KgwJ3n2a8gERZY/b5GYApAabo7+j4=;
        b=Q+vnjh/sw7N8WqpKkF2oYsseswD9YS27S6IUoAVv9u+f0CJGJF/BhR9AL17NqbuKx1
         TumsdyS/1Gr9ybJKFG6v0ygmqXpERoNnVxFjJOpidIotNwRWA+uLDnzzjc+nuQI1eBgQ
         oydHJcHqNKHP1K1d9AZEwoAGVRg/CWaAyPbVB8p5N2OWtgwkxABFwS8HdHVjc5AmyJbF
         01Zpy4suhxzbkqpXrWvutq1iX37YQI7aZUBLfumuihe1KSrnic49+LmoFdYEUnJbhA4e
         FN0Y1EFIdzFyjzeSBVevsF7fVZaYNSQwX6FXYdRV8vKQYuRIaUenoGtTsZJfsV7DKi1l
         +o1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785660345; x=1786265145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nit2svKmSnKek5KgwJ3n2a8gERZY/b5GYApAabo7+j4=;
        b=i5r9WzQ1uL3ooIzyP0S2DOSCsPGcceLrnW1SKIECdn0u0GwBMRbS6O2aftVsRPkLWr
         WMYxhl/KfQkxp54PE+cToWDLwnurqWXA8jNPuXUJO6+NHIbwlkQgpxyqc5/iJtcD6gUN
         REkpXXDaYaY/EWmExF0T/oPmwCHzDtcw+RVO6ICn+kqa1Oh+8WXQJH4f9/MV0SxkZXc1
         nr/uWhpnB0/7aTknTYlxZeWruJegsg+p+8Szhp3B0FucYZNF8fTepOtESdq6ekHbq849
         8tjTyTQdfgJO7CLNVL8Id9K/3e2tZdftC50kIAeIBi7nyIkHhYAolAq1cmxgowSKDOZ7
         me2g==
X-Gm-Message-State: AOJu0YwbyjxmENxUZpd2QtUtvRzyHBXJp+OUW9ITKQDSJpmE8GTxOt76
	o7QW9y8v38/XGY8P71zfsKIPS4csfNOFmb0Cog1idYyb65U9hMrJQVMl3eVdkCOQQOmZ6V6pNft
	IT3rLADV0EHmzqcUdrBlIr2HMF44XaJpwR4+N2zVZSdkkSgCk4DIr5Z6k+Xwsl0/z
X-Gm-Gg: AR+sD13ZZ2m88BH6h16bC94IXuZadpVIjA7PGpHNP8K1Lgi9ts2BjU0JLFVTsa6KwvS
	pjDJbA52F0d0QM1JbdtmbbqQsyPE89IeP7dj5FjdejcGt5IsXpNvoyFX+y/j4fXOtjOfEYaQMjQ
	eTDCxu9KSerWcKK1OT4B8Pmgn0XpfPDIfeXwSQA93904BHzf2rrYaokqK2NIX/gQAXsBPlmqtRw
	3UbPBGcMjYXjhyYcujzBSOMwdhV3X8OZcL6Ej3avAvrcxcvZuxwc75Korz1ieKZDNS6gpO3p2Nt
	aX8YXwIbsEIlIthCEz9FAdInjjep94MAG9A/mjH2iEaV3/WUxFIuEmILqSipikhqh1m6Eih/K65
	kA8PMV4z92PlYBfJwyt40uxwZ
X-Received: by 2002:a05:622a:1c1a:b0:51e:e5a2:ac82 with SMTP id d75a77b69052e-52b5682e7b7mr128349981cf.23.1785660344808;
        Sun, 02 Aug 2026 01:45:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1c1a:b0:51e:e5a2:ac82 with SMTP id d75a77b69052e-52b5682e7b7mr128349821cf.23.1785660344387;
        Sun, 02 Aug 2026 01:45:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808191ef9sm139198195e9.1.2026.08.02.01.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 01:45:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 02 Aug 2026 10:45:23 +0200
Subject: [PATCH v2 01/11] dtc: dt-check-style: Add missing /dts-v1/ to few
 test cases
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-n-dts-style-checker-continued-v2-1-6c5dbd1ccfe4@oss.qualcomm.com>
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
In-Reply-To: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6705;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZFlLG3z3MlcszCNrY5WmDudqd49xElNAGFD9EIWF1s8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbwOqhPPMMaIL6XS3ZELCo78h4MqKMPQQLaZJM
 HdyQTlGahiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam8DqgAKCRDBN2bmhouD
 1+tJD/oCY9vnPUo+G82I5+CZkjmSR77i7xl8NUJKdAO1NWPknAqGkCtvrEkbjLk8qFLlXOSwX8f
 IBHQw11e6p1aIs9u44DyLE3v88fPeV6CeTX5kgpShVYoQ2Q/FHFDq35Hcct7IVT53dAO/FTW2OL
 IVEpzctnPHZIap+hVeNsgvO5ZqslwsOuxED2AJ7TOCZIiJcSBlla6S9FoiQw3ovuPvF1NlFNVHi
 N1WlGp/jcY/JmgyN81DMjY1VaIfYSZ3x4TrwI8t2HiFbOD1tuNh0fJSzRhwMLQ/X/50GY3jOuuQ
 UkAQffB4K9JCyze8KIiyqnc7FjSN0TNdq/ZY9k677x4RDhtSIvYZaIzljO0xilRto12125dHWHg
 fhOri5i+0gA9qjO779ZyMdS8yaZlnrOIkoeMZt9QSEj+f86StRjARIrlsxv+g0kim1uDYHKXbCh
 kVGOweO1lBYEqrKlR980mipPsFSu5Tj2cek/KGsxh0mGn6EnmHUIH719CyXdEnfJ9PKZnihhKkA
 d/xldwVYrBdx70Lrk61VLH8X4M8s8csMQ1zNbrpCOBX7UEwxADk8T6HKuvpkbzRvWaaaK65Ik35
 gqkzzILB/fbaNuATn72wW5gL7cxYlwsg9gmI9QPDuH1AkFDvyZPsXlXtBvdsCBefgQJQ5jiki2/
 AMIJtOUPJewYdFw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDA3MiBTYWx0ZWRfX6BkVb/1lSvnH
 kcSNEUzl8TQTzbHJGBD0D1SekmQAokBkL+TD8JBQrKs8Vbxi8u5k1xws/49314B/pni6kB2LZ42
 WOdjxLHuOeLP+IymuJ0c1QLnNTa9X1E=
X-Proofpoint-GUID: vVMre8BoRcbLJQ5DbfIG2Md3HZGttPSU
X-Proofpoint-ORIG-GUID: vVMre8BoRcbLJQ5DbfIG2Md3HZGttPSU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDA3MiBTYWx0ZWRfX3453ZdKeISP7
 uPVimqmBmGwJuRgwgzcZ1X39x1OJEP24ePEi5a5QAClIXa1fWJt0pvLFbSgqzA6eclwhk6vexYB
 Knpo5ikP7W80l3iMFpE0TjH1fXWgDx8/zxgiFoe8Pyk0kFXjSLndhbbq/glfRKhG/vzDmcv9zTR
 +iJmDa9oN7DpwuWE0RRD/gPFpDUXi8jERoDWS8z2EBlVc2FR3ItOQSkGopO3FCpTg3DxloCUkxf
 99iY9fL4syEn99H1NdEpeCviyhcdcrppfFK6K2J0iriKqJihBNTGC/QCGXhJhnx0Rh0CZYnzheB
 Bho+n0d2LhomzJxn5xGXh955PS9e5coIVn4A3uD+j29jeTriMzP91DHaMX8AvqWsSYqhE2pmq6I
 bUmW9ZjEnUGQY8i6GJI4/7CF0BNO8USYRLlLhSoUVhOteHdo+/xgQ5G7KVEKjD9kPzi4NSHwD4m
 rwQaLDXVl8wGNT8BhJg==
X-Authority-Analysis: v=2.4 cv=Q5ziJY2a c=1 sm=1 tr=0 ts=6a6f03b9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bazDI84LfyIabikLn_YA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608020072

The selftest DTS should still look like a real DTS, so it needs
'/dts-v1/' marking.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dts              | 2 ++
 scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dts  | 2 ++
 scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dts  | 2 ++
 scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt     | 2 +-
 .../dt-style-selftest/expected/dts-extend-node-child-name-order.dts.txt | 2 +-
 .../dt-style-selftest/expected/dts-extend-node-digit-node-order.dts.txt | 2 +-
 scripts/dtc/dt-style-selftest/good/dts-child-name-order.dts             | 2 ++
 scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts             | 2 ++
 scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dts | 2 ++
 scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dts | 2 ++
 scripts/dtc/dt-style-selftest/good/soc.dtsi                             | 2 ++
 11 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dts
index 49c5c10c92d7..54be9f07b680 100644
--- a/scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dts
+++ b/scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dts
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dts
index 575dadd03c38..296c58a545d5 100644
--- a/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dts
+++ b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dts
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dts
index f3ffc47365a3..813900e3393c 100644
--- a/scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dts
+++ b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dts
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt
index 86b1de9bd654..e2eea0862102 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt
@@ -1,2 +1,2 @@
 # mode=strict
-bad/dts-child-name-order.dts:14: [child-name-order] child node 'bar' out of name order
+bad/dts-child-name-order.dts:16: [child-name-order] child node 'bar' out of name order
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-extend-node-child-name-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-extend-node-child-name-order.dts.txt
index e3d8fd367e09..b6e74e6f923e 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-extend-node-child-name-order.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-extend-node-child-name-order.dts.txt
@@ -1,2 +1,2 @@
 # mode=strict
-bad/dts-extend-node-child-name-order.dts:20: [child-name-order] child node 'bar' out of name order
+bad/dts-extend-node-child-name-order.dts:22: [child-name-order] child node 'bar' out of name order
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-extend-node-digit-node-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-extend-node-digit-node-order.dts.txt
index 525081867bf7..bf252e4d9815 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-extend-node-digit-node-order.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-extend-node-digit-node-order.dts.txt
@@ -1,2 +1,2 @@
 # mode=strict
-bad/dts-extend-node-digit-node-order.dts:21: [child-address-order] child node @10000 out of address order
+bad/dts-extend-node-digit-node-order.dts:23: [child-address-order] child node @10000 out of address order
diff --git a/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dts b/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dts
index d2a278763c3c..af0adf5abf70 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dts
+++ b/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dts
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts b/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts
index d2bf5861c3ee..cdf3f91ebe01 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts
+++ b/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dts b/scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dts
index 47fe5455edfa..97d468051f25 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dts
+++ b/scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dts
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dts b/scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dts
index 0c292fefa52a..faf49962faf2 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dts
+++ b/scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dts
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/scripts/dtc/dt-style-selftest/good/soc.dtsi b/scripts/dtc/dt-style-selftest/good/soc.dtsi
index c60274469555..deec1a973c92 100644
--- a/scripts/dtc/dt-style-selftest/good/soc.dtsi
+++ b/scripts/dtc/dt-style-selftest/good/soc.dtsi
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;

-- 
2.53.0

