Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BF63E7152;
	Sat, 16 May 2026 16:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778948841; cv=none; b=XcYsRTDJP02z+LPOSWvmc22b8s/BxeTNcUXmISxs3ZMivSeKkzjq3ORA4LO943zieCysX5TkzhBZRa4TDdAhlMYq4OSSjLTGHbpFHtkrbNFgdtKFWy9a49u1zwSj9s2qjL/Fz9Gho8+JLMBJiuws6U3NJ7xbX2x/OVO4Wmvu4Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778948841; c=relaxed/simple;
	bh=aYMwJ1pLT0cd1guHKQQhAJ1kSwikYrQOC5M/lmNzJik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NRT6LKhEo3/jVLC1woBSht+MddpGCuI1oNjmvppOI1zJSU0kv4ZLFDX0IaBFdbhtHt7OrjxUwjJI29LjYyues6fUXb0Id94tyvy9/MD0s32JD38NWxDnqAb+oxpoUyTxVwP5fu2Ni9hWTNPjaPWDT6wd03JjMmsx1wAbAQbU7xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E02C2BCB8;
	Sat, 16 May 2026 16:27:17 +0000 (UTC)
Message-ID: <9291ac3b-0494-4bcb-b7b0-457a4ec86e30@tuxon.dev>
Date: Sat, 16 May 2026 19:27:16 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: nvmem: lan9662-otpc: Add LAN969x
 series
To: Robert Marko <robert.marko@sartura.hr>, srini@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, horatiu.vultur@microchip.com,
 daniel.machon@microchip.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr, Conor Dooley <conor.dooley@microchip.com>
References: <20260515115954.701155-1-robimarko@gmail.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260515115954.701155-1-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/15/26 14:59, Robert Marko wrote:
> From: Robert Marko <robert.marko@sartura.hr>
> 
> Unlike LAN966x series which has 8K of OTP space, LAN969x series has 16K of
> OTP space, so document the compatible.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
