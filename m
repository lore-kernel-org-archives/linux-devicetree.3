Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA3F449988
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 18:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622575; cv=none; b=qKx+FV7ri4jrj4reP9CT19NbB6AVNoFRTL4ueDYX1dLT0A8WBFJ71mBQ5f7p4uBgEP/1Gp7REocAee3E76+G8hw9nQdHYYLkbhQtGkMUk+LWtHvJqrRiVVCS5wZw5yVh+0ZbRwJUaAdTSypitX0yfUL2+A8YsDkyy4oJqAaiXxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622575; c=relaxed/simple;
	bh=8G002/IxABPssrEzt3TqDoNY1L4MUJqdSn00j40u6ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=csSIAbzQPScx9GUkX2Z4XgGlSBpu2PMLTk6SOR2+wvCyzcrmQ/X9jxYG5K4O4heNWQ5rJQgRhPufKXKm0aOzetAMXN9IZ/BRsnrqzqbducWHyuKUN6HUNJ72DFZwPqPUEfU3IPOZ+3y9F+rcnblfYJvF5QOcDnpQHM45JwWWNXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YfNQknXE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qj13Lzog; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YfNQknXE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qj13Lzog"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXFSp2516516
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 18:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=; b=YfNQknXE40JDrClz
	EHFnTG1PkwuOYhq2NNByi3fOFBH8S3XdJ4p84LWsrRi0ASDYyQRM6gNf06kEg/bN
	FmGvNqpXo09tetopfi9LGsQt721cySlXMqnluZSFr+ExFKgd3EctkIoJjijlHffR
	GozG87Gp00lltvfk1OLRHKtNJBzN1BJgoU12ex+wHQvFc/duMohJlGRW2SG/S4Bh
	aLHzSmxu8Z/jb+Nh5QEKnNYPrqiUBBCOZl6iRNe57xmTL9prx8PAeJ1NkYNET0F5
	+olZA6fZD3W4xF0nLUTIf5TwqOmC3Mx+PSb/CzLmFn/5wASY+scwjCdwSSzCuNoy
	6HVfcQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418kyaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 18:42:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so188169a91.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 11:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783622572; x=1784227372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=;
        b=Qj13Lzog26AioeVzE1qM7BmiXfH+knR3/hhHLPzYE2ypOcZO/0Ztu9/0kXt/JUYk7q
         +ZvHFYUV3yMtskWLh2/Nrl6cpe16HIYdWg6C3tpgcWsm8IN40vSGgOgjPfl5onz7MoKO
         2coNcvKVbT3wHBnHxUcEn/nXfEiqltbuuRI7+BCdS3H+XBXXV4jlGAhPSkNSC/hme5zT
         feq0eJMOAdzvv6g8KAzZ0HY7nQIgCXW4QgO6xFmITm805l/NTJFgKhDcDOmd2tymM9Ed
         tuxSBq1D+1v4XLRXfEK5m9JwBjg+kE4xjdFeD6xfUR5TmFVx9Y0O8HP1IeTx7KKdMqe9
         bDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622572; x=1784227372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=;
        b=GIKtJa6jahzsH/q+kVLgZvzWRZiJijcKZmOLkkONTuPN/QBakNNObYRwGTG+6ZtAsq
         NiB8tFF9UHvCKtnUpHTCSfxWAjo+YS5ThysoiPqroVq0RQ2efB+g+E/pIBi7+r3xn4+6
         I+TesOfhaG5RzZhy/8eZaFWeplWiuIXdYW2yAPbGImUBYJAiubNcLmT5UktHfBK0ToiK
         RUUyKaJp4TlC/4ReTTJvqODtpoEZmhJSLgtBhSwhofcE4PLXw19bR1BD94YN5Gxdzjuk
         KPxriPSvbeMhjdRlYxS6Yd0P8aD0CAdaJ/LKGMAhjhXAw5OLSuIKJCj5bTsa66IXvL9r
         qVmg==
X-Forwarded-Encrypted: i=1; AHgh+RoSZc88DzdlZSxHWDu5oqJaHxHPnPvNNhFh5UHhoju3PSQHA6HigXyFHs+eeXrwDKhm+dUJz45IMblC@vger.kernel.org
X-Gm-Message-State: AOJu0YwIr00/faXP3TnwffL1QiGYGGxAIfkgKcXz67piupA88DNeSPRe
	mP+H6Y8FXQAsAqPUtPmmAvcxw4YcBwauRS4ue7jWhgWoah5A+g1o82UCgzUZ2DdGtsokqWo+bCw
	j8Yc9g9TWvAHAmqyT/M+fsJiT0fQ3r94avecyETBt81LHBKLNFM1Zlty2I3ZMi86r
