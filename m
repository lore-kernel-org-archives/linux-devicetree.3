Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B643D954F
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 13:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086323; cv=none; b=GHOawSF+yqDS2CuhTEMQf9w52Y5H7GHTX5tXpfM+MqO13aA9LCUfEHOkPo/4HgJW280TwMPwAfu8h+M43hnwF3WhIjPjOFYUmTEctvr9zcOfSNbp2zrVrFV/mDZ9ELnshSDVUD7Zgq4pyXPdgr982lQK7Doy35k2iZr9I7DiZL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086323; c=relaxed/simple;
	bh=7eReWioRb+Q+/KfAGRVYTSy1rse7P0q70/gtXocnlCo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GDtZtnukERuC1nvpQgbQZBzb4k0GtWFIiStAFZx6hp2+sYOFCxdmcWzgNoxLt2CQfiEfxG8BohAMjhq8Jt9Lr7luZXCY4WDfLzFm1e8MkjV2kn6hTWR14qCdrlxeCHjX7FiMLC48ZaGJs1HeLf9h8a9TvMHKABk0FfMQ2lSKq18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gK54V1c4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a0wDD9nT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gK54V1c4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a0wDD9nT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663A2tuw3772692
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 13:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YZQ9i8ECl/iEEdcBdY078g
	6tJYsRn3VFW0APH0rESAY=; b=gK54V1c4g+ZP7nyCcFy/pshCNy9BgG6htW+8fu
	v1V+om4aFOmwVa/nJTniffCMLFHpCU5q4rNM7Me1+7/9bQH3CwDw3tRqF5uu1A0I
	1zC/mczKB9DS+2ezT8PvxD3kWSFNuUKmm+wjvsoNiufs/NAAh1HtGZM5nFMydVHU
	Zbtf1JUbtn4ddoBqhhFdduy/exsttKWpt+n24Q6OUHi84meCGo6yRGEaTCPKBgzA
	QX1H0bqT1XGkwXaf4pMTLS/pTVDluvKHJ5c6cDIj+fVmpVxCoGHVQA0NQiPZN32t
	HJby9+Vg8KP5Xym+yi57LlroU8bK6DC9iOnQGOGYuGKIX5ig==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b038tvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 13:45:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e56b2b350so117670785a.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 06:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783086320; x=1783691120; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YZQ9i8ECl/iEEdcBdY078g6tJYsRn3VFW0APH0rESAY=;
        b=a0wDD9nTcd6v0q0DxmUn3OVSh4PoGMgPimmMfYj0zgxuMFI0MjLMylhtgK7dsF7OMX
         pvcqKWUPE6Nf70fZvrjjcZWsbPihMmdrJ/qoEewG1ERsy//StUUfTzJ6XC62XYFBEY9Z
         ivx6plEQtJal/o/F1dAU/fWidH3Zyz1xYmQ94gEVWa4dCwIKCru3wMo4t0KSRLobJFwJ
         Wd6Xcmv6g8P9xq82L4QwkL57Br0RtrsL1xtxwPaeYNEeAm8zGDMyctq/wsYBLcZ/kbAS
         mK7gtRlN/4oBdQ8V9CuB0OBLoiEqr1rkLADqY8vgy/ajxjkUGdKEVxCRVpzPyTjIgZLr
         ZCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783086320; x=1783691120;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YZQ9i8ECl/iEEdcBdY078g6tJYsRn3VFW0APH0rESAY=;
        b=JMsm1dq/p0VMYCc5LPwawiiVC1Yum6OGJ5Xi2xbbBqQ1Vv8bFj2Stwk3MPasGzCDqv
         QuhPn8ZoCvWgPKSzkCHf9K42TZnI7/VubrAQkhpFy3LvEqw/3DdC10hjAofP5bYz5JdW
         j1KtWWV7utkF3swZSyULQQ9PMJolC984N6cHYkvKs+h03URmyJFJnaq95KSz4Zx6mtaT
         Uo2D8DZ3un5CVWKqr/hfWe30KoMDZE7iqMbMvkaL2Xd/YQJslrvXYPXxTtmvS7V3kFx8
         blCnPLqUAzP5tm8DdrLHjUpMXRlG5VZj1IeXOdhJuT6ZXO7PmgnzVL2iVavd2WMWILzV
         Ds3g==
