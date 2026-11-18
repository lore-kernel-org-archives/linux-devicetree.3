Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982754;
	b=VF0bj0AxWELwyNgf3ge6pSBk2hcdxWomgZUkx8k/gRMA3DfJXmdggBetpv/d4Ly0Cb6Y
	 2kEHPFIvsqlyOmBOp94GuIpQYtmHyy0+s1dZNSn+UTrEkLDkMRQJfOs8OMvIBWUc7HP9T
	 W1Oisp2EZm+By/KM8hk4nIcKVoLywMfR18PmA9146CYpPGUSEtztxu4SOvCAWtr5MIOY7
	 Lqdj4yHLZlH9l/poNBxndi7tFRnWtz22GLtPI5kNha5jFSb1J3x1ls+I371dlpCm1pdS+
	 yD3T/SOJEU9kEkdFG8upoTp38GCXzblaHKTmnCBcQtnJgt9jhafTD730oRFVfybGpKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982754;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vDEjMPy7HJmNHTeNxgHAx4/MYeBpn0DBUzvTmeTtSkw=;
	b=amSXLTb360264zKgItXMoTpHe0aGq/P+55SvixfVYu5cxMJYjVsp3eob2fa+5WjqFL9z
	 Kjqat8gYXCgPhTNS5dN9NdqcTdMdNafAq3V88udMAt0NEjHhGy3flClU0q/GXN/ExFPrP
	 4T8qfcz7N3DxgvQZvbRe9D437FPLfXuJDdr8bhxC3c0OWX2Y94BFRZpuHn8mjVB9jl5xv
	 +x5ZcJfRSdJQeIJa61Z+Yt0Soo2KayBqZwCiic+OuGd02/jFH5qdSkE4Y4auww5iY+6gg
	 gnwL1YC5g88m1OCFWSXILrcSN4Sx4sRt8H9e1/9najENP+Qn1qR+CHgXUxq0BxeFSNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R8YgjroA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BBB7CsXM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D2D606A334
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19D2D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R8YgjroA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BBB7CsXM
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UtwX1959667
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vDEjMPy7HJmNHTeNxgHAx4
	/MYeBpn0DBUzvTmeTtSkw=; b=R8YgjroAU2fIXptsdPlOB4iffr1NYJ01HYh3R+
	b858zowW7YG86VM/M8qQOSl24QJBAMls/EeUjGrfUPlVrFLP7eUVW48Zr9vFWHZv
	43QhU2wWWvbXAxX06UEe7uFfJ8x52Lpt562MXdG2pR9VG8vQ4nANUSSnfqf1HAEI
	q6dk40evl5ROdDVx3CCNP5zF5dQv05XqUq7uVuSrOfWATh3oas2ivpaeZVHvRwCh
	JINTRqlFEAj3aU5kyw7YClKwfqezoMXl3H0sTznL4SxDZ+ZtDMt5tASDq4QugQOF
	ssC7MWR34gNzmII+OF/J1gKckU2ZiAJ+SDsn0Bo1Cw0Q80/g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hgp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:19:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ee2d612733so13205225ad.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982752; x=1795587552; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vDEjMPy7HJmNHTeNxgHAx4/MYeBpn0DBUzvTmeTtSkw=;
        b=BBB7CsXMWwlMFNHq/90zoSZWWFs+6itWN38fAz525DMbsahMfnff/NGqZoGcujskiC
         B4FqMz44xz+MoPCYyg1kRhmQhTbm2L+tMxBFFkHn12614OLo5kbjnw3w4gjE8AYQEKvx
         PcLPdo3VTZ/7x22S3rvfch1ud+mIIGLWlSKuJuwSXVPFJ2iimTouGxteBBESmhYDRtcm
         Y6tYtEpEX2rxUeoL59emsxOUTgbnavHnGK/e3Bq43mKPPLUBiWAMgv1g5eCQ4G75J0SL
         K4YX74+MEcrixGD+nMJinfk6bmwT51aXJb2WZTd4TrGLfHy06OfOzsrMtx+bWbKGLmQf
         ckNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982752; x=1795587552;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vDEjMPy7HJmNHTeNxgHAx4/MYeBpn0DBUzvTmeTtSkw=;
        b=XdwY1F6DtDFUoMpT3axSa5v4wnWjcC/3ygybzrasfHHvsLaFMM0+GudZDaW4cjFnVI
         /EFdVIrPwwhin4zPK3+6VG3ovB6GFohV8dXM8UCDi7526pXNFG383jL/tW5oqbhf1ZCa
         8fa0sfX7I0RIGu0uZiENc+i+8g53JONW5WF6on7Vml7UvF7vJQBpGqlJmr5uv7FNSv7+
         38vQlu6LD/2XSXCEobm/1+Mo+hdkjUd4gi07404Zp83VlQke+iGQqEWwsk4qsgJ56Q5H
         ac9VUdq2Fq/Y7aJQAlmWHEFnFoluHfNTPsRCxo+Nn5u6FHHJe/pLHD2oUPL4E1QOmFT9
         eFRQ==
