Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135502;
	b=zEdFGaRPokxo+fDFZ0y7/B439Pds1J24tDWOIYzhWtz1HnsYN0ZRyEM5ZbapqdJ88LpF
	 ikYQJxWEUVnBGxhhJeDS5HlQ89r1bFQlzRtge/EXKXEOvIzNop51jz45ZVpN9nIDqOLm/
	 SGE/ilJ+8oN9GrYcGdBY6ZSVaYHtidK1ntu5idyRjsv74fmOUhaE0mx8BmRIzt2m7Aa82
	 59AY1oBAbcVr9BXC+BkvSfKWQPe0fJ1XqiQX17BoI9NUQtp0rv5i4e7i8zPqDnDs+CmM5
	 /mzBHqCYlENE1OkcnL6QjgqkOpiGCf4tUt7hv+5v8xj2YIrYjel5R+KeDKi+Bb4PoPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JRTBHIpTWIqBv7r65/gBAKVj+F4qPH6q/QJn+QQC8WA=;
	b=kvWoZtzR9BmOHOPVCMx+DmOAsrXfd70PWXpvLvGRd/s/zK/HbP7TUclvlZqzcDz9cMAI
	 DzikVf6zUnk0Ggfh6ytd7g7EJNA10woeJVoZxZb1QJM+EjDHj/jJcHkgzC5MH/BRXc09q
	 IE7E1rAitpjqzBcBougbHxXSirzEFQTQSbuGDOJJhWFeWDHIBT0PvXOh0ebY+DXNci7eI
	 uwCOGEwAJ9AFiUPI+ykWDAZYOKowtLtfXfwNwUd7Pu2BL8AJPIPWklq289E42MvUvvph8
	 etanCrDJk8nI80o8cMnwiHNDb6uQiBPfsWXBHFFa1iFt1PSWjdu1r9rL1PIXLh66Tfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="k5jdjNR/";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F143606A330
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F143606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k5jdjNR/
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so257392f8f.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795135501; x=1795740301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JRTBHIpTWIqBv7r65/gBAKVj+F4qPH6q/QJn+QQC8WA=;
        b=k5jdjNR/v147PjWndPSaowkaaYUjxKZbPyy+9vufOUYKCBt7oJTuUrrfV35VtLkiPG
         zzZq+aR7MerRh4gzoH257V0QyxeJEdsd2noayoFggVhF4H1eM1BNjee1Mf1lqSWnSUso
         pweYMgShg8RNhgOjaniDllXJnxqFyyok8g7QSHh4F+DEcXBYf9vFi7D2ymS27Cjv+lx2
         DA9cpUWnIyMslfbpb7cLqeudDUOEcR7A8gu6kEyfzOQ3e3cmanoGkkWcZodD1nvD2E7l
         FLUFV8Ht+js/oju2QPsb4quc0lPcLfSxhY+cyyAe8Hvp2ti0snRj5uEbT98nNJYsmf09
         iVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795135501; x=1795740301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JRTBHIpTWIqBv7r65/gBAKVj+F4qPH6q/QJn+QQC8WA=;
        b=nIFMax4WPOvYXGX7F6CC6203CeiZHd+jxJHWTH447uPx/zZQKhNorvEvgSa/leA4MQ
         XiI77ifPwggUDxTOb/TAv6bCsOQtWB0As/w66uPfbC+u77uw+lwi515y3imI5iipheOn
         Gj6PcAnjtUBwvsVOqvb9btXCoBdxlKS+avVCfZD+DP9xSI8gQRqOpLkvqB/SJLTTUDr8
         TIe06S44sNWH6by+WbJfWXFXpPD3Vh4PrAOF6Ui+hZr26wHYFlU5kQjIo9LPXtV6Tsn/
         uQzhtDjFyIL6kTOPnivajRR/Zc8j+x/4PvkW9BzOr3fwb8X+42OEKOdHUYWnn57iOPo7
         sOUg==
X-Forwarded-Encrypted: i=1; AL+hErFcGL3rvxxSCbey9Vi81LO5f0hf+fA7wQRVtqgGqRuvgfmNhc/rV1hm0vznl3fa+MivhbgQD+5V4Gg7@vger.kernel.org
X-Gm-Message-State: APuU4Z9FLuK4icbKPnGaHJumda5tHE/H8SSlETy9cFBl49msOFglc5U5
	q7LTJOUns+q5KCeN3LF6aCbc+1yYTEoAdvIK4ji6eTdPr8UsgdI5KYmAZxnNMXF0toU=
