Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ADB353A92
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 13:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791723789; cv=none; b=grNfmvZd2I0Ki1zMRY4CCnVfSLIvZ20wbuCOmVHTWwG518AvpGCxyyNdtZs7wuQsrPIIl9qlA3Lj/tw7kNX7OgcQOkCUBInXTVFs7/ID/TSmvpD5svMEhzJHVogCZlyXdCVkZ7/wSeYhMMk1iFJk+G1V4qPlqj+AbxlEUpPObjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791723789; c=relaxed/simple;
	bh=ziov8GbhVxyyWCk54rcLdc3x5VhT37TqjQTtFkBo29o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UiiDoRs85Axy9xmcDcgktNg8hVq8ngjwVD/5Rm0ryILPvvwdN+kLda+ED2Y1G8Y6FhE0LvKPJxLANgg5de9ybJxJmaJRMDNDuGhEZPRscuSTRQeHzCcy4mq1rMxURDVhpbcDOSTrt8KDOYdLfD6M9CtEZGXaI9xytAin4OmPbqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EBARF+Oo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O4l0IMBt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EBARF+Oo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O4l0IMBt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B852F53981943
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 13:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FJ9CalnwFGPLr+NcxwncqOYL/bjkFUk7GOOpj04XafQ=; b=EBARF+OohtdkvH0/
	6FVcC8J4B/B6H+NIsAKPT9+weH7K4LEyuetgi2X7HhD9NMMHCzY+2EC29drkyeAh
	slmmcmKnuwwIH8Nkcqr4tCWtLH8F3m5UpOxL62HdaS6JBE7wmCME6PeKzbaM2tIn
	oHDhyBk73BIStOLAPudliSfiTx+5m/t+BP2hE2VyiPo4FIl9bTPrPvgy4MeghuuO
	4u+3TLsG+ZtZQKia39ozN91n8Ikt81dtBmck8/W2p3FXZDqRx4sGdwU3WNSpi3gx
	EqbCR6C6bn5t37e5dHPrLsI1Yoa1YWI3IU7PXIPsndkERlDCYYLBJLYcMcWW0QvR
	0IEsHA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7casb6bm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 13:03:06 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a4d2e39acso602224eec.1
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 06:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791723785; x=1792328585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJ9CalnwFGPLr+NcxwncqOYL/bjkFUk7GOOpj04XafQ=;
        b=O4l0IMBtn+lpGLxvaPYDFWtzj6BeY4otHcEmf8K9CW5obCN/QevwqqzSX/K0y8tO/+
         dJyyEgAZeWO1XgSATgBA0oPrRZg+0ygg4hyKhsO1k7NzWNi1fDLLkGf3wvvmGHZRgHzH
         OTQhrBAY1w3nEIwTcFHDKd4Jieem4tmwKpvi0ha8XFU39NDKolPFV8XywqVVmze9ZLQV
         7LrsF8JrBbipjeT6ohKpHQTc4hg7gQA5WoOuitz5O7OEU0D5owTXt/egKJ+GXze78HLW
         kToL3I3t5e2iglHedUMyP99332dmMuQfBeb/Nc/6HoyQlMxT7XQKaRXTMcW9M/IzmBsV
         WSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791723785; x=1792328585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJ9CalnwFGPLr+NcxwncqOYL/bjkFUk7GOOpj04XafQ=;
        b=NFKvpYVXYZfmzf/+aFf8zbZFu2ZjygS5Gf1g41bLzSPFmCAqWOVIpA0zHM6q2097ej
         +W7SIZHYYE3Wa/mam7nZGHJgpV5r/E+fjdebQOGlE7OGdj50/r0D1925gJCPmd/Fjg8n
         abop2vXXRK7n2EH6W1EBUK7qu2JcmTJM6TvOKhtotWh92UitJ5PIkJOBmcRgJTkgbzQU
         k+TMK23dRTCAl+46QZKs+aXIp6W7cWaEIsoP6NqFm600+KNp75Bv/HPXw95WCJBGsb1K
         qaoZqruHscvHuE1CwjLo7Ilm21qNgL+pI/pvyin+0aYfaxiUxxPOgY5ornA2aoC6TzXa
         1o3A==
X-Forwarded-Encrypted: i=1; AKwUvBzmhEgIqc5HcaTejGomUJ9ShR+1y+rvjKIA14tMX11RHUAoZAwp2wIp8GZTAU3B530hQYf5DZ/Bad67@vger.kernel.org
X-Gm-Message-State: AFq9FYIlDPeQ3sOc/qbMix10DksNkjATKGL8tslBmo8f20BwiupPIfxG
	5q9t91Gb18WTMhHmOz94JyzrdUeFQzTKFgPq3UM5pEiGUzyilVzSaJJ9eL8yT21d4VWnT1brqbZ
	s9tjK17e/hi2Bufrr8bpPzigGxL/4LP+0l4EZPQnZl8ILTNCJBm2NiHdemgLYpC6jtRJ2MbstvE
	Q=
X-Gm-Gg: AYBFou1LSwWGFcAnYeRc/GZiXgf9Z/6+2r3+69CUflIOeawUiwrePdsjMQYBqA0z33L
	4scxC8PVFw/qe7ayYRZpPyVkjBOvbSLtfB6aLQc31SpaaYyEIfrweQbXB+Sd23BhApt9f1JPKnt
	Er+xm61b3foArU0YTzFD6TPEIawVpMWEI1YdTw6WrtRmmhGzfJZq4pco9wD47olE62gQTeoG8KT
	AdYuEIo4lgGxB0xA1S+E52mfvZMb9VzTwRX5mcAMDlGNV0at6bqRWZpCVjQ5njhEnugAcaGiiNJ
	3QrvrO7aMA7qOrCo1GW6Bd9u90Tfh0SRSPZNZYvkh1/hYG9nm1vCziaxiOFyfcOJfRB3eQgrudS
	l/Bh8P+JmD5Wtmie/8AZKhX8ueImle3wdwVfL0VHkjYE=
