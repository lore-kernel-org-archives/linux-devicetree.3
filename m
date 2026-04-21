Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EC3376BD7
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 18:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776797236; cv=pass; b=XTixmCAviT7aHK8T8fbBRo0FKGZNJVSCVnBtz0xYpH95UvEeiEBp7xD2UlSvOGqW9KV1CjGehm5R2UnaX+FNT1QbOavuRLLZ/PQw5gYPhNzekqdT1dMfq906ANHT1pl9eWrkLSqA0XWtqWjRwhVM4DLXgY30R1vBNahf2FTf/LU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776797236; c=relaxed/simple;
	bh=nxMVd9OHSpuGcSYtsfr53tYbcrChA8wOvkQbNhNm+r4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dGFzyATJtLoCMfS/sCrQZNukbBC+xbKYHl+e7egTzpDjD4a01PE2aVjfwyA0bYx4umSg1A1gpwED3BWMZUrzvVq3WX3nc6/ovuFXrgDK0pIeiAJeoSEr2JnKr1gho+WvJpTji9LRV1av/OLed2CODyqBGTULolam9CrqKnxkiXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lY2hPFkR; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lY2hPFkR"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12c8ed67dccso181323c88.3
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 11:47:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776797233; cv=none;
        d=google.com; s=arc-20240605;
        b=Madm0s9wQTzS8Tl0HpBXWsJOt5FzlSQSOIk3lEJPkpbAa372WvhPXamR4xzEH4AleX
         gco9A8Uhg9e92VcFmlXnQ+OqQtLHg0ZLX8hSI5fBFDDTZWYEyheUA2MNtjbiWZLV/CtC
         fL1ZEGKgCCYmLRlgW3KLL98TdfIkoCGphh2hGxsim9CHtrqyPVxdZz/bekqd5Vir/Opx
         R0kkJ/Y/R6NYnIK05H8pjzFON4k6hyiMlgnAHO2gvpXdr60xSzCoeDtLI/lhwcdMU9XH
         KXFg9mJJTjFqRY+FZoPDaL7YcsbJ1i89/8cplVQ2jpBPcqnB1B7wqARmi0agW2Cb4qDO
         4MsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nxMVd9OHSpuGcSYtsfr53tYbcrChA8wOvkQbNhNm+r4=;
        fh=bW2DxGAYWSgV53MtvdtARQay+YfLEZkWNkjd1pxBkis=;
        b=TeJdA+gVVT5jDwC4znwdkZqHCk2kXvptAKclqtVa7FjziGN2Ubh8j9f7Xq3CjW8Q2H
         irpmNs+zE0ZFj+Q9MOoRd7gcNwINbnOe3BaUaHuJKV2i7l0WLTU/aJhkh08hlfA6i8jt
         BbjpmvoknvPr4KgiwB3+92XNubtryj3SOLxp3afHISKihH/AkCqHYp7j+XytBcNcOT9M
         EwUpuHfoBU4KKTiZFN0FOO4zHhZ9BPzAcM6K/xXYDgxvM9zcsX0zt8hqfIKPvqbfx7VL
         gtEfsxtiKePpTZFZLiknUwHmMz4LxPqypakdOmFFRfxCik+b2liZKgElTjnqGw63n4Ky
         Effw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776797233; x=1777402033; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxMVd9OHSpuGcSYtsfr53tYbcrChA8wOvkQbNhNm+r4=;
        b=lY2hPFkRzSq0i1RtibAyiaYlSfJT9MCga6ODlOILOzE3hy3pzy1KE1XhdjDDOhFtCy
         NQpH5CwR6RJu9e67ONSkgrVu8NTubVsEdi25y5VmxyJkAmDCwh+lWkJwaQmPHIwbmroT
         PS4IrEXF7GZoTZWqGbunpMBr6IcFcqAsNsGGbAXuxhPQOUUpLTcSyyxgyzfvtWBAVjiB
         kAzh4b7q+msAEnoXUPhvFES/5vrMq69RPJ6eeZX63CsGe/idjCcrOltXmlWosmnUBj7c
         ppGhVvypCTYjmoWOdwo0EXMZ0PCgmWSB/+ucyZc9i957cNGUmYmalruc9hxNvLd/nHsI
         kUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776797233; x=1777402033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nxMVd9OHSpuGcSYtsfr53tYbcrChA8wOvkQbNhNm+r4=;
        b=gqQDdeOXolge8Fc8rI05nBK3ODAz7su0GTWsSASt0he/zL57Xb20vY/FZUNQ1E5uO1
         hZj70w+fJgk9+3GQjKONfsZTSYKFlqz9DolxqjRRSRmjTWsTDFZ1UVFSbkCjcdrm+j5d
         MwkkHV7mF1l8KmncWtmXKND24GloZOZKYb+kiGdCPD6F/Qy0vtOqa+0w9tTIXPOy9VLl
         3LxB69G9QYKpes7UIQVP6lZaqOzFXZG/s8GXIP/qUuye4F/QRplAt/gBpW0lzv74h7yD
         ydx09GjII97Gwi0n5bhiab62PHkUcsfqhPp07C+OmXZeej133pcZoV9prMVz4Y/Ro9ZQ
         mQCA==
