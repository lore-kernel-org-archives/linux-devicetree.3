Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFBD382F10
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 19:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788376850; cv=none; b=pAEfwDn0EOoE4G3jwkFDK1qAijKYJ0sp99fwXEG0kyUnvYTF9bEcGu8RXScYfz0rpLsCCO7nCuuOgvPtxwCiDpnoJBzWRyyy8FbFzL7pPQuHgZdIn7K71GabqlrdmcoF7pnsc2KpewbnuFTDAquZfslleEFRcao1WJdjqSuZgG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788376850; c=relaxed/simple;
	bh=YRBcwb3rmTCMGniH5xHNIKt+pxd7rS35BHK0rO9uglg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AY4ciB0qCwGGU928LpWJRT5OVh9n10mvJRPXi9nPHIbxmIoC7ICfSEGi6Q3g7w/qzCNmc13+maNyJ0zsRPDqEi+NCoaNtqydnBJgMdvav+ZOd5RvyHzOA/77qoQ1pwYiIP0mEAs/8arg3VB2duxVo4Up3JQ8jgb2pgArShMvieM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UOC/GAia; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OtEBwo9+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UOC/GAia";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OtEBwo9+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrFqd2976078
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 19:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4IHF21fFv5lOMUj439vkGf
	Pif670Wz2pKcYh+3cFa1I=; b=UOC/GAia0T6K3R6xDvp0afN9kjgEU6FnLCAGZX
	Q+OmWUGupSjGEP+7QBIQloDWTgZTmgAupfOzVFMcYRK+fIA1WkT3M9AHBQjB3HqF
	oK1Lcx8fKwzh2vUM828UAab/CUjIQP5W9QjqXVU5cO3jQulLPwPdKctZHnm6HQj5
	LEzocrQ1D4JR5W73jZ2kzMxTJz/lSTSEvLHmAxMIk5nKpUvgFbBEWUGqmUwLH3zs
	3BH6a6IRrYymcjOUR61yiNuiQ5doK3R+XVUj3nT53HPyiWBaHO3MPs8gUUsbiArm
	oSk3Iz3CR7dRPUNQz5b2BXEs1DUY4Z335oJWSUzgi6ezVLqg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdn8fbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 19:20:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso2215781a12.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 12:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788376846; x=1788981646; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4IHF21fFv5lOMUj439vkGfPif670Wz2pKcYh+3cFa1I=;
        b=OtEBwo9+UX1nDLlkqc6cfWnGY+moemG5QO4ZGFp4SJ6wP/C+tTWndmgcjKZc+2YhBi
         dINK/79c8KDNdRhdrnfkTQZSlFYhkGV0ojLqrte2xGGUsu+sAu1rU8jKscsq+xK6L2sF
         MNZG3JzHMcgMWZVIhMlxzVAF5X08wXfv1eReYRylRw0EocqHb6brTSPMCUL+2SAJoOJ/
         //AmX0JGVb2y6tJhzKfb/Sa1LhvagqvafjkGybv7gkebg9ALsUcQq4dSUfSeaAgrMo7c
         xMmzdoP5M4jiJXvhlqswcrSD+FeY/FsBaDRIQVUw2BRAiQ8hyPhmYJh+5z8TuN0zDdJJ
         lnMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788376846; x=1788981646;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4IHF21fFv5lOMUj439vkGfPif670Wz2pKcYh+3cFa1I=;
        b=ON5d/4UrX4MMTjEJys06HdFJuD947DveqWSoOZqFBv7S1zpF5yCzBk6ym8NgWv7AuH
         0rHhuXD4dFZOaY6SGxl42BBaoEUDuPFMeLawfM12gydYGiMLkoIPM7iHiBmkRkOLOFKk
         vMyoYtAnzQ7mPnQq1b0tjNo18GpFohu6YZAYC3/kj4tdowpTQ8Zmk/3MTocUP9hOh1O5
         t7oSUTnc3x2Bkh2bYAGDQkzV4k6ybEe3l/BOt2fWQkdZyNiKsky3BnI9TSD22BJaUL78
         0dDn7/IkWv0yMKXT3mbsZ5fbBlKaGgp+O0XZSwit4Kb5Ixtcy2BzZ17mxkuSzxglZB9r
         +iyw==
