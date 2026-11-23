Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465581;
	b=KC8rJ5KuN4q5Xl/1OCgBiaQz8YFTSi1qIpO23DwUCAwXdG8rG5m49waZ0EfOWdFn3eqy
	 M5l3UZKqEbtYZc3tBHsRudIdemr6jdtQRQLxH1qSwxU8FCfh7tlgkT03lgSFDFOpwZV4K
	 DgBWRrlBktxJSNN0swzCBUPm0RZM98cgzjya+1m4SpcBD/btb6DWZlIFxHcNozdUqNTd9
	 JGLeYzJMZWSpS8EqZCpT4FDTrNVwH9Zju6TLC/otknZQJUEAIUmbeQlfcF9lSxf+fk9fj
	 T6+Qa5sjI3wreVZkb7ft7GFX5VSvXHEk272AMEs3q4u5YwfVN+wVYsHqWQanLsdY9ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Qmc5lnHTHHHfRq/qfxs84Enao8q8XNbu3+of0yEPf4A=;
	b=IBMaylbgCJDEtbdeBKHxIlEVCVe4+C1cLbeJACimPpkXg/gxXOchnVVVpRXjs2vhnfTi
	 bNKtTsusAUfo1wtqsepo67nrnaa+lnLB6Sye1AwhPcjOHSHM41X1Z2UF8zvYca9L9RMAI
	 Y6A3onX3NY6eovUBPnvE51zgSj9P1wEQ4xaHt1fv18OVz606SX6HBN5deLiDXd0c/jUog
	 xhDfo2mQXa9/qV6OITLhNwkgaScEcVchiCMuBbmGqItVK0Tme3AVV/S7vmIUZ//2pSLCN
	 27bLSD6fjozzDKeONKJXDBslDtgLVhaGmFqZ+ReblnHKRD+daGvc2grA7Uqae+eQF4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dPYjC6L6;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C58606A326
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2C58606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dPYjC6L6
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a9be758734so2297156f8f.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795465579; x=1796070379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qmc5lnHTHHHfRq/qfxs84Enao8q8XNbu3+of0yEPf4A=;
        b=dPYjC6L63YHdLT0szS2CodZQfYWxLhIVXN0cMjEXKLWwlPsR+Y3mkIaQTYFBxZgQXH
         3Sh0+2WGwFJZ47FfQE0qSj2LDVluDd95tGjR4wxfY+XeiYC/z5gCjFJvoZ+jiykmeyYZ
         g2nYq/nlEeGoDlB7/D34UbitpIu2o0i4e7y2qjtCbZwXAWgJIY3PX8TQAPPtPNuyaxVh
         5DI19f0Rhd9EvBEZzjRupMyKb4//SxxSuykmcNJTWxbPGIYhkdo2h0jgELUPVch37Re+
         fReFv5gGr8e4c2DHih8NF83SVLMzjuc5iAffSO0sQvFf34YZsLEwbPo4FhROIuG+r4Nw
         EfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795465579; x=1796070379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qmc5lnHTHHHfRq/qfxs84Enao8q8XNbu3+of0yEPf4A=;
        b=PQ8zYLNqp7mqtnjOrl8jTxSy9WrdrJpCmvKjcV3Oo1FfuOZ0kEgTtpnsUpZofTkDtJ
         /miAuA54s380Vg1ZPdbCP+Fhp113h1FUjAW7ofMsAHLRmUS7Nn2XmBP4qoaglGjYSaxp
         UmeKXBVDEVl2dFoHzmXbSCzCnhnvdyPqt583tacZ5WS+sA5tfqBHB+KExz8wxXZnLy2L
         7/cYfnzrbuuVVMOFey3rNjJ1/pnyzxQc5dInVJI/skTew4OI/58Dk8VRDOVRBnnau+0u
         EJmbn6jeuj0MYjHMuElMgoeLoMzjhEPHHlnByE1TC7ozZuqLbM33HiDPzy2EiWozCWn2
         lK2g==
X-Forwarded-Encrypted: i=1; AL+hErEfMfAEr0BtvAnlqMo3DeuRZPtNN03oLSivqwDRjbrxT9owCuSqVwDAQAsBLFvYbGxyzPgAZgkzaK2N@vger.kernel.org
X-Gm-Message-State: APuU4Z8d88n6hOreyKLHOvpEC4+Lo+vgSWS1dmmsR/p3ailTxmfhDXC6
	ZTnymFc3Ov3uMytn28HJVKjUKj3v8hzxndKT767EwuC630YxLFtWJYFSamxW61sC5NE=
