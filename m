Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793175177;
	b=z8sB+3+MOTC8F4MMv3Ppb5HMI9wua7N34lIkz6MqVsmGmUxDpxWDNhikoufTf6X3PPn7
	 t0NSYG1Fy+4e7qB7S23su4W1gVsnx4Wf01B5Q74k5lU/aSO4Iwpz0Rps3hR3ePCc98mYU
	 fNQyACawW/Sz6Igk+BwbbMzuUPNy5UuBPXdi1iPMlgczT5sFqDGpikkhKBFuESVgtMJ8A
	 FT0CMorMFWV2Vwxjtqg73GrgfePtvg62dEPYxs0ajKJfvfX/wcx96d853wNBZixF5EvxS
	 1WQfyQM0T0wnKij5RvDABZwuUzzr1zL7FZWjV4Z5vS1HO80k41yhloX8tW98a53fYSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qyDQUFF2Id/JL1J8lTWcyQHlP4OzxlWsI56SmrkK9Jk=;
	b=irJ5GpfrAcuTV54moD55/79Ara+VLMaJdCULDgvdSjCP7DkWud97YmKp0/TJm8yjfbah
	 A70c6XAL528eVevHpvh9mkEWLK9mVVdoBquPCIt77+1ID+F+q/VNJomdq34Ibd5I675pP
	 zZ65RdWQCfYMGAIVQsQk8myl7k+zFM6O4r8YXEf2maYIebpgFDYGnugUIkCaTfS1OSLts
	 tW4XZBVMTBmiHsAq6GYtqFaYAUGR1K9efpvRRlTUKBuHDo97eJOPXOsvSUtODksU1e1ra
	 TefqEkJ5HLByi6bi7IYcNnqcWV9mkjjnjXvZxi1OpwUmqRfa1KvBsdTKefzArabNHig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfQXcz2p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cNv2EDOT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBE8606A31D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCBE8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfQXcz2p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cNv2EDOT
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PUJW1133934
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qyDQUFF2Id/JL1J8lTWcyQHlP4OzxlWsI56
	SmrkK9Jk=; b=ZfQXcz2pF3kgHWDp9VrfXW0NkFEso1q1QljvEXXSvaIq2aYTmB/
	PHB03hJJgGtkmbUWISDDe1iiyEQvjh+m9PxhNEzBO4eSgSQ3vo9b6zbe+X7OVjqA
	HeFGCsu6DWfCuuMHiujvOimGwc2TossBKvj+byweYHMw8J/u16Wnpp5900CZLfAo
	kE+PuJAdZc51lecKf+5ELfAmAkd13k51AqjWY66aEh7J7gFDomYOkSWw6SgD59IU
	6I503z0EY+w4E1vda9HfFmHmc+hH7zAmqHk8sKrnPYxKn3Kog3f+4jjjmwUQT9uM
	Dkn/VJm8+V89xcrKbLuT1FxrySRAS2OaPvA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpu1jd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:12:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so128449185a.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 01:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793175175; x=1793779975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qyDQUFF2Id/JL1J8lTWcyQHlP4OzxlWsI56SmrkK9Jk=;
        b=cNv2EDOT97A+yNuoCbteN4zGiglZ06L0FTJOOjJYwCbvfBn5DMyG0y8HiJe4jXWzMT
         QFFvAEM4TGLGuztVjXm0wmHRLe71dmU9+n+/wmApIIqyh+Cb1W919FSzSZVvqOVcSv2I
         nJHXK89o0Lw9oqaj9voBYdeIjiw3pj5lEATHj/E1nErk03QSNb1gOV+N5T/2chbwgcON
         522xB0EWgoEvoHmMcYLmQ45ZmKX+MBPsL3i+OYFZmonJE+Y37isHOOql/iX187Jj9tu6
         +ckYYoNAfBEgw2ob/LPoio6A+pI7MmZMRk7lOAS+k/zpW7BvZcP+2fwoJwcTG6yPS83g
         nXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793175175; x=1793779975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qyDQUFF2Id/JL1J8lTWcyQHlP4OzxlWsI56SmrkK9Jk=;
        b=khcePNlAKSbGTENUsoxEUzmbPNYw3BF3E5oO5G4l0zJQbTbPf7x1RUu4Rm5TH90+g8
         YXOigM5ERRhHufKAwYj22lGvJgYaSvEoTST2kkYtwRCEyuIgagfD7vdKDTuZQmEXbJVt
         YPy/jYZyiqROn2eO+k+LVhIiMCQ8S0bRI5XhmoaCDgd2oBwQIG4W3prRwICw81echkvN
         XrItuSNjqtoITMHaj0dmA7uRnMlSLk8vHSk0b7zYh158rcNs0T4ONJqJqz0B+jqBuySk
         jvWTy084t7XxUhyN8lu5fQNImIsmWXAYUPgvsvLjb+2B0JZg3TxOVw43+n4jUcWIKl+f
         mRKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZ5EQ1rm993DUkQJuiIATmdiy/xGV8uVZ4aOVs3wWqRxKD13pHSNRsy5EwBKs7vWjHZexECKPg43BT@vger.kernel.org
