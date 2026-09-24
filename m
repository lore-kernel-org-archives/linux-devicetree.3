Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B3930D3E0
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 16:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266338; cv=none; b=csY0XKI4LJWMonvtdGrzqaVCwSlgpMzclir9DDEtXG/owU313lQbZI/VM999AG0pSperFTOlmwmPp9pP6/rOX64344TKw2c4AmbU31aYZ2wF9r/qy0LIJnz1gpkYNU858ZeaG3QvGOOMuRAlpTFhYS7tBDvFG75kCpPqCjt9X4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266338; c=relaxed/simple;
	bh=nFu5cZyJWfYCZQqJSD1MA53aV1Ql8TKSLZDCBHA0S6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p2/FXEQCgeFLzzb7oO5hzjVj8MFGZQgZ4cpKFMba6owU+QHCcSvXziSrfpQ+pZbNVMC4aUIp8nIyy9y/SAIY5811bh8VA0RR1c7Mfp+b3PXeVFUkTxW3XzL3r5bq21PfyxzLXh1x/sQqUfpUqsBWg1xJl8ZHrRS+8Lf+35QoWpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oY9i4VQh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DBZ1MTOK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oY9i4VQh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DBZ1MTOK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFeZEj2854946
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 16:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wtr8nAFBmhA
	G5ZPJSvNGUOY/BVd0Wfn7M3OeN6XL/Kw=; b=oY9i4VQhZvH7+/N1hgVd1bwVEFM
	duRiBpxxXX+r4zzax/P49F83TCf8aEekqhyZJY40ITQrntV39eNX21sUofYPA+wr
	ggit7y3v9jHh1cmbYVJU2VPpF7HDHLKlWTTdqhHGGKHA/iZ46rVPs/JRC11qCEWF
	ynp/4ojMFg0A1BZAkj44gLIw6FFootcHgv+uPbfMdS3B5mvzaeCv+Kgyn7+Ctg8r
	uuZMxM4wjI3c4Y5X/qSIDng39vgUDNVbTSJbRURU+MkUuff+DfOa3zjFmglYRv0k
	0gw6TWYJl0y8qrZu16BDyZ/jMjauvaT6roL9kp2uANOmaZEv0wDagLGeRvg==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvsfguerd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 16:12:15 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66c73057f18so66902d50.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790266335; x=1790871135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wtr8nAFBmhAG5ZPJSvNGUOY/BVd0Wfn7M3OeN6XL/Kw=;
        b=DBZ1MTOKmGZWUUBW95yah3EDUxHi3uBfrKTmq2MM+Taov1xrrAYdjkJ2C+9CMdFzom
         MY66igE1iPYAbCSnovkTZtgV1wIsQQ+5VRI1r9Q5YfNstj23V/EgqoWOFlrxQ6mLlih4
         rI1Mtxa+w1nld/6/Owt4kQDiAX1xt1MY1bfC3iUZqLnwwVzXh665Ss7Rlfn8UrLKGmxl
         Q9symYIEudyN+8QjLz1iaFR2z0Oeg65zOQALdY3WBdE0SDMTU4rPkCcWh2qHPFmy/x9g
         eD4mLSQHPedD5zE6UPprE2wPDOWxg5mT5vb+y3Pl+ue0AsQfJcMPVvjVlF7tylTNtT/0
         lSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790266335; x=1790871135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wtr8nAFBmhAG5ZPJSvNGUOY/BVd0Wfn7M3OeN6XL/Kw=;
        b=vTybqV6w0CzKemmvgQctMdXB2L9hzXxQR8IFt/5xj2AO4IaIjuu2nTppiHTxKIV0NL
         A+qFSbFX00MLJbZin8RX3dIjOc8pA1oXS1iz1NEUn68IdzVaEL/Ys3gns/QVqoOFX3u4
         nN6ZDCGgSwEDycj8tTMbT8VcAppKJ4I8xC0TitkTQlNaHLvkoRdIF0Jm4X2knYr7bMz0
         aiBDLZFtO8dQ8qyfDS3g18kw1BqPuxIzw20CcICtWFiBqdEeDDq8XqmM4jY03Ip4QYlq
         t6a/kMsebv3bExLMSnWME4UOiFmDnM6jeQqRj3Q7waVTDwSeajS/d8cVhee6UbSiCbLx
         VSTw==
X-Forwarded-Encrypted: i=1; AKwUvByxcc4VRytHVGJpYRCJZCK8vpf/BRy6/Yk4pc5rCjM4kxrmWS6FSNLFKBf30SZhiQB9aQr7EVwVOjAv@vger.kernel.org
X-Gm-Message-State: AFuF++kGW8iWKDAEvuhMPJui+b1gPdwF6+2GyqoR7/xP2yUWGhtUz4t8
	4CjW9nmJ3flPqcEWqoPDOJ8TtaLyGpPll8DUeuVrHCBU9w2edZGK22fnKxKO3myKTbLXw/Y6XC9
	lSwbLRxob9VF8OTjBkrZOKUx518BPgknsAaIVErITGUbFWqDHYeXx/N0Qu1GFlAVr
