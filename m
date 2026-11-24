Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531368;
	b=ykvSKr2MPcLbGpifLXVIC8xzfGK5Pus/SOfwg0F4YYH7/yqvbj7dyjePonRzuYKRrZjg
	 gE88XbEth4O82+07AiKCXj/nGx/q0zHp4JuA3KpLRacuk6ak0yV7M7QyyqUV/mst3SsO0
	 4OIj/4Aq4TpOhYhuRYoTE+Wx8UzPMoYAbCQRqWkDUGJNhHKGaoZ9/0FVndVyTH5MroDvL
	 HfjEphBvtUsVGA7EyQbB6zC91bfd+YypRJW3ZFHzID7fiB+7nqfnb95YVKy5PhvDq/VsY
	 HJYnkZjH5jCTGdQkU1r7hwKGeFrWDmJ9Jgsn3sPFAHStAFRKH9zKhrajGuuty6hqZuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531368;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=whpdiooOdtf0fQpB9RYBhngBI1Ig6SjjoowNuFUHFpk=;
	b=nU7fNx0ipYPPYjH9iKwrPkQCRg0bHaWTiibfkryAJE/VaV4QGCsCagQW2wth440WLG/y
	 hnunGbtYeqK/QFZIvBHaNX2PE7+KN4zHfpfylNYx82phh3F51jIY60D93O5Tbka4u3T54
	 VP1CAosZ2u9u3xoGbmxnAH3aEKjVbSHYKJjsbMeUJkWIWc0oYfmAfDrp8JsyNv/tLP1np
	 tsyhe/iiOdjjfJ11l7rKIKaEmTfy87a53Di7mTJJnqYzUnZ4nMtltGhUVFXXyKHG2Vntc
	 odgbjVwl9hxBxfWI16d12oTT738GM8MnbklVJ8Ac3iNiuyUoosBaNM4ZBv5lJh4IM5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UDdLoFoN;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C40606A327;
	Tue, 24 Nov 2026 14:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4C40606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UDdLoFoN
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB703339;
	Tue, 24 Nov 2026 06:42:43 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B19953F86C;
	Tue, 24 Nov 2026 06:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795531366; bh=HSwH1G2ztI4XVuIpxGm5jCaIGdOBrcPPn6I/LiR0ErE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UDdLoFoNOCRh4wx8Dt+N0YAX48rS5yofCSHP4YgowGgAqupRoB1XUFyiOgWSAXjsv
	 R9Ll5zo15TJAAAsFh8bp2IPsU6g5wRm60IFIFHPh/w9efiojqahBFW30REqhMEKzVw
	 xry7Tl9F7uRVevJe2tDZJ9cBuK4Joj+DAPL5HUjM=
Message-ID: <ebf2d6db-8260-4ac3-8316-ae9a0e5ee1b7@arm.com>
Date: Tue, 24 Nov 2026 15:42:42 +0100
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
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>,
 Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com>
 <428efa99fdd0182e8bc9a2ed88b78d2cbd36fa45.1795034153.git.enzo.adriano.code@gmail.com>
 <20261122004008.0ee8e16d@ryzen.lan> <20261121-a733-dt-v4-1-reply@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261121-a733-dt-v4-1-reply@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/23/26 18:42, Enzo Adriano wrote:
>> Can you please add the A7A and name as well? I will send the .dts
>> patch shortly, but having the name ready would reduce the churn and
>> avoid conflicts.
> 
> I added "radxa,cubie-a7a", "allwinner,sun60i-a733". Both strings

Many thanks! I just see that I messed up my sentence above, as I wanted 
to have the Cubie A7Z added as well, to reduce the churn and stupid 
conflicts between series.
If you respin, can you please add this one as well?

> are in Radxa's Linux 5.15 Cubie A7A board DTS.

Please note that copying from a BSP is typically not a good idea (though 
fine in this case). The devicetree as (somewhat) published by Allwinner 
is quite non-standard, to put it nicely. There are large conceptual 
differences even, so it's not just about naming or such. You can use 
their DT to figure out how peripherals are connected, or to learn about 
some IP in general, but it's not a good template to copy from for 
mainlining.
I would always look at other DTs in the mainline repo for reference.

> Please let me know if
> your DTS uses a different compatible.

Why would it do this? It's the very same SoC ;-)
But yes, "radxa,cubie-a7a", "allwinner,sun60i-a733" is the right string 
list. And just replace a7a with a7z for the other board, if you add this.

Thanks,
Andre.

P.S. I would like to post my A7A DT patch, with the hope that you could 
include that in your next post, shall you update your series again? So 
could you wait with a potential v6 post until I got that one tested and 
posted? Then you could ideally also include Vinicius' A7Z patch, so that 
we have all in one series, and just need to deal with the dependencies once.

> https://github.com/radxa/allwinner-device/blob/6d911d1582dcccdb5a4c38be8d3c1ee851019795/configs/cubie_a7a/linux-5.15/board.dts#L5-L9
> 
> Enzo

