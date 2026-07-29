Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96EF48C3F3
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785333959; cv=pass; b=PmnCdEsTYgcerVZUO+QTlplZNpXSrNGVjM3BpicD7biYENN5YrXS3lWM2hN9mHiYe4TdYAbHJbSUo3R8Wnc9+P1WvfEb/714/e9rtknJDQGpbMent92D9mJzOEQvwNDNy8vUlM5nRYWaETd/QY+OBd/KWmrO/4jq55sedoUfo0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785333959; c=relaxed/simple;
	bh=a/yZ2ryno5QQqoWFq7rssKxvGgdH+IdvJ1MYCeu+/uo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nG5Fm9lQClihHHRqHUyP4O9rIHLfi1AB2wUQ2MRCiF5WKDQrNyj1YfuLtMBwHy7LB7VSVET0hWSDtlSIgWhzZ3u9YH9H6TS7L5mBAi1pNGT7lTPuvdEj1EUuqaE28KMPaAJ9hrXfXXjZ7HgwT62qiuLjVNOwPV1N1FF4SCWtwrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qrIC4nzp; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qrIC4nzp"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1c50c1e29bso147049366b.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 07:05:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785333956; cv=none;
        d=google.com; s=arc-20260327;
        b=d8+MwffftfLBXgI86pCnPETfFYyccpKh1he3tsEo785LTpiElz6RHQL0SVmIETt9pW
         0X+vVqL+zBNTer5QkVMEFPuqanmB+LnqL+zG/HhTHTQEmpZsVaW8iGMPwIYKccks+7X+
         zlxIWfmsvK92EzDPx2tlHsErSvhkIld+YBzACdVMpFZ6sZ32DYk9sg3zadUVZ9/AT+5k
         74TRcIQHdNNUC9f3Bt+z+5BfQYUGB5RS10hgCa4hvnsqLLc2FMr7lPJ9cqIn4uULScDZ
         /Y9kFilHTSrpn0S9ciLWNTuu4AOHjVuFGFcKrz1Yb/ixhvNIvvSPKIeyjMXcS5yeP95a
         u68w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a/yZ2ryno5QQqoWFq7rssKxvGgdH+IdvJ1MYCeu+/uo=;
        fh=S3XxiNRz4dnvt4/PSPYueIyKGB1FWnyD31bAPeoEcYY=;
        b=RCiikGtm9EZji6VhVcoHU+uXT9KXr2NfsCOw8WdSmNn2i/KXA6kb0u1+5JPdhWuxJq
         RFk2K/yLKKShmeUX+GUxlJ15nShUDTV3TY8Dy/LJ623oVjslc5McvphQYsTCjt5GDj47
         PiT4IuNJDkCrfuOSmEgb8bL1pIlODoIcDI6albkZ+7egogfREgDkj7vfGLUmjFlGIiGL
         UM1ONzsrs5yUW6vPvl1orTamDeppUy96YaEShI98qTuGBGaXqXFG9siyBlfyjxDAbGF1
         FZ8T13U6WhWHf2LIHzYIqr+rVKahirbSrVOT24hQDEfLBi9m1VXbPUhUMW85EAQbpKkB
         xr8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785333956; x=1785938756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a/yZ2ryno5QQqoWFq7rssKxvGgdH+IdvJ1MYCeu+/uo=;
        b=qrIC4nzpeyACYl49TiUpAL/Q4+SXvYiUFzpmSVeFt6gTqO2nGtfymKJCVVS7dZKNV0
         c4acjSyj1JWvaDhhutjbvYZnL4tVBYZ0Dc83tORiuOFCcawJ9dqqwdtNWBUH7w9GKwsx
         /m3Sx5xdUJz59fdqwh8DL++Kqds5srLOYDd7Bhs4gFsM8n2+XvC1FDhNBZjkiCmEmmjy
         9C8yLSjdyRGZDEp9kC9EP8NM0DLGqrPz3DfOdA2VOOiTTkuKM1htScI/YoJb4rhe50+4
         QBSQqs6G0eBUuHSTGxH6L1ik2JkrtSz0xtFPeSVXJCXPYynvOzzj0LfYCZVvLZhqM4nm
         fYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785333956; x=1785938756;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a/yZ2ryno5QQqoWFq7rssKxvGgdH+IdvJ1MYCeu+/uo=;
        b=Aa+A60q2098/niSBrBb6zITqYzfrmv9lsFforUSFRPcDQ7pya6QoG/j2VVb4bphcHA
         VFF77gfRjo1Mu5L3dly/1bPZKKBRG3OmAX3+pPSxkFMQhzbCdDveQJNXerfyTGZGn5KJ
         gXHzpdpla3nNZ3mlettSh/7uFX3i+2hn1XL9LYe4+XndOgl2kAwm9NZ3YUAl4Qv5dR7F
         wSlCusa5wGKvAWzi+xgadB0KGZe8GsE7EePCUXgHCgutmXngfr4qJzKOXN4q0xOxgKgk
         lNbG+a/1AEDBWma6Pq1wRYCPrzPjw2O5qd+vmU8ikj1Y0oAOMrRMqUbsqE++C73GpYjv
         uk2A==
