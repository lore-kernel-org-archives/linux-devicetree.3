Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538621;
	b=qZUrh3bOjFf6/mThKtOqMpuMQqnPmb5nxL8btusFlV7JvkqyYTWdOlLwNF4FDtYglHET
	 dWIhXbRbZc0qF86JIV4y2k3a3NQGo+Iy/IEgSGdfrWrPcThTx4KqytQFFVmz7QLuMwSDc
	 MAl9DcIsHnSYvG5Eyryp1fi3xuAcVRIpEYA+qKQ2JlLpMPqAJRTQmGEYrp48xl+/iSwS0
	 64NSyXuz4iTN7ge/UffKcTDuSzhdGjLOeuTrqZilwWlUR+YIWvd2YcqghJ5FqZiv1SGwO
	 nmN2p6TCt0XDBwe9qeGK9pm+FCC7O0La1jKOXRct3EHLjjPjyO/RXPhBkjsWxHjfjoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538621;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=onk3fnlRkqPUVq1zB+A0rGhSVLK080Q/lQHOHP69pa0=;
	b=bdX80rYqy1ophbL9lo+kDdVPcEgPHP50yHm1HAM2tFpEcE+ANval9CPZ3sZ9IAF2albJ
	 KqRCajAzoxu+OUkQaskrmU5yOJlSKn52tJIc0EZOM2Pe/8a6rGPEhi67SBIRpSPO5O3VY
	 OKvI04PmJnSNozG3z87CPUeT6XYnoUYdHD2IEtmjXGO2vK081b8Hrpm0MBtED8g87Ef/k
	 WuMeyP+eXWFv1nqi32bkOUOozmrKLggB1Stq1XU/x2s14FuRcgzCsBOGk20kHdthRA3Br
	 /8zsvkkufF+cpme05Q9apQsXJCVubtFsaoM8j3FoRiCbqI39vq6ygsQYviv+I+DPbOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FCffZGIP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CslyM1QE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EADD606A323
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EADD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FCffZGIP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CslyM1QE
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLW6a1331868
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=onk3fnlRkqPUVq1zB+A0rG
	hSVLK080Q/lQHOHP69pa0=; b=FCffZGIPNmMaGIz+paV1W7WNWouMZLBRWaJ3u8
	EpB2rjC/hL/TNtfZRCuQ0ZwuAtQNEyW3AwY5PJfxhyXdkUXeKszoh0U94/soAi/l
	cqqTVAEZTLSn3vWm2TptPqPFrqxEXJXEjiCQcsbSE2n3D3a6ks6MEK9radxq5UWH
	wu4fg6wp6CeBo1fP6yE+kB7fHE+9m/LvmZDDPzoyqrrPA5Z0P/XWj3ZsKZSkN4S8
	sCbiexbKX0LxQBcX6xoFvL7rv3/QGSRJFUkDmvZCmjb3XaVlIdj3kfHIEvRi0V9j
	6FWX8pT/uE6lpkJAQo/0K1OVNiqx8BI6iVFZvW/ROgiTHzXg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb3v0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:43:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38531c1a566so4241731eec.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538618; x=1796143418; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=onk3fnlRkqPUVq1zB+A0rGhSVLK080Q/lQHOHP69pa0=;
        b=CslyM1QEJ33/BgBb0wv0FFyjqtfNmPTkPdzGhkIA8QNfjhDd+l1BnANoAWz09wpOLu
         P/aqemuLZgxIfq2Ya9jnIq19V9TcAz5cXynHYITK96TE9x1eAmRGneoaxUyrS2yG51TO
         YxbHBwiW6W5TrI6QUuu8iFvUEGWoNbBTUTENqLRn5bnwNaZKXia4OQ48h0CSXi5tyGla
         b12neLjwNGrqqi4YN5kiGqprVhY/Yxqr7voMrCh/R9XH1XX2MfbXvPU9kpdAZQfw/3Db
         7nuq6mC4gB2IPvoSUJeFKBtqvGyfZ99Xs9dk75/ssRw1GFjf2T8exupoIubAde0u3z81
         VbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538618; x=1796143418;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=onk3fnlRkqPUVq1zB+A0rGhSVLK080Q/lQHOHP69pa0=;
        b=VG+trs9XuydHtXyt31rK7/q7qv9B4kVbR6j35pHYruQOFTT3277IHoTeWUzT0P1Giz
         fXQGj9ua54MuSNSUB+u8OkAggQy+LZhDwPPweepOU88Da81TmhuNbWFhCb9Fv8G7sQDI
         m1CGkMY5m1CM0szB2nIhavSVz7Nh6mYRYYDIdlP4wYZGN4PcZ7Vm3viPiU/i7V1Fp2Sf
         9yEwwQX4Ij+VZCRquwTgZtCRB68CREONaQFeBYQ0N1UUcf+rgCZ+YSPNHC5+Ilzx8rrL
         7s3V76KjS8Jwkn4HMg4+wA2GfdqjMFPZXgYjS+W2h8IlL3vfnH9C4XAmQCXkaROBU8e3
         Wh7g==
X-Forwarded-Encrypted: i=1; AL+hErHFKgidaMBwFNf1muI0S6QLXIN/Wr/UGvCB6sLG1NneUlP1UbYbVbaZhagh3sdf5RzJ2zyBArkFXXxg@vger.kernel.org
X-Gm-Message-State: APuU4Z+4ulq0Cjl5YaBxC7BVry2KunkODdGnm2yMtXaf2wLsO2OSuHPx
	L1IEnDDYvtQpyATUKk4+rI1tYCOJkdSo5ImUku6wtmaA8BG4UB96f46ijLG1t3W4jE07pNp39zK
	lxtg7WfIRV1X/VNTKPZSYL966YgLvP7pEW5RKjSWG6mjHJ4BMsSS85P0OMUFrZ/fv
