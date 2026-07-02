Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B2B367297
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 18:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017187; cv=none; b=mR2NKTTdd0aOrAUaMMdga47qrhQdd2wvh+VvFwUPnSvGW1c+CZgDgRaojjqEHb0Hwim816fM0IFcm2V49kKmWQlRS2CiEVvOA548PMB6FGI5koEKeJTcYBsnDAQVnI+wpZ6zPhK8VlOvO5Wk83URSlRqkSMXJqYrmN4eThwitAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017187; c=relaxed/simple;
	bh=u296xN7DnqwT/c4wVF8FKXi5grt0EmOqRHqz4oSbztY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N1dg7aH89LnjHWm4PkFBXjpRMuFgU/Wq8VZ66CXbW74CPLKz2ZIM8NSD7j5Lt2EYJHRatf4PjljhJXXW8SuKna95JyKOXPxRJqR/atf6ZxQ7d2rmG6Pc1DW/P4yS0H6y2UFSWLRaL1FCTABI4D2dnr/iep2CWSvrwf51D8FrcRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZviUj41; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B1KdItvn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZviUj41";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B1KdItvn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3ULW662533
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 18:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jj/d7NmRhn9U9+C0ZpDDeUtot908Z2SfLT/1dmj7J9w=; b=MZviUj410zj21sz2
	gWIpWJMtwWXYZaQkKutplRjDbYxAlcrwmpt5dGC6JHqhKbqdnDCNrSB+g2NNenGA
	baq97TARiAWDelmey2JVopOiw6wSMegQbzaosvvmNTHLbpCOqqEMPXNiCMGTg+lm
	8mlMUHqOlplGHQwWEcCeC3xMFTydZ2eAMolC2vt3xawPwRwITZDndA3tVQXcy4YQ
	saGarw6+lFRRFiBJR4F7x65ooVjaD2bEdKS4QWaSVULO4XgMK7MMlOr7J2E0DTkG
	89juzJd9bMf/TJot3xgGt7UMon7iN8uO4bAIFkQrn+44JBsguGAz4bLxXpbw6TSJ
	P/Tm9g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnp9pbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 18:33:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9667280edeso2293890a12.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 11:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017184; x=1783621984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jj/d7NmRhn9U9+C0ZpDDeUtot908Z2SfLT/1dmj7J9w=;
        b=B1KdItvnfmaoMXp0kz+K/4+qdvx8ZruSZi9myGpefDvNIwco4RdNqlDsxhgEAwHa2M
         OcIWPlgOzeEJNx+7FOwsfegj0bV9IKJA9LAHOaR9Uk29dRCS/WdzPq8tn4uaaVn6NFky
         /KTJ7TINIl66L9x0wGwpgZr8Jf4/nR6ETgc0HExvACR2v/1RhK8qn2Cw352STaJFJlbE
         mQCA2JUjxJ3zzuhBJBMt+K7sp/vKnS94tz7OE/zZxO9pwF+dvWNVXMJrZ7YozjJX1PDk
         nLWWl3EOUihKDGHyYfGk61SSY8DZQJ5JPw22NlwZ+L81QaD4S17aCwVSifShvwwvytm/
         gL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017184; x=1783621984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jj/d7NmRhn9U9+C0ZpDDeUtot908Z2SfLT/1dmj7J9w=;
        b=ElWlG2b5jf4ga6jYGCldeWdsv9XTxCHVVHWZEVFCuVie3ci5e1VeUXHdYqtH3Quvto
         UxRxpnioLLgbLIWgB9V7iBh35ty/FSWddEnmf67C8Ncc/LdFr6eykTyyxJKOA+DNFHVw
         fEnmg6fy2Ri3uIunGw5yeQ/iztqgS+1L61Mgs3BKi07l+PSxYdwct6eEAYWOr9xoPmer
         W8RjRsk65HeGv9pDm+519NLdRlw+KnnLp2h99qJNxgJndN/3Z1WFut13bF5w84gjCHQR
         MBRDPiNQvIiZc5S6uZx41nDOnP8e0dyaEhlBAvC3M1zb7PaS79B/H3BcQ7A6Stn5k6o8
         ioAw==
X-Forwarded-Encrypted: i=1; AFNElJ/lsfWyVL8UYd4ikf6Ik6BYh5qvyE2lQtzaBahctoemGp23acicXwesD5+guVNFXvPTrzLZhu0jHaxS@vger.kernel.org
X-Gm-Message-State: AOJu0YyWcPV5WpnEFu5sV+q7eW3MOSyZiiw3vQeXFwjcTs7kdE3eAip1
	YEc8T0mI4MXTEieydCNMpKsIEGjdDYZV4iiM/A1GUyuMHaJ9als9w1EgRJW1mrp07VgxqJ30U45
	HuT5O9FsMQl3p3rKDcGzLPEMlCefE8vJf3z7eTEE6P1WRCMtYq2E2zxmgzUurDsgj