X-Gm-Gg: AfdE7ckh/ENxQjM/dYFAtTLR3s01QsmcHUhigjqZjQxAUGsXq/7wOKZJBqq+yASTORz
	dJKv7vC8wUjQiihWJ/DXOIiy54KLGgfobJEMGe5nZi6+KclfxarsdHq6tdqUDHV4dddVAbtPAq0
	lyrbeQFbUWOdmu7ND9mpk+0v5FZFsIVw+jtj1SaBvYXR97JIXaxggJJlIuuDBDM7I+9uK2lAyJD
	gJ6IvoE17xiXkbG5EPFI6JQToRHjbvCl7WG4Z0+UKsS3Z0liaNiTep4o267iikSnYhTmY3wE7wV
	WfIt0c3HbXio09H3n4FnO8pIzHj3GPQxFLmI2cjT4QFBFLQ1DKltpOmotPk3G7qTTrSHWZbi/U/
	Q3nZA+/Pry+cq/bsib9ooyVYtufr8EqTyLZA=
X-Received: by 2002:a17:90b:5685:b0:387:e0db:3d8a with SMTP id 98e67ed59e1d1-38943854a52mr8741839a91.37.1783622572614;
        Thu, 09 Jul 2026 11:42:52 -0700 (PDT)
X-Received: by 2002:a17:90b:5685:b0:387:e0db:3d8a with SMTP id 98e67ed59e1d1-38943854a52mr8741825a91.37.1783622572199;
        Thu, 09 Jul 2026 11:42:52 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm34205652eec.16.2026.07.09.11.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:42:51 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 00:12:02 +0530
Subject: [PATCH v6 3/7] dt-bindings: arm-smmu: Document GPU SMMU for Shikra
 SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra-gpu-v6-3-b388ec5dce77@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783622535; l=1298;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=2jQmU1XEfwX7ksFDjORvPn6m0bWV65j9hgt3Tl3GEMo=;
 b=ZHYwuBBmHydbbYbR66h8CvEw070fSbVdXWh3mYBcTePopE1EO2/nQ2AQyCyuVLwlR9uzZCS7X
 FeMi9LFyjJrC962OmSUnxwOhByuza4MZs+vELBPqh9Pj8eXByS5d7P0
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4febad cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4NCBTYWx0ZWRfX3QimGGkaV/LN
 WniQm2RDkiR5r5dYIbOkikDji9raZk1uJAde2pB1nzXdB/HFMY/UwfJQdIH6iYqyEMxoh+kkK8c
 xSC9dtPpPNqYVOxy2TCfrzuXC0e6+Rz+D0Ibb/mlLaa+MdeDxofYFrnUgr0IwbLMIdXVQ27agUk
 /DOFIIPKav5GGDU156EXIKXK84nNqAmQcbWCWZM7RZ0+abMg4pMB3nfuWHXmAC7M8anHcTfBXgg
 gAHtikKq+emcykPLhaa3Yx2JI1mfFlGfiXLh3BVkcWIwDGLXpPK86IrE61Ovn4Rmh+/qGYzGVDQ
 d0mZfBZz5ctcgddxIqTdt1cMkvL4pC8UclZQascqcpaIY8X8Xe9yEsExDSn5eh+oD7g4ohHltlJ
 LTxn6wlszRnxrOavjWK3M1ELuY7VpkXu+cwIdhOm5Z6cOakdBDBCz4Nwn7VXsBDH3LQs843KAK6
 vBlgKNnrS1Cc0Jz6Gcg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4NCBTYWx0ZWRfX2PI17SmOIYEs
 ZzbuyCYqLjC1RDqTDM0IxPs9SxiiwGtlXFhfQLLW6WuUUCuYfZ8F9bhVUspX+2+kNUZzV8V3Eap
 d42H7w8ZsyFrqAXSm7/bSUkyoFpLrIk=
X-Proofpoint-GUID: zKV0-wklF64gtu9cQUl2COVxMbGEJ9kZ
X-Proofpoint-ORIG-GUID: zKV0-wklF64gtu9cQUl2COVxMbGEJ9kZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090184

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add specific compatible strings to document the GPU SMMU present
in the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a701dec2fa0a..ad15fda5c25e 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -108,6 +108,7 @@ properties:
               - qcom,sc7280-smmu-500
               - qcom,sc8180x-smmu-500
               - qcom,sc8280xp-smmu-500
+              - qcom,shikra-smmu-500
               - qcom,sm6115-smmu-500
               - qcom,sm6125-smmu-500
               - qcom,sm8150-smmu-500
@@ -543,6 +544,7 @@ allOf:
             - enum:
                 - qcom,milos-smmu-500
                 - qcom,sar2130p-smmu-500
+                - qcom,shikra-smmu-500
                 - qcom,sm8550-smmu-500
                 - qcom,sm8650-smmu-500
                 - qcom,x1e80100-smmu-500

-- 
2.54.0

