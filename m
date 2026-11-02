Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649211;
	b=PszwCWElHiRsiQJhF65DPvFYvqckRVP5CQxLwC5P5fhaqfIt18Gzt36vrTLPr2mDx7aF
	 fT8nYLIwojx2bex8bKkeQwvWyLzGUsMSqy80gXjheorC0iUTi4X3FA+XyOYSw1ZPrUyhb
	 eRx8iXgTIvT7HXyb7sOiJtj2fBYZ26Hn3BP8U+fiVF/aVoRpj6V8DSkFKKXAP2l4CjWG8
	 xpF41NxuAqcMT/JvQ5n1Wow88dkRX+7GqSTDjQfpLpg4+NPpZauh4rNdJdPnZlFU1zplf
	 SFiOH344etcU922Z87xvZZ1OJYnvAgzS7WKwd5XR4zVAaK7BAB1skWfbzAlL1ZGmpVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=EPAaZGGNqSI21QfU7ABn/z/SpscZtlkI0gz7OCGQWww=;
	b=z6c/Y1kvaOmIRAinJNVffxbhvYaMjSI6X8pj0v/PyVi3QhwZlM886Tx62zJxlUJC58Wf
	 TS/Jwj/1P6Ig2GDRX81IvGb3zVphNBNIt7gWta+e4OLL1p5z9GIWer8t8cDt2gmAR+hRV
	 WWkZ9v9LPpayHkPrqUcaUEPr7A+X1Yix8/mcwHnrb5OA26WIKa/BSLfOr5ZMIRKzGU2DC
	 d72D/rS8ZGrMwht7159fap31PBaa6P5wENkOOHaYXzhlZsDIKIIjARVM9VG+/w6GnFtU9
	 DodZGg3GPtXUEDPokjCdsrQjWjy3rHdkFgiR3hdlYxPhz1tsHF2n6hXfCcpa1Narcew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=agc3Jpo5;
	arc=none smtp.remote-ip=74.125.225.65
