Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF5249E142
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 16:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873834; cv=none; b=GiUglfKeo/cPjKGX0bmYbUwNUQrxV/BrvFG7I3ya5vkkYTQ9m8vl1v2wAC0e1O6xq9ykmpSUVL8GOY18FM88aNj4KJaskANs4YpO9d3Syc43nFVSjUzZhFWZqcxjCA0XkgE/XmSF5LriYL0FaR1dnGeu09PrcaSTzp2ekimZePA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873834; c=relaxed/simple;
	bh=T0sTwhNjA7urD/dDmrUooY66jFkiBVRt4kMtyxZutVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TEL5pS4RbWcDociJalfal3WzECMiKdJFDkarxkyZJTbxnIw0IuHmB+SJRawxwg1w1B0Mysl0eLW9fbU4yKIuOzJ9IG5ERJwI7eOMXF2fmsr06AtGkcgaiHJ9h2yyIA3Guv8Ll7atbGrNibEuRORuWd8Gxt41eYT//aIBfoU20U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dgJmCbKn; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dgJmCbKn"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso42865445e9.2
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 09:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873830; x=1791478630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AYoMqQ8ZvtqawNNIbF0bmVuGXHmouMQegpP9uov8hrk=;
        b=dgJmCbKn2J7tFK5YLxXRPxlTlkCXKnApq2d/sXYXbESRjlJRVpYK1eKy788j5HiuKh
         YOZHLzntfMb0sKROQBfdpFcFROEtARvKP2TqpPhq1bsTfJck1YED8afDqHQ/roumwg0W
         c4neKJYG7x1acgUn988kapZMHOAyrAJ5iOhMHOnma8PFOmFeLOf5vUPhdcxTWeP4KEZH
         NpcRgQsNpo7kHuTziFs6IcLplTc1VTynAOHUXK0hO2TdXHnkTYj4baUbGa2yNbyjH8kg
         Je6p67hgIMYV1AGF1cMdQk4Zpmpsq7QLIw+XHUzuvzRuumHf3icp0rnxdz5v/x6zWgdr
         RWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873830; x=1791478630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AYoMqQ8ZvtqawNNIbF0bmVuGXHmouMQegpP9uov8hrk=;
        b=FB1pFJVKxkLQpZMT+Tab8H6l2GFbfHe7/oDK27RpGOe1IVfHrH05o0ZldP3ChTCVpq
         Y5Totpd9MhcrXdERqggDanH1VNHVfsM/DOIN2X03WOCDWKuQXXlMbTu2pPEkLkrbrxCZ
         NkEUF0YhTMUwtDg1MkKxoX8CCMeubq5S5sfe4/2+oh4myGG4mwxDfpaW16vxMsCIT8rA
         rizVH4LFK/HiinWFEaJ3DhT1qynBzKNryxs3eYTdNwaI2VQdD8tj+l8T8zuuHtzeGdLo
         KabhxZclYj0WyQ4/g7MQyOPGf3etsZaLEQJx9zQTnPKw0GY4MXBxQLUy57X9wZ6lSq2F
         hWsw==
X-Gm-Message-State: AFuF++mfI7hxk9vRdLErpe0Mb2lyMJb2f32DoHAuPLSbZkNcQZvhlly2
	wNd+n7HGUiNJ/H/ddePVLv7/WrbIE8CSs6dGH0y21zo6syChVonYKD+r
X-Gm-Gg: AYBFou03p4PD0BENvf8xzBnU1SEyjTyegBgJoKBPTekP0pHaoCDOJI45wgR4jPcMQFV
	TjanfbMc8JwYrzq0hsE7LGXoS8xMHqd8S764EEY+sR+44BUSI3EyG0DEC+vymFSzU53TjUrSKkv
	fwWRxeudWy93mH8Qbs7HtmHLVWpwR0xv//lgGQSVU9cjdtfrAcUAqIuupeNI0a24EfXO5ym0ZLm
	m4pb4G/ZO+UuBNcy4m4Bol923XysN7efUcjyVKBBOiSBi5VwxkxWWgRtWHU30R/WEw6ZC/tKGWD
	RBu52V+k0YsiyurqfSkW8daQO8hXteMhI78uBLrVsoDujQZDT1saPMxDPYPbeoTIpLy71siyvmv
	7t6EI92K11V0TTdmqx9FdXxCx70KlPE09doAmN0ve1jo9VtRDDvusQsi7MqLG711RJsJ7dUs1rI
	x7Fe7JXsSUizu6V6SZFldRjYByD0TiX+x0MhFKdej8IpL/ImZ1xPyRyvI9U4wywcdfiC/YFio=
X-Received: by 2002:a05:600c:6995:b0:4a0:159b:d283 with SMTP id 5b1f17b1804b1-4a0275857a7mr3761895e9.30.1790873830150;
        Thu, 01 Oct 2026 09:57:10 -0700 (PDT)
Received: from [10.2.0.2] ([159.26.109.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027906a11sm2044415e9.12.2026.10.01.09.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 09:57:09 -0700 (PDT)
Message-ID: <e5f84c5e-e281-45af-8d25-62bbf585c94e@gmail.com>
Date: Thu, 1 Oct 2026 18:57:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: sophgo: cv1800b-milkv-duo: enable ethernet
To: Hiago De Franco <hfranco@baylibre.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>,
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com>
 <20261001151447.12076-1-andrey.lalaev@gmail.com> <ar6E4bQAKonCW3st@hiagonb>
Content-Language: en-GB
From: Andrei Lalaev <andrey.lalaev@gmail.com>
In-Reply-To: <ar6E4bQAKonCW3st@hiagonb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Hiago,

On 01.10.26 18:08, Hiago De Franco wrote:
> Hi Andrei,
> 
> On Thu, Oct 01, 2026 at 05:14:47PM +0200, Andrei Lalaev wrote:
>> Hi Hiago,
>>
>> Please take a look at the patch [1] and the discussion.
> 
> Thanks for letting me know, I missed this patch. Do you happen to know
> if any overlay was sent? I was not able to find one.

I haven't seen it, so I guess no.

> If none was sent, I am happy to send one. Sorry for all the noise here.
>>>> Thank you!
>>
>> 1 - https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/
>>
>> Best regards,
>> Andrei Lalaev
> 
> Best regards,


-- 
Best regards,
Andrei Lalaev
