Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BA02236E0
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 15:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781278468; cv=none; b=qYCK8pwduhrXsJv4HPuUzSvTu1KlnH0iu8gFLrXypMfNaIedP9ies4OekcahgROqLh7Kdmxsd5OpASOjh8eKay1KKThFAvCifOSRwjrPmbu4rotZk6Dccjdi16e9cQbE6nuruUlnxKTA0E3FvBEhBg47ip3fKGW5zNfO5RPoLKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781278468; c=relaxed/simple;
	bh=gtvNi33VQsDNDkHYG9DuFjrER9YXOntZMxm2KOrjFjs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZHJjI7XH2oTxGTKm42iskMwI58BAjL33+MDovPDi0BqKwSiMiBzBU8+44AZjBvYy3A3bqt7YDwD3osRMxx3bc+JVgPWhu2NEcTJb/t4IEZYuhEXxwe1rokhlINaVprhkguxRJeO+ydlmUc6Vb26dgms+YSVlJ8KYaolf0Diyu0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=9bi2ctfT; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="9bi2ctfT"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45ef1198766so654052f8f.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 08:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1781278464; x=1781883264; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wLR5ceLyn2LWx78PSXIyJ/Cdj4UA0nZ2YxlclNxvI8g=;
        b=9bi2ctfTx58UeYgPvayKXoZCg7GELVYmiZzdxjNvMAXepzpIAXW+JXg7TOS2MuYGk0
         4ZMKfmOK5nyOlBD5RvVcZX0xHHpJ0FwS2PNzAhE+WfNNUUKUL+MIiXuL+mFyhGuHuu/p
         b1ML4R9iS7mZx044b6pa1t2UU/BZyqmrpefGlP8RAlvY80nAwu9xtDGPAth5Kmdfjl3c
         UH9BWrWRVLuhxhrEOUI1IbpGQJI7kDcLHU/0cYk2PSolfpHRwF08k13gXAq843buOlfW
         0FQSTucbhbqQMDx836XPUhAKILzE/E9QUsd35JOgOkvx/5gL/qqhzDES2ZdlOqjBkqmT
         9yYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781278464; x=1781883264;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLR5ceLyn2LWx78PSXIyJ/Cdj4UA0nZ2YxlclNxvI8g=;
        b=GpwbnQyHZNk1FOMG9jXXt50GTkEmXkewr9LOtf2SaC7b7J3k/buD0A8kiyOmCqt93N
         jqunFoR+ambeoxN3rmbDEaQD3/4mIjVkCw16GCmQk24gwYI4phO/G+0CgGjDeueGJOPc
         98OpWBZgISshItXDaGuOqe1mteg4fuuTC432JjMeH+SgKYsKRNQnvHMMP1kLHJjoAnKb
         ppiu1QihAl/lgKl6SrwQKLuMLE5YcOLiZpMUSmIHTFTkbGcUU0MeBkEHy8vWpFgDRtfh
         BHHkLrujShRA3LURjbQOPZ1ZP5KRTk39WAID4n6O9YYGbUrGJx5BfT5yGBUH48BIJPbf
         xBMQ==
X-Gm-Message-State: AOJu0YzVxyvpm0ymnBnpIimXnI0Xze5VPkpeqZpAKdtuU69f/ZNKFFTm
	r3Uax8j4YoAjg5ZrZ+ERGCz+GbTpT/7cbVxJaDgcUErcHUmTqo3+fzao4OyNtWu6yOQ=
X-Gm-Gg: Acq92OHivoZ+3TghSwMnkR/q8DmBcQm2dgfsJXmwb8rKXE2WujwNvUjIGFistazeeA3
	rCyPI1aURjUZktDWljbOIDTMnzCVHdvX298Ybpn8VUyt310YHpxRhHXQK/G9kx5yyjhCXk8IIV/
	9KrzAcbl+lYFmDrmWL/hYaPy+fB+hbgts2DxNR5VGZPoWoDRtQa8FB0XzbAijIrG4lyJoBDe/o9
	Kf0qIP6lDEPGt7LRPhmZQJ1WCqoeXpZOHCh6M6FEtgOYbZ4uqH6QiimWQA70Kr35yLb8lOQ302c
	HyBfa0BY0LDpXp7SLNrF8CQVNLtErix1jfVL5WrTIdy92oFetgFt4gGoRMYObXSnITB+ZX0gi/2
	WxJwYPQWE09k9xBHuMlGE8HrEK25Ns9R2lYOWEcdeb0gErt3F3LqGtRrnRR3PDUG3yC5X8DmaXX
	Ny+vFVPjraWNH6Nzp62rIbsGSbj7TUQBsdgYLMNXRg
