Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605989;
	b=lycwYQlhP1X+x1KMEs6z3pbjpMoJYGpoAUHw5bq51JR9t8riV44Rxk5cVXeoLhCVmBK2
	 VPO8mSdMszUE7DU1BUyGRQtiXPLQ3anBAJ9+Cc3wJKKQweJhE5hQRWlucObnsgsM03Ef1
	 yKlxSQAzGEQ6lexo0Kv3AdroBfoB69PT2Co+DrUNEfovxC0nAYYR+ez2xmhlmAYmNYtsI
	 eMI50WfRaiElEZ19bAGg8b2Q8R9B5G5IdRgqTrGKk1mxGIYK7/ndVSx8EKpGXjdcb2EAw
	 0PuWUflPj14TqJ7uU1X/J/g/O/+Oi4WNJAMMguhLuEXl8anfTyJ9YAp6i4/RFwT4KyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=G+BRXkvsKkCtNetmP+qei8f/iduzEEyC3n2dsxTeZ90=;
	b=gU+mAF0RXSzepFIgIwAOmTSK8bscTww+0VNiwymh2tJ96Qvuo50JiagVaY6pdf4bRcud
	 HLIf2yydUTKkMiXEa07WLA7ilMHocFeraA9kqXflRiGgU4EjqGXyQAn/FDYh9tPse1GCx
	 Jw0zEL6AUBvVzyw/+G/UI/4K+7JmXQYQ4je3pJP7uIOMEhkEdGREJPaK6Lf2Bns1ej1ka
	 ypyAqrFlZPvy0m/wBqN19Njyk/aYe+VKbf7r3WyOyqZZWytSU4BegJRQYf5pFbbUWhtHR
	 FxHJd2aXqxiicANOaKBdT6QLNc26dncJNXNz1kEjIWHo2DxKGWVVJfURWHHJs8px86w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PsnXNr0E;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7210D606A33A
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7210D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PsnXNr0E
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b8a1f59d5eso7290492a12.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605988; x=1796210788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G+BRXkvsKkCtNetmP+qei8f/iduzEEyC3n2dsxTeZ90=;
        b=PsnXNr0E2nPRNc4NVDs6TRBylDALo4zK45DsyV3iimGtstnIcQuO8A88WZxWfyNMvM
         1wpHTVu/CmvWrgr6pMq9jC0o/XSBuuI+x5WJQxt8lvrw0lrHXife2yBvjqKBi+kGr9jY
         LZ37tRvEOXexYmzSH2CC9nDToQMGS6m1gz0nU7ZahT+aPOvw+1igrWuo9UHUb9ZXxTV8
         0rjTeyw9ekGMBDqeTLt0HooTDDdHND2K7L97YVExmeJiVez/60JKhT8iu8yHR6FoEy3r
         JWXUWqDo2n2ZFnmoRkbZzxqhHgiGjaRRLxiXpgGrzFYx1vbXOP6cvcAngxwkd1cH0Ftd
         T+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605988; x=1796210788;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G+BRXkvsKkCtNetmP+qei8f/iduzEEyC3n2dsxTeZ90=;
        b=sPoCLdi7R0C9sl2EwyM0aHP5me4p+1w+Idj+zbMTe9fKOKOsLa91uFEI3Q3p0uQuoU
         KxGrlMHXR3NU6y8ygQJI4mt7/I0wtQjCUtDAZQ9Hqhk1NuP2FFCuv6oaXwSOJTlN2LG0
         KnXUfkVMdB2IrfMMVZG5L/QjLxMdpxhVhn+QFcr9nZnsekdMhoeyuI+tGXZ9COSWozfm
         NV40YATO4vUM+qqtZnJ9hjPGUnrvtsdbnJuQAjGrMCMnNZMl/UBuuoqcNVO/zpsXmeLT
         vV2UFxeB+V9+pVIPjhBoiQOgAxUQpXyDuCVfgdXEC1EQZsCUAWfm3blFxTvAeJCHA55r
         whUg==
X-Forwarded-Encrypted: i=1; AL+hErEolsiHwJxKoXsmSJ5ODFSkZ+yCmwllrkjqBV89QDBpbVMvAJmbi+8q0Febs1ab896dePGjDXF4lzI6@vger.kernel.org
X-Gm-Message-State: APuU4Z8waAIhMk3yNoO9ceZsPmpn2FNWCMQ5slBkoQHydZJB6xSQWs0D
	09C5pBWlYgTYD5zYyGU17CKKs1CgBnzMpReVI4JzuBh26Ue04dfFoyx8
