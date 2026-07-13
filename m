Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C433E8C56
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938371; cv=none; b=Sr/8fhanHqTD3h/HrlyMdKBdURYT96DCG2gO3EfIR5aG7TQQdeH023IpJ3nawxfcNhNKqpSwFJMp+PbhjTpzM7pNlETP9znqMyhg414qfgJVT34d2CYC6YurCd4eAFTtb1j85R4P9IKPd01Z3IKfXppYOTsiXljd/+5VfjLxxxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938371; c=relaxed/simple;
	bh=COtlV2miqSmmuYhN319FIilNNO19z5IJ+7+0E1txUrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E+JCRfteyb1ze8lE6vxcB3ip6JLe7FamQJWWQt6dQSc6PrDJ4kFyYXVKbi6zTcHkAeZjcVkFPH/7BDSFZy1HLmVeyGLUiZVSvWQyaw5hoBoq2sL9HWNk0+Pynyo/pfp9btmIG4npQ4mYIyfdlaknsIVYbmPPTkI/dJECtpEb5dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DoWx5vEC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDRMlWkD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DoWx5vEC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RDRMlWkD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7Ykdb794223
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PSHGhSij0Rn5kLkHGE141HylavKbteP3eeIPUCl1dYM=; b=DoWx5vECsak2IS6H
	PGr6Z/YvmXe52ZW2LiHgiignkTJ+cUutDXfpRQTNYLVR0C99bXew9Z1ONfMXyeOa
	tXLbOAfL/uOt1X2naOayPOS+Q3hWoFIG5xjRWyVixbIoQQ23hTLfRNdLOwrgLNzr
	KzMojAXECEAfETt2jRhMbGxPJyXYPKVAR9/+Ilo08uPw3H/onTZ1FxyD5vytwOyl
	m1hAk9XIaUziyjrITutnN3WqmRBJQiA8yY/+DC5eqMXPfP9V59MGQNa8KlvgUScr
	lHfaAP+mB/rIBlrBR0m5arqzs8Gq4cH8vxgAVLLPzzCQ8/BpKMcuxjVT8DUVl8T8
	iZq14g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn0kvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbf293831so4179112a91.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 03:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938368; x=1784543168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PSHGhSij0Rn5kLkHGE141HylavKbteP3eeIPUCl1dYM=;
        b=RDRMlWkDAws7XCoYeodMlXL6aBN62YWpPesnaXTy1yDHfiaTVJKJTQiIWNE8ngCDyj
         s/Zmlde3JwFq7lni2yujgjqIj+k5PCJYQg7eGQvKnK3biYUkg1LI+XNPg5qnOSQx0m5J
         EiNF1aY8Y/XATnMrXtZAx6t5C8IdK9z7E04EPJoprQp4w9Gmv3++vf8ZLsqaEx7vpRVF
         3YQjMMMj7vzR92VKUjmPu+UYfLyVxPDzSjmcV3qUuj4/4xkUCDH+nDMi7Xr0lEm7M9NO
         Nu0d2c36t76ituN/EKH5RAZfg8Jh3Y4cZzOuratQ3Gr1Q29cE6GDCRUmUIwU50P2GZ2s
         9I8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938368; x=1784543168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PSHGhSij0Rn5kLkHGE141HylavKbteP3eeIPUCl1dYM=;
        b=Uio5FseBYjh2c2UTHiwCzJdKLRj3kikJHj2fQ5claaLOtgVfNRwG6FeXmG4KgDYJff
         WLlMboTTOdcdVGq9kAYsf6WEhtb5Uxo1bUIBQLRcuxQ9ojzbL0DptfV3p4gjsRH0OrQu
         4sEOXmDSGHVgBhoTVsLyFArkAKeZShx4Zeoi9+fEqVM+VT5GMR4aub14OIKblV1fvdEc
         mmvWar5WefHRNEMEFlK+o7z3JlJam66N+TaeH3hRU58/t8Ozc0S8QT4z8wo7ek2y1go+
         Vtu6hJNLMfubHh6ZjchatPxDhkRf+qt7OO4E6tBSRNzYvFpgc1vhcmpzjF2dY4mANlNS
         mtRg==
X-Forwarded-Encrypted: i=1; AHgh+Rpx/QbEwePno8hkmupAJKpJyC0J/8EPe5rWFUyyykvji8RpeWy939WWwzk/0bf7VMdRxkebJ+iK7DCl@vger.kernel.org
X-Gm-Message-State: AOJu0YzfpDG4ITGGf7E4XgitQQVwJB+uJzxPLfPVy3eT2qQ21/vHCPiO
	x8c0PTyLHpqvvG+q/sksANhYXxDbzhq/h8YrdXFxuuzOEnH2pHJG2imH2oFOZCgsZwEedRGJujN
	nx7k6rt7sLlL63w/RC6u+Ff3+LxPGwRaUWFOE3g1g0/aV+Bz1YEWXqEy47YtAqNzC
