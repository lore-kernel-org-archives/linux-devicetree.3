Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793315633;
	b=dipQYCFwwopZScnVdECrYQttx1Cr/Z43H0IKOp+vC/biOoAnJXBf5qmCk7rlPst1L891
	 /4BI7JfzAL6336rDjtmVAvo/Q5XyK4sbxLgarFJ1rovHrrKpKR51hYmGhhFYcJvrOO6H3
	 yeWhU17IFpXxeIHcyvjRR9ZbxuvCxYe0Uok7gKTHWjgG6QOVR6xX87Ba0mEA2If3fI8r/
	 A5X2upisdSRXofCbTsLE7ByQVFfxXxwajdkn89OB2mKcTVa//YBwegl2pgq08Rbvul94a
	 YgASNDj/2+AY4VFKQX/V0IFPT+K9fnzC6BLPd9DC2D7oZablWbO12I0JCR7bsM9sAiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793315633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Td9/mME215/4xVyAcQCSwVGtdaBr9meLthZDhvRiipQ=;
	b=oTZFTXQAdZgGPxw5SpvAJSbtfZ2y6x0P+VrGtxe8JXvg7X2CEPrL5aDpKrEGf4kq5gJt
	 FqWdQigHywP3QXWhWvDHouZfzRzCzcMm1j8uBX2oSwBS3t6KdW0YvVNYp7UV/S5P3LONM
	 BOXFKOYiufk5gmrhBJk3KPHY1HO54lDNazR0JQn2/dRPE2Rm5nJLofUy2BNc9UYeFVlsV
	 qYu5gRGdfPGxylUJ1sRu5lHKopz35qgxlydoImQ+B6tYXQYYAR+KaEOTQQW2tELhU9xz/
	 JRB/QwX6jEgpPj/PF88YOrkmi+KuBdFeVlgw+11p3WPppH2gasmcCaoN3LuNMChZWcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sG+dCFqL;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A48606A31C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 23:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56A48606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sG+dCFqL
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3514b90bb89so324705eec.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 16:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793315632; x=1793920432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Td9/mME215/4xVyAcQCSwVGtdaBr9meLthZDhvRiipQ=;
        b=sG+dCFqLbMKVJUT2aa8gkNLHDvSlwirCWAie2GW39VzfzUx80oVv89YQh6jW5O3vA/
         HWWP7sbGdPTRxotCJArGYZ9gAnRkAUb+TACL6Ndv7mNpIXb+vilGBHCSdB/tO1UZYwLw
         t3KBxF1HbAlBDpDMpH1n6ix1vgdpcWeTkiAwyd7TwFRVRloNLq0ac6JyBtm5kdMzSXwQ
         Phib3DXGYKYJUgIH7jVe1leunAMnBiMrA/qvZw6VXFwxuf/VgvZbyfJhfd9OaPzp1UW2
         CUbZBodLUuRCCZiHc+l14lmMxJAJhXX6TCfjO0vhu17u2ehjF+JqbhB8t4/a/kt0Ohdq
         AJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793315632; x=1793920432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Td9/mME215/4xVyAcQCSwVGtdaBr9meLthZDhvRiipQ=;
        b=JKQ7zOpLX2ipZfFqOeMLLotv9HKDV3n0bYkeWVJFgh252T4ZHg8KG84uAsx2yPI+qF
         yLxmZOmIommLstCP/mo5XKAkMTtgWKxxvOMItRkqgKr09HLHXtYIkkShyQb30nqWgC0B
         jmmEAEcwu3VzscSzxggV8RjwimyvChfVqhUrK9tUKpb84iH96XbFA9p8ijo/n5YMg0bO
         62jHZDAvLH09SrCCr5McAp+4ZUHocqpK6952DLhJMH2twXIlIupHAVQ9A+Oehi0fV+Vf
         yYfokUdzrmTKZxYJ5lk7oCwINiN2b5ENSPzoQ0r+ADAh+A0rpT0nCFPCiCCpnSPvKUDF
         mrJg==
