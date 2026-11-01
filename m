Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793541034;
	b=CTbYb3GLzOPjPlebwO4ACLfdL4vhgBpXgUTDDEwKo24v5vOUZjSjfvVSUq25C8z0cHcx
	 5xfWdgc/NpNGJyk/kPyXKDMPXHh/lVUenpDspgBE/KHoEUUvCx6suSB/QNXWbSvrnmUXv
	 y1HNfzT5dp3oZCIR6xOiy4nIkulY25anFm76ovURJU2Pv3lG4tlvvs6D8zrN8Zlmizojv
	 rMthaK8ndyPXht33/9M7rAIa4wEfJzwqxfkdugpPnSjr7c7uYJg2yfmbZNKe2HtiW6afd
	 czzyP+F+Y/VGAK9fnO43crHc3L+BthY/PlIo4Ol0UImLSjN+teiKHr0YCdERQQMUtcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793541034;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=XSCBRN33qQsy8Auxjft+8kvMXuANLfWvZcIctPrMpas=;
	b=0h9ZV76cLuEdLRAq75RvuEa1/t2Lq9xD+axYBPuvqofbCBqI/H7hsYJI0XQBEA6OmrWG
	 Eq8ZLuENfgXjda00kR6qQGc9L5Tc9/o/0Zj/5u9qKrTv6QGkyXYCnzVnkP5h0YsxCxcGR
	 loj61x9cOloZjheLZiJAfOgjpp/2VILaQySABiSnpKOZYlnljV8oICfL4TaNRj92hOE4k
	 MnboVPF3ClJZX84Xg8ry7ig3k4t7YdoTuxlV8vxtn1wQveqZdAqlIi6Yd83d/qgtbdeqn
	 T9dvSVGpgVX88HowjDvGBBPavL8wO8CmDB7lVLIJO83luPnPri/qkfNYUnns6sgJIgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="Pc24P/jl";
	arc=none smtp.remote-ip=95.215.58.89
Received: from mta1.migadu.com (out-89.mta1.migadu.com [95.215.58.89])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B85606A325
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 13:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24B85606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Pc24P/jl
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=H/s3VKQo6Z5fR1WbNIhwJli7PgqADZcHiVAAOisPb3A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793541031; v=1; x=1794145831;
 b=Pc24P/jl4DNHuiBNxex6uzO6LR6dk7swpKTlTQ3YsA1IbGEC4hOBltfiDabywVGsnrpyDocA
 DGTrj7snn/tGnKkZeZ3im9eGAXntES97lgg5isCMnFpLhzEhIB5zA6jVkDJ+p0Kwqj0HJLh87Po
 ja6Ok4NL3eaTaU/pDRl/KVNw=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 99df9d40205e812e;
	Sun, 01 Nov 2026 13:50:17 +0000
X-Mizu-Trace-ID: 99df9d40205e812e
X-Migadu-Flow: FLOW_OUT
Message-ID: <bec5d30e-4d65-49ce-8445-7f417d1a5060@linux.dev>
Date: Sun, 1 Nov 2026 13:50:11 +0000
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
Subject: Re: [PATCH v4 02/14] drm/tidss: Add helper to identify the AM65x OLDI
 video port
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
 <20261029-beagley-ai-display-v4-2-dc7f2b532478@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261029-beagley-ai-display-v4-2-dc7f2b532478@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29/10/26 10:18, Tomi Valkeinen wrote:
> On AM65x the OLDI TX is modeled as a part of the DSS, not as a separate
> bridge as the newer SoCs do, and is fed by the first video port. To
> handle the AM65x OLDI, we check for it in multiple places using the
> feat's vp_bus_type.
> 
> However, vp_bus_type is problematic concept and should be removed, so
> this commit adds a helper function to check for the AM65x OLDI by
> looking at the DSS subrevision and videoport number.
> 
> No functional change.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

