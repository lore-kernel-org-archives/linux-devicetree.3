Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472345;
	b=lBiKI8mAcSOIAYwNJ1khpt5aawYcsuJZy3jW5YiXY/T5hYBdfDuN3Obh8hCOb87gEiFR
	 GaKh+Uel5fSX5QbWBYIomClXn0Qg4KrYbSWHJD/zHWuY5fSlD0t5eeIVnBdXFORTIf1/x
	 WbtgKhy6XZNSUdXJBxXAoSMhnVY51kqwlByYY/CsYTSh3cDOrC/tHuPB9pi7XXGDca3LV
	 TzkFrrPWNJi2yMqP6QybHdYNlZX4YlKpXOFewagG0Fk+4fJ/u0qiy7AQhH/lQcdqKTtWF
	 Kl2soxPlGu7Z/6SMzUQeLlEFs16akG8c6ETWAKBfbFkEurtU+6W6rkdJhY5Tj63k+ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472345;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zEk/fVzROC4wD3xuMlUk2KD0H5ZpB6YjFyZz1YUQCNk=;
	b=H4KCSZMlpJ7NP7+A05WPi/gt9h77qFgQfsL4wOCx5bI0mrAlgtjIsLr0dwhDklK3LkIo
	 s8FpcdXb0rAca4j8IZLlQBkO+pUJaOF9+YA9wo5f2ygqkn30VICiNL2uPBVGvffKcuxFE
	 ZgzCREKq0CioQy94lncGAKbgbBe7lR5Jbme8sD9QrFiEy9WYFxMvrMp85G+PzboCy2hEm
	 vaBIU3udNTtbgT4ruMFdGbjANJabeCs7BMDQnoDuKJp1DZb/Cq2EAOhf9ePwcxNO5ysiE
	 QyuKCfTBVaVd9Fr8LJ2TEk9imabIycCuLbon/SYLc8rlEBidzmGF5gFQW1UUaHXI3Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GI91eWHa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BOaPZ1jt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3A2606A8AC
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD3A2606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GI91eWHa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BOaPZ1jt
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC5nlKF442006
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zEk/fVzROC4wD3xuMlUk2K
	D0H5ZpB6YjFyZz1YUQCNk=; b=GI91eWHaywUHSEc94yy+dqeoBtOBuGh2mVA07q
	YlDeXRMP7F6rLdmOqWngdoPoKb/r3gE5nNUXYTKtkqWblHuvbAs8D//1f8EVuaCP
	PfamF0fioLvN+8Dqn25UZYJJX1hRsMWjUIM3CCld1wssHqpUbtFVsl6VEBExSdGy
	5Nwjgatmx/23rVgK+IpJkqUrjwwaJFCLfX1F+7zGRIg4Aw4DCMMN4Wnm2W5g7AYo
	D+hH87+nhiNdboFqeFb8d/w4RdT8X7NfpbPsbku7bQs3n5r5QopGSs2tgfNYVoCK
	Tyvi3UqQRjpoEZ/7OWZi2+ae1in3ACHscsawMoD4CFvOKkEA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc0k0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:32:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso4998317a91.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 00:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472343; x=1795077143; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zEk/fVzROC4wD3xuMlUk2KD0H5ZpB6YjFyZz1YUQCNk=;
        b=BOaPZ1jtfE7/aJ98tLecvPKO/emI99wL0vxZ4eWZ5KW+l78ioJaKMtpU2a5motAAg+
         myLKB+O6PiELawQkz3pMIvB0HO6BBoHTdeNgKCkTxmiSBGkJzq9egQh9rNqK2w1W/+2K
         H4R7SUTOPYv0RXNQCByf2QUVmsewbf2k+Ev6hofSz6yoVjQGwIl70JRNIBxCebXOFkmB
         A0KLDRAYoK8GT6DL2TKyaCD5hPl6I6uooqc/EjH8A3OBmbvv9q9egV//y/BXQRm9XXXN
         k3ZL3dIWLu1kcoa6HOef8tNUbgyinZHVS1djiXhUAjX6jmhzPlgoiun7xVg9rxAdryZ5
         eaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472343; x=1795077143;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zEk/fVzROC4wD3xuMlUk2KD0H5ZpB6YjFyZz1YUQCNk=;
        b=SLa4GSelZYuDVpoy8S1/gST3329epXxQV3FQ6TNf/20XOOp3+V9D2tucsd0Gv+nq7I
         rIAv90Fqsb5AfH9ADqCeQGC29Vd+gucQEzzt/sdJE1nTi491MF3xDKoqzpYjmZOt1M1T
         nnBdjN6qPHimk6q035oE74GPD4I6fOFv67KN4/0NTOYWFKkAArjR/YmQGkgBxqge5XL+
         LnhEC4tOYtTsnpdtlyc9WPdOG/5QAjoaCfK1GevLuIXdNoNeppij1B7ll23dydyOTFBX
         i88u0tlQTKWkykMXyxWcqrZPPz57NSvd21GIx95XHqItp/W0PolBZQTWxrMD21Oc0hjV
         w4JQ==
