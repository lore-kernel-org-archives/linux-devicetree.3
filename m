Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DBF13DBA0
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783945007; cv=none; b=b2ogHax0151IydYZlAm1Cy7EMMroMKPGvagEm/bd6zp453GCewYGLRWmCT15A3SwNF3y9ClvhjnB8cnR+moblwS3+p4cu/ksZ0NGcZcqGRNAgw2HhCG3pIYkY040orrbfDKs89LS3FbD1WF7fb4mqLl6ToNt3Bakn8MJWw2ONYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783945007; c=relaxed/simple;
	bh=9DwY0EWtvrVt1E3O4Huj4v9hsG6tbLqt3e/DEGmfUW4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gIcESkw/ALNC2fl1weMQ/kdmGekPJXFZZRN3ZhTeVPTX48zTkGx5Nx7QR/IsFRUJPEE3WIfABcsVWiUxNqIO6ImggwQb7n0aezOP8jfqJ7IAKUr8MxdG/OF4KK665CjOvfzS05T4OH5G6NXj86gSoUpBjVZ+92ysA+WrdFIwDDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7IJIvnj; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7IJIvnj"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493f60208a5so26550005e9.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783945004; x=1784549804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iqqJJ9FyIGtHtJDiES6lZUsG9C5zMY/mppk79Od2qqo=;
        b=D7IJIvnjyy1cahE85bOdMunnOlUq5dtD8Z83kJZ1seWHbjBzHSYcUWSPC4mEzRyqA/
         +ADYlZwGZibQWZ5w3njQPnbe8DAwuxP7GmABb8nE7qP0ejmQDzSw+Q+DTypU7o+fvIKM
         /86d+WlSqwlQWDcq59IDr0hqKAlT0mP/NP8yKb1huUJa2Fze75umcHuGOW/IF9oU40t9
         YPyWYRskMBAc/471DOwDUZ0wILcdGgZr6A9vteq5pC9I8SXOwW0FyXIv+hfthA+lRq5/
         Hya/GP5sKFmGBha9E450nuw6OSLbmTX+dl41u5WdnDb5GSmirbzxIE1fiQG5UzzYbJEE
         uzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783945004; x=1784549804;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iqqJJ9FyIGtHtJDiES6lZUsG9C5zMY/mppk79Od2qqo=;
        b=lXqSD2Hwb0H/UtRENl82L/sfrDxtDVjwoEYtKFT0dVSASwmRlx75NVgHrbUypiM2rh
         VV50SSwWO7f6z0+wpFWcI7IrBGcYpPraTszV4D9uSRZ9t9KZasMRReIDRMejvDb6YnvI
         6gUFkj0pSrYdLyy0RX3Dq1/arvcXjx+O+uX2VnFOKPVbqw93kLn8xLOdMXLUZBp2dTVC
         6kMO+Mo3sxUMxM1QtWeEXoxmUaFBjF7x9d21rSEWvHPF2V1OnNm4XK900jzWIFCJvkvR
         MJhuN7E8csap3DtuRKxmchRhMsaHLCoYLBzJhrPvUmIvb9k8yW0tJzTeiH3JK1JrO4iN
         lBiQ==
X-Forwarded-Encrypted: i=1; AHgh+RowCvarXOOYUJvRJDxpcAC4Q8DPWTqDDv1aAFzptsdo1a1R1P5iw3zmhh65XO7yYdTpNzEWvf7UoyJO@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj/CD8GvOu8cZE+aO1DzbwnZMtsw5gv0oEW46Uqkx5R7JGLHVL
	hoVpfDp80BuVGwO+7QXdfewzkrDKZ45U/26b0vPXAA1aZhuXowplHT+r
