Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768182;
	b=wzCITVVIvWKYdmnLR9IQP4yQQMMwuPdqkMAfGeLFOWDC5Le4/U02X4gAdRutagwjIIA8
	 GUz4VlmMRAJaHKnYAG5eJM/nULsboBsICz07hptvzF4cOXAvV1lieoimlAXRVVpt4t0su
	 3w6a4iqDK3mxad5/6S2G3Mg3idbwkrwEWMl6w0x+8eoTmWgk+zG3wVhdWBNW+54EJE2Fn
	 Kgm9Ag0JZ6NhUfDJxPToxZItX2eCG9OuWEAYQi3H8i/1jVRAVxTXvndjlpnPq3XKwKrf+
	 7lJl4pKoNQk012QO7jU7si9JWUlabEvB3Ew3eoKmb3+YWoQNCEeTtvr6pawr1l3D5xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768182;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
	b=vcFIqwuwM2oDtiCR9i+99lTAM0GkeU5udJDl8JyR4uPRjQTW6DWuFypUIyqDdqpeQ7Bv
	 Yw571fEMfLXJ/OMO0OUVzZmCiv1bjQbvzBeL83RVkQIw5k2/IR8GJGzlKx6zfleUUFhvX
	 muo5pfzpmfKxIeoBvyufLtisND3E6zdohQO1lGkH1pTLoeJ8lgTI/OWP/3zXMtWTHFit7
	 xBPw+Uy8g9iEwRcOgkZ+cyJ82jn5jMSpkAydVYKDJjRYRuZ8XqESG3NJbxxuj15sbocuN
	 ZuqHccMjItaCIKotKhYaC5JpmmlGDfc862FLQOrexqUOR4TLfu56cLaKL/DvPBsAO0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n7W5gKds;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fokU3ugz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8C2606A333
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 15:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B8C2606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n7W5gKds;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fokU3ugz
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6Iar3557694
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 15:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=; b=n7W5gKdsJEkKaidU
	m27qhM9bZMOjL2rv3vx+3p+Ap1EM//wf+CHUjzMKsTBeSTUsNv2+2P6Z7N25EM4Y
	2zI/aZ//IhxJokKwWv1QjCU/JKh0HbeKcETCWtCoGzqoeSe5ov2v8dXEUN0S/Kpz
	5302ifNKU4bVYdRK7URyFJX6pzxJ+B5T5vMfZJ7mquolTklbUSMWHIPqoLJtIfUs
	F4NVJjUFd7ZPKFZ+8ZsuknSKYk5yAujl/Ue/9FCWmtWPTITSZU9wo6PpLDbmuI3/
	lkYEo0QcIM2cvtp4K+oZWI+8QritfBG2dj4PxB4EGNsUT7THzlFMcud2YHo9owLD
	S/C6SQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmjc93d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 15:09:40 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-988bbb0ed9aso880209241.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768179; x=1793372979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
        b=fokU3ugzhK4FNCr7zI4dYcSwI3DDFQNHJxwQKpjE/C4KcTOXj+5hfRQmpvsnbR6A+W
         ACs7xNzeCGHY9moy3G/m1uH/OwqzXxa2i+2jA9A0UP6XSkhiEbpgEDXCO+VCs4b8hG26
         q2BwFpcWhsZt1d68Wg97rK+RVlY8CI0/W1MPVIspLJrKh+mrMJR6HrYpTUB97MgztTlG
         lYm42dfqgeztgY1h2EYZ+FNLTh/UBhqIhdgwVaumEB4TProUGKapohweKXBiXWh9bT67
         1NzK24nMyGVOXF+8hzK9yS40ACRPNK/NQjwKKLcGmEC/WXaQCiu+fON0IMXvk2MbvBXQ
         BomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768179; x=1793372979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
        b=vYBXJxBEltl1t8/C/4hOb+Vw1fg4YNcvO2NGl8owlXR/Q/hXwqfeBnH9H7pEb+gLvz
         9xW03Sr5zWoRl5LHb5XiS4YHa2UN9mxmaVs/ej4aDBW0TzJE1tQQzny0uWAu46+FUmzy
         Cu88+FkWr3t0592e+x/rs4eQm8SeRCQuAnJx0qlKaGjDZd+vLsLvuXzaOKT3FJO6wdIE
         HmJF6D8pyg4uALSWmEkx31iL0dYmUZOgiBcaG0vEVvYkINDEcrkdHlqddkAUvxjwLEI0
         aOZRO7IZ4sY24t35oHQWO2mlX+jyo8zxVPXTZrK0gIMvmYYcnHYPyz57b/3p5j430B44
         YQ4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxi+2gzIWTha1wqJNEQpIbq9F1ek055wAYjparY17P7l2H2o1lVA+/87m12ZYVDn3WgjbOyVHGDff0s@vger.kernel.org
