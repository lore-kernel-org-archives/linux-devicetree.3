Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715552;
	b=fXmnSG3JNBIR2c88sWzqE2NrCgq540C/yWPrtFpQc5rN6XWDXkC75VoX1HnBGdVj2/is
	 r9dhFn1K4IHvKuYgzjJ5fvFtlIIA1OvJdbZ9guiX2rG7CMIQD7yonmjnkxvQqDIAKXz2/
	 3YXwoIGnD3zl1PVvWQxcx/QkFeHrwVisOxthFkxJGBWXnlla5Bk8bohwMTgpqWmibh3QC
	 Vm3qsnYhPuwUIoNEj2a7CkyRmkdpyAyjwHlXN1WraIKpnk+pQRtBk5hJ2cMQ4ufOgvCQr
	 dh0U/PH4D2WFKP0DLR35sPd9WsYH5d1Z79VkBn2a6krWKq4XuWMVCcArttqKc/66K6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715552;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=;
	b=V6Fph9LJHwyX9BnXUa40y7SxjoL46LoovN/SnJAtdWhNMvmToXvts0p4pbstGfzDhhcZ
	 uy5izVwR6roQQCBorVjRsR6BImQ9y2wsSFEghzxb4CJcs4pJsaoTdWfKtNE+Q8p/wYM+t
	 toAKcO7ha7gIfk8/9/kM4PzaMIm9uhVKIffymKCCJsgAM0+UHFM56fOnePSFCcNtIMvnI
	 8kQBHIdV7sgtv5SbYwQugPa7GKqR8tKUJLF+/r4MpdNnvzfzPxwfvKwddkSnkslFS5su9
	 CFZOJWDWM9SjST2UxAXeaJwV+K0HTZT7O1yjY3iq2q+OVscAEIFt3Ii5vzydlpFLFoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Brrp6+A8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QywyPK8e;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A02C606A32F
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 14:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A02C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Brrp6+A8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QywyPK8e
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EA07A2727756
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 14:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=; b=Brrp6+A8H+6CMoCP
	eHdD3BxF2jybKqgoZG2kv+4hitRr+IDBgkq4lr4oe3iTF9AcMGXb+0mbaoG4C7nl
	z/xcLyrrJEcVgXsx8RXrie/W5/lmGGDzTOuRmoA9tWHDLKdTbR0eiZ7meCM4bIxs
	EkhoPadVyHLm2Mz+/LgPRY71LaLcdne61Ey2bUFqJ3kaku2RnCiI/ZIu9d3YCoWD
	uRxB0fYdjS5+DSmnuVfE/9SOeMRUT54Me1VKLJ5kbDkzz27RzbsimCCApWoiKe/v
	kfskcF2Mk8xqkHHwYDPABLzPgmRWDIkenp7247C4CCG5g6q60jYmpoFpZ5ryqr4V
	vL8/Bg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bg26b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 14:19:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so3357365b3a.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 06:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793715550; x=1794320350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=;
        b=QywyPK8epgqlb2xJsdwfGcifqzllIX0wp7YYus0IXswuk81TVSGIUmfbD9TepwSZQe
         HcDHbfXWeg5Z4ucG3vTGQrTOrCbf0IFL5asj5qZ1Dmz0wKcACPU7opiq2bo9OWYr+mrs
         T4t9xCchJct0zvg2kzPTzVlNpGVA7/ahBfdn2+3aqiU6FIhNbE9VWxfO48HfDaClkudI
         tNCS3a9LTxGPuZCa1/YUqBDirYe6+nSjY/mSM7mZt/AoyTSq+k2snj5vpH2goWn3pEfL
         iOZhEKAtVS9/1EtCMliCQTSsgOZV3S/6wudlwIelxULYgAYDWSaO4gdm8Z9aJk6JAint
         ccGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715550; x=1794320350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=;
        b=Q23ZeHiCE9nRmiXhG5sPxZ+Fuz3/GvhxwU0Q/9US/QAAhVS9CHSP4kApcySY2JqeKC
         7VROFvyDJLd1rrFm6PPWkr5HCrN55UVjmNqkXgHeLIaynvL8bTS9/KfCccD9QHH/GOAo
         +udMGDNpbrc2Xy0R+2FyLQkr7+GudLIAmrdWZMjsDA3cdwonRzrPaOmr+5bTFSyfV4OS
         0xdgeqU5vlAhF33FYD9o/OqM/1rYNVQ+Ya1h9DUfBm9CXefhEp9VXME1Q6ovskQrQ3BO
         YPMaynon+piOlFToXM1Ujo6omTGy7fg8dJ5K7BDQWNyoqRlUI5pNkU85WYCvmb3xlZau
         N6gw==
