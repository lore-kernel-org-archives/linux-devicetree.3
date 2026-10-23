Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740835;
	b=oIHjkvmqITTfImqOGgx2KnmIALer0Z0nJQE5wjQGvSX9QX5lc3VlbYk4R0b1ZHx5o2Dy
	 TvqLDwRohV0geVpEsp3P/tXxdDBW3rq8UmiucGxxbYqgIoIFGiAeNUMa1niUfJXLM3vUn
	 HtYyWmM1pvPmUwyUELTIauIk8d2FVwFw9h2pFiBrGIeVwHSdpNK0r8X2rKuTVp2KZ0lwV
	 0LyMzhBDpN0d0/xGAPVHMfCPPP3pIPnh7X6Rstc5Xh86yN9Z7thL2zPTqUIqmFhAr7dBc
	 UOwgKtNWLgpO8yNRWPI/Ge3vcd37i0W5EObgVjqz9xJjNy+YGv2iXsrtxN2VSNWpiIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=45to1KyNca3iZWz1ynFCrLebqSO0Gkuz8FnFEnoX6Vo=;
	b=ZXRAdQ6QdG1wpaGeljKnEjNhzVXkw1ZwAONMc0kS/F2QJKg/CZ8ICrpugvnVSsX7l/Fm
	 v1R1BpKL+hUnNB4bHPtB4G2B48yt7q2jqvi9raY3kQW0RVrx+Gre+FXKSCMtG3tsnqJeB
	 2sNVLaG+bLpA+0vyC1BvalqIKn40UN2fQzrMZaVU/WFPlHdu43BPFhR8RhUV/m9ywvJ2+
	 Iy+/MlsUahC/vYLGFFHgILNmGvXWR+ESeIWMRuLV6E7JMFZ6A21ak6wdc0m8sAaGSXAAc
	 y7baAcnur3+1PYLHujhU6DYegOpc62255Pse4D6vISu6JqNrWCFHOINzjbZ33sXw+wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dyqpZWIE;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C7B606A31E
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9C7B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dyqpZWIE
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4e4a4d77e5bso1013181b6e.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740833; x=1793345633; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=45to1KyNca3iZWz1ynFCrLebqSO0Gkuz8FnFEnoX6Vo=;
        b=dyqpZWIELTK+QcpV07HE242SRzF85f2oO51gb8podc5WECcr/7BZ178up+12bEBo4Y
         xohK4fPpdON5O+wqd8wi3UoNQ5dalpgpxjHbZZin5mUTOLZbgzg0jovJpN4ICukRhfJu
         mwskBgX6s6uZTFoT7QGOsYdxyK2pQp/AdtwYI/2b9rUUeXwPtRj3BfuJDWr9QugYSIDu
         pUdAxUxcbU+8wwg4vipnVLJOFUrryX4M2HQ/RsyexRiUwMejsd1DwPDukEJjPsiRx2gx
         t1a9o5HJsBnyiplh7sWeC/L+ZKzah8Li84wQ+q3ewBNIWOv4F518JA5WUMciYLFVocre
         2Ahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740833; x=1793345633;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=45to1KyNca3iZWz1ynFCrLebqSO0Gkuz8FnFEnoX6Vo=;
        b=UM3xac1g6GRVbuTtK/tO4UAP+tnRiD81dIO2UCr2lEK70ZDfP8ilS4c3yFFaskhVbs
         N/AVDvfQU6iqWTJ7tnrFFPXPHp2a6Yloejk3m0v3zDY94DUfF/3FqYVnMMNA6exLz2Lv
         cAbJ9RkbjYJ6kPWnKEE5H2g2smdQou+2Rv2PAe92rfQ18bbl7D1NjrKjy84fLXEeI3Dd
         eDP2JVCX4DTf7DmSRQ6nV9HjGxlGYIykw51gZjjZcge46VyOy1IMXSJxzAJZbvixb861
         Lum2/sUN1y7Fb86u6emhGK76CMebCS1KQL3R2b16La4EDl2N5AVfduPoz0NPCj0AnTUV
         XEAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjShw2sG9xDRz263ei9pyqQrPRGSQug9MylqcumPkm9n5Mwp9eWPtsOeLedktL//8wtRWdu2b/vhNh@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7XmANTbl5+/0bBOCnyEsY6B25H8gVb6l4jFd6PfLzP0CV0n3s
	JNS856doOp7jxHPnqSKln07oKBlbJJOiBbzVtY+XfdiBxRO34jthVp/M