X-Gm-Gg: AfdE7cm8CjvkadyqKbw+WPwPi6/E/IzN6D5K5oaAdsX4Oj58w7k8ESnyZRbDky/uNOY
	GDxIDONS+GXfXgT9i+eP14drsnVxpOR9tNSf1NakgTCMUM4Ep7BvbkzjuZvYKHmXAVMJCtTc9uu
	6mLy74E3jKMHYCgFQcrLiE9ztnUEzk21duS4e3rlC1rw27EaxaakljchPvNpe23YV+TOLXea8hi
	bpynpeblBh4BxhFOxRBq4UZeiGM0JMjew6yOtL2y+nrH6lzlgryYy11kqsnmUWleJxnb6t9lFAc
	+Yi7hywjDwLkx+mmhlrrqpvdIMCOP8jwD0q3mZsWnst6M/ec6jgZWTjtMAONQMUeViCwiHsex1e
	OhZA9sMbHcoMrmC2L3OWBWcjrS//73G5S8GEpiUXFNw==
X-Received: by 2002:a05:6a20:918e:b0:3bf:b6e3:fbe1 with SMTP id adf61e73a8af0-3bfed6117f0mr8444069637.55.1783017183988;
        Thu, 02 Jul 2026 11:33:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:918e:b0:3bf:b6e3:fbe1 with SMTP id adf61e73a8af0-3bfed6117f0mr8444019637.55.1783017183523;
        Thu, 02 Jul 2026 11:33:03 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:03 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:24 +0530
Subject: [PATCH v5 02/19] dt-bindings: clock: qcom,qcm2290-dispcc: Add DSI1
 PHY and sleep clocks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-2-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX3XaX4sHf16Lb
 GNTCmORUX/IK7Aalo0QdD8RVC0jDk4xN3P4be6Ch9JwnjxI6QK+qnpMiaOwoS1arPoufSaI07Wn
 9TE54X5s/ePWBLMzk3gdZhV5AIFZJpI=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a46aee0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=z-ZRDpFp9XMTG1_t9IYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfXzTtW3JMhCYMU
 jemeYEUZ4gKD2rFPSCJht57YaimU42nUuMhar4cJ/kxlxQrwlZRCnbyDATFyhT1qLJPI89snU7C
 ZVhb5cFKAM3tbzhoXwfNwmXT/MbqVw6ZxKavlFMtpGhK/4F2zP4xlwJpvWFrBNQlAIuNuHHNapG
 UOq/MQ9ycKfzE77pOSSYSWvb4ULJ1eZL2CuprAW1M4Ocw+HQsP/8XWGvpz9P60YVy2AiFwWaojw
 Fjajzj+sWK9Pst1S4amUQWOPH/m2yDEljzrKXHTkopFIKmOEBIUnUt1GxbC2DbQ0zhobs1o8zPe
 4exu0sdnsPo2jeP+cdH4ZpUgzPrv6joMErWuThre0CFRD2T3VooS598LNMEfo76FjnFjJ3EPXnu
 a5VQ+uQPrGhmxcybfIp1Nh7k/eS2/b4wCZKMuinKZf3SR/QItX6+KeNiseFi9H+rs+rTg2aGETS
 ealrk9KaZflc6spziLQ==
X-Proofpoint-ORIG-GUID: OIQsLRx3xYpzthfPf6NZethK23xkNtDf
X-Proofpoint-GUID: OIQsLRx3xYpzthfPf6NZethK23xkNtDf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020195

Update the QCM2290 DISPCC binding to document additional clock inputs
supported by the hardware, including DSI1 PHY byte/pixel clocks and the
sleep clock, alongside the existing clock list. These external clock inputs
were missing, so update the binding to correctly represent the hardware.
This change breaks the ABI, although the existing clock inputs ordering is
unchanged.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/clock/qcom,qcm2290-dispcc.yaml          | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
index 4a533b45eec2d8e7b866c3436bfe6f80fcd714fb..24f2cce033f6e109b65a79553fba5295eb9adf3a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -25,8 +25,11 @@ properties:
       - description: Board active-only XO source
       - description: GPLL0 source from GCC
       - description: GPLL0 div source from GCC
-      - description: Byte clock from DSI PHY
-      - description: Pixel clock from DSI PHY
+      - description: Byte clock from DSI PHY0
+      - description: Pixel clock from DSI PHY0
+      - description: Byte clock from DSI PHY1
+      - description: Pixel clock from DSI PHY1
+      - description: Board sleep clock
 
   clock-names:
     items:
@@ -36,6 +39,9 @@ properties:
       - const: gcc_disp_gpll0_div_clk_src
       - const: dsi0_phy_pll_out_byteclk
       - const: dsi0_phy_pll_out_dsiclk
+      - const: dsi1_phy_pll_out_byteclk
+      - const: dsi1_phy_pll_out_dsiclk
+      - const: sleep_clk
 
 required:
   - compatible
@@ -61,13 +67,19 @@ examples:
                      <&gcc GCC_DISP_GPLL0_CLK_SRC>,
                      <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
                      <&dsi0_phy 0>,
-                     <&dsi0_phy 1>;
+                     <&dsi0_phy 1>,
+                     <&dsi1_phy 0>,
+                     <&dsi1_phy 1>,
+                     <&sleep_clk>;
             clock-names = "bi_tcxo",
                           "bi_tcxo_ao",
                           "gcc_disp_gpll0_clk_src",
                           "gcc_disp_gpll0_div_clk_src",
                           "dsi0_phy_pll_out_byteclk",
-                          "dsi0_phy_pll_out_dsiclk";
+                          "dsi0_phy_pll_out_dsiclk",
+                          "dsi1_phy_pll_out_byteclk",
+                          "dsi1_phy_pll_out_dsiclk",
+                          "sleep_clk";
             #clock-cells = <1>;
             #reset-cells = <1>;
             #power-domain-cells = <1>;

-- 
2.34.1

