Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBE9426697
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786439889; cv=pass; b=AXp56doyktjG15m9PI2Z7SP+Bz8payT+jLhjKDvtDztikhC5y5ut8pdBINZyeDdQ4hJKEDF2l9GJuoLHUmDFf1HY3cQYKAE3CfeDbS+iQSwnN4959r28EGXzdsSNBP8nLZC5Da0wiXBH9q+Sa8Jrh0Ia4JhRw6hzGC958KDATME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786439889; c=relaxed/simple;
	bh=E/WyVaXEm1ailWzhDmRZTqHbF+V/Ukp1mPzzzzdLyhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f4vkXVGJE5no+CRjqCc/ER04PRSzMzNH6hIvQ/Htv+k5s2FfAsJsOr3Mtu8TeKcg2Xg/gh7rnNzmeNLnQPEhgBliVDi0BwAlWpC+lyjuo3QFHyD/RPFFe0Y4GUeg0lVq6Zk6gA7eNuBHZpUt/iZUipSBBjgh6Pr0SLmKNd7KGOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfrB8tTy; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfrB8tTy"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a0de062db5so4339156a12.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:18:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786439886; cv=none;
        d=google.com; s=arc-20260327;
        b=Qo7cqGWKLpM7Z/q94oQGwl7DXCD8VMkTpViJNeBjPeB7FhqxMDsYwSPTjlaDsqw/mN
         ws2tgdIZ7BminLIP8wZAmbTLIDXfrJ5zXic42JYENAoseQhDljOXONSHq8kuEPPZqlKX
         hFbtYmlbt+L8Z5CkgtbjzKeTEN/25iCV8LRznSs/OIvHWZnfooTA3x8YOvhKZYXN8OOq
         lqcwqnfiY/5ScH4asyBgb6I7JVgY1jAtx6SOmNQ2y1/OuvkOZy4cCNsd3go4uXt7wT66
         UgFUDZ8lRwmQJou0thnRLJC+rFZsrTt/0CpzAw16SqjwgwPgr4tQKM2mMEtSW5LQEgpd
         Lagg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CR3U/yiugfUHE/SGbfVSIlqA46S1Ci8v6SrB7L5PEvY=;
        fh=BpqXm826VbFp0/vxEJn454+ubE6v3gi7+Ovr+li804c=;
        b=RVWXx9PhIe2u9SHJxU+e6vW+Srh2RzSx13qb3aMkhGzZuMpJGKls6mseupMGUT0bes
         yeRPnoMtjXrjTfL9W9A9KINzbsnok3FN3J77WgNwe9Wr4w5f+wHTv08ungzBw+nfiT5J
         z2sUyhj5jW6CsEReqw5p6oKtqN+6qp4AP5pq330WjcyCWa6Ro0K3wjUysh7MuAErcE0/
         89Ar5uiuSxnoVofLH9YoVWuhNBt+apmL38MrQ5kKfNeA2HFt2D441ub4l5x/ZGGCFeGz
         /LdF3N/63renIKIthYovJ6vHejJk+zi8AQSeiW6pb/rJ4wm/+FTlT82x8RvblX5HhrfU
         uXMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786439886; x=1787044686; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CR3U/yiugfUHE/SGbfVSIlqA46S1Ci8v6SrB7L5PEvY=;
        b=XfrB8tTyaVf7C7RwFXFEt1dyp9srn9HyPKKrLNu8lptL5AySFSghZbI7c6P0/MK+WA
         fwgixr6MUPGiF/ma/RVePr7Q775mn/Q3h86pxpWtCLRVV+L730mG7zvPpVem9RNsvbd2
         THC6n6g7QEFfEe2s6Bev4mSmF0LyPEM7OW2HKK+BoJesylo7+YS5Lhn/Ak8tq29XuDny
         kVvHthsEFoYnOqZ7u940ktzA0fBxncyKLkZxsPAwhOja97tuuLvl18AQwsZWOaL/I2pJ
         cdKiJ7W5fhch5q0jrzgCSHlT8qgLwP1deqa/EkEX2wESVK8Du/sEpsk0tjerQZHR2iUf
         TQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786439886; x=1787044686;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CR3U/yiugfUHE/SGbfVSIlqA46S1Ci8v6SrB7L5PEvY=;
        b=C5LTogbaX1FkingGPcVLX4P/R1vXwkA8z+uSG8SuvMR2G6SY0yHU4ExlI1PQzN1+WB
         4FGqL0Y232SAkIYk6l4rhHBj7clsOGpb64uEDmMN9chQZkJweZtKsorIlYKj4EIP3DIR
         DGCvoDv3P5RykmAdgO3KuTXf4xiJy4N1XCv/c62m+WJ8K1nsYtAoZa1P2Er2sHT/Boko
         clQpdSj9jer1ZV/byD4kFb87YKXkndulkpv8TGAG0mok5Uzi+1qmvkNvD92DAsbE2pt4
         CawvuGHRzvVpaqXRcUk5IygvUI3xvGi4GWYfMOnix7Dlm1MTYOuL9jVlNV1v+yhVx9TH
         d1gg==
