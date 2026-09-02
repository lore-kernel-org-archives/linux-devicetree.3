Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D7249B1E5
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 13:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354487; cv=none; b=OrHSUw9u+P8UwxUR0S5QdN1Q3LfHgQQtz9OCjICfPT7f/QU6I4j/nUhqRdYxKKnKu+zl8DGFbL8tDlapDdPZzBMeM4xN0en/RFLI6BrDlapRFIvrajJ4o+u2tX19mDzXq+cEovsoatZf35lQRj5Od252zXuB7KCoNP0iGdsAMV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354487; c=relaxed/simple;
	bh=0hKapFxMequ4DFaz8IR0nd0cULM83AQBEbTt3mZlvzc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dhFQm6s+EwoEN3vnReWi5/ekELvDw2LK0IVlhBczVYkVxeMBGHNVgjCUeqovFPTkKziEYRdBqnf4i+RBZquQZ4G/l4HlphmyjJRs6aQpM9xVaxNyGBVY81f7qrN0fDmqQlXD0rKQ9WpCi73jW1eAooihllUoMzOaYe6Z2wPsBBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=H1RT5p5P; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="H1RT5p5P"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so663905f8f.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 06:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788354484; x=1788959284; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8CCYbVer4UrDr5i1p//z3lDPoKdyao2pFzFH41cydj4=;
        b=H1RT5p5PZ82mg8e6fvlneDDp+8Tysismk+eWWWehqJxvhteY31rYD4LamdpII8owYo
         GHgCHBnaKriLABSgEYWWzKDvWEsUQyr+S+OHYwysSJzTWukplG54bhIEWb7FmFCaLY5R
         5whf5s3k1qyzKSkmAkCXyz9gYslMNkst6xrFlOGhrJDW1SFKXGIiYdJmlKH1JXprXm/x
         Ma3WRnqL9CCvTy13Z+RvRQPw015QxYWrOQhpV+mnRkltqql9aF5h2yPxaGeBbyXjsnSG
         UiGCOEVmA3xh9szyOCNqR/TJbPVGzzPesDewTQuluzRv1dhtbRLJ+bLbOLSHgBEDEEby
         YXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354484; x=1788959284;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8CCYbVer4UrDr5i1p//z3lDPoKdyao2pFzFH41cydj4=;
        b=QUkkhPNlwRULkEMzawv2zRNksYh4XhjzPMPBkf4BcxkD0IGWpjJreUTdrOCk1VKADW
         fut8CGIop8iVwMtXMC0TCQBTiZmKRk2oeGZQ8xKrH285eiTJEjT89NMQ7H7QYoXIScQ1
         /E0HQcepnPgiHL6dRI48zhBqu/w6jqzG7xk0dxYeOcR7VdhkmpINQL3OBzI/+wkctmNz
         5TXH6MJ5nuUOnJWeH4QQebimReE1Sm8NS3j5yoGlAi8amucvZ3zNebJpfN2XDAEFMiv1
         PRYKErkllLMHVaR7d74w7i1aXW5KXJCe3u95K9mk2Ffdfqm4nn3S2gVqvaVbieHsUtcE
         pmeQ==
X-Gm-Message-State: AFuF++mLC0O7UJg3Nidn8la0b4Y9vEgNPn2hUfkqWeelXWQ5CC5saIqP
	pnv3yPyBBAndgLqan4V9LmxzsIaN8ldnjw6+kubM7NdR37ZEi4v0vwflFu6CAhtnOAo=
X-Gm-Gg: AYBFou1xI5iEVqScfzpeTcRBAnAW18TNG64Y+5o+V+3vV66x5COZgo5XNrd/r8iJbqL
	96x1spow4sC0RzS8Z8Xz+cKP5R63+tb3NGIMqtfm9/IiUqt/A46BjGjTiIeQmh18r3mXNVlMNj0
	5eXYJ90lcXx7NCvuSm6tZWZOYdpg1QWrxdiqtDCMahX/LRGVWH7y6QJl5HeHogNPpl6ffHaH8i8
	06xcGYbBAbf+7t/npygsJjMsETAnYVO6P1Wsov72eQRB2/bOV4WMIYcVPCJnVQV0q7AdUCmR8ke
	FgJ/MfiMhe/MBgXQ9+g9jHBvXZoWYLCtr0z6zC7YcsrTx4Sprq5Pvk6OSAjeDoRCfAQSbDQkcSR
	mifbELAQl8RXeqqBaM1n/fq1Omn0qdPmsHvqN6baF3y1KSXDmI7/4gKAQ7Kt7UPf9P9SU4FsNZR
	qj9m9DP4Wvdwf/h3sBvHnVfXgzlRjFXw/q0TzFKdKPiTb1WOghXtrEQOKg4ROHV3Ncw78Tu/Yjr
	m28IthdwIb3pFhepaAwafR/lVHAMomSATDVkZ/U4Q==
