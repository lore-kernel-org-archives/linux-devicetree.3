Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8B732ED24
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784261347; cv=none; b=m7VCcvWqeZWs2ZBlTsZljeKnHj+9MKqqPPyksmov0q+kPEXI3zHzxN8vp6ZypFNnw7ZOpY6MUyOJIqhcKhzv+ZSFDuMUjQJWABB7k9/UBxRZ9Y48qdqU4oPLbJqLEc8piRzE2JSuhLcniBsVkUoQh6TpXExnV7UIp5cW/+tOCvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784261347; c=relaxed/simple;
	bh=eBvrZKVNJyd4PmFzEVVQm0HmaFBXmH0vMMlCmBYFAAU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pwYOhuQOouEADLCQbysfmH+T4sfhczAdtosMBwVOabhyM8tbG21TtMmc/d4n7Z0QI9Oi0VJlYuc3ZYIc+RXkFOLKcksUQBNM4PPAsdH1h6SJ62oa2k+b7YOzdQFUj1yYlTQJsCr2jvRG1y+yoWnQyu7yf4rN6kWZX5Td8XyBnq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8rvX8tI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T7BukGtH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X8rvX8tI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T7BukGtH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33jJM580787
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vxrm/aFE3xHJ7o4WG8vDyd
	uGIi64kgQc2xs4Ru42Cyw=; b=X8rvX8tI9Wa2OAA8z+TP3bWDALukocawBRd5eF
	ZmpHWbOh/Hqf6SVBfu2zbc2qXfE9P5MTYQo1+cjR2Emxt9NR57+4ltsWJD/Gx6Wb
	C3OjOV8O3fu6/Pro5IkcVRaqOS0B1nBs80xQdSo9OhFMKVZNMNRHURjcgtDT5hSp
	5zMP1Eb/Y5OBNl/ajAfBD+YZTeXcuOZXEwq7k4Nja4LEfQMyS9zvHPRkc8habjjp
	h7vNjMq1595xIGguroRAGvXwvgjOukVs03qrokiRrc9gb69SXCh9cUe0YIcdbRTh
	Eqx2QePLFZNP9/v8INnWHSwzKUSW2Tr8QghMDI0LaRrH86vw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffbqug8vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:09:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92efd2ca21aso32656385a.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 21:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784261345; x=1784866145; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vxrm/aFE3xHJ7o4WG8vDyduGIi64kgQc2xs4Ru42Cyw=;
        b=T7BukGtHKiE52p6wCboHzoz49dKoHChH1p0R2GBuZhFE1Y7C2QujFsUmFRW7bZ6o8J
         G1DsV+GpnQSmkEYYB8CPYVfBtpP8OHCfChlabehLUmig3l5kbsr9HdUv4rWB9S6EVxKU
         6LzIuB3k+ZwlTTupxaglxwAd5APzQHUUx1ZHSkf0d5oycbIRDheR4LWKdcDnuRqo0B7F
         3+h3dygXU+wd+IZhjAmSBEKQSpiVtZzQSRc8mQbJagTNiLEzmt5o9P9bmp5QmrP7BZ2i
         Uwu53BH5/zIfJa13mLch/xyDihsqDoe0WRcmyerTfpYFO+f5MNxLDosjpA8xVXqSLlR0
         prQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784261345; x=1784866145;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vxrm/aFE3xHJ7o4WG8vDyduGIi64kgQc2xs4Ru42Cyw=;
        b=b/UKPZGoGnxsEtNMtAEtuywjdiIpSq+o4+DXnQs+mBIbBjpMI37ls9XWYq8osNwwZS
         UEfw93Z7V2gssnH9s+Cn7+KDtXTEKKE7XW4epHjCaEZGoOyJDFKirP0Hx4phNDWgIFZ4
         PPkSPo6HBZKmAE8Rpu2OFAOqYAASXr9xnQePOS2DO3Yilooh6/bughCXz6H3wcK7Rxj5
         EC28aWpoJaK012m7esIsnjMG1qnJ1fUuH5aTiVyU6aiTHG8zC+qOevtXDgqfabE9h8AS
         e7wo24XLsY3CI2oLC5jG3Yg6niepu87ZAMfPXDNnF3bN/vCd7qZNiEayYcXn+KwvqpT8
         pv0A==
X-Forwarded-Encrypted: i=1; AHgh+Rqzt9m0n0wDVW3hsTo4atP/Ve5MmP4QJ4cKUrZMzJk4WU81prP/VExiitLQ+U9ehFbrdbRsVnXEYr4L@vger.kernel.org
X-Gm-Message-State: AOJu0YxQSNg/auLuUJ5AD8M1tS4sTzJShf4XVQghoTC1O9nAhv04MFsl
	Z0pl9YinwUwulUlVONxG4xbjaYGAT5S7qLyVQzMPiwiDC6BrrP5ohY6bnvxYK7SaJalhA92TsR9
	tcs8ky1Ktnjv736htqg7xGZBxi41TjoekiHGsIl4Jr8A4GWD4FxLiexMqxDVY0vl3
