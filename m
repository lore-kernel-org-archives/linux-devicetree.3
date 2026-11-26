Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725331;
	b=rAlmgZg856Dk/wphlWNP6LPVEDm322NYdLaDFF5PJcZNyFiZsLyx/tsdZWjKM99VoqGq
	 YoTxOmUjghEYvpkyWrTDnbkcbZRlalIOzuzoctvolo8PpvhU+ZTlsYZ7MlIcvyHOmjb/a
	 gV/0I9JHVUbFr7Gy+sYMe/MuuyUrs8lgPoLuhiwqGeLnG+tkiFkdCoC+QoyD8RgASBsjP
	 TYZpZuiCwxg8WCAUnz88BwTw4yTPy2E7NTwAL/QodmMjFwbjnoX34Qlq1LMmEMYFWxfGQ
	 DTRO8YyBw1KjMrOYENqYvLP3n5yJIRG1gr01jibJZvs6DargjVwp4pzW4aOtEkL/A9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zqO3yiYGog30zyUcuMfbgRi3wkNhqWosSS3VtCYqruE=;
	b=qC1B98z5qagWxEITh2xIFteclKzjHwotdmAROlsi5S4uYmCPgV6t6dl1g2EjiXj0t8NE
	 0Xvaxy3Gc5h2AZvKGlau/qOiPLA0f5QYzaHZOPJuW0IoMGPXQUpSWGxx5ZPGUOfTo028H
	 PRfWNwaoZpOyISCsQOcK63EMM3FD8OV0AOMYLO+cHnfcYPZ0yCJ7QkbeekpvVC2kr/6K4
	 s5PHA+6xKvfYWzXqzjHIyzL5RYbyK4dT3fxZs9kw9GkhVdqMJJ9bEteuzLuGL2AmnbYzh
	 M8fzlEUmji0ZMk0I6u01wf1PtnrscM2CcONhntYlOS3xKEenwEeAnbemgDOEtdoIoyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nZ6Lo+XT;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0E9606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 20:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B0E9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nZ6Lo+XT
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6aa9606ddadso4786315eaf.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725329; x=1796330129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zqO3yiYGog30zyUcuMfbgRi3wkNhqWosSS3VtCYqruE=;
        b=nZ6Lo+XT2UOlucZG/6eYQiYzPIi0YoUWKLJaNoYSzJv58Yr34+x9p5r3H+n1Sl9sDI
         RDZR8jKc1YTjs3HH37K0lC2rSZGCMIYBO5qO8bAPIQ/JOxiK1FDaDayw6dpUCihMX3Li
         yZZYjGpPotrSxUKbREmLQF8sNvEiYMhae4Q4qkS/gUOJogGPpCEi86mGaDsPChTgJCXx
         IBymGfXLFSWIDb1nU/4vkRI6ouJttK3nxJJYA9wHz7+Dr3uoNuw7Jehf9WNp89Z8kptB
         ez21va4mi4ueieKcajNHuihi73GF6yGGp9U3QZeaGGzw6jFTNCsk21NoKvkmV4xEsyfu
         OCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725329; x=1796330129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zqO3yiYGog30zyUcuMfbgRi3wkNhqWosSS3VtCYqruE=;
        b=Gj4YA15IFo+AwyqWa+hyeuRg8fPVjO+leUc6fJe0QTIexPr3NQKJHEc7B/NjBE1x4i
         Fh1rCHwHu91WW6iyTnJJilW1RFfLY+GkyN7HJDMuZ3xq5mpD1Kfh3t6jQKQ1wsnEjS35
         j+VMLtPklK+dTeRcesv7xWRiyViQivoSFnPJkt8KVP60Do6wUJmmir+/CbLBJG5vOdzV
         PPgyz4oDTsK32vNTpdSxUx7Vad/0ose3au/5O4z6febf+6yf+NsWUcGWzgsgUKbV+NEq
         noyfq35wTrlXbDi4MeM5zpBWPXYrXws5mohLV92XHOBiobyUo7SB4uJW1vL8H4S3tvqF
         A9wQ==
