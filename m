Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989004;
	b=xoK0954vU4sdgupf0LQKqEaJjGPW3NVPvnmy/Twovwu2AnazzYz5BPDw8CMFyWAGOGqs
	 pDYQ4hj2/MbkV7rbwg8RVJdVulCoqbPbK9REhny3rQmMfEMlwLzGYcz0KNJAzXaJOOxRB
	 9olG3BZOlaUEXoBdJgepCibfvyXobcVoZORcTHn7VajvCOJ28N1Rqxh03sJFNpXOEaM+Z
	 x2RpOxJefzdGCHqtkj8LRmUCVpMZXEnI2SasyHfKqPa6Y6NChOi51cMbkRuK/VPp4Obj5
	 FsnqPQEW6Fp301ln3TzDyyJ7rkKaEiMVIjP7ovCEiv+hs9Pgb3q4ROB70dUYcT900LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989004;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
	b=GiomZ+JC7HVSWnW+RJopSJagCGAE9JuHMseZeVBKj5jl0EY/kvZd7/6rTjd+3M5rXq3H
	 eLjba5NU0ncYdzuoEzXqa427tQKsdOmbezPS1Lpg1e5HLI1r8Jgm/9LPb+6g+rGkyoaff
	 3FFnYlFvmM2DKP+fazexXnDdxIlNKsttctjJ14p3telGbPQflL+NENpTsV5+qzurSecOP
	 ePHjOUE6lfdLtarEpVVTor1wNlDyCuStmoPLlOg3gmpu2/QBZnAqbdSpkcsGz+Y/2Oz8f
	 qkSmS7lKa8zKlpO7naxn5woR7M6GbLNNOt7FzCGvi9UCYiR09eeqwyVcZSS3r1wIflw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SsEmTXv0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jALUJvUC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285AF606A333
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 285AF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SsEmTXv0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jALUJvUC
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V1VJ2106293
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=; b=SsEmTXv0vWkA11/A
	YWCmipZNB9/Xrnmzmq9H2O04cHvPsf3E+vQGdiWJEhEHsYBBs2phR2eT6DjA65d0
	8C8sO3ogZMwKiXUTuom0WdOdekB+VMxjIULmJz0FeaPU1UYjcsddvN08GRYlqnsc
	XV43Mpl1ED65oEndYU4JAvdYILLbpzNV/d0WWIqxnNaWTjdWZ5sbzV/pXYPbQAnO
	TxQKqZxun0kQRD9SpYIg3bHqwl5RdxRdebG4RxFveHjPpnvQv4CFuqCESimB/p3U
	xaguq6ls0bfydoJ1UejatBWAuNbLWgTbNo8P/65EatZsZHJRZMcfdNl9ISt/NfvR
	ftljAA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8svrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:03:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b1755b2f26so690756a91.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989002; x=1795593802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=jALUJvUCGK3jCi1Y7GKyWzxM81TVDDGs3rjJiw6kVBvSiHWU/1TsAVz8TW1EvQMfoc
         Ugn88rNxRnoKdttHQoTRb563GNNg5feqgVf2v/CT9HF4z6tS1xzeA9bJ0BSBVtlDblOe
         ExZdrEGSH5UB3rhRQtcy4W89qVd1SnK9FzYEqd+4fkUyFrJNWQFeTicAftP4G1lVH9PG
         gh+zQFf85x5tboOzSFDd8ZrW8W5v12Z2j7U2rUg2JDDmhMLdvb3wwOE60TaukJ/dmVU0
         Md/b2VrE/f5p9atiwsBsa9oDU2TNk0z301HMSY6xmw+Vr7dfi6e+gCuq07jY4bSfANmh
         DrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989002; x=1795593802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=HuSNLfZ8Us6IvPdBpY063ouEE4xX/TeTVbf/21yS/iXMUYGddwnBarsenHXU5beQeF
         ZXcLxRVzg7VYfAaJBA8LoatVE54uqxJTW/rrJdb2hvhFZlZYvK8lFrLuBAtPE4ONcOec
         jPn65/eSMQF8mu9SAEaBhPeQ/o39Fqk279+Vztbq/HblWfLdVl2WtsWawVx2tEtKSoRe
         PxZX5uyh5io4j4Rrm6SXX/7Di11M+MSfmhRdRR/iTNDF3qYoIGXKMkGNok1Jvo7R9aEz
         Mp4nnQdn7cNLOu7PpE6B1J8I+pmAwMc18mL3a90gNJeicBpR50SvQ7Zshuv/cDHtjWIU
         JLFA==