X-Forwarded-Encrypted: i=1; AHgh+RpfTeaETYN82TtOa+s4LzoL5cK8l5nit0IXIHpAQsdM0OG/Z+U+cHNXBxiZmg2J3DVP3ajwJrJn4bLQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwHINfEL2CjQGJQGb7pHnQxwb2Q6NRlj5JWB8YgBkRRlxj67rSr
	qcDznVJP5Z7ZqWqFMtC7xgBo98hhP7wx1IqoGuXkiQZaaCYHhGLy80PRzfbSKpq9Kv35bK6TVIB
	AeI6DFCMTHfE06BMC0hOulGkH8cReuos=
X-Gm-Gg: AR+sD12GjVnimQa+ZtNXrH6YMeDSUT7ITd/EuOl2gI4GK/NucBuXlMJahM1sT+VYV5S
	8ZFHoR9h5e3lotwoVv/TAR9zgA5d9yYFtqD4EgrcU2AkqfXypLYlky7EHKPVQRlec1erkwcjJgq
	XVojXZqARXqxMQDbtdz/7fNHe0add7ByCa+Ztqp2y8dBLJySDfaRclRjSG5KXsxOSTL8DSRjJ0Q
	M9kc3E46vEnukVWN5UeKviQsEvFl537wnhhu1hHy2qw14n9zhspllXILwxZuK6PGzj5rflwhnVx
	NwlrvVJTGlRIjNGeOS2+qdf5/ey9Ku5tuLQNtspp8LurGgiuOXnKmBUk78BCBGDwbi9gvij4juv
	bh7vqa+gIoRFj+HC5vUD3ObBCLhwVybl0xsC70Oqcw3La1Jd7s/xthTnkAsoIGMwCWP/SE+zuou
	/Bd7dXnoirnGWsS3ZBO6DLVDr5L7hmiKdQAf4E
X-Received: by 2002:a05:6402:e96:b0:698:351c:979c with SMTP id
 4fb4d7f45d1cf-6a364481563mr1065145a12.2.1786439885525; Tue, 11 Aug 2026
 02:18:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-submit-ac200-mfd-v6-0-c5b1292c8498@gmail.com>
 <20260811-submit-ac200-mfd-v6-2-c5b1292c8498@gmail.com> <159b4ed3-3718-4563-badd-3627bc51a41b@app.fastmail.com>
In-Reply-To: <159b4ed3-3718-4563-badd-3627bc51a41b@app.fastmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Aug 2026 03:17:52 -0600
X-Gm-Features: AUfX_mzC4JSTAlnl1EzMlisJQ715ApqdEvoqRN3H1IkIyZEOTQ7rFyRKrkMcin8
Message-ID: <CADvTj4qUEA-ccFj0cSQgHb8+0jB4m6tcpsZZwveZhC_RE8w9vA@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] mfd: syscon: Add managed registration for external regmaps
To: Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 2:47=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Tue, Aug 11, 2026, at 10:27, James Hilliard wrote:
> > of_syscon_register_regmap() publishes an externally owned regmap in the
> > global syscon list, but provides no way for a removable driver to
> > withdraw it. Registering a devm-managed regmap from such a driver would
> > therefore leave a stale pointer after unbind.
> >
> > Factor external registration through an internal helper and add
> > devm_of_syscon_register_regmap(). The managed action removes the entry
> > under the syscon list lock before later devres actions release the
> > regmap. Hold a device-node reference for the lifetime of every
> > externally registered entry so its lookup key also remains valid.
> >
> > Consumers of a removable provider remain responsible for ordering
> > teardown, for example with a managed device link.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> Hi James,
>
> I don't think this is the right way to do it. As far as I can tell,
> the device you have here is a generic mfd that uses a regmap, which
> is not the same thing we usually call a syscon.
>
> The of_syscon_register_regmap() code path was added specifically
> for chips that have a traditional syscon but depending on the
> firmware may have to access this by some other means. This is
> already stretching the definition of syscon. I don't think we
> should take this further and allow normal device drivers like
> yours to register through the syscon framework.

This was suggested to me by Andrew:
https://lore.kernel.org/all/c78c2c35-52e7-4393-9714-06039d8a3f28@lunn.ch/

> Since you already have a top-level mfd device here, just use
> that to pass the regmap to the child devices like we do for
> other mfd drivers. You can e.g. do this when populating the child
> devices through platform_data, or get the pointer from the
> parent drvdata.

The EPHY is not an MFD-created platform child. Phylib enumerates it as a
struct phy_device on the SoC MDIO bus, so its device parent is the
struct mii_bus rather than the AC200 I2C device. It therefore cannot
directly obtain the AC200 regmap through parent drvdata or MFD child
platform data.

Here's how I was doing it previously:
https://lore.kernel.org/all/20260806-submit-acx00-of-dynamic-v1-v4-2-9bf2f7=
441632@gmail.com/

>
>      Arnd
