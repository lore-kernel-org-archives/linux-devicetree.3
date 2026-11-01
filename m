Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793520332;
	b=Y333Z+2mLOcgLUoKSOrWTZLrymTWA8YA4nVoh1KpvR1C4JYRdOtMbMz8TGYc//Gy/bZN
	 UQOlvK2zyG96cT8Th5RN/X9NzRX0H2ic6jq9ffbggksU19cRKubsmIfDJURRLS5TzfIew
	 NWm0/SnsvsjV3tc18LQzO7CbsUj1mTCTeDxedox7pOLyxNFbIRohD9R9zXpsNI60u4kX3
	 IpWJd2/ROh49DwHCYMvJrx8aBWRixc4MbucTNK4/i2RslP9FLJxHWaCMCcXJS9XAAjgkD
	 ihZ8l6HBfnzWP6wCjK+6e4AEyDVl6CqorMyfu2CfGa8h4EElTaH364HJL7fM9afjPkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793520332;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WFmAX1luoARi+lbgNfe1tJjLtvwPrpjBC3KD9ASVyHw=;
	b=0ihKB4IQg7MBSo7bGLyQ1vUqbYRC7tzTYMCsCYWV0N2rFc9qkXdSfuOu3ArupmoiargM
	 o9VioC7Uc7zGr6Ypos9gxablJGEaSqXOSYVRsl1aetl3UbVXEeR+wFLgaFO9qek5cvS2A
	 n5WKd9Vilp9GQxhe16nzfXGNYvB85wbVvPdX8Uh7WowuIrAU9gOj5cyZLcXQyo2Lr77aY
	 x6u1P/hJiJjW/4NHpTPRLg9MPT1D0Y7n6NZJA1rRiewoHdTxFI4H4Vr3xxfr87gN1pAVj
	 8zbTixg3+GDkkEo/TGcMsZFB0MtcTqMG3CLDmWgAPmQPu52stJh2U6HMwuoYdfOg4pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Trx2vTWZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bWV9Syrz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3324D606A324
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 08:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3324D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Trx2vTWZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bWV9Syrz
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A16XS65701802
	for <devicetree@vger.kernel.org>; Sun, 1 Nov 2026 08:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WFmAX1luoARi+lbgNfe1tJjLtvwPrpjBC3K
	D9ASVyHw=; b=Trx2vTWZH3Uy/rjXBmkJTNLDiInUfe937W9mC+WXttI6kbl6GIN
	4lOA7gc2Itnc6f5Ao9r8tAxn9npwJU7/4VwKTjkQeuQlY7rip4Fc2uXdJ/mVMnJV
	MLlpSEKRJaA02ejyso3o7lZhlbb5+yDMUrszvPuJbvHILRCxAA6hJvoimQ4tdP1D
	TYzYBudjsnMZg4bXpitmc19nFzl0PAHHWfYfOt3vtdqKDVMZRNOwWOPGTKyuogr4
	DAx+Vq73O6yk2UJT6dj9t3d7I0hBhpVIHhGWXyGB9YaOQ1F5E2EJJ0AX/79D7jhX
	MyEtQYlH5Ua2EhEpgBsA39ei0AuMdZdLPQQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6k2qh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 08:04:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3552883bd19so9388454eec.1
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 01:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793520293; x=1794125093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WFmAX1luoARi+lbgNfe1tJjLtvwPrpjBC3KD9ASVyHw=;
        b=bWV9Syrzk7pt+JISPh7dl3luMSa6U//B7c2NvcBApFiknhiocfHdpFV7sLjQY+7Owy
         19AR+vRFDTJlEg84oFJ3JUKTlj2gSzw0iw1ltGqJDlRp3t8kFgN8YYJyhk8HFKF0WinU
         azuAETnkHnCesOCqbujp/wUuuNxlmZoYRGP9ylSO9jv7z4ocK93bNYVLfXg+YcDn+6w4
         ouJRfrBAUqm8h06XNvaljVc6DUsPPZloBXcWOz75ln4PCdDeNz7U5sreILj8OZR6HHyc
         jZsV6EpiGonaXxXox+H6UCOtsJfh1DHErWVNsUCOTNQHwkW/kCEkp/jDE7GyLWu9xzpf
         gPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793520293; x=1794125093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFmAX1luoARi+lbgNfe1tJjLtvwPrpjBC3KD9ASVyHw=;
        b=ZxkPOq6ku1HH5A9tQ4bTO1jUam2W1DYMu/2yd/NCBuq40qk98o9xzHqUfQGN47Km0n
         pZ+5V5l/RRUvXdZgxgZZz79rpws/lB6EumQRN8NjlWwMhP0Goa+mJLQ1hUfmCF3yubFL
         12Rj1lUqSBreW00D0a95M+fvJJpJ9hFQYuu0cvJwNi0eO9jodBg/Kx/QGlNGufqWN9Be
         FIVnNPPdm2eMFzzafDaNmRxXfFkXGsl9h8Pa/yx7VXIXaoVGjowkl8AKeqEkQMCbIqPu
         4LzKYMCl2wKAcbNMc96npj96BS77YzTPpMTY8fsAFPUNDKRSMGQ7v9OpbVQZgYv9ys5Y
         hRNQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5lvy2vD8+mmKWnyf633TueTaSsSaNC/yoQ00ed1CL528z53duJfoKdOl0l7dwLukp/U5LWOQZF1NH@vger.kernel.org
