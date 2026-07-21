Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477F63BB120
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784623576; cv=none; b=aBkNj4DrgzRPJQ0P+kAlzVYA+coRkXKpQJ50Kdza+952QtkGnC+h94y+VOAw8I+0+iWVSVgxrZeLcWCAw/DOf0/jxtk5dukeNxSXveONNirs2FOxaPlun52UURKd7yLb1RweCMt+3R0p44np2nx7s7R3gWmXBviOBtrZPIt6elI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784623576; c=relaxed/simple;
	bh=YuamI1BxG38RiHIYx/SIZEAvWsuh5tk+e8yJqhhWbvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DrX31K8rA7bvKjvz8Zyv1ZzEcvH8HDbjQrD0pe3k4cs3QNff3itBS0/nnWqTYstbwCOINEY6htZuq9GXek9zZPld6yXYQMMQ2awiMC5TQq6luq05Dn9/R9i9jGpkAkfNjXT1LgDnLRZycn3nL8RcfStweGYgbYmM6fyzjmdxT9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W4W98tK0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=W3Ly2wwo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W4W98tK0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="W3Ly2wwo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784623570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j1h/8U8rGpm6km9e/8IbvCjZFi5T4w4REAp5AhAlIpE=;
	b=W4W98tK03xaFIr+qHus0bOIUQvGi5WFJM8m+p8KLYIGSS7EaQOtAi2+KmDK6Bydxg6v+ev
	dzjPIxppf+krsDGg/CNXYTsyLhIODt/NJcu+uscw+HAWL2q1Yf4Q94DnGPK5DE3EjboJg6
	p9XBVOy7bu9u7kvo+ERcQXCgyxFVudY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-5isbhFyHMBmcHtyaNwrj-Q-1; Tue, 21 Jul 2026 04:46:07 -0400
X-MC-Unique: 5isbhFyHMBmcHtyaNwrj-Q-1
X-Mimecast-MFC-AGG-ID: 5isbhFyHMBmcHtyaNwrj-Q_1784623567
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4926fa2cb17so33281275e9.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 01:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784623566; x=1785228366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j1h/8U8rGpm6km9e/8IbvCjZFi5T4w4REAp5AhAlIpE=;
        b=W3Ly2wwooicru2zoLyt+mIu9plU5QtHLTq4vhGYoypG4d8IVmd4nagqhuJ1+f4zVeh
         AFHBr+KzzsTfcV4SLNgBww/6Lrfp2jQwIfwjoaQKosFgWxZU509pfRinRXFpwVX46RSL
         IEGphSXqSywsIErBm2zmXVXeLBaplLTCgb6UGkMI2iVKCZA6VMgmT4M5CR9CVZx5ENvU
         w9vsP2AS65Hm1QWrY+pk/8HTUS+j0WM3+AMkqQqfuGikfHuvElZPTm+VbWMFBWwaVC6z
         W0dt5G+MdZ73nsmIpJc2Qt0/UHBg/qscD7kZHbPCtCLIg8HRM2uK06FjM799KoX3Odck
         qorg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784623566; x=1785228366;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j1h/8U8rGpm6km9e/8IbvCjZFi5T4w4REAp5AhAlIpE=;
        b=pd86JTCfKrMzCQaesdy7qDqRNPK2Obw5hOswbuczioLfE6uO2UxTRNKtvgL4KMx8tr
         9ngBFEjHbcviby0ObB9TXYft6i5SD4uFm7x4WJYyzsBzMvGSHynJE2lPnbvrk9VyhIR1
         xZfe3KLRy804pAwnkZTLAihmOFnALFt7+qKY0zoQclSaV2cTjXBzefqscyq2j+JeySCW
         wEbweJn5Ee2nfFzd9lpoTrtC5vPfS1I5LYD5WkXrHsudmVg7iWjvMzZR3YpVhfuf6TsC
         aeamEah5omnQjTP7/bzHpvFso9R/ayvAlu6WcLOr2+cIQqHLeFSS7K17OTFmvZ+BJ+Kk
         chhQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPlDk1WmgWNZIvdGGWRKC4G2egDJEO5/yBZMBT9MKZwzDUSmRnfgwNVu4BTuJtDw8bV89GdtbTNXzk@vger.kernel.org
