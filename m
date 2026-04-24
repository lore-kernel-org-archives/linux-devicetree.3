Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C3E3988F1
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777029372; cv=pass; b=cfcv/HRvgODJQpbS9oGxJoXzhRhHNmLElFbeRcDvbWTK5w2O5JORLfUaVfHVOISaZqn4GmdtNHdBuV0D3G/pG7QoRj7/ynzOWOBbmZ1Jp6Q61Q54osl5K5+6vl9HKLvCCGa9J2NebJSwDwwy8Uq2L9MgX8D1zaG1CDbNFSD9KL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777029372; c=relaxed/simple;
	bh=8x3oebu+oE40KJMshCrqe57blbNIscndrrsFJc9aK88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AmilPi6j6kDOtgXaL72Q4FauftM8AiFuOKF4gqlFoWl1WjpYzwaVEXwN2P4Rj0PoVrGI+ZHBtK8wZ1s7P2DGkAe47GSfiyfPhXBcAjnl5XYo1i0ZftRRlZYGSqdAQEdIEYKgzTSTz5UQZTYoZkCoOs1GormUrIIfu6+M7fedKVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YWIDGSMM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KWTJCc37; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YWIDGSMM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KWTJCc37"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777029367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qcy3clHMCrwUtAc811xG19ukkdJceKCVJ+PVL1fCJeM=;
	b=YWIDGSMMhzcez/6NLx7reOgZn8NmQWZ9J5vsETMQnRbv3EL2iaBhDrfUKZEmDTr6r8YGar
	KCTs9TqezW+uN4FR+5HfCe/Ueo1sJigbNUtGKy5+FFBNjrGiTOPPMSl3j4pV2pupxPNpc5
	Pfi9VX2FJeNaXAbZYaePkBLzU65jp00=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-ICwh3LFyOH6hWbLjDxkQMQ-1; Fri, 24 Apr 2026 07:16:01 -0400
X-MC-Unique: ICwh3LFyOH6hWbLjDxkQMQ-1
X-Mimecast-MFC-AGG-ID: ICwh3LFyOH6hWbLjDxkQMQ_1777029360
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ba70e65b632so591171366b.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 04:16:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777029360; cv=none;
        d=google.com; s=arc-20240605;
        b=Tq0/LecuymfEaWyzNZG+EuvjNIYZaBrJAW8V0wDGEqV4X93W4wWDHWS3Q3D0g7RMH7
         rwOxmisY1rJ41qgjtCLqVrhBFTxZG7z9NWHEzZdkfNlJwvvokFHxUBZ80byHk+6Y2866
         ywqk5jQMD5v/1St0XjSluK7orije62XoRiupHQl290Svb6LvbTEOhYW+lHx1VNzVLaH9
         8H5UBj5vqicgz5sCQo8lZETWAqD7vjTLJWrSLTY+SFsf/9NvFSNqYWK1+/Led64AdsBU
         45Gpc8oDFKom9MUrWbEsk/65qG0go+gIyZ/yRGhSpC35w+UQ6hvmaGyGLH633xV/YS2S
         A6rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qcy3clHMCrwUtAc811xG19ukkdJceKCVJ+PVL1fCJeM=;
        fh=0men/N17fvCKgmOs4TzjBI2z9TcI59jg0sy2LYtnzRY=;
        b=byQjOkjesFcp+q26NzNQeq2G3OiCH+3kC5T2SPVP+7HAWxY/QFz+3tqYaUwxEGYVA1
         IJTohMZ+oXwR7/OVD+lOc9J7mK2XP9LU8KUPAXLke9K87L1AzoUzWiw3sVGed+c/l4C2
         l5Q9U1i4JbPEOk6Z1awG+qbi4LxxUVbwuzVcOQWltvsx+mGi2t1gglUcWNusoY5z/47G
         ojAzIFyJ8qB2GUEJDLbjl7AJvbwkjluOIGkIXH2+xJophOZmP/QKuWRu1Zs0gbpbSj2g
         YpkF9YVNcXD39DY4nBtJXCfcuo04F4VaLLYUlUVE0jhE5YCzS40WTxvGW64qH88sSBKU
         f6iQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777029360; x=1777634160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcy3clHMCrwUtAc811xG19ukkdJceKCVJ+PVL1fCJeM=;
        b=KWTJCc37sHDaTtlajEi+MNePehukISK2GtqaugRsKjGTlAon3sgaknKky9/gnRKAis
         uSzwxhEgrvTXe1pgp18K3T7RMxwuATFsQCrp103IlQmXRWqjQRXTczw1UoetG2hnNW2A
         kbunaXQCWue6w5cLpCIb+2yT42wTMlsIyhvMgOnxAfwK5zBZp7lwxvoU1XpQv7o8NjgC
         YdsAYb7rq5vt4Zxlqa4MGBrS/0Q5uG35xhKCTj0HjN7oz33batIMsKS0sa6BQ6oHrTny
         DH9Bp63DWywJ4DUNcFBZZG2JEoubF6m3uEeG311IR0wKmODJHEvzc6UvDOOJb2WIkmfC
         O80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777029360; x=1777634160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qcy3clHMCrwUtAc811xG19ukkdJceKCVJ+PVL1fCJeM=;
        b=PF0kwvYFOqcdbkba0KHsjI30/EBJpl+Lndq4C42DuBrXrqIBej9kCLDdYHXAotETv7
         5Ug9uf1wuVs8GdZyPIfrh4/cAdA7KVes2xVQYoujHVAIrDiR30bfYu+3rvemTGROMNQY
         8zgXf7i+/pXnhdZ1NunEt+gL47s99OLKxM2Qi72kRSz89iLeQ5y0ur/qWvqTOnFSfDOI
         iSnMRmK5peYrSkiMra5mO1eEgTtl6yEH1pW8qjYk2bHWCrysg5BU3Pgy9h7nF+wpU69e
         yvfEAMM/ZjIaKhmwvz5ZPH9iHXWAr5hhpo5pbc9RrC8GqgyepA4/GIECxCLOa+/iqalz
         sDJg==
