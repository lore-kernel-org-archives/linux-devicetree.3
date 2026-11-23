Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425036;
	b=rmVxTeWreltYKmHji/r+Bn8vOAG3JU0e0bUy/AVOPxOQI+KpBLhBVyynCmtwJTVsw8tB
	 0bI5QM5GpP0JQRyr7M9LqiSrOyF7bbqJ8xOx5ruEG7rdDGMVjys4VIvT8oAmwSLjrgp9u
	 6OcpRX3FCfnpH1ZSoOphyrHq1u1KUks15KI03At7GBDo1Da2jKEosdDVKN27Qk3gQwG8A
	 0zAbNnrVVotDqIpt4cgjGwrdqaW8gvus3IkXkUIpp1F4fCF4uARZaSm6+eiZyG7cneS18
	 2V53azBGd9PogPMvlh+9FjiR5YWb7XonTdEqaQqNGsd3RZ1jYtsBESvqJ6GXpP6IKaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bEFV+1B8rKYypxbhkr0bp5aOlzPIcTu7b/tbBgs2mgQ=;
	b=Og/JQ2fp3SpBoj8rxd9snxjggBcf75yALOMJ5aA5+iZQs8pQjR3+scfJoFV2lfBrTuuF
	 yHh9h8Oo1edXFT1oe2bTxKts2S6ZoIhv1/KwvikXJr5Bz1cyDPVC6gtQGdkY7IdkTMma+
	 bVV0geujqssvhCbPqHWMf1Jz48WJF7nV0JjGZ5tCyCm6BCPwYuLrO9NqR98jNfYb8C9xV
	 rdLIMontROZunAzgMPQ/iXnnwVsrj08wSQAIb9gT4UnxA0mZT6j4pFZ5Fa5wf0jUYdg+5
	 Jp5AdZeaZ6ejk8bOQFCCDkgK/OfwstB4hAG9jxlIYE3UPqZb+lDh9rxjWjdtp50AG5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pC3tPOtG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R61Dmwgt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2ED606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF2ED606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pC3tPOtG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R61Dmwgt
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN6PMZm3712507
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bEFV+1B8rKY
	ypxbhkr0bp5aOlzPIcTu7b/tbBgs2mgQ=; b=pC3tPOtGbJr7Gnzvnr2IUGdZWHS
	f96cQLRFXBf+RPxdpXEsipNm1ljDqUEFm7d6qv8fk+7MPJYfNKVk3E8IAUnuSa1o
	njUDZOyJm5UiHK0nxhi27pqAd8YWc8h/itjKM2KpRu0uQBlD1XBqldrNfa/C63OU
	5yzSWH71R86HyipHyU4aYCO/F1jnAmEuqPLyaawnWyV2N3rE+FDK6A7jZOtOa2QS
	6cHQDp1xDCIQ39ZgoO8iJvSudtK/fs5MFpIy/4PIW6FfwyTa2S7iRaMcFMdV38Un
	rnk63GkW/vdgcW02twbk9LPYBmqXUzm6cPNfG49RKLYF8ttINIt6+8r4VOw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g740m06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:10:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so3523927eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 01:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795425034; x=1796029834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEFV+1B8rKYypxbhkr0bp5aOlzPIcTu7b/tbBgs2mgQ=;
        b=R61DmwgtWjbUCjFlrYqTErf8DuccdGimjPJaezallQBJuzZJks2QNszrotyFhP/MAm
         XnlgsoHOnk0VeQXADXYmInVZWbiFTzBSCAQoTLfe/+cw8Y3FiAC2AGUFwBiznkJK81yv
         3hE8s+tlMvakl8GKSBqq3/8Tq8zr1kF8RccKwDtFfSwGVT9U3pjoTNmR7wTsf2xu9X4m
         eifwXSdk96aLmMIjG8yidkwVZNk0qNrta7bJSuapRJ3BHDeOaTi6xMPxcy0L8D8lSiO2
         gAMuIgmOXgfhjpRdGCHH3mgAX42y84FwItCLUblbk2pFoKxtju+dsiUbG2800f0w9n1m
         aGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425034; x=1796029834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEFV+1B8rKYypxbhkr0bp5aOlzPIcTu7b/tbBgs2mgQ=;
        b=GzrgGMzPpAnoes9YLWYyBHEg1grOp6P4m4b7X9ZpoPtgFxSIXRrsJaNojGWz/IQNzH
         3/iHvoyK4fT6Xsi7tGlYlOEYaR1cuhq+hRPjRfWu0+w1my0fdsnO4m7zkvCtTLLtBdl/
         bhV5/wjzTuQFmfodMZ1jiNZKvrW6sna8O+nW4T0i/++mfUSWYzHzlR39ajfWu5XA6bsR
         zE3ZpwRBuVS7xzbv1epL1pDjhzu5VQiNF97mpW7QyXfVOzNC5uNrzxO/H81iXBgXMX7s
         ikEbZADiEEnAMMb64nKv2EznVJ2kg2j0HRio7qLAPsXSmYwCS5e+0eOP9VS2ki7Yb4Lh
         sltg==
X-Forwarded-Encrypted: i=1; AL+hErE15uz/F4TWZFl2Wd7jlJqF0MezNX6ABpG8ZDfmcXtSWhXFZoTU+rrNcEO/9PcDxY8MRzn3u9Ww2/fN@vger.kernel.org
X-Gm-Message-State: APuU4Z9FJRlfjuMeT/ieRE4cLQpOOIBQIh7GgdXirYKu/jqLIxm7ZeBp
	znjBlI0T5e5lmUPf403vVt5yXdtuz1AHllKClG0je5LGQGBiA7YPs6UubWvsjQrGLHzzDOMKaAq
	2YQ9dTQu9Y4luikYeuAfNO9dao9EkXoSTtA0wx9yJYDqrCAXfU7FLeVGpOrAmy8KF/SjLV8aV
