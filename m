Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D27B349CFE
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 10:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780309828; cv=none; b=qkzGzE1dR9palyepErGK8TKYZN3qkzQGh1HjgvWccfYD43S420vgpTxVfOyzCuUKs+vas6mu3st92og3T/NtMXe07KvAECdx/gWa146ZF+eGAd/OT4eoZREZnzlJSoGDC4z+CFSwtH3XhkUPkRb52hRVkngEkESGxZ8OmafSzc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780309828; c=relaxed/simple;
	bh=MBwOgbgAEgMPfLyydXuXFSj6sMutCvNP/2Fnwvx0eiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nz4ZSkopkuWyjqry2ouo3D6BrE8tm4I4o2HuqkHvSMZ9Oj7/zgbslH2RBdcSlNtbXqyS5V81J+GaY4KY66xB0kmElVpzTakkPGE0Ql6dxN2CdLAIJnhPOCIiRt0nW/6Q/cn+v88Jmp+nnPt3K6fmE2qBxMBNZ5nVb53bJQSez9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fe2QPHrk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lovjWF2Y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fe2QPHrk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lovjWF2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780309826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y62kcYp7lTf6WUC3Smiih8ZORr7i9aLk8qruViyqnYg=;
	b=fe2QPHrkCb5xbqYzVzrGTjST0p8xSet8jM80oELwjk5vo7ulJ0rOM6KA2tseXzATvXPJ4a
	TmmT0TBSvrLImbHpFpHG1muq4R2F5t2ER3UgS0dgud6dXCnC0S3pvUZbjpv+npBQzVhCi7
	jeUH6+uGU8LuRviK8QwB/D4Lh1Xs3t8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-ZQqhSlaQOa6eh8XbSWBUAg-1; Mon, 01 Jun 2026 06:30:22 -0400
X-MC-Unique: ZQqhSlaQOa6eh8XbSWBUAg-1
X-Mimecast-MFC-AGG-ID: ZQqhSlaQOa6eh8XbSWBUAg_1780309821
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-45ef6417092so1570187f8f.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 03:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780309821; x=1780914621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y62kcYp7lTf6WUC3Smiih8ZORr7i9aLk8qruViyqnYg=;
        b=lovjWF2YQIWxwd1gfh1EQf+dR/fXlLYT3gpzC0yI5yVJLHa6SvCtOutE8HiBz3tDfj
         /YIdQ947F4Dy2Poky7R6eOhyPA9cB3+a6gTLDEgX7UnfJtOM7Dy2EXdizwuOI8PA3k4H
         V5lXaQqjC1qzoM9Sfq0LRek1b++fitulki+RDPm+FJrByn+M1SERMMTw8cdc2pZ+wuN1
         mSC1fFro8uYNktAEYxewj1NZF2///4K+4ef5YcKFnkCEL93VkiWOehqPvhPDAzn3Rd9e
         qEUvUDNI+QEyVLuN9LXm11jZAm7oA2gm2meOytMLSVV6wye3FNdcy/yY35qtBvTZsxGn
         +rqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780309821; x=1780914621;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y62kcYp7lTf6WUC3Smiih8ZORr7i9aLk8qruViyqnYg=;
        b=BlASo/ejpu92ZnH9xMfOpEp6d7Cy4jqpizFt3mThicf5ivGj/IS89Ea0Uvm5nNfqFr
         tRyVOOXphr9/XtVc+C6tqoJGz4dR930RR9QvHWKlX+e2EpZdy9UZMttFhkBsixWQYL1H
         F+76eq7HLSmeMWz8mexpF+eg1L0UWQnLvab/bIGZRBaUBPHuUQBiyrZZ7L0V16eaIvXM
         rbdCXBQjAGMEtrEXMgotTcejgin+MogGu9Lj3T6TcC9hFg6SbCU7x+VJD3fbhPXonk1f
         0Hpk4d3WHBDLh7gNaEOeAnDKA8v22+W/HAIrxCymhngRgw15ayZ96yYyQuKwGY2wzwnQ
         TXDg==