X-Forwarded-Encrypted: i=1; AL+hErFzPxts69lAhteySvYsyjOUun3KDK7cPRu3MUotzZqcDjLPVv/SQB0WbWIuTLIPx4MIohBmJ9IwV0us@vger.kernel.org
X-Gm-Message-State: APuU4Z87yjLG5nfr3JtE68XpAskyFebiQEjMo54RL/Nk15EuNmLh/ASP
	ABdwmwEUoLEAtmAPjzvqf4zitNXi4DR68y0P5O6rMOpzmdMXcE/JsglhHwbAp0sFJf8yasmmc43
	Ti0HhxOopW/X8U3CGbJxhmc6R0DIDE1xd5qWiZzTLnoup8NA7JM2Bb9EQsJb1E35k
X-Gm-Gg: AYBFou0U7VA/kyIV36nnCxM4icaak71EIUETcl2zRMJ25dmkAIIDAPdk1T+ZGVBgEik
	ZeuJLvHFUFDGyB5hiWfI5vfD/A8jD3B3RJL2FO3J884y72mAYfGEoWHBeaTeQnWjCOF/BLE4piM
	pQxVYO+xjfiEv8NtfLF4e+Dz4uBeLHuU9KrwjdAHa+5lbTPuOvarMy/9HaqhHPv8RIu16f6kq7x
	vn8bPu3JO+KjsNQVQ+kGYd8YmlwzLnkVcdMGX6ZCYUggBBgy610C8fxhrZ9suGv/FAwrSZS0rGv
	DXQ84SQ3ZTeImAb4qlP4npsx4dSH/ECjhYNXDPakJPOa7bsCgTbNqLe9AMuDjGta2lVRw+M5d/b
	cgVC5xF8+pSHKnjffjt/P74QYq4Qj5ZtU/aaSMryo3VqbueQUSWSK6BfZT47UdcQxEGRmyKQsyv
	b0zkySn6mW27oNJAG1C7ehJ3WQfm1Aun04KUJfwbEtRgSZD/p7JeafE8HfvIHbvtgtvmIc5bjsv
	Q==
X-Received: by 2002:a17:90b:2f04:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3b182ee3b45mr4552161a91.43.1794472343069;
        Thu, 12 Nov 2026 00:32:23 -0800 (PST)
X-Received: by 2002:a17:90b:2f04:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3b182ee3b45mr4552128a91.43.1794472342533;
        Thu, 12 Nov 2026 00:32:22 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:32:22 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Subject: [PATCH ath-next 00/15] wifi: ath12k: add initial Wi-Fi 8 support
 for QCN9575
Date: Thu, 12 Nov 2026 14:02:14 +0530
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI559WoC/yWMQQ6CMBAAv0L2bBO3hhb9ijGklAWWw4ptURLC3
 yl4nExmVogUmCI8ihUCfTnyWzLgpQA/OOlJcZsZ9FUbRNTqxx1X9cfLvbRl3QSWfp6Us4ascXg
 zSJDbKVDHy/l9gkuDEloSvP4mzs1IPh1b2LYd5n0X2oMAAAA=
