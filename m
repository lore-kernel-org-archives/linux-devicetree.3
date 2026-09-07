Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F3F471D1B
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786044; cv=none; b=VaKamzyyqRdalcIUqzUo84O3iS5qtI73R5aTpJpokHs0Rrbk5WXlC8AZwF+aaWwjUZFSNx8XdgdqYQrxC2C39yakhJadwZDFsELqHk2R9ed8AaEnoEnhOoGrzKiOPFn3g+cV6LrzlF8JJwfuJWxo50Npoiptz/b6JjfUJGzUz8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786044; c=relaxed/simple;
	bh=R1heoqafdwqzfSRjHxzsYA5WusvEWpky2358S6ReQdE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b8KDIdccJFpBkw2wmq7Za4zAm91P2wRGzIdd/KwAe8imBsvl27z8DSkOnPy0KwYNCWQyrxbnGzKw9LRuT5kiyCIXjGwnxUrEwcEj6El8JTJtGDJpYXfX4eekMHwEfTDopq8hS/QKFbXJ0VHQJGlNtIXOzUV6ry6rWio4FnS15g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oxt0CBN4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y5KQd7i0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oxt0CBN4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y5KQd7i0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An7Q8810629
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 13:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mbgqvHTyaHpGvMkymmdVNW
	iCsdeQ9ZFYWr/yEdLCQX0=; b=oxt0CBN4ZdJ5fnFpr/aCb/DkgARIdywr5hcXdg
	QeLRYmLUgdpc02LH5T+pqd96XxO2aDu03PsQOC+cce94V3ESIlmcEZHbw4CSts6G
	nVRvntGN+AVp0FI9c2aXNFM5lHfvu/FUj9maHE1WdW0CYV72k72jHx9PeJRaGGUD
	Px3O3Px04BI2F55pT2sYSvXDuv076mpo6gaoXynP8p70ed3HOX9uV7Tx79OZ32QF
	QQBpbfETEn55tKKU6g3pwdroMY6n82OKG27FYd5BnhO22fDQKAab2JbPQUwI0/59
	GA8uSas4eqRZ31g27rnMzK7JZkQ9p8Rz6L8Rrfk44BZJY5Mw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua9fjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:00:30 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7866c4ed349so3086196137.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788786029; x=1789390829; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mbgqvHTyaHpGvMkymmdVNWiCsdeQ9ZFYWr/yEdLCQX0=;
        b=Y5KQd7i0xgNZ2gXa1sO7BcQUAKiF5Jjv6esMiWCP74nt05TTkkOO+E+8YPVSxF2Z0K
         pXtb8+VlihxO9ptxPUNiu1/l6jvdbc9H7X/BE2s+GnHSdFvbcp+rV8U2JIU21QovY7I9
         xw4Xvzej0ifMR8r33rmzRDgKmmpu3R4Uzs5xkNYvT6DmwKi55GY2VcvpDvyK8rVGbaIw
         pVVDgK4MGjxJBgo7zvNWqL5ZXgfQ0P6KRkouKyVZvwsFbGbDTeAzOrQeptfF70tobl99
         /yKMOiWDIRP061N1GNYxglzhkn4sw8EjEszkEMKNl0IteTCCijCsQ3AHNFuQQo9QQEqv
         MSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786029; x=1789390829;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mbgqvHTyaHpGvMkymmdVNWiCsdeQ9ZFYWr/yEdLCQX0=;
        b=J16Z2wndjJRwfFL6qNA9SDwZNF6buTNVIdm4x0YI0TdhXy/1Xv2zAyzpZXcXi4keqp
         AQhPu5mjopq6s7wyz/N3oK7O0N3t/wzFkBphdLxtUShasxYBR9HBkZTPJRj66WIEQD8F
         F8y3LNI6MW8ksaZhNLuY5OpzZEUnbaSmBDdXy7DhJVDldOjaogyQwyRFg1GlWirC9Z64
         UuUtC7jJfMF/pSdPns2AAIcBjUyOv8+aCdbSs5gyjVCJyZngBKskIMRA2mhLB/Lyj4TZ
         AtNuhR6LKQHiWTXflyg/MszftkakAqT2iIfJOU28u5xlBq79JWzXWXpqSl7t3B0zdLv8
         EMyA==
