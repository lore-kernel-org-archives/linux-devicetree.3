Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCDD3C1D43
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362161; cv=none; b=NJpuEpxJ4I3UXV1xdFaHLzQh7mKyTJW+f6CA369J2ryZrVTru4GOeAgRND1fSSgkRkM5EIbpCfDH4Gg1SFMf5+1D1Js4sESCnH8FCbxv2MVH60jHMCUhJbGobMJ4ZHcmQRdP4mEYKToGfWTATngRQvJm81ynP3O8RyhkHE7ZWj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362161; c=relaxed/simple;
	bh=qhRCylRHTRaGD5YJ/0I53n0rejgVTgZ4tzsI5TfFies=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f4PwX1HR9QDrz6DSqmlAkQrgW8bKgLekh/HWAnVB9cbBj2VLZJQCtXtY3JUBSy+btNnEOa6cL7BOQ5cLzBEqGX8rRXaf1lkvKlkHHSfCGFyG3tWU27i8aGS5jkHiNVk4Yks2MJnPhtSTsbdhxUFIS9EAlMbyUJ74JL0Gw72gI48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PX4IhYaZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XPWYYbnG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PX4IhYaZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XPWYYbnG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9ph5O905111
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GBHgqITPjiMrZjSXDcK+2HIpofFndc5Z0v0BPQOXm48=; b=PX4IhYaZKAaU2JJs
	HhCLezqVQ6Nx9eZzMEx+idZ4G2sHefm284a3EW8dBKDHwcLxhtnsW3tcnxjGdLxL
	ziORSXoeuDwvuEgroch1RRC8jnewWYwua3ojB3TYhva+jEJBuS22+t418s5Ru6qs
	xUXjfemf/kLRHl5z6UlTZY35Q34pz4AfYPDkDFCYboOl7ioupz9ap9Y834UG/LAl
	N/M2FLHGfjRgBU0IRs8xKE5TIWih1I2LXkDiAmSjkp+RLVvCOAGVR8E+ExJXr2Rd
	qjvzwQR0gTrW1OtT6p3VZuH/jwXh/iO3fYKw7oN7i0/dB8rPRKV45oXdFU8U26ay
	xBfXRA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyccqrd0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:42:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d33c89a29so15734581cf.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 04:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786362158; x=1786966958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBHgqITPjiMrZjSXDcK+2HIpofFndc5Z0v0BPQOXm48=;
        b=XPWYYbnG/MTZ61ujIPHOXQw115H15v3ytJ4OcpBgG3D4E0EqWXAXLrQEWV0gVcoh0L
         X3KO8XjpJcG7N+MBVYgHMaFLQlbEzLVLi92ckn8sSVARlAclTmJ5Ed9YcqGtLEfKtYJe
         InMT+98ThFDxb90HitB4byXWeEiuX5ourkGRbNdffE+hkOiuN9HYRJYs2c2r26bKKYd0
         PQ86tHpp6vrcaF886huaY7hI+LMMS/MvLhwdeGmHMKrEDZphzDHt1gqqfVYyG6P4w3rt
         9icJDC60msiM34//skaNE5wPrQupgcenp2kW1lm1HPO2mnjPfVYgQPWU2C67J44XOitC
         FJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362158; x=1786966958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GBHgqITPjiMrZjSXDcK+2HIpofFndc5Z0v0BPQOXm48=;
        b=O7e7r7YUnxamyhg7VYtoh8UrnoRl4sRS0S1Ew3SZTNl0SY5CeTGb8vV6EVkOZeFStD
         3kL0EsclL5fODOnQzDs63lzMArwj0DxmJ9QKQyWBJGzbqmeTRWmau8NmaC3H1fCwbf8O
         Rj+awoR59sVAuuPSvJ932CCZg6w2DBAadvET+BSwehTeCbyUwNujAU80LCQy3W77Wb8Z
         5P0sbCvVCYnGdMGYzZqPfXqI5Za4BDLgVMz2jQ0tdso1Bz8QQGsYIaUsWRxdzGGe6NvC
         z7E4khBSsW1pPevcGwXY+AiJxEo0JfbHqOvaHxTcyq6vhi8Sv5ooSV2nEg0SwxDGtybo
         /hFA==
X-Forwarded-Encrypted: i=1; AHgh+Rr28Ex6nzGbZjvqdXr9Hvx2cnUNSebpM/GlWdWSNRSrlRcD374sKllI//NttVAAmtXF8coDyU8oOlUW@vger.kernel.org
X-Gm-Message-State: AOJu0YyE4N8SzfIn8ZODswk+KN04NPy11JKhLNYUmNQbaAmKg+TxCCDh
	1oYZwpa42i7gQgi1vd5dLA7pOh5PFuP78jQWhJOi6Lo7qGvGJLCWw6A60CtaBA+3f5FCu21I/Cf
	XyX772866Wn/RcFRTwAHEhyHdUEevIFr3JG59k6AgLW5n4zPXN1GWGVA/IboQMsJ+5FJXxza1
X-Gm-Gg: AR+sD13eFUs7LD4n3zQnRHjjB4TON84W6T/3QR9eWY4cnXWY8xVp6NNuQa/Tn/qPn/o
	PJHD2zKnZQ2DwWMw/Ux55yrFegORu0+0g/d8oKXHbk+LusS4DEsg+xko1w/LIiVoMzunFWlurMc
	BPKXMVkwjmAvITHaLoJMDf1YhA5ZYpdFsxbH+QtfK+f7g7AJMd6g4hP3fwDfA3xVpgv8IA2ak2R
	GwHiQlJkdoZPFJrKWKFFd9qVo9fzFS1pzEoySrf/8HKsO83SZ0JeCcRGwZxwQ2IVp6Z3005H5Hi
	Q010iKSGAjFj7pZwscnQ/AntUWG4YTgqIylQtrsT2RAuMWBothXpK8d3S/bdesE/aIPJZajFSa0
	EaCyy1AcBn2QE5DSNiNVP99/+zfBQ0lzVYLuQRdYko/3KpZUTJeME+tua6IybiPm/FHzlREaP0M
	ZVUs7Wb4h90mkrPg==
