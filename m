Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783291;
	b=pF+ZC2qEDi9T6vvghRs64y5dSG9QxTRPq8mCnj/ES3Ro8k3Qh6icinnCFfnF2vKG6BYo
	 586LtJVDJO3VB7CRzcKT9maafmyzoaiPO+QdCvQl7UA5LqPAS9zaUyesfccR4aFQy8ruR
	 DldPEoDfFh6j+eMDKdXSR4SBtoIxi0Qe6/C1iVp+1S8/yGMbAgRPXjtJVQRm4rfBChv1P
	 zUaz/mPGw16doSSZ8bEovGfYiLsTatcXbdyXD2+MsTMdX+tUEinuHnWTZSnYWf7CfXNHi
	 /W38OpKQd5tJd6QOOAwb0T4voSDDdGmxNEPk1NCTPAiqzgw9+kMtigWFNDzhG4AaxwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783291;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lLNvy67hh/zUuo17cSVaBEwBaP+1fyl5N0OjhghBW3c=;
	b=dYG7cPjMxsgc+gJ1A162CkLyQWXmhTO8Uvep+DmmjmachXcaTp2r/xVZZwUH3Suq9dQK
	 8+/htFhGsR8ULaoGcehraJMknCs2YL3U5o0stxra6blDN+A9fMdkly9bOhLAsQJ8b46kM
	 qOia8rfIdWVRXAjwPON2hToXKtpSQ+fHVt5c4Hj3j8scCOQXRLwsycZC03WLqcEhjXJ7R
	 P1bfbZr/VJ55vmTdy4Sawgrh2khAeA872dl6W/JpWJcZe0LOGL+ePdciPrWnuzHCjgUR/
	 GAn1KvxkhWIFATCoDf9i08vOffP2MnX7RWq2H+CJQrUhgNVmTXq70POK6cOhW7Z1ZeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pDhZGywj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OdnmxYvz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701FF606A33C
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 09:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 701FF606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pDhZGywj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OdnmxYvz
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KZ9O2231990
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 09:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lLNvy67hh/zUuo17cSVaBEwBaP+1fyl5N0OjhghBW3c=; b=pDhZGywjgW3e1zOK
	J/lyr6z0qNgXUy395nv/t9Xt8E+cHb+ABeGYOkSGVdt2vSOAiOq2xcq5+rZ5ZaT6
	UHNnUeF0B3EKawm3aGNUfW5Q11t3YxIbGJ2N+uDRZT9r7yRL49Ixc+lA0GymSkC7
	jTx8gbczrl9ZtQvTZAPUENVwKMiPdO1cHOV5PAya2sMJ3iP/iaAhCcJOCxKPXG51
	8HdA7VKT3anjLQSuCDskXkl0QxQVaM+UQZskIsunqwPJ2qVjB1BX+Rog4EjkEiOg
	7ImssSZMdEbnNMNFNS0+/00NY/mw1XJxiYDeOIQSkGKXQhDM9gU6GQ3F1vaAwcjR
	gJMW5A==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pkad5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 09:08:10 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-702a9029845so514882eaf.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 01:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793783290; x=1794388090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lLNvy67hh/zUuo17cSVaBEwBaP+1fyl5N0OjhghBW3c=;
        b=OdnmxYvzpEH7RKSpXx46xMBxc8hmMayzUiuhINcg2t1/gTcjxo6sIjitLBEvSGOPHj
         a2UmL95PEecZkrhY3UYsfMBKnI+macbjwZ8rDNFL2XYtOvjiPqnzcnnGELXvGlTgc8/2
         cyLnimShNGXCrE2x10tsqIdWnq5fYPCTGMWr38lswHUoN5IkNe+JU4j5ilugqdNJSCl9
         tNGbQNr+VS7U8+dk46+g1auZVpQUA16dVMyklFvDFVpS+m2DDp/GUYXzizhhx4rhMqbI
         bmRr1ZBSJ0zZVHf9orp+c1MP8Y1Ze8SAM0ARt17OmWprwtCDFeWVIulntj0tkHaGX5Dw
         06pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783290; x=1794388090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lLNvy67hh/zUuo17cSVaBEwBaP+1fyl5N0OjhghBW3c=;
        b=X97aGcko3dsvZIrzfC8nTUNjcADnC+X1nCJoCC5QW19MJNTFM0dch6KvBbSUaW7Mtb
         gaAF6sBv8g6ArZQ5nK+gybfOIguHxud7kAw7rNTqvK3NUcaUUDFskMsOkObDOlDDnVhh
         idjqC3n0c613JJe+JDjy5lWJbBWMpdH0ffqPwqdUlmPbO4sjYzveeC3RDsqhDmXoGJIh
         tVkkUP9HPiPvkcnuLdOV0ztZxMrqg5CN0bXNOfMa4gyHR5VRO1403k+SPsFrJG4kDjMa
         WMcVzoyNq6nBq7lhrnb7R3r1f/WLT5ION5be/z/y5KFkHYTz5XLEfGaRWwlaZEmycZBa
         8+pQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+looPgh6sN/03fn5M8lXFPNJhIAEg81FIhqZ20gUNP6BbQ3WTGBIwwv5U/W0qn98TpOr+fsIO70IL@vger.kernel.org
X-Gm-Message-State: APuU4Z/3Rqz/w+LXOvPmCYbnWjYdwNwFtcKAhil+MgqwsFn/WRJX5Wb+
	sh7oYegzsaWSGfZRwPlnOXGhTHh90O9wiJwuLev3WCrQxl4DqO/Q4MozV9bNMWt6gEChdMwGcj+
	ZCJZ98H3ve195SITDICDCD9cPdgyFQGa0xra1qTZg6r0rJ/TItYH7+W96lH/v8MBO
