Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53CC5592FD
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 13:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083679; cv=none; b=WPkub+dloVxTTteFjiK8UAEsvYwQPatNDjoN0x5vUZ9frO543Qxvd5tOvutKR4a91EKekyRn10cc7uBRkx8OzH1KpVwM0Xe//wHLUMCcvGCWxMlPcxTj6TatmXrz+bnpRYE9t24fo421w/YVExzv8Dllolx5zimdF0FUwIFUOPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083679; c=relaxed/simple;
	bh=WNeHYd3Vnw/6tw0XEiAyUXhCqoTIxF2ktmooC2skdD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s0HR9Xibf4adz5uS/OSBbeIae9pI8o3TMD97OAOzdcMoaxFrPFO6a6ulVcy2S/3kXVBivDJ0ZWrZPitB3U5IWDeRrm5+YeCMoMkWAvZPrvW3aTinWWvUD80aoC5UZUaHHn7fx5vyUhy45h9C0KWCuYG/fSqjuSTdH/Z4kfEK9nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=OVILplIw; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="OVILplIw"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb796so564158266b.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 06:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1790083676; x=1790688476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2YIyBTYTKojaf4BmHidMuZkB2sDxpT30TjkIMwtTPhw=;
        b=OVILplIwJvSmlfdN3F/ncf4ZOUcyG+L6fBdA9UquALyCo+GE1VKFN1RNKlAIST9WVO
         yhARqo0w+BCjSXaHpO26Qx9t1clb3dnGvG9OSDbRADeXylqW1QdKl6D8kDbEvVzWuvLo
         KaMFe+lvIF3vfDhQ4XuD/AMPnXuSPThAjShc8ocAELZrXFUhg5JfwZvUu+asvl8NdeY4
         ToOVvgQ9im9I+5RcW+tn7STSWB+g7x3FsDKk/IeBGo0PuEfjcGXPCcBvTP2Crw7QoC3J
         TF5P4T1kVOOn00bAOtcS4IxpnZcRikFYOjTSXWZPK5HfAK+eaWhBHKpy2RogKblgxe+3
         t1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083676; x=1790688476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YIyBTYTKojaf4BmHidMuZkB2sDxpT30TjkIMwtTPhw=;
        b=WZI8u1jh5L/u4/AZGyzJFJdWylBGN6DPxL4plbQ668eKTMyjeUC8DKqghLUignrpgS
         3pBPmVJzrevDtSxV7UJRNZykgAir3vQMYqghb4OW81XN5CACrSAW/jlz/HpInhg5sdrh
         bxwxHDe9yhjPrwDKV43RULtODCj4OMRrvU1yRI1ZJMxIsw+BXpVWMPqYJFb22V8m485Y
         GqE2eZ5Tu9CpnopMzzYlmOUz6a/msojY7KjbSGW//8gG1NGH7MnSpudzXNOPbbhK2z4v
         PKKy7Z8OO1BUhn6Lcp2EfnX9R8TeNyKFfZspa7bQqvavGq3w60nobNZ9jEz5N8x9xAXy
         2ZuQ==
X-Forwarded-Encrypted: i=1; AKwUvBw00LBlaq4IkN2xudbvqTKBEaDqFdA2Q0iYWuscbTulpUX4HVVSDLJUToqvPUiaAafK7/aBUyd90B8n@vger.kernel.org
X-Gm-Message-State: AFuF++lrAcdBrXtDjNmbYqxAyLDchkPy7yEVwqXLtlUemwv1oZ40zKgQ
	uoJVdygW89XM38myGxFQeNsfBHtzqdSaTLQPQyOLJm7xp3vHs0+WsbXpQDzjXwVkvv4=
X-Gm-Gg: AYBFou0pXl9JWWN3f9XAp2lzwVcV/3JKAFXL9KENwPj3yuFTTgivM/FFYiDtckzjjRO
	U6ai6e/Ej4o6SRTcIX8KSFIqs/wgJfb/GUPHKbriPk9fSRJ/9BKdR+RqnPypeAuYQ/XRy19Yfr7
	2b0OdUjpbOGzvYm55DvwRG10LSdT9QpIxg9FoM6/1E7eBDZ19Au3HHbvq3UMELk8s2fd8ih/Ymv
	7EMOUTWa318OMwMsGC6+gixfpsyIa3RhukjesZUVw3BR4oLhEZsoP6E+QEn8ji6+4OXfCj4zYIo
	Yjw+vbUY/rCi+PqXI1SJkprXjg7BTRHMiIpR8OiOJjEPvIgXP/n7w+WmHx1/fCn2fwpietl7KgP
	mIuWVn9Y7su8OJJE5ua9OMy746c45cdp2asWyedxCg/s+W3PtlEYrnDrHBt9r6e91ZkO8zwaIDS
	z8Xw2mSmH78iAkpN+34alRX2xrXX9cqJIKUBx7mqgD6BnqWvoAHAc7cvkalcF3piLATripyxaT2
	Rm70EJ91NYKpSHnib93wHy6c6nEAEFpAoui6ymjJCc34TB7TmHK36VpJO+1Eg==
X-Received: by 2002:a17:907:948f:b0:c26:1648:a060 with SMTP id a640c23a62f3a-c2a15e0fdddmr1199501866b.27.1790083675881;
        Tue, 22 Sep 2026 06:27:55 -0700 (PDT)
Received: from ?IPV6:2a01:599:842:c46f:7b1d:31f2:7a17:2f4c? ([2a01:599:842:c46f:7b1d:31f2:7a17:2f4c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c54f249sm85420466b.21.2026.09.22.06.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:27:55 -0700 (PDT)
Message-ID: <968796d6-811d-434a-a230-f05da451252c@9elements.com>
Date: Tue, 22 Sep 2026 15:27:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
 support
To: Prasanth <prasanth.padarthi10@gmail.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, ryan_chen@aspeedtech.com,
 billy_tsai@aspeedtech.com, andrew@lunn.ch, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
 <8cb38ff6-1210-4c5a-b0bc-b0b50dd2b9aa@9elements.com>
 <CAMFFDGjJcmpaQYHe=F+jpstbdk9-uXPKkBxLkJqAJRiyyTkBvg@mail.gmail.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <CAMFFDGjJcmpaQYHe=F+jpstbdk9-uXPKkBxLkJqAJRiyyTkBvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 3:26 PM, Prasanth wrote:
> Hi Tan,
> 
> Thank you for catching these issues.
> 
> You're correct about the defconfig. I used `aspeed_g5_defconfig` for
> the DTB build and incorrectly reported it as validation for the
> AST2600. I'll rebuild using the appropriate AST2600 configuration and
> correct the statement in the next revision.
> 
> I'll also carry forward Andrew's Reviewed-by trailer for the unchanged
> MAC0 and MDIO nodes, preserving the scope of his review.

Andrew has already resent the trailer, so no need to send another 
revision for that.

Tan

