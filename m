Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8EC374E45
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 08:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791621359; cv=pass; b=BHWOIgTR5eSFRyumrjCbV0U4WDzpMAFiev0v/oRGGlC5wyotBerYR92+5uYS6VmIRyH407Nfzn2MYMaFmfwtpl26HDlax6VqEuoPKFBLhntxWWPGYMiY0J48bYgcMNIFtKKkwcOnFhUmBQRR2fElDB1q0JOhyXGoLlndyo78rcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791621359; c=relaxed/simple;
	bh=+Ah0iXSrbj/vIWOgcYS601AF8sHPjPNavmOfnknsgk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DuyMbOJVkEUrCaxusU8cqAKD3LUS6AOKDnW+892572WgvlDMKbn/XGJDwKNvdBin+uMeCaVqLrrxjBIe20jHDnfKN97V0Owoho/jijzSgW4FsiYmrWceXCMOUXcHQvpyYfqmPzNq/dz7mP4iRLLaDjrBoTCGW3/PF9x6rAnP40A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlPELZ6s; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlPELZ6s"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33c2520ad38so950389eec.1
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 01:35:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791621357; cv=none;
        d=google.com; s=arc-20260327;
        b=d+dur5PZH29uJOkc2acuonPHNMF6q82aVRXHnyGdP70CO/tkvA2ouwTjgaIr2lodOQ
         hZBAb/+juYZeIDWUxfyG61fhv37XYKzew+dh54UNevfBHIQMzF410C7r6MLJKSL89XO4
         argtLUWBi5XeBGpeeuB+fD4AZn00nZxQH6ExGlw5mdqqa/Ca2Uj7xzBRS13dSsP55KYQ
         HRZIWLBnKa6e9KWinWDvcPK6IGjUxns0HIku+r0Ilb6u2jfNEj9JtZL/gHN7fcj2t8fn
         TJJk3g5nS30/bvTD3FVpnLbPLedQAaiiOQM9fNEcwjmh10ySZu6IM+X7GOsffj8KVrwh
         opvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MjeVPOBrZxZk8zOp/qAcB3ja6M2cpy7hSuGh4PvxsM8=;
        fh=ClA283odQRXjTqWfiUP9+B1ax90DBeRFzgOkbUx2/0c=;
        b=sNE3zGcdvluBpXKEHGlEOmekJ9XkxiKIeiq1nY6bs3MDv85NlNecPTBtQfyN7nRHDe
         srHPZF0nQ/yAwzrjoBa+uIcBEqmgPAHXF8tTELmBRMBxSOt1bOuQ5k55B5wwwEZ1UcH9
         MgZo+IAfhBFLCVFecLezRr2TsULkmeX0EpahWfqZyVz/XE4/PU5W4e2gBJiFG0wR2fuL
         c2pZFYOALn6dSw1Mae4VqGdK86TJOA7o+csgg4m+s59zYqxmeSxUEdEWvYxT7onP6o4n
         Hxty980Iw3t48cukwGhRkS8wbFcoVWZEN0aalILWuuh5kzxmOQYHw3UZGpW4IvjaR6FQ
         4vzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791621357; x=1792226157; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MjeVPOBrZxZk8zOp/qAcB3ja6M2cpy7hSuGh4PvxsM8=;
        b=TlPELZ6spcRhrnsiajkHguyuT87k9gYOAxxhFxBbeUh4LCU9Ljuwi4xeNM+PP15qS/
         PBy9vjx1tR/LojKenoL3Eqi1+3r/FhOal13WvNjWwMUBO4DQR2lDmZiS9Qo3qJ2e/4P6
         Lu9YP3pqSb4q7U+ifLBQV8i4yKC8KWHGZVv4fOBUUHWo8oLQusE8UogmMHMcG6z5dSYx
         vrrLfzpp8funNiW9EofTkdcTMnwBD6nZfMOm3tD1xgbKKGhFaSb8hb1SmP3IO5uUjPSX
         0lyxAOmuqjs3OlflNb+fODP8icALqqBNBJDy2UaFLpa2GgZM1C/JnFLIQSQFvE6Cs6MJ
         H2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791621357; x=1792226157;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MjeVPOBrZxZk8zOp/qAcB3ja6M2cpy7hSuGh4PvxsM8=;
        b=2NDVzkywwPTmOPmttW6Ssqw89ZKY+Q8DvsN9ehMFkFrxVmfTavtNCh8RK/VjzneuBB
         soepySDFDzJjgyalkm9lEAf1Jwh25G+tBXalXz1YmuiEExBV98HjgtNdgl9dnCDxLo05
         A7mwckRDxjVPRSr/z0L3DPb6RHzpJcPF3oQg8wwWYu7i78Jt8yiYXEll4LdJHuEd31Wl
         vCkvMIp6I+0ZOj4fqayMDrlNna/7kV3RGSWBAWXpbLkreO1eqIai4Z9no1YnqmvwAigO
         +xnDFF1beTpr2sEFhQbm6fHeNAmVpxke9JUNI4J1mAmdxb2+sqU6DKN18SuDGfiKGoko
         3RvQ==
