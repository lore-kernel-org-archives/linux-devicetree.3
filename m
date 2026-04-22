Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3D637E307
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 16:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776873913; cv=none; b=gk0K7gedYtVpZJEeArp1V4jxryEZL9RIIV92b2/ESTLqlqUpyEhcQP57J2tme1HeiUMxgci0jnq3uEqMpvJBlWa67BupymHFiuhWoXzRPUQkdR1ioODNgw9QK3Pagz4O3AwcQ6D/HnYFBPuLYn9RPEGFMLQsU+hkpZ8fMsZJPsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776873913; c=relaxed/simple;
	bh=Tr/lZj2BPFruRnd6bHXXaaBZdHcN2WN1PTBnF3Qh+d4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=YHm46whabm2b8Jju3pXV97Hiu8ljIgq1Chbcn35UuhbNZRfsbP3l00Y/36OzmGxCtOeaTfWjUUiMRHg+p/Ttp/88PVBn3o6YcJqUnCZqFwVZUxjtSzACt5FwLrNiLBP+Zv7mNCIHFHsQ6AtZldbfKvFZtzpdPNegJv9aW4Q6tY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pwSGLXR3; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pwSGLXR3"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-823c56765fdso2730781b3a.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776873910; x=1777478710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tB86gMfHGoJ2KWqInX4kv4EkEdH3ANzmQQzn8Z0dCas=;
        b=pwSGLXR32mce0cs4ZHu/q8OYuyqhxrYC6ATklbXOjPXvtEAq74kpx1YsXGoLHLxFh6
         aWg0VwzMbVcRzUscsrBRNT4KadttNSNyRDNE8+1LBcevCMPLl2ogUjsOaeavA2c0zWv5
         E9GGCTGkYtUbXt9YaBE80v0kCBg0bzJRL5nco6+25yud8yO8k+sCC2g/1R4UTR8TaqNO
         6wWNTnVLjLbQ0EfsAfE2nPL9spYEIeoyVIqec+OLt7IcuOzCCllkUESFf+0LKndov0O9
         FAY7LDVpbjKO1nOIXXt/gduyxCBpj4TFPR4V9Qnao20TbxSXLU36zsLieuQ8BP7wvYZP
         At1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776873910; x=1777478710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tB86gMfHGoJ2KWqInX4kv4EkEdH3ANzmQQzn8Z0dCas=;
        b=Ie5OfjygaohBaABeUcpi0KVLwLzjkC6yDcgy6tq2Qw/uh96Qt30S2yI9AKs6xucWA9
         q/k7SdK0kXzLgo0cKa+B/rtGYBal9/IHSXmLWJs79jwRhXoCv1PJdBA8lUSdjddg/SfV
         ls+JRP0NkWjyOk7nwaZcoj9kKNuTcKRPBEISjk0axXU/XiT4aUd8eFVAko+RkKXYC8bq
         N371OMqD1DJOGxpV/t0oKLOjBOw6vMxclaIkY0u21i3SH8Bjf23BVTGkoI18D76C0TeR
         u8KAYgWRqncuUGKYFVkl0NA/hm/P7F1IcDMPIvsSwX5ooMKSDaS5MXLTdLjkTGjMYf6p
         TIyg==
X-Forwarded-Encrypted: i=1; AFNElJ82ZvUYjZDo6JTNEFiXfc2LyQOCXfmXZ/uIlaQLqeQH8W4djGdDkB/pTpHFa6gxl3VGI/A2mKv0rAHg@vger.kernel.org
X-Gm-Message-State: AOJu0YzrDGbpwNi+Lf4dIgR0yl+WtPmYIfl1Z78zVaLrp6XHm/UUGFHy
	6VBqNqsbX3PqQClp7HOp2wQjCCmdIDw9DMToIPl6YGO0EvJ3GnQpWw17FHtLDk3r
