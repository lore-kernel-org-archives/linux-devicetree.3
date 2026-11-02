Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626287;
	b=WmVqdq3FrM9gYPGBnivofV0MvykP9VHPQw3aDKKSQiDesrFj8gbj854oO4rFr2OhUAFM
	 MlxwJIwh9v6tY4dkllIpNqcGBAofhGJDXjQ4Wy6oVZQ5xFYvmNiVKAPH6vqOO1+kgWS9u
	 wQLQmD/Icj6mS36Bweoyzk1HhpAjX91xUh07hd8fcfjvfEvk0q4ZX+sxVuaiJxRaXX8TY
	 ABY3nD+70pVc4O+ewyZMpxu42UVy6RVv15J92NpKe/9BYVnJY2UvaSo4KABd7VP8OBQ/E
	 zkciiAPYgFfYJxPFI6ttucv2f/YEJ7I8EXkemAgnF4wtOYvjG0SSjAxjc92vRn36bIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626287;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=WWMGndPAPi/9UPLdPzs/eClP3b+MIDrQWGzMEfhXf+0=;
	b=pJb/07/5Pe3OgSFOcCE3kRMUoMqTDVffVW6VLeqB/VlJVLhnCvO4/O1/d6qydG98tKMb
	 jj/RlvgWBWskViSUQi4bX2XDI0sRhm6C9JGbSD/smE3qdOedEqdRuzmRFTOx1U6vH8Xm/
	 HA1I9StlZb09Ad76rB8ycYUkssRDWDc191kNnc0XS7t+BXCnQ5uZBhVP/M6qiwq7nGR/s
	 5T5UDB2SPuuaZVseXKnhXrKmHAXE+x4lhD68GJNGWgOp1ZAVrtoiyERdzErcbcq3spR09
	 jU2StoSkzYW5FRsFHPZ/k51dQl/2A9B8QlYhNqmbh4zD9JtSlSKocj6brT/Ss6yC8xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fWfUia+b;
	arc=none smtp.remote-ip=91.218.175.56
Received: from mta0.migadu.com (out-56.mta0.migadu.com [91.218.175.56])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0F1606A329
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A0F1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fWfUia+b
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tyuUU3tex6yGuGsqkMIA7zBej2IJkvxByg23hzKT+6k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793626284; v=1; x=1794231084;
 b=fWfUia+bn78oXS6xaZceLZFGdj2BUs/KRC9uhgCV4jRuhku0GRK9Djp5dGvPEC4qK8aCbsTI
 L/YK+zh4u6+MJwvDK4WvN2vvMtRPGgPJKjdEkCNZhSKI/lWMPX6xe4zS8TW7HzgURgEmJZsFtXg
 h/mouv1NXRAM8A4QRgHhMVjo=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cfaa51096a2fcffc;
	Mon, 02 Nov 2026 13:31:24 +0000
X-Mizu-Trace-ID: cfaa51096a2fcffc
X-Migadu-Flow: FLOW_OUT
Message-ID: <b88e357a-819e-4f82-a6ea-00dab9b7f232@linux.dev>
Date: Mon, 2 Nov 2026 13:31:23 +0000
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
Subject: Re: [PATCH v4 10/14] drm/tidss: oldi: Move the setup of one OLDI TX
 to its own function
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
 <20261029-beagley-ai-display-v4-10-dc7f2b532478@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261029-beagley-ai-display-v4-10-dc7f2b532478@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29/10/26 10:18, Tomi Valkeinen wrote:
> tidss_oldi_init() sets up each OLDI TX inside its loop over the OLDI TX
> nodes, which is not a few lines of code and indents quite deeply. Clean
> up the code by separating the setup of a single OLDI TX into its own
> function.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

