Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6709F3B1EF2
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 18:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461652; cv=none; b=G8C/dyExgXNm6WfNuWHXIYIEUuSbNfGm2dZR3i1sVRm8OgmIlUIAygciZnm0iJUyceHT0gwlZZguwOMgJzZzy4lcO3qXDOBY9EYRYof1LfMzrMZ05GcfJf46UxPRNItNArn5lLHbqagoe/2eFFowh8jnW+lxUw2/bHKEvebMtxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461652; c=relaxed/simple;
	bh=eZIUN/lYfehnQlzthxyb/UGydSLzCEUV422r4IFRfA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qPd5DHr8Uu6cPtUZT0kCOqym+rKWwyOcfXrC6zBGpo6f97ik1O6mdZbP2VrVtkDGxWnENNZUYUk/WUUQgRscQrEUCsG4b0up2MEyE9G2ABhI0iOx2KjLyJ7JJGw+lpiER2blPSlfJcTXzkjpSicKvYepi4TgWUKSU9ftYvR40IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WqyiFDsb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IM8krRj2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WqyiFDsb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IM8krRj2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G38rK346124
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 18:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jbfjPo2s6iAx/iJD/jmcJcwK+bjVeCVPpo0oSlaiXmo=; b=WqyiFDsb1eWDZKId
	NODY7STdeeFa9Dzz5GOt/I6NOzR88CxjuimoDCw/cOwtphA7NyMRmQ0d+YoNAHU/
	aoH4rspWjkNmuxUgaXiiTnW+2KxHI519tqNvxIK02z+5dwzVTTcVKr40kT/gzGbY
	2XwCq9QNWHj7VHJaSb7BT2kM1QaDgAaCecy4yUPUWmd1xk49R+tAl8p2kU7o0mEC
	Ug7xOhHWVb2kmknb0mHNYlEC2RlpCRCaRdJgFgjwQLM4Y/OQL6+RigIcStGqyJx7
	V8nSt/NJ9qNkYx3+C2Fkwj41W3epOf6FgC6qZ6j+P27MTA3CTkivsRCRKSiu04eE
	7uCIUg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5pdtqb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 18:54:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398e1fafe17so172072a91.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 11:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461644; x=1789066444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbfjPo2s6iAx/iJD/jmcJcwK+bjVeCVPpo0oSlaiXmo=;
        b=IM8krRj2ST59du7pn6Qgg7K9wsxwSqjOPEKpkxIoFxa7o6y39Pfl27toQSEfeAXeeB
         UcTeM/sWR68vARKrQZ6fhrAO9zPKVvsxxoB81ETgZ7sVSciLRkdHpEeFKQDjd9rC1p93
         D94EAIJDB6cIJeQu5VKEwRAl+1LYxdpCxpPcR0VpzgmoYihSGsNapUom2dJ+4F58KB7m
         Um5f0hmJ+EKiliOU2q0T9OP7BBYYAzMtvjEKOXCYH3vAgFD7RAAgqDDnSyduvHWjU16r
         OFHj6dwCoOYApO5TFuLqbyEcUMhK8KkonvYZ7V1oV4yIkRrTDKraS1kFYbRQ8LvslAYT
         TTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461644; x=1789066444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jbfjPo2s6iAx/iJD/jmcJcwK+bjVeCVPpo0oSlaiXmo=;
        b=CCMBp9AiJABp1qP9Yb18cUgZbNrb7OkWCBSWM5bwY2OlzHpmSBxEWs6siW1wXclft2
         YYEGTOgoqvX7lQ0yDaiuox0huFPNATioxAgVAp1/LRl4hb13MyzV2nk1CJW4sL84YXKg
         9zP0lT/AkLDgUKaNz1YbQlKf5ZSv/xFAxqpT2Q2xvYWw9VChLr3hJ91vVB+T+L37azql
         4xCd374YMbdgW4wpvqjqHSGReT4Ar6s1AQ2u2ZoJx4SI1ir61wuhGOLxzgGEeekDxyT8
         OrsBYFi7bpVzgyO0CA+fekIfdkKHX6EDNTlgilZ41KydlXVOFm27R1BIuC1eZE7qxj4N
         jjwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxo3XsCE5kDVtKsEjmqra8OjicD3FRjMZstKjOEv5Zhy8p+5xkHn/kLQfHjA0m/UZvRfg0HkLqHrGHo@vger.kernel.org
X-Gm-Message-State: AFuF++mkC7wQTjkfMt23MnY3I9Pxw89gfD6lA8oxGnSN2SigwNH6W1Nk
	cKAK25PIU9KUo27+DxPSs5o+D+zXCiKj1d6KJYkEsiLGiW7W3dgIT6yxymS8prvJQdNAayasrQH
	bq/xaGFGYc6Il3FxgMDkdaqrIJrynSk4jCTmxaSDz1iJVe62S4DoullA4zKVC7ZC1
