Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AC53DB649
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065425; cv=none; b=XF5vt0qtRO4m09IXGm+4MI2MmanNy8tmBp1Vcm149F+PBVIYjS9DwEUFgFbLnaZ7ueAD+XCAPjAKVYvIiNWUTGS4gGD4EDwXtfGb/J5DX7ZE6SPpHb0+IdnCFRt12qjcojSPlYB8ils0MCauxIis3Zowpp1O3wr0H0d4P0eZLPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065425; c=relaxed/simple;
	bh=RdKPo/J7jz8+PTZxfMlAGNH6ifidcVIKtGtDAneEbNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tnsue/67mubTjty0Pm35hLb5qFcrN64iotYc2ViZ8KZqERjl5J7GTjPhfhdyyP+OFrYUNb/ICY7ONqAmwSPfkBahp76tLpUju80nzazIEdOdvedkO7gS0bcwaxURtBVpNA7dkOuO/+mfCnVKIOPKs4l9mBvwDsZYlYbifqOQDXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=QzqIvUB/; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="QzqIvUB/"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a887ebb416so17502673e87.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780065421; x=1780670221; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RdKPo/J7jz8+PTZxfMlAGNH6ifidcVIKtGtDAneEbNI=;
        b=QzqIvUB/274GQphujXYx6e2K07fRwbUink7XyH1YfGDfEvGwGL8qOl4eMESOqKPZ3O
         h24KLu9U1BvgZDcv6tNDUgRgxGF16phqp/iXtByqZxwLMVoyhRJNPz5jc2XJIoBdNvgO
         p8yBZ5bT/HG+ku6r7xIWv+/XV1VZNOVLCzqgMqTYKcBkPYcXFjOudRhIBccq/cFYqDnU
         5JRAxTZjdSvU1s+0i1j/V/KpsD9lKYCF7MsBWRzZAjkjy6+1/aiIktNhrnjslL8qkB3q
         Bh7lyhfm1ZJmsHuZE6SO81Akel32SlJsWhOZhfMC44OZn2qR5yc1QIRfgSew2FG+N4Ta
         e9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065421; x=1780670221;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdKPo/J7jz8+PTZxfMlAGNH6ifidcVIKtGtDAneEbNI=;
        b=eKTZZAuuDZrCdoOmmRBbC5b/P6y41FGd2GIX8mo/4Mki4KbPcCm0IMfdTi7FpnGpEf
         IhyACThlBT48Wqr0kU028LW1BYlJ+dzWjQtesgvBl3kdx/851FcEf3HXod93C/y36PWY
         WRX8k2uqqIG3I08zZKF1P6uER4hB727w/sLlkW3Ih+VNVjuTMkqH5exefJgvvb9r39Zm
         42L1cER5C9k5wJCxE1hk5dpnoUIGvAyDhJNIJVGAQ8uSHxjGCoUSE90JcPVKBUtoCZO2
         BoDDcymUC7qKVkGmzpvaDqQ2kvLatRfvfqijat+Tzhvo8qR0DVGOC+X0TrVyVAXZBkCF
         NRmg==
X-Forwarded-Encrypted: i=1; AFNElJ/sPLt+T03p20c04KoeK+rxGefsJwzfDxulbL0YzSZgNLeIdR1Egxuz3KGuMKQz2PVM1kfc+6N3UpW1@vger.kernel.org
X-Gm-Message-State: AOJu0YzHn99E+qDPTRA/ajQ1Emiimp1qdmG6RkcX1Ms8g5KEeIo3n4KI
	t9Nd3puOXyoN2vj9HHXaRJ8nt4WYgBdc6vRApm/DS/2vNP8QxeV3OVqa2N0pXvXsVAE=
