Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795039669;
	b=Xypd1ldJ+rfM8qqQHCrX2tQT6LL1dbSSzACp8LwWbWnIA+xLQPokZhk4S/c1YTZWMHCv
	 8EGgC2UwIDhYIIAV0b348TMos9EuDDPeWa4NV+jEIuviR+gqJc6Gk4fRhqr9PAd77cHyZ
	 01KGHfuVtiGSbFPj198TYhYW8bWFCPEAv7JErYdMNN3npwwL6YMcfT8RtxbSyg9PZV6tk
	 B021XoID9sZSfyBoXi6wLe+oJ7k6YMuN0dbzRZ8Vc4AGMfgVhTQkaUZcm9UFDVeqRYAnD
	 /u7XA6Cv6t5URGA35hOm0KtQaCfeVj5An8BLFi4SzdsOKCfbxPs2W7JWOVnQK0Zj+jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795039669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=eGiTz5a4RWzDfrU+6uE44Y9DQD7JN0lrvIFzNORDJ0I=;
	b=vItdr7cXICNRjPXS766jXmTPLB/Jf0DlMidiPczx4MvNOTce6KghUgPTeaIK0WFOQahS
	 KzFT8naZ3WmJgkp0LnE687g+IDtvJsH4KC0HZilUrEaZvKSVPE1DpIC92/wZf0KvAHgSS
	 0dJ4OmIdLCPyNstRt7GxYLh3nS3DioI408L6Y/Lub0I9QsPfUjpLJwvVVmHDL6hHWSDq+
	 BaD/tdfnGjkorkG0g8HqZxG/BEorpqD6by1v2slXO8POgSF4naZgD10SJNKCZIsCy8Lz0
	 Q8iUtQleZM6rjgR/leiYV3V5PGZ8scgR6nzdL6WvKpUuezKPkUW6/zrIirqq+uJqJOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v8L9PHOr;
	arc=none smtp.remote-ip=74.125.231.134
