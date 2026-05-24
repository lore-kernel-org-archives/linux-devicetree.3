Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9457B42A82
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 02:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779590769; cv=pass; b=DAdtOTW18G3OrnBS2MCJxEX2QDHUK4BWTQbejxfy3FxRnQRHnC0JoAD/d6JevKsNcnETx1M327939fEzKM7RmJiGHr4CUJ1bD7+fD1pqnL4BdHOzgTvRsw0JTm3TAGxzPBG9ko5VDPgpvKx/pq83kjuesX9k9Hl5KtPqJgbfLvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779590769; c=relaxed/simple;
	bh=uZPUt3363aHN0DUEbP/jucw4ks5E7ZQoG8cHJtLqzDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u9LF1ar//JRDOa0NnuUAj2NH5J1+VBGkJ1wHry5UsnkIMHtTXkxvrmnKywjqzH4hPLbmGsZ5vGzKRz9dSITrgW7+m+zd5pHOy5DiOaZW5WJfCqV5q6t0TDPXJj/yXVGcKZ0IZkIr7zl1CAMJs14q5q5oDF5yRRMiyGvcto63SJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjNIMvZf; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjNIMvZf"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38e7c3a2deaso78365961fa.2
        for <devicetree@vger.kernel.org>; Sat, 23 May 2026 19:46:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779590766; cv=none;
        d=google.com; s=arc-20240605;
        b=Ms/UeO7Bu1BLJ4rg/fDTnOK5Fqkd4ihb11WS3qFvzWy5bKyfhg14lHQpYyxgPynvgS
         0aGCPvLPUGodZsABNFJvBGXPq2RbYxRY5Vt0q7BAiQYvixqQWTtcjZR6yRnTE0T8kam4
         wUbMDBb94uaoNDo3+BriQUa0XLNgFJAvr28e7EGK20B/dvjx4eP91ASfuf9jinE16sIq
         bkWQ4mIeJNUXxejmE6u9bFhUjjCO6za5WfMPBwLCJxie/cWNBS/UU50/mnB++295KkPC
         EeOwc97cbe1sY8QQ1imzrdZw396HdAm+KPdASbMjwguJH/+S3EP9MQ7ALUNMxpveI/1I
         f+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LGTbgaUXa1T8NXbfdSHyyWoA5IWhzhn8eKyNnFZGpns=;
        fh=2SUIqjl6j26hVBFvi1l5uGo7fyLjCJFaiqkm/N/KOxU=;
        b=I7wwuqMpG6GVr79t7blA2QXV9xe0sqzUqhxYrmK+6Iv1ELZ/iX1YA1GXHn4hIZojr1
         wE7SMG5wMHZTiS4zXdcvneFRN/6LOlTVkafXqkCHeoqfVTAx74EC80Tp1oj8xzJxyG8/
         BCZZMQovzl7UsgwnQNcTTGkW3VRQ6PFsohn3JATZTbCKR9qQQBzP1DTIMRG7AvdCvFP2
         ALs0X6vpaprV4P5W1dlgIBWaEOzNDZm+46hVB+XogqN5TraVLp2PWkTslwA7BQeOSUiX
         hr+PNPODv/Jtc7UJappuNeBgBhCneIIo7K6D7CKP/109j+RtoAmnr4K90+TuoiNhKxuO
         rMdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779590766; x=1780195566; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGTbgaUXa1T8NXbfdSHyyWoA5IWhzhn8eKyNnFZGpns=;
        b=gjNIMvZfdP6RSA5wSHZzZNH092wnoUZhK5ztlpRgmqAX/m4je9YeQyMXcLzBgurGmd
         9A/OkCWtaPXy5Et/npv2mDPQD/GjFFcCUNS703vjurazVkZaVX4ClqeMvAumoBNvm3gK
         hSv63CGMrlig5QeIruGp58PPzeVUd7a/OJjgr9pbOP9DyDNNqSHvA5I+zhN0bdHxIVQJ
         aHDYVWxMtl3sTKBufKn7/2S+PnSUdWpSNyGzZd7QR4DqB0g2tQUMi+0gvZ8kghwDqAaE
         ng3HVXe9f9dgw0jsMT/orXd+8/y8Y0c+RJr6pcCrWO2UIogPW5DiwikOZnIWl9swr3cE
         UiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779590766; x=1780195566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LGTbgaUXa1T8NXbfdSHyyWoA5IWhzhn8eKyNnFZGpns=;
        b=D1f+RPK5ki+Bzh4pFfrvwcZYkGm4DT7vNvBpDwH25yE9essISsqXlK72xYzMZaTDbO
         B4g18ZBcIjzBrZe4fRhieC+HUPrbev7miCVSsRzgOTQX1eR6kPqUrhVezHwkOwUvLBs0
         ziAJBxfmBYyaVuqGVDHf1TX69efDvFrO0NY8NHeGJwzDjZdlmJYB5Z8aln9F5Pwji5bq
         UhsNdB+e0cKfZ90nQ5EWnkXtzdyW7RwFZXh2YcKfYaPWk0Fcb5j5oiC5REaZCvKUDsF0
         AA3sFpjS3jVj5sF+5xke0j8hYsIPUusLL2wfVgFppLbT6TscrNL+wP3FCKhPQUBpI2pd
         eYKA==
