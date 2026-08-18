Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6162334FF41
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 19:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787081688; cv=pass; b=n1MiuiCYic7Ml/UsvP3bgyaMziSo0xrcskzj1T5NpdcjST87iuLOLlpsUNv0UoES4fwti4PnoPUKP/XmyhQsHTOU2oPpydJWWiHRxlChwoPldgXmBhB5/sZ1chUnAr0hFLKWV19VvVmLKIC2qfMSsbm+BclrE08I/TYFSqMJeM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787081688; c=relaxed/simple;
	bh=imOAJoTbqtdCnxvxR6vKM5C1qRjLvLLi/vpXEB8Z3rs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qdgJ1xQY5L2/zoZWNt6sUgVtZgwXm98H8v9Z/pHtKglv4mwl1uPMu4tdrb/NN5mwQSZPzsXG7E/xkBaOrxdZ0U+REGb+45TjbG40P9Wm4NUI+kq3b6UhikhSR1gDGQq4/6+mxluysoZZ/prvVPpKlYX+9XdXkZFePh4iQziY/F0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4iU/tqb; arc=pass smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4iU/tqb"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6ae88f4e4f4so158459eaf.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:34:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787081686; cv=none;
        d=google.com; s=arc-20260327;
        b=bKSq44U459m+KTv7aQNfStKw+jjRWb2LG4LtZjkqd9jpdAdgpA9zWwSZKbohHrcC33
         k0WM8/40i554vNHUCYk6H8QaYYT/JkkC2PGCylWNX7Mb8zOOqWYzWKOevlXvkF/PinS2
         ZSYNbmio36L5CkJb+yJY3cukjNNhfjtd+yRXFHx3pUQ+l+JXVkEGslrduMI3vgE+9DM7
         hodBXgj6FrgwZTRhIFdPbFkZfla0x72SbRoEK2tfpgIWUJxTUzof9CwxiRVaPq/QCR3i
         qi9uCbPXCu0YBEUa/j3vg7/DyQvhhQCqjbBAJiR1C/o5LGOZkM3zWri1DhrbMHsG9zke
         Og+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=khxcS0giWc30dF3EjL+k9ObGgfjXp61CH86spT9PE1Y=;
        fh=yXvaVQNvXu7flJ2p2ZS93n/ZvNcMvOr4i7C8SmHi1cg=;
        b=eBtp4UeAHeJXr5TFh9T5wmemcgXAB+H+NumLLt8orJIL9Ee44GRqnc1aYCu//+ELTB
         eSRDF506jqOKkIpdf+ylTWsZc2FZS46w/F8ziEcFuM77WFzUbiWCcg5BC+gttvFy4EUR
         rxgIQaRQDc//6kPbh8VMFsulyYIfcEJNw/uW3UKjalmSKa7cyRsZlJ/QOOf5aUvRtkvu
         9YPu980dQAg4pWO2PiLacOO0MWp0NDEKzxU6ju5MqL9f6BeZyyMLhAYF2XicAynl2fUm
         v2MPvOVBTIurBMIfuJJerO4bNNXQu3Xxmv/gB3c+if1CUXrcqRmF1W59zGkCnCpx91gy
         yvCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787081686; x=1787686486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=khxcS0giWc30dF3EjL+k9ObGgfjXp61CH86spT9PE1Y=;
        b=c4iU/tqbrMcsYVKpjzOzAH5GPSotOQAxAJjGTolczSkssC+jzSx69k6WGohoOePgyk
         2w88A2PvyG1HZNF59j4X0Q3g21ghzWhnfsS4uaNZfogs6s5ww0lc5ElQt7rICJ7tnt2Q
         U4Bz6eQEke7ZsteA0eRNquJ4dhSPNC1lHN8GQ6lMNJE6E+4yO+GcLYD+6RwaQPzciiOe
         W15L+Qw/6bX3CIqI8N10w8e41T+NOOA65Jxty1o0qnjnuriqVxyq5/N8TCXVgnkRduhG
         qGXISSnT3kp0CSxQl6OztbWcG0vCbWiSSipOByQ9K4lKQFGdRNqXXOMWPHVwvH21FLhZ
         7i8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787081686; x=1787686486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=khxcS0giWc30dF3EjL+k9ObGgfjXp61CH86spT9PE1Y=;
        b=QEUCuR50CJ1ey5PsgoF9MrJzg/qqowrKmAqDQ7qKKOrFbbVB6z8pWWJ7blKDWstsBa
         NwulO/yKsbo61IF7+MBFWMzLiZhKmnNLSfI9PCGDs8Rraqbsejn6UanF3nNMGnw8njWH
         uB0+D7MGYAWGI7Zr5lRvK5bWzgTS/7t3ZzQscSw/abMOwwSRpKLg4K1I9M82fG2i0MOP
         BcXIjIvZbFDeNEyByr35vmADP0V4TWe5zkTCVrLcDT7ZcKiSILrtQMhKxiQp0uzwcSNe
         Ey0fT7BD0YW3+wSgZob8EjGRLLtjIMP0TBCPGMgfcgdRT7iPid2i/yg8ds5nPQZJT623
         0KgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr98gmNI58EDu+e5QH+jMX2CX3lUX5DIkgm3Mo2juzOEaPLaBEVBwzsT0tG+5MthzP5jChfayDkCNQv@vger.kernel.org
