Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64863EB11C
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 07:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875688; cv=pass; b=uzZkYMH7tVQqIU6CAOEI8mqVtwwAjVPDM1PHmR22HcQRe3pmDG3+0HNTIOJ0RBH6XIOZw++Xz9EqtMFxNevz6lLCfioKK9ECx+jMfKrUZdwOBgbZd+SOLvhCEz35yAEHM8MiI2ABfT40MFkQnPBSbrJS4wASda9isaZjOIDSZSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875688; c=relaxed/simple;
	bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DAZnqO25D0qWS/MGSxGhoF7ijJmBYjC5j2g2AQ7H2daVj1pW4RZCGIZaHjsnr77p9rzkmeyG1zFykge2vRe7u2MRgrML7yok/TDpm89uFfwzUppM0p6CTUWZ0M1iYX3fxBSjw51twSyqO7MvxkMmZRFQ4sGGpx6n2LVHUocg3pU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gM2OZmHe; arc=pass smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gM2OZmHe"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-51f2e9e6987so810249b6e.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 00:14:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791875685; cv=none;
        d=google.com; s=arc-20260327;
        b=jI+38tnTcUWwULc5aDBiigCl2mGSHgTpol9rX1KOohzuQSclrUsqeeAbqvF/BOW1nZ
         NlMZDKNC0pFtz1kFkLDlXv4QWYZYkchEL21nQQolG9H+tCY3iyGakYfqT/gKTfJpNlbQ
         /4XJ8Z9+cUVl5s2uj52hvIKsXmoOhb4n/189BZ0+colUdJ4uW5FCQh/Ob+XXXNyzLWf+
         py5aIQXkGQPLBoa5C9vrS6y5fGVqVJRcXZH3HWOqgP9B4YmpWFpbzn3ouCYeNhVKvFx5
         LAF55UQXzEddJM/uf4DE73FQvSw2L3OtubiuqR6jZSb0mYydB0hGPWAksdJBOtkxD4fZ
         q24Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=;
        fh=yNEn6XnveLRbJNQEdqmcF9Vm7REVHXswXfMC9hT5EgU=;
        b=GkdvOGLTdefH/rt/Brb6k4kXWxcMn/+Rr+dw4xnPinrmp4rSqhFZpkBWbkFiDAESd+
         fF1psb5TFJ+wR/407aRzM28aYTAy8R+Ewjt4pU4kS9RxgBKA1WXYpUgVh2S0r9s3yeMO
         BUa5b4pq78ceCvVuwCZKuYJuT++eVTVsiJQ01TxdcVOaDOh8RODn5EgNppHCJZyjQ4QP
         TjX6ftdw0eeUznuGEvvE2MOmfxaxNMTLUvnkkMsfm1c0HMySWxApdD0WcoiKLjVK+VIr
         hnss5iDIuKc7maCS8cmRalC2ekqVDAZAQxrmjSA1L849a9VJZ1QLlPurnHAawHvPXTzv
         ECMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791875685; x=1792480485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=;
        b=gM2OZmHeiqL0xiQxjAAqlsAzVMHrKVPK2rU0w4j1ofH6x5oIWWQE/8SdowtSvQE6Cr
         +5Mt/BOyAsGiEwR/zTUHoU9/Hy/JH0TDhQI+X3tlIt3kiZXrfmzT534KWBSZ2hkkN4MU
         klHALIlA0ZemLbRTZlm8Oj891qv8jdwIMvV7ohiniZSrE5TzIOOSnEj7gvaKCpXdzEgs
         lh+wtVbK/RwB03cyoRwNdxMIf261jTq6aQCHBhHLemDPFHkuNpN8e2zlKsinJHJ+Ckvl
         f/9uR+Y3cFBs39F2zA4Jw430o/94XPaVNCZgLMWGkxSHhr9XzFWd/S5xwyVv3nCAGGdQ
         hhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791875685; x=1792480485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=;
        b=Ul4Q1ZH7R/eevvY2aWCKuP5wx039kmSP9zhBlSTEf+WsXFI3KWBYSDm1noiPxVVj5c
         xw25pSaymEtLQOTyg9Zm14CeYINRN5z2Fhvm1lQU/JD5nevu9lIq6aj3ZEkpnKRIzL7u
         J1JSBiD74Jt3DaYvTD32qF3W9GnDjqs7hmwKva2IAYr+q+4eaoAUgPRXIvCBwkmCuGcj
         MMKvY0DbxBJtJOJRSL1EZkU0KGifCwnZXWbkS0CPNlTVEDm6riiyd7O5nrc/QVjwRCxM
         fvCd4cttq/lax+NeRv2nqPseSeYltJc5fdxbB2P4jZm83tYLDnTgjuVCsztqXTA+Y5cs
         qeMg==