X-Gm-Gg: Acq92OEYECKj5p7iIKIdKQtglgcXUJjZzja4u7rI5HPrJEek0d3AGfwlcAsD9HrVVn+
	rPNbHkloxL/Vrd0zc9JgNOFJ4twzn8r/2DO777Sj+3FTsdn1mF13qp+JnSxkjuYHGRjld4hMGud
	+U/Ven223uz4YHRlNSgio4VJasF5Ieuj6obQZw3Qyxp8S4uZcQl1YHodbOJUeypjNtlFAvbJKqq
	tEs1KiOoRNEfgAog5m0nm2Y9+YUlbpOiBKnbKBSGCxiJoFKVApk86yE/CZdxsUPnT4DlIkmkYAV
	MBTbfpu3hbzvzv7XzpAzdQSFqCC7siQE3L8cOieKrPrvMegmWpcLWIWkv6ZCC8Cotxnkev5lXhH
	JmhiX4aqpdXOK1bIUml2dYWmWUMiB4wlxf7JWp9zekkE9ba1qlkhmRblLUwOuTbg20IGjrXN65F
	ixSuEX5xpKaXiR4Da9Iy10dIZQ1YLAlx8a7lFDR4eoqSmOBajGuVyttBCQv7IrLsIPJE2zRkZx+
	sDKQ8fS7JPhPg0RpPOd2YPc/BRFd187DVxS08ZldJiGEWA6ACsL4zL2YVMaHUIKcgMjFNy+VOrc
	52OHqEPcbWnsSqY2FgM=
X-Received: by 2002:a05:6512:ac8:b0:5aa:5bae:e9eb with SMTP id 2adb3069b0e04-5aa607c49c7mr35920e87.9.1780065421236;
        Fri, 29 May 2026 07:37:01 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef3556f51sm3888107f8f.25.2026.05.29.07.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:37:00 -0700 (PDT)
Date: Fri, 29 May 2026 15:36:58 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Daniel Thompson <danielt@kernel.org>, Lee Jones <lee@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: backlight: document the SY7758
 6-channel High Efficiency LED Driver
Message-ID: <ahmkirIuOYhd1rkM@aspen.lan>
References: <20260519-topic-sm8650-ayaneo-pocket-s2-sy7758-v3-0-ec8194bbc885@linaro.org>
 <20260519-topic-sm8650-ayaneo-pocket-s2-sy7758-v3-1-ec8194bbc885@linaro.org>
 <ahllT_HVTAJ5MbkS@aspen.lan>
 <e3c99fe3-9279-4dfa-af69-d9366ab06837@linaro.org>
 <ahlr5PnX5O0tEd6G@aspen.lan>
 <4001cf6a-b7de-4933-96bc-c9b4ccb53e4d@linaro.org>
 <ahmfZ0tdxbVfD_y4@aspen.lan>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahmfZ0tdxbVfD_y4@aspen.lan>

On Fri, May 29, 2026 at 03:15:03PM +0100, Daniel Thompson wrote:
> On Fri, May 29, 2026 at 02:50:43PM +0200, Neil Armstrong wrote:
> > On 5/29/26 12:35, Daniel Thompson wrote:
> > > On Fri, May 29, 2026 at 12:16:07PM +0200, Neil Armstrong wrote:
> > So it's not really 2 regulators, and having regulators means the enable
> > signal can be shared and would have regulator characteristics which it hasn't.
>
> Agreed. If the EN pin is merely use as an enable and voltage reference
> then it are not two regulators.
>
> However, it is also *not* vddio-supply and enable-gpios. We don't need
> the board design to check this. The pinout diagram in the datasheet
> should be sufficient!
>
> If you have to activate vddio-supply for the backlight to work on the
> board are you sure you don't just have a misnamed vdd-supply that needs
> to be taken care of? That would make much more sense given the datasheet.

After posting this I figured there is another possibility.

If the host GPIO pin is not capable of delivering the 1mA requires by
the chip then the board designer would have to add a buffer and that
buffer would need a power supply... and that power supply could, in
pinciple, be switchable.

However if that were the case then I don't think the power supply for
the buffer would belong in the bindings for the sy7758 so I'm afraid
whichever way I turn it I can't make vddio-supply make sense.


Daniel.
