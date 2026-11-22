Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795352668;
	b=HcslXFGBZ1MBjvghYSmWZ3azcSiHs6HFrkGqfMsK37fC1wp/4IFoRPvTA1Ped6OYnOQS
	 XGRsjo/DiSHGnPqoPNH7GqyOJ+FWlvuUnEzruMfozAc61CBrHHQohLuK0YqtcrfOYoBzs
	 5t7uRIIMWTBmcHjR+N4rFwqpM5trEBIx3ZlDJcDHJGWddj1pOE6Fw8T2NTMbaApAG77zw
	 lxi7++TVXicUJ2y2MguT/3ZbV54KR6VvTL1/jKnY6Nuc+cppBoeamMLgxM0Xy0eqHVqz3
	 OVK+Z8ntEw8m3dzSs/cUvoadt3nlkCRzzEXyXi6mUS+dP6DPCkenB1l6aoB2FgaLrUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795352668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:From:To:References:Content-Language:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=2Ghc0hBz1jHUecTvaKjNOcyBm3ZUFk09LMc3nG3eDS4=;
	b=0hrHDgjFk2UjoQmsZXkeA/hfdStYurdZPLrtylW0xi7XKdTiNRtPe8yIuuoYjGh48MVc
	 Gli4Af4YgHtZCYbNssBBT2P9zoFFKOEn0uTReWMhX++7hdf3zkUw9ZIrwBm5/fuSGsX+q
	 YpfS2Ed8GAz0YxJR2TwZKjBsxX2PAzKznJEDgC+zg2A33f8v2hJN+Yf3vG4aec+Zj1lmu
	 7SP0K2K3kNKRlgrFnvh2xX6tEY+b+MQkIBZ7QHfPUM5rYOcnnUqAND4Ml6GXcObaF0ncU
	 XdCcCCGG5rLMYwpD3A7K6HKw3bE/GcE539JnJgIS7ZQQTGlrNrLhiG9rYvCnX3EQ1Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rjZfJ0fI;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFD7606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 13:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CFD7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rjZfJ0fI
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491971ac844so2176683f8f.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 05:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795352667; x=1795957467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Ghc0hBz1jHUecTvaKjNOcyBm3ZUFk09LMc3nG3eDS4=;
        b=rjZfJ0fIbNALq1KxFI5OjYBt8KqBAVJiGtv/oPrlUQR2ddh+kS8cxMOxeHi1UwkyO5
         yjWEj/OpOl57eXI2tkM1JAOGuH+Cwsp62l6vqSrgfgOabLPxazQmiwgYTcbjuDO4LdpL
         9mdAGYQcXFYNQwILPQm3/LuI7/ghJYUTV16bRT82htG/SjB4cgvRvWQlIS0X0lo7E598
         drd2iGH0y5kj7VIzyid4lqzyxO/D6fb54TnGRVjlaEwmlw5K2eqavC1LDZjOW98mvn2Y
         lcYXuMf+b2nF38JWFvYWTLhYGhCMrDEPhynlRip7urUVN4zy7Wn3A4LHT4tIpumhOdqx
         NXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795352667; x=1795957467;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2Ghc0hBz1jHUecTvaKjNOcyBm3ZUFk09LMc3nG3eDS4=;
        b=vdjgNql3MKJCazS9SKIw0axooh/3BFXdOzUhHhO/h4mTstLzcE0BtSfF95pU2tvyb3
         /A6fVyY9h4zYtPEsEU1w2U1A7jW4xLCOPGmjF0SmWsKUCiewIWfc60VBOJDSplKzCiab
         ydwKz7MvBQHFz2EfmTZk58TxdAdIpS9rRw0q3nxFJm2IsC9Qg0VeMkNImtuaVFjj9JAh
         sIF5r57Dg1jKnozaQ5gBeG1EFctyO7b5gzpkhOjawieeaUnTEHiBGLp4zb2AopVavWS8
         3UzcCJBhUcLwkpwpCdUFnZiy21AzpTotrUoga6vbuU4B+uGKjRJd+bZ8Gs+g/GKHWZgL
         6Xlw==
