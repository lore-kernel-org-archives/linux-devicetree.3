Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793413627;
	b=rj341s6k38+97xYKAp2kWSeN0lzU8pH3Vo+sLiYgzhDaX6Az6KMK2cB0l6QY9L5Cx+Ry
	 NI+tApHYypJs/JkSh9iyyFrLtviU/Smq1IMmBnxOdR2bLo3hm64KshG5UEDf/T/o6oqnR
	 +b6VQlmQmyVFLYpz1H8Bdn49LfI4dcrWpDAGximz2d3wGoy+1Wo7s8tI+dTsotHC84VVX
	 bBs9nJyT30YgG1OUOzY5nQEdzoTsP7m2SBwK0qYp+vP070+P9xZuhEKoIzjwzq2CRog5E
	 /GVFgDLxxE10CV8PKOrE5h0XhU/n/d3krZqgyF0Oo+cLDsj0QAK02VEE6pDuXICCylQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793413627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=xbi/DcbTngoNULNMywk8NVdeYwzEvudByqlDGAot+FI=;
	b=49YYqTONoNcgOABX6GQ16QHBIJ7tBV5Wjlqqq5X5gVRZrgfEqNf9aHH9bN1KDXKz23hz
	 AHzTlqQGoM6tHtAk9yAK+FCu3BlCbFghVXCAZu2TXD65WXc0zFKjUXh6EhuvS513xha4b
	 yjfOTzDTlPcBh8KCQbmZK5dKp2PE1wcAoqFLme1VhwrkqcLtprEDUtIkQyOiSH+aFoigP
	 wdfYZ0iUiXsZBjREheZefE97rjUe/qEDdYZkX+VlDuudxJmE6h5lO2gn53UET8Pa5BSNz
	 2lK1SZoTHv7YDTa9Tij8Otq9ZuZTm7boFwYoD+tVk34kY4OrcOFTv10rVXXmV8rdQ5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yIvLU8r5;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D4F606A331
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 02:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63D4F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yIvLU8r5
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-5058b105df7so482038b6e.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 19:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793413621; x=1794018421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xbi/DcbTngoNULNMywk8NVdeYwzEvudByqlDGAot+FI=;
        b=yIvLU8r5cVAh9EfZORgnphuy4TeqTol0LbuWJUKMNk22l02g/uwfwhF4jYqpNdd//5
         vLhA7N9zTYFFQNT7InZKx9fzgSgUR3SjFuKS/InEXFWrxy115keS7PVXU1QvK2lwi0It
         bpnMnifFePJKpcTxVGrnXnf4VY3L9qrbblODxkZc0K/Qafhz2Zsl8MfosaeYb1BC5G5u
         YKHH+EPTDAc/HbvtnNuMmj0joDIdDfyFd4PSys+zhOKYnWE/xGu8NSFPZCJD8FoOhk0Q
         F4ekNkXaXrM6JvMFJvH8nvcDiXcwGAda3a5PuKl+PqDMsRlgVf/eB0QCjsl7hQEfZWUW
         GkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793413621; x=1794018421;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xbi/DcbTngoNULNMywk8NVdeYwzEvudByqlDGAot+FI=;
        b=Lwrif1m0R6TpMQMYKu0D4uOPLCu7DfOjXLDvlNe55Q/6nCRDkVmdBjuiLk5IIGnqzX
         22frEDeR7H6wR0Ajde1Ss1eAb9amTpTMeMruWLXi5LDtNZehXa7v9crZ/p/rRo4/EeQG
         KIPr7VHePfCP0fWQQlNz7I3KfjUpPPyJ8dbwDWAc14yFZ3JRLFHcfvKxSLl6Cq8C/Z6e
         txHgbPSV/9+1gELkLwpmWgvMzyQfX/gLkzy9oTIwWlpWxA95aWf/mfzAEge/THEhYyID
         v7bKDmanlfSeEwqcssPHmBPPUK1Lyy09PjFQzloS6FQxndth5KaNps1wUzToTgKiLocY
         8rPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJ2i084C4JQMNPyUYQ+YO91aw05LzjOU48zXGZQOiYThPNbfABzS083UlUBaItOThVtWiAhw9N7E15@vger.kernel.org
X-Gm-Message-State: AFq9FYIlJNEKDzoROskAdJuEfojdJcCsyY2EWAM5bQ+fJIFU31ZGTbls
	k5CCla60hHXWr1UAPCM1KutYIOafSeziIjScj0QcZIUmtAJkWPD/1BEy
