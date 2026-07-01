Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608C934C815
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 14:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916537; cv=pass; b=YfAN58ByEy4j4hXdA1Kj8iH9CZGnFGZIitsEWhWgUHdnm5a9/C+zJZZ0//EglH7uqwroCuS0YpaJAeNsXaNJ3PYcl6rGDJyqtYdvDWEust+d5peu+ufxBNC/A0n688gYnqsjtOCzAnpLV8MQtKZKiUriWnsFnAEKMLy+iZRa2w8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916537; c=relaxed/simple;
	bh=ITer+kkk4mMSsWxMyfWrD36+FmvMAHde/cCZgcgLMa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Je0vjiTtaimQsxr75RgLzH7ygPj532PwhM4Ut1BLFBmkemYcwLeMIYH+GxB7Glj9g/zygtop/ihnYIMQK0CmK6xczcnKHp4A1XB77uvvrwLgHnjuQ2thoCE5NBjTRl0iBKCgI6kvkneEWARB2kI0xmKKvJhCpz4PPb3zSJDx7Z0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFlLI4iO; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFlLI4iO"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-664d22d7337so655534d50.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 07:35:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782916535; cv=none;
        d=google.com; s=arc-20260327;
        b=iHaHrdDkoPrL8emY3kno0yWSWJEiGpXsJ1t2DOEB2AsmVoSSKRWbOIuGraAyQN0mO/
         pNurldZ9rhf9WRxiSA+78T3cDGODXdpEbaXil5jhV+QkzIJgxuJ/LpYGfIVqeu6nauQz
         wRqJONiVww7l0wHPkQZnaU2o2SZ91oZpL3BvpqZTVb4S+wwGljNCsBU5NJzgxrDq3cWj
         pCa5PG0+25u4BaHi26BJmFxaz0pftq/YCMwtyCADTY4nvwTchhoYKE54H5NZy6HkkZ3J
         AoGax7P7BG+T2fpbJ1yd1sj6tjeoALUNmlQDXXGsYba2MlDV346p3P0dXRJfjJDVY0ph
         zldA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ITer+kkk4mMSsWxMyfWrD36+FmvMAHde/cCZgcgLMa8=;
        fh=TQAH5emzQuAWbViLWyk/KMy2a7IFSf4oNPuYFWhMXcI=;
        b=Bx5YYJEwFSUdp0VxtFYEfHlyU1a/eov2CKBLwphQ19CvdH/J0q7Mf1g/Eo0bZra4g5
         fyIfinySPu+US5szmIn9OKR2IVcettou9g/kUY3m3N7mvJaTQZ8dzME759tRb5zBFcdW
         ncuWLlvamuptWrDfnwBGVB8IG2gtvKTzq7CKbeyHMMOJ6qskG4rncfq3TBqELS3vSMD3
         uvdHhpRLE7n/YKEewjOnUNjMv1faXYsKSMKsp9MkQZXteCxWmmJhyZWkIxGmd+/AUhl9
         oZsxOFo18xZXKehnLn1XrluxQln4W6nQ0RmFd+GYv8p6tzqb28XGpAo84zolkUQtQRub
         IiMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916535; x=1783521335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITer+kkk4mMSsWxMyfWrD36+FmvMAHde/cCZgcgLMa8=;
        b=lFlLI4iOajF57XBXumzTEoiEqzIBsfXUlXfVP0pgSh8wBV1pxiZCZF0qiTryNL77/b
         G6Qz/BN/1Asz2c5Fdmgt8oNl8WVy+j7pVEjC7FMB+44Z5tEcVMNKtuF77lM4FpMSjmgz
         +O5ycrHl0AGN4mpPc5X5c+N9KiNZzhRrPqDoUzh9PcGIR0PYCw78sK7pkL0aNoVtJQs/
         HYyJ/jR3DPitRfF9i2K2Y0M9yw/beWAIaFvaVbg24YEL6xC/BHdrcK0nVqgYpfgv/QbI
         V302APpipuDLDdp2x+S7LYjiGf7kb7pcSlHrMUSOoLpZYS/w9BoK7wKXX8/pky6L/5AI
         feEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916535; x=1783521335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ITer+kkk4mMSsWxMyfWrD36+FmvMAHde/cCZgcgLMa8=;
        b=IBWIdUS/JpW/YTnmMrNDSMFXkAdPJ70SsiXf5x5M+ji5FsdI/o2OId1xpFOI+TLgqH
         okbvotwVGybQ4vab5sMIg9fjpmVpXTZOCwOUe7j2M/qjoMTISjtgVUPFehVcUGAICX7s
         qYWccg/Iz3diJVQhE3/TRGOzWHEe8yvRsSR0zRcJfLWhxw0lOGJgZryYdTbVD134BTMf
         0Hw6lwk0Can3Tq2Rlf+q7NFdT2ZQ33oHMDa8MBIhwfXqnmDVdK+hDn/wr1R93X0Jbf2H
         zjIF2HkViP9UJQYHNukbyYPddVeuoXJh0cQJjULTHlRECSn65I5P7tYurrceIve9yvPH
         6CXw==
