Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795685078;
	b=SHA9E/0/PCuVIYMyaDHjwmyebBADAIoYOl7YoErWay+4dzdz80AGUiMeHd8Hi8RSvzwG
	 /9Kfhjebnxhs1nB1PUyUYpfEGi3itFUxCYGEiSmQi1AZjjSFRztsVSdmIpa62ctcvy758
	 HxZXY9foWmRMOed3FWg838w/PiHSfH2EwHo6v6+LgpZ86CHIac73XdEU3s9Zvs4ubagsP
	 wpVGX4v3GoUuPc4Px+5jhU+lX6vEDh3fsyB+lmGqYFO/NBkjq7MPs0E8kDBunoLRdMd7d
	 13tU2qd/k/r0X5geYil6Rb7lfm2fQs9sb/45eAt4Ycg4QvgCCl2qUe4Fw7O4vfbeyTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685078;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=cmYgxX0wyUrCUPNHbGvSBKwLn/QP4K0XP4FUfbN/y0I=;
	b=QwphxcX90qHyJH496P/sPrFuu11CjMJgeJmhCiZh4aI00pjbjGdtyV0e40D9JqsiiimH
	 2TbDUpyNdMsPUA/BBaeWV26lYABfNy01YyntH/3tzSMo/ceeGzFJufuUI+HJxsasC2I58
	 IxtStJRoOqxfxZq+p5Yo7LokFzETCpbdKo9zkeoY22piaMpoKlw6iYPeOsXuoMssL4uop
	 1+17TVJTl9Hqh9IMJzo8vuLKp0pjCecUjjr30NE4QjSIgd5r66E97nvsE37g8492T54df
	 YT2ScfF2nBXrQrSbNbpE6kptQ+vEg0AznhTxVr7oupQJdR5eOpSB7R+oTnjQjRF17Nw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oXBW0Jox;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903E0606A31C;
	Thu, 26 Nov 2026 09:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oXBW0Jox
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795685078;
	b=bjsnDRAaUoRmElIAetvYZoXnxXQNWkIpDaVqKIrSy+E8gXlOlzT2y/JdlolF2RjoWnSQ
	 YibolCQ+4BW8EMca3/R6vGhMrf+Zhuf2hV7w327H1H5Wfo5X8T/mDV/0USR/aejFOmJeW
	 8hX6MhCVrshT5uA6nAnbGHtIPAHJRCHntiaiJbcxYo6pRWcrVmVoPszWm1k7cvqz0QeZy
	 V4JOPH7bzeNAL8rNWazLvcOriYeImLWI3Zgh1TdcOoiKwQxhiODQpJGlSekaew3nbbLUh
	 kkJ0bnD6rFYoBzCFD76977DVAkfqJ/9DXEv68pQjYT3TkRcG+eaz827xGV6hp2R84MA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795685078;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=cmYgxX0wyUrCUPNHbGvSBKwLn/QP4K0XP4FUfbN/y0I=;
	b=k/cwVgV3pM9MIxSpRT7bT7ELhQP22Mm87PRMkui59SCYC+BsiMtYRFOyC30eHgkHVEI0
	 Jzq2018z94W3z+ScjcI7yJMEy7iu/85x4dRJUVJZvSq5mS0lqRpQEXYRLIMVRdXpk6gFX
	 msbEKnZHsfQQSl+6LzaeHVFeSeqXLJjTQWY3XIfaVy2kDilVUJuV/mAI7FrGBVq85ONe+
	 BO/FtSvdq7pD7gKgdpSz9ThLplnbWeOsIuYG4D4xKejQpSJaCXR3Du69u9n57Lj7UwuKq
	 4OrGtvRRjvcN3j3NzWmnPHCaDu570ioKlnhGHm4XdnTtD2UVu3II4VmcvaPKqiObZ3Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 369161F000CF;
	Thu, 26 Nov 2026 09:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795685078;
	bh=cmYgxX0wyUrCUPNHbGvSBKwLn/QP4K0XP4FUfbN/y0I=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=oXBW0JoxjSP3B/2uHmvdBQ3V4x8G0NdNJt6PPmG1B81E6SIlmtzkNp4RaDUyE9ePx
	 1XzBA8tHpB/5Lhvg4gUaCFbKPMV0FHAAfGHCEyQvgAMGOKPCOl+m644faOWBhe01cO
	 0KDZIQIx5miTr31uXCfH3G8pTdYf022N0+i67OBF89rfDTqumzx6TudDNeAU2qrHnA
	 q9DxIXnykcXo4+3VkkpfSDI4Q9QDpqGp6Iq85Ukk8wfPx92FczFpIQreAMFagTAyS5
	 F67/I4T1S9Q/d/NQy/kNx77blIBeE9YKTTXWeJXwieJOzA9aPY6vpweRzYWFnm9/jJ
	 XADX0uTZDmovw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8DA1A4D353;
	Thu, 26 Nov 2026 09:24:34 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH RESEND v2 0/3] reset: support reset for Amlogic A9 SoC
Date: Thu, 26 Nov 2026 09:24:16 +0000
Message-Id: <20261126-a9-reset-v2-0-e3d850e68725@amlogic.com>
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
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795685071; l=1089;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=W2d5QqQKBqxvLWMEJ0hRfu/NSeHdDzwS5lPAkyQg7Fo=;
 b=7WkPlCfxU6cc4NNY9jDCaiVSFNgjX0BFQ3UsbkMwMqVdIutYlN491SnjJhXGjUDI9GkGdxodO
 otquynK8/eVDEp6C/RV3s6w5EcZRZ8rMoQY6g5OGnvfm7azgdq5HAsj
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Document the reset controller compatibles used by the Amlogic A9 SoC, and
add the reset configuration and compatible entry for the Amlogic A9 AO
reset controller, and add reset node for Amlogic A9.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v2:
- Use standard node name reset-controller.
- Link to v1: https://lore.kernel.org/r/20260709-a9-reset-v1-0-fd7cf039b853@amlogic.com

---
Xianwei Zhao (3):
      dt-bindings: reset: amlogic: Add A9 reset compatibles
      reset: amlogic: Add A9 AO reset controller support
      arm64: dts: amlogic: a9: Add reset controller support

 .../bindings/reset/amlogic,meson-reset.yaml        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-a9-reset.h     | 247 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        |  14 ++
 drivers/reset/amlogic/reset-meson.c                |   9 +
 4 files changed, 275 insertions(+)
---
base-commit: 4336e970ec6890fbd424128c352564a9c1dd514a
change-id: 20260706-a9-reset-9c39e8fdb06d

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>


