Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474837;
	b=JQdXkioNyeeT+d9Aso1C2qcmCn965PdhG303bonZTjkKBsJMbtyNeGODITV1jGebbdi4
	 x7SDLsz9y9qaWNg1+IMfpyMxKvP5a8uB39XnY5r/S2eclI4cGhdws581dWJlyPfFPOU0B
	 XB5KEZe392elSAZroZc+orK0dD434umdKyyMa52JuKkVsWqACOTh5pP1zfLJBmwdn2R0M
	 8UlrG+mgsnaqudWgvZrOkc93Cl59noY8Ko6HDwqhS+8zWreCxzXseDNVL6/dmi0Ir5+Sj
	 hM9WHhIcTLY+NEQ1pIqzfHqQve95sWvvOyT0qcJprswuKEyh6w/9cMTTTp8oKrH7MGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=;
	b=1HkvfudRxp8yYvSfJkdfZ10Wyp7Z8MfWwf+NsDwdxz1gdUpTItrf/Z3oTKczl5n5Jqdd
	 FTLT2TrYEmNMYEIinMjxQsVEzKEV+oINIELaXRhvApzbEUEU5gfDZEZhIC0rbIRBg+1k8
	 OjFwR4EpjMZx92UhXDFJYMZ7R4u34PxGSV3Q8FupJt8vTlwjve8OD/8FOeoSf3ZM0UtTt
	 HD0XCRVT2pC2bq2rFH4Yup57SFy+QgnyBOkygpTmCTk9bNJAIbXhOM9hwaaGIE6zoWxY9
	 olL7TVyESCM4AC5p2q4TQLiXqE9LDyUV8NI704NujAb+I6Tsz960LVM7d6o9u9rgL0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5yHE4Mo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dnw1Ajtm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEF2606A336
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:13:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AEF2606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5yHE4Mo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dnw1Ajtm
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC5ndrR441529
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=; b=U5yHE4MoSrOFQ8dG
	+RXiacuPCJDYVz2lOhHXDsZOSK8Yyqp0SfKoTibM4PUZiyLaMnwW1Ulx85p2U63p
	kBTkcpzDAdP8dBt+B2Zy8mhdCPS8ogTwIdD7izHeYHlkQOjePeRVfUozxzvKARbs
	U1AsGtnrNlj6wTcrxVhNcajS7P6KSOH4O5j50mlarv0odsJyTr6GMgYhQzSBcnp+
	gUyuGYgisBub2hEfvVqMxN3x/5sE9R+ntr7RHvQy2d+BJZxi2sK4lyo8zKrMlfTF
	KOpHPtx3zpgYxYDdL+dTakjHBsCCWzsYiVFKJHIh68vrlzWf+mmno80hzOtQDcFm
	inZdYg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc0rb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:13:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso3680464a91.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 01:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794474836; x=1795079636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=;
        b=dnw1AjtmU6oWyQrLag7p/C8RuZR24ZbhLPbyGpJCLMD9+/0hWmj8kbp4lMi7YzRYro
         dZiLUDHxF+Ji0JzncfIvSN3s7P7UaalxS+KUG0q4t11OYDLNQnfq9Y82a6onsYrCsR2+
         ZKreWcPdIClhSS/KnB8nCu79Vq0FFCuBupf8Ze4Fq23mlffOKQUz6XCKquG+K9Zo1WUR
         FCSLrVl3B7jd7oZ26d06W55vms3k72/FCUuoArOab7/WkyPQ5tSq+fmqSxiZ/MBmqbRr
         BJGw2T//yh2fCWcsfOD13r1wWiulb0Ri5Sup5ZKbUB8Cc2gOv1NoZDaSW26l9GOQ/rDF
         TNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474836; x=1795079636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=;
        b=CtsPaXrFW/N/CzF/sH9KkDt3AI8B8K2qQr2cpHzwezhPaJKzzV52BGeo/QIEZY++Wr
         RMIDEf0apCP7avMhMdo1qTDSyEEMd/h2PV96kj/ZQombEcuXA/MTYprhr6SB15jxpqog
         awrB/HotyRnrEEJm111N+ZdqbmHGOolF0jozscuSb2Wg2aYjihhW7gicAKmSwsWpUaKp
         mNNDjyWpvp1XZgm0uL2g+v7WTCR4bKlvxzRnXoh03un2ga3d6cwh/yuzJIA8a8WGhIjt
         Oq+CCpY6qTAeCyvjPUYej5HKB4sebEmG7CeonUkQySGY5uHLRUuKb86MZteQRJulLm/H
         SHpQ==
