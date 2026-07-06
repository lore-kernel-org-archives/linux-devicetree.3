Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B17529D268
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 13:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344852; cv=none; b=eqTaC8W2LK0jl/PY0TgORRywCHHXq9ODObnB0K11UfMtpR/Oqi1GZdq8lP4aa4oyB9uH4Pb2k0oovVl4+hzYGEkxlT3BkAn5NGgVmcW7BNkiKzw/jQDSYTlehFpmGstmf4BWjqToktrXtl/x7/bK4sIw07ZQdIu4MUFoyO+2y1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344852; c=relaxed/simple;
	bh=dOZOfz4GEcL94TAWHHP3lq/FSUgOnvQBVmqjHjw/D7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V+MxyLYKhP87jYLX8tRqT4pWZRjrQDO0WmrxcmJ/pJvPni6jVxui7c54IbzJwbuNBhKFTUPZ7CYn2h6uc4AB/Smd4yiWfWmCkn0JbEEvzCjIOeHOX/C0BIi+89k5p7i0xUoyITBGlehvzcyc0j8ISVPfy60tO/Y1mr6k+uZTOh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YxSC6EbQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iRnSB55V; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YxSC6EbQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iRnSB55V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783344850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3IUhPhmdKFY/hvP+RYH3Pc2WHx3JLJjsr6cul6j9Vdw=;
	b=YxSC6EbQRyassKLh4zE3VIKFri+ZHEXE43B1tHD4Gc0/FH14gZOsUmi42cSPBJtyk7z35l
	QXRFcto8ZzOVQ8kpJfUKkAe0m47ZkGIiKBZjxwy/cnkDymS0+sJhMQT4T9lyvFj83kmA9/
	zWBBX7CGhPVTsr9Weo9651PcGP8efeY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-UO891fQEOuGBGhQwi6KXgw-1; Mon, 06 Jul 2026 09:34:09 -0400
X-MC-Unique: UO891fQEOuGBGhQwi6KXgw-1
X-Mimecast-MFC-AGG-ID: UO891fQEOuGBGhQwi6KXgw_1783344848
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-493d88406cdso10769485e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783344848; x=1783949648; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3IUhPhmdKFY/hvP+RYH3Pc2WHx3JLJjsr6cul6j9Vdw=;
        b=iRnSB55VG35RyGt1WJPF9DrYaAn9a+ZrDlywdWEYetUbvRPf5om0PqyEi76GvwQ1uV
         PFxKQep1jJ0KifQQX8X/AkofU4UxTcwj8bK1TviuV1SId3JVDG7oYUZAjNhmFwBTmQs/
         Xw5N2Dxv/jixEPQUnKO0z8eucI9s3i6Nr1QQLX6uS3jCQq+YMGXnmlGZeMn0IC3Ip8Ib
         0d2NcRjUl1lOPiAdaJuqfe972aomzW9S7x4Qe4fF6BKMzkJhUbkOAIyQKtKfQwcjQ5wM
         64y6cA+I7Hf+C3YTQlo9n2/oXyeTdxEpjGFLTITY+e8BTqSevHK+KIlG20yMseHL+T5L
         QsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344848; x=1783949648;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3IUhPhmdKFY/hvP+RYH3Pc2WHx3JLJjsr6cul6j9Vdw=;
        b=G9uRZJNqT1A85n4Bi3+1WfxT3cPcF9pHeK2wkyShhowu30h9syqY4E9Ow01xIxBNHh
         t7C2Mj3VJJ15mgsbFlYyKn0h0BQwqGJGNPreH4vYM/dc/8GVGeH7PDOg3BHhp9qemsQD
         qFv+CUMOIj2L/lfWrpBz4JcHnq9eOlXPZWY5GVCszxrYbZoJikiTHOlud3J34msk9Cto
         gVyc3XIgvBP04UoQAVuJsBC5ZZyjMz1E2cuy6H2Ssy9rZ+2rhcnZ+J3yPdKrbpwOKevs
         ROnzCf6Z7+qoiKpxZwD0G8JluFDYSTxBl3t74m87mPl+JZtuqFBAeZF8PMqJtiyqwRdu
         meUg==
