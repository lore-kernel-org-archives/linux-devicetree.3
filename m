Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB4347DD43
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 11:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198923; cv=none; b=Me6o926nFXpoZvMX31uRa5b+6FDAE1jGGvq89t9no52AgqBi0gz91zzzQ/1qxHQuIqquvvGAptGTT6zTUPCj9WKF4jC/tDBJqifmRgW6qmJsArtpi42V+6NshhswNh9eRu96/mC6Z8/CuCZXS0V7r8ADARWu6Wv8niTp8Qf/IKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198923; c=relaxed/simple;
	bh=BK1MJ1z6ERN0evL3s5ZUXjGO0uqyootd6E97dDU2DzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bwmwBK6AU1Q9q4C7/vwSH1bGekTmOR00aGbyFqxrB9Lpir+hJ6VC02WkbL4IVtrbW8dmv9H+ulRgOg23C3cnc8aqkU0tfboq2qE95GRdTXMwK26gWf4YsriAd6DbLiToDisoQR9GpwqQ4qWSozVCs8htYabdYpfQ248yo8ffb84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JdccRYB2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qtw+oE6B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JdccRYB2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qtw+oE6B"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695AoFDR1711282
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 11:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HxLGlwJ2KEccA8CkmqrCVI6Khzk5iGj0WMQPPmgSwoo=; b=JdccRYB2iGQ/OVAC
	8Y4tUbN2eUXcTXeG5znEwFOkfdQg9YBKOO4/S9V5hI4a8jpT0+C5lX+3QsRC4zA3
	4XdoMNvhp3l92GqgMR16gcCqm5f9GktWe+QWiDzR5qd9mikqYgxBDfsZ2H+aF9VN
	Wc+jEYEOpllL+qYH5Gp/DzinjAcoAvixSTHnob3lF2XmynutDQ0hdXrypyKQr6Dw
	NkbAJ38jALFUERa8yf44T50W3NRPTZ0zdDPssUhdxa8xlD+/GJvC2Eog++IO9c28
	JAi5aFWGAzB4Zq/qHS6YELk1N1oVEN7AfggWZfng6wFC1dfoCp8IcGXn9r7S0wVb
	gEqvIg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssudm2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 11:15:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88b45cc20ebso911104b3a.2
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 04:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791198919; x=1791803719; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HxLGlwJ2KEccA8CkmqrCVI6Khzk5iGj0WMQPPmgSwoo=;
        b=Qtw+oE6B0nygrivPqeHjR5R2MP8C0iffUUDAR03lcrjRSbO66jS4g+7Jaah0vIaV/m
         NQyvmJGb3jQ2ytm3Af4tOSRI4qjYG7jmWI90VADOt0ok7pEYAVWI8nzQcmCMmneB+XZQ
         ajXvOPwY6fVPB1KVxw09dGYYzdu1KGTjgUTAQMIXaKxCo3Mh3kqr9MFhoIFfiKaNYUiH
         AXuRtoMlSot214/yUmNVguql09p0ozE6D88JHpeB96AkXXwrHVqoBzgCt4KSDhZo7Jua
         ONybe0PsCdmC36koeBXJdCXWQHkgdyGyJeNC82zxsqswI+k2vC1Q2F4YfLG3KO25+/w6
         MPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198919; x=1791803719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HxLGlwJ2KEccA8CkmqrCVI6Khzk5iGj0WMQPPmgSwoo=;
        b=ogb1XKyGBbfl2ZvHCdOHIdiFT1tJMCS/xCQ/yzgsOdBVq0yHQtZDXi+KskR9eqDywf
         S3DW2kIIj9WNfNeaXOGHolbgCJBrApjtKRu3X1/kqo07WO9wJrQ59wzCk7VAC2FE1Bbk
         586OQxSNIfJ/++rQeM0msCI47EvNsy4qWcR8BPLYRMWfU3Fi8HOdB/mRJIhOzA9Jz6ZC
         GStyAAsYXyX3ub+TGoWVV0ltSjFMDk9i8Yh8vUF9OIZihTNHpacUxeaEDxxMPC/cNeYp
         LIpqD55hnJnOtAVUBtG0Wql4LXIPn73XrysX5O2TqcOVcihlTGmpLNSyLZqwZVfFn4MJ
         0CFw==
X-Forwarded-Encrypted: i=1; AKwUvBzfnhhilqVyBqnv8CO7YJX3Ih4SGM58IfoMvv65eYaUFOZ85nK+q+Vt9N24CnnVIXHYQv9uGsDcwcrX@vger.kernel.org
X-Gm-Message-State: AFuF++khcOk/bi3i+UWSRZ54kE0iuMkfzdaFivOcm0E+qFmO7MdfHyao
	fVk5YytBkU/C+5VXM6UBhANRyn+gPl/sqKd6uzCZETjVAeMzU8/QNSPqPVr6nFY/TngzdS1nU6E
	/WiUAKE83+fVLt4Ud5H/qNJ7hHG7Cd4vkzbOrx/kicIMnq3sfVuJumdyV8k5S0Kt6J913XTxH
