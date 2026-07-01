Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C6A3BE174
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 10:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903521; cv=none; b=LUPrMkmbMtzkMvBxTpIZDty6knK4HNvOqbT7KoOBt96duIRSAGfkVm5p3mw7xeJofma0R/kuZWKVvoAgAD6J7qdwgu87P2tWIXeUJiJRnoh9FdCJtnlSASYa4yU9U/ihIA7EpX6LmWohBqRSgN0LXjsuia2VfDsgBtF1PsWCNZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903521; c=relaxed/simple;
	bh=fNkH0eOHPZJEtlvIE5B0UGTeoRzJJbYjhfyye3gYog0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m/3DVXOWUtGzVAp8ilODhcNdIrLlBJuVnwJ6dMbgazN6Lq8O8n/Iz9qbjLcXIaa4yD4gj+N6bcjuuK1JYx16+IHLagQRBDGbY0lniarWl4OJgItuNp0z4D820R4s4R5LeeyN0CfpNjn/cVdzcpggOdfeks2Aqio52Qz9MbK3ePU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IvMCLQ7Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1qMya/G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IvMCLQ7Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1qMya/G"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8VAH644015
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 10:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/t1PO2v5nP7keoCi5wzzaB5/xXCQmzgfOJf
	oKsWa+Dw=; b=IvMCLQ7QrcxGfHw8DpAvEorYg34kjG2gWGuawxw1V9viaU4lVfc
	Dow9HIqi2nRj1ObWuxyfxJNjvUbFQFIpsWEMoawgFTrIgX9qUoZDx16fgPuc6ujU
	RmeKCbFhC/lI4yUAzQQv07Wb6FNM1uGBfLvnk+O7nxrAMWRQquPqa1kI2iab/wfV
	S+V9MVAvL36dTtZr+mM9D0p5ketMu4/PoJ4gbpCMwMMnBw7oRc7YhQVd38obJDGC
	m+dluFiShqjXMT/lEeSpz5xXm4vQ+exijkVpJxz26JhuGs3rBuxpVlzxp2UJMd6E
	HzKSMB4eUKPXzh/HnQfcX7TGJYDwH0ZqtLw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd4dub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 10:58:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ac0a54110so66208885a.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 03:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782903518; x=1783508318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/t1PO2v5nP7keoCi5wzzaB5/xXCQmzgfOJfoKsWa+Dw=;
        b=I1qMya/Gtan2KgaFJP/VoLYcnBov9D6RbkUEUkuJ7gMLtsoBUstk0NHGKHUJ0hUXYJ
         PlJXUGUGdBygq23lzE5Qa2UnNP9bpekhe2i4zqLU5PDab70M6+5FBqpMsZsC7r+uXsFx
         icY/garnp3Gw7D1a6x2eJEvXMj52L9wDKiw2UfgEVkjBaj8xUrUJ45QQcQajkkCE6Giv
         ebzPNsLZ1Y3DwZk8CA0U8FvL1XHAMNYGcSiy4kGbpTjXADO/FDcpGTzABO970v6xTql9
         K9fAU4jn3qWlL/l8TK2bb4gxhh7tE8i/VtmEvgPm641Or3yIAfdc/DbiBB9a6sBj6Z13
         Cztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782903518; x=1783508318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/t1PO2v5nP7keoCi5wzzaB5/xXCQmzgfOJfoKsWa+Dw=;
        b=r4atK7Ux2LQD4bOzvgMvIi/yruxPPIFvVMUuyMI/tGVRLxd/WbU07mV396AGLzozh6
         4cqybmXP+rDbrsaFKOkhb3H9FhftOueiUHHG2QzpF3PQeMgUWjZqNs06zvvUzvY9VhJ0
         VCUzfqbuacaoGQiMkKfzmkRoHe8fK6hVjFJRZsLNogF+Tds5SmOg7YN7qeLA6UZ+dM9w
         lL+G+N5Vkei70p01R5GOTv8O4yAFcLBiPKSWiFwVMcAcCoc74T0flmZdZxyQdnyAeevj
         gb5hE47U/DvdYIJcQvly/DbGFsj5DcowIIzyvouc7nd1jXtKIqXbOuA/a+nVfQXVBC3y
         VSQA==
X-Forwarded-Encrypted: i=1; AFNElJ+GLctX9OyOmW74JK1QIupR+HPqqtd7BbGEM1o/MxJWLS5Ys2wiS4JCmtbzzTe6RSCvklPGhYhvPbD/@vger.kernel.org
X-Gm-Message-State: AOJu0YwfP/86RYG9Drb6HWn2WtovbIaz9eHkurNms3CJqvthhv+UjeBE
	Y65yNl3dBJPxGDdrflQQm6Rv2uxk8Ws4+l5vHWfeoj2LvCdO4fbm5r7NSiio/MIkdXLx6D89ifJ
	G7qMSD0Rcstf7Ic+pRavfWw/MIaJ8SoYp+yEwT9MRvvIaMr6yWwJy9uMiDfqw8KKy
X-Gm-Gg: AfdE7cmCynlpoV01/c7MlRJy8drg12g0GNCr4HbG4+9U3xmPuA2bJfVBMmsLr6kC6FB
	55E1GXQp68tRPV9fW1yRQs5mxtErwidgSdbQghfhl6rIxEOmEL0Q9nVIKXwzMV/r6Jxzbs+nGLd
	0pNxb/eTqb1WWdRctMqqhh1DuAv9lG0Ot2w38kWVF8PRX5pTz95Hi5SigS7/HAjCW+VKvcGXDfK
	wrG7TtiI9FXcSOqpCJuIK66rwBOdpU/u9dvqezGq+du6TpGW/t5/oUYgPDFK6HQSrKLsdlRF6tI
	CL1E9EigEHEm4VnWNorukGJbGrTjZYxUkK65w19qkTvqVk40mkcTPmS4bvmOwJ48AGMZxNoZSPH
	hnyNftLKmWCJF+P4R0Z95yNiMQAQ=
