Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956F13A75B5
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 11:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775560852; cv=pass; b=op2tZIbg90vQETZB1WG03QJuGV1qFqMKNpxK6d7Dy7qcXfZWhkEPGbzT5Potw0ej8pkGRKSkDXZkbL9DuJP8JY3+lvJG9SpJirIEO4QpksF78P8zvFJdjQq7Qmgrmnphb56wZmgo8WPieIoq2Cq3T3oPrUkPJf9rMZzoAQ0QYrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775560852; c=relaxed/simple;
	bh=DsRfWjHm4iGpauyafRNPJxngdTIFoI8cKVfTiumqpBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p2vkOjwF10DbXEUAm5eW/vTwqElVTdnZXO4/xISkv7wUllcBE9wQ2MRM60XlXEX/dArC11VZMKmFVhkpcPoDTrtD+hXIikMqapbwsAZgC+KBm8iJGHFwcHuXCg4wobVAPqYvfmqquJF90eLkGXLcEoaPF0ZKTyQ3FLOnPiLdQfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8iv5U8c; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8iv5U8c"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48374014a77so65549505e9.3
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 04:20:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775560850; cv=none;
        d=google.com; s=arc-20240605;
        b=L0ANq3PYxFADxcm6y5ABAReXnTFEAmtHsWb+JYc7hutVm0IxudTILjRqkSvqtnaKJ9
         TAXjdUAetzd5lC+tsZvLBKa5rAfp5aHJ7lHIVPTzNRVXdsoQRwKCEscObLxYvPBEFKxw
         pcteR6VRMl1WebXvrCeElsWbkLibgQmehSN3CruMODCvOtGxS8s8KTvfZsA7th3/DDlA
         DjwsM4TuNZYwB72X3DUxxcMWTtfP2HlseqBR6nlRyqlx5J+gijh5hpIGGitSvAsoOXy4
         WM/G5PkGsfCnxSyqe8wLdzw9oxQO2pD6/ycJtc+yn9mcDiQAeJLLLmzS+gOwU5TQFa9W
         aFOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DsRfWjHm4iGpauyafRNPJxngdTIFoI8cKVfTiumqpBM=;
        fh=E/vnDjxjhpBpoTJYv4/B0nS2qVBqdcPU/7FJvcdKP6U=;
        b=ARLg0WpqxJCwXJdZBeRqRbxgSzITal1heV32PIq+8UDA4pkv8a1uw0tsZ2gaw5RTy9
         ENYq42wjuaBkzkzGYl7S17o2wdT/zRECno5AWGtFhXJxbZwSZKoA2XxtSaBTgY+jjALt
         mEIcdDljsJoukYkF+ukkbF63TTITsHCdIar3ZsNgfMx8oCcmg1OKZCisugtWox0+hE+0
         D6ERqjFegF0ZSefjcR8pBUv4+yOLzhgznrWokbMqv3E0nSQ4L4gKKY4qg5BtV+F8wMbF
         3um7eUcF4JegTnLfLNUPmFYwHg4xNS/Se+mFnHLok9QU7dkeEcazcI79spb3NMG7xtL7
         w2qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775560850; x=1776165650; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsRfWjHm4iGpauyafRNPJxngdTIFoI8cKVfTiumqpBM=;
        b=W8iv5U8cnsHlKo1KlIuizat5D5aTX/JcC0g/IR/gtE1NABoI1q5RilHESD+FIw/Ewo
         0eMBFzp6pQPDqpm73CRDbHOXcbLYyTXrX5zmzxspN/vDZY6yk67AKw24Xmftj3KAJVDQ
         chWSFgOMiYAAtEsLQNlxUW9WiehtJDBw43uH199RxAQmEb8ADRKRJKTh/CbOCWUsHPsA
         VMcZz3IwxqPL8SHhP6RTGDGAYsiZOzVuAMR5BE9kVOnY2fkCOvtXKqofnhgIou6jK8uN
         hpR/CaIl311q5xFtmoLas7QRcV/QcGubL2jj9/ANTTNA19QEoQH+FonFAaIWEccZ4od1
         8C+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775560850; x=1776165650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DsRfWjHm4iGpauyafRNPJxngdTIFoI8cKVfTiumqpBM=;
        b=Q4VLLZJkDjqyGw8s5zV/xSR9tqyQFFUD0JAyBVhkSNv2E29Plca6EWHX4BJBbnYDx3
         IwpkicbOXaCUtfpeEMsqLuKHSzUV2NrwVlXYpfRj8KeiW5+McnOEyQ72M1r0UV/oZCjj
         ClwStuLe1/QcYYDRfH2dwKqD7w5CvJv4EA3m4vy0b6No7VYjq1pHfTm05mQ2I6EiyRai
         R+NHEzfzYglAdllBxKLa3tXAjnUphuIXTViQvKA0LaKKEAfNnmrlG56gUy8/U8aAJJwB
         EWjCF0otnggtlfehB68HkakFOdQ8OXoR13d9t5OodAqmHQbveb2Re34Bnxrm7NvhK51s
         02+w==
