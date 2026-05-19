Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013A11B4F0A
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 22:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779229989; cv=none; b=VyX4IWlPCuWCysXsPQVS/qZROap66j7ZCsuhTBIzro0pwYQU2I4cNcI4ioZgwzgP4iz0rKJ3YGZlRdRPxxfUXxPxUHm6YTKhJ63S0HwAPnpqsMN5q+DTAtx4xFHQiwJICA7zbRUhMS1jFI89wNtVfyGlIZKGLGKzSEc9RiSlC6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779229989; c=relaxed/simple;
	bh=p4ixAPYHyRAZAd72pqHHuOTKVlz5VhSIjBEIsiu0vG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ST+GYVyUJeJpnX5ZvkH7Lb2wHI1q8WP87q5f3KgTCBsA98wTStj1XKqaj+NPhnXmodPvm92pThVW9B9rXALfgL/RDPIw8VGGP4Fprl8dr7GCYgnQGOnm9KLSnZGXTmOTA1BoLqnmmUGWZ34SLxBoDuHUJnmZwFAtyRMdmgL3Ato=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DeINHLNn; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DeINHLNn"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48909558b3aso44058345e9.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 15:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779229986; x=1779834786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pqcbLvgzPg/aacFxA3Sf3HYOKcvPcXokYWVGRv6DhFQ=;
        b=DeINHLNn1muyULkSq9AWTqwGFvybp5D227l/qfFjgGdLSYYG+px2dd5ZMDRwmaBwX9
         ItkVAwPuh0daRh/+wq94HVH6F0YYn+VC6A2rqfFSeXgi/HgMUqKTH+ZqWk+xrH+pQTjq
         AFrndbYpnNPtKStXGmyldUcDWqygtXAJ5vrAZcBbhzrO8QNs8q2zojXLr4N9YOyBW1NM
         5kfUUm/C5Br66C/R+2nSEIWoQ/VJ2s0G02qO5BJYSF/Qyd3vPmdCX9dtrkzeaj1f3rMn
         k4CsgKey3+AB+CV02RaX3lUK4PVPMAZFlSO2hW/AWonnW6dmbYhUbKyB7WqHsSOLJa48
         cBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779229986; x=1779834786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqcbLvgzPg/aacFxA3Sf3HYOKcvPcXokYWVGRv6DhFQ=;
        b=R6thvLDBOSpd/yR1gJfTczjz9o7g9ltjuk631xZiFsFZ7OJWWk5M6rnsH+Pxg01q2K
         dpbWofLqU5prSyj2G6CezjYNo5+XKZ24OnBpbsp1XXfGXeKlraUDbCBRnZinSJD2eyfp
         sEtqUCl7B7bFCidlJCbI6mZzoJ80jU+jS4IwQpn6UjQ3pg/3s/2BV5x0px3jnBox/i1x
         +veqQIJzwVjsQhZzYmY5nUfrAz9gsi2/VWY/2Fw2/liKCvY9niVX5YvENe2NrIrUmHFO
         zRABHQIkLfJKQSXdvBRZEORAnygHW0bqarAxL5lB+rm5IO7NRoiP2SjZ2AOpnPYg/bup
         Rxyw==
X-Forwarded-Encrypted: i=1; AFNElJ+eWqhy1Xr8yAK4qtqOCoNa5sYnKnIj15vIbc+bxJ0HMlByvmd0zI5jvWoq7tZzfl27JAaaFHqkmXQc@vger.kernel.org
X-Gm-Message-State: AOJu0YxpACJKHBmVxaI17raHY+ZTBWiHX4pDL/OBpbquEBzDQCJgcNmk
	vjSDcY0mku3emuUjEu1b2FPMlUqZmWvZxS69PK9TGeMTkCtM82Qu/gl+
X-Gm-Gg: Acq92OFyeHQTTGT8VejoPkwVJ33B10h/f73lY/dMajGYatXTiPv0KLcqrZAGYEz1oYA
	EQOt+HG3iOD0ycIGo1KsYs8u7hjmH4xolZVq8Y3E2eIY9SdxtjqbcLTmJbNNTowf7WWvcEwvPrp
	eL/xUsN9iE/DcWL0lT1zg4dLiP1Y5Zp2EQeVSeE4QZVEF1Sw/1wxRbRU5SVc4ackRqwJ9+F52z0
	mtkktxS3moTbej3P2moowVchRqZkDk0f0rFERhq3ADZ8dwTzhwj7i4XQfPN2u1fDJl5h8MTaxTG
	XaUzZu+Z04rM8XlC7bE2nteOulUQOkaGX4ECdZmtMWJNAglbp0crefOYBqvuF1M4J0p7y/2oe0m
	PlMijFgWLJy7ZA0QIyJJP8ffuSq6K6/7hkCDKvzLFqsXoqeX41DgLi4ZVtlbLJfnzTDKRf1IIXN
	DYhtLa43eV24foWbTF9YXULSpOoz3gTj4e0m17y6ktfSTB1ooR90RRrwHxeHuJ4IIZkmKmpiw=
X-Received: by 2002:a05:600c:4e47:b0:48f:d835:e0ff with SMTP id 5b1f17b1804b1-48fe63265a1mr361523155e9.17.1779229986180;
        Tue, 19 May 2026 15:33:06 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88495sm346659955e9.4.2026.05.19.15.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:33:05 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 0/5] i2c: mt7621: improve support for Airoha
Date: Wed, 20 May 2026 00:32:42 +0200
Message-ID: <20260519223253.1093-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series improve support for Airoha SoC that use the
same MT7621 implementation. Some additional tweak are required
to better support it.

Also we add support for atomic variant of .xfer required for
some attached pheriperals on the Airoha SoC.

Changes v3:
- Rebase on top of linux-next
Changes v2:
- Fix compatible order for schema patch

Christian Marangi (5):
  i2c: mt7621: rework cmd/wait OPs to support atomic afer variant
  i2c: mt7621: clear pending interrupt on i2c reset
  dt-bindings: i2c: mt7621: Document an7581 compatible
  i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
  i2c: mt7621: make device reset optional

Christian Marangi (5):
  i2c: mt7621: rework cmd/wait OPs to support atomic afer variant
  i2c: mt7621: clear pending interrupt on i2c reset
  dt-bindings: i2c: mt7621: Document an7581 compatible
  i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
  i2c: mt7621: make device reset optional

 .../bindings/i2c/mediatek,mt7621-i2c.yaml     | 14 +++-
 drivers/i2c/busses/i2c-mt7621.c               | 70 +++++++++++++------
 2 files changed, 62 insertions(+), 22 deletions(-)

-- 
2.53.0