X-Forwarded-Encrypted: i=1; AFNElJ8m1Kodsp60UdNF8h1MkINlCUJ5qx9GWv6y9WFPWaVgAS53taFfRDHwUQXbMMZGl9spLlS2jM/xYK6N@vger.kernel.org
X-Gm-Message-State: AOJu0YzoXYcLxYXu+DEbMtJxvEWNMo+y0AtCg1rSpx9W74gWwOfj371N
	MA6pQPBIagoWYCahKg2gMhU9ZsX665O0XChUEAWtFUtDHr1o/3i8R+LClCsPhjHr3AMPb/qU+p5
	6N+HklMZPEEJ3CmfuMQc4O0zAHFRw/3E=
X-Gm-Gg: AeBDiesn1U1wFCndZz6LtfZZ80pdmWw8FTwvhXjVcVHkywNmtEDLt9ixGTPbZrFDrnD
	uqjo8iCmiSD49vA29JpQt5YO9bAc+BeOD0yL9Bcy7UP63Zwadm2lP5trEFpBpH9CvvRqs2xnqTh
	j1kh7AfEOsplLaO1RhVEqYAa2pOdCMkNdXZBH4HhdJtOEi5zOZGLvSgomodYyC46xdx/FA5mP/q
	uFxFPH1wKqBscNQdHFOKgmOwubJDFTxiIN8jEprW5tT9wQY4idPfWCaBTFLfQ3OyY96uLM0MtK8
	wMembUOWeUoVpxESqGqNgQrBmK7ylchG5HIIdk1jNStR3G9G3nWPWhWGeWWTsLMqzhD40Y3920G
	MIXMu2n4bLM7y/KjWc1/BDTdFd2M5Uy6+h8f78MJZ95d9
X-Received: by 2002:a05:7300:fd07:b0:2cb:8d2f:e235 with SMTP id
 5a478bee46e88-2e466043efemr3780881eec.1.1776797233495; Tue, 21 Apr 2026
 11:47:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-synology_microp_initial-v8-0-7946a9124491@posteo.de>
 <20260420-synology_microp_initial-v8-2-7946a9124491@posteo.de>
 <6104a5fe-a6e3-4c35-ff4f-731d1a5e4acb@linux.intel.com> <c4964138177c4455f5eb07d0e23db2dfec40bf9c.camel@posteo.de>
 <e166861c-e75d-d1c2-61e8-f611e6ee1ef2@linux.intel.com> <1cc39657ac50f3930dfa27de41a1b4605a7167d9.camel@posteo.de>
In-Reply-To: <1cc39657ac50f3930dfa27de41a1b4605a7167d9.camel@posteo.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Apr 2026 20:46:59 +0200
X-Gm-Features: AQROBzD7jw36OIB5Thxw8iYFM3lU80V29LqkzQd_l1DKXUW04JWxY4nHk4yFQzg
Message-ID: <CANiq72k=8fmi0fJnNV=GgR5_HO_COWGynKDF-xzoX1nDAdxdrw@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] platform: Add initial synology microp driver
To: Markus Probst <markus.probst@posteo.de>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, platform-driver-x86@vger.kernel.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 8:21=E2=80=AFPM Markus Probst <markus.probst@posteo=
.de> wrote:
>
> Delta stores it in nano seconds, so it will require an additional
> `.as_millis()` call on use. I assume rust will optimize that out, so it
> will be fine. I will use the `Delta` type like Miguel suggested in the
> next revision.

I think it should (at least in the 64-bit case -- we do have a
`bindings::` C call in the 32-bit case, so likely not in that case),
but please double-check the codegen.

In any case, my suggestion wasn't necessarily about using `Delta`,
which is definitely an option to consider, but rather more generally
about using newtypes, e.g. it may be that we want to have a few simple
time unit types (probably with support for `const`) for cases like
these if people are going to use primitives everywhere to define their
`const`s -- Cc'ing the timekeeping Rust folks.

Thanks!

Cheers,
Miguel
