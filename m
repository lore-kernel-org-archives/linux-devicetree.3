Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440405;
	b=4hI8ejvbVwTPQcqPyRSKbVKainO4560xvqKugvQ+LpfIGOrg5ID2siyx1v6uZIvd1Vwc
	 dMC17eIx6FJpunJP5cl7Xe09dzibzTPlD1Xou0sElFNqaVGc1T626JEBYm/LdZj/Pwug3
	 oN/U0VeKOABSwWuWOXrWtpOXSMg1AoxyxgUmfbpU2cQzk0ApG5PqjCt2SuUt5pwwhYl9S
	 nRhdesFXh6wo44tg9O2loAX8Tq2Ayp5vhW78NV4nK+hjEq6iEWcJvrd+Cl6EHcY5L+6+V
	 JtKRh5XyMtezwhiGQQ+6xI0paJ9wD/iaGG/SFihNVVIEK3Th+2QWjojYYjzxPlJk67w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=frV23sLLMWKOP7RPngYOwxGFd6AYAuODJoFiW6amCkw=;
	b=WhOkdDEBj/DdG190XH2BHGPnVnPDtzuFGpqkK30qFTJ0/7j/oyroGN/YS074LRe0GFMw
	 1j+h1tBg0EKjvaLQpfUbtQ4m+iQfhc8v5j1JVw1ivT9JEs/UJlwQhXUPa99mwrBe4EYsC
	 NSlWwbfUP8PPbTRYK/riHVo6MJ99S30j6XA4Nk04YQHc0Lc9Zu1h8fiiyR7iEdqckQcJ8
	 oyMEY+7g0Q7lRLQlFpOzbs4UEztt0eVOeZOuxoxSMWqGU7b3xtFQYRUxSyV6+iGAkt+Xa
	 n9/HpzEQUcpjf2Ov6G1t5JvBTxKKlSljm9vP8sAzGhhi1d9E9xbYmvsO82Vt42TI2dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PBaHncv2;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E553B606A31E
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 20:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E553B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PBaHncv2
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5e6b5794d26so33084e0c.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792440404; x=1793045204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=frV23sLLMWKOP7RPngYOwxGFd6AYAuODJoFiW6amCkw=;
        b=PBaHncv2C/SQ69nWsr/zLDVNh2lK7XdICLF19nDfb8YMaBogX/aWKO6bRkOGm3yhKi
         dvmTVqoMJCV2PiYdJ6FjgJ92EwklarYmNbQk7bf9v0zLMuWs+iDY2rs6f23qhYkse5W1
         6juCkIIhUkFnbA++Se09SNCDag/5VqCsnQiWfjwvGb6RnpbsqkX4ZKdQBlcBYJFGv5u6
         l//nCG2acpj1EMI3UmNz8IJadekxE2EJOPXTzSOA4lFQRFOYmWdXbTbmXSYBy3Z1M27j
         9RmT1jR698t8jFqII4Uc+wLDHX5suF3hP/eXcIexOTR11DDOFyBS/pnnvnKgXqDR5Ivt
         3FAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792440404; x=1793045204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=frV23sLLMWKOP7RPngYOwxGFd6AYAuODJoFiW6amCkw=;
        b=gseHiYQP7I73KxQXcK86V92PuKU7ouV7k1P1MUM43ZLOsaDeNIgqa4mo8y4Y1NqK1X
         oYsAg0yR7YmbtnQcbbM+5BE/+qRCHdlYZHs9HbHvyyqMaPvgGV5jy0hdj2iVFBvRgJPl
         oFyXYBH5GIjGACd3fVAK5rCFJtm5pG7BFAe2V62w58Y5MF0jXUd92vg0nFg6a5z/vNZ5
         QsfuA23AmVqnWxhRXQFjVpddIahizfH7oH22mok2N2SnESEQ6DxbXpLpXOvnFaYYv+Xn
         9z9t4vTRChmUbmU2dOt64MQP0BVj1szl3/n2unTGzJn1JxOVzhLE9mXaGgsQGFPEkifr
         Devw==
X-Forwarded-Encrypted: i=1; AKwUvBw2nupviSwvndOi4Fg/fzheQ120Mr33Tq+iicxg5UV2cW3huKxrxrA5kxjbHtqJK96F+5P0TLLE47Ok@vger.kernel.org
X-Gm-Message-State: AFq9FYK3YxoDzWrQ6xdLvBJI9XvuiA/EsWN/u7WljvpcJYsg+OvudmOi
	7MCMl6WIygnyiPjgD+ts/GhU5K4PS823Z80TFsOFNA70eZeIa4iSzN2d
