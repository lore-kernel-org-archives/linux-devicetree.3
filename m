Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45BB46A5E1
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 07:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248434; cv=none; b=Ql1IoLZayalOZApHznznJTTIm4i6bqOmnppE2vPCcfeNOzZ8wHZ3sOAG3NedoodomihW++3Yt72BJt68kq3nao6jFSjYaQWuS9H7+zUCHbhdbFOyy1mC6H5fLlLnqRVC+rv16QO+rmwmIwReKnbCRjW7ydVAFnKGg/xlywuGiew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248434; c=relaxed/simple;
	bh=BBCUKLHJi2E5uO7To73yOce1Mx0tuPAoafkS/7QpZ6w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JwuE9llwrwBq72sUMfw6sr1a718r+W4qeEKWT8f5VOBiTPTBrF6sb4O+TatVhWJkH3NgK0wUW05PpJAf9TwZqYhH7xJS12QHSqPrRUgGU7yV3TOsjMUEV0QMtKtLjTP6RcpvR7hcayO5/CbQxKqSKZjEiF0Teuaen/jnbp2u5xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LLm7mFyV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWj371UQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LLm7mFyV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bWj371UQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Ql51811482
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 07:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VFTyPBw2ga7wuEXrYbdkpE
	Sl3bDGlT9t0B+hkh2p6Oc=; b=LLm7mFyVM04sqytwd/UqnoSEaz3H6K9Wqpu67k
	nKQnn08aTxW1Vyy+AR9D0Hz4k7/wG0Q5m8tRczvUvW4RkekH3LhClCmuRYJWPFc3
	O9XYgsDrLAmRbppEV/3lFUoAicwBqklqiwKv6yZFwrOuGUaW6B3Cgm+Lkdxd4qpI
	g6iXv9BmwO4IvKX5jKvdqb4Mqn6ZyP5LJEYUEnb+Qxr04YMNo8EzIaYsPtMvkf/6
	d+WzE0PclJTxQ3HunvkaxBitkzH4Qr3muGgzseBMqWpZMN1a5E5mYkXFhWyGKJ3B
	IdLekZx/tpFwHiHIB4SE1HHTYdfXdH/GOSv8tFC9GhcKCEXw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdd4dukrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 07:40:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9375d92d8cdso810495585a.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 00:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788248431; x=1788853231; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VFTyPBw2ga7wuEXrYbdkpESl3bDGlT9t0B+hkh2p6Oc=;
        b=bWj371UQP0w00MBXb2Bhgl+s1AOcG9MmVdXvfDYp/XzUQapTZ6BgZqkrdBeFePztvi
         f9yUoDeyB5Y72jWeaKI8lRbcjvU2wNmMbRrwtLZp8HTqDS9BNmkR11f9Cdkry4Qscmx9
         fudJiLU8xpSp88g70wO3lZigkGw/32AYgJ+9uDPOlW+1XWepNdc/xabX8gnsXGVxj5X4
         EGa/dIQE/aePp4MtADBco/acnd/l2fTolxi/Cr82V1B9z4asjvq4bVK31ZZC3rLlvjZj
         38LHQfjbeIuGGp2Ou27Uow39lfXLX00u0mJaCGeDc4bRcVqt7dREsUvv+OcU0zHKkRhM
         /+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248431; x=1788853231;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VFTyPBw2ga7wuEXrYbdkpESl3bDGlT9t0B+hkh2p6Oc=;
        b=YCPYmjKCZIeSM23uisZYszhJUIhtV+ndQN45CyVDMgiehmZ8DDsrgVwww2Uz22O3jB
         T2d8q5ibEAdimm3qwWIWpJ+mPqNc4OOXNiqBy5S8rWRGjaqnxxiRRPjLEYAaxe7XqJv9
         Xaf13u71Cq0CbnXb/VGzyU4WKItCiUPfrtMZJR0oOmUosUPX6IZKD3rKDjI4Ojz3R7hH
         kPZv/bF+3LmVWoyR4gF0SHchXjmuYH7NK9kESXKFoBlt87qmRuO2aLmQOFfHJ/yOVezH
         A4zx/2S30iaTSsBRiUA1hFCg2543tEdqe9oTT2gJuyddU1AkW8pmxo4VAoB74Hs/msM/
         Ir2Q==
X-Forwarded-Encrypted: i=1; AHgh+RpDkfUKt3ik+vMwjba0HGJiDYss8CnqogtmNtCI17YRIczYDH93jhQGRsthwzbzgVtDOqMH3BhIk5We@vger.kernel.org
X-Gm-Message-State: AFuF++mQwn9e7cOiNQVRQywabI7J5K6SKPR7QEugOmSeQbHL8pH9yx0T
	0/jv9HbMnumVnz+OMm8c6Lu8qgrPG22UWLQonCCQyIPRdS8gXNsfW+q9y6uzlGsedpLvRQ/8AdL
	TPokU8GSdFVka776HyPXijEIDM23TR2587tw0SMAoUV/l9kUKyK+lnEGph7fInPan/hrdDhWklR
	4=
X-Gm-Gg: AR+sD12Mt7EIPCz/ZPmywJgAb44LW23KZwC1QZpgw4IvdUH1Uxm2WKeutwh6lMElXVy
	1bMIME1akMYjX/Y7GGTyh9usj5YGxQXYOmN/LGM1C8VjM2H4nnui21aOLwNDgjtaMM6U803FK9T
	jCNVE1vRmRffa/jLQuWunaI2LTpxR4wPeB2BbKXSiqo5mTA+Vx0TBORd87OhUMTCnRZn9DnRRF7
	Ltn8aA/LjhV8NxFoc4cCmeqvvAazNDp8dwSetTLMNwtkHsZFveRsrioCe+TPqz1c+gIf07EvgET
	YAesWgpotCzu7bxO4B7znQcIR1NbU/PopJLWA/rOD57rAR580UGgGwKufyEy6lza4DExG6yRPIu
	XJOeFQBzRJIonxyn3r2HdlpE8IWaV3neUVHZ0zXtrAaVFN+1BdKq6CCQfXLOcUvSc7vWO
