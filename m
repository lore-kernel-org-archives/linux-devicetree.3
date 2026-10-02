Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73491D5CC9
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 03:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790912995; cv=pass; b=RUHyfkWUfI4J79RpHTOwnuOc+Uf5TVt6b0PIVFn1EUkS/yBd9Jzy7XoL/EWwFi2MW4W/pBkyx+Qnbr1h2sDqEjvsmlMHtajo9SgFA7+RH3eM9rQfbVvmbwk+4EzAw+Sk4Q9Em7dfZlthg3Ok3/T+1x13m2felkWONBc1waoU66A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790912995; c=relaxed/simple;
	bh=5sGej+DLfkAUgSW0hAN9X4g6v3915oL1VCHDIm0N3Dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eAqXUDFXipuZ7ZKw3QdQ19sQlS9fXtHITZ4er3IuAhzNJInc8VbcDjep3vyGG9LrM+z3f+sx8VuH9NrPwsl/RK6tbGL8tYqoZDOIOGXvokDCNFWYKdIfiS1LPh9Z7OKGbu54XHiWnblWdr95SwlJYBSENF7VHr96w9VyHFD1rMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edWMzXlL; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edWMzXlL"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a628a3ee32so5378481fa.2
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 20:49:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790912992; cv=none;
        d=google.com; s=arc-20260327;
        b=mzI/iQSY/N3D35njBSEGuQ/4RRPKbDFQRZquGsamBHVdY72QyUcLmwZd83WPLQ22ji
         v8LKC0EOY4KxAVxACC2RdOA6aa0W4eqLvN7/I44onBdyB8jjIXUzz+ihvPN83KC3/6Ds
         OGTYQx2239RGZqa1F3u7jskvX5yxUGbKvgvnCTSlW3aFc2G/oE4ms9Abl6Ll64v8Yblm
         DBCrVWNQyVOYFHmRMr2RTBFd/LOZANxRxXXor9sBMQsyr6gHFYjZs19+rCao5GRneMof
         BukQhihsP1MZ7CidDqjild/mWSFFIbc0CULiep+6PKPdXB9iu0vW1loV0FY8jfTXLbO5
         VwIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5sGej+DLfkAUgSW0hAN9X4g6v3915oL1VCHDIm0N3Dc=;
        fh=IIB3vPeG7aiUqxNbDK/l5232k0BM58SIdLDOJuRMghU=;
        b=djmhiozIPYpAfKi0e3LWiBdFbsN2v7HlK78UkX+Y0UXh7pO34c0hfuqxcRlJ/z7FXJ
         vM2HtcWbIg6snrDbQSHc/9nEc7stbfS1hMfdpCuOURFLVdox45NP6xkcFlH37PcR8uBI
         P532IYU2i6fqivMdhq3zLabafICd0WnJsCaPj0fLxnprqmaEzTJC3a0+T1bAheDuDY+N
         WpzIlSm5YlV/NZx/4B9fwO1U0i18vShLJUm7x2fJ73+7ePpghzyGkjDVrpDU/ty2Ipqs
         bO9kScieVFmpkk1XI7/LubMQOfLB3vhx1wrwOG2JSOcdKDX1M4vUlbwTTDIqxMV9dHZR
         Vg+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790912992; x=1791517792; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5sGej+DLfkAUgSW0hAN9X4g6v3915oL1VCHDIm0N3Dc=;
        b=edWMzXlL1nhlQBtBa+b4NMTH8Y61/TO2fG09UGW0kQ5Pmcu02Xo9QNDhmjxNWeYDNx
         RgUDHUk3kvWr64J7RtmX4N3kdzId2LMR7x9lSfW2I3qoWKrA1VeSmMGLkUu97dRzsNSd
         Ixts6sj3Rhj7kXEyFqoffyVoiW13gKPR9Rpbkl5MwyAtgdAAxrGdjxoQjUZ6Vc2MRkaA
         HWoZGO14TJs5BY24/hBdYYgFFXWTCPYscJ9uodXy6e70ixkncpQYlnvb/Kxmtya8hQTY
         rgjQU+atgBw2rISxW0sqGV+l8X7F7PvclVjIZIcG1a1CYoVyZvPiwjivWeixybYSnuIy
         tRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790912992; x=1791517792;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5sGej+DLfkAUgSW0hAN9X4g6v3915oL1VCHDIm0N3Dc=;
        b=isLok9Pj+4yFZY0mBzwpz9Q0a85EskjjXdN7swZpTdgqIUJ6IJ4QteBPObdYZB3+Cf
         tJSsOTNF/VBJlOX1WYXyd8cHM2DJgxpy7bW0oD1Lbuv6yyblf2yS+F+ru3KaRf2EKxpt
         nNEwbIj9RBuQIhHXs1qVMuRf80i36LzE19iVphoqqEbD0lQEU5oD73/ik27yatpmR0SJ
         UJd2Kf393ykCHmwrNZJLXb0/96V7jCWV9gatigcAtQmFgZAxcqXW1HH8YDrPo+NL5Ja0
         zLpcJlUlwJ2F30guKPo5XCoqOrPxCGyCJ8fGM8eko4nMj7ZmKysYicwgjXXEIbRNAz6z
         QQRA==