X-Received: by 2002:a05:7300:881a:b0:343:fb75:a5f2 with SMTP id 5a478bee46e88-3537df8cec0mr10273167eec.9.1791723785131;
        Sun, 11 Oct 2026 06:03:05 -0700 (PDT)
X-Received: by 2002:a05:7300:881a:b0:343:fb75:a5f2 with SMTP id 5a478bee46e88-3537df8cec0mr10273127eec.9.1791723784477;
        Sun, 11 Oct 2026 06:03:04 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm27009074eec.3.2026.10.11.06.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:03:04 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 06:02:07 -0700
Subject: [PATCH net-next v2 01/11] dt-bindings: net: qcom,ipq9574-ppe:
 Split EDMA reset into sys and apb
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-qcom_ipq5424_ppe-v2-1-8c7b057e2c43@oss.qualcomm.com>
References: <20261011-qcom_ipq5424_ppe-v2-0-8c7b057e2c43@oss.qualcomm.com>
In-Reply-To: <20261011-qcom_ipq5424_ppe-v2-0-8c7b057e2c43@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791723782; l=2245;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=ziov8GbhVxyyWCk54rcLdc3x5VhT37TqjQTtFkBo29o=;
 b=6b5djGaOjwahzdPW9P/w6Kwygh/n+EiZYc1i1zSI2qquUhZSTrt9L/g7M0Yv0ClR7iRM+2n1j
 ZE9bX+nsMEoBnnGeXHyw+xqbJYGk8xayaD80qXg8Y4l/PavFFajj33u
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDA1MSBTYWx0ZWRfXxaDawxChVLG0
 2aPwoy6BW7mIUHOsY5ZRxoq09hncHwqj90ddMltCREq9F+cCNwkDB5h/oUeWSppNqAf1qeChFRG
 rveuHYtbtv45XTQkAe693VZeneBSUBs=
X-Proofpoint-ORIG-GUID: lvqXStfePCv1MCCt5AFk8UVrGKviAMDN
X-Proofpoint-GUID: lvqXStfePCv1MCCt5AFk8UVrGKviAMDN
X-Authority-Analysis: v=2.4 cv=eMWGH3p1 c=1 sm=1 tr=0 ts=6acb890a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0cszTrF_nvGlpc-19gIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDA1MSBTYWx0ZWRfX9hb7De9J/K1I
 B8wDr/2mMt3CmEJsnT//5kl3uTy9M31+LSi4b1gpdGgyQSQE38qoh63tTXOgjki5uYYTLr5MOL9
 kNSupdAd0qAruZDFUnJiULzzL6uMROKYiW4npSfPuoHCWemFInzWu5LgmDAck3d+gsDTKQOQkSY
 hm7iVXjLIDvfSzSVsX7dvitG2cGQ6M+SBmH9BFYyejqsapCFz+E9cywDGN6sIHO2psswc+3aWVs
 gH2MSUf6rzyndowqQXc3hbDngazI6R1KGPCMfWaiGDKw4ymFC565f4BXvimIfvYuKZSIrnjeC3F
 Z1bqf15Gzh1jsrrwAaEfUs9SEDdnKeoEF/1c3mtaF648IHdTYdh+e8teRPtzSrRHeUCJQ3B9FIO
 F94N6I5IT1iZSXA0GMrdr4W+QyOqGT1u7igfGi2n60kQedxUoYMheCmMD7Gpa6ZAijIpx/Fm82v
 0rwah1cgAMvL6D8pDHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610110051

The EDMA reset is described in the binding as a single reset, but the
hardware has two separate EDMA resets, the system reset and the APB reset.
The reset used in the example is a combined reset that covers both of them.

Describe the EDMA resets as two separate entries named "sys" and "apb", in
the same way as the EDMA clocks, and update the example accordingly.

The EDMA driver has not been merged upstream yet, and no in-tree device
tree uses the ethernet-dma node, so there is no existing user of this
binding and it is safe to update it without breaking the ABI.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 .../devicetree/bindings/net/qcom,ipq9574-ppe.yaml        | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
index 6d0b21a10732..c899f4b56945 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
@@ -144,8 +144,14 @@ properties:
           - const: apb
 
       resets:
-        maxItems: 1
-        description: EDMA reset
+        items:
+          - description: EDMA system reset
+          - description: EDMA APB reset
+
+      reset-names:
+        items:
+          - const: sys
+          - const: apb
 
       interrupts:
         minItems: 65
@@ -170,6 +176,7 @@ properties:
       - clocks
       - clock-names
       - resets
+      - reset-names
       - interrupts
       - interrupt-names
 
@@ -273,7 +280,10 @@ examples:
                      <&nsscc NSS_CC_PPE_EDMA_CFG_CLK>;
             clock-names = "sys",
                           "apb";
-            resets = <&nsscc EDMA_HW_RESET>;
+            resets = <&nsscc PPE_EDMA_ARES>,
+                     <&nsscc PPE_EDMA_CFG_ARES>;
+            reset-names = "sys",
+                          "apb";
             interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>,
                          <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
                          <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>,

-- 
2.43.0

