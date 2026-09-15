Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF8843F8CB
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 06:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455267; cv=none; b=QF3F8oe2BZPt7NCgMjnw3hSdGFOrfMqg+coQpRl4auVik7TF4cCwsOWStztNWC9Sa7+zpi31d2hNoOyNzwBNf7AgKK0BJvMS7BYHMCAN3ym3Red1Kj4DOq9C80kZvCpc4K2tIFnGSck9dbYS/Snyn4sCxy5CBHfV+0UorPFh4n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455267; c=relaxed/simple;
	bh=7N1fDIuarqPTR/6RVeBVlry72Nre/4Z6FugI2Emz3TE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TwZNuCJu8HzqVpNDK7JzUf7KmzqQS/ZKjCkdt7o5v65J5ROSTEfL9so+kCwv7HH6alcVoCvZnykUwj+DFwlqEUrA9NW/piJHWTq6GQdtIq3gKb+awzZnz6Og003vWUvfclVlDaKAH5fbuoNuYw7RtXRVO8xdB5JvL+sIbvt8Mq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kcyHDBko; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E0PKfJsN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kcyHDBko";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E0PKfJsN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZYm81661638
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 06:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rmsELXixNwMoSq/ZBYeh9j
	muCO+kub30umsD/3z20Ys=; b=kcyHDBko1wpDHXoUradbytkbyNbpEXEEU/qFVp
	VXbjuHyw1zpwe7YkLS1g4Bp1SUQy6tnz4SDkr9aH+Qe7t9PY7K06ulq7FCR+2srH
	BcWaIKAhEsUyHTvP/aov8GhUzQP6Kn5DmI9IAS1gQ3N2FD/NlMa1yZ8DEZFp0jD7
	WmdwQ6/LamkVqGqT3bA6mNoSaobkFw3XDIzoM6xsNFYvOGBTX07Eg0KJIG+B1ZCf
	5YxE40pBfDMxP2plnVPphmBtDAHcvxNdlCCQSBKRZp5/bZRroMPeW0hsGptCe2gi
	sDagyZ2QWOXIdKowYnUm/BheRpAr2RzRkMUyi5I0HWH/q60Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpergccy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 06:54:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso3011000a91.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 23:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789455263; x=1790060063; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rmsELXixNwMoSq/ZBYeh9jmuCO+kub30umsD/3z20Ys=;
        b=E0PKfJsNCoYKckBSt786954F6C6QXmx7SjvFFMqKJBzFNzB1fTrHEfvHEl3oPE8b0e
         yHmQSmiCyJMqBC9eopFfxPXFJPM61yxoHBcQpGBFXIym8nhb6rgQF23kq8yvfgkiz6YY
         wuQKFSBEBxqyqZ5wbhJN0ciKxomK+bvDe0jRY14kq/O+NSTWetkawjibM4P3EoR1Riaq
         UPfplhnXxNawfL2TfHYpk7JddP0fq7NPRgc9tbJCQ0v8CxHd86UTxmoXYp+MRmRdjjwF
         Z+3I9mj9Ymvd/Poq4YclnhYYG9AMLOog7UWXIK1WZ3fwybDM12dat6y7cnP/evDYMIf+
         A/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789455263; x=1790060063;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rmsELXixNwMoSq/ZBYeh9jmuCO+kub30umsD/3z20Ys=;
        b=y1GRw7kym2O5tFsi2BmhsvjYpg9ZftPwZxSzkl4lOSd60wEBP4otKvfb/wKlFUxhFj
         3yiDUm+f6dMrtx/sgeJLC8eLBR5wNd+0ts99c+ZYkbkr4G/i07cG4vU1OdosQAj5kH37
         TlvBDPTUq3nqV99RjkjJ1qnTZpQ4qlQGi0rMDEr9JcWfhOSruu4s1c8MZfp7QyMbzIs8
         Q4jehRs+/U/jjFGZOUrfyOYlPATsMdhk1z1di4sCt2hKDU/Mh8quUXxJ+cYRsMRv1wXv
         rg20j/nekVfFRHwzPKFuUARScNnB88SYk1Let0QfUxZUFFYjGMlBKMQCVKxvDoWK/Puc
         79EA==