Received: from mail-oo2-f6.google.com (mail-oo2-f6.google.com [74.125.231.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7A6606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 22:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B7A6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v8L9PHOr
Received: by mail-oo2-f6.google.com with SMTP id 46e09a7af769-862990b7bbbso487107a34.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 14:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795039668; x=1795644468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGiTz5a4RWzDfrU+6uE44Y9DQD7JN0lrvIFzNORDJ0I=;
        b=v8L9PHOrcf6EifRvOUzF1B/yU+AHRT/pt16rArYrVplOhD1uNp54Hi2sayarkYNx4y
         SGKwZwsGeY3hymNTokhMwV0Is8nFmSWK/C/srm39x4AXDlVBGrEtzfqhphZpiqG4cyNh
         OPhlfAsx3SNGvrgsWDjYaXdgOd1mdB/TkK5PrT6ZktQ446jnF/xC/82kilWjejCQ5emf
         LzJa/Exf7jivcmHArr7VqwzQdV1ODOubkngAVZlJCsPV29HLCt0BcCH7Hj97N6+6YhWx
         vx6vhtZhkipbMCTd9j0Bu/Kr6GW85nw+GLNcCm2oxh/y8+g+KEfcdwvHewCfCCfkTQ+G
         uB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795039668; x=1795644468;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGiTz5a4RWzDfrU+6uE44Y9DQD7JN0lrvIFzNORDJ0I=;
        b=wWlgWSH0WQ2rjj1H1QMuogtewFV7lk/lMeevVS3Aj6Sx55Ba1onGMOvJbE3hvmP5i0
         3r/aYvgXskXRv3PK1f8CgyL7ER8jxK7uanPEh2uu1vA9Oji3y0d0l5NsG2Q1pVmtXDcI
         t9m2kO+L/0xLu01gQR+I7pHLegHx39r1MQSF5PQn4JW166LhXaLRSvpjabLwhuqFOQO0
         XFjA+dHlqjBvUqyODSpGDBHwltMJeUrk8qGDfcLx176C2whjGgVON4b//Uqkk4u/5pBI
         vQFX/Wp8nOzpKP+/V798bCD3SnXy/dWn7j1LbHTLbC/a5WzZbZsz6O94yhOl+4kdElXo
         Fk5A==
X-Forwarded-Encrypted: i=1; AL+hErHGU48H3mVMmbHD+wXU3Y8yFxreClMo06uFUrTq02/60E/C0Hx1AcLfobGvX9b20T9ao4TZgnpmolDW@vger.kernel.org
X-Gm-Message-State: APuU4Z+JGwnxy9XToweB8+fDZq4Nt+l6nzBkIvtuMNUhguHMhgq8GCqJ
	yrs2pay6D9sWaSIWuItVIoHJfsVDMVaEtkwYeeXPCSTAOTRfHT5IBDqi
X-Gm-Gg: AYBFou2rYGzhPMR5XhYTToBMcDKDAF5CCGl/FyQRRBWE4d4JDuuZ5g50X0+Tn7cc6EK
	ZaPEKYa1fqg7AWYATEhfI6/ieYDAcsri5EM+DSCv1FMsu6LjCiVlYynI17/OuvpXYZqELyiENBd
	4CiF15yBHL67NbUOJAPBeGpKkD3grkuWzupodV1ZLjBQDuqpeEUuYFKk945w5shuYg/HXHE9Hzc
	t3/wMgnjD0ZRqvVwxSkQyPY5mViJhNBDo+IELs79maCkLxOD1l/bKv3XsnnJraGJF+8ks/sqKtK
	mjDXQ6BOE7JeeGmn0vQOOgODfn6FJpObMEg0VMnZ+Xu8RxhxFzDRSLJOLKoJyvyCd/bcWHtLts9
	fqIRrgnO9Wm7VkLZLoaRXTrGFjSbSqiWprM8EtMT/pztRHI8u9s7EfnJC1F9HrXoNdSXsr7mIBA
	+lYDq7Z/1QiFItpWYQJyXlhj5atAtVnt/GWZe3HD14zTFPTxiMx58agkHdvOgiZHjM5vgkrdK4U
	S/xubXT/BivDtxlgGIx1RHLOgRIhMHzih+4be34BGPb7x7aytLBY7fHWsdPlEnibb/+nF07mWlY
	uZpmahaB7DezEmgBI4WJMnBAyJcjTV9dPTOE7OQ853wAnvw/rz5VN1ytolRafPDnNM+2Llg4XOF
	VpSBsEnYssZ4vzXQSZJrtP9EcKGLsy/vtFbaKU9edQA==
X-Received: by 2002:a05:6830:3495:b0:829:9992:20f0 with SMTP id 46e09a7af769-862f08c9ce4mr4131980a34.28.1795039667975;
        Wed, 18 Nov 2026 14:07:47 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f021aae9sm3024029a34.18.2026.11.18.14.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 14:07:47 -0800 (PST)
Message-ID: <2fb4e011-8ee8-408b-8684-f3bb8e1ac624@gmail.com>
Date: Wed, 18 Nov 2026 16:07:45 -0600
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
Subject: Re: [PATCH v5 0/2] iio: adc: add mt6397 PMIC AUXADC support
To: Jonathan Cameron <jic23@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com>
 <89c8cadb-0ccb-4aac-9b95-89f355beb24a@collabora.com>
 <60eeaaf9-57db-4ca7-b4f5-bdec111dcdbb@collabora.com>
 <4c64aa52-2b75-427e-8f26-c2ef7fc5b822@gmail.com>
 <20261118215144.301c2467@jic23-hlaptop>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261118215144.301c2467@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 3:51 PM, Jonathan Cameron wrote:
> That's indeed a common solution to cases where a binding header
> is involved. So I'd do this - then chase with a patch next cycle
> to use the define.
>
> J

I jumped the gun a bit and sent out v3 of the suez dts earlier today 
with the proposed change [1]. Should be all ready for AngeloGioacchino.

[1] 
https://lore.kernel.org/all/20261118-rbrue-suez-upstreaming-amazon-suez-dts-v3-1-c1a8b0febf35@gmail.com/

Thanks,
Ryan Brue
