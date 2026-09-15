Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7C947ACE2
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464895; cv=none; b=EjYD1iOegvsvz5ski5gbC+58vWkFiHxiT6UcmlvG+OlVmwqKolmqEIEjHXeUWc8rBI/4/HHr3qgS3ZPQe5uGIoXFhMHmHuUv2bWgGZejMpi0k9iLUvELkmjD1p1s/yLCGA7SBd1gc+liCQ2frXk61USf6QpcMGv07Fhgdf5DAdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464895; c=relaxed/simple;
	bh=OSz6slksdIAoSzgmisjbvzEKnbj2o8gL8+vwRbByiik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JpHOv0mwORgcYZxnpuOTbjnh0gmoprNygIpdW1s7nr7IwMvhjMSyaIX9JO8CZDBWKvRFuxp/E+Iz2gyqSVrrOdP1vnMUzqbJHZ/rGlbmZiYhQHMR1g+qE4/V089OcoQvi5WU/RdjkBm8JOVbkIYYQNZQvk3j5HyD94sFMoP3IpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nrkmyge7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i4re2toR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nrkmyge7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i4re2toR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Ys744048586
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GtH2QxNxmmEMFEdaZRJ4xZn6e0M0SKZpckqDapyPseE=; b=Nrkmyge7ELvAg9Rq
	EZb9IYmm3ElvDzPi7X6TknVXs5VesFqA33aI+BMl8JLopDY6Tunjycz8Dabz+d/H
	v4lPNkHmVwTWo7eLbLpTIbhWVx8dNKYsUmsdLYmL6jLPAUqTFUqcQM+r+de9Lxrh
	FmBEOyq+7o0+n5+HtYNv4nBqi1SRAoXDhhC+EzOX+NGLeP0FLDaVgb+EuyJtZ7xQ
	oVarFTj6ZKJpOSyLdEJ20Ak9CzlMQB4Zy+wNBDUPRxDlrW7ukCint2PUZw/l0RoT
	YgWQYabwkxUAKT/scXeKAdbJipaBYfGC3nPFrOqgPCWFRt/d1TASd6ML4in4CezM
	dClYBA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyea12v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:34:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a00c70d28so469763985a.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 02:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789464891; x=1790069691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GtH2QxNxmmEMFEdaZRJ4xZn6e0M0SKZpckqDapyPseE=;
        b=i4re2toRBy4AMowcNoMrpcxpipQRllqfc0P7Lvg8CCtmGlEKK4Cz9qiTx3bOgVh39K
         KiflFRPS3rpNyg/DS6zSBMcXUuWJtjGUWxw+FgscSRxDbSMLY1qoBb3DJ2D+pCTOrM4o
         e7A3zcZSbhGVzncvn8LFW7Y3J94QNmsGxZz7+KWqBekRZLF/erYJqmHX4cS2A6rc7ltw
         xWkehN7J6l68zCL03dzwTXbrtICmepW5l8kuMK99JRwRtg00I6rOYfmFjm1+Y2uK444S
         3XW1/Ro2erE/Z7crLBc4lu3Xv10sQ2KDlkx41LOO5TffECeSkoAGLM6kjN8ymPyPGFVs
         GCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789464891; x=1790069691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GtH2QxNxmmEMFEdaZRJ4xZn6e0M0SKZpckqDapyPseE=;
        b=xzIwxOP3agbb/+qhpIwhLvW4zeDNCkPGPJJ2eLqovpY2fC09HmGVyaAPOGJKYLDJ5R
         41HEDY1loGK8BVNlvjj8blgAdo+Xa2qVjlmsuq4q7/UV7f9VKapOCoWt7VNCGalECUJh
         623CvL9EtsUr5REMOSHUPB7Yuk1hWnX624LuKEzqd1+oNGMb1w/Jwxa7jcrdinF+F0P6
         J9kxAYXrxZGyqCzLdhyaHn2LJ0Rh0Xqhw/DB9mlHoj8HkweCFf1DUuZu8lExl+qP2SGb
         xo79xRj+XsHKcxgkZ+vTCUXOe0+ruUdo420e8iZEFDE29Aef7FbPvSWkVFuRU7w2a4+k
         VyBA==
