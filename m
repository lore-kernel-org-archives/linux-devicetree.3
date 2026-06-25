Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2CA386C16
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 10:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384412; cv=none; b=SaTnXU54vKZjxFOonAbRmNyY/ZnJ0mCvskxkFDrZO9xf/xsGjLBA1XNwIcYrl01S6M58R5EC/rS2HplIkMVURtdKh3Kl8aitXYyNseRtFU7woxfMjOTKgmxnGO3RH5HfGORqHyZ/gelu2oqdgOS7XeHyE+lNSpQbkMIvZu6bjPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384412; c=relaxed/simple;
	bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GicncFy/uF+yLnVFrlObKXX825e8Seb0ZC8lZNqGwrV84C9UyjFRQqYia+3O64TPUHkiqguovH/HDzCvltzbm9KympJlmSk0xIPn/QbnvYyLFSO+NUF4H6EDpgknJIndK1HeErsxqUb7wIheL9ibyUZbTMtrQuNcnlxst0985uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nRfvZ60R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EOsHzkSy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nRfvZ60R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EOsHzkSy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9juYA1723164
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 10:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=nRfvZ60Rlqp9rNcv
	oHgd2pHed7vU4J3YzF3pnvOY4Na4PjKZwiF8sYjhElRIBdebz/u5NmlB9Q8ufid+
	fmTfC01MewRQS075QIm3VdEKATwOGJfMXyChmrpqW3kw1wXAeO4WC9So0Bz/Jhel
	ASDiuB2m0fN+De5JhZvrxVdYXTOyC4dBOrldkdgpScabNKAnXo16YuYW++Jucetx
	N+fPQaCAGWGIqypHj03R8GUrbZAx2enTofHbUwGEpKQwoKfPJiuNpQapqLUAFVln
	egSOU313amuWxKoxA1Ix8lUdNMhKlLBVqmoyxUQnSrciTpEVc1XW/4Nt/PnEN+Jg
	0PssKQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0j7duwkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 10:46:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c889d1eedcdso1412047a12.1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 03:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782384409; x=1782989209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=EOsHzkSy6j0dyabxvdH/PceVxv2QI939HnZZqAMEOe77qJdOJOeRvO5wNwvTq9yw9J
         rpwuKyw9GVoSUmz/aUz4QOApeezUeDPEx65S1QmT3B9zJPJ4tvbtvBKvMn4YzSoo0+Gl
         F+22qHAthuaQaHAFY1YqOIEdkViVGkmilDzuLnmkDWmn0WA35cVhWdMTMPm1nsc3sAJl
         mAr7Ei9jVmA8EukYf4tV13awlGx0PbuTfNmIM1FwIhoG1NSz1Vbwv+aXCHAtZfJe7uck
         T/AkS78qAig7z+4sgYpSdueiSG1oaWlNb3XHLso/0cTfEw65BHx2frb9xVWb6dS+12Ao
         xxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384409; x=1782989209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=BbeU47BAYYTbiTdlIMt8nyvLPbX/diOk7U4TIpZbzlkq2+S93L+hJDh9ALkrhy0/7t
         T83mjcAk0ZV5ZV+5t8FjvP9YuFqKALJ4zIgBpxRp2NjCLHQc+dinOfiLgVAyXCKasO1T
         5ndWmY1AbWsECKQAMZ7C9yKw069jDjnLtUeYUrmyDPW65KmJ4GLdNiJHme0aUViNuoII
         DUJshFNP03A9aY9R96gB3R99xI9zeFg9MtsN5tq2By1HEz5wPoj1YIS7vDjBAHkW6d/f
         /SqfF3DhGa8qRN6BcRMXQpGmg7KsClWrE0bcxVPG0Tye8wQLnglhmMnHGGOJQHAvRP7P
         v4LQ==
X-Forwarded-Encrypted: i=1; AHgh+RpTpt8BquSqtnydBonf3IpL+WPPOQSGus9HRpkj6gpSixEvJBwy4qImeqvpFG7Q7td01H+rYxjQBfru@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+FpAw0QHg4zaGbB+Hj0F+sl/gPlNZB6ImAq9Sq0NUFI6AgRPs
	2oYcUjWh7NOOAIS/kd3PXtYjSj7xNpz23eQ/T6vzdfOEerZuc97mLi/dbaweUWwKPUIXAPt3u32
	4iJvlKK/+pYfDFV1Hn9f6uhE3dIX06Sq+w75V6xMp1xQS7JM2l5/tKH+yLc+0elqt
