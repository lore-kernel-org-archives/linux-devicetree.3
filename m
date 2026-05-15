Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD92392C28
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 19:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778873027; cv=none; b=oeXwDZ11IiJEd+yL3HFPGhMwFkaj20oAJ2MU+9HbxI6lKjLrCZpaic5+U9BmOdpwJklPiaSUKx8Yt38xqzV5qTL92huuUsmgg9y0vkBq7GNG+iTjUoi3gyEp/UYMKGc0qrjtzjuaF778GWTq6KwVCIgvRCwY0EDEoKh+WQ+LzHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778873027; c=relaxed/simple;
	bh=DMxsZcVsw+nJoJOw2PtEXmSbJMObppD+XcE8tEfDI7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VonEJ1tl/rAPqmXAez4VY+T6iqwFP8sBBpnoaJFJAnD1/KvavnQvbBjrTvMHwWTmhPTD/0blYi7zBT3aLIHyzrO3B5A83pI2fLzIeVeUyOZqd9GdS6US1//wehpekbhbOFxwIDSRuwcpzgD8189kmZXvz5UfKK6vrYlUQfcBtNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jECUCK6+; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jECUCK6+"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1331e851faaso66084c88.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778873025; x=1779477825; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DMxsZcVsw+nJoJOw2PtEXmSbJMObppD+XcE8tEfDI7I=;
        b=jECUCK6+TxIZq4KxyzhIuO0oL59r9RUDf2p6IZu+wp9iGMspfDl2NvgvervEguOcwq
         bfmcE7FW+1dhyKcMTsRhHWtNFVHKpcFX4nNM0ISgLJCgcOJBgULY7f/yAunxr5S3mvAB
         fx6puevBO8F+J/2dP/wqN2EGLj/kSC4Mw5sHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778873025; x=1779477825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DMxsZcVsw+nJoJOw2PtEXmSbJMObppD+XcE8tEfDI7I=;
        b=UcQiPsoHL0CvjeQrnbBQe0/r1l/G/VECEDhVTAdvaSto340K7ZcXWttZaai1sR6Vsc
         FvOtklSj/ZxRBDRu0sPjhN2R7oSkXFLpV/B0BxKNQBZUhJ2nM+X2iNt2pwS61OfCCT8W
         XK3LH2F+JX5VhQQDxa7OyT7MI236RtjLhge/CJh5BhHYZE2tpwLZ+ze65ZJbo/g5P0zr
         n8yiSMa4AY06Bon6AeR+LWod/Bw7e4noDS8TO71q67wfFDE4QckIle9fggd2+zsWZ2il
         ENdbQ6wEGjiigU6iJM1OJnCiwlL++hCy7mjs5P/tK6GQP8OPAun3PuMDn9nglRCPi62/
         tGNg==
X-Forwarded-Encrypted: i=1; AFNElJ9CXCw4Z6DwOtZdhoyUaxqD9S79w+9DBKHUDHgYEJmwcnUpKzRKneihyaLdHWeDWtkJsPGBd6mn1KRw@vger.kernel.org
X-Gm-Message-State: AOJu0YyelpFKV7inHqDqfJmsRGxf5/dxJczefpAXxoEP6hGhjvRmQ3eI
	/CBCcGmwpzEV93jdjzhQllh8QXylWhgW1AzmN/gFqiR0cEc3YhdApdYGv98UUytmrw==
X-Gm-Gg: Acq92OGWO2naYY2Dsfbv2hi34kwTBwNOvkDiVd/x4UVS4yOnj30NUeYnOFLe14YAxaB
	cKZQMeOrNa5nPkKg/2dvjJlzu2vnDnyufmtDk32D3NYr8XSNNRTO3SYXE233OgSL9KM1M8+Pg5H
	45tKfLCkS6KbWw2T0BiPNzLJAjGpJ9FLtE7L4bcBFKq+2vvw9zcGSfIY3Za2vwYok6DbLbFkqZ9
	5egiG4ACKjq7UVUKofP/f16AVGZ2AVEQiUpF4XAu8pnHVErVKQcbzbvNsQo4DIBXpi3/9MCHNof
	XLuLSTjgcAcnvq4BwfN6+hbzYvaNXKn9zEr+9U08XXClBYOm5gVjhRMACiF5VL9XZgpMraaacFS
	9V4ZMVPEuVYzvRMgSzSvKvcMW1g3tab9o6wsa78cLGaRkwgiRPZjTZXgp2v2mhohXFmAnl7gEHL
	VIOukPrFEnJWKFLAZEnzoiEeO+yAO4DPMASKjNUoaK+urjNpA+eawQp8Hj8fAHO+MGKNJPybCf
X-Received: by 2002:a05:7022:3803:b0:135:1ae8:39a1 with SMTP id a92af1059eb24-1351ae83c60mr1049495c88.17.1778873025162;
        Fri, 15 May 2026 12:23:45 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:6286:f060:4b08:96eb])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-134cc33a67csm10704810c88.13.2026.05.15.12.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 12:23:44 -0700 (PDT)
Date: Fri, 15 May 2026 12:23:41 -0700
From: Brian Norris <briannorris@chromium.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Joe Perches <joe@perches.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yingying Tang <yingying.tang@oss.qualcomm.com>
Subject: Re: [PATCH] checkpatch: Don't emit warnings for USB & PCI device DT
 compatible prefixes
Message-ID: <agdyvR0EjH-RXBcy@google.com>
References: <20260514105151.2771474-1-wenst@chromium.org>
 <agYJJVfMBVL0KB05@google.com>
 <1eee92b884068d649ef7be9f7d931da27aa04536.camel@perches.com>
 <CAGXv+5HrunhENv3QD4uG0ZLs8BvdOdrQcfn_82DRP51+_+ECUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGXv+5HrunhENv3QD4uG0ZLs8BvdOdrQcfn_82DRP51+_+ECUQ@mail.gmail.com>

On Fri, May 15, 2026 at 11:24:09AM +0800, Chen-Yu Tsai wrote:
> We could import Documentation/devicetree/bindings/processed-schema.json
> and match against the compatibles and vendor prefixes from that. It
> might actually be faster (vs grepping through the entire DT bindings
> directory), but it requires the user having run make commands that
> produce it.

Personally, I would avoid having checkpatch do more duplication of
other/better tools, like the DT schema validator. I'd also avoid having
it run other tools that are not guaranteed to be easily available.

I would focus on eliminating the false positives, even if that means
making checkpatch less likely to catch omissions.

But my opinion may not be valuable.

Brian
