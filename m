Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7983BED69
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 14:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781187622; cv=pass; b=O593MtG6aajZ7ojdMMKg7ufl9CDDli9Y3qQ4UgSvX/KWp7JsryeFb+dnkXzOv7DeAW3yapB8n98Dya29g9VfmAhFryjypfUbgtf5P1nx4yW4Fj/kBQra50JKo2y8hjd3YdqS/PaOwqePl92H28xOVIKidEOsOFgThAdg5WW6NlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781187622; c=relaxed/simple;
	bh=ez2ospXstMfaz5xWAd9V4fEufsJqKgDo0LH3emCYfnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y0wlJop3+gb+Y1l14F2Gdk3gDLpZHvgi9/GVJMwurCnK9UmxHAe5qFWjLBpzVVRkk+ptZsHlq8Vwu2uuIAqgywDh+/rLNYvqeaakm/1qcd03UwbWsP6QtkqGKb77YLCD/SRH/M498N/zubkGX0BQeNAs+28TX67zEmqrvCIs3Ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kNpb+Cs5; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNpb+Cs5"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7efd49373c0so58075597b3.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 07:20:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781187620; cv=none;
        d=google.com; s=arc-20240605;
        b=lAICSf6Y2nvkTu3eM0jLj97Y8VPfGMYiM6SdC7pORx9PB1cf1EF5sPW6+4e7OxLXwW
         mAuYpgGyapyvTWJ97MMyvwKepOaVsnPonGuC0UY0IPj5Kf1ViHYtgemCa/ND+1fhys6m
         n//SEVL0yadty6jLA3EGgrEDLh3kLj7zVYu3v/FmUm9G/9rqyRJKqi+Bmxe+L/BQX/CH
         j8hnan/nUNAHuMdXRrdmb8pFXpy15PoKfxcyKRkf5N3Z60cnAJBWhutzMeZ0QjsTtkGM
         yTUmGnJRAMdvLKrRcJ4R4SQIB5N/FFudE/JmD76jJFk71uvJTR9mc0wcbTEQBZHDFvFq
         aI9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ez2ospXstMfaz5xWAd9V4fEufsJqKgDo0LH3emCYfnA=;
        fh=l37RyoyBEAbtR2Xbnn+WAG9HcrP55IqNGjfXN8BuRk8=;
        b=AVsxr3U/OVErrG0b7H6lUI1SoLdfYXEYZTJTB1xxtJyhO65L0D8GsHHh1WvFbDasIP
         NW4FtrNy0o8jBYFM1VlhBjifkvCSVJMt27qvYke7ZoC1vSttJlQoNRLqQTfCFH1cvToW
         mRaVCVpmmB+w0+iGzKlgTXbl8e7SXBkaGS4CmHT4CT2FoTjKuSbNaHtmQmFBckUgPqcq
         MJ1upZ4IEn+C1puvE+QJdqH18N0bzr9HxfcztPP0z6QPJB5Q36rusfEmfpyaR1wbsmFX
         1kp+viF5/WyVgzsxRlQs/+hWXmqeX3yI4dB2xcGimTMvgzXSGmjFhvPHF8cBIPzw4fB2
         mSxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781187620; x=1781792420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ez2ospXstMfaz5xWAd9V4fEufsJqKgDo0LH3emCYfnA=;
        b=kNpb+Cs5tKm094cVt0t8jS8RakndkpFAwyhM5iemGCcV6Is9XNdU31950Mu8Abmn6T
         FhAcUauP407w2XbTbOYeabZlFpwtpGjPtzICJIQQwnvaXMMsR3at6vXQ4Om77tYudxB/
         5Qi2PJ2oNEbz0vTNIWeVnDe+Hm6VO0b5Qzugc+xTckEcYIsMi+LHH4DZCxNSUdYu3XSt
         YJ8fafmXc5Gfc/WGz2hEj1/G+m8Rt9YJ/v/3HcY7S7qO40d6glZCC9sUERrlSPdpuZ+J
         wJMIZbTObjikG6+GMvAeHc7e5dnAmAX4cmOn41OJpFnjNhKcYrev0WjlkWZaNgOr2JWY
         5vNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781187620; x=1781792420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ez2ospXstMfaz5xWAd9V4fEufsJqKgDo0LH3emCYfnA=;
        b=I9/fP5hhsmZe6J6gaEK6GsK4wIxSkAFNfxb1P5bLNxNqRFCMM9fyr0a8AkDvvmCmmm
         OkPmnvHKBlGiwdAUQ1su1vfgKI0UzgThpHU2Fes8hKeCrwsZG5oXdzkKvOGRUvJmg0D2
         sZXLz+pev2v4LSwPR7PY6m9/oSuz24T7zlgoPNyiDtkwmQ+DIZV9ibBX9KEEahjOuupU
         0L0zvQIOX575bThtMVsvSkK+UfIsXB5KTKVcyo/+xzdZu16UPlEsKFvJjLZ5PDAPzIBx
         4PhWQ+1JqU3WfkhV9XrA990UedV4V9IN+M6dgR8GMopEZ70j0Vo3/arQCt7pu5PsJsdK
         IBSA==
