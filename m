Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379F142F718
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787580402; cv=none; b=Q/9+RdqJzHQ30MVEvHVA8V2GJtu2PQX5LMudp9S5Nnz2xj6mLgAPSsfKJLY5xazbJ1Fl5H8Al+3H1N9eIN+4GCBrcapubWsTXkiX1iORr4aGZYjfgDbH42W70L2kBUxK1fXql3QMW+Rg96crXEt591xsjOR73xxHF7ngrAwTNPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787580402; c=relaxed/simple;
	bh=LeKqNyi2qAwMUGa/PJSBLqVe5zEJPrBOxPAH33oSSrI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Mrh1SbES4nJe9/+R00D7HCHv/qf/O42tho27AetyzhlAOhGGqjI2ruUhhlcUR7bAt0iDeP2l5Rndz2FvCbXEtXFY2a++W5yDjXwoYChZi6F7AMp5dAZQ0g30P7hrkSy8n4YqWlVYTc9TI4XQeUDjFIx3rHqCNCO0C8tbGixEz50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HqrtBBE0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J0aqwo+2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HqrtBBE0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J0aqwo+2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OD9LUU3102953
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NrVp1848b5yws/YHQ7GLPr
	aflTdUrlMYStP7mRmwfwk=; b=HqrtBBE0cV2HHlyFOmWhjqg5PgMfVR1x/YsMj9
	any+/pIvokvRqukYMlSM/dVWzdmcfP3OiDuHkryc849QnFwjx2Nkq3Js6j16Ri2I
	Sc1wuPDVXojn6IFPjY5FZxEXC46Bjf0plPBcxDzw9RKyGadP1ojEiXqIWkPOIM2q
	aTq6x7GxSNLzqdYwtBa6+TTuxM0Dwn0HpLHEY0w1EKgvaFacpTC8CSoAgTA0BOH+
	1dLh5jlSiL8SWQDfxWNhvsgMJj+MmCA1rsZlQx4tZlhk/hcvnT91Vc3PSGV7gL52
	0AR0JyqQWOlVpBbnN1gmU97Z4nGfedHKcheFC80fckBcXClA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8pkdg7ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:06:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84859a64079so5753125b3a.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787580398; x=1788185198; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NrVp1848b5yws/YHQ7GLPraflTdUrlMYStP7mRmwfwk=;
        b=J0aqwo+2neYr3yl2HvTvYO26EfQNnKTE6IaFBiiM54uWjUkaRY0QsfhzOe+uNJgwvL
         Z5d+dNcb6yUzEbIqBLWCu5TM4D77l3371oO1E6A39g1W5wdDQSpbOsF8odeJjK/WDK6w
         HNpcnRDVtWZPr8NXoF3OiUbLlqtxguN34rfBAR815pYnXwtVB/ztvnA6ik4ff7XqEdaT
         na+WOXrj+UmaVIE3p0abOQL9qMik15k7vptJ0qNXBNtMTY7m+VQIBaLKYizm69QjQrbd
         wNDGWBjXmWfJ/a6Uv7xfJTkpz4BOrmK418TF1KZbNAG5RS7j0otMQM8hcZVkMkvvKi8d
         Hn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787580398; x=1788185198;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NrVp1848b5yws/YHQ7GLPraflTdUrlMYStP7mRmwfwk=;
        b=rpTRZLVGvBqr70veD/1nFHV9Ny/QrdZY60ayWbeP60LBiPGv2zBu/Dj4eE0+FVtct/
         /h8cNScEZyBgACUtxBnIbB93pRQrM+abqIQ8/7Id1DLeKusXq09L2bQ7A1nkdIFpaJcZ
         6V8Q6I6ENS5I/6iaH0DkHTmDQu3JHPVSSHrGStqniCxaaiiVEdsl/AIx0mqJpaK9evoB
         nPpTuhQku3pUH9ouel7Q3yU8okE1HUWTjuF7APCdKriEmrIWUUujEiezN9F5G2JTjUHq
         3qRBYfaVwn74GyaPSJG5suWkVd7bxtP1KspbSaJ75D/QficEoUJGhwLow0lO91guLnoi
         aELg==
X-Forwarded-Encrypted: i=1; AHgh+RrbCsUbvCJX2NnDu88TUgkrMAa0eSP3+f6shqaU3bsXN+/CYplYQcTGZIhtKLaMkqg3f4VmS7M+sNjB@vger.kernel.org
X-Gm-Message-State: AFuF++kLknXO9ThaXNWcxyU16gdwl4PRopCpHovKAq56VgDOoMTSC4Yr
	V/sQjy7RuANn6VqQakns/5gJD7OZVfHNXYqm/H7vZ3/VIOtK7YS22GlfBJAZZcs+FLm4U8LcXIO
	Sny8NfI1tKVFaUB0jYZKX50bg8C4jRddPhUlGMVwZhPfWSeceBIU7m+Zr4ZaY9CKi
