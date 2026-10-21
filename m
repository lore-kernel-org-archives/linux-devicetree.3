Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792561799;
	b=efoeI2jHJWHaOdqbB5c496McotzF4cvzX/JOW7b3vrFHI79PLN93PaHrsDXocymmDK4S
	 /FvU9UGXjBdH3narOcxEwt21N4LN7DAWHfuL3UClSnAyn2f3R65mh/FO8nchYcErc/jXy
	 aqhjrZxfBZPJTL9/tZl+FgbjsVNtSp5oLUzauNMqChkVbwcO2J28CYSjHTd1kXyPX8BmZ
	 IxAmd7eBCZPQ/9LGZeVxE8pdxaWZOqpOoqYZaz8SZxUf0/WH/8wZyajM6VvSNebVkXhKD
	 pFXOl+CknbW/lGdtMJ+qoTyCH4an1sfuP6V7fbQYIrGhUBINZgbEa9XIGy+/AfBqzrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792561799;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DVD8d4W+YFzudkPLzaR7+6xOk4Zd0pVxOH27B8rVB1Q=;
	b=5oBOtl89klQ6FgqzuZKvCPOVAInmt+brYgvqxruDcpkUGxXsYii9jP1kTphT8+Tu78+2
	 hRJmm32yynoK581Hk87DXx8N6bMKlmpQN//+rEvqUi7kwwVUgpjmN4FIBCwMti+a+Uilt
	 ht7c8+bdSOdYpITZREMArUSkUnPrrGLg+v3vRaBi6ZMbY10HQ3lfilsfxIOAUzDc2N0ZF
	 HZUrLjGdH6PdYBAxoSseFyj810k3rPd5vCt+OpqghCt4V71hFEzKidHyR8dcG7mqg6H2U
	 AMkKb4KoFbvvpODUPMOS4+tU4SCqYqtK2+Ogk6CzpYvHbzDOutgsQBSU7qQhlxaXHMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SUPXRecU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J22EuIoG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27ED606A31C
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 05:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C27ED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SUPXRecU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J22EuIoG
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jCt83711978
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 05:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DVD8d4W+YFzudkPLzaR7+6
	xOk4Zd0pVxOH27B8rVB1Q=; b=SUPXRecUCl4EaIO8e30o/xA+RFO9NZeneH/2Bt
	xSt73f2V97jHbY18bdCaFaanptJsXznqY4/Q346Ibckr3IdKAkJLC0GR5tgXjwMS
	YPzFbz/Fo0dDVZk0fqt3b8uXtAtLQXvDc6nQDN3DG6I0+NcWGQ+0Yp9EBnj95+XO
	6sTjRmUCOFJUpphTRmjREHQ037MX6TqrRwJAuqacBY+DZo/Po5KNyvMYCT9uBJU5
	2ynWlqJAnOgcRfhJbhCgyxl1NObES00W4E/vXCaax7NgzXV7UrBbPPaTQeS98MmK
	dvNneblNBOHmIWwc7PQzgOithcBbB+w0DYPVh99S8VccUiAA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v27eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 05:49:57 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36637676140so624616eec.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 22:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792561797; x=1793166597; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DVD8d4W+YFzudkPLzaR7+6xOk4Zd0pVxOH27B8rVB1Q=;
        b=J22EuIoGn6C7l/duMJHQ8mexu2OMXDufJgmw3+FruMDHGoAYVhT+q8TMwMEG5UVoZz
         HTwfOUEwluhS3sNZWWFSO+qviAhUVWeYzIB4lQSpYMVVJJRX91yIcBe4Qz6k9vYRduHL
         PBVjYwmqcXuq3WY6prZPwsMaUE3/m9niDA35DVWxsWasoZ65TYVNPHlrle3k6Lx0Xt4K
         oeigBmb944cuJzRf4dtfDMSW2PlruWBT1lduLOOVy2zn8vqWIhspY2iMWXFWinwTePpp
         XdUuMV3+rnm3fEuN7Fo5/VgLsmPDGTX89foiTMIPjV7FQXS/XqVjo/4Qmx0gQhzW8KlR
         TQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792561797; x=1793166597;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DVD8d4W+YFzudkPLzaR7+6xOk4Zd0pVxOH27B8rVB1Q=;
        b=W3NNj8PEvCoQWXzIpU6H2iTjyuLow5pSFr5YValBQ8kpHd0rIGjfcWhAXx7RouVp5l
         SlNAcCVT3iCGAPUuW9VA3rz8s7NjMUVI8Hn5LngkEShEblRpaVZbpGnh8pW6zH5U24Rz
         9lQHVLBueFK4CIdsJdFwOb6arU4S/9rD8K2w9GxMj7YG/29+H6Ehl2LW5HLGsf3fTPT4
         cmpgzS2fp6+t3/KObjZAxsWQ+W3W5rXlp3MMlSwcGKanDPITO5OwoSJk+j00/xzjOO0B
         AOHGQkDEKutE2PSmyu0MfqEgZi0y9CjfspCMCcjvIkH1qoZ1VbiTR+7RXY0utf0oR7xj
         9yBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSW789WkKS0gW5KKSbmadEDAod/o9nsHhywepTmfTO7PA4OLpgF98an0oZ9RZbB0jOPoLqLi3N00iI@vger.kernel.org
