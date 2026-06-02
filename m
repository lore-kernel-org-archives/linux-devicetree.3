Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865973FE36A
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 17:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780422892; cv=none; b=YDG1TqMDuYHIqKuDDLtaGZaG8Mj8TjvbXvFRu/KYcD+/pJXW2XOSTraf1q4fRU1+9ECg0pStJHrF0ru/i9x1iPtWR17lwi6DfWiH8aT16rQJiHyDqlqI+EPxNTaY4GGc8CwaT5m1nqgsZqjjcXz2xvEf8GX+45c+mLx7WdRfV48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780422892; c=relaxed/simple;
	bh=1cRWuA7CYRnjUrDrA88KiIVqyalvj7E0eefInPFai4g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=QjGH03T5RAS8cwUXZjHevhGUjz+EpWmtb/IJWHLsAy8ze04SUKUfLG7WByHEl4gtDU1UfYE6tM7/LEMYP/04fFyW80q6kbycQXQK9p3rWd2JTjFYtu4HIZKyhlyWS0nAWZk3Od8Md91mQ3y9QbSNyt7Lav5AP+zdsZ78KppOsOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEKctNh6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEKctNh6"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so13420575e9.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 10:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780422889; x=1781027689; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/y3VfIHXupfD9Wrr+gIYVpG9u9vvvf2stdsP3kfUmSU=;
        b=HEKctNh6kxRzP6fnuggwJ15RB9GZwWfirEIgWZL7UEPQ9UJPz9SJREr0VAU+i/MHcX
         QcdV7QuzSwmjxiSZ2DD0D3kuFWRIvl4/nLXJx2uRntlTOPRZDARLK2hT02QM7JoqDbnW
         bkGyeJ4wvDPIxOnF0Xi+DMcU8A+EXMHSueyUSWbVZyvpUIyaPimwGgurM7jdLFDpyEPO
         1R3PsILsqrb28J96ZCR2Gr84xDt+DbwAUh/XzT1XJfAS1138U7Sk5kGEuEWus94/M5bH
         xptgOueG80DFR40y4wbmeHbKaPYjzUfe+VI2PIw8uXipcsK7379AlTdaP4731Rk2bxWB
         +ucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780422889; x=1781027689;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/y3VfIHXupfD9Wrr+gIYVpG9u9vvvf2stdsP3kfUmSU=;
        b=Y5cdwIahDXuSYLlJf4S+puHIFg4S20BxEpyaU4sCI91mJ5s/wUk0JLCtukYWODh71n
         qQLagKAuYiZQQ8i8cmLE54zjyoMlWM5DVT/O1uFKM6XkiEuJunhnuJxw4FrfQb2h9jCV
         PdQPH2A+J1eltZYWLDakbSp+rPMOVu5QJm3H2DL0fP9N5fM/7+VA4kvRNY9NmXbpyGxO
         mEBzHLJotW+ydFog15KkK8zWqviJ/z1+b2P9vy+oYM00iBzAw0q5jm8WP/uFSN6wY4lR
         eu7T5/LzdO02j0fOjE2r27Q8/RMpD7PazNrzJPG3xOmrWj+cQLV1qwcef4thmymEbvl8
         B7DA==
X-Forwarded-Encrypted: i=1; AFNElJ89IAGO4NJA3u3R2L8ctnacCneNGNFRAQcLOv5puofMmMerSqXqShKW7bAkn/IEbh5QjkqOYUosCwUd@vger.kernel.org
X-Gm-Message-State: AOJu0YxSdrusl+OCagHilnjqVdnXsDPWWWnky8yMSTH1eQULXeGKHAxF
	7o2S6Iyd3mKKeo9poc7I7yYEcj23Iesu++RKryIMscLmi3sHKBTHzr8c
