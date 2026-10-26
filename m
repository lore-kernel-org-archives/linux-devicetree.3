Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003870;
	b=kXAsiwAGlxP3voag/lQeHUWcFSULMF12obRv2iXf0zUJ6p7YAdoVE8eJ3kPH54vwzqcg
	 NyZhRpbZLFais3dGTuw3C7JsX2+ljaLtEBLdOt4dotKnbuGyr/7vNbHSQbYa8A5R06R7G
	 8vJ4AqKcvn+VobrJ+YQ2pY53ohQR9+bx1ZpUzYvsdWphClElx2+cvHFKOjgWTdjQ10EjU
	 6Dx2gQE8BP89woXbBDURfBBzmkWEtuUTh9tYwl/NkKSycvMNAnHg9YFVOL6c+zYpSIuyk
	 IQ4qBdXr20WT55sWocEHYEgONlPbPslIhcqz8Z2ulp0cujli4p3ZHO6L1z3lZJKhfHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oXR60LDsYky2VqOqQue7mRL+b3w0NTwVzf5xVpsjh8Q=;
	b=RY/jmBVTPRfFSzSYaxG83XibHdHpm2qfFT0b4x488UqrfTmCnFP1XG0P8lzlub5vv9E5
	 nF4Hk0zXCLfvVDeEivjwvCtEt42oHEglcVbSyyDVhu7wy+C2YKM73wDJvgKuuCOb6WhSf
	 bxdoPMPn2EGWYvO3uqQ3k+7fX0rqyINsgiyaNRrHrdPrPFZ9zQtqonouqye1Xnsz19QcR
	 t2ibAmzwD6A0TWbhNsjoaZBiDOcpQgK21xb/ot+51UmpANxU0pALphhrDBUAK7FPZ3KmM
	 ZNX4mcFBL4JnqguY5Ro3O+iCuAPf56AiNtrHl1Uj2k32F/nxfyzpQ3aDvZRAD+dA4XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=qBsIi2dB;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6476F606A31E
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6476F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=qBsIi2dB
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b060ec084so1602702f8f.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 01:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1793003868; x=1793608668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oXR60LDsYky2VqOqQue7mRL+b3w0NTwVzf5xVpsjh8Q=;
        b=qBsIi2dBdH7dA6rq5ePwsw1KhbbX7/GTANSCFjSkBKYprl0XlzFBnQ813b4EXpOedd
         jHjGq2ZKDpPxVtnmckN1HCLMAVW0lbzGAjU6C74A2CGBHcA0wlKckkUo+FuA3jQ5uQh7
         d0pf8I2mcBWArLgDtcf4wB66d6IQdntMYP5jEzquTSfY7FS9uh1MlN5nvY25hSczip5F
         pZ53jHutnqOFMpQJ9niydqUe0V8uM63NCXf4pxUqo2TpyYa0dReoj301BixIa+tNg7yC
         5bDIZtFeVIP9RJLhpL8FwqnMGa73Avd6xWvlNy3q5um49If4pY3KTri+EyHkDSZ/qhJg
         VxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003868; x=1793608668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXR60LDsYky2VqOqQue7mRL+b3w0NTwVzf5xVpsjh8Q=;
        b=WVI8NNvu3fcXEUdR1Op1B/+k5YY3oQcr4LEhE+tCaj9/3dzyOFIPvckYS9qcg+VhTF
         AW9S8gCfJ91So7AIWcASt58JX2+15w8iGZZ4VnRt4yVM2bLPTs4j3bbYzecMsanklHEd
         fLrSy9fB2kVSyPxnrHoOYraTT/4NvwOtBkbBKKHRBAQzYSy1bKkn+Vl/v7eNTzS7SWfk
         thc1tonEORz33Xnci8xoji0LSh0LYqTd3f2IqS5WTn+itSC4EnaX+W156I55U0NDQUaS
         2Ym7i87waevjEY4rAM+DYmUS8p+IC1n+IxVUphBLJ3Y7DQdyzeg0SHBsPqr+uk0ZojzB
         edaQ==
