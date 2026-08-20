Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21390395D86
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 18:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787251488; cv=pass; b=JQmiK8BD+reRuiuy6A+aK49kP6W/EvFn0sAZCemeMytkchel/bZ6DNLVcCgsYfnhIjmdv2ENnE+YOdldKM7VDEscKmMuab8QeKlH8fxkcBNDooBmBOYD2JUzLXO2Lk/AzTv8wOAtIw5CTzCtd6VF6cU0b5wtHsO99SE0z7iv2cg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787251488; c=relaxed/simple;
	bh=yLRNqZLs5JEFP4GF85rDalUqa/Nrzf5U89CqwrivLfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cvMg/AnGSoJGWb7gJUBZHsU1wdgZXbw0VHQQz9nd8gClzrj5VL5XxhQ8BaKgCdHERIUyUsJzavb2Yl4RDeRA7KNdrG4QHxJ0F0zhP0ye6MNuehTgT3wc4V/3r6tijuG1pAPR3Qw2exqvPR4TORxvPuTtypY12pdC0gTQ/J/g3LA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4KQF7W2; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4KQF7W2"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47fd4531020so165939f8f.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 11:44:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787251485; cv=none;
        d=google.com; s=arc-20260327;
        b=IxW/esQ6xQWZfQjxvKR+IsqV4q2/rCIVQu0SMPO0V3uTjfy/MGlLGpL4sMMU1kb6r0
         dVO4fsu6PlVbr/tuy2i6lY6ACADBK8CIEJNC6xXlWpRXwc+2h3jmgsTKbHvO47J/3qXz
         cvHTb0cvxAdS1Rcjyv+P26NZvI83s31hovXxM/96POuHBMeFnD7jBJdgnj97a6mrIyAG
         Z67CMzJaZlSEw8rsoENTFyYIs0CiCSrkBqY6kKCmdatjziZh56AZO5V++zHKhKQpEjHR
         3H35vfWOCX81XCcnEuOPSxF0AB/a0F4mHf9HCC/6DJxmUlH1wEVn22TRRL9wYE/fbXrP
         VCLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yLRNqZLs5JEFP4GF85rDalUqa/Nrzf5U89CqwrivLfg=;
        fh=5iYV/jlbdfmd98+HEY98FXmCCKhvmHxlFd4UrY9Stco=;
        b=VE9F6EFWPJ77I+FnuL1r7F0jSpfjSzfx6heeFE41Rw0WtAnFP6uEugYMGboV21awdY
         5hWYhqOZvSYevMGRTw5jqL6BEQaN+4nKAqhflyyqxwZqeKA3fUkcO3F0qvCOzXJ+88HB
         h1RT78/GwCgFsP4eiGviE5M7NxurCZoAkIc5TS2iOyC06Zv4urEbAN0WCDhURGwS6MN3
         MoPxpqWUnJo0dNxmGcigSorEYIOtsMKDlxV2krk2y4nVHIsU0QCY1JDo/y0Nz662yHP9
         Un0KzB0TBz7K7iQ9WdZ3RJgRYwmdIfrUt5Som05MEHDEzlodZI/VzFYGMCBfCjg+jXzU
         rkVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787251485; x=1787856285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yLRNqZLs5JEFP4GF85rDalUqa/Nrzf5U89CqwrivLfg=;
        b=S4KQF7W2K/ilwMl2g/t3p+fUrAFcbEyamtwctejq8kkrtBEafuHsracCdswU9MjQ1b
         4UD2wu4rE2RqJ8dk1URutNE3ZtZ4g8koAVvKeabQ+6RIjj4r6TyPC6y9IJgmCgzLzL+T
         j0LO9VWTvJJJPnmRICzMT8mR6/KBa/RIkbV5ZtjRsTFtIPPkjrVRG8hT1eBX07Hja+Fi
         zjhCVnT6gC2xugElI3Pb0lBGAivv/xDpOuaQO6ktxOSyHmpq/bEfLSYtYyF+G5288j6G
         JlxoN1fG2S4Qs45uNsy3XvLYcnOmgTsg6lX4KoiLA24eLsMc2Sy6bUjdXUiwoCEPj1F2
         lWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787251485; x=1787856285;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLRNqZLs5JEFP4GF85rDalUqa/Nrzf5U89CqwrivLfg=;
        b=kMImMGDn3f68dKNTWAMlfLz+OzxbuYhMz6wXrOWk/H8gWwjp31bo+DEr9eiD1mmQ/g
         +lS28EfeJwH0NSsT0JCndSWuiIndSALp+AYpk2WLz0njqvp+4RiPmFJ+RUaYF0mudmV9
         Fx+Av9vLAYqw6TfSQJ9DPtvTl0HF3vh6w+O87UuYv3N3GFCs/SQUUhhpIiEnsVymwTY7
         nOYXoYqB/uidMuhS/2oojYGe09oSDm8xOUfFjPS2J3f6EbNXjWYGHwJrhpg5zrpwZzuX
         E7uLbNuMtpfg5TGY4dB3uX2zbpXlAlZUiKpZN/g5x1KV9GQbwyQGzV/4tWVE105u2WMw
         0dbQ==