X-Forwarded-Encrypted: i=1; AHgh+RoDAqN7lB8Tf5BujQ6jMDTgHRh3tYmO0OutAt9MSFe8sYtViQP7A2eYpkSzDEt6Ym9fKQPhblZ51SCR@vger.kernel.org
X-Gm-Message-State: AOJu0YwT9L5UbFnjXn50eNsy4PjFIq/lM1O6l4OjetV0Y9k6AUTKuTAJ
	wfz1LdKVhzzgMgYnsOdHhIRv9mfmEe49bv7AW0v5r1SeNFal9GSq+elp1okAuV7eJbf9leKyOLU
	i68eY3nGvJK0rp6Kffq9UA2VsJjCltLA=
X-Gm-Gg: AR+sD11PAeA0qhSe9hxZUHObAnRlZMm+eKroAWZB8K+ZYpK80F/ZSw7yQ1ePr5xCLzm
	W/qzwoVXpRR2uWZDljVY0HYB+ZlFm9oGiVx9miFIrAqVyTDhTFWRXd7UEzXeBgmkrHAXohbC+MK
	NGv9ajxllR+p7HgDrej6QdiielFSTkCZkaooHG9JpsN+3Qd8LpljJycFprOhhM0o53dGPnWEJ0E
	dSx9XMWoZ2P/BxRWbSXqgU2euvv+9DsTFWcOgcDAsY3yIhluG+Laf2hwYWWMlvLSpd3XqcHHS8k
	keCXXvXn2i+T6VK76a62LWBCtpdEO0/lp1kjeQJGf2eArZQZo8B+kcuc8kh+mXV27UWaROPY1FY
	AKeXlDUh5fwB8zIuUbWuexa3JWswDOZqiiD8c4DU9E+4nkYGpRSF/1m++JEN3yAk=
X-Received: by 2002:a17:907:d22:b0:c19:5a94:411e with SMTP id
 a640c23a62f3a-c1f721a2a2fmr377952666b.15.1785333955992; Wed, 29 Jul 2026
 07:05:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728-arm-dts-beagleyai-gpio-info-v1-0-783ec90d54da@baylibre.com>
 <7ee50408-aa33-4d16-b8ff-f5e2dc59104b@ti.com> <02b159ad-42d3-4d1b-a73e-13612d9f2845@baylibre.com>
In-Reply-To: <02b159ad-42d3-4d1b-a73e-13612d9f2845@baylibre.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 29 Jul 2026 09:05:23 -0500
X-Gm-Features: AUfX_mwf3aCSm6GuLX1EzXgq-pTWbpjV5yXZsWLP91DhUY8upOQJyH4jnPqt5GY
Message-ID: <CAOCHtYiBRAfqc2dKve8UQa0QEd4GyBQXoYkhSEtYgXwAdWzy2Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: ti: k3-am67a-beagley-ai: GPIO improvements
To: David Lechner <dlechner@baylibre.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 8:57=E2=80=AFAM David Lechner <dlechner@baylibre.co=
m> wrote:
>
> On 7/29/26 4:57 AM, Vignesh Raghavendra wrote:
> > Hi David,
> >
> > On 29/07/26 01:14, David Lechner (TI) wrote:
> >> This is picking up a few downstream changes from [1] to make GPIOs
> >> easier to use that I missed when using the BeagleY-AI with a mainline
> >> kernel.
> >>
> >> [1]: https://openbeagle.org/beagleboard/linux/-/blob/v6.6.58-ti-arm64-=
r35/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-pinmux.dtsi?ref_type=3Dheads
> >>
> > Above had to be reverted due to reasons mentioned here:
> > https://lore.kernel.org/all/20250221091447.595199-2-mwalle@kernel.org/
> Thanks. I was starting to suspect something like that.
>
> Is PATCH 2/2 still acceptable?

Yep, 2/2 is still good..

I really wish we could use the instial state of the pinmux from 1/2
but that broke too much..

Regards,

--=20
Robert Nelson
https://rcn-ee.com/
