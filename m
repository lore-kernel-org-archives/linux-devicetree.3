Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D07E2264A3;
	Mon,  6 Apr 2026 15:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775489479; cv=none; b=mtWdcPjcLIXm3/N6uppWZOoRqb3qsnDlCoXfZPr5tLXDGbNDQPjfEQfEwbm/eMIE+mvEvDjR4XW+o5PkYm01SUf5l60cuE0/QrKk/ChHtM+Uptqh9wK4yWFtfl0bG+d8qAkdi95M1xr9mZbNHGD9hm+4bYe+5swLRYPVmeeI3Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775489479; c=relaxed/simple;
	bh=iCEw2TmeljtV/dAKJVWtC+t69UJB27F42dnAvsDdQck=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qWz9OOxGUbh6ikJdbWaKaj6kGM+oHDzYGA4lFO9hqWulbeUEzRFyHOMcAKnsh0jn6ZA1vYV5aeZUPtk9Lv/wX0cQ3WsWeEfcnRmxNfOWXq9NVMeWIuV03v7CfLrhzPUZlbtroD9LjCcYa7JWMJuAASTzxMPYnOxyciVNEwJh5OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=WZXoVWB7; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="WZXoVWB7"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A07710E8FA;
	Mon,  6 Apr 2026 17:31:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775489474; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=3eX4xTWQUNx8ehAA/zPH9KQT2kpNQ6DRRx51zlCxFtE=;
	b=WZXoVWB7iUr5C8X2s+vyKlRW4lCaC7D4tqv8FyFgEsAvYKOxxMVqr11u5H6ML7paZ96/DR
	iUh4pOoZDL6d/3WL011/NtftDvUWIp4VrC8DP101V6lSGyl5jw1uxMoyO3pLjMYTX/UV7k
	bLBZaYxq69ZZuVpmTTrF5I5Ck6Qq0JCqobkDZIgXxs+4gRfadKCOLQin7lv1t9WUCjE/OP
	sbNHCUY+9lUJuPiA+U8pbx2hk8LIIDMoV7I2Gy9o5IkKN31mM/WKQ2nDS8EcFZHf9H/yxq
	pGHcxsWq3zlDOAnClr38iqPw1Ssb2B8ACs4k/FHYCLD7dvbwQqAd55f07DK8uw==
Message-ID: <4c915d11-930d-4a97-a5ee-46d72f4e8ce7@nabladev.com>
Date: Mon, 6 Apr 2026 16:49:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: imx8mn-vhip4-evalboard-v1: Correct
 interrupt flags
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Fedor Ross <fedor.ross@ifm.com>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Viorel Suman <viorel.suman@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 4/6/26 8:38 AM, Krzysztof Kozlowski wrote:
> GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
> These are simple defines so they could be used in DTS but they will not
> have the same meaning:
> 1. GPIO_ACTIVE_HIGH = 0 => IRQ_TYPE_NONE
> 2. GPIO_ACTIVE_LOW  = 1 => IRQ_TYPE_EDGE_RISING
> 
> Correct the interrupt flags, assuming the author of the code wanted the
> same logical behavior behind the name "ACTIVE_xxx", this is:
> ACTIVE_LOW  => IRQ_TYPE_LEVEL_LOW
> 
> Fixes: 5eb7405db99b ("arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1 and v2")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Marek Vasut <marex@nabladev.com>