X-Gm-Message-State: AOJu0YxaLOD0z3sNRSPSUemqw1DiIaMyJK73kDqmViWuWzP8I3Y9DEFt
	JnESO9DkUroepkDXleZtxGfBGk1mo6toNBlVKkZnPyDdIi/MGyqoSM8b/UScJ+4/Bl2HqK/491Z
	KdBL5fDe6LGu0RrjVAdarwaH1fiiJ0tjhn2NadRalO+9YjyRsYzJyCq+XlrREJ8k=
X-Gm-Gg: AfdE7clA9tPFjavVpvq2dEca+gkcw3gOziMLATNSjVXne6Arxy9QP1tL2Rx9ZMJtr22
	GryzztyenkMIozCLOZlJ5isdziPcEXb7vsPmrHDYAOJhKzOvkrBT5AgzduRlDpQ4zP4Az9tup1w
	EHGlExaJAiL6Epjb95OekDQfPiGrwgQRV//loR4mG6n55WOIiYqKQk5QWE+MHQPb28Ge35VMag2
	EqGLaqKyzuLxcBMEDeRyFryDt8rGE3S05HRhcYExu2lomxbX0pGn9z9JvHDVv3vP+XuL3XaoPu5
	tnOVaBFAUlH/PHkA0/cGWRRMZyN++L8Mfxoam2yLuIZnj7glD82pnODEbVu0ev38peaHWttyw3G
	QemhqESh38a1VpOVus2YCIFP8Qpm9qSPrl5mS7v3vCwnv5tl9/muez2RzCLYGTHRUwsH1YhO+1O
	rn2w==
X-Received: by 2002:a05:600c:3485:b0:495:6193:c6c0 with SMTP id 5b1f17b1804b1-49561a30bb3mr70804985e9.18.1784623566647;
        Tue, 21 Jul 2026 01:46:06 -0700 (PDT)
X-Received: by 2002:a05:600c:3485:b0:495:6193:c6c0 with SMTP id 5b1f17b1804b1-49561a30bb3mr70804755e9.18.1784623566185;
        Tue, 21 Jul 2026 01:46:06 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm227108515e9.2.2026.07.21.01.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 01:46:05 -0700 (PDT)
Message-ID: <4793400b-958d-429d-b2db-d39b7d757338@redhat.com>
Date: Tue, 21 Jul 2026 10:46:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 10/13] net: phy: add generic helpers for
 direct C45 MMD access
To: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>,
 "ciprian.regus@analog.com" <ciprian.regus@analog.com>,
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20260708-adin1140-driver-v5-0-4aca7b51a58b@analog.com>
 <20260708-adin1140-driver-v5-10-4aca7b51a58b@analog.com>
 <CYYPR02MB9828A0F83559EF025D01A14C83FE2@CYYPR02MB9828.namprd02.prod.outlook.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <CYYPR02MB9828A0F83559EF025D01A14C83FE2@CYYPR02MB9828.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/9/26 4:29 AM, Selvamani Rajagopal wrote:
> 
>> +int genphy_read_mmd_c45(struct phy_device *phydev, int devnum, u16 regnum)
>> +{
>> + struct mii_bus *bus = phydev->mdio.bus;
>> + int addr = phydev->mdio.addr;
> 
> You may want to insert the lockdep_assert here. That'll ensure that read/write APIs are called
> after the mdio-lock is taken. Andrew's suggestion.
> 
>    lockdep_assert_held(&bus->mdio_lock)
Since this looks like the only pending item and has no functional
implication, I think it's better handled as a (separate) follow-up.

/P

