Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A82426059D
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 18:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783536851; cv=pass; b=aqFHkBu1gFXmqgxVT/peCG8IkKf0QoQN3D8qiKaBg4q7qI6qU82Iqy7LBhF676y6XBgxaaVb2Fprh/s8blyaCNDIfUhHkgSG2lSlFOtCrqB0VziQ88RjGe2AdS0XrIZozbBYbEiTu0C8CTWi3IKs4pO5tgRJedwk917qmqvdQcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783536851; c=relaxed/simple;
	bh=+axfWxplgPh94YUqyh21eKun8ZLvTScz6dES35XGF/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hIWFc27BfBJMHtTy83py9SUINlcHe19QJEWQDJq7BGSMOnvUE4f+EEZuGwLch8UmFJQpTWKMBmz7Vy8AVlvRVBdbasi2KIOa8YLzxYcU2N1EB67hZQy+aASzjjfL6xlo4DwmWTBhfRFvV5wP8UNdGlx7MjqjcxihLp3FqaxrIXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btMb+J9z; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btMb+J9z"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so1733271a12.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 11:54:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783536848; cv=none;
        d=google.com; s=arc-20260327;
        b=EhlRyHvKMYTX/p5TRD1hdBGfTHmRsiUeEhF3qeKYkWGyRuIqYvosY9uJf/ADQNrQA5
         axtETtWnnFYsl3SHgGFptQwG3H/UGCjXA6UVNFX9ldp1W7pR5FLaQFSpWKqAh36lNVvt
         9XsTuwBmRjfO9K2dzCGJfF26SEbgMfZeWgTu+iAsC07/ZnsYOcQQPw4WxA8jws5m4gac
         aQoaOuglnR3SzCGYrluUBQu8Lv3JhoDnFXgXh4MXuxh6zbtka8GlAozBCwK5QEdjfZvJ
         yF8QwJmap56tne9NtfDGjVKeuSefILRvQWNXV+DYEEKcWn9nem0k2RhmDBqCJy+0EvFc
         BvBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FDJtP5ijTVky7wb5PRY5jGSAhA7YTwFtCy1ny5J9ZxQ=;
        fh=ImPzllyIT6eEObg+IHVkYhRGAUtLgN7ZBjjkUM4COK4=;
        b=k1A1e00PNFfAhx5AaDS/p0Yc/9NP+S6roPsNucOY+z9WQl+kfW0IxTAoQVsM87G9oj
         MLwYKt03dfsfN02oZTnvqICy5pmUFIF5QpG8Di2IRZmA5mFfCOM9CcAw/mzFs87i2N+S
         fplYe/6OzO2Fa9nplWRDDUcMtxPLCnGuXrXmAICwMpuKoQiyceeg/87mXobLGtTedfyZ
         BmNBsnPczSKZOF5c9yUYs2usPEEioNIXehTmWU5H3r+lXd4xLOUDaiICritcGgpnn64c
         sJkhUXL8EusYP5KlCtI/ToB8/7q+c9UJdP2IKKIxiUodJ/9psX4C/74cPv6K+mQ+vi67
         kS5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783536848; x=1784141648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FDJtP5ijTVky7wb5PRY5jGSAhA7YTwFtCy1ny5J9ZxQ=;
        b=btMb+J9zDT58lf+UDOKiioNUWa3h5IBCrA4LsYITa9mNOfBDZpkflmydFEV/NAYf7c
         mOq2ZBoydwX1Qd6jXkZlvmA78fZQ7A5XeUmaoZP/2W3qok/nQCZRo4WVcdetQWC/355T
         NEbxKrpM076PAKK3cIi4rS2f4RyoQ7el2+3e9g7vSYgzLUlQZP4wjICYZLcj11DwnbvL
         TdQMVABrJ/0N7RnueWdK4hUWtBHIHbY4+xpIxywEhrOV3+nza+LUuHdTrPkRosSXQQvY
         b+vM08UsvPvXzyCufMsyOEdCcADtKoN5YyrGUigurLROf71NX2p07NWKGSEbvFwduVND
         Cj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783536848; x=1784141648;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FDJtP5ijTVky7wb5PRY5jGSAhA7YTwFtCy1ny5J9ZxQ=;
        b=c5NvO0mOvxWPqFjZpCCLevSBsGjAbJ8fidlbIR7mimiuq7+aqIzpsdA7JKYAdCwWGx
         19dR8f8cRKK17MvoL6H4pP0WTn2SUWXIwrgIRBlpRB55/Dam/DcAN0Z7fxPOoFBom/rF
         4IpsfrSMBdA5lHpas9dU5EsoYzn/SI9fQRJBHGzZTEDF8+9NIipxXXh7aaNL8x5Y9Aw4
         X+ix42stArBmpCwlXz9VH1IklcTWxnSYNn7cfI/vW0BV2eCcMabHvV+ICD5r+EgpDUbJ
         EKYQpf31g4mrVAfvafOdqkkZT4uGTRSPD89JfMso5oFoTw3nGkNtFMK6577n9NZ2YS23
         iXJw==
