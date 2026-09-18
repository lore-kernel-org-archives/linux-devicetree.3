Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACBD51C077
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 17:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789752731; cv=none; b=ShlY5uqSKShH/Uc0n9abaiY3ex4rwFgn26QxCIltTvBxa7vN6h4tHOEYoE2bf4dAP5D+Iqv2M9Gr9EENl3ZS4S38gJrs47RPzXCLjf/0pFHKS53aVKWn1vjlHs+lpPXOXC46Ftrb1jFbSDbO4WPt/xWP61wShitDcQKOcJE53UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789752731; c=relaxed/simple;
	bh=XOPE3IL86qyJbN5cJGx2kD6c/yizOWQaQkth3iC+q/k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pzh+CgfD/s6vIQgD/9bfkhWWQP0rXvKPQqUiXvcAk/V27ruuEiUFb+6Jm5UdTd3xmnti1m0b5x3fX90iHlrh8nIOvZJGnJDEyoJOrtk4UU2YOfJz0m+wPUbwETov/YXOq0vEHr+ZMJcxwBCxYnUZHlA5+U4iG+jiDCdjvW4ykmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wNxz3QFv; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wNxz3QFv"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a98604f6b4so1433840a12.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789752722; x=1790357522; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5Fj2jZLnQ7TpyXdnR1swldJeKb4aiTIX6mNwExFCwZI=;
        b=wNxz3QFvUcgWyUG3fKc/VXGmDkUPcojFi4+h4KMGnvwyISplC1AzZvu07r0Z1eT7RJ
         2rMspslGDdnwAYpNKAKc/7SLNbv+1Bdq5uPOKRbKxAlFb3K/QfjR6brsquHZhnQUt1Xn
         +T+gT82SlJgDdm0WQvaqrPTvq6quK7bsBv5/74TMpA0vW9mspiU/ZHzBq3etnnFNaajt
         sfDREl4/DOgITP+rXOlzclp13/6LatEA1n8YzpjgvwgjOrElblq5ag1BYLv8pumnapFi
         wh8uzvws4cxR+WPWgqDRnwOScqRMw+BhVXMwY105VuJkMwp8mSzSrEKaAkDM26EMbezQ
         WrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789752722; x=1790357522;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5Fj2jZLnQ7TpyXdnR1swldJeKb4aiTIX6mNwExFCwZI=;
        b=v2xpiuzOkh6yvgko9QUxRozLJBkPyVQV+BfigR9Dyp2QjQAPRI8gt4jse1wivYRuse
         aoDUQ9j5ybjZMOSX6hA/D+GIdBNEdCRaUG4hHYuXkYsYjWPg0Bo377cpQ5aHcQ+39QSJ
         IsK4KtU+GFK9V+PHdLV83d6AJB4RVvO+HH0o4TNSdnhch/uZr8Hww61DqjgO4VscHjFS
         A+YPgPu15Ayag100evLPBLACyYVVk2JIN5hXsxOJMxV2tsjHvQ9sY9EydF69QCUxAHk4
         PYhMPD0icj5U+s8Aia5QmKi23vbx0Yjt/FwFzOdcW31NO/rEeH9DBwqUwP4UUc/0BYjs
         GmCQ==
X-Gm-Message-State: AFuF++mUdv4g1lfXrT0bDs6gZDXFg23eUr0PAU0mtNrq3e2mibl+QJvp
	hh25I9Qi1jML28SLqnmGwBDyt1oGVYDO3T4BqXPXZkB3gT6D2Pgc4zob5qkbq3owTQCBQ9uIPO8
	UvRUNBqQ=
X-Gm-Gg: AYBFou2Vk6Ckn2ar8OZeaokNk8AwQu+Ro26aYir9Fno5KbzAS104fG03ug6NKFOXPd0
	os8GksoKnB8i7sbk0Te+p458Ev/oOwq99cO1FhqqAzyNpU6/GVpf+0D+69F//BXrVCVOMlZ6kD8
	aapJFt6I0DXFSQXF1Yoihe5O2LDOTbWPloRO1uuzEnSTv6Q+pNijg0AcHfOva8yJ3/sYPEPN45A
	5Eqi6a8RejnYRQWacsk4bqrTPU1KLOOVl3s4XdY7SEqbzgZDpRTm3Tn89Sq2FkrP3r0zuQyTdyQ
	88nwPjaIYsv8/M10gV4FtI9TFqjAQyQkQWyyB0qtA8X4SfIiFuz/miDrT/KAbrHwPAohibQ1ejM
	4sreU/WFVl8hmSG40SYLt8Es17j3o7DKnqwjphEz24ZD6OEbuW/T28GzT6mq5MSHbDy7lwVrozE
	iAPbMkgyRgN96VEze3L4KJLoyEhYsbcChcfY37t7LLf6tXe0X+K5mkjiInwKXFpm+0mvZHdc79Q
	83GdDwe+ZlswFkxJxHirmBsiPHxnYItcv0ztpySUmf4rR+sX+rN0TSd3HZ2TYSq5g==
