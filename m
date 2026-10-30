Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364617;
	b=hkrJQQVbwLqOHJymUPUi8W3vnPkeRkxeVjxHwG6eRCMkm5c+wZ8lQ4GL/g+spRB/ZZqH
	 qPBCOUGx5n7s/z5+PkrMSf1Cejdh4diw5wTQN2/riRh+xSFQsh0toLgzwES4ForieXp7j
	 iBTp5Zmr2Bx3t2/7CGNsoXMJGErqZGGTFD6NCC7yWCxkWL6O+fOmThGzjav0ooDEvG9EZ
	 xQz5y2GLLxlBKifWl39p14JCbzwv3CaaAB4cXy8ieKBQX7+kK3eNaIIIjVsGtnoGZJcxl
	 cGNq1BzVl3BSFBj5FJOvBZ808bHJLyTmLS4syqcIY8YyMj88dI8af84KqS+fL2fVBuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=gNYOrR5qdv0o/uUnKlELAosZIQN5bxvKJl1b8/vDtfc=;
	b=aKy33i0gg4wQEGxQZtGKLb8783SfOz1qKZvS3Bau8M7hnfIKL8+mVwxj+Be4o8w6IzgS
	 8IQyApr2VLek8+XuVCIDQwyYIXOgWXIr3QRFAid65V1oPc7b4lsG1X5IXLjQLoQrui8rX
	 siDtqiHF5/QuFXtRhVKQdyhFf25+mlyZc2wNCgZpkG10b2upO7rHjadcWcAu/hiwYkV2x
	 PP3jbx4XmAXmI3sM1N/iN7V06r36+OLC12Wmx9v+/1MzhN0gngEFbvG31k+RD+DduTEKj
	 zd3iFyak9pRxio3YiQipdudpjuA12Za2ROCOc/ngbN5h9WDLyjdJUZI2o4VRhacVoow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TzCiSuTo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92949606A31E
	for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92949606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TzCiSuTo
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so963557a12.2
        for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:50:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364615; cv=none;
        d=google.com; s=arc-20260327;
        b=azRHmwbaEpefymi5kiThkYk0L0dsXbAO5jTbWia001ZlIm19Zbe1CEl5pq8kfUsen6
         wTScVgKV95Vp2l6a6kmmfrhzJiL+qCLxCfoRujEdxSa60bk0LtfxPwlctk7wRmONAWq4
         JiKjw+t75+XMDm6YpbQDy22DSmognjpz4ZI8aklpcyvz3s2Vv1tNEl0tyFoxBylydl1l
         sGbSNXUgqDPRvH69Ld/nwCQNsFR+hxkF8PJezPq2nzuq2Q+RwR2chPle6azye0lftCqF
         3GDIb6PJyMG2H8lC33GGXThxtTSoVoJI1QIo6sPHNhcVaF91c4ruGdHD/EghUCO1nZ9E
         BSLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=gNYOrR5qdv0o/uUnKlELAosZIQN5bxvKJl1b8/vDtfc=;
        fh=HsYcYwLHJwjAtFfqvA3waijpYezQanR1gSbSFKH3bNw=;
        b=Ub46mDixkahb7XBnoSa+5WjwXwE9R6YsT/iK7QVv6ljF5sI+09rEoyj5JElseMgxbm
         1kN8Ub03TSOqE4eM16eqH1yPsxLlAGrzl17FIpedf1pKIikMuiepwQws3PtUxeAiffP3
         TPZlfceoIh/iB/4XrWGvKiRv6X+dsDr3eB7eKTyfKcQFapwfr/io6enQ5+HvkK749s70
         maVhgY5ujHcIkgbHXtyt/+aKBTldXHSXsk1UvHnZnzRPrjv+PLHzR0RV2yqcLXGhmSEz
         QcRb92pHb4mUrmSrKjC64lLuW0dnQPMs8+ELT/y+1ZSXOi+JcHAxk0Wuq6SXDZKs+cD/
         4EIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364615; x=1793969415; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gNYOrR5qdv0o/uUnKlELAosZIQN5bxvKJl1b8/vDtfc=;
        b=TzCiSuToJkR7BCFedxtyLeiDz71h+eYNxYR7HpKJ0TmSc/1+iX8nAVnXW13Bu5xBaV
         pgR+LGdFa63l1pAbtG/WsZoHQKmZTw95ahfWxE1wOa2Rxsdc4cnFWbhBRZxUFHxJ74xK
         D1Tr2CGY6l/uuFpN+YFijxZv6Vfhr+f/7Gj3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364615; x=1793969415;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gNYOrR5qdv0o/uUnKlELAosZIQN5bxvKJl1b8/vDtfc=;
        b=RqvpxNj2iMnJRuX5kGWaoV0ihrz4/3uu4DsdQfSGpE+dRlQ1AUlNA0soAi+fHAk6Wr
         gER9GQ42Tngx6+azO6c3guxJndL8lJ6e/H0P61SV9ZqrslWzEMMhaSkM3a0W17NTr8An
         49iJcaMrCjvNqlePtgbiZ2/hWon2eitIwqIhWIu8NLgdodW/PiavE3zdaTNuEWD18c3A
         PvVARcgApLhP3L/UYt88h/KcgHq30XUhb4NVQwM/jj1MB09MQzFYQnm63wBk9UoFksfF
         Cq7sOZXPaZay2xgcSGZONGa0FrRCxxm2p2yOtGW41IXw2QaGV1ksyDavA8OMPDjHBzez
         GaAw==