X-Forwarded-Encrypted: i=1; AKwUvBzQuEYmV2SG4CB7aIXmMpWdwsUZIZNysSaKbbwhMuajbIRiDAm9oiefSOAc//6+QN2IC+0UZsWqlECm@vger.kernel.org
X-Gm-Message-State: AFq9FYLGtxQZorWkxZaJvEDHkXwPCsK0DxdctzowKscUYa5NUMhKD92z
	Dw+y2+PNQjQCnpPWIa1zA0wuKGvjI4+/XWk5lL/PaWMgt6OG4IFPWL22ZRmSvTxGkzpb52bhqGa
	dl9GGgzxVCsdqo5rV+AR586DBAmHGhG8=
X-Gm-Gg: AYBFou0JtnaReLJQ1lkrH4CvhHomf2QUtay3BgRN2MQyfa1GDzroL6hk7I0f9UHqDMg
	3F4VzFb+0gBJdoYEunuS2PZXCTXCQykPv0aPUjOzCD9VAel04dJOfIUJa6gpnSyem7wmG8aV2+W
	7fmuAmb8B6B0JWZbF1PpW8doZXb1P/a+UuN4XnVSTZ3HlXMhaDlpfmEUOYJWoG5O73AyrdyypDp
	u0uP3IMsyb0vmWf8GYNg+7I9Ar0tR8eaOiPfajPfNN334uq4j3awkHqZJ8Pu9rcIHY6nYFFoz64
	wCLPRVzFDYoEZH0elvsebrLkGQvnoxph49OYdDh1l3OsNxR08SrOXLbwB1oVCPyKUvHKOZ+fO8X
	pMzoNKjITqEjyaqfla1G+zFktS81zrJA9gUpA4FFXpcCa4HrBNXlTnuHIT0ftLCdcb/nbElEy/F
	SCpGwTI2ddjA6G8sJBwP6lC26eZvzSd0fE+S+CG89WfUYO8Epw2ZQ=
X-Received: by 2002:a05:6808:30aa:b0:495:ce6d:7d48 with SMTP id
 5614622812f47-50c4e67cdf5mr8677005b6e.9.1791875685589; Tue, 13 Oct 2026
 00:14:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-9-7b47ed6335a8@gmail.com> <3698d260-13c5-4050-8f03-61f7b7185514@intel.com>
 <l_pd6lBHQaWNYoohhfxhFw@gmail.com> <8fcdfd97-fcc5-4ed9-8a9a-3e7eac53fed3@intel.com>
In-Reply-To: <8fcdfd97-fcc5-4ed9-8a9a-3e7eac53fed3@intel.com>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 13 Oct 2026 17:14:34 +1000
X-Gm-Features: AclHuK8TJXmdm-cxsbCKrijwUibcd22A39HSUGZRpbNW3PHDJmMdVBEajRXhBY0
Message-ID: <CAHgNfTyTQW2vMieSo+U7CTTuckrLZL+PuEKXfKCHYMFDBCFWng@mail.gmail.com>
Subject: Re: [PATCH v2 09/21] ASoC: apple: Add macaudio machine driver
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>, 
	Sasha Finkelstein <k@chaosmail.tech>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 8:03=E2=80=AFPM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
> How does one know the speaker died? Is there some kind of signal, event
> or an interrupt we could depend on? As delayed-work is a mechanism of
> choice here for handling the case, I believe there is still a gap and a
> chance for bad things to happen.

speakersafetyd is a userspace daemon, not hardware. It cannot generate
interrupts. The daemon puts a magic value into a kctl every run of its
safety model to signal to the driver that it is alive. The driver checks
every time this kctl is put (see macaudio_slk_put) and schedules delayed
work for the timeout, resetting the timeout if the correct value is put. If
the kctl is not put within the timeout (e.g. if the daemon crashes),
it locks the speaker amp volumes to a safe level that will not cause
damage.

We do not want these checks running when the PCM is idle however,
so when there are no longer any active DAI BEs, we disable the timeout.

> Czarek

James
