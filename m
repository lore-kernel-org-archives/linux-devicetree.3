Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F97D3955E7
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 18:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788978352; cv=none; b=pUb/H3qCd94UWo0ZC/MzfOYQ3Jle1BORVpLZbxnnPTSjLdeaV8eQZZTbvalQTjtZinSgDhW/TgePLHwvU6Jz9OsVjn8p5ZxxbkUsi9IW8iwxIK7BZS6Odmi7UAIXMNNKk82h2BUy51g9pG8CkwliFrsayYD/LW9BMqMlReOdwrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788978352; c=relaxed/simple;
	bh=9B74NdRyZGLMOdKSsbsOnMFuAzArabp/pXB88qC4IVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WM98kPG44KorULaO5T/txByO17D6yOu1d+nO/z9+qxE4gdq2QA3VatysBbjOcf8Hh3g1YmGfOq0CDrbb4yz7VuVHMQ66okKzoe9GG3Jm9s6E/DXjXrL39tasA2A5FVlGHtz+WkOtJ9SrUh0uPPvbr/Uh8XL/eEz9x4eAO6LUR30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=cZf9dgO1; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="cZf9dgO1"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6B57101EDF;
	Wed, 09 Sep 2026 20:25:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788978344;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=TnftztqlqToNinxy/Mu3f6KEvFaK0MjBO95XuXaBaT8=;
	b=cZf9dgO14Y9lijIc/oRqi2o+8afIk5zO+iH1NS+DI87OG1olgsvw4jriNr5WuiQhQme1CJ
	p56+46kb946jZ1UJmKv3ESKkb4xtlcxUhFoX5mGZ6Dd/pYyx9CB38/7JQ0TSwVgjeEur8e
	NhUlGo+EpiurUyZ6nUNI+p575AWY3y5DrnVJha6oSoSmRfLGoqZ7hMJzhW9/4KVn93HQnT
	Xle47b7DJg7m0AyBSNqx3eep0xrGT5pZzslXXaXQObdh4T4T6zRGWmmX/v1FjmpAcYfv4w
	xvTUWkoC7gOOr54DlnGV5JsIHY5pFBbKjowUU2PqWeYpHdBDExs4l4s6hG0dOQ==
Message-ID: <432b974c-f436-49f7-bb3a-90e1fb86f29a@nabladev.com>
Date: Wed, 9 Sep 2026 20:25:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
To: Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 Michal Simek <michal.simek@amd.com>
References: <20260909164423.97288-1-marex@nabladev.com>
 <20260909164423.97288-2-marex@nabladev.com>
 <20260909165525.22F151F000FF@smtp.kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260909165525.22F151F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/9/26 6:55 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:

I really do not understand why the bot drops linux-arm-kernel@ and the 
maintainer from CC, grumb.

> - [High] The TI DP83822I PHY is incorrectly declared as a Clause 45 PHY

Datasheet says C45.

> - [Medium] Contradictory RGMII internal delay configuration on gem1 forces TX delay on a mode that explicitly requests it disabled.

Delay is needed.

> - [Medium] USB0 interface is not enabled despite commit message claiming 'USB host interfaces' (plural).

Yes, "UART and USB" are interfaces, plural.

> - [Low] Magic number '1' used instead of the standard 'GPIO_ACTIVE_LOW' macro.
> - [Low] Non-generic node name for LM75 temperature sensor.
These two are addressed in V2.
