Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2DB3E168A;
	Sat, 16 May 2026 16:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778948787; cv=none; b=Hk5PIABIHiuJxnVAv9wNcL2hS/jgxK1xStSjWKmWwBS5ljljxWH3y0tOzsl/MYfRhBzKlJ/VYEG6yv4DLYI4m4jj4SePb62ySG491ywt5E/Y78VpOS5tX3KPPRD50AFPa/Tn/HS3bJee4pfEjSRNP34q1msO6bhPwOiC8pibrDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778948787; c=relaxed/simple;
	bh=J7POitof6WQQAX05ulemi1TQv+/tiHhtz1oTAYYD7PI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aTo1bmn800VcQmqaY+8ATbY8MmdfO5Uzf5NEUa0qrd3lDThfjVixqxapyyDVAV/yW43mQQ4sTfG6KMX/hOmK7aEfmR0LVhzWqiT9OUeUaznNXmzAa/B1z0F1b9GIH5uemOTRnb12AADKwhmQNCOF1wUNYAg4h8LwrL7uzRyXins=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93296C19425;
	Sat, 16 May 2026 16:26:23 +0000 (UTC)
Message-ID: <1fb4a8e8-62bc-447d-8f25-84a3a6890ab0@tuxon.dev>
Date: Sat, 16 May 2026 19:26:21 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: microchip: lan969x: add OTP node
To: Robert Marko <robert.marko@sartura.hr>, srini@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, horatiu.vultur@microchip.com,
 daniel.machon@microchip.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr
References: <20260515115954.701155-1-robimarko@gmail.com>
 <20260515115954.701155-3-robimarko@gmail.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260515115954.701155-3-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/15/26 14:59, Robert Marko wrote:
> From: Robert Marko<robert.marko@sartura.hr>
> 
> Add the required OTP on LAN969x.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
