Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636848;
	b=yqM+G0h2uIsNHrUrcDOsZ7X9VnJFOnyuA45vyoa6KxspVre8S0mFy1yR5zf7QLdsIfEw
	 98QFb/b641FctVgAyKcsZbEyehE0PZeWl4buxad4CqLm5N5QiSgeZgbL/hx8YvLJV4h4y
	 smcEfzW+/9gu5wwp7biQuQ0oa132Mn1Qj5Vmpsx5OyISaX362iR05/N3+CsaQ2GmXd8T4
	 DCj8Os3I18oDkx/gohptUWwVCmc8QFlne475i7NaRhXuGZsYZeZ8/Nl/oEcZPpenCgrEU
	 O3AYo3uuNA5aW9gp4PJkvNjpvzAG19x46YOhHrcgG7plPwZrAMqfAC4zg/8v7E3u2Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636848;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=s2E5loI5QzOdo4ew1vQKih9z8VadZE7soKVzNqeQSpk=;
	b=UBTGZgPs3RAaWB7WiNXL0GkCbbYk9nKAhj0XJXVZLsYCkI8ZBp5dcmpv6a6mTgwfyiNO
	 F9XedSkb9bgIVqc+/WztG1PksGWthMzjLioAjIZwEddwTjrAaYgXcRGLmJIFjX9L4o2+j
	 g17la1piponSgwWWoF0y+DHQwwEz+hgz4ixcMaE1AtzRSm2TSaghRJjTfCzoHGdte0JVN
	 gJqyIPDpnwVDlq4fOKHcKikRNM49rY9QIr0bM1fZLjPz3rbDr+gEgfbQhU9mD3HCyVdhK
	 k6EIymmtHu82p1GFSV0w0gzNUmm0I699dbwOk1O0RkEhnI4Kfc8XJKthvnd1DJE38KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EGDhH31Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f591E5Lz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F996072200
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 16:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1F996072200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EGDhH31Z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f591E5Lz
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpRM53715882
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 16:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s2E5loI5QzOdo4ew1vQKih
	9z8VadZE7soKVzNqeQSpk=; b=EGDhH31ZGDal6o1bjWyNGFzeopWyrBhihaYUAY
	oTrVhVT85GEo3whpJ3kB5IBaxnRwds9Kf1wrHGyXInPzZ09DQbgLBoa52Xxss/+e
	WqQyghA//btJ1wUVP21gU9mlbzvPTKDQkGh2p1oBqN4YC+thbsLk7IeAKRv8zAAf
	pqZc5or66JdQjqN408Ffam+NKwhSdVHaUGmoYIEGwi3whS0qOwMRlmUYxy9bH4iM
	eDe1oFG+rculWjEIIQUqFsfzc779qxItP6k9W6rLsqCfKf/9Fq8LeMiyPY6Ocb39
	sYevgYphTWBXSqP14Vf0v8Mm5VoHXUMzdchc3nrVxLWCjaHg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka62uhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 16:27:26 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c0f07b4e97so2469161137.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 08:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793636846; x=1794241646; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s2E5loI5QzOdo4ew1vQKih9z8VadZE7soKVzNqeQSpk=;
        b=f591E5LzJUT5Thbj/3ZEnOQ/mq+4XhpslppdM05vF7ARIhZuu945F0celsPdKrbnwN
         JT0C/BYxIdF7XlyM0NPeMgejH6x8qj2mkZYt9n86NkXI/sPvk1/nyVlYHqeKdpVEI8SQ
         7KQXUZW4Dmqj7dQ5sZiNrvli65DdCl7bRCZfPPgeu19DAFGWQWeclW9nfJaDmH3xxfgc
         DRF967SScZocehZn5yENh4BF0aX1Zw7gfGLdr2+Wfpq6hJ4xkm8xPhT+VMfvVHhBWPb4
         D7M9LuTNuf6VP+jNCr81MOSMsDjLi32JHww6+SEniGW5OWBzXmSh9rnHfWLIrgRWZpYr
         LvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636846; x=1794241646;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s2E5loI5QzOdo4ew1vQKih9z8VadZE7soKVzNqeQSpk=;
        b=VRVQYxBfLGKi/2FYUutbHHmJa3h7iCOBqqLcaTNmrynXZMKUIukPyJzaqB7IBcp4fZ
         AbxY/CgvVHkgE1fcQ//5iPeADdJQYBEmQndX3lbYC33SaOZZD2vWg58zpN98RjZzis0F
         gh3VF/TSgjEXVm9LCQlToW2wnLJw7tyd4w03PwST1roTahF+l3EHP5Gt/xSZPkS9GkzT
         5Aq7njZfYj/5LBuTkyK8CZ8ilGdh4nsUK3DvU/4fR4rYZ3osx0ogCth/CkBZ474yVq3t
         DPjDtrtDYqWIh79liql/N5lw5OTbM/W6UGcfwRVKrFLsalZ0lWCGHW3tMGeLrLGbZUlD
         G7aw==
