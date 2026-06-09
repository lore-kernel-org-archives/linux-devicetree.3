Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7AD3E6DDB
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 07:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780991596; cv=none; b=X08oASPlRxOqGuky9Tim7mXvXpD31GFyn24gc2Z9Om6CQT2Nb8l+iS7UEEe0oyJOHENR9IaD0J63atSdwwXonU4et55ohITrKrEVSxiU9kCUJIGicbJiqtlGm3xuhxgWpHifhi1XhXWIxysmqkDlZ2laCa4bpJ25LOYouEFJn74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780991596; c=relaxed/simple;
	bh=53MOC5eqOHfTcv+JZmgCH0zadWL/SAMKYW9OpqKopEo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uQWzsuO1ki/E8Clc6pPwAuOwI6GFZfui6bSgnpAsgPbC+KYjfC/wjrRI6hmWxVy/XYDMAeXWUwV0ayuYr4cnd5JtFPPZ3F6n5+xXdAWMBBRXeJIYLgkDqp0yj2Cu+ji7yHHGWI3erip/xiSR3HvmFDCdLWTYNhmWEX/myJEFs+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WR2QPOXw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=baW9WMIH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WR2QPOXw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="baW9WMIH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597jBaD1566687
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 07:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Bc3f7a+PYfloRmVgEBrBcp
	B0oTfwi5E+mma25qPWbOk=; b=WR2QPOXwAlDHo4kjWwPXq3+xqjQzqWZz/pOcCn
	u1uCdF685AbfbOlFdnPrcH/j6V7rO8USss5dSXfwz89jmNigTZUeMK3NonHngtfK
	G/8yYKsOkYlsr4g3ARnOMmaF5EHU5PzGgc8apKsYdw1r7iq4ZIsWfK54nJGNKH9k
	8vxKIh55tLswEYjd1yGZVHvYGYYJWlji4dYKCdbjd9z8DR8G7Ws0zLD8v4d2/Tnj
	/WxErNGnw/JruqCd1kh1DdW3HZMMiwE5IlWw2ltxTM4Sg+dzaIbRstne4GFjzOAZ
	9owjpFeQyLPNhq/p2duVdx940wVJp6iLnCh6O4NCeXflyThg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqgg14d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 07:53:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5177b8df670so85161751cf.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 00:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780991594; x=1781596394; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bc3f7a+PYfloRmVgEBrBcpB0oTfwi5E+mma25qPWbOk=;
        b=baW9WMIHSUnREDgNc+MVXeEfoL40sOQjk4QsFU6UcdoIFjOnz7eAk0eh97KXbnmYnL
         ohvmj7I5427qqJROSPGI+/+Q47djQZeVYHux5Ey7JGY8UN0kgr5DsY3/pYT+YvYTmSNB
         yqgCu+0ocWOO9w6tr0Oz7OdydOdUEhlUig0j0xN5lTsoKBbNR3TXJgpv+2Yv1EJORz9v
         2Ab2+CV8xfvtQa327ZTZKn9J/avfsZD+0Bb2IQIqGfnmVW6SUwTIV8xmzITM8zIhm4o7
         5eQ5fT4h62q5IRlH6hiASLRnjipXlwNrl6fz9T1RP3YjLsVJCHQe2x7XpEvUPsay6gUG
         KNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780991594; x=1781596394;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bc3f7a+PYfloRmVgEBrBcpB0oTfwi5E+mma25qPWbOk=;
        b=Q3nV/jIbbpnOHn4h3kzbftDsfxFzQ1ciNWZ1m+4RWKHczqcHxY0eB/QxeLjsB7ZN2S
         kZ47FL9Hx+6mZgRppjBqvzbSh5wdY86nE6usqpcCOdDhcflGI/Vy+bKmrWYr7tQRYHRt
         F8wHL4Ho4+1tUOZYheRbEKP/jw6zXvMq/9k6p4dFz+kFXhBoQgqBhh4MIbz2qjSvxRbj
         EI+4sAzUuE/ee1tKErIlu0xMUgcnyY1ZUfWRfDcqqIgulfdl2jK9lGpa+IKFtuDAF2Vj
         p8CesNCADTr9Nl/xlzCY7quUmWNbZhW9jr8rAPsUK214P8mf60CpRXXUT9j8J7vzkAhu
         a8/w==
X-Forwarded-Encrypted: i=1; AFNElJ8sepCObqvZBX8MwL16VFNv3nPpiw9QXBcBh5kU/ZOrQjv1pYw3L9Ooc8SuXGCUyf/hKwUpB4oq9qvr@vger.kernel.org
X-Gm-Message-State: AOJu0YxfNuW+4LsJFcv6k777c1UpWRqVlvw3sJds4m7QpWADzbUqgEtw
	B68PqyGs1PaRJz/+1wiSwsUZhfejElT+qVQKmhvQaSaLNCw+xhdLpj0DRoNmGAK4hWdl8VZkxKU
	ZwD47zA/LrP3PHYcDH9eu4A03/OsnUsXzhpCe3HjWdrrA8Q+wyeoCcBkyMiDKDSCA
