Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521886;
	b=bK0KVHbE++Sfa2ffrevlnaD9e0RrlU3znleKYU/WCzqWAOSMvGC7id5TJdk23StnsZU0
	 w6Mzsk5swI2Wku+rvOYUB19ec8xyEfkya6UQD+FxetIUBd/LPA9MpUdXV+ySqejwzN4xp
	 FRwOkhq4WdqidIIdgAmdpWpuMGTQP0c+eypvUHj76sKFrk7qzOAC+vXEspJsU8wN3fqjS
	 JNnqBgcpxGp+l3mGbtdUHNFaP9YZr56ODbFVH2ujjq62aButVpkDig+K72qOx+Twmaxm7
	 xrS0TOWAcIPNQ1Ew5g/WoKfMVgNS1v8lG7Hz9Riy5NKjewWJCW7fQnTioMLQHsAr1JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=sYVXSUbjmCPUkI0VH9/e22EvsmQLOmp2AWEy5Mzz0qs=;
	b=rYmuFK5TycwSWeuosMuIqBvzV20dTzWb6tE8X8vibAGRS3+8tpWsiKO/6voUV4eJOfuV
	 zgaTyeWRRQyrGQ5zMdvFmT8Ptlm5TyjTPxd1au1cSiAB7LiyBD+s1Pu+TEbLBuxF55rJs
	 eXCvW+iIg1YKOwE7xhimQfJvt4lM+K2ma04nSXAn0dsdbPE7WBCQ7vypzJXHUnsdbRXDv
	 raMZhiVZfDFmgVR/65tZA1qmZXMNjlg+qjeWlybecjhzNcv9t9l6xi5bBn+ySCR16tSJz
	 QipNT190RmDkEXaDGFaZ0HCQd/0rWZW+mBl46rC7RxoaIp2hM9aRUgS/nHIqPt8o8cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=NF2+m6Vb;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF46606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DF46606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=NF2+m6Vb
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so38566905e9.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 04:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795521884; x=1796126684; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sYVXSUbjmCPUkI0VH9/e22EvsmQLOmp2AWEy5Mzz0qs=;
        b=NF2+m6Vbb/Ug1D+a/ldFU9EQGrXiELlo04rpwApnkiLu34GxvYjjUJtg65ZsFVR/Je
         7/3dShdyOoU6ak2tO+N9w69t86DyVwHDDAX4OBJzDB8f/5FvJoJhgWCpD46lbz20xHih
         lkJhpFh7Z0hMCBakdekVjudlCH5rTq+ftQdfBVGWYQbEsQzEousqGBHFRfPUNTZha96y
         T/TXdNZSMgEEVwP4DPMkoQrfKEuqRkfSAgdlyBB59ihd4bW8iDKnpegjI35ia9tpygkd
         Btv6hdUQnZzWwQ4Kq+wsosWvFCBYgpUneznIPI9qCJMwqztYAq6EqDdZPkuGkk6AjJWI
         O/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521884; x=1796126684;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sYVXSUbjmCPUkI0VH9/e22EvsmQLOmp2AWEy5Mzz0qs=;
        b=YXHT2KIVbAn/NdUWAjPtjbSrNXvv7Kvgc99FeoLE0gLZzOVx1qJQtmRnmfhsWdFfjl
         jWHu5bZ/xDYkZ3k3e+qCUapj8oJXgOfLIGI08wPyuuT9GcEJVd9D+t3ciEUpbmgEny19
         oqS73LzJRty2ulbJQnQpGsrw9GG4bnNYP0oBB/Q4VG0I81QWMgwJeosdsnGFArgXkX3f
         1iXjx+p0m3UY+C1/k8yT64SLd+nYk1KxKtz7+dW9OuS4pvqxIPV+i+smC620jlv2h0YG
         VHB8LAvezcPvAmelb5zfQF4dXXvwbPaCfQJ/AbbAvS732dVj/8s1aXkj+1R44e+NwjDy
         2pTA==
X-Forwarded-Encrypted: i=1; AL+hErHHvj6lls9KQlVEfh3QVuO4Z0b46udOYzpWUYcm3TKp3N5U9thoASd6EqjsihS7uXsxBS5SaOoQv8WW@vger.kernel.org
X-Gm-Message-State: APuU4Z/SQQ/NpfRXvlLPnOdgfEL5YaAUU/eDuhhpgKogfevYmAJuHy6B
	7mnsO3pA82srMtWo/xBrh9aJt+GB/rJ16Zw9hi/S9bYekHMJvfhdIkZLHiXrk/yFA84=
