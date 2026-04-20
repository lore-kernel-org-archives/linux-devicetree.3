Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446E934AB19
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 16:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702600; cv=none; b=epxecWOs/4lnZ79xrXdDMnP/9Y5v7LhNs4woKJACJGvYdBIf/LOgNs1r63ypdjcsA9hXsuuNdnl6W8bVbzpKMHtI4jezPImw7QsWrHJWvBZdcSx53mkFKhtu0+YEbsfbz1pXdLUdItVqRgTrPlyDU3cLKEnobDgtMRKgogCsTMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702600; c=relaxed/simple;
	bh=gTZNOtKDnKUOv6o5sjbDTRiBE2xXCavZB3UDmODGIEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nZbq1qh0hxhn4sImnCzejBm6wwQ0hHnpXCYCfMo0YdLK8rYDpX5JzjydOYCqPXAiWkHGeJ/nMm9SsaJlUZDmYTKp6Pp+KYRjmd1k0ZiV2r2DeiU1OnJy2Q6ongbQ4mnXwxHvPHNU4MZMOMLk37YqCQkRbFPKmq4VI6wtyyvIdyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oCTvEwE0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GhMsIzT+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oCTvEwE0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GhMsIzT+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KBKJ4E3212158
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 16:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gw2GewNU2bxw0H7FSqVM34ZT9I8vF0lXH6p6A3gDyM8=; b=oCTvEwE05VtiJeqU
	WxWAVO+lOsDgBLF8vpJGAXPZe837qP+tlNlBKiQMoGqgecYi9FjCdZ+UnhqV6o/d
	vFdEsV1QUqt/N4cG1gJZDJb2PWFQPC2aZxSo3O8ZtSnfgj9HyuxhSsTFgWRN7n97
	TSWfjAJgYFz7WCYR2JQWuOLD55e/cevoMlNvjBxCAdyX+ZRWtS1diDYm3PndZos7
	JBHfAzD27/oSpUg0CcxsJgL4mbHkr9Yschubxf8+934RlKoRvafISpocifRTw2o1
	x5l5S/v/2dfZo3jizVK7Yu6Wrs47DPRl6ttbLcekuzuhVLLnv1WNPQUrzkr4aWzr
	lzReNA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfcfjb4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 16:29:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82cf8dcd079so2160494b3a.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 09:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776702594; x=1777307394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gw2GewNU2bxw0H7FSqVM34ZT9I8vF0lXH6p6A3gDyM8=;
        b=GhMsIzT+DHSWC4zhu1vmqyWX1smyWq5aP2kVkELFNYxvA5d02pMFcKsi5Ny781AzqG
         WhFlKv+gMP6gE3sBLMMwgd33CmYeQxIGAEUBzEVzsnkDcPyC9ED5gsSnlTrvPqXc8LLR
         z+H2GPz6BCsm5/dXhmnYM1arBLjsSx2P0aZUSoUk8Grj4B8B+omY9BXiXoVIryWI96E2
         voGwvH0+V9qPGyzeXYxRINCvinKVJbuyFKLfjuT/uUh9ENjRsNSAGLqszHPTdNMaIc02
         ADV7C13CUgb43wwNZ3Kk3eG+kJyOZSCXah6q9kvTURfOL2iuImnJIsWXLuc9JCcai8lu
         AIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702594; x=1777307394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gw2GewNU2bxw0H7FSqVM34ZT9I8vF0lXH6p6A3gDyM8=;
        b=lqz1isnDx4+/MrVh5W8POsiXFEWV9CIY0G93UJYhW+LPVF1k35bgb9L8hIMKILo/S9
         MNofU/R5hUyB4BUWCS0VE36pUO8NjqXAEmTOBItWLHntG7fKTg1nCmHU+P7nZpU3wan9
         reRGbihu/Zw1oQqpSg6ZgzSzrK81B0h8+kOYYQPxp6+QQgNWDr/0GjKfkQkhRrdrWCv1
         yfsosQLvWsD9Jgpt8Jo31KpTCNfACGqeeCsE7ZykNFv9Elx7D1U4S7eNoYvgjnhrgyKB
         Evj2gBJhB4azg3QvOOb3MiPmrKF53kHLhYqqsYBxiVIpxpB5JAQ3w8/2MJFL6oaOKRKu
         RPjw==
X-Forwarded-Encrypted: i=1; AFNElJ811ACY1+1TCvcDHvGTH1FqRp+ClkKxWBDXtqrJWquV/2E5Q+NLziKtkZLONIIxE/B3V1qFzM/2QHrF@vger.kernel.org
X-Gm-Message-State: AOJu0YwM+9M0JHqEJBNn6PGON6rNIM9j9dqL3SpQHBEUe/9ZIbkHSXzb
	OEK1/5Vy6z9avnuOXzSxyPWexsnW4AN0vbAiQG3jNIsifxMNXPso64Rt/8jNu1GJSV2sv7eEAs7
	uVBPqpQCGHfxHhHghr2e1c7uJGbjeGQvUfDsqkUzrLM773b1KqlLeJCtwBXVy40Uv
