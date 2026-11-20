Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795185941;
	b=LBB2NQSs8ixbRYZ6kz75w6VX4o+jJoc0KzqOMzeuIXkv18vE+vnS4hEzv5jSdZuh8luU
	 vUAbsZNcJlI2++7y3j58McBgOYAw3zbc7NNTzywxr+6PUmqKZVg/mQW0iOeC6yUVYD98i
	 6IskQLb2glFlQXJBcDZADbSC3pEP9W4pKqt4d/13mNmTiaf1t46rQiNmYt9B1gDbt2PEh
	 TyZ/miBlFVcpF4nMAavZpvcA5rwA2EoQav0m2WAUSExyPvMTNlmi0+HDB4Y8OV/ySzlFU
	 XKZlftceprv9F+tiLhFwTvUOboV/Nzz+ImVVOgPSnJH2et4jJgKLO1fY0i4O+weLMbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ywjMM2WSUvMwVklBf0BM9q3a3U6GByEzCtPnH/AryCs=;
	b=sKudA/jMZNFXORRz+Q3AZPx47ByrfDgCPaTZfMLMqKRoM/rF2goeJIJcIhvO5zDPr227
	 8LlZaLcK2ygV1B3Ys545Q5dPRMWqGDpS+PRkXqNJH6AkNdcCe1ddtoqqQdIVEKRaLWMH8
	 idxT8KPFBNSsfzGuF2HJtFRS/wW81bwLJVuBEt1BgOinn+3TsUOsI8xQOsi99DOvu8FEZ
	 Y1/zCV4tcV1RTnlveRFUKCYrbfAupHKGKavKIt+zPQA0RqkvOtj9qaVJIvbpPqGBAgTyJ
	 7X1GgQOz08+Dc5cv7LFa8ppzP/aabRUcKKcJkkNNZSDu4XAKRDtFwycnCs10aw+qIYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=fbtnhUAn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F67C606A326
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 14:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F67C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=fbtnhUAn
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b87a240de3so1189218a12.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 06:45:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795185938; cv=none;
        d=google.com; s=arc-20260327;
        b=CGWyq3KK/zFeYFcyMAJkhM7fbq3pb0lJD6GNvJD9Grrw5uzV/L7NIhPJ4szY32uDZj
         X0qY6jYwx3VOXDL5LZ//ZiZmid9BM0Ot60EdjyrUHQweGtUEIC7Ny4TzU7JTsh9atKeT
         Tu91bryOB7U1iB1QMZ2D1JWD8uDAJtPqemZoveDGERBnnnKV6BBwNbKkRx/q2AmuKwD0
         jbNZTKHOPP2ixBer8rOJ0YLf6fgWL14nViFh0bN+z12p9aaFsEeUbRNm3qWjObzxI9qV
         kD7hi4dMLphUQU6iiaqbqBhdvqcq18bYdR4n0C06OeBp8qj8BzRrjg1XVLx1F0HSTfc+
         U9zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ywjMM2WSUvMwVklBf0BM9q3a3U6GByEzCtPnH/AryCs=;
        fh=ZdBwC2NsjRBhE5Csh4ig+xatnPCAQ7aQyeaHAKQDEdI=;
        b=iytsekQQ8zXtPZXs1lEs0rjO9l0FsV08rVs6hlxqeVa6lRF7NPluQqxciKqqnL0Poz
         vo2WiygzrZaoEKpDWOjmBNT5el2s6n5QlpaUFlsdg/SqR7SMxkTUQkHQyTCOqzBnH7DH
         jsRxJHpfPO9bPPD7Q1vxyvJ5gXc/gRRv/L2BQtA3yYK/t8038R14KmxvifGnD9lm0ztJ
         fgio/4W4d0bEIwSIq744w4balGyd7s8nJI2s+CeN0ZB2baMmG3H2P1GycyVXHz4UmQJf
         3Azw7AIT96WA/UwTM1GGYOWqKnjCOSEj1jdl3LzazOSa6H9YYILRR7B2dWRs0O4MqvVd
         xJpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795185938; x=1795790738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ywjMM2WSUvMwVklBf0BM9q3a3U6GByEzCtPnH/AryCs=;
        b=fbtnhUAn2Q7RF7sEM4muGNFO7OUAkj4H6OFozkzGoVlzaGZXM89P9TENj18A1YOlpm
         CSZieuRNqUzyjUuLWf9ZjalElDfbAETPcYKBrlaVXcnvSXQ3s4ypJy0XreQ3INSIzLNK
         N4MHIZhc541vfZfHFtU/LF/b4PaAdPICSGesslw0npo5nqRgwDOCrirh/5+/znv+iZhD
         d3LBN15+xtBCE4MJjx/xYtpC9HHHjzOlNlmcRcLJa5lYnZoyQljYJSPYwceEA5JI9nHF
         Hc0rKNNgCxgPr8O6Zc5x+/yy2TRYs0+0Axd+og/Ws6EBzubQQlkstOchd9GYJ5d8rpXH
         URvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185938; x=1795790738;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ywjMM2WSUvMwVklBf0BM9q3a3U6GByEzCtPnH/AryCs=;
        b=D2eoPSVpMxv0kFy65vVtw9aMh2ZwNi/mY0tLlDzg86CwUe6jLc83eIhv/sH2kLFjYA
         NGV2A7CPKwLSMv+3RaBO8Rhhv3gmBUQyp/G+IX9SHGM8Aku7JGsg81NvGRIjBU1o9n1Z
         /hx4NZ8SMfkpskSEKyDkRdgnWjR75e+MzQM63tCvpcncvPq4Amd81+0tHXP4i1r+3mUb
         dp7K/NdBzZLjA0sOssu23FjWgR8FTkg3nn4PqMajPz8DPEjAAcdojQDjtK3i65Y1PxzE
         Uy7QIVvL+dSDBjktOeF+y//DbZqUWLec97q2xXfnanJMn4Ml+z4xRKs8IU673Db/Xl46
         oC5Q==