X-Forwarded-Encrypted: i=1; AKwUvBzJyf5NZlSa4+O3NItYwpDapTvsmIgbF3z0Dj+ECLyOqhNZIsTmwNXHN03R+dpDyqC2H+pkGh4v4PlB@vger.kernel.org
X-Gm-Message-State: APuU4Z/kiK6912GrMUhgtdpyKaX6Gx5ZoY4JZbR/Xrp+KaG+YjO1Ic1M
	32dSud19DwsCvWI8o5dtPi/tnWmuZ3HPS+33JfEjWgSmf9R0bTY7XNhwLQPR5Tjz7/PGSYNCrBv
	OdISFKFLH827gexyXxP3eRujcJFVFa99FYeF9MjcNbnRHHHJBIk8P5UsaEtKawn4F
X-Gm-Gg: AYBFou3KCdUykMwLdq0DzI7W2NjMphGlkq20pEWQd7QN1Vx5ABpcST0G/hCuTItNBgi
	r9ye11nfY3OEpkJuXWYWvFDTyYNUlS0AcQKNN042XcAjrD858Uy6jE2FfTCgp7bFEwGGDi93ltV
	6ZeaS/4MghcpFjQL0eAAy7EfIuaniULeN7aJzzbyxbpt2/0ZW1PXDq1oBb4VORRJPNJBbAnZ3mi
	uzOS3an9s2pw0L9B2vkOSmQ6o+GKbGYxNak+eRQAtEYINZZlvdrl9Uwfyu4AnWePeoXKK22+4Xl
	DBge5NujQwc+TE04A+7ZUuKBGfq2kOyqEpQ/FiUaJhxWOdNzegbKqlGlqXU/nE/cTum0zYqwKz8
	uDxxMv18AFV5/nKEwtjDO6XX8Snw4mSHxlDy+EeCdoI84+f67J1zVfYQDP2bz+sDzQ5+JeAvxpe
	4fy1vkSlwZS5SzKhiE+KAE4qx9yfN7/Cg3kmQlSnXRHF/DkNwxP13BROtYRdTjOAmBW1fVVgjtY
	FthRBRL0iaZIB+CdSDa+lJkdOW7
X-Received: by 2002:a05:6102:512c:b0:7c3:99a3:314a with SMTP id ada2fe7eead31-7d072bc74c1mr4164610137.9.1793636845507;
        Mon, 02 Nov 2026 08:27:25 -0800 (PST)
X-Received: by 2002:a05:6102:512c:b0:7c3:99a3:314a with SMTP id ada2fe7eead31-7d072bc74c1mr4164585137.9.1793636844939;
        Mon, 02 Nov 2026 08:27:24 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm20490695f8f.45.2026.11.02.08.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:27:23 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v12 0/2] Support for block device NVMEM providers
