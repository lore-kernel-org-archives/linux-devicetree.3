Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424774E4312
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407991; cv=pass; b=VD//atzQ2q6tJJnyiYrHkNZaOLcvI6t06MmB6CwE5jV+In1vg8lgCiiJ6q+loHArY9d8JXJDkR9R+HEP8FV90RIIDna4faF6K1QR3qR16uWdkbgqPu/+i3hr8nW7LPrLA6D3PTL/lsD64WlVRmZ5Wi1nkyPDSXubdUOWHlbx/EU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407991; c=relaxed/simple;
	bh=ast1zHJ9Uz2YssWCBu1jREzUx8HTb4eQoYAKdnW9yDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bm5sFmeMYEx3cR4oToYjaCrZajmguEXjEu991BB5QEVDtrAoxoVid8Q3UFDFEuryiswjAD/Nldg6YAHHympONzIMToAFqDd64MGzkorr5z6fVKRqii0J8485pOUXtmf8ymy9wjI7wnPo2jKRMNIZh8iz7gtl95mg1sjPkjtWv44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=royPCape; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="royPCape"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-679a2b5fe87so1685822d50.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 04:06:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792407989; cv=none;
        d=google.com; s=arc-20260327;
        b=rcP6EawfrXyq9oTcnag6o5NhxrOYcuPUK6bLGpFntaMu3xzoNw3G0+q/5z6ShxI4uM
         nQFc7OM2vF2YjhnqyYJDOKydLMqGCnJYQ0k0tRjOA9IEr1LC/Q9jDdBohQIaYE+WVIIf
         mWFWCFB9iPz9eWBQTWlidTBj8BiS+uxvOcFeZq2EBdc6qT02fdPfrvVyZsuzNY+5yKQU
         1CqMqpU/KCDTWIDqj4plS/vO2SvOrauU2RxKRRF00ALJ54ZGaupkS4ABWq4kPLHv/fM6
         3+O7c0KV1C6X9olHl6ufdK9wpnq5G5ErJLYjXJvtxeGg6pEy+SwYAfV3IkxkjThZ8JG/
         GZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ast1zHJ9Uz2YssWCBu1jREzUx8HTb4eQoYAKdnW9yDE=;
        fh=kiDHIJJSmGVjzkx1J6p8Qi0Tyawd/Bd+XDQfAlxMOks=;
        b=JRaE74fxBzPICbVyHBLjTxCdoAKRBqRaPYDCtJUopHG5d0dE2Lce2tRQ5yayhZWu/O
         m6JUGqb/kzKWq2o77LC+S6uZzPJS7Yt4Ws6nkq0rl+jwhmd0kZO75fx5PC+1ufb8s8Yv
         RmqQvCCSF8W5/plllU3JSCzN7yb2SdbFkGECw9GHNwSIyBjLs5aMqj5CEIlDJLPnhD7c
         4xgJY85Kx5W/Qr08fIo4qd71VnKhrff67lC/KNOfB5gsMasxc8OitDaikC4H74wuNlqy
         gbYq2Sr7P98SxrbxPVb1uwRyNSu0hZD8ltSRyHELVkSu1izrSro/lHuEa3w1jScLGrvT
         dXhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792407989; x=1793012789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ast1zHJ9Uz2YssWCBu1jREzUx8HTb4eQoYAKdnW9yDE=;
        b=royPCapeeg/TQgjtdyW6XI1Z3Y9e0kRCaONDaRN4LR9+5/t2f+H0XhtfNxbSsaAPSZ
         7i3m8d7zAS5+SENiU/wHZU2/Te3ph1w8kjCx19pE0D++Xt3XA6TtH0yu9xuJIlS9MpKA
         q2o4pB+JXo499xZg3jH9iivZgQH1EFi2QlrvuHZPxqp2IwMTVSEUj/JSbrN8kADmBlYA
         5JfLtbg1dRt6PlOBtRpDvYrISOrrLEGMV9wSQ2T2gKTQrNT+WD+PLc0y/l5ZlHXGmCS5
         ULU6yinAJQlOC8/TC1Lg+Q2LMxFj7MrJp4+0qF2AEfNPsK6sXkpZ+ejwMsDUyKWBZiGa
         0XdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792407989; x=1793012789;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ast1zHJ9Uz2YssWCBu1jREzUx8HTb4eQoYAKdnW9yDE=;
        b=o5GOrxNTgbgEbY/7KlT02qyRgA/rAWVm51dG9NJ9N9vWDbvwl+KiT16Y4ibSKmYxSc
         c4GYleFXxRx5tVRtISLy07mwf45pCT8Udf7gFtVp3sn6RDoFbPEt9rb41JL74OsEOwpj
         XvGJUNNuhBkXZ9QhNf0qmMHwalsRRb/GT44NUrYY8pHqvLe+CRD6tAZn0LrzwfYyS/ij
         zr0Dt1cMqmJ3IvBV7SdDGyUDJhhPllTmfhrHVtITnQrsCKpzj0+GK2q93liUnW3nfx0O
         iU4iyR8GXZbXzs04h4RYYzVJUctItH/chJu7Yj9gMLGQId1mIgV6K+9KVquh+YOzlxMu
         7+dg==