X-Change-ID: 20261112-wifi8_qcn9575_bringup-a76e76a1361e
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: tCERV7MpUoyHMWCL0JkXqVuAmUFdcjLI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXxhXvztx76uEW
 V44pY9hEcPY9VdDrt2WfbgHxAahY8NO3h93am+CVU3GFRpOX05RGt/WQr+R4ZWG9FjI93lfJFSH
 OeWfsLxJ/Lq7EwtS6/FyseZPuzyJbrc=
X-Proofpoint-GUID: tCERV7MpUoyHMWCL0JkXqVuAmUFdcjLI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXzlGLm8EodcDP
 g6rO96tV1Btn1mwNnMp/8PLrg+uO8g4PVpuzCYZYP9z9oIcKGB++184oKbQYNHeDYMgalNUkL1E
 6it+YJAOk3DaD6FKdQNGTge4XMkH/ImRdyHiyAkNFfXegUuuvDM9ARvF3sS/4YB+30nuo11pptT
 F2pGiBplcmM6NqmRPtli9D6V+t3dZYIHuIcmPzrBYVAsZtuBiHUaifqh4HGSPckEsvxoOb/GTfJ
 Ob3JztXxsXWj544qwQbGDEwdv0K8jbHozBW/YWXdnqa+o/QhywFWZnfSv7wF9RMYFEsivy7udYV
 ErTXde+kNNTTXruiNkIE/7FkOslIM/wW+EHWd+3W+9V7CGL2C86XQI1tozi12fAPQUeOl4PSbEM
 BTPsKT5CAbIghu2pSp5K9izhFIkzM4wSn0pwHc9zUiANydJADL0zXp5bid8IeIqa8XJI9Hn39mA
 LXWanCk5FqzmPGCIMFg==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af57997 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=uhRKEIYKi0VZnCLPkisA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120033

QCN9575 is a Wi-Fi 8 (802.11bn) PCIe target that represents a new
hardware family distinct from the existing Wi-Fi 7 devices (QCN9274,
IPQ5424). It supports 2.4 GHz, 5 GHz, and 6 GHz bands across upto two
radios.

This series adds the initial bring-up scaffolding needed to register
QCN9575 with the ath12k driver. No protocol-level 802.11bn features are
enabled yet; the goal is to establish a functional base with the new
ATH12K_DEVICE_FAMILY_WIFI8 family tag and a dedicated wifi8/ subdirectory
that follow-up series can build on.

Patch 1 moves the PCI window register constants from pci.c into
per-device structures, so Wi-Fi 7 and Wi-Fi 8 can each define
independent window layouts instead of sharing one fixed set of
constants.

Patches 2 and 3 extend the shared QMI layer: a larger WLAN config
message to describe the CE and service pipe count QCN9575 requires,
and support for downloading an extended firmware binary.

Patches 4 through 12 introduce the wifi8/ subdirectory with its own
Makefile, followed by the hardware scaffolding: hw_params, HAL
register table, HAL ops and descriptors, unified firmware image
support, MHI channel/event config, CE and service pipe map, WMI
resource config, and hw ops.

The final two patches integrate QCN9575 into the driver: a mac80211
ops skeleton is added and hooked in, and the series closes with the
Wi-Fi 8 PCI driver scaffolding. QCN9575's device ID is intentionally
left out of the PCI id table in this series, so the module builds and
links cleanly but no physical device can match and probe; the id
table entry lands in the follow-up CP/DP series once the device is
actually functional.

Each patch compiles and links cleanly on its own; where follow-up
patches fill in callbacks, stubs are used to keep the tree
bisect-safe.

This series has been boot-validated on internal firmware version
WLAN.WBO.1.0-01410-QCAHKSWPL_SILICONZ-1 together with the remaining
Wi-Fi 8 enablement patches (CP, DP setup, MAC datapath) that complete
device bring-up; those patches will be posted as a follow-up series.

In addition, each ath12k driver patch contains Tested-on: tags for
existing platforms where it was verified that there are no
regressions.