X-Forwarded-Encrypted: i=1; AL+hErEleoRLF+rtuqvcMDlgaVHuSYO4j8TTePsZRjrgsEFyuVdic0nuKCAZjT3ATm5gEEZBP+LTGF6FSsOi@vger.kernel.org
X-Gm-Message-State: APuU4Z/DEXuIrra+5KZnXmcDbuvxdCCMgzLig7jgENlGkjCOntgrM5cQ
	7HKA3LYzeEmm+txGwTB7sW2TpYk7oYZ1LMQRnh+zHJO0uSW0YKH4z6O9HEnpf8WqAOjqp+96Lwh
	HkjW2l/Dcm00d3BUzbJQGwdyq3BbDwLDP7GjgYU7D9gOeM8QU6ma/rCDQNMvSG5at
X-Gm-Gg: AZFdTZfAl+2xqP4cmP1/4CrVL9YK5rzyrkl05mrpb+ZQhv7hTKjZqroGZSo7q7YC+qV
	YDIGw3c1eM2TK4mr20bsNXlcMZNoY2Z+SawhBUhDkiZd9jSXcj8k+LSV7+bdEgxzJI5pWHcmMKx
	pnDRbvGglWsQ4cKkCFSKgr4WNcHXBMhehzO/2UMBp3Tp+/ac8PeZB5zN7Hr0kqGrsgZbqEpHTzy
	Z1q7U3Bxc3xI7tl3b9MgPZEAfwTvNh0Xo9Iq3c4MB2b2cy0lbCfhyRreX970U1dnfMDXgcTwtpy
	3TcVjy5+8D4p6pWhgvs1/BfDzS2nyOPPmBVo8ALaWbaiU76v5AqB8L6O2hlr6DS3jyJFUgw3IFA
	Q41zFvTeX9nGQNmcd/teuswqjEppcp0lwrd1J5m0pzzs8h0oHV9083VK2k22Jc6wa2TDSvVdgZd
	kye/dNt2Ozlm8FV8eAj09qfBNtGvICnwkwN32gYOQOELli1IJ/UZE4TRDhZgjvjagrsve6D5Xv5
	64=
X-Received: by 2002:a17:90b:52c6:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3b3d063d686mr1274322a91.6.1794982751309;
        Tue, 17 Nov 2026 22:19:11 -0800 (PST)
X-Received: by 2002:a17:90b:52c6:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3b3d063d686mr1274305a91.6.1794982750624;
        Tue, 17 Nov 2026 22:19:10 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:19:10 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 00/15] wifi: ath12k: add initial Wi-Fi 8
 support for QCN9575
Date: Wed, 18 Nov 2026 11:49:03 +0530
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFdD/WoC/4VOSw6CMBS8inlrS2gJRVx5D0NIWx/wjLTQAmIId
 xfwAG4mmcx3gYCeMMD1tIDHiQI5uxFxPoFplK2R0WPjIGIhOeeCvamiS9kbm6dZWmpPth47pjK
 JmVQ8kRxhy3YeK5qP3juooWEW5wGKnxJG/UQz7LW7t6EwOP85Lkz8SPxZmziLWVIlcaWN0FrmN
 xdC1I/qZVzbRhtAsa7rF7gXvcfdAAAA
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
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd4360 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=stkexhm8AAAA:8 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=JfrnYn6hAAAA:8 a=IFHodnDJ-pNzQd9Po4MA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=FO4_E8m0qiDe52t0p3_H:22 a=pIW3pCRaVxJDc-hWtpF8:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: yW8DvCDEPxBjIkidJ6YKIVOE9QwAY30u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX1foEGvxELcuj
 eioaP5pDtNIRuS1yXfhaNwyctyE/0ZLw9fIoMiht9crhNMdIW8nstKTSVAvxhqATSHEXZz1UNDc
 09gGUj+Oe7LHBBCoZe/WmTl89Bgatx5WyV9A8uOybMH3e6B9zps+NR+XxhUpkqJ4MqM3RUpE+Fn
 iQWbkUCjPF7yw2ykunMaqdWebcoujALmqPDq9bJSk1hznlxzEATOlp4GeaXLT+hdkdUCoUMR8V7
 4k9FuqYej78rwFOUrvYtkkHdcrXIUnvq5eJLaiqYiuY7dhpHexfuAMwHsjZ0nLiU6EieXEelTaK
 +288o5ywqRcJRhadQ+Fa1FWn6V3SJeU7lGV1gEC4G3Gd99XsyHPF5FsnAv89rn5SOydMQXqPHEB
 7/35UkH4arKQsEer6Qd4xa4Te37dCt3plwqAKgbDi9Kvi7YBVTprk4cnwVpHPaPi5I1od4Lqwuu
 otxHCPH9fXHkonId7fw==
X-Proofpoint-GUID: yW8DvCDEPxBjIkidJ6YKIVOE9QwAY30u
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXzyYLZbFKenT5
 PnXTwXgemSR455DJ4h4IeujoWfbWvFcF1xovc5LA2b6DMr7NjF42ctAo5rkimOR0Bc+YC2i86mF
 Gow3z342PEmIFca/YbEwTe2j8CGlcAU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

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
Changes in v2:
- Addressed sashiko's review comments in patch "refactor PCI window selection to per-device layout"
- Link to v1: https://patch.msgid.link/20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com

To: Johannes Berg <johannes@sipsolutions.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
To: Bill Wendling <morbo@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: ath12k@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev
 
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
 drivers/net/wireless/ath/ath12k/pcic.c             |  27 +-
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
 38 files changed, 2515 insertions(+), 61 deletions(-)
---
base-commit: ee7edfb99ee26581633fabb0662382734ea3cdbd
change-id: 20261112-wifi8_qcn9575_bringup-a76e76a1361e

