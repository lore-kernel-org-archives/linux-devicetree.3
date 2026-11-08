Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794153494;
	b=HtHh9uNxw6giTDzRQszgQRZBNORMKFjEar6mLXn0NTZU1briWKYaMFQjS3a4el4gcQNa
	 g8TLqHBT/I8twL9o610Lhs4vn71CFhIKUQvS29OS9PDQcfxqDfYXIOQuW/Uepn0TPJkmV
	 hYBLz3VAF5Vwsa/VzSeMBBHyrbtlH0s+JD5zh3Xo3RScv1n+0WZjnXdFTX0gpsBPZBtBn
	 X7WA/ehWcxIzOdzkr+87DPwidQtRSP2cnIvV9svvjH8njjelB5lWN93EX3WdQMQE2Ene3
	 1wHCRhGx+qX+HWn9QmlekF6cG7mBCp3bVHfZC+3X5O+Kj/cP2QGGTvS8WPNkSUHpU6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794153494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z65ViVZ7QDcN9aUeeQCDhAMdMHiR8hItUu4lI1V7+r4=;
	b=pjuqB5OaFY4uBuPuoMU8RlSXjgz9WAor4L7vllaPJ/8fm9/jEjEq6veSTOgyeBGogQLx
	 4vxmYhvYYabxR+gFuhOjoKGqBK4EFPwn51uhMArw6dCb5tXaSGXdYgrSQkPXpCa6cxA+Y
	 ZwtqFXUmP9ooBMhiu4ZDyYMsPxaMMKS0HgAaexs3mA8A7RNW/Lx6CLqk1YON94sqE97ea
	 pjJDwWs1lwgTVqyKRl8snVhZApR08R1Zi2irq0nWBdTRYZF6DXvZAi8z51hogJ2qBuwnl
	 80vxkqV4QZLvvWx1w8vw629vjqXCPdd8vI+4wPERUJ6nxWXc1mguSzeNdJFkG3ICP9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0zi2/68F";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53590606A321
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 15:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53590606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0zi2/68F
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e4831c028so167528f8f.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 07:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794153493; x=1794758293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z65ViVZ7QDcN9aUeeQCDhAMdMHiR8hItUu4lI1V7+r4=;
        b=0zi2/68FnBZlkcVJrAG/c0gRwTiWBeRxILx9yNyrlpojMDY8igrViAUxTddq9gI+7Y
         8KqNcmYbo8kc/oI+DwBimU5x7R/vhFIqGCOAdxv4UTMEQMyYoPpewVCqifrFbeOMU5cf
         9olBo2JTQivIBw4n9UFIFIujhySNkPywO8c9ojjzwyoMq+Tn6RVbKvuy3SqK/GPKsclS
         iMjBvEW/uOr21oZqJpGSkYKQmWAOkBbc1FwyfRLM9k+50xFjrBHwy4xpIX/cG63Yluw2
         nY5WSN1lr7UW3LqOz8RhTYobJB3yFiEafiWmR1B4Kdahp42l7Yi0H8NW38EQlfil57Dw
         Q+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794153493; x=1794758293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z65ViVZ7QDcN9aUeeQCDhAMdMHiR8hItUu4lI1V7+r4=;
        b=Pnvjqc6dbEPJId38OjX5xen2MAZSMI6fHK0nahWb9t3wtufwR4wf5yvGfmMQD3v9vc
         rE4A9RnR6rqwOVbELfKMJTvvt4mg69h7Ix4GY+d7x2PcO7yc7IKyUCyuLslV56ZzWVLG
         +CTJgjw6NrhrQnRwqGjy+Mr9oTNMhnNEAvACAnNk5S0WyJjsvywHctGLrd12HKfiDpcQ
         y5R+L8wXKo61ch4uETlwwpB9gHqnsJ9sdzOinaWXWE0cXuer1KW6k4vFMaVAThplqUr2
         0dtcdx+yyD4xHW34bRBm5vIHDRNhwFLajgmoB5D+i5SzIbibH3TBuGVC+wht1GYITky4
         lM7g==