X-Gm-Gg: AYBFou2mfFhse8jSR61SUCIcEKeq6D5bOsYEto/qXj6xhxMrtcJynPVsyaPdmXzc9Kz
	KDaOxRdpw/x9YMRYjHEcdZ4kdXCYTbBkLLSr0wVBBJNDy0G2iG2FWEXTuPvwzoONzHVRV3QNaRC
	I3kn1deWhT5kdGv3NWKJIYoHm7voYxNjE8MM7gI6Tl3bwvqlZF8lB6asMaVBoLnx89RXy6HQUuP
	LZc5kQK7rbQd5rw1KRaijdIdK6Z5AGjYhFrDZ0ADeYSYWDmPRtoabNeiYjH7qe7thhEnKIoRAAS
	PjsgT/V1yzg1dwoqPakLbMrB0nRrjmmX3R/ZDyJJKhUyAcacPPUG57YrZXnBazxk1PV5Uudtdel
	8IPP2dLjqXXtzdw==
X-Received: by 2002:a05:6a00:148d:b0:888:119d:efae with SMTP id d2e1a72fcca58-88af894f9bemr9592268b3a.53.1791198917876;
        Mon, 05 Oct 2026 04:15:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:148d:b0:888:119d:efae with SMTP id d2e1a72fcca58-88af894f9bemr9592229b3a.53.1791198917325;
        Mon, 05 Oct 2026 04:15:17 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c59e3afsm3249852b3a.33.2026.10.05.04.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:15:16 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 16:44:45 +0530
Subject: [PATCH v3 1/2] dt-bindings: remoteproc: qcom,shikra-pas: Allow 3
 IOMMUs for LPAICP
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-shikra-el2-v3-1-618f7343695c@oss.qualcomm.com>
References: <20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com>
In-Reply-To: <20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791198906; l=1991;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=BK1MJ1z6ERN0evL3s5ZUXjGO0uqyootd6E97dDU2DzQ=;
 b=8dMnpA2iR7nzgXHo8slXfvbXOSdq/qSaosPh8fJpx1LYoTmysgFV/AvhXaPlspOK8Aecn5ST1
 ARvZjTt9zjgBlyuL709/XpwMjT95ChVZNZDgE+IoRkr1JnNI5CI9WjO
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0MyBTYWx0ZWRfX+zYqVU4fSpCV
 ExIW/8Fj8zbxtR08wA3LLF1YkbpdRJJEZkSnY0snsxOPGAaAO8l/MuIhtukBwIPWxQfuU6ock4s
 s0t+jcGMWgd4vW9QpjauyT3xRA8yr1Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0MyBTYWx0ZWRfX7PLzASpZJTSN
 MiBIpf/SbFZLVIeM+cPcc4CUR42g0SlDWZ8GPuGxQIOkBipNoEXvcFub4786LA3BHFsvMNK7LYE
 IBuuEsGZba46U9JU1iWJxn2XhONTgWXvrA0U0PNDewCYTv+lXECNCikual26qBvckkgx6vz34Qq
 gadjoV8f2tJ5YtPz/Cx7Nj2GuS8Q4c/0I7h4Xc6NKGOaXWgTkFdFh2wh+p6jM4TE1TeSwVHAiwI
 cDY6vb+p/jMOFs9QOXifFeQc3igRZH24Kc7pvYNMpGxvNJo/54I6Br+QE92dAPNcd8wL140WcOI
 HtxBjPf6QQw1PiDbu8tYpSSvkkJWQyA9LW6DbbtRyqf3e10UjWCtynAgkV+X72ZwgrbZQUZbrHK
 gtSTbMvQwb8Sg7pkqskWwljACq6xZd9nkSkXnGnfC7pXLORutMuL1ul0C4zVa8Cso/gATagdvKf
 o07DHcjDWOjTrtRxXIA==
X-Proofpoint-GUID: RQa2zU7jum1cZVWCMZyFBytIiGB_Gg2f
X-Proofpoint-ORIG-GUID: RQa2zU7jum1cZVWCMZyFBytIiGB_Gg2f
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac386c7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=asbD4md8-q6e6i43ReAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_02,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050043

The Shikra LPAICP PAS requires three IOMMU entries. However,
qcom,shikra-pas.yaml inherits the `iommus` schema from
qcom,pas-common.yaml, which limits property to a single entry.

As a result, the LPAICP-specific `maxItems: 3` constraint conflicts
with the inherited `maxItems: 1` constraint, and a valid LPAICP node
fails schema validation.

Remove the pas-common schema reference and specify IOMMU entry limit
for each Shikra PAS compatible: one entry for CDSP and MPSS, and
three entries for LPAICP.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,shikra-pas.yaml   | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
index 34a2f15e9361..4196f61a8ba0 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -32,6 +32,9 @@ properties:
     items:
       - const: xo
 
+  interconnects:
+    maxItems: 1
+
   memory-region:
     minItems: 1
     maxItems: 2
@@ -92,10 +95,14 @@ required:
   - compatible
   - reg
   - memory-region
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - qcom,smem-states
+  - qcom,smem-state-names
 
 allOf:
-  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
-
   - if:
       properties:
         compatible:
@@ -112,6 +119,8 @@ allOf:
           maxItems: 1
         firmware-name:
           maxItems: 1
+        iommus:
+          maxItems: 1
         power-domains:
           items:
             - description: CX power domain
@@ -134,6 +143,8 @@ allOf:
           minItems: 2
         firmware-name:
           minItems: 2
+        iommus:
+          maxItems: 3
         power-domains: false
         power-domain-names: false
 

-- 
2.34.1

