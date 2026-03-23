Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0FE313298
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 23:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774309790; cv=none; b=YTpoU1uTa63C2+PKTnVt86DDjvlC69gt4heXHb5K4kifnd0XVlcb5jy2ejj/lEBbR5aP6Kby/6KsaxSJ26eY+nsd4C0VLS8auZ0xA5cwyUB54X/CyxcKTt/9UlWxyGGd33Y2thLUnZGcBmXQ23WCNZHhsllehYZzSRQVUGtp58g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774309790; c=relaxed/simple;
	bh=tGIgG4x0tVmgRfuQsw6tg6zo3VdRQ0TMw0o7dZSruE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pgVh3asb+IxX8Y6IDfbv5Kh3mAf4ym2hFZI8KOUtrbR02ZXBlDO5vzMomIDstqCVdXYVgG/5Yo2nL3iyMH2HBY2nNUDsNAA17nxH5WoKJD2bexYVvlUFOtDLA+ZM9eLxTqP2UqFb8ncHoLcNRNAPIrNG9T85Rle1kDcS4gm9kuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IgRiKj8T; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IgRiKj8T"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486b96760easo6379095e9.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 16:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774309787; x=1774914587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGIgG4x0tVmgRfuQsw6tg6zo3VdRQ0TMw0o7dZSruE8=;
        b=IgRiKj8TDY6JTGU82yyiBLJur+8H2opU670IiwKo30zW33RrVartJcEpPyrbQOoeF1
         8ZGI+7lWTmQU2JUp6T8jw2HGMcWJyFBIPOuTqDYl/7EusHy6fTuAVtAIfW5zbmT8Y22/
         df9q+UoydDUUME6Uph2dhfZaZdyFHTkEVI+TIqHx5qpQAnvyqSd6QyCb1HyNI09f4Zra
         L2PRaXAfv+ve9Gu+57Pw34i9cmZVsgvVuvXYnb98oSHmyuECJL3zm81w/pRpFv24WckX
         8jlb0x6dx73NvMpOLIr8kSAs7gzcvVYQGzhUQkac7qpM/XqMcrqtZXpXNq/c7hvkGvso
         PpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774309787; x=1774914587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tGIgG4x0tVmgRfuQsw6tg6zo3VdRQ0TMw0o7dZSruE8=;
        b=CKc+OEzr/8gBzZiiSnVN9NGha8c75B6L8n2PU5/1uLfEv2ohG7EuHyt632dHx4247O
         lq/5VBlkBForZ8Fgm4SGO7KfpW+va4iSfKvvo86iFML5D8pvl+fHJfX60B3YDEp4z4td
         /E3uUBcGnUmXZoHgvJq1lG/roB1hwIavYQTGCBHRL79huIrpZEYGhJpvWTmTFhyuyT3W
         Bv1IhOn5z0N5W5AH5zYS3YlMgItCtKxYOwkFFTjetgcZ16N1SLhOT2WXlKWawSpAtkaq
         mBqWPOV32Mlq62Xp7gER9olBJHnMJPVgGbHMo6K8yS7UjcWOYJtwJzlF6utbwRvCPWbv
         Bzsg==
X-Forwarded-Encrypted: i=1; AJvYcCUVHL7VIz2tdnfG9N0TCps3aMb3MdFsWek3+6TYxilO5R7YXjx6bDwwHQYmcbFyemHYV4IclKWbk0IB@vger.kernel.org
X-Gm-Message-State: AOJu0YwfDE1cb5OvifdXVjQa1TUbZp9veJOFmNJp9fipce+CgExW+j08
	d3gARVam7iVp9Zi9wGj9EWJAVdXvcMpClhYjy6wH0qckjtJ3lEdih7RH
X-Gm-Gg: ATEYQzzY0IxxuusllfPq+jnZ6X95Cg1/qRLxjrge1fisp33XXom9tCoqGqBKkBqaHuD
	Guas+sfVUx/iCRCxPbM/ySQIuOQGZAYX1iyv91d0HSyJfA0IY/uci+h/CSNa/aBSJVzU+tfl3hN
	Vkb+VRWydFtBauwuyN4Hm7u9myeRcQiapoyjpzu6K5uc4k58mlKA7J4dx6XmsuHWcDhZNZhGzer
	tqEZ0nsKCHZWp7ISQyUxO/z2a1fwZnhzwsHCQaqphlZ+uRCbonKZnHT1JmLVER/zbD2XyoaMTuT
	xK1Fu1Wnq4T4hihn+qsI3Y1K5wJhj6wbNKBh4d+bmgAFOiF5UcoUB9tUMY97D4swV3mgaKAff29
	FXza/HMPRymarGZDUL8gI1ACRwh0VmBnwQdHvyEP3lAPU9sME/dHoCZ7b86/3yTmEr6vP7+f3XY
	cWkux61lofD3HWI5+M6Ow/J/7fgDgt4wv8l3iF2nqlXg==
X-Received: by 2002:a05:600c:3546:b0:485:3f1c:d887 with SMTP id 5b1f17b1804b1-486fee28918mr192372785e9.26.1774309786702;
        Mon, 23 Mar 2026 16:49:46 -0700 (PDT)
Received: from jernej-laptop.localnet ([167.71.101.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116939b8sm12830385e9.3.2026.03.23.16.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 16:49:46 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: sun55i: Fix r-spi DMA
Date: Tue, 24 Mar 2026 00:49:42 +0100
Message-ID: <2822434.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20260323171927.1256507-1-wens@kernel.org>
References: <20260323171927.1256507-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 23. marec 2026 ob 18:19:26 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> r-spi has DRQs for both the main and MCU DMA controllers on the A523 SoC
> family, however it seems it that it is mainly routed to the MCU DMA
> controller, with no obvious way to change it.
>=20
> Change the DMA channels of r-spi to the MCU so that it works properly.
>=20
> Fixes: 1bec3bd1f839 ("arm64: dts: allwinner: sun55i: Add SPI controllers")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


