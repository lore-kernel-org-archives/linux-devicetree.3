Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358F8348896
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 17:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781803305; cv=none; b=Lr/Rtmwa/bKG7BAyvR1q7FR61TYP4hkqQkn1lI9S/n/cL2079WkhtyYTfN5POuJ0OZkMBBOFlAwFYX3y/tCZLUIiTBd5GWyWSDx4MkVf6P0HCmseSOtNqSjrzmQM0gfAvkH64f5qsOsocW0HryZAd2GrMSnT5x5ZD4VdB+saSd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781803305; c=relaxed/simple;
	bh=dZMAQrXzPQSfxEgazyze2GaK4BtrNYhFJgHy7c6c8jA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uXIccdPC6mivfmOvEtU7jzO1QlWdAtGeQ9H2K/1EKtO35Q01hpbQEJ/V8zfjFD1q7+PfrTTozyFjjBBl6gdbKLq2HmfaTRn7srJAni3B3GHHH6Um+WDz2nrUem9wGCg6siwrYLPR79cuwVclGQmNbPexE49L+0Ish0OsduXtBIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lYLmyV97; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TFt09soz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lYLmyV97";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TFt09soz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IGpDAt2398018
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 17:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OnvnFc1miELZIOUjX2NhtVfiu0Or/TYF78u2hldVC5Q=; b=lYLmyV97ak/liF21
	1wrFaa3soXtgCMIS1eeVxnKC8f5G6guApWyvrqsi+GmbPBOz6J5tnVCOqg3xId3g
	1rw0/5S0Zw7kCQN6v5fGxc6wVV/Q4jG3ydzUQZTEGovRwQq8AN/MESOkFi8BKUz8
	69x0h0byutAtVcWeomN0YEV2e6LxeCH3j2URwgyJLb7bIQg+9a+CgIBaG4XWSy2R
	n3Lg6ySfntqgriDw7Mll5g3zXHwzmT8Zg/K9LbtbNC6OJop8HWelSmu0IiMmXro5
	36jgKqObbYBBvxqfzrXE7kpZ2Oe8qGPXMXMIlyWIlOr8sJqeKwwbwkjOxYQ8FhAZ
	CV5PUQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm228atw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 17:21:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37ca93a9253so828693a91.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781803302; x=1782408102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OnvnFc1miELZIOUjX2NhtVfiu0Or/TYF78u2hldVC5Q=;
        b=TFt09sozsNJkpqCWwUlSFxPzcFunU8N1SEu78JwDDOdjJaQgIcjh3s2bVGTtIZCWX5
         3W6hiKAx5rTLPKV1/GtRt0pW+HykBHhwEAi3I718P5HntoGQPtkY0pwfWYwK2cGB4+yb
         D1s/PZ53W9ZwG8LyAYIZm1ogG3px2xpwPC8hW45B7CLW7Yqks3vs5+gduxRmHo7cLTm6
         NQjdQZoFx2D8W+UP1E3Wlde5ovk4c0Fvj3MoRuNBjqOdgi0mVHnIEFE9DQSCGQbsMQOp
         OAj+iXGglRZ2qOtYPcYVk28UOWIHD87/VFotNencO+D+O1Qr7lXEy/U11bB25jHrxtJ6
         /02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781803302; x=1782408102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OnvnFc1miELZIOUjX2NhtVfiu0Or/TYF78u2hldVC5Q=;
        b=dWocZvL1s0ybw48WfX3ejnXXTEkxTeeXFQ0KMGD0hLKIWgqL0rh/0js54NnBBhLuZo
         vayoHnZrzzFV/woko8BjJ8IWAOrfxIibx/vnCxNr6JEMf7qb5yBSG71rCkT/ISjyYRiF
         OtbtCZgA5QG2oI5CeHclIXHjkjhdg7JiAmNJuzDVehoWbiMlUSwiHLq2+mQ/W2ygvim2
         831iFdyhCWs4y2GMX86sB5M1yDvEKwz7H7jHf77986B5qS9O7Y/3bWbaiwMXy0i78k2Y
         ugQNmE1uGhCTARJpbg4y98Fjcuc+MgTI7O6gsk7mB5ovYoC4JuUMt5bd7QpsYp4i8sOy
         CyIQ==
X-Forwarded-Encrypted: i=1; AFNElJ/TTFmlzELm/b9QnYur6wBJQW24Ba3RBNGnFdLD30b6bex6cClFg6JTGQLsX7gG1KNq8zvXza0xUS+Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxnKs7mrowkClaZZoBZ2q0q7uB4ZP201UoqAXzkrNPUM/CqcX9h
	fS2lerAgMTDb28zGHyx5O09d9Z0kOO23Y52o4SkrEaTui6Py7Zg6g+RNyLAIG/sEBHFs/VgYtXY
	nFIdunOW0P5ko5Uuce8M1FTh0lKjEVMpFjSC4I9ULNfBC5sP4TZC2fJe5MgETchUc
