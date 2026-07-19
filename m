Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5932E3AB28C
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 15:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784476663; cv=none; b=GGHZZqF7PTAeZfzYuddDo+JjGKTJkwJiJ5+AbwOc1AVpkG6WKq3FRiCe4KNeXQAW/kCyCxfF4KMUIFjiTdQwEy61RkA7PRz/D5SyPN+Bg+1BZaTrk8q6H0B1jV7WMDLidAARiijfxdPwsjXdBH6TYUiMK8ixmtLzdSrAFp2zbT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784476663; c=relaxed/simple;
	bh=7pN9c9zWJA+qGQnOuBukGwvXRude4YVEXtMtrcAKC2o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IqWyu+7yfTtgQKDkxNeWskwMgHV9KiM1a+Y5cJQH5F5r4fY0n2F0Soxq7lKu7IQYSqvfvhnUrL/GbPUfdtQA4T0O26HbK8C0eMQNfDEAyqWzkUq8hwW1a6mBaS774Ci+1iZkGWEsqT1ehG3ddaYgE0QclzAyueuLdOO1FGXriNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XeAaBPxn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K+dm/zEB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XeAaBPxn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K+dm/zEB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JDvb7T3984237
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 15:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9X9h/ZHNxV1EjjP+V3RN+e
	P+77yOxHYAXoHZMjdrp9c=; b=XeAaBPxnklSODzPIJoYwSltkwA9VElHI/Q9Y+j
	MAZBvBEk7VW3jyY3sCC66kUzfNEFlxhQgTj1jtO1EPVkV4HE7+XOiMvhca2jmAuV
	5kqL6w/coMxXW9JSIjU08ipwmjz1PF83Tem2q2QvkLOW22wjMJgStK+4Zd8QbZST
	2EKjByt7c3yEAbjQ1gpQvyjL+4+f0p8sOXsfcCCD9Zmj6zCslOKOgAOk/4QkdTHk
	mRbAUUvipgKzQGcgw/lQ3S0A9g0r+eRRrkrTVjMOy61XGFClgx6WB4oBe5lSphhH
	lecHJtkfZXKl5doqW/IAjhYRFK/vmPeSJD383SONekl5cBhQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2d930b5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 15:57:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3809cc5dcccso1336837a91.0
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 08:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784476659; x=1785081459; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9X9h/ZHNxV1EjjP+V3RN+eP+77yOxHYAXoHZMjdrp9c=;
        b=K+dm/zEB2Z8mqKiKEUpXFx5TY866cV6picHJ6MEUZYtTOBafQd7lzx4/84E6HzUSXM
         RiAeqYbyNJTELQd+jcFPdw2btARBzafgpxDahLAsxOiiQXGyHWyeVMdHKdjc6RU0Ufwy
         ts9BwLxvjsT6o2FJFtQZWVZ9HaLSaLcHcMqarDeEqaeYyPVZEs570ueT/j2ZcCju6XFI
         bvwbqnzGh1dnYTq81jqKgYo+W5icGwWtzgTXCwJqefdIijM3GtPwIk6q1WF9t+xcwdyj
         N3PWeSfMcUjyARm6bmpPTyO0WmswFiomdmO/xdJcgiFyAPUR5gL6nOLTsaPxMlPyMdjV
         fc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784476659; x=1785081459;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9X9h/ZHNxV1EjjP+V3RN+eP+77yOxHYAXoHZMjdrp9c=;
        b=Vi/3IzKKd0nMYbzLQipZH/FVQxkLYG7cn+r9bSYntN8ooihyWfXbtBsBuKLUSbIkPI
         1FDX7kdU0WF/iH8qktBfRm3ZCUCWQe4ZVTeJkaiL3l6VZa7yAQBiqN7XGMXol1vPjwus
         esXoWA3k89SDumWO+newE9e4X+bnb6cQVfOZFLNjk9g+wkDCrvnJ7nnrTzfkt2rMz6XT
         T/GuIs4Cf16U/T3JqzhqxIjIPE3XaqUsN3lOrtuhv/eC3a9pwgZ9T1+0r5dcbnqECm/C
         krerdFJvyzuUD1ZoDLAXwBBrUEa0Oe/MTFV12ypxD4e3u7a5di8QsyRvJFRvL6MINWAA
         YvBA==
