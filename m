Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0189447669E
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969265; cv=none; b=qW+Y3p64retDuikLivQe0JOkVqBSeko3ikq5T+NtIkN19UPznw5oQeqGM5AxEmrsksEaQueGyIsui0IDnbA7LB8oKODr33NspIJHy4HoX2gZWndAk/8sAv4yeXzbXroXOEd45S6AjddGOwkJj9pzGXqiT77ntyBwo7NVrAmhNjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969265; c=relaxed/simple;
	bh=XjqDCkyewrBzwac9R8b3kZcouSm9EVUp97tlLF8Ho/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZbVTekD5xr7XEjm5w1/TWS5JfNYLEQ2Af5M/OLnP+M1g3u7bWrzhqLhufnjSpnZK47Q+C1SpSSPqt+KmtExu+YOXiOU3ez44Hogg6CzbWO0TvvuwHPxuoaR27VLcclKT2aY3qeWCWDXZBs2eqmV/aVOGQ8rg01NJRpdeKGCgXdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kzIGp/jA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TWLY7t/d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kzIGp/jA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TWLY7t/d"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E67iGC2685304
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fCgZ8m08GdP2r6C8RcUE81IwgkQsrBaJMa43tMr/y6U=; b=kzIGp/jAUVqkIEiB
	tgyhJLZgRNke3zmq4w0Nq0v8F99hYKMF+HdvAnb/SEE4n4NcTzF7AKaBtpR2tIyo
	wm+6AQ7K7wsCyIL/6pzrSJD+GzhzF4KdeGe/8fSqkboB+IZZqvvKJwS4MEwhm3ro
	SPwAwVoufDodnNwE/dn6a9fONX+PZSETsCY+4ylzRKDtj7pkTxCQ+igmej+hPv7X
	5f8zd499wrOVf9812f3eGUXhAfFqNekVZn3wQYIlNJGMPH5e+Iw59vLQqo5aBylT
	f0uaeYQtpLwQKL+/hlXgRefuO9hU62Il0upL0Va7lrG2v3qmz0fkCQ8T3Gt1FtQR
	8dtgQA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u0rke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:14:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e60770381cso34478915ad.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 02:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791969259; x=1792574059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fCgZ8m08GdP2r6C8RcUE81IwgkQsrBaJMa43tMr/y6U=;
        b=TWLY7t/dTigIzJZ1pOynoP5LWBLHjEXoNmE08eAtD5KXnXR1CNb0A7jFL74h4VutPS
         +GP+JkPBSrU81IXtmmjGRcV3FIzD9lqu8Ux6rWfDjETlGvfGyNKO2b/MJ13UFWeEl0WU
         IW9Bb7PB+z/+h7w7iFg2C5pqhQ/kFmDbclmK3+4r4d7SgYT1q6ksZFuExYV2xnIZ5Nwj
         hL3yR8YxUC5vCifPCzdQ1T4KYqnnx4z9zhJfgL1PvKl3ViE1py9oSvcasjzKe4r8LLr3
         cwvSNE5wPqW8x8DnB/t8ZrKZozp42G1dI3qE/s6TgmwxSqwi/9Dl/A8wWb7g5aPx2YqH
         HFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969259; x=1792574059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fCgZ8m08GdP2r6C8RcUE81IwgkQsrBaJMa43tMr/y6U=;
        b=SZy0vRRsBTyy6xaAyWwpCtMZhk03qAgzN7orm00sdIcQDRrkfvoZhWeLHtDU37bSVj
         EyM0wHq0RjTjgF1hplZ+/I5C4qn0QdgShVcB+UvW1C2E5nN+uVIN2w/OK0qhFPszMoLz
         b7UlPCZo9pUlDrAtJvqyyUTw6ZoDyyhhNWfJKLSdR3+dxA3jN4uw3RAy4FL6PRZmjffn
         f1RjXScbc6AP2DJ1jGiEBgZ/kkNvGpwL3EH2TIFmMXMdjKX8txnYaw6tLF4Rt7bQLATI
         VO4RbWbT/VuLmSjhWMNArhBCkSWVwGI7c9FKp1CA09kVHv/lhzjBx4Hs4jSSwXqFrw+c
         BAOw==
X-Forwarded-Encrypted: i=1; AKwUvBzerrJVDEemQHnYJfT5HcAyD6G62H2DrGbbiwkB/bZQBSLoV92LQgE8W0FKm7zA+KNaMxWuxYJm+8ZP@vger.kernel.org
X-Gm-Message-State: AFq9FYKDlGf/a75HtsVDKsAo77ev/+kT8eUh4X2OZkxnAQiT/Tin2E1t
	DM6a5yB70+YDD9RAt2SYaMiPYBoLp2xmXJxUDR6gnFpWUb+NA3od/AfU5xLFuh9yUHzXClYVW6l
	l47ZK9GPR7Q2dUYJpEgC/3GT1VO0/SguvklaEmQlmLMV2Szlu1Y61S4AV6AmTG4mj
