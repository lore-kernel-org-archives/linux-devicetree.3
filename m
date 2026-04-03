Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4014130B51D
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 08:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205337; cv=pass; b=kBQPXJeDX94cAfOxLJ/EJxhCeljiioVSM9UG3uul9g4brJlD9j5VbcZ3whSN0GoxKPwwek8zcQbhWYE6UQeGupHEe2eiER88nNsi7cbOiGNfvCvpW740fZE2ZeMJ7bUI/HJO80wdCLjjxvOm0KiniF2tBNofIC20ETTAMi/62bs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205337; c=relaxed/simple;
	bh=5cwHC3eZOxiU2/NZzUhXroPRJVVWV1jp1fwyeMJtdWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GyegDiC6ft/jfF0Bnp7vziyPQUkij5eL0/kGIVU+hVSKxcWZzJROIGGMUPIYTqjkK0PlNDGiBex4WLiUeGCemHcaPYepaktSZESMQmeZf8MEZkaFjDDb2gBxTTDCyOEMQRDVRmyJjdsfW3w0+R0MHSpu6xDT6gC6ACdggBfwQjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCW9auFt; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCW9auFt"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9bfcbaa81eso238004966b.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 01:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775205334; cv=none;
        d=google.com; s=arc-20240605;
        b=PO+6jpkPtIm+JFDdfBQTMA9/k+jI0lofFXuztdbI8S51x/sy6t1tQp6PKvwPUejCGl
         fn34aBtRCKq8t1TBK/y69HknGI5Q7cDbajF0V8uPVnEpj1dE/BuqHtvOqY6yDncaYfbF
         hw/K4/gEC++G+xbG0EVLvWegJwlOT/q50/R3BMdj9VKKHnbyMbdlPQp+II77vossI/h2
         6TlgTGRgwQiR0/7NHYcgmoouP0CDVMhDVLpTaD+FCBZOZDhxjT8ENn60ddQvgLJHFY3Y
         6geg9mmEKeGgiWybxsJ+Kh4ZtTtS/ZtjoOTHMCkipp1dzOkcyTbKb3oGc1o9wT1qkGHC
         SPgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5cwHC3eZOxiU2/NZzUhXroPRJVVWV1jp1fwyeMJtdWw=;
        fh=9Q2cz+D/yb6HIHn0PpDJ1nMIYh3d/ZKW9KPuewnnnT4=;
        b=PKN6aF27761LGzFvF3CbwoH/bt+yfH7uxyo0a8wstz8cMOnV9cZn1KFjRsEDVTb3wQ
         GbNkKKhmP+Gw8rxh9wTCpUjmEv70tzHfvheKAzGgsyaho/eIpgqSFyiF9kEh4htL5rk+
         CAVZvhqxftMRoikRkWpESJO9FmMdxvbBPogNt5ksl7Wr2atQ/ySoEdeL1ttwIuLKrW14
         soU0Z6YHcWoCGD27qAnK0HG887eoGLgGoeN4ovZv28O8vb3thaZMg0juKRcVKsXQktIH
         ywnF8x5Dx/PzM/WoFGdAti6nObyjRdLksUZqBqEyxeyBPp0aWcHIBG6rRcdv5Ocl0gDr
         A4Pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775205334; x=1775810134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cwHC3eZOxiU2/NZzUhXroPRJVVWV1jp1fwyeMJtdWw=;
        b=fCW9auFtEGhMYP4SDKI2eZj1Wg2FZ+zyT9cIAwlPDFHMuMJCUFLFK29tDI4yMPRYwU
         scIVZzOOhjxGNad8YQVe1R8XAdT00S1i9+3PAadSQaW8OdUQq2qQ5xA4BBB8SsSZlMZV
         oED24ByEI6nhPyLf3aX5hTrFIxKRBjN47A432hSSEZzGydXEHcLISfMxigcTsz31xeGQ
         nMd/XARI2zZiBwT1RVAkpKy3QeBmK6TLvo5N8qO5rRBIBNpFt7/VOqe6/EgpNGG5FyNB
         XFIB9nlnIs9PopI5+McX4Cclw0TnSAwAB02xEispzp+6q+wTWaumP8mlAezb91TSUzNZ
         2m4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775205334; x=1775810134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5cwHC3eZOxiU2/NZzUhXroPRJVVWV1jp1fwyeMJtdWw=;
        b=F6K7BlRPoTJ42qyh7FtCQJ+nlqmgiY2d5D5hDKe/dQn3fo87iG7tiL5mdLYGORudGb
         wMq91FGMBYoddwXCiJbP4KZJYChT7H/HiGn+KhfE3wcqekZyBGmEp+FutWAFuekOqzSQ
         c3+mmwNhoymBSTor4L1NQIK7rz5pfSQeOo79leO4xTo3/98xfX+KI7xvbchEDKBlvR5Z
         IHmweL6U3BB4vI+1jUWFuN4/EqIg4WsPzxRcJtrZLH+b7nMbuAxid4vXTRZfPChgpe80
         Ws04wVsLufNJof1yaYSI246V19Qh3xnUh7nDxOo/PdtKZk4oZW/1/ma2R1vWjYm547Lq
         rrJg==