Date: Mon, 02 Nov 2026 17:27:19 +0100
Message-Id: <20261102-block-as-nvmem-v12-0-f4a2a681087d@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOe56GoC/3XSzU7DMAwH8FeZeqaT43zvxHsgDknjsIp1hRYq0
 LR3x92llUIukWIpvzjO/9bMNPU0N6fDrZlo6ed+vPJG4NOh6c7h+kZtn7jQIKABha6Nl7F7b8P
 cXpeBhlZFCY5cTMGHhg99TJT7n4f48sr7cz9/jdPv44JFrNUqtYgWWhMSSrJaeAjP4zwfP7/Dp
 RuH4chLs4oLbooGWyjISszCUkpaSEUVRW6KgbIXyYpD40TWEILUFUXtFV8oihWlrUAyEbEzFUX
 vFIGFolnxmoBHnXP2UFHMTsGyF8NKBuSZpC4pkyqK3RQLolAsKzKTQ9CUIbiK4vaKLBS3vsgFk
 hhzp3ztp/1OkVAofn2RRS+1EzbFXFEEbIwDU8YO1sSQ9i5i0Dy8mrPFV4DQpbPmNzsObmdVdva
 /Cd/v9z833sFUdAMAAA==
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
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Christoph Hellwig <hch@lst.de>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: MJjW78It-DmPWkvZbPEwFyqA4Tds-aEh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2NSBTYWx0ZWRfX2bqRQVpfnV9P
 I9mNn3UKKCWKmYE6qyVjeBb1eIoZOeiX21nDrxAaKeqq8WWZBiio8uw7xyn+x/Ii99qgYoI0LhD
 nmtubvi4UY5uMIo/yU1VGjlsuy/PPrk=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae8b9ee cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8 a=rVis_EDdIu0y_XEmomoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2NSBTYWx0ZWRfX11GC+LIXnVwm
 z2DUTsZFb+vEs5ZpB7DVKVuo4I/5ts8c8dS61aaT6HabT5zxg8eI1a25DsGw4AW9xWcvQpQ8LmB
 /fLaW1sQLdIiekQZZs95xuRoKOPGyhXXX++I6UO+b1UQl7FlGZn5sc7TFf8uDkolB4GtfbMokWi
 8xudrLh2xDEnpGdWem4ZzWFdOYlxsPn15tErMvrKS6ksMJ4JuAFYGzdu9IvSht6l1AjC+PuNQXd
 u0sbo0TA2LlGOsibUT4djr6nGrm7U4Kt3mpR8BPlQ4i2PnlwntEkbQboxx0mDcgpufoTDSRVMTl
 PP74/2H32B7NhP2y4+uZMCXRgc4yykPFijVmZqTIG+SzS/CiYdvRxk+QlYkccY/Rz8BX84FXLGJ
 Ar5ySaZiDu8kB4nv0866UV0xi01Ned1aT96e/Gk5HSnSnDksv2sDJ8z5xQwV8Vz7+1EzD1dkHHZ
 sl7+XwEf90+5mSu7saQ==
X-Proofpoint-GUID: MJjW78It-DmPWkvZbPEwFyqA4Tds-aEh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020065

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

Note that this is currently limited to MMC-backed block devices, as
only the MMC core associates a firmware node with the block device
(add_disk_fwnode). This can be easily extended in the future to
support additional block drivers.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v12:
- Simplify the series and remove consumer changes (BT/Net) that will be
  submitted separately.
- Link to v11: https://lore.kernel.org/r/20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com

Changes in v11:
- Rebase on linux-next + resend
- Link to v10: https://lore.kernel.org/r/20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com

Changes in v10:
- block/blk-nvmem: simplify read error handling (Christoph)
- block/blk-nvmem: verify dev_t wasn't reassigned before reading (sashiko)
- block/blk-nvmem: drop __free() cleanup for explicit of_node_put() (Christoph)
- block/blk-nvmem: init static nvmem_config fields at declaration (Christoph)
- block/partitions/of: fix fwnode ref leak on skip/abort/error paths (sashiko)
- Link to v9: https://lore.kernel.org/r/20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com

Changes in v9:
- Add nvmem support for partition blocks, not only disk (Christoph)
- Prevent concurrent exclusive access to the block device on read (Christoph)
- Add comment about nvmem being a side channel for block device access (Christoph)
- Link to v8: https://lore.kernel.org/r/20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com

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
Loic Poulain (2):
      block: partitions: of: Attach partition fwnode to the block device
      block: implement NVMEM provider

 block/Kconfig             |  11 +++++
 block/Makefile            |   1 +
 block/blk-nvmem.c         | 112 ++++++++++++++++++++++++++++++++++++++++++++++
 block/blk.h               |   8 ++++
 block/genhd.c             |   4 ++
 block/partitions/check.h  |   1 +
 block/partitions/core.c   |  25 +++++++++--
 block/partitions/of.c     |   3 ++
 include/linux/blk_types.h |   4 ++
 9 files changed, 166 insertions(+), 3 deletions(-)
---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20260428-block-as-nvmem-4b308e8bda9a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