X-Forwarded-Encrypted: i=1; AFNElJ938EQyv3XwC1wVEt8NNRtize2MQ9vC9s2XkTrHSCtUdMVoZxHj20aJ6W6DLuKh3/3AFdrLLHURm8e0@vger.kernel.org
X-Gm-Message-State: AOJu0YzLrVnjPCJLsJIWgYtFwvsF2qicLQsJVZLPR/IyELckU4EFoRMk
	FpvTQ0BtbmQEgv2YszWJ+oIE/4sh+IYfrcGBvoFc3O2EbKI92xRRAaE61nVyC7UfqFoSXkJyVao
	mlBuD5+cRhk9AmifYsSHrcTpH2OoirWft6CYL/API5Ne03qvnNf2KoFiwZoTvz6iU
X-Gm-Gg: AfdE7clq4tqbyItOnrIPstAyy7awMhgLmiJ2cHprtck0e/EySxEYh85Oy3HXuB5r1Do
	VzuIRRFlMJNdQWjKz8zkOnRqKFyd2aeDpgeez4d5qhovwyM0siac+gEpYAcHDBJLvSfNGS0UjLq
	O6Tw8ar/h7bVo4Me9B2QRrCf3iMyxM7ubrslQ8yUZ5oebstrLCxICDOlawPzNTPPT2rlBT/ljKy
	q2FR9nBfsAypHLYaFYp5ZlDlqhkWNl2WP7LipQEmouqGgFPKvtbXG4TZFln+cBtwJJEopNAr6V6
	+njY3Z51J+N3Uj1B50GJTUfqLK/3ZjZwwhtzYmb9pakPOaYnhuvOW4bvtkzfHQPxEaUS8BJmHXV
	0HVynw0rHZP2zPDw/qiRTMhtUo63p00AF5TakDgLmaUOa5CERtL8jlbSmn6yD4rjWKyfycqp63K
	jHeAwBZygAkGlOOveDA5S+sL6mR0ZIGkI1sLvgbs1wcFl3hEVNaNxRkEBZ2//KYIE=
X-Received: by 2002:a05:620a:4149:b0:925:eb05:d194 with SMTP id af79cd13be357-92e78500b33mr1373518485a.57.1783086318941;
        Fri, 03 Jul 2026 06:45:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4149:b0:925:eb05:d194 with SMTP id af79cd13be357-92e78500b33mr1373500085a.57.1783086318132;
        Fri, 03 Jul 2026 06:45:18 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6059e4csm286135466b.1.2026.07.03.06.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 06:45:17 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v8 0/9] Support for block device NVMEM providers
Date: Fri, 03 Jul 2026 15:45:13 +0200
Message-Id: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOm8R2oC/3XQz2rDMAwG8FcpPs9Flv+mp73H2MGJ5TWsSbZ4C
 xsl7z61lxS8XASfQD/EdxWF5p6KOB2uYqalL/00cghPB9Gd4/hGsk+cBQI6MBhke5m6dxmLHJe
 BBmlaDYFCm2ITBR99zJT7nzv48sr53Jevaf69+4u6bXepRUmQLibU5K1qID5PpRw/v+Olm4bhy
 EPcxAU3xYKvFGSlzcpTSlZpQzuK3hQH9S+alYAuqGwhRm13FPOoNJViWDHWKyTXInZuR7EPisJ
 Ksaw0loCrzjk3sKO4BwXrXxwrGZA7SV0yLu0oflM8qErxrOhMAcFShhj+UdZ1/QMEu6ZwVwIAA
 A==
X-Change-ID: 20260428-block-as-nvmem-4b308e8bda9a
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Piotr Kwapulinski <piotr.kwapulinski@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX5kzDB5C0OgtO
 YQRLtBnA1tvNaAMK6iwfodjd0HRC1EmtDxSIGH52jGuH+AKjzpx8qN+ZEcbA2p81yHapQMj4Ym/
 TNu2NK8TGs49o3gaQU9gDurznYqKFFQ=
