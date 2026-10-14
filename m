Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262052116F4
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 02:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791944553; cv=pass; b=jKi3o2Mk84+1qOC8RHc4+UgnPUROfULEqRRA/s1gE6WwpbdZW4p0jwH/BaJQ3wZYaPagBU8PkD3wBETi5qFYfJEbQhqZqNnQDsJMrk5H1BZhQRg8sqJEN+avUkLzNSsu6AeD2ap5LShdE7uLecJJp1BKLIJ5bjtvvMo/O0pmBqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791944553; c=relaxed/simple;
	bh=KqbPDHN6YdzyiKMmIDyDQnrpTH06Mt4Ih2MF0snoOxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iHbwX4aveEbTvF8VU1oig2O3fM7m+sfO2euEMPCvEj8ZjXe4z0x8s8RLfad+keRW1t0iUCnyPfwnbs89uC6F/fdoyxjnZJOkXiLaURnt5S2FLAQmIWCMRu5ffJMvNle6lE7Nc/7cBFCbEkZWsFlpxD1v4DEEccnAWRJvYnQ7tPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acr3poyi; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acr3poyi"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5ba328513b9so2945778e87.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 19:22:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791944550; cv=none;
        d=google.com; s=arc-20260327;
        b=pj9WpQTnk4fZi9W8OlloTLOn6EiEzy9SlRDcuIRc5jEtilC90cBzeULY7IZx1F41rg
         Tqox16U+7O4JVqL/0pxJ6acjCKrX9rTZGLtKEZQvF5fQbykxIgputK7i2KldwGUeokW3
         zr/o1nZ43aF249vdXUEPX5xIAKM9TFL7t6fswkTOS71SddPotGmWdYMc6Nyw53YAW/vz
         i6yW5E0y0XbMbmSQHYs42xFzX4rdSsNWJmd2KldfJmpzL1CA0vTh7XLr3mhIPEQPoZ7d
         xjn/2kP4hnoHFGZta7kQBnRh9CTuD+qqO+EIKWElTzWFludoK6lUAnRN1+6GvE9F4h0N
         Dx0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uR6LzQI4dyAnk+9+CQvzUY4D1It975ps1tZNRpR3a0U=;
        fh=RFKU/wvNFfKoPx5RE3tLUKTs44HtUFoUtOVDrYoQIf4=;
        b=D7an/SQgSEZIXEX9VSiTYynVf1gRrcSKHdalkD8P8q3y6oc5dmH812gYnMREoMWujD
         372Q1ZhYLR9XNtNZLN1gWuj3kvkigucf1/vM3jqbRK11TPB5+fT99yKlKxLIxjPgx0dT
         fybo1ufisqkk1+VwYIxg89GSZp64dWsYDNJ9EnbEIQWYfXMJwDLfbKv5msIsOCeSWhaM
         zownNktoVv+X739YQm/TiUDNbP4P5vDfxJ4s4Ye+XHCU4bcNJRAJGpEO5u8ZK0oqC8U4
         qx6yZBKk6IlkCziaSlwZ2Nh/2tLD1pWNXGWZxfjn2mcvuJLm4UhMyiurGNm1D1F9QUWH
         SeSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791944550; x=1792549350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uR6LzQI4dyAnk+9+CQvzUY4D1It975ps1tZNRpR3a0U=;
        b=acr3poyixjN7LIw8cYOqWxwY2nyp5pzz8ZXyaN38LSN1Ku5HCuKSc0ylBKbF508Otb
         C4QgVATTN2tnObx7GjA6a0PakoCqg/sY/8jSAmmGZ5BaRrt7oIm8bdgEteV9iCFQUKLz
         3sGwPifyTuvnAirxpqkocd6XCQzokK+mF0/4Lg1w9vnflrBNHc4A7idDLIpxShID3JOe
         /tWWtKnZrsjU7lYvJtGlglmZ+A+lZmUp3GFH292b5v0s8R9EURVbJSqdt4QBINi1g5ZU
         PXfBHGk4ITpry6uBOz4zh/x+s+lb68laXfGpOZBg9TJc5D7DS/uL0jkLjbYP7oBHHdF5
         zZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791944550; x=1792549350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uR6LzQI4dyAnk+9+CQvzUY4D1It975ps1tZNRpR3a0U=;
        b=Y164hHplxMqSN4o5kRJpEEBdggZFXM8HM21kiD+ZrzPXfMgW9yetzLGjGpaU27ln9Y
         CAgbsTxm6CXtGbwJdS99z9JGBV7fddvY8JOQW0jKBvATXCPr9VGcyn0Xa0oCY1qwtRSx
         SDKnD5a17G0bEt5/AEwwzck604CJBnVI3Rg89NHM8+So1h09VE0r7yYVIidct6Az6VMK
         XbiYD/fmZtuWOTB7jkcc/NJx/sB9VjYwy0/CUXe5c3VbMpgOzTmJOkA0g4D7dVtWgMMS
         IO5Hls/9KRZeaKhe/5oQBtbXz0qu/wTh6Lu5NEqFV3/FaER+9b8y7SwvTa54YxXx9yK6
         Ko9w==
