Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308563C98BA
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 19:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787685624; cv=pass; b=bPwxNoEapgFXPI4txCMdKzNN0hSkDQGOlkjMEXVEksq2lfAnwc70TVW8cJ5G4ap4OSkV/A1hj9/u0Kj8OhlXofzB8PxNjmZ7aLyeiNB/XdEVBQJ4ng+kP9W2561mSDiJoFgeBbGKDKVL5yl/LNIW9IQAdEIN3ox5rzDw+v5W8SM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787685624; c=relaxed/simple;
	bh=xkLEoNeBbWtVSN7j1O8Zov7Y8VwgQr+BliodPWhjLJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BoO8x8eFUksctJ8LkikOx5Ae4hNeR9ZEq9ZbR5pTAvnvdEsSGwvo8zNoK62FJAfnwtCd192qOs1x8kjY4b+MLNwrgbW4dNa5HzixoJy9tBpZ1f/DEe5sJo4o1NW88aBaDGN5eRbVpP3JtAfitOUBt0mM0/V6lV2yH4673OMisHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=goAYzks+; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="goAYzks+"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbedf082ba2so13838a12.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 12:20:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787685622; cv=none;
        d=google.com; s=arc-20260327;
        b=q82Gwhx+lbJjejoT2cmxhcJGEmh8J0mHtbWsZY/B98Ung4Rye1mj3jT3LHhA58mh4t
         q0bG7Q0cba2ZV4zmhz+KKdRXwrWqcSWZOIPffvxwYpIL0ZhQJFd8CEwcf5AzuG0tcMRK
         wiu5DrWF95UlmnK+RsxdHf9tu1kqvtcVneCeYzsfbJ8jROnc4yUd8RTqyrgddUYq+Ynm
         sCIOK63h+a5GMLI6cbI7P1ZDihXPi8QLRpYZzEi+hb8Wzj17OhlTcQwNy+Xdyd+PLlWo
         hh/G8zG+0glgeZbI4r4BXQdpgVaF1pOJ6qQ88H/rv+ldd29fg3QFfOUG4b5ychU2+Wyg
         CXnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xkLEoNeBbWtVSN7j1O8Zov7Y8VwgQr+BliodPWhjLJ8=;
        fh=fsxQkR12uZOdV0/zAVHGS0T3cnPPD+xYn9NckvDJXtE=;
        b=eJLT66t4zPgTDVVpBQl97pZXmcztgWn0WGTA688A7S6HbPdJdTKvhHh/crMUpftsnx
         x1MYWhBt/3bqNAIMPXZhLJiVI396k0IuMjn30O5KB6F9DsoYJA7MPBRVopVOxvQ34Uj1
         msE777R5jNfCF80/x2wUC/4054Apf8TdBnWOFhIJxFOUwnyFr66ps/8RBHOU59XDFxmf
         3v+5sFJKwebPIZeAlPKQlQ+YuAgnpkXFdBABD1spbfcm7FQtiPV8VodZwi/1oiA2trdc
         rWG/B/6Q7RKjwMeGGNcJEZnbKn4Cu2nUkkl1FZUfubyXLqfiCxSgkqg+QxQVEssUHu+H
         CJxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787685622; x=1788290422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xkLEoNeBbWtVSN7j1O8Zov7Y8VwgQr+BliodPWhjLJ8=;
        b=goAYzks+5Ki/4s07v2M+O7v6WQmZ5EJ0Lp2+u/FSiYVOLU+wSkX+u4pLsIv/hjYvw+
         M/yIhnzR+m8L9BL2X3te0hIHujnWS548glRPRayxu5+U/QHxuC8ytCb0piyB7g7zQL0g
         whMNNf5cQYvWT6w6xwfW10zrHpTzy8IXncUkr1u2tgGDFnDCdPF9UsBmJjT/blGxz6rh
         lnkqX4HIN3EotfUjuaFLjDdwxHhBgwC79MLhpkJuC6R+cdzHzlgS7m/6W6/klpFoAVVJ
         R41H83gjaFSsD9oPEz1HovKSpgw8/DCZElKQipOR4z4lUTW46S5HyGppklvS8txZY75J
         rXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787685622; x=1788290422;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xkLEoNeBbWtVSN7j1O8Zov7Y8VwgQr+BliodPWhjLJ8=;
        b=jsOicOtykFwOJOfYipwcoFtiDVJ58jXdnRh2tO0xjG63noygkl2InH9KACKIN0i63Y
         8rzxeh6+e1QwmYincsua7KGblTOhIZgRv+G4TZGE0TxgeZFsrKxB/7EGVjJ1JnPM5tyy
         DyQ86Z/rwa5hpVOycPNUwBEOVvhZh7U5vAngr4JzR723ZXR3IzzWAWauTvwafag4Lq2M
         JNeJNnAA9eFx2UZhQZ+Ke11HzM9mQNdDuZY/lCzZsJzW88AxcjU2JVXJbzHHnX/eoVL7
         IuE/Gssnp5fzmlLsAo+OGuETTmMYxJpBLJPNv8yHSkWy82kvWWDN2KGIS/Thd5gRBvGr
         lsxg==