X-Gm-Gg: AR+sD12VpLnslLGJKzDPN3BtV5iwzZq6pBBAMFmDwYVrxhJu6zWBi+xQ2wcD8TAYoX3
	4ParG0OSlpDcshpjyMbBNsa20dxKJJYN+ylEQ8tZ1WJAsiYrUKTA4Aji1JmDJUynglzUuDC1rs2
	oaBUHrK8tWyQ4ZgHBiYbFldcIpqE8+uPwh3Gb2OnLRbjDKU1MPj/ED6N4Z+MLKr1FwQWvgfCj1Z
	D+ZRWBXdtR3mCEwDtebhxaLtkOVEbfuFFjwtsHND5oMqSEbDdfCnurL4UVKo4wZIhw3e/0FCkUT
	BaadazXrWrqbz6i6Fox1n+9NCfaLSYCvSsdXKZi3dg1DRXTb5n5H2trwbQYIHBKNH9Bg8w799ii
	PITnifDbfojOFd6FcoGx9KrdVIg==
X-Received: by 2002:a05:6a00:4c98:b0:84f:dc19:b77d with SMTP id d2e1a72fcca58-851fa011e87mr47775180b3a.12.1787580397751;
        Mon, 24 Aug 2026 07:06:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c98:b0:84f:dc19:b77d with SMTP id d2e1a72fcca58-851fa011e87mr47775002b3a.12.1787580397105;
        Mon, 24 Aug 2026 07:06:37 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f17f7d6sm2146599b3a.61.2026.08.24.07.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:06:36 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Subject: [PATCH v11 0/2] Subject: Add Lontium LT9611C(EX/UXD) MIPI DSI to
 HDMI driver
Date: Mon, 24 Aug 2026 19:36:26 +0530
Message-Id: <20260824-lt9611c-v7-v11-0-eb4a79cb597c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOJPjGoC/3XO2wrCMAwA0F+RPltp2vUyn/wP8aFXrajTdRZF9
 u92KriBQggkJCd5oOTb6BNazh6o9Tmm2JxKATCfIbvTp63H0ZUGooQKIonCh64WABZniUOQwlA
 HJvCAysK59SHeXtp6867T1ey97QZhmNjF1DXt/XUuy2HuA4MYwyUIlpwzDZVkPNhVk9LictUH2
 xyPi5LQ4Gc1EujktayKYJymIEzQgck/Qv0VFKkmQl0EVlGmpVBcOPZHADImpk8AKYb3NdHAhFN
 U/zD6vn8Cn710XoYBAAA=
X-Change-ID: 20260708-lt9611c-v7-ff76b2d1bf5f
To: Sunyun Yang <syyang@lontium.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
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
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExOCBTYWx0ZWRfX3U0vgHQgb1xv
 YfolF40J1IiYsusiA/VNQ/wca/kk2o+0ihRbZJTZd3KMFX0Vw0FT/n+7Tf96oVvDiIiK6BVWJcw
 Y2l9WpeNyGC49AM1xlU4TWKiDYmRbUc=
X-Proofpoint-ORIG-GUID: pczUJe212FbadPFNvtiytub97F-Om6nh
X-Proofpoint-GUID: pczUJe212FbadPFNvtiytub97F-Om6nh
X-Authority-Analysis: v=2.4 cv=Kq19H2WN c=1 sm=1 tr=0 ts=6a8c4fee cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8
 a=e5mUnYsNAAAA:8 a=zeht-xdHoPxp13dTMxwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=RuZk68QooNbwfxovefhk:22 a=cvBusfyB2V15izCimMoJ:22
 a=D0XLA9XvdZm18NrgonBM:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExOCBTYWx0ZWRfX0fGzcuplDDfS
 AO799QnfwRj58VM+Eu9gSeFDtgXS97tvFsaEhWKm9k2e5J2hn6UxSzZ3NjHjxnog6S/Dj+VJGgp
 p7VaIpYVoJbAh6a1kDKvyWG7aK/7zQfvRTg0aFiala4ca/TUTTs0IGTsEGw+wxSPfPt4IZQjC4v
 lxSIMWsLHsKz2DSOW6NVru3P6uLxQW83fxPgSI+i1ECmRT+WSjgl1cz3iUT5TdbyNNGG5z+LwBM
 6o6AkedypoZLE+xa3fGDkhu1nQ/ZO5Usd0spOBpHFMosaKYsy1SFUaT4hgcRWtHKo8FRkHIlRKI
 S/UoOu2g3VS0L3tJPu16oNR3EOBg46EJpUey1LmtB6VnQFc68XLmFGKILrxqMcN+ap+GOt9kSow
 Em+X3gw0IEsK8W9cxVxdQw811l8iLIlSRg0tXfkPd7B1zYPCJFfqbAYZUpBFJ6+k4t6Fzhlx3OB
 Qwkf7O4wwflvT2ftLAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240118

