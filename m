Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650395;
	b=EuHJNgt+EM6fZ10eA6JAid91EuhV7UJ1faP1dzogoYkg40MVjG5z4rAKh6lm+qe7+CGY
	 PfsJKAi9p3JyA6hEj6BmKNscd6HaNnFDc9JhAF4TeJXMeQivoneKQEh8KodfvTfR5d1GG
	 gZXaPMu/ZNrpO6ojQLzXFMphMTouTMD6vCkiRGTHYKnYiVASidA3n1Yn+OPaAyrdvLSL3
	 Nagzc+mQn56qnAft1FKFg/2OIlK18tZm9CMrLQCz8u15o9heGlWiB7oLww+iqRcC0d+zF
	 coDEfLntxPeFBi3UaxOxX3Hk4g+HNrZ0TxqW+fyUnRRi45laiRUfYIt62+mua1zzlxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IrzQ/241oZp/Tq58QWudEA2sJDuknSCKqwtJBY2LTNg=;
	b=kZHCLUTpIOC70J4fulWgV87kVj7xOdw49iIlG41W7mtiexF9S8k4M67RJc7ucb8X5RGF
	 0i7He2GZa3hXxr9HJLX0gOFKUxJqQLoV/UimRiF8/c9im+SVW/rF7SlBCMiuOG7NLVzSU
	 n/VfTie53ucPtcdRwU+w4lu+1gPM0F+0n9MIi4eaTTONAOcXN5RxjNerGVOAvLXvT5/iN
	 lX8FX9vpTeRK6eJVKgnS3FeRIl5nxlifcwwGtyvNabEfZ6+ztBxzp0oDq7a6daDm6IeLX
	 Wm3MXI/9GqkChuXl7PA1bjWJ3C/kOKBgg4lBLgkTVTQEbiBX0NA2eh3umms+sRmc7pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XsRgzODd;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4136C606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 20:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4136C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XsRgzODd
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so29240595e9.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 12:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793650392; x=1794255192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IrzQ/241oZp/Tq58QWudEA2sJDuknSCKqwtJBY2LTNg=;
        b=XsRgzODdBUT4XXjpIUPRjkJblHJube1dhFufvnWW8HeEn8qJcmxkZkk0w1uK0fhN8z
         9dbQSp1dM546uDhKZOHSl0Zm23FuoC6QRi4Ob603V/sF7oVbAadbLNyViF/0ugfhKeEX
         iKIuqUzLcP+o1oa7J65p3rfwAJ6fxWhvUeclO/ZN+anA4SbR8KcCXTnClK6DcdnULRJ3
         XuNcg3MP0neOjUw2Di4n/gW4ZtY4i7FY85TFhj6rRD8/LvxSnrWZR0CSmR6V6EGW1qWC
         ol+YLt1tYcYhIHCw7t5RazdexhSQGt5KYfcKUKqEZe4dmy7hy9kwCIO4TXxCDYjYuf3g
         towQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650392; x=1794255192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IrzQ/241oZp/Tq58QWudEA2sJDuknSCKqwtJBY2LTNg=;
        b=aFAG7zQxfpBdtr2Mg951z6qA0Sl2DhKqH7hCLoZ7QIRh1UVn35dCupwKzDXo952a7U
         8qu17uz2WWuA8I9vf+BV3nCUdTAigQ7RFaZnnCuQLaSCijuRqXtAmd7fo1CZDO+ck1VC
         I5CrzWlzCkABgu/R7FQZZL4xZMxT87COzAjo6Amm0xm5+6t8/bB6pEHQmQ4K+Hb3+upR
         CziMsrMw/G3xGOXUoKxfGl+2aG8mpkWdO9Pb/bj8Yv91mJEHLEvx/5srPg4aJPY4MUN+
         phimMAf4CMF5M7s+W7vlUOsxy+bzhYaIXF1IH+H42PpR9MwkEBMhVkKbpqcnvedDI4OK
         V8qQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUWSl9CFRxmWNd1XSVXmH1U8wBZ8UjBeT1CI3D58a5sE78J2TKRXNwZTR6zaunT6k2j9a2Cx/+AUU+@vger.kernel.org
X-Gm-Message-State: AFq9FYLAOPg9wQsDDi30NzdjUs8Te3xx/X6iugdDiO7vtW7y6+uqg4ar
	uj3h24RP5ZjmQpkBJUCXgjAL1OQ+We/ZBSjdR89ah9HEi4GaCgkRZpuakA63Iwjnr3o=