X-Gm-Gg: AYBFou1kaFBeRUWwXVWQXxTtjJ3Izi0odYVNun4I4+XDhQbGW8MGb/HlAytJCX4tE8I
	ye45zHYsDFrpdY8DCIif+1Tx6RJAWt+eNF+yWI9/bziloQ3iMJf6GQliOx7NVrQPzL1sGEuptQp
	7dhUrT1Ojxa77xDLRybSAlruyFqRb5OBFHsVw/E9+xY7vVNJmJLSgMBTlMDmawudH51iRQlF0ke
	qmAVRLXAdb/6OaH1JGRm4N6taoyJe4yl85A/GgpBfSV6Rd2mIBCoCzRBKZonvqtS0ov+EuxL0bU
	03f92j05YooA92QreR9nog9tjwuBLagPCR/qP/cyRCvn1PyzPVPcVgKPauXiqV2fjrDwF93hpfn
	UfUSUklr2eE2yyO9lsU5/HD8RDMUQNCAqfcR9wCbXOV9waF8D0MXPCNXMHtB7ThJ4YJA/npgM90
	w9cy0z3yl+n10AjKm9NEg=
X-Received: by 2002:a05:6820:83d8:10b0:6d8:1b5b:3a74 with SMTP id 006d021491bc7-714f24fa260mr6089199eaf.8.1793783289669;
        Wed, 04 Nov 2026 01:08:09 -0800 (PST)
X-Received: by 2002:a05:6820:83d8:10b0:6d8:1b5b:3a74 with SMTP id 006d021491bc7-714f24fa260mr6089177eaf.8.1793783289178;
        Wed, 04 Nov 2026 01:08:09 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3d768c8sm1519846a34.8.2026.11.04.01.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:08:08 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 01:08:00 -0800
Subject: [PATCH v4 1/3] dt-bindings: phy: sc8280xp-qmp-pcie: Add
 vdda-refgen supply for Glymur
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
Message-Id: <20261104-phyrefgen_1104-v4-1-ba508fc6ab40@oss.qualcomm.com>
References: <20261104-phyrefgen_1104-v4-0-ba508fc6ab40@oss.qualcomm.com>
In-Reply-To: <20261104-phyrefgen_1104-v4-0-ba508fc6ab40@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793783286; l=1801;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=b92G5NczVP+u6lrMXts0b8MbJ4fUEmJ5769gnZJqg/U=;
 b=Gxv+gaan867+UwoYMh4j8LOZPhDAiDGdwJjc0Nl7Ek5ojWemHz7/FbNeO0KGJ5PqK66Twnqsy
 lE0fE8ukzNaAYc3ggC2LyVdt8uxWo3WL/2KDX7TMWIutzuQT7HxAGLl
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX2YUlK/SBplu0
 nifch2TS28Pef2PDo9M6CmNv7sPjEOhVCbgcz4vX8j8OgEwHVP/GZ1m9vd4fpPHarpcZCt1FC7E
 Y9zLJcFfsHyy5hM6LR09Hxb1sJFITjdYVcbDhvRrZtjYNM7x8eXRvBJSp6fUDwHp7vx2tmf6Dkr
 Cvjt6ZViD2wppqjVJsF4IttOqpqRHhTQs8P2OheuL7lFag7bYNit8tsaThI+9bhSrgBAaJBpA0V
 2OJl9oD66GZUkB9Ri/2hVpI0Ibe3o5lwU1q5mNMWLwG6W1sqsZzOA+PHmeOf90RUJYEA5mCEPvG
 N6Yr9uKUhIV7cmBTJlVSda/RsCWaNUzLBO2f2HVl6uaCkkFxQaS0UfRS3lobwoOUdukZJtyHHIz
 36JbCiy7aYnyQ56FgbIYCxM1M8AuC2Y61bmdnIPTBnJdks0/lCcNPTbv5K+zFm5h20R4FmNXeA1
 6SY5/MGCBk2T1G0Slaw==
X-Proofpoint-GUID: _8PD9z8Ea2WDmpYcg0fwFvVEUteMxdPP
X-Proofpoint-ORIG-GUID: _8PD9z8Ea2WDmpYcg0fwFvVEUteMxdPP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfXzwobcsILdVcy
 8Gs5RN0ECNcNrZtZdk2F5NhvdMR2wrkUlSdSxgqjfuZplqXp13OHOYjCXiMlpwFNrJZR/APH+WC
 BxL7BJ04vIX/a3cWdgyEr4OAFQ10JIg=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aeaf5fa cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=neprlRFrkYi1VxbfstQA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040036

The PCIe QMP PHYs require a stable reference voltage provided by REFGEN,
which in turn requires two separate LDOs to operate. Without these
supplies, the PCIe PHY cannot work properly.

Add vdda-refgen0p9-supply and vdda-refgen1p2-supply properties. Mark them
as required for the Glymur PCIe QMP PHYs for now, even though it breaks
ABI; other platforms having the same requirement can be added later.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index c0a3e1f160ad..f827abaf22ef 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -104,6 +104,10 @@ properties:
 
   vdda-qref-supply: true
 
+  vdda-refgen0p9-supply: true
+
+  vdda-refgen1p2-supply: true
+
   qcom,4ln-config-sel:
     description: PCIe 4-lane configuration
     $ref: /schemas/types.yaml#/definitions/phandle-array
@@ -280,6 +284,18 @@ allOf:
         "#clock-cells":
           const: 0
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-qmp-gen4x2-pcie-phy
+              - qcom,glymur-qmp-gen5x4-pcie-phy
+    then:
+      required:
+        - vdda-refgen0p9-supply
+        - vdda-refgen1p2-supply
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>

-- 
2.34.1

