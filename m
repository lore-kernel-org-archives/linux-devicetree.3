Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D96261B92
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 15:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777474910; cv=pass; b=ZPzz14aH310AOr9njcItkqlOg3Xu/1B78t80njz5YhVa5scT1TIV+IAu1A+uuurP0lb7azOp4jwImLt3+gA2anaCbKD5VqfzeTenlGlgfQmJI1ZkVeo7pp5XspxwHFOT5/dqTtupcYKIpy7vtV6gx3uNg9xo00CiGvIvhRJweUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777474910; c=relaxed/simple;
	bh=Cw8HiYeGhGVNri5kNkphNtuXLygtN1Ukwi72xdQF/qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L5tm12vDSE/qbkUuLjXfDo9ia35BmVbvhx8ArnoGdbw5+JP+yR8kVQ1tERbVzB2JMVpsneL/r8TLzh2cBXQ/owFjUqt01ZKE5w9CC/5rQi6MM0Ckkrk59Hej3B+S215fzm++1sH7Aw3veIspRmdFUFuwcFDD8Pa8irPholp4oh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ws7TRwju; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ws7TRwju"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d77f60944so9069677f8f.3
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 08:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777474908; cv=none;
        d=google.com; s=arc-20240605;
        b=kaWnETynWhercc6VgI2QWMW4+McQFlTUZvb9vPhX92eEc/d5PLiPhwz6TFoZRqP8dl
         QGz0vTjRoVlv/R0pJYV4PFEURRxcQU9EGy/FqBlSlixWuPZnLUUOpG4QhEUCQQ5bH7GH
         DUD+DQb3OcBDQ9R+Nt1nla7WtOLM/dlL4WpoD9OK/P+3MgBFaEjXNYZflz/oJxx0ryqv
         uIVIEZx6OS5cbqcOwEZhKpw+RhLXwRKnhKjln/7QekQC4Dy9S8ETmxla0jNBRIcuaBEe
         vIGUHLgFKAQMBeQHGIho47pkc//U1pKVAwGLWvEVf5BywCO+zNBLxR/NoAp2znSYpYNj
         bi3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6Gzidrx1HikqS9ICFconcGCYd85JKEM9NohQlAuXWSE=;
        fh=tcu+K3fS8xD30v19b3VW+Tyv0mRRgCysWRdIdonHyUU=;
        b=Uo65gbFM8Z04geQ3N/JMvcNM/9a3T1qmLfWHEgAkcYdiGb08Tdv1ESqu8Wzced/U3J
         1AYyOLq6Yc8tIFdfNvKOgrNxtc5g2x7qAAPxdrMaWZHOMZJ0UXyz11M7yNwNTW2Mdlmk
         q8XkWgdUiVF2lCggQVD71uY2jMrqQzsF9L5gpC41gbpLmzEUsnq5PIz2AZ9QKoWr0aSL
         tzOw6mBuT4fjUwQOjdpRT4ZxOw/CJ9gqDnejhxVGyzMEe3HBkxX9fd6CuorF0BTNBcRS
         /1sz+9dD8/AH6Q93m2ikW1/Ar4AiMOLmOXu63nhoWf2OnYFt4J1h8M1Sp5jZe5PZ2Fkd
         a1zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777474908; x=1778079708; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Gzidrx1HikqS9ICFconcGCYd85JKEM9NohQlAuXWSE=;
        b=Ws7TRwjuZtt4ej1b2dFnKfzi9YBdDEoWTlZdk/FRfESdb//alr1ceNA6q35ZiY4MK9
         +pEA2Um1EsxEEBQzmOxKguNGmxDm6HJr29Dxg4WqtxM8xY1nVXVqDRRMOPnVF8P1wUAC
         JvU9/tLYGy6t06smEtIRKAaFqJC5FcXbSAumxtq+hEyQS2wUcuzFvekPY4ZbXHjQ03Dt
         alG7Ky3cE7l2N1KHjjZ0J/t+L7intEYHrkh0pJIzyzmrZHFR8hVTKk5Dpdl7+1IkuPOv
         ii8W1hIFU5euB8m01f1CF8U0FVKuxbYLaDS5byw3azQxXJcjFRVJ6mIKSRsIiiCscoGb
         G4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777474908; x=1778079708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Gzidrx1HikqS9ICFconcGCYd85JKEM9NohQlAuXWSE=;
        b=BgQCzsFiPdMrILJeKwYpCQe4E2Vt2YhWRFikFvHFS8Odr0BXrZUbdiDLxwUny8hx05
         3siYrFpbAzxAtEpLjXUZAjRhZCgrnTpvqk95vpcePc8wBb2OvXuZ057qojFZKIEhNIDf
         rKbwZAftj+k7+ASAJEOckACpFqU8nN0Deg8qOHxuqEHpL2f+AFccTu6oAcKZgFAGN6lw
         OChek7Di1Qc77tN5NBvFkSetVxpjnUCPqyXQ9I3g9uxjVWRzJWaZVVvFkQU1Vh05hDIe
         Yl/WL6hA5Hw/eH21ISWsqHV/xysE5gTuhSTjO+9AguuvJHbPVyqrAXWTn1q4D5Xm+1DH
         jLJA==
