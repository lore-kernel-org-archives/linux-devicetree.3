Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AED381E8C
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 16:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785775016; cv=pass; b=e/it/QHUWqD5ghvMzdg77oYWBE6oYGcQ1stKm9Cv3kJrHj69s44gAr3r+TId++xoaaQx4ODzDkXcnK+EBeGcFf/Via2sXejQQ/tDOlLas7sXgPYRUOIMQxMh6064ly3C+u5qhMF9runvXiCLx98Zk6ykJUQ8bKrTl5IZ1IRa9oE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785775016; c=relaxed/simple;
	bh=K7WSdWoRnNatXjyT6a0V545KuC7+pJeUxQF1yR9byhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k3/Sy785jTV+V5JHN5vbtindkc5YE4QQXxNdKGGY8OFix4n1+mWL98Udff/HVBlBhQCbj3EZb028lm6Bw6bO5VXOjhLD/wtZ0f/6p8aOzmPAaZ6tETq6DBxnJIClmkEQq25EprusyBLjLiC2XXbb5fzdpypb1aF9SY6l4s8FzPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EykJ06Xx; arc=pass smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EykJ06Xx"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-738a5cc517eso2523570137.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785775014; cv=none;
        d=google.com; s=arc-20260327;
        b=iO6kGsWg7NMJ2U0oQydtWd+rP34BDesSCd5kRLbFXxZv3tQZV1adjXDx25XCQKwX1X
         tQQqItfBSz3zDTnZI8v+nnqj3uVbeDzARBU81Ky7zAWa+xR6WYHuVldV7tZPzMcl7fwf
         GwoRDIJvy8B4KK3hjf+FgrXxZ1ABsrxcGMAlfe4Dkibw9+8wSL5MLWY8dbuLRAqwCYVr
         DQblRxuthlzHQ6xz55heLx6s1U0XNXX5lDAwOLQesdohGJ8SuFeVNwLfaDpOd4PuzfOb
         wJrDp6qPwij1hvFsVdIkDXj+u0tqqWI5vCFA98vIgDwhBXaxAO/VTFa8TAFUUjJVkWGM
         jmVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y2mO7QnlyPovrqJ9WwdH4iPAu4v/YWoM0OB9E5eGsqI=;
        fh=1T/1IIbl9nPWS6CRmetcJ93BrXVNfr3kxpO9n8/IFLE=;
        b=pe1u2NjAZpy7NvcZXzKyuCg38/eM+/z4LqEZeHUhWUzDOKZla09vtqVnXDM9N0YMkU
         6WddRkZN2lScWTiHyZmV2VYx341rOJMjgSvc1lswibJ5Rz2bd+XA3usaKDkp7Hrppc5e
         B+GOwJnA7CkMfQbXHSgP/jWvv/QqeAqw443QvWuSMADdrfIBQ/+v0zLco2PmDRaCaKz+
         AoHRTG79ESzgVzVkIL/KD87/zYvUszYRik5522jzCJFz+5nJZFPDwy5CugHHsfqmsOFe
         0qNgnW761jfxmm5VgMFZ7uLb6ZnZfctH/cTNBjM+YJrvbGgIJn6sxrMVOkt+sZO0IDWB
         z34A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785775014; x=1786379814; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y2mO7QnlyPovrqJ9WwdH4iPAu4v/YWoM0OB9E5eGsqI=;
        b=EykJ06Xxy3io5WUp+JxhY3YKHP4TLnN1+ZdQYVPUJXq9avodpuMT58zhsh8LM3vZCn
         EALEza4CeBVCDJXGQs8JH+XDtnp1R+GOR21cKcpADE/S2QpagkdngTrQcpcsvaT3DvQQ
         3bzTjMNNvo04cpSh/5EvEq3Z6YtV3TfstqrtBRl1tPZDLkIvdDyCdWCGXOyrIkTTpvFj
         mPqfj/cxbVkYkTz8hsy0HTJ5WgNAJ9yHlnrTmW1y9ay6oCoSWTFH7KVAvh/ldB0lUFZN
         5nw25FquknG21anGdE4L9nqsMkHVT1JewOd7td7zRrk1+msGo4ExnpD4jZZlfsSUIu6f
         Z9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785775014; x=1786379814;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y2mO7QnlyPovrqJ9WwdH4iPAu4v/YWoM0OB9E5eGsqI=;
        b=PpokzHUSHmm3uyfaypz7rju8Tcym0fZapNqgP+9oIKq0Q5RCXNHK5PcBaY53uIYIUK
         LK58OgHi+IpXTHunPx4+Qm7sj6XnPazhHtd7n9SoneSqu5MsqoZq7iCdWjiBTrBPsYMI
         9dPaSowpIMb9hw4vOwc+QVebGV9xIoVG0WHBIy4iBiIEiR+T6bWDi0FHxcd9vWx2STO1
         rzyOpVgNd049eHDcNn45hKmZluEYUsXzIbKmWqqSaulfW3L5Lhi0TWiZS44SWAVizzlS
         ISld/uMobD2axOzSNkCOdANryQQMy4jWNEmKdqOJ8FrjT2wn64yIra/kPk91bkxkcyKG
         lUuA==
