Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736359;
	b=WbZULpMg0Y1qFbNsm4pXFn4pNV7yraJqBkcbckO4Ia4PshF06K6kBiyavjj707tPoFNP
	 md0cTkMW+UK1ySRY48wssylWsxkUlu8IKPENvi2gbduvWd2GdKWCJaT+A0DtrgUXE5/9o
	 6XYHuK9mzewncEThBhCwKEWpZVTvNx7zixW1wxxl9JwFvAQeLozCkPoIHKuXUcauL+C4V
	 /letPLk/KC2dz0e02K2xF/iZCvnU43YipRbyUpnnNUBYA1s/Llu3XqlcxPyAqa/N+Mm0A
	 9vAz92tDJe9x03pyv+bYO5fgR2SLF4VeoyDrEzL/Nf0dho/+RxBuK0bMSjgyBUtYZKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736359;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
	b=QS5ynGPgXKclX3G+GBBi7tpfbG7cwtd+1aJpVs/K9SZ3GhMbvEEssz5FAWqhDdR0GPPQ
	 Au3TnshUGE5YinEBKGH4EbzHx3tQosdOLFyl3NASc8nxHYMZQ6Esjc6JomKeCm/IXUbBG
	 zK6YaedQ4j4FsGYStnLIIX7ybzB2oUtoNfBNF8MJleHy/Suosa4qFzSJh2wao84JISQft
	 yWhrooK4EIiA/uMowkMe39kxYB3sx8YVLDoZoe8Oh8WeBdRUQXOHfZdU3+yX3Il83t4EC
	 1VRVRXal0WXKFFclU5ZWWgNaRmhkCg+bD7iIuRKkWJDsd2A8Bds+rKDdzxR7zLJgT+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d5Iv1Cnw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OaepFRxH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9C5606A337
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 20:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF9C5606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d5Iv1Cnw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OaepFRxH
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IiDub2058676
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 20:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=; b=d5Iv1CnwTgATZ5kn
	F2knie7kyfihVHGZ45g6zCc5TeK6vVdIDTuBIlPZaKgw7W/k5PCd0iB9gMIbXP+s
	H5yYfg6mwWxb31EFFRDeoIjIfv7JJwuL0QC+WTvlsstRD/fAsjVklLA87IPucSl4
	NiWYUlOiLnalFyDo930YH9B6uCFUSzvXuYBA7iTu3784Be31kmkfRtdv8bAtS3P7
	Is9DawMStKYd0+jZ3HopCEXbtkf+Y0j3WnI7+aBHH5G7ssyFsMJo3T/IN+06KBPc
	J61tnRAxyDhNhkJBgPvqprvtodC5t1qBH4EdxORCqAyumOWGWtdGxa6DWjVkOm5Q
	+RpWZQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhyd19vu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 20:05:58 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc4149b885so3603080137.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 12:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793736357; x=1794341157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
        b=OaepFRxHOzH8r+4ygD/AlHzH47tHJ1o746zasJWN6N2zTh91YFgfazPWcfv9qgTzTZ
         POeO9ury4U7PQRD8ZJyr8XCOvvl7Jd1VWHRgqKF+oa2mLbnqyvx+K5Kre/wvvKAODq+E
         pcYIWgyF1T8nqacnD+wS+hEa4SfegBJV9Rb0VhbJFX45NpbHxtCXDovURo3Je7uVxQOu
         +c1clA6cefc/N4NSlj0YWzdJa6pK5oNN8HwrL6vM9xL4l26IVATZlOZ3XTHDK8FvUozl
         8VhYVveewaYQ5+vgepzl6gZv5liGe/z3LmZ/kLQCH6nf2OuQ25MJ+LcsG7hYBglrbQtH
         en4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736357; x=1794341157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
        b=m61qXS5J9S+HImdnlTqRqW4g5Iy+p6wy/0A5Y9uZw6CfS2GoltWUBgAVpJtK5ZESs+
         70jnenvUOI1B9tycCwK24A25f0IR8pqY9dhfWG52dR5WktBzMQMLNTs1dqflO96nnSwm
         ZIvvZT2iMQm3/PNdEtHtU3Ufji5zl3a4TKYoEMnHyHvFodKzQ4lu0HYwSBPOQIWRokHM
         3UWTiEuKjRn17swca3IM+UXyoo9Re5bko1rXnWL1Xfdob6QxbdlO25dqnajgh0HO0Ppc
         JYcgIQb94mUlrXZW4qP/s2vrpLwbVBJnlwnu+/EwJTvLkzMepQrOGqBLmtHemEQHJkAm
         JQ/w==
