Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA61E3C0611
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784623985; cv=none; b=MOj3IVTe+SgvaIwCf2k2aozbkIccHUPmnkj1aOwO5wPELBD7+//0jW+vbZ6XUNMxeXLUqehJPKPwn4U4HoQoQFHketv0gD8akxQIJ5pEsw/YkKvM2y5YFO2QA0F3z8hRPeyidDZz9/SyrjaTyK3MLchyksWfp2vtOvNz56Oyvhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784623985; c=relaxed/simple;
	bh=1MHRIePTbHHk9xjWYi87u8AUAEPnxZmCw9kRQrxCc/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YFP4jUnsS2SvLLdpt+j5qqiLM/1yuQkIGqy3+/c9DWHNGCeuu7+eWDdWVHbq3FlDP+sPU/vKaWf/2xdRFHUw4j93zcIcj63ELbh4YDwmz3n6suyEzslTIC9GrBMZSup51EYgiSrl0/Oj9qD8MkuDurh2z7D8Z6r/blkGCh1W55E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SXMdEDLk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oL4BLraz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SXMdEDLk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oL4BLraz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784623982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=motssK5KBh9ULfnUG/euYaWhuODun2kccAtLo6xRXEw=;
	b=SXMdEDLkAYaeqX2bEGVt4MxCQjHAgEpWZbbWYw0oVd5VW0E3INk1c66e4OUjH6Q91GW4Y1
	SvKB88o3bZzA0P/VbXXS1bOjnm5ioFmWMwBuKmS1oyBd1NaB2Kcx6Y3Z1Sses0D2rqn5Kg
	WZmV0nApoMqqk4N1hLTXPXtmRCcbM9o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-BVbLaCYyM2egejhqGofngw-1; Tue, 21 Jul 2026 04:53:01 -0400
X-MC-Unique: BVbLaCYyM2egejhqGofngw-1
X-Mimecast-MFC-AGG-ID: BVbLaCYyM2egejhqGofngw_1784623980
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-495517d39fbso16872165e9.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 01:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784623980; x=1785228780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=motssK5KBh9ULfnUG/euYaWhuODun2kccAtLo6xRXEw=;
        b=oL4BLrazkPAuEUYGRLa5AFFm+2RNBSIRl7r8e5KienT82BpkqpLZbbOdnyHEVQ8fJX
         lxpE2X2o/WNbq+AIQ9Hi15X/m4m1XXWVjRkXhfbNj69lULVl+mkd4TT6dxJDU2ickzTF
         GflATpaE+nFPIPukYESqJuQOVy1hSQu1TbjfeFjvrVaMzGfYcVZxCe1088kUrLPAtSFm
         Lf6znKPKbUyX5CKjrO0WCsKysXDuDapjYLsUXjmNm1cJDL/yxOKTvcf07KuZ3Oulgi24
         VLvzkfGpXwTLK2TOcPqmRuS2RGtA9H9go2q0bx4D24i/3sR3C4z3INDjBv6V6n1nKJoL
         qhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784623980; x=1785228780;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=motssK5KBh9ULfnUG/euYaWhuODun2kccAtLo6xRXEw=;
        b=bV487uHffAE2K2AuVFpCVdm9fIy6JXmU5LZv2R6c9hPWH0+uybc2DpCehhnPfBvvCZ
         025jEyVV0QXYaEjdISYbDzr91ojEQc1Wsh97gV9QfToXxsqMz6svZxnRxl5eKI1ruWnb
         VOzrkUm6o88icMU6QmZuiuviD1GrQ+Tl+tw8ns1wvRG7aes73QcWKaRipyzBnqXsle0X
         bU4mvrvIQCNdcgt6BwB2icZPVIcKQ9ADEBdk5ZPbPCwdTdXUAUPevmXll5D3SrJTbb/y
         49fBshHO+8CyjOCcqaNzbjxzVETzBie56fWd7gBWLwVWGGVrpWnMb4ObILDV30MPJMkC
         B54w==
X-Forwarded-Encrypted: i=1; AHgh+RqjI8GNmvxUnghGdNCNR7urtdd/MuGcrfsxhsbJfjzldmBaEYmoLO/CdFV4TeHZUbietoRzf31D0Bq9@vger.kernel.org
X-Gm-Message-State: AOJu0Yyeb5C6oGLTUfHUie8kgzqSapmKgalRkLGLfY5n6n2uiwSsQjko
	egyNzaYHjyvND9tEiU3Dqs0ckrli+mNipq4s6IxRMKkJ/CSOBl+P/tAafr1s8cMdfnC8ObNdWeJ
	QFi4kKbBa4WpugKLgEc85knOEFnEaw6LLEFSeIUxvVFiQsmfZHcUry5RLrfk6Xss=
X-Gm-Gg: AfdE7clj+k7KAOv8PxD2ihOKqjNjZgdGHGKC7p1kPIbZE6GUBAXuImGm0yeY7kffQx6
	tqJQNHqDy4qH9L21rIi+39BYxilqMx/iDEvjGEBzuRxmOGxGglKMoLwi0GGmgQN2m5DQddUQhyt
	sACSJF2WBIxuwc2kOwV8AWhkEeHukXauyGHleyO0ancLxuzkUuclDo9R34vR/aPuCbZZlY8RXs6
	7x1/5+NFR8tiir/pycKK7mkMyPpgYQldPR6Z8+HTc4gVAmPznpRhF8wz/EchTV4yUox0iQh8eFY
	nox6/6vR4g7hgkwk5OYVyHukOS1qhJQ0KtU+L77GbobPDs6lyFfQDVo6KUk2JdfxTsWj1rKwt4p
	xF+nTK0WgsLjqOMQV3ApfcLOggio/sO1ivo5kGVVRxMe3wSTGR7e3trqnJFn9Qs1+VVSfPtdnGo
	pEkg==
X-Received: by 2002:a05:600c:1d1b:b0:493:f7c8:eae2 with SMTP id 5b1f17b1804b1-4954a3db7dbmr188111685e9.15.1784623980285;
        Tue, 21 Jul 2026 01:53:00 -0700 (PDT)
X-Received: by 2002:a05:600c:1d1b:b0:493:f7c8:eae2 with SMTP id 5b1f17b1804b1-4954a3db7dbmr188111425e9.15.1784623979848;
        Tue, 21 Jul 2026 01:52:59 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563969482sm145264925e9.3.2026.07.21.01.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 01:52:59 -0700 (PDT)
Message-ID: <4793fa8e-36d0-48fb-95a4-f22549b5e1cf@redhat.com>
Date: Tue, 21 Jul 2026 10:52:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 13/13] net: ethernet: adi: Add a driver for
 the ADIN1140 MACPHY
To: ciprian.regus@analog.com,
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-adin1140-driver-v5-0-4aca7b51a58b@analog.com>
 <20260708-adin1140-driver-v5-13-4aca7b51a58b@analog.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260708-adin1140-driver-v5-13-4aca7b51a58b@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/8/26 12:33 AM, Ciprian Regus via B4 Relay wrote:
> +static void adin1140_get_eth_mac_stats(struct net_device *netdev,
> +				       struct ethtool_eth_mac_stats *mac_stats)
> +{
> +	struct adin1140_priv *priv = netdev_priv(netdev);
> +
> +	scoped_guard(spinlock, &priv->stat_lock)
> +		__adin1140_eth_mac_stats(priv, mac_stats);

I understand that past reviews suggested scoped_guard usage explicitly,
but FYI this is not the netdev preference, especially in trivial case
like the above, where it has very little - if any - advantages over
plain spin_lock.

Not a blocker anyway, just a note for future submissions.

/P

