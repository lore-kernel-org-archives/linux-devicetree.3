Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F3F258CE5
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971780; cv=pass; b=EeIy0JZMp/0yn5Ar34uOZbKBCwHPmJIli/ZmWGOKxEEix3HwKmgleV5ZMKAqwWRvd0/8uzPmiuvEjP992797U6QQ8H7JUzYXOTeEOOmS0AI7H+ckOlmFwExQlT3FwTEzAT5NbxuBgpVCGXgnOSqxiP2A6HDeG7/PEWrmdIwap3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971780; c=relaxed/simple;
	bh=ZPg3IVURet1hbZoryf1JRpqlHNpUVFH6kLrlECLl2SU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JhTKUPVqEo6Te4JqbYLR5HfconTqsdy64iht1GUOOc5DbU9hERJv3aN7srQKetBIVTwp4A5LlARUA/MIBEMJuECg+rj8Vw6IGdRrWVLHIRbzYFFoLZDUs08NzvqUg0qdqv4Ee6EyoJJkvO722AZli8cTcuKUCS1qvZ23mp94cQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2mmc9BF; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2mmc9BF"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5ba41ea31ccso4423446e87.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 02:56:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791971776; cv=none;
        d=google.com; s=arc-20260327;
        b=XV4ACirHEHVPmtnV+I16IUF0IIsHIjQoDzOCM4kqiQHAKddFa/KY9NkIOSRbrzEz+N
         0ZOlpgaoooBxnXLcBOpf2Pj9GGEbI7Gupzk3JzLYsiiCBGuM8mXvFUlHKu4JzTUhGcs2
         vQeH7oNe2nr+4U+/6kpc39L9SwLlN242Fatg7Fh2uP7r0ahbT9KY3IRwQ7JY2lWxy50r
         tbK3FloZk+PP1lomICeE2YK3LgyJ7AjdKco1legqWvlXCXTFLzHh8YtqtDDGP9HBCge9
         By/NCxRyhjjvcInxDlxcYYUjjPj/0VwsHdqtywfvb+PkA6KSdJG8hZa7mSrqUxniAYO8
         bQzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ga/xxKIasDCJixgw10gLPhVlkRHWXaXqkLdNz27TQ6M=;
        fh=cOZt9qibO9m6pTYtN3CM/e/U/jwI4EF9t+lqYVvVy34=;
        b=FhZko97GeTiXPcHHiP18jJveFPhnFWnxao26MKyv6N13xbG/oVJ1tYJCnt+p+H8Xbt
         7bhQe1T9j0axJsqBE6/dSkZCc1xS97ob+dwyJdEJBjDdFZf+DJMYS9lmGG1Z/Lgo8SX1
         1NzkoMN0o/Zlgx4vJQfG50KNs7ArQsJNObBhu372K460ND2COD1p6Dmp9eG3fmA1JIwj
         gKXorqKxivi6aoYEBeHTkGWZohYnKM3jObvzUI1t5UEIvodcwQkf99uER/9tcHjnntq4
         2YdMqcOFew1nayVBOdp5X6snuIwLzZTRCg7mQcINRVLbJTnNJes6fYn9Ml8cOApBWMAR
         5c1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791971776; x=1792576576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ga/xxKIasDCJixgw10gLPhVlkRHWXaXqkLdNz27TQ6M=;
        b=h2mmc9BFuXYofgciMzn2WNk6QMC/HV57UsdodCpacrDQs7hqx7xq+wdoIjAZy+PAkM
         3RRfIMDJqRJCMxKMC0f9xLH2WW7kS/XRUekxfZljDLCWEFjCUD07iBgdqJTLqj2UW6iZ
         Zu68Bo58orOBJLvcqOLe0DYFMNZjgObFs3SRegTSjOJUxMoWWvMMZteDPQIUQDhQL0ai
         mHywsImbKmDXLrDGd+ITn65d7OdbAkqrpEK1rcXLIosJm3gXcVL3o2jc3aHe4f8xOxNf
         JVZWEsJ4ZwXJahZRZG5ghF7AQTH9hpB6K6GqSnycx/yz5dDYwT7KNcPqYsRvtaDYwQO9
         LJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791971776; x=1792576576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ga/xxKIasDCJixgw10gLPhVlkRHWXaXqkLdNz27TQ6M=;
        b=YmnFJm4EwFXByxDHNrYupD6WFALH8Gwn01WHpoDhHTgADzg7Ij3KGfS0nslxkF/Dvz
         TE1EcegMT94akK6ojstCRPPoBjEJpaGpPp9j6jpsO9teuISEIXU86RkBZo6B86S2+hgO
         lBr8mfepw/+MhUsl83gNIqUiSfoSeW+4NmJ67kYTfHV7hBQoyI/fdTKdSHuYyFtc3MGH
         5a0ECgeVDBxxiKAaNO5k9MlmOeGP+g7Jqf5aKtyBhD3Ejrzs0sEe1rjHok2AGuHtRv1k
         OcNn8H8DSPvPm4+PRqspFgg7raLz9JLifzcR315yaKci24N1P4SOsQMEgDOrgVzpDe6Z
         WPRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmIXmW0E1Or91bb5dINaeJEfbF8lZaj9kyCEhuQZdYuRxnQUV4VS2w5gZFkY938mwCxzuuK4AxEpgM@vger.kernel.org
