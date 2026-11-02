Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649326;
	b=YeDf149JWEpavWA7L4Cp90ZpnsbhIdP2+TgtTRFUdwshC2/3dT6LybWLrRFL8FWPA13t
	 jQKRszCRA6d/clLAvBTeZWSPqFWCX6m1NxgycKCpTy5ZRaw+5B9u5ZfUmADDetGAVBrnb
	 qWvEMEGep4Zb5Qbcm/TDyLiPuFyE0PwSry0UKD8eheTMWs4yvfJdB5g/qIKae9tpXcEN0
	 Z3LAQkBUDzvoOTyCiTSEdAZEH0ckSx4ISWb0TqDefU+AWLSObTVBBB7UoTD3jy+2chfro
	 zhovmEWy1EZg972di5fKzcpRfM5M9QUPcx2ZHggWp2FO/tjNqb+wtn9aTLlHAQBGuXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=0KRhRBW/tJdqO8vlvv8X/WEzikIgPAarAzv+Pyz/Urw=;
	b=LFISi2q8yO+bxODI8ZnRnm+aqJ4s+8HgKIMNFhkzFP0dVFHo1jRAtm3YbPF4Sp9ETsvI
	 QmLh+OcwQESu6D4dOWs92rL0anb5RpoAzICpeKBM571W4xfpLrMyd7JXFkfZIY2Puicsc
	 YKy0X3/Adljq0uNhdZIFKFkJsCiBv+IX+jY6ukGvo9PC/Rjlu6LcY/LDJtGs9dDhDEy1r
	 xsDKCtb7CCJxk2DMXlJlC6jU/kww7fQtUTa9sSmop0reU7Pn292gBilMmKgU56RuhmwXu
	 iwch4OYjVZeQwX/8mvZKwKaS53YJsYaJBD1k3ii1qL3Q0pbcQ5ceM1t/iFB38hLbcIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x72uGE8I;
	arc=none smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D98606A32E
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 19:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1D98606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x72uGE8I
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-48e2d5a69c4so1988581fac.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649325; x=1794254125; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0KRhRBW/tJdqO8vlvv8X/WEzikIgPAarAzv+Pyz/Urw=;
        b=x72uGE8IaselYguxRgNx209lzUGTZAxGHK1HwJT2dfk6WtDlVCNIwa+8iiEIcKxiVo
         G08XvhjSh5a408CkhJ7OAUJjg7rTxh3eyxzJUMtW3tuigdjDuYXyIkqV34QqW+usarot
         uoAemPzHvWT6go/RG68ePYaLUrfHd/1fxrpyuDVrQvLlAtuqTT745y5fuEcrpqyGBkpN
         26bvgk1vI39PcwZKlA6BywrdbGcxKm5Y/7z6jxSqHBxCEbnrB78gJQFbYxuo2ZzJ9avS
         LB9u2VJ3bwqH/nRR9BZw2Qg3TrhZ9/c0plhAcqzHDYeGEE/wpz5eO/mXHACSsXH4sOyR
         Mjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649325; x=1794254125;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0KRhRBW/tJdqO8vlvv8X/WEzikIgPAarAzv+Pyz/Urw=;
        b=X+keE5wRS5v23ZEUPre64Edcn8ca34EL0qBWzkygtvO7KLeOfZydSWGYAPIStj14qS
         d/gdZbMv6BhqSLgrJohMWy9CY9Ro5++N+bXxPgh55wnaVU28jJQXdQ3yqbjnXoEK2Amy
         vmfE6SYxFpCHORPZBnet8pMDpN2pFnoCEwdjbpdpQsnPgsdbz/jvvifxXpVt2UEElS0j
         r5e0V/mgFtqaeNXz1LsgBvqepDrpL03/kkOXRwwmBLBPgaOsmKEvvd4SXw2ru199bEW6
         m7RqJHg9Rs+OhjDM51cpTF9RFAl3D82Czlrz8KoBvhyw6VeIYftPtKCqKQfWhNiZNgY5
         GN4g==
X-Forwarded-Encrypted: i=1; AKwUvByZLYIPVTKnsdQ/EDqhEBE/msUeLZGnmg0pUddFSQ0Be2/64F04dxPLJtCmmj1dTbPmvfM4icl42XYP@vger.kernel.org
X-Gm-Message-State: APuU4Z/5Dp+ZyRevz9RlhmkImC4I/lh1UDv+JYwFd08Mb5jYAfosaCF3
	BskV019M83khmneYUDMawDTrd2HVM0FPP49xR8O7w9u4bEKfFe74nRrf
