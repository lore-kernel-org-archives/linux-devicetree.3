Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4284E39184E
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 10:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989546; cv=none; b=DH/zDk2MwMPHNfDOfD40c9kmlmKZ/QY3y/uoiFuF7ltayUFMwKiS7WlG11YHOjtyadVc0d89BGs8/E4wIIJon+sKE4Sd3N8TR4fz/npFoJPuWgNYdNPX1NyMiDPpTwr7GXcmcMCq14REWP4bA7WIcUbDZ9lq5uyQAjvkn/VN82k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989546; c=relaxed/simple;
	bh=lTzm+RHkW9j177LvbtPEKP5emH9PUg+jTyZyRS3hmUs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UHtRYbb39gb8Tg1tl75ySFKSxxOHHqiWiArdhA6e8Fm28wvPplPE+Gqx5c4Vapk/rj73iqvH9teJiBtmCXM25pVgIPXetYU5jhri+1fRuJ+6o/S9IO2ZlHqNidMJUuKZkXcZAGZtt9PLJSU3r8rg4+GyGEy83nvSzPxTtz0uEEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I3J033CV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GiMYjv55; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I3J033CV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GiMYjv55"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629nNJ74139472
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 10:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZgKTpRlFAg6nA6UXLmxi6T
	8YEFQ0w9nVSTQgPrPz3Zw=; b=I3J033CV93bLmkY1qKWANIpHPZVOOrGFaCp6+G
	aI1YhdeV7HsbDGmW2wj23cMta0jYOFP/tzpvRntfBTf7gTEGOV2elhsdlSYzJbO4
	F7u4iRNulPizWvyFNxgYOtaLfhGxbvHanuK80BStXmHqjZmYOvoS+fPZyEb/zRWO
	6/i+vAZCWC4QE3md0fpEM7/v/V8uW+julHSAlnobH6938mDymfuNbwG0KsOc9tMV
	ay2sr1VWgej29l5Ne9SqEpIaEOh6Xc2b83XBW/edqwIofaMl1FdQHZHtBzfRaA3I
	ZkL9EKvwbpIB7S56fFApB5hkhJbPRFmjF4t3kPiNYJU/RqCw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5npr87b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 10:52:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92d1cae5740so213813985a.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 03:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782989544; x=1783594344; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgKTpRlFAg6nA6UXLmxi6T8YEFQ0w9nVSTQgPrPz3Zw=;
        b=GiMYjv55ggLHOPU1s5sxvLsNJGwnCVKqSvAwbVcUH8U9/gfVuNPS5CRXIhzEqws6NK
         H5KO1ufVd7ViO9dqkFG9F2hN1YrLpGKqM/eNMcrEBDCft5tSCt9oZSDzWZhVTI89PF6N
         uc5FoAQ2UC00kj/cR+BfBfLb1zy3ywvxdTYywfVVOhBSgp6u+yhXInqCg8n9wFVJqG27
         ftuLVjE2TtxUwb9TrM9Fl8miW6ll26xdrY/pDNUPevbvxxoktdEo1giJQRwUTN2J4kGA
         mp7bz+dRUFVdsDos8Be2Ldzj+SfQW1oWMHH7Y3bbxwc+hybB8MmX0JoPQiR8zID1InRO
         /puw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989544; x=1783594344;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgKTpRlFAg6nA6UXLmxi6T8YEFQ0w9nVSTQgPrPz3Zw=;
        b=oQuJSUsZsJhURHlYc7VCiAjM8L89Czd0NbDKEjdNfNzdrZRdLwSm0xkPV9LJckuf+o
         qM8LN4AY4x5g0U4daOQ3JvU1ggL+h5Nqh54Lu5w6hR5UU0xjIMQgUuuWUnnV7VTWbELt
         D4CUHRT+Vg0fB07fAJgKvmBWtiPv0wS6ZcplnOozZ/6NAsdXfYqU3G/oFRXWRhLhRMls
         8PsfBxKY4XDMG7LMMfyIkHaW8TpkGHiCh65kVLLSj/cthEJqseYN21YXwHwetm8hyfWr
         ZE+FExc58P+8YbwVAOPohfvt3cA3gN3iI8AtI4woOtC/qGguKwQUB7CRTdqHUflqIS70
         kzBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+oAWt2fr3OOZgxXYGu00Fpbmu7chR/0MPAELbSRHPXdXI6iM9hLznq48efUZPA1UR5TFJcgKlL6D1T@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Mpt/s6utsQ2Fqna7e9XMfakrF/r1E4+6FRjs9jtpc9xjtET7
	Betn3S63Ce7Jghe07c5rd9B3m5z9cJnnFCgEfw4CIyE/Rac2mLKjZ/Q9N4z+d/P0W3ZtKtjLN/e
	KqExIS7hXgilONVp4wo02Wa0x3AtGF+qD49s3xhgHjmIj/5rfu9XcHxD/0Pw2SlqR
