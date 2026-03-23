Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DF42BE63F
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774249754; cv=none; b=jcgCa0w+o1BF3KuOjWk79OCasIoyfXG6JxWhosef9IQ3kWEkEDBOzkN+5o4if6FacPxWx3m+Jvng+Z0hMjNSefF9P2066DrBOIq/3kzWsJ9Lk347JyZjzAP4ZPRHSKvnH+imOaS4BdHFetZf9sYrcPd8eyweFrbPLbFloNO3020=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774249754; c=relaxed/simple;
	bh=ZixNuX96anr+2evLY02oha9TOOZszn+4rGj7MvKNj3k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HqGnGAt/Bx3ofa+JT6VzQ0PnBBfNIZtaAoESIBen815DzRCV326QlRFnZOIFOnd2C4XEx4GS8OZxQHSrCSM4Bhne5Ep75jhZXvHvsO5TNloQ/5YjJ9Dgr9ggLQeWrHyM9LGVo7B1gfFJuUrjDBo1aG4s4Tbvg6V8LphLUofz1E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3YHFNpV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kV9Zzss9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3YHFNpV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kV9Zzss9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N4Zd211772502
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e4Onam2xKEprwtaCsFgnfb
	MnloVHrOlcZBQtDZvX3b0=; b=N3YHFNpVRaoj1wn1TNnJozWJX0l5n1gm8KKrZw
	DsN4Y5SYXyFxf1gJUddlPJGflAgjptzgALfOJ9g6+A/uKnq62ItN/21AiE/MqtLk
	YhVqgK+37B1W7Xt2RNsSxfOC3lz07VSZtyQSoignG1OR1Djuz8eVBIIk2a2EpDGp
	vzMDvybsogHmCWnAbQSJ2QlMSH8GFsUGPv/EZBHpTFqycMCFlYcZ4wSsBIx2tc0K
	E8+qHPDj+VJGdwZHldzq+n+6zBJte2MMArmLVXEJNVrsjBVFIn1f1dV0FlqpTutA
	nLUjxWsQjbcEHPOT8uxzZoJqQea7Lps5Y/oRztN1oEGmgjIA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jng480v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:09:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b069bfa817so49822205ad.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 00:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774249751; x=1774854551; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e4Onam2xKEprwtaCsFgnfbMnloVHrOlcZBQtDZvX3b0=;
        b=kV9Zzss92EdMIgHftL9JXzKJdFy/9QfB+JGDgay/yLq/8hB6+euywk2cddcETLD6yW
         oLX/PYmr5l6mN0J0k+iDsFuGQpqp5g1un+u9WY+rmrp0zJH2hs8ryT3BGxZ7Yt9v7KBz
         /FFDrnnlcFEkBHs3jYpoF/uRhyEANXoAEKVrp8bI/x2ZtCV7IXPMRtkqE0aGggNGDbzk
         VFJk4oBtPKUJxOJeYuT1wm/rWO1QG7qp6A0NL6n2VJ4J4zijHqZ84VLKO4uMAUmp0aVT
         H+SDt3h/oTXdVhPhA54W9XQRYqEU1nh+Dgm1ommIWzIZwjw/GBrCJ77ulVkjG7O3HADC
         aF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774249751; x=1774854551;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4Onam2xKEprwtaCsFgnfbMnloVHrOlcZBQtDZvX3b0=;
        b=C/rFbvAhw1GmvfR1bod7VbW/STHPeK8Y208tunfZUGmwhpZg2twzBv7jrXtQhuhKxK
         phW/KP8OYzCSswioN1QM0Oq5JFdceWO7z0ldVV5bNxDcJ2mzgY+4RfHzicHCBdEBZ6eC
         X4botOLPvEaOtP5C0sQLOm4+L3028lZCcgy/bbsIxnxaTrvC6YGF0fsH4IAmIC3Mkr9K
         ZCZUbDRewhF94fmeO5MQzv5CM5aM7joXSI1AdyES7Y5uWdbWX5/d+Y6UG0yl57JrZ1ra
         PQ9jPKjfU18gTjgQiBm3RZs18BJdSUWSL0i2ie5G6WNEPjhDoQdG481yhV45HvUXrlnT
         yW5w==
