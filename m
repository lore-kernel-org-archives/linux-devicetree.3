Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DC93CA491
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 03:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789873387; cv=none; b=Z44JGj+H4oVoV3gSw31WR7WPrqhPt6pDc2S0HBYNTs/r90xDQ4QWMArbLbneFGtzAt5Vop4NMAqP+zTzyKVat5LSMYCGVhDlzfQ/B6Hoqa0Gw7q5y3IcvgXz8ESluNTeYzAwG+PCtPDwLFqK5AwkMCi/M4AXYtzwAQF7m6ByJfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789873387; c=relaxed/simple;
	bh=qDnRlzdNWHxPr2sKfopnsJrYvCLNmhxgOTc/Tb0JA4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RfOUqRvb+7EzQYwTBBRwEgy195DGg7xkyWR4G6XgZr2aS7Np1XrXp9c5Ia+bhubPzmDr6YTNjyg2vMPncOhNsky2Pu0M1UrC6Vj25jCLD6t+IRbk5JKPAW/dbb2jIqPhN7R0ISdxIr1uwVa37n8lyKfuitCIvt9aMzKDCpwMXCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JIkpo8uB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LFQeDyRO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JIkpo8uB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LFQeDyRO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K1mfKH432203
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 03:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9pkuXTCqTONwyNBbly+ZbcNChPqxogHh6f3ahubLomo=; b=JIkpo8uBv4hYGLfp
	0w6KluqiwMJ2AaR4EbSOBQ9e9URt5KDbWeJFQ5qVO9VyCuFxirobeZcEo2iUGslD
	Lea/REPdB8VVOH70yzf76U84EjpottNQck/z6Nr3e+HdSpjeEi8c7lmfUXokVfYP
	IfpJDEnTR2peuU3ioG1K2Oo6RqofYq006WgBln+t6tu5wTpdJOnLuOsrBOYaQJcV
	N+08A+gpNdNr4kHCSlbaaxp6q2UwHtcmZweKiWnO78hrVyEEtdIAA3FUOvPkfsZE
	ZSzTa/6udCu3nJgmglp1QuyJsxyV66S1Hy5JZV5TYXAYBCT9UjdaXcaQ4d+uA3Wx
	iMAu8w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs8222y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 03:03:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so3173577a91.3
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 20:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789873383; x=1790478183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9pkuXTCqTONwyNBbly+ZbcNChPqxogHh6f3ahubLomo=;
        b=LFQeDyROsS1anNJqliHPmziG6Go8eAboYFieTPPFK8Y1ff2i0ZbG5ulDSaUeePlEKc
         tl+evdVWY2oyO0gQiZdPwXeIGPVu0WzITTyXvvUiCRQpht34sdg8SsoTdyur1Eyzr0Ey
         pOhngNm/aYT1AeNqHKOAUtHwM1tWhU2r73uPEmslLqiHKumEWzHrSYNF8h6nUTJVLmPP
         CbhABNfJn0K/6xYB6Z6gNyJwO3nVfZP6Dl1HjCfP6P9Bh91+CtcGnBO82da6ZaIpKeOQ
         5V9L+MsYEQSVzDtlryack5nCQBYfndjVQ4RvResXUz295+tzwBkkKi16lkTqRKKD4iG4
         z2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789873383; x=1790478183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9pkuXTCqTONwyNBbly+ZbcNChPqxogHh6f3ahubLomo=;
        b=JapFpf2FAGWAbdyx5I546SR0lqAliB3Ra91Z/PXfFMnM+CzWX+5AgqWwl8U44ZPgX3
         ZQBnAmj9fVv8Sav+yVlm5cc/bJTEiJAs+XTS00xqDOmZm53q/JIDFCkvXFQ+v9qd4qNE
         47RcIZUX5sf7Zkn1PxgTR2vJjBrEQEdvblkLgGvbsRDKCgxP2bqz8lMewOxhsVyGAyKN
         woWOHFQAl39NUeScKmjBHeSiEPZOtqqcmIx9WNAITWW8dkmG2jhntc7Oj2ez2aEBzBpk
         GlPsCWZ1SKRZ3I2bGi9DnT4X7nScSgac+3JeuS3x+dZR9IMkh6r/g/45CL8HHUH7lwP5
         4Hug==
X-Forwarded-Encrypted: i=1; AKwUvByo3DKG1yT9gfmFQMlQ0ioiCx8sZmCGHc8pK7xxiW+BFNjLPoBR7PtmosuHUJW/6PLfsrytlNPPHzSD@vger.kernel.org
X-Gm-Message-State: AFuF++mYXJimNVLwNsx1nsPJLPhfwgALScBqV4JjPvt0wVWSGD820e6u
	EivuphN+urqZyNu1aK0zf9bB0b+Oy+PTeRS2rBOlNZtIBBCTAMHIGEeJb6zYT7YiQo8ohBTA3f2
	cSKvwdnotnWVzNO5CGcUPdWoXXOOKYG+qRpdGdE0uvL4XaYTSWwJ8H1obXAvqCZcO
X-Gm-Gg: AYBFou11zTVlWRp/wj1TTVvR/q1+wYTV1xv3025qzbFOr/RDMcJ2cE/ZqQ1gkDsN+s6
	AEQuaZOQnLibmeuSVTcc3MJixi9FR3zcbmLOH3mEYCfEO+4OWtVeHvAxxdRjuYINGG/9LMEV/Sc
	dlDxUo0YPfGzfuS6AVj2kyNQcqPBgR9GmkFbiXfV0te39mBJjjY6S0ITrGWRXFYjFhm8oNKSFs5
	rVf1sLSJhW7tHMSWkR7Z+zv5CBA2Txj7wws82qQo5y7VvXU7RgaA0P75Z7H2Yf1vp6HJfKFPHeM
	dld+sYxb+mUU/zms0FXqNPXkXxJXzIrW7cFp9/esriGEwAhJ2TwgelmMubsQMAgDj6R8rWsR9B5
	poznqOJhrDCHQCM/J3cb7IE9TWug3D+Zx/gSC
