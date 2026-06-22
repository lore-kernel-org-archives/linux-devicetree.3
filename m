Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C3E264A97
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 15:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782143661; cv=pass; b=HkGeovdGVftwtsIpvkz6yt4M/BIMOwBsOIwdXwdxf6XMqoxtbTFL4Dm8NpznyvXI9A0EIZoBtIdwlOakaaJ+hJp8J8xkvA2k5/Psh35qw8CTxD3q8xT4R17xJ9ymXlZAEgCrt/OcOj0gJNJKwzJ8vjBHKzPanlqAt8Yw4TvnDmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782143661; c=relaxed/simple;
	bh=fFT6rh8/MPrWk3ezl0FulU+V8/4A5ig321fIpbZxvuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EjIFu9EJuBGIG0AVT6eTyAW8uOM+NUJA5goadxB0cgqCpZg8VPMxh7bbXEL3ap02b63n4iI/yvsgEar4dnTSW9i9KWde2lE/L87agYm4t1TrDyXNIbxeplTVElsqz6d7SX7nEDBiOODO3M5zgVH28OusTJIwXh6W1rLyfN5oHZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kD4op9Hd; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kD4op9Hd"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7ff05e5d009so41798027b3.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 08:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782143659; cv=none;
        d=google.com; s=arc-20240605;
        b=fs9OQH2AjE/5yrcQo9MRxHETOd1GuHXj16JYXJqgRjSKru6Ea2srhMFL5I2//qjBNv
         iHfkbgz9s8wXCjRvIqcI3cQFQmg4jbzvRiZrhzOOY6BbBuIlKhSzgshf3ZFFNCCW8nG0
         xnNfXe4BpRg4cG2Vh/Rj+FdVF/qzRLbLrT/LJRAdUFyMd1Z00ez4yrDRfTYTi8EWhasn
         tzi/g61Ktx9IGYSfxqnpXLhoxdO1drfC1sG305s9MSKBW0uLoJTmh9L+3Zk/375GKta8
         UOnJgDlEOZNA3ZbcmbDwuP6NKHcaPoQGlLmXFOSQtWY6I2jtNpnIGTv/r/8IAhN8pk4Y
         axZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fFT6rh8/MPrWk3ezl0FulU+V8/4A5ig321fIpbZxvuI=;
        fh=dtBZDPkQzGloOhUCUwQ9KU1XR+FGXlg5D469QqF7Ei4=;
        b=Ylyx2uii5xpeZnZRgSc04O4tu1CBHByAoasV96mzG2N3/JtiFdEC5cP0F/Ry+58E8Q
         HU13yUCgNDQ+yE8YCcSm0Y+59bw944m7CxsFMrYO74WuTgHlK9cq6VOPrHxy5cO2PNVr
         Dici8KtZhFAWWwL6heTgsgMaj74qj6gVuMlXdjPIspuV8vQu8gVdySpjBUyy8VtxIt3f
         h6pzEeOZIUKwkuS2dpyzYUolIAbKYFGngJk5wh75vVJNc5lLqqSkBC5LcMKcAiveAVfv
         eryw90XRcLEVcxeexJ52H6dTdCgP3DKK8D0QeJmwmaAgw9BjuxIoGlJmqFt5VUk1bHjg
         a4GA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782143659; x=1782748459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFT6rh8/MPrWk3ezl0FulU+V8/4A5ig321fIpbZxvuI=;
        b=kD4op9HdfVanW+T/g7dYDeug5TKLefwVW15o7pQbkN87Ufk/5ZSK46707aN1LBkL4q
         nLjHAgcq2hH3yFFIBvPh8zktCRz/IzvT/WaEpF9ljGEEd7gFyNlnwFSUKMbBXFcGwM3s
         3tghnf2lIuncxqrz3aLwfmG87UQO0c/vTkvfKkkZgISMqg5fFx8NVO6ldaJWPznVMhtD
         QbVWq9O0F66FOt+QcIAOeg5PrHCFq26OcukRtuFbrvPCgXuX7ic/wyHRG3x91f18O/Gj
         enFWtA3PK/ewQbo1n/RUZn5pnt/fQRIKBDhukn335GC4+ozA73iFl2GDwx9a3NPYUUZ8
         ZxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782143659; x=1782748459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fFT6rh8/MPrWk3ezl0FulU+V8/4A5ig321fIpbZxvuI=;
        b=cJnQM6623EIR///nZgUg7mdKJ6NFsScHptq8++nwDNTbKM6ikXNz/NtLM7rD+6L+Dx
         0qE4Fj2NCG1E7n9mQI3rzZh7CR/lfDRXuADCruIsIKi/WLNm8qGczP49xOc54RIzrHKG
         RvnGLIIngJAguTyqkMG4/DJLMjWUIFPiEU0/CAXO7/zdfUJEizzyQa57rRs8gP/GUFES
         a4CW1tC0oicqwV4Ls7GHXaqMSbsRmrs2O5tAlCCWgG8UYqg4SNc1HAaXzxE0LjFKkQEA
         JQpdunOr+nxTcDkqOuSEEnvgSqy+LACHHn377zyrBhvsRRGrF87TY4Mr/TtDTgkjWO5N
         o66A==