X-Forwarded-Encrypted: i=1; AKwUvBw3pKGoZorXLoQUL1hJwc7FM9hfSxZD53oHe5Fb5o37YepCL4NGRQk5PiQh2mM6BNNpCok2GVqGDjcg@vger.kernel.org
X-Gm-Message-State: AFuF++kJtn3jYuLvRkNmIqFD5EpTHAMaSWEDjsCsfqanZZV32KIjNK6r
	2PM4pI4oJvhzVF2bQ08cAero6xje9asHQKWyYP6EjicGC3xeTlb3XrIOOfqHqz2bswg5yw3/vIE
	cV67Zws2C2hHogN9Pd4L1jpe6RhNzunXOAbYmv8PMVIZX3Hy9JxvKWUNQ4d/Kp3tR
X-Gm-Gg: AYBFou17wNxAqM7Kq6QZZzMO8lKU8+dHlCEYrG6riwa35izPcEDV1P34BfaMGuwa1EP
	t3n4QbaG4S3+we4j/cBOC8+0j2hOAjri2s2pYfE0zEYpSE3NBs2V54uxNlM7fnJESykQb+4dU8A
	DpRJD6EvztlgpHQ8vmcRAfjaLFr4pkUAepjrLGCu3Tr0InQkSgtikw1HAgmZRIg47t4sTA0lwBR
	IFcr/Vg8u54sGn8Z6N7ML3MWW9gM+ZoWUltzd6ip8s6QdvmMkLAcc1SVslx/Tp/PmuoDwHB1PHx
	BXbloLxiQDKI/c4MPzC+U6OE5921uHOSDvEZpFza2Ex903Y0cbiwiYU93n6VG+bS7m91WScZZXA
	4rwlfkVyaWKESYJyM41WgNl9L7fyyrf9t/BkyKg/O6k8UuMc5HpxrgWDy8qP6nvFz8xAD
X-Received: by 2002:a05:620a:1d0c:b0:93a:1b82:4962 with SMTP id af79cd13be357-93a29a39ce8mr907219785a.47.1789464890715;
        Tue, 15 Sep 2026 02:34:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1d0c:b0:93a:1b82:4962 with SMTP id af79cd13be357-93a29a39ce8mr907217185a.47.1789464890363;
        Tue, 15 Sep 2026 02:34:50 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a26921baesm447229985a.24.2026.09.15.02.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:34:49 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 17:34:15 +0800