X-Gm-Gg: AfdE7cm5n7GPe3o1fWsfjxH8QXnJfaud97FoV5rO2byrO2SYyuMBWeFdc7bDizVVYn3
	yIf8CKHGEimmY5y2DDZn31SUcZZTzTyvcmGpp32BBmIn/o1aXn4fdMv1qcI1ciktm5aOiE2WecU
	PAquDz+ClfoOLAcrCWurONaFRo8xh7vUfRTjYkbN+NKFNre+Hqa/zvkebM0N4v2Q6GcBSMMp/B0
	T50JJoo4bqKkwIMMyKilw/4hKZBWFOVqHrBy3bjHnV/JaHDxNi8levRo+LkOkl35jqKPGe4Kaar
	C62s8VeHgGp5td6vCw3WR3xUrOVJh14ZY9KTpUYgiJIFdvKHdRo9bjNbTycCQUkRG0a/PnbdC15
	xlLOCHdLx/XmPdCysUhsUsl0+Rm+lQ3z00r6BDpcWse1Eu0WvBXMVoWSW8/KZyV0dO0HM+ItAXI
	s9JIiHefx83S5OXSIa00UYmDiqZPFo8jySdC0sCnQw2Jp9QDVRcSYQVA+osInJMw4r6YE+GF8rb
	MxGSuHxEx7lveJsGDbskuwfdOuPmbfy0x9JJ6XbZSEVLtt9/+EizNLceGMf/gP+MiVaUqq/w4h9
	gCpJNNxEFRtN66Xrk59mSuzFSUVv0+QcxaDqizMxLBWrPiP7XA2STeCn77f7WqgfTn17mVWsRrb
	KHU3V+YiskZUT+nruJZYseKY=
X-Received: by 2002:a05:600c:4746:b0:493:e034:a3b5 with SMTP id 5b1f17b1804b1-493f8818cb0mr99609145e9.24.1783945004024;
        Mon, 13 Jul 2026 05:16:44 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb73b161sm323603485e9.9.2026.07.13.05.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:16:43 -0700 (PDT)
Date: Mon, 13 Jul 2026 14:16:41 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Stefan Popa <stefan.popa@analog.com>
Cc: Jonathan Cameron <jic23@kernel.org>, <linux-iio@vger.kernel.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, David Lechner
 <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Siratul Islam <siratul.islam@linux.dev>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, Ciprian
 Hegbeli <ciprian.hegbeli@analog.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] iio: adc: add MAX40080 current-sense amplifier
 driver
Message-ID: <20260713141641.0000027d@gmail.com>
In-Reply-To: <20260713120226.90303-1-stefan.popa@analog.com>
References: <20260703102941.1141341-1-stefan.popa@analog.com>
	<20260713120226.90303-1-stefan.popa@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 13 Jul 2026 15:02:24 +0300
Stefan Popa <stefan.popa@analog.com> wrote:

> This series adds support for the Maxim MAX40080, a bidirectional
> current-sense amplifier with an integrated 12-bit ADC and an I2C/SMBus
> interface. It measures the voltage across an external shunt resistor and
> the input bus voltage.
> 
> Why a new driver (Andy): No existing IIO driver covers this device or a
> register-compatible part. The closest relatives (max9611, max34408) target
> different silicon with incompatible register maps. The MAX40080 has a
> unique combination of bidirectional 13-bit current, 64-entry FIFO, mandatory
> PEC, single-measurement mode triggered by SMBus Quick Command, and two
> selectable input ranges. See the driver commit message for the full
> rationale.
> 
> The datasheet link is in the binding YAML description.
> 
> The driver operates in direct (INDIO_DIRECT_MODE) mode. Each raw read
> triggers a single on-demand conversion (SMBus Quick Command) and reads
> back the matched current/voltage pair, so results are always fresh. It
> exposes the current and voltage channels with raw and scale attributes,
> a configurable oversampling (digital averaging) ratio, and PEC-protected
> register access. The two selectable current-sense ranges are exposed
> through scale/scale_available (the range is chosen by writing the
> desired scale); the current scale is derived from the
> shunt-resistor-micro-ohms device-tree property.
> 
> Continuous FIFO buffering, threshold events and the alert interrupt are
> intentionally left out of this initial submission and may be added
> later.
> 
> Tested on hardware with four MAX40080 devices on an I2C bus.
> 
> Changes in v2:

Please don't send a new version as a reply to the previous version, it
breaks people's workflow and tooling! (tools like b4 may get confused
by this).

-- 
Kind regards

CJD
