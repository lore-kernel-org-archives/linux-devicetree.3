Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19145221DA
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 17:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542982; cv=none; b=krgXA8ZvvxrFZo6oEWMC64TeXjUZU8EIA7zkGQ0geryOk3bbz6ogFdjNo89v6130lD6g89BWqvNnjiv+wpUPej0BBG8vDs6aJEc2FEE37/6JxtvRr/0Ndm2q5bhQGkTRiG2GGEW/lNCMKkKyapp+mW9K/a2hUwlx5/N8PdFUj1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542982; c=relaxed/simple;
	bh=B7nfWqGasNONmthzuGpOhvqXfRcUY5Px93+mZxgX2Zk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q4pRPZjIf91sfCR9ppfoCYNzBSRaf+Bx8TbwtSrwG2B3EtXDwXVt91DyKxZ/rXSEhMIpFP/qcvDfwJS4bhQBcfmoWM3Ef/gz1hEpL4csuJTN81hOfX47QyyzTPADVungMB/bWoCpND6qF14DHhnRZV7M5P2yOucYElHcrkpFdKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enj6eA1a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f48sNNYZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="enj6eA1a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f48sNNYZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HJsE1019139
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 17:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=o6wa5ZvzXv5T3XPryztIZu
	COvwVbCLtIzQUjOAkt0Ro=; b=enj6eA1ayrUebdugQcndzpCccUMeN1fvBIcH7L
	8WVZ777XzuIkGS25h2Dvjr7vVNnutHPfuaLpBWuTJ1CtL3tdYyx1Ofg8YZl/Lg8d
	Gdrg9bdqUcEL+h9R0P+qZsufhO4q48IaI+o86GLv0yHhrw7jLOxkDKH8PQgH/GM7
	Jy306xLKLUS2whGwaA6gICHhWlFsNQXd1Z+o0PiMHpMjcuaFp2FnTcqW5ZDQQUFk
	IzbJ4Hlmz1Kda1Hb5IjzNIPNpaFNxQCMUsDzl78cjUB4vZvsJ7LxXBY0oS3tjSKb
	evKDzk0FrZKpfFL19BEs5I/8ZlzgDXBKAzGqFy2wkYM9edGw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfqqd3bt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 17:29:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39924189378so331773a91.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 10:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788542974; x=1789147774; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o6wa5ZvzXv5T3XPryztIZuCOvwVbCLtIzQUjOAkt0Ro=;
        b=f48sNNYZx4m+etufkJuTQJMhIAXmusesg1W8dfLS0vASUR3dC70nuI+luPrjn45VcR
         muNDfwhclz8geZOgpl9ZRGsC7nPLv6Vdjkm/wpgBbK0yKTpUMm6SsMqY1WPm7R7KCIGU
         FqJtzvOItiprfIpaUYxRQnYKbLWIn0LVo6e1d17HLKZlWNv9FsXOvdBpKsa8v2Msyhty
         4OiStMWh3cig1hLw6nM3wOvLyttRmU7oO+bfZoGKFig9jHWOyIyU5g3lEziwMRSlKtYg
         M9dYa7QVikKNuxRhxDJtrc5QYJQUIc0wr1u5BF4ePhB6biaAhkKpsjUdWW/Lji4favHL
         I5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542974; x=1789147774;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o6wa5ZvzXv5T3XPryztIZuCOvwVbCLtIzQUjOAkt0Ro=;
        b=rzEOymmmYUWFLCBI8cpH5mjbyB3GZu8/cCSXnn2lhaed9c/j2XN7S7U0lbbWPPGfcF
         Ir1u9nZaopqAgfkjywS9nZMIEL4IYGIaOgVmGEQAZKqV35W/aO2mCU3/aMpIU8F0+d31
         STdlm99J3mJfrE110Pgi2eDs5eaZ67ta3U/NiPvJox+08ikOsfIvABMavcKUQp35ii58
         QvO1oI+BYjD4P0LZk37YckZZJ+fOK7INN6hrPufr3DmgZWJcaGwwQRNEyZGsmSRPwY/T
         H0HweIocrefT31MlTBQDe1EibV1+qFVKDtJ5l4cjCSm29Gtq5frWGgtBCMNdG/pGsSkD
         21XA==
X-Forwarded-Encrypted: i=1; AKwUvBxoVKMDKYPEB/GoTCOKrvf0SbD1Uv3VrC93ek9MaSCKLdICxov8PjDNeZjzChAaEBfQDJOjp+kgognu@vger.kernel.org
X-Gm-Message-State: AFuF++liqdAeng9/JJoYPLjZqtrZAa0Lff224WhCwXFGzrnetaTMekQS
	QLzQ2iLF+6lm1aHvN401IeCI8WUOB2D9nz5VhwJA5htu5Ky2VYERFEWnCvSMmHIHFY8Vrn4AK2G
	TdtN+VMJfhRHiYPY+uywnBQNwPGt4Vb2X3coeM2Jvj5Qh2m8GqIQ1C7W8bYjJMhjn