X-Forwarded-Encrypted: i=1; AKwUvBwMXFRBRKkir8sP+T0gfaXY4szYb7TN22ycO/mYKUnFewBI1CF5AgxUYXigKfgQm7NjOps77GhQjPq2@vger.kernel.org
X-Gm-Message-State: AFq9FYJyU5wh7iA6N41rtCS/rfCVFbNgM0bx9Oh84mWnw3w+OYznzjQw
	xM4aElISoTImMBFU7kJyyNBz4dastc2ibxnjDxQFBO2tGccuSFYxJcpcPdHMXLJYkfiXMO5Kpvk
	Kb7Gatq12Rs8giuQIJhX2fEh9R8kgisw=
X-Gm-Gg: AYBFou04QIwSaHHK3IAewUMjVozG95ME+dTnRg+SRywkfD0RN+QLgBBDxwPFrNsqX6A
	m95X770sfV6RQ+gzU89wEmU8n44eEidIqQePQZLidpnw3q5L0KPkO+R5o2SX4a+4kt9zu3eMF6k
	DptSnCIVuJnv7HaGXj0ZdBd6xpiphigKI2qT2E3/BcwWOL1k1ENd7GVI9dsHJZbhxHC0CU1r6fF
	UZLoQG3VipUoYcOp12gGhlrkYdcbRaREvYNZ4DrpvCzPJKfYgwx8wHk1/ZxI03v7ZbH14VIxhni
	XNdBsPrS44hX00ZeWP+KlqFo7AoOadv/sDfRy893sPwyRIwCVENIUxuV63dOvq6020VmFjAM3UP
	77c4h79Ch3e58rrPY65AxEIGqEU4zn05mQaIE
X-Received: by 2002:a05:651c:1b84:b0:3a6:629e:447c with SMTP id
 38308e7fff4ca-3a8827de31amr2384311fa.1.1790912991548; Thu, 01 Oct 2026
 20:49:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com>
In-Reply-To: <20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 2 Oct 2026 11:49:39 +0800
X-Gm-Features: AclHuK9nOE7Cp6JUOFi-QxVBuGMkiu_Zk5X9AVbxMGFwo-WwiNAL3M8EJdWroT8
Message-ID: <CAKspUhKOwuXyweSk_EsBTTNKrUbDy4ATkHjEPSObA=zm-Hu7jw@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: sophgo: add cv1800b ethernet support overlay
To: Hiago De Franco <hfranco@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrei Lalaev <andrey.lalaev@gmail.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 01, 2026 at 04:38:30PM -0300, Hiago De Franco wrote:
> This is a continuation of patch [1]. The same patch was sent before [2],
> and an overlay was suggested, altought it was not sent. Therefore I am
> sending this overlay now.

Thanks for picking this up. [2] was mine, for the Duo 256M; the overlay
rework stalled while I waited for the IO board, which has now arrived.
I will send the matching overlay for sg2002-milkv-duo256m in the same
shape as this one, so the two boards stay consistent.

One note, not a blocker for this patch: the internal PHY under the mdio
node this overlay enables is named phy@0 but has reg = <1> -- which is
also why it shows up as mdio_mux-0.0:01 in your log. 2/2 of my earlier
series [3] fixes the node name in cv180x.dtsi, so it covers CV1800B as
well, and already has Inochi's Reviewed-by. I will carry it in my
overlay series unless it lands first.

Reviewed-by: Chen-Yu Yeh <chenyou910331@gmail.com>

[3] https://lore.kernel.org/sophgo/20260803163427.74445-1-chenyou910331@gmail.com/
