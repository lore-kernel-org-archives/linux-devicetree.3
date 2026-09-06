Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EFB31DDBF
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 17:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788715751; cv=pass; b=YjYQ0vevTONPT+cIxW3h7PoIXT+30eV51iJchPzUEoLzE05/V8KSmQtIjX6ZyIhDY8fAnGcaq99voe8MwWaSHzDusKsnGN/fgPviukRmTqY0BKQ43Nvn87G8FLWeOvrULmSNIB1AbeeXSQ34dDVXi5Fb2X0FX1JhgnYNS26pK1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788715751; c=relaxed/simple;
	bh=5DEiI0XOfcZ/AmMcsore77sSwCupcFULPw2OZjhCwgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JWwthxSWpVFdcVE6HoL6UXgK72ufz11Q/jzs13GA5dApV+CO/8AHP9o7YoarosijGZFVtG/cmIyrncdNVIw0afsq9OCIE2YfIBpgTVQMZ+XktEe6/2J+Yb80aSEddNDCoi/5pgWKKYERscDBbdCe/m82b4se+zJzsQNEar1Liok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OF8j2/e9; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OF8j2/e9"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso27414375ad.2
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 10:29:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788715750; cv=none;
        d=google.com; s=arc-20260327;
        b=P9a+bBPwvQRJh9vQW7LLkQkcEEsS3cU8r8mACte1XB7bt6OJ2BmD8dGU07Wt+yOnFD
         Kfwj7XG4iA7gN/lfo8LfeW90rnymDYli3xlk6ykrT0bOp5Tqs3dguo1/DJUPjfzWTuh1
         /7k4YGaZQbMN46ey05LS57wrTuipeQguA5uRnhkt7shpClhjecODlhJc+rI7k4M1e6Ho
         nXTcNnqGwTwRFaUHRBmKyAtGs6GnKSk0R5i4JOyyNDFw8gbawQQxaZGIKV8eVesXi9Yd
         x8nPqEdl3MmTnDo4owWLD/9a7R/aN4l7ISsVb66j/7itsijQPgc1wdgUsqrNjJ5lum7a
         aJcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5DEiI0XOfcZ/AmMcsore77sSwCupcFULPw2OZjhCwgo=;
        fh=SKAAArnhPHwH6DPn5HKffHqMy5WORAF1zX3SpfixdOQ=;
        b=Yco+MONpdT2R6alFPerHPegoaKe2JGF66HcTyyTgJv7C3KXNIV/LLONJohfRgNzCAA
         eC2Jv5paLdKqdbFfqTXSSkN0bnnxmuKutnnVXzjYh37BootRqVbfoL+WPqBeBgbvxyLh
         KUap/3KWLxLfkObcaXJnucF49qqG9MMRYWgpNG35kkPzMyOmO1LGqmB3IrZGVe27i0UZ
         PcNJ6piT2T9SZhXArGveK05k3+upUBrH6s22NwBxeDKRolF8ffZlT91gLgLVxFq9c7s4
         n5UzruC64u6ywnbHfrk0k+PmIo2SmCDVV0HZW0oxj5FoxpRwULIGcSAyoA0jxP+r6inG
         1FKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788715750; x=1789320550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5DEiI0XOfcZ/AmMcsore77sSwCupcFULPw2OZjhCwgo=;
        b=OF8j2/e9XaMRw5ga8VMjNKTjcE7mR8jmZcAz5h3CAi+h5rCxFnYnEfwtjWc3daAtRK
         wWR3rt+PNnSrR1dFm+5ceUKKbPr4kqSvRyCTz/LEFdlh9sh8dDoqIPNAsqZystl9Cnav
         h/mCpA3lAUX61QIRfNqgQASSNlTzGgBGgTW7NJkBEbG7kLNVL7WTiYZVgCutRYCZqfmg
         fon2Fm5XPPuRiy6UXv9I2qR0SiNCt/QmbKjqeCqDDbm/ZwXZP15ige2qp3w9gsZ561Qi
         bZ9IXQ9hJe0u3MpgmjeCLTpgaXSNYVxnC4DC2pc10S1zGMdMJ+4zTlsFdSmNuItXxe5+
         Hjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788715750; x=1789320550;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5DEiI0XOfcZ/AmMcsore77sSwCupcFULPw2OZjhCwgo=;
        b=s2UTpHy7nGoAKNcsDf08+/TxZA1QTeEHELelgKQPqaoSuFJ58HbSeQmFESABRokOcz
         atvJwY04Nixqq/Rcq2F99rm9cRNLHMnzMxC4EP36AQQ+KgEc09x2+bH89v9Fc/HxKBmi
         yaCfrm7l+eghkO6vcm85yEFMLeTaLFP7rET11OpixBrYZyeTMQ3B5tBmQvxkGb6jOY3N
         zLcDEDHFic/3fvzSjo7QApbee/zag2w+n4MEKGOQttGk0m33YeyWoH+YjOAKID/FQhmf
         fBSiF+y+7wMF8tM7n4Bc8ZhmLPSdzfBhm2FAspBSQZ0Rl6H9oHRFu37frrGfjwWkTgyu
         t7dw==