X-Forwarded-Encrypted: i=1; AL+hErH0Lz3WfW+BOfT74hld2ttHQfZPf2eNOTA3PCTXlr3xh+4VJjkFMopDhfcEmcVATFiLY7ahxJrZ4o65@vger.kernel.org
X-Gm-Message-State: APuU4Z9hSNlFHnAHnSE6Stbcy/pUmsMsrhB2ygU7X1WqIHiPeqVDsEP3
	qsdGOadmgKb+dt0VCsu8MIkVieBsCF0EH8ArnGeunCBPcrxPFVqd/QPF
X-Gm-Gg: AYBFou2neK2rUi16Si8bEKGacSo8u8oFWqGJKb+5B3y20oFJuTrVU9sFYnQZz/cz3Mq
	BFc01wbgnFxcBEeOyOmKJHTVZu0fa5YifUAVUNfJni6QkAbe0+lytg29DnMxjc3nI3TE7QQzuEE
	dRxMESLRPh2CieKFDZ9CGFbj4QZIllnRruYsmf15EiNEVasdkWtQFuiWYcSGn/ujFOJqo1fCBZj
	mg413lz070trXcJN9OwQDGhu2FDLdAI4KUtIZQtpH0l2Ni6a6Owh87w7K8J3F/gKzrGq3Pg3PwR
	tcvtk59sNyKZaIfZr4tSyY/bFkBNM+Bz+1RAsnyhaoE9dDJ/gFwKag+eZAIJtAv2F0qRVIcXXFQ
	0S+g0FT1IL/HEhwJtFD0bSbaIXZf2/7/eJ0UsjkJP7r+j2ldiEJT9pIbID7n+CQGaHO/zYnVW0s
	s8nE9hpm6tGGiaEP7SadQ9p8qvpRk++4gnQxC7i2nO+S2N3MgSFx4JTY+iyaX2M4Rce+RlfmBwP
	E583CQwDWBn3XQvAmu4FM8OnUILQbi0xWxzLogOIm6kLdX7gFth3Ehr3AAi5nqyhulMZUsAhj0u
	WUHxPJ5+BNMHgPIr2EkVYDwSDK8AAuuiehu5a8ADdCJVl6BE4f3PUtj1B0kDAOzhqwr/oR6hK2k
	zZ7UKq4FFsQ==
X-Received: by 2002:a05:6000:2303:b0:491:ef0a:1f5d with SMTP id ffacd0b85a97d-4958530ca7amr4049074f8f.39.1794153492539;
        Sun, 08 Nov 2026 07:58:12 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495966f316esm4753282f8f.17.2026.11.08.07.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:58:12 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/3] clk: sunxi-ng: describe CCUs as tables, add the Allwinner B288
Date: Sun,  8 Nov 2026 15:56:58 +0000
Message-ID: <20261108155702.361022-1-pmazzini@gmail.com>
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
Content-Transfer-Encoding: 8bit

sunxi-ng drivers describe each clock as a static structure, list it
twice (ccu_clks and hw_clks) and keep a separate reset table. This adds
a table front end: a SoC lists its clocks once, indexed by their binding
clock ID, and the core builds the usual ccu_* clocks from that table.
Bus resets come from the gate entries, and clocks that a SoC generation
shares come from templates. Existing drivers and bindings are not
affected.

The first user is the B288. Its driver is 212 lines here, against 749
in the current style.

This replaces patches 01 and 02 of the B288 series v4:
https://lore.kernel.org/r/20261012100816.331033-1-pmazzini@gmail.com

Pablo Mazzini (3):
  dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
  clk: sunxi-ng: add a table front end
  clk: sunxi-ng: add Allwinner B288 CCU driver

 .../clock/allwinner,sun4i-a10-ccu.yaml        |   1 +
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   2 +
 drivers/clk/sunxi-ng/ccu-sun8i-b288.c         | 212 ++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-b288.h         |  11 +
 drivers/clk/sunxi-ng/ccu_table.c              | 510 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_table.h              | 233 ++++++++
 include/dt-bindings/clock/sun8i-b288-ccu.h    |  82 +++
 include/dt-bindings/reset/sun8i-b288-ccu.h    |  45 ++
 9 files changed, 1101 insertions(+)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.h
 create mode 100644 drivers/clk/sunxi-ng/ccu_table.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_table.h
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.52.0