X-Forwarded-Encrypted: i=1; AFNElJ/jU+lJUn8Ey737tBOhFvsi01iOyb0YWdQQ6w0jcuTdYsbZbdJlkdX27wO8DII2/TfOr3SpvZsCKw8U@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/BQmLyG3V+dUAfvBrjbBsClR6R3j/VyntlfOmF/q90QO/uVYy
	d6l5kRUdk8DilViriybKFs/uP381LE5VFqr93bgDy+fzTtt1Agj2zeb+DNQTKMFXMJPMums5mMK
	mYuxMTs3Qw5MAC0o+1YqvXH/bKDHk05s=
X-Gm-Gg: Acq92OEwU4mhgFNZISLckW/K4B2C4ZLtOjmsNBM9DVnVOKkol2P72sxoa+wgfbnzv8i
	FkxDBOfY9QQ42L5ru71qe+cwmkEvKx48vlgn+Nh34vRIZ/3/mra3IQ6enpucRmf0cGkZrvmxxv5
	dJQQCPN2z/cQQvcdXrXdWrgeQTLWrUUzdIF55mvAUqt0BIftnZj5ZDXxzmW7/K0DbZHpmfiYy/y
	Hbc0qZ+ZJ6XWi82XIgaHu4pd7RAc36Ax+JVYQiQSN6Jz28YP1XOQ0n0M1rtcHAn6UBzeImMOXmR
	1+BO7SUKu99En2zmYnTJf4EYyaGNg/wgphCaZkWF
X-Received: by 2002:a05:651c:b0a:b0:38e:8503:6fb5 with SMTP id
 38308e7fff4ca-395d8a064e7mr36272791fa.30.1779590765592; Sat, 23 May 2026
 19:46:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518220228.63322-1-piyushpatle228@gmail.com>
 <20260518220228.63322-5-piyushpatle228@gmail.com> <20260520111919.5e99fe72@jic23-huawei>
In-Reply-To: <20260520111919.5e99fe72@jic23-huawei>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Sun, 24 May 2026 08:15:27 +0530
X-Gm-Features: AVHnY4KJEqvKtPhRF0o7fAyR7IdmJBiIwmlz-vGVAM2-cM7MNI2rCTM-8DJbIB8
Message-ID: <CAMB+xkYUC-OqncD+SxOo9K36ZR9iC-5CFUs6wKojz2j+M24K4g@mail.gmail.com>
Subject: Re: [PATCH v9 04/11] dt-bindings: iio: adc: hx711: add HX710B support
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andreas Klinger <ak@it-klinger.de>, 
	Andy Shevchenko <andy@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 3:49=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Tue, 19 May 2026 03:32:20 +0530
> Piyush Patle <piyushpatle228@gmail.com> wrote:
>
> > Add the avia,hx710b compatible and document the HX710B-specific
> > DVDD and VREF supplies.
> >
> > Add constraints that forbid HX711-only properties on HX710B nodes and
> > require vref-supply for HX710B, then add a separate HX710B example.
> >
> > Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> FWIW the only thing Sashiko doesn't like is dvdd is enabled for the old
> parts. Move it to the earlier supply adding patch for hx711 and we should
> be good to go!
>
> Jonathan

Because dvdd-supply now lands in 02/11 as a shared property, I will
remove it from 04/11's properties block.  The allOf constraint in
04/11 does NOT gain a dvdd-supply: false in the else (HX711) branch
DVDD is valid and meaningful for HX711 nodes too.  The only things
forbidden for HX711 remain vref-supply (else branch); the only things
forbidden for HX710B remain vsup-supply and rate-gpios (then branch).
I think this will be a suitable approach, right ??
