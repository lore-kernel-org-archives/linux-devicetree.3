Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452190;
	b=dQYsy+ysIRyk8Y6V9ubJ6Bxq/AGB3sVMWrLbKJNtKEK4EiL6Z75F0LdFlWxCvtI3uUio
	 Y+AkVYvvRe+XBpQpXy2VuYr3rGZvjNXfqQmPNmU0peJibKOXstQ1XTW2wpym++if8QhuI
	 bJ1ITf3RfSvbvx7jfDE+1ysD6ScP/1BqibHzpjITKGtFsFcxMjwu8xX9d5Bd+qVeaf/ic
	 wp3ezrc6enpbB1TH8BvkxBOa2TmfdhuPit9fU3sQxrTjscZXpzSKbvZLBIN9wWCvw3vkr
	 GpDcNIes2RYw6VJvHDrtaOo6u59NVPXVRb8dSMwfUOguyhmzH8duMy2+IOk96unjBZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PgY77DQATPslxFPlvaaQ1+Q5yfm9UY3HeeBoTnYXC4E=;
	b=r5G1dsH53zx8no8hOtyVpFKrBElGOBrivsChxsiqmkz4kDQmtSrUxkWybfHI25pqTrGq
	 MAp/s+ji3HI+aKnTB5W0Qq3OMb/pd4z5+4UkdwPcfUFRv1stecCBsZENmz68EIAUXoSAj
	 mUVy6Co0NOd/T3Am/5A/FEqSDIKeMuVbkyDe8wwh7ZFi4Lcxsb4teGkh/PcrKXUBm96Ox
	 rF1cQtsKiE6q+cVCHTtRore7zzB59IZzv+BCdnzldS5JdIlnlAOLDHuu06gTcYcbmkyhh
	 Ce+R4J1FalChWLbVOqjkKnL8Lx8OFySqCmz9xmqKRuozAR5hsii2YvQCUDhDqJ5ZjEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Ez+CYzI/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qr1cLOQa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C091E606A68F
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C091E606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ez+CYzI/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qr1cLOQa
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGpq62769015
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PgY77DQATPslxFPlvaaQ1+Q5yfm9UY3HeeBoTnYXC4E=; b=Ez+CYzI/AUVa4MJu
	y/N7F9NT+XsRTH0kSoS8+h5QK821aBadbEBGWlRawp6Bk45sbGMe9DPnagRw9CKe
	XR568NtA5Qtjgc3QofGiriwHfOS4AeGXVHZLVEhjmW2iP9lRQS6Um+noIY4gwAVQ
	wH5TmFKT/CXq6dbmUC4QMT+e+kImzZqVw1b5ueKm7T655IgkVGRJdkN7dnhidJWJ
	Op7iQI1J9NgCa2PjgShKS01BoY509R+s7q+NTafMHx4rveVHQb0uSZih9OnyxTlD
	xVmTXhrlFGpOaPddUh8dS+yMaBfj+EFLIjxlU/ILw/CT31mX8XMon3RpCjn2sXgm
	yPufXQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pacdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:43:08 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ece7e4af28so2596234e0c.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795452188; x=1796056988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgY77DQATPslxFPlvaaQ1+Q5yfm9UY3HeeBoTnYXC4E=;
        b=Qr1cLOQagWRRghXoXdukbKBnL0X8gDYMLIaKfcjoa/FyRlE2F2aUlbIOx5rZR0PQ/8
         oPo+ryT/sZd2wNpT8Lhjfxp5MfCALb+93SUgswLveurkWqr4EQ6bbYd6+J+ccdrHWl0m
         k/6LnhLMcaYI0QjqM29xViRgH36lrKPEBNeLcAGpLudniCuyg2Z9aSOvm6ymPMjzHHIB
         T6kn96d/eBl5jueBvqphw16VEHYvDhSXh2fchW3z5qFaGYQ+Ws0ExBbxkeS1IZnoro8W
         zZtqyq220IadLbCNPucgwNHVNzEure5XhO5Hf3CkZcuBpaf041D5CnnqB3is2FcaxNd+
         ZvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452188; x=1796056988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PgY77DQATPslxFPlvaaQ1+Q5yfm9UY3HeeBoTnYXC4E=;
        b=CsoEqDklPU678GSYt7vFzZ/JxgCSNaW8uYYOUd4mt+s5DKUpg+bYbhHPrrEh38Y8Id
         iYKgZkl2avLYAdca6FF8bpvd8nIocUJpIBnydeZUoaaIQBNSLB3cphcUkaXyoasF1Ylo
         Rzd/4xTmbnXnocPnmT31KlJHO+pgVVwSle657FrLLV1Wfuz2X81UQEdW3JsTSSuPQ5eA
         1U60NRnxuuAARQywmd5cwBWG3aha2FODtMBbaopRA7XWOYgzgToVm/9v8MoFXcB112OI
         CSzNCL50C6YkeZUVUk57qrxnv18nwcyR8niLktztoclnH93GnEWaprva8G/zQ9bg19N1
         2FCw==
X-Forwarded-Encrypted: i=1; AL+hErGVuWoL6cEWQQ+dK/jt2hTOaMXtgAvTXrgIsATAc0T+Tf+YObFNXqszZf9WVzA9alMB0nGvB7Qcigh1@vger.kernel.org
X-Gm-Message-State: APuU4Z+3OumvMxgXwMfNpzu3Ak/Dw73PR7tS8wdpB1TxD/NtmD+L759I
	fOnPpn0epQWo7969bhUIb8HLtOgV3WEISuttQofXFBzeTKppllMwnWZO0I2CjH2gjvW2ExnLNCa
	jZHx2nfQGjA/UXXf9Rpu9Xf9AcqLkko9R7TsMcVBPpI+9xIvBBLL1XbGKmG7HnD3ESibWDa43
