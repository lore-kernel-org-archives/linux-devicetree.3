Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864AC39D6F2
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 04:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785387038; cv=pass; b=CSpoWuxG16JMU6N6GDf9mi8d2K2AN6LB10rb1maBMnp3jhQPBCibo1A091B+ZPF8dgzNv4OvUWnN2XzdMELMevOC5YmlvzGbTl2C2TPbmBMe6R0my7DGh8gwIGlJiFRfj8kg69sGvw1WUKU0+lk1gty4TOI2hscT3kGBtY/6a8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785387038; c=relaxed/simple;
	bh=x4/nkR85gHt/p05IHxpT90cgtYPAQUFwTKs6hOHyuUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AVpmJhMzKJKQsPRP//zXVFYKXYSxstE0d/xfCpVyqfbrD8G4AQgget1oywdiesnKQgqfvKswWTJ4SCXAO4uUcvoS5rA7PJ5sm3bgq6c42OPEjuKPOwpffkUuN0IESsDExjNJRFWAynR7EFMwQ+/zuienZsGuQNuNqUlTeHbUMGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+fa664+; arc=pass smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+fa664+"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6acbf97e9a1so89682eaf.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 21:50:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785387036; cv=none;
        d=google.com; s=arc-20260327;
        b=P2fTkespbQUtFR5TseSr4ls4CXIuSWI4ht+LcqtdcWmp5N1PPVNDgstS+GsACdvqBS
         x9TRnroXNz1B2Yf0dTxtys302A8oFlIKredDgnLb/0Y9AL/GwsXilE6Tp2ET/IHM/HyR
         U8wKKZEqTvqWZvNDoahb6THO5YykmRz7GFRAHWd+KT1jEx0SfMArS8oRp4ioI3jcmpFK
         XyRC3ex/YSvfo6qbaiqvVC1T0XGVRcEZ+QxUqUMrFjiG7GKcCcAVBXmnSs64nnkpV101
         pj9ZSN1TMQEavZf+dr9ALTpCZZX4RKCxISFBiSTaj8prFMPpQCZ4LNfNedVd2quSXcYc
         IdeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x4/nkR85gHt/p05IHxpT90cgtYPAQUFwTKs6hOHyuUo=;
        fh=GAdAYCPutPqlzwMz6nF77TW7mLnv/7ufSvivMqwuLqs=;
        b=hpSDB4FCXNc2jmNSKmAKa9Ig3iEla6YO8yH9mLRWMHvfEpL6S4H80v5+HXdygXIZex
         IVK4wCYGE8xUbrs0U06/jKBBGVhy447KP6rvmmubgZLDYjYW8pn863EIrun2zzMP39WG
         +I/CHO8xc/5NrHQC8GqU1dCnGdFyAFFHwykSsZT8K0PDDRkwAzRWp9KjapuLFljqLzqd
         icYSe4ev3nMl+MnlIlXvRdNN0CqTbqzE7Gob0hnQGeHK6cl0phaDG7ZshVzBg0XqX1VI
         62Ms6OKEjTmcSX9KOAsKIMgWzyr0s6www0NCYka3uqNLZwP9cDU/pQFEDsjgJEpX3jVU
         WGQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785387036; x=1785991836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x4/nkR85gHt/p05IHxpT90cgtYPAQUFwTKs6hOHyuUo=;
        b=M+fa664+M6wfAokcE06JIfkQ9zVHlL3dZWf1tdyDQKjyveiYur8svwsj6NXzCMsVCD
         2uqpOyvF5UTk7vWlHJRlKM1YVMlWoUFuuIkImTaObvOk1epoT/UMG8/VhIlMM2vqUzsM
         znKovwXGZ0rmYykkGjvtDADwiR2VL7StTMaHXdx6rHHtFvYNU5QG9lmlzqISGteEmp9V
         tDrxCpy2Xmoga/FIfeuqYuRbomNPvyHfygKmqe5FrMJdo9df7vkBqtvFiMUACV4prt6m
         qE1FilJvGCnA6dVZMWImH0DxLC2SCPDooLEZyK0NBoRwaNyQexFKP1YUwTrDwnOXmKN8
         7Cgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785387036; x=1785991836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x4/nkR85gHt/p05IHxpT90cgtYPAQUFwTKs6hOHyuUo=;
        b=f0cYnr0TZ27gw7qqdC1iuZms3JPH0MKadTfd0Q8GCsLqnRZKarA2Q6hcY5VdxV/wXe
         zudb6RqsIsyUVD8j9cBE2aAhejnZGp5oNuZ7Jwd+hSMFVF0yhI/8A85aX7YadcLU4gas
         uW5pohLsZIJ4L1WDsPxvLiCA8PNzpVwaPeA29ghESlqv3Ql6ARyA1cXE3Ft3fwie7Bx9
         BiJ7EcMmCJN964KzY2DB5KXgDtJw0awl8LqPmacmkpn3h76ZPNtOv8ZE0RVV2BCqe7Hy
         r/qpzkoRiL+gR+hGwrNDBi0gzXXf5I/a6o34q1wLcQvRaVAPsKrXR9eavnw8reZikMwP
         gaBQ==
