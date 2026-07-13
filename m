Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0A939B943
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942102; cv=pass; b=e5irO00N9J9vD+3GZYsx/DhSi4B0Fhvhub7ETEPn0URU48R2ezyoGGEF+ItmwT+1qvBAXp94anaOgXg7LrdoKD1uFJzRoB99Iq8N51niv4wB8ATmvovKQGgTP4dFxLwiqlIZq/0q1HUZX+VKWZdhnziNHD6CRf2c8a6FB3c3Z/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942102; c=relaxed/simple;
	bh=CsOQmBvWHRYBm4uU/y67MELpLs3ohV+u3s6To31MyAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LZAYnfy4Iqtc21nmM7G+z6fGpsSXJt2M77lQLgIqqnni6e8n2Btw9cXqTLUZmKUVsiJZS2i9xI6cAdbQXsMV2t8sOtKFS2KCzngHT2MjyGF6G+L5CEKfpFhyaY0N6STVYmxTx6npzvsPrm7aIZzwDCflFqXuwtexx+Sa0wO4wFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=aoYvrkwQ; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="aoYvrkwQ"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8ef1dc934d1so27747256d6.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 04:28:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783942100; cv=none;
        d=google.com; s=arc-20260327;
        b=NTy/DAp03q8QEfZcuFodzu/k91xrqWB5GYLBLknSkZbFG8UrU0wfDGb+CTrZEqWUpU
         qy3X93fXvjXysgVo9or7ld4ya3MjBNxkiq8d46OY0vlVT7vmrq2eVOQwn5a4GXeopeTR
         GalMmIbE5KvOEHN8jxQVQHdgXZorLQurtoz3plem8XaxLnD6iUvnmC0o/FdR+U6bqlFg
         Y8nRTYZZUWeISSwaGEHUTg9Q8XhcUekfr85OYwKDegbKxYOU7pZnP4Z1UggmqwNlsKmS
         guCUKoNGSQSufdNj2WJ++W6ol3Er0eRZ/vdwOVzjAyXBLx2oj0/bRWotwe51HhG9+TGM
         g+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=st85seCDQwEjU3U5r3+4UcGdfGWDn3g9mE+v4yLDsIU=;
        fh=wdpsA1RfrpS8GIdfqBoQE9PXuFX6IxYKWsxxVecQm3k=;
        b=BYPU0rxsxN2EfBZwdJY2uqO8WsZCnWgKsrg9uEVlMlB9kC/m5si8qJWTltSWZJvo4z
         AxQVrcglcZbp+PwNH37uMjc3LMTQI1FQJwNH3WN4bhcmMh2CqSETWUdq7ja8CywNHDVA
         jKUClgdySqeqcznBnDFRyAwFk3UP19/wG4q0KbkWZf4h+5nR7T98HWpOSxOXwden2w5y
         LjhiX1I6qrrd9WYbyFA8Ebm1ligl0UoNXzCjyK7oYni2tK+4OG/OgZ+Ub25kaL60++OZ
         YYjQc2iSvzwS+kXuYtLCmgU9XOkOrrrcnBeAE6AXvRST8yuU5qca+ngAaMXfDfWWdi+Y
         x7LQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1783942100; x=1784546900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=st85seCDQwEjU3U5r3+4UcGdfGWDn3g9mE+v4yLDsIU=;
        b=aoYvrkwQGbgBLlzChVmQy1693A4OvnSgnoYYYNTTCAsNCu2RuEmR+3KZdyIMK4kvuk
         2e5K/0ZmrBHMGl1XF8m9mWjNDWHlNoc1BMHeFUB2lwDfcx61vobEh2cLy1gFkuMY9YCV
         kvOzClk15DWNYMx11XqqL2/7HJaAQHxoTKPaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783942100; x=1784546900;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=st85seCDQwEjU3U5r3+4UcGdfGWDn3g9mE+v4yLDsIU=;
        b=UMdNhQ91n26EEiz48T+/vN6PRWyu6ArYY3g/Nc88sAaM2CYwynR3kKAhk6kgkF0/VZ
         17Khup0aM841t0Q7ieQCnE2YveOjJUtKDIwPaiR2nUm3xsEhf+d4F1GoxpZYCV8F9BLx
         CpZGsgPbmrV7f6lO1uQ/W4GL81kt6gUns/Du8R3G/KjZ4lcYExF9wFQifEc5uVubwVCy
         BWs7BCYLvyZvwV4VZ8OzkpceDyxsVP9aTTl7ggDxNeYO7YNfwM5tCV2gpgt6ZL07dy8Y
         FgOw+5Pq5ZM6Pd696WF+uyNt/hOMUvzovrwinXJcOcJeofEQGvT6jKn2JwO2i45RLv4O
         pb3A==