X-Forwarded-Encrypted: i=1; AFNElJ+4fA4rQ4OMX1czwy9ByhBA+6iLCKFvP9mOPblGuQZDwukh59NNpneYgKn+WdvbVfN8G2jdE3tg5PME@vger.kernel.org
X-Gm-Message-State: AOJu0YzhDY+2IrGlXo58GYjq9yD84N454yTWM+s38Q3auIEk+W2wHUmX
	alsrWFiF5MDc9HvWMI4uMDVKoqbdM76tIitoC9ikDkgkU0bzd2EwdwrvIxaVPMIqrun/S7VXRVN
	C7fzmIuZNXMW84K6jBJtdMdClT+RfaR8=
X-Gm-Gg: Acq92OEl9OqW6O5IKepASVVgBwWN24dEC9Iv8xh/PkEIunAmG1wAUKsHpWBVRCVGJC9
	rNQXOymg1ltBNzVd/uTxLr7XxomL7+VA98vTEITRD55BPmjy0VZ3bIdmfACb32TPZ1Np/2fWi/E
	npHqAaR14+9MjSE0LK1mSBwZfoSYteVZV0FIPOX8fELTxYD6ooEvAxensC7CQ2WzRmP3BtlAZwU
	JSMp029Qb3ayZvFrIoxByyRCYFPZPmNbe/LFgDaNIyAqbBxUIjP6Fk9Zxz79zl1T/SOFCAsLX+o
	EchGVMGiV98GAMMeZKTIGJsv464ZhEKeIPHbVrSsK+2NSSMTUCs8
X-Received: by 2002:a05:690c:6f12:b0:79f:d961:47bf with SMTP id
 00721157ae682-7f65500800cmr32328977b3.8.1781187620254; Thu, 11 Jun 2026
 07:20:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609160326.45123-1-m32285159@gmail.com> <20260609160326.45123-3-m32285159@gmail.com>
 <20260610-pastoral-dark-ostrich-5ca3f6@quoll> <CAKqfh0Hi8EkShh3s4dUqAJRDExQLR0NVOvd4An+bY5hat4-Lhw@mail.gmail.com>
 <e00caff5-55e4-428f-bc57-3885699b221c@kernel.org> <aipatjyVcltbspRJ@ashevche-desk.local>
 <6c5a657b-f316-4982-8cb8-8c09f1b1669a@kernel.org> <aipfPwT4RJGdA4TT@ashevche-desk.local>
 <aipfxL3ttO1-7W1T@ashevche-desk.local> <CAKqfh0FQb6tSZrrTHGWcoQqPe-OwD-mW02GOOn9y+ysstRPVzA@mail.gmail.com>
 <CAObtm8zDk4s3+pmGSxRoVHq7ef1y=_cHdC8YRH6ycRNbjzaNkg@mail.gmail.com>
In-Reply-To: <CAObtm8zDk4s3+pmGSxRoVHq7ef1y=_cHdC8YRH6ycRNbjzaNkg@mail.gmail.com>
From: Maxwell Doose <m32285159@gmail.com>
Date: Thu, 11 Jun 2026 09:20:53 -0500
X-Gm-Features: AVVi8CdA5UiV9a-9xqLq6QTEun-nOvIwOUegZFB4I_Q6rVn0HPvtIA77vYZzJoQ
Message-ID: <CAKqfh0E702ANWwXYzcCHQ3V9G2+m9RMRPQA0k+q2jLaQTZtOSQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: Add myself as maintainer for PMS7003
To: =?UTF-8?Q?Tomasz_Duszy=C5=84ski?= <tduszyns@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 8:41=E2=80=AFAM Tomasz Duszy=C5=84ski <tduszyns@gma=
il.com> wrote:
>
> Hi,
>
> I've been trying to catch up on the recent discussion. A few things I
> want to address:
>
> 1. My email is active and I do read patches (when CCd), but by the
> time I have a proper slot to sit down and review something, it's
> usually already gone through several rounds.
> Chiming in at that point just for the sake of it doesn't add much value i=
mo.
>
> 2. I get the impression you're thinking that since I'm not actively
> maintaining these drivers, you can step in and take ownership. I'm
> broadly fine with that, but I'd want to see more work and patches
> coming from you first. If that happens, we can revisit the ownership
> question. That said, do you actually have these sensors on hand to
> test more invasive changes? If you've already answered that just skip
> it as I'll probably stumble upon it whilst going through overdue
> mails.
>

I don't have sps30 or pms7003 but I should be able to get my hands on
them pretty easily. I did get an scd30 though to do more extensive
testing with that.

> 3. I've managed to carve out some extra time lately, so I'm happy to
> be more involved with reviews going forward if that's useful.
>
> In the meantime I'll go through the remaining emails to get better contex=
t.
>

Ok then, sorry about prematurely trying this. I'll see about doing
some more patches for sps30 though (I've taken some interest into it).

--=20
best regards,
max