X-Forwarded-Encrypted: i=1; AL+hErHUmD8lV9caffbzcw94A+lkVm4Ib2aBApdoXXnbPIXUoFDNHVwRTLa1un57XdDDkuKrXZMIbRaNGICP@vger.kernel.org
X-Gm-Message-State: APuU4Z9N2qAm7D7ZTgKNb3A1N1wLMOnjz9IVYHXxD+4C37QAqpAqiQ8u
	ZdmrEHtU1+7l1FYtBlizqVUinI8EHKyBJXIxKiYK7rhXbVFZSUuuqyIm
X-Gm-Gg: AZFdTZcP+eVFz+MXMdpkx1zCTNUM3QLXM7Wn9Ene6Tmmv/3J7dF5rsmaZcRnzjt2v2x
	/77qj0VTRojavWNY0lsHRF6GbY5CG5YQQAKrEXbVps2Q3nFELFo/jTJOUElCrfYtrgzPKlrxUxV
	h2CBKR+aajHoPZSr7zPGatYP3Yyynr9I/8TiWVDU91iB+cIGF8k4DKWpptf9WzHDz1tBpiL8pWC
	XyItqBbfKOrHYur9RbE+soog+BqXhY94Y7oY5K1ctWjq3lrIzU9UE59u4GG3FT0LibpsFrNz+S/
	TMnbrFnbPOx6PgpYwGxrk8Tsky4AnAqqvCUZFFFOuxEOF3dkKK1Glqsi9Z/7HY8WDCfENVoEQLO
	L4mWeyI2S7hfPk2H5HL+rLks53VDwXMWOSs2NxaYpXxOF69MkEkFgfMQQIwf+QjJhSExvDA7mqy
	GzLlldltyRAV9M6aY0X1iITwdvk8mzhTUe4OwUA5+vAqBFyddA9EBrA+aWNDPIXrDe+uCxrrZ6D
	Tfp4YINcoxl88Dp5ob+i5JUHmiJTaCnhK5L3YTfWg5edir+UURNwZh8cD4drdaKIZs0XdYXergD
	VCTqz4ujEAKeww8Quayxgbifkjhqf3/CgkucwivZpDgxfDD6uCV4gTXK5S+pdES+E4KySNvLrIe
	FtTwDqQ==
X-Received: by 2002:a05:6820:1c86:b0:71b:790a:9ee7 with SMTP id 006d021491bc7-71b790aa590mr6624976eaf.67.1795725329526;
        Thu, 26 Nov 2026 12:35:29 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5f7ae7dcsm18946578fac.8.2026.11.26.12.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:35:28 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: [PATCH v6 0/5] arm64: dts: allwinner: add A733 and Radxa Cubie A7 support
Date: Thu, 26 Nov 2026 15:35:26 -0500
Message-ID: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add the common Allwinner A733 device tree and initial Radxa Cubie A7A,
A7S and A7Z support. V6 adds the tested A7A and A7Z board descriptions
and their shared pin and binding updates. The A7S ELDO1 voltage range
remains open pending Chen-Yu's answer on LPDDR5 VDD2L.

Base: sunxi/for-next (abcb290978fbfddb56fc77171918dd8b8ef3e81b).
V5: https://lore.kernel.org/r/20261121-a733-cubie-a7s-dt-v5-0@gmail.com

Schema check: arm/sunxi.yaml and all three DTBs with arm64 defconfig
and W=2 CHECK_DTBS=y. The three schema prerequisites, in apply order:

  AXP318W PMIC v8, 3/5
  https://lore.kernel.org/r/20260910-axp318-regulator-v8-3-e906a61a7f3d@baylibre.com
  Pinctrl IRQ-bank RESEND v3, 2/3
  https://lore.kernel.org/r/20261124215048.42074-3-pmazzini@gmail.com
  A733 UART binding v2, 3/4
  https://lore.kernel.org/r/09f3a181436e6f19317224e583c2fdaa787797d7.1792439398.git.vinicius.eduardo.pedrosa@gmail.com

