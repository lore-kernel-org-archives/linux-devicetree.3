Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B76395AD3
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785749565; cv=none; b=Y5h7oJatcsodzqNCWq+PZhEKZH3PsTz324dLJYjBpYiD6suKprws51eW94q9pDBRg5MP3rKdjCZiJtNJUPgJIAEGqa6eCHIg3HRwu6uFIelO+OrNxcfvLDeMDvgm85PJgmYJg4w+bdA3fA4pdlXk4ZoP4fn8+oFNpCSolLu5bFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785749565; c=relaxed/simple;
	bh=abNN/kqFNibFqpeeX7Sc8+iZx1RJSU3/djmn15kEPGY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WwXJhHB5PZ6DJX1FLbcFBzLH36JSfAKZy6Skc9JTe49Qwkt7M9Ux/Gv16JvD91cje7Xm23yP9QMjetzGw4DySDpajiiWHwF9cESGjeuU/Vn+tTpJs/tPi4QeOShcYBLXhbBvSuO4YlVrX6hWqORvWh2n05c1Gu9So5k56qF4rzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWI5Tgns; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWI5Tgns"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49557167508so16779585e9.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 02:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785749554; x=1786354354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YRSnGgtZ7AscHIrA+ZyhPls/W82Qa2a03dgwWmp/mE4=;
        b=DWI5TgnsbHM9eurp/FQ6hC22cNUkO3LWv/1dBSxOA1BkiGXwiPcZ40sp7PjvDzhMLg
         mN5clHldyIWU2jbu6GRkdwunaLrR4Rv3K3FNb4xo+hXgOpVe4WKSD9oh1440YUAmcxq3
         bO4T2iG2dkjszZX/Sz9pKXCooglp/MugudjZvEOLmwNoxgkmkImPO6fiVo06VwaGxtIW
         nOAmcQZCxpvPAzKb4y1PNZTizDwGsHfbXyDBx/DUHNWRDcghkXGlIeq6G06GB9Ymh/KF
         ZERH4eQ2LLfeRzi88YV+A2fPFpbGrr34ox+kx3czuaGXi8lfugDiRSODyURG5NNohJKM
         hhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785749554; x=1786354354;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRSnGgtZ7AscHIrA+ZyhPls/W82Qa2a03dgwWmp/mE4=;
        b=J2BUmWaS9k1SMJXmET+fMWCSWRa9YOHWpquwhSsMxBz+NvdpRrjLvpn4AbtSZShOAi
         wnd3rnOjTaiX77J+NzgCXdypUT6bH0axQvBTzCnnHQjF3ATbdIZBIyuvhkLxIZo76sc5
         tpWr+1KZ8X/0Fs7TO052F2Aj/emQb+tsxGZws5lD8Rv7ZS0yT+8EikSS0jUl/JVsJnNq
         uZ5eTz20Ny/h/6IuL040PQqLkAGKsic9RLBlANDm4YRIWt2kOverN6iMT4WK89jnBDHe
         n6xZuIo70awPAZbz6SuQQm6J8pjfX54bZzSlRZHQfIKsFQ53lQG+MxJZVvCjbg2RYJZ8
         V3SA==
X-Forwarded-Encrypted: i=1; AHgh+RpyTtQ6a+dGDAWh0Cdne+tc0/Sr4nw3KNGBLk7csFoFxTw9USQrqrQJyq03YTZeI6JjI9ZJ8BOCLlk5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn8jN7GEPuUgd3LLvvwfWcCM1hfTEO62DnQE1JLns0DN+7+xGK
	5XJxei8prcU0X3yXtDrQpSD+9TstjffIq4EyQ/6DjoZoxkMPvdKv4u+q
X-Gm-Gg: AR+sD126yzC6Jvi4Ngs9mjyy603zRj2Lb9+yqTaq3iRNY9EZ5sJnVvvSdj3JBTbfbzs
	p/9zTwS1k+kypCHMAsgsO9hx++VNDOLUTCHE6nHXYPRrkEo/1NWBowx6T/qJIYbTDNITqGZomTD
	xYYxIjU3BfTZ6nlnug24OHQBmWFpwT4+7ZWv0xOJIR8bw6fGwP3+iKfJVLmldC/4zoHCMGsddw0
	NACwXfbEArDR52qOSg694QeLM5wutPwenfv5Ld+qetO3wGOy1rkLv2DabOcPfMH9oRrUJBzC4SX
	d+tuDP5pqtX2uiiig2xZ6pDjvhzvptgd3w0qxHrBWh3tkiz8oCwg6xigbLSiiKbpXMosX7mduhh
	VOFnLBlo29G3bo8cYFaIkgTx2Nc4ob4nranTH0YHthPPkN2yKvc1GpDAfN/xuq2xnc2nPIm//ao
	T6RQ1RWQJlSzQoRpf4DbPMHzr60uwj82pnD6SBjDL+g7RKYlUwBFpj2vb9mTILant1/OrXgyDDj
	F7+MBpQAN9X7rpwT4Q/HlBfrlX7qvaE72HU6c1zkX4ABxDa5eJ/+o7/w+7P7P0WBgKfnPgCKvG6
	cuDQcpVQUCMhfipsmjCcxXuOAb/FKbc4e5YAMkGsfFrLHGwo3NYpoC4ud1UFp/v/QfH8c5fffeA
	8u/mqHY2UHUujhOBqo9G64sFYyg22khBahCfJxnBfphY5Xd1DQQPRzLg5kc6v79e/gAnRHym4hL
	ydc4AdNQ==
X-Received: by 2002:a05:600c:e548:10b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-4980c649c63mr154714125e9.6.1785749553608;
        Mon, 03 Aug 2026 02:32:33 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808691014sm219556615e9.11.2026.08.03.02.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:32:33 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:32:31 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Wadim Mueller <wafgo01@gmail.com>
Cc: jonathan.cameron@oss.qualcomm.com, krzk+dt@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, maxwell@maxwelld.cc, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 marcelo.schmitt1@gmail.com, 455.rodrigo.alencar@gmail.com
Subject: Re: [PATCH v6 1/4] iio: types: add IIO_VOLUMEFLOW channel type
Message-ID: <20260803113231.00004302@gmail.com>
In-Reply-To: <20260728214943.29820-2-wafgo01@gmail.com>
References: <20260728214943.29820-1-wafgo01@gmail.com>
	<20260728214943.29820-2-wafgo01@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 28 Jul 2026 23:49:40 +0200
Wadim Mueller <wafgo01@gmail.com> wrote:

> Add a new IIO channel type for liquid volumetric flow sensors.  The
> unit exposed via the standard _scale attribute is cubic metres per
> second (m^3/s), following the SI convention used by the other IIO
> channel types.
> 
> Update iio-core's name table, the iio_event_monitor whitelist and
> the sysfs-bus-iio ABI document to match.  The new _scale attribute is
> folded into the existing shared _scale block; only the per-type _raw
> needs a fresh entry.
> 
> Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
> ---

Since there's still time for additional tags (and this patch has none)

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