X-Forwarded-Encrypted: i=1; AHgh+RrpXp1wghRfJeLMQcyOBV+JcbyImWo4NNKMcu4G/f2Z0EqvmtooABxo03JLhaj5Q+8emMjAxcjRQr8f@vger.kernel.org
X-Gm-Message-State: AOJu0YxrSo98dqz3YBim28qvFQ5YSiSbSojMEAbSuMrt7clFdy4jUTHK
	7d5p/uH0LNOZuEdC8IGA/Jl9pvXVmP5CtRvRkZWI1MaznYlqJr/rPLtnTLyv7P87Uyc6DvCHDE2
	7yM8BOyhrVKt4rZbApMEl54Z/ounGuaxEJcj+L5V5l+DQcEW6W5+RcGnrIou1pxzvVZ0itj0u
X-Gm-Gg: AfdE7clcalblWCqiqOEQj3A0eqeFCEDYZLMCqNTyTcC3E9ZNaRudQUGx7yfNR+B0kTq
	lQVCAnkoRnyjNZungIRhoTrBtQlIclhQwOQiroubXREtmyq+oNQEVvE2a99HncgJVr/+/9ErnKA
	WP9pngj1xLYQA7exbAiUKtQn350F6JlG8NgbcT313kRQunttCCEgg0lAiqfslYgae4UAfQw/Osq
	vBD/QxdpPIhDui+Xe5dRqZ6CW9ZpQRPtO4ncmm5QZ2iJbVosmDCkD8W4bOorlGJjy+AGKIBMNZU
	MoQI1sEOoKKMyEN6pCkcfB/jWOPQo6dB8/Oi0pz+qEiVujky76YBjalm9sMrDbhpKk8z7uEFeXy
	6Zn1DbsUfE9uoMewkLJ4h1Y1bgB+cUTYj9F1F2HFVDoJ7KctJ3KvkDOSZtmeKcSP4xZVoj22GTI
	mk3O3QrJEKjmxxW8Dz7vhy
X-Received: by 2002:a17:90b:a48:b0:38e:6a7c:abbc with SMTP id 98e67ed59e1d1-38e6a7cacfbmr2529369a91.3.1784476659153;
        Sun, 19 Jul 2026 08:57:39 -0700 (PDT)
X-Received: by 2002:a17:90b:a48:b0:38e:6a7c:abbc with SMTP id 98e67ed59e1d1-38e6a7cacfbmr2529341a91.3.1784476658680;
        Sun, 19 Jul 2026 08:57:38 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9d439sm33127054eec.5.2026.07.19.08.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 08:57:38 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Subject: [PATCH v6 0/2] This series adds LT9211C bridge driver by extending
 LT9211
Date: Sun, 19 Jul 2026 21:27:24 +0530
Message-Id: <20260719-add-lt9211c-bridge-v6-0-e56d22152586@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOTzXGoC/33NSW7DMAwF0KsEWlcBSU12V71HkYUGuhGQxKmUG
 C0C371KgA4LuxsCn/h8vInKJXMVz5ubKDzlmsdTC/ZpI+Len95Y5tSyICADPYL0KcnDpSfEKEP
 JqTWMJxxiwNiBEu3wXHjIHw/0ddfyPtfLWD4fPya8b//lJpQo9UDKaRgYAV/GWrfvV3+I4/G4b
 UPc1Yl+JERwixJJkAEsWialwcUVSf1KhN2ipJqEzGAdeEiBViT9RyK9KOkmabDsFEfqolmRzLd
 kQZFalEyT+mhVCKBMRLcgzfP8BddLrS/jAQAA
