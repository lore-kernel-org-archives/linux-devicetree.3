Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903867;
	b=VF1oXXFZDHUKSW6FC3uzwHvoNvvN1EhcLGhExxGdMWek2aXvQpQ5xGLW6eVClPHHVjws
	 GK5h3PrPfMcCe0Qg9xrzNFNYhfsCTtDPTCj0TFQdLmJ+xRqDhwb8o5/MES6i85Uvm0qT+
	 v0Yp3cR0+5DpHNUJXen8iiUGdjY12MKvecov/wPZXhiHcQ4Hiz4fzcrEmpMigCqGHK9gE
	 daQkypDNYs7j4v3dcFm7fScm3CxV0nUz1VkZjFEnOWVGGa3x6fmiK7Gm/MuSRt9ZUOwDX
	 ImUqgxC7dB2qBDEsXALfgj9RoGQ2OGH9VZAXshsGQKlgMZhqxEgdJWvY6PKE2rwXEBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=gOxtFzjpUfLxN/U756DChYjRW7nHZoIiexI0t8uMS64=;
	b=bxEUDT/+FUvzARZ9HucqEVtb7Tr22FvaUieBiadh7Gl/M4UwjOa1vVoAN37ybOfh2EhZ
	 3juHlyC+ziBrGRImX2xhfMOaccTvremAHljZzBPgQLee8G/QGbUKMHis2LGYmfhZ2BwTt
	 b7dTOfkjltH44DRHwyDupdvVlq+x7JqjJKJOKtJdBbr+wAJONA+/e5v8CPZ5VQBBXugTb
	 GtHYSDpvhw1f0wjFV4C98VB5isDpiWxBUtcmgzet88ynFaKGGRh3FibB3e7Y0KcHqnQ4L
	 fYNSaaNxiLdreryIsGUwOCjujeAq1habLRkl8wuWXfx9MGgelVhxJrDIoQNgFP46BLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=uZ+N509i;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C294606A32C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C294606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=uZ+N509i
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b807aab44fso2595270a12.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794903864; x=1795508664; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gOxtFzjpUfLxN/U756DChYjRW7nHZoIiexI0t8uMS64=;
        b=uZ+N509iv4LKdxh3M+Ym2H3OFkUBdYdJ2Rr6ukqd2/dt4YbV635rE545dpLU+u+xXs
         Ng98vGPKjfZYh6uVdLznWraaN9hbTd4M2lCcalOujxH8al9EtHJozr3kGTY+axflTGc+
         /NuADXbBILxVzdY8tfWmfsksexJjx6+Vv+5n2tgqtBJZRmA/JboNR4zv9bMNlO9j4YqG
         IW41Le3smctVEk+LilijlIY0lY5RO0dNK2wYMO3DoHhQcE6LcbnjK7b9eCpJDTY5LeMF
         ZzdfgjKz6qusrmEcMnGTwSJNhi51RlNXd7s11qR67sR85d1BW3FXzQXK5WA4t8+HZ270
         6F4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903864; x=1795508664;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gOxtFzjpUfLxN/U756DChYjRW7nHZoIiexI0t8uMS64=;
        b=ws+BM1J51N8MLjFaip19LyV8m5DrFt6zuwyqdvFMDfimK0QuQNbJmFHsREc0xSnZHo
         Yo+5U9FJWfp1DJonlD/4qi1VfBwm0sLRiOBiTovPm29ORpDK0UMvHzG6Nq4LIhLGLcZB
         aZ/xOYUaI5Y6lfuXFKNZoFgPhjDcmpClut6NyU/e8HXnUodKeZX0p3sS5HJOKEhgXFer
         fJfqE99dLttpsFsnSJ4uIAo8T802EOrprS670B4Z86nM2bINfosx0dCw2i01XWNtWrTa
         SjuSJ8IeY3m89DZrWsjBfMvS2ukD1oQq7IoE1SvT1rFRpq6G74ph6wy06uZohN+Z6vao
         597g==
X-Forwarded-Encrypted: i=1; AL+hErFR9G3820uyuWXek/g1/E8INu8UniRf/XC6Sdp0a4VzTL1TTUXr2972NFnLav4RGRF8ON9AFGLgs1R+@vger.kernel.org
X-Gm-Message-State: APuU4Z8k99M/9TLus6YJ67sJMAWD8iTbt4kvoB5JXuzLiuWicVufbEPc
	v5SsbsqLpNxTDwATIbV/A35P/V8vzRzppBsXCbp0n3Tv0XZ/6J0J1zSIbiHogNvLqHs=
X-Gm-Gg: AYBFou2S73kefVpLy66Ss7s9GGFxTsMitZDn/VMYBvLCbthh38JBMxJ5727Q7V43LxT
	JtekQ9aQW95aG0c5oZlAer+1mPfpLBMDnBfZkN3WN7oeNfdQLxYH9/IigPD5/brOY+JwCciuLuq
	2ueazhUbmHtNj71FlR39DRGp3XdCRcnV3/Nkuk+sUdLmNniwzlGHUZPdrNUXbel9T7M1qtHSBFz
	qZL9tPgh1yGFx/rS7LXOJlJKh5H7no1ghuHrkxUhorc2pdX0xQksIedp1MZPXAgkKEI5Iwa4W+1
	a0dKiGVNS75fnkAGmA7YmDpXHXk49baQ0wTFNDgQwLUNo2bulnGJwae1aOYWPlYCPO70zk8IbCJ
	xKw144z+c+cjtAdrUt6s6qsWMXiaOL95Qkzfa/q9c+S34MNiDYsNV6z557xyxdTctyc3cIZkZhp
	DbNGO7N2UVyy7i+2pdopl+8d3NnY9IvzCnqfhHDr9u+3YNVlUppUZYd5zve+72D2wyLCZ1JFrc/
	ThXBs+Q1jPPlO5zE2k+rpMHhKA44BnyoFIA0oSP4klGbox7vIBe6ogbyuopdpz2v+UOZ+3lTT8Z
	Gs1P7HhbBEVyAWWzAUW1/ctMBJi0L1GLNY7TjhBgQUZBLZO0BWPbbabygL3huArJtruJjr9ZE31
	t4c5huRuW/NJD0brT7e0YgSHntvlnTb6WKnCZFFGXfCwKWmSO
