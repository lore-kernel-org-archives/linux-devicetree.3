Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782C64A68B0
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 15:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265577; cv=none; b=oljfP8OhMq74WR1wMP9orSCltvrSkJQzeJ/gHfAwOf5gzrJ+ENgn+stgfoFlApqgms582Udz9CGkousnFAm2nYCwDCvDMMN8W6ntVu1ENFL49RRwPQYtHMo37+92GsGJBYRA51d5UvXX4BTe/u/6a4b3ygoDdbRMuH9uRWb7tp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265577; c=relaxed/simple;
	bh=7rardkyifAR+2AT1JfxqXWVC4DUlTbqXtnaIiP3Z28I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=byw1n05TZh/N2iHuGRNwQ0iR1VXPlZh2014fGBcFbrt2urakiGGbXnN13eqDd+2gtpr1zgxBfti72vvxim1HKotnx+GiJPAL9B5MN6rdHfqEVKIKjGLnYVSk7Agyx38oFIBNSiHOBZoeRjtvQ+AKZDYlt3lHYIHFdqIDQefvbIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L4Vx5238; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H8lLHRfX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L4Vx5238";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H8lLHRfX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFegHP1907524
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 15:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nMeeDoM5kZU/bqV8HBx/kQzsngPCM+3poCWoyr7i+Wc=; b=L4Vx5238ZyCbLj0K
	QipZ+sAtiwv90BdLKTQ2HH92/VFEeZeLqYKpbMpwdGLYsesdymqXVGOTxBjFxdXJ
	ESrq8w1bEQ3C9+eR48MJtpXtRVEbv/EQSsc6kgBwoR24a1geVI/NN4u7PeFxegz5
	c+fM062PsFd1CfVP1gZsOkKvpW73dFbNNn5pu2VO7h1BB1EUlMSUAlnlcCl8dybK
	XlxVPjvMYtPdqPgvT+9c1VwJdcR0CURGCYc3J92fOBpK93IdLW1HSLX9xbyWgts1
	rEMRE6WrZ6KNSsRFWGz2a1KeZP9tUoFsSMaLu04IHz4COPtz8o26NhWAYfg7wUGO
	EOUYKA==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7se78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 15:59:34 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66e5f804faaso9821d50.2
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790265574; x=1790870374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMeeDoM5kZU/bqV8HBx/kQzsngPCM+3poCWoyr7i+Wc=;
        b=H8lLHRfXNHQcdsJLLWwmqMjylJe6hwEnN+ffTVQ96zgjO5VD03rML6lUzlLBp6oFfS
         uuJQ7eTgDQ2O2LbUvmUX243SmXy/uS3nm2FBir/UQ+Ppl/dFEqvfu9tZ5JGS0/r4PFJN
         EW5JpKc0Kn+CdPf/rMFipIqIPKsyQQSL7wY0fazp20AB1A6WJ+ZbOO9YjOjKRdPU8d0/
         pwZzAVLDd6udppBsug7D7JWWWhJesiRezdZePr6GxDotrb50Nq9PRO6wWVXfIwvXYFeC
         ZQYGl7xtqNGNn/+Gp8ufSVUUc5UAFcplZx70AZsEMEcF57bukVYvMClejDH8rcCnBjzT
         /76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790265574; x=1790870374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMeeDoM5kZU/bqV8HBx/kQzsngPCM+3poCWoyr7i+Wc=;
        b=wHfvdgJboAvnC2kAFifr435cTrTbJGPGGYll5GmudBCmlLerizQW6Y1/rZiq1YDqC1
         1Aloa7Lxs/Bzpp8WUcxLROgs1Q0jfmcXOVQ9L7culrEEHBL4OHZ5M9phlcbrB6aHaGK4
         Y13ysZGrtGYCMBXAssjbZrSjSFRh3nyR68S/iVzAYfHQ3BqcNh1FrKgpEqGTUEVr0XSW
         uqYSYSlwrs1Q8+eYmFTVI28AFjk5/LPuLcri9jEufipr1J2eW2lDovAytePegn2UD9Ue
         qeLNUmH0jVLncj+2jBZlby8gdqE/ORvhj4vEZR98InQxTybAE89Pi1EaJ9ahrIzEWhvg
         Xp8w==
X-Forwarded-Encrypted: i=1; AKwUvBzKCnjjSry8dIFHaocVb20JjhO1ibh7PPrKjsb0mqcM8ZhJKOdYZgLWpRe200nbjqCICUY6ksSTVIDO@vger.kernel.org
X-Gm-Message-State: AFuF++kZr88or5+IUP5xDHnKTYxWLS8B1MVEIk2IiR6hR/Z5ClB5mczy
	I1VFVuWk/+p9dYU057DyX+gH5mS495qgsqAW5xg5tbdkhiOu+6ufHZYtmtyLrcAVtXS0iEyGq5F
	WeAZDQkcutTUwKt4u64DjAIBHSDwqOP9DV2zat/Dhta4z9pbBaZL+RtvBvVVbhaTG