X-Gm-Message-State: AFq9FYJU/qfpDtL3mw0kWcNrweTGHNonVaeJw+uIOEg4r83qPJIJM8vA
	gey43pwf30XnSVpbSyjkecOea/J5957v6C3jfY7dszf/KoLBaOm6OuJN8YBLuJVMuFCGer8uQqV
	eY0NtHSv0j28jxvV2tNFeKKIhPomftW772FVEkubaLB+wus/KXisu08gC07lc7Be86hhXdKVw
X-Gm-Gg: AYBFou2ofsJES5dkR7H3zNaDbDisWIev5oVuPrOxyKK4LFjD7dkUIw/8liYGXL0s3mM
	Go/USgk4A7kbj0YrSUFxKWMht3RRt0LE3SFdX/rTU4Smze/MXpZTQZZJeSj6EHm6j4mYcIlmjaC
	Y7D87EUaTWMF6gTQysWll6n3n5WHIDVXHXYZd7lfQFqwLM7BrpBvBrrA90xBa1bUR0L8MBdj9Lq
	3+n/Z0ZkSHdKgy2RpgJ0dHUc5zb5mQOHrQ9YLnK2R7IVt46wZIlPpPbCZDAAHf4QdEjZw97Glz6
	lfw+DLBKBR7m7fRQ6I8ChEKOaLgSnhP+7kTsi8MBYEKu9K7sb9QdoF1SY8WB5WtmgHc3zwq6W4u
	FlL2wXzYN3XjEPD0O6n/EZACBxKvheDpeX6VoJ4QxBQ9Mpsleu2ijP0G9f/tP/g==
X-Received: by 2002:a05:620a:6013:b0:93f:18ba:bf78 with SMTP id af79cd13be357-94408d1f56cmr185549385a.69.1793175174841;
        Wed, 28 Oct 2026 01:12:54 -0700 (PDT)
X-Received: by 2002:a05:620a:6013:b0:93f:18ba:bf78 with SMTP id af79cd13be357-94408d1f56cmr185547185a.69.1793175174309;
        Wed, 28 Oct 2026 01:12:54 -0700 (PDT)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm27072976f8f.17.2026.10.28.01.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:12:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Barnabas Czeman <barnabas.czeman@mainlining.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Danila Tikhonov <danila@mainlining.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: interconnect: qcom: Relax child node name pattern
