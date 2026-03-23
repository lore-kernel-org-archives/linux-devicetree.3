Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B773859CD
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256079; cv=none; b=OqAyOJOKkHoIqnO4VRZrHu+kYcV3W05Hf449N//bWi6Wdrp8eLkrrTDm8QodevCTqKPxZN3bU5SWQz78bbBf0ApItW9lOeggxhhbofi6NsQ1SUiHyZqxAhd+dSlfL8DSUhUofFe4foOXBHbnNJnIzT44+PECtFVy7TrbHeK7UNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256079; c=relaxed/simple;
	bh=1uKZ8aQDg19j7IAPU4TihzC+56HOG3OO9Vd/r6Xi+UQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MbUlO0CzWuxbSzedycoHEwT/I0yNZeoqejYWBWT8vTNCjtA+Z4ihtna/jh+kpkYlC1Xqe6M5SNDkr7kGZjQ+8gzaPFpmufbwFnhxT3p9MKratF/2JWr3SavejgFKVxdid0l7TqwYNJOAXYRudnW01jedyGXzzhFkkGwyPjn+9Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ljb5Vz0j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RwWMZ/QJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljb5Vz0j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RwWMZ/QJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N41gou3737909
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IXVzZu7IuOB0wJ1BjfV0mPjnSMVO3zU7g5ti8b8Ltnk=; b=ljb5Vz0jeRBYW8tB
	gIHOx0uvbvhLif4aIE+Fdg4a0kM+6H0B736MYyTx1VRYuoodXTX9dYQ5Y/yCE59T
	ceLY6pGCS08Us851n3rvG2OKT5ASXg6xAZ1y0HGvuKD79JnJ5fAzEX/e59vy/utO
	2sJjrlVeQrofjOdznYlso0aTWC0fRtnnvlkiXEHHTNwas956b/6BSIER/DYAu1NB
	ff58CJDfK2zAbAggh5Fz070jOszCDZgVNGQQFkjOfNcDGg08E+4kfyvBDHG62xMn
	Kn5NfuH63iH74ehYhc0GDg1Pyd4iilZQ/IC8CE5nHL5j317S5b/mgbYVCwavL3dr
	5StVlA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghcepm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:54:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b274f94f8so301041071cf.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 01:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774256076; x=1774860876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXVzZu7IuOB0wJ1BjfV0mPjnSMVO3zU7g5ti8b8Ltnk=;
        b=RwWMZ/QJ3gH/ojHkiQKf7m5SAZlwkaDhWM2Zu3SGKAlypqyFTucVuq9U4xqmaE+OaU
         9nA9uxhK6e23VC7z2bhtTQJqfqVLmgZxcCCaFqVLPIj+NxJc3x42y7EjtYOdz3DU4+b1
         AZNE7sIO0VZY7eCZY5tWjQsoPxvRSiaHFwtWK52vH5fBBT2Ls2CoxbZbNujRl8uF0NV1
         qGE4C/cNW6cFELb3gs4K6bF7MIvFlV8Sh+booOxiqyReaXClEDzx8e3Y3+FctVDvV111
         tIrQJFwFlHl01VgINwCrO7Hy0XJE8+2zot4s29f0uGMnTQrFIL6Epnr2ls+l1QPHdp6m
         BAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774256076; x=1774860876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IXVzZu7IuOB0wJ1BjfV0mPjnSMVO3zU7g5ti8b8Ltnk=;
        b=G7N99Pn8VyTHVKyDTUJUgrBB1F/heMyBWTSyZjP5dPvIYqbGOkSgAcx49HozSwih2o
         4ExtPOWA5/AQ8Z2Er6D9AkExvS3u+CRghQDdm6YNWb4j7IEgyTXTVqtmcjZykKuKL39s
         OrlvtzMXxtWcRO7CrugNPDyrWotN4SvtE0za7SiqkXjCIcZgH1+zeH2xGHhMu4Wuu1ki
         8e8p9+c7Z4cip6FWm8MZ7jhmj9Ry+NgabnvBKNQceaf16iVJAEzaZH2MkPRZxxm8i+p8
         4Jfclj66Y8W5542Ou5LsIN9HX0CZ+yUpk6GQsh5WTZx7J5ABkF7fKHhpXdcIT2PmJ1m+
         kLjA==
X-Forwarded-Encrypted: i=1; AJvYcCW+iUpuVa+BNtloWfkjr9d9m4UlY74ioa1PLQ8K7YjzN89Og6bdMqfqiHXRp2dHEPxjM85HOs2/lxEN@vger.kernel.org
X-Gm-Message-State: AOJu0YzF5mZ6e1gdsFFPFP7pGAcC6nNHN9EfGaYhb62dVRRlUeA0Tr2G
	R40MEPPZAKKrDJRg19Qs9UhjFf5oAASzHBXy/TMAB0Xm0uHDaLXljcQtgyiSGUUk0Mhj+PnnIbJ
	mx5aE65BTWuw3WZslgEePkcEu8BMsmQBd/f8J0bddGs3xDlH94f9OYrfFC8PPQrFd
X-Gm-Gg: ATEYQzwnaT7Y3j2A6/6hsMXC9iwiKWGAfstWyoD6XmW5kcoMMqCI6oo0hSv1PMQBYw2
	8xyoDV3x1Q7RycGAPGjFZcjpcCcksuA7GetYkGNfGPHhb6+mfvMJEYKA5ZdiogkEXp78KP8vuMu
	jF3CjDux3l93xwbKYj1U6Z1fmAmxxjEL7kqpXBzU/LdCDc1xAR6EsGdMZARhZ4R3SnCHlzIz58R
	s/0g6sFI2n77z0WxYIPVwRrVMby+9jl0tGWuE52lJKJl1r/sh0MYu/sbut4WWS9ucNDZy9Mm8ej
	pqpxfhfgjTuMaL1HZYkJEhN0CD8bo9eMmbf7qMZ35Bb3T98KwluHwrpsB0+BdnFN6akRPgUklLT
	EGJiXTfkUQTuMXeueyI3fBVoly//ojnNfM/jkFB0ZOBGv
