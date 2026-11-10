Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280975;
	b=c2t6sR8qpddDqMjY/orfSaLbS6rLpArglFZoov+rFzaFl3RJauS/wNKeocom34HAJVeG
	 6sI+Y+NVU5bD7TCEM7ft5T7wUJHraXNcm6G+rhdtkrI1vapOe5CprMpdB1r4B2N8FoldJ
	 Yzp9dJDKUjJFOFKeivo3lqzUavgVm+fx3k13aacqX4EbGnbHxIuQUkNyZz5vAu2O9wD1e
	 qQOKUUggoC3fTBwa23oCZmoLuS+KAwYZKBN40aP969Ye/FDXDgVQYzh4movu+wvsAbqW3
	 1RwycGlY3Oe72FGshop3A2QaZ4cG/YLsfSUsuGqs9wQv/hYLT4D1EOhiJLaIgW8wPYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280975;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
	b=b7ELjx0VzMhTVbVQYin57ziuNbohXELGwAFO9vqMHiLpCgbhWeImNMtyer/P7LY3EnvH
	 Stdqlqmxvb5aUgGH6TDZAOhE22rf9o8u2cQtSZ+BFekmCGLSui+Oczph+61/bU/6jbhwZ
	 xdS/E17JM36x9iy0zWVPWO7nfW8YC9Hzpp/0FZGxDd7aKrQjN0jT94EuzzSh5JVK1dhv4
	 4ZDgGNYH2RU6jIvcWDRomoqqEvyf2M1aLmSKLQW1nWDusXfUtC7iFI1fZ3nfDMIVF7FMT
	 7KXBOfQtlt0O9Dl+qp7iWnOgJeOXwpazjNjEeMEHBsRwdC8PJcvzNK/ndt0Clf7kBJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I+QEeTFk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hP5fJT1K;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E335960A2615
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E335960A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I+QEeTFk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hP5fJT1K
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j7NV764342
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=; b=I+QEeTFkHUu2b3L/
	XqztB6ygtRDdY9jVOSV7rCmmyTOC4o3mcDxCBQ9kfoPSP1j4snMc4m6hxvtua+oq
	ClX0PiiHmBM+2ZieTtgrCFya124YJyi0mTbgc34JiEBXq2WBlGciSq2OBaFyLKpi
	Bms/WdsLQeAE2fzaLBQ7tyhGAr/qB3IqKNIO16WxLDPwH1SUHFjLVItLqs4O6N2u
	9Rp3KP7uZTkvORJgqvvtuP+JIZpWAMkMx8on5raH0kBdLVKULqsmqm7cj0M+w1lY
	k6tnEzpRf0fcnAXqkmBjbaYfSS12LcTXeQ1WobFueAaqnNq4hbNRJpi8DE1/cAIP
	zMERmQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkh5bj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:22:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so1367092a91.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 19:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794280973; x=1794885773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=hP5fJT1K9FqxwIiIe0KYQhmPx4hSNqUif0zonkGrkyFXvKzKBKz078AV56rOCGkU8d
         Qp/Mo+rAi2WBCGcif3VDt6M28v6+o4IHiTP/QIEKdrcuWPPdz3a/K/GQk6zdP7iSB1/0
         GfoR9Jfn5Jh3MievM8Egnqum/fpT/yQSY10wROQiG4LyFNz+rQDYX5pTlGVDTtxgJbbm
         jmh654xX2nNJU19s4mmIDoZ8Yui+wNZ8fT5oKmDGlZkOEGiTrP0x9qMqNO8DHCNo+Ntu
         74xSfXMTRme7fYyjjq9K1LbhBYtUCTtr6ppxNbS4H+VJ73bAEwdH6RuQuPjlgErrT4bZ
         mGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280973; x=1794885773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=mLDCnI2HlBGHbLkQqczn4z0r/gpfEzWy6oVbWeNMVzqh3Pd+pjNgHNDF0NyQIiArv5
         Z6wtTvP4FJLW6ew4GezqmZ59GaDOGzM7+1DpnYYGeO5atE81oVe6VXNaZCiYRCSG5Qc0
         8qnmziN91UvQ376uGqFDGpNSjF84L6LIurnHIQFBqFjkt08xKsuMJkDDc6Qbh4IwR2tk
         flQvyUdLF0Bm2H+XkPcZpcDL94I6e+HRw8WLhQH52WYLyINciAuEG9uqWkM91FYciJb8
         ChbOQXH9yv01SEd6d73L9NURGgNbrxSFhuajGfnShIkVpeDkuiIZZc2MXSDFrQpuvYE9
         hYkA==
