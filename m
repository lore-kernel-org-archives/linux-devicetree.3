Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C41F342515
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 14:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789827906; cv=none; b=VCdBuumlOxDAzOJtiD9HY+kaxpSo63fAdLF7Li1dF18VDIqU+HaSeGGSgZEM2I7Qhkt5/fRw+4dH4Y/MZZhMYTz73huksrmIn7babhvUVsu9LKryMkzlNpmoncmFzArOzRIzaqnU05/MNV64j8c0lYLNhL05QVL9LwdBNf+wGd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789827906; c=relaxed/simple;
	bh=S/ViNZ2YtzcrRDHfzV5246E+VEqBUQTYkIoaPYG9LJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WcvDDT1rravjGtGoDMW0zQjZM/UOS0UH+VEg73HPyc5umijYqSESv4xHui3zOzHFFNZGBlEHYxZcYv9+hVjNujqQhTtafZCEvtkGJhokiFvTZgNjp2j5+1Uk0AZC1FyYqvtlybkJLeS1ruRCL0+DgCxlI016fr1eQPkVb6Ys+mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=gvlaENZU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="gvlaENZU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b965f447cso13687295e9.3
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 07:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789827902; x=1790432702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VpdVAxuNOwmWu0WfirEONZSR+j3md2xsgnrcoSx6gSA=;
        b=gvlaENZUSvSoUstlazyLHBM3KS9U/VSUHDNpzwL/LSCxzRlPnwxi1fSqCfwPvznIOt
         J5z0TIGlN7URzU53R4atJNvyYznbQqDastpR2tGaamkJyRWxIqw/F52q59btgJg5Wh4k
         7HJrXDYJiMOkj2MOViwvExuM+C+I2fQjhc7YrfrmTE5RagT6DlIJ0J4BKn4F/HVWdm/E
         CSsmy2k8FKA5eCnr9Xqhwdv9J0ZzvX8D2PaAaFpP4goIzaQIFC9cFjxrrp948Kc3E25U
         t4TB7d6rjEop+ayr5R+SO4Zpq/VhmdAd0koVN2jwQY4QUF3yPxIVWIZVSHJqgoLmnpMT
         gvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789827902; x=1790432702;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpdVAxuNOwmWu0WfirEONZSR+j3md2xsgnrcoSx6gSA=;
        b=kK9rGzjSpi/rYDRDh6Rj3Ty3x8OPCUp82dD4AGcZlZDbC/XIMFqww0CwV+kScGTF0a
         HKllidZp7IdcLL2smd8SRTi0u+Tf80OEPJYTTenShcFbnDKF/4bJiWZzXwznjLavD2ww
         CGPEgmIsewNTMDJa0zR2L6cxTvPhoH7II/b5So+UFqac8gWeCRiltUD9mpBEoHIwqQcK
         iIPZ3+PWgU3D3ehoFxDPeQvHLTUFP6A1ElP+hMgne0FiCLo0VtRHUp1puHKcvM4UulEx
         +F+2bSGaBnGtA4n/rXKpPJe3XxksWcPgfTiNEF3G9a8WwI4OzDKXge6650v7x/Tv1ic1
         f6Ug==
X-Forwarded-Encrypted: i=1; AKwUvBzpxewrH9hXgzC8TmpxHTA8gsJ8gZjGjJrWKiT8PL/WokQ6fFtMZyQfhPUwgJXvkW8y7L8YQ9izqB+d@vger.kernel.org
X-Gm-Message-State: AFuF++lIY3he69Dr9RXOzBc4qXxVazLZK8w5vQ1faR/fTJ8NYmvb+YMO
	xmHaYvCbfFLhdm88pqH/D961rX40PgUhraiUOBOGtAXpYU5UZPEOmjEh677aVL+zUD0=
X-Gm-Gg: AYBFou0g+Ahbah1oBYt6BNPFA+eDMSgSR007WTNcmX7Uji+3iLIkAD6ITEj+fIvvA8G
	2Uz7v2muqg89xagu8ZPZypv0XfCQIiI7CCNmfB+xGyCdAdiJOHqpcLaafu8aAaabBIoR7OH2Bsz
	AKiHepFDrriUM9RPws5K6v+dgKp2gEk/Ows0g3ZPcKIANf/WkE6FeV7CZwDSUA0L99kDBZ+m4uU
	zJLXkTlPtudFUcwaUeq421J+A+AFBT6QLt5QdHwPb28ahskxmWNNGNYWypIQ/U+jk4z1oNyzR/T
	lIBvM0FDsXnJ4EdZkcDOVBo3KaMUE6BgNYoVL217v9/WO3Xr/tWgygXUDyuesuDsGR4G7fXE6OM
	f7khBkHBL9OL1ke9kJxahA8YPWAwdxVVWI16hM+mo4YJx+Rzlj7X8JgdDRatNqW/70oEEoFowh6
	e4VZlcP0jVVMlpyel9JwBPrJnFqpXyKFz0CkAvvj/ZqvtJfZae9V0DPL/+sXI0vZpy9i4yFWX7a
	J04oDkkdklacpr9iDSgqoWQSveYyhnvU0sDBdoS1Hg+TjxnvQNKWHw=
X-Received: by 2002:a05:600c:1d29:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-49fc572b7afmr84151565e9.22.1789827902455;
        Sat, 19 Sep 2026 07:25:02 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd090f0csm106948995e9.15.2026.09.19.07.25.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 07:25:01 -0700 (PDT)
Message-ID: <111e4f31-1c2b-4e7b-ab8b-534544d2ae22@tuxon.dev>
Date: Sat, 19 Sep 2026 17:24:59 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/5] ARM: dts: microchip: sam9x60: Add GFX2D GPU
To: Cyrille Pitchen <cyrille.pitchen@microchip.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Russell King <linux@armlinux.org.uk>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Manikandan Muralidharan <manikandan.m@microchip.com>
References: <20260828-cpitchen-mainline_gfx2d-v8-0-378374559738@microchip.com>
 <20260828-cpitchen-mainline_gfx2d-v8-3-378374559738@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260828-cpitchen-mainline_gfx2d-v8-3-378374559738@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/28/26 18:52, Cyrille Pitchen wrote:
> Add support for the GFX2D GPU.
> 
> Reviewed-by: Manikandan Muralidharan<manikandan.m@microchip.com>
> Signed-off-by: Cyrille Pitchen<cyrille.pitchen@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
