Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2A7313552
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779116663; cv=none; b=OqCzwGLX63H7TfsgCBbP/8uc7k4n5SSS6SmQS2knG32H7o4afEj4EcqHb8dHV60SETInETGtD85DFSOnZruCTb8V1wuPhCGTFhO3fFiZRPouutX/r8Pd8jFeSim6/rn2VuhKeRGkHcpWM7NikK2DXbVKvgkjZHY4NvCs5PtgYcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779116663; c=relaxed/simple;
	bh=pB01CjfbloEWbR1UtTzExAs8F0D8sWO2BJNozLy2eys=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mFp/3G5BiT5V5mLHVJDzFGImVQe3WCapWzc9Xvhwn4U0KcdCf6+Z3LRInl30Uh6FDpv0zf/GbWHcBMluOADb7KeeUGq1PE/MfCcRIm+GxyA8t3bxec7gwtxps99Wr+k804JLbmP4v8sstJR16NLPhsqwWoYxCIESrrAjbN0xrII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MsczfQUk; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsczfQUk"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48d146705b4so26038885e9.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 08:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779116660; x=1779721460; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pB01CjfbloEWbR1UtTzExAs8F0D8sWO2BJNozLy2eys=;
        b=MsczfQUku4qdpvMcTy9Oizxkvee/7cZ+vsIlN4tCJmc/nLx1kMYDaOHNQc4h8R6gCQ
         wGjtGlwuouUdP/2KPsIbu2igMMzrD7GhjptO4QWyMYYPsFn1rc1zw3/ikpEikiGrnZwE
         MEv/VlC7Hq9+CzxX2eMyMmPwf/eExbsLYyBJoZUvbrPsxc9nfesF9uyySjXy8bTlpr5p
         49T9Q9goI94K6FCxqozdIYpTqfm/W6CCrid7Ec8Xo3gAn5VnZetJLltIBVdntwNZIp2o
         6zOhyfSKTvqdZxelXLxnLEjgsP6o7jWUTlFbZk9L59sjG+AXVOSZqgQ3jNMgHhHcvaJF
         7uBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779116660; x=1779721460;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pB01CjfbloEWbR1UtTzExAs8F0D8sWO2BJNozLy2eys=;
        b=M/lmjBEuvdNN6z60n5FHnFh0TLhOeUp+gu2KZhGyZt+xF9ny4oqfNdG8v5c9iDQNp1
         B/FHWGaq99WTQpWCX0ezwB6Pxy4XID7roxIoitq0o4m/6IE6QL6CxOCsYTpKBPAJY7m6
         geOYWIh9uCfW9LZL3kMqKvKPOHNtR/Qmt55TJWxmjPt8qvdjt4N7mBGp+E552NZfpWdV
         /Pq0C1XxEe0Xx9j5+xB/jYHAUgwoHyQ4W2JLzcKH+LZAlIx70BWp+WuuwcriNEGIFqf1
         WAVx9/DuTHBggsy5HSIwPeqfA+WndgACf9/BBhgaNF9BAHaCAJZwr7ql1wJXjVTvxyOX
         5Z0g==
X-Forwarded-Encrypted: i=1; AFNElJ/ACxzP072+0aBlyglfpUPDoBAs4mpZoS52jiEcEdJkOdhwmQqqC6Q6iFnrsNZoo6+TbmDhKHtdpBrn@vger.kernel.org
X-Gm-Message-State: AOJu0YxsXLgUt5DGKpdt1QU3i3xyiINGOvHZ5oSgYgHpB4GDtugXR97X
	wBhf6TD+lSQfCLbqHUojW5OlwmMJPZP7Zg5FgsxCRJKdR6SLSpeopvoI7+Mg1Svq
X-Gm-Gg: Acq92OG0JcsbGU961MSf009OtZsBRt1844r1IG00odBJdzPD6NZeWQ2dAs0nyp9fKD1
	WIokxktWa9aBc23cvT+ZT9IgbkX+pUy8/xSoHAi67LvFsumlfPHRQFnyOLIMbFITl0BcSxM0m+x
	eeO/2z/yhp0+YgZ7kt7iEy38Jw2t/QOt7xnFXjCZ79DcT4/UlgHl6/pdsLAwu9KfYQHQYszdRBA
	UGu468kjWqu8KUb0ogm3fdKLDImsSsuZmypJ56YW0XYgJzKhwAQ5dJSG2w9KNhFuv1o7RGAR355
	wAxjy/uVnSIKK6QoxF/a0wEnwo8+mE3hjheGzWL0R91LAB4qTHEkPlnCX+5yKe1lrO5kFZYO7L7
	mEEFHzg4vXaaMT2hdyyG/soD2qaHJMh8R2vgWx1HYefKYAWc0/JHq0GmrtO/Q8gePRL+8fECqAl
	tTfdkfVLxDdEYQRGmo35gn/FxNxqDjSWF1FcfCgGuqGoUjfxu8LHyfZJa9Ueo+tFDSjKk3CEykE
	5V1tODEezIYRyVP190EO/HP
X-Received: by 2002:a05:600c:c167:b0:48f:d410:6065 with SMTP id 5b1f17b1804b1-48fe66138dfmr242995475e9.29.1779116660290;
        Mon, 18 May 2026 08:04:20 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe58638sm81701595e9.17.2026.05.18.08.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 08:04:19 -0700 (PDT)
Message-ID: <a921e006b872de3853069ddd08facd3dd1c719c1.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 17:04:17 +0200
In-Reply-To: <agsohFpjuGqRRDO-@collins>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	 <agr9m_tidBr6Cu2h@collins>
	 <579c7c33123c4cd0bd486301e56daf5962ca55ec.camel@gmail.com>
	 <agsezxcxjQlBmesm@collins>
	 <bc3b786313adee30cc00c65ea98ff5258a816abb.camel@gmail.com>
	 <agsohFpjuGqRRDO-@collins>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Paul,

On Mon, 2026-05-18 at 16:56 +0200, Paul Kocialkowski wrote:
> I also have the 7" LVDS LCD that goes with it, which was supported by
> Parthiban's initial series (but needs rework, and it seems that he's
> unlikely to do it). I also have the 5" MIPI LCD but it's less likely
> that it will be supported, although I have seen dirty patches to make
> some other MIPI panel work with A133.
>=20
> We'll need PWM for it which should be a follow-up to the current H616
> PWM series from Richard Genoud.

I didn't have video in my mind, but...

> Other than that there is a PCF8563TS RTC on the board, audio stuff:
> speaker (which I have) mic and headphones and a GPIO beeper which could
> be added.

... would be happy to work on higher quality audio I/O support after
we get the base merged...

> Do you have other A133 boards that you're interested in?
> I also have:
> - KICKPI K5C
> - DshanPi-R818
> - Logicom La Tab 129
> - Trimui Brick

thanks! I'll try to concentrate on the SzBaijie Core/Helper boards
I have for now.

--=20
Alexander Sverdlin.