X-Gm-Gg: AfdE7cmR8LcAyXCJRWwXWrR1aMT5sJRg6Z2dd6PmWGE5YIJVHCroYrKrzENBCeGy0KR
	J4BJlJFHE1sTP7mo1Oo9N6BKSgVzStDeJRpxcw9q+quboQVnbwiQ6FhVFRaL5/XxPRsc996P+ZQ
	x1crjNfM16nrY6bVov9gMZsmBzGjazx6gjFATxcqwtqArk4LGnjQP0Vn58Zn1mganqeoTkwEPv3
	Fa8XXPuQNWd7gaMIevP+V/HiW+dYEeU+cuQRZoxGPBzUtoieNcn0225xxAAvnawGxMHRKZI1PQI
	R355wQKFR+UoN9PLePRXvOnDDPbGzGSV2G9g5AI/JHg1o+qw53WwadtllNOrp9+sC8msM89R/is
	+7maOlXRl3fayVzev3VEIfkNoKR2DyGi4xBTf0+8GTIA6D8J4XeAOF5RtexufAMku1YkHnbIY2L
	oReVY=
X-Received: by 2002:a05:620a:46ab:b0:928:f440:2dc7 with SMTP id af79cd13be357-92e7b3e8706mr613627485a.35.1782989543527;
        Thu, 02 Jul 2026 03:52:23 -0700 (PDT)
X-Received: by 2002:a05:620a:46ab:b0:928:f440:2dc7 with SMTP id af79cd13be357-92e7b3e8706mr613625185a.35.1782989543084;
        Thu, 02 Jul 2026 03:52:23 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e80025696sm193565185a.19.2026.07.02.03.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:52:22 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v2 0/3] media: i2c: Add OmniVision OG0VA1B camera sensor
 driver
Date: Thu, 02 Jul 2026 18:52:05 +0800
Message-Id: <20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANVCRmoC/2WMQQ6CMBBFr0Jmbcm0BERX3sOw6LQFJhGqrTYa0
 rtb2br5yft5eRtEF9hFOFcbBJc4sl8LqEMFZtbr5ATbwqBQddjJXvgJk5Yk2pZobIwmQgfFvgc
 38nsvXYfCM8enD589nOTv/W8kKVBYq4+SqG8QTxcfY/146Zvxy1KXgSHn/AUKqvjQpQAAAA==
X-Change-ID: 20260618-og0va1b-55bbf3cabb0e
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782989539; l=1179;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=lTzm+RHkW9j177LvbtPEKP5emH9PUg+jTyZyRS3hmUs=;
 b=3x2O8GvcvVPCfOnIVSOPLJxugXBxm9ekz2Cxj4c9ogQNIuJ3jDs7gEQ3lLpkOmXDuUF5zbm1N
 +U1Loz8hpGvC4HYPqWace2Eajx/0ZvzSZQ7jChcL18KOHKJToo5BJzz
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: ToZ_E3OFLS6gsoGjaWumqk2QFBQ7y1QA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExMiBTYWx0ZWRfXz/zMGAInSOIP
 MblTcZ+/w56yqLb6TM9BN6ogS8FjuAVUNWcINyVPxaG2/8pkcu0xsHKW8yLy5Zm8SzfF8QrfGzq
 ci7RURwSgDxbBur8oHDem7U9nL8F4rI=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a4642e8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ah3Ldef652LsWuxVMjIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: ToZ_E3OFLS6gsoGjaWumqk2QFBQ7y1QA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExMiBTYWx0ZWRfX6lUQvIl6lzQq
 uCuf25Ti8e3SNG79qiIBKxVsTgEjkXXqE3PGKRH3Mye5zfmDwel0E7KO9oTP0TBB/nXu04SCREL
 FtU+bKJPDOL9jYP4QRtAv/b0oqPVjdSrcgnf4zBkMBemWpraC6+JeCsK2lid7AG5RruXpi5mspi
 sSgjsSRuEm+HvsdfFADpEztGgpTdn1CPo7fFPefeitfJpgNloItujstXtElXRB4VSkYG0QAnOdg
 anH3Jh7znCpM3pETIZKfUncmEMEAq3zeTts/wonqDq/9TsGgAKHxHFbeDt7LavMBAfliYU9+3YR
 bfkyps50MYf+HHQW4pWSmrJNdakkn8jnd+85SYjRCU+/MveLVseY8BPdmWlfYnuT5zYzEER8N85
 qvk089TPWC6CuSqKzdWVobVRGkjElIV/x0miomgMRipJulYrQbJsCit2aQcmI7xV4Jm+HZ6X+d2
 +PYbVCQadfk3J//iGPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020112

Add OmniVision OG0VA1B driver support. The OmniVision OG0VA1B is a
1/10-inch monochrome CMOS VGA image sensor. It outputs 10-bit raw (Y10)
frames at up to 640x480 resolution over a single-lane MIPI CSI-2
interface and is controlled via an I2C-compatible SCCB bus.

This driver has been verified on the Purwa EVK.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Changes in v2:
- Integrate OG0VA1B into the existing og0ve1b driver and binding
instead. -- Vladimir
- Link to v1: https://lore.kernel.org/r/20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com

---
Wenmeng Liu (3):
      dt-bindings: media: i2c: og0ve1b: Add OmniVision OG0VA1B camera sensor
      media: i2c: og0ve1b: Introduce per-sensor data structure
      media: i2c: og0ve1b: Add support for OmniVision OG0VA1B

 .../bindings/media/i2c/ovti,og0ve1b.yaml           |   4 +-
 drivers/media/i2c/og0ve1b.c                        | 333 ++++++++++++++++++---
 2 files changed, 299 insertions(+), 38 deletions(-)
---
base-commit: 4f441960e691d37c880d2cc004de06bb5b6bd5e4
change-id: 20260618-og0va1b-55bbf3cabb0e

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