X-Forwarded-Encrypted: i=1; AHgh+RrJTejEDwXK/Tx2+AzeRS6l3XwKJlWMK7IVYZ65GQRejNho2CCjEZKMpB6N/uR18WTjbfd0jN/IHtdr@vger.kernel.org
X-Gm-Message-State: AFuF++mIEAojHaqQ5sov3/NquHq6wI/npOxNwZ1jQd4j53aLTjIP2WH1
	3k/78F9PP3BSs1n9El2mXuY/9r+ZqxIzVwyjUoiyf1xscldCvIeNkzx9NgMDSvStXs2pd6xfzKu
	UOitwFfCv2tTGmFh94F3DrmSciejoJns=
X-Gm-Gg: AR+sD10O4s49RDMFWu2rYKIgSPW34Oghi1Mk2+TnbKBh8AVB2Q6DmUUDq87i4sFQDli
	9rOA7Q7wF8tNPVcO5tw7rCHEPEUy9djWKo+ThGdEDifz1YemgK/eFajFNz8PGYHEL67knU7dpKD
	LouoMBUUQCV8VfKkZGQAyguDjvNu/PwGQgCY7r+HhMeUtvdkqFgITztd31y3SliG9ebcQ2quPLH
	UM95vn2MWG68ZwAzCfpDm2EsgNpDthyiFl6njx7/6TY43aA9nljdbmsq+/PdwCMxAuKCx9UTEAA
	rvoPjaeyUFc4Bpf/Mao/Wa5drbbYTo1G+HWp4kIHlXq/50nBcL/vxHUAFma5hTnupcaWHQzQh/x
	PvQ+yIWNTnMUAqyOuLZJy7sa/iBVSBQ==
X-Received: by 2002:a05:6000:2207:b0:482:a610:7a27 with SMTP id
 ffacd0b85a97d-482c0b9d152mr1364137f8f.20.1787251485416; Thu, 20 Aug 2026
 11:44:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819103926.2136712-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819104926.DBFC21F000E9@smtp.kernel.org> <aoWq7VdKlAl_jGQQ@shikoro>
In-Reply-To: <aoWq7VdKlAl_jGQQ@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Aug 2026 19:44:18 +0100
X-Gm-Features: AcwNN1Xgp0Pu-QrUH3se_72By4o489NWiytQVn666RbDbhV3ffzDpMM0wJcWhPQ
Message-ID: <CA+V-a8v09jMv57WpbYbJfZ0SxiFD-d-9-+=iXdWN++G9hv33yA@mail.gmail.com>
Subject: Re: [PATCH v4 12/15] rtc: rzn1: use FIELD_PREP/FIELD_GET and GENMASK
 for register access
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, 
	devicetree@vger.kernel.org, linux-rtc@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Aug 19, 2026 at 2:09=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Would it make sense to wrap this value with FIELD_PREP() to enforce the
> > compile-time checks and stay consistent with the rest of the patch?
>
> I don't care, you decide.
>
I'll leave it as is for now.

Cheers,
Prabhakar
