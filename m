Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FBA368D68
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 07:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778569720; cv=pass; b=EEmYHKikDAQBgrmiLuWzBcQzCggaJwCeTIyByaaALE9Sr+WMNn6MfY19W3MbmhVao17QSQskbZOTb6vjoUo9MtLe2QKFO8+ZKjPpYRt6EUlLU2MJKZF15SQS99M9otVvsuIpttLYA8Zd2v/YubHvdx7IW7LgfsnhNb+7uOxuo8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778569720; c=relaxed/simple;
	bh=MT81Hd3L84EXgk134AFMdTo3wRN3W9j9EMFVjmJ2DXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TQj/pHIwkff9A57D1xAAL1923axQYfCOwLEmEXeOOwx5lopJ/jCyA2kNAUZ2QLunpkbMkSNcLwgv07SxtroduQqTss53xDIsEUmmmLBj3R1FEnVwytGknwJptGtKet466xhIIsrwLvPqlBDifMU2g9UQjjEM5qDCNDxxcHyxLes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iigrshKB; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iigrshKB"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9358bc9c50so806572866b.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 00:08:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778569715; cv=none;
        d=google.com; s=arc-20240605;
        b=i7J8yRKwJYe9vuU+CMbIaJKIrvbxs6iswBmXyDKev6iEm0hf+zjCAzGHpQk2LqFR1p
         GnXcYk7wckNRm9wOjnH1eCng+jyMddS3s9z5mY4CrmoGcvwlUT9iv/N1EPBNXVE4W1Fj
         chpXuc2GZJVspbIftsZ5KTK7qXwSugSjg2gHBgasaBDtpaSRhm3+HRr0bFfvUlo6EICA
         cqq+s6+XJIyFlv+pw4CZQHbXNnOeu8/xWebp1Vr2v5PUztiRlFJ6T/nmYcejHAAqeAka
         WM/2Zb+7YfPW8hQICMEbawIPEbjurB1CvKhBi1vqmrxyRQ7JMDDxrR3vpKRS4EKDuu1C
         ijZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MT81Hd3L84EXgk134AFMdTo3wRN3W9j9EMFVjmJ2DXg=;
        fh=RZ/ekbpSrBFHyBYKwTIwaDa2Xlqa44g81OT5Mw0FFto=;
        b=NsYhFG+nrr9q9Fa+jXoCZSe23TAaLP9IsDcP3gTD2ihxpxApYbIbrgJRrppW129mvV
         tWGdawpWr8SOflWykU99rlV1zzrm4aYeSoMzNpgzADh2tN0QSYnO44/Xsw8otKilcAvF
         iZs22RRqfLCaUBaaCobLrcypk5vxV/V42I5iy+DuzPdf3VaBsexjhv+Z+Nn0hqgW8dam
         QmqiJwUvF+PCHjEKLIgQfc0b6EVl1E24yUYRhgXfPhTTkYZQhiQMW6WARNSfS+rWlma7
         10ZSYNgYlFu+Z0IRjRZ/61jJu1VcAqe+nfmXUW5gOVDXa85WWWru/puau5f19s/tEbsS
         rfCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778569715; x=1779174515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MT81Hd3L84EXgk134AFMdTo3wRN3W9j9EMFVjmJ2DXg=;
        b=iigrshKBo0am7I6P5eCDAyfBD298mmufQAIOkJPvsGwke2WZmo26E1KD/S0dbEapqK
         lHv6+AANpxfU08BKqjipRPVuHEvqWTp0rWZh1cvNZ+b7MhzFH7j0WjcJpxpaK6SMmHza
         DMfd2VTdjr2S/myQKVMcmKA2PPvhqvBUvODV1l8qVDuRRdy7pxPGZC0126e6hYMp2oYo
         d9jFhVECRVjctnEZ093Y5zEpQMPAXMIOj5ObSv46HrO2jfU/nxcVaPa0WCd09kEb+dX3
         rSm+UpmzT3fJP5BBwaYe6+xDvLX3eDYA9vmd2vg5qtJ84A31ihdbPGuaMnPAIIumjj8a
         te7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778569715; x=1779174515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MT81Hd3L84EXgk134AFMdTo3wRN3W9j9EMFVjmJ2DXg=;
        b=YNUU5PIBNI6eBWF0Rl7Jtl1OWEPUGrjR9hAQjL5TBjssevU/R7vQ81JlAKhLyCtAgC
         tBuBpemAKFe/MgNy62FzwLSfhPuoeI3eeSHvrwqN8A227ifyiYiRPc9l+csIWsZPWzr7
         8U/i1Sa+o4U2QP2z42st/DuQ0M8ZE7b6gRPOzfDsrLWt6Dig8sfSmIY+uskVwORFEdrD
         JIUK+vWUq5vQnprsVee7pJEU0Nl9L/eLFROXzaQTMGNeJB4X3/dxU8fGaY/cK9BV7FXc
         D7onzKCdHYMNY+WLgOuMNBwvRo04Cevs1wSUHiCkvUAP8r7qfPIMrwmOgy01AqnGWjGu
         niVQ==
