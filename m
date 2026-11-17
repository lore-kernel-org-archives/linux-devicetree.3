Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794956451;
	b=UYxsSDyzC5a7bf2nK5MDEh7cZEgMHSjRPvZ09ruM59hcRTtq+SLcRRTYM2r8xQ8Bn6rg
	 PHMPH3rSIFtvC+r4Ex8K6m6O7DSJC7w1dm3ukEARi3ewHgkiekOzHSTtwQbHylWnJhJaE
	 gYjKsB8Dxy48QEmrXVN3yrBrR3ASsfiKhzbnoeDHQqK1CLa0n4tIekiYul49ZpeOebAqz
	 7o7bu0z4GXnv0HR9k/GnCxlUbvL0FmE+pTzQjIvwCAmeoBTK9sXtO7DDrgn0Sqiusx/bg
	 EeWp0Y77sa/ifluh1yiYcCRqBnOzqAFbBlRhQUrqi0kdJzXY98CbB0eFSI36lsnQqkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956451;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=L5Yn+CHje9hd+sqisEi7dp6zLpdXzwrI2oKNmqrlUIs=;
	b=bWtii4kLIlXnUJJgm54xoknabg6QwdpxxOi0X8Gbc8zb6CyFMa0B8MtQyM5aNxudEnzz
	 qlCtLGLVEb8WYRs2A+zh/6aEkiALCYNMB6ryidfZtlVvKVBV3YlFOex37/PV+6MPIJWoP
	 10khTMGp+J6zC3WFdQSElUkoVLSnCejxMDn8Pc7dbZg0IP1abVDjmeNpHfW3tNDt7ypVn
	 cvAiXMyR+nh00aNbDPToAaU1jLkPU0GDGSdGIZ6joz5l6Phd/fzwqiGH8JTGr5EjNNT3k
	 OWtbVfeZJbbjYMWdHJd3HShGT8vMX/g4UEMU3Sm4VjapXIH2p0/UKVxibCse9cHSddA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JC5gcMs3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XRvGUL1O;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6CC606A333
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F6CC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JC5gcMs3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XRvGUL1O
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMesH34172033
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L5Yn+CHje9hd+sqisEi7dp6zLpdXzwrI2oKNmqrlUIs=; b=JC5gcMs35H4A6M9X
	vPNREHXaNcRfAhv/ZpXm8SX8n+IrA/GeDhVuVAsYfTf+cezWboQrBXlojB8JevNX
	L7EFIuqArBAo39W2zYnpD4ZaXw5v2naGfXd/rj3aw4pymw8SqdivAXgF85NRhpfz
	qGd1Lm2yqkcjQbNUJvCYsc4ioLINvvkv4SC/aZ6NBtC29qN26F9yncXPOfZLtTyT
	m15RGf9WPCR8yIz8jOdz8da12+0WbkXPWDbyU5e+r0nWAJ7CT/+xwC5t99bpEShI
	7gs+sFuV96XIks9kgXT6jDwgwNwH8S7GpkSid5Kk8vHrJT0M3Y2baiiefx98rNbm
	TFoP2A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv882r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:00:49 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso393455c88.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 15:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794956448; x=1795561248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5Yn+CHje9hd+sqisEi7dp6zLpdXzwrI2oKNmqrlUIs=;
        b=XRvGUL1OQDeHhmRGj0odEaItjVyp8AkEcumOGCZxntV0PEFZTP9e/tFKAmCd6U9Caa
         47oqNsqsz+pWZl5I2qbSQkcb9VekGC/mCJ3LapDo1Nl6ThYEldJ72chV6Jm6O0bZ/cy2
         u279ftaGgm+gjbDrWY7sT3wnoX7ap37d9/nIBPBH+ydhN/KaXukenLisWu96V8Jm8rey
         0sYosjeEh/+4Bk40/QO5fcvdH5e64czKcRNiwL9TFpxe4KhkIhqgwYRFLLBOBp+1DL+P
         TGPfrNx2piI3wa8DXmMyRRn+d5+wWA4/OzJHT7Bcwx36z4L4oUYuceUeMbhVei2rNUBo
         aZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956448; x=1795561248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5Yn+CHje9hd+sqisEi7dp6zLpdXzwrI2oKNmqrlUIs=;
        b=y9tZFQvzfIuwMGvqkJnp/YIH5Gyyh1xSqVLAUEcJ8bizL9lM91WZcJjXLqjfdO12CY
         fM7oxX7v+tYgv9lCeOnQEmJoqcdQJAggVxyk8d6zpow3qwJyzSS0wSkLChMOFkeV6Jhm
         iLTsamVd+bD97Jel9Ym1rExUiQUr5D11EraHGC/Fuw8kcQ2cYBBheG+53gsj2iAL8Yhb
         ykMe29X0XaWQmpzdRwsR88dtd6t5dZpheG5Dy9i58hygubHpiYm+0GfArb7b8TgRHnk6
         W4WW82zWaz7kP8RriqgdEg7/fQ7VFMduV5r5sdz84xXI3A30j2HgVX/hlVAb0L8ldj5O
         8iXA==
X-Forwarded-Encrypted: i=1; AL+hErGBbE3Djzd0mKVk8Uv/42sTWsWV7BnYqSrRb/4xheEaVvGwsGSajKEgmZKmYNE50FGF4z/9rzPZTJXw@vger.kernel.org
X-Gm-Message-State: APuU4Z/Hnu5/gZIiSvNLymDqZOzG9F/Cy093flfioiSGqRZtC96wnGJq
	Pink6qRMJkigg2rYnkYxq53PMyxuoXhhj/gdgo4zOE6srLOkKZFeDirERb+AHhhAV/go9ibFJEr
	jkjTn2CtPQs3houyKk6FOKg4DsAJ0kf0YwayKJorHl0zWsfNtvoc9GbUYtDh3a9jG