Date: Wed, 28 Oct 2026 09:12:44 +0100
Message-ID: <20261028081243.38562-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5321; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=uUqlSTmTFtXhLMYp1LUAp5AuvOZCnusljum3tVLZO3I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq4a57siYh18pb2JBnQeoruZi8r1IPtsM+O04l1
 yCZv9vFs56JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauGuewAKCRDBN2bmhouD
 1xmVD/9BheKSHIfPCUlrZWpdWQ4iY91ANpbyRdFKdONVcbu/flx71Vt8FSCikEq7MQtfmvxMgje
 xtzW1Vy0o0gCsLjU2aOemIjxBjFU8iFIGYv9nGS9V06VaXz006zZTkoiBu73+80As8KBAP7xX1a
 arV783trROSimoaSHVhEm0xzv1JzTxGXDl5VTqLUenD+vQuYFLcyTv0/YlQfAzGOvBYHi4pg7wb
 Ju1N75LEfEOWvCu4gj/rCGvBcviJvtcrAp7LmDTOXqUKUw7BSbViqpVp0QMzE6CZO8rqAFp+9UO
 BaiOqYJXkD6wOTD1p0NVRBgOCf3YlZlMDJmvSn2vPZqQG3332OPCBgvPOoHdB0+GkTQaP4v0+w2
 Q36yrlKfbbVKtTZ1rytw2RHeQ72OVq+dmI36oAzEUqGqCYf/S8ghE5+IXNM8ycVhRikl39ndFMy
 ATUEdWxGQeEPPpw/rC4jLt0tS+QACZN0HroPh//wZ2SsLY3TDtc/Y28bWLJoXbIImFDUOvhlk3s
 EgSft5+nrIQiHtjrsyEiISKNmmsNZT8pjs/Gyos2+0K9G13eK1jrtMxdyLT/H443mIQ1xPGFDYv
 zi6307QH9ncuWAaYEP96KPC72BVNT1kI+toSjgX2uvofcZPGz1o+lotTg1BSmHnLrbflQyKvpoc Y2pGE7x5ClTJMNg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzMiBTYWx0ZWRfX2r547BeXhOJb
 lNEBVXwGUUKn/OGu5dcLM/CrNSEMPRp9aCHLBONJHDH7RQWmxHZ5r7LuViTUpaYrA+QyLYvEF4F
 AuqDQUKxAoT7+SCDiYcWzIdUp6X/lWwbsyT7nRA8sCRRpYldpJzqej3awLXSq4za6aVS0vZwK8F
 NxUQV1Qq3TBdvWOv8487mjPBoJ9dHO+GQL0jL9m4O3tUNsmm9/T1DqdfOICxdBOw9Tp+gZ5o638
 75+aG0CuZxd1ggpG8IgfYNzRUoc6jnjpkWEJJYIAb+CGnIkNKcUrkMxpFCT7V4fyieSo9Op++gQ
 4c3x7V+9gbceb1gKP2Y11ATWXBbAOAqdwMbxdjdQwly+7Dk7SOWeGtg/lmuauWtlNBEXz13Cp0x
 JacKvRN7b4VFHeozTEz0Mk+S2nFrGjdPhm26uXZhAZ2XnB0SS0ixeLaPuybpdlCmjREWqtK6imT
 Zpr97Sy9Gp6MSg/GiTQ==
X-Proofpoint-ORIG-GUID: jUUYGfsaZ1osVI-keDe_lpRZ7W97dul8
X-Proofpoint-GUID: jUUYGfsaZ1osVI-keDe_lpRZ7W97dul8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzMiBTYWx0ZWRfX9yOKXaq4F5I4
 TWGPFlzxY7LRyyxGOs9Odu8j8ykMsdO5/ETAtCsWZPzBqqLbg+PUhjl7FRnOw5yoOrTi6ioPRIA
 057doADrc49y03sgtpkG+DmrYBpxtjw=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1ae87 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=KVRzILKH43C-bKGDRGIA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280032