X-Forwarded-Encrypted: i=1; AKwUvBxhWYwsjUMDnEG6plMyDPEPciEOcDpPRVfDPAehu2lv+z2TQfbQO0HeNDvse/J1ZA7kw7RGQfMbu7CK@vger.kernel.org
X-Gm-Message-State: AFuF++nbIeVQm5S271vmpZLtHWoJFASbh2H22QIDeJL1hXMmHdf1m9MJ
	zUElGe6Sr0Vt1horqN+7BeO5DxgTyKmXNkRmoLz3pcGcr9hxy9oq2eIvAW4EJTBzNRar0GIQ/rf
	SEvbWBF0ZLOS9s7Dy5PrkltU5ALkBsys=
X-Gm-Gg: AYBFou0VRYaDJhFdrg4iA5K46JBquGjselqcH1fK+OFk8oVt95mWO2QqMJ3S6/fDrPo
	zDz7gY5tnPuITZuTgi79Xh0MqYnruSlxzRYHv1Vya4YVztVlPMPmX8yTWuTUKggxVdNAW8pPq+b
	QjGkavKCzPx1TyoTPvr16RmMcXYwQYWyOf8j76nZQAaeocmIvunJqUWopbmoQu0P2MAiIukY9G9
	DnLZ0KqfoGs9QvFz1BHTnxz6Ju9Wy43hHmloasg/eA/iJoq03aPhPVurntIRvxnbyHjVqATcxbs
	RPkVuinUbOInbpLDlz9nZUf2swzu63f8pimJI7TagGKGMqlnU/RWzKUsvIVXkSrWFEXcR4B3Udk
	4hQ==
X-Received: by 2002:a17:902:8a8d:b0:2ca:e19c:97b with SMTP id
 d9443c01a7336-2db122edd50mr199148445ad.5.1788715750074; Sun, 06 Sep 2026
 10:29:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617080031.99156-1-clamor95@gmail.com> <20260702161828.GB2108533@google.com>
In-Reply-To: <20260702161828.GB2108533@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 6 Sep 2026 20:28:58 +0300
X-Gm-Features: AcwNN1XWisbz2ascChHcLatRKYQPwdXAhH_U7ChBKnQiXROAqpt9L2vnmsacgR4
Message-ID: <CAPVz0n2fRs=q-1dAEt2k1FJpQVK9+PMSY0BSMB7Rs3F2xDyFvw@mail.gmail.com>
Subject: Re: [PATCH v5 00/14] mfd: lm3533: convert to OF bindings, improve support
To: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 2 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 19:18 Lee J=
ones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, 17 Jun 2026, Svyatoslav Ryhel wrote:
>
> > Convert LM3533 to OF bindings, add missing VIN supply, add support for
> > setting mapping mode and LED sources based on device tree.
> >
> > ---
> > Changes in v2:
> >
> > schema
> > - maximum led sources for leds set to 4
> > - anyOf > oneOf in ALS
> > - improved ALS descriptions
> > - adjusted example
> > drivers
> > - dropped devm convertion of irq and mfd helpers
> > - all als configuration moved into lm3533_als_setup
> > - added regulator/consumer.h
> > - lm3533_bl_setup set before sysfs_create_group in backlight
> > - added check if LVLED is valid
> > - LM3533_REG_OUTPUT_CONF1 > LM3533_REG_OUTPUT_CONF2 for LVLED4 and LVLE=
D5
>
> This set looks good to me now.
>
> Let me know when you have all of the Acks and I'll merge it via MFD.
>

Hello Lee! Is there any unresolved blockers for picking this patch set?

> --
> Lee Jones
