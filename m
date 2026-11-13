Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794600213;
	b=e4ft8/XKc//OX4vg+fsPNsnebCdsVNovriqeh2vS97rYE5vdsLBoXuZgzFXIJUHhZgiS
	 NvFIFUbcPnfpEurlGdJeZtDZaaSqTBDO0Ncfu9bq4lZwtiJkxrQ+urdTorgLMKHRnORca
	 NX8ivbvC70a0FbKl+ru5KYkKFmu7VdUsb4zFmaWzyjzjvbym+77Ez9xzIAunaaNYpmM/2
	 zFs+ny4Ea9W/XCVR386icBolK0E5wmq5r2rUq987HFxtWm58bN9HDfb7klLpmKOnHPjXw
	 T9/DRAIaQsZjnuBTie8qb6Mwun9yKG5q0ESo+qYS8GextR4/AdRSTKqIn9ChdbcOThQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0oLkgc4LESe1RA5rsRbAFuQhuNZ8h5rAeMBrxjfEeoU=;
	b=hLT+tKlR3cY2XDJGGCHcNp7kiLvBDR6s7ulEUCw8PLMmLrLzg0tnHfZflpYw7IohR0yQ
	 j5YzDT3AaGsuSTgKgDpfDmt/xmhKmp28gQQeSLA3EfqGo+sTjxGGi+Urd4gBLeHXVzo62
	 J4k0sQtdO+Jt4SBQA2YEsSnyYGF6pncv0l1yQCSXOknWa20I7GnEP891Osk1EgcKfU9yL
	 1h4Ld8pyUs+F3VfgT17AuXCkIxv7uGpM9H60sgbGSfrT4uNsrr0Gti3eQ3+GclZz0uxI5
	 XKjECj9jeo1E7/PI4l36K4CSP/VOTdwzDxyTlzTZNLkARno6XzkVNbTZLnV+WQ3gImg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Z9P/LEaz";
	arc=none smtp.remote-ip=74.125.231.137