X-Received: by 2002:a05:620a:4888:b0:92e:5a5c:6582 with SMTP id af79cd13be357-92e785220ebmr138277385a.73.1782903518572;
        Wed, 01 Jul 2026 03:58:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4888:b0:92e:5a5c:6582 with SMTP id af79cd13be357-92e785220ebmr138273785a.73.1782903518148;
        Wed, 01 Jul 2026 03:58:38 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be81df2asm126262125e9.12.2026.07.01.03.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:58:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: sram: qcom,imem: Narrow allowed reboot modes
Date: Wed,  1 Jul 2026 12:58:33 +0200
Message-ID: <20260701105832.197036-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1627; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=fNkH0eOHPZJEtlvIE5B0UGTeoRzJJbYjhfyye3gYog0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqRPLYVQg0/fkpEmVcibWWKC1xlAoZZIO9tLlU0
 5ddB3Qms8mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakTy2AAKCRDBN2bmhouD
 11RlD/0X1a+QjH9839s7BToAHEkenock+BB8ShmgnxBXSNNmGHVkMST4e4n2vUrrS90qd8G97eY
 sfFK8mtsXMwW778L6DQp3ZxS03rP1ecEjFia1R1vDdaGunkEGIPN2coa8M7x0POD0k8pZENhXHb
 gxwLegRe0oerufQz4Gi98cUd2wN8ZKOVFviv0NOiQCYcCWfONKWrj19a+XKKpYwVS5dbIRKQS+P
 L7kYMWSzxFOCKmOAwBNDQUF/rs+hKWCNSOkUMbhKG9w+8x33S92UYVqXPSQvb8w0XADYTPHQ7Q1
 0MtqlMIvlYSkjn/ovBUKYs3mAIeDQRXF1TOqx6wDVeFCguGEKkhmJKfAGo9amwW4gSo6XndlJVf
 EZ25q8FoPnlD7HQgDBj23ZLaFr6zkiwy1I/yNi6IpFwWDrUBOMoSlCHhmLym2qk0jtPEY7RM9dG
 4ULTNix5M+as9/JgLLLLtv+NVw+AmkRYkPqFMr/FIoIbwvsr0HuwXj7zK00GOQ6Q8DVrR0cRyTl
 94BdWFlBqbHcnM25puBfsiNfSvJGlj/yEjxj9f8QKMOk2WNYdpJDrZGwIxhbud5nV5EhMDs/WsW
 ywF7/JxEXL76b1VhIxt3Vkcs2hhp+Vu3WLqtMoRnXX6YLc2P5u+Auqq7hFXrDfVxT0NnNWKUZDg sx2UDYWX/59QZQg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX5e3RlBnGbUvF
 XB3X6JJ3y0A2YCHMN6hqB+5HgmFP/uIn3NLym6aLT0Z+NynRkr1UtbkzLrO1YWDJvn8b2JD3tof
 VEhEOfVFrJnMy0j9qQm6ScJKFrhi5RA=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a44f2df cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=5Ns_PCRctq0m1xQJbZ0A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: rlbqxkw608jWXFxBYfeuGRt4fJOtgWgG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX6LqkQ5KPvulC
 gtEPsKYhGnZ+MAPc3niDBdPvizVtDV2lcdsC8vHfs8xOxfuCh3tIA9dZ9uPlSbm/VrEhtceU1Yf
 eyEMFsv/dspnG2l+kMZqhJviMrLAObaDh1yUqlgZcrg8+t2wpgr+XZP+OvfYhupQPc2PDbKnxz7
 fU2l6GZi80v7AyHQgUocKXKG8NXvPhu3QfEMYAvPYkxtzHFKGPXhKK+VtqL1z7uBFMT8ILztVwR
 fN8g4NDIgx7XLfvNo3BWN7xA7MaaZCxiomg0M6o715i+XFahW/ipGFp/M3OJqFUqnsNQ9h/oPg6
 U326q5A5XY61hlD8vlziF3UShmxxKFCQdygeGWr+azufGKLynR08VeLu4maDw3uV0mvFdADeIBR
 kRT4rcsqweNRKwbhY8aMJJpjVtpMzW9wk5cKae0wxMxw4Xt2kkJFTL7bP+hK3uYSvFF7aENRB1+
 9Tl/ypCFEt9OK3FRB7Q==
X-Proofpoint-GUID: rlbqxkw608jWXFxBYfeuGRt4fJOtgWgG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010115

Only few Qualcomm IMEM devices actually provide interface for setting
reboot modes, but top-level schema allows "reboot-mode" child for
everyone.  Narrow this to specific compatibles.

syscon-reboot-mode schema allows arbitrary "mode-.* properties but only
a subset actually makes sense and is valid.  Provide negative look-ahead
pattern to disallow any modes not supported by the device, which
tightens the binding even more.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/sram/qcom,imem.yaml   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index c63026904061..eaa8ef367ff4 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -89,6 +89,26 @@ required:
   - compatible
   - reg
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,apq8064-imem
+              - qcom,msm8226-imem
+              - qcom,msm8974-imem
+    then:
+      properties:
+        reboot-mode:
+          patternProperties:
+            # Negative look-ahead to disallow unsupported modes. The '$' has to be
+            # part of lookahead group to work, instead of trailing outside of ().
+            "^mode-(?!(bootloader$|normal$|recovery$))": false
+    else:
+      properties:
+        reboot-mode: false
+
 additionalProperties: false
 
 examples:
-- 
2.53.0