X-Forwarded-Encrypted: i=1; AJvYcCUGv0EY7gOW9Ld28AX1Mu70gHauVqkEwk7iOvJuU+sHQatwAQ+75B9a9lL6jxcBmEHCCvCz/3xplQ8x@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9F8xcsLaewJVtaVrQ4U0PovxXn740Oxzm1udpjqEmi/+Zsqix
	sXH1ccRFTv36S2VFXUhMsQNhfP4ATYl6SkbRrqhfC8IsPAb+GQ2Cgtszl5yIEQTGuMHN6ogjS96
	Z0aaSG/duHqceXsA9bF/PIxhobIHgomhtIS6UnUfBXMcXpokS36D2v0F4OjFTO0Nj
X-Gm-Gg: ATEYQzzHqEy1hl2wlN6SL6DGXmwdS0nChhz31g08bCqiKZVT6bcrIernoCakAvkhsdd
	ShYUJg5RieSpB6QnJMh+LG18QAISH53F9nMX7xm4YWvzdzKMW/ta1J6ZJFnBKI4d7JeXRxgxnou
	OUQDMZV0Ny3d6IxhoP9G+tzSoF1Lzy80MQWy6dE3BrDXoX2n6F50O/qvNRvMk2rknGIMXIP2tgP
	BvcChkKPg/ENB0q7/9ZSYVNj+m9lKnIdoN6dKDsayCp15FTS0kOiaMY3Cl0IAIRFwZvWb/8wpb4
	z9ZdbVlv+Rntnmp5kntTnPxiqjne5mbx+NgtXnlsgUV/MNVLGYdIGDW2Dr/Ys5sKFoCGFQ/UWbH
	NmTPjyzECgsksmDprc8gtCg0N18TvWjsWIlyx9i7OeOtRby/RVhbsdyDMXsjIOA==
X-Received: by 2002:a17:902:f709:b0:2b0:71da:4ed7 with SMTP id d9443c01a7336-2b082769f3cmr104170865ad.25.1774249751320;
        Mon, 23 Mar 2026 00:09:11 -0700 (PDT)
X-Received: by 2002:a17:902:f709:b0:2b0:71da:4ed7 with SMTP id d9443c01a7336-2b082769f3cmr104170625ad.25.1774249750671;
        Mon, 23 Mar 2026 00:09:10 -0700 (PDT)
Received: from hu-botlagun-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083655b45sm133118795ad.42.2026.03.23.00.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 00:09:10 -0700 (PDT)
From: Venkata Gopi Nagaraju Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Subject: [PATCH v5 0/2] This series adds LT9211C bridge driver by extending
 LT9211.
Date: Mon, 23 Mar 2026 12:38:51 +0530
Message-Id: <20260323-add-lt9211c-bridge-v5-0-9c63bb035c17@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAPnwGkC/33NPQ7CMAwF4KugzKSynfQHJu6BGNLEhUgthQQqE
 OrdSTsghsJi6VnPn18icvAcxXb1EoEHH31/TiFfr4Q9mfORpXcpCwLKYYMgjXOyvW0I0co6eJc
 auSFsbI22AiXS4SVw4x8zuj+kfPLx1ofn/GPAafuXG1Ci1A2pUkPDCLjrY8yud9PavuuyNMSkD
 uojIWG1KCkJEpmhKMGAq+mHpL8k0ouSTpKGgkvFliqbL0jjOL4BExa4cE8BAAA=
X-Change-ID: 20250910-add-lt9211c-bridge-5a21fcb1c803
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
        Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        Yi Zhang <zhanyi@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774249743; l=2066;
 i=venkata.botlagunta@oss.qualcomm.com; s=20251110; h=from:subject:message-id;
 bh=ZixNuX96anr+2evLY02oha9TOOZszn+4rGj7MvKNj3k=;
 b=5ENlYrASWDTxfX0mMXw01Vp/f3S1xHPH80VS2hy75iL3AX3qCUPpW1Dw7U/MyDnyQVVGuZyZZ
 kWV28K5Ak3RBbkRhIhNpZBGwcwXZRqmJCnfg+wKhPnDgB6c7Clj8eTW