The A733 CCU support is in the base. The remaining runtime dependencies
are the full PMIC, IRQ-bank and UART series, firmware clocks for warm
reboot with vendor firmware, and automatic pinctrl voltage detection:

  https://lore.kernel.org/r/20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com
  https://lore.kernel.org/r/20261124215048.42074-1-pmazzini@gmail.com
  https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com
  https://lore.kernel.org/r/20261112-a733-fwclk-v2@gmail.com
  https://lore.kernel.org/r/20261125-a733-pinctrl-v4@gmail.com

The card-detect EINT-mux fix is in pinctrl fixes as a256b8c8083e.
It is outside the stated sunxi base.
https://lore.kernel.org/r/20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com

Boot: the v6 DTBs have yet to run on hardware.

- A7S v5 booted with vendor firmware and the runtime dependencies.
  Console, PMIC readback, MMC enumeration, LED and EEPROM probe,
  and warm reboot worked. A follow-up with the EINT-mux fix read
  a matching 16 MiB MMC prefix at 50 MHz and 3.3 V. An earlier read
  from a different offset returned an unexplained digest mismatch.
- Norman tested A7S v5 with his own firmware and a 2 MiB RAM
  reservation. He verified PMIC readback, PMU counting and overflow
  on all CPUs, MMC reads and write/readback, EEPROM reads, visible
  LEDs, warm reboot and power-off.
  https://lore.kernel.org/r/CqGMQaDysL6l016qtEM8oOEnYUMKACgmwLUbb0wruVAzPcwiqrz00WCOhTrhkVEaZt1YB3xfucXdEc-ZFi-sCPgn69RNqtW0v4Gn_HjQZXs=@proton.me
- Vinicius tested A7Z v1.11 with a local 16 MiB RAM reservation
  and a subset of the dependencies. Eight CPUs, PMU counting
  and overflow, PMIC probe, MMC readback and the LED worked. He
  tested card hotplug on the preceding DTS with the EINT-mux fix.
  https://lore.kernel.org/r/20261125131435.33190-1-vinicius.eduardo.pedrosa@gmail.com
- Andre tested A7A with pinctrl and PMIC patches. MMC and its
  card-detect IRQ, LEDs and EEPROM reads worked. The external RTC
  probed and reported an invalid calendar format.
  https://lore.kernel.org/r/20261126172253.1097838-1-andre.przywara@arm.com

Still untested: physical rail voltages and CPU/cache topology, EL2
interrupts, ITS/MSI, stimulated PMIC/NMI interrupts, suspend, 1.8 V
SD signalling, A7S card hotplug, EEPROM writes and write protection,
A7Z v1.10 pull-up behaviour and A7Z v2.00.

Andre Przywara (1):
  arm64: dts: allwinner: add Radxa Cubie A7A board

Enzo Adriano (3):
  dt-bindings: arm: sunxi: document Radxa Cubie A7A, A7S and A7Z
  arm64: dts: allwinner: add A733 SoC description
  arm64: dts: allwinner: add Radxa Cubie A7S board

Vinicius Pedrosa (1):
  arm64: dts: allwinner: add Radxa Cubie A7Z board

 .../devicetree/bindings/arm/sunxi.yaml        |  15 +
 arch/arm64/boot/dts/allwinner/Makefile        |   3 +
 .../dts/allwinner/sun60i-a733-cubie-a7a.dts   | 385 ++++++++++
 .../dts/allwinner/sun60i-a733-cubie-a7s.dts   | 333 +++++++++
 .../dts/allwinner/sun60i-a733-cubie-a7z.dts   | 349 +++++++++
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 671 ++++++++++++++++++
 6 files changed, 1756 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7a.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi


base-commit: abcb290978fbfddb56fc77171918dd8b8ef3e81b