X-Forwarded-Encrypted: i=1; AKwUvByv0j+QZIbHM9DhiPOg3NaPeaUQ4hyZLET8+9fTxx57FGJf59N4ff9h2krVgvAqY9ffG9LFcO1LxKtU@vger.kernel.org
X-Gm-Message-State: AFq9FYLY5tsXmTYxqWIJ5n4mG5OEF5ixaaA58K7u2KGj+kqY/d7rXjwy
	p+4kXSWS2w68n2eszVcmrzFkkaYCe8n3PVC+bmwhZZuOM7O6+fyAmVOeg6+lTrkFPu4=
X-Gm-Gg: AYBFou2HQhIE75yas7L/N9p+m738pmmwFavJLHkwwcxTrtnHxFr0mVAX/GHg3Tz7hst
	x7ueLGuER8x7fcqXNTM16oKH/P34j/mYYrS/d1vlkLmdZuCjOqKCwXrnIofpw4wEgljqAL/jPCn
	PxAaD3jz/lqONISHCk45N3azgLCFQ3AqtkpCZ9ZI15lD9ygimdCQxlnWeuBKN2EeDd5Kl4eqHhH
	p7/pY+96qnHcdULa8DAVPXcpaU9nmNMPAqGjFYDb9r8dBtWHEsILXNk+x9yxCRb5RByLpTi5/Xa
	ixmXXnOpXuusQ+zBY3KNltoH6gZVN6V2flzPYOe1lndGlKghCzvdPfbX2+CDLXogn0rag7m9wBN
	50t8kGPSFG8p4bTv/5uGIUaJltW1XuMDMy/NrVZZtfvEgBm8quAmY6lcmv6f7+ohvojfeO+XKMe
	XvyUgtAtm3Awm+VtVL9xyX/14PvSUJDy5OhKHdhVLlh6Yn9jqDKZiqiga6XS31p87xOKl4kvFOs
	W47cyIeDoEJVVnlc242bcKOCxUkt3yi4QtRflavdbq+HdyrAu6YkfXbBblKU57Zfp0NyL+NrSoz
	QjILHL+vcN+O3A==
X-Received: by 2002:a05:600c:4f10:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4a35acaa4a8mr111672015e9.27.1793003867665;
        Mon, 26 Oct 2026 01:37:47 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8dcfsm15091889f8f.50.2026.10.26.01.37.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 01:37:47 -0700 (PDT)
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
Subject: [PATCH v3 0/2] iio: adc: Add the Ingenic X1600 ADC
Date: Mon, 26 Oct 2026 09:36:29 +0100
Message-ID: <20261026083631.48406-1-olivier@mgcrea.io>
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

By their programming manuals, the X1830 (3 channels, 10 bits) and the
X2000 (5 channels, 10 bits, one more data register) have the same
register layout, two results to a data register. As Jonathan said on v2,
the X1600 name stays, and supporting them now is welcome but not
required: I have neither to test on, so this version is X1600-only, and
a chip_info with the channel count and the resolution can add them
later. Nikolaus, if Letux has either at hand, adding them on top with a
test would be welcome.

Changes since v2:
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

v2: https://lore.kernel.org/all/20261024041357.34346-1-olivier@mgcrea.io/

Olivier Louvignes (2):
  dt-bindings: iio: adc: Add the Ingenic X1600 ADC
  iio: adc: Add a driver for the Ingenic X1600 ADC

 .../bindings/iio/adc/ingenic,x1600-adc.yaml   |  60 +++++
 MAINTAINERS                                   |   6 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ingenic-x1600-adc.c           | 242 ++++++++++++++++++
 5 files changed, 319 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
 create mode 100644 drivers/iio/adc/ingenic-x1600-adc.c


base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
-- 
2.39.5