X-Forwarded-Encrypted: i=1; AKwUvBzSP/VzDab2Ua99jXlLIRh4gk34fXYQHKxoXw8tE52XpG57Wj+qlbmK+PpHWQDg/yQ343aFT1NA7B+J@vger.kernel.org
X-Gm-Message-State: AFuF++n3gHznU+yFWHxMDpKZR6JY98SfJP+ZhqgsS1BhfNRdQ2dIKtp/
	zO+ocqJGaZnPMRZ9jzEq+c1nntmZ7R3sNOdQtPhcFu38yzLRKzmSTdHwnE/qg4Lr4u/kP349lPD
	5kE/x7zrJilqKeWjNWb7bQGbM+ThhSIf3j5Fs4Vbu/Ul/e6Xy/5HYNg+0SWqoQsXR
X-Gm-Gg: AYBFou32oWzqZ+ZKvYO0QvqRkybbJp/uojIJGkuvq0rY6008pK+qXa1PK2LudY/u9I3
	tu8wAwMNluFTFikE4Il5SrfygJxLvwahQHluQQsJZHwjTGp5tScMqIB/IR39zGlQeY/emOr+huq
	eIJMNMLs5j2fD8rOcMmNIIt1XznHKdpkv4wj0S+Zuva4/ImBb9srjynOwAWNXeDvs4KObPrrboh
	PRw+0/GlUD62ahH453bOAplzjHUnIym9tRb5QRVTGnfYgSHeB76OOX3qByGZnV+UBmK4509Iy0U
	E1zc2ye9y/qM6U9HCOaPY/gcKQ7c8NNPEG19hS+dI8N28Bsm/Aoq+YJMv0lsU5deHJyHjRNc+4T
	Fblg1vb5BJ0hpMSIhfwjG+tNFFQ==
X-Received: by 2002:a17:90a:c10e:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-39aedff8438mr10851357a91.10.1788376846293;
        Wed, 02 Sep 2026 12:20:46 -0700 (PDT)
X-Received: by 2002:a17:90a:c10e:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-39aedff8438mr10851264a91.10.1788376845564;
        Wed, 02 Sep 2026 12:20:45 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255e3172asm244765eec.17.2026.09.02.12.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:20:45 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Subject: [PATCH v12 0/2] Subject: Add Lontium LT9611C(EX/UXD) MIPI DSI to
 HDMI driver
Date: Thu, 03 Sep 2026 00:50:32 +0530
Message-Id: <20260903-lt9611c-v7-v12-0-9414d2b3bd6d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAB3mGoC/3XQ22oDIRAG4FcJXtfg6Opor/oeIRceG0uSbdeNt
 IR997ppobvQBRkYGT9/5k5KHHIs5Hl3J0OsueT+2hrgTzviT/b6GmkO7YJwxhVDpul5NArA04o
 0JVSOB3BJJtIevA8x5c+Hdjj+9OXm3qIfZ2GeOOUy9sPX47uK89wvDGoJt8MoSiksdChk8i99K
 fuPmz37/nLZt0Jmv+qFwFfRqm6CC5aDcskmgRuC+RM061aCaYLouLCotFRBbAjAlsQ6BLBmxGi
 YBaGC5nbLgIXB1zEAZsN1Fo130uB/u5im6RszbTOmygEAAA==
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788376838; l=10451;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=YRBcwb3rmTCMGniH5xHNIKt+pxd7rS35BHK0rO9uglg=;
 b=pbmvWStE70a7YwIYvOn3s/SjSOY44hS6CH316v83kGkvrnsB5HXr0CKbITcskHchxUYihrhKk
 7neBoyG8eihDV4n2TEc4XDBVdD35BumpM0OAgFZQeazAFpYmgbdXK1w
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a98770f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8
 a=e5mUnYsNAAAA:8 a=AALwXPcTADLwKW-B6QkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=RuZk68QooNbwfxovefhk:22 a=cvBusfyB2V15izCimMoJ:22
 a=D0XLA9XvdZm18NrgonBM:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MSBTYWx0ZWRfXyBgYHsKZE3Ea
 Br9o3W64QzGbW4Y77DpXiF2fru/by6A/QXerxcDf43WU3WyMMbulcxXaR1M9OrQCwuqvQu3CxjE
 owQir9ETj8uRIsNZDPXzdMbhU5Fuq5E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MSBTYWx0ZWRfX9Xro35TqOWZn
 Y7RRBsCMQZ1wQqH8jGhnGFz4ZKznhHjgV2ny0qGKe6wC4xxS4210kR/cbEizomIRvmr4ZU08NIf
 82i2kZhXs1RU8+GA/XPx/7AHNhqufCFFx5zYcKOwgAZAO1otqAj9Xg+xkcaEXRs5jHB9rq0r41C
 NBTvSqNT91gAE07ANYzNdEZ+/9cPKXUhdhx5SdZP5WOElTpC3q2tGWf4jF6mBY/5jxO8yy8czZj
 /OWtrTm9otH5DkZ9zxf9YZjG0PVTRwMeQC6kkWqA2LsCUgFPmUo1pZ3xYHQvKxz9KuelTYbbK3O
 QJNAP7iqOOmcF+BKLEuHOAoIPAJmCZ0kcEiMJfCEix/2JZnTebCujWqz6YCBfvpLTTU+9RcKTPf
 CaydS0MKQgphbin09g863QYsT78t4DDAmW6FQ70XQP7gU6pIa3+OygSss9iCLl9s2U3AGdwj8qW
 6Vh1Pqgy7gt7JofkocQ==