X-Forwarded-Encrypted: i=1; AHgh+Rr/OU4jwk2NjFTmhRnydnzhQ3Ejj36pUb9mPQbOb1afN1JqyXZE9mFvoEuhtcJlYRMag8uq+ooH88HW@vger.kernel.org
X-Gm-Message-State: AOJu0YxNuY0JYIaNUarU89WKH6Y6aemCEcBWcKSm6xpBRqZ02FGnYr4J
	hDbmGXUY8iAJSy9MIttEE+0mwJpU07Kb/KKzXrXq0vcFTc++rmQ/hJ0gPt3VbX+Fr6c5oTW4fx4
	eeolUIpCEI46MMiLKEQTaRjjdD9JLJ5T3jSs7vLXpmQ==
X-Gm-Gg: AfdE7cknA3NHYc/RyKoEwZcszoteXx0ratLFNEkpaaDHPtAf6BrWNzchg6QrPExyYmh
	q8kR8FdHUVAhFKmmUtzugQUbTwG5Csh9+qLLDgAk2EbFUzdfgYI58IjY8PfbN366QT2mYYWYQWe
	/BfK2BG1+zKcIzB/+2hKdeNhLwzV3PBm48A0BRofYl4lxQUEEKaNlFsd/b7Hr3oLyrOXav3Yhzu
	RFxsovm7TlE6qpR7vyoyz2zqe0FpNTMvxVQSOW/moQdx3EtteKoJcURrMw4kiHgnjrZSH7LLVni
	VqEV8Mq+ALuk0Lm8jxzlizeLrG0xlclTRwRWstnzucD6dA9SpaNH7Dr0Vsovr2GMNXTTQmclN44
	AvjTonrNy+NoTfg==
X-Received: by 2002:a05:6214:8012:b0:8e9:51b7:2d49 with SMTP id
 6a1803df08f44-902345906a0mr148749056d6.2.1783942095017; Mon, 13 Jul 2026
 04:28:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707125311.2398031-1-pavitrakumarm@vayavyalabs.com>
 <20260707125311.2398031-5-pavitrakumarm@vayavyalabs.com> <5ca48a5f-086d-4372-ab3c-1535dcdbe5fc@gmail.com>
In-Reply-To: <5ca48a5f-086d-4372-ab3c-1535dcdbe5fc@gmail.com>
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Date: Mon, 13 Jul 2026 16:58:03 +0530
X-Gm-Features: AUfX_mxxRYylWlJQx3AiA3TRbsGOMz5d4Ea_gZ0i5xT0xueRWcdr-xwk7DjwwJY
Message-ID: <CALxtO0=0y=FBpB7h0v6q+w=bovtpGuiqyoxoWGVyiuGxphf7zQ@mail.gmail.com>
Subject: Re: [PATCH v16 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
To: Julian Braha <julianbraha@gmail.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, herbert@gondor.apana.org.au, robh@kernel.org, 
	krzk@kernel.org, conor+dt@kernel.org, Ruud.Derwig@synopsys.com, 
	rbannerm@synopsys.com, manjunath.hadli@vayavyalabs.com, 
	adityak@vayavyalabs.com, navami.telsang@vayavyalabs.com, 
	bhoomikak@vayavyalabs.com, Nazim Khan <nazim.khan@vayavyalabs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julian,
  Ack. I missed that in V16, I have fixed it and will push the update
as part of V17.

Thanks and Warm regards,
PK

On Fri, Jul 10, 2026 at 5:57=E2=80=AFPM Julian Braha <julianbraha@gmail.com=
> wrote:
>
> Hi Pavitrakumar,
>
> On 7/7/26 13:53, Pavitrakumar Managutte wrote:
> > +config CRYPTO_DEV_SPACC_CONFIG_DEBUG
> > +     bool "Enable SPAcc debug logs"
> > +     default n
> > +     help
> > +          Say y to enable additional debug prints and diagnostics in t=
he
> > +       SPAcc driver. Disable this for production builds.
>
> This help text still has the indentation formatting issue that I pointed
> out on v15:
> https://lore.kernel.org/all/deb73385-a7a9-4ea9-8338-b7da999a5e9c@gmail.co=
m/
>
> - Julian Braha