X-Gm-Gg: AYBFou1HfwVGoQrWR3WJq35nHLbKOZ5asAtW993aYcq3ubEN8GbvmRLTd2Id9cqDEBD
	kyryOHb4do78vWGs9IB05AHB7DylpOaJzBxIUvG+1GyoXUaZHsdoxaKrwoZPrO48Ztn2151U3kz
	2jRa3KI55BhV/BydnLfzG9y+5tEWgj67HptAujlZj1JyzBPd8s3bU36a1R90Ag4ATvZfrriLZhd
	evctU+hnSH/jdhDNe9qhwTPSm/Y/HN61YlYq5CrMzTPu6iWVOUqprPXdq54jvHP8S+HfuOJZqLY
	rBBPBNOeMGfR2vJMFEPQHbcjARI/l8ui03F406enOhKWRTMDZw44+N/VmxgSneLYA6dZfGLvVUg
	KZicTc2M/lK32sk/AJEoTHzTiIrOSVGz+h6pLjV7kI2mdTKfVTFQ1YiqOLCrd+9qIONV5Ki1Imm
	wI3VWuyQaGPTdxO/M9RBlo
X-Received: by 2002:a17:90b:574e:b0:38e:ab3f:2c99 with SMTP id 98e67ed59e1d1-39b3d5dd778mr595458a91.2.1788542973535;
        Fri, 04 Sep 2026 10:29:33 -0700 (PDT)
X-Received: by 2002:a17:90b:574e:b0:38e:ab3f:2c99 with SMTP id 98e67ed59e1d1-39b3d5dd778mr595405a91.2.1788542973011;
        Fri, 04 Sep 2026 10:29:33 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm12396019c88.4.2026.09.04.10.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 10:29:32 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Subject: [PATCH v8 0/2] This series adds LT9211C bridge driver by extending
 LT9211
Date: Fri, 04 Sep 2026 22:59:20 +0530
Message-Id: <20260904-add-lt9211c-bridge-v8-0-36d66168e176@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPD/mmoC/33Ny07DMBAF0F+pvMbVzPgxDiv+A7GIH6GW2gbiE
 oGq/DtuJQgLh81Id3TnzFWUNOVUxOPuKqY055LHcw3uYSfCoT+/JpljzYKADHQIso9RHi8dIQb
 ppxxrw/SEQ/AYHChRD9+mNOTPO/r8UvMhl8s4fd1/zHjb/svNKFHqgRRrGBICPo2l7N8/+mMYT
 6d9HeKmzvQrIQI3JZIgPVi0iZQGDhuSWiVC15RUlTAlsAw9RE8bkv4jkW5KukoabGKVArlgNiT
 zI1lQpJqSqVIXrPIelAnIG5JdJcauKdkqJWMjERoyzm5IvEqOqClxlTiGwViOhoNuSMuyfAPfQ
 e1XdwIAAA==
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
        Jessica Zhang <jesszhan0024@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788542964; l=5884;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=B7nfWqGasNONmthzuGpOhvqXfRcUY5Px93+mZxgX2Zk=;
 b=Mgn72OqFE5IJ0D75DTxJZtokMKfgiLXu7BC0+u5bbSJLlt6v5oudsNIosprP6utFroZaqmEoQ
 NyXszHOkT7+CNUpIiCbUGKaLS0TKs85j9+7GSAfaMRnOOlDl+cKeZ7N
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: 4CsLeKEW5SbjDSFZpF4WJprY6fhcuzCu
X-Proofpoint-ORIG-GUID: 4CsLeKEW5SbjDSFZpF4WJprY6fhcuzCu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE1OSBTYWx0ZWRfX4ZDl1+9nQlFE
 OlUP2Nh557NfqmpgZu5NoHUQE9w4XLeEATK2kQSuu8JUpOrpk6OmNUO//kN5pKYQzLqZc+kitQS
 XntyEQIFMYA6weAv2jmAfH4/ro690vs=
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=6a9afffe cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=j8kyfJY6CSYuxqjyPqsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE1OSBTYWx0ZWRfXy2NSSEkR2g3i
 tuM0n1v/cEYu3RzFkd/uS2gniztOHLQzGCzSrYCuQ91+dShunaj4gP8ZlHVnbnKFvs5D3zXvOuu
 1gcqASy5JLpzBnwvxYzldB3RuIw9u+ImDVXbYiznFXct0jlNu5zHbvFuOO9WnXBJweyXyjnWKoz
 eSGS1raUKrzPJPdTEuZSkhr8SraWoVjuAooTYmZ/mZcjOG0v/AQp4VaT/mLXTBJ+zs1CxIvIpMk
 SdZY6xRNMemCEjS+XEm/XfM5lCJnaIdJTPcWAsPLJFEBsM9OmIXs/RvBKaY+oqdQJcfoAqKpGBY
 rebmk3Z1mIM+c94Fi22F6Hrmy0T3FU11fREZ3V/XQthLtRT8h7H3jQglaHxR+yjBVggW9VQRZTD
 24V/bb57VeMcXxzMo4VSBtrZS79wh47/vKr/mVucc3hQb6J0SmQcOsV/v04QOK7IlWIVLgdKWQh
 GaUA9Ukujf7k8T+4JEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040159