X-Forwarded-Encrypted: i=1; AKwUvByEPAK+oXBcCEjYRr0TInsyfnHReb3WhwOCxqPMGwBizzOOeznffe95PhqZpYUSL8U+b+JNy99VEmMM@vger.kernel.org
X-Gm-Message-State: AFq9FYKGg66PER1Mq7pifcp1bQOsoP2mBATdGXghrI7Rxov4dkwPB2u3
	CIZtivo/9Uk+ItU0yJd4oWOuOO07I/KXxqzLwFb8GQFgTKefvEfjcVf6DjTBixShx9OWr/B1SzB
	96/4SNNtW1UGlSHh0shXAo2h63kDPCtk=
X-Gm-Gg: AYBFou3M3wbG8qOpSqZrqgcoTIm23+kzuD/WLzNvNaCW/dmOUe2DdLtzeD45xkUYsxH
	aXNWWs6G22hXzV+X6i4MJOkvXcHbJlFKJTmO5Zr457l4xLdwhwA9e68H+dm5/qOWMkLJqMsW47i
	CuHpRrlcu8oXHbF5/atvW5k4cDxvcgXjL+i9kBjXfCylIyB0JG07Ry0yTf5wjFPlixHZOSG/ynt
	TEOO9ey5Wu1c2NAYUBybvhRVXYFgIhLRnWtriFuK7RKA3tpRdVPdVThL4MU+uXnIuR+qfgKKQZn
	5tv1dZM7DIYfZP4e13N+r3f/P4Il4jizVav2eNdTEt8ChJ2b7NNVcROBXKnqPvCLF0lPbueXuav
	SGXHX4YnQpLUayEhrzQwy+2SavMw+ucrIw2YPdf7e1NeMv07Urw4ic//w2trjeBW8hdrXY9tMix
	G8hnioHw==
X-Received: by 2002:a05:690e:4004:b0:676:e85e:5ec with SMTP id
 956f58d0204a3-679ca93e9c2mr2047972d50.139.1792407988921; Mon, 19 Oct 2026
 04:06:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016162912.64581-1-lukapanio@gmail.com> <20261016162912.64581-3-lukapanio@gmail.com>
 <atX2Sf4GJNFYq2ZY@aspen.lan>
In-Reply-To: <atX2Sf4GJNFYq2ZY@aspen.lan>
From: Luka Panio <lukapanio@gmail.com>
Date: Mon, 19 Oct 2026 13:06:17 +0200
X-Gm-Features: AclHuK9BPbEV3xXNig3O4K-KotL1JMndrdN2hrEB4vNyiT7qjydGuoSSOSI_klY
Message-ID: <CACi=Ov4qxW_HmgcjRJLg3SWGKd2S+3rcevjpp8ELf6z7RBP3qw@mail.gmail.com>
Subject: Re: [PATCH 2/2] backlight: Add Awinic AW99703 backlight driver
To: Daniel Thompson <daniel@riscstar.com>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, pavel@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, deller@gmx.de, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Mon, Oct 19, 2026 at 12:51=E2=80=AFPM Daniel Thompson <daniel@riscstar.c=
om> wrote:
>
> On Fri, Oct 16, 2026 at 06:29:12PM +0200, Luka Panio wrote:
> > Add a driver for the Awinic AW99703 3-string WLED backlight controller.
> >
> > Register values follow the AW99703 datasheet (V1.6), the structure
> > follows the aw99706 driver.
>
> Given how much the structure follows the aw99706 driver I'd expect there
> to be more code sharing between the drivers.
>
> Cold AW99703 support be implemented by extending the existing aw99706
> driver?
Thanks for the review. The register maps differ completely (chip ID,
brightness split, enable bit, current range, boost options), but the
driver flow is the same, so I'll turn aw99706 into a per-chip-data
driver and add AW99703 support to it in v2.
>
>
> Daniel.

Thanks,
Luka
