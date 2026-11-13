Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572669;
	b=1fyIow2F3iCEylfi9/BV6FsAfKXszPGKJgzy+K1horA9ONOIfFnETPz2FIz6h6DPF8YO
	 BeIwiypyoFTnkmYW25/ZgNhp7huAZbt9ozcCI5FK2NRkTF7XMzDPclePBb22Tx54Ye5GQ
	 ugOi4jCVmhij8a0hZpk3PW+EUCWeUY+WH4ojc45Xl0TiPebtKs+90oOAmS0aB1roX6bc3
	 Phz62u61yAMGm0yW30n+R7pLFqOnX88Y1V7H0RBmUY6KLq71uTLJL9ZopKJtinImsQ9EJ
	 BZ/LvUsWInP1NCTA+paxFjZGdtTXQ/kipMazfFYN89QrjVAodTpLR+gJXzfXxVafG7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572669;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=F/scdRl794sOjK34mRJAzq/iqnQfL+PQ2xCrXzi/N0k=;
	b=FF+w4aU3O6Ic1fWiisdF9/tiFeK7Z3BOdP9CBumNY6ggMIX10ckROVM58KL9krDgogXf
	 sc5gLJoTIPWLf4K0QQwiIn1DPar8SbC8FVTaK9gvb/N3450TqLW4iq8QEUTcjOV0YNy1J
	 DR2yjohYXXvn70sxmIqzhQUtbTsygOhtUwsw6qm3nqrE5KhW9Mjr2UE5gQLm26G3TUuYw
	 jvYNoW6tdXP3V5HXcXYkb9haQreDegFZnERgyXt43Mak42pozEmPvBHvqs7Qe2s3Dvoww
	 Hc6d5ve/neJ6FLjT1Dj+KQWBWwEkaUOi5YMB63qeolqC+my8KjzFunCunLDorYLSmOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YyQkST7o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gzYttcDx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340A060A381B
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 340A060A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YyQkST7o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gzYttcDx
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJV5Z3771989
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F/scdRl794sOjK34mRJAzq/iqnQfL+PQ2xCrXzi/N0k=; b=YyQkST7oKc2WT7Pj
	TZoWHWDmlAPaolZcs8yXyqWEYxIkeQx9qbwqhrlAgc4qXogj28cEWjcUT6i8GqoD
	jcpzatO9oCm7ZO9DDVf+Ezti6kjvyHKKLVyUv8qo7KVbxy6Mp3OxGlAYyMSS7h1k
	qzdStdJkcbf1KGWhpPqgKON38xqaEpxzwuEt2EjBiScoNMuqebhjpiEbDVUTYIE5
	v2neLr64JhebMzs0wKepJGPWXnIadC5TR7rBgD9u+2S365F9va86t1TvuDQ5BPJ1
	1qadSl3jpiOZq7qDcHwz24v5LnT00m5i5J2OmWBbzJ79m3DYEEuYgIQ1o4qhb/Me
	KAAXMQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2msp50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:24:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdba0aa55bcso511111a12.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794572667; x=1795177467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/scdRl794sOjK34mRJAzq/iqnQfL+PQ2xCrXzi/N0k=;
        b=gzYttcDxpcpUg49YzOiBplA8oG+Or+4U5zT72aGuG/wxcKCz+bRtiBvyly60VBovCt
         TjKa1nQ2Abx2ltQ2/J8ZyVTmYheiP8UFXV/u9yt6fZ+qmP0Wgu+G9sjsDusctQh9MFjh
         nZmzAhQF1UTT/GSW2iYUIsGxOEWREcR9hLM1k+t9UefnT2Vui6uR5e9L3B+7ngJZeCg5
         /tvBBNX0Fkf01tsRWpjLbCZX3vSl+ypqGeLHGyvKtdXFFh1u4E/Yibbm3KBRnZetYI5U
         JCFjOGl6TD0GYTGdOSlDz4rbyoIRDtzqizWE95r9GOakwzDlvifXIw7nGT3nMvMksN31
         Mpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572667; x=1795177467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F/scdRl794sOjK34mRJAzq/iqnQfL+PQ2xCrXzi/N0k=;
        b=pxH/ZF5RrwZ1hCQi18KPldiCtq6fG2VkS5J94NlRme2fDRuzkY9/BYcN0+pynXaX++
         P87Gzg3ETMVH7HTxtSBbCTiGh89bT8cSkkDXUaA6NpqebkK15wASSRc13PB7n4o1NVoT
         bbfTB+gTmZG6Tx7kvxaZdpt18lcNpz1iVA9tmUZRc/GvtnV4Ha9BLPlGuKJMprADLA7L
         hjfr5hfwscMLQcYRPrGrfrIskLgBptZq3JjgqyoM+iZKcrwO89iR4gEsVzYcebdnmwQ3
         NHi9cPul+y6OFqziDALoN+dpMqiK5sqK5tfMds1fDeAVN+iF8+hfHN3RARSbqFchDyQQ
         MhaA==
X-Forwarded-Encrypted: i=1; AL+hErEhbjlm3QFE0nMLSMQH9MOOdfnFGg7H3IkS+szwukYFoff4wvUpD/bMog+ehXGTac2RZKlG2qGZYdvE@vger.kernel.org
X-Gm-Message-State: APuU4Z8XHkPsZO8v7whXmBcMzKZ6dB09BrsjAuMU4k07WMErhnszAqT4
	RhlSxLOT1ekFvGW1UpMnd6KMaevhvW1t4LsaC/BJv8s3P0n6pC0uulWHubzn4imalu+1MWd0mzM
	Dj7rvLls6pJtwURq+dM+4u1E2m9N7oBjpYSGW8g15PR5LPfoCKP7EmVdYJIQpkhjK