X-Forwarded-Encrypted: i=1; AKwUvByWlN06JVYVT2u28W5NcmyCxc/guZV8WQFKRWaZWGzObkZ56xnnrUNpyMikZkZzOeknl6uwJPQShC8w@vger.kernel.org
X-Gm-Message-State: AFuF++kp3Pd+OYBx2VhCXv4biXBu4OIDBK7bk+QJKSLDVIYdK9HTeL5o
	P7qqECqTLm2zZH2CLShqu7ZDdOkQg6ulzpGfpDa50ZDjtR0QhvDxUkCQ/7G3p+v8dPq+ByHq3eS
	GecTi3SnIg5b9hZstk6hGBBxN+uPGdPCV0mVvhNUHwlErUcL2zS0oW1EWKm5FgbjF
X-Gm-Gg: AYBFou2uaEnYpLKUN4xIOBXYhdL/6FL6uvcloNgSNyodVLaVqbcdJ912az7b6CAZyS9
	r0mJAIQR/+ILq1v4tWrtaqCJzGOyedXJnjq1fhpx6eZv2u4OTIuG/bO3PRrpd51thQPx7BkFNZm
	/OcB7SXrQ5iEWDq+SBVJs9h00wk0r3fDVFm7/u88N0ELeEJQ12yknwaa3GyteJWKABbNi27N2qX
	ILhkJghRf7WBfWe1ZrOBTqptPXpyvY8rRwMv+ZC3LE41kPAzVFL62BsXtCwxL2Dv2YbAGkqGu/d
	4d3mkKtNd+M51aXM8lPdbrVwyJ9Mt8nkvA93L4WwyqW39B0lZtIRmaoknltIZZFomdGBAiGP2WB
	pQ8JYXw9BFbapNtpFDLXGrT/P69ZXUO8C
X-Received: by 2002:a17:90b:57cb:b0:39d:f130:f8fd with SMTP id 98e67ed59e1d1-39df13108cdmr12118945a91.11.1789455262887;
        Mon, 14 Sep 2026 23:54:22 -0700 (PDT)
X-Received: by 2002:a17:90b:57cb:b0:39d:f130:f8fd with SMTP id 98e67ed59e1d1-39df13108cdmr12118885a91.11.1789455262407;
        Mon, 14 Sep 2026 23:54:22 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfda39eb4sm3249725a91.8.2026.09.14.23.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 23:54:22 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v7 0/3] media: i2c: Add OmniVision OG0VA1B camera sensor
 driver
Date: Tue, 15 Sep 2026 14:54:11 +0800
Message-Id: <20260915-og0va1b-v7-0-3a4b6d7360ec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJPrqGoC/3XRzW7CMAwH8FdBOa/Icb5aTnuPaYc4NRBpUGhKt
 Qnx7nPh0EpbL5Ec+fdPZN9V4T5zUbvNXfU85pK7sxThbaPSMZ4PXOVWaoWAHryuq+4AY9RUOUe
 0NykSASvpvvS8z9/PpI9PqY+5DF3/8wwe9XT7N2PUFVRtG4Mmqg1A896Vsr3e4lfqTqetHGqKG
 nHmAXDmKBwgaGsxxYhxhZslX7xupte5Zmutc9HiCrcLjs3MrXBOgQO3dSCkFe4W3OiZO+EJqQH
 yoNHqFe5n3sCCe+ERHGELNtXNf59/vNbS8/Umex1eu1EUC1dTUx52G3YMNqBPrcQYNtD4EGSik
 TR5mQnpem8RScIevxEBwqMsAgAA
X-Change-ID: 20260618-og0va1b-55bbf3cabb0e
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789455258; l=3077;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=7N1fDIuarqPTR/6RVeBVlry72Nre/4Z6FugI2Emz3TE=;
 b=oJ6+XrpJoaapcNahSVnzE1VfQDR1nemsE4W4k8qRprRhPBKDEH9fAhcgRenfUGQiJQ/RvHWT1
 +xYh2HmGK0vCKx49+l2WL9WHFCCiDz988ntTN7V4CV+bGaxhbfsZbXu
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa8eb9f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=woRRIIgVOrJ2uQ7OFmUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: xAMk91ILClo9tUXpSgpeisukifKiIIlb
X-Proofpoint-ORIG-GUID: xAMk91ILClo9tUXpSgpeisukifKiIIlb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA5NyBTYWx0ZWRfXy1CO6ygKTEe6
 p/qu1CXOcOz5oy/0UGJc34t4uzoSzSHX3A6dKw42B3esm8OmEK6ycWU0lidExUL8jPgvlxao36S
 RRPAel4B5ejIGf6/m3ZsbZ1sazi6WSkMxsiSDP1tINUd1h0HbDg1FrG8sYGM3V2QWbLJ0igxV2p
 Y8Di/xhNcOeSIOk0UiibrQTxCZmqn0ROg5x1WWcVjuFHZY55XMAVrJqju7ZrQYpT8Zr3Y5Tvnvb
 gWTdaxw7aK5+PuFQCX8rH6NRWv4MAmWTasxpiM4jkArkry3wU3JqaVS/c60JKDNP+ocyAviDTwa
 uwP5XkdYcJuj3zLx/oKQUHWtDrjBKPqhtotVvF0YajW02TSrpX1Qf+sdEndvKUX1SP+kLalRnnt
 WMtvzI0FGRQG0noD7m5eVKa23Y5oz9asXlv2qGzZ72fN2I1szw7Tse9LFuHmMbirLxcKn3a6vqT
 +xouE89TYudqduK8Y4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA5NyBTYWx0ZWRfX2Sve3VsBE5MM
 KMvwyGfoI4xRToqX2nUpKiU3v2rRe/QXJCdQlU1/lGOzV4wWsrWzRiw8+NuSkMgAd6/aZCBOxcL
 iBYo94yEhbUkFOBDnwh67tL5X49vULM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150097

