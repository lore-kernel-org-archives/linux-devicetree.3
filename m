Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794202148;
	b=x16YVBZZN5s6al+sfUpKq8mtbWCNd6dv+AHGqSpme7C/u0WDMdcOdj/4xby0BoPChLKx
	 7WnZ8UgSMESlOg+r4LT9UegsKkh30NibRso7O/TNifQ4L43WD9EaUU2IQqMjuOm/jiCzx
	 Cqe0LvloOz05tBcIbYaTNtNHpRy4aEjLt/Xi3LCwAozk32vzKFzmvwX0hb9ZBzdoQiEbx
	 hQe+kDT1BDmQCXta1uNYnuDBrw35rak6SuJRL1WS/CgOTBFfbBD+xhNJ2S7fRRweopJsX
	 mOM+o9I00vERim6oxYf7PJoIKtacH1oue0WrA0bb3xzBPV6YWv58+9fdkg+2e7FXD1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v/+iqzE3D85GzraKFwMggPSN+1bOaRD1qrvalwGxknE=;
	b=iMXXnlB9qQR3Ne8xGWhwHCaDcL+QDLmi9Dz55jJ2zubCWxhFxtF3RtZP0/EpXnSmNCB1
	 iF6Znf/eY5pkamOvG2eG2KcucHXdVpverh0MXqjOyFhhBY7pHkm458ERCejZCjHvH38KO
	 8v7UJHeTLmscIx064bS/9PRktH++a4YSIvrTfyqk1xktcuRW4URvnb1nB69yllCK7bm0K
	 zUzsCvhIpHAKwX8BDdOv/Bi7qT7XJb43xq2dVxmXuVF3xeSWO3v+TWpiadrbFrGZV9+Rd
	 FH+zlBnPAhRZm6H7FZ9FFcL2KztM8I3/ZfCth4T5J8fXSkTXSVhf5+J2Vy40NUAflFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mAO8/BpX";
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CAC606A326
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 05:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74CAC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mAO8/BpX
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdb628232d2so252155a12.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 21:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794202147; x=1794806947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v/+iqzE3D85GzraKFwMggPSN+1bOaRD1qrvalwGxknE=;
        b=mAO8/BpXwOeqG2k5o2qTSWD87qR0fy8I2rHRO/KQL7ZsrY/kMN7Pa3BjGSLFr9pF5X
         nHF1LMETZjVkNH6LfnvUoOJ+lDKgSFkThlp4XrZgWj8vdoykCiCx58M4agfvf2kx2OBF
         MczxltN5kEnxYvkbsgMHeC3Cxd0JV8KBo/YOe1kFBVv1zXLoqT4GKQlbiBDcnRcdNsun
         ZNiCdw4je4YmffE/A1yUJEdeVTvmNJgMr7pqzoJkeUwfP7sxUZ0Sft5x6uZruQ9eE/aJ
         xM3flX4ZdsA3hVk0dAXD3HW82CrwQAEG/MZCcMg+/dxnwIfeIiYM+wWlSfPGDdqm+yzo
         8fCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202147; x=1794806947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/+iqzE3D85GzraKFwMggPSN+1bOaRD1qrvalwGxknE=;
        b=rKsr1MbpZbPVyM6YukFALcVdeRzpbmo6OEVw1tSeKEr2DdB4mlcnImITUO5mB7Jp/W
         rBthIchW4UYJqPZ5gw8CYVBY+Y18yEqT1eu9L0Fj62V1YHdJZ0Ca18D1lQjiXJ1W9GKr
         M7TCufTC+EMJJ47n2vKR4nA6CLtkxT4t4Nt52ia4dhGgLdSTkoBmcNmBHp+cGyXeE6/f
         IKeMIVn1hDOcMm8FhFw6etDzK+ogxzXEWTjglM282jE7aNTN1/j5Uwz3tDXM5ENa2OhC
         7geyTNhxygEIKjt29zQPvkQke2+GFuEpCj3EAkJ91ue9gsJ4srp4gsgDFVxFJWIkM3Vg
         5xDg==
