Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D03A402BB3
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774365467; cv=none; b=mRDhuDA5Xh7Ms1CWe5PspeEogVEvOVV51YyTthfMroalM2LG9N+qTBEFJpZEQOOD0OBmvyUqwLTvYTGntW7nKq52Wv/yPtzhAQANj2jUMLqloKec7yowltg3RECqVAJ1ycm5ExE5VLYAKo0Z10IS3dmpfTN3QzBzQ8xT6DvDGtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774365467; c=relaxed/simple;
	bh=Q9gRqFrvyUHsVjhObb3HseEeq2F31kvgSUewzTp3A8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AXsG7I9ww9JEyv6vacmi3y2ccFXr3LYncc7Kwqde83bzLjxw9WJML/6i/pCpzEYAu07JCzRQJBADgQSPjevyedjYqCFFxpO9SHYTI0Qmv3lXuY6lMt/SRdwW2rDXKJZi+4lgaXdY2xe2mpA7wxM4gQ2dZNpOgv3/xKBB7iAdXdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64e8c7f5082so4927160d50.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 08:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774365465; x=1774970265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q9gRqFrvyUHsVjhObb3HseEeq2F31kvgSUewzTp3A8E=;
        b=tUsMQCiIQTpe4qHNUGd5g3vnBTnN3tSMKw2Wmp2dScgfppqJc6mRO+0pLg+OhjQbZ/
         AHnpAy8CHUQZvX9mGnrvc2r6S/qxlOTV1rVH8jCgAprKecZUHDVQWymL5qtla9ChB8hh
         PrdDC2WeiRE+/URIt71L7h8vSqYiNcr5+Ryl71oqIpHwPlQucDufEYZEg/5Q26gm3R0i
         9w1WvQjYGjGlVs7UEBOS/EHDMXUZljjO174KnTHjWyPy/DpwvtgH5Y7uYIglWHUtqFWR
         RQz5zjm8pP2+SYZ8ST8IfUYQzBj4ooYbejg52NYeLyjsO7aFqo09y9D+w0wy4HbXsocl
         eQsg==
X-Forwarded-Encrypted: i=1; AJvYcCUWjrQoB/scXFXzVQogi3ObTVZA7mxwkubcDJfPAv5bXP5MrBipnK3Yx94fDIL0XOvuSOUk7ldzpP3X@vger.kernel.org
X-Gm-Message-State: AOJu0YwIYry9FNZOxYqvBYHYlLxoPDVqGK6rQnZh6c0LkBGkBqo6qLYo
	GN1Yt4lnFpmDwT2Efe52x0Ilo+dR5LUKhVpMZYnjjm8SX/pw4TYpMQHOw5o0BSAT
X-Gm-Gg: ATEYQzymO+fOJPn9+DdIWviVqdiKPatIoR15tjIjKWIdkgEPZXQg6oKsRHBS88/2aoo
	SIIrMcQub6wN1h53SNkTxUpIqp1bY7z4d1fNRFKy6nZAHrwxwzFOK4Bj9J2g2RE5kulNkYe7Zfz
	il3ebrfuFAwmxo08BQiJfVPwIdhUg+phzjgykjUgOQZDFBCbuRWZnic5FHMRP1h4PasguAL/KNs
	axNZp/8QpCX0MBL4IzZk0Cz2VKWbnDWLiZx475SP6xhwxiTTRFhjzXYBqxuzzvwB08md33BYExQ
	aFM7CL07G9iGxJuF8Ifp+a5ECS5p+ZF1Tv8pAaUwF8sq0mlU9IOGpWOaZ8B01d7jNnuXoo+u18S
	ylLjnipy3zGTd0kD61BYebrqTioELD7l1yWrGW5cbHYbYEqbysdyY/Gz2WXkCKX0RzwcjqwHYlL
	1ls1lcxpGV+NZ+qavFmzn+Fvq1H2EhvaZSG4Ygehd5tjWpdkIQX+RM2hRgLr7q6BAbpdS+HN8wg
	fl5h8HMRxiaUGAKQmO0yxHKq7C0E8BqhaK9GX6zhpjqEyUeL35BasrZ
