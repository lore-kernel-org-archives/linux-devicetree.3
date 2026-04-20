Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E8538DF9
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 01:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776647498; cv=none; b=tHcgPbVSIItzW3w+outyftUocVRteOujX+HhZz3CmunpYSRKPan8cdN7Hk9aq8y6evn+cXpHBfa7zRnEUkJ/bsTIaNUuElKjIMYNi1VXsyF9jAaWcy/FLe80t3NAShnTHb3cr91Yv8al01PMysIjBRrXSiVaFbg4sSBdRfs5+Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776647498; c=relaxed/simple;
	bh=C0aW81I3StTCcJXehP69KLFeqWnD+swGwk+Y2hOVrM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nNqALjFw8FXwMnLU4Z39kKCeXmBFakr2kfoIOzryTamfAtXwCWvE4XARABuotiQOEGDKbS9I3tnzBQRFoezg17zfgmY0IGsn12hDYgIkmUaD3ns/fZOkNansCUURlhIRm+/hq06z2tqY6OLm7KdY/kq8s1UOe9gRjxVvAFei4GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7dc51aa8926so1094221a34.3
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 18:11:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776647495; x=1777252295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C0aW81I3StTCcJXehP69KLFeqWnD+swGwk+Y2hOVrM8=;
        b=XpOvUEIUl/75+CnEKLzTXmf6ZWobBSduy/T5SdfoAWbZfDPTywUSVFszXxgRbRt3cn
         aonpyNVBd4UnJyPGt5kAWXvt2TtN/TUmENeocsZhogpa7sTj91A9tq4UMTbuJs75UPa2
         DTh3W2uRAmuxEafkTOw5bMQewUYtrGOpreBwL/ilrch+POg+fxcKrGlaiJbaFMzNUIhC
         pJgCwhyslM1IaewKLrM9E2oq7mBaxqvfWdbsF0JEon/NUSTgU2DFi8MLCnaDPH7Z2A9H
         R+giN06dSC+/BbwCRhlulsfJNy8cwYgStcSNALTKblBjH5nFWPxhGw4e+l8c3gNjvz7h
         q9LQ==
X-Forwarded-Encrypted: i=1; AFNElJ/f7t6bMkkKHKZ2lfk2qB7j1KlelHIGQxFkQcOXi6HVKDHFDspiF0Ny5c0OGWSX6h+1hTH55q0hY4H+@vger.kernel.org
X-Gm-Message-State: AOJu0YzpIm8wTK1QxmCTpbHD9zUDBn5YDT+YW+TDSRYRjmhADfb5E4tj
	oaOlSnHACL5llvuU94iVf+p8wwMDjCEkk6Es8Dn0yofowt1c/9TIB+yYeaY0Rw==
X-Gm-Gg: AeBDietmwF/CcF3EfapuzV6RHvuECwzR3tCWUk3ixRZFZeYylZuX8ZlL8nwIFuKdVNG
	8VkA1PUzPHaw4RZalYqRQUBM5QHN8UR/5PDwbJlT7MOzZPgG+CKKXExr0PTtUKtN3kA9KGxBNs9
	JvUxb3al2FfmZaqUqSv45z091PA5RyMZxuwFyO6KYLGfwNgrA8jcufw17f/rZKM1RjaJq4+JzRD
	ERmS0zPLGO1Or9m2XxhMX9FeqVfznUm2I/qg+d4TH/Rtk6BUyVGnQ2lfNtiRl8XwNWA19RAY602
	QzfY94P/LsbYzDisgsz8mneY0gbr7zGp2prLQ/cmEMGN+09aAi8vVlftBI7tLFgunbGqAMRYMXb
	Eeoi7m3vv6699y5hn5TPrCjz7ZTsdmRnE5+2aSwxMcsWp1uATCjmyNiLCogTIN7Ie4z/salW7yH
	CEzORFp8ginp8RgH1DNxsjeMPlRP0RVJ8LiaW9pGR9QGs0LQPaP1vnTJwPHgAmllrSCTsh/2+kB
	iFnmThSCMlb5g9OL6SmLTqz/AzKEBlY9T+ccLMSKF8E3HnG3gCDRgYeEbHI+h6NUWHgkdl1Ayq6
	eSEeJwD6MvyYo/J/KdU=
X-Received: by 2002:a05:6830:828a:b0:7d7:cdd3:df6b with SMTP id 46e09a7af769-7dc9521f4ecmr7107734a34.14.1776647495608;
        Sun, 19 Apr 2026 18:11:35 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dca6f589d0sm5574500a34.27.2026.04.19.18.11.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2026 18:11:35 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7dbe437b072so1470351a34.2
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 18:11:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+gbJ46WL8UYRAQhbMiR4rTtXbvc97vrXT8Stmx4WO7bm7D4trEol6DGbeOs4J20jcZl8RZ9fcxNiuK@vger.kernel.org
X-Received: by 2002:a05:6830:828a:b0:7d7:cdd3:df6b with SMTP id
 46e09a7af769-7dc9521f4ecmr7107720a34.14.1776647494828; Sun, 19 Apr 2026
 18:11:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260411-mailmap-v1-0-5a519f7b00b5@chaosmail.tech> <20260411-mailmap-v1-1-5a519f7b00b5@chaosmail.tech>
In-Reply-To: <20260411-mailmap-v1-1-5a519f7b00b5@chaosmail.tech>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 19 Apr 2026 21:10:58 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9WStzQj30YsRfJvp-9z1-+qbbGPxTNGkt7Kdj+XjjbUA@mail.gmail.com>
X-Gm-Features: AQROBzDnYy_QIhsEDV3LeYMU1OQV8X44CvHYlKgDLdrGKHckgRju0mncg5q_5Ow
Message-ID: <CAEg-Je9WStzQj30YsRfJvp-9z1-+qbbGPxTNGkt7Kdj+XjjbUA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mailmap: Update Sasha Finkelstein's email address
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Janne Grunau <j@jannau.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2026 at 10:36=E2=80=AFAM Sasha Finkelstein <k@chaosmail.tec=
h> wrote:
>
> Add mailmap entry
>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---

Acked-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
