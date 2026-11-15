Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794780809;
	b=Zgw1ch1+hIrGoYyrWOty8RPqUOQ5TBNrWAZRiqmuuFFC647dD65BZL6jhedfDrmrGT+w
	 ZF44Up6DUiOpqTvPD2mewqQr2/Ag0gP475w8QqCy3fBIveHOFMdxaBOxtBf9z8nNKiNPE
	 gWMMPdnF6jCfGUxWEthr7yHcCjBjKBVpK4ZBzbh7wLq3+HZUk8S5bVSPI4cCrmi3Czhw0
	 NC0VaOyLrIVTZI5YmZEttY/Ldugn70XH7kQ/ROy3biTjfNGchjLjUy4wysa3y0WsqagE0
	 ysgkSSXdZUmxZNOpmuaJHFWIKypQZsNVgNcKcBdzbtMIUAh/5/w7sZXU+E2sw5FG0dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kJAkRdpNaj0JXIeCqo3bYKeQ45IEZOOmHicMvNGpVtE=;
	b=DTBG7N0RYbdsLPmuR3zjcRUflnRiyM3zznbO4V2SX2VIeOz5H0/5sLgaITeLApkrJ+JO
	 hXN3VxvQvzpwuw17wwUn71P6wI0XiG7M/teFAeuAUJF73vUUQTWqwaHHQ9qqRP4myiTuZ
	 TNh8S2sFZ7NRzFcOlylc4EC14XSRnkAKqKGWDs9OTyJp0f79Au6ZuG2rKzRraMLcZ522i
	 4JL2p5GH1zHwyjPn+T6B2z6x/3GXxITFETtNy8ngnTC96GNSA6/wu1v9IplDmKjmLOUMb
	 m7AuU2G2HLFy2i+jMMslhLcxF+tBnaODO8oe/bN7hniZu+RokG7APKfGd2rnPr52QiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b="KeOT/WJT";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DC2606A330
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 22:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46DC2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=KeOT/WJT
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67da69e7c31so1018087d50.3
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 14:13:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794780807; cv=none;
        d=google.com; s=arc-20260327;
        b=TPZVZOVSg8DsYxnT1UomvIccw3vrcMXu2hvE7RoyS+Dom2H3ievu5aZXLU9WKvku3x
         dOz2PwHnXzVaGeEK108BiEBuClBMH+PiUK4XmwWppP4gqRJsqzURUtNh8VxgGxQSeX4e
         96PFm2Exl+E4zCIzNYLsygoHJ2txFQnTFKP00W4SLYWqihxqS2+pobJ0EL5KixRPa3Ay
         yxlkgVCwonHwWzhOOZcr+0G+lfrCprGJ2UNLjO3wpJsA+jaWEDB3/rpt0Cj+1HBhhMoh
         0XH+jzogOiJ/NdBrhlkA2RGTHQ+qkcT4/JJpVb48M0Ft+Geqmi8r3DulY+vEKiHj2W12
         GHmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kJAkRdpNaj0JXIeCqo3bYKeQ45IEZOOmHicMvNGpVtE=;
        fh=OBcumdE3CZiZNuMPNnOXaihdllsGQoPgIv58MpSDtKg=;
        b=RGPxzqumyVgaq7/R2y2x/6VN+D75VSJtBVWql6XiNNfyCzbDp8p9ecxI8ONzHxoOnV
         lhgIRH/Tp7igTpm3SYor2UmPeYb4Iq6c/plt3TyccLhC4i6iWZkaq1nv3MEY5FvSUFzd
         bj6tISgz7wlPvnogDi7iB5Djv9DV5/8RgaYlLu/2QvjCyN2rOMraUdd/340iFSv3GCwX
         NchJGwIMD56XbwQnzBARwt5iArNNMBWNKtDf6bs0xW0CsdS7T1aJdqXXONo5uowNuwQl
         XA+DrqRSHKbgOsbN/DHxOhsrHM46I7crqETnCTEQzABWHg2zVwWdB5+EZruJIH/nqX2m
         3BBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794780807; x=1795385607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kJAkRdpNaj0JXIeCqo3bYKeQ45IEZOOmHicMvNGpVtE=;
        b=KeOT/WJTkV/xO3s3/8ho6ndXpXXmKFe7CrwbymmlzfKNpL2wgykSqq+IbgR5PB4lEk
         Z3a6hnz60Co8dAtCWycw3vFlsCiAXYgV+gEEcdAiy0LyoIOqz1HOkB5J/r5RDJ06ZkPV
         ns0QiBSOEvZuK/yRJLyW0/Fcbj6KjiJcfqDPlqIBjW32EqGP4EaH4z2Wz3ERrV8B/N+D
         Y2I1ULu5cmJpR9AXV2tEugVzDWvFRMeJHUnyPYNyJnBQ1POsE1b6hTyTc5c0SDzVaTru
         2THBO9lT/A75TUQGP0fbrtrcyN21R1FFWCAwizN1ehsTfSkmcunisv0Q3nXFibwfR1XO
         2N4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794780807; x=1795385607;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJAkRdpNaj0JXIeCqo3bYKeQ45IEZOOmHicMvNGpVtE=;
        b=S2BOuRvAhW6cW05tJurD4uBLp0sStYZAXospkZbZzcB50G0Do7IzAnGEZGdvGOKKrc
         bisfmdDaieADJh2UPwGid6mVDokI2Yiudu4kmL2fRPGNfbMrTQ4rRtwp54BgCTqPEUU9
         I/w0+KA2V0R4jsKBzPY1KavSqh6akPb3L3nJDZcJ2GHjuFdJq6b8liia1xvJpjpnb1g3
         fib6PyDm3udALBPEF7U8Wg20GhhPhXBVhf1G6EFEHmRAW9VgVOFFN5ejx5GY2szI8twg
         LFJV2JoQhuECkL2Z0VmXiJZqQP1kX1NNAWa2T4D21JvgyAK7yr1c/UqyEWoUAY0udXgo
         I46w==
