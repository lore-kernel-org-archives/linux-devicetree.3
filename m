Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3173DB644
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 14:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776783521; cv=pass; b=O0aPXd7FrAX1d/fhpWeSU3DbyZVA7pEOiCjxLXUSXUwbt7H7dIjWbKU5E6aFKbCNrbtGv//rpaUcbpG9Um1Dy7h02+LrYUAxjfOr7DsyJPEZQA7YHTlObGa4LiswB/xa8IoPif5u2MJd+acvB/BjkpZO/vH2QWr4CnwjGcay7gQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776783521; c=relaxed/simple;
	bh=IktK0Ma4XtmCMwxrPYV5R8Ct/afKMQQHV4KvpEVehJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gWBsfqgph99prz3vp+IsF5v2XBaI4rFoQHOQRoMsi1w290r9NVesrWp6d3ZO5DEuKH6C9k4FzWMzhYp/ed/J6avZXitbCmfwbRYVUDV2m/OkMYQKepnZO7RKHmdDPnVVm9pB7zCO8mrAu5fpdyIrHq+eq7HKylxQ3bOVyCvl70E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JaFszFYD; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JaFszFYD"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a40008be82so374555e87.3
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 07:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776783518; cv=none;
        d=google.com; s=arc-20240605;
        b=NF3WJjP+3iO0y+ikCRv8cVXljGj11Oa5szCUVAaxnecbmh5+waI0D8upbiiYvdzKae
         QfJOX/pNfh9Qjx5XKZYG3ZMudLCxGJyRr4foEq25hPBKs5CoE4dyqa7c3q/2uZ5cxfKq
         h8TmL8Z8/tH4P1y8o7mPRGc1qpGcOzt8VBFSfh0X8HqrLITH/P6YnvhbHZlQLhlu0yTI
         jRkV9x2oDCCblzJEJfcmcjIa75tPmT/ZZ72yUVUcEWKtPemTkCz1Ii+7nCDZh9v3msVE
         dH987/jTn/m9v/FxZh10a/GeLMUFPw77rZqaWD9vsEe3nTgyo4W7oGIVxHDwWoMBRb6C
         bQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IktK0Ma4XtmCMwxrPYV5R8Ct/afKMQQHV4KvpEVehJk=;
        fh=ZjeYsOfNNPL98PLwKQHgA2QbAyiTfm3n8o9fLiv2V/0=;
        b=GU0VR53XMuvwqk2Hbl1MJoXKsIoCwov648hFkpx2bB+l3xMZw/YHIlHhz8Cp59oKng
         Q8uadwgmGx6rh/44kJm033BzolWYvGepB9mEN4z7hsGHVvIo0TxnYWvIIzq4UAm8vejK
         VLJkNv0PkEOhZVXF8A7gmpbaWF9BFEPwF4zBFbZSiXDg7sFBFOkcqJwH4WmXUXNdIk7p
         MgY4zsCitdfNBGvuBVC0xqlwIBjF3f6oAvn0kQ30DdFAQiipXWju5SaKf0E9RzdGGMjg
         HDVSz39Uw7DRtN7W7MPyFzoH5BEyh47I7NyEzCtwEx9iWgiLOV8p/XE4b86Vi0TV2bee
         BB0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776783518; x=1777388318; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IktK0Ma4XtmCMwxrPYV5R8Ct/afKMQQHV4KvpEVehJk=;
        b=JaFszFYDrshnwzFa3kQyqTJBIHAvDFqsjJcqq5bLvELWN0bwQQ/zDZ/tY7pEZdp7uo
         TxFX7zmJhMlmeQy64Lf6yyBm0n9V5P6D2Ik/De2Z1Z4hIH4ENXJP56UmkPOkfWNokCjI
         9wjSgCuEmpELtoGvM0+49oveIm2ECy394HDPeb7qhNxnB12/laI4jUh7gN+8U2vAlVDK
         V97lLZLHpAFw+PuFqlYZ6SlOUO+ci/Dwa8tJKgUR2QtKKBUEEedxxxHYztLe19AzIY5L
         5UidHlWqhfyt/zbea7e48poCO5Eh4VKb3j0PTITd73ELQLaep+xll1HTfCdAQwYjfD9G
         KR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776783518; x=1777388318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IktK0Ma4XtmCMwxrPYV5R8Ct/afKMQQHV4KvpEVehJk=;
        b=eciDpRqRAkGoCBV0d3TAx/YVSDQaPk5to7a4oW9ky8xBbBfAvlyO0sg1Odm6xZn9jg
         TCubjXmp6ioafKineSnxAgWaag9FUKkmnE8LeVWwMevyN/W6C/n0AEl1RLfjX5HzAw1U
         n4NN5WfT02pAZDMIjyNcsJEGNudjhqHsufFi3EbtTS1rIGjbhJFnqeDHppBQawmTk2mE
         6gbS0G/NzJOPyvn9CExK1Iv3uxpZ4yzhHVCIUFo0PT1/p2tEQyh6RbHD9ect3I/+KTHt
         1Z7t5WQzlKhH4zForNyC5+Iw6uclrg9Hi+sKcHsabeHtk6a2fO7UoO/gSglQEAHWukMt
         dxCg==
