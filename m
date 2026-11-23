Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.216.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795459307;
	b=HmEYLAHouVbSCov0IO5/JuQzLOQL2I/1YUGz64Nm+hcDD2pmCNTTb3SVwwCYU/4MRfXy
	 6iToHfezsXwISM8ZsP62oXFA/j8zPXgeRo1UqZToyf6aDVTeJWYbRUbi0bBlqYWkcs71K
	 IXSAdM3m88KvKIA+ggcw423a3P4khSZtm8Jx6ijY7KS9CbxVafXIdMZ4bmb1zAUfF14dm
	 RUsx6Bw/tn7oL0oPnZm6Pu6viKBFZhmO+6cxUOBarXnr9l35CMTLIZ+KrFmVbZ/fZjp5O
	 fHANkN3itDE4kMnf4pyVczFt2X3SiqUf78j4Tz49iJEer4MVVhsCDqG95qMqKDd+hdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7KCCFV8c12xHGuVa12sa42pR/GvO+E15oZ8scml+fpM=;
	b=pPj/XnrKuOf4XMtu2ipftls30HNdMpsXDE7Ut9hAQgKXnnHdJSbxlEAroYKEyLfKkCCq
	 KgGEvTGn3AAc8BZuQwWP0rEqP4lfatN0XBB1o+DkjteHFgUboGpwbqJierC2UYdIDaYLt
	 zkwPSaJO4kB5iMSdk9MT4pfDTGzkvFkhprnItiC9ZBYDFsbXDOw0Bw9d2Lv3MZ7JJ6gsu
	 PkW7eYlK9FAvu1BTb762h3wbSqfhj//Xohdb0Zx6enk0vkc9OJAntqLty428V+GyyiHTw
	 toVIwSGm+Z3WVlNBgfJMCaDaaMV+1xfazpL3XLV9DtYBZw6PHM1dKz8nGx4J++DchlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rjiVRAas;
	arc=fail smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E958D606A32C
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E958D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rjiVRAas
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so2905701a91.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:41:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795459306; cv=none;
        d=google.com; s=arc-20260327;
        b=P69+2WV4NOPQRO8T+bkX6l2wegTGhrg5dhbpQOcyVLfmZtKIwZoc5TtEhE08WRMmA9
         CPnwF4ekeezcctpZfRRcoHrCXwlPeVEuzcRe2tUtTYbY3nwyGvWHJCt8gV4okguejWac
         3beLgeYrjuSOQCr1wOkZkrE2qAkhBkSBeiVVO1u5qlcS0xUNKwUwftzCy5Kj/wSFGj2v
         mNnfq+llI+SYMw8rnhHM6252V9Mpmisqv5umHmt69k//jYK0DVxebGJo26dM1G4o6JTH
         Wiy9c0DMzrjTlLewDXKPFyPhdGe20jXP64iY9QZY+hPYi2UqLczb1ShyqNMh16QI7JwV
         l4UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7KCCFV8c12xHGuVa12sa42pR/GvO+E15oZ8scml+fpM=;
        fh=o6Gi7IZ54WAwfgUSGLKBIxT/0eE27Wx5CsNWZuO0bZI=;
        b=ixUgwdPJ2ytCyAqhfkYQQxE+sNo2Tjr+mEKOXH80eVWliksJijNWV/cSytjkPx0BlN
         JNeUtQiPhPEy12jaFnnopyu1k8q93zX54Nx8OIZifIEBs/2RkD3g3UFto11hRwXn4VQs
         xtgD1aCC6Y1tWyGj7G7XGabgETxCXJ5mD13CLo0bYAVhxy7PQytirUztOG6SucxEHM8F
         Um0Qxv2twnq0fDLYz5bGJkkSb8kqba+5lLSUcYQ6qwGj53MDDizRuk0Kd2u/vHcbyWXo
         vcbyf0TcecFhpdE1kahxv3q0RllzySPFb4alVDsxbhvp9Bg6qjvNWnhTSE8cMnhFC/1V
         oGsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795459306; x=1796064106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7KCCFV8c12xHGuVa12sa42pR/GvO+E15oZ8scml+fpM=;
        b=rjiVRAas43i+JWsmqDO2xHPvuZ8jYgiEFFguUXxTZ4mN9wumtCVo7sINa0uEhMrAPg
         5KDVpas3kj0cqn4ubJTHczSggRGc+2oZnlyhoFO9xYGG9Kvdm5C1cZIKnued+BbWIxjA
         GhA42IZUkfffIopjA6J765vebjE9N+UOt1tDU+DIYX4b65lP8sPDAH/at8/LQ7V1HYRJ
         DX5YQDjbhvgQOywaF6NYUtWGKIpuvNhwQWTthT6Ocieu6ZKe9ubXPHWTMoQQQm0fA/eJ
         I1td2fdcwa+RmFBXT/PqT/cxaNjxrlEcb9elz0SuQPNezhMbhGZAmYSDrncLjMQl4juv
         AQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795459306; x=1796064106;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7KCCFV8c12xHGuVa12sa42pR/GvO+E15oZ8scml+fpM=;
        b=nNRgIjAHEEzuIC4nbyLIRhaolBRdqS4a/0sUIub8bOhO271ILX0XXe+sd1/sqh3qOS
         0kR/jCJEIIgKQi6+azPvSYBJwydE0sestLdAF+qeCZEWhLuRRdZoCrtXx/9N/N+QiiTG
         G+h+NlXGPUzu2pdZ9sA6Lx9jS032pkjF/G4XAjNo2FaJnTEwO47dk2HruPpnBJIE+QDN
         FvY6myNYXhlKqzVc3pjz8WH01detBlfHEcSrX3uSY7qRuj7FMVL5kzigefDHHQ+oG5Mz
         WnjQRZiC4Yw5PXF5H9xalrHBybF85qkjee7Q8lOFSlnyHNVU+yrKjngdIOqSYh+hCuP8
         8Evw==