X-Gm-Gg: Acq92OGQ906FUJ1cFuGx8hMziGuQkaxBIbvwBnNhf9LF3TVsN4zQVBJLK4qaYCwIvlK
	sS6pDVnUKNHiJvbWMVC0bES6JWyZX4025Z6rioelAuL9v99dShbUfojv4j0IQMy7NqZ2HDMMAf6
	SfFo6y5r8W72T/nJSw6U+yZvV8+1fJfQRO/0mehSbhWnI5a1wj7RRVb6BpP4fND/bVqxMqaaNGh
	4kUGF02LJ1fkcHvsZFzrHMJiXi1YmeAMyWOTr7nSefkwBdPFVT47UtVXlopzGjePZ3Dz65ZfXi7
	17KEWtBU4I//52Q8ujOzCdm6tyA2pMKR60EP29wROfr3DlZu/QzEUbdcmyN+WpXkg/OBW2ntAg5
	+ZlJ2a2Snf0Ta1OS4m2H66JmLjw7PA3ihT8Vzl4bLRLX+qlAGyXKAwRPB988BaQzwSM2B4P/NSz
	JvvANcvYW/+WSRUhxm5c8VZJAQxj4sdt7GlVT+HgAfH9r1Fv8=
X-Received: by 2002:a05:600c:a41:b0:490:a964:14f8 with SMTP id 5b1f17b1804b1-490b505560dmr14093255e9.8.1780422888581;
        Tue, 02 Jun 2026 10:54:48 -0700 (PDT)
