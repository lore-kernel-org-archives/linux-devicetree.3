Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898D53A1CE3
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 21:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774905552; cv=none; b=i8Oi7ROrDFhyQx0XUu/CRhALi63MG8Cex6bczZMF/o86UNXORZ/UTPWHvs8NpfNHtR5ALYgNw6jTtb1HLdOIO+ARB40+A/ryTGeOyPMPQ4fvebwD0nNgOrg9HCrfYOPgw80b7mHbIXbC+ljikg/32TWZ6ZlIALnEleL8S1SwIRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774905552; c=relaxed/simple;
	bh=Ki7/WgI32wqgeZnpNNxb7Gtn/4pBYH8K6/mznsZphg8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S76of/QbUsUefjkOYJUiWz7eqMUyM4Rhk05cAmFLfUQBgTYfFccTHdv9b7XU94x5M2Anv643LPzctKMIsGmSDNtgwUIKf1UxZRN3hBZ0tcCYwZBV2SScwUBNLgKqQf4ajzthJN9zkkwPc124hbPuT9Qen2NHvCqYOuQyN0wKb8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=eEhYh0f1; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="eEhYh0f1"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35d99031e4eso1418200a91.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774905550; x=1775510350; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kjSx54bMkrLLfgzdPU0y1PUqW6GqciS0yWj8IpjRMAE=;
        b=eEhYh0f13Ei3PNfEIrn1oIW4rt/nk372DTZhG4ETdp7AjaCP7AzKJRydtX+Jb8jKxC
         ZjBkEmUuHlCUMYobP3/JKKBq2moWrthP3YX3N3uL/LP6/vcm4w0bMSPNhp77iHU1MsUV
         JdGeYVlPlH0Du6i9FTnak+LEwVvaJjMZyMVviODb0mA0dolwoUd4GIqCdWxkhqyNnVOh
         wxTs+ltCs6y3624tbWPwsQhfhJ9koDvTtkowNohlMbkUoJMmKZViR6yaSupw93UatLzs
         5fi/1lQqEwGfVo1URnG1x8Ke8stszqCbJ/wznL/MACVlxCIunu9p3W/FoD64v2iB+A7K
         AU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774905550; x=1775510350;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjSx54bMkrLLfgzdPU0y1PUqW6GqciS0yWj8IpjRMAE=;
        b=DVzwjEy1tkFy7Jg5jJEatrX2CgO79Ww+wA3l19NBLVyDJCDeqayE1lWJJuDfm9MOCy
         RqmXQv/jZoyX07Pxf4PH388VtBhrGaibYWfeNWB4JWynm5nU+aagwULluN9PzD0n9YuB
         qboqZnhwSwcLR0lsJ22diBQT4nJICRH/WF5lZZoLlanAYbuRU4sBVoOxdWeMSWIKYSaU
         IyGXyO4bGepIAabka77LjBEK5OGaI59ARBpSFhv9/vZZU3sZnE2fzqApieC3OuXGl2il
         gjPMhNKAY71g3TklyPMUPrC2GGJYhJqKAX4g1XbhY08veRhYE+VMVUvL+dA8I9e7LSf5
         OQJA==
X-Gm-Message-State: AOJu0YxQE2Ow7dasT0kctoq4V4AhMJgjZmM00CSdkl/f/TAiowy/XflF
	S+Nf5DzCvRasCq5poE7rDiJjq5xsHl8G82jVNzEsIKc9WtwQspCVnRrnaSPT5XUi2tc=
X-Gm-Gg: ATEYQzwFxTO/eMyOTgZ7C61EjCO3qGCcEDw0uGXQgzlxKYKQmOHCPFWA/U/DabosqSD
	bvZ98daEICeELKzzbjxVmVcHwNJXZWoqu3q2L+8cfs9qjG3wplnYHmQ3EomTIdg9ThryJGA7M7f
	tLnC92BltuzKVvp+vseLgjecF+f1k0+E9iVO+Bw0LnmGks1JBqlGTShYivAFOWMb9e2Rg8dAVot
	1Qkmyj9/Qyn4iuMI2ih0qhquG2TqxnKWZyxLl8vPhmVvcsJ7IBLdoHOo2NxLuHW5HUhxpt0MCyW
	HbGxlf9awhn5USmaRNRiyL1CSrRODyxSrKDqbsOFtjoSOjc2dIEhOxfNxnpYFUNJCqMCelk27Qs
	E11onKnfzWtDhfTrWajtZI/7YNIBDikSbimixt1drqamwfKyji4WR+TDlGwAN8TPiOXmcip88Sf
	fxpvAZPB+xJC8va/j0wSg=
X-Received: by 2002:a17:90b:1a8c:b0:35b:9aaf:21c2 with SMTP id 98e67ed59e1d1-35c3000d679mr12293717a91.13.1774905549876;
        Mon, 30 Mar 2026 14:19:09 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d950b5583sm7943123a91.14.2026.03.30.14.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 14:19:09 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, aaro.koskinen@iki.fi,
 airlied@gmail.com, andreas@kemnade.info, conor+dt@kernel.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, krzk+dt@kernel.org,
 laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
 jesszhan0024@gmail.com, rfoss@kernel.org, robh@kernel.org,
 rogerq@kernel.org, simona@ffwll.ch, thierry.reding@gmail.com,
 tony@atomide.com, tzimmermann@suse.de, andrzej.hajda@intel.com, Mithil
 Bavishi <bavishimithil@gmail.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: (subset) [PATCH v9 0/8] Initial support for Samsung Galaxy Tab
 2 series
In-Reply-To: <177451576215.103892.12129135091369769725.b4-ty@linaro.org>
References: <20260303203017.511-1-bavishimithil@gmail.com>
 <177451576215.103892.12129135091369769725.b4-ty@linaro.org>
Date: Mon, 30 Mar 2026 14:19:09 -0700
Message-ID: <7hzf3puib6.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Neil,

Neil Armstrong <neil.armstrong@linaro.org> writes:

> Hi,
>
> On Tue, 03 Mar 2026 15:30:09 -0500, Mithil Bavishi wrote:
>> This series adds initial support for the Samsung Galaxy Tab 2
>> (samsung-espresso7/10) series of devices. It adds support for 6 variants
>> (P3100, P3110, P3113, P5100, P5110, P5113). Downstream categorised them
>> based on 3G and WiFi, but since they use different panel, touch
>> controllers, batteries, I decided to categorise them based on screen
>> size as espresso7 and espresso10.
>> 
>> [...]
>
> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)
>
> [4/8] dt-bindings: display: panel-lvds: Add compatibles for Samsung LTN070NL01 and LTN101AL03 panels
>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d37690b5e02418a2365548300628ef3895a24ed2

Since the bindings patch already had acks from the DT maintainers, I
queued it along with the DT patches (via the OMAP tree.)

Do you prefer if I drop my version?

Kevin
