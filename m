Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793542443;
	b=t5zIGpHE+KcCdTiQpSiwnBj9ZYpOrBf3km9NVjV3RB51qqzGrOhTXSqIMSef51fEV/mG
	 gmYA8moaTSJa+1suWHIOR5XJb6f/XqkeTx7c5CYDdalinfd+qpzI+SRuRk1GWgRGN0h5J
	 uLR9wA2x5ZrsDnrrIwXnNFhgbqxJ6dnqde++YS6H2wp90R0EtILhQ7pvsVJG+qXqIY0tj
	 /MBvWqLf7lwYagxL1tmz4ZRcp4mgvt355JJoevAuC3RyHciV3xvUTwMf3ffGVvETV31SP
	 N/JvS8hilY0TDUdCcmcfRdQP0I+aGnTFHNBxZKO9c6K23WMEc8ZNAYahTX47sEldOlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793542443;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=908fhrM1HlZfTYgmWBBmx3EXBJTSRYE/1Nc7g2kDk98=;
	b=1zYpNp+AU9bqy7hAT5oFVASAcuUhJ0w1xVdbP6QLp3hzjXuRMUTIdzW0VmAr2XLelCxt
	 JfGMvGgx61ScsTeqO7Zfhvd4Kz+Wq+jLFNZqVEGaaHP8bX5b3WCy71/MQgCEmBk8QBYYr
	 ORpn/RewQbANqNRkA4Gsl+hDKgIQQV1PUjdMCAPeXaFce7lSPcUSGD21WA+9Q8ri6SlqR
	 vAZ15aPuwcS6xNcRezXKPyt41vHN1UcqUHwQNYVWqW1vqvafKOXFiaAQeTX2vmxYGgkth
	 Qssp+B7aTdaF6Iz+sG4pSxe6h2ZrcRpftu0zIAN2TuNSw4i+i42xEXmW+2C2TdPyDoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SOBq+xfr;
	arc=none smtp.remote-ip=91.218.175.175
Received: from mta0.migadu.com (out-175.mta0.migadu.com [91.218.175.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5FA606A325
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 14:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE5FA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SOBq+xfr
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cYMHJdYJyH2hnxqe0M9Ky2nfXrZcnOvPqcgoIDJjcvI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793542441; v=1; x=1794147241;
 b=SOBq+xfraJJp8nTTBpTv50QeDYHVixvYawFSkryoSeO9lxAoWZZsWP45cXImuCjYTZSCDQE4
 FoqyVqo2Y0Q7Oa3xEfp7ix9qetMW+9Og3dDrTLCbZpjUwVenP+Zo1pwm4zK0p7z3u6ut/85Pf0x
 0S/bBBs7WuU/RI9kY8PMan0A=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a05e464f0524c77c;
	Sun, 01 Nov 2026 14:14:00 +0000
X-Mizu-Trace-ID: a05e464f0524c77c
X-Migadu-Flow: FLOW_OUT
Message-ID: <c12f6a9f-983d-4704-a90b-3453ce984a2c@linux.dev>
Date: Sun, 1 Nov 2026 14:14:00 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/14] drm/tidss: oldi: Fix cleanup on a failed init
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
 <20261029-beagley-ai-display-v4-9-dc7f2b532478@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261029-beagley-ai-display-v4-9-dc7f2b532478@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Tomi,

On 29/10/26 10:18, Tomi Valkeinen wrote:
> tidss_oldi_init() registers a bridge for each OLDI TX in turn. If a later
> OLDI TX fails, the bridges registered for the earlier ones are not
> removed.
> 
> Fix this by calling tidss_oldi_deinit() in the error path.
> 
> Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/tidss/tidss_oldi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
> index 506507e83112..7344d86e1f13 100644
> --- a/drivers/gpu/drm/tidss/tidss_oldi.c
> +++ b/drivers/gpu/drm/tidss/tidss_oldi.c
> @@ -638,5 +638,6 @@ int tidss_oldi_init(struct tidss_device *tidss)
>  err_put_node:
>  	of_node_put(child);
>  	of_node_put(oldi_parent);
> +	tidss_oldi_deinit(tidss);
>  	return ret;
>  }
> 

Since tidss_probe() (in tidss_drv.c) calls tidss_oldi_init(), it also
calls tidss_oldi_deinit() in its error exit path.

I think this patch is not required.
-- 
Regards
Aradhya