X-Forwarded-Encrypted: i=1; AL+hErFPp11E6KCsySPy04uv6Go543n3nAEoJQMtu2k4JRUsOey8eqwiJOHZuizk/Q6mSD1DTeu51ALXxw4R@vger.kernel.org
X-Gm-Message-State: APuU4Z9XwD+TsxekapbISEWmMy5Ii3Ti2A+4BiUi/fu6hKRlU1uIuzDq
	GbfmUT/rmGY7ZmO8JCuwp/MvIXDx8zahanbvrF7gQWep2nkfUr6XcUfnR8fzl1XezcKOubmJDDd
	+b/tV5YNWdnKZI81maPq0oPOMHGmTE9w=
X-Gm-Gg: AZFdTZebm+hf22Izga7FLNH+EbtQSM/I1PIQYgqD8XsZg6zdmX2nmwZc9lDbdOWzwpS
	MOQS57Dd1xo1J+Ob51xZs64jFc6aW7DJNcAGnaAjrZ3X+JhKLE0XXAqEJ0Wu3ZITBnP8thqn1Ef
	aFRYQ9YfHXe0Fcw0Wk8KWGR7ASRJXeTjLZ/lnzLvb9cQX9xs+MZ7qEq9uyS6C4wTDD/s6ZjwQgy
	IK+8ODOSJyuoXH+bycWGgmJbKdYILBMsIBCmi5sQfhWMqNrHMq8iGEWFarfAdo0j5vQsTJPiqbC
	XyRhCwnVuZC0X6h5M+1JpfBisJosiCQW9mvy4kN5A1R8rE/gbx+HvjFZqOVYDfXUpGvkF28bL2h
	nXg7/cz7CjUc9sEawm9CpUjPAhejZlOMDKMhLYQ==
X-Received: by 2002:a17:90b:17cd:b0:3ac:6fcf:91d2 with SMTP id
 98e67ed59e1d1-3b41c8fe3d1mr11633543a91.19.1795459306227; Mon, 23 Nov 2026
 10:41:46 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-orangepi-gpu-v2-1-f68676f844eb@gmail.com> <20261122184434.545341-1-frederic.mahe@cirad.fr>
In-Reply-To: <20261122184434.545341-1-frederic.mahe@cirad.fr>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 23 Nov 2026 19:41:00 +0100
X-Gm-Features: Aa3M54rYymnQncJINmj7PXylw19m9Q_Z0b_H3MvffZyCzTJDH31b-Bzjr4MRK-U
Message-ID: <CABdCQ=PnfXRd2=b6_yEN94RCRvPnWx-WFfHZDC+jhHv_UFZ1ZQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dts: spacemit: k1: add PowerVR GPU device node
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYWjDqQ==?= <frederic.mahe@cirad.fr>
Cc: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Baihui Liang <liangbaihui@linux.spacemit.com>, imagination@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fr=C3=A9d=C3=A9ric,

Thanks for testing this on the BPI-F3!

> Two notes:
>
> - On v7.4-rc1 the driver refuses the GPU ("Unknown GPU! Set
>   'exp_hw_support' to bypass this check"); with
>   powervr.exp_hw_support=3D1 it works as above. Is a driver patch
>   adding the K1 GPU pending somewhere?

You're right. I forgot to mention in the cover letter that I was loading
the module with:
sudo modprobe powervr exp_hw_support=3D1

I plan to send a separate patch to add K1 GPU support directly in
Imagination's driver.

> - The GPU never runtime-suspends: after 160 s idle,
>   runtime_suspended_time is still 0 and the power domain stays on
>   (autosuspend 50 ms). That looks like what Baihui's "drm/imagination:
>   re-check firmware idle state before runtime suspend" fixes.

I hadn't tested runtime suspend for the driver before, but after you
mentioned it I gave it a try and can confirm it doesn't work properly.
Hopefully Baihui's patch [1] will fix this issue.

[1] https://lore.kernel.org/linux-riscv/20261111-img-pm-autosuspend-v2-1-42=
7689f6f2f9@linux.spacemit.com/