X-Gm-Gg: AYBFou2+f6uVuggs5ACKR5+E+YUGUHfN2/p3d2Dq61kiOOLyj5xJ1+Z4tdsmWYm3QQ7
	g88xT5lm+J9jeJq3xkSIMaXif77j2TXRggqQgWx15xBbTJKPYeooyaqIhncl7Az22RutIxd070X
	XKX0gSq/MIyHVEuu8A9lfzayLJcAE2ma9GLNOQn1pmJ4WwAhDyogZKoR332jJMYMzF6fqSmssn6
	cehibjhpiI5jaT4zoDXwW/N7Sf7dWCfW+DrdOZiMcGBNLstu10wH7unnXGHymGdnVn43uwuhcvo
	7HMmOYJys8W++SzFOc5LRVD3hOSw9uqe4PmvVbXzFn2px8+vB3ijH8ZiooAFlvyl6ppWEUJVKOt
	Z0Ovx4u8Ckd65u5b8x50cLT2x/ko6rA==
X-Received: by 2002:a17:90b:17d2:b0:380:f389:447b with SMTP id 98e67ed59e1d1-39b2613e70emr682063a91.11.1788461644261;
        Thu, 03 Sep 2026 11:54:04 -0700 (PDT)
X-Received: by 2002:a17:90b:17d2:b0:380:f389:447b with SMTP id 98e67ed59e1d1-39b2613e70emr681984a91.11.1788461643675;
        Thu, 03 Sep 2026 11:54:03 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:54:03 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:43 +0530
Subject: [PATCH net-next 1/9] dt-bindings: net: ti,dp83867: add supply
 properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-1-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=1977;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=eZIUN/lYfehnQlzthxyb/UGydSLzCEUV422r4IFRfA0=;
 b=9YV5GbivqWa07EmRXOblUJxRz9P53VISN5Z/yvnsGCNVx+EjFrU1+3n4+/WNFMnmaAwQEwuHW
 8v25iuStJetBoprE3T28uAmO9+1AnmsH0V42lDK1YK09J+0UkP6t/rF
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX4yFO7v69uw/N
 6nhvnBpNdW9TOHza1vC7MmNxGvN6N9+ZHEJqk89BS8RXfezkcSeGy6J8tB04msrYMJ4m/f0lphY
 umrVuq0GwWAJl56yvV/XmnepqAveyUw=
X-Proofpoint-ORIG-GUID: Rf8io4mJsx7pYm9HauYQlxY8m7jaNnPJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX9dGNyn/7q3MJ
 Re54eawX9SPmygEJ3/rKOfs4pgevidvCBVTZDD1yEchgKBc6bP2m5ozCh/Rrv245tMt1af4xAHT
 5QdoJZiGAmsSPC7luXBA1lfM8XI4oTB1GHV/Xfltrlop3exfSsdCudFqJ1zoTtJOU1X/ZeLDjjT
 1kkRmS01gU7Ixz7CZal6510cMNrO/ERkku2s3OqDZKAwOJ4xL1DnSZdWtBdUdqr6MFzVUPY4qN4
 W68MJG642BIM1jy4lXXOVOfqCzLKabqKV1RUzEJx0hxaTSKwW5j+58w4y0PJvKfHDKEZfjYiV4l
 T31/4MMXxMu3F8u7lvUYGqdtHQaNCyK5H5SQgESilaSVuqXDuUOpLiqYhyNGSS7cjy35lndGppO
 i7UJarnIJt6SaOCAak+AdxxWRGG5GRwryrOcz+zvApG7UDTxAkUpIS9bh9QbyDrA+aIDvol62bC
 2IAXr9lJlzgRzHyW0AQ==
X-Authority-Analysis: v=2.4 cv=RsL16imK c=1 sm=1 tr=0 ts=6a99c24d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=9lbML-Ic3bjincHAjDUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Rf8io4mJsx7pYm9HauYQlxY8m7jaNnPJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165

The DP83867 PHY has four distinct power supplies:

  VDDA2P5 -- 2.5V analog supply
  VDD1P0  -- 1.0V digital supply
  VDDA1P8 -- 1.8V analog supply
  VDDIO   -- I/O supply, which can be 3.3V or 2.5V or 1.8V

The DP83867E/IS/CS datasheet (section 8.3) describes two power supply
configurations - "two-supply" and "three-supply".

  1. Two-Supply Configuration: VDDA2P5 and VDD1P0 connected, and the
     VDDA1P8 pins are left unconnected.
  2. Three-Supply Configuration: VDDA2P5, VDD1P0 and VDDA1P8 are all
     connected.

VDDIO is a separate fourth supply present in both configurations. The
datasheet specifies that it can either be 1.8V or 2.5V or 3.3V.

Some embedded board design expose a GPIO-controlled regulator to control
any one or more of these supplies. Therefore, document all four of the
available supply properties.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/ti,dp83867.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.yaml b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
index 4bc1f98fd9fe51260b767b0a1b8b7eaf974a9af9..e78f08ded3d0d449ab75bf33d814fd49587f8387 100644
--- a/Documentation/devicetree/bindings/net/ti,dp83867.yaml
+++ b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
@@ -118,6 +118,20 @@ properties:
       Transmitt FIFO depth- see dt-bindings/net/ti-dp83867.h for applicable
       values.
 
+  vdda-2p5-supply:
+    description: 2.5V analog supply (connected to the VDDA2P5 pins).
+
+  vdd-1p0-supply:
+    description: 1.0V digital core supply (connected to the VDD1P0 pins).
+
+  vdda-1p8-supply:
+    description: 1.8V analog supply (connected to the VDDA1P8 pins).
+
+  vddio-supply:
+    description: |
+      I/O supply (connected to the VDDIO pins). The supply can be 1.8V,
+      2.5V or 3.3V.
+
 required:
   - reg
 

-- 
2.34.1

