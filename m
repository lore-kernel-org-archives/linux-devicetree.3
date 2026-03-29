Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E29B24169D;
	Sun, 29 Mar 2026 18:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774809011; cv=none; b=o6Q8MaiQ9D2NqymuWz80BM2fS/9kBp712L083nk2lvndf6b+PW5I9VdyyUN6XMcRDNFVX9lOMPk0XGIdIwidbxTmHhzCXqc3gXFUFoijLOyJzinsLwAl2iz1BN+qNGUp/CybQCFOsNaa4YwBm7k6cNfH5NTBqNjaCyR4sCpDGhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774809011; c=relaxed/simple;
	bh=Gk7zrNuZ0DJfwAuqry7KACCKkwP+/cwJ+k+VxQ2YLME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t4JqrrzXdpGJ071ExEQmR8/bYP6/AHAjEiOQaijrd6rtD3K7i+n3BtGAa/F7q+uGpw9443HjGD6igIBQYs1mO6q36MzK5rpI50ogXBECJ3ZuwOaEonMOzIVZXCCh1kwJRf0oA69/loYY7/fVCIwX86HJ3A5+GGghZZFQGOAFGac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Hn4DuNEE; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Hn4DuNEE"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6DB00111DEF;
	Sun, 29 Mar 2026 20:29:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1774809000;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=OKLfPcrbiTzD/KA37po52kxMaLg/n3Rjd1MI3Z8MQH8=;
	b=Hn4DuNEE5QITrI1FkuQkivurMWTftugoayrXrgCCf1NMegARtQYHRjGDWnur04fo7hwZhZ
	bm1saP0oXCY4rKPfbhYNCx3Bi0daXYg4fWFjwpBJw4F5w29h5C/JYVu1zpxf6YucvyLzjE
	DwDI65ojZdpVU1elWnFzDTy26OMsWguV5uMO5HTYjaz7XvO7FdJ9ZeIEcd9yBdjFnLoWtA
	xI9qcE5RxwJwDbxpP1raTXg/kKjg+PUrX0cBiqoJDFK1y7Y7d6FtnIz8CEtYpVXxWOPSxX
	BhRcZ8QcTU7NWUsrtSUdDjwUg108xeC5B9uds9mJVQ4WE5BOS1lyTDMpXR9pWg==
Message-ID: <0d7c7403-4b77-42f3-82d6-eaf2be8e5b1e@nabladev.com>
Date: Sun, 29 Mar 2026 20:29:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display: bridge: ldb: Require reg property
 only for i.MX6SX/8MP LDBs
To: Marco Felsch <m.felsch@pengutronix.de>, Liu Ying <victor.liu@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260329-fsl_ldb_schema_fix-v1-1-351372754bc0@nxp.com>
 <crqzju5cqhvmy5msxvuquydmnpb2ft2t3gsyr6qsre6ccqjvzz@46gfcrelczsr>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <crqzju5cqhvmy5msxvuquydmnpb2ft2t3gsyr6qsre6ccqjvzz@46gfcrelczsr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 3/29/26 7:42 PM, Marco Felsch wrote:

Hello Marco,

> sorry for not writting back earlier, the last weeks were quite busy.

Tell me about it ...

> On 26-03-29, Liu Ying wrote:
>> LDB's parent device could be a syscon which doesn't allow a reg property
>> to be present in it's child devices, e.g., NXP i.MX93 Media blk-ctrl
>> has a child device NXP i.MX93 Parallel Display Format Configuration(PDFC)
>> without a reg property(LDB is also a child device of the Media blk-ctrl).
>> To make the LDB schema be able to describe LDBs without the reg property
>> like i.MX93 LDB, require the reg property only for i.MX6SX/8MP LDBs.
> 
> NACK, we want to describe the HW and from HW PoV the LDB is and was
> always part of a syscon. This is the case for all SoCs i.MX6SX/8MP/93.
> 
>> Fixes: 8aa2f0ac08d3 ("dt-bindings: display: bridge: ldb: Add check for reg and reg-names")
> 
> Therefore I would just revert this patch completely.
Last time, I pointed out the hardware is part of syscon, but as a 
subnode and therefore with reg properties. What is the problem there ?