X-Received: by 2002:a17:90b:58ef:b0:39e:6a80:b792 with SMTP id 98e67ed59e1d1-39e6a80b85dmr6363247a91.34.1789873383370;
        Sat, 19 Sep 2026 20:03:03 -0700 (PDT)
X-Received: by 2002:a17:90b:58ef:b0:39e:6a80:b792 with SMTP id 98e67ed59e1d1-39e6a80b85dmr6363219a91.34.1789873382919;
        Sat, 19 Sep 2026 20:03:02 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144e14dd04dsm90012c88.7.2026.09.19.20.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 20:03:02 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 08:32:29 +0530
Subject: [PATCH net-next v2 1/2] dt-bindings: net: qcom,bam-dmux: Add
 memory-region and qcom,vmid properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-qcom-bam-dmux-vmid-ext-v2-1-ef5ca2178378@oss.qualcomm.com>
References: <20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com>
In-Reply-To: <20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com>
To: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789873371; l=2898;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=qDnRlzdNWHxPr2sKfopnsJrYvCLNmhxgOTc/Tb0JA4Y=;
 b=UEZWR4Rhjx0gbeBv4u45l3pVhS9jmXY9p+5G3+MqL9Hssqi5XIvmMO0UKF2rA8rGHF3xCNL19
 kMdjiBTbroOCxR2PnGdLFCxhfhxPKP1W9HpMfxhPavfZ0DF9x1VfCX5
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-ORIG-GUID: aWYZS32Ao72N5BbeNGzoxiHGKEKvQ-LX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDAzOSBTYWx0ZWRfXwQm9etVkMvms
 xeRu4FutTl3Hf95AOxRBYlhHQXfZk9nWNCBwxfWBGEzaf1RITrYeh1YbuIoCS1EsPXhTgoD8Z0X
 skz0yljONUugMF2/zODbpI0+8SG4O2U=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6aaf4ce8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=t_mNxi-BVxZHgpyDufwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDAzOSBTYWx0ZWRfX9ubBzuHjuG4/
 rt/kXKfzjrWTYskqEos/nRvuuGH4YcmZLINvfPu0Mi1ez/93FV5ibhfOhBJ0a9KdFrDQ6v7l4wY
 f9jLwADBqIoVIaSvDS5JlmIa4oqYr2biLmIYhZQdF4uUVrXIurN6ARjH8gPi3lA3TZf0w1y5p7r
 pCHHkwOgYEHkAWm1EV/nb9n1VuzGClgI1NIp8Y1Ynb33FjIGrf1Ap6SJHkq+ofHSsMvcRF92z+C
 1N3J986agP4GI3VRobWFcAekc5EWI3oOhuuJAOpKWr2+2VaBIg7+DBzI7o1ta3Vv+uhb3mrR4PQ
 nCEPr1sX7o58XpB0RCE613pO1SQjh8SvcIoK20GTscMYkkatnpw2Kldg/mtunNzgUz3s+m77+kt
 qtKiLI6uRnIA80xwcUwqB89+z9JkLp1ZS0q7o81hoYV+gNvudk8lVCrMchWNe2RWGVF5LZ5A+zV
 eqEgF3bUViIkmdiu5UA==
X-Proofpoint-GUID: aWYZS32Ao72N5BbeNGzoxiHGKEKvQ-LX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200039

Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
domain with restricted access to system memory. BAM-DMUX DMA mappings
must therefore be constrained to a designated region that can be shared
with the modem.

Add an optional memory-region property to reference a restricted DMA
pool used for BAM-DMUX mappings, and a qcom,vmid property to identify the
remote execution environment that is granted access to the pool through
SCM.

Require memory-region whenever qcom,vmid is specified.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 .../devicetree/bindings/net/qcom,bam-dmux.yaml     | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
index 33746c238513d72366bc52359fb10f275475b331..5351269b0ab72ede808ae47b55d57580af209038 100644
--- a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
@@ -72,6 +72,24 @@ properties:
       - const: tx
       - const: rx
 
+  memory-region:
+    maxItems: 1
+    description:
+      Phandle to a reserved-memory node compatible with restricted-dma-pool.
+      The BAM-DMUX device uses the pool for DMA mappings.
+
+  qcom,vmid:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 1
+    items:
+      minimum: 1
+      maximum: 63
+    description:
+      VMID of the remote execution environment that is granted access to the
+      restricted DMA pool through SCM. The local execution environment is
+      retained automatically and must not be specified.
+
 required:
   - compatible
   - interrupts
@@ -81,12 +99,29 @@ required:
   - dmas
   - dma-names
 
+dependencies:
+  qcom,vmid: [ memory-region ]
+
 additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/firmware/qcom,scm.h>
     #include <dt-bindings/interrupt-controller/irq.h>
 
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        bam_dmux_pool: restricted-dma-pool {
+            compatible = "restricted-dma-pool";
+            size = <0x40000>;
+            alignment = <0x40000>;
+            alloc-ranges = <0x80000000 0x80000000>;
+        };
+    };
+
     mpss: remoteproc {
         bam-dmux {
             compatible = "qcom,bam-dmux";
@@ -100,5 +135,8 @@ examples:
 
             dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
             dma-names = "tx", "rx";
+
+            memory-region = <&bam_dmux_pool>;
+            qcom,vmid = <QCOM_SCM_VMID_NAV>;
         };
     };

-- 
2.34.1

