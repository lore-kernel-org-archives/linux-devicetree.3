Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94683382F4
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790125688; cv=none; b=nBZDY/7yzE/3D+K1d4ffc+5GbpgEpUobN7pBngo6LEc48fApHkISsVW0n5a+C1p4Tgx4PzHQCJmsjvb1W4/szqrSLowTU/SAQZmz7rluKVv9toFdY151r1z/VR0d8ODF1P4Pity7haqMq/M0B9ji3G3Yj3D3FyXKJDKrgpI8JuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790125688; c=relaxed/simple;
	bh=Ci4TmBLiMpoXjBSFDZQyPnrK6xcPv6skVJDuumYU+gw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mHhPoC+3m+Nl7gWcPUJqarxZLrEzxwm2Fx6wFsuF66M24t3kmCcRe0mZQrZH8ssUJJ6KE1w4Tg+J1OeHcP6ls3CfWQHw+vGG8aPqoVYIIb/OI856fvIyu0cs1gia7JrBVl+eXwUAAhZuPAihd0Aweijb54xnIwG0WNJGGksltWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oy8ScgO8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EkL8NFrn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oy8ScgO8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EkL8NFrn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI73nT1509147
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JGoyxRWmZCHMD3A/caoBoH
	DEKS871mDH4i6spaluJNo=; b=oy8ScgO8WcSKr7Nrz2gJkgQjzkDZz2WAwAHe3C
	ZSZ3MK0hlGGv7en1LCLhos7eKPog43BQLwYnlYwrf8R6AXfxa+toIGrNukXRnI9t
	Cbs7vCaPQSeTgNo8EtoYbZp7QxCvghiVcw3uOy+z9yYc5KI6l1+X80U3hgaU9MOD
	2xZrLsxH/WfCZPgyyiaPbVEsFLcH9TxEWwsp0kI6Bt1VEdUdXojEFUy/l+TJD2RV
	4+DeFkbktcGYhAh5i+CJEAyrX3SMC5/t/WlqxOjq9ewE6FhTYwyTz9lm3OEbqj8R
	RIbnYLyzPm+VOQ2WzpGIq/JF2c2lnvM47awYOTCUEbz8vA5A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xsu3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:08:05 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1437272611eso587014c88.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790125685; x=1790730485; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JGoyxRWmZCHMD3A/caoBoHDEKS871mDH4i6spaluJNo=;
        b=EkL8NFrnNQxinmlv2aP0+m60ZGTgMdZnlmUpuMvYQMVrJ2sRQHGfHdDnkc+rvseBZL
         pP1HDzSBzRPU6Ud/fjJgIRwqBDfmjAjeGcs8yKT9Hk2AJusA/a5sQWgph5Rgr/Kimw7E
         ACFd/tra0cgqBRhnjBtAlaOw/+SpypxwoP8cCLDn+eDaNJTyARVfeTWh/xqyzMOejrZ0
         b+Q/7VRMjPiuk8PjfWTLD2HfO2yMOL5poI9TNEVXwBk3fOFBu+tnepbOJMp85UgeWRgR
         U1sfIiO8Fa2VUzpdNXLbdWa8EKna/18SGyrCd9NaVpX0V5ZBD+n91VTl5/1+tsQ2F7Qr
         0vdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790125685; x=1790730485;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JGoyxRWmZCHMD3A/caoBoHDEKS871mDH4i6spaluJNo=;
        b=WwXHWptKdrb+Rz8/eZHdn0p+JK1k3zXBKh/e7FodV1okwK2ExADh7s66yo+u9OVz9j
         khxp2t0+ckk7WB04CkuDAA+DmlZQfyEFJUMNUOze2/J7R5PSw6HvA3zUco6DoMChyQH/
         o+eb/k3YX/Dibo6P2sE44pUKQ5g1t4PBwAs3M1bj0GUerZ+djvya6ShQfguC22E1nCcJ
         lPblfazedg0Vi8FhFZi++lAIPHf0akRuMbjcZ7fKqLbbk6Se/gcFI43uGgq2jPkVgg/p
         iW3AULGqTByOgRm3sgPZaDtAdpH6OFflMUtGYwtRUT7p5McMX8XrwxhkzW75EYIKMSMi
         JCPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEgBFf06C8RbfUZfdwE+M2mzSV/8ZksKHQE+9cKzjcmBwljzU4VzNSK8P4lQD503TWRliumFPscGG9@vger.kernel.org
X-Gm-Message-State: AFuF++kznwt4JVhQiLmbKuW2jV8RlNJPb0QbN7ADwUif5Qgo6r6XN7u/
	XWRYpQxFEvYPuSZm5etzj1fXTifw0lzvn2nCgV/FVlt52yc0GQlJFMEpIc69qtOLzU+AMlBDFdG
	Q7WTQ4h0Lzy4kPJZrgc4bIEEkne+6FmfQDpYLQz0KEXiHL1Z9MqAEulxV5ITWwksc