X-Gm-Gg: AZFdTZevASzpHfBplZyBAo6s8t8s+162rqkzWeII3fNmFFc9IDuJJg2yhT04Rey2kJ/
	X5yZ1kdwTa8AXMk8zm9+ZZwyOhAAKQeN2r1IOCB3mZsZAEK1XTSVrxf/GW56OhVUVgDJ/ku6lGP
	kQYyXfRxiefpeph967TX39RgxS7uU8BoIqxbCGET09lzYfDAiWTzNTMggHyN6YqmBrFSqc+5Wzn
	hivp4TnW1V3FsigHgYU3jLdN+7rm3cWqq3V5xyl07irfJW0W0ehSHnOHxeW9IgVM6kW3Gz5wcot
	V3AGYzgudpLjATIRHXJzavUSV4k9CzPlBiS1IMeyz+OEMZd09q4iHumSYHIYOBeHJ4PtOFq3Pr8
	r4UmW1JGPNeBibQ+r0pAFg+V95czvXmjRMsXzszy7HaOUiGsFh0aXXBpMQs+Z+y4kK5YBD0WyKE
	L/ejLhko76dAJYufM+NPbpEY4yrWXQgRqgWB0P4ulrifPMcT6E1KUKWTHuadVxtAF7wXCzi1BG7
	P0=
X-Received: by 2002:a05:7300:bf27:b0:36d:3c0f:cc6f with SMTP id 5a478bee46e88-3856c9a7dd1mr18228340eec.3.1795538618100;
        Tue, 24 Nov 2026 08:43:38 -0800 (PST)
X-Received: by 2002:a05:7300:bf27:b0:36d:3c0f:cc6f with SMTP id 5a478bee46e88-3856c9a7dd1mr18228310eec.3.1795538617552;
        Tue, 24 Nov 2026 08:43:37 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:43:37 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Subject: [PATCH ath-next v4 00/14] wifi: ath12k: add initial Wi-Fi 8
 support for QCN9575
Date: Tue, 24 Nov 2026 22:13:26 +0530
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAK6+BWsC/43OzW7CMAwH8FdBOROUD5o2nHgPNFVJ6lBPNIWk7
 TqhvvtCuXAY2i6WLPv/s+8kQURI5LC5kwgTJuxDbvbbDXGtCWeg2OSeCCYU51zQL/RY1TcXdFE
 WtY0YzuOVmlJBqQyXigPJ2WsEj/PqnogZWhpgHsjHc5JG+wlueLCP3RbT0Mfv9YWJr4k/rk2cM
 iq9ZN46Ya3Sxz6l3W00F9d33S6X9dQkXrHqHSYy1lTcSLZXQjN4g8l/YTJjuiqLRhipC+l/wZZ
 l+QFXArPhdwEAAA==
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
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b05bebb cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=stkexhm8AAAA:8 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=JfrnYn6hAAAA:8 a=IFHodnDJ-pNzQd9Po4MA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22 a=pIW3pCRaVxJDc-hWtpF8:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: BI5B7i0QRJc8KKq-hYPJDcz8uKLdjfkD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX1eb0iptGqE62
 cn3iaV6jCuPTOfycAgGkVHfYxpBiSf6OUrI7q8+p3jGzl8AWDWQOhRKRFJlOm5EjBEhgRPWaBjW
 WYdou4HC/LvSh4tSGXjGPW/PxKfWyzU=
X-Proofpoint-GUID: BI5B7i0QRJc8KKq-hYPJDcz8uKLdjfkD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX3gG5McYgvetL
 1r9XaMMLvMOml+QZb3mN04DEGchebXLWtKqprjwxQNLJQHbR9ohM2IvSZ1KcNx5+Mx4sLtHuXY5
 yQsTwM4z1WAePWZo4XKrD+EsVA8OBMdas5nmWI+NXPB7nF8yt7a4ntczTt1wGxdSuGbrqQ9NU5B
 IZfOXdcFHqd1mZCmagZKDcEppSC9T5UStWsvLLbK/LD2hhK/2gbaiqO0U383qBztQN0xN+2jOdk
 mGH2Q2t014aJo7FaqTtTX0DSCxz3Rc0KRcxihfaAfjRD/wYRAjoETlikZOAFWTFI2nMewcTzbsK
 CKJ0OUKN/s361dlnVuAMwSU0L+zvQFEnlu8qDLdrYu8mz0HiweK/9OQ4/FO4jD2E1uGyqCJQL7z
 RyN9c6CI6gmu6QES9tmTrhjqPlKWV3JXGZI45q6Qh6HT1HbVO+AFnbu/NWGVegMZWt00wJEV7Tz
 JdvHJIN6FTvaWL4bEWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

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
Changes in v4:
- Dropped patch "dt-bindings: net: wireless: add ath12k wifi device
  QCN9575" per Krzysztof's review comment.
- Link to v3: https://patch.msgid.link/20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com

Changes in v3:
- Replaced u32_replace_bits() with a plain AND/OR in "refactor PCI window selection to per-device layout" to fix a build failure.
- Link to v2: https://patch.msgid.link/20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com

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
Madhavan Ganesan (14):
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
 37 files changed, 2510 insertions(+), 57 deletions(-)
---
base-commit: 03b7c601b6e314115015a57061f5b377afe13190
change-id: 20261112-wifi8_qcn9575_bringup-a76e76a1361e