X-Gm-Gg: AfdE7cmQViM+tDd5OgvKj0GJwCRvlUAvboWz4Vr0IOq53n2SSsB879OgkmRMxs7Cy77
	oKI0mNaPvaqSs/Cm6enWlF0JTr+ff2R8DzwqtJDvmdu48RjXkoLZnT1BKLDVGBDpcexvzR6I11D
	ajx4PuDPzrx0DmZcaM8kq5AoIN0AznUPMuR8YxqS/Dmz4qW4gBy/oXcz2B6M/d7QDFroYBopsn/
	BbeI51uyv74Jv+EKNmxGk3Qt6+9BW//cKuVth29Ku/i9Kk/zzsR44FCM5tw3xc0TuIVaejeYBt1
	EYfBWPfs2gJLrzX9df9I780AZMJdpbStGzk5CXXxvD+D4YGlqLxbjl8DyHzBUDYcaUUW1fzwPDU
	igY+3N6T7AOcg8YZpyeAmdjYGMYAef1zu33wJI1+5VKgFcnU33/gAC/eQHy+9GvMnf6hJ
X-Received: by 2002:a05:620a:46a6:b0:92e:51ee:7944 with SMTP id af79cd13be357-930b3ef6142mr118286885a.34.1784261344720;
        Thu, 16 Jul 2026 21:09:04 -0700 (PDT)
X-Received: by 2002:a05:620a:46a6:b0:92e:51ee:7944 with SMTP id af79cd13be357-930b3ef6142mr118248385a.34.1784261336391;
        Thu, 16 Jul 2026 21:08:56 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545e47bsm52313485a.35.2026.07.16.21.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 21:08:55 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH 0/2] media: i2c: Add Samsung S5KJN5 image sensor
Date: Fri, 17 Jul 2026 12:08:35 +0800
Message-Id: <20260717-sk5jn5-v1-0-da610d7fd494@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMOqWWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0Mz3eJs06w8U92kVBNjo6RkS8tESwsloOKCotS0zAqwQdGxtbUAZL1
 aL1gAAAA=
X-Change-ID: 20260716-sk5jn5-be432bc99a98
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784261332; l=1250;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=eBvrZKVNJyd4PmFzEVVQm0HmaFBXmH0vMMlCmBYFAAU=;
 b=g7LZRtuqStKdbaXnj4x19O2ekECCjfDmLbix3keuj0ixDlTm7wd+jKf3MpYv9WhLrbhBF1TsO
 W4LvzfEgEk3BF+ioGnz35NyXXlbwoI/MUWPYgTVp8CqqJAmJmStrsBd
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: fbeoEaKw_u9Ew7LJMMQzFohpIxNSzzer
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAzNiBTYWx0ZWRfX/BSTQUndseVB
 hScONaOJO15GAxo3HYmJmyFdChRR4kcVum0svJwbLGiqC0KNu0S0ZK1k1cAnpm0WwbWxZLDwJ1V
 szm3hT3uwy1WYSGLfNyNtU/6aqCrOMlY6KCvtxXftvdF0g2Bi7tT2muexj+A4eVlOl+inViU8Aa
 EWznegCgh0AEpJUflDx7Psxv2SZS9aVZI5SUzTm+ZTIniz++1b7rMJDpf3bHON9kY9//BFPlT+F
 84rEaaSM6YscoQxAmXXtle1Y6iM1vq66oL82jWTZZ30U2gnyD/b9TfHn6LnoQht/SlWxJ5JofWW
 u0+zr1A5ooCgSAsulEa+iFwhuGhONuJifzQgre+o/bwNooQMOW5G4JC0RAK0NCH/WtQjriINF6A
 4TA47UScswt8ZoSt3H91IT/zwtbc0+Tirvl8PwUyznjLYH5n5C080AAcfJvZY38R15pawsdXQTC
 CD/72Kh7ruEYoRNxdaw==
X-Authority-Analysis: v=2.4 cv=NZ3WEWD4 c=1 sm=1 tr=0 ts=6a59aae1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GrB2XQy3GJ6Uwl-dXtMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: fbeoEaKw_u9Ew7LJMMQzFohpIxNSzzer
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAzNiBTYWx0ZWRfX6PH5f1Q+vKSv
 EtOE5rKQaZjQAtKkeOs6hERsAirHdDv1mKtCGZYUfgAowoKDZLY1I/BeCA9wF15MWsRZ0uguCJ+
 if9TSv0OAQVIEZSQLOhN8MkFh+8whBg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170036

This series adds support for the Samsung S5KJN5, a 50 MP GBRG 10-bit RAW
MIPI CSI-2 image sensor.

This is implemented as a separate driver rather than extending the existing
s5kjn1 driver. Although both sensors belong to the same family, they are
different parts with different register maps, power supplies.
Combining support for both devices in a single driver would result in very
little shared code while introducing separate initialization and control
paths, so keeping them as independent drivers is cleaner.

Tested on the Qualcomm Hawi qrd board.

---
Wenmeng Liu (2):
      dt-bindings: media: i2c: Add Samsung S5KJN5 image sensor
      media: i2c: Add Samsung S5KJN5 image sensor driver

 .../bindings/media/i2c/samsung,s5kjn5.yaml         |  109 +
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   11 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/s5kjn5.c                         | 2835 ++++++++++++++++++++
 5 files changed, 2964 insertions(+)
---
base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
change-id: 20260716-sk5jn5-be432bc99a98

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