X-Gm-Message-State: AFq9FYKByG7XOaZoy4m4qXLwMXjk755TXa8p/qTnEQCPuRpY1sYfeCvS
	I1UhVEvE1ykpEE2HHFdzosyEKFNC5LJCdHy9dneuoQ/tBP5AX8+yEWnV55PNZ5LHXeF89C7MrdB
	rFCpOWuikPw+RcCKRRYG/VLvKPxQ8yxxU0CoL77DvciAXyCL1R45pnoXAC+aqPeqBd3fak6b5
X-Gm-Gg: AYBFou3wt3ttSO6ZyhSG79gYMyImD9XaKP8rZYfzzeyLY4I2TaS4zS1cjcXdLk2PcGM
	RsE87PBHZfsdjXfjj/w0+ELjj6qf5vfz49KdSr5N+yiJQZru1WTqzhyhI8drjnpMwC0wGGljrRW
	xwznXHDP20ZpyuIjNctnB7C3pM5l6G+AYmSVq5JcIcbt4SVimQYcN509RgxRlRMRAmGzQSaEaeg
	dGw1gx0pP5Iu6M1BV9oSAVFVtbhbxwEU0COYdpRy5zZiR0Pul6hvRzl4AhA1sAzy7TFKReJn9nL
	sL0jSbsaaEvBJgAEL3306xxQ1g/twe6tp870w9vIQyNDrbW+JnmrZbh7srjQ+oavcQp210InU8E
	q8BG1NxMB81AoB7lHcuS9llXTWlHdeTmUtaRVq48ynO8bymzyKNnkhi16IWML8zqeQ92vfa0kuS
	HjqYxbbpjxbNs/YILHVZxeecQOVdFTeQ==
X-Received: by 2002:a05:701b:4284:10b0:165:55e2:2d69 with SMTP id a92af1059eb24-190a7380f2cmr1440624c88.46.1792561796632;
        Tue, 20 Oct 2026 22:49:56 -0700 (PDT)
X-Received: by 2002:a05:701b:4284:10b0:165:55e2:2d69 with SMTP id a92af1059eb24-190a7380f2cmr1440593c88.46.1792561795812;
        Tue, 20 Oct 2026 22:49:55 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903b3d0530sm3656464c88.11.2026.10.20.22.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 22:49:55 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:19:44 +0530
Subject: [PATCH v2] dt-bindings: crypto: qcom,inline-crypto-engine: Add
 IPQ5210, IPQ5424 and IPQ9650
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
Message-Id: <20261021-ice-v2-1-3dfa8f343ceb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHdS2GoC/1WOMQ6DMAxFr4I8NygOiAJT71ExBDDFUiElCYgKc
 fcGmLpYepb/89/AkWVyUEYbWFrYsRkDqFsETa/HFwluA4OSKkOJmeCGBGGb1zqRaZpkEC4/ljp
 eT8uzutjSNAeZv5ZQa0eiMcPAvoxGWr24hErCEejZeWO/Z4sFz8TfwwUFilQWeY3FXXUJPoxz8
 TTr9+GMw4Bq3/cfEASndM4AAAA=