X-Forwarded-Encrypted: i=1; AHgh+RohIjJZIeu7ISH+0Q6cdsJPudWUvxfYmrwYZCRzfQvvBtgmNpy+i2h3YRZfsnQGulcZUOkaxq7OxxW/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy68ZJwFsi3gVwQbTT3lK0wzUF0i58T/JYq3I6+tFbLza/nXqZx
	n8VWsz52sIDVTq6J1xH3JdnwEEd0qr91RTQgtIEWKg9FyhnpNFu1IDojliL67SlbS74TEwjlCC7
	5e+D1Vq8P6fK6WCwD/99CiKtGXnxDFHk=
X-Gm-Gg: AfdE7cnE5u0jUrmZz+e3GhuW69Zji0KwSfVufAANshq8M+d/ShoC4dFtxvkiAq0/iWX
	0nG/q1VmLa01mPousFRcmMp03BsenLnnSHAOPItDVEFXyVB04GLuZUN2iTnti/7UVRtJWnPk9j7
	O/Pj7PTWnCvIZvkId9iBR5DZrYsanWfr8xvy4hnzORIuRUCopGth38OV9Yka9cIpZmZ2OHADmny
	wKityy4gWg0+1cYItg1XmwwFMQEFJsxCh1/k1Vqx+gj1qu6zx3Phyts6fzFblXzIA7/KGg7xddt
	U0s5dcoHqu8yDFEerW/lohAYAU9Q/3svlJEm1tIShFYojToCx1yHKBAMttt5ow==
X-Received: by 2002:a05:690e:400a:b0:664:d5ff:2845 with SMTP id
 956f58d0204a3-66507a15364mr5289486d50.19.1782916535159; Wed, 01 Jul 2026
 07:35:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
 <20260630-apple-mtp-keyboard-final-v1-2-506d936a1707@gmail.com> <20260630-tattling-pacify-3b990261b8b5@spud>
In-Reply-To: <20260630-tattling-pacify-3b990261b8b5@spud>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Thu, 2 Jul 2026 00:35:23 +1000
X-Gm-Features: AVVi8Cfa1dzp-N-jQ1tztDZshofJ1mjnAsJpK28Uy4QoNy9Qd76BAukQRwwA8nI
Message-ID: <CANpmGNtq96uJzbPRLyDG9Qq3hPVGA3yspk0-ezAdD9PUzj0gMA@mail.gmail.com>
Subject: Re: [PATCH 02/10] dt-bindings: mailbox: apple: Add DockChannel mailbox
To: Conor Dooley <conor@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, iommu@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 3:07=E2=80=AFAM Conor Dooley <conor@kernel.org> wrot=
e:
[...]
> > +++ b/Documentation/devicetree/bindings/mailbox/apple,dockchannel.yaml
>
> Please name this file matching the t8112 compatible (since that's your
> fallback).
> Otherwise, this looks good.
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> pw-bot: changes-requested
Thank you, will change the name in v2.