X-Gm-Gg: AYBFou3TsLIuopW84+rOH6imxmmYORmltn7s2/KY2mDx6C7gnvIFOS/SpsnVsnOBw53
	xN5fsSBhMcPMLD07QU/d9NoIDewmUMjLElQkxodiag0mGAZa0ZyndlvB/CCHvjuFGm7XhweXQKO
	XXhzuCrd3HfVCe+f3r1CsYBBNPK6RN/TBus57aTJON/hoCqHgdOOR8bpMZVPpxNdDez7GmuFFoE
	qcSGS4NPLSfmJOuHcXWZh/ORD1MItxuF+JWQiAIqZ0iVU/x8DLGjyoQwXdspGOaBZ6OR1to97IU
	w4ya8CgHLozpUVWBr/AjIo2D8yD7w7BKdE+3CRcT1qJ9Em1MMvIJDyrMfAyITrKzHDig7JJsi8I
	66McbOwyhWd1jJcwqXeUs/Zmxxf9ukENDCJpZ9gLf60rfw/Xe0stmyahJRB9okVz5AvARPIPnML
	cQ0Erd2GI+aw==
X-Received: by 2002:a05:6a20:be8f:b0:3e2:9025:5c50 with SMTP id adf61e73a8af0-3f7a72ba21cmr2200507637.24.1794572666790;
        Fri, 13 Nov 2026 04:24:26 -0800 (PST)
X-Received: by 2002:a05:6a20:be8f:b0:3e2:9025:5c50 with SMTP id adf61e73a8af0-3f7a72ba21cmr2200484637.24.1794572666380;
        Fri, 13 Nov 2026 04:24:26 -0800 (PST)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc1870ce8sm1098025a12.9.2026.11.13.04.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:24:25 -0800 (PST)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 17:54:12 +0530
Subject: [PATCH RFC 1/2] dt-bindings: remoteproc: qcom,kaanapali-soccp-pas:
 Allow 2 IOMMUs for Nord
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
Message-Id: <20261113-nord_embedded_el2-v1-1-48f717e97066@oss.qualcomm.com>
References: <20261113-nord_embedded_el2-v1-0-48f717e97066@oss.qualcomm.com>
In-Reply-To: <20261113-nord_embedded_el2-v1-0-48f717e97066@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: TUCnCR9oHpXvg-HljDMbU44Vj-9Fmcbc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX1ba3E0LZxiRp
 /vuDiEyx181Di7KKceIwLEOr36t4MlSeawwLvvhzDGNMyYgr+K7LraDEVnTnE452kJEvT4PfEty
 WkamKlOnd+50MEe3RR3lqshWppZs2TiMsvAixYrVAtop67ugZBW2S11YFL2ErFn4sQzfQ7YSnVC
 zW+51dbzgdSXSZotoT7eqNCp+loMLYaSoIVipQzQjIkQOZBDROEzDsCI2PPwhRONoGx5WbWZs1h
 DwKr0a4w/I6RRFNMpeit9CJn+UqFjj0YmFEIa0yRAewO4ga1HoNV6RlLlwg6M4HeLrjx3LpVhnQ
 Kpic1wLQYYQdNkLTkCLZaqIo8kwP1CGZ3u2AkX5eA2q0A+L21jKxfZ9JhdOF4rspbkTb/sHzHQU
 HqiHV+V3zGZztFzOKX8OLjTYJXa9H7vv9ktC+pfu5bgGa3tzUC99SMC7x+t9wrNaJWvl0r/fwlQ
 hny/u0HQ9ZHCzwAxLYA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX3EMYkg+Cf56W
 wV7WN+oQKw75TmQ91loAdFzYc0k8V2rgu4xsbAH7jqAgnKJcZWfPfEdEIqesVNpSYInbEsuq023
 /p5al6lgLbr/pb6xjSsU3ZOG51XiOPU=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af7017b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=K8mYBIOISTU-6_9uHSoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: TUCnCR9oHpXvg-HljDMbU44Vj-9Fmcbc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130048

Nord SoCCP needs two IOMMU streams when Linux boots at EL2, but the
iommus limit of one inherited from qcom,pas-common.yaml rejects that.

Drop the pas-common reference, describe the properties locally and allow
two iommus entries for Nord SoCCP and one for the other compatibles.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml        | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
index c1911124e073..405291c769cb 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
@@ -55,6 +55,10 @@ properties:
       - description: Firmware name of the SoC Control Processor
       - description: Firmware name of the SoCCP Devicetree
 
+  iommus:
+    minItems: 1
+    maxItems: 2
+
   memory-region:
     minItems: 1
     items:
@@ -87,15 +91,27 @@ properties:
     minItems: 2
     description: The names of the state bits used for SMP2P output
 
+  glink-edge:
+    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
+    description:
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the SoCCP.
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
   - memory-region
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - qcom,smem-states
+  - qcom,smem-state-names
   - power-domains
   - power-domain-names
 
 allOf:
-  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
   - if:
       properties:
         compatible:
@@ -111,6 +127,9 @@ allOf:
       properties:
         firmware-name:
           minItems: 2
+        # Only Nord SoCCP needs a second stream (see top-level iommus)
+        iommus:
+          maxItems: 1
         memory-region:
           minItems: 2
 

-- 
2.43.0