X-Forwarded-Encrypted: i=1; AKwUvBxZMSLgGvfudWFwmGOJOGSkYGnm2Jp2Y75/+GIXODVdeOsZMYR1yOaxx8Uo1bg0AyOo9XzUk+XmOoMW@vger.kernel.org
X-Gm-Message-State: AFq9FYIxfgcWFD/HDohpHbZgi/wWov2pbeAB05bwMCkg6o/cc/u4PREs
	GBqJvcw5MYCuSVPSPUJLwEKDLR2v/g1iRbdqwkev5FabFrZmBFKnqHrTfCvE5BgKhVdqbaflbfk
	h55m5mAfEgglNNNKCJJb8LlYjkGELP4E=
X-Gm-Gg: AYBFou1LE6FSyPRXsqVK8CNxWYt9i+cWA/NcU5BySJoiXZbz2n4eRDKqgttLzifvPYg
	ycSCGFzevN67oSlaYC2c7rgConAcLRF+pq5HbtApSdCWvMgQAAuq9YarEO+He80qcW5/D6YqQBQ
	kL/45bXsXT0sfc48jprMMSgcbl1CXpZWvAb5Gjfs4BktcYB1RCl9oR7DioDs9vAuh898+qHEO9R
	Kt00pXQFVdXifa+FV59xsIrkTsmyuXZQr4vjrgdEaQr73p1lthA7kQp75bIba/C7UZPVuvLd17U
	bET/RLD9XfyMXhYrv8xqxvwwjx8vilRNxSEjV9mJ9DttKgTc3wwW3s6dKKHZhkx5bNPuAxbLdhA
	lDUPHi7L4VCwcu1/4AwYDmO88iBGJ5rsx0vzeYZ9ynAA=
X-Received: by 2002:a05:6512:224c:b0:5bc:f02e:9b2e with SMTP id
 2adb3069b0e04-5bcf02e9c70mr3265873e87.9.1791944549826; Tue, 13 Oct 2026
 19:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013145210.103565-1-sashal@kernel.org> <as5R_xrDv4eVPdtz@orome>
In-Reply-To: <as5R_xrDv4eVPdtz@orome>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 13 Oct 2026 21:22:18 -0500
X-Gm-Features: AclHuK887CDwAvm9A-A5lvdpxpUm0jxZaYwqU9DtjoFJ0z65i4nraDiY5z22Q4Y
Message-ID: <CALHNRZ9zhVaz9UeYJTFRph+0JMM8x+5it_Xv7Qhy5f2kh12MDQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpu: nvidia,gk20a: Allow a fuse clock
 after the reference clock
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Diogo Ivo <diogo.ivo@bootlin.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 10:46=E2=80=AFAM Thierry Reding
<thierry.reding@kernel.org> wrote:
>
> On Tue, Oct 13, 2026 at 10:52:08AM -0400, Sasha Levin wrote:
> > GM20B needs both its reference clock and the fuse clock while it is
> > powered, so allow "fuse" as a fourth clock after "ref".
> >
> > Assisted-by: LLM
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Aaron, Diogo,
>
> I'm fairly sure I remember at least one of you mentioning that GM20B
> wasn't always working reliably. Would you mind giving this series a spin
> on your devices to see if it fixes any issues you were seeing, too?

I've got a t210 nano a02 that essentially hasn't been able to load
nouveau since I've started my Android Common Kernel effort over two
years ago. I think it came up like twice when I accidentally left it
boot looping for days and forgot about it, but never when I wanted it
to.

With this series, nouveau loaded properly 3/3 boots. I'll keep this in
my 6.18 kernel fork and see if any of my t210 devices hit the probe
hang and will report back if I find a case this doesn't solve. I will
also point other people I know with units affected by the issue to
this series.

Aaron