X-Forwarded-Encrypted: i=1; AKwUvBwHCKzK0UtFsWkLCkTYJ9SgwLOrM+omm9q8YLEiQxiTVe6iUVNQmZxQG1dxEf2v6rWqJHt6daWNNhfI@vger.kernel.org
X-Gm-Message-State: AFq9FYKJKz+fZKSsLU3/AXvTUK5Gs4jDYe+SjOUn5EP2xMCpS90EeTNS
	sJt+agyFXKopJsac6DtJ1pSaq33TV/SguoeYZM/SNR4PamQFcobCJ0zx
X-Gm-Gg: AYBFou1V/KBmeT+kyde3lUGbavYf40UVjMSlQapnc91zCmzcNJymVezocRhqVTjPf/2
	lD9EJhYei57zMwE8vQjUgPJUGeDQmZuMvmwqKzzrY30spDbFY7SOppcJbOwGSJ/MbzZoM/KwkU6
	vqtYJU3SeHDhMs95/N6HXndczIa5gxe6o9IXFbw9aPMxpTDAXNk6VxMTc6PaePb9IQn9Av8/rXH
	+dPqy4gMYRPKlH7qn79aHXI9RECYzPjzszROGQlUVXOceNmNXOly5kKqsHTMc/pBVAN8dnu3X3W
	B9KQiGXUK4RRHDwSrk8dhMntSwD3BzQeDtL+4rQRsNzqUTkNjuh5zAcAjINE4PvsrbXgmHV392X
	E/qJ9ZNY23picEbuyUq1DFz22XBbLQT77Qi0UZb32r9gHB9gEMwFP1E9E8RizWKBfeP9Z7AN2Sz
	UhRC3b1UDrCPOe+KJKbr7dXPzsHG+N1NDdEXvMBrc4RUZGTVADYvIstabJQhz+das/Oe46+VESJ
	fNvOQj2JMPRtNy0mAhICz5TZ8YkccXwTfjaGWiQiAgSRwM9RaAQYJRx7hsV57V71QTBPQFRdqoy
	1L4cZE5IymOPapCt9X/2vEuIV8M9cosNd3LtgyyJpPMe
X-Received: by 2002:a05:693c:6087:b0:369:f420:8679 with SMTP id 5a478bee46e88-36a42440304mr1174873eec.38.1793315631951;
        Thu, 29 Oct 2026 16:13:51 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm1662742eec.7.2026.10.29.16.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:13:51 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	andrew@lunn.ch,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v10 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Fri, 30 Oct 2026 04:43:37 +0530
Message-ID: <20261029231339.9497-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Add the board compatible and device tree for the ASRock Rack B650D4U
AST2600 BMC. The DTS describes memory, SPI NOR, UART5, GFX memory,
GPIO names, the I2C7 EEPROM/NVMEM MAC provider, MAC0/MDIO, and both
ADC engines with an ordered IIO-to-hwmon bridge.

This revision corrects regressions in v9's compatible ordering and
binding acknowledgement, restores the revision history, and addresses
the UART alias and DTS-style feedback. No new hardware is added.

Changes in v10:
- Restore the binding Acked-by from Krzysztof's earlier review [R1].
- Place asrock,b650d4u-bmc after the aspeed entries, as in v7/v8.
- Drop the serial0 override and use the inherited serial4/UART5 alias
  for stdout. Bootloader console arguments and getty must use ttyS4.
- Consolidate the root node and order peripheral references and ADC
  properties according to the strict DTS-style check.
- Restore the earlier history and discussion links below.

Changes in v9 [9]:
- Enable ADC0 and ADC1 with 2.5-V internal references and pin groups.
- Add the sixteen-channel IIO-to-hwmon bridge.
- Rebase onto the Aspeed ARM DT maintainer branch and normalize GPIO
  comma spacing. This revision inadvertently lost the binding Acked-by
  and regressed compatible ordering; both are corrected in v10.

Changes in v8 [8]:
- Correct the validation report to multi_v7_defconfig with ARCH_ASPEED
  and MACH_ASPEED_G6 enabled; retain the DTS and scoped review trailer.

Changes in v7 [7]:
- Correct GPIOP reset/power/NMI button/control names and remove the
  obsolete F5 reset name; leave the binding unchanged.
- Subsequent review requested the validation correction and carrying
  Andrew's review tag forward [R4].