Add OmniVision OG0VA1B driver support. The OmniVision OG0VA1B is a
1/10-inch monochrome CMOS VGA image sensor. It outputs 10-bit raw (Y10)
frames at up to 640x480 resolution over a single-lane MIPI CSI-2
interface and is controlled via an I2C-compatible SCCB bus.

This driver has been verified(include tpg) on the Purwa EVK.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Changes in v7:
- Drop the test pattern rename patch. As Sakari noted, a monochrome
colour filter does not imply the internal TPG cannot generate colour
patterns, so the original "Vertical Colour Bars" name is kept. -- Sakari
- Give the control registers shared by both sensors (mode select,
software reset, exposure, analogue gain, vertical timing and the test
pattern enable bit) a common OG0V_ prefix; part-specific registers keep
their per-sensor prefix. -- Sakari
- Reorder struct og0ve1b_sensor_data members to avoid padding. -- Sakari
- Link to v6: https://lore.kernel.org/r/20260901-og0va1b-v6-0-a05b2d04c892@oss.qualcomm.com

Changes in v6:
- Rebased onto v7.3-rc1 and added the Vladimir`s Reviewed-by tag for Patch 2.
- Link to v5: https://lore.kernel.org/all/20260731-og0va1b-v5-0-c2b90b601241@oss.qualcomm.com/

Changes in v5:
- Use div_u64() for pixel rate calculation to avoid 64-bit division
helpers on 32-bit architectures. -- sashiko-bot, kernel test robot
- Link to v4: https://lore.kernel.org/r/20260729-og0va1b-v4-0-ec7e7ed87b2b@oss.qualcomm.com

Changes in v4:
- Rename the OG0VA1B and OG0VE1B test pattern menu entries to make them 
more accurate. -- Vladimir
- Link to v3: https://lore.kernel.org/r/20260708-og0va1b-v3-0-de8e44455a42@oss.qualcomm.com

Changes in v3:
- Generalise the binding title and description for both sensors. -- Vladimir
- Keep the cached pre_isp read so the OG0VE1B test pattern still works,
select it via a per-sensor callback. -- Bryan, Vladimir
- Rename the "sensor" field to "data", drop bpp (derive from code) and
add og0ve1b_pixel_rate(). -- Vladimir
- Sort defines, rename the shared CHIP_ID reg to OG0V_ and order
og0va1b_data first. -- Vladimir
- Expose all four OG0VA1B test patterns instead of one.
- Link to v2: https://lore.kernel.org/r/20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com

Changes in v2:
- Integrate OG0VA1B into the existing og0ve1b driver and binding
instead. -- Vladimir
- Link to v1: https://lore.kernel.org/r/20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com

---
Wenmeng Liu (3):
      dt-bindings: media: i2c: og0ve1b: Add OmniVision OG0VA1B camera sensor
      media: i2c: og0ve1b: Introduce per-sensor data structure
      media: i2c: og0ve1b: Add support for OmniVision OG0VA1B

 .../bindings/media/i2c/ovti,og0ve1b.yaml           |  15 +-
 drivers/media/i2c/og0ve1b.c                        | 452 +++++++++++++++++----
 2 files changed, 383 insertions(+), 84 deletions(-)
---
base-commit: e5e04726cdd043e309677071ab1b65a4b18f422b
change-id: 20260618-og0va1b-55bbf3cabb0e

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

