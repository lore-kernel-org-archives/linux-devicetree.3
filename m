Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5930C3A2E18
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 08:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781341078; cv=none; b=CNvk+LH4/EjUNgajfCQRuIqnuBSOQFDrU67KomDvSj2wYyJclY9rIbLA6fJNCMkVmULm0xUlM1o14K+PFgYcMLNfRWZxp194uoK56l6cWj8E8zrgws0bqB1ti4xb0s5QZSNcconMI8ufXWM9NsMC8zW4Ng1M6Y/x1JEopeIlp8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781341078; c=relaxed/simple;
	bh=KxmEFsiaYYNkfspFB8uKNZ4vxVJa1iAcPyPU4pJgezM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yr8gcMd2oxkyHgbWVnxoPqRo6rmfieifMfBS2v89tILiZgzV/tk/dYFEAg5p7RzPBeIRR3EACaFFx+NWaHMyhQhvW3PoXAnDX8MJoHdE3RCpa1ku5wnbYMwQNB+C9V+JTVn6ECgLGA8XjADhruUP/dFT1i9paBLC4WBf19It8TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sirat.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sirat.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7e053987001so30596997b3.0
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 01:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781341075; x=1781945875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8EVlQKkEG7RLm/aT+nw257EWmKYSXeMTO6xqdrR77mE=;
        b=kkvjZoqzASwpBjPQMK0jy59aW00i+tJDDjYnfbF8kCsrELqHcIUhAKyn8ZDcIUuQeg
         Bmec6SIh+nIMn/oZt9lXwSLmCJursbprESgWp/yulnr1LP3EOGtRxdCdqfbHl8rR1dtw
         qq9vVZYaY7OhI37unV25Sq4hQwQzSHwvbc7duQEenX73QprCKIBDt8wg8coEEb73JHso
         K3nHkC6KxuzNFc5vAr9r+MWnDMyvq2zw093O/RWf+DXpoZaUiHNWi/bnweqZDb8ykWds
         aPyUeoIokGEJHWahtha+RxJ0SipZ+W5LQGwnjAQNB5Ki3TlLdbmkp/EqylgniwWXoyCh
         tbag==
X-Forwarded-Encrypted: i=1; AFNElJ/F9g12WA68b/Ix2F98y/IWvQ4XGVi+lov1lPaPJuCkEaXx7Vo/F6VS5KttYKL0pOxxbotRGAHahsNc@vger.kernel.org
X-Gm-Message-State: AOJu0YzU+4wsAIVCoR1Aj2/wSMUgh7oYqLjirsx6JSWQf8aomiN4G4ty
	TL4HzJ+8Ta3PFflyKcsiYVLbPswtXb8yChtVRx9l1GEM63l9fqUhHHOm5Lxm2wtR
X-Gm-Gg: Acq92OHVuD/1eQDGouCI7ISmqCxFnH/KooswE0r/M7gJs5ercS1uM5nHc9+mPtQsujg
	TesaMLIIPRutIm2lN9mhI24q42Pn2JKkuHkv8kZdF9HLxg4Ps8aIm+TKqxKYkZXYvZzCo0y/gPF
	SEJ4X3eVDBKZo25zSDosPK/LaBuRqcRUjC86VR9vvzfUvTDPvJjOGTpYY/QHu+eMCvxFbyD3XNz
	1GmFNRVV8px6ygk6ysV6URf9S+gsX6JnlCZDuOAMpIu9P7a+p5pqtjVpE9NE+ZoVqTGDOn6zhef
	V6vEkPqwvEJmyTwLQlcu7VbLobDesJyhCcjEQR/2mQnjhkcNo6HT8EhlsxUi++R8wtcEgBqDe+5
	4BLbUlTWBNbP3eJbBqZgGDz94J/5Kgwm1/QZRwvVhBDr+rKGhq3E1+6ZOXfYFn5UkeNXPp4t+ks
	rsB3HhxomtI0W7rPpDKW+gYsLVV9pYS5a1o4+Piuts0aYYanRMgFRUjP8roAwuwgT+guFlRvJSy
	AjFROpbLHbBmwAog5XdtMEtg+dW0L+NxHwuEXkcKLhpCaWQsy1QyQ9nI7bVUURkI1IG/J0faFHl
	3gBNrQDjvoUekcwFMKwngPvHyeu7BThShAICVg1DkPx7s2eCiO0IfJPiLg==
X-Received: by 2002:a05:690c:c4ca:b0:79a:b49a:cb4e with SMTP id 00721157ae682-7f7cc52614cmr47159667b3.6.1781341075062;
        Sat, 13 Jun 2026 01:57:55 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7f7711f928dsm20611247b3.36.2026.06.13.01.57.54
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 01:57:54 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7e053987001so30596917b3.0
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 01:57:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ98wwmlDT/G/KmZHXsdV8PJh8rpxYaGe5jhZswHGzzOBYvRTvpx7gb6ULLey1y4U8hsn+zXgdYy6o5d@vger.kernel.org
X-Received: by 2002:a05:690c:4a0c:b0:7ef:e7ec:b6e7 with SMTP id
 00721157ae682-7f7988731cfmr51443407b3.27.1781341074163; Sat, 13 Jun 2026
 01:57:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612124557.13750-1-email@sirat.me> <20260612124557.13750-3-email@sirat.me>
 <20260612173013.64f435ab@jic23-huawei>
In-Reply-To: <20260612173013.64f435ab@jic23-huawei>
From: Sirat <email@sirat.me>
Date: Sat, 13 Jun 2026 14:57:42 +0600
X-Gmail-Original-Message-ID: <CANn+LW+OSfo3u+7wZu11j7tQd-PGyhrz3a9+st-FwjOLbT4NBw@mail.gmail.com>
X-Gm-Features: AVVi8CfkEVa8jbtmbQfja_oWdfvUZG5fvSdkCptWn5Mrht3KziUi5MBOh60cRjA
Message-ID: <CANn+LW+OSfo3u+7wZu11j7tQd-PGyhrz3a9+st-FwjOLbT4NBw@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: iio: magnetometer: add QST QMC5883L Sensor
To: Jonathan Cameron <jic23@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 10:30=E2=80=AFPM Jonathan Cameron <jic23@kernel.org=
> wrote:
>
> On Fri, 12 Jun 2026 18:45:26 +0600
> Siratul Islam <email@sirat.me> wrote:
>
> > Add devicetree binding for the QST QMC5883L 3-Axis Magnetic Sensor
> > connected via i2c.
> > Interrupt not implemented in driver but kept in the binding for future
> > addition.
> No need to mention that
Got it. In the past I was advised to mention certain choices in the
commit message. I am still looking for the balance.
>
> The rest looks good to  me.
>
> Thanks,
>
> Jonathan
>
Thanks
Sirat