X-Forwarded-Encrypted: i=1; AKwUvByjujuwZ1c8VVy0IUWo/9p3hOKpMmuepVLU857r/HOt4LTPCDuwXvd/0sRIZMKDepIxIl+QL5gdezDi@vger.kernel.org
X-Gm-Message-State: AFq9FYJr0IoYCHp1dIQD9mHdb3aUPdYp8QG8w8bdZEY30U2ISy5OY4s5
	EVmNuhB7k3C1yxsxig2ExVh5uWsVAzEaPb8b9rWha/vZ4x9UZQ9yKoXINvqHol8RHEc3zHMwnRj
	zKpbWxAQ39MY9Ifbq+93GbdqXUlIHuXuJ1GjaoWB5NhRivFUAZX7NhQ==
X-Gm-Gg: AYBFou1570LoOZXuRPyOITdi7yeWiA7fIkF5dHdOWPz4l34W7xL0+ume47uAuN2TkmQ
	K31NOCCHxBLY+Xzhsr46OySaYjJeilgDBBld9MwpUPpAZiRJe2w0/S0KVozPygmnCBHsrKIiwNh
	NdvWock33OP8OibKGCmCFUM89TBTbglA171y3XbLuLyBc91EEEmhdN7cGUjKPjWETYjfOybie4/
	F+BVG7bAEz3zrfkNZc/uW3TDJA/Q2/Der850o7et5TTeQ22wtGndBu/k/rtqIxpZwDD5aoh5obU
	uoaRQD8dsQaTRSQIun9++y38g2oYvAwu3qWOYqGWRzUdHoCUE8ndSw1YLeNDixhlF4YB3/vg+nf
	jmB15suMMrwLZ33JLiVpxOvjcwB3YlO7f5PvrhX78I/23bOAF0vup1Ft1UGKveyiaLkZfws1N
X-Received: by 2002:a05:6402:44c8:b0:6b1:e87d:5b60 with SMTP id
 4fb4d7f45d1cf-6b4d4686cc2mr1282015a12.15.1793364615011; Fri, 30 Oct 2026
 05:50:15 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 07:50:13 -0500
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 01:16:35 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-2-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-2-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 07:50:13 -0500
X-Gm-Features: AclHuK_ccuMwNBYpkeGQ2k0lCJMfFrklKr-EXRp2KSyxEboedXPDgWFhQQBhEOc
Message-ID: <CAFLszTg9hB_YiBAjFKv-oKw-c3iNB+sANwqf-eZhot=JrQBupw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] pylibfdt: Fix FdtSw.as_fdt() when buffer is
 nearly full
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	David Gibson <david@gibson.dropbear.id.au>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On 2026-10-28T21:46:49, Douglas Anderson <dianders@chromium.org> wrote:
> pylibfdt: Fix FdtSw.as_fdt() when buffer is nearly full
>
> `FdtSw.as_fdt()` calls `fdt_finish()` on a copy of `self._fdt` without
> using `self.check_space()`. Because `fdt_finish()` appends the 4-byte
> `FDT_END` token, `as_fdt()` raises `FdtException(FDT_ERR_NOSPACE)` if
> fewer than 4 bytes of free space remain in `self._fdt` after the final
> `end_node()`.
>
> Wrap `fdt_finish()` in a `while self.check_space(fdt_finish(fdtsw)):`
> loop so `FdtSw.as_fdt()` automatically resizes the buffer when needed,
> matching the rest of `FdtSw`'s methods.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  pylibfdt/libfdt.i       | 3 ++-
>  tests/pylibfdt_tests.py | 8 ++++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