X-Received: by 2002:a05:6000:41f7:b0:45e:dc0a:bcb with SMTP id ffacd0b85a97d-4606d024020mr4921301f8f.22.1781278464037;
        Fri, 12 Jun 2026 08:34:24 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.92.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0d28sm6916641f8f.20.2026.06.12.08.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 08:34:23 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH 0/4] mfd: Add support for the MCU in the UGREEN DH2300 NAS
Date: Fri, 12 Jun 2026 19:34:13 +0400
Message-Id: <20260612-dh2300-mcu-v1-0-ab8db1617bc0@flipper.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDXplFq4iljQThmJn7SIpHF3x
 fJbvBchkGcKUGcRPJ0ceF0SMM/AjN0ykGCbDEqqSlaohB1VIaWYzSF0oUuLTjvEDlKweXJ8fbO
 m/R2OfiKzvwe47wfcjLZGbgAAAA==
X-Change-ID: 20260612-dh2300-mcu-5354d1f5f11a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2017; i=alchark@flipper.net;
 h=from:subject:message-id; bh=gtvNi33VQsDNDkHYG9DuFjrER9YXOntZMxm2KOrjFjs=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTpqP1lYhRlET4n1B2UyM+qz36ft0rIVjyhOk/10c72j
 q9t9sUdE1kYxLgYLMUUWeZ+W2I71Yhv1i4Pj68wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 kY6xjhEDF6cATPXEW4wMr47Msg37u+90m55mcYB3d6rIttuMb+3yjqww4XnvoP57IyNDr/8CzVv
 Cqxs1BQ4HV8f9+9lcvWBNYj7nh07+Pw+ttCfwAgA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

UGREEN DH2300 is a 2-bay SATA NAS based on the Rockchip RK3576 SoC. It
includes an embedded controller connected over I2C which won't let the
drives power up without its register being poked first, which precludes
the use of the device for its main purpose.

There is no public documentation or source code available, but apparently
the MCU is also responsible for a hardware watchdog function and some type
of wake functionality, so this series implements an MFD-regulator
separation right away to allow for adding these functions properly later
on.

For now though a single-bit write to the MCU seems to be sufficient to get
the drives to work with only a board DTS addition [1] - to be submitted
separately.

[1] https://github.com/flipperdevices/flipper-linux-kernel/blob/2c1c5ee609f6ed4c77e9e5428df91e98b3f50cce/arch/arm64/boot/dts/rockchip/rk3576-nasync-dh2300.dts

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Alexey Charkov (4):
      dt-bindings: vendor-prefixes: Add Ugreen Group Limited
      dt-bindings: mfd: Add UGREEN NASync DH2300 MCU
      mfd: Add support for UGREEN NASync DH2300 MCU
      regulator: Add support for UGREEN NASync DH2300 MCU SATA power gate

 .../devicetree/bindings/mfd/ugreen,dh2300-mcu.yaml | 62 +++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 MAINTAINERS                                        |  7 ++
 drivers/mfd/Kconfig                                | 16 +++++
 drivers/mfd/Makefile                               |  1 +
 drivers/mfd/ugreen-dh2300-mcu.c                    | 60 ++++++++++++++++
 drivers/regulator/Kconfig                          | 12 ++++
 drivers/regulator/Makefile                         |  1 +
 drivers/regulator/ugreen-dh2300-mcu-regulator.c    | 80 ++++++++++++++++++++++
 9 files changed, 241 insertions(+)
---
base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
change-id: 20260612-dh2300-mcu-5354d1f5f11a

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

