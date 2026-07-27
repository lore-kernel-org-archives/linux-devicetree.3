Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA91412C1E
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785164082; cv=none; b=qHIF1woeenasiq2EF2Tn6w37zfDFqqzO9wIiuKwd2Vgd0ywcvIjrg7HAubmKk3eXmlNsbFsIGM4iC4Ok98rxr1Yj1xwhDNjxEmqplHD7bGd1/J6deRRtZJFemSHxe2Ed0hRYz+ws59QIaf219H56lkhxW40WaYgh7rc0XBV/GkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785164082; c=relaxed/simple;
	bh=d09lYffK7NKQtWks133wtN3qnkJ/qWtJQRxHm1karAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E5mRklZkrAMTwvOSHtHdEjTEDdr8TleWTmQeL2xZYj4ZrTOVgPRhaaPNHDRYIC+IF2YMDqNv7wBxs/rq7FBkCh5rKV3LbL1552jnTQJI9sQA/p8OpQiLU4dpZUyXSgtRGNKKTYgbVXv/1Pt6ucKnSzDiAYP/MiEyDqghoWolGDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XFj/2fS+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DOG4kynT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XFj/2fS+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DOG4kynT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlixT4061200
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQ2mUQRBJOhBt3jiMHO33GZLC4ik6IchEt7Uxsn85FA=; b=XFj/2fS+55hJQEhC
	iVV5hLgmxyHHXCXTpl93qBg6Z/Oy8achWzs30QSxI7gGB7Z/5M4ar2f/ldtqEIBS
	T796Jhf/s5pO9xRiELM7ZvoQ5lIDiliiMVXv26rLNydIqxbrzcEpqYx2SJMiqAgH
	acVHSyU9RgKNbrealDlSDuj4QUHWXiDEQKVtEMl08HywmhuRFCieX95rl3zci5GJ
	OCHIKTa/uhYs+70dWyGS95DL/uioBOExv5l/ixcObC44QQPSHqskwD3YHQVuEInx
	qZRGW2hJeL8FhU0dDGtzNVYn7IAxKXMRrkAP/vR6enTdFlVmEC2dxyRhprtjVLm6
	i6hDFw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mq19b0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:54:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0408254aso59413501cf.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785164079; x=1785768879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GQ2mUQRBJOhBt3jiMHO33GZLC4ik6IchEt7Uxsn85FA=;
        b=DOG4kynTp6lHQuk3USHeJQtyYG/kU+zryVLf0ToWYIEmrf1ObNPJptGxly92KiS2eY
         uiY+G/oF4PF3yRuPiMhwt7gFnO73EnnPEe2H2dgqi4c8UUbEesmOGBHB4Ix5DDozHcvD
         jJaost61D89tI8nfLA+QhzRPXviHDnwhIVjheWyTEOgxPIPSLAdoq3ncQlZRiJkyTrvH
         8RKeIJgPZrebehSj+MTTukHiatyCYcM01tvKoiDUlqZ3N41HGzYX5RsVvrjwmifcD8uw
         T2lpYgKfEOXAI9w8qaG8s4ge0Xft8WvCIYY9sude6biNamrFUZevIMu4P1WoCkKr4rd0
         p37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785164079; x=1785768879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQ2mUQRBJOhBt3jiMHO33GZLC4ik6IchEt7Uxsn85FA=;
        b=OoLxUM9TvoimDNjAyy0CwEPegui5bs7reQWkiGHiFvmLk5DgaYMhIcb1C18qUT+5rj
         dg3g99waGfQJ18zASATMKCWCezxr3ZYfoSTtfmpDZqovU4gezjumJ9d2LdTX5oxYL1dG
         lQAyqNbJiRkKC0Bw+wZLedTHd4/wyJ+bi0QUDbyXZbv2rxMBLspFbZSi+m2p7cl+kqX6
         UCQeKS1Eb5IREF7KsJSIPMqWykdx5oktRbRkvFT3kssoO/WWaCeCDjiI2clueSA4qtXt
         e8cAGJLgCixSyTthvcW4YehMnOYt823sTAx2LID9Ht6RrPKo9vp1cl0iFhCTOKsAh1CQ
         8K2Q==
X-Forwarded-Encrypted: i=1; AHgh+RrBXOv9G/mgkWnJsISKlPcW9lWSBa0BnvefHKmOt4DoAz+ndvlf7awGw5NwQ+bgL9R/9VBRjkoZieIv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz97pdZJu58qTJzEvkKgUSFF7UJi4ggot+XxcepbYvPowLdjs/Q
	WkPvhd1kTtY8w7u0gZ75VqG+J63Y0OhaM/xGP2zMIlfSvKYEb/brbvKHD1wi/1Jh2HUGy8cnGBR
	zI9lYtwPLBZ42J5tO9V8ax1wsoKxhWmu6d8ix+OPboyXn18CrC/pC8/RXnpaKBW2c