X-Gm-Gg: AfdE7clamq59tZnp9LK9tsRUBCzrS+My1lEpH7Je/zRKuSKU+1glVurbxo+5enHlsss
	sK8JCMBRW8fM5Snsn0ifuny4WFiOyf/Fp4zCF6c+baBKonzmYIYNxQ8o1l8SEWs7vcMtuRml8Af
	AFCgu8ICH6Fguyg98kVqeZ6KmDc9sp0cU11Q0QTP79L407xTYOpqRC+8oc09ugjBRV8lra3tBJC
	K68M1/PKd6vd4gN85iLP6/9+s4k/hnHUgukopX5m5cwSTOfDkE3gzVUf4l1lrUsOw6sc5TWzRAM
	bzeneboGw8dP1cDmyoxCMvDI+KSjcnyYROOHkn8jthkXtcaqogIJ1dHnXlQiFg+fjB8g4bFEwi8
	Hns8hBLTwP72fGKrhuyfcxm80M3oI+3uGKig=
X-Received: by 2002:a17:90b:4c44:b0:35e:d015:d675 with SMTP id 98e67ed59e1d1-37d15dd7f2emr450650a91.7.1781803302256;
        Thu, 18 Jun 2026 10:21:42 -0700 (PDT)
X-Received: by 2002:a17:90b:4c44:b0:35e:d015:d675 with SMTP id 98e67ed59e1d1-37d15dd7f2emr450593a91.7.1781803301823;
        Thu, 18 Jun 2026 10:21:41 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15df8b8esm187129a91.16.2026.06.18.10.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 10:21:41 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 22:51:18 +0530
Subject: [PATCH 3/5] dt-bindings: clock: qcom: Add Maili global clock
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-maili_initial_clock-v1-3-d6ede0352113@oss.qualcomm.com>
References: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
In-Reply-To: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=YN+vDxGx c=1 sm=1 tr=0 ts=6a342927 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=L9CrEEophHSVp_de_hsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: HfcCQftr9voaIOVnYU8NuEg7iakc8ErT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfX0jE07pzHzVPD
 QZ5Bmjm40ZXuWIwjCSmdHORe4b1Sie9c6junl+FDl3HMLM+vWyfcpSMBukY0ouZ2/+1dpqP3jgn
 753aTyq9A2TRV2GANbyISMS2aa7TxVM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfXzsilx//PpZ5M
 yZ8fYngrP/MmLkBEHz0ml2TEeKe7zMz+ODDYfECQWCZfwcIV7SRQvL+HVoLZXP7yLBNe7mus3hw
 wf6HPPFbkGninYG/Q158L7ULELLkRL77fqmC65mY/iZDKPDB1bQw1ZmNEb6wQfdwjLIJY4zFyh5
 lODIURzD9YDqt2S0AE5cLVpxBC5LTaXf0eQiSxVOJZC+put7MajzRbXo0kSiUjbHYovBU7bSLuz
 +s12cmPBZbZ/tJkcJcqP5q7hB3tQaLkSbCtFalHNWPiiBA9ew880bKkbAO7445fn3dyuslUDLqy
 GXS1KqSW96IuFy9Vf4vYFyWTqMfT9s1zR3jsEi1qqzM+SQJSs863aF+qZBUOCjuqPD4b7Ie0V7+
 rzRRtmdqetSc+cBXRGU1CVuqZsBjRCd5rLhvQrTpkjSwi1/ttTsl2zfnbqS82GZaHrB0B08SWy0
 WbOyFRl1feFTgKxNPzA==
X-Proofpoint-ORIG-GUID: HfcCQftr9voaIOVnYU8NuEg7iakc8ErT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180161

Add device tree bindings for the global clock controller on the
Qualcomm Maili SoC by extending the Qualcomm Hawi GCC bindings
since Maili is identical to Hawi and has few additional clocks.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml |  4 +++-
 include/dt-bindings/clock/qcom,hawi-gcc.h                  | 10 ++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
index 4f428c0f7286e83683a65cbe60b2cfeff67f5b8b..f0e8c6144697100588d68bc7c4f1d9822dba4cc2 100644
--- a/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
@@ -17,7 +17,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,hawi-gcc
+    enum:
+      - qcom,hawi-gcc
+      - qcom,maili-gcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,hawi-gcc.h b/include/dt-bindings/clock/qcom,hawi-gcc.h
index 6cd7fa0884f535efce90b60997662ca90cfb9b7e..9e0e382af3112b980997f0c7e223720517f12b02 100644
--- a/include/dt-bindings/clock/qcom,hawi-gcc.h
+++ b/include/dt-bindings/clock/qcom,hawi-gcc.h
@@ -196,6 +196,16 @@
 #define GCC_VIDEO_AXI0C_CLK					186
 #define GCC_VIDEO_XO_CLK					187
 
+/* Maili has below additional clocks on top of Hawi */
+#define GCC_QUPV3_WRAP5_CORE_2X_CLK				188
+#define GCC_QUPV3_WRAP5_CORE_CLK				189
+#define GCC_QUPV3_WRAP5_QSPI_REF_CLK				190
+#define GCC_QUPV3_WRAP5_QSPI_REF_CLK_SRC			191
+#define GCC_QUPV3_WRAP5_S0_CLK					192
+#define GCC_QUPV3_WRAP5_S0_CLK_SRC				193
+#define GCC_QUPV3_WRAP_5_M_AHB_CLK				194
+#define GCC_QUPV3_WRAP_5_S_AHB_CLK				195
+
 /* GCC power domains */
 #define GCC_PCIE_0_GDSC						0
 #define GCC_PCIE_0_PHY_GDSC					1

-- 
2.34.1

