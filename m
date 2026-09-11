Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECE349C4DA
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 20:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789158838; cv=none; b=QjUZ9DCFjL7cMXmCdiomP9sYqIgK0rykgbdPydPCcpHDQiP3Bt859oHMhBYUHoWtNNK8tM8mMDgWjXI0UIocxfXEnQ3B7B1sF9SKMsvUhlYsQUPiAodMhF3sJbx2+0OM5EXPKQD5aiQaeFWcGHQEQ3EhR9OrSqzTV2KgNb1K2p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789158838; c=relaxed/simple;
	bh=iUQC8d5PfA0Ift8TUsn934+l9CrS8trXBwCeCv1ogsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i+I3OpmhhyrnA9IVQntOwxzFc64BU2xPyDPfoTZhodND7A821ElL6y5mu41lltelEzEltx9kLE8vexx9Fx6VQUV6+eXxSt+7Vkug+jXoUnvAhaTVBj3yuPy+feOR2ijw5131UkjIJk0DLuPY3ukTsO+byE4tf0/p/2e85gUy4eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pM0aKbzo; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pM0aKbzo"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5bf9506704fso837785e0c.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 13:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789158834; x=1789763634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TNQAtUsfSHMHHKsvw6ndB+vrFH/q79ludt31IUIO6iA=;
        b=pM0aKbzo2J4Wck1Su/Epn7xCkVaFf5o8NzhFNwvTF4FCgiE2P7dfvmd2tHB8M/n2ki
         Tq9EDiyyL+q6xmot7O6mz+YkUxvoATlaTV/C7M22dB20F4aUhYwgZilqPajKvw8Xqy5E
         BcYC17dbJSGOn0RIhQuc6IY9U1sO5kSJ7QqmlVLyDm2L/jNBMh1Et3TEtJeye+PIK/m9
         SmNh8yuEtjJsu4FyPXMuo9pFnIr6zPpctrjmzQGwE+pm1Kgw4R4N20R1ahOQVlYobG6F
         tqvQYyqfb1sMrunFuTL4PHcEB4fWHb4zRab/7fZJboxFZUQIMhE7NcWVm51mXGai0+LC
         uwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789158834; x=1789763634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNQAtUsfSHMHHKsvw6ndB+vrFH/q79ludt31IUIO6iA=;
        b=n5V6TQyYNEknmNKD42Y9WWppBKHIi6r6ZPe/TMn9wjDFXFA4apFSvV0Tp1CEwLzLsz
         F+EWrOkaWzesdvdATBi+VBWtQ/uuYxgAaW1YMJnYSNiLQNAFtx7+xdZT+l9An/Pb4CIY
         IS4CWaMIr5WQJUIc7RvbFqyHUdBU11stUP1/qe/QlSznO1KsVkcV31egFhLzB6bzsNCt
         nGAAqBWe+wOJI1WcVMUED/nE+36XwFxoKN9VYJncjWLNo3mCQpkXooMerzj6DrDGkjMd
         mPClGWCdtm9vz96Wv3yZk0exrhcp58j6BdTFFKDkZAcGu0es8WsuTdhHV56KvqCzmdcR
         hQZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzH0QSrRhJgsLTnu6xgAYrRNZaOm7/71kMWiKhPExCI+PqDuY9DO/NBhyEb5Ez/JoVaZwApSngiIGhu@vger.kernel.org
X-Gm-Message-State: AFuF++k4ZeFu+W5Eo1F4UKw4yiFfc2GJyGClBshZgWY7bBd4skrHVVSO
	gxe3H0sdi/R/kwQ0MPIYR8y+EKCVguM571Xd2GfpnANuq9Ip+Y4/WQ3a
X-Gm-Gg: AYBFou3cjG7uk7nHmJ0PghWqMgZCzdBVQkmCgvBHRWDbUAueLXleDsyGHbIGTBloIC0
	nAuiFJwFkJtjdEGvoHxYS0O1Dry59LUL2DL1i0TV/nWuVMzKF3g5W6GX7D35quYvFwPLhDNjuEA
	pBViYYrqJPESgj7iodMUjZ7URwz0eOkpg5qn0HnXvORgzPYc4hU/uw2ROYkD41zZc+xABagxW5n
	kmjgCqwuQxdRDyhsgTCiMkphOpdnakFoujZYSGjb+ei4hrbAOOf40IWcY2thknEGoBXFLV++yOB
	uU04oKcvOt2BQHSx3IDAKdTJnjTc7Hq1zotK4lDVBMNHIt79U3SGpogTv17gm1uFZYOP6ZQGH1i
	L7yOkl868ThMcNrXxA0taUEq/iQycIP2Ao5AlOa9UCVQhupdWIXa+F24S9Ugc3syh5i4Eh33Vmf
	VSJGeVTE9v1yEVReN7PE2HDpjY/+6kfSSrhQ5ICu8+wiyYbernxVSI1BC3W4gKNULU
X-Received: by 2002:a05:6122:6217:b0:5c8:46e3:ec57 with SMTP id 71dfb90a1353d-5c846e3ed98mr10169733e0c.1.1789158834008;
        Fri, 11 Sep 2026 13:33:54 -0700 (PDT)
Received: from frese.. ([189.60.169.129])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c8470e7ef4sm4187018e0c.9.2026.09.11.13.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 13:33:53 -0700 (PDT)
From: Enzo Frese <freseenzo@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Enzo Frese <freseenzo@gmail.com>
Subject: [PATCH v2] dt-bindings: display: panel: mipi-dbi-spi: add sitronix,st7789v-tft28
Date: Fri, 11 Sep 2026 17:33:42 -0300
Message-ID: <20260911203342.76692-1-freseenzo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a generic 2.8" 240x320 RGB LCD panel with a MIPI DBI compatible
SPI interface, based on the Sitronix ST7789V controller. It is commonly
sold by various resellers without an identifiable original manufacturer
name printed on the PCB.

A basic mipi-dbi-cmd[1] script to get the display running looks like
this:

$ cat sitronix,st7789v-tft28.txt
command 0x11
delay 120
command 0x3a 0x55
command 0xb2 0x05 0x05 0x00 0x33 0x33
command 0xb7 0x75
command 0xc2 0x01 0xff
command 0xc3 0x13
command 0xc4 0x20
command 0xbb 0x22
command 0xc5 0x20
command 0xd0 0xa4 0xa1
command 0xe0 0xd0 0x05 0x0a 0x09 0x08 0x05 0x2e 0x44 0x45 0x0f 0x17 0x16 0x2b 0x33
command 0xe1 0xd0 0x05 0x0a 0x09 0x08 0x05 0x2e 0x43 0x45 0x0f 0x16 0x16 0x2b 0x33
command 0x36 0x00
command 0x29
command 0x21

$ mipi-dbi-cmd sitronix,st7789v-tft28.bin sitronix,st7789v-tft28.txt

Tested on a Raspberry Pi 4B using the panel-mipi-dbi driver.

[1]: https://github.com/notro/panel-mipi-dbi

Signed-off-by: Enzo Frese <freseenzo@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
index 6f0290c4e291..25c176b0098b 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
@@ -75,6 +75,7 @@ properties:
           - saef,sftc154b
           - sainsmart18
           - shineworld,lh133k
+          - sitronix,st7789v-tft28
       - const: panel-mipi-dbi-spi
 
   reg:
-- 
2.43.0