X-Forwarded-Encrypted: i=1; AKwUvBxf/nJCdYKULKZ7DZtiRRUXnYXHowM0/UZznSlGM5yFtWseEXWDT8wGKbbYD1BtFqvnwAOOsmA8EeRE@vger.kernel.org
X-Gm-Message-State: AFuF++nDq0xwffueCINsz37JNgw+GnQOFFRXLOxA9bDPar0Zb4eX+Hc0
	2CkWoE5b0qOpoiVtoxvSddCKzJXnJZfUnpdmWj9Sm1NBgZIY0ZJC/RKBxPZ/yuKCY9RYKR4yot9
	OWufgm/q0WH3fc7kSIfqnSQ1XZ2PDT1jZhyX1oOpANuuw4AJ9iSfAUXPvMgkruX8Y
X-Gm-Gg: AYBFou0TC5bP4wMTNXXfOoDObFxmy9iMoc4L9SNJ2uyeLKzcGV+J/iqwvoRz/7uPCuW
	wpTutGNnypg9l6PlLahfWxdlrdqwvFZEx02Wrq4+AyWFaxoym5V94a1XtSXbcO/9v6jNOF8u8/c
	gKGVbsvKCGXBt6y7CY9ULFbW/sLjAYSY8zsZKUjgMvNchi7jvjTkqrjuCDO6AIjOgtGCpGIqPQh
	fT/7sKdMhvdnJYd64jAFR3MZO+WOBuRW0JFK1VsxHB6Aq3nDeDcMXKzubm4ikwDip63NWrlnZif
	2qtktaRgg6qSPKwL/NgxFbCP3LQt69nuRL1LG15x6k42HbIqLmMpDuCn8DriWgtNMRu0WApnn5v
	XwqPsnqd+hoOn/AjMQcxnR/c=
X-Received: by 2002:a05:6102:509f:b0:785:e444:15e4 with SMTP id ada2fe7eead31-78a4a87d391mr9352519137.6.1788786029481;
        Mon, 07 Sep 2026 06:00:29 -0700 (PDT)
X-Received: by 2002:a05:6102:509f:b0:785:e444:15e4 with SMTP id ada2fe7eead31-78a4a87d391mr9352452137.6.1788786028936;
        Mon, 07 Sep 2026 06:00:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff81c9b5sm198751205e9.4.2026.09.07.06.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:00:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/7] drm/msm/hdmi: Fixes/Cleanups before Eliza
Date: Mon, 07 Sep 2026 15:00:14 +0200
Message-Id: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTsQg9rWq0gXTfLXjphWZlTE0
 rsbdfnB4y1kUIHRsVpI8RSTeSrwm4ri2E9nsKRi8s4fXOtqTpo5W+YxZeFBXjAOGGYF4yrvnmM
 bYr1t9qnZRSqXm+JXlcmp+9se4YJ4/25pXT84UbbLgwAAAA==