This series introduces:
  - A device tree binding YAML file describing the hardware
  - A new DRM bridge driver implementing the basic functionality

  LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
  mipi dsi and output hdmi, differences in hardware features:
  - LT9611C: supports 1-port mipi dsi to hdmi 1.4
  - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
  - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0

Changes in v11:
- Fix firmware path: use "Lontium/lt9611c_fw.bin" to match linux-firmware layout
- Link to v10: https://lore.kernel.org/dri-devel/20260808-lt9611c-v7-v10-0-ee90a136d82a@oss.qualcomm.com/

Changes in v10:
- Fix lt9611c_block_erase: check return value of read_poll_timeout to avoid writing to un-erased flash
- Fix NULL dereference: check i2c_get_match_data() return value before dereferencing
- Fix irq handler: return IRQ_NONE when BIT(0) is not set
- Fix devm_drm_bridge_add: check and propagate error return
- Fix use-after-free in remove: call disable_irq() before cancel_work_sync()
- Fix bridge/regulator ordering in remove: use drm_bridge_add/drm_bridge_remove explicitly so bridge is unregistered before regulators are disabled
- Promote firmware upgrade success log from dev_dbg to dev_info
- Link to v9: https://lore.kernel.org/lkml/20260804-lt9611c-v7-v9-0-3423a76856d3@oss.qualcomm.com/

