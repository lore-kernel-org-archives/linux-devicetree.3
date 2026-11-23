Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448143;
	b=YpYS6xcksDZSPHyw7aj/m7wNMXY0GGhWF9ASIaN/4jOY5bo6un3IDVoI9NJaAyF/IZwJ
	 /nKC5T9oVQXvfmluZoICWWcUE1gN7x8ANlSFfC95nUGZUhR8ouxrPrIbaPdBZ+b+OL9dG
	 Tzfqln5jr4kiYE3wa/jGGrY/K5FTpNELuNGno3AkT/Q9PoA+YLwiJRxiXI4+VgR2Uq50P
	 zo9hxR7JUHgbrGkx+kah1r6SoYdkkEYd0aztInbyLf10smyPWKhWK2WlidRK3qZfNwgl0
	 GxIxu0C4fc/AUDxT+eNUTGhKI3kG2YGx4kCFkBIRs6V1QRa/GtUhGTKPpQsJ7TTIhaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WJ9u915aobNPmfIneqbGjqdZiarGAKLNjxdAyEJTY/k=;
	b=YKeW6VT3CtGqBb4d6dZDzC1gjSce01F5npY/nUlLZpe9Z97+L/7sKM0+LT4kDIHZ228A
	 z1s4vat/WzVbBOBwtWhumBxIBmmQUHl8+onOvxLQbHC3JDPvxxHIRcG0NuBd5/yMzrBGF
	 vYe03lXYX23JHIaUf4FAIpVcxW6r5pZIFY0kOLj9qjldlNyLCjC3obzzNIAwigrKjJYtU
	 xegLkX6spula/R8Gus5p1AcOJQY3qj2iCZJZbI9CWAtRNd+xCJEiyiaK3Wvr/dMFf9i1y
	 53VMppVbT/EHzFBTYNB7UvLmtfGLht6KmkV8q9E4PPuA//baI7pGNMjbIS3ZARGx5Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=xr2qKVwU;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210DA606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 210DA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=xr2qKVwU
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d05d51553so24986355e9.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795448141; x=1796052941; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WJ9u915aobNPmfIneqbGjqdZiarGAKLNjxdAyEJTY/k=;
        b=xr2qKVwU0/VJoAzxcYaCAJ0cL80/KXlTB06yiBA2T1mrcDVUOYjguccTVbzRlUhLyD
         hHuqZ+L3Q/VWF6hx7I9bIJ5hU1SG23vbM08gsO9R6/+rmdnmUF2reWLH5coysKG4Ixb5
         nPGGh9T6icAqpzd0CUiaJtBXiE6BHltv6cxMwm2q8X1cafVzqW0VI0wdtb4vNVgJg1xX
         aBD009McTodKDvV3nkAZF2ptwihvVXivjFYBYjGNhqW9WD2OQb4M1d1uhzi5JUowbd/y
         hRlV0q5wg370ShhZJtJ6A2dHii5rFTD+GZ1dJz8NkR/1CYWUShcqS75yoQHkhG9Sy69I
         CJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448141; x=1796052941;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WJ9u915aobNPmfIneqbGjqdZiarGAKLNjxdAyEJTY/k=;
        b=mtw+0/ac+6n8+HmlX59fhoEyiI7L64CZYnAb4yrP5VncyFjIW4VEL198KKLkBxNDfO
         3DN2rxABQ0HyU7I5VSS27+eGryAiZ56m6CbNUby5d0e/I1PJkURutXRPg6H9DoXaMwNz
         Zjtxag6bg1+1SKIB9jO2bKaJsS8Quvil1+qjyyB+RqeoCGrBV87vaPOXN5ZdG0NQMfP0
         6bZg/IeBnssQqTtupribLLABbgL9mK9wOpGnFTJT7BBnPUZs1szUdkR/cJMq8ympCZ9v
         /jOs9sTZOKLSLMb3h+CggvLrzIi4d5OYw00PxfKIBWP4FnyNNqW5XEAmbTxLohFOrTni
         HKCQ==