X-Gm-Gg: AYBFou2fmoeQw24AAGG9EozYTIl5uzXAMFo6oom5rWruVQlZl3GqTSO3N8M5o+qBSWS
	yW0jAAAMyI9l3k4VOAOZ90XFNQgacDqz2Rw6TBccaRW1O7ldvjcaYsW4Zp4FQ7AW/In3G0gmuvg
	/6/uqFUmOdMdRTR8TA6nQmzdnfHCCxFd0Yc5uZly2PvUV4vhYb1xyU1UOwxyFUZywW+BvUbBSxR
	36Diaii82MHBnpI/F19pP9vrY43qn4YMpw2kOhz7T4Xoq1TiupdrsvzWrp0TYRzUZdjyXtDKkz/
	Lfa5CjpRU6RaRiEmtwdMrnWEq4Ey9VJvmDMleXWUj2SVC5FS/9JcJypPLyhsXfv2F5cN92zuAow
	bh5vTkog6t58Q3VMn74GTyM/qhGEixFQBdb8=
X-Received: by 2002:a17:902:f711:b0:2e2:c69a:bd7b with SMTP id d9443c01a7336-2e842ab6413mr120780735ad.13.1791969259168;
        Wed, 14 Oct 2026 02:14:19 -0700 (PDT)
X-Received: by 2002:a17:902:f711:b0:2e2:c69a:bd7b with SMTP id d9443c01a7336-2e842ab6413mr120780515ad.13.1791969258680;
        Wed, 14 Oct 2026 02:14:18 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b16b3sm67088595ad.30.2026.10.14.02.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:14:18 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:42:52 +0530
Subject: [PATCH v5 6/9] ASoC: dt-bindings: qcom: Add Hawi LPASS macro
 codecs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-add_shikra_support_v5-v5-6-fb9f0667e613@oss.qualcomm.com>
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
In-Reply-To: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791969222; l=4231;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=hgnMAngpDFTBBVMIoV7sw+gHudmMoq+o7sI1Dj+SSlA=;
 b=ps9ZbmpGm1vKC239QFJ7D0hyrH5RbJxImVCmtgyR+AHT0B6K1uW4ITgeUQCX2A9YhW0fMS9oe
 dhFVlCLLTd7DHUnhmWIRYvve34Vr8auuuXWsdySfAQ0ZtAdj6ipSymV
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX8nKUOO88y4pb
 e5xlNIlaFA7TiFuH+MSaO6Z54WBnacvUes8v12kWO6iK8E+eQfdZkAQdjcraFPIdyh32IqDCha/
 jCGN7appGxZPXgIgELF6KFwj+sIpf8w=
X-Proofpoint-GUID: maV1MNyptrTw5u7zraAmyzawhZaeRS47
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf47eb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=MdR4w2dFWrRrHIxOyxQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX5xtptwvwoPsk
 h2LlEoLo4dqO2V4MAt5Jx1FyQyMzcbtjgPPMCQzJJdrgqGjsbB3Dun4X9pTiXoTgz8QPBW0jaV+
 qj39vsxdjc7tBEvC0WovW24tOJqj/mY9kGBa/bJIJ4Aehpu0n8Gf7H2oA+c7hVZj7SkJW7UvQ8y
 bC4JJNi87XsKnZxVJlZ1nm0Kh4lthLR/IxGxjx/YRVShxOh0R1i79IbbyGq+O4DJCzBmObGuGAA
 iskoIX1S3xAOStyp6MSJzPuGfMuPp+PTuWzuPk7QOySL+3sdYt+VJYSZjs2BOBt9n4fYqllPYiS
 4mU835qomlsUgZ7d7NTyBJQAuApVM3spUyfkVmIXx5Q19wbKpl71aufpYGIefkzO8uY3OCrWK6E
 SBcpduFfjTIdCMXvOPCJilHOCvBazEIph1RQXEBE4Lo58u/rH53W8pPlE08OAxqr/Kxye0F3FpC
 zOoZRvGP44q7VdZjfRg==
X-Proofpoint-ORIG-GUID: maV1MNyptrTw5u7zraAmyzawhZaeRS47
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140036

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Document compatibles for the RX, TX and VA macro codecs found in the
Low Power Audio SubSystem (LPASS) of the Qualcomm Hawi SoC.

All three macros differ from SM8550, so describe them as standalone
compatibles with their own clock constraints rather than as SM8550
fallbacks: the RX macro uses the 'lpr' clock instead of the 'macro'
clock, the TX macro is based on Bolero v4.0, and the VA macro takes an
additional "heartbeatpulse" clock sourced from the LPASS VA CSR rate
generator.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml           | 19 +++++++++++++++++++
 .../bindings/sound/qcom,lpass-tx-macro.yaml           | 19 +++++++++++++++++++
 .../bindings/sound/qcom,lpass-va-macro.yaml           | 19 +++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index db63a75f1..142955b85 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-lpass-rx-macro
           - qcom,sc7280-lpass-rx-macro
           - qcom,shikra-lpass-rx-macro
           - qcom,sm6115-lpass-rx-macro
@@ -139,6 +140,24 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: lpr
+            - const: dcodec
+            - const: fsgen
+
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index d8682ff2e..2df72450d 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-lpass-tx-macro
           - qcom,sc7280-lpass-tx-macro
           - qcom,sm6115-lpass-tx-macro
           - qcom,sm8250-lpass-tx-macro
@@ -142,6 +143,24 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-lpass-tx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: lpr
+            - const: dcodec
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 683ebf702..7d56f9c36 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-lpass-va-macro
           - qcom,sc7280-lpass-va-macro
           - qcom,shikra-lpass-va-macro
           - qcom,sm6115-lpass-va-macro
@@ -185,6 +186,24 @@ allOf:
             - const: mclk
             - const: npl
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: lpr
+            - const: dcodec
+            - const: heartbeatpulse
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