X-Received: by 2002:a05:622a:587:b0:51c:167d:b346 with SMTP id d75a77b69052e-52ce6100d78mr441968651cf.23.1786362157657;
        Mon, 10 Aug 2026 04:42:37 -0700 (PDT)
X-Received: by 2002:a05:622a:587:b0:51c:167d:b346 with SMTP id d75a77b69052e-52ce6100d78mr441968331cf.23.1786362157230;
        Mon, 10 Aug 2026 04:42:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd67ea8sm21201671fa.28.2026.08.10.04.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:42:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 14:42:31 +0300
Subject: [PATCH 01/10] dt-bindings: usb: qcom,snps-dwc3: document the
 MSM8974 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb3-v1-1-1a47e1185524@oss.qualcomm.com>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1717;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qhRCylRHTRaGD5YJ/0I53n0rejgVTgZ4tzsI5TfFies=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqebkoAdyxjLuhPkbluIjiVxsxgMpnlxghHtcQU
 vZW/mxZwn+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanm5KAAKCRCLPIo+Aiko
 1TR1B/4+J4GSbVP4vTiAOU6zugN8JT9A/BvENs3t8WPdfjuQAWRV1eQQTvGQlBhWyINK8JFLCSJ
 p6bWLIQKP2FkILVw8C/omiE0QqndUMLHBkwGQkIbohEBSH4gN9BC8n/qjgeEj6WvoL8kABit9hK
 ySCaC4pibJKE9Tfkw9RTCXy0kbxMym0eoHRbJ1TpK/8fKQdiHrqOqK3jAte0A3AOMI6fbtNp3JA
 ORNKwajHTTJY5tAW3yJJeT6cNzeNIQpI6nXQ6Ic87hPmRXVykE/EyFCaqUiekfg0EjVbR5pa4zh
 U6kEjfrUm62kZLUW7ZMrjvXafAaed17u2aXsz7VoDId/Cj6q
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: HUaqNefqbOHoWiQxsrRlo9TGdJlf1N1p
X-Proofpoint-ORIG-GUID: HUaqNefqbOHoWiQxsrRlo9TGdJlf1N1p
X-Authority-Analysis: v=2.4 cv=WNVPmHsR c=1 sm=1 tr=0 ts=6a79b92e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=lQX3LMpwEkNltmwnNXMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX+Ujdte7TnBHq
 uD4X7tddKYnjUgcuMv2KH4nJokh3xZdDzNBBt6F2+UdlDaixwosMqwwZHqrvUwdk9nDeQFEqGtQ
 rBpuUslkvmHtBkhPH1acczpE9AiDGeM3W7JO8hU1eMI/UMMmLh4Ufd0RB7Uzbjx4EtPe21e5b18
 xZbHG4rZshcDwH4hMeGX4aOSrqx9tLMDMot/BrTC0d+VR22/zL2P9+tc4t0qRRI4j1n32pqu2C/
 w8bCle9gsVKvZYBy/1t5Y+dKkSNO3qnVBPN5tP0B50jp4k0gtVS+v+RSTt47F6ArU0Lo76IMiG9
 va+aJi5nQjy/TBNf1jkY8dNPwn/2lLPTOdYt73mBUCK9T/JixZedP5qEBWcD2N01pxKSJ0COiD3
 fcdiCzZ56Mq4hPiYnisj2WFFJqmYdZ1KwjV1tF+jEkZCkQvrba3kGka6yAg+J8g0JVCqJokcmNx
 zkYt0zspSC1f+7CpzPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX6dXsJ2/Su9AD
 ghsOCuOw4KQgc7HjpIBmg8KtD4GL2/N+0FmcmqUWKaC8kguCQMmRjH4AZLOmgENKtBcrxOVLLZX
 n5Twy9O/V80aKECBAEsQduKKWLxsXIE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100102

Add the qcom,msm8974-dwc3 compatible. The controller uses the same four
clocks as IPQ8074. Unlike other controllers, it has only 3 IRQs routed:
core, power event and HS PHY.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index ea60f7220afe..9f91c8711e02 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -40,6 +40,7 @@ properties:
           - qcom,maili-dwc3
           - qcom,milos-dwc3
           - qcom,msm8953-dwc3
+          - qcom,msm8974-dwc3
           - qcom,msm8994-dwc3
           - qcom,msm8996-dwc3
           - qcom,msm8998-dwc3
@@ -268,6 +269,7 @@ allOf:
           contains:
             enum:
               - qcom,ipq8074-dwc3
+              - qcom,msm8974-dwc3
               - qcom,qdu1000-dwc3
     then:
       properties:
@@ -453,6 +455,23 @@ allOf:
             - const: qusb2_phy
             - const: ss_phy_irq
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8974-dwc3
+    then:
+      properties:
+        interrupts:
+          minItems: 3
+          maxItems: 3
+        interrupt-names:
+          items:
+            - const: dwc_usb3
+            - const: pwr_event
+            - const: hs_phy_irq
+
   - if:
       properties:
         compatible:

-- 
2.47.3