X-Gm-Gg: AfdE7clVFnU0vEmUYKzJg0Y7LAMn1WfoDadJF9+3agS15hegvd+gp5AtxAlKSMobWr7
	g0TxgKWnwGB3PHSqfDVT8y2tCX4slksJbIidKcuJvN4LbqyJZKkVPaPNTAqgmoZXwFn6B9+ND5A
	BOVQwHAR3feeoG176OT8FLW2i8KpTgU9mcZCoc39NADrtP/YyVkW4OXobbyIHtYXoYEmpp78YdC
	g8SjRQwnTbcVUr76PR1AyTa90Kr5SCRteziCxJ+ws9VgTcitNOFujVk8RVuRqrnQeEvv88VHumG
	u+xSF5UJqlDHOFTmYyi+G7zvzWXSCfdWZzXUo0HPgMSCiGr+xqklCmgIffJbKJIeyr19ujY23jZ
	MiTATugKHERvsU5TFGNPymF5rEvkda0thWx8yqG23
X-Received: by 2002:a05:6a20:734a:b0:3a8:9dd:75d5 with SMTP id adf61e73a8af0-3c110160ca0mr9007113637.24.1783938368065;
        Mon, 13 Jul 2026 03:26:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:734a:b0:3a8:9dd:75d5 with SMTP id adf61e73a8af0-3c110160ca0mr9007097637.24.1783938367637;
        Mon, 13 Jul 2026 03:26:07 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b924258a2sm49010603c88.1.2026.07.13.03.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:26:07 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:55:41 +0530
Subject: [PATCH 1/7] dt-bindings: interrupt-controller: mpm: Document
 power-domains property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-shikra_lpm_addition-v1-1-3d858df2cbbf@oss.qualcomm.com>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783938358; l=1210;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=COtlV2miqSmmuYhN319FIilNNO19z5IJ+7+0E1txUrA=;
 b=6t7jhm0HMzkfGytAtFrNqMVZJWIuA0ebRB7sryxlujGphaPD/vNnR+BaWhRgY4GnTTtYWPqta
 I/d0wZ2XUcODBeD9nhM58bxH1cq6mWrMGGhpRvkZqlyvTfhepE5uqB9
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-ORIG-GUID: PxM67uL2Xxk7uGJLLo53hBpBtPc_YFXz
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54bd41 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=vgDixf3xU3NtsmyF1-EA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX2XLAYo1iDExr
 dTTjFrQiPqOh6in5l0gUkeb1MG45ACyatyzZVVwoYToi8Gnqa48cHMlyWBqhXofytfl280eumaD
 VPqwXcEwf5Bym4KVNd4BnBj5hSL/R/s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX9GTY0Q+TJNcm
 +Vn0spAUfvJeNYfRDODrhLzGA06GfCuIEEd5V9bjDOAOxLHTvikiBhoVJu2Qx6UXqhGljKs5WOj
 v2TKgKmeRMblHyQc1kLXjSDk7e8Vpg08Yo3ctLM3oksC6A0BBxjvxRw9h5yNGfrAscq9GAZPQhf
 7rnxFcAx1lBXIzBSZl+zGtZKQFketVt8ZI9eJINBZf/lzlw37+bsRcirZg7Lk2eEo6rfqQSRDxy
 aKnO0LVKRONbByNPfadLoUbgblegae36wzYNDaw2cFhtdCb+v8qjjk7M5U4ADaC6nmOr4JB4Ij6
 P0kB4EhL3ZwZ+oDkjFMLzGr9i98+HegCOZnPEfk9x0J1BfBRd8YlAminOku0DgJ5QF0klzgnFug
 dc2JRiZEWGj6hUG4CL5AX4f1cg1LJ/Ea3xJLwygx8N1KI//yZbcH5tqqARHjHajbMvmY1HkXmEC
 J6tsqZiSJakCD5PCiWA==
X-Proofpoint-GUID: PxM67uL2Xxk7uGJLLo53hBpBtPc_YFXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108

Remove #power-domain-cells property and add power-domains property for
MPM device.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,mpm.yaml          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
index ebb40c48950ab3a8fc86f5708acfc33c33d68993..3f9645fbc3c20633077aaa589e5d5a43928dab51 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
@@ -68,8 +68,8 @@ properties:
         - description: MPM pin number
         - description: GIC SPI number for the MPM pin
 
-  '#power-domain-cells':
-    const: 0
+  power-domains:
+    maxItems: 1
 
 required:
   - compatible
@@ -113,6 +113,6 @@ examples:
                                <24 79>,
                                <86 183>,
                                <91 260>;
-            #power-domain-cells = <0>;
+            power-domains = <&cluster_pd>;
         };
     };

-- 
2.34.1

