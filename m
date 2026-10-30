Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793349689;
	b=l18jNVYQEfOrX6DWo1zD4mYM614fC7HFHbZG1WaT/JLt0WCBqDB6J9ALLWu+6U4DX28M
	 rgU/Ra/umb6FNH8Xp4N7PgOhg+Ghc785Tf2HO7JojUc7S0JJZ8/8F40xVSYaj97AtXXuR
	 6UtLpyGghedK0nV8WRrW4hlWlIFkgLxO1kSYolYGnVBZrmG2pFQllyi2+DyIy7LJ2bpIq
	 QTU8UGwue0yFWjQl32IDJTEZ1Wfkefsi1kW8yi0L9P9usWut5w22keExN23B/RfAzWrRn
	 5kojZ6SbDm7fucCZE7eqQUpBTkvJVgs4mgEozi0sWjGhcOgkaGjTAA2uarMN1CrZDHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UrLH7U2TwTbVq0Prf1EZK1OLwkqGxJZQmo/JtOYxWHw=;
	b=U3ZIZlYitS7gGegnwXzTVUfkcQa9IVGDnkoOENLHtwbgFpsg6qjacBX3SLUNAQwz/SGN
	 P8+BkWQI33LXGMNw1LOw28v/LcH5khpGDGs+bxr0+74B4e5CWVt62aBAuYhXW6J23LCQ/
	 p2HvnSxyfF356i9+BfvLERx6K5Ho7fG79zs2/nIRe3zVGtF5UdClUvmiO3ykpT/fGui+/
	 f7wIMXpJKiY775bzVvJxXiQdUgchdRR82/5H1kRjCp0KP5ptqQqWGtyNOzJ3uezAycWj+
	 hnyBJ2gbJBdB0osYHbySY7ULNCqyQ91hiUzMSAlr2xT6ruCocx2sD8UyfiDzIF8QP1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OKsLO3Ie;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC33606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACC33606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OKsLO3Ie
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5eaa5e03c47so1467826e0c.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 01:41:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793349687; cv=none;
        d=google.com; s=arc-20260327;
        b=HwFwZAL1jb4pQ0W2/byyZ9mOh/8y+YTF55/QOZ/3GPQKjDDYeGaR4NV1qhKVbrJJ83
         YvjnuAzU48w7jlNKXT9zqsiKHSNlPywgRUUt+TQjzH4kKWpTEwRj4BRogXaJQY1yNJIk
         pFm7f5DeGaPIkx2/OdQ5LX+tiuEQ6NXd3VOU+2kPbCG6HIVWK5sk4dDDJ5arN7mjT2oU
         Mbqig91Jm3ARLeDg/KSfGzOj+Wd76suLHIgis+2kXp6MyNDPnA9GCvSC38txkeTNw8RY
         WX4vjbAZsJnu6dsA9n4CE5vpJsKwR4UX2OYqpaZjhrpjeol81+G+uYafWmUYDJAendGQ
         8XQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UrLH7U2TwTbVq0Prf1EZK1OLwkqGxJZQmo/JtOYxWHw=;
        fh=soT4QA8ndwMyiJLRTLyAG4y295dtf52zhab+TFErQks=;
        b=Ms03/urDDhf+/jDP+7BsDjf+NnIU5soTM1A1QfY1uEJgF8pFQJe4gZArINIA2oHhEW
         O9q4De41zxLhlA7nzqAZHAXasRSNQTVkfFjjBnezT8oDDKhLh17Rjd9mZsc9F9NlhGZV
         MvxgpDrAm5KJ8Xragtgg0F52pPG6IY20gv37nw4sPmOpAdALfp0N/hkkeRg5XAh/YS1E
         8irylis+0Ae51MW1s81c1GefeoH6Ip92H7vwXC9nkE6vD7u4dIq3WA8L+EIjd8BLEGod
         7LMJUL5rH9lbxoMldpk9W1TnrKW6g/5nOOs38F+B7f4EoWf9LB2tOVig5yvyxPMZQMPC
         Lszw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793349687; x=1793954487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UrLH7U2TwTbVq0Prf1EZK1OLwkqGxJZQmo/JtOYxWHw=;
        b=OKsLO3IeFrjmRhia5U7avHthvPf/c7EndZITjoOvpdgWpednDscHO/GejLjawfF4BD
         p1FzblpPWXUfIOmKTjrp/K5OpIBWppICtumm31zTv9dTNLfn0FDUH8zuYeqL4OhquoVH
         fb3rUfGaa29K2sJw4tyC4XP9pET0ZSOO1Dj5FgcwwqMQNvb+29jvuyuhBtQlLJk9iwNB
         UeMjI3Lpx/jjvT3Rjr8ikbI+kNpfU3p28Oas8AR8yNV/i9BR/xhRVFmeE750XhOMRuGY
         vVYps1YZZCcWOms4EvAJRJoenvhIlfhfYFeihIEqfNrHZmBpWec471xXSj4qRUIJEiDs
         a/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349687; x=1793954487;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UrLH7U2TwTbVq0Prf1EZK1OLwkqGxJZQmo/JtOYxWHw=;
        b=S77BxFRZ30/Z9rMtcLVBRfMrrTyg6krA6W7rpg1zD0iST3VrWls3PbEEhbbbE9YmLt
         JgDVvs9jQhCkhdgEGs7w13dfpIP5O/pkkJLDZYoUTYYis2ZteKQk2XYIxocYiayrz9CB
         TyGUI1BCcWVruue1Hotk6ppl5btHtsg67PTMhhJwqc4VenDSHUSSIS+rY3lmwY32jkuJ
         X9PI+v2aUWhSjjvzQ37Tup8UOrFF0E5T1Jj+s+Pp0DyGMMM8muAg+dRTa514KE11comS
         H5NJPiO4/9fjs8vCa1gq6sLVJzFFj8euEvGU3UuOKDVEub8A+z7DORqSRJz+ZLVLkIeU
         h1Yg==
