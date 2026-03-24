Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B924D34D934
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 07:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774338874; cv=none; b=P8gEbmupH4Gc3q80olEFYOqvcNs9VP5SEMyoouzq0BOuWFaJ7gj39mkbP8Q4kWZTju2muzoInyXZ+C+cmrENlHwetveaRb6Nby1xvl4o7brEpivDAdiC6JHjMvt7BSzx//DFHxNBRIwHbjsdZfPp//NcxhQrzJe+n81g3l4+gtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774338874; c=relaxed/simple;
	bh=kQnYsQgt15bMBS3ohsQp4zs/MlAmkjl/CavKkrpGC8A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RCCvcicJrsrzrPe5OTh8Gp/F09svdF+NVc1AQHFoSeH2QI0qLiLvv7TvRWvVVMhAqeRu0zbom0Da6+rQghg668ElnceKmHg37BFJHiNwidiOgVCS+yPczebT74MIvj+DzSnVTKYBwnMtfBSGD/Br9wmOlyJJTBo6+JTD/1SxUsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c2LwzXe6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kh8x7CKI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c2LwzXe6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kh8x7CKI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774338860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NY5nUJKxwLcdpu7HOgzJTvPCYPrPJwn2RF0wTsX1HlA=;
	b=c2LwzXe6sV4357zCVVsCBFFCjkRkRL4UPEjHAlz3LsRaqUv6Kk43D72AohRNbYr7OBdBLJ
	DDep49VDh+9H6CXXDqwyIxRA/+AYO+QTOcdXVblJxs63b7HStdCdonO4snE5B0PksLeeK3
	vy58+kQGEnLpZyvv4Hu9sSMyVuKgfS0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-ZNjOFQDoNV2_Yx-y-coAzQ-1; Tue, 24 Mar 2026 03:54:19 -0400
X-MC-Unique: ZNjOFQDoNV2_Yx-y-coAzQ-1
X-Mimecast-MFC-AGG-ID: ZNjOFQDoNV2_Yx-y-coAzQ_1774338858
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4836abfc742so25202355e9.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 00:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774338858; x=1774943658; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NY5nUJKxwLcdpu7HOgzJTvPCYPrPJwn2RF0wTsX1HlA=;
        b=kh8x7CKI9kPphvjmouX5L58GKxaQ3i4uFhxCWckJmQD9Hh3z6WjaT5wa+JezzX8ZCa
         Ot7JKEHuoLFPj86xWADFFigFpBNVAWMpCzrE17Wb9XDPVlSDBRUxEQJ0omYj4ECyW9LF
         A/3frO4bVEuxMorQ5/83ujCvSHw6+M7daYbX8rW6m0PEW1zJpV0WqGZRiltvJF4orMtH
         xZIrMUw8vJWEeXdjVftbuhNhx4//yng13vx7eX9y7j0g6xJoNSVmPBSDgx3RPIo7HRWx
         2l4rC/QbUzTFjQHXTMuVmzTui+L2SzfUzgUd6haIXW5fkdTwxnReujyEXhL+5QyoRC4K
         zjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774338858; x=1774943658;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NY5nUJKxwLcdpu7HOgzJTvPCYPrPJwn2RF0wTsX1HlA=;
        b=lj2mxgCOkGx8ApC+LNqy+aUPIa4WL6rkhkrcIemw20ohADRO2sjQS9b/jOvt54LoSf
         KKEfJon16TzXOjSIpYPet9qd7wGe9rhBS/I4+86nhMvK7IRiY6ilYqqjOfihb3exO3FY
         0jXUQpJZ8bxlCp0LwNu7yx3if4lx2KemZ8ztobpvgy6/HwP9Kop1P4XZW+jClwJu80t0
         gPbc3bn/Dvt0e4dgAQZTIOkt1scYnHkzfrP7oc1LK4FqzAr4gPzTCI6bjOziyCjr+ffl
         NlS0Qw03eWqCawC1s1vmgog/x//CNaQEm2BEEdo6/9AyxIzJhLxLt7JRobVVHzdg6RvD
         3dyg==
X-Forwarded-Encrypted: i=1; AJvYcCVS02PGCZPOiG8pvB7pVRNqdSeQHDusl35nRixVivE2UHtxDUBfhGKj2+v5OWjlBeyofiKdpghr7HjS@vger.kernel.org
X-Gm-Message-State: AOJu0YzwO2TIutUDf5DYSQDDrUxsiRiaEukgFbBdXNidbO9mS0r9dT9M
	YALc1gpl95G1CkZTcFCZEJxz9/TBeWGp1Jha07hFoO5byXzaUzk2XVVWwh0BLzriCgrTTMUd8UD
	YfxcwxY/lRvb/KYOpVRmvIAZMk06AP50nlAADEoqawzASiMnYPRkokcBeP7Mt3w8=
X-Gm-Gg: ATEYQzzFBzPnmBrc8wyyJb9afQOO3LKE4SdVp7e4i1vfAbhfOaeBzZeEcs2J3NtGznu
	fejXWAPDKOsvURWFOuVlzqDPx+IILSALOpvBc4Q3GX4GozYLfklwpeRd4P6NrBItFh+6gz5FE0a
	7ZWOb9kqP4PB8vuO8eS0C0SERxD3G11APS4fvAb/XcU33nh9izm5JOkNxh5c0ssq98HUazhT15H
	n2lKtiizQDzUTExSkNSh59rdzy7eqGU5eilwGMYMJxuCNsK/PwVVD12XVjZ9wLc50Y2SDo9lfCs
	fskuN3iP2VXPXEv7BIo9ogObbdRmK5cuBVPvWedo2oY7E5e6ZxbrDBq+ZXj3hxuAPfUDeMQ3VL2
	9kmyxrzKiolyvuk1BbnmY2YjmQLozJTM/cEJdCDDoOQqlLqyjIz1+mADUmPGTnriQQoS/IUlWmF
	XChaDy
X-Received: by 2002:a05:600c:a6a8:b0:487:12c:e7e1 with SMTP id 5b1f17b1804b1-487012ce8b0mr126639425e9.11.1774338858172;
        Tue, 24 Mar 2026 00:54:18 -0700 (PDT)
X-Received: by 2002:a05:600c:a6a8:b0:487:12c:e7e1 with SMTP id 5b1f17b1804b1-487012ce8b0mr126639145e9.11.1774338857718;
        Tue, 24 Mar 2026 00:54:17 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871174f2desm38779755e9.9.2026.03.24.00.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 00:54:16 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open
 list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, "open
 list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 1/6] riscv: dts: spacemit: add LEDs for Milk-V Jupiter
 board
In-Reply-To: <20260322203356.2206927-2-aurelien@aurel32.net>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-2-aurelien@aurel32.net>
Date: Tue, 24 Mar 2026 08:54:15 +0100
Message-ID: <87ikal8xy0.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Aurelien Jarno <aurelien@aurel32.net> writes:

Hello Aurelien,

> The Milk-V Jupiter board provides support for two LEDs through the front
> panel header. The "Power LED" indicates the system is running, and the
> "HDD LED" shows disk activity. Configure the corresponding LED triggers
> accordingly.
>
> Caveats:
> - The LEDs are driven through a 4.7k series resistor, making them
>   quite faint.
> - The disk activity trigger requires a storage controller on the M.2 or
>   PCIe interface. That said, it matches the purpose and the vendor
>   kernel.
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---

Looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