X-Gm-Gg: AeBDieslF6Y97xPvzXWiu8rRMH30mVjoJvh5t1xElP5sUXUnTNo+oBXFTQQGSavXStw
	OC5RMzU31ra2XoZQ9dgztbcpJDf7IytB6AtaUmRSmWDiK0C+snNr3jvlsSjvp40lHzObKyKgm9v
	Rw7ZDlTk4m1uWRhg/ycgWHiB4nATymOHvujsRi18jf0/M/Y6D7W9/uq/Y/LXbIBp1axXFHENYQw
	F+eYRtB06vAEyI7GwZba1Xh4/CDzmSl8HI+IiqaAXpQF0uE+Wj/05IWdRyUu1rNhb6C7NAhQZ8c
	KA/IEh5hoWgh+8j5b3rCN/u6IhjZiwW/MKmjC4NQ+y4q1pXAr+de9kEoX252UolKRrt2opGeXxk
	d2nzbFIbtVes4yxHLSHfHKCbk9NUjUMUGb7cToq+r/2YXY59CNat3q1MhLeIAHcEYfRCz70apH3
	5SQYAJnoiiKzGAykPB9FitwVcAOMKurGhUWh9dMd9Eml3xOs2BH8WJ+YNR83a/T7Hk
X-Received: by 2002:a05:6a00:1956:b0:824:afe1:f7e3 with SMTP id d2e1a72fcca58-82f8c82bc5fmr25641307b3a.15.1776873909802;
        Wed, 22 Apr 2026 09:05:09 -0700 (PDT)
Received: from happycpu-p1.. ([121.160.151.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec003dcsm18151031b3a.52.2026.04.22.09.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 09:05:09 -0700 (PDT)
From: Chanhong Jung <happycpu@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] gpio: 74x164: seed the chain from DT at probe time
Date: Thu, 23 Apr 2026 01:05:02 +0900
Message-Id: <cover.1776872453.git.happycpu@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

This short series lets the 74HC595/74LVC594 shift-register driver
initialise its chain to a board-specified pattern before the gpiochip
is registered, via a new optional 'registers-default' DT property.

Motivation
----------

74HC595 chains latch their outputs from the first serial write onwards.
The current driver always issues that first write from a zeroed buffer
during probe, so every output comes up low until user space intervenes.

Boards that wire the chain to signals whose power-on state matters
(active-low indicators, reset lines, early-boot status LEDs, etc.) have
no DT-level way to express the intended initial pattern today, and must
recreate it in user space after every probe.

The property and layout documented here have been honoured by U-Boot's
matching driver (drivers/gpio/74x164_gpio.c) for years, so this change
also restores binding parity between the two boot stages: whichever one
owns the chain first can leave it in a known state for the next.

Validation
----------

Tested on stm32mp153d-ssonic, which drives 16 active-low LEDs from two
cascaded 74HC595s with 'registers-default = /bits/ 8 <0xff 0xff 0x00
0x00>;'. With the series applied, the LED bank comes up in its defined
off-state from probe onwards; without it, the bank flashes on briefly
on every reboot until the user-space init writes the pattern.

Tooling:
  - scripts/checkpatch.pl --strict: 0 errors, 0 warnings on each patch
  - make dt_binding_check DT_SCHEMA_FILES=fairchild,74hc595: passes
    (example DTS extracted, compiled, and validated against the new
     schema)
  - dt-validate on a built stm32mp153d-ssonic.dtb against the updated
    processed-schema.json: 'registers-default' accepted cleanly; no
    regressions against the rest of the 74hc595 binding

Patch 1 adds the binding property. Patch 2 consumes it in the driver.

Thanks for your time and reviews — feedback very welcome.

Chanhong

Chanhong Jung (2):
  dt-bindings: gpio: fairchild,74hc595: add registers-default property
  gpio: 74x164: support 'registers-default' DT property for initial
    state

 .../bindings/gpio/fairchild,74hc595.yaml           | 10 ++++++++++
 drivers/gpio/gpio-74x164.c                         | 14 ++++++++++++++
 2 files changed, 24 insertions(+)

--
2.34.1