X-Proofpoint-GUID: _6bHNN1ma9j9yiFY3cBUn2PChzhqZOSp
X-Proofpoint-ORIG-GUID: _6bHNN1ma9j9yiFY3cBUn2PChzhqZOSp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020171

This series introduces:
  - A device tree binding YAML file describing the hardware
  - A new DRM bridge driver implementing the basic functionality

  LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
  mipi dsi and output hdmi, differences in hardware features:
  - LT9611C: supports 1-port mipi dsi to hdmi 1.4
  - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
  - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0

Changes in v12:
- Fix audio deadlock in lt9611c_hdmi_audio_prepare: release mcu_lock before
  calling drm_atomic_helper_connector_hdmi_update_audio_infoframe which
  re-enters the driver via lt9611c_hdmi_write_audio_infoframe
- Move lock acquisition from lt9611c_write_infoframe/lt9611c_clear_infoframe
  helpers to individual bridge callbacks; add lockdep_assert_held in helpers
- Remove unused includes: platform_device.h, drm_drv.h, drm_print.h, drm_of.h,
  unaligned.h
- Remove DRM_PANEL_BRIDGE from Kconfig (unused)
- Fix copyright: (c) -> (C) for Qualcomm line
- Remove dsi0_node, dsi1_node, dsi0, dsi1 from struct lt9611c; make them
  local to probe using __free(device_node) and local dsi pointer
- Replace chip_type/max_tmds_rate fields with single cdata pointer in struct
- Fix sysfs NULL dereference race: move i2c_set_clientdata to top of probe
- Fix concurrent crc8_populate_msb: move to module_init
- Fix i2c_device_id: remove vendor prefix (was a workaround for NULL driver_data)
- Replace timing_data byte array with named struct using __be16 fields
- Rename page to npages in lt9611c_write_data
- Move loop-local variables inside loop in lt9611c_write_data
- Add DRM_BRIDGE_ATTACH_NO_CONNECTOR check in bridge_attach
- Use sizeof(timing_data) instead of ARRAY_SIZE
- Move regulator_bulk_enable inside lt9611c_regulator_init
- Various nits: comment spacing, blank lines, variable initialization
- Link to v11: https://lore.kernel.org/dri-devel/20260824-lt9611c-v7-v11-0-eb4a79cb597c@oss.qualcomm.com/

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
 drivers/gpu/drm/bridge/Kconfig                     |   17 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/lontium-lt9611c.c           | 1290 ++++++++++++++++++++
 5 files changed, 1334 insertions(+), 2 deletions(-)
---
base-commit: 34e27b90552acf21bd73aac395667c8aae6da480
change-id: 20260708-lt9611c-v7-ff76b2d1bf5f

Best regards,
--  
Mohit Dsor <mohit.dsor@oss.qualcomm.com>

