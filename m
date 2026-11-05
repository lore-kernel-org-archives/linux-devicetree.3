Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793877896;
	b=m+jLr7pdRKsXSJOQ73mHV1qJ/Fg68VwLEzesmyOYleJgz9ffZisVFEizAetpozC/Z4rr
	 +E0y5Lt2x9muMkTMtCzr1EVj3sKJWm7HsVVh6vwePy8AD2lBPSFzjHbl1QfVB+5lPeVnU
	 zMUNnG+gdxa1YK0lOk5FfJYznaN8FBgxOTxS2U3J9fjwx/YQOZ0udMA8BDtIcUDc3tQ3P
	 h3pytg3b/DVeNrW/AOocow4LIWYg2Dk8n2MrJmcpHXdOMKgcBf5JzSQ/VNl3muAsw1WoP
	 cJ9bExMyMPdlTuycXfgU6nWr9rNj2qcHVQQgdSIAfutGMeT+z4/zc6yiLmAIZlIrNew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HjqOLsC9Wph7UCiYV9mqAnewJ39Cf8CLpFtU3LV33mU=;
	b=EyRKomoVDFyCv62RGncNa2kFJqcBIe2I/9gHHJZef2sBCwp69t74XFqV0q4CVyA8S58Q
	 YRm06nmZeM08+W8CrYnHsDB1ka9CiREELknazOyysz30qt8e8q2RCvedF+dy9XtqG0eQX
	 Jx6ZNuXPgpgUAyb5+7GskipxZryrFwfIVqjVrIJvgbkT2n6MbClMzQAxf+Ntsr8XZjj8t
	 ghlgdilO6PXqxKXYx8QLgfWXESYuC/rILGcuyQCvhBOxrmyTAe5qBNPNx1Q3tEWTy94zM
	 H+WLKo8To9HkXWmA/l2im68UnfitOtIUKWT8rbE6stHYVE5g8IXadjr3o77GSwuNpFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CCyRuxf0;
	arc=fail smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431D4606A32F
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 11:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 431D4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CCyRuxf0
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4301e334ceso142790366b.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 03:24:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793877895; cv=none;
        d=google.com; s=arc-20260327;
        b=OW+Djbd5yG+qCAYlCqMIDvsmoHoAzAGYzOiW+zGh1sUfzvq0mhqZOU8OTmfEJB7h+U
         tbE5q/3EebHtw+rFtpdqudeqq+oOG02ySLp+GKsrkSrAeGgdt+olppv/OoTzip40/ZMR
         C0iK39aUPiMv6VBxSr/wUxS6FkoCDIjsImdL0n5b176YxTlUJrFNWk7CNdo9xrMzB/tm
         s4rOVkIUBRRZmbBaTFhIPxm/e2iO9hKBgVI4KcbKoug53ijklgjSB9tVnXT33J0UDBYH
         xHoPijaGzX1i4dCj/up6vo2xXVPLQeAbbD78Kwo5s7eEMxsOtlxmLOkjIdRWCSp+7Krg
         Uznw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HjqOLsC9Wph7UCiYV9mqAnewJ39Cf8CLpFtU3LV33mU=;
        fh=LZbZdtdHVErlTRwQJyI+Pp2q0a+BaNLrpTptaiLDUEc=;
        b=cETwgs9eAjW7T65/ZdxURhyOeyIStqkwOLixck5K8qZraJWW5sKFvO4xEdJYqW7EEF
         lZ1AS5G9IMDB5LqexKvvcq4C259fKsghFXQxED40bpBEgCqpKNIdA3CbI/z+8AymaORh
         SYWzymKtkEjfhnl0LfFDjgO8OSIN+w2hzJ1bSUb+8dbQiT6ThG2/x7cu0ksoKAXhpZuo
         481eAi1CRcTX4rOfYRGJnZH9yT5/rojBos+mbfpY4Ml1D0ROOLF/hmDuNAj+pd0om+Xk
         JX/8AgxH3UOzKB8cGyhjQ57PPiewdLC55A2I2bpx9otzsSO8EMAL4uBdv8+scTPoceCa
         eNMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793877895; x=1794482695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HjqOLsC9Wph7UCiYV9mqAnewJ39Cf8CLpFtU3LV33mU=;
        b=CCyRuxf0P6J6k8bWApFVRzmmmQ4a3nezFhlH23PgLEzGEftofIdTYht54rkMPSxqZ2
         /N6dWyeLvZ3t5ckDi74aRNo2yvUplMuzeF87p+SrRLFswIheQK11EAMfgONQoUmsEnEe
         ak3lTmUJPNYDs7n+W3y+FrnQqNLfaVlgsCS7/AoEJSXFGJS/uoo6dTu0piEUOcSwoNXy
         qSQc4qOwI5/lBCfCziXhsnKcQriiZn1/LpLXFBVGVCBa5Nm1lMvs3nCLwfOv1t+ObDwv
         66A1hJWg9khNx60mm6v/I6sK000uQTULOFdYaXulbZrAc/k9t8/TzBP4LYJIO4G33uyO
         snLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877895; x=1794482695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HjqOLsC9Wph7UCiYV9mqAnewJ39Cf8CLpFtU3LV33mU=;
        b=HGSP3nHelHWUOINE3xlCtLC2Efh6f0cncNCG9prd2w5MPguDbQj4dhmzz8agHtW7NO
         a0lptNQ33wSQIxhaNMM6UQQKL4m5ofru2CjDAs9634hKpomFfXaWpY0aBf7YjL6Xzdql
         4foZm5VKufnp0aix9DU0T7M7Qg5Po7ciYrybOM+3qEHQpGLfS6I0q2X0NeK+w1CaDXQ5
         161wzCofGs4QxhfGWQecagtwNSCmlX8Eyt7Yq7iiATsQYWFfhSp4Se3yIdnVsuKFwVVG
         QXw1drHYQPHE97dYNnaQ5VCQzcEO0Y0pY+Lx7NuR92Cdvnf+5aq6pSC48Slv4PJNdFCG
         6MrQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4yapuMj1rL6Qf1QBN1YYjTeSPTVBMi5xwCTab8xasY+Fr8ursQ41juizzLdPRIcyRM35oLpQWo+oh@vger.kernel.org