X-Gm-Message-State: AOJu0YxjDUfsa9pLjVXuEIHYHlgOK9CyGi5Xz+sVSU4ojoEGdFPG6uBY
	mwrUbp2HhKq2zH4ZZD/D8+IMI4X7i18MkV/iVDEmT9pmdKPXMNJLw3JlmhDwW8dhuchGWie5pUK
	0sD1wEbqME1pNgYg9w3HwYs7dGqU/BA4=
X-Gm-Gg: AR+sD12It5pv/UVQUW6tyqVCHF9fcInlOootgV+nsesZzf0t7n2e9OTcBmpToCq1dfH
	yBg6pZ+qwKI9x7DLuOpuC+0vJQj1/sP84LAsQoFcQ0jRsUqX05xLhzMnFSQl8NO9QmCui9UUwiF
	srmsaSSBMLvPwzlGnvpZZKRcAsD4ohHlRyOF/QUVvaQ9Q0NYwCZOEk7fnxQlQQrOz2iRZzUqsuI
	3irmEs32EdXIbNlebb+YZ1JtdUJ9ZAdSsOifhkp7VdX6naKVb+XP7KAZ1O12xu87pvG1LXv/mjk
	IraVB6jMF3/hA7ALixk0fZH7Ax/zcYW6vMT6Dh+9XB8lpyKyb3DFIaHvwt3/mJdZTiRetEsTOaW
	VbyA=
X-Received: by 2002:a4a:ee12:0:b0:6b0:fd2d:d338 with SMTP id
 006d021491bc7-6b11e3a24edmr9098624eaf.36.1787081686291; Tue, 18 Aug 2026
 12:34:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818080626.30430-1-amit.barzilai22@gmail.com>
 <20260818080626.30430-6-amit.barzilai22@gmail.com> <aoQbR8lBza8kmar0@ashevche-desk.local>
In-Reply-To: <aoQbR8lBza8kmar0@ashevche-desk.local>
From: Amit Barzilai <amit.barzilai22@gmail.com>
Date: Tue, 18 Aug 2026 22:34:35 +0300
X-Gm-Features: AUfX_mwtc59HriMGQNsEeKAgTrbC_8hMlc51GbBF3AXsUidCRTon9Oagb6mSMZQ
Message-ID: <CAOEgbEqhKAECWuptksR+02eF0jPW-XF8AP+2EqZhPk6OZC8JfQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] drm/ssd130x: Implement ssd130x_write_cmd() on top
 of ssd130x_write_cmds()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Piparo <holofermes@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 11:43=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> > +     if (drm_WARN_ON(&ssd130x->drm, count > ARRAY_SIZE(buf)))
>
> For byte arrays sizeof() is sufficient.

Ok, I'll change it for v5.

--=20
Thanks,
Amit