X-Forwarded-Encrypted: i=1; AFNElJ+XWPjZ8FipWI1gGwhVyXVbyi1RkbmMsm828X8RusYtZOETLBgDgYVcUYDXK2hiCu5b+30WjkU+hUBR@vger.kernel.org
X-Gm-Message-State: AOJu0YwvhOrhKJLN+dwRXgTtbfsraEKaqsyBSE8c8bW+zrTKzodEJZ83
	FE1zJVPpUQvorGW9ePns3HEixZFReUQG01vlQJApeJvDHCsgY0CwI1y6uwdFpRA86ctjqwLC9kG
	ceNMTY+oyzgkn+eor9fXCL493kApnhmg=
X-Gm-Gg: AeBDieuzD9RMlzbhcq6VtE7dblfDUU6ESmifXZwS6jxqOsgI0mSkyBqZLQ5P5QtQU5x
	TEDaeQ5fu/qXkYM7yHoAG8pJNqreqt++5qjA3FVEu1vFakab8oV8eIDi5XaW8mgcsIEa0s+HbeN
	mkuRJH+2TiZsvHPjS/110PapL4VDipqbXsc3oubbmkuEPJcQLpkhtXURCkAc8g5lRkcFzBbfYTh
	o/WTzXKinMFRwW8h2unZzZZualu/Tgw2hrCXzVCxUR6mIdBaw2sFE2mfFPGH7Y39m0KHdTCunNq
	Uji83LHxmSNmSjx7gdRAwGUljFZnRDGSXPy2LnhZ0N6B9VJPXMznEcuGWP7KeC3gQ9JUzZDmOCS
	uKYhzhJTZ6GTSK0IRxtRLCEHlcnBlDQ/9tT7JkbKZQun1kuzUAuppEsYklWgb2Ib+1ZDyPZ6vIy
	b0ZCgmomBZVlpRhjgN
X-Received: by 2002:a05:6000:2681:b0:441:1e41:19c with SMTP id
 ffacd0b85a97d-44790472ecdmr7562583f8f.20.1777474907562; Wed, 29 Apr 2026
 08:01:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429054544.123862-1-piyushpatle228@gmail.com> <20260429054544.123862-9-piyushpatle228@gmail.com>
In-Reply-To: <20260429054544.123862-9-piyushpatle228@gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Wed, 29 Apr 2026 17:01:35 +0200
X-Gm-Features: AVHnY4JJydvG7p92mpdR9A8O6By1uWju88h8TjAOdC0jPpocQj3mzZPgv4o9lS8
Message-ID: <CALoEA-wjVgbCFAKJ7TNHLWWYKYdFDBMsvs7MH1LhWepVhLBg4Q@mail.gmail.com>
Subject: Re: [PATCH v5 08/11] iio: adc: hx711: localize loop iterators in hx711_read
To: Piyush Patle <piyushpatle228@gmail.com>
Cc: ak@it-klinger.de, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Apr 2026 at 07:48, Piyush Patle <piyushpatle228@gmail.com> wrote:
> -       for (i = 0; i < 24; i++) {
> +       for (unsigned int i = 0; i < 24; i++) {

Might be a nitpick, but wouldn't it be better to have a macro or a local
variable for the 24?

>                 value <<= 1;
>                 ret = hx711_cycle(hx711_data);
>                 if (ret)
> @@ -174,7 +174,7 @@ static int hx711_read(struct hx711_data *hx711_data, int trailing_pulses)
>
>         value ^= 0x800000;
>
> -       for (i = 0; i < trailing_pulses; i++)
> +       for (unsigned int i = 0; i < trailing_pulses; i++)

Why is the index unsigned when trailing_pulses is signed (this goes
for the for loop above as well)?

-- 
Kind regards

CJD