X-Forwarded-Encrypted: i=1; AL+hErGfJLemwRqUX32D9E3wKc/Z0uttplPXTvD5Q/l0fO9UNSwQHDmAbglOn0GYJcadiT9nfZ/gAYND6rP2@vger.kernel.org
X-Gm-Message-State: APuU4Z+LaK8WEweC+EbXA1joXPmdxUXeqAXv6Ff1mmkVkjsrKSniD2Tt
	GbuKzpm9zSD4kWZcmbBHlLj2KfgE+PGPnnw+UNjeGVONMGjAnKGml/qZObOMOqAx
X-Gm-Gg: AYBFou0jxawvJnAxIG7CpVYYHLBG387CVHKyZpaMTIuYfG8GPCA97khQaB7IHq4fOCA
	a1cvQEs15B2w7fzLVyCn/72P8WMczY9MKGvK2tBWLzcH/vL7tDambl58DAiYuuimNbgnQX6MShI
	ukPJfuDEjKP+LpTWqG8PNwdVRqaHGRGDBJ5Zyh0Ox4GT9GnEz98wWYB7fXGMb/2aZiScgQIl1/N
	fLFm6jcFfVapZwHmYZenB0GKH0fCJrwwutm9BOhsLYQCu+0hjHvTRrSTQo5pD0sYy72OaDRPA6B
	hjyGjMN99hKDd48cSXK+E6PZPeSBonFl+b1e6jVeUKM2UE8eaihHMAOfvkLccKZnz9NlQV4qyKZ
	moAd85mC+cQzIhQC6Orl/2yPFUeMsCB1HJJf03nQxfCxIyHgsQy3BpysHrbf95qg3RyMtCcAGad
	veX/f3RFUkSDlEMEL7jn9yASdJVglXd/z7QD/WdXN9gsEQP0r462F94pK3Z5mgB4DYAsWxFqx3G
	YJNpW9hXMCByLAbc8bun3dSl6PADdbBX7iqAQykA+Q2yTWKAFHJQIK/D7gtVFUlDNMXX4hD84Kf
	cyASQqFD6ORsz5kNnV9xVZ3gPh0Vute/Zo4cYbBu4n1TVVVBYyWrZewNrzND0P7MBMWx0kEcy+K
	WC/Gz8oiHMj/bF+osRGzvau2EawyRuhwsjvd8
X-Received: by 2002:a17:90b:4c88:b0:39e:6d82:dca with SMTP id 98e67ed59e1d1-3b12d442907mr2821498a91.30.1794202146776;
        Sun, 08 Nov 2026 21:29:06 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb9681385fsm1180899a12.6.2026.11.08.21.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:29:06 -0800 (PST)
From: Shan-Chun Hung <shanchun1218@gmail.com>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Shan-Chun Hung <shanchun1218@gmail.com>
Subject: [PATCH v2 0/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
Date: Mon,  9 Nov 2026 13:28:58 +0800
Message-Id: <20261109052900.2960473-1-shanchun1218@gmail.com>
X-Mailer: git-send-email 2.25.1
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

This series adds the PDMA controller driver and DT binding for the
Nuvoton MA35D1 SoC.

The driver supports memory-to-memory, slave scatter-gather and cyclic
transfers.

Tested on the MA35D1 SOM board with Linux v7.4-rc1:
 - memory-to-memory with dmatest (2000 iterations of 1MB buffers, no failures)
 - slave scatter-gather with a local (not yet submitted) QSPI patch
 - cyclic slave with a local (not yet submitted) I2S patch

Changes in v2:
 - Address issues identified by Sashiko AI review:
   - Program registers on descriptor start instead of prep.
   - Fix interrupt completion handling and return IRQ_NONE when idle.
   - Set PDMA_TBINTDIS on intermediate memcpy chunks.
   - Validate scatter-gather lengths and bus width alignment.
   - Fix channel request assignment in of_xlate().
   - Safe controller teardown order in remove().
   - Drop peripheral timeout support to simplify driver.
 - binding: describe the hardware in the description, and drop
   dma-channels and the dt-bindings header.
 - Use a fixed number of 10 channels and trim the includes.

Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>

Shan-Chun Hung (2):
  dt-bindings: dma: nuvoton,ma35d1-pdma: Document MA35D1 PDMA controller
  dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver

 .../bindings/dma/nuvoton,ma35d1-pdma.yaml     |  71 ++
 drivers/dma/Kconfig                           |  12 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/ma35d1-pdma.c                     | 672 ++++++++++++++++++
 4 files changed, 756 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
 create mode 100644 drivers/dma/ma35d1-pdma.c

-- 
2.25.1