X-Gm-Message-State: APuU4Z+3DBI0hIyRHmlAp1GgMNonYmbqTBn0SC2nlGBUm+scvOL/T0pY
	Qfd77wSEGETjY2hRYIhyKgwSbl2kK1IFzRvO5kiVE+TariP+R9gBG8xij2yUwbaw
X-Gm-Gg: AZFdTZcLQcGg7HtcubqAkIlc1VTJaB9DFNawNE+DLbiDUMXXZbLUste78kGStX7fMu7
	sWrCfychXupuZUBXkZ+SxmLS/z4kE6juBOR6m4FRCwSuKjyo2wob7L9hjIQcckr245+L6NvaWPH
	gleQVB8KXQE7GwlVNcu2bXS/cTMBh4Vr3xA6Rh8F267U8bvvRIEWJHS/SJ/hS7+sFd/re86HaTY
	hljM+CFAWf/XjDkqgktGxHIlaB+jnjSdQxvc4SJHZh5cfy2hNxzzoILJgKNyhaCHycD39PPuXfY
	W6yRnngATyOLuYzS/UkIU4GrBoQGuCoXxzOzyF8WMWUfuNbcyOAgs09JFyguez+JmAn9q7QsH0U
	IpjAmq1D5Tbv04NNEzvsh3zxTIxSiQOaU4MRZUVyzRPXFjDaJp0wUA1v42SAoap5SjCRJY4towT
	AwC0Y2dAZ154HayntlFjg3ig/TOXRuWyu/Srb2YOBwSlNgilpWCJKXiPUFeau8f9PRI+hnhFKre
	nBuoeZq4eJ2pXiCyjWJIVbZxGq5ybSyZI9LaWKvkm+wQnBZfbOLvoZYtNGtvMVq54HvjEtN5BZa
	mMoZck4St2C8nHdBOgvFOCBsKTdM90I=
X-Received: by 2002:a05:6000:4381:b0:4a6:ed6f:7a6d with SMTP id ffacd0b85a97d-4abb1d93c3emr16256779f8f.28.1795352666614;
        Sun, 22 Nov 2026 05:04:26 -0800 (PST)
Received: from [192.168.1.224] ([88.80.252.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm18549455f8f.24.2026.11.22.05.04.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 05:04:26 -0800 (PST)
Message-ID: <873c2658-dcd3-4a64-9306-01b3a501270d@gmail.com>
Date: Sun, 22 Nov 2026 14:04:25 +0100
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
Subject: Re: Solution for rk3588 with suspending and wakeuping at Radxa
 rock5b+ through original power button.
From: =?UTF-8?Q?Attila_T=C3=B3th?= <tothsoft@gmail.com>
To: devicetree@vger.kernel.org
References: <3369e728-9af2-43a8-a25f-ff107ceb34de@gmail.com>
 <b5a72bc8-7c17-442a-a2fd-de33b467c358@gmail.com>
Content-Language: en-US
In-Reply-To: <b5a72bc8-7c17-442a-a2fd-de33b467c358@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Link to TTL logs after using dtb from batocera in libreelec is here:

https://forum.libreelec.tv/thread/29953-le13-testing-for-rk3288-rk3328-rk3399-rk3566-rk3568-rk3576-rk3588/?postID=209760#post209760

Dňa 22. 11. 2026 o 11:16 Attila Tóth napísal(a):
> Sorry, it was not thruth. Batocera is faking by uspend and wakeup. 
> According to ttl was clear start and shutdown. But have their dtb 
> lower frequencies of cpu and have support of mpeg2 of dvd under kernel 
> 7.x
>
>
>
> Dňa 22. 11. 2026 o 9:37 Attila Tóth napísal(a):
>>
>> It is going at Linux batocera 44 with mainline *kernel 7.2.8. (*There 
>> is also not going lan wakeup, isb wakeup, wakeup through hdmi*),* DTB 
>> is in attachment of this email
>>