Some Qualcomm SoCs interconnect nodes have a one child, thus that child
should be named 'interconnect' just like the parent, not
'interconnect-0' or 'interconnect-foo' (see Devicetree specification on
generic device node naming).  Ideally the child should be just a
property, not patternProperties, but that would be an ABI change.  Relax
the pattern for children to allow the correct naming.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/interconnect/qcom,msm8939.yaml         | 2 +-
 .../devicetree/bindings/interconnect/qcom,msm8953.yaml         | 2 +-
 .../devicetree/bindings/interconnect/qcom,qcm2290.yaml         | 3 +--
 .../devicetree/bindings/interconnect/qcom,shikra.yaml          | 3 +--
 .../devicetree/bindings/interconnect/qcom,sm6115.yaml          | 3 +--
 .../devicetree/bindings/interconnect/qcom,sm6350-rpmh.yaml     | 2 +-
 .../devicetree/bindings/interconnect/qcom,sm7150-rpmh.yaml     | 3 +--
 7 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8939.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8939.yaml
index 534644cccdcb..f8ecfe60a8a3 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8939.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8939.yaml
@@ -33,7 +33,7 @@ properties:
     maxItems: 1
 
 patternProperties:
-  '^interconnect-[a-z0-9\-]+$':
+  '^interconnect(-[a-z0-9\-]+)?$':
     type: object
     $ref: qcom,rpm-common.yaml#
     description:
diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8953.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8953.yaml
index 56cdb77b369a..538115048d99 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8953.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8953.yaml
@@ -35,7 +35,7 @@ properties:
     const: 2
 
 patternProperties:
-  '^interconnect-[a-z0-9\-]+$':
+  '^interconnect(-[a-z0-9\-]+)?$':
     type: object
     $ref: qcom,rpm-common.yaml#
     unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/interconnect/qcom,qcm2290.yaml b/Documentation/devicetree/bindings/interconnect/qcom,qcm2290.yaml
index b6c15314c5c5..72b060a4a193 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,qcm2290.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,qcm2290.yaml
@@ -26,9 +26,8 @@ properties:
       - qcom,qcm2290-cnoc
       - qcom,qcm2290-snoc
 
-# Child node's properties
 patternProperties:
-  '^interconnect-[a-z0-9]+$':
+  '^interconnect(-[a-z0-9\-]+)?$':
     type: object
     description:
       The interconnect providers do not have a separate QoS register space,
diff --git a/Documentation/devicetree/bindings/interconnect/qcom,shikra.yaml b/Documentation/devicetree/bindings/interconnect/qcom,shikra.yaml
index a0c26de94ccf..456b56222866 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,shikra.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,shikra.yaml
@@ -31,9 +31,8 @@ properties:
     minItems: 1
     maxItems: 4
 
-# Child node's properties
 patternProperties:
-  '^interconnect-[a-z0-9]+$':
+  '^interconnect(-[a-z0-9\-]+)?$':
     type: object
     description:
       The interconnect providers do not have a separate QoS register space,
diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml
index cdae0acf3a1d..0024fd29c0bc 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml
@@ -31,9 +31,8 @@ properties:
     minItems: 1
     maxItems: 4
 
-# Child node's properties
 patternProperties:
-  '^interconnect-[a-z0-9]+$':
+  '^interconnect(-[a-z0-9\-]+)?$':
     type: object
     description:
       The interconnect providers do not have a separate QoS register space,
diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sm6350-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sm6350-rpmh.yaml
index 2dc16e4293a9..c62816917862 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,sm6350-rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,sm6350-rpmh.yaml
@@ -32,7 +32,7 @@ properties:
     maxItems: 2
 
 patternProperties:
-  '^interconnect-[a-z0-9\-]+$':
+  '^interconnect(-[a-z0-9\-]+)?$':
     type: object
     description:
       The interconnect providers do not have a separate QoS register space,
diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sm7150-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sm7150-rpmh.yaml
index 978930324bbf..ec08000abc96 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,sm7150-rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,sm7150-rpmh.yaml
@@ -34,9 +34,8 @@ properties:
   reg:
     maxItems: 1
 
-# Child node's properties
 patternProperties:
-  '^interconnect-[0-9]+$':
+  '^interconnect(-[0-9]+)?$':
     type: object
     description:
       The interconnect providers do not have a separate QoS register space,
-- 
2.53.0

