Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F503FB070
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 13:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802398; cv=none; b=QRokI1Xw0WJZn5kmIj7BaPYtf5gN2UPObYLakylRUPxHMsIBw9byQ6Gmah2FMYy4YBr44qbdS6y037VyThciuAwwxuy8G5YE3WfDNyIUfUe3w8P6PFezkCyWioLmvtOlMlpqkH9TvRY0rn3nNASF9vP0ElBpUfy4iDNILVVkutU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802398; c=relaxed/simple;
	bh=RwSgfu+aimDDshn4/Mvmy5847N692TWKcIF/53HFfsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=quwA37EMRuvkjvyWP9mAETocmw5ZqFsIqqiVxSPKvQkL3jkBaTNTU1tvmuVh212EW/BtqeG1wZV55tjNJqIWYjikNyk/SkFvqbGaFv2iRuVh9FBpRnsycxZaQyiDVI5j30JmDLaztY7WCrDsSxLnBVgXd3pLRCOqURSZsWxapA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c23KoPgu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jkJ3tsNw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c23KoPgu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jkJ3tsNw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779802396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LySWU6z4ou6sFqqDsgWsKWCcfiqiidI/mEwHVACYugw=;
	b=c23KoPguu2WrhzXj0q9PDo/lq2yGKs9cXpNlrZGI7bGVkquCYY/sD7Wh4k2+YoZGqtKmwu
	S69yjzESB7vzduilVnTlfjQd1Lbkq7OFxkPkvzyqGMCeg28QtUBiWkKoD5bLzxRBXE1dag
	V2Fu4zMaF9C8rYCJ01T1NUx1Xt/uX3A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-cavX7iRGMR-HsvqysBGMIQ-1; Tue, 26 May 2026 09:33:11 -0400
X-MC-Unique: cavX7iRGMR-HsvqysBGMIQ-1
X-Mimecast-MFC-AGG-ID: cavX7iRGMR-HsvqysBGMIQ_1779802390
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49050c44bcdso41594025e9.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 06:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779802390; x=1780407190; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LySWU6z4ou6sFqqDsgWsKWCcfiqiidI/mEwHVACYugw=;
        b=jkJ3tsNwwKQekizCCJOgHjw7qdCMFFd8XrhancNI1TKv21I8fEGwllmMGeIZMZ9TpH
         I8YNXFp00seBEO3wSVWd37UXuKM7JMzb5sR8sw6rO2F9/Egx1NR0g9kq5kS9Ib5wUHdS
         eFnKsuy7nJ/3PaD1jFVfKXXZMRnjsc13XSiD3boFz/v2Pc3biIDnAKsnTMEahmwh0OVH
         n7fkSvuuwaBxumRf7fe9eGogv6+6JL7iHzjEVmCmAjs+ZW2SF1S2AKfVTjXh+VV8J5xT
         O1xfM2z3EvsWVw+9napwBaJpPmgyABOhdf3gP7LxMt+6jxUPbV4pfj78EsdJ82OsY9MN
         6zzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802390; x=1780407190;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LySWU6z4ou6sFqqDsgWsKWCcfiqiidI/mEwHVACYugw=;
        b=m6RIG4YuthDkywN8FEG2Q6pSaEbG7MDFi95ZwJ8uvi+AMj9WzBXSX3C06akiaKE/gg
         ACXzeMAafK7OYwFGqe0FGa6NdAiGlIbTrAGgfrXjCMT+FraDKVXLLze6p93baw7ikMzn
         XFJeewLg23qXP+Coqu0hg4ZVc21bpS8mfuv/sOgCdfhX1vnQSQDkvlcPbWWjZK2bpjpo
         NNcwq/BbPs6Yl8WLrmpDu+CM1bUBiWk8Xr2qUnlrFTF7HtQLYW8z4uIbTEOW6FCfX2R6
         Yo97O03IUdzNus/MNQ6zJxglH9F0N9LHFiOwCt70D5fvz5S+abv6IQP+SgFBa4su6c1z
         TT9w==
