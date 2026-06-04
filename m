Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DAF3BFE26
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 05:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550800; cv=none; b=BGc2wnQhZPjDrE5kzV8FGfM8xXLyHYm87zJQ/zTX9zCdCmxhoMgWl3EXHK9+vnthgLoVbdh2OB1dtT+VZ0SD6NUv6oPz5kLq0E5/VzvEa9xr82T4b7lYh4Jc+lCbuC+46T4dZxzZMovWJsAr6eHa3SJnyHL55ra1FFCE1AE/k0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550800; c=relaxed/simple;
	bh=B5z29ywrBKYbX7HkV5T+1ROTV9fAvOR3TfGmv4njIVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lWciqyr4rRcmvnWfAqlfe7b7AiHk06qGg4u7UUJbqPmalHEMT/JZRsTVpzhLeTH8auvuc/oi5Qg+7+QPOsx2n8uWHZ/mlOUxDeoMyD+w1lvOxn2enq2O8MA4qOT+jRrQP9tjY6pebJs/lIcJuE/71rEftqKf/p5xTeceTdZrbfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bRmE5MB4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YxqKUiMk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bRmE5MB4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YxqKUiMk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6540ObEt1476759
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 05:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZxgtPE3V36We0kq/nIqe2bKsweupeP7AxqN5pPOXwg=; b=bRmE5MB4NDUX3mYC
	eddDc3+alG+LNsu50nSnawTmxqiT9Kw5IlvjUhhxY3sCgiErhkaJ8/UP8ZPHqtbi
	+wpjGriTF+PDLYOMgsIu1cIggPK0XC2r2Vmh/+DGYACwTWFX5NcOr9oP/KH7Sto4
	5VguRwM28dXHMJSByPz76EijkwrVvicVVE/7G2fW6HOqVzxeLAROPctZSEo1YyWr
	ife7tD1TnLHHT0XO2d6HWu1pN2q7Rgf0WUjDn32b+j/OoTUu8pgk9n4WPUD/TawM
	AdhtXoUv/IsHWs7c1bMXX+QD28NvsWRqk5bvwOEU8VL1ZOAAp379xsWva/fxzaLx
	znVEFg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejp6nu4km-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:26:38 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8422a0eee68so513980b3a.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 22:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550798; x=1781155598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZxgtPE3V36We0kq/nIqe2bKsweupeP7AxqN5pPOXwg=;
        b=YxqKUiMkX1f2Rw3TT+qGXgclgo9Omk2EH72plE8t/bZnig+0v8RcqCQvZjpFxuf3B4
         Ljsp62ptXGwusdSsq95U1Tu4jo08OWul6wPY+r7Ls6WEkpCsQp5QvdZcFl4tOJmNyBJx
         CdvjnWmau/pKqQp4vnf1V763iIj5R0vSU5uQazVkOjJUaABWSg1GzvF8gZlL7LFcH1E0
         RakHVz6v/hr9kDw2oYkLO3rK90IzZmrn2nmnSw4GsEkXkgJuvsAP3UwYLrYF4wUUdiqr
         Jb8HjVvJ0NwRI93+f6dnAmZ8WpXghY2VbTM7XdG3AjRKD3dugw8Dx1mU98c/6C1lkkQG
         W6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550798; x=1781155598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EZxgtPE3V36We0kq/nIqe2bKsweupeP7AxqN5pPOXwg=;
        b=nwQ8VNB4F3RY+Kz6/+hPzqjjH6sUAh3EqXEMHJs5V6D9ZPkaGSlWowNoh9Sx2U0A8P
         R45Mly46Q2iBnBkY//ZNT7koLUzmToQ4k6bN2UvT+kAX3g/MjOLtolEfTm9izcKEbiNs
         t30ndDKVYZMfXCuStlu/2WhPRtuymZAyTBu/YnEfMXyzQrTYRXSJlGhagTf7woPawyQZ
         F69qkOi91deK47OFQdZUnOM3acyrnXtZwDL8+iqtPgC5ob+ELGbrVFzFAic2IPEn17cj
         drslaXHcEXXPkm4th6lH5K7zoa9I1zn2sfPX80q5iF3cF9pjoQtSRe/v8WzakdSd4IwF
         fwcg==