X-Forwarded-Encrypted: i=1; AKwUvBy85kNV7yaB9eAiuUq2yr8SCfPwX2Y7X0ykDGe2D8ega84eBKHVXB1RvLNrLbkAVW+E9urJFmM6ZKhQ@vger.kernel.org
X-Gm-Message-State: APuU4Z/4oDF7xVneyW4sZ85kxFjEvlagzOKsXYDsjelxEHOuYjK8a7zg
	9017b+q3QenayD+tviQ8p/iqwpwH8fjSqUwzAz300SXXqxFrw0v9nxFgh6x8oiMMr3eiHW7Qpl2
	Oz7/WeFUQkp/IMuQwih+EAGXX5TnKqcN4JzvaXN5Wk7K/wUopB0v27mr/DeWlftfK
X-Gm-Gg: AYBFou1nMsAZ+nfQ0CM6zQyMGg7XrHMov0gAOeKGIAHomLodcwR0DUus7Z06SwdvdBg
	zPGspBufr75wEakx7flwWoaxB+tmolBkHjLVHYwIKJdaeN7nBNjcLWAZs8MwEo5VwD+tTGuqZCy
	5RWLVMobO5dm7gizZvMBpAceMlhT4IV7F3UWEC+B99RDg4K+9Ta416ZKASSOSO+BJBEMLW9n/gw
	nTxpCOOSW03CVl8IUhrNk7kIlDl6ihHo010M0pHkS5x6husxJnAnw/7m+2wrpXF+hhH+EpdouTg
	DSHTMPmntWXfgv0D6XoDWlirVY8giJ0NZEzUto/eet06KL7cplcZUEBKLNQWB7iskQgW+CeH473
	IsT3/qDOaPUFBONaX9ymr6ijLZUNrvCk21kkYxlENJRPDmCLhQ6NGZeITyiMICyfH6dCrdJdYP3
	2NFuILDtFM
X-Received: by 2002:a05:6a21:a94:b0:3dd:85a9:55a3 with SMTP id adf61e73a8af0-3e928d40f81mr10710244637.37.1793715550186;
        Tue, 03 Nov 2026 06:19:10 -0800 (PST)
X-Received: by 2002:a05:6a21:a94:b0:3dd:85a9:55a3 with SMTP id adf61e73a8af0-3e928d40f81mr10710224637.37.1793715549697;
        Tue, 03 Nov 2026 06:19:09 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb36468be4sm1442126a12.12.2026.11.03.06.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:19:09 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 19:48:41 +0530
Subject: [PATCH net-next v4 1/2] dt-bindings: net: qcom,bam-dmux: Add
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
Message-Id: <20261103-qcom-bam-dmux-vmid-ext-v4-1-3690cc5ca0fd@oss.qualcomm.com>
References: <20261103-qcom-bam-dmux-vmid-ext-v4-0-3690cc5ca0fd@oss.qualcomm.com>
In-Reply-To: <20261103-qcom-bam-dmux-vmid-ext-v4-0-3690cc5ca0fd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793715537; l=2657;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=wycrMmj1886KQq8u+EMdY4E91b1IT2gBezsXLoyMxGA=;
 b=4i8kfHwG77skvWIuzZ94uNVY0TqxEDO10gVtsBd/DjUH1uid7Ce4wpe8wQUTWyCJBW80Ibbl0
 AVcOPRXn5PrCFq4ooInnK0vqBPnomE3i5UvnIDa3Jzy9S4VEuLbZkYx
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NiBTYWx0ZWRfX2LvAjyYfsRqT
 3DIAek0z/y/sTZCD8UT0GaMI8+FZgy4fMUev9KOun5B9yVebgb9W3Zc2Xs1RZILkJajulk3lSMU
 6BnybYDL95xprwMQiUSU7C3hHav4L8U=
X-Authority-Analysis: v=2.4 cv=Xs1vqlF9 c=1 sm=1 tr=0 ts=6ae9ed5f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=t_mNxi-BVxZHgpyDufwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: X7f9H-9Lkn2N3e14FweGPjsUCAOt2EfE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NiBTYWx0ZWRfX4ic6kL8Rd7Eg
 4bNUR6yMT++/Mo3b9X1IPW/ETXrRoFEOYps++Xt0bnKepMFKDxT7u3oq0FN+3QEPdMmSTjkPZjp
 NlRLRhqZMCQ7j6LTEeEnvTUp5++vJfNLISyYzSz+KVe1gq/exqnrALtWB01x8/VSfl74rMxFM5r
 DPheXm9aefjxqxIzqx1RUvMrd4lBLThSGsCo3UftVoqvN4Y62DQD6Lpme6Tj5UopsyKlKEAPRmD
 NqWyyhU8Aj1ScAnUQRGn3Y0lSDQufn7/ry6BlvFXt+bzlntogN8DW10FbZbaEHeFmg3OrNyCH7M
 c5KVSXHDz0FvkwwNl68KaKrNh820x4q5xz4hNaMkNHog/Unm8y0yUM3eKXsxEMEdorbRexBA22W
 1KM8pO+XXa9bDlsPWgrcPpqm8YdWBV7U2x8LRQns3NdwizTZAnUH9ER9qhYIXMQ5KUgiWTtUvQX
 PePLW0gPXuRiA+Lcl4A==
X-Proofpoint-GUID: X7f9H-9Lkn2N3e14FweGPjsUCAOt2EfE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030056

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