X-Received: by 2002:a5d:5f88:0:b0:484:3728:1369 with SMTP id ffacd0b85a97d-48488efe756mr8590701f8f.6.1788354484288;
        Wed, 02 Sep 2026 06:08:04 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-2-51-220-108.alshamil.net.ae. [2.51.220.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72b5bsm6385800f8f.4.2026.09.02.06.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:08:02 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v2 0/4] nvmem: Derive Rockchip MAC addresses from the OTP
 CPU ID
Date: Wed, 02 Sep 2026 17:07:51 +0400
Message-Id: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNSQ6CQBBFr0JqbZkeGF15D8MCm0LKoel0N0RDu
 LuAB3D5kvffnyGQZwpwSmbwNHHgwa6gDgmYvrE3Qm5XBiVULioh0T90VuQ4RIfGjdziqzGoTSV
 UqltRlimsU+ep4/eevdQ/DuP1TiZurc3oOcTBf/bfSW7en4tJokBqKqkzVYjOqHP3ZOfIHy1Fq
 Jdl+QKT/cYNzAAAAA==
X-Change-ID: 20260901-rk3576-otp-cpuid-mac-3c90243d0884
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@flipper.net>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3327; i=alchark@flipper.net;
 h=from:subject:message-id; bh=0hKapFxMequ4DFaz8IR0nd0cULM83AQBEbTt3mZlvzc=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTNkN9ksZpPpmbdppJLOz+c4jmdszvBs+tw3vmTiV17O
 P/MqBQP6pjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqs5Yz/OFfdfprubXAJqfcozGLZzpss3aRY1SYacewUL/xd+5t7UMM/xQmNE1
 stVm8VtpLJ7LV8ZzeogtcjE6bV4XNOl9bVFLXzw8A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Rockchip SoCs are shipped with a unique CPU ID in their internal OTP
memory, and Rockchip bootloaders use it to give boards which have no
dedicated storage for a MAC address a stable one anyway: they hash the CPU
ID and patch the resulting addresses into the device tree they hand over.

Kernels started without that fixup, e.g. straight from the SPL in Falcon
mode or by any other loader which does not implement Rockchip's derivation,
fall back to random MAC addresses which change on every boot.

Formalize the derivation in the DT binding and add a Linux kernel driver
implementing it, so that a Linux image can use the same stable addresses
regardless of the boot flow.

Only RK3576 is wired up here, that being the SoC I can test on. Other
Rockchip SoCs keep the same CPU ID at a different OTP offset - 0x7 rather
than 0xa on RK3588, for instance - which makes supporting them a two-line
addition to the driver's match table plus the layout node.

Patch 1 is a prerequisite fix. The OTP hardware has its own internal state
machine which only works correctly with serial access, but the current
driver serializes nothing, which results in timeouts and/or corrupted
reads (e.g. returning splicing a TSADC trim value into the buffer of a
caller asking for the CPU ID, or mixing up trim values of different TSADC
callers). Hence the Fixes: tag and Cc: stable.

Cross-checked on an RK3576 board: the addresses fixed up into the FDT by
U-Boot match the ones derived by the new driver, and the driver correctly
assigns them to the network interfaces when the kernel is booted without
U-Boot proper at all (via Falcon mode).

Sashiko also rightly pointed out a use-after-free in the nvmem core when
a layout driver is unloaded leaving its sysfs nodes and the postprocessor
function pointer dangling. This is fixed separately in [1].

[1] https://lore.kernel.org/all/20260902-nvmem-layout-unreg-v1-1-2d16bebeb518@flipper.net/

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v2:
- Switched from a scope-based guard to explicit lock/unlock calls in the
  OTP driver to avoid mixing styles in a function using goto error
  handling (Sashiko)
- Link to v1: https://patch.msgid.link/20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net

---
Alexey Charkov (4):
      nvmem: rockchip-otp: Serialize reads
      dt-bindings: nvmem: layouts: Add Rockchip OTP CPUID layout
      nvmem: layouts: Add Rockchip OTP CPUID layout driver
      arm64: dts: rockchip: Derive GMAC MAC addresses from OTP on RK3576

 .../bindings/nvmem/layouts/nvmem-layout.yaml       |   1 +
 .../nvmem/layouts/rockchip,rk3576-otp-cpuid.yaml   |  73 +++++++++++++
 MAINTAINERS                                        |   7 ++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  12 +++
 drivers/nvmem/layouts/Kconfig                      |  13 +++
 drivers/nvmem/layouts/Makefile                     |   1 +
 drivers/nvmem/layouts/rockchip-otp-cpuid.c         | 119 +++++++++++++++++++++
 drivers/nvmem/rockchip-otp.c                       |  15 ++-
 8 files changed, 240 insertions(+), 1 deletion(-)
---
base-commit: 8b72f6626dc39b9e7e82b2721d4f7c3b86286012
change-id: 20260901-rk3576-otp-cpuid-mac-3c90243d0884

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

