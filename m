Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A0E370AC8
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 13:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924851; cv=none; b=dMc3WEwZ3Nxgy+vHO3UsWYeUx6w5Df2uhhCH+VyyiIxRmc8+tH7CvcsdUkT3x+NQ0hNhVjuiZXXfYkch1mJp6D7VsxreVv0LsatXF5SlldZ7oCy3telEYTM/ICVJtJhZSP+JFNC8vArA8mV7u5C0OyQDkvwsPtGr8Rqau7DebbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924851; c=relaxed/simple;
	bh=lPHK/ihuGBPLemRU0lPXBkD1+OkfE/pRAjceTfkiS3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fs8MQwMPd4+tUj1oDS5pSkib24vgdEeRfVsIag0FcokXAV1LR4hb9MS0wlpfqInCPelsLrKbFVm3gLS+GNYAgk4xwq9Iv47rnTzB3psk3QCwLxVj355hbT6qL37gN8Ae9csgtnreQK3Pd3tbD8u4j4hCe8KvEdz0BYBVg7PLX9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EnWC7rcB; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EnWC7rcB"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-304d8362a58so2520116eec.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780924849; x=1781529649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFJPSMXCi6b6l39VWDqxTROb6VoHdQrtvaD0s6OS/zU=;
        b=EnWC7rcBXstq3BlIiVBlw2fhDGeomCPlOpNavPR48UhvixSqe57BLwH1dwWS0HerUn
         btD4hrRmA6iR/SLA6TOueApC7Pg8sr6UUSQ2VH1C8joYw5ZQsL4ijw4vh1f0ZVrt5o3W
         +uuO9dNUIsvltBKweUJSMRyK8t6MCYJCL82RSzSTsD3NrqY8gNyZAh9nHkBCsk8jEQa/
         u0j8nR4+whSI3Z7xz2MCD51hYVGdMBGQ9T8Uqyg9iCQCB4TtVzqBCPwYnz0Wa90X+2Y5
         Yg4EynD2/edj2eUrDNgpLr//8RacYeBz66j5iL8RjKYP4296PWBMI+VRM+uThX/gTUrl
         LK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924849; x=1781529649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wFJPSMXCi6b6l39VWDqxTROb6VoHdQrtvaD0s6OS/zU=;
        b=eWalBNpUW/ltJJva7WqDnx7SFfSgZe76MjOJ2PqJQbZ4JXO64B1OHCld4nkpIFZw/y
         0msf5RgTdu1iJS771fvuJIX26nQG5vLrAOGVr9dxDoknOYrRfANJ1t75iBlQVrlNxNmN
         onLN5DcaEVNPJICDFmoVacIjmgq+SKGcSrXgdsWLW66CcPyTR/7dELPfxvAYfq4sFS0r
         y4lSRrfADC5vKf9Ouddmog8lJH9vqCxqgHYca/PUsK9MbUl9l6YgEcEOQfUOWN8Sn98a
         nrC/LU+zwPcatcza4OvT3VEXIQdfySaZGl2Mwr2LBe0Sjs7JbzyYGM5rikdWT/PHKhTc
         vnLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/U7Rm/own2spMAeqjZt2igWBJaJusqTUQiz5HO/MMOPOjkedqr5BFOoP8oGk9yvbEMFwyqQroV0i+y@vger.kernel.org
X-Gm-Message-State: AOJu0Yytiad3Z6WfBWBbBMdoIG7D8BUxg34iYvz6MV/MCi5b0QkZPpv3
	SrDgq4dc11HSCSMCdUKI+Yx6TVQORU0UwsRkSX/XYt6fMijG6Ao7r0g5O5BfUzzary4=
X-Gm-Gg: Acq92OFm7sWvZIzz6Hmdo/ciufiL/giEKsv/EN2kCHbA5FRs1ZTnYaG1EtAmv6VMmEB
	BV35tw3Lhyjs7c1PS1mO7qSlUz1on/2pwylA+kf54+aso+AHHGL1YgRLTSVO3uBoeUV5qPN7kON
	VieOsIEvQCtQVamwoFwTjuoCrw2q5EBjAYY/yEeyv22/iFdomztF3eW/hNFoLKWXsrwr9wiep3A
	xP6nVRdVwU+zJvTHi6GprfTnBWi7pFmTghYMYt2JyVCirCVDD7CZzHxSeA1yFqykFHV3ks6UsiI
	cb16TgtHJBezpZ8ALr30TJkbcPpmC8pjZ2l4A5tbJnR1wKEAl4sau7er0ZmwQwA7LbYnPU6oha/
	Eksy2O8ryGNZEfQPaac3+xvsJz9AZJubbPiVKt2fofNFGf4VXZjbq+GUAK3LXCEzgEqGz7nYVw7
	aDT2hRpUkEClSJZP83wAX8mjIRjyWG9xYZG5Zbs8EfGjU9E02Bbw==
