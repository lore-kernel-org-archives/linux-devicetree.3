Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE877262E
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 13:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779716922; cv=pass; b=p6L5r1FoCY58H63fTdmBnoWxOQzr5OfAI3W99KJaY22/+NxqelciD4xJDPYogUcst0umjrorhiickkUh1YSVkhc2kl6zzf0zmjjl5tUUzdUEXWaoObqjEyCo4lTgTpjOkVAlVtDfK6jH9EfcF3gAcEHcRnQTIg4NbYaJAu0P6Sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779716922; c=relaxed/simple;
	bh=85tyixWPRhyVYE/wRe58MC4SnHyYAkG3RgjSss+fQEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fqNkS3Sc50MiRFlPWzYFE12b54ur/peG/Yd6YFuhdynmVqrHNknsXoXl4OzBliuDtbeLPLHiIvRspJSKGLunpqCkElef/nXgSYzdLoy0vmh4qXl4weRZfcINr1jCz2fEYef7iylcHkDplecWJ5lByl9ixfAXh2phdAkjnyymszE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnrQZ9pe; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnrQZ9pe"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3044f23f716so227383eec.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:48:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779716920; cv=none;
        d=google.com; s=arc-20240605;
        b=PQn8YrjcRtWNnnEktixh9wsmLHMWeS0vWJvHQKrMZo2opMa8YhchynknDFEXo8SJe0
         LnHoTBkUBXk/K148wct5uoT1Wx8uY4XxADL5fwCT19zHTZYQVD0QrDlFfCKO8V6kU54E
         lvHqfwTr/LO6nHSSY0y50wXGVU/j31tO+jBauORM2Blp9wq97jQLkyuvkd8VQTqpvHAc
         gnsLfwd9wxvo2ce7gsrVcR1NVm3sEKv73aHGb88+YxrrLultH3RrlyGw6rTejyzIeQF9
         PG2rAMoy57l6uZHfuiZ/fa+4DkquSk6t9l1jkKxlJ8mA+RTPdD+bdQRkHsKp7fZyl3ju
         tBgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=85tyixWPRhyVYE/wRe58MC4SnHyYAkG3RgjSss+fQEQ=;
        fh=eCIuJEckVtHy20FcsXqsMjiQdOhL3Z5ql1joAr4F3xE=;
        b=LTBTbki+Uvl7kz0+ii7MxLtm5VnGEcut5aQv4JdZUoyxAy1kePXDxaE+vm0Ojt6zqe
         jwz0ak8ZylD5WLJ9E7O6tn+ydHi7RxHsnl9E4AYBYAwckJiQC2S1Cg42wFBkF0M3Q8Rv
         5DxUb7udGzojzXP66lmi4Z70BA+3u6OplP1Q7grGuJ7aJs9WOv0YJ3D7Cac1goaEsQW6
         7WR6jAVYYzgYOjpsu2dTRJBnCNatMMDVLUMSm1tEzTwE3KHtDfw+kvzLqp/JwhQjasYn
         M3HcTAvWfIQAtPrQ3vGpDuAjr2QYajA+dinJnUY60lpd0ujUjEuj7H1xV8R0PPzALpD4
         2kFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779716920; x=1780321720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85tyixWPRhyVYE/wRe58MC4SnHyYAkG3RgjSss+fQEQ=;
        b=lnrQZ9peMzw0edVCKUC3WM8EsyFq+kEvdnEjN0qKzYpZeQf2LvbBfKFnWULF/Mpjad
         7mLtyyYM0gM5lPCVHP0Wd+ueIKLRT8yM1SB8LFnhYvOkuS06y5CV3MSyQfNQkxAnnyiB
         YdRWND7mPVXsAtPwxXgUTo9NVltgI38bQljJ9UwqRExV3gBUv+gXO2tlU10lLc3Dup0o
         vVeRdOlvuUC0FJAYWjeme7QrC7JlZcQXSY7wY46eDbbQ3BF8JysfGZyM2hGzS1sTLMoP
         uT0CeBstDzfBjwMjM/WfJiuHcJ2krjaGfJY1HDMCtR356o6/xZJOSNhY8JCDdzp/ss31
         ZjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779716920; x=1780321720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=85tyixWPRhyVYE/wRe58MC4SnHyYAkG3RgjSss+fQEQ=;
        b=K5BqrURvUrn42aptTe5wM3+s5ZEttjwbhp6NiHHBx6bMcB8MvH2XzaW057KFurLcpQ
         lsWY2/22dKgZzX/KZG00Wsk1+7lEKm0KLKewDY9Yz3H0UHnf5Cox5GMXDuO4uJT/w96z
         NNOoEhXdWIzQ0amfnRPY1vdVpnjTO6LDlfP3WpRUUSzrVrbqqlCJTvoFpL5wAyLavqNf
         MlOn5YNxEUmdkfSecwHwq4XUk9iiBHQbEcehStVPiik2t15Yh5JjF8XIT0Fll1HhV9b9
         SOKE9/PVsfw4AGkauNSIefnPnuVGOX7ty66tm7uV2KVNT5SBLP0AJVec4ARM+sHR05GI
         RhIw==