Changes in v9:
- Use regmap_bulk_write for 4-byte header write in read_write_flow
- Replace while(1) loop with read_poll_timeout in lt9611c_block_erase; read_flash_reg_status now returns unsigned int
- Fix unchecked regmap_read in lt9611c_upgrade_result; return -EIO on CRC mismatch
- Add struct lt9611c_chip_data with chip_type and max_tmds_rate; fix i2c_device_id table driver_data to use chip data pointers
- Use put_unaligned_be16() to replace manual high/low byte splits in lt9611c_video_setup
- Extract lt9611c_write_infoframe() and lt9611c_clear_infoframe() helpers; consolidate 6 infoframe functions into 2 helpers
- Remove lt9611c_hdmi_audio_startup and its bridge_funcs entry
- Remove hpd_enable callback from bridge_funcs
- Fix scoped_guard(mutex) deadlock in audio_prepare: release lock before calling drm_atomic_helper_connector_hdmi_update_audio_infoframe()
- Fix probe order: lt9611c_reset() before enable_irq()
- Fix remove(): remove disable_irq() (IRQ is devm_request_threaded_irq-managed)
- Fix bridge_suspend() unwind: on regulator_bulk_disable failure, de-assert reset and re-enable IRQ
- Move devm_drm_bridge_add to after both DSI attaches; remove cancel_work_sync from err_remove_bridge label
- Move request_firmware outside mcu_lock in lt9611c_firmware_upgrade; lock only wraps hardware access
- Re-read lt9611c->fw_version after successful firmware_store upgrade
- Rename ocm_lock to mcu_lock throughout
- Use goto err_put_dsi1 to eliminate duplicate DSI cleanup in probe error path
- Fix mcu_lock comment to correctly describe what it protects
- dt-binding: add if:then: block to disallow port@1 when compatible is lontium,lt9611c
- Rename sysfs ABI doc to sysfs-driver-lontium; rename sysfs attribute from lt9611c_firmware to firmware
- Kconfig: add I2C to depends on to satisfy REGMAP_I2C dependency
- Link to v8: https://lore.kernel.org/lkml/20260728-lt9611c-v7-v8-0-bda216bfaf37@oss.qualcomm.com/

  Changes in v8:
  - Refactor lt9611c_read_write_flow() to take a struct lt9611c_cmd parameter with an embedded struct lt9611c_cmd_hdr (func,
  type, seq, sep) and optional data payload, eliminating raw byte arrays at call sites
  - Add LT9611C_CMD_HDR_SIZE, LT9611C_EDID_BUF_SIZE constants to replace magic numbers
  - Use container_of_const() in bridge_to_lt9611c_const()
  - Remove obvious /*read only*/ comment
  - Use unsigned long cast instead of uintptr_t for chip type initialization
  - Replace memset + memcpy with memcpy + memset for CRC buffer preparation
  - Add ABI documentation for lt9611c_firmware sysfs attribute
  - Fix Kconfig help text to proper prose within line limits
  - Add disable_irq() before cancel_work_sync() in lt9611c_remove()
  - Add cancel_work_sync() in lt9611c_bridge_suspend()
  - Inline lt9611c_gpio_init() into probe
  - Use of_drm_get_bridge_by_endpoint() instead of drm_of_find_panel_or_bridge() + drm_bridge_get()
  - Return error if LT9611C (single DSI only) is configured with dual DSI in device tree
  - Move HPD status read_write_flow call from IRQ handler to lt9611c_hpd_work workqueue
  - Removed second lt9611_reset call from probe as not needed
  - Add struct lt9611c_rsp symmetric to struct lt9611c_cmd — both embed struct lt9611c_cmd_hdr
  - Link to v7: https://lore.kernel.org/lkml/20260716-lt9611c-v7-v7-0-7553a14735fc@oss.qualcomm.com/

  Changes in v7:
  - Use i2c_get_match_data() for chip type initialization
  - Implement hdmi_write_hdmi_infoframe/hdmi_clear_hdmi_infoframe
  - Use drm_atomic_commit in bridge callbacks
  - Removing redundant lt9611c_reset() call and cleanup in probe error
    path
  - Populate bridge.vendor and bridge.product
  - implement hpd_enable callback
  - fix DT parsing and bridge refcount
  - Removed pre_enable and post_disable callbacks, it was affecting hpd
    as regulator was disabled
  - Changed reset gpio enablement and lt9611c_reset api.
  - Link to v6: https://lore.kernel.org/all/20260508134009.4582-1-syyang@lontium.com/

  Changes in v6:
  - dt-binding:
   1. sorted the compatible list alphabetically.                     [Dmitry]
  - Link to v5: https://lore.kernel.org/lkml/20260507024214.97708-1-syyang@lontium.com/

  Changes in v5:
  - drm/bridge:
   1. use #define FW_FILE "Lontium/lt9611c_fw.bin" to match linux-firmware    [Dmitry]
   2. add atomic state management
  - Link to v4: https://lore.kernel.org/lkml/20260506095100.78998-1-syyang@lontium.com/

  Changes in v4:
  - dt-binding:
   1. fix commit message                                                    [Krzysztof]
  - drm/bridge:
   1. use lt9611c_fw.bin                                                     [Dmitry]
   3. use enum lt9611_chip_type
   4. remove *fw from the lt9611c struct
   5. use read_poll_timeout and -ETIMEDOUT
   6. replace mutex_lock with guard(mutex) in some places
   7. switch to ARRAY_SIZE instead of specifying lengths directly
   8. use dev_err_probe
   9. add clear functions for AVI and audio infoframes
   10. add DRM_BRIDGE_OP_HDMI and remove .hpd_notify
   11. replace "GPL v2" with "GPL"
  - Link to v3: https://lore.kernel.org/lkml/20260420061644.1251070-1-syyang@lontium.com/

  Changes in v3:
  - dt-binding:
   1. lt9611c(ex/uxd) content merged into lontium,lt9611.yaml
  - drm/bridge:
   1. Drop the licence text, only use SPDX header
   2. Sort the headers
   3. Use library functions for crc8
   4. Use paged writes as implemented for LT9611C(EX/UXD)
   5. Use HDMI audio helpers
   6. Replace devm_kzalloc with devm_drm_bridge_alloc
   7. Remove extra kthread
  - Link to v1: https://lore.kernel.org/lkml/20250903123825.1721443-1-syyang@lontium.com/

  Changes in v2:
   1. Forget modify code, operation error, Please disregard this submit.

  Changes in v1:
  - dt-binding:
   1. Submit the first version of the code.
  - drm/bridge:
   1. Submit the first version of the code.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
To: Andrzej Hajda <andrzej.hajda@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Robert Foss <rfoss@kernel.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
To: Jonas Karlman <jonas@kwiboo.se>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Sunyun Yang (2):
      dt-bindings: bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver
      drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver

 Documentation/ABI/testing/sysfs-lontium-firmware   |   10 +
 .../bindings/display/bridge/lontium,lt9611.yaml    |   18 +-
 drivers/gpu/drm/bridge/Kconfig                     |   18 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/lontium-lt9611c.c           | 1283 ++++++++++++++++++++
 5 files changed, 1328 insertions(+), 2 deletions(-)
---
base-commit: 34e27b90552acf21bd73aac395667c8aae6da480
change-id: 20260708-lt9611c-v7-ff76b2d1bf5f

Best regards,
--  
Mohit Dsor <mohit.dsor@oss.qualcomm.com>