X-Forwarded-Encrypted: i=1; AL+hErH8jVcFeDv5jFtQOc8P4eE+NC+3eic6UJeZjNQocNL469lWJLXoDNhwXTFxX2w9CPtXKJii56enT13V@vger.kernel.org
X-Gm-Message-State: APuU4Z9SQWwStvHerSRSb/mq0y4U4Pt1JGrg2dSv4hQeUvn3YWe8VgMu
	YTjQtXp1xZr1Fgw4xmXMdtJqH76R9P9xEpt8VwL3XDMD+JqUImjFF3fvj3NH3DSuYTu6UDXraYo
	NXQrbrzkihjoI+9ujm1u2xyIF2uE4y63b7zX/S9Ug2IUx92xmGA/OHJg1rRuKb7Jw
X-Gm-Gg: AYBFou0TceuWYBlHgaPdhytKnn6fwueYntOQ9Ncrcg65tG43+9P9zkPHCqYKl8TT7Cs
	f0MI1/vdilHIMZwHNXumm+DRWK0jHZiw7Nu8Iz8qgkZDOQn1Kyf1SXUY85OR1+YDCOEFI2ARwfz
	A930MExqZWaoMo4EYbvQEdZVl0kg7xGc+TjT3HTn976tnuwJ5Mw7tKkjelZ4RDNymC8qYCUIdZe
	BPjEt9CLxXraTeKkcN6RHWxngp4N7ZgCmUwOGt1hgZF2v0jgOkWsU0ZaZFokPb1XjFtP5HSkr4e
	k4rZXoliPMF8WZUKdzI0gizLA70VlF5f6fvQpC1/Gf4iJ3TdHxYBHEeuZJtBRc+J/Gd10SPAjEg
	RvVyObISVzSiHfgsbqZ+LyvXI9xrjO9+xz/uLe4RfCQhYSAA5cFEwDhNJoNYluEZENO2A6pAL4t
	+bzDW87zi7fdabLFXATqCML0o913hrXQDsyTkA
X-Received: by 2002:a17:90b:3e82:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b167a1a2demr1076847a91.37.1794280972843;
        Mon, 09 Nov 2026 19:22:52 -0800 (PST)
X-Received: by 2002:a17:90b:3e82:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b167a1a2demr1076826a91.37.1794280972176;
        Mon, 09 Nov 2026 19:22:52 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm2341a91.14.2026.11.09.19.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:22:51 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:21:28 +0800
Subject: [PATCH v22 6/8] dt-bindings: arm: add an interrupt property for
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
Message-Id: <20261110-enable-byte-cntr-for-ctcu-v22-6-05d48c0eb110@oss.qualcomm.com>
References: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
In-Reply-To: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
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
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794280922; l=1754;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=icbknvjFK2vf4oKtSEHbsU4cH2Y3pwIOC3H2EHr7Svw=;
 b=6NrGk5dSyASv83dfsrXoNPAOKI1RAL53ItKIhUIrOtoC04rY/iqbY+indNvj+wTaEWXWZve9q
 sra5huRI48JBKgouEhBBxXTQQA9P31OmGFhsDfq5bXuM/0c3Xl3Hb8T
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: tefVQMNCn4ZtE8wcl01oNKrp6RWzXa_N
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX/U5blZMmOH2X
 kbKqhEGvUFsu9R4ahzRTHrblDKYwyL9FiZkLVcch5w5TFvDYlaQbNx6aAxPfYGY5UDsBubAlyyQ
 sIpHm4ILb3A9LOj7Z4PFGj4+pz4d7mU=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af28e0e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: tefVQMNCn4ZtE8wcl01oNKrp6RWzXa_N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX2afp9SQ6FXe0
 9KFxk+YVELm7fdCFgHubFcdsfAB59R6LvO8jUuyi3uBWO5KNJxpOqsQlYf4VHPFDuPanH2PjXT2
 zHIffIzqYf3pHGaFcfYhm2FutKEh0HIOptcGfMh40gp96/5E4rf8YYqXbKmiwqw46h7kQAn176G
 JQVgcS6rg33KU+GgL5/WzDSjrX9ih73hQgmJMiYg8CKCD4PtNx7Z12u1QDHwGHylOilfXSRIAHA
 Bkfkmo3ALm26a5HyO6WzXQbUqjpzETJkKesUmEcD08TBsTPDqAUYi8oPlmRPTz+iZIhQwS9e+s/
 amIfSGrIx4/rZb+BCq9OPuJlRgW7coBGltCPUFY6vObWh75BuQSS20u7pwleJkywraUtMrorjsV
 sOMKSmQBGONyULvbpCsYfn/7DAfVtQDmRb7I0x1vDpeGlay2miV3vEsXec8W6y3Xpghcu0ShtMu
 qGbTake66CVP8Xe/DNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100013

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

