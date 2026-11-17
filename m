Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794886992;
	b=Lq9GPJkoAeb8qKDpq7iD3IDjAjruM9JH+mldu5QGOH+E2kwjtqhtXS5YmBJq+qzjLu6k
	 Zva+keFNifknmDH+hlTBqR4VaIg7hWKT120SETQa2aw3Ql2Z0zjXTaK/iJVxsS9qmLLkB
	 QeXiFU2iuQqvtcqxZ8ayYYm0Cqvc5hpq/vcf8xZCaQta7yaSytxRRzwrPJzSAv/ExpQLx
	 leaZ/1As7nXAPDXOYNwL+wg6mObW3tLwtVYV1E8ca2QaRM2p/6qH9XMjUmW8ICwTpXTHb
	 9d72F67U6iT2q4eE62f1H+qL3oLtc7RkBtgVFO8NGQsM6h2riL1XRs//xPaXplfsvGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794886992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=nRBAFnEApl3XvYxVAcATjRSQNlRWncFye6hnLwE9I8g=;
	b=u+dmnEVbMnv0gk9Z+ThuA3iBeFEBBUmebEJSv8e3rwp8u7cQS22gehfXdXYtgxJCdGgG
	 hPCYfuMSy7UW/xIIh5wDUQa8DTBk7lnmI+q5Z3KOPFm+TrZMhzzTEDU4SS51FJ/g+B598
	 wIyXeoGFHdjL0siXajtRy2tUL3YtLTzMJJHKHFkR3AzWFKRvUnL6jPCPP2dtv93jYUp/1
	 tXNF7MzeLaGVRhnOeoHtqVxxpy7QHpnE07QrQDCITWqA/Ou5f4V/8u8pQwgx7E+BvmaYy
	 v58AHsTD1Y+N5Wi5nqI9WyWdIk/Lf7w1+WTGJxqc37OJTo+UfH8yjbffLotstF82cFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L35JyBlF;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F118606A323
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 03:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F118606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L35JyBlF
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2efe022c04bso488855ad.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 19:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794886991; x=1795491791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nRBAFnEApl3XvYxVAcATjRSQNlRWncFye6hnLwE9I8g=;
        b=L35JyBlF/o0S9PMiCVE4IkeMFVdZ3YXp+JSZAcvz5D9RwAP3brvGtQYDCXyBe3NOUw
         RuuITAzm+oKtrVJBp6wz8OwyT/haihs9l5Zb9RF84sA3uKKKqL78/9VQ/kTT6AC+uzuM
         87KTODBnXBJ3Ysv7md/RyO5LBcA8x4K/61847vA7jkT6ZPKUhFHM3RRCFyC6qKK/iWCF
         MMcfjuBQ2vLLWVow0iA8ULvhxlQeV8Fq+0xkxpCPxUsHiehe5yS9qmnICDLOrZfRI8RE
         8N0/mNnEAF9wPoPDFGiCTianHHYDjY3uJ0XgzJ/SOOdGctD4uutJP8n3vEixW4PMb98Y
         egBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794886991; x=1795491791;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nRBAFnEApl3XvYxVAcATjRSQNlRWncFye6hnLwE9I8g=;
        b=gbF6mHuypunJ3UxP/vUbIVOyvkgK8YeJ2bAS4/UcccYNev83bcH91cmzbz5Cq/64kX
         QPWULT95mXaI9BWy90YMCUNiOitEIcTE5fm5eiVhgCriYepJFRqSovXXOE79m0dOUuE4
         9Sl7lwLsa9+vTTYwMHXTUARKhc3/XpfiJfw+4wg3IAjHz2HvWzpvZSIC8gbIgFBzH2x4
         arstlt9amrY3tt1Q9b58MsE58Vcj2RH0rP5bsE6nxmqStp17Ay34St3pGj5DanNLjDpo
         CNM4NzlS/9isynFHF86nEETT9lbtTSTf95Lx4Rek1aikiqO9d85rHqYTyn6ykAVLRun0
         6C7w==
