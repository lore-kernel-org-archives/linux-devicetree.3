Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878575;
	b=lqRoqWIoXq8ycTuyP68Dw117dvW0E657bkWWjxCTC/3ntpa3yDXI6LW+s3X5sxJvI/J7
	 qTuWVJnjaiAM4qmIF2yzsrqYWr/NhJ34GOUdWm8IeqyxMMm8xPw+qbGsSV4WHVHD9v8uW
	 BPZKo5jfbJOTuMsMe05HTr0dcR3awCWKtfHqjkpCpjs8lIouFZDhOEe5YTnpDE/swOksd
	 19gHg8Hvla2quENzvHRGajorh7MUKDMTIdPW/7fsvzU1GgttQYpm7FpN/DDdoBdPBlKM+
	 lWfq6GNdUxd/3IwIKnPVXE8C1ptv4/uaZ37OcYTvpVicRhcliORAQBxW1P2FXDk3stQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878575;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zgwlKRgbAyyeVrz9e03wAaukDpxsjlYyoxYyI2Ompng=;
	b=LVDuMotIFs27GXwJuAU3CkbiS2KAiKGqXY8SnSNspCWDZHo7UeFyyInkYkLcrNAzbxNh
	 7PWqCYf4ynB36KzsR1kdHQm07xswnDFpdyZBFNqeNP2ZmccOtuD+qMvOy+Ee4RcpSHTCe
	 Mkac076AC8hFTIdMpYCPg9P8aotuQhtUzd/zcG9bsf5iK/SvshMlRniiJrRluiPN7kD5r
	 KbD/0MN0IKQ07G+2dOaqabLvYSIQ73tSLkX350XsKRvdavjKFyVTZwZlafkn/jOJupaFp
	 Gvgo/Iio+5YIyK9eNRmmJKrSlA5FMNeteL+NOlP0B/DJl6BT7PTJI3YYRIpdBFPjVnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=qj11wS3y;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=g5rvkAj+;
	arc=none smtp.remote-ip=202.12.124.156
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06231606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 11:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06231606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=qj11wS3y;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=g5rvkAj+
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 55CE87A0149
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 06:36:13 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 05 Nov 2026 06:36:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1793878572; x=1793964972; bh=zg
	wlKRgbAyyeVrz9e03wAaukDpxsjlYyoxYyI2Ompng=; b=qj11wS3yL5DDq5X1Ht
	qOlk3+WuKLwZLtS8XIf7K28AQyD/69sGsYANDa0aBSqzXWfF6fvemgZAgi3PVEtJ
	BOrD+o82UU48P8JuogKSIBoy+/5wuaj2W7Wa/DBckit6i4xxG+5gvm0njWX5FOu2
	mFMJYDxaqpb6q8kVWSpmL819sPZNjEnvSjdDrNhFN+Pye8OJ1zdZz3ReYRZztPHR
	2hP/gddeGKcttvdALY4ZWi2CZqJtCi8+w6SfVCa7A91i2+Vkw4HOiGIKDa1grWLM
	HwDJhLbnAih9oIV4PdTkDawwzS+MplTXOshGg39lVmVwJ2mNG0ue5YYLubffnoa1
	BXbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1793878572; x=1793964972; bh=zgwlKRgbAyyeVrz9e03wAaukDpxs
	jlYyoxYyI2Ompng=; b=g5rvkAj+oNKdnUsXerUwfZUrJtORpRKwAu8BbYXCuje0
	tIOv9qzA0T38dWB93wwkd0yhcK6Xu9zKnURvqo8yxmfmwEISgWfi9StFciH6uAdf
	ip6Or4sGfjpGY2Fl0IRjSAlKrsH3BnEiGvvusSz+QEiw+gRCr5SP9Y6njzfm52aE
	LDY/55GVHSEhPGEqRTfd2OY8KU0AxT5g/ciPZ8KZ1KAC23BDzo6fD8Z7UnTEOxJ0
	0Arkw/W1eahMCBFquhZTiFVICnBrLF46h1VpPIY+hi6sIB91oExxjJeOoA4Bwqn8
	Y6EhO2xte5uwjLp9mxxQ4LN3W/xmvhS6OOpNf085Xg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793878572; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:kMHAX6qUSrGjmusn7ldSTB6aPATWzhrauhjmJLXvFLMoNxW
	7kEgXIm2khlknZ6SEZzT2+4FjTDdY9Z1ggyxvtl+AKkzp3v7MzRxmclAovU36SjO
	v10GIA6VKmKa0K6/vI4aaml5WOXgfGaeW9RjqsGF1GHsHeULZ1ro+ssWV10BeAZO
	QNliWsj3QqIxyM2IfNnPCnl6pl1b2vpqOZQ9cN3Gf6CGFSCAZFhja/RgkY5h98oB
	Xli69UFIa1gEk12TKiY6DXwYCHssw1Cv4MBhT5t1pHCDXilMxeu6jxaWihsKevWe
	CchnCcBbloSUD9kT/H+3ORTdK9dSuCfi59UPg3Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:LpZ/5bJM1HLJbcJw2JIC5vEe9vj8O1x7MPP93kEe1yI=:zsPBGklg+XUvs17DCrShWGlc1/+ZwSc51P1G7wIhUZk=;
