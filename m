Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451393B19A5
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 19:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779911348; cv=none; b=M1SEL4me6A7aPFRV56/oxQclVbskh0r87GmF0Ih9yoipyh+YRuCMmMmBjrcBLJM1IziOb6wVH1pPzSEf5tEtuR8yLihRKWVnbPKc9fBU89p5aQiN8a18LuT4axvhfa5TJVpVJd729ZTDIm7bpAksD/yybVFseBubKVCFTbC+TYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779911348; c=relaxed/simple;
	bh=mU6uiEFyPQxOXBAxbhYv5dtc/nadaxFqcLbIz1QvS0c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=olT0/z0eX9T5Wfj1JXfzowLfA0cum5u0lrUEeMBJPIzMNG/YHqbyP+58Mmq8lY+ZBKWXSglEdmNSzUmq/nM+YP0POyMEFgvwZssAMJeVBw/6U3WBBzPX0kyh8FTBSyPmAfYh+cg7EtJv69M/8Ic8FblbvH9ORTPOXBlrIqEG3Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=FhkYpkI5; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="FhkYpkI5"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so8540994f8f.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 12:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1779911344; x=1780516144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=murMYzJhHVgqoW77Z7JBip36jBDIzldhTLKY2xEPP0E=;
        b=FhkYpkI5qfvwmmaNIr4LIRp2DeO4vsRbO9D2EOgPoUiwjX6oQYcZVOsrHS1ClDDr/+
         bTLGJMyqEpe4eTZjIjubty2JGcD9kpCT/gTQ7++JU/d43yszH/F5cLm6Kuc9vYOC78CP
         B4EhU4mEX2v4TACRiyQXZhfg68Av8tM4R5Ft95KwlDaX5RqAAppieRV20tNGsEeC5CiL
         vgEnDqCeEF7XDoRrVddSsy4nuql+TLxbPPvxNspIIZGSEIiFoUiT8tftaSMhZBfyqH3z
         blRko5mHcA+lP+aaDq1TeIwqwlkovDe1R/oCCpKXUU81RJQkyEXLTlN+S0grrkC1iFN2
         PDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779911344; x=1780516144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=murMYzJhHVgqoW77Z7JBip36jBDIzldhTLKY2xEPP0E=;
        b=NCHXzG3GWczyBO6HgyqxbI+2/QRaVG5fyn4ulZRbiUhvAp6COoW3czATCvCtCWtkTL
         aCeYDLWtTu9L3JLJ+VrpEc7AK3mmHaAL+6wUFE9cElOhYqD2reMvVAp+lMW9uqdrjYHr
         601EKtyqQ0rA3BHo9DGA/V2fAnrYiL4gMDrJT0OffG226I0CGXdI7/21dtdbvblO6I4T
         rHVEGZrQkat2aPjhx1OVaUk7B++lko31+YG/rRQJO0vRXIuxLRfa+hsRqDmOGO8UCY/M
         xnkGr3CawZjuETKQZuhFQQeSfLW9wi1JcBY9OajlCHuGZZdZ6FjjjG+tq9FRPJ1zIcak
         +iUA==
X-Forwarded-Encrypted: i=1; AFNElJ+66/OXfMatlMPdTAzWtUUQBlG7jnx7Ha9v8CajDLbdX594OrmuFIN50oKl1zkfm8zRmEv8mkE5V4O/@vger.kernel.org
X-Gm-Message-State: AOJu0YyorZC97Fqy2/NLP/Ili3UeqoKLp+yF4ZNCYzdjpp228w0LCG2a
	+qTOiytJOIW5U8i0lOkgDRUSXNnVpZds/Z/etjQHjUmGYY3t1bQz5njY8Bwc4TX3bBU=