X-Gm-Gg: AYBFou2um5iP91PQlzLWyTFevuZ9njqx203NAj78KicEp85pNSETTVSJmGtP5O6F07Q
	fkobJ2A5ADMDPPbGHpJYPshTUjx8Ayyn92AXxPbD3Teb23SAalOdKhJa6Ksd6Z2WLNhEqyyTu2V
	rtWFBzdmr5Xy0X0vFvWIDyHoYQu4gcspQM7VPoZxa/Tl8wENTJh8W0D+ZyeKw2PpVpU2f4xpe08
	7G3hT9Kexzcpj2STCaqjrKDMXVRBeOJQGmPEvPPCEGyjVYko9EBo/X3SH6CTJwHrPvuU+fLuTde
	5KhG8rAW7pxeDjJd6TsfGBKcp2nIWN50xehnhCnKGxGs30zFoBcfsMJp0ola13X3gMWW14xuODb
	5XY86HzVwK91aaK8e7bYxhUImdFAxoAfKhx5URUz6eb9d82TjorY6ZJzZAQIzzGEZSbZls8phL7
	WdP0zndO6AW2nrwlEZu8y4
X-Received: by 2002:a53:bd4e:0:b0:671:1256:56f2 with SMTP id 956f58d0204a3-672ece3f118mr1991405d50.0.1790265574321;
        Thu, 24 Sep 2026 08:59:34 -0700 (PDT)
X-Received: by 2002:a53:bd4e:0:b0:671:1256:56f2 with SMTP id 956f58d0204a3-672ece3f118mr1991386d50.0.1790265573893;
        Thu, 24 Sep 2026 08:59:33 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-672d81e102asm2271003d50.19.2026.09.24.08.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:59:33 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Date: Thu, 24 Sep 2026 21:29:10 +0530
Subject: [PATCH v9 1/2] dt-bindings: display: bridge: lontium,lt9211: Add
 lt9211c support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-add-lt9211c-bridge-v9-1-d78b39677a61@oss.qualcomm.com>
References: <20260924-add-lt9211c-bridge-v9-0-d78b39677a61@oss.qualcomm.com>
In-Reply-To: <20260924-add-lt9211c-bridge-v9-0-d78b39677a61@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yi Zhang <zhanyi@qti.qualcomm.com>,
        Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
        Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790265554; l=1545;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=7XMiXr7D3fC2Of65x2F+DhMxVAnk7abheQMCzBYJB9E=;
 b=hEeFDcepPc6JFQoICcwq7lno6RBFKeTfIcn1bnp+3lE4885PlNlYhbqK5Pn7DeS4NvFmTpvmr
 7zcnS/3EDKDDJKytCQK1aa9uvp6JMXmxLiA8E4NeEPYD3ZQhTlSx+q0
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: FL-kcHO9Jvlu5tIc8za-sv4CbZ0in0ga
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab548e6 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=UcubZVdaWCKl6vSfqw4A:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2NSBTYWx0ZWRfX3wH7/m3ANuwl
 0ny2AbZEFqOjmT5QFZugrH/F/nN2Aer4PSJoQh55hZcD3b5n+ksPsIas6Xo2m7NvWG+zmE43OWb
 K9PBefhbESz6IvKp1IGoDykSXjEjiiM74et/xbaTLC5HNw1k7ai0n00zUOc+qrQUfQQI33L+8jQ
 fvRxoUhypjq88sJ8QEtIsXhLIoYmFsZKyH1bIY7kvnh5klnL1iR3S31r+S+1BwdawmGQgTCpCrl
 pMjM1uduFHnYkM5+XEa1bgkvjmnwgsTCT0nNVtvstYBNJjtKikoLFIYjhNa2ZK8uYVSQ5jo2HuP
 WvtAVMkXBomBDCKxnBlATc2CG42fTJQKpB5Qnkm6D+NAmQdBVMiq3YKb0ujo6XG0Z8YsHK+Mg4V
 cWHF95n3vUmsc7qvMFTOfCO/HNvCNj7s8OXEls0BoclQ/Ske4P1whQg/ERxis+hJ0aNmGPPfqzy
 Bzyky2eKxxSHL9ZYJjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2NSBTYWx0ZWRfX1lJA9qAt5OoX
 UIQ1mgKL8ymV5ot3hKadJa3/xm/U62aQNKAj8v91VSWYhBVCjYhcJvBM9mXG2SPejAprOjG1/bY
 En5cjJDxUKoLVRCL/MDm+8y9s7kIwy0=
X-Proofpoint-ORIG-GUID: FL-kcHO9Jvlu5tIc8za-sv4CbZ0in0ga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240065

From: Yi Zhang <zhanyi@qti.qualcomm.com>

Add binding for the Lontium LT9211C bridge chip.

Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
index 7cfe92a8bcd7..de61bda09db9 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
@@ -4,19 +4,20 @@
 $id: http://devicetree.org/schemas/display/bridge/lontium,lt9211.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Lontium LT9211 DSI/LVDS/DPI to DSI/LVDS/DPI bridge.
+title: Lontium LT9211/LT9211C DSI/LVDS/DPI to DSI/LVDS/DPI bridge.
 
 maintainers:
   - Marek Vasut <marex@denx.de>
 
 description: |
-  The LT9211 are bridge devices which convert Single/Dual-Link DSI/LVDS
+  The LT9211 and LT9211C are bridge devices which convert Single/Dual-Link DSI/LVDS
   or Single DPI to Single/Dual-Link DSI/LVDS or Single DPI.
 
 properties:
   compatible:
     enum:
       - lontium,lt9211
+      - lontium,lt9211c
 
   reg:
     maxItems: 1

-- 
2.34.1