Received: from mail-oo2-f9.google.com (mail-oo2-f9.google.com [74.125.231.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3242606A323
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 20:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3242606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z9P/LEaz
Received: by mail-oo2-f9.google.com with SMTP id 006d021491bc7-717028b412bso511893eaf.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794600212; x=1795205012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0oLkgc4LESe1RA5rsRbAFuQhuNZ8h5rAeMBrxjfEeoU=;
        b=Z9P/LEazFr6KVed6bhtpiLAGhPrXtfYhM2lV6DlzRTRiqS7mbJew5QySGoG1DM5DBg
         w/Qb+/GpGCjNrQHB8Bc3EIuAAxGD3zwav8las1IxrGyj5VzP1iW7ZAhBN1QRSZQkPxyD
         yeioWvEr5SI4P3Vq4TSb1WYol3vNnYv9cUW7YFHwShUpU6KqQIsl2AJxNiA2iaEqv29I
         wGAR5gThxr1VOyq5sfocJ4qmcx3g7NKpIcUi1cyujjclHNzEbhFA5CWvNFkgXOupYv/3
         WY8gMlrYVWAdAQ2/57OJ+l5D3YANZ/sL/zsFE1SpwiFdmO3DWke+LLQoS/jzS2JOFDa9
         SKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794600212; x=1795205012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0oLkgc4LESe1RA5rsRbAFuQhuNZ8h5rAeMBrxjfEeoU=;
        b=WlSAPB27foU6Z751ietougeLABJC3eYlAKWwCF+gh6MenuJXtWVLWjSREeOanelm9Z
         pBHFnAzcKKpVjQ/hDoEX9W9TOLMYZlKtTlfdVeiIZPYj5xAQFsn8y7PgYaY/EELj3J4F
         J8Mv0YjPHkctkSRuC0xwB6IMJ4FsybpFQCoWzux4Xo3Yrnzsb5PylZ9MbLzJhfALt3lv
         VTQq6YSHsQ5Wb+IV3UXC2vLYgKjU4a9OBx3xcXlvopr6pAC1ku88tocBNNXgAcAhDvs3
         iNtCqvUZmktqd5HEjf0G5nxyQjtoEFk9BeqC1rU96kYw8HFENNAq7BbDbgvzH2Nn/3Jw
         KV3Q==
X-Forwarded-Encrypted: i=1; AL+hErFmfvgX2HroBzP+PJhapzJ2xDvBkoty18ER4f8AdHozcmp3KKGGsTkvTVqGEDPsisDXKs20V4tcPcrl@vger.kernel.org
X-Gm-Message-State: APuU4Z/o6093VqH6T0o5K4RPBxo2DP5J3ZZmhGJ77CddtPdEGH6Z4g1u
	rO4BAlghRsShZ7gQNMbuzDK+vlYG/M33bR2MomksuQ0gehorfWznbLc/
X-Gm-Gg: AYBFou2tCsyFxkiUkiemgwG3Q5R0R4S1Ws382TdU5DTrL/sR/GpHP9/qAv0KNg+F3Hf
	vO2AzAZFIYROZaqVeYkIqR/OpLMgdtMdj9rlzbccBAEOIWX64zgEv2h1Us/pWlD7okhEONaKSxw
	Tki+NpW6sqkKalDPBOVxOSVqlDb0qrj9nIgWrHRl/3abif/Rid0M2D1Jy/7XxG3lxpERF3ZeUCC
	bMEjxig5wKnNCVEabUwRJx84MbmP0xHT2SnS2OhBW++rRZ45XEkAYvdkUVtaR2rNpWDFZlQMeuw
	GxFI1Z5pWSUs2XJG6sK5jsB2Lano0qNBJ+CPlLT7LJRj/jW1EX7x/9E6fp7naoGqKTfDCT6rOIi
	u4Mo+7itihSjnf6ygLcNEBQZKno0Id1zIIwpwAMHyaKWdpnEKM1q6BmZjsWXGgqtqdJ3PbCBbjc
	nabg2HitEhTZhneLt3zCA8OJQjgLO3jEjOCBlWDIjN0cBl1ywB0eqDdWQz0k6Stx/NnXQPodsNT
	sh2b9KqGINJfnY24SqBD5eLWeSkEApOXhtCJURZD+o3QzOWDDn3S+nUnwvY9tolQnjp8U44domr
	meoJkQ8N1dqnKktVbBuUQ+pmdlIHBB4aNd8GHI5LC7ju+dyY3ivdZmwNNKjqRY6gApLl/ptxFv/
	fxPK1E1jNzaFe32DyyY3b0Tgx3U8wtajUd/K6ThBY
X-Received: by 2002:a05:6820:f025:b0:71a:ce4f:4a86 with SMTP id 006d021491bc7-71ace4f7613mr375277eaf.56.1794600211873;
        Fri, 13 Nov 2026 12:03:31 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab4335912sm2485972eaf.13.2026.11.13.12.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 12:03:31 -0800 (PST)
Message-ID: <a6bc9228-8e81-4f16-bd26-2d9c72e9998b@gmail.com>
Date: Fri, 13 Nov 2026 14:03:29 -0600
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
Subject: Re: [PATCH 2/2] rtc: mt6397: provide the 32 kHz output as a clock
To: Lee Jones <lee@kernel.org>
Cc: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-pm@vger.kernel.org,
 mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org
References: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com>
 <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-2-9758f38d7053@gmail.com>
 <20261113185047.GH6323@joneslee-macbookpro.roam.internal>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261113185047.GH6323@joneslee-macbookpro.roam.internal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 12:50 PM, Lee Jones wrote:
> On Sun, 01 Nov 2026, Ryan Brue wrote:
>
>>   
>>   struct mtk_rtc_data {
>>   	u32                     wrtgr;
>> +	u32                     con;
> These are terrible variable names.
>
> The nomenclature should be self-describing.

Hi Lee, two things:

1. I have a v2 out [1] from early November that fixed a null pointer 
dereference that Sashiko found. I can spin a v3 or resend v2 depending 
on the response to (2).

2. would you like me to update wrtgr as well? I can add a patch to a v3 
that changes that name in addition to con.

[1] 
https://lore.kernel.org/all/20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com/

Thanks for the review,
Ryan Brue