X-Gm-Gg: AYBFou141tCYUEPet+suHpsoWoY85K2OabxZkasuMSHlHQzo4Q/Qzp3W8+g99rbtQ8F
	ynSt4KvV24Up/UW3ouw0RfJUFyvBThXqk+5xJOp87JQpbiUXYOXmdNZxhh9bURsk7374M1J3j6n
	wc+33PmHgHxaLUSbTVlaOtz7BBKjsAYb0k8YSGgolQHO/THSwcWtEe8LdGnvfRJxtXOtU6YAWvz
	1Aoi9tJew4dcYGdhlKXdjef/9oyBZrD01pe4iRHz1868WxuaV3aNY/xKFYgPTkG4AreO92bxu40
	9+u32V7ywS3dhCCMNNCFbDqk1CAWyGbEDLNifUweDcbC7uCPDvVS4sLHPgwVjnaTR2T0JvBs//F
	sLby/U4y0t9wc8ZrqY7kI2qtECkqk
X-Received: by 2002:a05:701b:4206:20b0:143:72b1:9004 with SMTP id a92af1059eb24-144f91721cdmr1164658c88.45.1790125684383;
        Tue, 22 Sep 2026 18:08:04 -0700 (PDT)
X-Received: by 2002:a05:701b:4206:20b0:143:72b1:9004 with SMTP id a92af1059eb24-144f91721cdmr1164606c88.45.1790125683728;
        Tue, 22 Sep 2026 18:08:03 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98ca0edsm1651831c88.15.2026.09.22.18.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:08:03 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Subject: [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support and
 add Nord Ethernet plumbing
Date: Wed, 23 Sep 2026 06:37:26 +0530
Message-Id: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE4ms2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyNj3cLk/Nz4ioLk4vi8/KKU+NTcxGTdpDQjS7PUJBOLVJMkJaDOgqL
 UtMwKsKnRSkFuzgp5qSW6eakVJUqxtbUAGdwXLHMAAAA=
X-Change-ID: 20260923-qcom_xpcs_nord_emac-bf296eb48e4b
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790125674; l=5546;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=Ci4TmBLiMpoXjBSFDZQyPnrK6xcPv6skVJDuumYU+gw=;
 b=mPxelajzt4OzX4pwVyzuH4GuJc8WRk1XziZsAh78ZzoDSlH+Sw2qgtHAh/OPsxsRKrG/uUVCD
 Z/SVyHwWktMApVUGkKJaJr5KgP68GKcGrNZ/RTXr98xpWBnXoYn4V5s
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: PN_V92dQC_wCJgJZ58di7kQIA588onE6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfXyNXLmPIe7gSe
 sVZAxcWNzVWDH869i2NzecEB0uQ1C+F9RiqAmEmKbY4a1InjUilL+ytIUgdgsHu0luhHsB6fANa
 v9thRqx0ovCuiwHWGwUzTetcf/nkM5Ihi9Z9MmEA6T8AsIUNXvZIexl4JhS+sk+z4dHl2t73+QR
 dtYBf8UQsBR0AcxCDp4eMi84ykQOlXGtNbN/VjZ6cIBsj3ztxT7z+UmG9ESnCojML4GbFfZdjS9
 Ifd2MHjbLGjbcbThKd9w8yuZJV0SZAB+mx7YgHNyocWP/iOw8/G5/X4mjctPADHyTEMJal1rr00
 uAUf9FHItBpf9INZf9Dn95Xgirh8iZ/M/fDvO1efgfY62QJIRH3zooJedf0AphKP0vIHBDOa8v/
 jvzua5qRDmF2a5d39yOsA31FHWBvxOy669OopMfEQA0yd5iw1zGgmz0chEG1OJ1GF7+813k1Lhn
 aN80BVzlzKBYbGK3SHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfX1ql2xxlraWli
 wAp1uMJ8lkXmEW4kCbiT3rYjhvrG1F7MFAIH1fBmBUfWtLY8vP6/Hr6qymn3kelQ46B2WEhv90c
 KVbChdh1jui8fiTCIB635y7RZooj61o=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab32675 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=Q-fNiiVtAAAA:8 a=EUspDBNiAAAA:8 a=_sE-PX45xJdWcABC03UA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: PN_V92dQC_wCJgJZ58di7kQIA588onE6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230004

Hi,

This is an early RFC which adds the XPCS and ETHQOS plumbing required
to enable 10 Gigabit Ethernet on the Qualcomm Nord SoC. This is the
first time USXGMII together with an external PCS is being supported by
the dwmac-qcom-ethqos driver.

This platform was somewhat tricky to work on, with several new pieces
having to come together across the MAC, XPCS and SerDes layers. Any
feedback would be appreciated, particularly around the XPCS modelling
and the generic stmmac register-layout changes.

The overall hardware path looks like this:

  +------------------+      +------------------+      +------------------+      +------------------+
  |    DW25GMAC      | ---> |  Synopsys XPCS   | ---> | QCOM SGMII PHY   | ===> | Ext PHY / Switch |
  | + QCOM ETHQOS    |      | + QCOM wrapper   |      |    (SerDes)      |      | USX/10GBASE-R    |
  +------------------+      +------------------+      +------------------+      +------------------+

The series can be broadly divided into two areas:

1. Qualcomm XPCS support

Nord integrates a Synopsys DesignWare XPCS, but exposes the PCS,
PMA/PMD and MII MMD register regions through separate direct-MMIO
windows instead of the standard contiguous or indirect XPCS mappings.
Patches 1 through 5 add the binding, generic platform register-access
hooks, the Qualcomm MMD-to-MMIO translation, and the runtime-PM handling
needed for the CSR clock.

The XPCS also uses Clause 37 control and status for USXGMII, while the
generic XPCS support currently handles USXGMII using Clause 73. Patch 2
adds the required Clause 37 USXGMII configuration and link-state path.

Using a small Qualcomm-specific access layer around the existing XPCS
core was the most straightforward way I could find to model this IP.
The core already uses synthetic IDs for the NXP integrations and has
vendor-specific hooks for other XPCS implementations, so this series
follows a similar approach. I am very much open to suggestions if there
is a cleaner way to represent the non-standard register mapping.

2. DW25GMAC and Qualcomm ETHQOS support

Patches 6 through 9 add the Nord ETHQOS binding and driver support. The
Nord integration has sparse, platform-specific MTL queue and DMA channel
addresses, as well as a relocated timestamp register bank. The series
therefore adds optional XGMAC register-layout data while preserving the
standard layout for existing platforms.

The ETHQOS driver then selects the XPCS provided through pcs-handle and
adds the Nord wrapper programming required for USXGMII, including the
EEE clock vote needed for PCS link-up and the platform-specific SerDes
loopback control.

This series has an obvious dependency on Jitendra Vegiraju's DW25GMAC
work:
https://lore.kernel.org/netdev/20260402213629.1996133-1-jitendra.vegiraju@broadcom.com/

I understand that a v10 of that series is planned. While bringing up
Nord, I also needed a few fixes on top of the DW25GMAC series. Those are
not included here; I will share them separately with Jitendra in case
they are useful for the next revision.

Testing:
Initial testing was done on the Nord Ride SX platform, where both
Ethernet ports connect to the on-board MV-Q6223 switch using fixed-link
USXGMII at 10 Gbps. The testing tree included the DW25GMAC dependency
and the additional fixups mentioned above.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
Mohd Ayaan Anwar (9):
      dt-bindings: net: pcs: add Qualcomm Nord XPCS
      net: pcs: xpcs: add USXGMII Clause 37 autoneg support
      net: pcs: xpcs: add custom platform register accessors
      net: pcs: xpcs: add Qualcomm Nord platform support
      net: pcs: xpcs: initialize runtime PM as suspended
      dt-bindings: net: qcom,ethqos: add Qualcomm Nord
      net: stmmac: support custom XGMAC register layouts
      net: stmmac: qcom-ethqos: support external PCS
      net: stmmac: qcom-ethqos: add Qualcomm Nord support

 .../devicetree/bindings/net/pcs/snps,dw-xpcs.yaml  |  17 +++
 .../devicetree/bindings/net/qcom,ethqos.yaml       |  57 ++++++--
 .../devicetree/bindings/net/snps,dwmac.yaml        |   2 +
 drivers/net/ethernet/stmicro/stmmac/common.h       |   1 +
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 162 ++++++++++++++++++++-
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  94 ++++++++----
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  34 +++--
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 128 +++++++++-------
 drivers/net/ethernet/stmicro/stmmac/hwif.c         |   5 +-
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   |   5 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c   |  15 +-
 drivers/net/pcs/Makefile                           |   3 +-
 drivers/net/pcs/pcs-xpcs-plat.c                    |  47 +++++-
 drivers/net/pcs/pcs-xpcs-qcom.c                    |  86 +++++++++++
 drivers/net/pcs/pcs-xpcs-qcom.h                    |  16 ++
 drivers/net/pcs/pcs-xpcs.c                         | 126 ++++++++++++++++
 drivers/net/pcs/pcs-xpcs.h                         |  15 ++
 include/linux/pcs/pcs-xpcs.h                       |   2 +
 include/linux/stmmac.h                             |  11 ++
 20 files changed, 707 insertions(+), 121 deletions(-)
---
base-commit: 6598456d72e48d779445bfec8f72114747f8b8d7
change-id: 20260923-qcom_xpcs_nord_emac-bf296eb48e4b

Best regards,
-- 
Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