LT9211c is a Single/Dual-Link DSI/LVDS or Single DPI input to
Single-link/Dual-Link DSI/LVDS or Single DPI output bridge chip.
This adds support for DSI to LVDS bridge configuration. By extending the
existing lontium-lt9211 driver to support DSI-to-LVDS bridge configuration.

Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Changes in v8:
- Addressed Sashiko AI review comments on v7:
  - lt9211_read_chipid() now cross-checks the detected chip ID against
    the chip type requested by the DT compatible string, instead of
    accepting either ID unconditionally.
  - Pixel clock overflow and divide-by-zero concerns in
    lt9211c_configure_tx() are false positives: lt9211_mode_valid()
    already clamps mode->clock to the 25000-176000 kHz LVDS range
    before any mode reaches this code.
- Switched the LT9211C deferred init from delayed_work to a plain
  work_struct/queue_work(), since the delay was always 0ms.
- Link to v7: https://lore.kernel.org/r/20260822-add-lt9211c-bridge-v7-0-7dcf567d57c4@oss.qualcomm.com

Changes in v7:
- Squashed 5 fixes from Philipp Zabel, except drop delayed work.
    drm/bridge: lt9211: fix regmap_write error handling
    drm/bridge: lt9211: use regmap_write_bits
    drm/bridge: lt9211: reuse lt9211_configure_timing in lt9211c_configure_timing
    drm/bridge: lt9211: combine equal branches
    drm/bridge: lt9211: use devm_drm_bridge_add and drop lt9211_remove
- Keeping the delayed work but improved the approach by reducing the delay
  to 0ms and wait on vblank irq to correctly configure bridge and autodetect
  RX as with synchronous approach in atomic_enable callback autodetect RX
  was failed to detect RX format/width/height due to stream was not live.
- Introduced lt9211_chip_data and fetched it via i2c_get_match_data(),
  removing the remaining chip_type branches. [Philipp Zabel]
- Switched lt9211c_regmap_config.cache_type from REGCACHE_RBTREE to
  REGCACHE_NONE. [Philipp Zabel]
- The few read-modify-write registers now use regmap_write_bits()) [Philipp Zabel]
- Merged the mode->clock < 22000 and < 44000 branches in
  lt9211c_configure_plls() that wrote identical 0x822f/div values;
  0x822c is now written unconditionally in every branch instead of
  being left stale when the mode clock moves out of the < 22000 range [Philipp Zabel]
- Removed the dead "set bit 0x80 then mask it off" on the 0xd026
  write in lt9211c_configure_plls() [Philipp Zabel]
- Consolidated the duplicated SOT / HS-settle-set write into a single
  hs_settle calculation and one regmap_write() call [Philipp Zabel]
- Fixed error handling on regmap_write() calls in
  lt9211c_configure_plls() that used "ret |=" across multiple writes,
  which drops the return value of an earlier failed write [Philipp Zabel]
- Reused lt9211_configure_timing() from lt9211c_configure_timing()
  instead of duplicating the timing register sequence [Philipp Zabel]
- Switched to devm_drm_bridge_add() and devm_add_action_or_reset() for
  the LT9211C workqueue, dropping the explicit lt9211_remove() [Philipp Zabel]
- Squashed LT9211C burst mode fix from Oleksij Rempel.
- Added Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
- Link to v6: https://lore.kernel.org/r/20260719-add-lt9211c-bridge-v6-0-e56d22152586@oss.qualcomm.com

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
 drivers/gpu/drm/bridge/lontium-lt9211.c            | 837 ++++++++++++++++++++-
 2 files changed, 807 insertions(+), 35 deletions(-)
---
base-commit: 97c594f71fa71dc30a0583a76d8b6ef5c5ea10b1
change-id: 20250910-add-lt9211c-bridge-5a21fcb1c803

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