X-Gm-Message-State: APuU4Z8jEQNfr7uwPmON7OCuqfSmxGfJboIH+E3qZGPgif3XRcAD/bN0
	o9jDPBa5R2fWhgE2Alp8ZDXOXJxt+X7+P8d/aK/Jfgh6FC21a7Y32uXZRReB8gUApEnXkENvIds
	QyFwEH3hT5ijqhdyacRIfA/N1I9vN0e3djlWfWjf8BFzM9PusrPGX6XfCfchXnjU+
X-Gm-Gg: AYBFou2/2U4ZHn+FcNCD/+DHfB5a8VNF+McT0akrhBNpj5pK+irbxs8jKnRGduxgMsF
	+cyFugR5Y85VcjtCrXxKy9GIG3ZH39akOQVDGcgx/+0jx3Tr6aiLhQvLXSBMEZaYKb4mMnjlj6f
	dtBjBB46iAf429OG/qbrAs1DPaFMbbCuj8Dp+v3XX5vNm6erIet8hafb5WLpCDmCbs6iIIOQBRv
	bK+g4GLhaMlZXCIWjXqTjiUbbPZNy9HdN2itbWE85qlq0DhVVicbFIjoF1YHGDR9dm6WlVTgym6
	XWKrmOXzLC2ZoHDQm8cL6zOpyEvTXSUzNQJ3yS1dDdwTpZXssGJy7DuswjYUd4ypKFS7+oBsj8r
	dFuBsBTpWzXhA0LHs69ehti44bVVcm81Iqo1AqYK3JqU4hxAHZwaFq8wPugfwjnO9FuZQxgQGCG
	hDP7kgs+PpG5tYQrMtxtSB30YVJiDhfuOo
X-Received: by 2002:a05:7300:6ca2:b0:366:fabf:6273 with SMTP id 5a478bee46e88-36a423e35famr15966799eec.22.1793520293220;
        Sun, 01 Nov 2026 01:04:53 -0700 (PDT)
X-Received: by 2002:a05:7300:6ca2:b0:366:fabf:6273 with SMTP id 5a478bee46e88-36a423e35famr15966725eec.22.1793520292406;
        Sun, 01 Nov 2026 01:04:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm27341792eec.23.2026.11.01.01.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:04:51 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC 0/3] arm64: dts: qcom: Add Ethernet support for Nord
Date: Sun,  1 Nov 2026 16:04:10 +0800
Message-ID: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ur-D5DNFR2qAfyJxUXoT3O-lvzaqqw4R
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae6f2a6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=c5OIkBcGCNzrVHuk8D0A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: ur-D5DNFR2qAfyJxUXoT3O-lvzaqqw4R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDAzMiBTYWx0ZWRfXxi07HzyV4BEO
 P5K/KnEKDSjVQi/Chok0WnbiuLUZTposBI5Ut+jaFJ/xaN+R36I9FKE3OnrcyesB/oBZ5+xP9oL
 CHYkGlIwllRyCmnf9sjMfUOdmMawT64=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDAzMiBTYWx0ZWRfX4mDFg1y3mKRH
 Obdb8ICcgCMgM98/6GuyviA3AWpgvEIwRD9553nGFA6cZdL47IAcNHxWuNpv/K0AVThIrvaBB8v
 Aa3ZENmBYUZ6DdSLtGihVid5dWjEveD+BQGfwZ+M9XNcgRY4Md3rzDVhFQhrcxdSTDTuqL/MKm+
 3JmQLtMUdAuznSakninP/nY5qupXk83z1YGCh+I3xzLOwpeQRFtoKSWr9IBRu+xUMuyryvcZiB4
 9NEuGxiPCsjFHdoMUopKkNhTkaLgTS/xBmx79ZD6pmqILCao60TJE/3mSWseuWQ3Ju0R4ae0es5
 fZdLE/zeVtRHhJDDj/A9FZzpKbhFHCDvT5DyACA8NCmlB0NjjJ7Yq04/FRFoZC3mdpnjhnteK8T
 6FEgbv9EdtfRkNWNaQBRTMdZXx1/f9iENcIS2E1LgmoM4CswR3nSfvsrWtW+YT4D9QJnrq2Dl9k
 /B4K309w0lSXYR7+CPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010032

Describe both 10-Gbps Ethernet controllers on Nord and enable them on the
RRD and Ride embedded boards.

The SoC description adds the two EMAC instances (qcom,nord-ethqos) and
their XPCS blocks, plus the SGMII/USXGMII SerDes PHYs they use. Each
controller gets its clocks, reset, power domain, interconnect paths,
SMMU stream IDs and DMA queue configuration.

Patch 2 enables both ports on Nord Ride in fixed-link USXGMII 10 Gbps mode,
for the onboard firmware-driven Ethernet switch. Patch 3 enables both ports
on Nord RRD, each connected over USXGMII to an Aquantia AQR113C PHY on the
controller's MDIO bus, with PHY interrupt and reset GPIOs.

Dependencies:
- [PATCH 0/3] phy: qcom: sgmii-eth: add Nord USXGMII support
  https://lore.kernel.org/all/20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com/
- [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support and add Nord Ethernet plumbing
  https://lore.kernel.org/all/20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com/
- [PATCH 0/3] Nord ethernet followup
  https://lore.kernel.org/all/20260923084921.3942100-1-zhangfei.gao@oss.qualcomm.com/
- [PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
  https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

Mohd Ayaan Anwar (2):
  arm64: dts: qcom: nord: Add Ethernet support
  arm64: dts: qcom: nord-ride-embedded: Enable Ethernet

Zhangfei Gao (1):
  arm64: dts: qcom: nord-rrd: Enable Ethernet

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 124 ++++++++
 .../boot/dts/qcom/nord-ride-embedded.dts      |  44 +++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  88 ++++++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 282 ++++++++++++++++++
 4 files changed, 538 insertions(+)

-- 
2.43.0