X-Received: by 2002:ac8:5815:0:b0:509:465:1d78 with SMTP id d75a77b69052e-50b24775795mr223496111cf.35.1774256075905;
        Mon, 23 Mar 2026 01:54:35 -0700 (PDT)
X-Received: by 2002:ac8:5815:0:b0:509:465:1d78 with SMTP id d75a77b69052e-50b24775795mr223495911cf.35.1774256075398;
        Mon, 23 Mar 2026 01:54:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm27911739f8f.18.2026.03.23.01.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:54:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 09:54:16 +0100
Subject: [PATCH v2 5/5] dt-bindings: usb: qcom,snps-dwc3: Add constraints
 for IPQ5424 and IPQ9574
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-5-3bcd37c0a5b5@oss.qualcomm.com>
References: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
In-Reply-To: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1712;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1uKZ8aQDg19j7IAPU4TihzC+56HOG3OO9Vd/r6Xi+UQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpwP+/JPSzgqr8Tl/2TSGRemUyGfEgb7e+U9m2Q
 4jrLUiYatuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacD/vwAKCRDBN2bmhouD
 1xHxD/9+gzSoXTSXHEHXpo8Ehv5Qd8ApU+tyWKNiKz2XZwzo4fKid3mAvbTh8zX421Ok94l4hzM
 VT/c5QmyHXZPoKOPeBCa76zhaoPJ6Ty4s0b/AFcga65YpcZhNgsGikgae3Y0Eqv/0uZt6jPqFQN
 54gtEw4dYvmlYq1xFj7bMTYew/nZqfG6w8/03xeTIzswm9WRaX/xZgYHNycvWr5++oZDncC6NY1
 oOF9Q1mP/tqUw09lwchVDkSF1LGGZ1m3cl+Z8psjCYo1Bid5ytYaZSwSCwPwobQ50vgT0SZtSvR
 NtDpmgPeGUYqcsJghNUhPt+8UiiZM/D/9gvUCXFEHrjC54V86Y0AU98BRMrjYbWr6rpVWGFsx8Q
 kUlh0tE6ojnWppu/XL85NbD8pOMokfWlh876P9uurBVII6Yg8z4DCZXMLsi+HXATku5peE4VSi1
 Q1P+2wtb+TLaoPmmQcSQWEVJ9fprV1YspDTXRtKnTvQDk7uyDsLW4VRtXoU08w3bviu7OB7abDL
 5ax/kxU6uO66zWCyglSCir6xrp9w6J0dwjJCyh1JG6gQ/LM07fJpc1wyAIuqxBdECKo7Oswupka
 HHC3wEU1K8F7FIZoLMwJMZ0WvlVPkreGCzIXWRM5ENcIv5Gfh/qnu/dbtFELXa+NBLCJ+ulpXpW
 g6JPJ/hghZZKq5w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c0ffcc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=0lf9w4cHkrZQXp2u8_cA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: QONPOdEMj02KNHTmWAGOotx3uKXUqiQo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA2OCBTYWx0ZWRfX0jBsXUb3oJnX
 hwRc+2BP7D871X07H80+fmeUkMXn5Vv7q/6Hx4dIhtk8AGfdiwMg2pThN/nFTLe/CSBw/LkB2t1
 u2xUcELtApifO4Z/tAp1Eh8pdYjEbnSqzTdrH8791/7oNNFRQ5jiPWD87jq7QAtm1+XhA5QR7tX
 8xdCCUmprOKqvj5LNji/HZBv+NITVTVDOj/1ML4CwqJbNIHpKV4LKe39s5lPec+9AwW25Ions5B
 684zGxUjQBNy0PAhEcEPJD5dhkiT1sH89qorXz3A6mAC0v9SOREL2LKr6p/e3UkmqM8y3wTdN1u
 JsT/wwPbrfAWuA5pktjKg+TTWtuT1EsbW5PZnpkSRwi1o6lsoSrM2ET46grblLjimDmYSw1Sl05
 OCceDlYr8axZUIp0Vu4Sz629cYdYQlVScyq4nYzBQXVqRGvsWNf+gEj6mcbpogEOKt5OJmn34WS
 xN3eBMpagiTWwV3CqWQ==
X-Proofpoint-GUID: QONPOdEMj02KNHTmWAGOotx3uKXUqiQo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230068

The qcom,ipq5424-dwc3 and qcom,ipq9574-dwc3 are already documented in
top level part, but they miss specific constraints for clocks (IPQ5424)
and interrupts (both).

Closes: https://sashiko.dev/#/patchset/20260319092348.35237-2-krzysztof.kozlowski%40oss.qualcomm.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml     | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index e9e534f49183..603d4cbd2803 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -202,6 +202,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
               - qcom,kaanapali-dwc3
               - qcom,msm8953-dwc3
@@ -489,6 +490,26 @@ allOf:
             - const: dp_hs_phy_irq
             - const: dm_hs_phy_irq
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq5424-dwc3
+              - qcom,ipq9574-dwc3
+    then:
+      properties:
+        interrupts:
+          minItems: 5
+          maxItems: 5
+        interrupt-names:
+          items:
+            - const: dwc_usb3
+            - const: pwr_event
+            - const: qusb2_phy
+            - const: dp_hs_phy_irq
+            - const: dm_hs_phy_irq
+
   - if:
       properties:
         compatible:

-- 
2.51.0