X-Forwarded-Encrypted: i=1; AFNElJ/mWlUSFJ5jIvQQNNa0wz/hcpN6VDzmiUbsIUjCNlWw4RCFSsJEKfRPFQwI2/+RS9onTe4OxyeQDzL7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx85OQc3eFqo0L6AgXsA18pApimBjDPRlWgudvtjUXg0pUNcmjD
	S5Rljzrcx+mqBDfVXSOcTvZv0QJzMLYGjkcPUN1OLbdRxvOskH4DZiKb/V/DWuL0n55p0/nqsQG
	YNdD86uFB2JG84dHFSNeAFTl9dgmKDjI=
X-Gm-Gg: AeBDiesv9ZIQset9JtBZGOT+9wXTbtlIoUYfnZFoJ0nwXgD+5/LG89tTID9ZLtGI5qO
	svAiXQEQQHL2UPn0tk3SwmHwZC4R06Tk0c3NVWccAF66O2R7d6Z3PjJdfE16sGyzT4WvnJIefF4
	7jOfqKGaBsLRUZVfYu8LVuDvOe0jyr4fkrbMZFDrXyhaYsVq+5bHZu9y5LNLrqTqe9Z45jGqnKd
	OzjyxIAr6OMhC5blFhmbKH47r6Ud81AX7E3mbrDsvANvaRCSe7KzXOt9G67oa7Yua8hW28UR6XM
	1e6HF/0cNNg8q3qRnFBat2NXrqE+6HcEGsqWMPhQRi5c9iMPyfNWJmItMNYbXaH4tGAF6bJuvCQ
	Q2MNomSIzFK0lH/ylbFSeIAVcnQnTVJOpEA==
X-Received: by 2002:a05:6512:3087:b0:5a4:1099:b16a with SMTP id
 2adb3069b0e04-5a41728bbfdmr2620883e87.0.1776783517486; Tue, 21 Apr 2026
 07:58:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-synology_microp_initial-v8-0-7946a9124491@posteo.de>
 <20260420-synology_microp_initial-v8-2-7946a9124491@posteo.de>
 <6104a5fe-a6e3-4c35-ff4f-731d1a5e4acb@linux.intel.com> <c4964138177c4455f5eb07d0e23db2dfec40bf9c.camel@posteo.de>
In-Reply-To: <c4964138177c4455f5eb07d0e23db2dfec40bf9c.camel@posteo.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Apr 2026 16:58:19 +0200
X-Gm-Features: AQROBzAd0frbr7R0K910eLnzr-MgLF13a89W0lNL0YdA7DVIARYBXkrGGHdY4e4
Message-ID: <CANiq72=P+bA_eR5xd9rCXio_kBY_p8ehgRyCWN-KTpZDVfiusQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] platform: Add initial synology microp driver
To: Markus Probst <markus.probst@posteo.de>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, platform-driver-x86@vger.kernel.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 4:17=E2=80=AFPM Markus Probst <markus.probst@posteo=
.de> wrote:
>
> How about `const BLINK_DELAY: Msecs` ? The unit would be implied
> through the already existing type alias `kernel::time::Msecs` for u32.

Ideally we would use strong types for things like this, i.e. Rust
newtypes, rather than using type aliases.

e.g. see our `Delta` type.

Cheers,
Miguel