X-Gm-Gg: AeBDietXYMkKuNzNNcXhEXEpo+sRBf2dP55ua6/AYs74aH60eVI9JnnvUHboL9iPfpm
	N1vAld7xMcXop3wrT2Rd8rsVSSAU84wAk57OYDPY7rFpHw0Fqz02OTvHMaok1WTd/hDfp6CJZaH
	2FKIN8eM34gHd0QVS81zJTFkt3A2pxzUAWT1U9dTVJ1Hzmw38EbhCYnNKze8IfMNhwr792i84nE
	4+UoVEfr9em1Rp4GlplafkcS96Snr51WTrCZXJBJjMxT8ZzhHpw1Ac4WdcPt/i/Djkf44U0aOql
	lDaySnFFZqw6GNn3G0NtC7soyn0PhRWza22K6KKA23R2Atpq12oxq9SJ3xOiup07C3I1TBcFZjo
	u6xbAp5mnKJJQdIgkxkpa61zXbyFXfbM7Wrh3oEj6bY97GARHQSYQqAQv8vNLP48=
X-Received: by 2002:a05:6a00:368c:b0:82c:e9cc:f61d with SMTP id d2e1a72fcca58-82f8c7ef3ebmr13956905b3a.9.1776702594262;
        Mon, 20 Apr 2026 09:29:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:368c:b0:82c:e9cc:f61d with SMTP id d2e1a72fcca58-82f8c7ef3ebmr13956859b3a.9.1776702593711;
        Mon, 20 Apr 2026 09:29:53 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm11666469b3a.56.2026.04.20.09.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:29:53 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:58:55 +0530
Subject: [PATCH 02/13] dt-bindings: clock: qcom,sm8550-dispcc: Add display
 CESTA support on SM8750
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-cesta-sm870-dispcc-v1-2-eb27d845df9c@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1OSBTYWx0ZWRfX3SAuYsfptgse
 grUMHfvdnd90U1euPXkgRX/owNGDB2SDn7V21xyUiCupcp7QJYPyztlu7J4fJV/w5KcIJyZMRn7
 3UiIVk4zwuhlUscsdGMA3XkLiCUjV0h435BbMqClY3bkOtaHR9IZTPE7s5WMNLi3lMKIDIaWTeo
 AggXWNeUMEv4vBUR0YOb6fxodLN8JF+DQ7Nd1KjQov91nY7e/I3+LUkGXHB640v9732j6jZjubW
 awKAKy0GWoP7U4cgHCMP45BT39tahMxvlrU0IjY+lmRiJOS7harimz28W9gXyl9Kp5gYOoI4Vz3
 VLaCdvf4I6ilNiX1lOBkrvKoN3gHpuxthugR6ySHqsxeDD5JRYZ7GKrhQBS9yUicSMXdRGsi6J1
 GJDjWIaejHEyDGHowkgaR1WrB/WDj5Mh6HK5giKTurJgMJasyNRLKL5WLATPlrdoxrjsLNSDQ2Z
 22MpJe4yZLl7+rjZxcQ==
X-Proofpoint-ORIG-GUID: EEEpyMKxYSxUMDZwKPL4S2VDQGksfISP
X-Proofpoint-GUID: EEEpyMKxYSxUMDZwKPL4S2VDQGksfISP
X-Authority-Analysis: v=2.4 cv=L+ItheT8 c=1 sm=1 tr=0 ts=69e65483 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=NZKN-6T51pjnxkzzoysA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200159

On SM8750, a subset of DISPCC clocks is controlled by the display CESTA
(Client State Aggregator) hardware. These clocks can be scaled to the
desired frequency by sending votes to the display CRM(CESTA Resource
manager) instead of programming DISPCC registers directly.

Add bindings to allow the DISPCC node to reference the display CRM node
for sending votes to CESTA hardware and the CRMC syscon regmap node
which is used to read the frequency look up tables provided by CRM and
populate this data in RCG's frequency tables for CESTA controlled clocks.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-dispcc.yaml         | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
index 591ce91b8d54dd6f78a66d029882bcd94b53beda..3e049b2160a1781c866bb30b29f0da5c9e156b61 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
@@ -60,6 +60,18 @@ properties:
       A phandle to an OPP node describing required MMCX performance point.
     maxItems: 1
 
+  qcom,crm:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the display CRM (CESTA Resource Manager) node, used to communicate
+      with the display CESTA (Client State Aggregator) hardware.
+
+  qcom,crmc-regmap:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the syscon providing the CRMC (CRM clock) regmap used
+      to read frequency LUTs (lookup tables) populated by the CRM.
+
 required:
   - compatible
   - clocks
@@ -100,4 +112,40 @@ examples:
       power-domains = <&rpmhpd RPMHPD_MMCX>;
       required-opps = <&rpmhpd_opp_low_svs>;
     };
+
+  - |
+    // Display clock controller node that controls some clocks
+    // using display CESTA(Client state Aggregator) hardware
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    clock-controller@af00000 {
+      compatible = "qcom,sm8750-dispcc";
+      reg = <0x0af00000 0x20000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&gcc GCC_DISP_AHB_CLK>,
+               <&sleep_clk>,
+               <&dsi0_phy 0>,
+               <&dsi0_phy 1>,
+               <&dsi1_phy 0>,
+               <&dsi1_phy 1>,
+               <&dp0_phy 0>,
+               <&dp0_phy 1>,
+               <&dp1_phy 0>,
+               <&dp1_phy 1>,
+               <&dp2_phy 0>,
+               <&dp2_phy 1>,
+               <&dp3_phy 0>,
+               <&dp3_phy 1>;
+      power-domains = <&rpmhpd RPMHPD_MMCX>;
+      required-opps = <&rpmhpd_opp_low_svs>;
+
+      qcom,crm = <&disp_crm>;
+      qcom,crmc-regmap = <&disp_crmc>;
+
+      #clock-cells = <1>;
+      #power-domain-cells = <1>;
+      #reset-cells = <1>;
+    };
 ...

-- 
2.34.1

