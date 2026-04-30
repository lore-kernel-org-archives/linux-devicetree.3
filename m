Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F272D22689C
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 22:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777587257; cv=pass; b=Tk5wOYlDsFCXN7N2Tipoh/N884zVqW+KXqQOPNn+xTq+Lze0vijVm9gjFdAbL+AvFuFOmQO8Gh4nN20uNZrTjUEZcGy7xKl2WykSq70+RFLEqp4xin/ZEPYgjb2fRquMWWkr7BYVEmfVpxLfW/Bz51zcEpcX35gpRDi40yH20uc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777587257; c=relaxed/simple;
	bh=fnkadRgpeprmtKDbJ+PN8aevRiS6O+5ljTot5EgQs4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZL450KEOLQABzliiC5Hn+8dyo7VoDzmxl7tht2SdhZFkcqJNzQ9sQaQEGRVzmZ+9DWIZnfVVH/A9N+BI4oFhi00W+lmQMFooDYS1XUx4LAbm2aRMwEs0zSee7XCsRuoTx6ClYJ7ATjxibsvzeHfG2RkhfE8eBvkRONNk/0yYTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+OQ2IUB; arc=pass smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+OQ2IUB"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-610e2e8f57dso588331137.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 15:14:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777587255; cv=none;
        d=google.com; s=arc-20240605;
        b=N7xeniNXG/i+TZMN8/I1f5z066sgollZlezwFBcj3sKbSl9oYTY8s8bxuPZbFM03m0
         zTobydeIpYPlmQiaIh+sJCOzOrnlTxbA7RiHVQa5DcDkSbVzW3NcDkQ/uZmr3JszXA1T
         HLXVwBWqRJHRkeq2c5z2PtuFUYAj1r+ljmvasUiOQzqwCp7BFtDySF4C14Np4Epo+tFq
         NqAJ3sT8TYgWMPCwJk1GRtpemE2fYJcE/SPB9bV3SKSRVU/Q9/mWJtVEuKNQhUa0Qk8F
         u8MSJ4iWQEPRi0D8Lsdm+nLMmyYdn3aHLEKF+wRag0NsSE/FbPCBYqDsyqHn6Bni5bY5
         tEUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fnkadRgpeprmtKDbJ+PN8aevRiS6O+5ljTot5EgQs4A=;
        fh=y35Ng/QcdNJXXebxm40CA0ti/rYiZgZin/1ssOpdzxs=;
        b=Xg+1BnnAKLqQWC188PMxUZ9Og5m/GwB1c+eEsxSs0w3DejtECc756a7zjkk8aYYVKT
         nbY6FkwzBdjWc8C0qEF9Tl0WO2SdfKQRptNNYCwUlZukestDjQtu5/DCf2ekP+bTl5qW
         lV67kWDA4Gd0YdcrihSiSQMUDiesS6HFKFyrSX7BkyoFm6AmGUgh30ntE+sD+jvy4VvW
         gPIYtTFRwnUz4wwTu7pwuT8v5USuHdrimhApsOYHkyX7SvJnygykuTDDqveezUSM5Ty0
         gUSL3IRtIJ7eyz1FnCKQRlruiGt0Eh846sEp0qNmAP2mGaAfwImloB45kFJftRkYqils
         /Lag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777587255; x=1778192055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnkadRgpeprmtKDbJ+PN8aevRiS6O+5ljTot5EgQs4A=;
        b=f+OQ2IUB75xn3Gcbzrrh4t7gQ6yWlx9uxWjL6qYyehudpAnrieew9rB1v+mmzGZT1f
         LKr/1B+Ss5QFQiVZ9roRKS4/Xv7KB+J0zAjqn0bNWlFL3CgI8iheT8IPCnjtIgnHe0IT
         adQN7Ppl37kep6uf0SqWhtGhwBmfS1vSoGPt7cmXZhH/HNo8vnBLOSDcFHqGkof8la6R
         7zJOt84/TuvYwN59vjodsBsB0o2GjR3edXcjVkI1UVTc+YASf7LgzrHIj7QWJzVXankD
         C93/BwD1Pb3EJ9Af/0cfJmaVZ+T2+F25VaAI5dxYt8YTu+kJjdl3BAPufpaEwbn8wdra
         ildQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777587255; x=1778192055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fnkadRgpeprmtKDbJ+PN8aevRiS6O+5ljTot5EgQs4A=;
        b=a5OJDFgNw5PKYxvZRlYBxjN1c7iqPJDj8DYcweIZ8FnN8Kg8JtYaPS9BZvIN5kXJ85
         7D+jfM6knE7ieMIryDEUsOihqF9ACyqB14IusoTXEv04Us/MQjJ8LgR7J6F9QJfi8pJC
         aCJdWzSgVoNC6ThAJPDn78VZ3Ni9I8b4ZW6cG8gLWZHXn5k3pqY+vUdg/Ix6ybqV95eT
         d8ZjKNDxg62nGMIiQxPLcLbCiMqe3VK+E5qLaT9GiVz7ywydDPbr8mC63kg3lfWoxq6n
         kfZeiNcM6wPCjsemQMMzJFOC+wb/RMj8WCnTIs/QqOWHeX4DvXwEtqQn5vQR6h+97bBc
         GTKw==