X-Forwarded-Encrypted: i=1; AL+hErHrYGbzA7BOPq7j9ONAZ2/Nu9GaaNUccAyidwefd3AFzNESxH4VxbYsHVSOSQnXn2jOA6ImQ0+gJD56@vger.kernel.org
X-Gm-Message-State: APuU4Z8DN+M2u/YPf7RyVsZfGJE+nrxrU4s8ICkoOcWG5trmwk+8FM4Y
	aP/mn25dRRWhxa+NECZ+f9BA0t9DMpC/UZ7Nt6nawpelwnNwz/qoAxle1OdmJ1J9jF4Ja2pYSAG
	VHXCMQCuJeJNfnH3p8vZOoor6XpvDPeD3+AdoLqY3suaCJM41cjk6oDoj1tVFa9yG
X-Gm-Gg: AYBFou2QylrSLW6G4kCeR+I1GfuZXK/cts7enoaZ1wOo6tAloen26IbcRLVNB0sDjze
	S1bK+bU6WcLPPKPkik4SD3LfF/plOcF7Ogi/6FhX56JGdvIR1sDpFm3rp/l9oCBXZscziwW39PO
	vLO7lQkSDj4dra8yt38GvOQsv2a+08HIqP1QQ5IbW6C84LaOapCvCv5use1JlSzvlCUhKpaLaBj
	ofaD/em+C89saSvrhJkKncnK0nqliWTKlKeOkXJhVLcXqWW5uj8tkY9pHqPpPlInLR0qzOOg5xz
	W95UVF0TaXlrJ3A6Dh+o4G/j0ijgA5ccT2b9DSu7pJzoXW2ArMPIszaqW4tNm6q6IDifLrwJjoY
	led5UhRkGdgcm7n/lwLkaxwp/7TfrryTQptqqXc5mb3/S1GZkDVhfnXhsGyC+Wl+RU6ua4w78nc
	FSMQCjfMEB
X-Received: by 2002:a17:90b:2688:b0:3a7:9adb:2a0d with SMTP id 98e67ed59e1d1-3b182d4462bmr4668305a91.0.1794474835849;
        Thu, 12 Nov 2026 01:13:55 -0800 (PST)
X-Received: by 2002:a17:90b:2688:b0:3a7:9adb:2a0d with SMTP id 98e67ed59e1d1-3b182d4462bmr4668271a91.0.1794474835323;
        Thu, 12 Nov 2026 01:13:55 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b19b533540sm3019826a91.8.2026.11.12.01.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:13:53 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:43:31 +0530