X-Gm-Gg: AYBFou3ufqNA/ix0CGrENt63BwGyklpNNZ1Hrl3+YKxmZKTjm5nPVfD376PG138p3lL
	6vPtE7nEa44mWSU5v1z1itOHW48vs2hEOApVGUW/cL6QiapRwjbFb5+0uqr/waNhjHNp1gTmsbZ
	FXxOCeCcAhfvryopzDaKLVmvGbY3iMyfP6PBCMicSNUPAYHKAmrg+YHF9kNK9jQ+ebEQZqfFaLK
	qFCzcJ/hJsZy5yJGwWI4F6RlPDzVweEBbwtooRM6LbSmcXqvz9AsQr1o8+MPMIX4erK9bQfoJeB
	gmruA5ZZn7R7rlTrHvG27y1oKyEWnU+TSSaJIOr1vQBeOWhyISnAQXIZFWvubE2DwSILz4wFhmM
	DlfEF3wpIlcD25obIDaXQVLGR/7rhkJCC6fMS2G/MWfyXs+SLSn9DQKc9Oay7M86GqOl9E2mogj
	E0DJangtCVOkhcKIoR9MrNSiE0ZHfwCAbooUmlAC6zdhaBZTIv7G2g8tDE+GmVCBdHf7wvlptF+
	i1ZXN8pomFplbBh+fYBsFhaSqJs8uJ7oP+qYjnsc1Fzd29GyTUcGBNy6fMWbEm0/UBOmQqVa4sJ
	UE5ekqo=
X-Received: by 2002:a05:6122:1297:b0:5ea:d2d7:37e4 with SMTP id 71dfb90a1353d-5eadcbbef0emr35405e0c.5.1792440403756;
        Mon, 19 Oct 2026 13:06:43 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b4776b5sm10451611e0c.3.2026.10.19.13.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:06:43 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH v2 0/4] serial: 8250_dw: Allwinner A733 UART support
Date: Mon, 19 Oct 2026 17:06:09 -0300
Message-ID: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
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

While testing the A733 UART, the console stopped taking interrupts at
the first termios change from userspace. Termios changes during console
output could also corrupt characters even when the baud rate did not
change.

Patch 1 is an independent fix for the DesignWare 8250 divisor path.
When DLF is detected, dw8250_setup_port() can replace the BUSY-safe
divisor hook with one that does not provide that protection. If the LCR
write is then dropped while the UART is busy, the retry path can try to
restore IER while DLAB is still selected, causing the value to be
written to DLH instead of IER.

Patch 2 takes Andre's suggestion to only accept a DLF readback when it
is a contiguous 2^n - 1 mask. On the A733, offset 0xc0 is the RS485
control register and reads back 0x19f; Andre observed 0x9f on the A523.

Patches 3 and 4 add the A733 compatible and select SKIP_SET_RATE for
it. Stopping the UART clock from set_termios while TX is active corrupts
output on this board. Skipping redundant reclocking in general was tried
in e5d6bd25f93d and reverted by 7dfae6cbadc1 after regressions on Bay
Trail and Cherry Trail, so the change stays specific to the A733.

Tested on a Radxa Cubie A7Z (PCB V1.11, 1 GiB) on top of tty-next
1184f87e2790e8af9be3116f608d2e86b4792d7d, using local A733 DT and
clock changes that are not part of this series.

With patch 1 alone and the generic fallback, repeated termios changes
no longer stalled the console and hardware IER remained equal to
up->ier, while the false DLF was still detected (dlf_size=9).

With the complete series and the A733 compatible, three clean runs of
both the CLOCAL and CSTOPB stress tests completed without corrupted
output. dlf_size remained 0 and offset 0xc0 remained 0 after the tests.
dlf_size and up->ier were read through a temporary debugfs test patch
which is not part of this series.

I do not have hardware with a real DLF, or Bay Trail/Cherry Trail, to
test those paths.

Changes in v2:
- rework patch 1 around a dwlib divisor helper and preserve an existing
  set_divisor hook, following Ilpo's review
- add a separate check for contiguous DLF readback, following Andre's
  suggestion
- drop the A733-specific NO_DLF quirk
- keep the generic DT fallback
- keep only SKIP_SET_RATE in the A733 platform data
- retain Conor's Acked-by on the binding
- rebase and retest on tty-next 1184f87e2790

Link to v1:
https://lore.kernel.org/all/20261005172538.398522-1-vinicius.eduardo.pedrosa@gmail.com/

Vinicius Pedrosa (4):
  serial: 8250_dw: Keep the BUSY-safe divisor hook when DLF is present
  serial: 8250_dw: Only accept a contiguous DLF readback
  dt-bindings: serial: snps-dw-apb-uart: Add Allwinner A733
  serial: 8250_dw: Add Allwinner A733 UART

 .../bindings/serial/snps-dw-apb-uart.yaml     |  1 +
 drivers/tty/serial/8250/8250_dw.c             |  3 +++
 drivers/tty/serial/8250/8250_dwlib.c          | 22 ++++++++++++++++---
 drivers/tty/serial/8250/8250_dwlib.h          |  1 +
 4 files changed, 24 insertions(+), 3 deletions(-)


base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