X-Gm-Gg: AZFdTZc68RR1y0ZOENb3ELEMwbweqNrb2vbtiXoJn7myDZlf9psZBYPlg81Lb2zAbPF
	sz6qWAv8e8JEVELbNkGB77NkZJHJQmt3mEWGujvnP38q0C4dMqIDGloV46Htij2HYoh6QMcg7yo
	IGDqgISDVxoqpgTYO6uvSul1dFbZrcNNPZiMTqnBIC4dF414H0MAxwPrD8XQxomuZ3EoXrkouHA
	DU6dubQKUTwXo5NRxINHY4rwkdqyfNzO0MHziJyZZOpb/DeaiiZsDYEjYDiQRtndHGiJD71PPWf
	Oa4QZSu2TeJSlbqBfc5BrZWJtIu2hAE7DeCTux+ahejytt2KFJDADpRNAkqXO76f3PGKxZaypey
	LDMt10A4LJ1z/hmICl6kp+no0u6LKeZk0MOqB94dSPEJrCSqA+8eHxZR80o40OgMX+OxmPfQaxh
	FB7XAp4pHTx2O1C6Wx5sj9i3JrJPc6jRqFxqa/j6nM3t1Lj6vRta7ZhLm9eBIoYcLZAqgadBrky
	CibHoseh0Em4yzhiz2xnXUuVJw4NVk1iaPp3MFMqpcc7UvtyXnQ7zVs9qKvlGa1/y4JSk/Ek3cT
	7GCQOGkvyoJDirT4HOvIFW2EcHq/BV78E3dSSGChQXhIKj5bT+yH42mYo+ZvbnEI6lF3uelO79M
	nrrBGzL1E74SCOfzbT1tP6SvCQsDiNFg=
X-Received: by 2002:a05:6402:1155:b0:6b5:7312:4f48 with SMTP id 4fb4d7f45d1cf-6ba37e90a38mr10062440a12.28.1795605987551;
        Wed, 25 Nov 2026 03:26:27 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:27 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 0/7] Tegra SoC specific Video Input updates
Date: Wed, 25 Nov 2026 13:26:06 +0200
Message-ID: <20261125112613.237333-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset contains various SoC specific updates for Tegra Video
Input driver:

1. Fixes for Tegra20 and Tegra30 VI configuration (clock adjustments)
2. Moves Tegra210 specific code into tegra210.c from csi.c
3. Addition of Tegra114 CSI support

All changes were tested on:

LG Optimus Vu (P895) Tegra30 device:
 - MT9M114 front sensor with complex topology and irregular pad mapping
 - IMX111 rear sensor which has simple pixel array and a single pad

ASUS Transformer TF701T Tegra114 device:
 - same MT9M114 front sensor
 - OV5693 rear sensor which has simple pixel array and a single pad

Nvidia Tegra Note 7 (P1988) Tegra114 device:
 - OV5693 rear sensor

They all work and produce images.

The "ARM: tegra: Remove fallback compatible from Tegra30 VI node"
should be applied with "dt-bindings: display: tegra: Remove Tegra30 fallback"

This patchset is based on
https://lore.kernel.org/lkml/20261125110750.223628-1-clamor95@gmail.com/T/#m46981c261c3178126ce806aabddcc38cc33f747e

---
Changes in v2:
- "staging: media: tegra-video: Move driver to media/platform/nvidia"
  moved into media-device conversion
- dropped:
  "media: tegra-video: vi: Switch to media_entity_remote_source_pad_unique() helper"
  "media: tegra-video: vi: Use entity function to check subdev type"
  "media: tegra-video: vi: Adjust pad assignment logic"
- fixed schema clock-names configuration for Tegra30 and Tegra114
- added "media: tegra-video: Move Tegra210-specific functions from common CSI"
  (Move and staticize the tegra_csi_error_recover() and
   tegra_csi_calc_settle_time() helpers from the common CSI file into the
   Tegra210-specific code)
Link to v1: https://lore.kernel.org/lkml/20261113161819.36847-1-clamor95@gmail.com/
---

Svyatoslav Ryhel (7):
  dt-bindings: display: tegra: Remove Tegra30 fallback
  media: tegra-video: vi: Diverge Tegra20 and Tegra30 VI SoC
    descriptions
  media: tegra-video: Move Tegra210-specific functions from common CSI
  dt-bindings: display: tegra: Document Tegra114 CSI
  media: tegra-video: Add CSI support for Tegra114
  ARM: tegra: Remove fallback compatible from Tegra30 VI node
  ARM: tegra: Add CSI node for Tegra114

 .../display/tegra/nvidia,tegra20-csi.yaml     |  37 +++-
 .../display/tegra/nvidia,tegra20-vi.yaml      |   5 +-
 arch/arm/boot/dts/nvidia/tegra114.dtsi        |  34 +++-
 arch/arm/boot/dts/nvidia/tegra30.dtsi         |   2 +-
 .../platform/nvidia/tegra-video/Makefile      |   1 +
 .../media/platform/nvidia/tegra-video/csi.c   |  75 +-------
 .../media/platform/nvidia/tegra-video/csi.h   |  11 +-
 .../platform/nvidia/tegra-video/tegra20.c     | 171 ++++++++++++++++--
 .../platform/nvidia/tegra-video/tegra210.c    |  71 ++++++++
 .../media/platform/nvidia/tegra-video/vi.c    |   8 +-
 .../media/platform/nvidia/tegra-video/vi.h    |   8 +-
 .../media/platform/nvidia/tegra-video/video.c |   7 +-
 12 files changed, 324 insertions(+), 106 deletions(-)

-- 
2.53.0