X-Forwarded-Encrypted: i=1; AFNElJ8Fm5xl8ps9W5a3r3eFV3i4xlgjP6by2oWzbcv9FW/k06UyOlyYFI5GdOMs3JGvRBWvQplae+iwmHrM@vger.kernel.org
X-Gm-Message-State: AOJu0YxUP1nHGJjZyUCftUmfSBeEG4GPlxd8MWMS000iZBH7/G+eVDCP
	V80EJT+tg4YAT02M3Plb35ipwxud3BYTJrO6JLZRTCCdXV90eyZ79N3w2S379jES/jwxpPwfrfc
	Kkw0MZejUFcDxKyISkgBh40F0ddT6emQ=
X-Gm-Gg: Acq92OGx+uJMqjx+8YluUldLFGEjZGbvIhqPKYYQ5IoRmjhmRsHryJxmqxKtxHRLBKj
	9LNIuvQcoqm+5SAJQQPcDSrFSsXxgb+uOAmIgp206vAqEDvHOKp1taQU2FgoBD86lBiaF6SVBrC
	fdMCkpJmRWxQfSEYWVFHegHjmiFUttlgOrGmoRpaBklVLkmhSBOf0j7RafrD76h7f29tuGVQ9nn
	igEYiQB4iwN2kFysU66XjmgXGW2SUx57fucEHtw173+FkhcwaXW6EX812L6++M2M2f7WNPWk3tg
	9lO3u3J+5ONpA15uCWqKE2HL0pZrNhgmB8Qlk1G1NECN95QIPn1/0PSKd+0rZlRljjaRUQ09SUr
	3fSUQcC5R6qKvcAczHHgIW0U=
X-Received: by 2002:a05:7300:cd97:b0:2f3:3835:2005 with SMTP id
 5a478bee46e88-304490ec25bmr3233212eec.6.1779716919856; Mon, 25 May 2026
 06:48:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522-strict-provenance-redux-v1-1-0880b65fc17c@kernel.org>
In-Reply-To: <20260522-strict-provenance-redux-v1-1-0880b65fc17c@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 May 2026 15:48:26 +0200
X-Gm-Features: AVHnY4KSxYqiTdhQ2JGDTcNoQ7xW8opRoeLvLR7fidZtFguYw_peTCo-of46_mI
Message-ID: <CANiq72kwRam1yk_w+B2n2osXLEVdofDbisBs+FYoukZ7GYNcog@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: use strict provenance APIs
To: Tamir Duberstein <tamird@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 7:19=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Link: https://lore.kernel.org/all/D8EIXDMRXMJP.36TFCGWZBRS3Y@proton.me/

The linked suggestion seems to be about enabling the lints, not using
the provenance APIs (which we have been discussing for a long time).
Do we want to enable the lints after this? Or what am I missing?

In any case, some of these are not equivalent to the `as` casts, so
they are not a mechanical change. Could we have, at least for those,
the reason why it is OK to perform the change? (perhaps as separate
commits?)

Thanks for cleaning this up!

Cheers,
Miguel