X-Gm-Gg: AYBFou3tlwEILkk18S82FlgD+ORyNGpp6oqd1/Ltak5htOZZGTpCrXUqnM/Qo5tXMn3
	3wF1QEHgSG00P8UiT61Zk63X6udqUbaQzZqpLMh3AoDgKncLtxSxOlRmKCtW29016HYYzTmVhkf
	Cplq00wfg0210Ath5Z7kOrgXFnqpazXezG4Z/KszJ8ZxxiE2i9GvvsmGSZCd1gry/PzCMZf3BAu
	kzl505i+1p+5aoVU/yVrnWAD7VPqO6TmThMLhm8fNNPOV56J5UfuRTw7iCCIkv8Xba6T1PnBk0G
	cQcsP8yL72xla4ZoHLhVplXTRlYjJy/lZwWnxCJfZe4SGC2wIbOhEUR5oy4DYfkUzFj0st/pZFA
	A+URkOUuMZOOcnG67V9jY6uO8tnJ0VfvNZ7ZFiBcVntA8M1zBLYYIyZ9JdSw=
X-Received: by 2002:a05:690e:144d:b0:672:b007:dad with SMTP id 956f58d0204a3-672ed38252dmr1794976d50.71.1790266334411;
        Thu, 24 Sep 2026 09:12:14 -0700 (PDT)
X-Received: by 2002:a05:690e:144d:b0:672:b007:dad with SMTP id 956f58d0204a3-672ed38252dmr1794935d50.71.1790266333703;
        Thu, 24 Sep 2026 09:12:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91425cd8416sm9698296d6.17.2026.09.24.09.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:12:13 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/3] dt-bindings: clock: qcom,sm8450-videocc: Fix clock inputs for Glymur
Date: Fri, 25 Sep 2026 00:11:50 +0800
Message-ID: <20260924161152.1162301-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YfoodARf c=1 sm=1 tr=0 ts=6ab54bdf cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=3WhL5buBUIyFYQ3kjXcA:9 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-ORIG-GUID: -KTIyQPwM6p8L2KIF9qAOdyKqXphILZ9
X-Proofpoint-GUID: -KTIyQPwM6p8L2KIF9qAOdyKqXphILZ9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfX1pJF2kh+GwPO
 1Mteq2hX7w42MQtGjl2VngyPbLRho/Hvo99xz9Erx9sdHF5mSf57jH/zNHHxgWgTbrBw0KVy+I+
 no8X8GqaU4o7jb/+UL0bCHE9fVNp/hw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfXxvRVHHmwvhvW
 mCEOEMY7R1di9awA7XLBYE2Akn6/l1gNNHnBkZAZ1GsfVb4COy48gHJZSTkuSbA8Qq4qdx9Q+Wo
 5yi8fDnwKH2MOcEjrYpDtHg5BmNWQlm/lp5gtlF9bo0O+JkOW/wdETYjmkgK+FM7fGuP/eTp24F
 tM/qVJOT+oSXY0VedZQkWuSEytX56EoIkJE/+kmgc+MSzLIUWgeTOlsiydxVlFBwYnRTLO9kVbx
 lOmnX6bBrcMVHE4rpPTH+omz3HZVpfnqwkFLu2tsKxFw5sl3xRbvxxDmRzYFG99lxroVHsTAq2O
 OKhq61eCGJzEvey0YBAWONx6ESu2uwbK9PB1G7fLOJspCDRyWWu1nS/r8hXAPW0HYCNIDTlc8se
 FDDM5DY0Xtxthf/iL+sWFz1NTu3dqAJ+pHRUPuX1h0EAQ6TfJa8cYoBq8J9UNXmOAhHQ7x8K+ue
 Fz6pYqtR4SqXNJcO+/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240066

The schema describes exactly two clock inputs for every compatible it
covers, a board XO and a video AHB clock from GCC. That is only true
for part of the drivers bound to these compatibles. videocc-glymur.c,
which handles qcom,glymur-videocc and qcom,nord-videocc, and
videocc-sm8750.c both declare their DT inputs as DT_BI_TCXO,
DT_BI_TCXO_AO and DT_SLEEP_CLK, and parent video_cc_sleep_clk_src on
DT_SLEEP_CLK.

Because the schema stops at two items, no device tree can supply the
third input, so video_cc_sleep_clk_src can never resolve its parent
and registers as an orphan clock. It also documents the second input
as an AHB clock, which no device tree using these two drivers passes,
and which those drivers would interpret as the always-on XO.

Describe three inputs for the Glymur, Nord and SM8750 compatibles,
keeping the existing two-input description for the rest. The sibling
qcom,glymur-evacc.yaml, whose driver has the same shape, already
documents a sleep clock this way.

Fixes: ed9ca8296147 ("dt-bindings: clock: qcom: Add video clock controller on Glymur SoC")
Fixes: b190eaea5780 ("dt-bindings: clock: qcom: Add SM8750 video clock controller")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml   | 26 ++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index e985a450451d..9bd746afbc11 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -42,9 +42,8 @@ properties:
       - qcom,x1p42100-videocc
 
   clocks:
-    items:
-      - description: Board XO source
-      - description: Video AHB clock from GCC
+    minItems: 2
+    maxItems: 3
 
   power-domains:
     description:
@@ -79,6 +78,27 @@ allOf:
     then:
       required:
         - required-opps
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-videocc
+              - qcom,nord-videocc
+              - qcom,sm8750-videocc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Board always-on XO source
+            - description: Sleep clock source
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Video AHB clock from GCC
 
 unevaluatedProperties: false
 
-- 
2.43.0