X-Gm-Gg: AYBFou2DaLegUks/0i+Yvpb+FrgmulEe/KbvVKRmsnvKMr+PNkCfFa8c4gmgjVTmmCV
	qIqNJPWDM7zCxBMOQCWo9h5pZQINx5UCcgTjq3ztx5EhsP/hPX/8cYdeNL72nPzBBJfCUnq3Gjj
	sMt23/QxEG79wvZH9dQb2gKFlQsmug3lV5r2QZpbWv7JscRiM1ZKNLajBKzBQB11K/V65YFwePA
	HsXvLsS2w1nkKQhaVyPjJvGqTO5R5D7ACb77/JGQCefRuBoasbrKgn5UXN5OuHdUIldsJJrpnY2
	yPRlZLX0uA9g58quUuQloH2JtDmEQh2UzUv3SB8KpFClY+FyoFtwsUAlk0MhQqzV42vQOqU19qW
	X1BZbMH6YH4KguILcEz/kG0i34ICTqXA35r2NxNRz9rgZFkTOP1MBIZrI6Tl9TO/31Zwzw5q47c
	ujg+Ef8cuvTVtnQEtgB0AcVkOf2PmqNg9wZ8cct6keHjpI9Uj5fPva2ofIKIqx9ChMhxAhFF+Dz
	w5Os0IGmqrtOuRXiCzMfn/IrXfSVNdEmwbTzNw7ODHeyV6gjUntzucVuTpIF1VW1qq+VWqNHw1V
	uOjnk7Z46ZG8KABONdv5YBe5aLbG2A39yujfM+HwnKRCD6ZRU9tNsOCCFD8OBWAeb0fgH+wuV5c
	8tsj9vEbPUFci0EPGaAEnV3wMW22x4eTFfFaQ4nEBCxDX+cR21pjEwsG6tp2sdgfmPLJxN4bTU7
	K+WlQ=
X-Received: by 2002:a05:6808:c1b6:b0:4f5:1b84:8cd3 with SMTP id 5614622812f47-557eb4799f4mr2769761b6e.24.1792740833602;
        Fri, 23 Oct 2026 00:33:53 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55be9880a99sm909562b6e.14.2026.10.23.00.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:33:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/3] serial: 8250_dw: describe the Allwinner H616 UART
 configuration
Date: Fri, 23 Oct 2026 01:33:48 -0600
Message-Id: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqEMAxA0atI1gbagl14FXFRY6IZGJW2iiDe3
 TqzfIv/L0gclRO01QWRD026LgW2roDmsEyMOhaDM85b4xymffhqxtlbj3uIGUVlxcMiNUFoFG5
 oMFDyLbLo+Vt3/d+l/TDl9wf3/QBuxM/gfAAAAA==
X-Change-ID: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

H616 has 256-byte UART FIFOs, but lacks the DesignWare component parameter
register used to discover their capacity. Its debug-divisor and RS485
registers also overlap offsets used to probe optional DesignWare features.

Add an H616 compatible and select a fixed port configuration with the
documented FIFO capacity and receive trigger levels. Preserve the
BUSY-safe integer divisor path and keep the UART gate enabled during
termios changes. Attach the existing 8250 DMA path using single-byte
peripheral bursts, with channel acquisition and PIO fallback handled
by the normal startup path.

The patches add the binding, driver configuration and SoC DTS compatible
in that order. Based on tty-next at 1184f87e2790.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (3):
      dt-bindings: serial: snps-dw-apb-uart: add Allwinner H616
      serial: 8250_dw: configure the Allwinner H616 UART
      arm64: dts: allwinner: h616: identify the UART integration

 .../bindings/serial/snps-dw-apb-uart.yaml          |  1 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 12 +++---
 drivers/tty/serial/8250/8250.h                     |  1 +
 drivers/tty/serial/8250/8250_dw.c                  | 45 ++++++++++++++++++----
 drivers/tty/serial/8250/8250_port.c                |  8 ++++
 5 files changed, 54 insertions(+), 13 deletions(-)
---
base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
change-id: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

