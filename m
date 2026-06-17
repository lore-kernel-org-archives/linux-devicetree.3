Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F33A1EEA31
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 02:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781662175; cv=none; b=F3cG23Qr45rd43Bb2T8JxUd1f7vgd54Fb0Cpd0hWYwfACEFRQxNR6YMgRS3GdQyZCAbk+rNDHCFNL4N+5hK0FDxrXWhXJKA3BKYu9ctd2RfrcjXeaWbP4skDRiKkZ5LCiOFZmNefU58/om9BXfpMPaLb7QY2ioR0znodCQuDeKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781662175; c=relaxed/simple;
	bh=j6fa7wxuUI6ROWGGgOqGoPbRsU6ZtyWphBnp0BvsqR0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ab926kIrFjLLf4UDfiq7aWIaTfU6+FC4Ns5lTaXu8uN5vVVDThXShoetQ8uh7YxuPbZr9apujx2VHFaks1+UvXwALbapE1MMMasIY0fn3FwLTIleCGLyFOn/rt7RoimpscXYfCxmFHONsdmpH2fZV22LRBIAeh+4k2bjaAdsvHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKyiJGg9; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKyiJGg9"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf237e1433so63770115ad.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 19:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781662174; x=1782266974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6fa7wxuUI6ROWGGgOqGoPbRsU6ZtyWphBnp0BvsqR0=;
        b=cKyiJGg9Z4G+ZaJ0aQsnXMk/+h8wMBKFkdiwZeEx9yQNcYosUXOpOHC9tOV6hkZfL+
         roR5OrQAlebZZlHPSst9H+9dLh99irdWuQsZKmc0jjGHUBDp23gKM0tCpWBVYlxccPaG
         ItZa8KfhxL3KSQ85GDZ6wwyg45FYgiZ+9HjOLke+wc8p1lO5A+5wOS932wQx3iixCAA1
         ub2lsOzQb4kqqMBrgZdqNR+N6QR8cPRzke3fJr9riMaG/trxhDuBK90JwRB9rq7TVbsK
         uAwm6mimyZl9GvLm8RVyG44sweha0heof54JT2j2xhIVLU8GJTXy1oHrwuRlAtKCt6qL
         zeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781662174; x=1782266974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j6fa7wxuUI6ROWGGgOqGoPbRsU6ZtyWphBnp0BvsqR0=;
        b=YYgMyyeaaidDyXAXKk62fQ0Uoez3rgQo1BmwQShCF53dx4xb2DtDb+C7F6uJ8D6Mgp
         YmSmwoo3MfFtf8pZ/WsA1PYIWXV2PTeNY8IM+x2eiksOiODX9iBJouCf4MjA4wF6K85p
         tqKrQG0ieT7+Lyswz5PK3jt96wXTU13AEI9yqVgzNK+E22ldIDUuW1GWMF0+Z6b6ZwEk
         c4UtJxzcEHXn1H9kPntiUcHek6gkydnZHEQAqnAlKXddje9VSuUjz65EMDl/MQmGfwTx
         ChoTWJ7IBt80W68JXf+kRcWcCxhjJfqeoFnBgmOcjYWbWFtz3mH4m4+FJLpjDKBX7rIu
         mrjg==
X-Forwarded-Encrypted: i=1; AFNElJ9rX6k+GuDGb5bXDLKGkOihIM5gdI5iCUqr+ZcGYYNuCrtWt5yAuzetlbyGms5SwTLnxFL+xooqCYEB@vger.kernel.org
X-Gm-Message-State: AOJu0YxbFwbb1y2xJhZSy6T5z4P1phC/FN1SLLI8aE+VXZt6MjhIxb4N
	6PA4VCk+SRubUf8dY8YdQiqrY3omraEtmV7n6vuLLDMZQYEk4XPjhmcJ
X-Gm-Gg: AfdE7cmVSaWQiHamnxDywHx1VjIPvGKPXR+sL0zjg4ePdA7vufGAFxsxua/xJbvjf9a
	tu/KLAuFJ9nNCqZyXOCdPpQIZtpNHQRzBnj+m1k4Rm3ouEtyLXXDh2PmlG4jsTDKegIYXS/lTju
	zjWfc7/rnvioJwxcNyY9qKxnEBg6N+oAjLkZ/nJuVEqXPt4sCmnRLT8qh5zYBv/El2miSZYRfdm
	AJM8ooAKtrXI03yAA7Eb592yVCpPD14IFdoLEvsVWuP/Xv109mLIkEykCq6i/GW6/5/BZFSNAFT
	ZsDLtxMaR6wVULDSKdnJT8pN0MX9KA7Utw6tyKxhxmRJb2wEnwed77tdfQsK/iB4IYRjhVHaR9t
	8ItgHfyDf7FbD4dw9QX8RabQqpoCvOM5CCBF6JRQ0SyxCvWOXwXtN4VJ6bafnPtpRzRKLZ+VeP8
	BNIG0GdE7Svaz4yBf40EpbqYfLm3+/nlqAhN6VaVSBkGbMn8L73+qZbX0kKfyEnWlgzYvYv1id/
	fee/mY0E+WWGOlTwHGejOtr
X-Received: by 2002:a17:902:f785:b0:2c2:33a4:aaa2 with SMTP id d9443c01a7336-2c6bc25d4d0mr16653095ad.35.1781662173785;
        Tue, 16 Jun 2026 19:09:33 -0700 (PDT)
Received: from lcwang-Precision-3630-Tower.. (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433369c8asm148322735ad.73.2026.06.16.19.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:09:32 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
To: Devarsh Thakkar <devarsht@ti.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wig Cheng <onlywig@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	LiangCheng Wang <zaq14760@gmail.com>
Subject: Re: [PATCH v3 2/2] drm/tiny: add support for PIXPAPER 4.26 monochrome e-ink panel
Date: Wed, 17 Jun 2026 10:09:26 +0800
Message-Id: <20260617020926.114947-1-zaq14760@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <423c3dca-9589-488d-8462-c3d51f05ee4a@ti.com>
References: <20260529-bar-v3-0-5c2ac1c751ee@gmail.com> <20260529-bar-v3-2-5c2ac1c751ee@gmail.com> <2bfb73e6-dca3-4d93-af04-3c644929dd19@ti.com> <20260616083921.4066690-1-zaq14760@gmail.com> <423c3dca-9589-488d-8462-c3d51f05ee4a@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Devarsh,

Thanks, that sounds great -- let's converge on panel-ssd16xx.c.

> Yes, I will be adding SSD1677 controller support in V2 of my series,
> hopefully that should help and after that it's just a matter of adding
> panel entry for your pixpaper panel. I can share you my branch with
> ssd1677 support once I have it ready.

That would be very helpful, please do share the branch once it's ready. I
have the PIXPAPER 4.26 hardware here, so I can validate the SSD1677 support
and the panel on real hardware and report back any quirks.

> additionally I can quickly add boilerplate pixpaper 4.26 panel entries on
> top of my V2 series referring from your patch so that it switches to using
> standard ssd16xx commands and ssd1677 quirks wherever necessary and you can
> then validate and modify.

Thanks for offering. If it's alright with you, I'd like to take the
pixpaper-426m panel entry through review myself on top of your series, using
your boilerplate as a starting point, since I can carry the validation on
real hardware. I'll credit your help with Co-developed-by/Suggested-by as
appropriate. Happy to arrange it whichever way is easiest for you.

I'll also follow up with the 0xF7/0xFF test result so we can capture the
correct SSD1677 update-sequence quirk.

Regards,
LiangCheng