X-Forwarded-Encrypted: i=1; AHgh+RrBoeJntHq54LmV+dbP1+tJkAqxrW2eXAwj9gUx8aBO9+jY1jks2amKL2WVUq7RFz1yFcFSV64dsoh4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5k7N7eJoR+vAhWRGnGeNtFrVvSCJEeAs+6894AE0isgQipGHb
	tjpooU+9UUvQypMWJSc6KbcvdLCzraX4r0hOQ6VAIakB890Bzf1NKWcm0u8txtppFmDGmJUpF/2
	zKrGpvYB7asZhbWEuFVdocAraagXYfH4=
X-Gm-Gg: AfdE7cmmWLmLuTm9NzWFI1BptdCcCSie4iBYcjwf3TnfndgvxHfD+AuajLwoMxVKLAC
	M+mJ4N1TWpERVYGZKsB22fKy63P/wbGhTUVDukYLW7EBbpzBxxcSt30lqWmadAZj/pCfWDdbhhj
	KqpaOa2wSfZFSEePe5End7NPOl126zIQ5V9RYZcQssPageeFstK3k6d5VUIlhJpYL90LK2+XVH9
	rA2Mf8WCQ2nyGREr1htCpQlVrN/7E8DPtW3EdnyiWX9zJGYfmRs1pESiGqJIxJXcHeSj0jQf5pU
	r1LQMd06e8bWmlto8ASxxJ8JARUnPNY=
X-Received: by 2002:a05:690c:6607:b0:7dc:c477:9e98 with SMTP id
 00721157ae682-80177c8176emr143906017b3.31.1782143658469; Mon, 22 Jun 2026
 08:54:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260621004626.66629-1-m32285159@gmail.com> <614988b7-c77f-4f0e-b220-c0acf44bef27@baylibre.com>
In-Reply-To: <614988b7-c77f-4f0e-b220-c0acf44bef27@baylibre.com>
From: Maxwell Doose <m32285159@gmail.com>
Date: Mon, 22 Jun 2026 10:51:57 -0500
X-Gm-Features: AVVi8CfkKiWSV6QC-225bN-2BFDSsBVkoROfjamGp7D_YuwsxMLOAnZGUuFi8Lg
Message-ID: <CAKqfh0F82T0-Gz8dODocBCEAbCZeXjXWsnE1fRX-KnCO9=T3mA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] iio: temperature: Add support for the STS30
 temperature sensor
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 10:45=E2=80=AFAM David Lechner <dlechner@baylibre.c=
om> wrote:
>
> On 6/20/26 7:46 PM, Maxwell Doose wrote:
> > Hi all,
> >
> > This patch series adds support for the Sensirion STS30 temperature
> > sensor family. This driver currently supports non clock stretched singl=
e
> > shot measurements.
> >
> > Given there were very little issues found with the v1 submission, I've
> > decided to make this a regular patch series rather than an RFC patch.
>
> You should wait at least one week for feedback on a new driver before
> submitting the next revision.
>
> Given that you said in v1 that don't actually have the hardware, I am not
> going to review this. We are getting more patches than I can keep up with
> already.
>

Fair enough, I'll be away until 4 July anyways.