Subject: [PATCH 5/6] media: qcom: camss: tpg: Add support for TPG v2.5.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-nord-v1-5-20db41a7f1ff@oss.qualcomm.com>
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
In-Reply-To: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789464860; l=2550;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=OSz6slksdIAoSzgmisjbvzEKnbj2o8gL8+vwRbByiik=;
 b=svOSthiaPLI7WPtzxH7/4SGIVTAaZ0rAoZ3WLtiGdemaUdD4z7/l604Ra4X1TiyGnbwOljUWE
 hZ5xhzaTLPgD4CN1qnY/kBO5TSopPXTsSXc+0Ghvf7stvSaRDcLRMwV
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: _FgUUQIa-NUWAwLQiqzaGO5Uys7_Je3i
X-Authority-Analysis: v=2.4 cv=cehHPXDM c=1 sm=1 tr=0 ts=6aa9113b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kKMPr9q_OXaYOzBTrtwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: _FgUUQIa-NUWAwLQiqzaGO5Uys7_Je3i
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfX1qIMc3kkd4SL
 3DzQqTs5TkuhtFH9JX+b8PRgKw+ebRDp8A8qybbjRkCimJ3bZatvUfjHbRk0W+OHiPtuTwf2qIC
 GPXuOCyf6tiWXVmXkAYcut2QYfcED7M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfX/f8RmpCTAlg/
 lpqr5I5vt3hWzkK2Lb/uppxpfwB19UtXN+GsxXJVA7/qVxfZ7oF7JXVm6HAq+xvX1XI81BswBeZ
 wBwTgqMhkDEKf/goy/bgZtQWgBtX6sxQgPMiGcLkL1uGx22I6cmZ6xaNYizJu3DJrhWGv/8Vy4M
 BY975mDembqAK7Ysg6E9l44OCeS7+YseSVa8ziowNywG/4D46N+sp/aEv6RCnAyWF7AhD5R/2BK
 9A65vhVjbIgJueV+wDpo/x8/h7tSCYZp6FsZeUG00/3G+Qu+lV2Hrs+aJpFpQAGRgmxumiR8Zkf
 V2caUaTT1iuZ7Geaw1O/Ofw73iglVgjYGRX5PgCk0N7KqIfZRO2tqOIBmzeYJZDLP1cvAsuKeIn
 HHTxXhGBP6mnIAvfyTOQFWohw4pXvZK4ERkjSc3V05dnpyPAHRmIz+XyzUxAotUz9kiS4NMe5FL
 kD6SEW1UmhAIdsUIW3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150137

Add support for TPG v2.5.0, which moves the stream enable bit out of
TPG_CTRL into a dedicated command register (TPG_CTRL_CMD). Branch
tpg_stream_on() on the runtime hw_version so the generator is enabled
through the command register on v2.5.0 and through TPG_CTRL on earlier
revisions; the reset bit is unchanged.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index d29de5f93c18ee3c1778dc0626e8c198f354eb1f..de7ef5b8ff5fbd22e5659e5c896c5484a5c818b0 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -22,6 +22,7 @@
 
 #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
 #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
+#define TPG_HW_VER_2_5_0                TPG_HW_VER(2, 5, 0)
 
 #define TPG_HW_STATUS		0x4
 
@@ -33,7 +34,14 @@
 # define TPG_CTRL_OVERLAP_SHDR_EN	BIT(10)
 # define TPG_CTRL_NUM_ACTIVE_VC		GENMASK(31, 30)
 
-#define TPG_CLEAR		0x1F4
+/*
+ * Command register at 0x1F4. Earlier TPG revisions only expose HW_RESET[0]
+ * here; v2.5.0 adds TEST_EN[4], moving the generator enable out of TPG_CTRL.
+ * HW_RESET[0] is unchanged, so the reset path is revision-independent.
+ */
+#define TPG_CTRL_CMD		0x1F4
+# define TPG_CTRL_CMD_HW_RESET		BIT(0)
+# define TPG_CTRL_CMD_TEST_EN		BIT(4)
 
 /* TPG VC-based registers */
 #define TPG_VC_n_GAIN_CFG(n)		(0x60 + (n) * 0x60)
@@ -164,18 +172,23 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	}
 
 	/* Global TPG control */
-	val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
-	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
+	val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
 	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
+	if (tpg->hw_version < TPG_HW_VER_2_5_0)
+		val |= FIELD_PREP(TPG_CTRL_TEST_EN, 1);
 	writel(val, tpg->base + TPG_CTRL);
 
+	/* v2.5.0 enables the generator through the command register */
+	if (tpg->hw_version >= TPG_HW_VER_2_5_0)
+		writel(TPG_CTRL_CMD_TEST_EN, tpg->base + TPG_CTRL_CMD);
+
 	return 0;
 }
 
 static int tpg_reset(struct tpg_device *tpg)
 {
 	writel(0, tpg->base + TPG_CTRL);
-	writel(1, tpg->base + TPG_CLEAR);
+	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
 
 	return 0;
 }

-- 
2.34.1