X-Forwarded-Encrypted: i=1; AHgh+RqAaNhJgkmmvVVT1FvFgJ6Oe3KEoIrN4cbrdAvoa1ykcV+6SNbGAA5ldv9FvT5lozgqEeSU4ZqZvt48@vger.kernel.org
X-Gm-Message-State: AFuF++mmtQoZk280Eeq8AHbJ0qEOKrJMX0Po11J3kkExgEqqOhJFxBdl
	ZyMaKmEZ0hDkObAjUPK9cFWZzPeAsawPK2NFHCombSAAoKf+sc2M8ijReTvKXJNFmvrbC5ROFpc
	WPTcIBk5X/ZCNvpItWstKnKbY71XnYUo=
X-Gm-Gg: AR+sD10ONR/N8iYTXce2cqOwSdL+duiJqwUrYZVsinOyBUphsf8H56tfifg+v+P2Amt
	jXstH33Exg9//cWXufUrDcjYtNowiE/mMFvRIHLPQ0JEB4PDY4jwfh3hO8mw+9c+djePj5NcZVA
	XcVZkJGKWpQbF9jEYJf8+bbBWHQG0p23TYZIR5GwzFUPLUsED9btn3yDSTpBgfjqro/Bwi7rEoC
	d1iOZrEAir96wi4/dLmRFB+HL7zJCA32ZPHTNtKYd+M5ugMNADQeRF05J+OFtqMasZlaTnUYUYu
	mSjDhbKAlkyT32MXhJJJK4WDDBDmbfQFHeAuNLBNUYqYzkEDv5CwJGetuEQS97toPcRcm6yEbm5
	QpokNSV9kKrniMrzYEXfdgNTzs5hEYG6QaWdg3pTHIJAeZhhdlptLVHJVC18eIdyDDttlzAo=
X-Received: by 2002:a17:902:f789:b0:2d5:cbd3:8eb1 with SMTP id
 d9443c01a7336-2d707bdebccmr3413445ad.3.1787685622061; Tue, 25 Aug 2026
 12:20:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820-gb-uart-transport-v1-0-282da14ab7b7@beagleboard.org>
 <20260820-gb-uart-transport-v1-3-282da14ab7b7@beagleboard.org>
 <20260821030018.GA1961@sol> <93977935-ea60-48de-9d13-23454e038c18@beagleboard.org>
 <20260825175625.GA3673306@google.com>
In-Reply-To: <20260825175625.GA3673306@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 25 Aug 2026 21:20:08 +0200
X-Gm-Features: AcwNN1X5Bqs8KXrNiEWoe8c0uoNxGkwdgVcb-4DayQsyE-o_UymlYyy142l22eU
Message-ID: <CANiq72=uUR4Vo9W55Kq6tQjc+6Q4_+wiWhCo-VLdkvg6PJeoAw@mail.gmail.com>
Subject: Re: [PATCH 3/7] rust: crc_ccitt: add CRC-CCITT abstraction
To: Eric Biggers <ebiggers@kernel.org>
Cc: Ayush Singh <ayush@beagleboard.org>, Jason Kridner <jkridner@beagleboard.org>, 
	robertcnelson@gmail.com, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Ard Biesheuvel <ardb@kernel.org>, Ayush Singh <ayush@beagleboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, greybus-dev@lists.linaro.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 7:56=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> kconfig options usually should be in the same directory as the code they
> control.

The code is conceptually part of the subsystem, and will eventually be
moved to their directory when it is split into several crates -- that
is why we have put the Kconfig options in the subsystems they belong
to.

I hope that clarifies.

Cheers,
Miguel