X-Gm-Gg: AZFdTZcLcmBF6TCsCByh1kt1BBgT/8ffUQH9xcD/lontXM53Z425SE60dI9+rHoxbQ3
	I8/ChEHbXXnFyk+nLKkXTpJ2qIf9S6yp4gkGt3wzBogjnzQvm/2wMOvpT5PISz+kbVH753pXW6h
	Wh+rcBWi3azYIAArdh81I10C82j8xhGmrAmnYIGf3W9o3zlN4pNXjSkMVvlCjfZWkwsUdIOd56d
	IZnz+DHF413aGB3CDfJwOW26lQPKpzwhCCpGEto8i0lv0NHeUomjaA7AIzkhOgdXNoy0RLIr3Bm
	GiY5hvB6PWS2BfFhEzeGUn/4IR2b/LDH7g0kvYDjCwWIGwhRTPujFWLL/PtHbaJTjuyEs0e4cJy
	TYQefmmfHkOiSJPrwPOPLY/2perulRZdi0YWohcc5YCoz5JlTx3QWpT9s/Xd8v4YKsq/4WGK3Yw
	xC7A==
X-Received: by 2002:a05:7300:50fa:b0:383:9f52:e54d with SMTP id 5a478bee46e88-3856ff52e83mr12610671eec.8.1795425033597;
        Mon, 23 Nov 2026 01:10:33 -0800 (PST)
X-Received: by 2002:a05:7300:50fa:b0:383:9f52:e54d with SMTP id 5a478bee46e88-3856ff52e83mr12610639eec.8.1795425032934;
        Mon, 23 Nov 2026 01:10:32 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm58687105eec.3.2026.11.23.01.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:10:32 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: usb: cypress,cypd4226: Add orientation-gpios property
Date: Mon, 23 Nov 2026 14:40:23 +0530
Message-ID: <20261123091024.2214918-2-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123091024.2214918-1-akash.kumar@oss.qualcomm.com>
References: <20261123091024.2214918-1-akash.kumar@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tBNdniiCvBnuxgLfsR92oLzNyb7KYCU0
X-Proofpoint-ORIG-GUID: tBNdniiCvBnuxgLfsR92oLzNyb7KYCU0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzNiBTYWx0ZWRfX7EoR0bS9mvYI
 TD5ES8YePV0TG1Mr+rwRrBqOF43GAXf63b9UT1sxCW5kJAkK0TzC8kAljzd0/kLnoxvtZ3Rvf+E
 5EebJ/gG3/oF7EsnGI33tVfKoIOmbs4=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b04030a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=kY59nFXYWS7NJFzbzp4A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzNiBTYWx0ZWRfXwisTfuFx/YP+
 xr4T5Dji5d4U0NcyurZOI/XvHxAbDB+wlCwm5bQGorY9HOpUWnhWLfwtxbrTs446hcP6GRQD5JF
 VG62xs/HnGgQ/T/j3eGOsGGRGBJmBYpXXfOxeGEmCLYbeXuVI6BcukOdSci95AUoJUAPGTVjdXF
 9bzPjTJySrTMMT1jTBH9AYLSI+oiKLoEUAmM/CEYYSWy7JAOg0WgRf0XtgYOgB75VaxXKA4jFAw
 sfmT1pDRUjanXjRqtfCyHRtL6zYPhgueCkoume9pL4kVKT43zAcGiySVQGUUK0HQP1Ry+xPuPNN
 vnU4QMoM2fK3wD2yofs0JbWKWoag8bMmj1u69RC6eAZU0t6zZ67L5RokjwuDlIrOBhXKjEeqrA8
 uFLsXnjMqRgCOGnuZ1ZX8DygbAYBafgw+KXnmOnQqY586j/tph7fJNRUivlmY+05F+l0OmQkaPX
 vOGJ0Kn/kLKYi2Vp6tQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230036

Add the optional orientation-gpios property, used to sense the CC
orientation of each Type-C connector on boards where the CCGx chip
has no HPI register exposing CC polarity. Entries are ordered by
connector number; an entry may be left as <0> for connectors with no
sense line.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/cypress,cypd4226.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
index d923ef82ecfa..5716c045d87e 100644
--- a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
@@ -59,6 +59,14 @@ properties:
     description: enable IRQ remote wakeup, see power/wakeup-source.txt
     type: boolean
 
+  orientation-gpios:
+    description:
+      GPIOs used to sense the CC orientation of each Type-C connector.
+      Entries are ordered by connector number, i.e. the first entry
+      corresponds to connector@0 and the second to connector@1.
+    minItems: 1
+    maxItems: 2
+
 patternProperties:
   '^connector@[01]$':
     $ref: /schemas/connector/usb-connector.yaml#
@@ -129,6 +137,7 @@ examples:
       };
     };
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     i2c {
         #address-cells = <1>;
@@ -141,6 +150,7 @@ examples:
             pinctrl-0 = <&usb0_intr_state>;
             pinctrl-names = "default";
             wakeup-source;
+            orientation-gpios = <0>, <&tlmm XX GPIO_ACTIVE_HIGH>;
 
             #address-cells = <1>;
             #size-cells = <0>;
-- 
2.43.0