X-Gm-Gg: Acq92OGe0qR3mHlTrFv9eqPwk/5/iSncIHUe+7yldsneU/KCNkovPVd9pj5AtVaLVy8
	6jo/Fh5T6AjABkBMza4ztyv/andAaCC3IX6G3+uXVU6fjpsF5q4OBgjT9yP5X6og+dCjvbS+PkR
	v23VmFuL/1ADTxI45lIeoqa5eKGglPeEoHs6dKFRaogTYVdzrIjDCJryHl1ja29q7Dn+shQwYG3
	NOnwGdWMLjYdfs+h5vyawzP/lMAjHGg0dzM+uaIMrnu0PCLROmOTum/sqKLy8LSwaL66iPh7ejF
	nyolmvDXYzU3x9a0QTRV7epWXM6b1QUdoO7SbJpWigmETH2IjRwiG3IbJkOuzgx/SupjGeyaYxa
	Or9JcKWsdYWQ8yZOhkUMcGseizrDMnWyd7OKQzXDa+7r4PtEttOXQ2tlAcZalkQ3ylRQyTw7CaG
	1vlDHqKnaHe1y+cU2rAujrRUbCb68fFeYZk45NHeBDhCGVUC1x0371iRY9wBH/L8tRsKBX4MOnc
	WhfLTTtQMD1
X-Received: by 2002:a05:622a:120b:b0:516:d73d:2a34 with SMTP id d75a77b69052e-517959d300emr266975731cf.5.1780991593769;
        Tue, 09 Jun 2026 00:53:13 -0700 (PDT)
X-Received: by 2002:a05:622a:120b:b0:516:d73d:2a34 with SMTP id d75a77b69052e-517959d300emr266975221cf.5.1780991593301;
        Tue, 09 Jun 2026 00:53:13 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64303892sm8121631a12.0.2026.06.09.00.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:53:12 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 0/8] Support for block device NVMEM providers
Date: Tue, 09 Jun 2026 09:52:25 +0200
Message-Id: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADnGJ2oC/3XOSw6CMBCA4auYri3pg0Jx5T2Mi4EO0ghUqTYaw
 t0tbFggm0n+SebLjMTjYNGT02EkAwbrretjpMcDqRrob0itiU0EExlLhaZl66o7BU/70GFH01I
 yjbo0UACJR48Ba/tZwMs1dmP9yw3fxQ983u5SgVNGMzBCYq54weDsvE+eb2gr13VJHGQWg1gVx
 fKNIqJS1jxHYxSXKe4oclUytv1FRkWLTPNaMQCp/ijTNP0AkmAc1D8BAAA=
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
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3MyBTYWx0ZWRfX91msWp69W5MU
 uPiKPzwMvBpOoFUk98e9hzaZ3/jzdM7EGG8Yf8XQcl7PYYf+9Lqih8UPN0Df9SpmsCJzCvQuR96
 16YDgkeE0jg03+dkStiCQZPoC5x60PjSe4R6hnyNtFZEvw8eyRcW1VVBmEK4jsLI3AkCq1+TXcT
 DJRx2Owb2Nmr1ATEl7ftwk5d3Rw7jpqLZVuAoQrtI3JQTgMuYPLh6MfhUUeZ4/fvLlQ7inVOvM7
 ry5/C5wMFK8cHIb0/Ml00O143ksvA/HzxFAO9doxmDXNWg/QdoQBvkFo1IbwI/Ne/47dDGcxin8
 Y7r2uis/WQAUQ/watxzkzzE1pNYyQZAl7RWuQVc9quVh8P0+lmMNUJuPbHYM/gRKbrtt7vPvaoQ
 jTxBs90utuZ72kh7R5T4+o3wPdgBq4hAQIw1DCNWRb+m7CUT7a73TvyC7LYKGkEgcQgVhq7YnS4
 OXtSKPYKuluXCHhIyQA==
X-Proofpoint-ORIG-GUID: IiaHUi_wuCtOBvRFX4baRpKwU3XJL8JN
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a27c66a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8 a=4dfaE-bLb2wR0_rHmkcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-GUID: IiaHUi_wuCtOBvRFX4baRpKwU3XJL8JN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090073

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

Loic Poulain (7):
      dt-bindings: mmc: Document support for nvmem-layout
      dt-bindings: net: wireless: qcom,ath10k: Document NVMEM cells
      dt-bindings: bluetooth: qcom: Add NVMEM BD address cell
      net: of_net: Add of_get_nvmem_eui48() helper for EUI-48 lookup
      Bluetooth: hci_sync: Add NVMEM-backed BD address retrieval
      Bluetooth: qca: Set NVMEM BD address quirks when address is invalid
      arm64: dts: qcom: arduino-imola: Describe NVMEM layout for WiFi/BT addresses

 .../devicetree/bindings/mmc/mmc-card.yaml          |  29 ++++++
 .../net/bluetooth/qcom,bluetooth-common.yaml       |   9 ++
 .../bindings/net/wireless/qcom,ath10k.yaml         |  16 +++
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  39 +++++++
 block/Kconfig                                      |   9 ++
 block/Makefile                                     |   1 +
 block/blk-nvmem.c                                  | 114 +++++++++++++++++++++
 drivers/bluetooth/btqca.c                          |   5 +-
 include/linux/of_net.h                             |   7 ++
 include/net/bluetooth/hci.h                        |  18 ++++
 net/bluetooth/hci_sync.c                           |  39 ++++++-
 net/core/of_net.c                                  |  49 ++++++---
 12 files changed, 321 insertions(+), 14 deletions(-)
---
base-commit: 47c4835fc0fed583d01d90387b67633950eba2b2
change-id: 20260428-block-as-nvmem-4b308e8bda9a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

