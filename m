Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E7D47A0BA;
	Wed, 15 Jul 2026 13:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121779; cv=none; b=KPiwhmuZ6Wt2mcspCvbkayeYyZD/mbPNmfRvIzAqPYnElzBH10CkYBqoTUAqXJxCVyNnUPP9/M1153kRM1L8IHQeh0338Ut4Bl1pdOT2mGy8UEe3pLq/Fn3D6vdjck2xP+BpQDDySEFE5s2Xd/AS4P/BFpDLxd/aRkO4eqX8/Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121779; c=relaxed/simple;
	bh=QGeId7QbdbyNXJlEshfDBfuKlWj13X9gty+DTIBYyvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lGmPyT7wctc+PqrvVVBARJUovKOzZYRPhl0t0TWiJlk2GamIf8trgU8nC+1iAF4X+A1xPNMfGXELJ7ma6TEbsGhh2eyXs8AHKRqtDylOYQ8+dKSqD+5530mb5MC7AJcNBHaD8PfPbQkqtigt4m1mFJRVjaZQsNjfpWY+GonY53g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=H6sfsOHe; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="H6sfsOHe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784121775;
	bh=QGeId7QbdbyNXJlEshfDBfuKlWj13X9gty+DTIBYyvg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H6sfsOHecJOH1qsCOye4YBEyzTcwh0L+dnI/SsZoHhKtYrJcrTJvMVy1ET70Y/DWP
	 qlAt9R+2VVZIvw4YHYNiiqENRoWbE84Xi8lcEhXkGbnbU6vQX2kUIo/e2CraO6A1B3
	 EBsB8y9oz5w7ARv1K5el3B3bzW9OZb5SBxduzX+5lRwOviqW79hwkODFDMxocj9Pdq
	 hz88MH+4wr838XBLGZIf79xADM0ifFRYjNrI3mL7uj/in9eLtd7Po8fcpSOGoR0gSN
	 SgNxlqFBOG/h1nU9PeH5AFSKDfgeKW+jCNzHHJbemHYXv6glJHFkod+YPR4PnWZGdW
	 LMUEEOh9m681A==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 854B717E07AA;
	Wed, 15 Jul 2026 15:22:55 +0200 (CEST)
Message-ID: <27cdcc55-b9b1-49ad-82f3-25e38e3e0e50@collabora.com>
Date: Wed, 15 Jul 2026 15:22:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] soc: mediatek: pwrap: add mt6572 support
To: rva333@protonmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260715-6572-pwrap-v2-0-bea1d801c81b@protonmail.com>
 <20260715-6572-pwrap-v2-3-bea1d801c81b@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260715-6572-pwrap-v2-3-bea1d801c81b@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/15/26 14:26, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add mt6572 registers and platform data for the pmic wrapper.
> 
> While vendor kernel source code suggests that mt6572 can be paired with
> the mt6320 PMIC, no such devices have been found yet. Hence, registers
> that not included in the mt2701 array are omitted.
> 
> The mt2701 SoC-specific initialization function is used because they
> share the same GPS_INTF settings.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

