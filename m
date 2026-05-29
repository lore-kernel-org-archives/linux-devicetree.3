Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7313DA5B1
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 11:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780054840; cv=none; b=GIvxT28F07wrzlGvXxgvEdoaIrMO9PK5Oda7+m89sLXqSgvoQtRgCdwsJ6W2KPslVlGmVxUroM+9+9OZTQEaQ0znEKTfJDXrPyMCoM106WWzjhhHlyhDuCb35jTpBPSjl6PexPo6XpPWJroywGUd9pOc+RZWnnCj9wdDrEWoTqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780054840; c=relaxed/simple;
	bh=UdoH9v2264a88kp9dYn9Bs+q1THx8Q+a+wHVLI7diCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPPhqYqNEzyCccXs6QwLOQeMGtsN2mbwXPihxsmNFugSWJ65c2JiQfMK+KzJm3ktu/pTB0/ZZCL/KxMJ0y1OgZDlgGO0S7XlRRTUQfi/X35N4d0Z1Mo0U0LHUMZ6LKpHh2teHV+5bsYsZUf2vFYRUUxDAXJNtDO3ujzS7gOWAnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=OMibXqXV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="OMibXqXV"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49039a8851fso82195875e9.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 04:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780054835; x=1780659635; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UdoH9v2264a88kp9dYn9Bs+q1THx8Q+a+wHVLI7diCc=;
        b=OMibXqXV5mEQCNRTJLjbmYObR13KYuljSFFP/FUsPgo+DIhHXf14qjCSauZjIyXMbB
         fxrI+mF3DBivpNWrFXS7mLA7FT9uinGHJ2MoJNBg0SLwZ04BYM5QpjUQZykFneaINvYI
         IbKsZ6zD+fbJESOtVo/RmvR29TkyL+bvC19zw/6OqFOG7JJ1EQqVU2rW/oG/5xdUKTfB
         nyVh///i+zk1BM2EQ6d5popMa0c+L+e2tEEN9ngzVvrm1mVuRsA+CC5GfsbQnEVsPfHO
         4nZtoZ55Y8abrD47an9QDrv79XXuTsMwOPA6/0PNwIizFv8x5OrH8rmxA/uzNcFa8CoG
         KWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780054835; x=1780659635;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UdoH9v2264a88kp9dYn9Bs+q1THx8Q+a+wHVLI7diCc=;
        b=opwBAEU5eX+IuP0KqxTUCNWhwFwizzncTLuXleew873EUXVdgCE4oM7gqD8BffhYCn
         2pBZq0dWQIti0VK/WklVpffCRS9bcUVN+LdqCzduJOdsPxHyz467c7cN/QAVz3lJeWlp
         qsJvz1meFCE08Gle8h1bvmUrlOBgVOnD/nkOFxdwr6x9liWAOmLCIC0BhiH2Mz5WZ0gT
         YreJyuwqNDwCf8mUiOuhBocdkxCAl7pW9oPkf65NOjlWh/kgfm2LqoaaE9UHQxG991+6
         BOjAdRZIJy4ZyYt2VvOU9H1YuKfrUul0Sn8j3zu1u/xsLM72Z3PCFzabJH4XCE53YnIP
         1D6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9cMrOQGvXW04qqsKrj/sXM82wr0INFeJ9FOBm/q4p5HpyXT5tLQJPzGseDLYA/pFPDSDK12QQlhC4S@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe6/+NzNHIchVlh9kaS4QWZI7qy7YBVt36bzoYDzzyQ7SbzQrf
	WrtPLAKMFIQpo3FYJ+lt2a+705kGT5+eoDfxMp81VL3ztoK6vMO1FSScyr1UitgI6BM=
X-Gm-Gg: Acq92OFDzpv+J/jjGG6GJ2uwOgCVzAROPw/Vt75JZOLhf2jE0O7YaAfOx4FuF8qtbgz
	RCq/uB/XeAE+BRB1OFNIGtafTgRc8qq4I7xCqdl7ooAKF2nbrYB7CKMrfU2EdHmUsd3rO+rzTHR
	hZ7VgpbNc3cKUkv9IXW2b3aNxKFrGS4QSyKmctmGRTF+UOZx7WH1Sdk5DwPYlXkTWXYbeE59IM8
	PV0zXrP0j+Q31LhrD8GabdRPiu4YwGxs631U6CzSEMc8OX3TuEMVUgsSKYx4I53j8aH6sgPUrm1
	hj3+oDaDesNtSLU3V+PzAJKRwxiQtxv8Rv7FqA9TqDCMHs52N/ehWvL+0XjpcGbeKpht2WYEAGo
	0ssj4trhUDn0m/moQ6xOuYFEnwQx5nyMevzizWbfVm7ApEUxITE/6yXM8m5/nZUc8bJEvuzJf/0
	/f3M5byKEFWw8vxyG/nDyulAJVFmGETdpujKZ2EqLA3Itxp/AdfFn7i2aS2RvhnMSQ2hL6TeNtv
	dkqRnDEipQSEqUvSIVg2LXkLALv7fhnIE6xrJPvLVQcGxajKde9QCe7xUQB4voGQF9mu23PPxID
	2yozWVr/dsa3ULs2C0k=
X-Received: by 2002:a05:600c:1d0f:b0:490:3d2e:b67d with SMTP id 5b1f17b1804b1-4909c0c598cmr48050845e9.30.1780054834629;
        Fri, 29 May 2026 04:40:34 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c6319ddsm41281115e9.0.2026.05.29.04.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:40:34 -0700 (PDT)
Date: Fri, 29 May 2026 12:40:32 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 5/6] video: backlight: lm3533_bl: Set initial mapping
 mode from DT
Message-ID: <ahl7MKBzUhmgdj8b@aspen.lan>
References: <20260528135123.103745-1-clamor95@gmail.com>
 <20260528135123.103745-6-clamor95@gmail.com>
 <ahl0La8OQHXAlV3m@aspen.lan>
 <CAPVz0n0kpYBACOo=YyNk31KGwBEoyrf+dii8V6QY4iRCGd2PNQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n0kpYBACOo=YyNk31KGwBEoyrf+dii8V6QY4iRCGd2PNQ@mail.gmail.com>

On Fri, May 29, 2026 at 02:17:00PM +0300, Svyatoslav Ryhel wrote:
> пт, 29 трав. 2026 р. о 14:10 Daniel Thompson <daniel@riscstar.com> пише:
> >
> > On Thu, May 28, 2026 at 04:51:22PM +0300, Svyatoslav Ryhel wrote:
> > > Add support to obtain the initial mapping mode from DT instead of leaving
> > > it unconfigured. Additionally, update the linear sysfs code, which uses a
> > > similar coding pattern.
> >
> > Words like "additionally" in a patch description can be a sign the patch
> > should actually be two patches. In this case the patch would be a lot
> > easier to read if you cleaned up the linear sysfs code (patch N) and then
> > added the new DT logic (patch N+1).
> >
>
> I looked into this in reverse. My goal was to add DT logic I don't
> case how sysfs works. My code matched with what sysfs does I just
> included sysfs change as well. I might better drop sysfs changes
> entirely since with such pace this patchset will inflate from 6 to 15
> and beyond.

Not sure about that. The clean up is good and introducing the new
BIT(2 * n + 1) macro does need to be used pervasively or there's no
point in adding it.


Daniel.