X-Gm-Gg: AYBFou0X+yki2hdlrbDysi8ulAzyMWweiKaM99Bgz4aMoNXbBALhYWdvmGqzkTfJYR8
	c57KpG2QZ4HZ6Arv4pzmrCa9IENpo3L3CuQgTMZJCU5A9GhmhuOmXep8RZrAXIpTgqkSMsQ+WcB
	oou5kEPSweNujAdjQiupP2zygVoTdFribxOSzAS8awd497loKfAJVBJbAWU0ggpAA6JaPQJ/dJq
	ccPSVBud4Mgt6qG3GYPTs3YQa11V9eCYhrXCR3XpyrGvWYSZFBW83b+05M+ARzsvNWoc2grucyp
	1/KVMCVcs1Oo/ohnueypbisV5OPxkfsEBNcfKtWGD99w/AErZj6aFfAcgPbQ/lr65YAWCyAyKLJ
	RmPqePRSQOgBwLMO86tCdSJDdPbJXAC4A0va9cAr0FFgBczDwCzSRPDuJFj/pNii1Ajii3MFl2C
	YiSY+Eiz0/Qm5B/RUA5zh9h04a8SIKNb8vLLsRvU8emRQ2C0OjZfX6HqmkCD601yZrOm6lZ8UoJ
	nHZ2Vf8p/QS3vX39FIsvSHu9fAhtRPIRJcufFdXtDLgkX4gkRMKWzmQLEnyBC+4QiD6NgitttRZ
	Zl5fbyQkSQBSXunUAbRfKdp561o4yA/erOTu4ct0dulmNDJNT+t5PyWudiYVDvHmjFtXE5Xfnt1
	Z2Rc4nKKnNKNbrthOXkMcRBHBcfYLc7TfigJLcEBQ+XKk50xav/PERkLKwtAHYHplLQv4bRhCqd
	ChZmC6n+D0S89yv6ZIU/XJ9uODuZLvvYbupkp6ggOEgJw2meF+OGY=
X-Received: by 2002:a05:6870:1715:b0:48f:e137:d92f with SMTP id 586e51a60fabf-4a907847e58mr6622301fac.58.1793649324605;
        Mon, 02 Nov 2026 11:55:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v6 0/8] serial: 8250_dw: describe the Allwinner H616 and
 A523 UART configurations
Date: Mon, 02 Nov 2026 12:55:15 -0700
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43SX0/CMBAA8K9C9mxN/3cQY/wehodrd4UaxrQdE
 0P47t4A4yRKTPpyafu7Xu8OVcGcsFSL2aHKOKSSui0F9m5WhTVsV8hSQ3ElubSCS8nKzrepZ2s
 rLNtB7llMsWODYMFADE1EEzyv6Pprxpj2J/p5eY7p7guGfvTGE+tU+i5/nHIPYjz3lUb9nYYWZ
 6hBeUCJHuqnVQtpcx+6thrTDPK/kCQIIjdzZbi2ylxDagrpG5AiSNY2BuHroIK4hvQUcjcgTVC
 jHHJRx4aDvYbMFJrfgAxBRnmtFKD38ccfHc+9yPi2o2735wZVHgoy2ieQuu+1N1pFELUzTs4dB
 Gcs2IgWrY6GW+9qrWFsYoulwGlMFrOH6xrH4YINq6Whwt5Zk2jAunypVTAtnNDgDAoD3098/Iv
 Vv7F53+e0YpsUsU8tXkZEMKcEPbIxnKtmai+Px09sO8Gv9QIAAA==
X-Change-ID: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Allwinner UARTs use FIFO-relative receive thresholds and an optional
register layout that differs from the generic DesignWare integration.
Describe the H616 and A523 integrations through dedicated compatibles and
common sunxi setup helpers.

H616 has fixed 256-byte FIFOs without a readable FIFO-depth register. A523,
A527 and T527 have different depths across their UARTs and report each
port's depth in the FIFO Clock Control register. Use a fixed platform-data
depth when provided, otherwise read FCC in the sunxi setup callback.

Derive the transmit load and receive-trigger table from that depth. This
keeps one implementation of the common 1-byte, quarter-full, half-full and
depth-minus-two mapping for both fixed-depth and runtime-discovered ports.
Keep PORT_16550A, configure automatic flow control, preserve BUSY-safe
integer divisor programming and keep the UART clock gate enabled during
termios changes. The sunxi setup uses PIO.

The series first introduces platform setup callbacks and a shared RX
trigger conversion helper, then adds the binding, driver and SoC DTS
changes for each integration. Based on tty-next at 6b4b543fa187 with the
posted RX trigger callback-lifetime fix [0] and DW BUSY-safe divisor fix
v4 [1]. Platform setup runs before installing the BUSY-safe divisor setter.

[0] https://lore.kernel.org/r/20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com
[1] https://lore.kernel.org/r/20261027-submit-serial-8250-dw-divisor-v1-v4-1-41714a75e15a@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v6:
- Export the shared RX trigger conversion in the SERIAL_8250 namespace
  and explain how driver callbacks avoid new legacy port types.
- Lead the H616 trigger description with the FIFO-relative mapping
  and include array_size.h explicitly.
- Name the trigger divisors and full-FIFO margin, reusing them for
  FCC depth validation. Explain that the upper bound follows the
  current byte-sized 8250 interface and can be widened with it.
- Describe the fixed-depth platform-data field independently of sunxi.
- Carry Ilpo's setup/helper review tags and Krzysztof's A523 binding ack.
- Link to v5: https://patch.msgid.link/20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com