X-Received: by 2002:a05:6402:2804:b0:6b7:245a:a509 with SMTP id 4fb4d7f45d1cf-6b7c0d166cfmr8598960a12.40.1794903863999;
        Tue, 17 Nov 2026 00:24:23 -0800 (PST)
Received: from [192.168.101.179] (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm5616953a12.9.2026.11.17.00.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:24:23 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v4 0/5] Battery temperature ADC plumbing on Qualcomm
 platforms
Date: Tue, 17 Nov 2026 09:23:10 +0100
Message-Id: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OSY7CMBAF0KtEXreRhzjYrLgHYuGh3PEiA7aJa
 KHcvYug7kVE7X5J/1U9SYGcoJBT8yQZllTSNGJovxriezt+A00BMxFMKM44o85WWmGYqQ2eaiW
 Ni8xp5TzBypwhpsfGXa7vnOF2R7W+l8TZAtRPw5DqqRnhUSnKHcchr0KfSp3yz/bOwrfG58sLp
 4wGxcFro4L13TnalOd+GuGA/IYt4g/omBB7QCAQQbYQWrBa8U+A/AfwQbkDJALHVpqjsToGw/b
 Auq6/pytrZl8BAAA=
X-Change-ID: 20251010-bat-temp-adc-8539bf0b85bc
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>, Val Packett <val@packett.cool>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794903862; l=3086;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=qykqVKt9uTGSJ5RitqPySDdIMTQiACLcAePA/hsi8uM=;
 b=u96NawTqxLv3u/fbHAuMVFuEZGpZtIpIU6w/CdWExkPyFU6d1we9grj2ozoh1gv5XGR2PKbBS
 m4GD/gDw/heCcBt+La5UrW33hLFnCRUYGIf81WfggK22+AXh7iFOUn3
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

This implements a solution to get battery temperature readings working
on (for example) smartphones with Qualcomm SoCs.

The solution chosen in downstream Qualcomm kernels is exposing
ADC_BAT_THERM_PU* in the ADC driver as temperature channels with the
lookup table ("struct vadc_map_pt") for the specific NTC found in a
device's battery patched to adjust the lookup table. Patching a kernel
per-device is obviously nothing we can put upstream.

The high level solution proposed here:
* ADC driver provides temperature channel in (milli)volt as IIO channel
* generic-adc-thermal driver converts voltage to temperature based on
  provided lookup table from DT (driver has one IIO channel input, one
  IIO channel output)
* The fuel gauge driver can use that temperature IIO channel to expose
  battery temperature via the power supply device

See RFC for other variants or alternatives considered.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v4:
- spmi-adc5/vadc-common: Fix inconsistency micro vs milli (Sashiko)
- spmi-adc5/vadc-common: use 'MICRO / MILLI' instead of 1000, use _mV (Andy)
- thermal-generic-adc: simplify devm_thermal_of_zone_register return (Andy)
- thermal-generic-adc: move iio read + convert into gadc_thermal_iio_to_temp() function (Jonathan)
- thermal-generic-adc: convert 'register failed' dev_info to dev_dbg (Jonathan)
- Link to v3: https://patch.msgid.link/20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com

Changes in v3:
- Expand commit message on dt-bindings patch (Rob)
- Some commit message improvements in generic-adc patch (Andy)
- Fix dt node location, move higher up (Konrad)
- Pick up tags
- Link to v2: https://lore.kernel.org/r/20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com

Changes in v2:
- Rebase on linux-next (a different patch to add IIO to
  generic-adc-thermal has already landed upstream)
- Un-mark as RFC
- Link to v1: https://lore.kernel.org/r/20251010-bat-temp-adc-v1-0-d51ec895dac6@fairphone.com

---
Luca Weiss (5):
      iio: adc: qcom-spmi-adc5: Add battery thermal channels
      dt-bindings: thermal: generic-adc: Document #io-channel-cells
      thermal/drivers/generic-adc: Allow probe without TZ registration
      arm64: dts: qcom: pm7250b: Define battery temperature ADC channels
      arm64: dts: qcom: sm7225-fairphone-fp4: Add battery temperature node

 .../bindings/thermal/generic-adc-thermal.yaml      |  4 ++
 arch/arm64/boot/dts/qcom/pm7250b.dtsi              | 24 +++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 83 ++++++++++++++++++++++
 drivers/iio/adc/qcom-spmi-adc5.c                   |  6 ++
 drivers/iio/adc/qcom-vadc-common.c                 | 16 +++++
 drivers/thermal/thermal-generic-adc.c              | 27 +++----
 include/linux/iio/adc/qcom-vadc-common.h           |  3 +
 7 files changed, 151 insertions(+), 12 deletions(-)
---
base-commit: 6aa7dbf8ad5ebd3babf53a4d6209018f86939f17
change-id: 20251010-bat-temp-adc-8539bf0b85bc

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