X-Forwarded-Encrypted: i=1; AFNElJ9oIoqGEeO491wJyDr8jRAwFCGnTWhLnSvt2Vcyj9RADkiwNa9AK4h0TefIOC3LV7p7fMqg0Fv00Qb1@vger.kernel.org
X-Gm-Message-State: AOJu0YxnVHhw+chIemEiPZz8L63KWHxwmy29vK+7Xb9VkkSziEBa6WSN
	wyIiRxY7nf5TsVkeABB121hXWvBXuz7ZJRMeeWvtYhTwUEv1svGSgA1yEkvwcD38iQckt0u2OrC
	difEV17k6TwLUJ/e0GK4/Ge97fxnkdQevMb4+wwNt836tcBRaVDf/frnllxS/Hl0=
X-Gm-Gg: Acq92OHWd2dPVTrEfNvYqPw47maiZn1t8DHY1uSBzD5uoo2xSPkwAbeSbZIQGdO6tak
	yrJkwCnZBUhRSleQJ4Nw+t+CeonXPO1xAxEqwQEr/9vp9TEvr5btd774v+rOlqFI+A2mr6vi551
	KCLlhZUQHagSr27YMXk7XyElelgjEq/7foJLAp6WSFhTwbOQYBP/pO4FQs1+RQJxUH2wqbjaATu
	Q94aYWQS3FWgK7ocyBsMQRvvc36+rqm2ooUyprm4dCq+aWlOxG6duNRoMWIN+aCNRm8YJO6FTR+
	MAlo3RaZPyQnIAAm4Z1JoK9qg97swT3NVOdgSMigVV18HLCkxVau3cRUOC6LNuou7fwndZ+7POI
	TV4r9d4mSyC7oaImg5oaGxeUmrn5+xeLaHi6TOA0s2o91vIqbiU6XMrfSHMhNbhapwVtK
X-Received: by 2002:a5d:4387:0:b0:452:bc55:c684 with SMTP id ffacd0b85a97d-45ef6b5a7c6mr14476373f8f.19.1780309821501;
        Mon, 01 Jun 2026 03:30:21 -0700 (PDT)
X-Received: by 2002:a5d:4387:0:b0:452:bc55:c684 with SMTP id ffacd0b85a97d-45ef6b5a7c6mr14476319f8f.19.1780309821038;
        Mon, 01 Jun 2026 03:30:21 -0700 (PDT)
Received: from [192.168.88.32] ([169.155.232.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354b7edsm24174472f8f.22.2026.06.01.03.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 03:30:20 -0700 (PDT)
Message-ID: <a4293c1e-88ad-4d95-bf03-78923660a2dc@redhat.com>
Date: Mon, 1 Jun 2026 12:30:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 3/5] net: dsa: tag_ks8995: Add the KS8995 tag
 handling
To: Linus Walleij <linusw@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260526-ks8995-to-ksz8-v3-3-c530f651989f@kernel.org>
 <20260530004901.49E6C1F00898@smtp.kernel.org>
 <CAD++jLn8LD9nnUg4emLDLJ7vdF5x1gOZzowfnsui+KCjTVEUew@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <CAD++jLn8LD9nnUg4emLDLJ7vdF5x1gOZzowfnsui+KCjTVEUew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/1/26 9:47 AM, Linus Walleij wrote:
> On Sat, May 30, 2026 at 2:49 AM <sashiko-bot@kernel.org> wrote:
> 
>> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
>> - [High] Double free in ks8995_xmit() error path when vlan_insert_tag() fails.
>> - [High] Double free in ks8995_rcv() error path when skb_vlan_untag() fails.
>> - [High] Undefined behavior from ilog2(0) when receiving standard 802.1Q frames.
>> - [High] Failure to push non-802.1Q hardware-accelerated VLAN tags into the payload.
> 
> I have already looked at this.
> 
> Sashiko is missing context, in this case comparing this code to
> other taggers in net/dsa/tag_* and realizing this tagger is doing
> exactly what other taggers do.
> 
> If there is an issue with that there is an issue with DSA tagging
> in general and not with individual taggers.

FTR, I agree with the above. It looks like sashiko is consistently
tripping on this pattern, so I'm wondering if something at the DSA core
level could/should actually be done.

/P

