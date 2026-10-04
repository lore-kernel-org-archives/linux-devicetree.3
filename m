Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4471647D94E
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 19:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791141696; cv=pass; b=O/sbVQjTSIEASYMJgVvU/HuZDTMdLbqJyMCRGh0gcIus2dUNqHuo0eFWHFi3yIyfPb+BWxB6I/c/quvHfr8Rpxp+Dl+W4UhIE+zqe2a5xzcR0TjpstphqaDFyGiNgNiPbgZl+kafJv2NJthSsAseRWW/ZwJvxRsAR+BEosw7N2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791141696; c=relaxed/simple;
	bh=anqUzSCvMyf6ofquk9+HHp9dh9/UXqbFF9xnCdBnaC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BLciS08lkQKL8jCP1VYTwmBbiW98zESQenfi7LanlJYonlZFKknfrWbM8e0rbzWs9O2oOjkCbze+I9hvF7azrGy47dGXO65PqYpX+EiIfL1xZvkI43RZttnn6yKMr+jM3Br23gxiu1zO3s2bF4c4cAuAHqtg/UlQzemEtP4/nsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p8Yr5/gy; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p8Yr5/gy"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2e62319cfaso91645066b.2
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 12:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791141693; cv=none;
        d=google.com; s=arc-20260327;
        b=mh8DXVVXptE+Bu7MI3E4Jx6W4rxLccEwci7Jtv2mFj1613bVMsc5vjCamTvgWezahH
         lxG37HB4BquCaqyRbCVhULwWFKfV1nZvQG+lPT+DRxVm9sLgH+O5UiTCHtmVtqzcknjD
         SrE7UiYw50C7grqSNIoJVUzPae/fIHE6Uo59abAFStZER9Fge6PAxpoK6RnHGGrv3Mi3
         T3f5avg+gj0Dgeu3OTxI0N1e5fVK/zq3blFL+e/QvAXh77P9E5kbmOlCCI/WIUV5XRux
         mb7IzBLNjdtM4xyM4bYR2OhAkNejEh60Ri5RurTZYzho+kZISUFwO0yhE8rhLL02errQ
         Te/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F0NMA3u5MDg6GtkZkDHPBKXcFteg2lEcZn/vhtwGh+k=;
        fh=AynSaa2yIdug2zlzUhrbg6uqMyh2vYW89ixvdJ0Ycnc=;
        b=T7svH0PI5Eh1qP8mFxZWjSXNv1/UArbrG30DLTUpx74rSLNTVtK8gq7TMCIvlKf8eo
         zX4BoHpyvyvz8VgtZD5KjHVyBVbIvGwYletGRP1/+rksCS54mcOXqjbqi84Y6I1r9s1b
         wVdtcREZvK6xKFo9Erblp0CPcOG0jTT47PshwAFcj/VvL/Oh4Zm05RR3YH9RMi9agozf
         4CjuropREoJFkEPg/gjznVa+LtQOjbCMXgawAmBAxm4cz9w3bnH3LrZ2svXWA7swlvjO
         CJuNRkAaYm5sQTbYgY81P5DtazSco0Cxbhrjm9f+0olftAxhs6S9O11NDu5EF+Q1wfhi
         3ANw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791141693; x=1791746493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F0NMA3u5MDg6GtkZkDHPBKXcFteg2lEcZn/vhtwGh+k=;
        b=p8Yr5/gyikxjJwPsxHCCfJQhMBwqgIxI8YqKhOGUuQr59QoUdOdwIQ5SrJMbpM8S52
         mW0/a/2crhWiWvsR8U1MzuPWXmLC5QgkARzoe/EoZOCr1mHfvRgVDV/xlC+Nr9LmpxUG
         PN21rZ8c2HA3mlBCHUVixoHZxFeAAwvIEmFtnWF1QI8Kw5CVB9DsXpheiKKmIkzV3q17
         V8ei+/7hME67OPR7crCEIDXlM0kDOyWea9LjRtrKu1RukqWc1hQNjq4MVRgqVedA0K9L
         8unGxzIjxAQVJDw4y7+zxk+64PFSLR4Zcqg9jaRFA1yRUHWohtHiFH1GDX79PuGNdKh4
         gqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791141693; x=1791746493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0NMA3u5MDg6GtkZkDHPBKXcFteg2lEcZn/vhtwGh+k=;
        b=F4nDk+H7DCtEF14b3Z4uv1Tp8nO9/H3+J/lF89gDuAb+4iquqjkcoZokfLZugh/xZw
         pHKDxBXxqvlJVPgQtGJ/w6ucfIexSORsZ1aa9IoeTQ1H1C33O/j9Kpc5l8c93sf8EN6p
         bgxze48Hqo3MKnW9jdt2etB4NFKTbeO0vZyyTucOTE7T+SEy8HxgDnc5HrQYDmQaiRWL
         v9pNXP5LJqaoZJkItxheDMiBAvcNA3pciqcXRC/9mL4qxOAgZPPp1KIDNQa10fTxVDAV
         6gdwNuALKeacMsMZ3m2PQnyjBfD4CHbi6bIgFOMPmMdIP7J4L8cmwbpfCSfaqpYg87xR
         G7ug==