X-Gm-Gg: AZFdTZdVcrsVPdIcPGcux8yZg7EeRSSlwEfIFVyJFVQyhj8geYtwRekyu6rqnkgxKN6
	5vYDnTFwSM+Ceb7iBsZXV+g0nKhgfwtA5gdKH35iZi99n0mqlA0yVJlCUCXxkfXUIWEqUR5ncb4
	/BBopz1bPPieZ+hvZsgdeulZSH9zz847/etaOQx3nl/VJwGjj4V4dJ0i2uNwyQnfeop8QthpDYr
	+ftOkFPyguMb75G++tzov9QKGxDxeuSUrCaiuJSRhmkT4uwSY7jPDM5Hu6CHnuY8hGDBAPPBJii
	hdT2qINVE82QsEBy5g9t8yfYFpGXJUCnfhFV8SB4W2oxoON7gpitSc4ePhxDFcVxCgeqZvo6q4p
	OyD3FhAjTHXTq5Q3SMTJJtCdSZKH4FqjqWzcRASUZ+vc5BrgcwIdhXNClGuGa5bPIe7clTXyMmU
	5z2Tx7YER70lbdFsOf5GCqrBOdvyQiy2L7bcf0QFI+XiOzyyigfTW0osTSRiQ4SMNWsBFOHzlH0
	WnT5yi3WvSk0kYcGcwqk1ioIONyYEsE8sgw9D25Oe6ZnqMuB505OCtERYGSmIEt+Q9xdCO67hfj
	bys4XwE0lYQ8g4FoekxrRiOS2YlkVZwUJ5B51g==
X-Received: by 2002:a5d:5888:0:b0:48d:f488:f32a with SMTP id ffacd0b85a97d-4abb55183b4mr2133903f8f.56.1795135500681;
        Thu, 19 Nov 2026 16:45:00 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:10:5673:5f22:93eb:1bb8:839c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm2438480f8f.51.2026.11.19.16.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:45:00 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Gianluca Boiano <morf3089@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] ASoC: codecs: add TAS2557 mono smart amplifier driver
Date: Fri, 20 Nov 2026 01:44:38 +0100
Message-ID: <20261120004442.1687225-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <de369f10-e7c6-4528-aa57-56241bf700b3@sirena.org.uk>
References: <de369f10-e7c6-4528-aa57-56241bf700b3@sirena.org.uk>
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

On Sun, Jul 19, 2026 at 08:05:19PM +0100, Mark Brown wrote:
> This looks awfully board specific....

v4 adds ti,asi-port, and the driver programs only the selected ASI,
on the pins the datasheet marks as preferred for that port.

> I didn't check but is there room for sharing code with the other
> multi-book TI devices?

Yes. v4 uses tas2781-comlib-i2c for the paged regmap, book/page
switching and per-chip access, and drops the private copy.

> The tas2781 checks to see if there are one or two devices being
> controlled by the driver and rejects a mismatch.  Also, is there some
> overlap in firmware formats here?  Again I didn't actually check.

The header has the same layout as the one tas2781-fmwlib parses
(fixed header, description, device family, device), so v4 uses the
TASDEVICE_DSP_TAS_2557_*
values and rejects an image whose chip count does not match before
installing it. The body differs: TAS2557 images carry a PLL section
and each configuration references a PLL by index, which fmwlib does
not parse, so that part stays in the driver.

> Shouldn't an out of range value be an error?

Yes, the image is rejected in v4.

> Does sense_muted get handled properly for suspend?  The core mutes and
> unmutes playback streams over suspend but not capture.

sense_muted is gone. The I/V sense ADCs feed the DSP's speaker
protection, so v4 keeps them powered and unmuted while the amplifier
plays, as TI's driver does, and sets no_capture_mute.

> This won't actually take effect if the device doesn't power down - you
> should probably not set use_pmdown_time to force a power down/up, though
> that's annoying when the configuration is the same.

v4 applies the change from hw_params() when the group is already
powered and reloads the configuration only if the new rate needs a
different one. use_pmdown_time stays.

Gianluca
