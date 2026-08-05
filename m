Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859E6471D02
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785936113; cv=none; b=RUbpfh5WVTFdWMR1NmOO0aYwEfPd7/ECKO9Kb7oUd+QfJkxwNmS4oYDt2GM6DJDhCb6pNIs2mTmF0NvbchCysJU4EuypU4mt9r3UIR41oDCBSXqtQqMsR1FdG2R6ubTEVg0Lkis0nesBRlEVwFFWdKjgvZezQ2wzLXBk9QlmSYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785936113; c=relaxed/simple;
	bh=FbsBLlen6niGwkN0P7vOOCPPXECUkbTI0ANLabW9UGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MCqeXRi1OgpYI+DZ/IMCSjThZfNZv9TEBJHglD5+MIO62Bne1aO9behR5VKXZpMkRrrxhM3vp/fqtcTLi9rboB8XtJgjppIv0EgwTPLSiSJJtYO5Fv8/WAbXrRI9e2ZRU2IgnlSONAHBk+bsU/qLeQTBu5vfSrWrqoxlomXeOL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WUVz5Z4H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QoiyvAav; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WUVz5Z4H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QoiyvAav"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675DHDAp2707862
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 13:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h86X0nKkh6F
	i7cT0Y8QoasfgfRdFXrWOvF3NrEXY3D8=; b=WUVz5Z4H5Ne7TL77gMNAeX05wmN
	AYlr8iQRPWZjEV0eO6WX68m3JC7agJb+9Tl9b7Y5aRZX1R/hwa2XTYqIhunTLM7Q
	oBtk0ikjBhv5nweHxXrCmvDozCC2l3ItJoOivf7G2ieI2e9jnvZqcimO7o3GJmCf
	hsmcdasI1zoRpz4U2Viz/opb1I+e3JMVB4D762OcJ6yIWKbNcElk5USs4MNBbR6z
	/kPJuydy6YmrWZofIq7aG8hnpKJdKkIyQIzoTlYqdIXwOWG9mCFs31mRdCew3NVw
	bzvCg2FqmMf6HOkly0WxmtGK6U6xRE0kfFLxTjyORhPp4Zjx2OZ7jwXWGtg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5g0pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 13:21:50 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-497e582f42fso1080948b6e.3
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 06:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785936110; x=1786540910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h86X0nKkh6Fi7cT0Y8QoasfgfRdFXrWOvF3NrEXY3D8=;
        b=QoiyvAavSj1WsyeQZK0nWUtxPjEMiOwhX/x3B5xqDpl6PXcCpQ3x/PSJ2GYm9d5K35
         TQ4GgE7p0K40YQmDVmfPubAE/IlHLXVXxH7GXXGQxAhONO9oFQJbek2gGC5db0Dj7Qna
         cuUzdVj2cNlL3MyC1glriTcWugclN20Ee+LyVClBMcb0y0kjnLSECUrA+xdCRvMJdK0i
         l3Mdk4cghonvFHv6w/zeijsoRFv2igucfknsoxlr71j7dUIIQbIjvgZCi8diE/9g6xHF
         JOeCBc66dDGW/Pr6sKXyeMixPssB3SRN+G0fDNHQkDpSnGrHTcpgwvd5AF8Edq9zcC9/
         KzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785936110; x=1786540910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h86X0nKkh6Fi7cT0Y8QoasfgfRdFXrWOvF3NrEXY3D8=;
        b=Cz5y66CGxtdMnTzGA1QpDlxDMQWPE7tvM763TDnpkqI2uautqkExVqDWCdVlLKStAw
         DC/TlBHRrXZipzkG315vc6sCUIRAxKuJl3ha5AUKc+mutRnjbtgpXEIt3ZMlmpi5R8uT
         4kS7FOG8vp77+jJbtmsSdev+ijxxN/eqQPwnzsm92ECXY8OrPIs17r7c7BumAo1u/WrS
         GulTKBO0GessvNi+0ZJbx3FVdDKhEfdgiZMx8gL4wcJpmnLq8tZWIXEm9YAejiLfh6O3
         mtFedVpziEF9zq7iuJXLApN5TnWcy4OZcXoIK4FjePtfnaMQG+niM6HH0OrESRPQSYhZ
         rIEg==
X-Forwarded-Encrypted: i=1; AHgh+RpRo00t3UUvfnxyWCKp7hDXUUXPTdPoVbqLhVm3LLwlk1P6rbX85kdsDkdgCRAkpbLM3yN+x1S1BjLi@vger.kernel.org
X-Gm-Message-State: AOJu0YxCww07XjMZh0uydcigcQ8rjkjH+mob3G7N+qiH4tZuYIgCczV5
	fN1qbSCQjHpbOAYnAwLYQTSJYXqw0Jmi/tFd2+OnsA1ukt6ReHeWxJ3RXc+dVSEooTp6Q4CGyua
	PG6OlKhlek4UHhWNPvi4Gqe8eUTTBjs+8ahJdvfibL9dR+Y3awsRDoKWYhKmJtith