X-Developer-Key: i=venkata.botlagunta@oss.qualcomm.com; a=ed25519;
 pk=/SnYBwlkTzDCLnHFgEY0qFwPgKIV+aQWRbc3naiLzrk=
X-Proofpoint-GUID: EhZ5h2mMOBOrM7u6KjRmUc9VSQe75oSU
X-Authority-Analysis: v=2.4 cv=Q63fIo2a c=1 sm=1 tr=0 ts=69c0e718 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lZVLp-onbeaezkPo7RwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: EhZ5h2mMOBOrM7u6KjRmUc9VSQe75oSU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA1MyBTYWx0ZWRfX191RbGvd49/B
 4XmMkzBtoAacMbWbWVLimY+p9TB7a0AiYUw4rQS1Tbs5VDJRVNesYJNYGeEZYEzXL64IWrIXQ/f
 A/sj6ehEHjNqNNvTmfWFSa4e99xKKkn17acT1wnpEDKkYzx+//4N4sF5nfMyjXa5yGoZ3BayoJK
 znuXsW6VwF30/L+FrWLopRPQf48ZY+2HKVTNkADTWywGQ9VC8cTalSQJmU0CKi7AWIpy/kj/6aa
 pKPb5rTOD43zXwhQBXtb3M4A32tgPckNRuHHHyyucRe2bAnbbrlssyVzxpvHTZ32C22B12HgU36
 88ZGPUq8R0CrrSzvlg6H3dJSD5OPPebc7fMT254e27N+8LRtSXhTdbb+qKir2YQxcSoR5x3FtTz
 s4L70naH2Nm4HHdBm8c+aRahpgHNBOdetQPOVH9nxc7Ks7O7nUjG7i7DyYvD+RcFOpifxYzYBU1
 G2qG1VJTbExY6LCNJOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230053

LT9211c is a Single/Dual-Link DSI/LVDS or Single DPI input to
Single-link/Dual-Link DSI/LVDS or Single DPI output bridge chip.
This adds support for DSI to LVDS bridge configuration.By Extending the
existing lontium-lt9211 driver to support DSI-to-LVDS
bridge configuration.

Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
---
Changes in v5:
  - Addressed code formatting in lt9211 driver (no functional or design changes)
  - Addressed v4 comments on lontium-lt9211.yaml.
  - Link to v4: https://lore.kernel.org/r/20251224-add-lt9211c-bridge-v4-0-406e73ec28c5@oss.qualcomm.com

Changes in v4:
  - Removed lontium-lt9211c.yaml.
  - Extended lontium-lt9211.yaml to support LT9211C.
  - Link to v3: https://lore.kernel.org/r/20251218-add-lt9211c-bridge-v3-0-1ee0670a0db2@oss.qualcomm.com

Changes in v3:
  - removed lontium-lt9211c as separate driver
  - Add support to lontium-lt9211c bridge driver by extending the existing lontium-lt9211.c
  - fixed kernel test robot reported build errors
  - Link to v2:https://lore.kernel.org/lkml/20251107-add-lt9211c-bridge-v2-0-b0616e23407c@oss.qualcomm.com/

Changes in v2:
  - Combined driver patch from https://lore.kernel.org/lkml/20250911-lt9211c-bridge-support-v1-1-c221202cbcd5@oss.qualcomm.com/ 
  - Added MODULE_AUTHOR
  - Uppercase to lowercase for hex values
  - Link to v1:https://lore.kernel.org/r/20250910-add-lt9211c-bridge-v1-1-4f23740fe101@oss.qualcomm.com

---
Yi Zhang (2):
      dt-bindings: display: bridge: lontium,lt9211: Add lt9211c support
      drm/bridge: add support for lontium lt9211c bridge

 .../bindings/display/bridge/lontium,lt9211.yaml    |   5 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            | 846 ++++++++++++++++++++-
 2 files changed, 808 insertions(+), 43 deletions(-)
---
base-commit: f50b969bafafb2810a07f376387350c4c0d72a21
change-id: 20250910-add-lt9211c-bridge-5a21fcb1c803

Best regards,
-- 
Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>