X-Forwarded-Encrypted: i=1; AL+hErE9rdJ5n3lXTNdJ4Nk15yze5wyTc0w2U+tF5frXMDyYpfQd6DqzYFSJKJWTcjyUMk43JyoeN7/xJ59H@vger.kernel.org
X-Gm-Message-State: APuU4Z9P5Rn0BA9mPMQsOH+UGiQotKJtTmLO3Ocr+Nf0W8Z41DUVLb0I
	J5bUi3iflhb3JEn2cXtiwMXMQ1JE/g1Y6ZPN/QIaST9ECCQcuJ2REf8Jek0Iyj7gfss=
X-Gm-Gg: AZFdTZc27yNNmbxC9hSXax5NjqqbF9nGJkqjagGUxG6WJAmiS1TLzcKljG8PWgwi2Ap
	n7Y6IryUC+JEDHWttI/BCuS4NvGeGZgtw3CK48A8XSoDBla9SG4BeU6hmaIMJZUAKY10btYaq0B
	bKqkSkYGEu2suXUod/ijqQvoJsj3n9/ZCPvuyyjH/vNWJU0xSNbbZy+taPUdjOZGQA3V9MQ1XeG
	altLKCiyvkoFer+sCpjwtDg+J4BlVO3hMBapWfWC8ZDME+uN/8FMdQ5Cz3WlW9SY4coI/GrqWqj
	vWWACzkB4PjdHGxMy7a/lbtVUYG/QJAao4xJ+9W1EKiJAMEw9AGy0ax1TFrNEpb21ncCAqMHckQ
	r9fhX1dqMiSLwxmewAFFTiOUu4yaEzJgUWdGBVI71owOcCsRspu910y74CD0+eiMNJqOYiAeLLX
	QN14I37zI1ptalSn+hMejtmDB91IBPTs1NtEdoBPoZ7rsikc38hExQd3TJhlrODqQQX2CNoCXym
	cmMJMOGgNCmqTdf1Rd6bpzyXMFyMg4x3quB/JwtcNx9MmSSzVkL4nl6jiEZXYYwK7/CKWyXubnH
	112SWK3azFnwXGIgRgcQIES7KfmNO7jYJTBBs3/130ecF3/GxZTfN/ZkMnfm+Ld3Rc8Nn7/6b+G
	BjQBTDjf6eeFBHpMsyNdIw/lZgpGvEy37
X-Received: by 2002:a05:600c:3555:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4bb8882907fmr248126085e9.34.1795448141435;
        Mon, 23 Nov 2026 07:35:41 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm305917455e9.9.2026.11.23.07.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:35:41 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v3 0/5] nvmem: Derive Rockchip MAC addresses from the OTP
 CPU ID
Date: Mon, 23 Nov 2026 19:35:34 +0400
Message-Id: <20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNyw7CIBQFf8WwFgOXPl35H8YFpReLj5YAJZqm/
 26pG10Yl5OcMzMRj86gJ/vNRBxG483QLyC2G6I62Z+RmnZhAgwKVjNO3VXkZUGHYKmyo2npXSo
 qVM0gEy2rqowsV+tQm8eqPZ7e7MfmgiokV1p0xofBPddu5Gn3JxE5ZRRlzUUOJdMKDvpmrEW36
 zGQFInwqYEfGkiarCk1gmy40N+aeZ5fWqpr6xMBAAA=
X-Change-ID: 20260901-rk3576-otp-cpuid-mac-3c90243d0884
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4623; i=alchark@flipper.net;
 h=from:subject:message-id; bh=IWttZoeJgqIMmrtNEkRl3I83UNMkrzhGlF9ZFlBL9Mc=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzxHpu39yaVaHQnM63ueTGPo35mtytz5lN/x14+ICth
 a9056fHHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy1GSMjw+OF980D55QurfkRuId7t6/AQWWha0H7312u62YIv10absXwP+ryn6e
 xFw5JBXQ8PsedE31J4W3LTIZtX74+03wrc9d+FiMA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Rockchip SoCs are shipped with a unique CPU ID in their internal OTP
