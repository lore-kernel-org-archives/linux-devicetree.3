Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804616;
	b=2xNvJ5p7xZm4b5I5Q0PY18SPo/cB36PcgQPJbZoBpSnk1JoCAmmVzImjQvbTOQqrXvLG
	 ncRIa7pdA3Fw1RQe+MFYgAz1MZOjd2PepCfGxU0+jBcYDo8QNrLX5UXnGyYeBRxx+oMBb
	 7oUBDqL5FqfoeIV2NXtCWLVljrXj59j8kOQSD/qyOPSec0sf4Ag7cAvS17dw1X/Q+wU/y
	 WGh3AnScpl9IPHyuEHEb5yOho/ax/VPX21Up5OAiAfhSOeSpAH3KsOoT+/7hcPV92LC06
	 4akGBBun5OhsG8K1GiQouPNG9GccRiHvS065R5ege6HFr+YfFfx7qs/fWSbGRxnA71Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804616;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=G8NnEquHh6JPrt5WKM/35q0o6NTyLXSxP+cYgYnFdys=;
	b=kTNUpiX7mGMlTjyZNdo3OWbbOJTJN1x8BdXmwb+z1BjOwoj2Oi9WFjwpMnShM/B2tn47
	 8FvDC7wvKC8AhR2ZXor3EKEdrrkcmk/ygwHsdGWnXNFbnNTLZ90HYbBPWxNthcdE/lrs5
	 lq+loYf2dxe6qulWgAUzWDS8Hbs8bLL96UuPqai7cWh1UWm/liPq6JvGpu29I0vRXKdgj
	 12cLR+Wrc97pIb8HE19rdtIpGp5iW5wz47MqDGoPI3wsl4PGeYX2DCmDQEI/Ama/HZtgh
	 9Zf7Nxklw1ygm1gaVx98JJBQta6RvvRZIMbDDz1fTzJGdTYRcT/btePjHoV9Bcr9d5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=b43+c8Cg;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3C7606A32C;
	Fri, 27 Nov 2026 18:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B3C7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=b43+c8Cg
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5EAC1575;
	Fri, 27 Nov 2026 10:36:52 -0800 (PST)
Received: from [10.33.50.35] (e142021.arm.com [10.33.50.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6D623F86C;
	Fri, 27 Nov 2026 10:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795804615; bh=6ifu5kHm5pa1d98fpL6HG21zQD2uf+dZa/ElH6oL+Po=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b43+c8Cg4WzasHC2UHK7/jdi18rQBwVZBc/LIiJEKn5ZFBSfL2YVSHmum9dYopHpX
	 8OWP0Rbke/ucNh6SaIdyrIob3sYstfEZM9D3p0mCkQ6rySMpwS42Nm/47wYzESNUpd
	 ZwDmP+375fMIpueHrm7xRx9WdUlVnu4x5+fy59Hs=
Message-ID: <5cde8317-61c0-4405-915f-44fcc3c54389@arm.com>
Date: Fri, 27 Nov 2026 18:36:49 +0000
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
Subject: Re: [PATCH v6 5/5] arm64: dts: allwinner: add Radxa Cubie A7A board
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>,
 Pablo Mazzini <pmazzini@gmail.com>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 Cristian Filipescu <filipescu.cristian@gmail.com>,
 Norman Herms <dockseed@proton.me>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-5@gmail.com>
 <1jik1ild9n.fsf@starbuckisacylon.baylibre.com>
 <4c9ea902-24fd-4065-82b7-41d6df43b082@arm.com>
 <20261127-a733-dt-v6-04-reply@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261127-a733-dt-v6-04-reply@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Enzo,

thanks for taking care and making the changes!

On 11/27/26 19:07, Enzo Adriano wrote:
>> Ah, indeed, good catch.
> 
> Thanks. v7 uses <&reg_bldo1> for vcc-pk-supply, with a note in the
> patch.

Yes, thanks.

> On a different point: shall v7 rename osc32k-clk to clock-osc32k, as on
> the A7S and A7Z? The schema still accepts the old name (deprecated), and
> CHECK_DTBS is clean.

Yes, it would be great if you could change that, too.

> Also, is no-1-8-v on &mmc0 fine with you? It ties to Jernej's question
> on 2/5 [1] and your reply [2].

With no vqmmc, and vmmc pointing to a 3.3V regulator, I think it doesn't 
matter, no one would negotiate 1.8V anyway. And we didn't use that 
property before. I am not even sure it is correct for the A733, since 
the host controller DOES support 1.8V, it's just not "wired up" yet.
So unless someone screams, please leave it out (and feel free to do the 
same on the A7S). Eventually we will need to drop that property anyway.

Cheers,
Andre

> 
> [1] https://lore.kernel.org/r/p3YaXlLJTguQBGnWyMpb1w@gmail.com
> [2]
> https://lore.kernel.org/r/9ab5f851-1b56-49ed-bfdd-46abdbdda1c0@arm.com
> 
> Enzo

