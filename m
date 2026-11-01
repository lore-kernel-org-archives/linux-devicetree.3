Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793542204;
	b=IbrHCht567hSPNelx5n093HC/jpXa6VNDu3vNrgG2TwGSI0bO/gpQs123nxtZCeOgsr+
	 3HcKSA5vzz20gQFotTKCFFDvg3XfDt+ODmgPMo5q+N8ZDMsf+kb+EKo44b3yzzFPf506u
	 HO5bClI58OtOxzhNMF0Ock8DSKIBY8IiO7knmzp870F+ZOBkIRdCkgqMmu/G4VM3r/BR3
	 M9lIyBw4uG6KuKZLYti6b9NX7+SZkm/u8yCxcPfD5HdM+VOV62ERoYp4C+kBsaXmMx1GJ
	 r7x0PYroj8KRkamuqRdHqq2efw4rY+3TC5IQCH9K+UYBJMvdMpCDrWlyL7TAzVTctBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793542204;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=MkwmyvkEVjRtDWYR5GqzWTgmyyizRWCCTfKNvyyK1JE=;
	b=26iJG0MTTVl5NwxovLu9djh9BFTu9XPyP50Z/Xntf2hCC1SE8u0Dy1ezRio1fEmFHDw0
	 1PcEBJyKwwmTAKEg4RWu/Qipr/Sky1oibHBUo4dmPVaDgRkZayxSFFPwsdqzE1Q4zKUsJ
	 JmY7Yb8lTxvGbVeeoJh0gzGSTuzeaJk7rLSK5drNd9CkwVopASgfCv/Zi0a2pd87OLa4j
	 OvjLmh5jQ8rlIMBfu98ymbntaLpsZgI/xw9FrlwHVMom1mwlp19BxyK511qkdtDWknlG9
	 DNG8IoTNk0Zy0OGLi8gx7jcngP1/3Z1aorvqU4YPef85sbvfTUHHaogsat3q9KTQ+rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=X1bieIVb;
	arc=none smtp.remote-ip=95.215.58.198
Received: from mta1.migadu.com (out-198.mta1.migadu.com [95.215.58.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F2C606A324
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 14:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91F2C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=X1bieIVb
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XeOvI8Uurnq6I/6gF8mpx0rDxIIEfThiP9X/LsYPomA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793542201; v=1; x=1794147001;
 b=X1bieIVbAc9PaBjqG/eLArr+StyQTvXUc5bH4R6hvTuxxwQ25+sPOgpT2Gs7wNZiy/DGnwKZ
 2Zjkaf6InGiauzZPuzugS0SCeEwXfSEEFlA9jrJmAqZhCQ/7gn9vjZnRJFCVMGlavMh6tktCy1G
 JiYg9uDQDtpjHdhg0NYgblxI=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8720dda60dada96a;
	Sun, 01 Nov 2026 14:10:01 +0000
X-Mizu-Trace-ID: 8720dda60dada96a
X-Migadu-Flow: FLOW_OUT
Message-ID: <fb667673-2ee3-4dec-ac1f-dd88c1efb760@linux.dev>
Date: Sun, 1 Nov 2026 14:09:56 +0000
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
Subject: Re: [PATCH v4 05/14] drm/tidss: Remove the unused vp_bus_type feat
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
 <20261029-beagley-ai-display-v4-5-dc7f2b532478@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261029-beagley-ai-display-v4-5-dc7f2b532478@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29/10/26 10:18, Tomi Valkeinen wrote:
> Nothing reads the 'vp_bus_type' feat any more, and can be removed.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

The 'vp_bus_type' has indeed been troublesome when I worked on tidss.
Happy to see the driver work without it now! =)

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

