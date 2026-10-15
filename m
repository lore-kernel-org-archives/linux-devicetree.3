Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4550E474267
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050121; cv=none; b=Ob4X4ZU9Rc/vD6RRGAsVOyBLbiGeIcDYLi+lXkdGb4fX5hc3w1hhOPxDVbi/0qvhmXm8M2vHvQrppCRUyloy6bO0QptooPY53e7S74Wzjg5WmWp7EAl4DcR+Min7WjmVIwLl0h5TVljerDNwDcU26xt/Ewzmk1k8SLSfqt49O1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050121; c=relaxed/simple;
	bh=7hUOE8btigyGRD2TTmBp6G5vlIKkBzkcr/ByALuXRJY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YQGuZqMXaIxBOl2a78oC+FyvkVGY1azEI5zAmGSJpiY/1GaAPS/W5YFHkM7dIfb2zSCOQ9ypi+abMzq4W89uGhNgvR0PxoiR/l7ZoM5wB5iQY9sHhMwnYZNSXQBUL3b7sSy6DETF3vodKT6+1/ZomxQlarbBC8aMDOJ2bCla+Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUAwrXUh; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUAwrXUh"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso3604931f8f.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 00:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792050117; x=1792654917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tNQZzmh/L9MH0WQdX7vNuWW0ZjqB6ODxMRs3YkUCNgg=;
        b=dUAwrXUhmEO+OfR1nE7ZwOp5gMRqKu7vGsYJK4EWjHeje8TJMXHTly6FWVxrdhuS9W
         atApGnP2PcG/c24MlM+DjeJA0GnBVU80NwKPSO//zY/anAvAU53y1zH2ZIqX34QX/Wd3
         up+bGO7bnwe1UIpx6qBb4Bg2Cv/vbTqcKuzSrCYbnPgj5poBtyTdxILdBDrtN3FroHF4
         wXGLVsbPbXJKQ4XmFEC19CsmXV7nAPv7qLhvbwPXv1e1dQoLKn9OfSuk1O9vrIwTgFWv
         E6kL4B0g0H7OFmgavvLvUBablGYCfxUbJU9D8rSuy6BFUGLNwQySslamJEiNmVXqsoW4
         mz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050117; x=1792654917;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tNQZzmh/L9MH0WQdX7vNuWW0ZjqB6ODxMRs3YkUCNgg=;
        b=SC1ZlqEuXSWNmqbWDT9f9AYAQQbyhvrWprn2xOCjT+Cpo8oTb57y6+VnWtWKaSPb0Q
         pVLvKMNDbvpyPuv4ibkESbylEnBt2Gmj/3QdxnsKFGfm4mQX1Gl5WcQ9HEk11kmkwGWX
         W13ZafaeHsyuqol6uakGRR3zvEeTtfuXLJZd+YqyK6kZGQeh/nNdNCvOWDAlOkrTgj+J
         24sryWo3xb2M2I5FQZ1Q2fdRtleGcq7StPsfkUevAmaVl2UvzXV+msmcXyl6HD30AquX
         R3axq6ysmg7IRGlLWDHN6VeMyC0m6BBAOMuili+VMm7THssuqj/vhy7ie4E9jH5dVies
         rEBA==
X-Forwarded-Encrypted: i=1; AKwUvBzbsZC63ShMofM+7lRb5siHrX7/BuUAJljvOZEh8XuMnbs40P1UmVsAqyeM5q0tAvidGGX8e1mxcXoh@vger.kernel.org
X-Gm-Message-State: AFq9FYKVQFGMrDDpgpsr325UpZlSF6kaWdxfb0v3l2OY5HwnXktv4RoS
	BRg1epNCpZG1vfx3Y4vxcbqmFpEglE4C8THgjJycEYqUnVbq2GmCvcXp
X-Gm-Gg: AYBFou0jLFzgHgWKwlVsd0SVmJoXcPxkHoQZxnbWTZJSwEbUq71f7/RGrgGteEVlw3q
	+nFDYzc/OPkwSjFk9RUpcD3jqUau1PNjXE4NjG4jDtvja0ZBdpLezQk9CZLo1P9p2NV6ixD5aEU
	Dz8t/RxVXxw3dhqfGluJEdRhWbyD4SNTrhS6gGx5lOWHPBxcwAzMG4jAWpf/hO4CTRlv8EV1meg
	aatZiPtBnpGyOukC519V/prIZQ5j4bFqVcikSpvmag3C8LkPYDBp5yo8McM1vLeon9LYjaXq+Tf
	z8Yt6pbNJ+IR31O21MbdkCh7lfotawHK8qHeyKETd4DEbMrs5nOddw+F4BpUxr51kg/VlLi0/nh
	pZXR1ofFxq8kXGJu+7UE4+yzX0QndV0DyLXEs/NIz1WuhAyL2hp5OJ77bpa21NRO7di3hZR8nn0
	jIXWwPCv1iArAwBDSJdL/xyK5y9+s5PZh11hbkm600x0ImTBJuFP2MxCKQszEMiHSf5BebBbTpY
	K7GFWsywrhIk5vpPOleeWqUf9ZfBAnZ35TZ5+R/VNpD7UTi+KXXWE3WASb/8KrYZgtAP29SLarv
	KxH5+5bVXBU9lsJKNaAdFksvptlE7tZNrV8KMQU9xwBqi0kzd1v/sK7VOiPiUHPiAOdLAf+a9d+
	otVyz3XGk/zwNTwAVsp2dICcXxeKGDdyhDj92V133e9kIAb5t07Ruk74W0pRQop+qaLsQZjCEcp
	zeyAEL
X-Received: by 2002:a05:6000:41cc:b0:48c:7037:aee9 with SMTP id ffacd0b85a97d-48dbad48cc3mr33849866f8f.50.1792050117131;
        Thu, 15 Oct 2026 00:41:57 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bd777fsm15479605f8f.57.2026.10.15.00.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:41:56 -0700 (PDT)
Date: Thu, 15 Oct 2026 09:41:54 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Chang Yu <marcus.yu.56@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shi Hao
 <i.shihao.999@gmail.com>, "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: iio: light: add as7343
Message-ID: <20261015094154.0000506c@gmail.com>
In-Reply-To: <as5LCasyTFjTNL0x@zephyrus-g14.localdomain>
References: <20261013115639.167433-1-marcus.yu.56@gmail.com>
	<20261013115639.167433-2-marcus.yu.56@gmail.com>
	<20261013143639.000017b9@gmail.com>
	<as5LCasyTFjTNL0x@zephyrus-g14.localdomain>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Oct 2026 23:15:21 +0800
Chang Yu <marcus.yu.56@gmail.com> wrote:

> > Should be unevaluatedProperties as you're using $refs in the binding,
> > but Jonathan could tweak that when applying.
> >   
> There was a discussion about this back in v2 in which Conor was suggesting
> keeping additionalProperties: false if I recall. I don't know the exact
> pros vs cons so I'll defer to the experts here.

Fair enough, if dt maintainers say so then it's fine.

-- 
Kind regards,
Joshua Crofts