X-Forwarded-Encrypted: i=1; AL+hErEXSKL4HYi5nIL1enLclkAGTIw9Kxu8LTaDQyP6TjIDXXGH1NB3htU6jpHP8yJhZqs0UlNIMNIAkEzY@vger.kernel.org
X-Gm-Message-State: APuU4Z8H2uVOmNOqs1r4tHDocF943C8rQ6SORjJiYTbZsluxiJBjPHWb
	7ak3XqQK6cIcugk+H1baP6rMoflAxEYKcscNGlmUOegwMCGd1YHtymRLp5KKdpPWWKTDaQnx8df
	crICaLhNvIZZFc+ZeoNb2vrTm86Mkfi9kgPTSxtzRdA==
X-Gm-Gg: AZFdTZfNjBVAmL/K9/LyfLnQMNOJrKi312JAwEbY+KGSKe/VB/IYBNbhNUa1OJdw6gm
	PCJgEWaewtYXMqCW2aJi6bFJcCtppMr6cmvYeHXSkk2TfEs1I3EmI/HccQbLT8a+w49BQA5cewj
	QasG1GNZm6WOKVqvrLqpCjMhGTlwS91P9HZmBWPwW7hRoPeF7NNVn2NhXiOscokGypzLcGDiA1b
	RsPhvEqWJtvuzyTt79W4zv/K25pUROmoJtNJ9hQIzuwuzHbtxGI1QizacBXU7pgCA1iKkgxGo9R
	s/N/Nwosk3Akid9JIQROLXeXgAMv/osJq/SMwfRXejE6Lvi8gxdTCsN1ndpMxB8LDI1Xm0Oua84
	mlQDBWPATDGWAVK4+LwynNijK6B11T/Lzzkhwnz6dnaRXmM39AibRD4+PBfEzlq3HD+XyTRJZfl
	iU16e0FDZK9OHnV8AR
X-Received: by 2002:a17:906:4fc4:b0:c51:24a3:208 with SMTP id
 a640c23a62f3a-c513a5da66bmr340053366b.9.1795185938297; Fri, 20 Nov 2026
 06:45:38 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-battery-charge-temp-range-v1-0-a967abd8b80c@flipper.net>
 <20261109-battery-charge-temp-range-v1-1-a967abd8b80c@flipper.net> <20261119225808.GA1121782-robh@kernel.org>
In-Reply-To: <20261119225808.GA1121782-robh@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 20 Nov 2026 18:45:26 +0400
X-Gm-Features: AclHuK-7Jyc8TBiMh3SZmeiKuU6wfTaME9iZFCNa2ski4ByTPxfFe688HXmvWSE
Message-ID: <CAKTNdwFc5yam2HjkR4ShsMHJbTs7SesyvNoYQWwaeL5mAN9XMw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: power: supply: battery: Add a charging
 temperature range
To: Rob Herring <robh@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 2:58=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Nov 09, 2026 at 01:41:48PM +0400, Alexey Charkov wrote:
> > Describe batteries rated for separate charging and discharging
> > temperature ranges, such as 0-45C for charging and -20-60C for
> > discharging, often with a reduced charge current near the ends of the
> > charging range: operating-range-celsius holds a single range, and
> > existing users read it both as the limit for any use of the battery and
> > as the limit for charging.
> >
> > Add charge-temp-range-celsius for the charging range, falling back to
> > operating-range-celsius when absent, and state that
> > operating-range-celsius covers discharging. Add the charge current and
> > voltage to use between alert-celsius and the charging range limits, to
> > describe a reduced charge rate near those limits and none beyond them.
> >
> > A missing half of an alert charge current and voltage pair falls back t=
o
> > the matching constant-charge-* setting. alert-celsius is expected to fu=
lly
> > fall inside charge-temp-range-celsius, but when it does not,
> > charge-temp-range-celsius takes precedence to ensure no charge occurs
> > outside the allowed range.
> >
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > ---
> >  .../devicetree/bindings/power/supply/battery.yaml  | 45 ++++++++++++++=
+++++++-
> >  1 file changed, 43 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/power/supply/battery.yam=
l b/Documentation/devicetree/bindings/power/supply/battery.yaml
> > index 9575ee1491bb..d2f2ed9a01fe 100644
> > --- a/Documentation/devicetree/bindings/power/supply/battery.yaml
> > +++ b/Documentation/devicetree/bindings/power/supply/battery.yaml
> > @@ -111,11 +111,21 @@ properties:
> >        for each of the battery capacity lookup table.
> >
> >    operating-range-celsius:
> > -    description: operating temperature range of a battery
> > +    description: operating temperature range of a battery, in which it=
 can be
> > +      discharged. Charging may be further restricted by
> > +      charge-temp-range-celsius.
> >      items:
> >        - description: minimum temperature at which battery can operate
> >        - description: maximum temperature at which battery can operate
> >
> > +  charge-temp-range-celsius:
>
> 'temp' is kind of redundant with 'celsius' and a departure from all the
> other temperature properties here.

Ack, will adjust in v2.

Best regards,
Alexey