X-Proofpoint-GUID: AH7PzMZI8V7llZOqrTWYddNJPSyEL8pf
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a47bcf0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8 a=0GYAYOgpis-UCnD6-MAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX8frZtpyTkZsl
 CzdLcFIG9bjZXq1FMAxLIUGZJs2NTNkKjM3GDeje/laPGHFKmu/7oFUJv1a9G7f56s1CHYpIU1B
 vLoCD2B/OZPnFn0gN9y+HC3yQA6fd4kbVVXXM3tQLmZx/qyCJhuJAKEieFXmwcRh4XgdKvBhNFX
 glK0IKCLnbNK+w+lzdVUhX1iTqP+o1Lqw2U+noGiKxwDUBmS4O0w8Xhv9It6Z0LEtkCAiqv/wyi
 bm5krV7ti3V/Q9i6C9QTUZoBmf6qotw1182rrPCGqOQTgtc9Jrvczy5TU+Y1D0W2k10LIsdgzHg
 QSjE6v+HJ1UjJQrYZ8orIt+iztLZ+n4onnTzLfwEXENK9fZ7kGkaWBH5xi3SPcXe6hrj5JM04G1
 Ci9rFe7PY+lwM+MnzjFahs141US0reFXgEmxG+G9CS7/kkmLN1rrO/z3y5aG1yg7y+J9eRJPqqB
 updvar4tcgtTjmp6K0Q==
X-Proofpoint-ORIG-GUID: AH7PzMZI8V7llZOqrTWYddNJPSyEL8pf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030135

On embedded devices, it is common for factory provisioning to store
device-specific information, such as Ethernet or WiFi MAC addresses,
in a dedicated area of an eMMC partition. This avoids the need for
and additional EEPROM/OTP and leverages the persistence of eMMC.

One example is the Arduino UNO-Q, where the WiFi MAC address and the
Bluetooth Device address are stored in the eMMC Boot1 partition.

Until now, accessing this information required a custom bootloader
to read the data and inject it into the Device Tree before handing
control over to the kernel. This approach is fragile and leads to
device-specific workarounds.

Rather than adding a new NVMEM provider specifically to the eMMC
subsystem, the new support operates at the block layer, allowing any
block device to behave like other non-volatile memories such as EEPROM
or OTP.

This series builds on earlier work by Daniel Golle that enables block
devices to act as NVMEM providers:
https://lore.kernel.org/all/6061aa4201030b9bb2f8d03ef32a564fdb786ed1.1709667858.git.daniel@makrotopia.org/

It also introduces an NVMEM layout description for the Arduino UNO-Q,
allowing device-specific data stored in the eMMC Boot1 partition to
be accessed in a standard way.

WiFi and Ethernet already support retrieving MAC addresses from NVMEM.
Bluetooth requires similar support, which is also addressed.

Note that this is currently limited to MMC-backed block devices, as
only the MMC core associates a firmware node with the block device
(add_disk_fwnode). This can be easily extended in the future to
support additional block drivers.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v8:
- block: Fix bdev->bd_nvmem on registering failure (sashiko)
- net: of_net: of_get_nvmem_eui48() now also rejects all-ones cells (sashiko)
- Bluetooth: mgmt: account for HCI_QUIRK_USE_BDADDR_NVMEM in
  is_configured() and get_missing_options() (sashiko)
- Reword blk-nvmem KCONFIG help text to satisfy checkpatch
- Link to v7: https://lore.kernel.org/r/20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com

Changes in v7:
- Rework bindings/dts so that the eMMC boot partition can be a nvmem fixed-layout
  and not a child of fixed-partition. (Rob)
- Add Support for fixed-layout as the nvmem device node itself
- Remove "block: partitions: of: Skip child nodes without reg property"
  This is no more required in this series and will be submitted separately (Rob)
- Add missing linux/cleanup.h and linux/device.h includes (Bartosz)
- simplify nvmem_register() error path using dev_err_probe() (Bartosz)
- nvmem_device forward declaration to blk_types.h (Bartosz)
- Add hci_dev_get_bd_addr_from_nvmem() kernel-doc for return value (Piotr)
- Link to v6: https://lore.kernel.org/r/20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com

