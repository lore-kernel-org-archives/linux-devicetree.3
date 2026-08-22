Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BAF28B7C8
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 17:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787418108; cv=none; b=TYjsnSIsB3zrO6cHSXoHwftvTsuLZznmIUMW5TxN2royuLYAXLAlSYSalgF/kP1noedxuWeETf+TB4hgDiLyxt8CwsGj7ov+EzsEMvaVo+S0l3iSTX7LWC/dyXtXLS+ZN15V3GQb2o4xlHpUUgMC14d9jB+TyTvcveqhLr4fh98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787418108; c=relaxed/simple;
	bh=QmWDWLfCF0EHI81LeMSM7a5pZomyuJQxVTyP7Kma7+w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DpKmfALGL3I7QV6hTDpN4U8hXRK34Zdoc/f8bD3eXM28O10jZc4nwbT3xK7UxiS8adRuP5iQmSGpc+2BvRxIZ4eoozJgPCJPHK3Ng82oX91iSiVMpH3lZmKAbNlLpNCPjpXI7gbXpjQOyUrJFqad/+z9R1DBPXxmE03flTXvT+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j0qI12Ks; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YIiINQ4u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j0qI12Ks";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YIiINQ4u"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67MEM08R2016762
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 17:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aj5/NTr8EKJXe2Bt6ZAVUx
	zTQvkFlbWbzC9mH256zio=; b=j0qI12Ksz+2oMpyBVFSZ1eIgCfI1DBcLSibC3g
	0nBoxZEN2aa4itzQMkL2pkhRzelBPHkLIMe7UC9iGjkyLLacC0pWf/XhF9+893t0
	XLkXuPL7XAWwR50UkbwL9AEeiYw+UxEhwlkEIa7CJqfhD9fQ9qG4rjVQk+AkZ0bo
	SbzDe0dKWe2oIhvdXuj+4bTZ0yQe1pvhsd67+S4hNO8d6RatZBzK3WHIHZy0B3Jz
	NKUlbjSQJ3G1Ui1jt9PL2SFZiBsJSsqHLHXrfViK7qk3cHVBieLaY2yqCS3Ctw/s
	I+xxWT8sbsyp7yn++bNdkjL50MZq930zmXC6rlqqcP4eYPZg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744wsmpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 17:01:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d0563db6bcso8707505ad.2
        for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 10:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787418105; x=1788022905; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aj5/NTr8EKJXe2Bt6ZAVUxzTQvkFlbWbzC9mH256zio=;
        b=YIiINQ4uLMTal+yy2R8lTXF2a+A7hsuZA22Wbrew066a43YnbBiifSyhXXmR7fsthJ
         WV+dYjKSyy9JiQDfUtGdIfzO07/MYPZUwmiQDB7tUYvHvG58eR7bdFwx+ZD2ilYOZv6s
         F/kqjkTzkuT7LgGSrkg7vBA0Pr2SQRu1BYNQIqdqBi0YGp0lBaB3J0TkrnqAf5p21Y9/
         Wxn/EmHBUVQ8ItAJW+pXeWS95W1PCl245EQFk2O2R732LdpKvxWTKz49ZoHAr4eROGkc
         Zo8atKeNoOhaccHZSEXFvKHN6U9LhCD6waj8zBad7nb6PaMZAG68njLmbE3kjisKjzkP
         HZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787418105; x=1788022905;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aj5/NTr8EKJXe2Bt6ZAVUxzTQvkFlbWbzC9mH256zio=;
        b=DJNtjePAZsh7IT5JNkmGanYnHioavSWCgAzqhVr1MQCrsl98v0q+UfMaenW61IK+Ab
         c7BardcPV/YoozN2HKmPd2mAo0u15Nx64uLVbKHOLQ1LYzrO94Y6O+xqKYoo/dNJmWd2
         MKDmL7cWnXi5w9Md+o1QsSfsl0E9oy68s4BMD5cFPIZAFgAnMxfW7W4TJD4hpZsvfnSD
         E4C9zXxbAxtSZsfvk5tvnqhrQCjo9wc+/VgHVA+iR+E78IVk8n3eiN7fCN1oiULV98L7
         8QlkwYIXwxp5EBeROJdU8IFudZIN5+tqcky1cjiIzGFzBsF+Pkmkmv/7Gyw+uhdWySBg
         MArQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro8kpSCjkXLYQ1LNR8zB00i+M8RTVDXI7XYGO1fAl2iWfOitKjHipuMFZcxNvOzolAPJucsSfrg8OUG@vger.kernel.org
X-Gm-Message-State: AFuF++l/r+XKF7GlpAVLOO8/HSCgF49A8Zea6j0wxssRmep+0pke2pei
	1ZQ/BlOZ74rW6Y7CdVgXoltOBUXUfHZ54uwrOQIVLMDKq7tZvvCPcxrH2hsSna6sTs8fTfsXtyP
	FHXIQwcjFI3yLlwQCyMhtrQwrP65BJQudLbsxWkD0O1k8TYtSSmM48Gfj0WpWUDwL
