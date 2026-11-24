Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517705;
	b=4V40PUkFPqlRS89LU+eBRTLpSE35CtmUXMltQFevs2Vs9mj84koNxDW4Z92XO/TeID3Z
	 YZD+e9VgaJhfDTKB/ADVb+KOQG5C7wUn9bdgzV73+286kEIQbDPx166YmS1tD9CnSTquw
	 IEjS4KgwH9aMkf0UGbp2OlXqTkb2u4O3z7FxC414XIABGCK57RRXJNymYBGrtcF6dxa60
	 vrARe6KdJa/tkgeSiUc2HXR7csc2kJXl/Lh1aNpyI8ZEyjsFqE/OcX/UV9Xa9DAPItUL7
	 GPDFitlz/LpccTglz2MeUwMP9WXNbY1dLxWCvV+PExGzoqR+vOS8nC30qdohPsrV0bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517705;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DOV+Vt2yE5UBGw/kGxkYrpMgWcGa2KzKC7I34GIYjK4=;
	b=r9obItsIwvYUdekjPpDEOvbh7SQD+jTSaC616P21iD5qG5cycc0HaZopQc5bUNQ05NEe
	 hIi6P6Yj0VCPQc6XBeX3qT7ovo8MuleMIGTiIZe4vCi8o7VRz600ve1zZXSP6zPMK+Hun
	 wZPnpz9Lnx8/h2PBLGwj87ZNnJI+DOeole1YU+4Xsj9qNJccL7M2R1398o9g0vxPkRaRq
	 17b6SxWfC7NPWSy7ME/w+ibIrqmej0Ux8xlfaWvVReZyvNJbpTktNfpDDwouyZwSYsIAi
	 t2nfp1Uqm4Y9yY+Il6cJNnT7Cp9ujnKZwDcXZV48OOVzmfEhPTTaMyuJrUg0YjtRoPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H8vdGkJ7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PJk5xvgm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E30606A322
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91E30606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H8vdGkJ7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PJk5xvgm
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAcFdH4136400
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DOV+Vt2yE5UBGw/kGxkYrpMgWcGa2KzKC7I
	34GIYjK4=; b=H8vdGkJ7/EnJqDyJmlgndRh8DOjvqf8vnYHL4F2yOij9h8gZy3I
	zK05lpvdUSW5FiAcrMUSfPLFr5WMx2nHd855+jD8EHvqqgMqJVR3AdFJYW3QKRVK
	9ryXzKivtnzfsdDEOUFCHwH7iwQjcD9GupcbD6lHeaKqrF9se/04f/z9JIShFOX4
	Qa4G1bNaYMxvG0KciAH6TX6tIHUGwgSA9sKM6iFSnVkIgfLOJYyK8ocQKY7OuqBR
	DndEzv1YksStRaesKNxSnMCmwAKcAaJAjTt/8Ttw42SkEXf1KRhxHJ5S34jhUXBs
	ivbwl3uPF8hXfcnYO3dwkBBT9xpOhSbiYjA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpha1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:55:03 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386ad819860so1903099eec.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517703; x=1796122503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOV+Vt2yE5UBGw/kGxkYrpMgWcGa2KzKC7I34GIYjK4=;
        b=PJk5xvgmbPtIKieEDDdwgpqvw9UJgWfxqE/H8/T4c55TSCPXl6CxImQbfazRW5oTQh
         jMX9f0IwYITGJi5Hy/V4YUQPZmRLB7BjsWagL7FyyyS/q9jFScKvk1m8kavqKdEBK57J
         tXpYQk+8yJ9EmTRRsnO/AKBwPnowtt0b7QT5JB0BV/yBEXZCj5G3DZlYD3/zFUe+HwLy
         lkBgHaqdQ+Pg4r6iAeiefYafiipFLE6fvHZFIZVD9YNAwLQp5vNW5mKJmJi9yTDl1TU8
         S74cBZ9Pz/9gdWEKa6y7LtHj5F95bBabBNeI9AcxAfJG0DC11AQn3cWJ/lOCC/aehd8A
         0/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517703; x=1796122503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOV+Vt2yE5UBGw/kGxkYrpMgWcGa2KzKC7I34GIYjK4=;
        b=LAGSVS9Md7IE3J6rDSO2fBVnvOyYoEKOmOBfcPXaIu67eOcUZ5IcrgFAlNNIa5DJdQ
         NZX42oWJst2SoCQ3CMLw27LpPjLmDrtUdBsz+y0WolUuNN9vf/bmA5HimurtZebMgjzu
         kgmNvEs+gtk8HMSfZmWjGAiG6nEuym1kQyyLfDPKRzUJi0afBLTB+bcWmBhCSdAE3RR2
         4nqPvGPnEM2zXX41g2XgJLHdtq7FEuZso8ixxqIhqnsR4pbV0yxK55ediylsz9LNgArI
         0Yfph/maIoiXlkvndUT1xfGwGIrj6Q9VLNuiK7UaHRLM6/txAzqE6L1HO78keMnVuvy4
         oRGQ==