X-Change-ID: 20260907-drm-msm-hdmi-fixes-before-eliza-c9bc7185d84c
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1650;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=R1heoqafdwqzfSRjHxzsYA5WusvEWpky2358S6ReQdE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqnrVgvrThFbbkovfh6cZdBXUsee9/xtJ+Onlei
 4EMFYCmFb+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCap61YAAKCRDBN2bmhouD
 103PD/sH/PGcJ8BqD0NEQzgF9UlC1sIfzFQ7EdPuYBXVAsrkN0m8vlTsaAZzy7Dq9dAItUvy7vB
 4fnH+3WOZAHyhWPl4x/APMty6S+vRF85VkcIn5KnhrKa5vxziTLTm/RH8n1/4Sw8Z5A847QM4TC
 R15b7xwRXnPfPkfR+LD9jyUZGqDqxNScd4nFSkj9wtkRaHBGXLNJurFpbY+z2FYn6WigE0PCgkv
 fYpE30RywfqJ1Dpqku2f3umvp2R+Tvh2xkN95cFHKcjy3KpDMZuYbKapA4y9FcFR/IOfrep5B2q
 LcTAPfYMhDI+/UeyQdKg1deD7sSY52Z+cDF9HUeNls8P/L+MpV5kCsAhHvh7fEsu1Aji3kyS43d
 6TN35XMDZ+2t7WSc3OCI2jxILkLDKGMhfWbZ9MJoPV98rdWrNrI5cZZGmzpqICL0jpWWC3p2FQs
 zP9XCEGFQv2PeXuqe44uqG83Mgo3JpN2bpDBvoOHKMVELMyoNS/ae9XP5Hg9zitUgQaN6thAkkN
 nnBRABELem9F+bnSjzvEAiE1/KFhT65f92erZBDy5N36bgTQiaP1sjcT9pDDduutWHUvc/GLXPm
 NPQSTJGYo4ZZRCnMDd/0jXBhmi45KJEkAKxVY5x3R0Tniy67dp48UvQPGpzBRY7mhnWvFL45w1v
 OFXv2FZD0gtQhAA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: -h3ER9-wHrm1c3dwzxUZjXFzQVmLXGaV
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9eb56e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3rGLuoqwPg9cSPe0pR8A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: -h3ER9-wHrm1c3dwzxUZjXFzQVmLXGaV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfXydpnd+umrD8n
 jx/tW38aMWZa6DrkxUhpV+VmIfc/2+yuCox/65FgjQjPjDj5OmrdtD0a5tSG+l9m52qTuyVrfm5
 Mcnh7u9u0IMw5M6hnM5cQeak/tGhlCc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfXzLrdK4i+oPnC
 izCvUCSzaWrcx9k8I8jOEAvZxw7sf7uRS0GJPrYAVWCONegqiAukuYe0sGdf3ZYHnOsOj3esBCc
 /xSQ4sad1lGm0ewJH5K3CwHgoMb55CxOuXuMV7nJiunaGfRcvUkW3a2Y+w8mcoQGpHqPzrMFcMv
 +b/nDUF90bQ5z1P0GPL9CmP1X9InoF3wD2NoWo77eswh27fG/0x/Hp6bLVmTPdWH78c3D0QiLSV
 JWFXx9+3obhFiiJsC/FbveaPaqNBqMcXiLPFwib0r3bfCe4j+K988OomxnEY5+7HbaTkqx2rg06
 UEpuM9JDnzjN85mQVVUccYgfFMMvCaLb4+m2YhDI7o+QmZyeNE3eMrlMo7iKvMEwf2f+7pGFJ3D
 Ns4dK18lfhV5zpr7QvfMtGVcwJ1N1xg8WWyJ9MtxsV1HT0cFhG36hxJjw2jx53AeooOInt4pC5R
 zByZkWaAF6IbPc+YO1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070143

Split from Eliza patchset, thus `b4 diff` won't exactly work.
v1:
https://lore.kernel.org/all/20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com/

Changes since v1:
1. New patches:
   drm/msm/hdmi_phy: Cleanup after msm_hdmi_phy_resource_enable() failure
   drm/msm/hdmi: Handle msm_hdmi_power_on() errors during .atomic_pre_enable()
   drm/msm/hdmi_bridge: Correct poweroff/audio cleanup order in post_disable

2. Patch #5: use simpler ?:

3. Add tags.

---
Krzysztof Kozlowski (7):
      drm/msm/hdmi_phy: Cleanup after msm_hdmi_phy_resource_enable() failure
      drm/msm/hdmi: Handle msm_hdmi_power_on() errors during .atomic_pre_enable()
      drm/msm/hdmi_bridge: Correct poweroff/audio cleanup order in post_disable
      drm/msm/hdmi_bridge: Drop redundant initialization in msm_hdmi_bridge_init()
      drm/msm: Properly handle msm_ioremap() without name
      drm/msm/dsi: Fix indentation of if block in dsi_mgr_bridge_mode_valid()
      dt-bindings: display/msm: hdmi: Correct name of disallowed supplies

 .../devicetree/bindings/display/msm/hdmi.yaml      |  4 +--
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             | 36 ++++++++++++++--------
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                | 14 +++++++--
 drivers/gpu/drm/msm/msm_io_utils.c                 |  6 ++--
 5 files changed, 43 insertions(+), 19 deletions(-)
---
base-commit: 6e95d4043b2c59f1887fd72d1620b7fd3d3138a5
change-id: 20260907-drm-msm-hdmi-fixes-before-eliza-c9bc7185d84c

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