X-Forwarded-Encrypted: i=1; AHgh+RoMDAnBhJzLIZpckp71u4/DCYNobh9Jm6zows7xQNZB5i+tiy3O90nvGsd77XwW2A2xrQRO2OjnH66U@vger.kernel.org
X-Gm-Message-State: AOJu0YyAqo2PInpkxgri0a4AHsyX7TW5sN4t+Pvc7LijAFuCI96a8C6q
	fsgZdc7EtkgqaALdU+t98hMNXefgXNuHLPLMDWQN3uExJaC7I5I8PSEOs7BoHPOuK0EtiqD8KrF
	w/m/5UvzxTauNX+H2cTTw0Ci55YdGSCA=
X-Gm-Gg: AR+sD10M/iljWXlOhkCINydQN0wkLeLvjazhx9hXS0uwJKoVAfWYK61eqNreb/pYWgC
	xXFnu+PaN2g3BSsFuVMJ1BcwzH40ywHNz4tWFn75Vlrb2zC+x4ax8XVB2ttwSq4DFLdJLPnfYxH
	CCyNaid6UriYEi4YUh1jBZTqMl/Os2ZbwrkCgq11JorcS+s+bTlXbnzzbW2yj9qCWKyoTeJXqm7
	kL2AI34FFg5DCzRwYg35AVnSY6mGGGY6LMKlC8YRpA1RY7FS135cbo49BZJNBT0A9w/gYU+pxPW
	onGx+QMCUtUAlvl8XuTj3mtY8EYWibSiK4RQKaH626VBi+ERR7lQ8tUz7EAoFKFc07B7q7XRV+Z
	XvMNzl2wcbxSA7OEBcu9t1tYrFJj7q2icG6sWpxj7sMoperTeb0vuSIpCQ7N39H8V/ciehnyquR
	SBRvdXVBsTpbhrN3nUky19A6SNSrgIn+JwEvNlKhAPWK4qXog=
X-Received: by 2002:a05:6102:41a9:b0:740:2bcd:24d2 with SMTP id
 ada2fe7eead31-75b2245a880mr8777953137.5.1785775013743; Mon, 03 Aug 2026
 09:36:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-8-0a53cd9e21cc@gmail.com>
 <f2cc3c90-060f-40c1-a55e-e2ed91e65487@kernel.org> <CADvTj4q7HnOYJZE-M070-1npEdne__Ct5D9FeUNVVXa8Bsm7qQ@mail.gmail.com>
 <e198e8fa-6c5e-4c8d-a4de-d8bb25aab0bd@kernel.org> <cd177647-827c-481a-9ac6-5f5a1882f14e@kernel.org>
In-Reply-To: <cd177647-827c-481a-9ac6-5f5a1882f14e@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 10:36:39 -0600
X-Gm-Features: AUfX_mxf143l7ltuwFHdM8jtybu0jFAqTogB47kH9lIVgz-FaKgqQGV-oPrZGYA
Message-ID: <CADvTj4qby5jow6BkvumZFK6cF8aLCTeQZz39VKEdm59jEtRp8w@mail.gmail.com>
Subject: Re: [PATCH 08/21] dt-bindings: mfd: x-powers: add AC200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 2:21=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 03/08/2026 10:20, Krzysztof Kozlowski wrote:
> >>>> --- /dev/null
> >>>> +++ b/include/dt-bindings/mfd/x-powers,ac200.h
> >>>> @@ -0,0 +1,13 @@
> >>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >>>> +/*
> >>>> + * Interrupt numbers of the X-Powers AC200 interrupt controller.
> >>>> + */
> >>>> +
> >>>> +#ifndef _DT_BINDINGS_MFD_X_POWERS_AC200_H
> >>>> +#define _DT_BINDINGS_MFD_X_POWERS_AC200_H
> >>>> +
> >>>> +#define AC200_IRQ_TVE                        0
> >>>> +#define AC200_IRQ_EPHY                       1
> >>>> +#define AC200_IRQ_RTC                        2
> >>>
> >>> Hardware constants are not really bindings, even though you use them =
in
> >>> the driver.
> >>
> >> Should I do something different for this?
> >
> > I would just drop the defines and the header, because these are fixed
> > hardware numbers.
> >
>
> Hm, unless they are not and you added abstract ID numbers for both DTS
> and drivers? Then this would be fine.

Yeah, these are more abstract ID numbers, they aren't really hardware
constants as the driver translates them.

>
> Best regards,
> Krzysztof