X-Gm-Gg: AZFdTZdZ9Iu5wtXtz9DJdwysgaL6OYJNH2UwmznTF8FvaNEZL9yeS2Eqnz0cU5365UM
	bC6qpNjzyoubvAZIvPrQRwlcI6bTiZ+5QdQsI/nglrOpNAurw0wLn3JGmVe5p8o2UODMrJ0DnxX
	ou+x0x1IOfHd41stTr0GvgJUL3qHErX473kHQFkJjulae5gJI0M4ehN+I7AmOnj/k1IHUV/fCZT
	rElYBi84NGJHhh7ZQW8vfxpH9mhEaR6d2FQeFW9RbDVvFhNArPFIpW7CduwCELQMCfCfMGP/5tB
	bof6cbk+XgAEF+mG7C6DsaK9pXHwFv2M/VeVkqLKq6yt2oZFxSJFyASrbN6l/WEihArhT+rWKJY
	Yzd7CDyHcMYC6DT1byyiyx1ascno5o+kfa93I5hPxODgO8X/D38OG72g6Rz273k9JOMNSyG70Gs
	wb8kTSfC5TV+fp
X-Received: by 2002:a05:6123:6:b0:5ee:9000:106b with SMTP id 71dfb90a1353d-5ee90001d62mr3741350e0c.18.1795452187887;
        Mon, 23 Nov 2026 08:43:07 -0800 (PST)
X-Received: by 2002:a05:6123:6:b0:5ee:9000:106b with SMTP id 71dfb90a1353d-5ee90001d62mr3741307e0c.18.1795452187438;
        Mon, 23 Nov 2026 08:43:07 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm426725366b.80.2026.11.23.08.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:43:06 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:42:57 +0100
Subject: [PATCH v2 2/5] dt-bindings: soc: qcom: eud: add the QCM2290 EUD
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
Message-Id: <20261123-qcm2290-eud-v2-2-9bfc432dee07@oss.qualcomm.com>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
In-Reply-To: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfXyUu36uVvK7g+
 TrIT19SeuB4suBH37SZnIjMXEWI4elkybuv22A/73GnRxcwV8U35I1tAzxtISPL+jvs9+5pIbIA
 wjQ6MKUKaTaR6RxE0YMkELBvzo/SJH6A7Vj74mQuNMm3ZN0Pjqq2sLT3mO87dGeUSNdM8sdRxV5
 fx5wLnKTwHhlJQAAV7G0U6Bq/DBpYKyiOV7cghzU3+67vZP1xMriD+ItOhsTFQktgH53CeUNSmO
 GPdn7zoqQvo8WRDDwGb4W+eCqNQg2h5FTL0W+JykACzdqOIflXK1Ixe5W/uLHvSnPt9Jef8A2oz
 Xms2/c5zKws0Zp/TyDG+58PERsxrFiLdEkLt+jXR/YhYCq7fGqxArnjYWwR39YP5TzH8yLAldmd
 0tkEdVNjDGCgEQNolSFTym39m4Gf7tlXsLCcPLU0RFJOULdH2t+pa9iQbjUj0Ql1q5JPDmoZvWQ
 G0zOcwbG9B39tR/uUxA==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b046d1d cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GBRnKKbz5W7R9ATGUUsA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: vFURAcGi9Uz05OSkb5sOwcMZXtMKiAb2
X-Proofpoint-ORIG-GUID: vFURAcGi9Uz05OSkb5sOwcMZXtMKiAb2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX7My8gfKi8ByV
 jwE2nP15SqGRoqgV6uPCG8D4nXg4jDpdRU8cOo339bQ8Rie1gJwuOYeWaz8lrLPi/YWYg2jb303
 Nf48EBShYiFJRFoyx/DG0ydBD70qFNM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230066

The QCM2290 has the same Embedded USB Debugger as the SC7280: the EUD
CSRs and the mode manager register that the secure world writes on
behalf of the driver.

On QCM2290 the mode manager additionally ignores the enable unless the
TCSR register TCSR_APSS_SPARE_REG1 is set first. The boot firmware does
the same before it enables the EUD, and the register is written through
the same secure IO service.

Add the compatible and a "qcom,tcsr-reg" property that points to that
register in the TCSR syscon. It is required on QCM2290 and not allowed
on the other EUDs.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,eud.yaml     | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..bea03468a499 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcm2290-eud
           - qcom,sc7280-eud
       - const: qcom,eud
 
@@ -29,6 +30,17 @@ properties:
     description: EUD interrupt
     maxItems: 1
 
+  qcom,tcsr-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the TCSR syscon
+          - description: offset of the register that has to be set before
+              the mode manager accepts the enable
+    description:
+      TCSR register that gates the EUD enable. It is written through the
+      secure world, like the mode manager register.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description:
@@ -50,6 +62,19 @@ required:
   - reg
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,qcm2290-eud
+    then:
+      required:
+        - qcom,tcsr-reg
+    else:
+      properties:
+        qcom,tcsr-reg: false
+
 additionalProperties: false
 
 examples:

-- 
2.53.0