X-Forwarded-Encrypted: i=1; AFNElJ/RAxel8UK6/JD+y8p+xpDqv5pPW/URClta82cJmUIUvd3TymAX92B1oRkDusTDIITVLH4lVZJTQTJQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxyXlQ8Md1CJ8GbtBP5vMREFq7ra3nc5Aj3pXXA9+zVjNNCapUL
	BzFvdZV7nUJx5OzBnfvv66/ZC4TDCOrqnQHk96dsVVjyOw0/TmzmrgLvHXgPLpb4uy8/PuNVCZi
	smrSJFjTjenl8xDxv3fihj/Qrjoh0fLPJVcKgJbXMMwCAkpS3NG0VtrrQnVWsEk0N8tPk5PwitR
	sdwrQSSxqqoHeEzNXyl0xuz3j3YGZ+A7oqcj+PdA==
X-Gm-Gg: AeBDievSQRUO01DgG9t4SH6FrrHstWbsXzSA9QLqNUP98k9Hj8x2y+7U4CYjLS15X6k
	r32pc2sPdZAgPas9HKlWPkrxQWoPouhd5HTbXzxr0XrFExUm8Wx53uavtslesVw3PSAcoNgbQhx
	gcvrKv2ahjKE0slkzEsicnLJ7H2izH0w8nEM8Qq2qvuMHeee7G5B1IxsJTiCsLzBUK8+wdwMhvs
	M9RG7nVhkOM8aHp
X-Received: by 2002:a17:907:3e1b:b0:baa:a2be:9e02 with SMTP id a640c23a62f3a-baaa2be9e2emr641859266b.40.1777029359862;
        Fri, 24 Apr 2026 04:15:59 -0700 (PDT)
X-Received: by 2002:a17:907:3e1b:b0:baa:a2be:9e02 with SMTP id
 a640c23a62f3a-baaa2be9e2emr641856166b.40.1777029359275; Fri, 24 Apr 2026
 04:15:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423090904.2108-1-dongxuyang@eswincomputing.com>
 <20260423091114.2326-1-dongxuyang@eswincomputing.com> <aeo8nn-eigzlojWx@redhat.com>
 <4e5c887.5a31.19dbf179fb6.Coremail.dongxuyang@eswincomputing.com>
In-Reply-To: <4e5c887.5a31.19dbf179fb6.Coremail.dongxuyang@eswincomputing.com>
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 24 Apr 2026 07:15:46 -0400
X-Gm-Features: AQROBzDbbAKQ36enGu7QXLeYwGnkY_bALu5GjQHHObQNk1TD8TjHuFQuvJQVzQU
Message-ID: <CABx5tqK7p_XJHfXZ70gXhR88PzAteV7cVSFPoRzccgmjanADMw@mail.gmail.com>
Subject: Re: Re: [PATCH v3 2/3] clk: eswin: Add eic7700 HSP clock driver
To: Xuyang Dong <dongxuyang@eswincomputing.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	p.zabel@pengutronix.de, huangyifeng@eswincomputing.com, 
	benoit.monin@bootlin.com, ningyu@eswincomputing.com, 
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 6:45=E2=80=AFAM Xuyang Dong
<dongxuyang@eswincomputing.com> wrote:
> Thanks for the feedback. I did some research based on your comments.
>
> lock_ctx is a local variable declared inside the function body. It is not
> in scope at the attribute site. The attribute expands to
> __attribute__((acquire_capability(lock_ctx->lock))), and since lock_ctx
> doesn't exist at the declaration point, clang's analysis cannot resolve i=
t
> and silently drops the annotation. That's why you see no warnings from
> make C=3D2 or -Wthread-safety.
>
> Why -Wthread-safety produces no output
> Two reasons:
>   1. The lock_ctx->lock expression is unresolvable at the attribute site,
>   so clang drops the annotation silently =E2=80=94 no acquire/release tra=
cking,
>   no warnings.
>   2. Even if the expression were resolvable, spinlock_t in this driver is
>   a plain pointer field (spinlock_t *lock) accessed through a void *
>   callback =E2=80=94 the analysis can't track lock state through that ind=
irection.
>
> The closest correct expression would be:
> __acquires(((struct eic7700_hsp_regmap_lock *)arg)->lock)
> But that also won't work: arg is void *, and clang's thread-safety
> analysis is type-based. It can't trace through a void pointer cast to
> determine which spinlock_t instance is being acquired. The analysis
> would still silently ignore it.
>
> For void * regmap callbacks, there is no clean way to make __acquires()
> work, because the lock is always hidden behind the opaque pointer.
> The annotations should be dropped.
>
> Based on the above analysis, I suggest removing the annotations entirely.
> However, I'd like to hear your thoughts on this approach.

I agree to remove the annotations. Before you post a new version,
let's let this series sit out on the list for a week or two, and see
if anyone else replies with the proper way to do this.

Brian