X-Forwarded-Encrypted: i=1; AHgh+RptCNKU9wEjwfCQgwwnZE/zCdjk3aCEMvPSyiza/I03sxTgDcR91Qd6GpONklh788z66n02PgH9csCV@vger.kernel.org
X-Gm-Message-State: AOJu0YwdydmDVvQJwB9cU+x/+DbA9fRgVx/WC8FzNWFT3qIq3Tmwsf25
	8byOkAR19AMvmwvPyZmbWay1QUYedSkpnRgUbLUzJp1zZD5mGkT0iOgc+LNoUZWQiff1+sD/nao
	T7nUnnMfowumZtYkiP9n+Q/uy75yYFQ==
X-Gm-Gg: AfdE7cnLWPiDtVzNIlib0nPCQjS6RWGLFcTDYLLmDycDK3CMT9dUmwQ9atqpejdG0TB
	fMOFu/juoWjIpPg8iuoMfBFMjKQmVCRWwiOlPGepE88Gg4IBmGYXK1QnY3gdNquBuy7tcNc4DjO
	oxnmQCishxypebSck8vJ5vwQV43PmFC9aWUQgm2JmWAaVScCXKA/Px0C0yFwLFVkZqrlRSz9U16
	stCKpQoPDjI5agEC4zj32CyIvh0TH7TO9+I8xUTTfcEiuy+tXEkPxBua//qqvv7JPfBtsvVq9zt
	AxO8QImJ4qJH6m+tiqDIJvP4nrOx
X-Received: by 2002:a05:6402:40c2:b0:698:b23a:e54a with SMTP id
 4fb4d7f45d1cf-69ab44aacecmr1851537a12.31.1783536848147; Wed, 08 Jul 2026
 11:54:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604-surface-sp9-5g-for-next-v3-0-6aa6f6612c10@gmail.com> <178352261604.2235436.45961494988805206.b4-ty@kernel.org>
In-Reply-To: <178352261604.2235436.45961494988805206.b4-ty@kernel.org>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Wed, 8 Jul 2026 20:53:32 +0200
X-Gm-Features: AVVi8CfYaLh3xx3YKFwVilPiVVoYqK75HB7zDa3CGd96Hp2aBO-6NcYmoQ8G9SQ
Message-ID: <CA+kEDGFAPoz4mEQX9ga=T8cBVehGHwWpJmouf3fA=8nkUeZ=OA@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] Microsoft Surface Pro 9 5G update
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>, Bartosz Golaszewski <brgl@kernel.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 8 juil. 2026 =C3=A0 16:57, Bjorn Andersson <andersson@kernel.org> a=
 =C3=A9crit :
>
>
> On Thu, 04 Jun 2026 18:18:36 +0200, J=C3=A9r=C3=B4me de Bretagne wrote:
> > This series updates the support for the Microsoft Surface 9 5G
> > (Arcata), bringing it more up-to-date and aligned with the other
> > sc8280xp models such as the Lenovo ThinkPad X13s.
> >
> > As highlights, it finally enables the built-in screen, it fixes
> > Display Port alt mode on the top left-side USB-C port, it enables
> > the volume up/down keys and the lid switch.
> >
> > [...]
>
> Applied, thanks!

Thanks Bjorn and all for the feedback and reviews!

J=C3=A9r=C3=B4me

> [01/10] arm64: dts: qcom: sc8280xp-arcata: Enable backlight
>         commit: e53655dac60665ffc736914f336493c5f45977a0
> [02/10] arm64: dts: qcom: sc8280xp-arcata: Enable the eDP display
>         commit: 587ea6a79584b5323e5eb3e2435c858177cca49c
> [03/10] arm64: dts: qcom: sc8280xp-arcata: add USB-C orientation GPIOs
>         commit: 784b0cdc237d98f1ae7c6adec0165676c98a2614
> [04/10] arm64: dts: qcom: sc8280xp-arcata: Fix top USB-C DP alt mode
>         commit: 16065c4ec1e7ca595f4fa363dc2251c6bdf1f6b3
> [05/10] arm64: dts: qcom: sc8280xp-arcata: Enable 4-lane DP support
>         commit: f4360ff09b75b31a7d9d8088f8c3cae361709cbb
> [06/10] arm64: dts: qcom: sc8280xp-arcata: Add volume up/down GPIO keys
>         commit: 0e5e1b74ccc902a7dc9e3eb5cbe299362bf1fa13
> [07/10] arm64: dts: qcom: sc8280xp-arcata: Add lid switch
>         commit: d7879682e7fc86a03cb26632c4316211be8b30d4
> [08/10] arm64: dts: qcom: sc8280xp-arcata: model the PMU of the on-board =
wcn6855
>         commit: e1cf7b2332ddd90d65f74ab48f5e237ac7304b3d
> [09/10] arm64: dts: qcom: sc8280xp-arcata: Switch to uefi rtc offset
>         commit: 1ba745a53172ae43a6b92ff288d449d888feb853
> [10/10] arm64: dts: qcom: sc8280xp-arcata: Drop duplicate DMIC supplies
>         commit: 3d7646cea76fc08126534b428b299c326b3c66ca
>
> Best regards,
> --
> Bjorn Andersson <andersson@kernel.org>