---
Madhavan Ganesan (15):
      dt-bindings: net: wireless: add ath12k wifi device QCN9575
      wifi: ath12k: refactor PCI window selection to per-device layout
      wifi: ath12k: add extended QMI WLAN cfg for CE and service pipes
      wifi: ath12k: add QMI support for extended firmware binary download
      wifi: ath12k: add Wi-Fi 8 directory and base module scaffolding
      wifi: ath12k: add initial Wi-Fi 8 hw params and init helper for QCN9575
      wifi: ath12k: add Wi-Fi 8 HAL register table and hal init hook for QCN9575
      wifi: ath12k: add Wi-Fi 8 HAL ops and descriptor definitions for QCN9575
      wifi: ath12k: add unified firmware image support for QCN9575
      wifi: ath12k: add Wi-Fi 8 MHI config for QCN9575
      wifi: ath12k: add Wi-Fi 8 CE config and service pipe map for QCN9575
      wifi: ath12k: add Wi-Fi 8 WMI init for QCN9575
      wifi: ath12k: add Wi-Fi 8 hw ops for QCN9575
      wifi: ath12k: add and hook Wi-Fi 8 mac80211 ops skeleton for QCN9575
      wifi: ath12k: add Wi-Fi 8 PCI driver scaffolding for QCN9575
 
 .../bindings/net/wireless/qcom,ath12k-wsi.yaml     |   9 +-
 drivers/net/wireless/ath/ath12k/Makefile           |   1 +
 drivers/net/wireless/ath/ath12k/ahb.h              |   6 +
 drivers/net/wireless/ath/ath12k/core.h             |   4 +
 drivers/net/wireless/ath/ath12k/fw.c               |   8 +
 drivers/net/wireless/ath/ath12k/fw.h               |   1 +
 drivers/net/wireless/ath/ath12k/hal.h              |  10 +
 drivers/net/wireless/ath/ath12k/htc.c              |  18 +-
 drivers/net/wireless/ath/ath12k/htc.h              |   8 +
 drivers/net/wireless/ath/ath12k/hw.h               |   5 +
 drivers/net/wireless/ath/ath12k/mhi.c              |   4 +-
 drivers/net/wireless/ath/ath12k/pci.c              |  46 +-
 drivers/net/wireless/ath/ath12k/pci.h              |  11 +-
 drivers/net/wireless/ath/ath12k/pcic.c             |  22 +-
 drivers/net/wireless/ath/ath12k/qmi.c              | 484 ++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/qmi.h              |  73 +++-
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |   6 +
 drivers/net/wireless/ath/ath12k/wifi7/hal.h        |   9 -
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  14 +
 drivers/net/wireless/ath/ath12k/wifi7/pci.c        |   4 +
 drivers/net/wireless/ath/ath12k/wifi7/pci.h        |   8 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile     |  10 +
 drivers/net/wireless/ath/ath12k/wifi8/ce.c         | 404 +++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/ce.h         |  13 +
 drivers/net/wireless/ath/ath12k/wifi8/core.c       |  31 ++
 drivers/net/wireless/ath/ath12k/wifi8/hal.c        | 434 ++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal.h        | 171 ++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h   |  88 ++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.c    | 124 ++++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.h    |  15 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c         | 250 +++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hw.h         |  14 +
 drivers/net/wireless/ath/ath12k/wifi8/mhi.c        |  70 +++
 drivers/net/wireless/ath/ath12k/wifi8/mhi.h        |  10 +
 drivers/net/wireless/ath/ath12k/wifi8/pci.c        | 105 +++++
 drivers/net/wireless/ath/ath12k/wifi8/pci.h        |  11 +
 drivers/net/wireless/ath/ath12k/wifi8/wmi.c        |  57 +++
 drivers/net/wireless/ath/ath12k/wifi8/wmi.h        |  13 +
 38 files changed, 2512 insertions(+), 59 deletions(-)
---
base-commit: 91d8a01977701d10b0037e4adfcec21d8dd6d48f
change-id: 20261112-wifi8_qcn9575_bringup-a76e76a1361e

