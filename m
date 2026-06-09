Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2EF3AA4F3
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996652; cv=none; b=SkxwFCYSThJpMh9DJ4myAeIXKZ0fU4WJA2O1ZR+NxAj+SL/KGkBzGMG56X8S4VNIwXD9EtuDm+aerZwqMawpD+Vkn9l3d4x6ZNaL/UIgRLzJWrA1B2lvoYU2H7/igwVhv0QJPxtmZN353GlpXLdXqv9QoBZqiWMKfNsZ4HIASTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996652; c=relaxed/simple;
	bh=rr2oZ1w/13xkEtFn95jWcYLYLPHANAYJKyS/SfpAHZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YoGBd7HT4De//T+wDGbtfBxDtRsuELh96ZmoV9nG+wcxtDN3cd1PxQ1Qa0wl1B5s3JWq2wfZKKCFfARE+GKspMT6DFgVAuf2DhihKw1hcaPXHZ7JgHR4CqFLnkcyxZTWtKqfmkwQTSNZbLwaS9l0pZdeNXaN01I9EX6zDzts+nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UWKLGUsj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DuVWZXCX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UWKLGUsj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DuVWZXCX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6598WjOt2130224
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 09:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VZtY4cJodqYk968em9+13qvIqLOM9Dep75Fwn3YXuts=; b=UWKLGUsjzW5iheXR
	9wFmRrblAm7db32gW6l8ex5yShOAc2rQFcAwSARY4fbtSkvSTCMkBQ8GBJmpt/sP
	cvkNG27h5cN85+peOkk9NrnIqq8hNIhk7IQGfhzbZ59pEXHtXGyg1LqEXRh7Peox
	l+eKug4rDC4B7qjlvDfKaBq74quR/Gc8mpr8fqqNDaN8NsMEZxP3bl4h7/fUkJK6
	GNYwlBN763wOoencF7n92D4OiuOlnfhqzInhUk/2WkMNVnQxCvb+kZRP7cQyRB1J
	KKMWaJwpaP7eivtEMlh5lWzQKAKaGNWWD+z1zf08Yvmr2ANgRY2YTJI4pPEAZufA
	4UXltQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt065j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:17:30 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-842446a3851so2598960b3a.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 02:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996650; x=1781601450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZtY4cJodqYk968em9+13qvIqLOM9Dep75Fwn3YXuts=;
        b=DuVWZXCXEEEFbMCqdQcdkMDxTg8FZ6ytYq8/U3K6NXM6KV+IKwt/EyPHkmZD599xgO
         TjoDvP94j7rPIOVHEFfYDMKVPPJEO+ywKjJ1yw6dF0ag/7+gj3qXJjDZoSI/qQbJDVAk
         8HgbEV4SPhS2CF0oxtoJnyrc1u6K9Nd8+/hy4Xp+Gl3leIX5+90m56XVqMQhW23TAOQ1
         ZhcL0pf8CExPyqyszSUGXpGcMdTSVjWGZ19hf/OOGD0BfeTiNMFIfkCBFJqUFbR+dXd8
         cHWnJlQ1i5LPkQNApio0z5+Ed16+GFmiFCEVaaO8dbNpIk6U7Z/AjhT3/F97y0KboMnL
         fEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996650; x=1781601450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VZtY4cJodqYk968em9+13qvIqLOM9Dep75Fwn3YXuts=;
        b=Ioa8m00mhaJqSN39uv7SQZu3PdKhxrpv2zSadribIzc+GmvkzLwPb/VnN+LNUd7WsD
         mfTtAxT6TOHY8uAiGr73J5Ixk8kb/fgZTylrsFR7egoBdN99wd9w2kpAcrfM3h7UvY98
         D9qQFHqWadmyG2QOszFGy5j981NYG2u1v6JonA1k4ifDf/TUqyyqz8xeX8XkqBvIdmmU
         fW3wyk0D/BcgwBqBbo+KDaqsQItWS2RxGxpmtr6dPUNBhqEY7KuzANrEkHQj4cp3Marj
         CWyYRTSqmgI+5blStaYipj7xFSTBYLz9tRW1W28M7VDcAtqoYr2W0PDFyE6hKF58cRpJ
         mCXQ==
X-Forwarded-Encrypted: i=1; AFNElJ8P2PqZy/f+lF17tfBYqrmiFW2LPI5+ApLnL6MzZ4CNbPqJgQ5PxJfQPbWqofr3OiReR+yqkFgwjZ3C@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbp3ToZqvJCW/1FrqxHHpppidzsok7hHlCHHKus7l53rGXhNLX
	niQjWMjQjd15A8weknGsxUZ74B/aNOVAXs8QfWYuVo771w4vPsap3YilsyL4NS3UWErzDcx1nSS
	jjzeOjNX1zZIQo0v9+lVDnSgQrSciYE/bqbsqV82hJ+IdlzCs5EitfM+DqukXkLnH
