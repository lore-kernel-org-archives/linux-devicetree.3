Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1A52ED141
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 10:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557540; cv=pass; b=rY5fxNHRpHvd6qf3hucYGTC4F+A7J5sAhx8Q5sW9ke7nfpAvV3wO+pAC/2oYLWTqn99HlOqopiUrzxSVq0EPWAKv7UG9WD028COji/NN84OZ8lRlDXDMD9xrpmPMCkDfNtx5e4poW4JldpDnM8fHs7Cpvvl0DgMZRt79Lgs46QQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557540; c=relaxed/simple;
	bh=UaOxwYAmcVziT805AELn5Q3T2CtKIxkSTgQsvQ/cWdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iA+tGLUjwyLE8uAS4wliIXwcva0sO9z3n7op77OwwX9yvkbwfV+wOytb8JTlOXoIoHlxWhSHi8IxEprvIiKDrQ57PhRrldK2VdhvlktG+5py3Js7X5b2Svbjc80OMS7RnJOMqeN4AKwsrCPZRJHTfptv51/wjPy+DDA0OPaNmQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTop/QZ9; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTop/QZ9"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c080efc1eso1560497c88.0
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 03:25:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775557538; cv=none;
        d=google.com; s=arc-20240605;
        b=SD3g8B2/D+cKGB/hfLESUrV2J0Xl7BM6UpDybf/Ynd8GwyhGiFKn37PgfLJyioRs3O
         RAvcPfQlMLG5F/C9m99T8Cvna9TOUFa9Q+K3u1BKEVI+K2TtEte4Tep3OCSIPG/Wu0sf
         69+wJEAWYBQ5Bfmoc+A2h7x2msNL8VT9KUkuE7B3YOGO/Hq0EIaOh6BNzlV6QMFf7WGe
         A3mUbGdQMsK1l1oFVh44Ydtg41QVHjGxgS7lVG0NicReEvcRKu5XCddV4CruAod8qbvJ
         UAk2+NKETQ4NTs617nqk1vRDYnGRQohAtOHlqlYicNpGgyXlz9fX6YCvVOdqMzDIk2wz
         yJ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2dCoQ7CeEcgKj6hOpXA6YIiqhgwa4zuY4BYRg3RTjGo=;
        fh=ZeVawyFWrUmW5hFiBrVHREXV6+16NKyDeDEvn4Ja46c=;
        b=C/SUmaBnmmIJNHzDKdwSdMZ7ueOQr5tIaWxeTcvZzpDqmjzwS3Qw9v8ly1tc/BPp0l
         nb2BghGDs4VW1h0MgL22eyeAuLRZTZY6C6d3/hqpReBoWTpqv/iiYdUSZPwAOBBnanoI
         vOfn6gZc9b3unZNwQBGz8aRXBWONsgWYrH7J7LOUf2jPLJezSKqEowqJ+wbaFd9HPsqv
         jQ3n0fNqrHbOS4cCd8hFdZ6MfhcwnzcXvCMsGcNlZmn9mLSCay3z5jDbipWhzSIEfiFX
         g9pyV8Jg6WliMvz8kr6YmrT5iKxiwAPEOqX50fooRlHNEi4vQ/XQpjX0NWK5AaC3Eaxy
         PIIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775557538; x=1776162338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dCoQ7CeEcgKj6hOpXA6YIiqhgwa4zuY4BYRg3RTjGo=;
        b=VTop/QZ9+yG9NhLIHyyXnmtILbV50A1Jp0+T1fNXB3m1xvLsRcRHgItb1VHJD2Eser
         cLPWXviQXkRggOF07QXN7sMkl+6BVilYqJIU21HP5PZDWwxFWuc3mWUJm3GFYiqJmjMX
         1Cr7s9HuXsAht5gqQTMkTJXCJLxHae/9reEhWjQQbSZSpUUGhW+aS/hm5CiUGDquN2lZ
         7XH4cev0DWyvEcSfj8dZVGG7ph3GNIA7GVgwk8OhyIhxpWjdHorbQ96VBiHlGSflR+hP
         c65xkafic3Z+RBxhDgOBZpk8Rgv8G/sPIBEGoBiic2SHnA7PdLjukzIFeBrWpkg7kqwx
         mHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557538; x=1776162338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2dCoQ7CeEcgKj6hOpXA6YIiqhgwa4zuY4BYRg3RTjGo=;
        b=giP1UPp6Kbd/O4wt0EgMgUyEH7BbXQRBM50FMjQKsJwkCB+/wZCNOW+JiOZT6x4jN4
         x1VISpOSzwCfDP2KTH80oX2yHc2rpAfAZJOQjMo/zlYiKOSDnUUsyZA1+tBDBAKojPWr
         JG/wiaJGP/9joU1YryhK/A2zmdpsqG8e32RpiPkqGzdEshrZDs7Ur853CtqjSn3uLDOQ
         8vsKSFSzXyZBna5Or+KVejdsSFlwpfDbuXqomAkyzS2H1yYSE5UiWkD7RTYkwHu8Du1h
         6Xt84lnRvG+jm4gH+BvpNwbZaZJIerfCIXJyxWb239i0aLe3kyuiT2ffO4h1KIS8XT49
         xMug==