X-Gm-Gg: AYBFou3d2BPnrkHYedoVh3y9lu4/qr4EEV2s1Yg267VckX5aXQduTtKMLue9NO0Rdqh
	zYCCTQQVoUhwkIDCS8W9dp3Kkf7bMus8aFmR2gRLj0y4J/VBBzPSc+3Cfdcyq4UTYSwVPkTvjNg
	Emurv4Z7+s719PBsm9zIChN+7ZsoBFfjZtpRqbMF5w/Q0Gj/LTPJmwZ3/OWGPoVsBDRUE19qo5v
	lM8Pz8rAimaexafx1P9LYDhSXIihEACoFKcW/qj733q/QqAuu13WSfDIzQIUg0mE9euLejOaEvo
	JcxAF+zW6jpjIPmskpQb1m4xDq2Zt2Gys9YqKbg0RRytV03Q8odyi4uUozEtWCT/K4kwIQMQYWy
	MnQCXPpsKQ02Uft0YRBMxTs8RstCOuuW7t2zS6o2y2eLso2jemzZJ7F/CsnlSKeuLP2OS/2/Acg
	TCO/IDyX8rAvAumlQuVDxET222Qp+jN77KAdTta7u47+UKm1JgsJWFhXnRqRLog8xWjfD+9wtpd
	/56xsAV49TyGpApwXEDkL+TdkSOWbzXV50pIYdsFzvccVS5F8Zb/6OJdCeZcUmF/wfSNuR8qRt7
	tjBHrWn9hqt5UDtqKkiPHWUGgR5dvAxfaJOhkSO9HT5t91nyalDpP8bXsNJx
X-Received: by 2002:a05:600c:46d2:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4ac1980118cmr242926285e9.33.1793650392480;
        Mon, 02 Nov 2026 12:13:12 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6412:7406:ded:3229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cf248sm13969155e9.2.2026.11.02.12.13.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 12:13:12 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v4 0/2] iio: adc: Add the Ingenic X1600 ADC
Date: Mon,  2 Nov 2026 21:11:53 +0100
Message-ID: <20261102201155.10948-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

A driver for the SAR ADC of the Ingenic X1600: four auxiliary channels,
12 bits, one interrupt per channel. Tested on a HiBy R1, whose keys are on
channel 0 behind adc-keys.

As in v3, this version is X1600-only. The X1830 and the X2000 have the
same register layout by their programming manuals, and a chip_info with
the channel count and the resolution can add them later, with a test on
either.

Changes in v4:
- The Kconfig prompt, the header comment and MODULE_DESCRIPTION() are
  the same text (Andy).
- The read computes the data register's bank and half next to each
  other, and the two macros take them (Andy).
- X1600_ADC_CLK_RATE_HZ (Andy).
- Read and write helpers that add the base (Andy). Plain MMIO rather
  than regmap: nothing is cached or shared, and the only
  read-modify-writes are under the conversion mutex or in probe.
- The device clock rate is clamped before dividing (Andy); the divider
  comes out the same for every rate.
- Binding: the description's last sentence and clock-names dropped; the
  driver takes its one clock unnamed (Krzysztof on v2 and Conor on v1:
  their reviews and v3 crossed).
- Joshua's Reviewed-by on patch 2: the changes to it are the points
  above, with no change in behaviour.

Changes in v3:
- Cover letter (Andy, Joshua).
- MAINTAINERS: no list line; the binding's path in patch 1, the driver's
  in patch 2 (Joshua).
- Includes for what the driver uses, copyright line, MODULE_AUTHOR(),
  reverse xmas tree, open-coded return, no message after
  devm_request_irq(), a blank line (Joshua; Andy on the return).
- fsleep(2 * USEC_PER_MSEC) (Andy).
- The ADC clock divider is now even, as the X1600 programming manual
  has it; v2 wrote the divider minus one, as the vendor kernel does. The
  divider fields are named as in the manual, and the two clocks only
  repeated sampling uses stay at their reset values.
- The probe comment on staying powered up no longer names the keys
  (Jonathan).

Changes in v2 (Jonathan):
- The comparison with the JZ47xx ADCs dropped from the file header.
- No mod_devicetable.h include.
- X1600_ADC_VREF_mV.
- The status declaration split from its readl() in the interrupt
  handler.
- field_get() for the channel's result.
- fsleep(2000) instead of usleep_range().

v3: https://lore.kernel.org/all/20261026083631.48406-1-olivier@mgcrea.io/
v2: https://lore.kernel.org/all/20261024041357.34346-1-olivier@mgcrea.io/
v1: https://lore.kernel.org/all/20261023204209.48556-1-olivier@mgcrea.io/

Olivier Louvignes (2):
  dt-bindings: iio: adc: Add the Ingenic X1600 ADC
  iio: adc: Add a driver for the Ingenic X1600 ADC

 .../bindings/iio/adc/ingenic,x1600-adc.yaml   |  53 ++++
 MAINTAINERS                                   |   6 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ingenic-x1600-adc.c           | 257 ++++++++++++++++++
 5 files changed, 327 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
 create mode 100644 drivers/iio/adc/ingenic-x1600-adc.c


base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
-- 
2.54.0