X-Forwarded-Encrypted: i=1; AKwUvByfYPCjBhMs1AAceiJ3wiW98VBgBmWkjMIuKo/6uIIa6IiWbhod1MV9x383isV7ZmhntpXmFsuSXbBn@vger.kernel.org
X-Gm-Message-State: AFq9FYL3PG20/LM+0i+2PvDwuBwTbg9CthnG8tjlzuRYYpjF+wr7REIw
	YiSqXbJ+drhWuddbXgUHaAqE8PkHJez0GtQYwqjXjvsH6k4i2C/Il1BmcRHDqXD/aMvjznqqN9V
	ZLV6r/nKSKr8WU5Q2n61yRcELMMCf5N4=
X-Gm-Gg: AYBFou2nfQmLHMhcRemehqGyxHC+OGqrM4m3vYLLrD75eMnecuw17Gb02cbZQcy+FG3
	4Q6oAYMygsOueToPgc8SSh51jETYnqqvhnUB6mZeu70MwkoNgdwpkMtQbhQXJhToouhvBuZONEE
	a1RB941qJVhVIf8ABwirXOUrJcFMUVtkA9aW84Ya8dBGx6ie3hOYZP5B3nDOXNaNvy3EN/6ong/
	ess825QFQ4gv3GX4iER804DTAL2n/N5gVgnihf9Ld/3syHD7ow1nmAzL4q7OqkZ5QgsyfJMLxYH
	tpVffOzOMBbaxOU8WUt0ZqCjBgQr50SRIFoDVwdZDx4B3scEl/XkRIVuiGnPg3qQcni7ZOzlL8G
	qU7q5gpPbV9lks+7sj3+CN862hvf/5ZOWQPTdWZHK7jwBTlhRcuv0b6b0+tRF3N4a5DARROzEZa
	to+Da7XnxPSScaPbyLFjb63CisBgm383wPJrtOQtDnzUe7z4EzO0VT2FiwEFZ0opBrbg==
X-Received: by 2002:a17:907:3d05:b0:c29:ab1d:b5be with SMTP id
 a640c23a62f3a-c2e6ed68587mr418879466b.27.1791141693253; Sun, 04 Oct 2026
 12:21:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004191042.143713-1-rosenp@gmail.com> <20261004191730.247471F000FF@smtp.kernel.org>
In-Reply-To: <20261004191730.247471F000FF@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 4 Oct 2026 12:21:21 -0700
X-Gm-Features: AclHuK-r6TZQaG6dalsSO0XzDLOu9FRKbJFkKWkwYe1BsjdoeuJOTYI5Pv6Cjc0
Message-ID: <CAKxU2N8D4y+MC_S8qnho2xYJNQ3Ft83qpBo_vKQe-yY=UXC+_A@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: gpio: pca95xx: add onnn,pca9655 compatible
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 4, 2026 at 12:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] dt-bindings: commit message falsely claims in-tree DTS usage
> --
>
> commit 7b4c1f570780f70afdcc949de9998c051c2323e5
> Author: Rosen Penev <rosenp@gmail.com>
>
> dt-bindings: gpio: pca95xx: add onnn,pca9655 compatible
>
> This commit documents the onnn,pca9655 compatible string for the On Semi
> variant of the pca9555 16-bit I2C GPIO expander. It adds the string along=
side
> other standalone entries without a fallback.
>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610021617.AlVUa9No-lkp@i=
ntel.com/
>
> > The pca9655 is the On Semi variant of the pca9555 16-bit I2C GPIO
> > expander. "onnn,pca9655" is already used standalone by in-tree DTS
> > (armada-388-clearfog, armada-388-helios4) and has a dedicated entry in
> > the pca953x driver's OF match table, but was never documented, causing
> > dtbs_check failures.
>
> [Severity: Medium]
> Is this claim about in-tree DTS usage accurate?
>
> Looking at the armada-388-clearfog.dtsi file, the compatible string appea=
rs
> to be only used within a comment:
>
>         /*
>          * This is how it should be:
>          * compatible =3D "onnn,pca9655", "nxp,pca9555";
>          * but you can't do this because of the way I2C works.
>          */
>         compatible =3D "nxp,pca9555";
>
> Because the string is only present in a comment and the active property i=
s
> nxp,pca9555, it would not trigger dtbs_check failures. Could the commit
> message be updated to reflect why the binding actually needs to be added?
This is outdated. 6dfda79476538a9aad1d2dac45453e62c6939522 in
linux-next fixes this.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004191042.14=
3713-1-rosenp@gmail.com?part=3D1