X-Forwarded-Encrypted: i=1; AFNElJ+pye4fDFb7wrfc6Ps3joan13Q/1XOQDJJSzQ0fkE6BEkgeR71d2CzD5zeVdGYuIJsao5fzxQPm1REg@vger.kernel.org
X-Gm-Message-State: AOJu0YzYVz3IFrawfB9ROt0t0VQ6+zocu7SoblSflaZNFNuero8vdC6Z
	4nzBH8/4qkm+42XE9CqAqBPzmcP9iXZHWo/XVMdkI+lsUYcB+jy7k5WZz+NSH0R8tWix10vkg3A
	JsEAgcRpnM/3yXH5nafdm9uMsvqfBTZc=
X-Gm-Gg: Acq92OHsg84MVQVPlm3ZoV/vkmH99taGCZJ7d+pnHvEpiWiyJGroC4fXBOuJ0oi3tJd
	Vzi/+SUYGq7dl91QBS1j+WTw9y2JeGbcppXZUGhlUGrhXWt4hCt85kSM3YAec/8+DaKSv4csSDh
	jQRveDWPb56hysueaXp9iIMTX5ix6ITHasi0enW2xALtuguBSISx/PZt5AZI4QFj1C82BZFhNsO
	t8cD4WsEeRyHsUR32+hk2syM7fXXWmkR9yXzbvn5An5H+bg45qxo5u2nHll1urueVDuiNaF6k/p
	8fZXRKsXMbYkmRy+L5RHtousA/bR+XxM6v7Y6dBd48L+MrVSydfwDGLvOprOQqc5N6w9X1dy6Zt
	tnQZKEu8=
X-Received: by 2002:a17:907:9412:b0:b97:1d24:c004 with SMTP id
 a640c23a62f3a-bc56de100damr1755416366b.21.1778569714611; Tue, 12 May 2026
 00:08:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com> <20260512-mt6323-v2-10-3efcba579e88@protonmail.com>
In-Reply-To: <20260512-mt6323-v2-10-3efcba579e88@protonmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 May 2026 10:07:57 +0300
X-Gm-Features: AVHnY4Jipzfnw1owf-ZULaa0oh4jwzOau62Z8kgQLDNNHax4pisYq4PVzs9Mr6s
Message-ID: <CAHp75Vfi8VwJvBLAAnRO4ZdoFYCCXcC62UOPC5hCcYpTpf-+og@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] mfd: mt6397-core: add mt6323 thermal support
To: rva333@protonmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-pm@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 8:21=E2=80=AFAM Roman Vivchar via B4 Relay
<devnull+rva333.protonmail.com@kernel.org> wrote:
>
> The mt6323 PMIC temperature can be measured using AUXADC channel.
> Register the thermal in the mt6323 devices array to allow the
> corresponding driver to probe using compatible string.

Wouldn't it be better to interleave these MFD patches to enable each
driver just immediately after the driver provided? However, in
previous review somebody ( IIRC it was Krzysztof) asked how dependent
are they and it has something to do with the device tree bindings.
Take into account that one as well.

--=20
With Best Regards,
Andy Shevchenko
