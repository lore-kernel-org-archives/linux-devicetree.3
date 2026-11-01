Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793540977;
	b=H7Nt0ymwjvoGwiQ9Xjb+o+8m6KZXEFyQYjxPWbf7zM+VRpVN0Uo+lAASs6S6Z10kwqBO
	 GWAQhovRU675xectQDrE6mWL3Ym9+GKfbs7DxsGumwKiSqCt5eQYz3xbmN5+b2pwDU/Hi
	 iW3SQ52eqO5VQpW8/drKoPoni4SGh0oarGQ+VuwRi6UvQQlRfMXQS2zBe0TFdfZpJK1sG
	 7wtYgihTCG5BEeJulETMVeDEw4tYW3bS7gjOSIBlnY0XxXXOdjy+W/QubNIz7lw5iPp7g
	 lCF5VKeKs98dIHOAivXSwbrJ6GEbZVz5tAZrGqkcAkR795XwvzNlz5AljdqcOVJ6tRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793540977;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=1Yl2Bj4fzXzHT9LnKgjaW6d6FgbngfoajB5ZqmTaczE=;
	b=c0F+Ghc0DTGhOOOXCOXKfJQgByDgOoMAhGD7HFqtL8eg/uHxghh6peAZ+LVdBTblY1yL
	 7X3r60yzT2rlVKq0VOF68HRSYP2Zr87P1zBlnOUxRjMI8c/xRjziFWJ0gihgXr6h37knj
	 khlKulFR62BybyPpBgDTH9rB8bZpFBZM9f16uFdWIj+msaMVtS3jrJuvKFKGVvDE7kOf/
	 xnVqLPSa5+xUKMrlDDNcFQV9+gsYlxtD2eMKC5koK4aZUe/7HehDdN2qd7/cXl6DUWW0a
	 bcuFhtyYaVnkJfuKneirM3YPPe7xzCXdglTawzE9e2ThL/W0K7/qaHkB2dgQ5dwo2LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=R059v69G;
	arc=none smtp.remote-ip=95.215.58.76
Received: from mta1.migadu.com (out-76.mta1.migadu.com [95.215.58.76])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4237606A325
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 13:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4237606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=R059v69G
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=aT0RPUir1O7zBggZlLSmKiu/QpSKQ3gRUk36Oe/3+aA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793540973; v=1; x=1794145773;
 b=R059v69GYGemM2gjE8cnXn6NOTBPKIJs88WuKv9X+9HwBXqRHHrW0VvVKGm2jqTlLp4Y/RQt
 jwkgBMR2KOLqJldKnGOp/FYHhUXWG4sIFXSXIdWpf52nTOVyox9vAND29wKWyDviHuMSxGei+Aj
 1ShnltNNJ4pN3bz2wkAs+88U=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 33f00b1ebf1e8c72;
	Sun, 01 Nov 2026 13:49:33 +0000
X-Mizu-Trace-ID: 33f00b1ebf1e8c72
X-Migadu-Flow: FLOW_OUT
Message-ID: <f4a60275-1b85-4357-879b-f49794f2fdce@linux.dev>
Date: Sun, 1 Nov 2026 13:49:28 +0000
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
Subject: Re: [PATCH v4 01/14] dt-bindings: display: ti,am65x-dss: Add AM62P
 DSS
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
 <20261029-beagley-ai-display-v4-1-dc7f2b532478@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261029-beagley-ai-display-v4-1-dc7f2b532478@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Tomi,

Thanks for the patches!

On 29/10/26 10:18, Tomi Valkeinen wrote:
> TI's AM62P, J722S and AM67A SoCs contain same implementation of the
> display subsystem (DSS). There are two instances of the DSS (DSS0 and
> DSS1), each with two video ports (VP) and two video planes.
> Additionally the SoCs contain two OLDI TXes (OLDI0 and OLDI1), a MIPI
> DSI TX and a MIPI DPI output path.
> 
> DSS0 supports:
> - VP0: OLDI0 in single-link mode, or OLDI0 and OLDI1 in dual-link or
>   clone mode.
> - VP1: DPI
> 
> DSS1 supports:
> - VP0: OLDI1 in single-link mode, or DPI
> - VP1: DPI or DSI
> 
> The DSI is only connected to VP1 of DSS1, but OLDI and DPI are shared
> between the DSS instances. Thus only a single VP can output to DPI, and
> a single VP can use an OLDI block. Note that in single-link
> configuration OLDI0 can be used by DSS0, and at the same time OLDI1 can
> be used by DSS1.
> 
> The DSS IP itself is compatible with older SoCs. While we could use
> "ti,am625-dss" compatible string, we add a new one "ti,am62p-dss" to be
> on the safe side in case the driver needs to do something special for
> the dual-DSS case in the future.
> 
> Original patch by Swamil Jain <s-jain1@ti.com>
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../bindings/display/ti/ti,am65x-dss.yaml          | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