Received: from localhost ([2001:4bb8:152:df59:3b69:56ea:a39b:adb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344541sm788685f8f.22.2026.06.02.10.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 10:54:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 19:54:45 +0200
Message-Id: <DIYR8LZ64A9E.3JQG25Z0TJ06@gmail.com>
Subject: Re: [PATCH v4 2/4] iio: light: add support for veml6031x00 ALS
 series
Cc: "Lars-Peter Clausen" <lars@metafoo.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Rishi Gupta" <gupt21@gmail.com>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Matti Vaittinen"
 <mazziesaccount@gmail.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Jonathan Cameron" <jic23@kernel.org>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260531-veml6031x00-v4-0-e64f7fdce38d@gmail.com>
 <20260531-veml6031x00-v4-2-e64f7fdce38d@gmail.com>
 <20260601112103.281387ee@jic23-huawei>
 <DIXZFV822HRI.2SBIT7ADW9LUK@gmail.com>
 <20260602133313.1d5afc51@jic23-huawei>
In-Reply-To: <20260602133313.1d5afc51@jic23-huawei>

On Tue Jun 2, 2026 at 2:33 PM CEST, Jonathan Cameron wrote:
>> >> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml=
6031x00.c
>> >> new file mode 100644
>> >> index 000000000000..6f9a7bad44d4
>> >> --- /dev/null
>> >> +++ b/drivers/iio/light/veml6031x00.c
>> >
>> >> +
>> >> +static const struct iio_chan_spec veml6031x00_channels[] =3D {
>> >> +	{
>> >> +		.type =3D IIO_LIGHT,
>> >> +		.address =3D VEML6031X00_REG_ALS_L,
>> >> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
>> >> +				      BIT(IIO_CHAN_INFO_SCALE),
>> >> +		.info_mask_shared_by_all =3D BIT(IIO_CHAN_INFO_INT_TIME),
>> >> +		.info_mask_shared_by_all_available =3D BIT(IIO_CHAN_INFO_INT_TIME)=
,
>> >> +		.info_mask_separate_available =3D BIT(IIO_CHAN_INFO_SCALE),
>> >> +	},
>> >> +	{
>> >> +		.type =3D IIO_INTENSITY,
>> >> +		.address =3D VEML6031X00_REG_IR_L,
>> >> +		.modified =3D 1,
>> >> +		.channel2 =3D IIO_MOD_LIGHT_IR,
>> >> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
>> >> +				      BIT(IIO_CHAN_INFO_SCALE),
>> >
>> > Can we move scale to shared_by_type?
>> >
>> > Thinking on some of the others, they should probably be shared_by_type=
 as well
>> > rather than shared_by_all. If we ever add buffered support and a times=
tamp
>> > the integration_time doesn't apply to that.
>> >
>> > shared_by_all tends to only include things that are truely universal l=
ike
>> > sampling_frequency.
>> >
>>
>> I am not sure if I get this point. This device has a single IIO_LIGHT
>> channel, and the scale only applies to it. Are info_mask_separate and
>> info_mask_shared_by_type not the same in that case? I have seen that
>> some drivers use both info_mask_separate for INFO_RAW, and
>> info_mask_shared_by_type for INFO_INT_TIME and/or INFO_SCALE, but that
>> could make more sense if there were multiple channels of the same type.
>> What am I missing here?
>
> Ah. I've been reading too many drivers. For some reason I thought this
> had more intensity channels. My comment clearly garbage as you point out.
> I maybe got thrown by how ALS sensors used to work.  They used IR only
> and a clear window that covered both IR and the frequencies we need for
> illumiance measurement. The light channel was then some combination of
> the two. I guess they've figured out how to filter that IR out of that
> these days.  That leaves me a little curious as to what applications actu=
ally
> use the IR channel.
>

According to the application note:

It can be helpful for an application to be able to differentiate between li=
ght
sources and react accordingly. The additional IR channel offers the
possibilities to do a light source differentiation based on the IR content
measured with the IR channel. A ratio between the IR and ALS channel can
be calculated to determine the amount of IR light within the light source=
=E2=80=99s
spectrum. This easily allows, for example halogen bulb to be kept apart fro=
m
an LED light.

Probably not the most useful IR channel out there, but there's still
something you could do with it :D

>>
>> >> +		.info_mask_shared_by_all =3D BIT(IIO_CHAN_INFO_INT_TIME),
>> >> +		.info_mask_shared_by_all_available =3D BIT(IIO_CHAN_INFO_INT_TIME)=
,
>> >> +	},
>> >> +};
>
>>
>> >> +
>> >> +	ret =3D veml6031x00_hw_init(iio);
>> >> +	if (ret)
>> >> +		return ret;
>> >> +
>> >> +	pm_runtime_put_autosuspend(dev);
>> >
>> > As sashiko shouts, this looks like runtime pm will underflow on remove=
.
>> > Check it by removing your driver.  It doesn't actually result in any
>> > problem, as the runtime pm subsystem just saturates at 0 on decrement.
>> > Given that's tear down anyway maybe we don't care.  However, it's easy
>> > enough to fix by using pm_runtime_get_no_resume() and a couple of
>> > explicit calls to put it in error paths.
>> >
>>
>> I took some time to audit this in detail, because although my
>> expectations are that atomic_add_unless(usage_count, -1, 0) should make
>> this shout a false positive. Expectations don't always meet reality. My
>> expectations were based on the code, so I have added tracepoints to know
>> exactly what's going on.
>>
>> Scenario 1: Successful probe -> unbind driver.
>>
>> devm_pm_runtime_get_noresume() increases usage_count, and the call to
>> pm_runtime_put_autosuspend() decreases it. That is balanced, giving us
>> usage_count =3D 0 and putting the device in power down mode as desired. =
If
>> the device is then unbound, the devres action (a call to
>> pm_runtime_put_noidle_action, which only calls pm_runtime_put_noidle)
>> triggers a call to atomic_add_unless(&dev->power.usage_count, -1, 0).
>> Given that the usage count is 0, nothing happens and there is no
>> underflow. In fact, the underflow is not possible this way, and adding a
>> remove function to check if usage_count is 0 and calling
>> pm_runtime_put() is basically repeating what the devres action already
>> offers for free.
>
> Agreed on this analysis. From a readability point of view it is nice
> to have balanced calls but as long as we only underflow / get clamped
> in a path where we never increment again that's fine.  I'd add a comment
> somewhere to say that's intentional.
>
>>
>> Scenario 2: write_event_config -> unbind driver.
>>
>> Sashiko says that pm_runtime_resume_and_get() increases usage_count, and
>> there is no devres action associated to it. That is only partially
>> correct, because the devres action from devm_pm_runtime_get_noresume()
>> will be triggered when the driver is unbound. Actually, this is great
>> because then pm_runtime_resume_and_get() gets balanced, and there is no
>> need for a remove function to check again if usage_count is 0 or not. In
>> this case, usage_count =3D 1 before unbinding the driver, and then the
>> devres action is triggered when it gets unbound. Exactly what we want to
>> have usage_count =3D 0.
>
> This one I'm more dubious on.  Basically you are saying on remove we happ=
en
> to have an extra decrement for largely unrelated reasons so we are fine.
> That to me smells fragile even if it works.  For instance someone tidying
> up the imbalance in scenario 1 (which would seem reasonable to do from
> a code understandability point of view) would break scenario 2.
> I'd rather we had something explicit for this. Probably an devm action
> that just checks for events being enabled at exit and disables them as pa=
rt of
> the tear down.
>
> So not bugs as such, but fragile which is not good from maintainability
> point of view.
>
> Jonathan

I will add a devm action for the events to decrement the usage count if
events are enabled i.e. the usage count was incremented.

Best regards,
Javier