X-Forwarded-Encrypted: i=1; AHgh+RpO8i1pGJStXYC/mvW/b5lDLE7QD+Y7/enGMZFsa7si/TyMMAVlfBOz/6x0c80+hb9hJMxI0i/IpmaJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwxLuCDh+r3QXLdCNOdWlVKYxROKAqpj8V4I9FnijrQ2fGDQKdM
	jEgzS/WpuffAPQJQQM4cR6EkKZbiEc7PUjYFeC4fq4a1c/jYQSMKgPVfgmhISBjbprR2MZtdNs5
	MglaXdW2SGPSSOfQm5e77G4d/0ndj4flpQecGddI=
X-Gm-Gg: AR+sD122Ygq/oab9PKo5asNr7sVjdhXpjvPQ2TuK+WNLx4Te3Jz1FTkLkQ+s8OkT3tm
	jWV0axCiXMG+audXzUix7Q5iwI3KHuUW+2UgP+4LQRfwIb0PxCJTv5R/86EdcjAnSH3543w8hVH
	ckE72HuiOEYaURNlE7NwJZDdx0pJb3PcBF1qo8AVUCRfNo5KpXjaAVh3dmHJ4tj3TlEaYMTXSHa
	Xzc8MedosQzxNk9cOwPhWF6S116ndfKFiQBs/kLH8azl+5uTWKdlHPH+1xlIEwv8uBHdVjPROPL
	Qs13LinI+/HrssgrJdOAc4QSd4B2WTyaQHJUgR90pv/Ze7Uxg31CuKjrzNvlVVN+8kqFVcwXdjd
	DrI3P0Aq1oADUUykV8Wn5ZtgHCbF5b5ugK+4QUPkjSsEj1iJ8fO1V4YfVXewdrv0S7YhLQr8nNb
	k76Ta01Wl3HhyanYV/Qoy8u6R9zl++7PCKt2XqImQ4BgbVGKL+rUaWvA==
X-Received: by 2002:a05:6820:1a0f:b0:6ac:a88f:bb7e with SMTP id
 006d021491bc7-6acbbd319dcmr707974eaf.10.1785387036300; Wed, 29 Jul 2026
 21:50:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729064538.19564-1-kaipeng94@gmail.com> <20260729064538.19564-3-kaipeng94@gmail.com>
 <7eae2da9-1d4d-4ed2-85ba-4ec5d389b0df@packett.cool>
In-Reply-To: <7eae2da9-1d4d-4ed2-85ba-4ec5d389b0df@packett.cool>
From: Jactry Zeng <jactry92@gmail.com>
Date: Thu, 30 Jul 2026 12:50:19 +0800
X-Gm-Features: AUfX_myTvI8zL7ckXgbzmHbIIIfo9z4_b0Srq0DHDvkyZHz0yFFZUAHfP5Tj3Gs
Message-ID: <CAManwEwiQXQJYP897hsq7R0-qj-2ocz+J7rX4ri82cF6gM6C7A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add support for Acer Swift Go
 Pro AI (SFA14-11)
To: Val Packett <val@packett.cool>
Cc: Kaipeng Zeng <kaipeng94@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, konradybcio@kernel.org, andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 9:46=E2=80=AFAM Val Packett <val@packett.cool> wrot=
e:
>
> On 7/29/26 3:45 AM, Kaipeng Zeng wrote:
> > Introduce device tree for the Acer Swift Go Pro AI (SFA14-11).
>
> Are you sure it's called that?
>
> I think GoPro (the action camera company) would not have been very happy
> with that branding :D
>
> https://duckduckgo.com/?q=3DAcer+Swift+Go+Pro+AI+(SFA14-11)
>
> It's only been called that (with the "Pro") on the ubuntu forum and
> such, all the other pages refer to it as "Acer Swift Go 14 AI", no "Pro".
>

Regardless of what camera companies think, this is it.
The model is sold exclusively in China under the name "Acer =E9=9D=9E=E5=87=
=A1 Go Pro AI".
Since other Swift models were marketed as "=E9=9D=9E=E5=87=A1" in the Chine=
se market, I think
it is appropriate to translate "=E9=9D=9E=E5=87=A1" as "Swift" in this cont=
ext.
Additionally, please distinguish between the model names "SFA14-11" and
"SF14-11". I think this was well discussed in the earlier versions of
this series.
