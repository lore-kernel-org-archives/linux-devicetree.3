Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A220317BCA
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 15:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776613563; cv=none; b=S68DZfqeHd8Q4uvPhVdMJeJ7q8eVWVea61QAPqlUgR1mCX3K+lr7jTwPm64mQzlVa3NmhWesN5d65mFX6hZEBFRRwmjTlVmUO3WhwAk2oPlTayLycnsTqqYpMe1WZbnrYF1VJFT9rvaDW7fZIVo/u7xf8SXoHXYcXmEnQN4rSzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776613563; c=relaxed/simple;
	bh=Z7GdZ4hyN/F84dEJHs93NcKgZfzSyxC23VhMgNYBFAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=SWHiAozbfQk2ERv8U3KDAWAgqD1wEIChZdVKT3fkf1LVk4xa/RIlERo3VKBR0IhK9lFeSZwNDtawAOpDTuDLh2NC1T+JzK6IrJ+j6eCYkpGZlfSAQwgVP1Gjzwr6aNaBOC3KUCc5zZvEwr45TlQSnM/0Twc41Z82f/Yf4dpME94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=j2Zw050W; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="j2Zw050W"
Date: Sun, 19 Apr 2026 15:42:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1776613559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cLT2eB/INmsUfan5ZJAA2c3NcOmLZcowwg74jDCzZuo=;
	b=j2Zw050Wogbc2NCupEep4CzUQsU7sA3tgzIJaluoWghjIvUaL0f7VP2OZgBqANVGKwEX+W
	G/Azd3ri6eq84cN/+3ERkL3ueNR5HbXYh4JG3LZCWrtSV2HI+suUWTassAM20Psu757NTv
	IzHmQCw1pzmfmWBameM/c69i4bkt5/NJq0QN0D4Lp/A4yE6/KkOEfxWtLtbUjg3XHvhH/c
	iHIsiKEIjwRjVWHIk8xO3VtPfOqFXH16NqXuSDJ5BIzdr3cLEFVxyxpArtbrwM+HLQaEIC
	mGNo/PUbm0Ztu2c4uF24lNy4HHVlAr6afGwLLP/OMNop4LnSkkoG34OX4daGWQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, christian.koever-draxl@student.uibk.ac.at, neil.armstrong@linaro.org, khilman@baylibre.com
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Christian Stefan K=?UTF-8?B?w7Y=?=v=?UTF-8?B?w6k=?=r-Draxl <christian.koever-draxl@student.uibk.ac.at>
Subject: Re: [PATCH] arm64: dts: amlogic: add support for Amedia X98Q
References: <20260419150855.121136-1-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20260419150855.121136-1-christian.koever-draxl@student.uibk.ac.at>
Message-ID: <tdqzsc.3ut55yjhut283@postmarketos.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Migadu-Flow: FLOW_OUT

On Sun, 19 Apr 2026 15:08, christian.koever-draxl@student.uibk.ac.at wrote:
>From: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>
>
>The X98Q is a TV box based on the Amlogic S4 (S905W2) SoC.
>Add the device tree for this board and document the compatible string.
>
>Supported features:
>- 1GB/2GB RAM (via U-Boot memory fixup)
>- 10/100 Ethernet (Internal PHY)
>- eMMC and SD card storage
>- PWM-based CPU voltage regulation
>- UART (Serial console)
>
>Signed-off-by: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>
>---
>- The Wi-Fi chip on this board is Amlogic W150S1. I have left the SDIO node enabled
>  but omitted the specific chip sub-node due to lack of mainline drivers (yet).
>- The console uses uart_b at 921600 baud.
>- Verified memory via /proc/device-tree; U-Boot patches the node to around 2GB if board supports more than 1GB.
>- Tested on the 2GB RAM plus 16GB EMMC variant.
>

Also, I just noticed now, but you seem to be missing a lot of people in
your To/Cc. You should use get_maintainer.pl to get the list of
the people you should send your patch to.

(you can also use b4 (v0.14 is what I use) to make sending patches
properly much easier)

--
Best regards,
Ferass
