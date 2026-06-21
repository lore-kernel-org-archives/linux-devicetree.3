Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16441F91D6
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 00:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782002793; cv=none; b=X3fomQentTZ4PlrZqVtGHQPt2czmfr1RJGR9oWAeBYJCxeHAHspVKSv4NLQWyWrwKH9SPeI0GDwnmgtUuMEnE+3uNYxLQl1h9jLY3tTc0iMmGQgizWJ5OIqpkHcZxHfAb5tWlRzzngZengLeutybO7w1AfT6DXeV0gpG9zaYHw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782002793; c=relaxed/simple;
	bh=/9dz4QviX5eZ/DcvAaf4DKmZZS/7wY5B4acWBsr3MXA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=p3nHH0P3YhI8oB0PCwWw+3LrvBBq5k7h2je2z7g0BCjsjdg1C9g+5FHbNXKB2lf/CAwPqrqjXOTph1qNs/dKJ35uwlWPW6TBP2LgySKD3RUGK1CXNAICSyeU/XELGR91dft++ZVa88lG9ucEP6uQgbn9TmuLxhW3HXrgF9tLi28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJeOuglU; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJeOuglU"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6a0eb19ff49so762844eaf.1
        for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 17:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782002789; x=1782607589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TI9LIWoTUwIdAN+9blNOOm/EKtO+7hwNGRKe2i/GtZ8=;
        b=rJeOuglU18PZillaEbKXCn5B7z6TZf7VF2skBrVYsf88AjI0UEanvto+hY5jwhRJE3
         6+Xu9WOQtkhha5tR6K3Fz7U4t3LvyAnf7MrtuToixCVNQcL5HN25RDOYHcXr8wYjc01X
         dtDwwxxeDXdllGZxZ/ADLM9eK/9QBr5vcn4PniwMQ7TWNGvWAImwG+Ry02RNXI1A+UlM
         bRPbqEG0ulE7YgMXRuV1SWlY1vdGNadFoisfL5T0MRTbSHJrROGJOK8F4SycOEMKYh8v
         sL0GjfxoE3mkDmMsN3tlXQqA3L1DBCiWlyTQkzyvLf8LW16I9kg00PRKRfItgj8jriMi
         P/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782002789; x=1782607589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TI9LIWoTUwIdAN+9blNOOm/EKtO+7hwNGRKe2i/GtZ8=;
        b=HQJDue+IATmBGo3Qi1wpXDRF89ZhRxbiE538vmgTeyPqSDakckY3vKVgE79yIOL4Qy
         t+D4in9jrmRfUt6ykqVAlB4vsMF2WKhlzycKg6J9V46vyxA7joYHW9slCKQggo+ORo8W
         L+XECzUpmssWRGaDHybNppWP/yfO2XJQ3vwr2dwajneg/a3Y7FACc5zyBxqxBQxQuPMj
         shYy6oGuo7swZZBVZdOhBZc4ZV//vqi8FUx0yH9L6hqpfWrRcL+pIT/MEErSU/OXDY79
         6IC6E1SnpTg8j0J0730rLgS7HdDtDf6Bwh5o3eN+KtWbgg4nwQTDY/fAhpP5xPevAm7I
         EV5w==
X-Forwarded-Encrypted: i=1; AFNElJ9XPzOfzZtCY1w5JKm+Yc8m98ueuE641lN3K+RCJGsuZMS9ctJ59za9ZV8Nup/Bu4aVC3wO/ei7+h+h@vger.kernel.org
X-Gm-Message-State: AOJu0YyWieoo1CUvGYL6w+bX+5xyUA1jBX7mcV0VhlleivdhUNZPyuaG
	3eFLdJ9mNeodkpOPaJffPLXmJvFo3jDhYu0361Mjqe2i/7r9Na0hpZtt
X-Gm-Gg: AfdE7ckoFEqGxo2lTRJKDW8Juk8MFxLQFpl0cqwXCfccaro3+LtniOgloA/iqQevZpJ
	9cScFFq1LptxAKSXmX9q58e4pPDTai/JIFYlOXH94HP4OYreBazg9hno41/Ieh6WOnUiLkAcgOY
	FxXJjsc1SGVnMDQsiqCEizwMZvj6LeMOJ9RkoCZHfQ7cVS6hTYETlmsTI5AQYBQehS1NB8DCizd
	iXT5CqN6pqp510iwUFs3xdXAqj3IADShvMygIlHln6PpGS3MnsQ8FoIuetZmOCIrNbGbRgbYf4E
	ZatQ1pDYoL31Tc/ttiIbwSMPZ538LqJtjSYKaLQrLPOMtAIfWCOhLmJyY+4y61H2dwQPYp6Nyxd
	qhO3Wfc/w1lBjzSDpKxBMOD3h3MosccRqeoUmXmogTq50adnrtkLMTgt6K7T12NuqkqIWKwdbYF
	QjsK976zsrq6ewJZvVekvFyG1rqyuhNNxLaApZXSiT+6QOOzVpf2l4SZcaeQ==
X-Received: by 2002:a05:6820:2d43:b0:69e:219:603f with SMTP id 006d021491bc7-6a0d8999ef5mr7698515eaf.42.1782002788867;
        Sat, 20 Jun 2026 17:46:28 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4472ec5fd4csm3080457fac.2.2026.06.20.17.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 17:46:28 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM AND DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 0/2] iio: temperature: Add support for the STS30 temperature sensor
Date: Sat, 20 Jun 2026 19:46:22 -0500
Message-ID: <20260621004626.66629-1-m32285159@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch series adds support for the Sensirion STS30 temperature
sensor family. This driver currently supports non clock stretched single
shot measurements.

Given there were very little issues found with the v1 submission, I've
decided to make this a regular patch series rather than an RFC patch.

Changes since v1:
* whole series:
- Squashed MAINTAINERS updates into both the dt-bindings commit and the
  driver commit.

* dt-bindings:
- Added ALERT pin as an interrupt and in the examples.

* driver:
- Fixed a mixup between the clock-stretched and non-clock stretched
  commands.
- Fixed an issue where the return value of sts30_reset() was ignored.
- Removed redundant "Author" line at the top.
- Added comment at the top for the formula used to calculate the
temperature in Celsius alongside a macro.
- Added a dedicated macro for the temperature reading size.
- Separated the generic linux headers from the iio specific headers.
- Removed kernel.h from includes.
- Removed unneeded comments.
- Used named initializers for sts30_id and moved above _probe().

Maxwell Doose (2):
  dt-bindings: iio: temperature: Add STS30 devicetree bindings
  iio: temperature: Add STS30 temperature sensor driver

 .../iio/temperature/sensirion,sts30.yaml      |  55 +++
 MAINTAINERS                                   |   6 +
 drivers/iio/temperature/Kconfig               |  11 +
 drivers/iio/temperature/Makefile              |   1 +
 drivers/iio/temperature/sts30.c               | 329 ++++++++++++++++++
 5 files changed, 402 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/temperature/sensirion,sts30.yaml
 create mode 100644 drivers/iio/temperature/sts30.c

-- 
2.54.0

