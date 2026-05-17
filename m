Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE4570830
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 03:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778988411; cv=pass; b=i+ZJGoUaEz4iQh+0GYQO305hT8N3ZYwYSYOsGX7WA2Irmtfk+hQPiyGPMRvvNLYno1RvqPG7ptu0/tyfp34+HVeCY8WsnNb+zyBiJTz6EKr69IpJlDnHcwwnP97nYB7X3MJgoW74XkCBa+x/Wrbn+rpnitHMWEFQmtFyol5AKsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778988411; c=relaxed/simple;
	bh=PpBuX4SSA7P0CsT+tKuq2yy0xJjsWWKG3+q3THaUKuQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=czbnObkA/Vyf3t3DiXe8BnOEpPiyS8hwuBKh+NletQJ03WzURE7bxxGjWRDqgGNFbrEIpvbaiJ3+pqYqAVP9PIjpslbActskfVksiRpb0UsP9RB6bHDXyDsC5b5l4//ophuSP5w/trDta2UxJD6XwxJxlS8YGfIdaxaIOZchxhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhstQFDB; arc=pass smtp.client-ip=209.85.167.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhstQFDB"
Received: by mail-lf1-f67.google.com with SMTP id 2adb3069b0e04-5a8891febd2so1598383e87.1
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 20:26:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778988408; cv=none;
        d=google.com; s=arc-20240605;
        b=LV95IsfAiBQmDGvn3z/F6loltSPmh22rSIMcD1G+uSM8nhGGlnkRbEDJE2p+gdnlPJ
         Nnm2G0VEG92rFlDaGhAf+EsEQRwvdRrkSv0HTOleFnWyFSiy4WIU/qkSswAEler1bHUT
         4sdOZg9ttXKcTSV3H1VMShsH4cWr2H2/ZqC70dHn14Kh9EfE9LUyN7fgFdBms8GK1z6v
         29Xxi07qfJ+ywZgM2+yU7opgTBaWOevkJoD00Sj9XLK5PMvtn4cbQjjizqxKB9PDgv3b
         IeyyVU2G5Kyk87FyMO7VubhB3bMJ5lYuEQ3LhETzCAXycvwF+Hr7TNWTk61SMMUNWWe/
         GcSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=71aS+1qGdtfHf6EmkyoA4cYy8RqwmM8JopMl5kKAswg=;
        fh=xinSYdsNEWoxDqxtubbDOPEYdi8dHtB29xPzbI6oc6Q=;
        b=EUYzlN8O5St7RHKxwOoRfui27dfWj7W0eBuOv3WjixX8MLQqbvsbXGDX1hG3o+ze/G
         f5QMdeR5849yhZa9KfbMiUnlFEDjm6WTjLqX+YdC/8Rk42ICOjmzj1eNRLqH4p5xGamw
         yw/XDDgQ3Aw6wYXbteo6LITK9dh7p7RpC6af6bySk1DjaDZuajudDyApzYHaxGumaVni
         YjjbNTYZBgHpUI1t6cO/NFOMzmkUPJ2hAJ4otuHmC5Qc9NUpYMIB/yqoCppl6Zo5VeU8
         PLVs3ZD18dcTfdEWJFRl8qIbwg9iScuStb2YRBMJvAvNMXIhXvPOaniMGviRvaQRWKDi
         E9vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778988408; x=1779593208; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=71aS+1qGdtfHf6EmkyoA4cYy8RqwmM8JopMl5kKAswg=;
        b=dhstQFDBvMnm0UGBrF3HOepcmetWFFLUm62aaOKkbta65gHANdAl9k7g72w9uTIhlq
         u7Gd3oH4uTPVmwkhGaOvK/j+cqTN8nPqPg2sunAYp7ixfK7KZP3uXv0QMo7qTnuO+0CF
         1G9V3ViWmzKe2uOEd1xGPOz4F+E8mKj+Fa3r/7S8GLhzhU1R2OXdEuqp1b1+w6zK4+AB
         pb9ECrxkXDN5bLMeN+mvWJMSUppuxm6Z5dwOakWthao0YOj7yjPG36dsPcULmYKZf8v0
         e6HtgfzXCbPrtw1G1VBeWr2ZIOKyz7Lz88H1Cr6s87dPEjMlZH5o822romIvvnrLT9PD
         bsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778988408; x=1779593208;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71aS+1qGdtfHf6EmkyoA4cYy8RqwmM8JopMl5kKAswg=;
        b=iusOoIXIntY66HiXZpzbkW4BpM1nxEplN1bBwOhr/kgXXHSrgzcj0jDUnst9Lt7Qlc
         NW4lRiGPEgV6b9ByySdBTd4PompHUf68Nyd7P8RVfoYpTI8/4w/kveylbK5inRtROZVX
         j91GmvA6zH9/9GwgU2Bb3qnUht+2nKQpuv+RyWroKc2Xx2wjO3n1V9Gza860cmo110wW
         ou6OhVa4mC3cohTMh5cHNfuErFtzLpwr5hyI+n1VulstWPMqsfc+xcG5587He+/5rvMV
         xwPXeJU7+9BrKT0ZACGsaXIQG7+SXmeQBPx6GaF4Bcy7xLqKc52Q2rpfRd5kedBNDMOA
         +FBw==