X-Gm-Gg: AZFdTZePj1HX8D0PInTHG5CHv4BgE6r5tyYIXVHGB7qaLFofshA9weM3htwul0VyyDg
	UhT+Es5vIqub9qAAiKjn99Xbo1aWzw0uXZSjHu+dmJz+TmdPSi/NmUGMwaquD32u9tQ8xv31lu9
	s6nms2cmqy1Yg96aCdgmUnJTrkDPTc5IM1lU1MGw/iXFk8tZE9nBIrxTRMVn6jgIjD2q5bj6gJN
	m32QZ3qQKTAZlbJBUYe4dqp+OnAztT73VMzFPjMb0PXjIsKuqY8kwVqstqiL1SIief9zcNM6l5O
	NN5jRg4CzVs1wPAVcmhqAv2pbCuYj9eLkHEasCg9trRQqOYbUkQFjBInehAGQbgwJYyLPGRXoSs
	7jSXGiPsO//3vNBTMdJSvuvxj5/ZS3Ruo2mhb+VrYjGWe9N2SAUiWMcLSvwfC8yItkn/N8XwX5H
	BCDcKcotzxOXacGW9csTUrlSgjjWDXtPnSIr5Hm5zRMpEtcYRfLveVZIMOqqlKRCdKg9PHf2lks
	f+Rmw+DZ6SRgA6UPk2PG19d+dE2LdaXeuwNFr6jg3nEKUimkMm58Id9cMINEjCjMGlZlwm8EX0V
	NAYnBC5SUbknSAcfL4wSsRTdDuqY2TOyD5VgV7aszj6g3J3xv6LCecP5VeGBZnZayworE7gaxQb
	1lpKlAc7DCpML
X-Received: by 2002:a5d:5f51:0:b0:4a5:a777:b5d5 with SMTP id ffacd0b85a97d-4abb4c7aad1mr23466010f8f.55.1795465579053;
        Mon, 23 Nov 2026 12:26:19 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm20108713f8f.46.2026.11.23.12.26.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 12:26:18 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.li@nxp.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] iio: magnetometer: mmc5633: Binding, supply and mount matrix
Date: Mon, 23 Nov 2026 21:26:11 +0100
Message-ID: <20261123202616.17334-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
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

The MMC5603 and MMC5633 are listed in trivial-devices.yaml, but boards
need to describe their supply and orientation. Patch 1 gives them a
binding of their own. These bindings are also used by PebbleOS, which
is where the need came from.

Patches 2 to 4 add the matching support to the driver. I have no board
running Linux with these sensors, so they are only compile tested (W=1);
feel free to take only patch 1 if you prefer.

Changes in v4:
- Describe tSR and tOp where they are defined, citing both datasheets
  by revision, page and section, and drop the older tSR comment at its
  use (Andy)

Changes in v3:
- Reference the datasheet timings tOp and tSR in comments, with the
  tSR one in a new patch 2 (Jonathan)

Changes in v2:
- Cover the MMC5633 too, including its I3C connection (Jonathan)
- Add supply and mount matrix support to the driver (Jonathan)
- Drop the mention of the missing I/O supply (Jonathan)

v3: https://lore.kernel.org/all/20261123194943.57601-1-gerard@teslabs.com/
v2: https://lore.kernel.org/all/20261122190836.66111-1-gerard@teslabs.com/
v1: https://lore.kernel.org/all/20261122093412.71604-1-gerard@teslabs.com/

Gerard Marull-Paretas (4):
  dt-bindings: iio: magnetometer: Add MEMSIC MMC5603 and MMC5633
  iio: magnetometer: mmc5633: Reference the datasheet for the SET/RESET
    wait
  iio: magnetometer: mmc5633: Enable the VDD supply
  iio: magnetometer: mmc5633: Add mount matrix support

 .../iio/magnetometer/memsic,mmc5633.yaml      | 61 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  4 --
 drivers/iio/magnetometer/mmc5633.c            | 41 +++++++++++--
 3 files changed, 98 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5633.yaml


base-commit: c44104f3642da720164042623e4832836aefdd8e
-- 
2.45.2

