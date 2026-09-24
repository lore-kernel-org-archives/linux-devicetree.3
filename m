Received: from mail-ed2-f16.google.com (mail-ed2-f16.google.com [74.125.228.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A053A4520
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232495; cv=none; b=B25wKrOEWZajXR9Cn1uvnfrMKC016O/KCY0hZlcPH9tvzD1/xDhC5ds9nbBWef/6/yB8Nw1ABTk50hBd1zFqeLzdcXwSck1OVWwpxc7i4QQ8x8LS2pS9mdmyx/crDqWLjxjNLndzLdeCL38yGCAKqp93oT0wXGmM/v3EDPCfzWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232495; c=relaxed/simple;
	bh=/BcelbpT7CGhnfElWZJzPti6+AmMa6ROEiybn3GdoFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QhMy7reYsYF9p9hdO+oUjRnLSjQ0sS1VEw/WG2N5aec0mdesvItNUTf1iejkMLB0VPe+G1Fv6FKMjQSXHUeVPUrtbxQXpbxqYw1Iu06BhQU7oq/3WIycIMtyR7AzL5kAjIKzFwks+2X9lWtuPfOHdtDw/yi7K6/MX4xp6X7D0QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=OGFK0UTL; arc=none smtp.client-ip=74.125.228.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="OGFK0UTL"
Received: by mail-ed2-f16.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9adcso2962751a12.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 23:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790232493; x=1790837293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TQSx66yiUW6sVcxiGO0Odu8TWkytfdb3yKLMsf5vKh0=;
        b=OGFK0UTLh74qe2B7umXcdJFXbzEwPrOq4uaGpPdWITgXiKEnm8D6X4uHY+ezy/K2u4
         SZTEkYKElcn38ojzd6DI98J1x8Lc0y3Irv+thn8gTOa0tikTdfPdJzF6tfvlvnLzRSun
         gXQa6vvveDWzX6Yg4mRZUBlOET+XouHOHfU80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232493; x=1790837293;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQSx66yiUW6sVcxiGO0Odu8TWkytfdb3yKLMsf5vKh0=;
        b=NvVGtvatkjiWyhy4NZEzjaMqd7wnmwh2sxqJ096pF2VtqBfzW3LIhrKiNEG2dy/7jv
         al2xD1/nN4FZgtcu6sdqJdfhygVLIpxKRsUoZccEQffcsffxr5WqHTR8TuIGFKckxNVV
         5iqPgoeUrdoFUTemtM71h/eAqNP/Q9Sjav7RRXiCpA21JXuqi2+DnnCfrVDwn1oc6Wyp
         /nc9UBmzCaiELc/Sq81xzlYJPvF3HVn/VByIGsUSmcE20x7eilmFGMNBIemvXDHNCmbY
         7dbL0Qe+XtQf1kkUZTFQt1hDOmV6fCEN/BlOMxH4xZXrFDyKmww/phJKSOexiUtb3tRs
         2tFg==
X-Forwarded-Encrypted: i=1; AKwUvBytXJTjYSiqdepMMGXBWC/1uE+aCrkqImC3unz54KDk5FwewOYE4q1tOtAD3V2IwYbHGJs6j+IcL2PO@vger.kernel.org
X-Gm-Message-State: AFuF++m4RUU3gbY/ovuPRmixMABDiBp8ANsjAFOEF9bmff+pbGK32hyK
	lemTCCkvpHVXMLhPE42/8KRK3gT5lZn044L7/zyrwBSbgC1rWRx4GPWCdSgc1knJIXA=
X-Gm-Gg: AYBFou2B7lTk9aW74/lDGQPfIOHUZqSW6EmBVMVLuYLb1OuihjvUJYqnyzIVAysJprV
	C7p7oR4YuMSY4DQbLJshU5FgL36L4jBRj7+uCuXBoSM+87xXDbEyC+5k6FqdNYV97x/53sujjh6
	ub6btMv5JC/lY8g8SXy7Xo89BcfBa6e+xWz1EU3TfcpxaZZGwLhGvAa0cQwzcI+Vr+NzdgZITiA
	w8DKXc1Kr3adgkvQxzJAK0xs595GuEQ1bF7INZH8RG2Dq5NLfjO2zZ5XT/87E3mnHc1rmcuRxKS
	R/XnsXPLh35h+8X9NYNT4SFuA7I6BATIFZlJnfYfuVOmCtyTuZjAOUFGyL6nEB3LnI69zd9GXpv
	xjEFkWOKibKg9drIU7ywNMPwfR+PRqMJEvSZsL9mLv00BGfHjGMvY222M8LUuqoecpupeIck3Yq
	ui0Ktdvt+5u/w8Bbl8zrSoHKM3tYaBC9Zf1pg2MqvjjDKdsP/iUXd2IwaFPV/WauXAXMs65aHG6
	0x/R4UCwWPth6SdUAE=
X-Received: by 2002:a05:6402:23c7:b0:6a9:e7eb:f52f with SMTP id 4fb4d7f45d1cf-6aac90a9049mr971517a12.28.1790232492657;
        Wed, 23 Sep 2026 23:48:12 -0700 (PDT)
Received: from bender.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab386e5aasm3155851a12.9.2026.09.23.23.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:48:11 -0700 (PDT)
Date: Thu, 24 Sep 2026 09:48:10 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dinguyen@kernel.org, arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com
Subject: Re: [PATCH v6 3/3] arm: dts: altera: add Draeger M48 CPU Module
Message-ID: <20260924064810.GD6325@bender.k.g>
References: <20260917163157.1380860-1-petko.manolov@konsulko.com>
 <20260917163157.1380860-4-petko.manolov@konsulko.com>
 <20260918-strategic-hairy-kelpie-46e807@quoll>
 <20260920075924.GC7878@cabron.k.g>
 <042c39d5-0642-4bcd-b965-61fce77b52ae@kernel.org>
 <20260921090659.GD14552@cabron.k.g>
 <89e1e02a-1a41-4c40-aafc-172c44ddeafd@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89e1e02a-1a41-4c40-aafc-172c44ddeafd@kernel.org>

On 26-09-21 16:16:45, Krzysztof Kozlowski wrote:
> 
> I gave you already precise expectation 10 days ago, which you ignored and

"precise"? :)

> repeated "what shall I do". I expect explanation of the hardware in the commit
> msg, especially the non-obvious things.

Is this:

https://lore.kernel.org/lkml/20260921090735.3174292-3-petko.manolov@konsulko.com/

sufficient or you want even more details?


		Petko