Changes in v6:
- blk_nvmem_add() returns int, error properly propagated (Bartosz)
- Redundant if (bdev->bd_nvmem) guard removed in blk_nvmem_del() (Bartosz)
- Size guard changed from UINT_MAX → INT_MAX to avoid signed overflow in config.size (sashiko)
- BLK_OPEN_RESTRICT_WRITES removed from blk_nvmem_reg_read() (sashiko)
- Link to v5: https://lore.kernel.org/r/20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com

Changes in v5:
- Fixed ath10k binding issue + extended commit message (Krzysztof)
- Moved blk-nvmem handling to block core instead of a class_interface
  This allows correct/robust integration with block device life cycle (Bartosz).
- block: partitions: of: Skip child nodes without reg property (sashiko)
- Link to v4: https://lore.kernel.org/r/20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com

Changes in v4:
- Fix squash issue (dts commit incorrectly squashed) (Konrad)
- Use devres for nvmem resources (Bartosz)
- use __free() destructor helper when possible (Bartosz)
- Fix value return checking for bdev_file_open_by_dev
- Link to v3: https://lore.kernel.org/r/20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com

Changes in v3:
- Fixed missing 'fixed-partitions' compatible in partition (Rob)
- Fixed clashing nvmem cells, document calibration along mac (Sashiko)
- Remove workaround to handle dangling nvmem references after
  unregistering, this is a generic nvmem framework issue handled
  in Bartosz's series:
   https://lore.kernel.org/all/20260429-nvmem-unbind-v3-0-2a694f95395b@oss.qualcomm.com/
- Validate mac (is_valid_ether_addr) before copying to output buffer
- Link to v2: https://lore.kernel.org/r/20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com

Changes in v2:
- Fix example nvmem-layout cells to use compatible = "mac-base"
- Squash WiFi MAC and Bluetooth BD address consumer patches into the nvmem layout patch
- Fix possible use-after-free in blk-nvmem: bnv (nvmem priv) linked to nvmem lifetime
- Simplify nvmem-cell-names from items: - const: to plain const:
- Factor out common NVMEM EUI-48 retrieval logic
- Reorder changes
- Link to v1: https://lore.kernel.org/r/20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com

---
Daniel Golle (1):
      block: implement NVMEM provider

Loic Poulain (8):
      dt-bindings: mmc: Document fixed-layout NVMEM provider support
      dt-bindings: net: wireless: qcom,ath10k: Document NVMEM cells
      dt-bindings: bluetooth: qcom: Add NVMEM BD address cell
      nvmem: layouts: Support fixed-layout as the nvmem device node itself
      net: of_net: Add of_get_nvmem_eui48() helper for EUI-48 lookup
      Bluetooth: hci_sync: Add NVMEM-backed BD address retrieval
      Bluetooth: qca: Set NVMEM BD address quirks when address is invalid
      arm64: dts: qcom: arduino-imola: Describe NVMEM layout for WiFi/BT addresses

 .../devicetree/bindings/mmc/mmc-card.yaml          |  23 ++++-
 .../net/bluetooth/qcom,bluetooth-common.yaml       |   9 ++
 .../bindings/net/wireless/qcom,ath10k.yaml         |  16 +++
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  32 ++++++
 block/Kconfig                                      |  11 +++
 block/Makefile                                     |   1 +
 block/blk-nvmem.c                                  | 110 +++++++++++++++++++++
 block/blk.h                                        |   8 ++
 block/genhd.c                                      |   4 +
 drivers/bluetooth/btqca.c                          |   5 +-
 drivers/nvmem/layouts.c                            |  13 ++-
 include/linux/blk_types.h                          |   4 +
 include/linux/of_net.h                             |   7 ++
 include/net/bluetooth/hci.h                        |  18 ++++
 net/bluetooth/hci_sync.c                           |  41 +++++++-
 net/bluetooth/mgmt.c                               |   6 +-
 net/core/of_net.c                                  |  52 +++++++---
 17 files changed, 342 insertions(+), 18 deletions(-)
---
base-commit: dffcfe75c722be66aa2669fb335528edb0590671
change-id: 20260428-block-as-nvmem-4b308e8bda9a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

