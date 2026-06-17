Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32015361DCB
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 08:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781684139; cv=none; b=b5QcTnsKOURwdiBNCwdXohfGW/jAaSlzHiYKf/RkQi9IutYsUM3PAECtyK3/VxP32vR3R2NFhkG9RRjOMQY0okynYJif7ZYO8bR3Rxca1hi9Wz6PQEgBXZMn6L1iVVwHAEoHOPEp2rxla5rYSuJEbjqCDd93pTX2KpjeQ2H5V7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781684139; c=relaxed/simple;
	bh=MhuoXCDcK92PQIGXV4t70bs6vUPWNinRh+wxDPRUMxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hoVHYxWGYFQujKPvwZeCrVCvkVyh75nITRCJyqu6RvljFAkx2F2HEAsUstYoKwQECu6w0KOrHZ7QoxGJYUho8HIi8lnV3R2jTW9KT+4Z6oMBW2e93yrtZ2ujKTBdZrkThODeMI3Gc+S8+KM1Igutzla32GjcAll5u8RaHp+9AfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4T8TuL/; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4T8TuL/"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8422871b42dso3358286b3a.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 01:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781684137; x=1782288937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxXn1Oj6SL8VleTEBTLmlWInvGgOzp9b11hsJyxGyH4=;
        b=O4T8TuL/85/6FX1KoKDy45X4bvjYRc50VPTuvzFJJG/2ciPMfuQNXFqzADEPUz07qY
         Q5VFhEMTu1NTJaNjNAZc9ZcvJKRRq5Ner2mOQb0X5tKr3e00QsmaD3sGpNs4fT5QunMw
         SK+7kl1IdHR6OR/of0tB0vpJcpYBn1G4mss4NgVRFh9MF7cGklVtGJbl5J1jkWhmNgbE
         puKQ/I0un4ARPZDg6CJzNfS6oKXOLkglihnnmct92kuZ0d/tIfsyJmdxIAT7QUrfuUUb
         T+Dm/F6CYfduZjoOKBnLTBehWAa08+W68+w1l6jD1lbvEdgiDXDzj1WEdiOmY4ppMcxp
         65IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781684137; x=1782288937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QxXn1Oj6SL8VleTEBTLmlWInvGgOzp9b11hsJyxGyH4=;
        b=jjxEUgLGHJzXynZmC/T4XQ7GTRX2ayvGhYBfkJDGZcUNIuzr1XJn3fLX9mTKV4sbUJ
         3NtGHaiQs6R6fZIuMzjLNOQIDH0/YEJ7aHsQRjLgYGEQhaDWGHbOOguVL11a38PYRYEL
         Cx8kOleGhSZlqFlJnAPCoWyiNYedAMc8/ZuEzor+vQlsR1QtyRYdwZwKvjkbw8trmLFL
         xwBRSwXT6IhyAgREcl40KmpB683VawomK65y27CrX/R0e6Sln7dr7gV8tPLo4e4V8CSC
         +PdNWB4NQEUtcTxuG57bQTzQKh9ojGxUH1BavK1P5OlksQeedJ0qov93KiGsohHQj8mx
         V9NQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ebtnucCWwkE2g0aCkUUY2rThuk07z09rQoVDzvLVHIPJuTyvTRPzVqSrDgLCNTq4E+WiiD1FA989f@vger.kernel.org
X-Gm-Message-State: AOJu0YxlEnDvL1jyuMvt2Fu0ijLAuFTzvgKDe67KN4V/frGtsmFR3GiB
	AjCcOyG732PqURsLa7MCUAzx57p3o2OTLjiJ7NoHQSa3rNLtIsNZFdfr
X-Gm-Gg: Acq92OGOhgDczwuX6mQwB7xugsoNYIbN8YoM57R4tWIp0BtmrML1UVYiOsKMCyJ7OwK
	GmkrkdpxG5e4HFeRjLpWF0nupdRFm6vY1hbH8WzBfFXvjqtBAIySSCM6IPXDx+HteTk4Qd2WTFS
	6QVWEHFOZocTIwo1QB4Gk+GTi5I3mGGEB0k1p+UbmrX/EWdRLgXM9hEQ2CYpn/yVpVbzQWB2sun
	OQFHj7PXlzLJCfLc7x9r2WfwJ1VbfRf+A7Zhpy54teiAVrl50ZJ5VPWrg6fu5G5RuZ9obljBakh
	NZgmFEA5PHBZHd64sBWTaMnNYsnrz6Qx4XVolxYxeSzjteQEnY8p2eKsKSPxl0n0e/G5D5HiMGN
	13/VaAlfOnjiFHvEBJN7GaY+miCNcDH5+muyrN7CkW9QBIvXX6H9TIkQPkfkl11Z0RfICw7fcCa
	AEMIOZhG+pvQ==
X-Received: by 2002:a05:6a00:99e:b0:842:6ec3:2352 with SMTP id d2e1a72fcca58-84524484febmr2781503b3a.18.1781684137489;
        Wed, 17 Jun 2026 01:15:37 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9c474sm14054459b3a.2.2026.06.17.01.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:15:37 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: neil.armstrong@linaro.org
Cc: avkrasnov@salutedevices.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jbrunet@baylibre.com,
	jerrysteve1101@gmail.com,
	khilman@baylibre.com,
	krzk+dt@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	martin.blumenstingl@googlemail.com,
	robh@kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: amlogic: meson-axg-s400: Enable pcie_phy
Date: Wed, 17 Jun 2026 16:15:31 +0800
Message-ID: <20260617081531.644109-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <915e4524-d407-4b4b-9e61-e4a2274a6f6b@linaro.org>
References: <915e4524-d407-4b4b-9e61-e4a2274a6f6b@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > The meson-axg dtsi now disables pcie_phy by default, so enable it
> > for the s400 board to support PCIe functionality.
> > 
> > Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> > ---
> >   arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> > index 285c6ac1dd61..7ba249cc3d56 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> > @@ -448,6 +448,10 @@ &pcieB {
> >   	status = "okay";
> >   };
> >   
> > +&pcie_phy {
> > +	status = "okay";
> > +};
> > +
> >   &pwm_ab {
> >   	status = "okay";
> >   	pinctrl-0 = <&pwm_a_x20_pins>;
> 
> Please squash this one with the previous patch

Sure, will squash with the prior patch in v3

> 
> Thanks,
> Neil
> 