X-Gm-Gg: AR+sD12t4MeFCrMd315SpvXL6UueMZpYZWqfwEpkgLyczih5Rc309Yo3WUkGtCX/GeO
	VZJx9Sy5+0Q3hFLiyRlItvOczbEvlnNy/w6NLhIn23hY1FR/XsisGARip5qbTRE8PkzXEIaDk6s
	qgiGwTxplCySRym6CeoylNw2DT3D8SMLEiKB2Fdxuzm/vubiZUgGM+ZyqDlguejPm0Bernp/29r
	rGy2RAGsBxqOnCscBQIFtvbtjVpwyXb5KpjUFsPEwCCtDBGzazwdo72ywMXHAdb5vSFLjjHODAV
	LipE6rc+koDV9QsrtoMbZQ9ZnkSJlHIq5R7oSEawQtja7JyUmeJrN1pnSR+qnfGjrcyOM87wyzi
	6Qug7CcGZYaREVNR/JlSJ2jzvF3hzxPsmDUYFGi3qZ0H6Vt4iz0DV7jK6i21mfzPMsOUJ6Pg27F
	qrcpfnotZhoYRcl4E4SvohVGOzBos2bqpiE8Lec+iwn1x67dQR6IVB
X-Received: by 2002:a05:622a:1823:b0:527:6d0b:a632 with SMTP id d75a77b69052e-5295d377f2dmr111181701cf.27.1785164078844;
        Mon, 27 Jul 2026 07:54:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1823:b0:527:6d0b:a632 with SMTP id d75a77b69052e-5295d377f2dmr111181381cf.27.1785164078387;
        Mon, 27 Jul 2026 07:54:38 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb594622asm3027582a12.26.2026.07.27.07.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:54:37 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:54:33 +0200
Subject: [PATCH v8 1/4] dt-bindings: leds: nxp,pca963x: fix reg maximum for
 pca9635
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-monza-leds-v8-1-6e7e93d44dba@oss.qualcomm.com>
References: <20260727-monza-leds-v8-0-6e7e93d44dba@oss.qualcomm.com>
In-Reply-To: <20260727-monza-leds-v8-0-6e7e93d44dba@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0MCBTYWx0ZWRfX6Ofvq63AQ03K
 ol7ym2RcZ630Yq8E7kwYmmgR5V9QVZRzQDnooRLwRZKN9g5H+G8rfyma8F4Go58A+h3mZnjcpqF
 RT5Ljk73l3o34t6geCSS7v05BhJCQ8g=
X-Proofpoint-ORIG-GUID: dU6i6a3oMJkWrWDsDJlHYUztiOpbNIXG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0MCBTYWx0ZWRfX8mUPp8KBNn9b
 PYgOV6nQOv0VRQv7EYFjhWgozC0JFxxbQU0xXmEaUV323TBIU4CxFlFgFxcI1u16fgy5drggcw2
 udN7an3SHovjsZ/+ROpqCJoBYwXG8DKLz02Z+ZYSpuOudFFJXFkG/8BI3I7n0sWc8eanVJqhAPX
 cvGQFaeW7jwlNEcsRm7Cvkt/cCXxns9KwcQyIA7LelPrMS7ZtUarN4lpH/9V8bV/4ZEc8P6gkjV
 Uee1c1vuLaglnEmhwNC64QQFQDFJZi1Es7LhpxBF3zxxUAYO2eS7TK1B7ot2zfhsW7R+wCWG3e/
 KDbpq4hbTh4DIWtMkdGjR6kjT0zjS0wZHji0/1J3skK8n2+UVpNtRioSABzLhQcWf/4NjmIhhSm
 7dHXVBz8etQ17KZ/oEMaQwfzaCklbR6HSJuZ8iwEy1M6D4Uc8HTAKmwRP+Y+oLK76BAvZdHOdjz
 yCuYPB5eyscyaGconoQ==
X-Proofpoint-GUID: dU6i6a3oMJkWrWDsDJlHYUztiOpbNIXG
X-Authority-Analysis: v=2.4 cv=TemmcxQh c=1 sm=1 tr=0 ts=6a67712f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270140

The pca9635 supports 16 LED channels, unlike the pca9634 which only
supports 8. The allOf conditional grouped both chips under a single
else branch capping reg at a maximum of 7.

Give pca9634 its own if/then block and set maximum: 15 unconditionally
in the top-level led@ node, making it the default for pca9635 and any
future compatible. Also tighten the node name regex from [0-9a-f]+ to
[0-9a-f] to match the single-digit hardware limit.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/nxp,pca963x.yaml | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
index 938d0e48fe51bce82779c4457c8e99cb6d80fe70..4fda602912f7a9443b8a77e46bc015e244f82e08 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
@@ -62,14 +62,14 @@ properties:
       open-drain, newer chips to totem pole).
 
 patternProperties:
-  "^led@[0-9a-f]+$":
+  "^led@[0-9a-f]$":
     type: object
     $ref: common.yaml#
     unevaluatedProperties: false
 
     properties:
       reg:
-        minimum: 0
+        maximum: 15
 
     required:
       - reg
@@ -88,7 +88,13 @@ allOf:
           properties:
             reg:
               maximum: 3
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nxp,pca9634
+    then:
       patternProperties:
         "^led@[0-9a-f]+$":
           properties:

-- 
2.34.1