X-Gm-Gg: AZFdTZeyKB8dGARp0v6u3fxoRmzl/I2uJ2oZ6u60lAGZKYNS9Ql7yMv5CFXJTEweny+
	ffkqU63hrs2h7HrvT8JHGSNIkvOWvSTH43R1JlRzSWxTJg0jpMb8W1T1iWh/N0Hi/LA7BTC3f0h
	yQpq9koJSNAfZMaH1g6plKwt7XHFPQUAa04V3AsdeK3j+EzhndfNFW8kAY7FtCzWSOE3YVecFk5
	h0rdJ2mGYI6ZplV6MIKVTn/y9Ml/Ddbp1fTbEdcuvWHgrrcWSqqmzKF0q2NX/2lL/Wo3c6sfREM
	irnihKxd46y2Rcj+AulZqhqNHbEUeV1Z3NVlhFyYHUo2+6V2aluu5pe5JUl2usrT7phNCjJeZBa
	EmxsRSrhfBrx1DbF0/a7mBHou78yDTlg1IMiqQBxZj5tkAvf1TMvr11g7dSgbNir9n4cpZVsYIB
	13GFtB10hPstDpJmjMaVYR7dhqpD1V+yWr9O8yQHELPa6ivLw7BAio7gGjNH7iQQemBKWKLRp6E
	MrX/xhRgJBI/WtZlToub9fZzkf2G+wDr3pY9Em33c/2rMteoHa4g/5iO+J9iLHPV9O2R8TMUjV2
	iAr4h7Ge0CXJabcYKINhJOcqjtDLCl7Mb4UGjphtaZcdqPBJZ5M4V1YpXE6chsQb4VgEA/naspg
	WZGrbZVfu+XLnIipe/jPxF0W9uG8jaQ==
X-Received: by 2002:a05:600c:19d0:b0:4bb:65ed:b55c with SMTP id 5b1f17b1804b1-4bb88824b18mr298164705e9.33.1795521884259;
        Tue, 24 Nov 2026 04:04:44 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm242405235e9.2.2026.11.24.04.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:04:43 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v4 0/5] nvmem: Derive Rockchip MAC addresses from the OTP
 CPU ID
Date: Tue, 24 Nov 2026 16:04:30 +0400
Message-Id: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNzQ6CMBAE4FcxPVvT7hYQT76H8QBlq/UHmhaIh
 vDuUkyM0RiPk8x8M7BA3lJgm8XAPPU22KaegloumD4W9YG4rabMQEAqciG5P2OSpbxpHdeusxW
 /FpqjzgUorMR6rdg0dZ6Mvc3sbv/MoStPpNtoxcbRhrbx9/m3l7H356KXXHAqcokJZMJo2JqLd
 Y78qqaWxZMe3hn4wUBkVJkZgqKUaL4ZfDFSAv5gcGKU0FmSVtpg+sGM4/gAX0gYqVoBAAA=
X-Change-ID: 20260901-rk3576-otp-cpuid-mac-3c90243d0884
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5166; i=alchark@flipper.net;
 h=from:subject:message-id; bh=RZAI1HlQZY9Dqv3pbjTGomGAzes5x9527TWoirzpG/0=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSz1gbN4XpVs6iYU77HOaej5VG1CHOgc5/j27I5l9Lfz
 Q6Jjf7cMZGFQYyLwVJMkWXutyW2U434Zu3y8PgKM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFTHfWH4Z110punTySyFR9LZkiW50ScMGTYLXMs0WMd9weJ2FMvy34wMk8IiDQz
 ebzNwuM1rF3F8+9O9XIcyrf3OFC73yt1b1HqSDwA=
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
behavior already present upstream in drivers/nvmem/imx-ocotp.c.

Plain "mac-base" does not fit here: its argument is an offset added to
the base address, whereas the existing Rockchip derivation used by the
bootloaders XORs the index into the last octet.

Patch 2 lets the generic NVMEM MAC address helpers accept a cell longer
than six bytes and use its first six. NVMEM cells have a fixed size, so
the OTP driver writes the derived address into the start of the 16-byte
CPU ID cell for MAC address consumers, while the cell keeps its full
size for everyone else.

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
Changes in v4:
- Dropped the NVMEM core change letting post-processing shorten the
  output, as cells have a fixed size (Srinivas)
- Added a net change letting the NVMEM MAC address helpers take the
  first six bytes of a longer cell instead
- Made the OTP post-processor write the address into the first six
  bytes of the CPU ID cell, keeping its size
- Link to v3: https://patch.msgid.link/20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net

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
      net: Accept MAC addresses from longer NVMEM cells
      nvmem: rockchip-otp: Derive MAC addresses from the CPU ID
      arm64: dts: rockchip: Move RK3576 OTP cells into a fixed layout
      arm64: dts: rockchip: Derive GMAC MAC addresses from OTP on RK3576

 .../bindings/nvmem/layouts/fixed-cell.yaml         |  33 ++++++
 .../bindings/nvmem/layouts/fixed-layout.yaml       |   6 ++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 111 +++++++++++----------
 drivers/nvmem/Kconfig                              |   4 +-
 drivers/nvmem/rockchip-otp.c                       |  48 +++++++++
 net/core/of_net.c                                  |   4 +-
 net/ethernet/eth.c                                 |   5 +-
 7 files changed, 155 insertions(+), 56 deletions(-)
---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20260901-rk3576-otp-cpuid-mac-3c90243d0884

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