X-Forwarded-Encrypted: i=1; AL+hErHAruc3LrvumrCPZjSMmgm8aEzIFj15ADUlfD8lBsSGYvjZjUbHRbsVhzbJn50Due/9MqQvkM6NNt+B@vger.kernel.org
X-Gm-Message-State: APuU4Z9WorkTBe3AmInM6HEfKOcl6vzFf3t5z2zxDkslpkEq/NM8J4P6
	+7HftK0Ye0VFTZbO5W+4TTX3clGWvM2tRV9RmIP9k1mRwez9aBPAF6gojnhplWVlsmsNu+WDrKX
	wIQQtNMFBRXtrLrU2TRM98NjCJhbHnl5iDHMenEwRPWlRtpCvw/cvlPagQpRkwn3v
X-Gm-Gg: AZFdTZdvxzrbgJX5dwvoMztlccI+JiZLntDnqerGive8QwhtZK4SXhDn7Se0jpdC4nZ
	/DXuQZnq5BeK3GogOUx9Lt9WUmXO5WmaoKFaoDPoqeAM9jqFnvtn9sFXdETbcnvkH1RNSnzRY/+
	8jXZ0PzPaZHFZPOhUdyeM7vWSgxCpGua7whsCj1y4k/sGb1nYVGqOVpc5yNK2z3GzI7JRYzhNci
	sg8z5wRQ3HFnwrNV1GPnvvYJOYSCBfWzTNb/TzxJjmzyCdLK6/36z3+gvAXllBivaggpS+TX0Jy
	7euJDDPwhtHP4a9H70x4twH3rqsdxuqbYf/tec8UrM1mvndPPePhe3Uyzm8s8VF2I3pso6Scfio
	IGZAnQ9sGzZRWugS8mk3Qf0Ygg9rZpk5VltuOjJ+f+BYvScdzDwhv+5Ah2h9dKrOi505YA0f1QT
	wBE75V2m6d5Uj5WNlBAQt96eKkvk9w/7zSizWhBRPOeYvlpm7P1rXBsv9A
X-Received: by 2002:a05:7300:1c1e:b0:386:b0db:944b with SMTP id 5a478bee46e88-386b0db98c0mr5942097eec.22.1795517702485;
        Tue, 24 Nov 2026 02:55:02 -0800 (PST)
X-Received: by 2002:a05:7300:1c1e:b0:386:b0db:944b with SMTP id 5a478bee46e88-386b0db98c0mr5942085eec.22.1795517702088;
        Tue, 24 Nov 2026 02:55:02 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm2282257eec.17.2026.11.24.02.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:55:01 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: Add compatible for Seca SoC
Date: Tue, 24 Nov 2026 16:24:56 +0530
Message-ID: <0439e03884c02c9edbec89132b526aaf8f54ae23.1795517696.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX/SrQm8+ryUx0
 l7oznTwDOiKgPe3rnijBXCrfC0jlqDJduu9kyWorRLO2ppE9aL9fiOk4tnOnHJHN8MOb2vJ1091
 Ji39jVgHM9h/FlYhOBkJDOq1e51/51Q6iKtB912JECnvofwHpypF64txGHjTkPIb2nGVcR2C8Yo
 Q7Gx7B2yuNvZHGJcOmyr+Xu8GeMbJyolxdZPHXxB5k0iTRVlxVFF69jCfrdDwIZZbLTUsEeeM4J
 rcpnvftC/kNkpnEA0hleGJINZm1nL7+etOWUJeilQ/2vHA02lf2Kb17QBPrSX99q8iKAPQxI/dZ
 Q2pKYKaX4cNng/HFbnCYTqwUdF+yUXtqDaa9nX14Hk/dNAHFTmzR64kbZc3wLqwg3YGnLj39B/r
 reb4cjGeRIMm+4dSP49hyb+q9bzSl20A5xlJuhONeS0zrzgwj1dnQP0dn0wTmkpg33kDYIg2tYO
 J6ps/lLG8oz2JyMlWHw==
X-Proofpoint-GUID: NW6kTzVs5rE4u4mqZpKfUFX4W7DcmUla
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b056d07 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfXwxAcUuPnVRnK
 34XK4vYLEDmg0bev+8xFyCne7/0Qqg+Imk77Og8SyRvvOwTv99cIX8RzPHbODxVOV7uxMDL2P5M
 DoibUg/xVgQsfwUB9ufCXUS01XIt750=
X-Proofpoint-ORIG-GUID: NW6kTzVs5rE4u4mqZpKfUFX4W7DcmUla
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Document QUP GENI I2C controller on Qualcomm Seca SoC which is
compatible with the SA8255P controller.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
The Seca SoC device tree using this compatible will be posted as a
separate series.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.
---
 .../devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
index 04caf622b3ba..63895fdb51e2 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
@@ -16,6 +16,9 @@ properties:
       - items:
           - const: qcom,sa8797p-geni-i2c
           - const: qcom,sa8255p-geni-i2c
+      - items:
+          - const: qcom,secaau-geni-i2c
+          - const: qcom,sa8255p-geni-i2c
 
   reg:
     maxItems: 1

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