X-Received: by 2002:a05:7301:6098:b0:2c1:67e1:61a9 with SMTP id 5a478bee46e88-3077fff14bamr6004505eec.13.1780924848991;
        Mon, 08 Jun 2026 06:20:48 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df9bbd4sm15481288eec.30.2026.06.08.06.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:20:48 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: sashiko-bot@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	jerrysteve1101@gmail.com,
	linux-input@vger.kernel.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 5/8] Input: cap11xx - add reset gpio support
Date: Mon,  8 Jun 2026 21:20:42 +0800
Message-ID: <20260608132042.547421-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606151346.8C5861F00893@smtp.kernel.org>
References: <20260606151346.8C5861F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Thank you for your contribution! Sashiko AI review found 2 potential issue(=
> s) to consider:
> - [Low] Inefficient delay using usleep_range() for a large duration (400-50=
> 0ms).
> - [Low] Missing explicit inclusion of <linux/delay.h>.
> --
> 
> commit 83de47341df3454fdb8216dc0a95948c3f158a40
> Author: Jun Yan <jerrysteve1101@gmail.com>
> 
> Input: cap11xx - add reset gpio support
> 
> This commit adds hardware reset support for CAP11xx devices by toggling a
> dedicated reset GPIO during the i2c probe phase. It incorporates specific
> timing requirements for the reset filter and active reset duration.
> 
> > diff --git a/drivers/input/keyboard/cap11xx.c b/drivers/input/keyboard/ca=
> p11xx.c
> > index 686174722204c..7015aa7654ce7 100644
> > --- a/drivers/input/keyboard/cap11xx.c
> > +++ b/drivers/input/keyboard/cap11xx.c
> 
> [ ... ]
> 
> > @@ -452,6 +457,17 @@ static int cap11xx_i2c_probe(struct i2c_client *i2c_=
> client)
> >  	if (IS_ERR(priv->regmap))
> >  		return PTR_ERR(priv->regmap);
> > =20
> > +	priv->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LO=
> W);
> > +	if (IS_ERR(priv->reset_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
> > +							"Failed to get 'reset' GPIO\n");
> > +	if (priv->reset_gpio) {
> > +		gpiod_set_value_cansleep(priv->reset_gpio, 1);
> > +		usleep_range(CAP11XX_T_RST_FILT_MIN, CAP11XX_T_RST_FILT_MIN * 2);
> > +		gpiod_set_value_cansleep(priv->reset_gpio, 0);
> > +		usleep_range(CAP11XX_T_RST_ON_MIN, CAP11XX_T_RST_ON_MAX);
> 
> [Severity: Low]
> Does this regression introduce unnecessary overhead by using usleep_range()
> for a 400-500ms delay in cap11xx_i2c_probe()?
> 
> According to kernel timer guidelines, usleep_range() is designed for short
> delays (10us to 20ms) and sets up high-resolution timers. For delays longer
> than 20ms, using msleep() or fsleep() avoids unnecessary overhead and
> expensive CPU wakeups.
> 

Agreed. Will replace usleep_range() with msleep() in V2.

>
> [Severity: Low]
> Could this regression in header dependencies be avoided by explicitly
> including <linux/delay.h> since we are now calling usleep_range() here?
> 
> While the code might compile due to implicit inclusion via other headers,
> relying on implicit includes can sometimes lead to build failures on other
> architectures or if intermediate headers are refactored in the future.
> 

OK. Will add #include <linux/delay.h> in v2,

> > +	}
> > +
> >  	error =3D regmap_read(priv->regmap, CAP11XX_REG_PRODUCT_ID, &val);
> >  	if (error)
> >  		return dev_err_probe(dev, error, "Failed to read product ID\n");
> 
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606150458.2506=
> 06-1-jerrysteve1101@gmail.com?part=3D5