X-Gm-Gg: AYBFou0896NO6cadyn4e5ttUexiQGmJ0g/67qxpA3zURPTTBRQu0fUOqHG4kcnSihSg
	GbOSRD40p5FqPaM8SH4W4r7LE+HGH7fMOHBSKTrvKaRr79T6YnAuSZH7MtqadtisevaV+nQcszw
	TK3wgQEr7bXTrBZjWfyENZq5r29wUxf0J4GHBu/zln3xmqJsO4DusctO/I4SE8skQl7WKDLbqwb
	udRJUE3tSNo00YS6hFsIGXjyAN9qM401f38SFntTvRxK0wRYojMRQl/+/bclODXu5CMOyaMw57j
	kFziVWxFSnYDNVdxiII8ouMlQxmvpUKwLHUJXPIAZaUFH+7XV0X+rbScpV+KpiBQzZaC96GMyuu
	EfvyfbnUSwMt03qS5UInm/VLNSzLRQ7q8p7gMjeEDKbUbxgDb9w6JZu8rSecfcX4Pt7n5fPc5tz
	hTTCllM65398hSU8XSl5X7Mt7xQzBPUYwjcNfGxXlaRUdPawhbzKVfzoizKo5r95lApadi7yV9v
	e0ImK1+qqyro4TFH2KCg9H1dlJTmNrNDfkrxionSjgk803SJnKoRL+ZXztAAYVW5xEndizFZzn/
	rgLNl/ae0+QMF8v34zJbI7CJHLN1Qf3/H2Gf2wT8sfNK5ClDq0oAnaW7oU0MAbfl/qAmTb68zUN
	HGGnuBgYfzUMngxJ+L0vGmqrSsSU=
X-Received: by 2002:a05:6808:1b06:b0:4c4:9f7e:92ce with SMTP id 5614622812f47-5640dd36723mr2864854b6e.38.1793413621390;
        Fri, 30 Oct 2026 19:27:01 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd93451sm2821127b6e.3.2026.10.30.19.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 19:27:00 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: allwinner: add Allwinner A733 SoC
Date: Fri, 30 Oct 2026 22:26:59 -0400
Message-ID: <20261031020640-263f7b05-a7s-reply@gmail.com>
In-Reply-To: <20260911001805.0a2e033d@ryzen.lan>
References: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com> <20260613-a733-dts-v1-public-ready-v1-3-7787c94681db@gmail.com> <20260911001805.0a2e033d@ryzen.lan>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Andre,

The v2 cover is Message-ID:
<20261031020640-263f7b05-a7s-dt-v2-0@gmail.com>

I have incorporated your review into the three-patch DT v2. The initial
SoC description now includes the RTC, all UART and main/R I2C instances,
R-PIO/R-CCU, all four MMC controllers, and the documented pin groups.
The board enables UART0, the AXP318W on R-I2C0 and the microSD slot.

On the individual points:

* Base/checks: the series uses official base d89e1d186ec9271bf78e62771779e9fc03bf0fc3
  with the exact public clock, PMIC, pinctrl and UART dependencies listed
  in the cover letter. The full ARM64 dtbs target and final A7S
  W=2 CHECK_DTBS=y check pass.
* RTC: added with its current clock inputs and the board's 32768 Hz
  source. RTC counter advancement was exercised on the board.
* PSCI/timers: removed arm,psci-1.0 and added the ARMv8.2 EL2 virtual
  timer interrupt, PPI 12. The redundant disabled-by-default prose is gone.
* Pins/UARTs: added explicit pinmux values, MMC1/2/3 pin groups and all
  seven main plus two R UARTs. UART0's pins are in the DTSI.
* GIC: added maintenance PPI 9 and the ITS at 0x03440000/0x20000.
  GIC/ITS dma-noncoherent follows your public A733 reference and the
  A523 precedent; the CPUX interconnect diagram supports that integration
  inference. ITS remains disabled; MSI and EL2 delivery are not claimed.
* MMC: all four controllers are described. MMC0-2 retain the existing
  A733/D1 binding. SMHC3 has different DES0/high-address fields and a
  12-bit DES1 length, so I gave it a separate binding and compatible
  instead of claiming D1 programming compatibility. That node remains
  disabled; no operational eMMC driver is claimed.
* I2C/PMIC/R-domain: added all 13 main and three R I2C nodes, R-PIO and
  R-CCU. R-I2C0 and AXP318W are enabled, with schematic-derived PMIC
  inputs/outputs, CPU supplies and pin supplies. The microSD slot uses
  SWOUT2 and PF6 active-high card detect with a pull-down.

Three supporting changes are separate from the DT series: firmware
clock preservation, A733 main/R pinctrl voltage-mode preservation, and
the distinct MMC3 binding. The pinctrl approach follows Vinicius's
October 14 recommendation. The clock/binding prerequisites should land
through their respective trees before the dependent DT changes.

Two final-candidate Cubie A7S RAM boots passed, including eight CPUs,
PMIC/I2C activity, RTC advancement, UART baud changes, 148 MiB of
read-only SD traffic per boot at 50 MHz/four bits/3.3 V, and warm reboot.
The second run crossed the late unused-regulator shutdown boundary.
The tests used vendor boot firmware and a RAM-only BL31 reservation.
They do not claim card writes/hotplug/UHS, operation of the other
controllers, RTC alarms, or EL2/ITS/MSI functionality.

One electrical uncertainty is explicit: the schematic's nominal 2.4 V
BLDO input conflicts with the software-reported 3.3 V BLDO2 selector.
Physical measurements are unavailable. The DT preserves the existing
setting without a voltage constraint or newly enabled LVDS consumer.
Resolving the physical voltage requires inspecting RP220/RP298/RP299
and measuring UP11 LDO2V5-INPUT and BLDO2/VCC-LVDS0 to ground.

The acknowledged board binding is retained, the old MMC binding already
in the selected base is not resubmitted, and the oscillator names,
26 MHz board crystal, four CCU inputs and DTB ordering are corrected.
AI assistance is disclosed as Codex:gpt-6-astra, with Assisted-by: LLM
retained in the patches.

Thanks,
Enzo