X-Forwarded-Encrypted: i=1; AL+hErHRXwb7aGXuoetu5+922LqIRJSzO6BUmnDPPsB/zqSTjXcNSdHxD06LrOUcOMcdk7zNWNoAIw2zXh/t@vger.kernel.org
X-Gm-Message-State: APuU4Z8pUZRtLJxHaOy5WJgp8Y1Cz3dVif3/Y8PBlr2aKzrAmhK1vq4J
	PSq6aBR+5TXhrCbnLaIHvRRV8sbe7xr/vzxYDWovJVdkaelg85E+ZaquOZp187SfeN7mI8/jvYj
	r9Rgz1/zpN8S7KMYwsAbWxxdgdRd6RCmEPyndDrxSTFp0qWYDFXWMSw7xiVDENZIa
X-Gm-Gg: AZFdTZef3jy7TIE19F65CP+bV/iihdOX9ij+lr2g0Y7jA4cvm1VgYFq+v7qKL4EnLIV
	S0fte0CJ8oJMzqYjvtswetp7Be1Bzacp4JGPQ74I7UsGUM94MGMGKM7qDjJbN39EUA+BUUOyAat
	BgDm+cOhFFnFYEZg/MHiyV5A0i1E+DCfjPCM8C3kOtlvogj9k7X0BA2EVPIECfxsETzL1pbUmzu
	mqGTlIUDN4y8r6F4wcOxIRr6e3ewtPXJ8Btk+KVf8cjuOQS2ZEqhQrt2u5n04q+o91S6/k3inu0
	WDgf3TEPB0jh8hm1Mzrf04zPt5WEyENjNyvbRKstyhqTLr2e0wvf3zBtkkB/k9B5GfXFg6MtEII
	FCkBt7igivrMCzJ8I20fXwbh5lH7MNpUuoU01soPwOo6dWQhSvEc2oMwO0ocExuAGem1Jgv+6+g
	HUWuzgd0r3dsyhW55OQeq18MB5Z/uPkTEoJKcy
X-Received: by 2002:a17:90b:4a04:b0:3ab:e588:c275 with SMTP id 98e67ed59e1d1-3b3d07598damr1763258a91.20.1794989001709;
        Wed, 18 Nov 2026 00:03:21 -0800 (PST)
X-Received: by 2002:a17:90b:4a04:b0:3ab:e588:c275 with SMTP id 98e67ed59e1d1-3b3d07598damr1763208a91.20.1794989001103;
        Wed, 18 Nov 2026 00:03:21 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6adasm3004072a91.9.2026.11.18.00.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:03:20 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:02:27 +0800
Subject: [PATCH v23 6/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
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
Message-Id: <20261118-enable-byte-cntr-for-ctcu-v23-6-67fd9db6bc0e@oss.qualcomm.com>
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
In-Reply-To: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794988961; l=1754;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=icbknvjFK2vf4oKtSEHbsU4cH2Y3pwIOC3H2EHr7Svw=;
 b=0uAuvsb5ehgZ9RURv9BLhMCPJgyhvvKonYmDULG7SkPd4DrZLgbXUrsbMqHtUbbHfKuhil9kp
 819ZRtxxx5ODCvOgG+GvhrxxzOjsPYA3wxE5vyI2KaDMvD3lM4Bx3x8
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: x307p47WZ94351NDdbb6gh4MlDlpJK_0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX44/bFmRE4pke
 o8mUC9rlJjy7JCLVdY1k4B7Az8aL6Fq4UT1lZzDfCx9mHlpbsbp8BLY4sIp87USvtV0XMzwkTY0
 Mi2wOH6OCxzv3htzdR9k2Fttmf+BEso=
X-Proofpoint-GUID: x307p47WZ94351NDdbb6gh4MlDlpJK_0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX+HKvGeFH7u7v
 /pREceeZkdUgxVBizQqZwILcfu7Zku+n++2MYQQy40kMwKtTqYWXvQOYJHfF/6FC7iZ0UmwnQKE
 YVTDtj5VmQwqempfYaPBXLA/UBE7g9DDl+B/+KZbQArx8ntKB0e2rP+GL+ATMrp1eni76t6YsiD
 1XGMuWBEC6RQTaZYz9DJ/rUGeuMdTPehta4MEeszXbfTkGd5gFXq2NjyaRFXhcQ8bQ9TZfQlJNm
 MmXqODLhV98xes2zGRunrSvzYT5PD/qHQDCEOaMD4a8EAfjd0vvuIguYji9Cin9o9Pih6MPbX3e
 5TGMjlP7Hgf7BV8scLm6Y8GVBLhoGjf/Tbpe6YwtvYXmDPsQKlqFax8BqIgCIarECerPbzHiTZK
 Upqxx0ImyTKvj1cME2asepMsD+IIOmvo/eoUatFCgYzHmvMfQRkOyRuXaDB4bbMQU5p2AEfZwiw
 rXyqawhn98KZFpdZegA==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd5bca cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..decb404e2ab1 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -49,6 +49,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -70,6 +75,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -77,6 +84,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1