X-Forwarded-Encrypted: i=1; AKwUvBzYuDt+Xfy/EA7ZqaIAdFrZ4YrDnU1Fw25YBfU8CS7FvcQ9A0OVVi3cjvIvn4dwwDWZb93aP+yErd8x@vger.kernel.org
X-Gm-Message-State: AFq9FYJitSFYE8AayxPmmfbXWaDUZhm12A38SqGQ9LzJazVSmO/0I0Us
	/XGsErhKVHU7HR81B4zRFz2qU7Ew+4T46lkxkNXFgO1dAJMlZyQk1N6eQ0ngldEg1WHicSF08vq
	iSY1P7N2CdevaVQuW9auae3n3UEm5ic8=
X-Gm-Gg: AYBFou3qqLTorkqw+uIga0C1tpk/CIJbIPRMB7zn+QMtLXS40B/mWRXpfIHFHT0CPHl
	GNLj6BfneKvGBVhqs36/wQsbS+m26O0/ALLZgXAoR5AYHpyqsdhtLUabxZffhX37i9nnYzVbtGD
	fQjYQuLHM5P15FZXyXDnmAWSJGBcJ150zaK5R7TmB5w4knsZFexbqPqkSN14G+3IPLeEg+0oB+J
	+8H2GAEnj3m9wT5fH/MHGyYsCVMxNaoVck7hDZ1X1VgsuLXnneINopt9s09IrQjTVSi0CulLLv+
	x3Sk5v/iqYeAINSAPuH+ouBko3464tMByR1hJW1FNX475nDnHU1R9muZjIrvrJvBRpDtfIqb9vO
	aObF3B+pKe78W5mNN0NtSqqcW5hzaPusd6oJeOl1RaaN75ttpHf8k3qmMsdXCRpyur2tFf2M=
X-Received: by 2002:a05:6102:370d:b0:7cb:cfcf:3d01 with SMTP id
 ada2fe7eead31-7d05432ac0amr1782183137.33.1793349687565; Fri, 30 Oct 2026
 01:41:27 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
 <20261029-anacapa-devlop-phase-devicetree-v10-5-26ee3cf9d9d0@gmail.com> <c78efbed-e91b-484c-b2a8-4e44383bbc30@kernel.org>
In-Reply-To: <c78efbed-e91b-484c-b2a8-4e44383bbc30@kernel.org>
From: Colin Huang <u8813345@gmail.com>
Date: Fri, 30 Oct 2026 16:41:16 +0800
X-Gm-Features: AclHuK9XCUvHE6twaUxwd5Nq_zSeUGonn6zfgdlBk1GcUoScVQ6GTN_l7KvPN_Y
Message-ID: <CAPBH0A96nFFqv4a0--OD=67w=uNkiX5qWb1aQFF9=kGVsUijRQ@mail.gmail.com>
Subject: Re: [PATCH v10 05/16] ARM: dts: aspeed: anacapa: Add eeprom device
 node for NFC adaptor board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, colin.huang2@amd.com, 
	Carl Lee <carl.lee@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B410=E6=9C=8829=
=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:43=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 29/10/2026 14:38, Colin Huang wrote:
> > From: Carl Lee <carl.lee@amd.com>
> >
> > Add eeprom device node for NFC adaptor board FRU.
> >
> > Signed-off-by: Carl Lee <carl.lee@amd.com>
>
> DCO mismatch / missing SoB. Please read submitting patches document for
> further explanation.
>

https://github.com/torvalds/linux/blob/master/Documentation/process/submitt=
ing-patches.rst#sign-your-work---the-developers-certificate-of-origin

Thanks. Krzysztof
This means I need to add my Signed-off-by to each patch, right ?

Best regards,
Colin

> Best regards,
> Krzysztof