X-Gm-Gg: AfdE7cnVLSdsAEstiepD2dWUyuYlXq3JYw7uk4Y61tDHaPU7lsCfmrK2gAJJAF0Zlwv
	YiG+H9g/TWY8NHyuvWUmTLNnlyN1Wdv+sA8/mH7cKzzxlfuN+S4EyyaoybFIXkmNpcrLKYihWwp
	xWjoX3FbM2UMmwEQxTYzDcQFI2x+j+Zd+ODwD2l9LNgSMb/uICgl9y4oedmEg5BIl2VfL2kXw0V
	BOVxreC/3KFRRC3MJJJFOoioNQhNEM9xDJCMuWIqwKESqQHRfAAnRvDiUZvBk0AU7VWjS2+MOcJ
	K9bhiwMwo4opFqF6aXcukAcJFsnr9IhwpHsAprf2kRVM7pahuBKhEgSpmFuWJivg0NrK51gbNzA
	3LP0G1B41zG8/JFXKND061MUQO+uZq+SpwMBogzG7JiDod/XLjr7bZZ/1k9Z0zMAdyh30VgPk5g
	==
X-Received: by 2002:a17:902:f644:b0:2bf:211c:4980 with SMTP id d9443c01a7336-2c7fc8b106fmr21137595ad.35.1782384409161;
        Thu, 25 Jun 2026 03:46:49 -0700 (PDT)
X-Received: by 2002:a17:902:f644:b0:2bf:211c:4980 with SMTP id d9443c01a7336-2c7fc8b106fmr21137275ad.35.1782384408748;
        Thu, 25 Jun 2026 03:46:48 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d58e9sm17114035ad.60.2026.06.25.03.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:46:48 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 18:45:55 +0800
Subject: [PATCH v19 5/7] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-enable-byte-cntr-for-ctcu-v19-5-8fbbf22e8381@oss.qualcomm.com>
References: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
In-Reply-To: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782384373; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
 b=NzXxSe9YCbXAOvgLAW+bQfAw5hmoUMFjsQl9kHlNLjYZHW1EJko7qSAjLxFK6OuUzJFyZUeKl
 4BnzXZlDCyQCs8tj3LgEVmXHRuP7meAdUfgA7U0nC1dnKWo3CftEjyp
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: BXbVJovZi6udryWEudI-l5qEas8tq2Jl
X-Authority-Analysis: v=2.4 cv=NvHhtcdJ c=1 sm=1 tr=0 ts=6a3d071a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX8rBbn+H6VWRp
 PknL36bjXUZO7FImECCQo6aaPc0s00ptOADOV803aT8cltF91FFAtqwa6Y+pkgZ4f1VcfBQ8Re6
 FsNmHs64oz3iWLQPkIzRI1GhVK/jrqs=
X-Proofpoint-ORIG-GUID: BXbVJovZi6udryWEudI-l5qEas8tq2Jl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX9uPBGMcMdMGg
 42mugx3m/gNdAnqhAsAWyretthX39ESFlIJoMaVOYCt+XMyZNqpDUu6q5Q3U3Lzw2kMCOHKrffW
 pQ4DIRwwbIwU3+DreN5SSavkfe7fEhBtuepaxTSu2g36foThza62irI+ZB2KSPVSjjAEVYqfXsq
 2eBfjqBV0vziCagxWlLiU1ALuWF5tXKMeQPEIJFBZH6CButUtiG0LW6kmhfBZ4T8CfXzXn5YsPY
 dqgiEwNd5K+knqW/LQBqUYf3uW+xjcOPCpD1NBfuFt/k6C7ZTSu4xSm8sr3XQBVp5KlphJrbsB7
 K313jDYLgwoaMCcbgbkS1WAOiimdzioxFYANJhtu/txTkxs8Sdbgwa1h5FirlSXFuuBXqkhaF9x
 seQZOeDkMhGWpZdbBtC5w7zO6AvN84ci4XK6/4dOgwxehc3qcaHBuyLaqfiJcXersI4udd0SBcz
 kP0I0kkFP81qrMJZI/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250092

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index e002f87361ad..2981001a7d7f 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -44,6 +44,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -65,6 +70,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -72,6 +79,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1