X-Gm-Gg: Acq92OEmZJsUbr9dbibq5GF/sDuc7nrNWGyD7hQOUYh5CaIH6n2kbua/dv/bkMqj8oJ
	kSBY0uIKBIO+tjgQ9hqteK2OtvWKS+hB1EBVRqaovZZ9dJXxNZI1zWqVQlqxJ8InF6gcvL5v780
	X6obyVrUuCff6DvTF0yEbHctKxBRTjFfDIgHxy1PcIRTcxkJdYkye+PFDXMKBxDxlFzN1WU7o7h
	yOTo+OopnrRg4zS3kGv/BypZ+H0RnorBhIF9wzZUMphWrA6LOjvif+D7F9mPBoOhIjAxX7o95J4
	v6wxiBwoK5FXrD5yHOhQ4JpZsonur0dHFJhsncxkXHWpHOmv3CL1Eercm2TCN98166sx+Y0VmWu
	3LPOcVUkCgltbP2xjsq/UJpR2rYWTMSAku3cKIc1lkGwrSX+DFP6GyZnQ/l9PvSnxl1mH
X-Received: by 2002:a05:6a00:148d:b0:82f:abc8:ae0 with SMTP id d2e1a72fcca58-842b0e661femr20374861b3a.17.1780996649542;
        Tue, 09 Jun 2026 02:17:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:148d:b0:82f:abc8:ae0 with SMTP id d2e1a72fcca58-842b0e661femr20374824b3a.17.1780996649071;
        Tue, 09 Jun 2026 02:17:29 -0700 (PDT)
Received: from hu-drajpura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828fa877sm20974879b3a.51.2026.06.09.02.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:17:28 -0700 (PDT)
From: DhruvinRajpura <dhruvin.rajpura@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 14:46:42 +0530
Subject: [PATCH 1/2] bindings: power: supply: qcom,pmic-glink: Document
 thermal-mitigation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-cooling_device_reg-v1-1-e15bddcb0086@qti.qualcomm.com>
References: <20260609-cooling_device_reg-v1-0-e15bddcb0086@qti.qualcomm.com>
In-Reply-To: <20260609-cooling_device_reg-v1-0-e15bddcb0086@qti.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        dhruvin.rajpura@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com,
        jishnu.prakash@oss.qualcomm.com,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780996639; l=1589;
 i=drajpura@qti.qualcomm.com; h=from:subject:message-id;
 bh=hFny+s6/z70haS8msqL480UJfkNA2vaD/64j2s8dXUA=;
 b=gGF9GHjt/HgtSqy6gEEeVtu5qdHS6TURABQkWPbNBSobWXGXSnLwB4pImOJaCW5PUQwNIurze
 eE9aVEifRvYDySMM/NHZxifYSBrX1FYE/CCUcuFZ+k8rs6hAur6edfd
X-Developer-Key: i=drajpura@qti.qualcomm.com; a=ed25519;
 pk=955XCRKkDWtR3Z/wycEd5zolAQt3Q1z7vODzFB/Wn1g=
X-Proofpoint-ORIG-GUID: E3r8ajjWveO8J5OOLntL7jSjFwbyiiPz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NSBTYWx0ZWRfXwppQUC1gEMzl
 dMIHBLEL5/vNk4fSwrtPxXzaM6/vmlq3ZpXFZTN2mZ3qKCz3r1m1D/1iKH6f+NPZnoKqzuze3FS
 mFhLYbhd3lGr7Jka41CFupO+8mFz4EO6k83EdlBrHfqQwUSLVuv4hbC08RLTj5atX/ipx9ruzt9
 kEVtkih/DkcPByXCaxhZ9HBMBaRr0hKrXiHPGAslsGh033DRD32hbFjUTfEzEgYPutvkjZq7g2F
 XMcp6O/asnAz4c+HnMbiXmMRAiX4ReUxFmXeWkmeolz0wwc9tABYYkinEj9qj8nxwjhHAaA2aGw
 RthF95o5O0sgo1rWI4DjU3PglOE54/8vPxCgigsIOziEBazMQK+5c+w0YAWYCcwjjWCRG3dCfO5
 7iWpQmBHLFDpvYM/eNM+cVk+u6fH8aDCzleva2vLSohiI/1i5b1DYIvVwZmFtgf5NSNj6m2/Fdm
 gRpTj7/sz1ncgz5fsyg==
X-Proofpoint-GUID: E3r8ajjWveO8J5OOLntL7jSjFwbyiiPz
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a27da2a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0FHclZ_MPv3-cewW5kAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1011 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090085

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

The qcom,thermal-mitigation property allows platforms to define
discrete fast charge current limits used by the thermal framework
to throttle battery charging in response to thermal events.

Document the qcom,thermal-mitigation property to describe the array
of fast charge current limits in microamps that map to thermal
cooling states.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index ff01d2f3ee5b..fcb69ebaa7cb 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -58,6 +58,16 @@ properties:
       The array should contain a gpio entry for each PMIC Glink connector, in reg order.
       It is defined that GPIO active level means "CC2" or Reversed/Flipped orientation.
 
+  qcom,thermal-mitigation:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Array of fast charge current limit values for different system thermal
+      mitigation levels. This should be a flat array that denotes the maximum
+      charging current (in uA) for each thermal level. Elements should be listed
+      in monotonically decreasing (non-increasing) order.
+    minItems: 1
+    maxItems: 10
+
   nvmem-cells:
     minItems: 3
     maxItems: 3

-- 
2.34.1