X-Forwarded-Encrypted: i=1; AJvYcCVZrb8Ti3pRkOosOGvrYnDEH4xjiustc94W2b8ToQfu+ZiY9Wwuca0VUa53Ad36XKdzGnMvb9XVp+FD@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3mBgjJWtC4k7iR/BBCrBq+ZtECywpPEPE+0aVIbhw/S1B5z68
	syoiiPEjn3MmcoXRVxdtAXIBMclMMEYxSr/1LiIIcFAMcPasHlv6RyA7KN5hAuN4/xcAwlTqVpm
	A23hK6VsY86K3/uIKkLnd+S2V8h07Be4=
X-Gm-Gg: AeBDietRz17vFegj+mkwKY/Q/KlCadrcmWrz0DbEcifEy1sCYuW/11StpVTfD7Shsdb
	847bkP33Ldd2RR/+AML0BKAZIuESP2fIuCPuRCGSD0O2/EOwTHRjDCVaeaxslzDixk6NHWUBv9N
	d6zBpFRQGlsn+I4mUWjfl7GhwWwPjrG4ijx+GYOOCW4w5VKTlJN7J8CUYFZ6arQrg9MxN7SXjVI
	mEqInkJEM8ObAfAxa+Sohps9hE4dH1UVmOmFN3bxMIZVRoAytqsgnOqoRrY0T7NqrbuOA/KYtX1
	1AIZl4Pn
X-Received: by 2002:a05:600c:4f0d:b0:488:b187:d898 with SMTP id
 5b1f17b1804b1-488b187d996mr103135575e9.14.1775560849747; Tue, 07 Apr 2026
 04:20:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406075114.25672-1-clamor95@gmail.com> <20260406075114.25672-3-clamor95@gmail.com>
 <CAD++jL=SQsfwOiaTQqzPmbuUECtNi6qO+yuYXgTps0c5SV1OYg@mail.gmail.com>
In-Reply-To: <CAD++jL=SQsfwOiaTQqzPmbuUECtNi6qO+yuYXgTps0c5SV1OYg@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 7 Apr 2026 14:20:38 +0300
X-Gm-Features: AQROBzDtU3EBKs_1guMqhJQIuLAgaICFUNiqLjWoJ8SqPDUbp8JTVqn9mCj0LG4
Message-ID: <CAPVz0n1Vdkb9-jrJavuv5MwBbt8Oh6ehAX0F5GHUZ6z8hDeHFQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] dt-bindings: pinctrl: pinctrl-max77620: convert to
 DT schema
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 7 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 12:59=
 Linus Walleij <linusw@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Apr 6, 2026 at 9:51=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.c=
om> wrote:
>
> > Convert pinctrl-max77620 devicetree bindings for the MAX77620 PMIC from
> > TXT to YAML format. This patch does not change any functionality; the
> > bindings remain the same.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
> LGTM but waiting for DT maintainers to look at it before merging.
>
> Can I merge this one patch separately to the pinctrl tree?
>

Yes, if DT maintainers find this patch acceptable, it should be merged
into pinctrl tree since all remaining patches of the original patchset
were already picked and applied.

> Yours,
> Linus Walleij
