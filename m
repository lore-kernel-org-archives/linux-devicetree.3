Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793542631;
	b=cu8V/TFAhU/VGwTYVTdEBDqERwmPNAi/y/NHy3tGuCYbKxVDeXb0WxtArWBTLKTqk3zB
	 VmAMG3ZfR1Ub2AJBK66HU6LOxzD2+XHjc04UuJvE3tsuqH3NecgYs7b1Ms4oOSmzlXtrn
	 czLoAnbilWA8V5f8JqY0ATrNY8vwEWYFAzJjIJJhPFm+hjlBDlBgP5a0U0cPv37EH6elN
	 3P9UlM/vtqepC2veP8n2kUjKeOCmJ6bNlDrTCBfJfyd6JIjOZ/wrdZs+zyGbhII7/YWqC
	 UjKWEKFFU3e3Ujf728skuuyoqqWBx+OQAl47ke1aVyIHXHHv1jkesLinhk9o7uduXUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793542631;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=LWXBlZLPzKnKaNGDns1PDTQof10SihzxvuMClE89woY=;
	b=Vn78rx8fIAECX5vvARaba7aZpH/bm8bn3CdBWWG/qJprlFYl9E5vAnIdyzHjkyounxCA
	 km72N/3BEufdj7CcHOs1IRwGh0DScsiWFgmx2vfEmVpy4bX2cJeYh/xoUJKNody5jTlZd
	 XuJwaxTXRhpGlvbr5oEXdor9MtXamhkd9Y7fs72XQhFA0bHzStWOLMldmdcpiV9UjbfUY
	 G2+oJ9jdoQzHL1Pda98RKB9+P1kYwjepmCJmabhhGUO/AFSbFi7HyqfvoaRvzUW/mpGGk
	 DNA/QJs2daG7u+3s1s4WiXJ8DJpuyNjHFE5nVe+wSEMLAfzaMsHxzjuJ+ueuViKiR7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BurmkMJK;
	arc=none smtp.remote-ip=95.215.58.57
Received: from mta1.migadu.com (out-57.mta1.migadu.com [95.215.58.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C781C606A325
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 14:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C781C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BurmkMJK
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Mr3FrvXdJqV++CzeIDT2YbM/X6OsDRN2jwhe5NJSwRs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793542628; v=1; x=1794147428;
 b=BurmkMJKg76iQ0+eVR9kVIv/TufYb6x1CY+Mt+sWnb271cCbyk3sT2Yld73jF/xNXTdBOJ0e
 HGKwYcGV1lKRjBaGeZ0WW3oQ7Vm+kpMYw4RSt+YYDGciCN6FG+DxozK/kTht324AhgHz/2aUw4Y
 zRUuAJ22xzGfAM7Ymtg2TLQc=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 65d1e23b5d0d19f7;
	Sun, 01 Nov 2026 14:17:08 +0000
X-Mizu-Trace-ID: 65d1e23b5d0d19f7
X-Migadu-Flow: FLOW_OUT
Message-ID: <51403482-bf37-409c-b3f4-cd957f34c1c5@linux.dev>
Date: Sun, 1 Nov 2026 14:17:03 +0000
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
Subject: Re: [PATCH v4 07/14] drm/tidss: oldi: Fix wrong return value from
 tidss_oldi_mode_valid()
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
 <20261029-beagley-ai-display-v4-7-dc7f2b532478@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261029-beagley-ai-display-v4-7-dc7f2b532478@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29/10/26 10:18, Tomi Valkeinen wrote:
> tidss_oldi_mode_valid() returns 'enum drm_mode_status', but the current
> code returns -EINVAL or 0.
> 
> Fix it to return proper enum values.
> 
> Fixes: 86db652fc22f ("drm/tidss: Move OLDI mode validation to OLDI bridge mode_valid hook")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>


-- 
Regards
Aradhya

