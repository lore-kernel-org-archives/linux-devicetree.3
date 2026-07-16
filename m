Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE093D522F
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 13:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784210320; cv=none; b=JWeA8VT4KWPM0iAJd2IZDp6zTG83zrC1MnztsR3PTNUhJB+RnTY8OUYGbRVK+nN9PnImXJDatFm/fU04CgNq5j0lMi10ejOPhHCPw6u8H2RTFgj7uN7lSAz9Irwgnhe+LLYA9jpKwLPABvHo5xtG0H63MY8WkD0KgKc/rp8cFks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784210320; c=relaxed/simple;
	bh=R5zT/090OBDN486SJqrCBXr+ibXy821aDdOSseWC2Bk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sd4/tSJe/quj6UFSRoeayFIwsRU/DGLuXzISo0AxJvyjUV51GBg/GFQcrz3DnXwoRiNvIMw4Rwqds5gimZZG6VHo1wirUAViZPbSMjUO4uzQcWpICZa+59aWXjLLj7OSWOTdcdXUZO+gdODEDvVh7DuW8MQRsoGi4q6xOebiJGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IyADB+XD; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyADB+XD"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47d6c634f45so3801698f8f.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 06:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784210317; x=1784815117; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=R5zT/090OBDN486SJqrCBXr+ibXy821aDdOSseWC2Bk=;
        b=IyADB+XDNuCalBbgxXW0D9DVLz1NQ+nP/P8u1Dm3C10Wl/XrShveB8ygvuaUlyNqKP
         40oqqcq7KGutisUCGTRtJyCzW0t+o94aheXbpKN0cS+N1HtClx8NepWYQAG7JyiLKmEh
         J032feK3BHAzyakjdtWJ1z/PlT+XpgfewNsSPC5esxjFK90k7hG/jgdTI5kWw0tNAdkg
         tOEclVJbakb36S0gHe/tAKcnsbCbi4blb76fnEnpF3JB2kXFtD01TX2Y3AzRw0VvK3tR
         SQ+yWb+s0qa64kSnCBo3OJj9D96/I0okyhcrH8y+bQpDVT9zH+Uisg2WIrFe3Ls6shPG
         MYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784210317; x=1784815117;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R5zT/090OBDN486SJqrCBXr+ibXy821aDdOSseWC2Bk=;
        b=lsfbYh5o1QY321R7LOWX2i/u22UFmjN4jPPPGe+z3gXwWD7AbKfjc53Qgvh0nCEg/K
         ALzx3dn5OcknxnbvjJcqwPKsNwN1bWAQyX5GOozxhF00Nzug+kXLKIHxoeppIYv3pIk4
         t2Kcdh0pocJuc3iiYz5QdEHR+NgwDGG02P9yMMRoFlG4WwuKhABhhQaFl9X45LhFEtW9
         mpiRY+GHhIGyiBh82esWfYVxLaHp4sB03xe+4dxS0pb+yGH3rtN9eOIkUO7rqhBUift4
         x5PRGMaMcd6Aan/5RKBy0nNjLGjama5bJdWugcE9aMPyMJg01YLyYt+rmgHoayFMcaD8
         UEiA==
X-Forwarded-Encrypted: i=1; AHgh+Rr5RPrxXZN7nKRNEJl8e5Xu0M51wqiR/TvwvLlr8IrOPd1OOnM4meaBpEfMcCbDKFUqO9vfEItJ1nD0@vger.kernel.org
X-Gm-Message-State: AOJu0YxOr0gE17HmFKIAaMzi4yIIZCip7gvvTrePqRIfEBMXR08OyYZQ
	2g+cz22EfPq3FVGY4kn7yoTP80IQs9uwD3Nqowrs87l5hRbr06CJP8ZB
X-Gm-Gg: AfdE7cmtUkmWSP8Nlq+Pl980YNOD6Zu68OTQvyTfdkRCshAc0IXV635ZM9GZOSVGEaH
	goMEYWxccC3OzQJ892p/i/yrkB+u7oaXrryZNjweUXAc6g/nCbkM3ZCgmNk7ok+LkQzxkhA1KAF
	g5WQXEc+a9J3SFRipD0UZiT1iBYj0QXd3oqDUIlFaAnR/hf5sifKJelKf/YFP5KzRF7GnqbhoRM
	hrERgmD5eS1Lt2rgwsTfx7XCbP76Lo/07l6LpuSCD2TW+18DBh/Hwz0ITmZu53ScP1yldB/dd0v
	YPum0lczxvJG+9wnQWbx93hTq7E2oWGErgOoQpPrb7vlQLy103yv3ftQKeWR/ri2l0lr62agcZH
	7G2FH7HeKEeHPVGmtdenlVzoroQz04/ugySMK6aqM9PoI9kXzmuj9Faq5UcC/toX9kFf/pzZogf
	slN7009WOMz4G7dcdI7CD9rM4wk6VAW4xeT5qG+5w=
X-Received: by 2002:a05:6000:4914:b0:473:1706:7f01 with SMTP id ffacd0b85a97d-47f488bf7bamr12897767f8f.43.1784210317205;
        Thu, 16 Jul 2026 06:58:37 -0700 (PDT)
Received: from ?IPv6:2001:8a0:c4c6:f00:b522:ee0:9221:cb46? ([2001:8a0:c4c6:f00:b522:ee0:9221:cb46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464caeffsm23296976f8f.36.2026.07.16.06.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 06:58:36 -0700 (PDT)
Message-ID: <38d07e176afdac0e2577fe93fec7ad47c1c12dac.camel@gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: ti: k3-am62p-verdin: Reserve UART_4 for
 Cortex-R5F
From: Vitor Soares <ivitro@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Vitor Soares <vitor.soares@toradex.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 16 Jul 2026 14:58:34 +0100
In-Reply-To: <178408904493.1082634.1111398751432883626.b4-reply@b4>
References: <20260602141311.1366818-5-ivitro@gmail.com>
	 <20260602141311.1366818-7-ivitro@gmail.com>
	 <178408904493.1082634.1111398751432883626.b4-reply@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-07-15 at 09:47 +0530, Vignesh Raghavendra wrote:
> On 2026-06-02 15:13 +0100, Vitor Soares wrote:
> > From: Vitor Soares <vitor.soares@toradex.com>
> >=20
> > Add a device tree overlay reserving AM62P MCU_UART0 (Verdin UART_4) for
> > use by the Cortex-R5F co-processor.
> >=20
>=20
> Can we please reuse k3-am625-verdin-uart4-mcu.dtso (if required, rename
> as generic one to be used across K3 verdin boards)? Else, we end up
> having dtso for every peripheral that different remoteproc firmware.
>=20
>=20

Thanks for the feedback. I reworked this for v2 by renaming the existing AM=
62
overlay to a common k3-am62x-verdin overlay and reusing it for both Verdin =
AM62
and Verdin AM62P.

I will send v2 with this addressed.

Thanks,
Vitor Soares