Subject: [PATCH net-next v6 1/2] dt-bindings: net: qcom,bam-dmux: Add
 memory-region and qcom,vmid properties
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
Message-Id: <20261112-qcom-bam-dmux-vmid-ext-v6-1-7a16bd3dff18@oss.qualcomm.com>
References: <20261112-qcom-bam-dmux-vmid-ext-v6-0-7a16bd3dff18@oss.qualcomm.com>
In-Reply-To: <20261112-qcom-bam-dmux-vmid-ext-v6-0-7a16bd3dff18@oss.qualcomm.com>
To: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Dumazet <edumazet@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794474821; l=2657;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=wycrMmj1886KQq8u+EMdY4E91b1IT2gBezsXLoyMxGA=;
 b=B6KFCbpONrzKHQyrEE5pvoEsRxyBgXHPOeZ/QAFWpNbEkxjGPsOfehvl2JQ8MJmARH1yJvFB2
 Zr4yhqBM7t9Acpk35wRgv/AnRqZtrIc9hAxHdmg1ejmssFHMZnk3hj7
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-ORIG-GUID: oGpL-f39S1CjKy6WEFy1FZ-FoI5_3Bar
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX1uuBwGS+W5XL
 qB/rYQd2JTfe0f2aw3TuZ6YMrHFTDI8mtBPgkfPRQXhqYR6cXXYV68ZrULVLx/9yzAl6+8K127x
 sGzua0bhSuARMXWazyPIaVMH4+ruCf8=
X-Proofpoint-GUID: oGpL-f39S1CjKy6WEFy1FZ-FoI5_3Bar
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX32PKthtiKYPg
 4HH+AzJCtt+hkLXz3jfE4HNRRlxcBX6vWDBVFVj8dBl6UYnGVt8O5V1RexElrphkPzrzO2aN4Io
 I4b0B2Zp9DG5HyEh3TTk6H8TM58fPzwyzxLXRhuE1Z/YgvOfhZfZG+qL5giSh0sjWXHmD1hfhRX
 jm7YmTMOycMopgBxI5/zVhuy01VhYY001yWpb/DLIkiS/72RPSEpwBV8zSliVybuPLQ0I+78ES/
 oHBFGTsGnMOy0f1K6ejh+nei1LlR8vSHNjWtYQI7JZo31d9M8fLjYm+U3plJ2SJzhnrqKyynUIc
 Hv92GJMSrjm0WmEjySmaS+P0dr18FXXJ1X8zi2FjPTkGvYs+P5RmrlHCtUGWoH+wjdLqgaK2qfw
 L/FoCCirS+B0w27aNpFoshI6BKrL7g8TB0WgfEes5mxj4knHYztp6yk8S8Te5inBCtcunANpfMD
 GA4UFG7fuMFa75LntCA==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af58354 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=t_mNxi-BVxZHgpyDufwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120036

Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
domain with restricted access to system memory. BAM-DMUX DMA mappings
must therefore be constrained to a designated region that can be shared
with the modem.

Add an optional memory-region property to reference a restricted DMA
pool used for BAM-DMUX mappings, and a qcom,vmid property to identify the
remote execution environment that is granted access to the pool through
SCM.

Require memory-region whenever qcom,vmid is specified.

Add the qcom,shikra-bam-dmux compatible, with qcom,bam-dmux as fallback,
and require both properties for it.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/net/qcom,bam-dmux.yaml     | 36 +++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
index 33746c238513d72366bc52359fb10f275475b331..f7388d24c8612b5a99d5d0e66cfbe2de3b1c9e0d 100644
--- a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
@@ -22,7 +22,11 @@ description: |
 
 properties:
   compatible:
-    const: qcom,bam-dmux
+    oneOf:
+      - const: qcom,bam-dmux
+      - items:
+          - const: qcom,shikra-bam-dmux
+          - const: qcom,bam-dmux
 
   interrupts:
     description:
@@ -72,6 +76,22 @@ properties:
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
+    maxItems: 1
+    items:
+      minimum: 1
+      maximum: 63
+    description:
+      VMID of the remote execution environment that is granted access to the
+      restricted DMA pool through SCM.
+
 required:
   - compatible
   - interrupts
@@ -81,6 +101,20 @@ required:
   - dmas
   - dma-names
 
+dependencies:
+  qcom,vmid: [ memory-region ]
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-bam-dmux
+    then:
+      required:
+        - memory-region
+        - qcom,vmid
+
 additionalProperties: false
 
 examples:

-- 
2.34.1