v6:
- Prepared locally only; no public submission. The sent version number
  moved from v5 to v7.

Changes in v5 [5]:
- Add I2C7 EEPROM/NVMEM for MAC0 and select rgmii-id.
- Use the standard OpenBMC 64-MiB flash layout.
- Add initial GPIO names and the reusable 16-MiB graphics pool.
- Drop the previous RX-delay-only justification.
- Follow-up review requested GPIO mapping/style and threading fixes
  [R2, R3]. Andrew's Reviewed-by applies only to MAC0/MDIO.

Changes in v4 [4]:
- Correct memory size to 512 MiB and add explicit flash partitions.
- Report RGMII traffic tests and select rgmii-rxid; that delay rationale
  was challenged and superseded by the rgmii-id selection in v5.
- Order peripheral nodes alphabetically by label.

Earlier public submissions:
- v3 [3]: board-compatible/DTS series. Krzysztof supplied the binding
  Acked-by and requested preservation of review tags [R1].
- v2 [2]: early board DTS, including UART5 via serial4. Its complete
  per-version changelog was not recovered; the archived patch is linked
  rather than inferring an unsupported change list.
- Initial submission [1]: board binding/DTS, with QEMU console and
  board-identification testing reported in the cover.

Review tags:
The binding carries Krzysztof's original Acked-by address. Andrew's
Reviewed-by remains explicitly restricted to MAC0 and MDIO nodes;
no complete-board review is claimed.

Validation:
- Compiled and schema-checked the v10 board DTB with multi_v7_defconfig,
  CONFIG_ARCH_ASPEED=y and CONFIG_MACH_ASPEED_G6=y, using
  arm-linux-gnueabi-gcc and dtschema 2026.9.
- dt_binding_check for arm/aspeed/aspeed.yaml completed without
  diagnostics in the reported output.
- CHECK_DTBS=y reported no board-specific errors. Two unmatched-schema
  diagnostics remain for inherited aspeed,ast2600-lhc and
  aspeed,ast2600-i3c-global nodes.
- Strict dt-check-style and whitespace checks passed. Checkpatch reports
  no errors and one MAINTAINERS reminder for the new board file, covered
  by the existing Aspeed directory entry.

These are DTB/binding checks, not a complete kernel build or boot test.

Both ADC engines, twelve configured voltage rails and recovery after BMC
restart were tested in a custom Linux 6.18.24 OpenBMC image with the same
ADC settings. That image has separate power-control changes, a different
flash layout and ttyS0 console configuration. The complete upstream DTS,
including v10's ttyS4 console selection, has not been boot-tested.
Voltage scaling is userspace configuration outside this series.

Base: 8db593481c8669eddb8b4e21ea44f3fa11d9f030, aspeed/arm/dt
https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git

Previous submissions and review discussions:
[1] https://lore.kernel.org/all/20260512175019.47548-1-prasanth.padarthi10@gmail.com/
[2] https://lists.infradead.org/pipermail/linux-arm-kernel/2026-May/1129461.html
[3] https://lore.kernel.org/all/20260518033440.17569-1-prasanth.padarthi10@gmail.com/
[4] https://lore.kernel.org/all/20260830182036.284736-1-prasanth.padarthi10@gmail.com/
[5] https://lore.kernel.org/all/20260915013110.4780-1-prasanth.padarthi10@gmail.com/
[7] https://lore.kernel.org/all/cover.1790079398.git.prasanth.padarthi10@gmail.com/
[8] https://lore.kernel.org/all/20261002062933.26497-1-prasanth.padarthi10@gmail.com/
[9] https://lore.kernel.org/all/20261027034911.99482-1-prasanth.padarthi10@gmail.com/
[R1] https://lore.kernel.org/all/20260518-rustling-watchful-viper-b9c4b4@quoll/
[R2] https://lkml.iu.edu/2609.2/00630.html
[R3] https://lkml.iu.edu/2609.2/00642.html
[R4] https://lists.openwall.net/linux-kernel/2026/09/22/1982

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
  ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 169 ++++++++++++++++++
 3 files changed, 171 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts


base-commit: 8db593481c8669eddb8b4e21ea44f3fa11d9f030
-- 
2.47.3