X-Forwarded-Encrypted: i=1; AHgh+RqWL0Y41YlFuCT4fOJNubGRqjH5NpP/w2iD44b6lod6Y4cvEU4UHRmHxZwA8opYt1xtvUs5ZO3MEiwv@vger.kernel.org
X-Gm-Message-State: AOJu0YxMS7TpVJoc5qazxQCk4LhlXTWyMiy1Ka2XGk07DM+wiRGHZkJu
	FoVZBdM0VUPPiGB6FE7FKSqUKHD86200DVbDjPEYMQWja3tSvznXXK5K+6B6IGuoO7lSak1nF6s
	ubhwH/DBPxZSShPkmLiBOOVQbYSYxNYj0x/9g+kpWo2OHzPUKMHAPy3Ufl6v8BZE=
X-Gm-Gg: AfdE7cmZnuFZiFGG4rbSyxUOAzaWBsfid9+0ft2vfzTaNOFPVMTxmXJ7Y3RM8FBZj2L
	+aVHR/oOrpcaqj3gFQdGoL6B5hiX6UOQ3Sdto8exvs9YwcftC7Xgq4eAVpnvyAXaIKwR9KCrOi9
	2qRXFPbhMTFAOyO97Yjewq132/NHdjXb/8iklS282saN/gM+j8cBfd2XQp3FSmf1+XW4l4R1Ux5
	40+07ijbJll6fVpEu+fiJY63jPVY4XCd6M9WJsK3OKipoza42z3Mk2KPoBmeSBMB63IlXiKMLZI
	CooEg1T1N2RCr3yoNk9aOBm6OI3p9ICaT9nzc6Y7BV+4gqE8H0ws7yR/VTZeRlKSlYlBWrV7Ain
	WHe15YDsdaiw6Ci3YNkTHmoDuLVluEe6OCj7irytfSdeYQ5BJilBJZJnuYlnyCY4oCDAZh/h80j
	Dy6LoProYs17vN
X-Received: by 2002:a05:600c:6085:b0:493:bc97:916b with SMTP id 5b1f17b1804b1-493df0929f2mr5699515e9.26.1783344847678;
        Mon, 06 Jul 2026 06:34:07 -0700 (PDT)
X-Received: by 2002:a05:600c:6085:b0:493:bc97:916b with SMTP id 5b1f17b1804b1-493df0929f2mr5698905e9.26.1783344847212;
        Mon, 06 Jul 2026 06:34:07 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm357583515e9.2.2026.07.06.06.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:34:06 -0700 (PDT)
Message-ID: <b95dda96-ee50-449c-9d23-3de490d3ab1f@redhat.com>
Date: Mon, 6 Jul 2026 15:34:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 6/6] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
To: Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ningyu@eswincomputing.com, linmin@eswincomputing.com,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
 pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
 maxime.chevallier@bootlin.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, weishangjuan@eswincomputing.com,
 horms@kernel.org, alex@ghiti.fr, lee@kernel.org, wens@kernel.org,
 lizhi2@eswincomputing.com, devicetree@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, netdev@vger.kernel.org, rmk+kernel@armlinux.org.uk,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
References: <20260630063123.1118-1-lizhi2@eswincomputing.com>
 <20260630063445.1226-1-lizhi2@eswincomputing.com>
 <8e5eb97d-dfaf-47a1-8572-b3252a2c7ed3@redhat.com>
 <20260706-confess-dagger-e60b5fad57e8@spud>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260706-confess-dagger-e60b5fad57e8@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/6/26 3:21 PM, Conor Dooley wrote:
> On Mon, Jul 06, 2026 at 03:09:37PM +0200, Paolo Abeni wrote:
>> On 6/30/26 8:34 AM, lizhi2@eswincomputing.com wrote:
>>> From: Zhi Li <lizhi2@eswincomputing.com>
>>>
>>> Enable the on-board Gigabit Ethernet controller on the
>>> HiFive Premier P550 development board.
>>>
>>> This patch is included only to provide the DTS context for reviewing the
>>> binding and driver changes in this series.
>>>
>>> The upstream DTS series will be submitted separately after the binding
>>> and driver changes are finalized.
>>>
>>> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
>>
>> @Rob, Krzysztof, Conor: I see this patch is not listed in the devicetree
>> PW, but I think it needs explicit acks from relevant SMEs. Could you
>> please have a look?
> 
> We do not typical provide tags from dts patches, but that's irrelevant
> for you, because this (and effectively all other dts) patch(es) should
> not go through the net tree to begin with.
> Instead, the platform maintainers should review and/or apply it.
> 
> Additionally, it seems the contributor's commit message suggests
> that they didn't intend this patch to be applied at all?

Thanks for the head-up.

I noticed a bit too late that part of the discussion about this patch
did not land on the netdev ML; a new revision is expected.

/P