X-Received: by 2002:a17:906:9f8b:b0:c29:d96a:2ea4 with SMTP id a640c23a62f3a-c2a15cdd07amr320293666b.26.1789752409161;
        Fri, 18 Sep 2026 10:26:49 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a35701d8bsm902966b.27.2026.09.18.10.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:26:48 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v3 0/4] Add Laguna/Tensor G5 SoC and Frankel, Blazer &
 Mustang boards
Date: Fri, 18 Sep 2026 17:26:33 +0000
Message-Id: <20260918-contrib-pg-pixel10-initial-dts-v3-0-c94e51140509@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEl0rWoC/4WNQQqDMBBFryJZd0qMNcGueo/iItFRBySRSQgt4
 t0bS/ddvsfn/V1EZMIo7tUuGDNFCr5Ac6nEsFg/I9BYWCiptDS1hCH4xORgm2GjF65FkadEdoU
 xRbh1U4uDbo3TWpTIxjiV2Xnw7AsvFFPg9/cvq9P+0kr9S2cFEhrrLHamNhO6x0recrgGnkV/H
 McH5TvAz80AAAA=
X-Change-ID: 20260710-contrib-pg-pixel10-initial-dts-49f5ec657b66
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 soc@lists.linux.dev, Douglas Anderson <dianders@chromium.org>, 
 Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
 Brian Norris <briannorris@google.com>, 
 William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-serial@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Brian Norris <briannorris@chromium.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6718;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=XOPE3IL86qyJbN5cJGx2kD6c/yizOWQaQkth3iC+q/k=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqrXRWGUAsV+TN7JxOKwWu/DvMXO1F1wfcX/Q/P
 bKZ8Ay1GdGJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaq10VgAKCRDO6LjWAjRy
 uoAcD/0Qq0IPhKUz0Xg2lFElXFQIYbQJaNLysMPHdQIInA0aBfO2CBq5ALK+xKbJwnaA+uDbqRD
 hgrPb8df5nlyx6E76saVZWV4obrZNCZVGdSWQoQp7sUJ56zCNdjP1fy1/ScQDlJY/KtwkVDlLR6
 mvRVxhzJ20CJ2bEsOdmPFROgKt2iTC9gSoppU7g/WYT652RYezM//MorJe7XL61hj/5eloy7NaX
 9VRVosZ0SjR65zwkFXyq7kYbloMTsLfCosL2dn1AziduqXSU80vjUpMkda5tmeaenb38cykd7rB
 uXPMseu0wp82TX1z1416tDFsr/MeKjJP+HKmkX7dLHo8NULBCDJSp6JjZ290I/kzMZApWEmxQXm
 CnTYW9OtwsYikB51zwzeV2hrGvtyYXH9ux5Ka9fSyEx4d9DVvlRXGMqALesc+NGVnbdhndKORYc
 CK2mdf8S5quZJotJaJqyZrR6InRWkPWfPa1R9dFvbMihjWgL17VOvADE7eCk+oxE95lS9+orlp9
 EqZNKtJf4wzjFp8+CwQ0YyPKzgXzdr9uAOjw+uD9qs7e+MAmVFwXvN/JZhiz5NZw8toSbiAJ1Js
 T6HamlgGaG4RnkqlxO9fEt0/ve8IKsxkNwAZJ9kcm0S3PFUYejFTYcZTzf3LaWrK2ypSRixKRjJ
 ik0P273HRtGp8gg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Hi folks,

This series adds initial basic support for Laguna (Tensor G5 SoC)
found in Frankel (Pixel 10), Blazer (Pixel 10 Pro) and Mustang (Pixel
10 Pro XL) phones.

Whilst Tensor G1 to G4 SoCs (found in Pixel 6 to Pixel 9 and Pixel
10a) were offshoots from the Samsung Exynos family. Laguna is an
entirely in-house Google designed SoC.

Currently this series adds very basic DT capable of booting to a
initramfs busybox shell and is a v3 of Dougs original v1 submission
with the contentious DT overlay parts removed.

Whilst there is still interest in resolving the DT overlay topic (as
I believe many vendors use this approach). I would like to decouple
merging initial Laguna / Pixel 10  support from resolving that
particular issue. I believe Doug intends to revisit the topic again at
Linux Plumbers in Prague later this year.

In v2 I've updated to use the usual upstream approach of having
individual board files e.g. lga-frankel.dtb, lga-blazer.dtb,
lga-mustang.dtb  the same as gs101-oriole.dtb and gs101-raven.dtb.

It is worth noting, that with what is currently supported upstream there
aren't any known differences versus pre mass production boards yet. So
lga-blazer.dtb boots fine on my EVT 1.1 board with A0 silicon.