X-Gm-Message-State: AFq9FYJIl5GiHlW/VkJWd/rKPS+5JXyApjI0uAFdlHFv1c/5QKxRyg7t
	SCvlPcRyOZv6bnxhZD+ex9qH3TgOq1yXvcf7xAMe8h8yuX+8CGzaICKTxe1tMUoNpLZmFoDAbp3
	rsv3DiORRbGLZKYwxnxg8JA/bl6+pR9Q=
X-Gm-Gg: AYBFou1UTSvNmgHgICZ7/d9atb/ft3U7bfOQcEPZXo2/LNpdIDSOXINzthjge02Hx7Z
	PYYUFEMK/Y8TQvrzKKcaVb6beFQ7+rPq2+B5+/4eYzkU7T5VH9skZ0ZTVjC+ffty2tpAdIE3zDJ
	HlHf+b5Nsg2lKqxHCPt6LUkJoV1iqiiJmiIwmqtUHvxS1/+jXecgJxbXcYiFtH2qStLdYQ5BNlZ
	UFD/nuk110dqlrJVCtxMmwbwk8c4Nao4h/29czihFaSAcgV2Xu449zEPEpveKybkEqR+G6oJfeP
	JKVKBDecCG3Zoe5bOOEq+9ESFo5UFcysxuu3ojm2FQx+kteyxllQ9sYwg/8MG53PAp6vT05SgV3
	e9/alqqsUcnjQ3W6YfnFRWRpv1QuUWdDrypR/5OTggiF4HfmOyBxOSb8=
X-Received: by 2002:a05:6512:308b:b0:5bc:b962:cdea with SMTP id
 2adb3069b0e04-5bcde5aab48mr6105374e87.42.1791971775882; Wed, 14 Oct 2026
 02:56:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013112124.1878296-1-paulius.zaleckas@gmail.com>
 <20261013112124.1878296-7-paulius.zaleckas@gmail.com> <as5jYcTlEuOzD6go@ashevche-desk.local>
In-Reply-To: <as5jYcTlEuOzD6go@ashevche-desk.local>
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Wed, 14 Oct 2026 12:56:03 +0300
X-Gm-Features: AclHuK_CjFljdIg_AVdVw6UFxSvgyvGJDZnWdujDm8845cPvxJXAakyDfZo58g8
Message-ID: <CAPiS6wBzomvTOm3axxO7sWCxoJg0ijZOXpj_F+NNT7Woz4Loww@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] iio: pressure: dps310: add Zilltek ZTS8032 support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, 
	Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rupesh Majhi <zoone.rupert@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 7:59=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> >   * https://www.infineon.com/dgdl/?fileId=3D5546d462576f34750157750826c=
42242
> >   *
> > + * The Zilltek ZTS8032 is register compatible, with two more pressure
> > + * calibration coefficients (c31, c40) and temperature calibrated agai=
nst
> > + * the internal sensor.
>
> Any datasheet link?

Sorry, AFAIK there is no public datasheet.
If you need, maybe I can make some screenshot of relevant info from it
just for you.
Thanks for the review!