X-Forwarded-Encrypted: i=1; AFNElJ8qNdKVNxjIth8DtS25esRSrpcIU6nYV3jOur1ml7i5x3SPnPbm9sFuCs4V4TuVNJoGNf7IY+963RmG@vger.kernel.org
X-Gm-Message-State: AOJu0YxTZX/JQdsee4v0ZPAnyJEy1McBSNz6NcyDW0Tf9ps4pPGfDzWK
	H8lkOe5AfT9OPmLiVKelQt3rZK2V3tUXI/+N+Vbj5pDhpL54jPXLXhqcrKhmc7P3UpMtbHP9fKH
	9HJw8xMhSiw7C1i7QbdnuW5LRLBh84wU=
X-Gm-Gg: AeBDietmw5aXG9sDnustq/bCPo4wyM3oh2LWrWlBtynGahbsazwterhtioZdJPcCbFR
	3eXZPVdCDi2Mr7RjcYbNwNUWoRqLPViz3mi5ZjHEGUALuU1xqiNgRQ8wa+G2E2+qtqmj0X93B8N
	7naydhCjKNApOuZCSWY+SXLj70zwo0AInDjO0TiLCWuN9PfpGAU6AQFyLs9oFLJJuWPHWFDwled
	VDTXFwqZm6msqV9bf80al4Msm4uDP/elYg9NKFdrtvnPCoGPmgRGqOIdcQHJy57ukjLAUrhOXWK
	e6X53S5VebNvAiWrmKmWGcNMyufnPiwFXFv3hUUf2KXFClwRPtv8rFWqrlw/
X-Received: by 2002:a05:6102:38cb:b0:618:3503:5663 with SMTP id
 ada2fe7eead31-62c33007bd0mr347932137.8.1777587254750; Thu, 30 Apr 2026
 15:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776872453.git.happycpu@gmail.com> <20260429035134.1023330-3-happycpu@gmail.com>
 <CAD++jLmOO2UmBUx0CseCnrK_Dyw1O=MbeXzOmvuvSSnN12Vchg@mail.gmail.com>
In-Reply-To: <CAD++jLmOO2UmBUx0CseCnrK_Dyw1O=MbeXzOmvuvSSnN12Vchg@mail.gmail.com>
From: =?UTF-8?B?7KCV7LCs7ZmN?= <happycpu@gmail.com>
Date: Fri, 1 May 2026 07:14:04 +0900
X-Gm-Features: AVHnY4JkbRdIMPXcavkf1aKOaenr3awK6baJ6X0mHvd_uKOoYJ4bVrDtc31ZKyQ
Message-ID: <CANh86Rbrza8Txh2QAPZ5LEsfHW9V2L0o0SdyszdA_=f0Vs2ykg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: 74x164: support lines-initial-states for
 boot-time output state
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Linus, appreciate the review.


2026=EB=85=84 4=EC=9B=94 30=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 9:09, L=
inus Walleij <linusw@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Wed, Apr 29, 2026 at 5:51=E2=80=AFAM Chanhong Jung <happycpu@gmail.com=
> wrote:
>
> > 74HC595 and 74LVC594 chains retain their output state from the first
> > serial write onwards. Today the driver always kicks that first write
> > from a zero-initialised buffer, so every output comes up low until user
> > space issues a write. Boards that rely on the chain to drive signals
> > whose power-on state matters (active-low indicators, reset lines, etc.)
> > have no way to express the desired initial pattern via DT.
> >
> > Read the optional lines-initial-states bitmask, recently documented for
> > this binding, into chip->buffer before the first
> > __gen_74x164_write_config() so the chain comes up in a known state on
> > the very first SPI transaction. Bit N maps to GPIO line N (matching the
> > nxp,pcf8575 convention); on this output-only device, bit=3D0 drives the
> > line low and bit=3D1 drives it high. Property absence keeps the existin=
g
> > zeroing behaviour intact.
> >
> > Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Chanhong Jung <happycpu@gmail.com>
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> If more users of this appears we can start thinking about brining
> the support code into the core gpiolib but for now this works
> fine I think.
>
> Yours,
> Linus Walleij