X-Received: by 2002:a05:620a:aa15:b0:92e:8310:7369 with SMTP id af79cd13be357-9391398cfd0mr3230211685a.37.1788248430650;
        Tue, 01 Sep 2026 00:40:30 -0700 (PDT)
X-Received: by 2002:a05:620a:aa15:b0:92e:8310:7369 with SMTP id af79cd13be357-9391398cfd0mr3230207285a.37.1788248430081;
        Tue, 01 Sep 2026 00:40:30 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939173f2758sm960412685a.37.2026.09.01.00.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:40:29 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v6 0/4] media: i2c: Add OmniVision OG0VA1B camera sensor
 driver
Date: Tue, 01 Sep 2026 15:40:03 +0800
Message-Id: <20260901-og0va1b-v6-0-a05b2d04c892@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFOBlmoC/3XRzWrDMAwH8FcJPs9Flr+SnvYeYwfLUVrD2rRxG
 jZK331Oe0hgy8Ugo99fWL6LzEPiLPbVXQw8pZz6cyncWyXiMZwPLFNbaoGADpyqZX+AKSiS1hJ
 1OgYiYFG6LwN36fuZ9PFZ6mPKYz/8PIMnNd/+zZiUBNm2wSuiWgM0733Ou+stfMX+dNqVQ8xRE
 y7cAy4cCwfwyhiMIWDY4HrNV9P1PJ1rNsZYGwxucLPi2CzcFM7Rs+e29oS0we2Ka7VwW3hEaoA
 cKDTqH/547XXg6618zPharqCQWc5NadxXbBmMRxfbFoxmDY3zvqwkkCJXHkWq7gwilbDHLwrLP
 GftAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788248425; l=2505;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=BBCUKLHJi2E5uO7To73yOce1Mx0tuPAoafkS/7QpZ6w=;
 b=PKp4I2KkXr73eUGhjQWp7v7HZjz2EvbYnIKr3zb7llnH0fJPrjvkFu9ZN1Vm6oURSdwSfCXpj
 A6LtEDbTPwcD+lbqvZAjIHIb6pNLjK9h42/5LFBDJI+X4cMRP+TQWbw
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a96816f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QHcE8raJy8psccEy0TIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NyBTYWx0ZWRfX8R9BvTi0K6ao
 ZFn5IaHj/VxKdWmpZWwjoRpqm6uMSig8qx9yD/cHHPEc8VFgtGXCGTpOqUFWKl5j2pJquEzTeW4
 //T5RXavg/SOp4g50NhiSCLCEaxY0vDY1/eSJ+9XXe/qB6nTxMwqUUgmEoe+vSMjBUgSy1iY12K
 RpbLH0zWMBdz0L+FQbM4dJpfseHqSYUs/L1qHGt/zcrR1yg6zExReO7EmtHjQxjXpaCi6eB9Y7G
 vZcBZh4Q6j8BoajeaeYmtPZL3MaO83QgJEiiHFem2H18BRjZfMiGn3OKVHVnl52j3v66ZtSlM5U
 0ZiYnwlMcHzs0iu/TwP4vFZG7apFtg3kXrl6PPTEJviXS04cJRgmCgmiUnEnIFt8BFRo6K1Uqwu
 +Jm3+iT8mKriouCEVX5QzdhbVV97fuE39y3wVzjhNScmsKbgF4mdYUb37IB/OP2wGNL1E6zLBb1
 bGmvJapcIq/HDq81HqQ==
X-Proofpoint-GUID: uBdea24XUlvUjL1XbzehNkKVUYyeFITr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NyBTYWx0ZWRfX93fEHX/44L2d
 +K52eXnGP06/Ie3aoQst9UaSuFQv3CiK1q6pdZVNJXHG4OJZ2gPKYOYUrJWXMFUK1cQOuqJAj5V
 4JZBtNmgNrHkxIKXi85caMeRvBfM0mU=
X-Proofpoint-ORIG-GUID: uBdea24XUlvUjL1XbzehNkKVUYyeFITr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010067

Add OmniVision OG0VA1B driver support. The OmniVision OG0VA1B is a
1/10-inch monochrome CMOS VGA image sensor. It outputs 10-bit raw (Y10)
frames at up to 640x480 resolution over a single-lane MIPI CSI-2
interface and is controlled via an I2C-compatible SCCB bus.

This driver has been verified(include tpg) on the Purwa EVK.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
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
Wenmeng Liu (4):
      dt-bindings: media: i2c: og0ve1b: Add OmniVision OG0VA1B camera sensor
      media: i2c: og0ve1b: Use monochrome-appropriate test pattern name
      media: i2c: og0ve1b: Introduce per-sensor data structure
      media: i2c: og0ve1b: Add support for OmniVision OG0VA1B

 .../bindings/media/i2c/ovti,og0ve1b.yaml           |  15 +-
 drivers/media/i2c/og0ve1b.c                        | 378 ++++++++++++++++++---
 2 files changed, 346 insertions(+), 47 deletions(-)
---
base-commit: e5e04726cdd043e309677071ab1b65a4b18f422b
change-id: 20260618-og0va1b-55bbf3cabb0e

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