At the point where differences do arise, we may need to either add A0
silicon cut and other board variants upstream, or keep upstream as
purely MP/B0 silicon and maintain a separate out of tree DT that uses
overlays for Googlers needing to use pre MP devices. So far at least
with Pixel 6 that wasn't necessary.

Folks interested in trying this out and booting a pure upstream kernel
on their own Pixel 10 device may wish to use the build system and docs
found here:

https://gitlab.com/LinaroLtd/googlelt/pixelscripts

Example commands:

make RUNTARGET=frankel flash
make RUNTARGET=blazer flash

Also in v2 I've added support for ramoops reserved-memory carveout and
tested with `console=pstore` kernel argument. Additionally carveouts
for the ABL bootloader are added (which is used when doing a debug
boot (e.g. after a watchdog timeout). This allows for the extraction
of various logs via fastboot oem commands (bootloader / kernel
logs). The bootloader log can also be quite useful as it contains some
amount of on device debug parsing which can provide some hints after a
crash.

Note: In v3 the ufs0 alias has been removed but the bootloader will
consider a missing ufs0 alias a fatal error. Whilst we wait for a new
bootloader release that changes that behaviour (kudos to Doug) the
pixelscripts Makefile [1] will apply the node so that upstream DTBs
are kept clean but things still boot on the device (see [1]).

regards,

Peter

[1] https://gitlab.com/LinaroLtd/googlelt/pixelscripts/-/commit/156bd361b39c55303cb4de33cd66ace9b1f610f2

Changes in v3:
 * Rebase on next-20260918
 * Collect up Reviewed-by / Tested-by tags
 * Use 0x0 instead of 0 consistently for new code (Krysztof)
 * Remove 'ranges' from gic-v3 as no msi child node with unit address (Krysztof)
 * Remove ufs0 alias and ufs placeholder node (Krysztof)
 * Remove memory node from lga.dtsi (Krysztof)
   It turns out bootloader adds the memory node anyway
 * Use standard '/ {' not overlay style (Krysztof)
 * Update alias to point at label (Brian)
 * Remove GIC_CPU_MASK_SIMPLE for gicv3 interrupt controller (Shashiko)
 * Fix dt-check-style --mode=strict warnings (Peter)

Changes in v2:
 * Enable CONFIG_ARCH_GOOGLE in arm64 defconfig
 * Remove all the pre-production dt binding support (EVT, DVT, a0)
 * Remove dtbo overlays and add individual board dts
 * Update to lga-pixel-common naming like gs101-pixel-common
 * Reorder nodes alpha-numerically by the node name
 * Add ramoops reserved-memory (tested with console=pstore)
 * Add reserved-memory for bootloader & gsa logs
 * Add reserved-memory for Android BootLoader ABL (used on Watchdog
   reset to extract boolotader logs / parse breadcrumbs / ramdump etc).
 * Add osc 38.4Mhz fixed-clock

v1: https://lore.kernel.org/lkml/20251111192422.4180216-1-dianders@chromium.org/
v2: https://lore.kernel.org/lkml/20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org/

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: André Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Walleij <linusw@kernel.org>
To: Drew Fustini <fustini@kernel.org>
To: Kees Cook <kees@kernel.org>
To: Tony Luck <tony.luck@intel.com>
To: Guilherme G. Piccoli <gpiccoli@igalia.com>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Juan Yescas <jyescas@google.com>
Cc: RD Babiera <rdbabiera@google.com>
Cc: Brian Norris <briannorris@google.com>
Cc: William McVicker <willmcvicker@google.com>
Cc: devicetree@vger.kernel.org
Cc: kernel-team@android.com
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-serial@vger.kernel.org
Cc: soc@lists.linux.dev

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Douglas Anderson (2):
      arm64: dts: google: Add dts directory for Google-designed silicon
      arm64: dts: google: Add initial dts for frankel/blazer/mustang

Peter Griffin (2):
      dt-bindings: arm: google: Add dt bindings for frankel/blazer/mustang
      arm64: defconfig: enable Tensor G5 SoC family

 Documentation/devicetree/bindings/arm/google.yaml |  48 ++-
 MAINTAINERS                                       |   1 +
 arch/arm64/Kconfig.platforms                      |   8 +
 arch/arm64/boot/dts/Makefile                      |   1 +
 arch/arm64/boot/dts/google/Makefile               |   6 +
 arch/arm64/boot/dts/google/lga-blazer.dts         |  15 +
 arch/arm64/boot/dts/google/lga-frankel.dts        |  16 +
 arch/arm64/boot/dts/google/lga-mustang.dts        |  15 +
 arch/arm64/boot/dts/google/lga-pixel-common.dtsi  |  22 ++
 arch/arm64/boot/dts/google/lga.dtsi               | 413 ++++++++++++++++++++++
 arch/arm64/configs/defconfig                      |   1 +
 11 files changed, 527 insertions(+), 19 deletions(-)
---
base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
change-id: 20260710-contrib-pg-pixel10-initial-dts-49f5ec657b66

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