X-Forwarded-Encrypted: i=1; AKwUvByjCC5S7QIanif0K0y7Zin9/RM/V+ez1YKYEzWvdJMKFZLJU5RMH9SKZOn/epgK0F1Tcb3ul4NiscuK@vger.kernel.org
X-Gm-Message-State: AFq9FYJMEOKWQAwQni+CgzDht1HfASaLGQfOKWN6BeTLOwFEUllxx+4O
	hMqH1W202FhzYsokvznT05T9E0KP5PoMFXKBUV9tUxuvzET7a7R4frbgoE8K+T92SIP7TOjT3QY
	DyU3YGyVkokwj6lmH679segw1ABWPT2c=
X-Gm-Gg: AYBFou1dZUtcDHzwutlVgyQshp/8lhaRozGM+DMFU25KVqngcxxxYaswryQs7KuitFI
	CM/UlT69ccfCORn2LeW2jEOzlWf2Q9/jXW1sGQOmzxVXObTRUG1Gt7oB63rH2mftXyh5GErrbDM
	kpC97RNWXVU0xDv/ZohwJYv/zqXZHS3c8NSEdDwGwnShUeblQeXMq9Q6caldKZ7hvb7XdwyFCZ8
	bmHh0sg/nrFOMp5kK02z5p1CSJFFjhuPE9HzjSHMZx5urn3N1yu7ZP1R1hYOQQS6YWJZHpjf3V4
	p/ewxKegbZI2/oZ9/3AAqSQYhFBTgeIvtFspYIN0ONVUneBXS4hVaIBrQw==
X-Received: by 2002:a05:701b:4349:b0:15c:20b8:796e with SMTP id
 a92af1059eb24-16a5f112b00mr5539162c88.22.1791621356878; Sat, 10 Oct 2026
 01:35:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919235145.48273-1-marcus.yu.56@gmail.com>
 <20260919235145.48273-3-marcus.yu.56@gmail.com> <arVqTWVw-eIZEcrR@ashevche-desk.local>
In-Reply-To: <arVqTWVw-eIZEcrR@ashevche-desk.local>
From: Chang Yu <marcus.yu.56@gmail.com>
Date: Sat, 10 Oct 2026 16:35:41 +0800
X-Gm-Features: AclHuK_Pdn5Y5rSwaHJD0Cqyy5Aqi9sXQlyXeocnYHJYtBTpz7Q3w3982yGkDko
Message-ID: <CAJSHAZWqWjtfmZu8yL=7e1T46CQ9YmY+LRdVmqFetqPOhsF6rA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] iio: light: add AS7343 multi-spectral sensor driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Chang Yu <marcus.yu.56@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shi Hao <i.shihao.999@gmail.com>, Joshua Crofts <joshua.crofts1@gmail.com>, 
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 24, 2026 at 09:22:05PM +0300, Andy Shevchenko wrote:
> On Sat, Sep 19, 2026 at 04:51:45PM -0700, Chang Yu wrote:
> > Add a driver for the AMS AS7343 14-channel multi-spectral sensor.
> >
> > The AS7343 is a 14-channel spectral sensor featuring 11 visible
> > channels, 1 near-infrared channel, 1 clear channel (VIS), and 1
> > flicker detection channel.
> >
> > The driver exposes 12 spectral channels (11 visible light and 1
> > near-infrared) via sysfs. Runtime PM is implemented to stop
> > measurements when the device is suspended or torn down. Power is
> > never cut (PON=1 always) to preserve register values.
> >
> > Future patches will add configurable gain and integration time,
> > interrupt support, buffered reads, VIS channel, and flicker
> > detection.
>
> ...
>
> > +#include <linux/build_bug.h>
>
> This is unusual to meet...
>
> ...
>
> > +static inline u8 as7343_atime_steps(unsigned int step)
> > +{
> > +   BUILD_BUG_ON(step < 1 || step > 256);
>
> How is this any useful? The step == 1 gives the result 0, the step 256,
> 255 respectively. This covers the whole range of the returned variable
> (u8).
>
> > +   return step - 1;
> > +}
> > +
> > +static inline u16 as7343_astep_x2780ns(unsigned int n)
> > +{
> > +   BUILD_BUG_ON(n < 1 || n > 65535);
> > +   return n - 1;
> > +}
>
> Ditto.
>
> ...
>
> TL;DR: I do not see anything meaningful from these BUILD_BUG_ON():s.
> It's not a problem if the result gives just wrapped-up value. Or is it?
>
For now just letting them wrap back up is fine. The values are hard coded
so it's unlikely to happen anyways. But since these are going to be
configurable by the user in the future, I'll make these into runtime checks
as per Jonathan's advice so that we have a way to tell the user that they
are doing something wrong.
