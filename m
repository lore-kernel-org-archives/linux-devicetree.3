Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD1E3EEAE1
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 09:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786959638; cv=none; b=e97thy/bG1yDItoUqnN9VwrmD7oFYNEIN9F95nqb4LUfglO3UbfnWLc3CT2XRzlWUlLz8bAsfo9n8Xe+m/h2DnihyL0eb1tGEeojkStFJDa40ZKuUrDStJkmpYZpE5DhtEEJDRB64GlZClGy7Tn9Iz1ZihgeSL9vaobhMdk5okw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786959638; c=relaxed/simple;
	bh=7VGMnmkejSh3sVd1hpCqrgINcXXfow/Hx/voysWE7aM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eIlVApp4Dhwk1QHwOivvNXlNTFvaVNRKw1LniR/TsL9LGiDZpiODlVYykz0DmsUg4uBmKd/fTzY5JWSYJj+KON5H+EqOHCp0tLZc/sFblbErOr/Q4fb3O2VgD4mwGMS48L3rliYIsC796f6GLBv8enqYPfHN+E9l9ooet7ex7wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=OxK4Afoo; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="OxK4Afoo"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49558ce01afso24190595e9.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 02:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786959628; x=1787564428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7VGMnmkejSh3sVd1hpCqrgINcXXfow/Hx/voysWE7aM=;
        b=OxK4Afooh8iWOamFVvhtRaf1jWHdGPK1FjMkEV3a3QqNw0LDcpKZqMu0Zq8zQhTLQ0
         sUPvznOvTY7RAk/NMVcfFcO6I5gO6PSj3K7efy4kNAUa4ttskweRQ8W2j0ywHsz6edML
         PZYKscBMMxK7Jfg0i+jzxH7xyXhqAOyvHgyp0cihRIoAtABDOqD3PG5WbGkTc2qcoSiD
         xKTWuHRyU7hCuKAjS4vVRCXU4AKKX09/4gtp0gpZ6k3UlEAVIgQ5OE8Zh3mHlt+Q4GXL
         dHWln/0RGeATlUNIdK2CiJkndhAiu58SJCDz4lMOnWk3OaxT9x+kfO2zJoySZr16r1gl
         hIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786959628; x=1787564428;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7VGMnmkejSh3sVd1hpCqrgINcXXfow/Hx/voysWE7aM=;
        b=C14RyyHbDAPA95c6WChX3cmah0IBiNJm7jjW715max3ecUDVBR4fHtIrQKETGptvSn
         0E6/OH+NQl5yXwBS7scNWZSFwAbOnRKUttTz39Mz+rksuDzyYFpSGh5Ls6biNYnyDSjo
         4ViWlcD0skPAy/9c6AT3Q4WlFEfqZqEq++g5x98Drs7jcOvCmoBcv0Pc6w+gBRKVlKcK
         XCT312Y8MhDFafI7Mo4Yb6VaEpwPE25OkGXQMeqtfgqVJ+HyWsDOo3wOTWHiP5WNj/gt
         mb09IWANEFK3c2o67a9b4X8oITIDrhaIG3QyZa5rIMXTc0YGCuOsi9jdoCaZMj0ugNZl
         g1jw==
X-Forwarded-Encrypted: i=1; AHgh+RrKOGe+Vcsa5KxRnJOAnJ30DHvv2VapNztpLKfZw2l6zVOVKmWDZYG7JsC1va9q5sKhxG0KPMmPyRu6@vger.kernel.org
X-Gm-Message-State: AOJu0YxmDy6M13Ezrf3/7z2e3NyNYA4NuTNxcBbMTZArrZHt+V/0RVmV
	/fJGEGPGTT5pgChEkPu0NHiiJiok5FL/YB5G5+wpnw/741yS4ZbOZd88COY/C/ohbFU=
X-Gm-Gg: AR+sD13+BGdESr2GK8k8CSXFp477jMH6D4sFDALGuFFe784J8MAhZkfCUe8dl0PRLMT
	mJR31kG2F9wcl0IxwUEbpOU0x5jfr9JPF0c9cjR8T9qmhL7fE7LJbblOmCpHQXIUYId7DtpxlYL
	0qeh7Zyc6QWUGRPEdNroHB2Ny9uk4vrU5v+L7kn8X17vl8MZTSUt+JJJBw2Tsew1wY97yCTIs0Y
	ZiIOATXvPFndD3VroUOfCG3c2aAcDGsEMKRHk0psF1VR9oIAOUBVGd9z4LnWqXvmG7CU8ySizDR
	FwWsjmztVUk6lId+glfKXWICZTiRK+u4uL7BHrqSCz5ay6Yf4xOX5dldYoCL1mmCJy3DQ25/+pG
	kbE2n3Pg97SI/RiiDql52WJR0Vns2ZXjdqY5VIjkZREAGEQ80ze0WigO0gWJ78+Klyg7j5x47fZ
	5tBsgYGUSQvr/ly/qP/7Zfq5zIl0Lv80mKHgWRvvP8/nh0DBnOZddqvQPj3ezgyviK5APqUO2XB
	i4A7FQgMB5OhBtcghEVygF2nKG5NBhhR4bVRFehwDijcaoWH8ypjdx7UMJz5Aywi2BeH5paeTSo
	Ului6YRzXwvvWYJ3rnmU5MgbPwWcjerR+r5lYuNFZ1/mpw==
X-Received: by 2002:a7b:cb1a:0:b0:498:519:e660 with SMTP id 5b1f17b1804b1-49987935847mr230720425e9.4.1786959628339;
        Mon, 17 Aug 2026 02:40:28 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999d0fb867sm36476785e9.10.2026.08.17.02.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:40:27 -0700 (PDT)
Date: Mon, 17 Aug 2026 10:40:25 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Wim de With <wf@dewith.io>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: backlight: Add Orient Chip OCP8178
Message-ID: <aoLXCY-q_o9IPDN3@aspen.lan>
References: <20260816-ocp8178-backlight-v3-0-caf95c453c50@dewith.io>
 <20260816-ocp8178-backlight-v3-1-caf95c453c50@dewith.io>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816-ocp8178-backlight-v3-1-caf95c453c50@dewith.io>

On Sun, Aug 16, 2026 at 12:57:03PM +0200, Wim de With wrote:
> Add device tree bindings for the Orient Chip OCP8178 LED backlight
> driver.
>
> Signed-off-by: Wim de With <wf@dewith.io>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