X-Forwarded-Encrypted: i=1; AFNElJ+3xwZpS7rGZ/5ubn4k72dB747alBYgRZ2JD0f59G+ZcQWX8eFIHAqxLoviRz8d/ExKMWcVTRJchpQd@vger.kernel.org
X-Gm-Message-State: AOJu0YxgKDK5n14EaDwZEJKSBvGIEAfcB/Q4ZaO7++PLvs8ahC15Z18H
	SnGhSlCJ0VuZmeXdfm79x2KiYSa1eClkKVuru+y4aXtqCl2o5Aq3EB4rO5yyhny3cW+e5De4zm+
	/HH1qwy1jCO5usdo57IkxGd6pEsqUo+GYFEgzRoAmcLp8gBa7BaoNZ4/aMDPkW9+8
X-Gm-Gg: Acq92OHBGGZA70VeVo5b/1uK10MIo3K8PN6DFySruYJ+K9k3YoVag7bfFmU2vkuV5X6
	ETa1j3f79RKnc49rFZrlUujtvw8Ud25BQxmGjv3jNNO9Ec1x/dDf998akveSP8yM76Ya2QrEJs6
	qZwbE68bI2KiHsm9in6Ub3mzA2X/f+FJsLKvBxrWoD0wqiC8XNnDKviTrjuyr9JwA4tTVeKZmhs
	5O9F6I0Or4Fj5Ri/HJFk7Ix8O+ne2MHc13zB4ygVzXH578ZHnhRXRaI9KSR01OwAbiZIoN/VFcq
	5LkUILZ1TV/jGOSMMMLGaawYVgUnlmgqdCn0UNLsePBOQjkLcVFjtxg49DGtxvPev4UmquEJMzb
	l4hSrQBgH43fWjFAR40Vw7bW17GYAeq8xHzPBhFtyc+d8N/iXGbTiVk2LE4h5n6o=
X-Received: by 2002:a05:6a00:f0f:b0:842:670d:f6dc with SMTP id d2e1a72fcca58-84284e8e3damr6205883b3a.27.1780550798197;
        Wed, 03 Jun 2026 22:26:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:f0f:b0:842:670d:f6dc with SMTP id d2e1a72fcca58-84284e8e3damr6205862b3a.27.1780550797778;
        Wed, 03 Jun 2026 22:26:37 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:26:37 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:08 +0530
Subject: [PATCH v4 02/13] dt-bindings: clock: qcom,qcm2290-dispcc: Add DSI1
 PHY and sleep clocks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-2-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: wKGpfaQZ72gTgtBgXI45E9Vu9Ei8KozG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA0OCBTYWx0ZWRfX3ChA87MLI3/y
 dIYyJ2H1Dg7FcMZt8bDCd1C7j3P+34ju/rBh4WS07zEnluvEXgEo5RyjqL/wvG+/I9CgiC6LSwm
 5/754ozuFCHFOm6/ePt8E8U5BXNMhNUEM7u0UWwYa1mmikoB+Q/fb489Z0Nsnb8LSUhyuXNQgWc
 HopGuoQYmDeNzG/Qdnsi7Ic8T8jvP/jeO5LgQIJ8ZTX9TVuEJ4OBn3TYKJDDg3uwKJkzXEdF4AR
 OBQvE3gYb/HsxgaPUt7hv0n3hR3qu0RttI7vS28Wl9jMi5/9JWHmp4Q6t+pjR6TcPpV7HsKROEP
 jpdLrRaq930TVH/vy9oQBQ0u+IFVnhCJzk9sk1U669e3Jv3v+NmlrYhvP45iKg4q1+gIPtEwqng
 joauORd9vYNcXoO2kgMmw0kxQ6grPx7RngQFatecOdLxxENbotK/JTGPTSXC8CDcuT1q2mJNw2l
 zzkGcRrasew/sv9HxSA==
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a210c8e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=z-ZRDpFp9XMTG1_t9IYA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: wKGpfaQZ72gTgtBgXI45E9Vu9Ei8KozG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040048

Update the QCM2290 DISPCC binding to document additional clock inputs
supported by the hardware, including DSI1 PHY byte/pixel clocks and
the sleep clock, alongside the existing clock list. This is an ABI
extension, and existing clock inputs ordering is unchanged.

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