X-Gm-Message-State: AOJu0YwCSmP+WnlNhInk3TObqoNYH1bImtwnuqZ/5/znxSAmMXzdgh8K
	oIn/5pb0RxVOmX+ecQkHPi14PUEQLAYb3FuMBsx8lsWHmiGDpXbQg2RWDYs+GfxugfE2GoM7txu
	Na3T39PXq9l7oaYNolsGqr7p+IZaDVeWZIEvPVRgO/Q==
X-Gm-Gg: Acq92OEmLKMpgi5pdpCHtA/c63iGtfCuqZYTO3BYXc94h3wgd06RZOE+TpTkiGwHOCG
	G3n65PMB/1Lg5ChNyw9iZ+jz+HdkbTfjC0vzSz4Qq7SWR4yikzTYt9liW93Xvj1EKCB9RnvgIzF
	z6N+hXYtJSdaBiHnXkT2/aQqnc5cjxQJI1XUb+oiAlRqoXytsfKGPiO915JA8NgLJTXwUPqpqnM
	3kFBl1sudHWoNqf+d+FB2sIHXwkg7yTNgOfFsGh2DJQteRsWw2JTseXc1kpsq7XIL2/WPjMScHq
	RTC59wJRA+XyAVnrOpr5ChD/E4XeSgEbNjmJXEOge08IXaOGVyQnkGxeLa10z0aMg6Kz4MsOSw=
	=
X-Received: by 2002:a05:6512:39c3:b0:5a3:ffed:8443 with SMTP id
 2adb3069b0e04-5aa0e75782amr3358434e87.23.1778988407787; Sat, 16 May 2026
 20:26:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ga Hing Woo <huhuvmb88@gmail.com>
Date: Sun, 17 May 2026 15:26:35 +1200
X-Gm-Features: AVHnY4Icbi3ZF704jZGcyMxf6XcvdjbQupoZouzSLylCd5-xr3oSnzmcFutve60
Message-ID: <CAECiUCvN-LDdv1jeWRfQ85qAq+fOcY5sj=QTp7G6J4tzOAZskA@mail.gmail.com>
Subject: [ANN] socc: static analysis tool for hardware-level DTS consistency checking
To: devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I=E2=80=99ve been working on a tool called SoC-Consistency (socc) that trie=
s to
catch a class of DTS bugs that dt-schema cannot detect: problems that are
schema-valid but physically incorrect.

The motivating example: an Allwinner H3 board with vcc-pc-supply connected
to a 3.3V regulator. The DTS parses cleanly, dt-schema is happy, but the
PC/PG IO bank is hardwired for 1.8V maximum. The result is silent IO pad
damage on power-on. The tool catches this as:

[ERROR] AW-202: 1.8V GPIO bank (PC/PG) supplied at 3.3V
Location: /soc/pinctrl@2000000
Impact:   Silent hardware damage
Fix:      Connect vcc-pc-supply to a 1.8V regulator

Other things it checks:

Power supply chains: missing regulators, circular dependencies,
IO-before-core sequencing violations
Clock trees: cycles, missing providers, frequency mismatches
between consumer and provider
GPIO: pin conflicts (two nodes claiming the same physical pad)
Interrupt routing: missing interrupt-parent, wrong IRQ numbering
for the GIC type in use
Bootloader vs kernel DTS diff: memory base address divergence,
UART console mismatch
Vendor-specific: Amlogic AO/EE domain crossing, Qualcomm GCC
node absence, Rockchip memory region overlap

Current SoC coverage: Rockchip (RK3588/RK3576/RK3568/RK3528/RK3308),
Allwinner (H3/H6/H616/A64/A527), Amlogic (G12A/G12B/SM1/GXBB),
Qualcomm (SDM845/SM8250/SC7180/QCS6490), NXP (i.MX8MP).

The tool is pure Python, works on preprocessed DTS (after dtc -E or
clang -E expansion), and outputs text, JSON, or SARIF for CI integration.

pip install soc-consistency
socc check board.dts =E2=80=93soc rk3588

Source: https://github.com/gahingwoo/SoC-Consistency

I=E2=80=99m particularly interested in feedback on:

1.False positives you hit on real boards =E2=80=93 the voltage threshold
heuristics and clock frequency tolerances are calibrated against
a limited set of actual hardware and are likely wrong in edge cases.
2.Rule gaps on platforms I haven=E2=80=99t covered well =E2=80=93 NXP i.MX8=
M rules
are thin, and I have nothing for TI AM6x or MediaTek yet.
3.Whether the approach of requiring preprocessed DTS input is
acceptable, or if integrating a preprocessor step would make
the tool more usable in practice.

Thanks,
gahingwoo