X-Forwarded-Encrypted: i=1; AL+hErG/HCaEiqzKmiOa+sTcq9TTd9wZ9yFmSBE8ciZSI0fBxt3g98Xmdv8onRil84ZL5eklIF8OD4owHibV@vger.kernel.org
X-Gm-Message-State: APuU4Z+5VdPdykVnEYfHI0LZUhzlERpsgJa5415yRIsQv+wPvBjKWmHT
	rdBr0XFeULbr3pIPNIjOvTMvIvfRq3kNIz4ha+ul071+7DD1XdNIDb1v
X-Gm-Gg: AZFdTZek9LHPJlUVBlcvLXqWcBh27j9E+KdoOAL8O+r2q1A8H9Vdo2r7tbJPwrfi4CC
	LWqwkitrxw8QRnOVGEjTzfk8dqM1yI0j1dakANmkx2BHFHDbe1I+y5exTTjwR0dU/beTXhew3fU
	AvY9TDoSA8qW+7PuN9EcUVA8nhuoyRxTgyaVp8SwSfLDXW/qK/ynPONOVV/TOc3xr1UXLWr1WTK
	jH8EU1oQdjIJNBCl2qZNwLuK8F+DgBt6Gbkto16TfK0Q/2ON2wC5hokXG0VXhM/qVHPvH7kVsO0
	kc+71/t+MyvzYgS6jyCPx/VXJ0zzUv9bykM2jxhZX6188qzSWOW0q3cng+ggLR7E7Lj2/qJbnxu
	GJLlv5L2gsOzxwM52H4lvnlUtww+vFnKU9Mx/6OrDieyATM7tNWtaUSjg2XaUGoZYUh8QLZFkha
	RggJIkFoaTYhqvVsHKe3jz+IdAVVv8bijln7ZmZxvUvJXNig49kVNwaSne/sJWnDN0nJYXI6LzL
	6B39YHxGRCQeuqvzamfg82j6kqh/whnwU003u8qJq0g528s2cQNEpnsvnF5PJyMZDBixYqLCoGe
	56UxBDCYPa3kqOzuDE/xWA2xs0jKvgJth1XAi2WIZunisPQpcxK9gDlB0Rqq
X-Received: by 2002:a17:902:fc47:b0:2ed:3eeb:b0db with SMTP id d9443c01a7336-2ee0de10ab1mr118955035ad.17.1794886991445;
        Mon, 16 Nov 2026 19:43:11 -0800 (PST)
Received: from [172.20.10.2] (42-79-72-63.emome-ip.hinet.net. [42.79.72.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a87180sm6533155ad.62.2026.11.16.19.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 19:43:10 -0800 (PST)
Message-ID: <63472ed5-1bc5-4acb-97ba-55749ec93c2a@gmail.com>
Date: Tue, 17 Nov 2026 11:38:15 +0800
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
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: nuvoton,nau8310: Add NAU83G10
To: Krzysztof Kozlowski <krzk@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
 krzk+dt@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com,
 lkp@intel.com
References: <20261109051251.471879-1-YLCHANG2@nuvoton.com>
 <20261109051251.471879-2-YLCHANG2@nuvoton.com>
 <20261109-grateful-white-meerkat-090edc@quoll>
Content-Language: en-US
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <20261109-grateful-white-meerkat-090edc@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/9/26 21:11, Krzysztof Kozlowski wrote:
> On Mon, Nov 09, 2026 at 01:12:50PM +0800, Neo Chang wrote:
>> +  nuvoton,sar-voltage:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      SAR Gain Tracking Selection.
>> +    enum:
>> +      - 0 # VDDA
>> +      - 1 # VDDA * 1.0
>> +      - 2 # VDDA * 1.1
>> +      - 3 # VDDA * 1.2
>> +      - 4 # VDDA * 1.3
>> +      - 5 # VDDA * 1.4
>> +      - 6 # VDDA * 1.54
>> +      - 7 # VDDA * 3.12
>> +    default: 0
>> +
>> +  nuvoton,sar-compare-time:
> Use proper unit suffix from property-units in dtschema.
>
> Also, Sashiko feedback needs to be addressed.
Got it. I will update the property name with the proper unit suffix and 
address Sashiko's feedback in the next version.
>
> Best regards,
> Krzysztof
>