X-Gm-Gg: AR+sD101f+vG5RjWYQxG86KatlbQLNgo80BPcQxoEbxy6ZMxpZ7EBgSdRUNfigQUksq
	EF+cTtzKVgONnAJDYjdlnlPOQwgUfyQWKC6L8Tk5TXvLiRb5gLWRbtEGfLArl2DC0exDtCcUE96
	L8mzwFP4Ie4nEagu7c4SlbBPM+UiZZcTgdW+XWFI8P001tLh68ixiaY3DDEjKW9OK9jOhwc3eMR
	Y2UqFBV0Pz8w+vp8iDJO6baZSuinP8mxwzcKQ7OOK1oIhAPdCRwsIz1kbzI9VkIqli7jthN9aqM
	O7L7ecYX1IkIAj2slO5cERBTeWMEjlKPVBHkcykNxkImMsfP9roUE/umiinG9OGOk6SpHj1pyM2
	SIuVF3fT/+wLtJ5EA44vOfD0VRfnO3a+oGTOBzYBwQcj5VPSqboK+RBHp+fNHSfMvltlQyimgW+
	9bgPMM4IaOReVOzsgFaY43
X-Received: by 2002:a17:903:291:b0:2c4:397:dd7a with SMTP id d9443c01a7336-2d64b189ed8mr130854355ad.4.1787418105194;
        Sat, 22 Aug 2026 10:01:45 -0700 (PDT)
X-Received: by 2002:a17:903:291:b0:2c4:397:dd7a with SMTP id d9443c01a7336-2d64b189ed8mr130853815ad.4.1787418104698;
        Sat, 22 Aug 2026 10:01:44 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f9099ce7sm7760562eec.5.2026.08.22.10.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 10:01:43 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Subject: [PATCH v7 0/2] This series adds LT9211C bridge driver by extending
 LT9211
Date: Sat, 22 Aug 2026 22:31:32 +0530
Message-Id: <20260822-add-lt9211c-bridge-v7-0-7dcf567d57c4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOzViWoC/33Nz07DMAwG8FeZciaT7fxrOfEeE4cmcVmkbYVkq
 0BT351sEoxDysXSZ33++SoK58RFPG+uIvOcSppONbinjQj74fTGMsWaBQEZ6BHkEKM8nHtCDNL
 nFGvDDIRj8Bg6UKIevmce0+cd3b3WvE/lPOWv+48Zb9t/uRklSj2SchpGRsCXqZTtx2U4hOl43
 NYhbupMvxIiuKZEEqQHi5ZJaXBhRVIPibBrSqpKyAzWwQDR04qk/0ikm5KukgbLTnGgLpgVyfx
 IFhSppmSq1AervAdlAroVyT4kh31TslViYyMRGjKdbUjLsnwDPEqhnC0CAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787418096; l=5171;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=QmWDWLfCF0EHI81LeMSM7a5pZomyuJQxVTyP7Kma7+w=;
 b=ReO/BERFBByBDzV0H6V7whopYBk5qar04SjGMWr/sBWDLiqdTixFeuCNZVuETO3HHEwGQnJe4
 c7jq4vRIYx0CZyQhy19Aq6TuM0OPDGQNLkmPlpKXPN0WeMjIrHxZ8Fq
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: YfUof8IC5vO9qybzy6dovTHMc2KLuYyi
X-Proofpoint-GUID: YfUof8IC5vO9qybzy6dovTHMc2KLuYyi
X-Authority-Analysis: v=2.4 cv=KuF9H2WN c=1 sm=1 tr=0 ts=6a89d5f9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=j8kyfJY6CSYuxqjyPqsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIyMDE0MiBTYWx0ZWRfX/3tR0R5M62A+
 83Co7maR9FQIyV3CLXi4DMt0LTv1dvATYJiqyG3NEqjaW06vgAoyVEek/H6KZ6STI/xz3CA7JC2
 YsQTZ9kCyIsmmZayC7XOmXT34Ws8/6e4FYIS5rGTcbPLS1+PG/FXjRz9ttBagH0/B6BOZ6CrJIu
 Bz+KA9bCY62iwVLMTcYI88qkCM8JHdhHKJ0vwZVsDYJoRFdOJcdOPedmboITwf19OicJ08V5z4D
 sj4lz0X5n9CoRMDMSBE7CdJaIK10yyI324nzxbfaeKYzJLeknEIOpOhLs5/G0tZ9kCE5/pDPXFx
 IkOweMBdEG1r5vag4FhMTR7b6UVBgIZdPW0aGv7k8yy0gZJ3EvwcqiB4mHgwHhZwlgAepWUln9t
 McyZAXCamiOldtiY6BjXCF87xFUwrH93RTL4Ft4fXVwTGX86hu+nCBESn281WrVaPQBSmIwx4ok
 Gee4ASN6P2jMFScxM6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIyMDE0MiBTYWx0ZWRfXxGTTwHsgUyNG
 p/dCKDmixKKKlkCSXXXPSzaOLv0aM91a17Qwxqz6hyZOjkb7CoXmojGAfM9cfoac8mfze1Gd44B
 IyidM/zz7OZ8iNNZ4UkCK4qQVZILoz4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-22_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608220142

LT9211c is a Single/Dual-Link DSI/LVDS or Single DPI input to
Single-link/Dual-Link DSI/LVDS or Single DPI output bridge chip.
This adds support for DSI to LVDS bridge configuration. By extending the
existing lontium-lt9211 driver to support DSI-to-LVDS bridge configuration.

Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
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
 drivers/gpu/drm/bridge/lontium-lt9211.c            | 838 ++++++++++++++++++++-
 2 files changed, 808 insertions(+), 35 deletions(-)
---
base-commit: 063019ac51afffda4ab3d658701b086caa0c8e9e
change-id: 20250910-add-lt9211c-bridge-5a21fcb1c803

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