X-ME-Sender: <xms:K2rsahhFrUfM3Sao498qjOQ-7ZQAG-q-U_bVH4_SFkfzrmF6QSpeMQ>
    <xme:K2rsakblbAbjEg3WKZ04RSsEL7jg8QpFc_dRlTKpTwzG9-0djBT45UWihHCoWL8az
    YMA_ruC2K64ww4PZLQwIIMNVqGnECbWeOnbT7b2fsMEhMKAVySJLPo>
X-ME-Received: <xmr:K2rsatE7Th42Xgq8HaBwHOWQWYRqrU48bQcQGcsxgdDmOcJo_XJ38SZmd8k1dyfSiWUi8xM8tCD8n_2fmROyYAbqRUyIGJAwsiQ>
X-ME-Proxy-Cause: dmFkZTFOa7Ic94cWIacjGhT1BhbECCJf5jZOPDKN/9fhH8jxuN8AGiILDwHUgregI5Fv7x
    KMJdJrUREigLbC5Dc7GCqTqwPtUSs9fuv6Dip20yeAeLHdXaHULuc1cUI8O1bu0MDxlqri
    dZgycBbAWk1wLRdJJcUVEXtcYqA6yQI15kNjdD1S3vxzODPlwowgnkJTs9tpA5W8U/1TW9
    qGnNAN9C7Gg0r5A0BZCghWNep9liU8Pdcn7ErHBZG0fEsU1kNH8DGczEcnWw3Lnl2QdrGq
    R/2qJBd6bVjVn+K6akbdmP4HMw/737P50K0st4ZxdQC8v2TAhIPL/mhvRen2Ptkgh59OER
    BqO+XJnUMAPVioPlxiEvCOcVWr9pc30AfftBFMTA7NJVZ34T0oLKmPr80dbFie4et2B8Fn
    TARleNTK3hgM65vRUZ5yQ94V4jQv2oF2NY5LxZdhJFYdOy/fq8pmzfemSWd8pp2TsJHWDW
    g0H8dDBcu+GdyBfj/+XWjlPWlI0/y0BKDIQtylm+pSkotdTpldZcZOcQNvt7/jEwracAne
    r0s/yABeMO60ZBk0HrN8EnD8K2RGi1dh9a4HOf2wT0UcH/eNlctny7I1InJlXVxNj77xUH
    +K5FQDOIHNu7mfiEcEIkLGAg1Lq7NQZIkjxyCPas5qtlMb0XeoeAKdp1lFcA
X-ME-Proxy: <xmx:K2rsapbUFFSqVfTeKsFL-sZcr8_vMmInLRazGOkMthU7wyIYJC5vgA>
    <xmx:K2rsam1p75ui5emHs8NA8N1fIUYIZuBYjvyGQUMqtGucGDwgbKBW9A>
    <xmx:K2rsapeFMv6fjpIGfBsjwUumvOENjDIKPJ_1Lg2NBeeEXhdS6LPFIQ>
    <xmx:K2rsagCZdjc34x5aYzp67W5tjYeqSWr4g7H-N0NQ5BMhHzs-QvrmNA>
    <xmx:LGrsatQP3prpoytU6xroqbLmj5onamjz2RLdm-vLjpvseLaF855QYDqI>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Nov 2026 06:36:11 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH 0/7] Apple M3, M3 Pro/Max/Ultra PCIe device trees
Date: Thu, 05 Nov 2026 12:35:57 +0100
Message-Id: <20261105-apple-m3-pcie-v1-0-e00a72a604f8@jannau.net>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTMJrQSJVyEspvVHxyA0LRgSw
 t2puvwW7+2UEBWJbsVOER9NOk8ZpizIP2V6gPWeTbayjTFVzRLCCH5fOHgFC67WtXXjRAbKTYg
 YdPv9uv7vtLoX/PKd0HGc8cs1w3EAAAA=