memory, and Rockchip bootloaders use it to give boards which have no
dedicated storage for a MAC address a stable one anyway: they hash the CPU
ID and patch the resulting addresses into the device tree they hand over.

Kernels started without that fixup, e.g. straight from the SPL in Falcon
mode or by any other loader which does not implement Rockchip's derivation,
fall back to random MAC addresses which change on every boot.

Formalize the derivation in the DT binding and implement it in the
Rockchip OTP driver, so that a Linux image can use the same stable
addresses regardless of the boot flow.

v3 is a redesign following the v2 discussion. Instead of a separate
SoC-specific NVMEM layout, which could not coexist with the fixed layouts
already used by RK3528, RK3562 and RK356x, the existing CPU ID cell gets
a "rockchip,cpuid" compatible. Referencing it as a "mac-address" cell
selects the derived address, while any other reference keeps getting the
raw CPU ID. The CPU ID location comes from the cell's reg property, so
no per-SoC data is needed, and other SoCs only need the compatible on
their CPU ID cell plus the GMAC references. This is similar to the
behavior already present upstream in drivers/nvmem/imx-ocotp.c

Plain "mac-base" does not fit here: its argument is an offset added to
the base address, whereas the existing Rockchip derivation used by the
bootloaders XORs the index into the last octet.

Patch 2 lets an NVMEM read post-processor report a shorter output than
the raw cell, which the OTP driver needs to hand out six bytes of MAC
address from the 16-byte CPU ID cell without truncating it for anyone
else.

Patch 4 moves the RK3576 OTP cells from the deprecated direct-child
syntax into a fixed layout, as the former does not allow a compatible on
a cell.

Only RK3576 is wired up here, that being the SoC I can test on.

Cross-checked on an RK3576 board: the addresses fixed up into the FDT by
U-Boot match the ones derived by the driver, and the driver correctly
assigns them to the network interfaces when the kernel is booted without
U-Boot proper at all (via Falcon mode). The raw CPU ID cell remains
readable alongside (e.g. via sysfs).

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v3:
- Dropped the OTP read serialization patch, applied separately
- Replaced the SoC-specific NVMEM layout with a "rockchip,cpuid"
  compatible on the existing CPU ID fixed cell, so that it works
  alongside other fixed cells (Ricardo) and needs no per-SoC table (Ryan)
- Moved the derivation into the rockchip-otp driver's cell fixup hook,
  which also makes the layout module unload issue moot (Sashiko)
- Made #nvmem-cell-cells required for the new compatible (Sashiko)
- Dropped the dead match data and address validity checks (Srinivas)
- Allowed MAC address indices up to 255 rather than just 0 and 1
- Added an NVMEM core change letting post-processing shorten the output
- Moved the RK3576 OTP cells into a fixed layout
- Dropped Miquel's Reviewed-by from the driver patch, as the code moved
- Link to v2: https://patch.msgid.link/20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net

Changes in v2:
- Switched from a scope-based guard to explicit lock/unlock calls in the
  OTP driver to avoid mixing styles in a function using goto error
  handling (Sashiko)
- Link to v1: https://patch.msgid.link/20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net

---
Alexey Charkov (5):
      dt-bindings: nvmem: fixed-cell: Add Rockchip CPU ID
      nvmem: core: Let read post-processing return a shorter length
      nvmem: rockchip-otp: Derive MAC addresses from the CPU ID
      arm64: dts: rockchip: Move RK3576 OTP cells into a fixed layout
      arm64: dts: rockchip: Derive GMAC MAC addresses from OTP on RK3576

 .../bindings/nvmem/layouts/fixed-cell.yaml         |  33 ++++++
 .../bindings/nvmem/layouts/fixed-layout.yaml       |   6 ++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 111 +++++++++++----------
 drivers/nvmem/Kconfig                              |   4 +-
 drivers/nvmem/core.c                               |  17 +++-
 drivers/nvmem/rockchip-otp.c                       |  45 +++++++++
 include/linux/nvmem-provider.h                     |   8 +-
 7 files changed, 168 insertions(+), 56 deletions(-)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20260901-rk3576-otp-cpuid-mac-3c90243d0884

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