X-Gm-Gg: AR+sD12P55AHdR0nCmvBumDktuXXXCYng+dRTCcjJyFj1a7GtZl/0WVzLlWmDgMfOWT
	nNF8zts2daSDkVoM5PN5SPQBL4FuMUFbAGPIzQqEbB+ZseBp1I5hyYulkxCHEL0/JbO28ljKan2
	9GrYtexUs91VtUa6TKO5ON50qdSRlFAsvspalEYJDVh6llrMHBGTiqSfHWmCcvQCSvN4LFnyn33
	Uy5RZMQgnrLDNUC40E028assOMXdzS+F19LpU4UGPrjzreupObBdqun21jO2BpmCwNiMEO/jnd7
	cEKaUYq3HOkPY5JL7ru+JCdccv2w0tMtyvYf4z4fuXEoINDhwzBT7k61w0cm+MbfwKBXBhcYR07
	7CXZ7CPdiEgZuZQkz837lpBCT+0k=
X-Received: by 2002:a05:6820:f00c:b0:6a3:f41c:de81 with SMTP id 006d021491bc7-6ae970b93ebmr3166657eaf.35.1785936109816;
        Wed, 05 Aug 2026 06:21:49 -0700 (PDT)
X-Received: by 2002:a05:6820:f00c:b0:6a3:f41c:de81 with SMTP id 006d021491bc7-6ae970b93ebmr3166615eaf.35.1785936109240;
        Wed, 05 Aug 2026 06:21:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4599e63d64asm2412596fac.13.2026.08.05.06.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:21:48 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: Make SDX75 MPSS fallback to SM8650
Date: Wed,  5 Aug 2026 18:51:28 +0530
Message-ID: <20260805132129.2713174-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
References: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwOCBTYWx0ZWRfX/lrG2q7gLWu8
 v8y4pr2J6ZjDRqZRYc94FYy3z7bOfdxxLJcAYyPALZYeVYLRUsl6s5ojUnA6zdn5I9hBQgJ8bXn
 vl0PlgQndKHDaVKu7O4WqhtWpmk+LMKSUmygfouelQ/1NZmsits7U2IgqBqZhOUgSeBm+jNrLWn
 +aCuMfFFMY5Yw9ALaTRxETky3VxHw1Zka1Hql9yq2vgX0zaJs/El9dsJo3TqD1EyPnxMSepMFoM
 fK4n45Y/c/WQWm2H3T79olaJYxUHAwozbvKUt2qCQkNZ5j0jBVC2MInVtk5NLoSxvqeTcl0Dz0N
 XFn4mvqgRuujV+nZ18B4T7T1AD3RqyNRFQ5Wtwyo8/N5CQsYxjLGkqOMySTOWDPT6mc8+kJS5CY
 IU3VW7bKRgpL262e52bNTP9+CHRWaSj9E4NQ2NAc72mJxf468BPRXHyGfJMEZjkVsNAW+6VFWXJ
 snt+qpae5yYE9780NpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwOCBTYWx0ZWRfX45gQx/gWtpqM
 U0gmYiaQ5Bke4mRlbQSIF7QsCRKQ8IDqRWrobpdbQUC7C7LAVaxNZ5kAo0qbwpaXejymUQrMyMl
 iHgbYpzAqpi6hAj6ug64QV0IsLVHPYY=
X-Proofpoint-GUID: ExqNH524pKi0f_ezmmRG0epMzB6VijYU
X-Authority-Analysis: v=2.4 cv=cIbQdFeN c=1 sm=1 tr=0 ts=6a7338ee cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=0fILAVUH9iuzxxz9WZwA:9 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: ExqNH524pKi0f_ezmmRG0epMzB6VijYU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050108

The SDX75 MPSS is an instance of the SM8650 MPSS: same interrupts,
memory regions and power domain topology. It is currently modelled as
a standalone compatible and lives alongside sm8650 in every mpss
allOf conditional, which duplicates the constraint and hides the
hardware relationship.

Move qcom,sdx75-mpss-pas out of the standalone enum into the fallback
items block alongside Hawi and Maili, and drop it from the mpss
memory-region and power-domain conditional lists. contains: on the
fallback compatible qcom,sm8650-mpss-pas keeps the constraints firing
for the array form.

Two consequences of the tightening are worth calling out:

- qcom,sdx75-mpss-pas as a single-string compatible is no longer
  valid per the binding, so the in-tree sdx75.dtsi form fails
  dt_binding_check. That is fixed by the follow-up DTS patch which
  switches sdx75.dtsi to the fallback array form.

- The driver keeps its standalone qcom,sdx75-mpss-pas of_match entry
  so already-deployed DTBs continue to probe. The binding is
  intentionally stricter than the driver here; pruning the driver
  match is left as a separate cleanup once the DTB rollout is
  complete.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml       | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index ae74aa4bb6cd..f722c55aadf4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -18,7 +18,6 @@ properties:
     oneOf:
       - enum:
           - qcom,eliza-cdsp-pas
-          - qcom,sdx75-mpss-pas
           - qcom,sm8550-adsp-pas
           - qcom,sm8550-cdsp-pas
           - qcom,sm8550-mpss-pas
@@ -51,6 +50,7 @@ properties:
           - enum:
               - qcom,hawi-mpss-pas
               - qcom,maili-mpss-pas
+              - qcom,sdx75-mpss-pas
           - const: qcom,sm8650-mpss-pas
 
   reg:
@@ -210,7 +210,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,sdx75-mpss-pas
               - qcom,sm8650-mpss-pas
     then:
       properties:
@@ -261,7 +260,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,sdx75-mpss-pas
               - qcom,sm8550-mpss-pas
               - qcom,sm8650-mpss-pas
               - qcom,sm8750-mpss-pas
-- 
2.53.0