X-Gm-Gg: Acq92OFwQGYc0+zADzhavTpqISyrF+r4wwsJySjabPaZ/oU2cVoySfxdFuvpeXm7pha
	6bAneDxOMwNq+PQfRU6VGrXPJzu1mLy7PA++bGgG6mBIQkIUL+HwbDyeo9g02exqEjP8WnZO2xn
	7HH3w4JZ3lgclXt6Bpp4/gVuJ9aoj6xeygWuLxAj2W0wb+qmP/KBC3imnUlAo+1mjA1xwhuzHKl
	pb5iBVwepy2qsTmMHf+rC5vEvJFDyloKkSdB+HaYzm+tl82SmQQdTztcA6EeCrDkpYyRUqfGmwi
	7vDULdD0CkRGV9in7SDkDlI+3c+8nvIt1btDv9h3Snr8lAHqmo3QU49QkI9xWGvn4ms8ftlBlCH
	haY0gg4HaeIO+affRlIqBasqkLCD5CPfFqJyJF3fFzvuhEIrfNqsqA9uWBoh7z4hlGFvylI/PKH
	kd949mCaRk8oeEs1SeWN/JSFmeotdQDMFNemq4b1zrLvrFjj04Dzcs
X-Received: by 2002:a05:6000:25c8:b0:45e:b9b4:c68d with SMTP id ffacd0b85a97d-45eb9b4c854mr35834119f8f.4.1779911344513;
        Wed, 27 May 2026 12:49:04 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:bf97:2b98:8a4a:b714])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5a2a73sm8011158f8f.22.2026.05.27.12.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 12:49:04 -0700 (PDT)
From: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
To: alen.karnil@ideasonboard.com
Cc: asmirnou@pinefeat.co.uk,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v6 0/2] Pinefeat cef168 lens control board driver
Date: Wed, 27 May 2026 20:49:03 +0100
Message-Id: <20260527194903.10296-1-asmirnou@pinefeat.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cb202484-3a53-4821-b1bd-5f910e0cd953@ideasonboard.com>
References: <cb202484-3a53-4821-b1bd-5f910e0cd953@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 27 May 2026 12:45:26 +0100, Alen Karnil wrote:

> > Could you provide the build error logs and the overlay files generated
> > by the tool before you modified them?
> using the configure.sh tool with imx477
> imx477_378-overlay.dtsi
> ...

The files generated after running the configure.sh tool look correct and
match mine exactly.

> If put these into my kernel build I get:
> 
> $ make dtbs
>    DTCO     arch/arm64/boot/dts/overlays/camera-mux-2port.dtbo
> arch/arm64/boot/dts/overlays/imx477_378.dtsi:26.20-31.3: ERROR 
> (duplicate_label): /fragment@200/__overlay__/pca@70/i2c@1/cef168@d: 
> Duplicate label 'vcm_node' on 
> /fragment@200/__overlay__/pca@70/i2c@1/cef168@d and 
> /fragment@200/__overlay__/pca@70/i2c@0/cef168@d
> ERROR: Input tree has errors, aborting (use -f to force output)
> make[3]: *** [scripts/Makefile.dtbs:142: 
> arch/arm64/boot/dts/overlays/camera-mux-2port.dtbo] Error 2
> make[2]: *** [scripts/Makefile.build:544: arch/arm64/boot/dts/overlays] 
> Error 2
> make[1]: *** [/home/admin/linux/Makefile:1498: dtbs] Error 2
> make: *** [Makefile:248: __sub-make] Error 2

It looks like a different Makefile is being used. In the cef168
repository's Makefile, there is no dtbs target. Also, our Makefile is
only 27 lines long, while the log output indicates the error occurs at
line 1498.

Could you please ensure you are using the Makefile provided in the cef168
repository?

> >> there needs to be some further discussions on how we could
> >> improve the user experience when it comes to enabling the vcm with
> >> camera sensors.
> > 
> > I agree. I started the discussion on the Raspberry Pi forum, but the
> > driver needs to be merged first before moving forward with that.
> Sure that makes sense, lets focus on the driver for now.
> > 
> > https://forums.raspberrypi.com/viewtopic.php?p=2318070#p2318070
> 
> Also you will most likely need to update the patch since the line 
> offsets have moved to work 6.18

Will do. Should I update the patch before or after your review?