X-Forwarded-Encrypted: i=1; AKwUvBwcV9DrZfNDj6OfW00Iifq3y9GeUrRvQx1XqPplZg9wjIwb7Z+qkax0w0yqW3qY4kUXxifvju53TOik@vger.kernel.org
X-Gm-Message-State: APuU4Z97OyCLo8GziGJgMp2vA/Zr0wL1TIOnO9WOV1DzDzr0bhP583x/
	RHltj2ZILuzkOv02rZmrwrvU3n7WYCOVdgqzkiQR8mS+hMvzo8WdU3K6aXrYo8qvGoIgLQ/Q90N
	bw5upSfcnCFKVBoMBTcGtzsUmOPAYddL5WqF4m0RchG7xE+71wl5Bvn8pGYiFqX0g
X-Gm-Gg: AYBFou3RKcnpiiKI30icGJjHGU0RKomZhbysOVdQVRBWS5roscTE2pnKkfwqSaYPrjx
	zuT9yaTUpN96PLd9fanM0CbwZcrjIm/VVglNIfiK+TABttuAectq4+e5MBdxewqqENhy9OEZ8Hj
	r58myOzffTD6RXF6kPme5dI22+ih3If5LHlc9WWxz6GWHbYrmChOWXTGKePH6G56ZkTfctBHAmB
	s/E7t1bj62hswWz6TyGtnVwE5YduR1G8CJSEXDQNGQhyrsjR2iqQxWHtgpPHsFEYpAg6mNtNMZW
	3RD0RJ3JimNtzjm4GROa7nB13vV6k8to5tkSq50ssLvdEFt1l+uNwkeUX2+2ETrCtfVtF28qQQ5
	s0ZIr2nBXsSjiekdDaEjUrFVo3bmORFTI5bvkUf9msY/Sns61fur7JojX1z14FXWlmEmE60Xn1m
	zO1h2iDcxPgAmmxDCjYSiPFWSfiaiDbwrmxLkevF+GtTOoXy/tFvkTB0RvzT/laOpRrsj9ahm0q
	LKlz4A7UC0U1w9WUAkdhzmjFUMr
X-Received: by 2002:a05:6102:5810:b0:7c3:39a3:f65c with SMTP id ada2fe7eead31-7d07226defbmr6266292137.1.1793736357078;
        Tue, 03 Nov 2026 12:05:57 -0800 (PST)
X-Received: by 2002:a05:6102:5810:b0:7c3:39a3:f65c with SMTP id ada2fe7eead31-7d07226defbmr6266274137.1.1793736356506;
        Tue, 03 Nov 2026 12:05:56 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d01dsm358875f8f.44.2026.11.03.12.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:05:55 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:05:47 +0100
Subject: [PATCH v13 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
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
Message-Id: <20261103-camss-isp-ope-v13-3-c2cbf15a39b1@oss.qualcomm.com>
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
In-Reply-To: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
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
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=bp/Zl0ai c=1 sm=1 tr=0 ts=6aea3ea6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: MwGQ4ubSGxFZJktEjFPRH-15TZ57qByM
X-Proofpoint-ORIG-GUID: MwGQ4ubSGxFZJktEjFPRH-15TZ57qByM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX8kg08VOdmFhn
 2KBYBdHTp/FdL4Ap5/LAbp1lrb0jLNxjEAM2O/NpoPOmQhqdstAHjRnygBlBo2ddnR+ZRmYBPJ2
 FDRlmDEAOHV3LSFB+C6KB8lXikEF+d0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX1kg3mGNaMpZ5
 TkV+GcXd2kcP6PKPI+9soxMGUW/9+U80QLKq1k5PX57VFKj3Jihcx4dj47x9/UaOJjdy/lBIXVe
 8m/qBIm97gwJQPFOjZTbr0KFYFUEP5vSyO6gl0Gnh81M85aNgzbMiftN4flc8at/Om9QiatJe9x
 qy4l4o/PApIcj3aoWJmShgE2/v+dhXV4W676K++sLslbyaTEAuldD/wC2Sh3PJwAeX0x0B0Jjnd
 C991uU7LL8bQXwtQppA/xpakNtzgzsXWLzqlBNpc51rjk7VGu0a3zHvWYdpGkM8v/tv8ymhntAK
 tyNFSwYH8/IQhblBIHt+KeXNJ8daLX85i+UPO5D8AbA5n0HXasphl1ZI5On/W2h7WRE3mb7xWsz
 kb2g9LQctmyuI0wnttE3/Wj9CmJSObVCrQmEc421NQBpYZEHcydb2PTs0qCCEcLFuFlO485qftt
 4iGVXXEp8mOx9t/nT4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030080

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