X-Received: by 2002:a53:bd91:0:b0:649:f272:4e87 with SMTP id 956f58d0204a3-64eaa7f7d40mr12874241d50.65.1774365464574;
        Tue, 24 Mar 2026 08:17:44 -0700 (PDT)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com. [74.125.224.41])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64ee48ffa63sm138703d50.16.2026.03.24.08.17.43
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 08:17:43 -0700 (PDT)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64e8c7f5082so4927108d50.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 08:17:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVnfnqAW7HdMdvX3rrodOMKkZ9IOR7Ma+WPNOxBNJoc+sVazKh+IxKX0xdHdegZZq89gjK/gOC4mAjR@vger.kernel.org
X-Received: by 2002:a05:690e:104:b0:64d:1a9b:97ec with SMTP id
 956f58d0204a3-64eaa86d5b7mr11928437d50.77.1774365463078; Tue, 24 Mar 2026
 08:17:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319190738.151614-1-email@sirat.me> <20260319190738.151614-3-email@sirat.me>
 <8502eb51-53c9-4f1b-92d0-21b06fa4802e@baylibre.com> <CANn+LWJEJJoGQU7p2P2GrOcA_g2x7jEnvjcTJYG1hDRUnRw3UA@mail.gmail.com>
 <b1da32d2-e1f7-4fea-82a7-a40e8073a100@baylibre.com> <20260322110319.7d7558f3@jic23-huawei>
 <CANn+LWJwPUiCkz_godEeBvZnXEXzNmCW_-ou=wHL+kjfn0zF_Q@mail.gmail.com>
In-Reply-To: <CANn+LWJwPUiCkz_godEeBvZnXEXzNmCW_-ou=wHL+kjfn0zF_Q@mail.gmail.com>
From: Sirat <email@sirat.me>
Date: Tue, 24 Mar 2026 21:17:31 +0600
X-Gmail-Original-Message-ID: <CANn+LW+OPP2riP1d=zZKz8MnTk2yo2CL3qn17_LYD=1SmCAQgw@mail.gmail.com>
X-Gm-Features: AQROBzDUWip4QF3NJAtaeNw5-aJRGp9zQWHAyV1dFePOzpjcfY75Ufkbu-I_i1Y
Message-ID: <CANn+LW+OPP2riP1d=zZKz8MnTk2yo2CL3qn17_LYD=1SmCAQgw@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] iio: proximity: add driver for ST VL53L1X ToF sensor
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, nuno.sa@analog.com, andy@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 22, 2026 at 7:52=E2=80=AFPM Sirat <email@sirat.me> wrote:
>
> On Sun, Mar 22, 2026 at 5:03=E2=80=AFPM Jonathan Cameron <jic23@kernel.or=
g> wrote:
> >
> > On Sat, 21 Mar 2026 19:37:58 -0500
> > David Lechner <dlechner@baylibre.com> wrote:
> >
> > > On 3/21/26 5:39 PM, Sirat wrote:
> > > > On Sat, Mar 21, 2026 at 11:09=E2=80=AFPM David Lechner <dlechner@ba=
ylibre.com> wrote:
> > > >>
> > > >> On 3/19/26 2:07 PM, Siratul Islam wrote:
> ...
> > >
> > > If you do a buffered read, which stop ranging when it is done,
> > > then how can the direct read work after that?
> > >
> > > Can we just start and stop ranging momentarily for a direct
> > > read?
> > If the latency is high, then worth considering whether autosuspend
> > and runtime pm can help. That way a burst of reads will see low
> > latency after the first one but we won't be wasting power when
> > no one cares.
> >
> > J
> > >
> > > Otherwise, is seems like we would want to have ranging always
> > > enabled.
> > >
> Maybe we should go with continuous ranging then since it's the
> vendor-intended behaviour.
> Since there is no hardware single-shot mode, by design, I think the
> driver should just behave
> as the hardware intended.
> > >
> >
Just for the record, I'm dropping postenable, and keeping predisable
for only the cleanup.

Thanks,
Sirat
