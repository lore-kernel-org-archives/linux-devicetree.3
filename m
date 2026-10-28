Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793154626;
	b=SLLTCbYakyWZiUU96s+YYxRAnzQtRQ4ni+d8TjdmvnvG1bGClSTymCWkXAYATkS5jEoE
	 2edMDcysPzWjJmCjW6q//cu32mkj1LOkDtUnhXT3+UoRhDPAKDamMQk2PFsooNdLfuxlg
	 8pwBZOQ0DfwcaBWJpfJaGukz/gi4bny2x5LnVhb6kIR3Vs6F8+L5PswYdhR0s5JxX99RX
	 fWRnS0dv1QT6fTP+mj91EIGQiOvdJ4W1EhO7RvFuFXf60Xbph6EziIGJ7HfSOxFhmDDOv
	 z8GZVZ8ihM//H3MG/rnbaaHzabtPhFVZYENoatRToCgcIpS7DL3epleDHFipZvVOuBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793154626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H6njA8hThba7qi/jT4brciMNl8e/UmucJb9lemJ86+g=;
	b=Zz7v/thqWGZQpBj1ehiAHTysHq/17DSSN3187iJvSMfrk+H9f3T/dw9siB1g7txpIqqF
	 bk57CU+kjjDbs5GoKP4BlGEAXbxv/M1hcWvyYv0Trc3a0Wa36Qy/CUCz+kB++L0RRN+AF
	 Hz1alWhJKU0Q8lhOw+QWYXV7MlBtYzUSIOi62JNIkZflC/YZn5D6U6E2kzzv+8rblUTBU
	 sruBG9QVP8+FA90vgf7lFR7YwS5+oefa1iNQkFSQcnyA0FWdOpgujPd5YpMsSwwJmKXx1
	 ziJ5hcAU73Jf65tMCqpxCr0+TMB1T+vcslTREWkzSO6aBf6UfWsqZaHITfg5ypm4Jkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Z/FBcu0h";
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A372606A31E
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 02:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A372606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z/FBcu0h
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7a6e560f580so339897137.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 19:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793154624; x=1793759424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6njA8hThba7qi/jT4brciMNl8e/UmucJb9lemJ86+g=;
        b=Z/FBcu0hjKcS82+4EvqpgC7rUp3tcRi9xHWrzEFKKFZMlEP6VGPNTRRZS+eyjZAaPJ
         v95c4AuAnTD2Pn4KUoFrpZU1ckaS7AwDTAFi34N0a66y6w2RcDQJqzhMsheX75GmwVZG
         2/ueA94G7C2g4RGeTVJ4fCrhXOVAxOwaitmimXXi0h5XuUk82+r6QQwIfrpGqkJkfSKg
         lqhmWfOPP71lHiTvhP0ADYM67ltDOp7ERCid3VZXnav2mohlhSjNs2JSY4Io+LGTrfam
         83BLBpkNAIonrmSUd2cqnnvK9yQuBKJXqHxTHtpQkL/HExV/glAbTExcoR7R6qdFKyOg
         j9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793154624; x=1793759424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H6njA8hThba7qi/jT4brciMNl8e/UmucJb9lemJ86+g=;
        b=ScpND5dckxh4qu90rOUD89x7qem6T3rN26bqQTcQrk9iWfKULcwpC53AeF89S/1H9B
         iWMZ0sRjowhmJTESyqQuGp+Tf+lc3VAAe6emzAaQjFdkNCJlCcG+we23LAii3xNDsgHc
         /jhbyWjBUjIuIL/nGQiK5NvV1Z98V9mkCVyzigQcOhIenBozcjKOW/lNzQq9ksX1FjrK
         9jQ8W3b2vp2n+R8JdMyFkeC6WSnmjan6Olh0vaROE3hdudRVxvzSeXz2bPIv6m8TGtLq
         bxi3CePBMBHcS8WTWiQQDlq/jfO4NoSuXcySsO3MfHaP9XXd9vat2agae8Z0aMR5qbnz
         3+sA==