X-Gm-Gg: AYBFou3IW77Tq2a6XjalKhOKletpFnWcT+X+6KTd09cqwOPEMlhFoAwgKnYDT3cC2hP
	uLy1m5ZhWv5h/Ocg6aq2k3vAtEMYDxctCttIuDF7DHTaOvUCMus4ssoyYQKlcJF4P0/UZsro/jN
	kxnnGSfhHX7Ip0JFoGden0LIEigLqrGG5TESVDjJ/9XODT7iCYRZC7XrWxV/mMk1B04rOxHeOEh
	qsSPW4QiA/kGh9N6RW9DcQAPvIYc2cPPCHstofrOJCMEpyo0w63aSX+Yd1aPdCxT0sWHp389j5X
	6VPYC4clmMlFdSGjUQrgsXGEt5RN9cbBLx3QjKLwLCs9Xpca8HYj7bXfB2hypuw6iJuCyzWQrZD
	gFPvaWjEsQVh2/xJU3eMP5nyiQpfTexZT8kovCpWLNaZoPxQHt2B1VKozxbBLxx64hFhoYv7guA
	==
X-Received: by 2002:a05:701b:2202:b0:188:e51:e86a with SMTP id a92af1059eb24-1b543c14aaamr706522c88.2.1794956448012;
        Tue, 17 Nov 2026 15:00:48 -0800 (PST)
X-Received: by 2002:a05:701b:2202:b0:188:e51:e86a with SMTP id a92af1059eb24-1b543c14aaamr706458c88.2.1794956445963;
        Tue, 17 Nov 2026 15:00:45 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5445eb29esm1380839c88.0.2026.11.17.15.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:00:45 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 04:30:05 +0530
Subject: [PATCH v2 2/5] dt-bindings: display/msm: Document Adreno 753
 GPU/GMU
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-nord-gpu1-v2-2-8d6d9908b7c5@oss.qualcomm.com>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
In-Reply-To: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794956423; l=2675;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=McFLm0aMyTcV9N1kaYPA3PSC/gCV7LbW48SyQaf8meQ=;
 b=mrAHKWNH7J+q5CRxiq8eKAVDmZjI1fHu/90H1/VVy8UsyW/VM9VHzqWcWFwRPTSp3hv9SkAGA
 CnvdoZiKeeoCy9DHZ6FhciBRU61FloMlBPZfX9ZqnAuR+4QIz7qrMei
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: v2wspqFPjNGJRmFUTzUvcOkDDH9GFflG
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afcdca1 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tfb5_1Jyd-QlxhXfLoAA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX5O2Mn0FnBffK
 gN+aT71DugT/iW5zVlkfIunIK6VWB2gJc+2nyjU/a7DdWDuvoG9IPCJ+KnwyFg8AfFL43wZrvsY
 vKuql9N9XmbIG1Cuz+teClh4EhvSDiRUxgAVKt1KaLsMhB5jNrHLI8bYzU/2ja94VSVAg4/0cLE
 fCEnGu8bAuVEJmA7lRfc7tJQSVq0LwTalXj+iIc+GMipxOraoV73s4FPwn/cdX+DMvqsads1OsW
 x3T9ElOu0TxMIZepCAlAi06heL0G9XVETOUKXBTg6FaOOtnN/aB6na7tUjTsk7j9PiV3qAsQQ1b
 iL1LkaIbHE4PGBMA//n0SVU7iBWVZV+Pe1O4a3paZh3eaZpFAJPB8aodOR76IIVTUevITa9gypf
 /eBEU/SJYK/VrxQjjwL8qi7nQEcMuB0DS+SIgO2Lrijxh3zoMan6WJlhRUq6SGCedeMGre00fk9
 4LT9z9ylHB1mi7H5dbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX43uO21/nRwri
 21jaRg4tP9W/5DzyiUQ+M27Vc1UKcR7PzZRpxoea2pt5s024vlLbQGZtU/6XSInXtcdrJocOADo
 YVjTqBEoRmGU0oqnE6nKC3uXOXzyl3E=
X-Proofpoint-GUID: v2wspqFPjNGJRmFUTzUvcOkDDH9GFflG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170091

From: Shivam Rawat <shivrawa@qti.qualcomm.com>

Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to the
A7xx Gen3 family. It is very similar to A750 and has the same register
layout.

Document the qcom,adreno-43051701 GPU compatible and add a separate
constraint block for the qcom,adreno-gmu-753.1 GMU describing its
registers and clocks.

Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 33 ++++++++++++++++++++++
 .../devicetree/bindings/display/msm/gpu.yaml       |  1 +
 2 files changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 07f0e547b43c..6b28694624cf 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -301,6 +301,39 @@ allOf:
       required:
         - qcom,qmp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-gmu-753.1
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+            - description: Resource controller registers
+            - description: GMU PDC registers
+        reg-names:
+          items:
+            - const: gmu
+            - const: rscc
+            - const: gmu_pdc
+        clocks:
+          items:
+            - description: GPU AHB clock
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU AXI clock
+            - description: GPU MEMNOC clock
+            - description: GMU HUB clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: axi
+            - const: memnoc
+            - const: hub
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index c30de7feb447..3c90a09febe7 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -451,6 +451,7 @@ allOf:
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
+              - qcom,adreno-43051701
               - qcom,adreno-44010000
               - qcom,adreno-44050001
               - qcom,adreno-44050a01

-- 
2.55.0

