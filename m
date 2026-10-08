Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BE2496D26
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 10:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455084; cv=none; b=QkyKEHRsAGom+2C6WLFAVvga/J6JQtm7s1P12UPLiagmNjMpMhXJTOopHcOZK06zM3uQoG3Dxs8XZ/PkDO/dKjB3Bu1K9UdKwqwOmPBdoFm0QXkYGijnu5gpfmSRwuxJsONo1/QFND3pFyAjxUolpBwTRt10ibwMp65OeS2Q6vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455084; c=relaxed/simple;
	bh=OubOLUD+VK3Jfwsa8xr6CTu9hQMWiPmJmFku/RuEHVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cipZzmsg2Lm+55wvqORkW/NS9cn+WFDLWOGEyJbjECpUNFiC/Pvxq+Dy5RJirFBXtQ2derFo0HlfWg8Rtxg5tbQejO5WEQUFh+oD666QVC6HyXkI0ocDXuEmWEAcauE7oHIh/RuuKMuP8gzgGR18BYfBzDJHJ9389JLCkQf6rZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nzhFO8oH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TuS0KWVa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nzhFO8oH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TuS0KWVa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K6ck1341852
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 10:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q6OZXAYBOto1MDL0E50xAmraTgP3CUO6T9Fe2JVUsBE=; b=nzhFO8oHld4oRP7n
	/Qkdlr+F/JLuGYFmi5b60hcFPr06wC3vlgvEngOHZFP3NgPHb1VSs6PIj/bnxtbN
	avrWus8Sbl4Q9KZAGiYcLHqqg9WCNzSb4cnumnAdwrHuDS7m1DHgMwsU6oTwLaZx
	qn9xnrHKW4Nf761AwX/0ZDCKRhHByYuEjYhkWytvOieUbm74YZ6EFYVdHmmUbZmf
	A4DOSRaxqQ9rYOlmdwH98FyeYT/q8z8nkJDl55OCrKRb5w+6BvPiNk+WobHmFexi
	AnmsH2nM5JllceCw+hcVSI+3KC73absFVe+Al5EIJ5cuke5y2MCTGK5Wm4XocVNe
	eCvtEw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2ten8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 10:24:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e2d4a8623bso49960825ad.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 03:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455081; x=1792059881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q6OZXAYBOto1MDL0E50xAmraTgP3CUO6T9Fe2JVUsBE=;
        b=TuS0KWVaca1KdsFRFZj+hrNLpNjauWRXiDQ49i7Kf9reCLR8OFvx1Gp5nK/0AAlb38
         Le0DiBiA9Uv18/Mc3TkcpaMc1xe6H049/tadZuOoy+JKaRL5bVYmiRr+qVUaK0gQzOBO
         4yx9QwWbMo9BszGSAi1c+ICoOfzdeb3yyTZaiM4vYQXEO4/p1KU/9TU5aKxp30K7n0se
         2wK9NkXvMQbYqw9OjwQMyV//OmIuFSPp7TcO+6HlaO1kNR+hkHNFKGKaS5TFd+BUZ4pF
         AOtCFgl2+kz4MPkfmIcJkUj+bk7yRSkY6NS2Af+DMyku1NjWIruhD6ilBZi46G47uopv
         z71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455081; x=1792059881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q6OZXAYBOto1MDL0E50xAmraTgP3CUO6T9Fe2JVUsBE=;
        b=Eq+zD6gMKnONNXHqz5lDkmEkvzTRM/46AeEg5sJTdEqZAKp2N5QHnOtHpqI1I0VhWd
         UG+ac8Adf4DCt+WKFr/ixSiDe4+3uc9UjTd9qWgmUlYWzA1KCigAVWuHuXXuqZHC8MTm
         tnE+yl/mQ1RGVhHOfbEWo3edvPA4DP0jp9KlCvYvrSZtvY87rl+pkwoxzFt27wPVxSSD
         yAIIsmZeS6fr3WQ0mVSBZT54eKnNs6wu9sx2I0TwAjsHtdHvBC1m9GBLDqcYQRF3w9Qj
         u3tc1V0gvL4H2aOQbK0QrfMlCZ8BfDn4W62wmZe80rzilv7Tcz4ROUpjL33J8as8qb0a
         p6iA==
X-Forwarded-Encrypted: i=1; AKwUvByJFBDwinwbpp9qlELV0FkLFrvGxZSdtZeQ0J2KIdLhbOav7vJe7UiUqKzz1eqRYLVpYaZdw6OsVQos@vger.kernel.org
X-Gm-Message-State: AFq9FYLBqX0gdUHK1X2MKIGY1pQsg3Q095s7RGgacjMeJx+gKXEOgbm0
	6wW3QhhZEuXfiz4fP4LkH90N3EyYtVaThsIebJeJbO6iRc3Oh8Aw4jDnUaP17W7qSwys+CUIPdJ
	Sn03qV2ucB9QgyTVMe01Zr8UQ+/XFVREe4AhyUuJ7BgUgYOXVKRf9sJuZjhVC9ljL