X-Change-ID: 20261016-ice-e1d8ba304436
To: Abel Vesa <abelvesa@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyMiBTYWx0ZWRfX7vkFGwhw6gkx
 0vsNgLWT8vmde9+H59ty6nNRZlkbKXbKI4J67wdLLbW83pybwpkNHVdUHRDGtEc1oYM4drLXARa
 ACTjQxGRKExifxf+LmoYzTVxWYPk198=
X-Proofpoint-ORIG-GUID: v5AjQKtNDBKfRe9CrWuxdypI1RvxGbou
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyMiBTYWx0ZWRfX4thtWwuBnIbN
 o1ci1qku+IdGiuyEuvo36H1n3JS/0d0sIdPiJU4ILKHmIMqLYxfmXFSuCJPhtcZgiXNBMnQ3u0B
 BJZGJfILA74dcA4jLyjlGE0+KNORsHo1sNTRrAWQtn8dND+vsq2i9erWStHao6QFdMNnzgkRvFB
 DIWsv2CapgiHEFRbyh5Nh45U/bdHe/7xesstMAiVRVS2D6ZCRMn/U/xQ53Bp2p5qv5lxsNqpkYs
 A6bX+VMbkUTBfVlVeKSQ6zkP8BNJrbNONdBo+eeN7dQr23oaKqryyWPIpU7WibPvA9J4aMLzkXl
 eFq4PqAwRh9VW7U8eAkwwlgWR54EA0a5QU7GJJOIvtkAAoekTloUBcQQLp4jRULRhi+5CR1MXtm
 ADb8qz9nfJ5jkLb7lPo2Ff5InYuq9/wfJpfavGFefp/uPuFzesxa68Ttyj+Rp+vHF38O+A9HeZG
 cz/P6GP43NTn99kXl6g==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad85285 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Xq4CliCqeop8EqABAtsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: v5AjQKtNDBKfRe9CrWuxdypI1RvxGbou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210022

Document the Inline Crypto Engine compatibles for the Qualcomm IPQ5210,
IPQ5424 and IPQ9650 SoCs.

Separate the power-domains requirement from the two-clock requirement.
IPQ5210/IPQ5424/IPQ9650 require two clocks but intentionally do not require
power-domains because they have no RPM.

Preserve the existing requirements for other platforms.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v2:
- Fix sort order in the !power-domains block
- Pick R-b Krzysztof
- Link to v1: https://lore.kernel.org/r/20261016-ice-v1-1-4098b1972f31@oss.qualcomm.com
---
 .../bindings/crypto/qcom,inline-crypto-engine.yaml | 27 +++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 23bf98c2b9fa..b98c4c6b77f0 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -15,6 +15,9 @@ properties:
       - enum:
           - qcom,eliza-inline-crypto-engine
           - qcom,hawi-inline-crypto-engine
+          - qcom,ipq5210-inline-crypto-engine
+          - qcom,ipq5424-inline-crypto-engine
+          - qcom,ipq9650-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,maili-inline-crypto-engine
           - qcom,milos-inline-crypto-engine
@@ -81,7 +84,6 @@ allOf:
 
     then:
       required:
-        - power-domains
         - clock-names
       properties:
         clocks:
@@ -89,6 +91,29 @@ allOf:
         clock-names:
           minItems: 2
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,ipq5210-inline-crypto-engine
+                - qcom,ipq5424-inline-crypto-engine
+                - qcom,ipq9650-inline-crypto-engine
+                - qcom,kaanapali-inline-crypto-engine
+                - qcom,qcs8300-inline-crypto-engine
+                - qcom,sa8775p-inline-crypto-engine
+                - qcom,sc7180-inline-crypto-engine
+                - qcom,sc7280-inline-crypto-engine
+                - qcom,sm8450-inline-crypto-engine
+                - qcom,sm8550-inline-crypto-engine
+                - qcom,sm8650-inline-crypto-engine
+                - qcom,sm8750-inline-crypto-engine
+
+    then:
+      required:
+        - power-domains
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,sm8550-gcc.h>

---
base-commit: aff5f30d65bddca7e5eb635119057688e6c04135
change-id: 20261016-ice-e1d8ba304436

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