X-Forwarded-Encrypted: i=1; AKwUvBxUuFVghXGP2poiTQ1LRrNDfUJdkc0wgEI0C86j5Dg378gsQ3SIwQXOJWQhW2fX5ngUbROtl70EplnV@vger.kernel.org
X-Gm-Message-State: AFq9FYIGK14VJKIYFpnYvu3hgse34aEt1395VUym0JB+3FSLYp4v3/dy
	AGRME/nT/jbR9Zn+oFrR8HXRlt8tCzkdEUskBg99w/sJy2ETrMTE9F4G
X-Gm-Gg: AYBFou3zLrB9KN8b2tUQ3LwHN39R9RGBKPMDqytraUi3iRg03PY8Ky9FFHzVOmBtwz5
	wcHJCz7muMFoHX+a8vBgu34yH32fQpv1byiJvExaUaY+LGU15z+19eh8ye37svtnGqt9z5Fjp9f
	7PI0bk48W/Kx7K/TPVgt5XKWhwi5KCqEuEoZrePIKis4YkPZrja0Y0Zm1J4CwVReYZJplSDkFzV
	dRnsW3rG9gHjPtPSgD/asoBB/G7x66PdMeTNydG3+GkF/L5ykeX4RPJb9bnVR0etSDfaSCOGoBt
	yrJSidu00wgfHN/ud20GCfNCC15amtvMQlp+KQ7HGbuXuPdzifR7dSEexJyRiYIJ4/0s5muKta0
	UbCMJcZK1YpU3/R//Ut31bVDnvGY8XNOXkUbFynyYSuLgkl549J9d6LNBG1fucfq/DVwSLkcFsi
	yPHSQcbbucwGha0U4tD/4jkG6tq2sPVxvZCUw77k1j7iwGrOsNlHi5OvPzuHIE/qi4edno9SGd2
	0d+V5dG1gSVLSsc4QzfSx24FKDmbDum+wsn031AJYEwbnIEWsNi8gV7CMAX7fMUKy81HZYeuzYe
	qWP+abNGUtIDOMrrVatjdTRZlAbZZNUeKNomvoiGaKUm7DJ7SZ+z
X-Received: by 2002:a05:6102:3fa8:b0:7cc:776:6c5c with SMTP id ada2fe7eead31-7d03a4b9a28mr541141137.7.1793154624534;
        Tue, 27 Oct 2026 19:30:24 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:4df:52dc:4559:394e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f5cebbbsm486020e0c.0.2026.10.27.19.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:30:23 -0700 (PDT)
From: Stephan Costa Barros <stephanbrrs8@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] iio: adc: ti-ads1298: add ADS1299 support
Date: Tue, 27 Oct 2026 23:30:14 -0300
Message-ID: <20261028023015.31876-1-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <at5nycDs6ImZV8X5@ashevche-desk.local>
References: <20261024231335.280955-1-stephanbrrs8@gmail.com> <20261024231335.280955-7-stephanbrrs8@gmail.com> <at5nycDs6ImZV8X5@ashevche-desk.local>
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

On Sun, Oct 25, 2026 at 10:34:17PM +0200, Andy Shevchenko wrote:
> Make this a list, see how other drivers (recently updated to support more HW)
> do it.

> Fix multi-line comment style, make the text of tristate in Kconfig, this one,
> and in the MODULE_DESCRIPTION() the same.

Will do both.

> > +	/* TI sells the 8-channel part as plain ADS1299 */
> > +	if (indio_dev->num_channels == ADS1298_MAX_CHANNELS)
> > +		indio_dev->name = "ads1299";
> > +	else
> > +		indio_dev->name = devm_kasprintf(dev, GFP_KERNEL, "ads1299-%u",
> > +						 indio_dev->num_channels);
>
> Why do we need this? Can't we derive it from IIO ABI?

To name the part, as the driver already does for the ADS129x: since
ti,ads1298 was the only compatible, it builds the name from the ID
("ads129%u%s", so ads1294, ads1296r, ...). The ADS1299-4 and -6 differ
from the ADS1299 only in channel count, so the name follows the same
rule. Userspace can count the channels, but "name" is documented as the
physical chip. If you prefer "ads1299" for all three, I'll do that.

> It's not used outside of the loop, make it local to that for-loop.

Will do.

Thanks,
Stephan