Changes in v5:
- Reject FIFO depths that cannot produce positive, byte-sized RX trigger
  thresholds, report the invalid size and propagate setup errors to probe.
- Add the A523 UART compatible and use it for the shared CPUX UART nodes,
  including those inherited by the A527 and T527 boards.
- Read the FIFO depth from FCC when sunxi platform data has no fixed
  depth, preserving the fixed H616 configuration and FCC clock controls.
- Explain why the per-port trigger table is derived from the FIFO depth;
  use the same sunxi helper for the FCC-discovered A523-family ports.
- Move the shared RX trigger conversion helper into 8250_port.c and
  export it, following Ilpo's review; retain Andy's review tags.
- Use FIELD_PREP() and an intermediate trigger value when building the
  sunxi table, following Ilpo's review.
- Select the DMA setup helper directly for the 64-bit-only Octeon
  platform and match the single-line comment style, following Andy's review.
- Carry Krzysztof's Acked-by for the unchanged H616 binding addition.
- Link to v4: https://patch.msgid.link/20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com

Changes in v4:
- Introduce common Allwinner setup helpers with the fixed FIFO depth
  supplied by compatible-specific platform data.
- Rebase onto tty-next at 6b4b543fa187 and the posted DW divisor v4 fix,
  installing the BUSY-safe setter after platform setup.
- Use an early return for FIFO-less DMA setup, following Andy's review.
- Default to generic setup when platform data has no setup callback.
- Select Octeon's optional-register discovery with IS_ENABLED() in its
  setup helper, preserving the existing 32-bit and 64-bit behavior.
- Extract the shared 8250 bytes-to-FCR conversion, including the
  unsupported-table check, into a preparatory patch and use it for
  H616, following Andy's review.
- Set the fixed 256-byte FIFO depth in H616 platform data and omit
  fifo-size from its binding and DTS, following Krzysztof's review.
- Precompute the Allwinner RX thresholds during setup and retain the
  sunxi FIFO-depth helper for filling the table. Use named FCR encodings
  in the helper, following Jiri's review.
- Share threshold-table initialization and callback assignment through
  a sunxi RX trigger setup helper.
- Group and comment the H616 trigger and RS485 setup.
- Link to v3: https://patch.msgid.link/20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com

Changes in v3:
- Introduce a platform-data setup callback in a preparatory patch,
  replacing skip_autocfg and preserving the existing Octeon setup.
- Describe each H616 UART's FIFO capacity with the standard fifo-size DT
  property and use the value already read by uart_read_port_properties().
- Derive the Allwinner RX trigger thresholds from the FIFO depth.
- Use an unsigned trigger index and conditional runtime PM guard,
  preserving error propagation when the device cannot resume.
- Rebase onto tty-next, replacing the earlier DMA prerequisites with the
  posted RX trigger callback-lifetime fix.
- Separate DMA enablement into follow-up work, retaining PIO operation
  for the H616 FIFO configuration.
- Link to v2: https://lore.kernel.org/r/20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com

Changes in v2:
- Keep PORT_16550A and set the FIFO size, transmit load and capabilities
  during setup, following Andy's review.
- Select H616 setup through the matched platform-data pointer and remove
  the type and DMA burst-size platform-data members.
- Use get_rxtrig/set_rxtrig for the 1/64/128/254-byte receive thresholds,
  with port locking and runtime PM around register updates. Keep the
  standard half-full FCR default, selecting 128 bytes on H616.
- Advertise UART_CAP_AFE so CRTSCTS enables hardware automatic flow control.
- Rebase onto next-20261023 and declare the posted sun6i pause/lifetime
  fixes and their prerequisites for DMA enablement.
- Link to v1: https://lore.kernel.org/r/20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com

To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-serial@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev

---
James Hilliard (8):
      serial: 8250_dw: select port setup through platform data
      serial: 8250: share the RX trigger conversion helper
      dt-bindings: serial: snps-dw-apb-uart: add Allwinner H616
      serial: 8250_dw: configure the Allwinner H616 UART
      arm64: dts: allwinner: h616: describe the UART integration
      dt-bindings: serial: snps-dw-apb-uart: add Allwinner A523
      serial: 8250_dw: discover Allwinner A523 FIFO depths through FCC
      arm64: dts: allwinner: a523: describe the UART integration

 .../bindings/serial/snps-dw-apb-uart.yaml          |   2 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  12 +-
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     |  16 +-
 drivers/tty/serial/8250/8250.h                     |   2 +
 drivers/tty/serial/8250/8250_dw.c                  | 172 +++++++++++++++++++--
 drivers/tty/serial/8250/8250_port.c                |  21 ++-
 6 files changed, 192 insertions(+), 33 deletions(-)
---
base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
change-id: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
prerequisite-message-id: <20261027-submit-serial-8250-dw-divisor-v1-v4-1-41714a75e15a@gmail.com>
prerequisite-patch-id: d8219673210dac82d3adab41578ff2f76f5862c9
prerequisite-message-id: <20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com>
prerequisite-patch-id: 9a9395c715c2bf7bbcae5bdd16a339d7f2af6269

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