X-Forwarded-Encrypted: i=1; AJvYcCXUGHcQUYzl9Oau70yFfNNMyr4rj44TaOevOWqGQvGzjQRLvDcXav7X9EG4pXqQJDloKUhjEq7TSTLT@vger.kernel.org
X-Gm-Message-State: AOJu0YwdhudSk97l/fpkyFpJqcYH4bqhyGJcZ6h/iAfhHNk5Jo3W/3Yb
	3WfdnLZLhoNOqadboZKXrK3KBy7Yp+n0wj06GHs7sJVdWxRHu/GJQpRAH9svLw8yD/8E728okcM
	uTacipCHRGjMtKB4lbGWHMn9EtV3fil0=
X-Gm-Gg: ATEYQzwloni1GQ8ywCBpWbDkGn7t/+kzLeEBdrCr1pHjX+fzwVgbOROr0ffiPEpWk5j
	d29klTsB2SoYUKqLfNuUc+5QQkjMTzUac9/nmHA1s1awebNBvz0Xqb44iOyoI3NnUuDH91nSK0C
	UfQc2j9EMTmYKAr1rXgW6xT8hkr/r/m2k/abWa7RE15mSgG4g2Npg+Lm9I9tyovMNkaBFYr3faN
	4NrdBQIQwyKqJidS15m8KePPjs3h/jqmR/nE/zNGgi/M8ZM1LuKXyY0OOiZPFsXXZZkimwXoEGh
	+chBjrRw
X-Received: by 2002:a17:906:478e:b0:b9c:69df:4d8e with SMTP id
 a640c23a62f3a-b9c69df5f1amr98269666b.25.1775205334163; Fri, 03 Apr 2026
 01:35:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318071808.817074-1-pavitrakumarm@vayavyalabs.com>
 <CAAUX2SVmu+_Avs=6ipdJY9iciig4w6DzGNGaH_ZQf+LNqR=KVA@mail.gmail.com> <SA3PR12MB7997CAA00BEFD7402AC63DD7CF5EA@SA3PR12MB7997.namprd12.prod.outlook.com>
In-Reply-To: <SA3PR12MB7997CAA00BEFD7402AC63DD7CF5EA@SA3PR12MB7997.namprd12.prod.outlook.com>
From: Tony He <huangya90@gmail.com>
Date: Fri, 3 Apr 2026 16:35:22 +0800
X-Gm-Features: AQROBzA1m_wQDaVSCgT3cerSrI2bUJahBbBIizfsTd8TaF04s7vtqN975bGKl4I
Message-ID: <CAAUX2SX3wjsj8JLkej4oKR=77BQK2AEmc2tAqe8eCJqO=gaizg@mail.gmail.com>
Subject: Re: [PATCH v11 0/4] crypto: spacc - Add SPAcc Crypto Driver
To: Ruud Derwig <Ruud.Derwig@synopsys.com>
Cc: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>, 
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>, "robh@kernel.org" <robh@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"manjunath.hadli@vayavyalabs.com" <manjunath.hadli@vayavyalabs.com>, 
	"adityak@vayavyalabs.com" <adityak@vayavyalabs.com>, 
	"navami.telsang@vayavyalabs.com" <navami.telsang@vayavyalabs.com>, 
	"bhoomikak@vayavyalabs.com" <bhoomikak@vayavyalabs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ruud,

Thanks for your quick reply.

I would like to confirm my understanding regarding the use of
SPAcc as a pure crypto engine in IPsec scenarios.

My concern is that the main bottleneck may not be the crypto
throughput itself, but the per-packet overhead, such as
descriptor setup, submission, and DMA cost. Since IPsec traffic
typically operates at MTU-sized packets (~1500 bytes), this
per-packet cost may significantly reduce the overall benefit of
offloading.

In other words, for MTU-sized traffic, the performance gain from
a pure crypto engine might be limited, or in some cases even
offset by the overhead of per-packet scheduling and DMA.

Could you please confirm whether this understanding is correct?

Also, do you happen to have any performance data for network
workloads (e.g., IPsec throughput), comparing:

1)with SPAcc enabled

2)without SPAcc (software crypto)

It would be very helpful to understand the actual benefit in
real-world scenarios.

Thanks.

Tony

On Fri, Apr 3, 2026 at 3:59=E2=80=AFPM Ruud Derwig <Ruud.Derwig@synopsys.co=
m> wrote:
>
> Hi Tony,
>
> > Is SPAcc capable of handling full ESP packet processing (i.e.,
> > beyond basic encryption/decryption and authentication)?
>
> No, SPAcc only implements the crypto algorithms.
> (The name/documentation only shows that it was designed to
> support the crypto algorithms of various communication protocols.)
>
> Regards,
>
> Ruud.
>