X-Gm-Gg: AYBFou1qatSgzjHhC/9Ykf8Jz1lfSa1Ii1mYblURwrFksfIvkCQonDF6JkBYcast2hg
	7uvevZOre8Zg74NZ3tjrUWnOqXE0wdy1kkyVxgyxJ1FVpqt4rxJzHRnPVWtAPgm7d0i0hhdHL4A
	u+d9wIV3YyovNw75KiHTKKzPPUsFDouaYgF061yXf6cPA+McdduqJWs9k/Mwiu1HoRqNVctgLDV
	vPnXhN6hdZkETu2hPnfV6xtK1DuW6WY6Dtnw5637iVWo685f4eiGeVMxOGKbTTepbUAOB1VFOqU
	GYuCM1ojtFNZgfkpaI4OrgJkLt84hc5pBV+T2673M2l7cvWJxPWZYSPkW66lDRv5SshszqxtGp+
	JxK8VhZ6dA86AolkRZH+CxNihAB9MUQ2F0sQC3TP7MXXB7DPTqZblPmWQj0slgQWcDGd4qMeEa/
	+oq1Q7xsI3coayg/2pG+NLOQ==
X-Received: by 2002:a17:903:906:b0:2d9:520c:38e7 with SMTP id d9443c01a7336-2e5ffaa4eacmr41921605ad.1.1791455081485;
        Thu, 08 Oct 2026 03:24:41 -0700 (PDT)
X-Received: by 2002:a17:903:906:b0:2d9:520c:38e7 with SMTP id d9443c01a7336-2e5ffaa4eacmr41920475ad.1.1791455077540;
        Thu, 08 Oct 2026 03:24:37 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:24:37 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:54:03 +0530
Subject: [PATCH ath-next 07/17] wifi: ath12k: Add hybrid_bus_type in
 ath12k_hw_params
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-7-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfXxWoHmEPD5xc1
 +Rl01EUy3daFwX8OXRs5Hi4iY6w2I9FwF4cGvzI0C5pZSTpC2FLcFScYRtBLJZclbyP8LSQkVEA
 FlOI3MqWsypDyYKB0oryCbd8U8q57bQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX/sP8Va21OGMA
 1vd+NHyrChNRne4KqIydqqeCTVehb62fSO0W3xtauhQ6iHqcTGEutyxhrpvX2sbRiCxtkdlT3hT
 3ClVLuzQqGpXnajfcY0AHo40FBy9VrXmOdRz887e8DCxFaJBjYHlBofIWs0KRWxc+pqA5TXy69K
 /3u5vlNRKeT4Rj4jTaa9qR2y72PKabCA3p/7qwc0xVWWtM6FTeAx8vYDyQ4x/d/2OJlfZlEj+og
 1CsHfonCTKnIljDfE+Pwh+xm3fdqhG3kvLOULSUCOSUmgkBSs1XJ4eJd6KBe4N83n+3qdy3V8X6
 iPy+BYdK2NMAuapCV3SpU5Z6JfGYqoTM2Y3OQZy5jfr0xC0OAIVvGHop3yN0tHUhvAL3BmOq/4i
 pH3CbpJ/Qsb4XQdsVC+emfpXlDUjbQsHLbDe3eo36Al793gXWPEHmBJ5DFIIGzFjrcIIROTNXzQ
 aCeFku1VDvyQXX5LQmg==
X-Proofpoint-ORIG-GUID: -jlfdxb8zPNnpD9QAY7FSbHZ8EqhsPrI
X-Proofpoint-GUID: -jlfdxb8zPNnpD9QAY7FSbHZ8EqhsPrI
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac76f6a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pcKkHHuJ4FrcyiHCkkIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041

QCN6432 is a PCIe-based device attached to the WCSS Q6 processor,
but it is registered as a platform (AHB) device. It uses AHB APIs
for probe and boot. Because of this hybrid nature, it is called as
a hybrid bus device.

Introduce a hybrid_bus_type field in ath12k_hw_params to indicate the
hybrid nature of the device.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h       | 6 ++++++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 2e585a42dd9b..84b9440b2c16 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -239,6 +239,12 @@ struct ath12k_hw_params {
 	} client;
 
 	bool host_alloc_ml_id;
+	/*
+	 * True for devices with PCIe hardware registered as AHB platform devices.
+	 * Such devices use AHB APIs for probe/boot but PCIe APIs for operation.
+	 * Example: QCN6432 (PCIe device attached to Q6, registered as AHB).
+	 */
+	bool hybrid_bus_type;
 };
 
 struct ath12k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 408844024dd6..f91279477a20 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -497,6 +497,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -592,6 +593,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -683,6 +685,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "ipq5332 hw1.0",
@@ -768,6 +771,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qcc2072 hw1.0",
@@ -864,6 +868,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "ipq5424 hw1.0",
@@ -952,6 +957,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qcn6432 hw1.0",
@@ -1036,6 +1042,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.hybrid_bus_type = true,
 	},
 };
 

-- 
2.34.1