Received: from mail-wr2-f1.google.com (mail-wr2-f1.google.com [74.125.225.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A982606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 19:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A982606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=agc3Jpo5
Received: by mail-wr2-f1.google.com with SMTP id ffacd0b85a97d-48e293ecaa7so1001964f8f.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649209; x=1794254009; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EPAaZGGNqSI21QfU7ABn/z/SpscZtlkI0gz7OCGQWww=;
        b=agc3Jpo58I2Ixi+BIEmWgYoFinqVJUJ4O/KwM72mfQz3ih5s+ae9tfOY4C+cPH19ep
         xSFvRGf0BpJmP1P/MWDCxt/f/P8KHkLMEPVzw74V0wWgVwaHeeY2eoRRytvgcWX8n3Fw
         zqumVZ0jwTwUmO/MhmDXIll46z7z9wZBMaF1BC3oJpuDHdrRhLQhjBpyygO8M3RxEpil
         2sT36+Uus9pnD8uMJsvC6kTvngkhL32fuDmdtly9fip66iaITsrrCTFgH1/EIsMDSAW/
         cWjPE5Ct86G4KBjVmvfMov7shc7/kwVT42RPFEWFDlu9d3D3E/9zyomY9YNoc/laPRie
         Rw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649209; x=1794254009;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EPAaZGGNqSI21QfU7ABn/z/SpscZtlkI0gz7OCGQWww=;
        b=O+c1aJsC7Kgs73wdjOVe5KFXhcgfMMv2AlTDgPvAIAjwjXbEteEs2CsEKynnquOElF
         UAcyTV9zqgFIR2tA1qM1nIT7htvvyllcwaxQrH7CZWoIc8qaw5RLfycdFGAkiZuyrX/s
         dC6KQpC3gMZljNgiUzTtHk3tyA0vzicrcGFyTg3aZ6lDYP9nRhsU/ozdjWku4r2R5xt6
         n+r7C2kj6ufIU6DP9nBZ5x2zsW0pKlvcSQYGZaFcOzt9/JlZeENBcCmhbzSuy12rrn8l
         +a97WEDT/pGPu9jDHwKcrCg7REwI42ULbNmVeDNsjcfif4aSxBdJ+UlV8ArGAOlBqgqA
         XxlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGkHMY+fc5KtDleSieB4X5rXnuJ0vf+NCsWqSSkf8cFtQYaYnWHC0os3u9QkeB2FfCty8+mkpt4fKn@vger.kernel.org
X-Gm-Message-State: APuU4Z8XRl17Yiw1JNK5UdFf7IWVvE6Cjk5o/rgigYzVY0V8fZOdYdTL
	Di6lEyBRT13dRdlIOFsedkJLEFYBEE5ie2MvYkHSK4JR4cWUF3hDGoxpLO/efJkcRqs=
X-Gm-Gg: AYBFou3IHccdP1ScTOxOEisT9tucu5g/N4WgQplcgR9igYIfwv3kkBpzNDFXuL3lXlH
	F+rZkarzap7ZQLB6WzT1USO/j3vSHECSTjmCIffl+4kpJvlP9beJN0q4V/5gP6Vkhp7u3LoPrb5
	RBZbjYSkKPUizj+Yo8hRrLjRWgtJD3qdTHOrrXa3+udswHmAmwEZ7DXGry8ggdxZNn0VETPYb3m
	58DhqZqyz2dKfY3PfJ8WY7upN4RXTx7MP3r7BtaHpojRVw+6R6IzrfMo7zkGFRHPXcxsMYo+xyw
	wrknLZAdI6V2xiqcDJZLWtCa3BFhgxIwvJO+0Q96+voPMkoA5KV1FGIbDJ9ycNEVJjblwfchvj0
	FDj+3u+JcZ41tcUhJN8AulcYuSX8AaOeJX/63qF9Y66VuEQbX0L/X4huyDMTKUBHhB+kMPn2RIg
	akgjMUqTzjGZi6W8KdnV+IPp2RDMqkA4EF6MjYr7PJEKxeVmlCqD0Y8pnKzygYjornFYkWmB6sf
	7L6BwkvGfSq1XfUYX5eqf4AUKEx9yg7ZWMTlTpyYeMeMAKa1HAdNuKIIStTJG7c+nI9jVpQncS0
	qZvk5w3uUpVs6lPH1AvX3RoLsq1SYOTjMc+MsGvoNhZc0EdgPosnOsdovLr3JtgIDr8gLXknxTQ
	kcOO3B5g5SShH2TriKBIYGX/0KpU=
X-Received: by 2002:a5d:44c6:0:b0:487:a15:b4cc with SMTP id ffacd0b85a97d-48e6e4fad74mr19327972f8f.23.1793649209253;
        Mon, 02 Nov 2026 11:53:29 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:28 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Subject: [PATCH v3 0/9] ARM: dts: omap: dm816x: fixes and peripheral
 updates for DM8168 SoC
Date: Mon, 02 Nov 2026 20:52:46 +0100
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQ6CMBCG4auYrq1ph7YWV97DuIAyQP2hpMVGQ
 7i7BWOiC5ZfMvO8IwnoLQZy2IzEY7TBui6NbLshpi26Bqmt0ibAQHHGJe2LwbQUr4PzklZ3zZW
 m1RAoiDKTRjOe14qk795jbZ+LfDp/dniUFzTDzM0XrQ0JeS3pyOe7b0WtViKnjJbCYMaA7xno4
 812hXc75xsyZyL8QKDXIUiQkEIIyEFyhD9omqY3MYyDOxoBAAA=
X-Change-ID: 20261015-patch-ektor5-dm8168-dts-24b35c8019f6
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=2941;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=/zToKwQTm1t+VyPJvHbpStnNft3Pne07RC2dktu4oxk=;
 b=G0KWPNDEdZFaQJ1h9rp2gNIuq5r/X6WNHQpFFKlZFbFyWDTVZqmxnjbGt4Z4C2+kJeiZr6TcZ
 C/pGNRbhFcuCtpX9ipEFYMG5d03ldaCXX/ODi1VObVVP1auFfkjOCrI
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

This patch series collects several fixes and peripheral enhancements for TI
DM816x SoCs and the DM8168-EVM board:

- Pinctrl: add correct pullup/down enable defines for DM816X SoCs, which
  they appear to be inverted respect to OMAP2/3.
- SD: explicit pullup disable in DM8168-EVM SD card pinmuxing.
- Storage (MMC): Update MMC node settings, dropped mmc1 hwmod.
- USB: Update MUSB node, enable multipoint mode, dropped usb-otg hwmod.

Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
Without upcoming Andreas's patch (not yet on the list) that silences the
WARN() for the missing hwmod from DT, commits in between the hwmod DT
and the code removal will get a harmless WARN() during boot.

Tested NAND on DM8168-EVM, seems the pinmuxing is working fine.
GPMC_WAIT is left with the pull-down enabled where a pull-up would be
preferable, and GPMC_WPn is not muxed (reset default). Neither causes a
functional problem.

Changes in v3:
- Collected R-b tag from Andreas.
- Split "Update USB node" to have separated hwmod and DT edits.
- Removed mmc1 hwmod, splitted in the same way as USB.
- Reorder USB reg/reg-names to match the binding, rename nodes to the mc base address.
- Dropped patch "dm816x: Correct speed for sysclk5", it requires more
  investigation.
- Link to v2: https://patch.msgid.link/20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org

Changes in v2:
- Removed useless "Prevent USB being put into idle" patch.
- Dropped "Match up capability flags for USB" patch.
- Refactored USB node patch to use ti-sysc instead of usb_otg_hs.
- Added "Remove hwmod code for USB" patch to complete the ti-sysc
  porting.
- Using DT include instead of dt-bindings header, dropped patch.
- Link to v1: https://patch.msgid.link/20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org

---
Andrew Goodbody (5):
      ARM: dts: omap: dm816x: Fix pinctrl range
      ARM: dts: omap: dm816x: refactor and align MMC node
      ARM: dts: omap: dm816x: Update USB node
      ARM: OMAP2+: ti816x: Remove hwmod code for USB
      ARM: dts: omap: dm8168-evm: Correct SD card pinmux

Christopher Obbard (1):
      ARM: dts: omap: dm8168-evm: enable MUSB multipoint support

Ettore Chimenti (3):
      ARM: dts: omap: dm816x: Add specific pinctrl config defines
      ARM: dts: omap: dm816x: use dedicated SoC pinctrl
      ARM: OMAP2+: ti816x: Remove mmc1 hwmod

 arch/arm/boot/dts/ti/omap/dm8168-evm.dts   | 17 +++----
 arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h | 20 ++++++++
 arch/arm/boot/dts/ti/omap/dm816x.dtsi      | 78 ++++++++++++++++++++----------
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 46 ------------------
 4 files changed, 80 insertions(+), 81 deletions(-)
---
base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
change-id: 20261015-patch-ektor5-dm8168-dts-24b35c8019f6

Best regards,
--  
Ettore Chimenti <ettore.chimenti@linaro.org>