X-Forwarded-Encrypted: i=1; AFNElJ8Hxjs4b26uERTqlFRUENRz4TfnPinYxAwz7IJjaYBlcA2XYT3ww5gFDRnRoJv/QZXfl979IRfMfhZg@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc76BloQPWo2Sg8UzYEJ71qtjDGhEpcR+vj+tu3tg2LiomEsjd
	AzQ1tEOJ4KBnEazY1Vdk1FLxqE/Zk3VB++YHMzFXNt6VkwYliOs9/DXEOvP6Cyd3cpQnVG9ADfL
	QcNh6xNYMsyBDULN0k5t7XOZbdEYWhWKgBf+jG6h8fCbx39ji/n+mUkiiP0O0hww=
X-Gm-Gg: Acq92OE3IW5nlUqqQlphxHIn1psDxGN4t7kppO1gpwFJY/DEyG/3ik+BsfMOL4yjOQW
	XuINy1vGfcHbXj/eBXJv0EQiw3lQjJeeCnk+/StndoBOXEl2/PP1qHCVZpWp94Z83l6oDQxUQZm
	Qh2ksaGTfZjy/9RoDC6YX63dFNCaGrfjCG06wZU2RS1IqDP6qXShqhtTes+9dawe+Rzfb+6BMz5
	uEXgjbJtvPYtN07oDGtpxRSIaOpKGRx+aI2nMaULub/OzTplgA4qrNu5dOnoBikNNsTKP3JLJww
	emSObY8TMsSkbf89ssAeJ67fTjbxSa/G3kbVkrIZiRmZ1UkGAaRNRGjQRcSt+iq2fNYGaz9Oqp8
	wGCIuk9K1lFgkQBs4MGoUIhFU5QOYdaHwuoYXJuqcwTsBZs+AywhZ9qXJNQ==
X-Received: by 2002:a05:600c:3b0a:b0:490:60cb:560b with SMTP id 5b1f17b1804b1-49060cb57b1mr182636095e9.28.1779802390010;
        Tue, 26 May 2026 06:33:10 -0700 (PDT)
X-Received: by 2002:a05:600c:3b0a:b0:490:60cb:560b with SMTP id 5b1f17b1804b1-49060cb57b1mr182635215e9.28.1779802389499;
        Tue, 26 May 2026 06:33:09 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.155.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428e6d68sm112189255e9.22.2026.05.26.06.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 06:33:08 -0700 (PDT)
Message-ID: <a387630f-6954-4d21-bde1-68773d1228e7@redhat.com>
Date: Tue, 26 May 2026 15:33:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 3/5] net: dsa: tag_ks8995: Add the KS8995 tag
 handling
To: Linus Walleij <linusw@kernel.org>, Woojung Huh
 <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 Simon Horman <horms@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org
References: <20260522-ks8995-to-ksz8-v2-0-5712c0dc9e75@kernel.org>
 <20260522-ks8995-to-ksz8-v2-3-5712c0dc9e75@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260522-ks8995-to-ksz8-v2-3-5712c0dc9e75@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/22/26 3:21 PM, Linus Walleij wrote:
> The KS8995 100Mbit switch can do proper DSA per-port tagging
> with the proper set-up. This adds the code to handle ingress
> and egress KS8995 tags.
> 
> The tag is a modified 0x8100 ethertype tag where a bit in the
> last nybble is set for each target port.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Does not apply cleanly to net-next, please rebase and resend.

> +static struct sk_buff *ks8995_rcv(struct sk_buff *skb, struct net_device *dev)
> +{
> +	int portmask;
> +	u16 etype;
> +
> +	/* We are expecting all received packets to have a mangled VLAN
> +	 * TPID, so drop anything else. Because of the non-standard TPID,
> +	 * don't even bother looking for a tag in the hwaccel area.
> +	 *
> +	 * We have to inspect the ethertype directly because skb->protocol
> +	 * will contain garbage.
> +	 */
> +	etype = ntohs(*(__be16 *)dsa_etype_header_pos_rx(skb));
> +	if ((etype & KS8995M_STPID_STD) != ETH_P_8021Q) {
> +		netdev_info(dev, "%s: dropped ethertype 0x%04x\n",
> +			    __func__, etype);

While at it, please avoid printk that could be triggered on each
incoming packet.

/P