X-Change-ID: 20261104-apple-m3-pcie-ae72b846baaf
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Joshua Peisach <jpeisach@ubuntu.com>, 
 Michael Reeves <michael.reeves077@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>, 
 Yureka Lilian <yureka@cyberchaos.dev>, Alyssa Milburn <amilburn@zall.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3188; i=j@jannau.net;
 h=from:subject:message-id; bh=zsPBGklg+XUvs17DCrShWGlc1/+ZwSc51P1G7wIhUZk=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqw3WWpf27qPCC++ZWOZ7fIy4Zac0tfX86dwP1/Sfu2//
 zGV4/fZOiayMIhxMViKKbIkab/sYFhdoxhT+yAMZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKneacrwP/HaiW6+N9NjrHjdk372aff526//5CQhVRItq3K2fM4mLYa/gppv1qt
 ssN7JZWsQzG95IW+RW47kFV7TTv1Qjs0vDf05AA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Hej,

this series contains the device tree changes for PCIe support on all 
M3, M3 Pro, M3 Max and M3 Ultra devices.
The PCIe controller on these SoCs is compatible to the M2 Pro/Max one.
So add the new per SoC compatibles to the dt-bindings and add PCIe
device nodes for all M3, M3 Pro, M3 Max and M3 Ultra devices.
The series contains a fix for the M3 (t8122) power-state devices tree
nodes. A power-state required for the PCIe controller and the NVMe was
not correctly represented. MacOS keeps this power-state always on and so
does the device tree for M2 Pro/Max. Do the same on M3.

Based on apple-soc/dt-7.5 [1] to avoid trivial conflicts with the NVMe
series and to import the M3 DART dt-bindings from [2].

The series passes make dtbs_check and make dt_binding_check and does
not introduce additional dt-style-check --mode strict warnings with
dt-style-check from next-20261103

ciao,

Janne

Link: https://github.com/AsahiLinux/linux/tree/apple-soc/dt-7.5 [1]
Link: https://patch.msgid.link/20260925-apple-mtp-keyboard-final-v4-0-304c267518f4@gmail.com [2]
Signed-off-by: Janne Grunau <j@jannau.net>
---
Alyssa Milburn (1):
      arm64: dts: apple: t8122: Add PCIe device nodes

Janne Grunau (4):
      arm64: dts: apple: t8122: Keep ps_apcie_phy_sw always-on
      dt-bindings: pci: apple,pcie: Add compatibles for M3 SoCs
      arm64: dts: apple: t6030: Add PCIe nodes
      arm64: dts: apple: t6032-j575d: Add PCIe device nodes

Yureka Lilian (2):
      arm64: dts: apple: t6031: Add PCIe nodes
      arm64: dts: apple: t603x-j514-j516: Add PCIe device nodes

 .../devicetree/bindings/pci/apple,pcie.yaml        |   6 +
 arch/arm64/boot/dts/apple/t6030-j514s.dts          |   8 +
 arch/arm64/boot/dts/apple/t6030-j516s.dts          |   8 +
 arch/arm64/boot/dts/apple/t6030.dtsi               | 165 +++++++++++++++++++
 arch/arm64/boot/dts/apple/t6031-die0.dtsi          | 157 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t6031-gpio-pins.dtsi     |   9 ++
 arch/arm64/boot/dts/apple/t6031-j514c.dts          |   8 +
 arch/arm64/boot/dts/apple/t6031-j516c.dts          |   8 +
 arch/arm64/boot/dts/apple/t6031.dtsi               |   1 +
 arch/arm64/boot/dts/apple/t6032-j575d.dts          |  72 +++++++++
 arch/arm64/boot/dts/apple/t6034-j514m.dts          |   8 +
 arch/arm64/boot/dts/apple/t6034-j516m.dts          |   8 +
 arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi     |  41 +++++
 arch/arm64/boot/dts/apple/t8122-j433.dts           |  28 ++++
 arch/arm64/boot/dts/apple/t8122-j434.dts           |  38 +++++
 arch/arm64/boot/dts/apple/t8122-j504.dts           |  26 +++
 arch/arm64/boot/dts/apple/t8122-j613.dts           |   8 +
 arch/arm64/boot/dts/apple/t8122-j615.dts           |   8 +
 arch/arm64/boot/dts/apple/t8122-jxxx.dtsi          |  29 +++-
 arch/arm64/boot/dts/apple/t8122-pmgr.dtsi          |   2 +-
 arch/arm64/boot/dts/apple/t8122.dtsi               | 175 +++++++++++++++++++++
 21 files changed, 811 insertions(+), 2 deletions(-)
---
base-commit: 6c799b8c0df41869fa0d059f7e54f8f84b3989ee
change-id: 20261104-apple-m3-pcie-ae72b846baaf

Best regards,
--  
Janne Grunau <j@jannau.net>