X-Gm-Message-State: APuU4Z874t5THyuYGlWCmJBs4Rc6y5899jH2ZOvN6h0FwsRtPHkVUEKA
	P438Y6P8aTogyj2Rcgtd+MGb3cA0hIw9GIKT/ThpyJeoe4HD7ob62rSso/Ve5MZ4N/nGXSv6tcY
	6i7UC+Ju28M8DTw1oF5YyMHrjiCL3twg=
X-Gm-Gg: AYBFou1klEYzB5WrtbKayLfHKZU8UaycsjmDFszYQA4REsFxEp42waTT6bnrcVEFZv0
	1Sccz12He3YLhlncKZr2qmzrorgFY5ZICQGMrimojAJrYLB5l2doNKGaTMqSClVeN5mqli1X9Pq
	S6r2y791gm27kG5uAVAMeSaioFCJQvEv1pyKQk2sv5rV3rYbnC9RS2SfH+W7HJpQVSC5ssIaE9f
	BEm7WT4VcDcoy9r19U2r2evSFgR/UPMzjONumVO03YGcw8UMfgSAPtMfW9Dpc+cJ+mgcTzCxNgV
	0ZWF0QlFchKbFXMShtiJARgOrpnlth9r/NefCBYfkwkzAZoURLWPQBi5+XV7+wuxAnMWMoOYsqv
	4U3BbrwYCZhVxvUuOClh9f/aqeiI1uhMPw3NOFmHQkHik+7SYexFIxiBbHDk39CENVbD/sBnd4u
	pXMGNgfvczC0yVoo+uTBNtFKcY40X73OfgErsv4CKF8UeY/qUNFqzgy9HmNgs0KaCYQraji4Zru
	6W2tEN3TOP2ZNZaTJ2Ut0OeC0mTeXJPIjMCPo8S+5XzNftUd0Sg1HwlRRJwEw==
X-Received: by 2002:a17:907:6d20:b0:c46:75e7:25af with SMTP id
 a640c23a62f3a-c4ca7a0dcb0mr1704269766b.11.1793877894389; Thu, 05 Nov 2026
 03:24:54 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793876837.git.alx@kernel.org>
In-Reply-To: <cover.1793876837.git.alx@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Nov 2026 13:24:18 +0200
X-Gm-Features: AclHuK8KWMbqNnaK7YSgn2BAcqklpjMSStieDr0-B_LC0DeuPxzb2lhrGJOckGM
Message-ID: <CAHp75VdFH146fNhw1ysUbgCPbpv+K++kWvbyZxU=V7tDh0T88Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Add strprefix() and fix a bug with it
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-hardening@vger.kernel.org, alx+linux-hardening@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Andreas Schwab <schwab@linux-m68k.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Daniel Scally <djrscally@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi <zanussi@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:13=E2=80=AFPM Alejandro Colomar <alx@kernel.org> w=
rote:
>
> str_has_prefix() is based on sizes and lengths, which means it must
> overload the valid length 0 to mean not found.  This is a typical
> consequence of choosing to design an API around sizes and lengths, and
> vanishes when moving to pointer-based similar APIs.
>
> This patch set adds strprefix(), deprecates str_has_prefix(), and uses
> strprefix() in one place to fix a bug reported by Bartosz.
>
> We can later work on replacing the other uses of str_has_prefix(), which
> might hide similar bugs.
>
> Testing
> ~~~~~~~
>
> I've built this patch set with 'allmodconfig'.  I've not run the
> resulting kernel, though.

No, all lib/ new code should be accompanied with new (Kunit) test
cases. Update the respective lib/tests/* for that or if not yet
converted to Kunit something in lib/*test*.c

--=20
With Best Regards,
Andy Shevchenko