X-Change-ID: 20250910-add-lt9211c-bridge-5a21fcb1c803
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784476650; l=2908;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=7pN9c9zWJA+qGQnOuBukGwvXRude4YVEXtMtrcAKC2o=;
 b=vXuBOFE16iGc+K1KDdxFdx9feUP6Q+h1sWJm/jo7X/tmn/RmnYP+kpU6Ip0PhcF16T6Nq6eH6
 r9MJd7H3/fVCcAUPBaJkLqTMbcmuajh2FOPAQxNyIq8+9izpwVwyLOB
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=HpxG3UTS c=1 sm=1 tr=0 ts=6a5cf3f3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wkDsqcFfI8a4ryivD6MA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: URfiYUs0w_EKIS3zNULmjkWFyyJNJsWf
X-Proofpoint-ORIG-GUID: URfiYUs0w_EKIS3zNULmjkWFyyJNJsWf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDE3NyBTYWx0ZWRfX5rH00bwOQ8IV
 4rhUn3V/UdhrxFdTXHrHOBijNoMv3JafDcKn/KS0ZBTszrSfhvDxAUe9REU+rEtPMwdZyhidzca
 ajnTrhyxrykPBv5vhuRhLCsRUG0Z/xsXyKybYWKKVft3MKJa5bFKnIeFgf+rTOCUQyGTiY+2oE6
 81zVphoGBXCFDHSCpSAVbd2BJCFnyJp2xYEfHSKhzGF6cfuW2QYSGmXXUx/zmAcyQyBYtwYCgwL
 5P04BSuaw7bF8C2tWqRDUoinzu9+gJVyT7T5Q/qvz9SfZ8MmYf0Ze/L0j9LbXdS657mvxdVl4Ak
 bcC5Fb9lk+PKmARTJpNs01afag+chqxTEO/4y9g75K8Ry3qm6uqy/zu8cT2m0j70dypiNz1DCz+
 4DmaW4YzlsZ9xHHJvH6iVLD98pq64SSz3wtlAPetDm++XDVLD3ILWV24ZB/YOoS7K8X3RLtYIsZ
 Wb/PnS1f3UW0gT6hzDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDE3NyBTYWx0ZWRfX6JYOAaGk48Ny
 IbxjuqSOkxU0M/wpX3ipBwEL8I5nVILGmbJMXpwbUo95CIDhAnDFNEP6lwMCWYXtH1YM1zW40VK
 tESUcvykdrkRvB+Zf7Mz2er0UkCX+Mc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_05,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607190177

LT9211c is a Single/Dual-Link DSI/LVDS or Single DPI input to
Single-link/Dual-Link DSI/LVDS or Single DPI output bridge chip.
This adds support for DSI to LVDS bridge configuration. By extending the
existing lontium-lt9211 driver to support DSI-to-LVDS bridge configuration.

Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Changes in v6:
- Nilesh Laad and Gopi Botlagunta  moved to different org in Qualcomm. Further, i will followup on this series with community, will also submit the dt series where LT9211C bridge is used.
- Rebased onto current drm-misc-next (commit 671b7825dbfe)
- Fixed lt9211_read_chipid: LT9211 match no longer checks chipid[2],
  preserving compatibility with LT9211 rev U5 (db74b04edce1)
- Fixed indentation in lt9211_atomic_enable LT9211 path (was double-indented)
- Fixed indentation in lt9211_delayed_work_func body (was double-indented)
- Gated workqueue creation on LT9211C chip type only
- Fixed few formatting warnings with coccinelle and W=1
- Link to v5: https://lore.kernel.org/r/20260323-add-lt9211c-bridge-v5-0-9c63bb035c17@oss.qualcomm.com

Changes in v5:
- Addressed code formatting in lt9211 driver (no functional or design changes)
- Addressed v4 comments on lontium-lt9211.yaml
- Link to v4: https://lore.kernel.org/r/20251224-add-lt9211c-bridge-v4-0-406e73ec28c5@oss.qualcomm.com

Changes in v4:
- Removed lontium-lt9211c.yaml
- Extended lontium-lt9211.yaml to support LT9211C
- Link to v3: https://lore.kernel.org/r/20251218-add-lt9211c-bridge-v3-0-1ee0670a0db2@oss.qualcomm.com

Changes in v3:
- Removed lontium-lt9211c as separate driver
- Add support to lontium-lt9211c bridge driver by extending the existing lontium-lt9211.c
- Fixed kernel test robot reported build errors
- Link to v2: https://lore.kernel.org/lkml/20251107-add-lt9211c-bridge-v2-0-b0616e23407c@oss.qualcomm.com/

Changes in v2:
- Combined driver patch from https://lore.kernel.org/lkml/20250911-lt9211c-bridge-support-v1-1-c221202cbcd5@oss.qualcomm.com/
- Added MODULE_AUTHOR
- Uppercase to lowercase for hex values
- Link to v1: https://lore.kernel.org/r/20250910-add-lt9211c-bridge-v1-1-4f23740fe101@oss.qualcomm.com

---
Yi Zhang (2):
      dt-bindings: display: bridge: lontium,lt9211: Add lt9211c support
      drm/bridge: add support for lontium lt9211c bridge

 .../bindings/display/bridge/lontium,lt9211.yaml    |   5 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            | 796 ++++++++++++++++++++-
 2 files changed, 782 insertions(+), 19 deletions(-)
---
base-commit: 671b7825dbfe9ea6e3ad3001003aeee0df48d1b5
change-id: 20250910-add-lt9211c-bridge-5a21fcb1c803

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