X-Forwarded-Encrypted: i=1; AJvYcCUMO0YfmDtwmGl2FdU5RUF9Af5FDmHaYz9l0tQ1ko2Fm76JX9u8mpFX5MgImF7asVdcNlp5qgJlSU9L@vger.kernel.org
X-Gm-Message-State: AOJu0YxqJEU+sLIXSSduyq/QkhwvLkBhHxKwHxvbWhd72+rrwV64zHmw
	gPsy4vkdgIN/3FIdKN9u1fQ6WVaeAjmCSVpXpchVs38v378GGvPm7Ph4FQZFqs1QXQtJtb6V6px
	ow9MMc1yj2mE9hkhK+IkhVgBQQ8fqzuo=
X-Gm-Gg: AeBDievkkjLgyCoIe1jijsYcNS697DYkwW4qWnB15zQaGM134TdxlXfte3wGe60enon
	WRpQXNqnLIWIcmY4b3e5yqiGj2Pts0rKhNTLK7gtmtC9GCcAK2phlEHPo353o4oCgOybKeq/D0u
	U9lQ0GYdahz/9X/2EzOa6uinXuGcOVWtrgL46sOwqfqoW5Ps7rJl12+HQQ2B3cwoVt7jqvr0rIN
	DWzzqEvmv3v+wSzPMctgIqqwBZ/ZCCyFJziAyQHi1K/CQQ5Z9ETyz/1cPKjfN6dqmduZJf/Z/4x
	1+IewlQf
X-Received: by 2002:a05:7300:f48a:b0:2d1:e90c:f58c with SMTP id
 5a478bee46e88-2d1e90cf74amr459729eec.20.1775557538054; Tue, 07 Apr 2026
 03:25:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406101647.109667-1-Ashish.Yadav@infineon.com>
 <20260406101647.109667-2-Ashish.Yadav@infineon.com> <20260407-monumental-mastiff-of-sunshine-fb27ab@quoll>
In-Reply-To: <20260407-monumental-mastiff-of-sunshine-fb27ab@quoll>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Tue, 7 Apr 2026 15:55:26 +0530
X-Gm-Features: AQROBzDY-4Odb8obalVxjmoVsnh9nWzEPYvrrxsVA9wqCy5mzXHo_vJdL7rCEoM
Message-ID: <CAJKbuCbsBOO1m7ByWJpv=6gy_Sh5Giaoffb-69RFVxr-2VdWgA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP720
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ashish Yadav <ashish.yadav@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thanks for your time and valuable feedback.
 ACK.
 I will make commit information simple in the next version of patch.

 Please let me know in case any more steps are required for vdd-vin-supply.
 I will take care of the same in the next  version of patch.

With Best Regards,
  Ashish Yadav


On Tue, Apr 7, 2026 at 12:30=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Mon, Apr 06, 2026 at 03:46:46PM +0530, ASHISH YADAV wrote:
> > From: Ashish Yadav <ashish.yadav@infineon.com>
> >
> > Add documentation for the device tree binding of the XDP720 eFuse.
> > This patch introduces a YAML schema describing the required and optiona=
l
>
> Redundant parts was supposed to go to /dev/null.
>
> You already said this in the first sentence.
>
> Also, there is no such thing as YAML schema.
>
>
> > properties for the XDP720 eFuse device node. It includes details on the
> > compatible string, register mapping,supply and rimon-micro-ohms(RIMON).
>
> So nothing here is useful - nothing explains the hardware, so drop all
> this and keep only first sentence. Or say something useful about
> hardware.
>
> >
> > Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> > ---
>
> Best regards,
> Krzysztof
>