X-Gm-Message-State: AFq9FYIhG78qQx3Ft+s2UjTSGCjruSKcMTUkVfAeqpK4NTHml+4CZC6O
	JxxQYJ74HcZ6IG0+wKllhGgGGiORmggo8H6VV/bNFrjSHq2RBGowuD/ZrUbNB97hssJjcxD5cbZ
	qMPGdr1Z5tyeTbKsUDBsOEGwZ69infTGh59LZfFT/uIf38ZHSVLAITxo3L00+qTr/
X-Gm-Gg: AYBFou2Vj8YoX7ZuWVwT1hdJlo9N5QZKGoGHITUuWP+HYzSLKOuDdwY+fpkkEZ/1faa
	Kr76cDr+Fi5y03sRMEggcSv4Fp77Bqw90qeR+D6tyTn8rH2Dh9oxN3TlGh3d4P5WRkJ95g3pQlM
	UiiDSwgh0m+5wax0FKbspefYeHzELoCgkFmsPaEEYnENHuLBBpVOjlqAl6DI5k4aSe0CdRo1iZZ
	sZ94/HuOQIKwOg04jEbmoY7mRTE80X5iHZmu2QazJ+pG39T0wFU09j7rWHJ0fn7zBUFtiacRRHC
	xNUvTO6yT9SlxTTe6PoaK4XiUipLUcjcb9bNo5q6r7hjmb5kl1/P0LgE5G4A0AKs/dLPHto/kOo
	1G4y4f3H2cegBYpdmZI+++TCyjd76J7y7fPlu1luh4oCRkZvyiFQJKi9gQFXJ218djPxOrNJeGL
	mGkifUNSoYVjkkBWcDxBZvuDOo/eugDIC7DElahRreGup6jD4AAOU=
X-Received: by 2002:a05:6102:510b:b0:7c0:4d52:8cc9 with SMTP id ada2fe7eead31-7ccc32d9398mr1042198137.14.1792768179537;
        Fri, 23 Oct 2026 08:09:39 -0700 (PDT)
X-Received: by 2002:a05:6102:510b:b0:7c0:4d52:8cc9 with SMTP id ada2fe7eead31-7ccc32d9398mr1042170137.14.1792768179077;
        Fri, 23 Oct 2026 08:09:39 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4040d3sm323962f8f.27.2026.10.23.08.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:38 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:09:14 +0200
Subject: [PATCH v11 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
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
Message-Id: <20261023-camss-isp-ope-v11-3-0c2937195298@oss.qualcomm.com>
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
In-Reply-To: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: LIGyQnUWUFMf2EXbox9zpfRhu0T_jFIn
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adb78b4 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX1wc2LUCdEJQc
 sqdRxw0ElFfu+SYSf0h6zrTDTuElGuB473hWN/NjS4nLgf6SEFmxTXaQ6w2wK6O4gqwSelqoYui
 /AvJm6clnw1IDxY3qfNpBGi4TuhRvGA=
X-Proofpoint-ORIG-GUID: LIGyQnUWUFMf2EXbox9zpfRhu0T_jFIn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX9agHLsYuKDW6
 faFmk9044aU1K+MSaMepZ4W5CSYhNH1VS3hTTOIqj0fT+Bmz2mGoZBC7UdD3xtm19zfvZskYGHz
 7maCuPkVVGMOUKEglBi0kX0bl4DPqk3B5XZepgLb8sLRqynXXTXki8fyIm3+mG75yHFMWSKeH/x
 jKVmEir1wb7/3R0bt1wTMLyM1BpkRu1kwwbiSb3ETRqhFGY+5Hp/Fm8Y98LYIMACSIzZ3J2Gh54
 KAtZMd0+KRC5pyRND+sFSYvz9PDvddlyQsV1q9H6i6IVj+3SOVMuF4m93X2+yAM5yH5g0OTtIRl
 i9ypm15K6rgAjTi0aFiWGbrp9/UTH0mN9lB1RLM4QUg8shHc+CrdDc4BrKDgUbg0megXQom4YtH
 DQKIiJwZSHDqELuceqF6Z1ClAMJG9OSoLYHP+sbzqLxcz6eqDve+cQZASDzfWOa0BKjokrwYW9i
 rGHhKI0NoEict+Ki+4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230059

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..3359581bfb13e918bb4efb3bc41749e60d772ef4 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -19,7 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss-ope
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss-ope
+          - const: qcom,qcm2290-camss-ope
+      - const: qcom,qcm2290-camss-ope
 
   reg:
     maxItems: 6

-- 
2.34.1

