Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E5F4779B3
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495735; cv=none; b=V918SBDIE+jHvVWrtWve3gvXYQmjdYAsQts0MF0YRy6WS/tRLaW0wEdQ5KrPt/zZNp9n/i7ZEL9/GdYmf8NvZ/jDNPPCdeww3hEOFYZ/2aaJYyT8du26RFCgRHjdRz0uQSIhf2LzHRF2z22wHWWvmOSxEEpbXOVquozoft8gs/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495735; c=relaxed/simple;
	bh=cNitDgpG+YYjAKvK7VvFwa+o4R38DcEMH86nv13E4Bs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HzQlzXYD4XO8Mqe8MlOu0IlmJwQrNbrsUAu74PoOdszc5bse4MWXRY/mFnORBf0Q14Evd0/UpXp9SmrR2ys2a1wUEDk/oHo1BkbdmKl+byZHW5FOt7TJV+BDwmr7GY10+bJSUbWZednG39JsU1RaMoTU3b/neFeAaSvAKpo/x1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRII+2uQ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRII+2uQ"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bebbc325000so516990866b.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780495732; x=1781100532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pmb1yX4mP1Uu8kbitSMZnCcGiRxACvqmJQFx0csOrFI=;
        b=iRII+2uQUaJ1TcR7UekAIe4idzHIsG8tHgmdUYr2iSy1gx1x4WVamjqCnxuyMMezrE
         KBbXgEu8yr1yjdM9XH1GuzKJJvLRpYN8lccrSmbzQjVEN597qqiGhKlYZ1CG/uUeLJVV
         T/vo6A0d+mjNaQjaXr69T7hIuNY2TYW/z3I/zEOckvK21j4Uk4X0QX2baAQxLqov6Pa8
         08//5p66x9s0TRd6aKkobcsIDSBIvdMgcOZdWbdWNSmKt0vCNlVwXpbyDLvxQueE3LON
         LDLN1wFGyRDI7S8orqLzfa+fJpvTiQwfHdm0kcKr6huRl2fVPudMIZfVPFgR/ozgIbfH
         gUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495732; x=1781100532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pmb1yX4mP1Uu8kbitSMZnCcGiRxACvqmJQFx0csOrFI=;
        b=K7mDqitA+RBtxKxbcnG8QX13huRB1woUUqW6XFdATEZMS9TBLd9f8BsjQuIQpwYs6U
         5UhAcmgfyQAMOlMahuyjqYc1ZJyepOBG2MBFlFtbqlMz4lwSkD3dRqYtSWzJV7B2jUtN
         ROet62loA43PVLnwFzpvKA3akcu/oTogRI4MVui/jEgP8ojAg/CstNjDrV7AdcFvV0ZT
         VUbZ/71htQRcvj4F6ZN7qPt2r8f91o/C1pw3k2JXOi5AgfwjVDNYau1k0CCF7Lmr0RoJ
         lVgM4Ja7jmIwRhr8AFUa2qHBgRzlb2E6rIcGavz5Uo13iuBn4AmIkEPwSDhvyQrAIJb1
         vj8g==
X-Forwarded-Encrypted: i=1; AFNElJ9+uaCFui5mATEEjAb3kNhCXWZ2xSLAUjGsDdaMuNbPeQKcj4qU631RfQDUu3EODKRSNVyQz02A3IqR@vger.kernel.org
X-Gm-Message-State: AOJu0Yza/8NPR2E8A2JYKGuaeGe7wePGu3+rvpXn+IqkQCzodJlJwfhG
	NKEJBBFP43mHJOJBs9wN0SmUOyEb5FURC7tcsFI/YpN0w20hDtJjRlN9
X-Gm-Gg: Acq92OGD/CxMEDXteIH/oT0mGDPkQ3er4I2h4XTLBcUYkKT0U0qD9TG1GufeNZMLruO
	5jW3AMHu/h+hLtG+pvQXBJLEAsrFnk6KxnMBi+WxyjPWnGhnxLGMw80f3HRLDkTF0be+Dv1ySrc
	3qACN/W846t3ima0eoNxSLnNSiVQ2XTEpEvaarzOnP2uY2tZtIjQkbG6OHkaoJzzbKOHAvI+0jY
	zHcDufIdkrejGMv6K9ADHUsAe4xAwhfCyjy3pScb8eejIOa0NY+tmvXA8MwwACsEiswui152a0u
	BEIq0LkQUGFZtM26Aul1ioPMl3BwHT+o04m7e1NQTT4TAjWOreVqlDu+LTndQJ/zompeGFwnRFU
	Mj2YEHdW8z67RxUS96yqpEduxWz72KNF0fw2bIIXDvcUACGYfhBTwv5TBjt+qDvuUFM+9gYlbml
	dR3msi3Ce9/hsGdXXuAaVH6XgruLP7HntoLu6NajfUGJAw2a3CIADoSdeKADINvu2/GwLizdZF4
	6r7BTFO7SX5B12eiQ==
X-Received: by 2002:a17:907:c10:b0:bed:6bd7:71ad with SMTP id a640c23a62f3a-bf0b3ea64e8mr183726566b.49.1780495732295;
        Wed, 03 Jun 2026 07:08:52 -0700 (PDT)
Received: from fedora.embedded.cmblu.dev (p5df027fc.dip0.t-ipconnect.de. [93.240.39.252])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1ac0sm162062866b.62.2026.06.03.07.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:08:51 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: Wadim Mueller <wafgo01@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxwell Doose <m32285159@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: iio: flow: add Sensirion SLF3S liquid flow sensor
Date: Wed,  3 Jun 2026 16:08:35 +0200
Message-ID: <20260602-slf3s-v3-reply-08-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <ahxzpBcqN6o6q4a4@debian-BULLSEYE-live-builder-AMD64>
References: <20260530205435.37326-1-wafgo01@gmail.com> <20260530205435.37326-3-wafgo01@gmail.com> <ahxzpBcqN6o6q4a4@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 31 May 2026 14:45:08 -0300
Marcelo Schmitt <marcelo.schmitt1@gmail.com> wrote:

> We could add a mention to the IRQ pin to make the doc more complete.
>   interrupts:
>     maxItems: 1

I would let interrupts out for now. The driver is polled and in v2 the
feedback was to not put properties in the binding which we do not use. If
later a board uses the IRQ pin we can add it. Ok for you?

Wadim