X-Forwarded-Encrypted: i=1; AL+hErGNSTuBBFGOoLOPLUPr6SCljvKfwlAERINj/GXz7v+VOxlaL9NxtxJIEjTAOkjseaXiO3wYAy5IaeLE@vger.kernel.org
X-Gm-Message-State: APuU4Z9YhdWI4i/PQAmambwKnCdm6QyRLKz3v8yXp0UAlV5+rYCjlA3V
	rjgtmSCOSnSGF1UCdaU40OKlxOHZp0TPYAoc2wOZDQKW1Br732z9RC5JYx/Yb7s48qVFHwwkGR5
	/vn3nmkO2R+qomQgjRZA7YCA3P4h5oRs=
X-Gm-Gg: AZFdTZcn5XOr6wS8ZBsUHoyvuYVaJSphxFcxT/T0c5xMtiYfJiOHm8Jjt8/CRiZo+Xa
	yiymErYDb/Md9RJ9r/pjbwz06QbPr59XtNTDRbCHlsh9eJ40nysyF/oyvjvVaqsVJyVK0MGR+w6
	KWc8BUEZf+kMbLWcA4rsEd8OXeT93EzHDCsh20HFSz8WuWK72ZErtOuY/zP5EJeuBWxxJJCYjmw
	JJduNrm4v4toMxLcDt8D2GsNKAM6jimfVNsKmUKEZsV8Wh4OwH6HirGUNfqWjJ7TyUe29rbgPSU
	HFFxfB/DpjIBSn0LiczndSgQ+tefR3i/cx6Ez1fK4R1/BoA4W/znZpVKvnGz3808O3PGAX7ZyC6
	8NjrXoiVQhqcN+gZA7EKfBQ4o1ugVHwpjwDGdglEnZVEDMYOyxVgQgrgwH9JUGo2kAU/Qug==
X-Received: by 2002:a05:690e:47da:20b0:67c:2ae8:dc7f with SMTP id
 956f58d0204a3-67d895a8de2mr3616052d50.26.1794780807215; Sun, 15 Nov 2026
 14:13:27 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001-add-t7-sys-pwm-clk-v4-0-8ed2b1e0cdfe@aliel.fr> <20261001-add-t7-sys-pwm-clk-v4-1-8ed2b1e0cdfe@aliel.fr>
In-Reply-To: <20261001-add-t7-sys-pwm-clk-v4-1-8ed2b1e0cdfe@aliel.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 23:13:16 +0100
X-Gm-Features: AclHuK_5guKUt0BBmOKSaBjMvD6Ef4THAVZjtyLJDUGu11vns0QZX0fCV-z62Yc
Message-ID: <CAFBinCCBZTN8m+u+VyR8sijC8ihaQR8woBtG47LJ7tw_ftbO_g@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: pwm: amlogic: Add bus clock for S4 like
To: linux-kernel-dev@aliel.fr
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 6:56=E2=80=AFPM Ronald Claveau via B4 Relay
<devnull+linux-kernel-dev.aliel.fr@kernel.org> wrote:
>
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>
> The T7, A1, C3, and S4 PWM controllers have a bus system clock in
> addition to the two input clocks of channels A and B.
>
> The channel clocks are acquired by index in the pwm driver,
> where the bus clock is fetched by name, with optional get
> which is silent when not provided.
>
> Require clock-names and minimum 3 items for S4, and devices
> which fallback to S4, where the PWM devices do not work
> without all 3 clocks.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
