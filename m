Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4CA43CE72
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786445724; cv=none; b=HtpxYacZmHDa9HlFgshlVLAq0g3/MJjnVJoYNETzsk7jfj9r+q1VDilpRGHEWcwC0SCRfxeai+k+tNObWAJH5HW/+3g28GzL+MbQ3N8hlISeOIHo1iL4gDAFI2x+Z6h7wYdyPJ4ROvthfv2ZU3uQ5Wh5z6V3kh74Bj9Gy1Za6xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786445724; c=relaxed/simple;
	bh=lH8D+BJ1YRMpPcmHtgURObMm7AT/9ogJJtxfYRSd7Kc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHI5nHE+60o8SuvuZ6p2F1EDiwvI3ehIM3VMGlj5OIknzRqKrZqvrhwNPsNxyC9/Sp0fL/ZX/HXFft8KijLHDd8T5wpOk6vhbZ8fKgPJZWlVDP3KNrSuIgXnQwD1b+YBOmW+W+CJ7QvbAfaESqOFg55xk91iGzPB+dE1HtDakOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bJAINQTk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FnLgomJx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bJAINQTk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FnLgomJx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786445719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/55ml4BFA7dhVMUEyZoknlvzKvYGcwvGx5Ocga37Jjo=;
	b=bJAINQTkhN7YUPqZiHWhneW86Gsv6xVhvfu0S46mP64U1Ez3t2sRRNMxNi00Pe/DjEK3MD
	EavPX3DIP27eAADnuWSyfkAdRvRqkieZB+aEsvADg6sI0K/s92XsdV2RlVY7zOrj8LeziR
	t0//z7tKBL+HsXp8K/LUhmh4/4uianQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-hBbKqs8HNy-EC9CbeBsIgQ-1; Tue, 11 Aug 2026 06:55:18 -0400
X-MC-Unique: hBbKqs8HNy-EC9CbeBsIgQ-1
X-Mimecast-MFC-AGG-ID: hBbKqs8HNy-EC9CbeBsIgQ_1786445717
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-472c330e555so1474684f8f.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 03:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786445717; x=1787050517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/55ml4BFA7dhVMUEyZoknlvzKvYGcwvGx5Ocga37Jjo=;
        b=FnLgomJxSV6DfEYo1SU/WGqhTzt5wKR+3FhqWJXYefWR/ut1Nm4Z7V7DJGJZ1giWpl
         C928LNXoom7ZKa+fOKCJUZ67a1iCqrD5Nz2orMa6e1CUZrhJUMQq9j95e6nR8j0d0Mu+
         L1iEj3c64Dosc8ba2y7h8lLjyXLfCeZILToTderjsr9qYfToJjDQjLjVkEEj9qfx2N6s
         u8MFPVoSJGdjURX0H0SVj03bDYCCGnXm9oNnXZPeEEsXZ4ev+2xfFo4Wj8/FPEOKfNnN
         Fqw8Zue8SKPXhHYzqvIgG7djdK/I5HoE1r/ZlxRrxs/xcQqAqtHqiFf5S7KpZ4cTSfvB
         T5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786445717; x=1787050517;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/55ml4BFA7dhVMUEyZoknlvzKvYGcwvGx5Ocga37Jjo=;
        b=M0rAegb+haKP1FWTl0fTfd0VUpKH2CP8VmfVEnn18qoB8U4rxU2d4GojxTShAyuL/l
         m8PM2EhNCub6qxkj473oQE2pDU9DdRfOfOwmNK6QInFladAFKeyTG/Bf+qt3HpvbJWjp
         luH2uQ56d/4HdijsEBjfcz6jhVq7j+C8eqLKsDWVSwbn9ldasGlbSjBr/jrqvXOxCxSD
         i+lJApLOK2wrXCkhow5UHvsLLixEO55o+lj+edVi6o9Tn8TqR8+Oj+Adr/9LE7KKZPmL
         ySwvMkZycxEmxYQaXUlMAL+ZVy/7fn0EyuUvr58wKztoMufU6cU3Nw/OosNPdQGMhbml
         N2mg==
X-Forwarded-Encrypted: i=1; AHgh+RpRa8X+gxEgYDU72JFW/Y2Rcp6gneoyu7UD75M8zxqqLrRov5OrrYZgECGJeMjT+/UK+AZ6jlFgESqe@vger.kernel.org
X-Gm-Message-State: AOJu0YxtGYqVURu6hUCBRPVuvA6oWLaEyaB0hWIMogLcek10AnV3RFsD
	p4g0ZIdlpaOiPpkSjYRN5O1omv8ISiNStSN1LNsmY28N7Zef4awBcz5ZbbQFz3fM/vJXEIcd6n7
	SPPcv7+geGiUMvM6OVAG9Ly5P7UTycmbsXpqFeTeU32R2xXZVSTlUhTFaqgKKYeA=
X-Gm-Gg: AR+sD13h9G6sKu0hP48nxTEpO+pCthSAigoJJD3ZSvIw2ZZbhbKVj5WVKrtBOV/GCPQ
	MPX9z8/XWxmCAahtgLedY8r1auqV6BNu+dtfxhkC75nDz26QsBmU4gH3da41GAgM/xLl0GTGrQZ
	efdvf8FWRf1xN0BwRdmFwefSWDhS3Gdehihakz7XZWRgTrSNMFNjxHVDtPnzcFpwcAGAGeNv/0g
	nft+KW8BBpZPMf8EgRcObQ84nUJsG9xTBnuhuVa7JC8V5fwmbjaz8cpY083kupUsWvdDyc7RLbB
	3dz3Iy1jdkov18ia8QbXBsfoglPfjRZHeffwgf2zjmVj56jxzvcwM4Ahhe9Of7IxdIcilJYplPM
	my+ILqQ4itg6KBwuwmVCX4iPELX3xqJG3ivGkaX/HL2C3NZ+RgkJ3LbVUyOuommI8jZbSLCbQ1i
	I=
X-Received: by 2002:a05:600c:6085:b0:499:728c:4704 with SMTP id 5b1f17b1804b1-499784649b5mr37096555e9.12.1786445716790;
        Tue, 11 Aug 2026 03:55:16 -0700 (PDT)
X-Received: by 2002:a05:600c:6085:b0:499:728c:4704 with SMTP id 5b1f17b1804b1-499784649b5mr37095935e9.12.1786445716357;
        Tue, 11 Aug 2026 03:55:16 -0700 (PDT)
Received: from [192.168.188.103] (ip239-44-231-195.pool-bba.aruba.it. [195.231.44.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49974146b83sm57841085e9.11.2026.08.11.03.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 03:55:15 -0700 (PDT)
Message-ID: <c22fb728-516d-4dcc-b9d6-64ac4968fcfe@redhat.com>
Date: Tue, 11 Aug 2026 12:55:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 1/9] net: dsa: add tag driver for LAN9645X
To: JensEmil.SchulzOstergaard@microchip.com, sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260805-dsa_lan9645x_switch_driver_base-v11-0-007ebc983a0a@microchip.com>
 <20260805-dsa_lan9645x_switch_driver_base-v11-1-007ebc983a0a@microchip.com>
 <20260806143835.53A7E1F000E9@smtp.kernel.org>
 <ed13dca89e3b2131a717476b9e13d5a3012a0e30.camel@microchip.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <ed13dca89e3b2131a717476b9e13d5a3012a0e30.camel@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/7/26 4:41 PM, JensEmil.SchulzOstergaard@microchip.com wrote:
> On Thu, 2026-08-06 at 14:38 +0000, sashiko-bot@kernel.org wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [High] The tag driver drops hardware-accelerated VLAN tags on transmit, leading to switch misclassification and double tagging.
>> --
>>
>> --- Patch [1]: [PATCH net-next v11 1/9] net: dsa: add tag driver for LAN9645X ---
>> commit 97f24952991b201e3d0f1948d98e9534914b9db3
>> Author: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
>>
>> net: dsa: add tag driver for LAN9645X
>>
>> This commit introduces a new DSA tag driver for the LAN9645X switch family,
>> using an NPI port for CPU connection. It supports prepending a 28-byte
>> internal frame header (IFH) on injection and handling a long prefix on
>> extraction.
>>
>>> diff --git a/net/dsa/tag_lan9645x.c b/net/dsa/tag_lan9645x.c
>>> new file mode 100644
>>> index 0000000000000..6a33216c7792f
>>> --- /dev/null
>>> +++ b/net/dsa/tag_lan9645x.c
>>
>> [ ... ]
>>
>>> +static void lan9645x_xmit_get_vlan_info(struct sk_buff *skb,
>>> +                                     struct net_device *br,
>>> +                                     u32 *vlan_tci, u32 *tag_type)
>>> +{
>>> +     struct vlan_ethhdr *hdr;
>>> +     u16 proto, tci;
>>> +
>>> +     if (!br || !br_vlan_enabled(br)) {
>>> +             *vlan_tci = 0;
>>> +             *tag_type = LAN9645X_IFH_TAG_TYPE_C;
>>> +             return;
>>> +     }
>>> +
>>> +     hdr = (struct vlan_ethhdr *)skb_mac_header(skb);
>>> +     br_vlan_get_proto(br, &proto);
>>> +
>>> +     if (skb_headlen(skb) >= VLAN_ETH_HLEN &&
>>> +         ntohs(hdr->h_vlan_proto) == proto) {
>>> +             vlan_remove_tag(skb, &tci);
>>> +             *vlan_tci = tci;
>>> +     } else {
>>> +             rcu_read_lock();
>>> +             br_vlan_get_pvid_rcu(br, &tci);
>>> +             rcu_read_unlock();
>>> +             *vlan_tci = tci;
>>> +     }
>>
>> [Severity: High]
>> Does this code drop hardware-accelerated VLAN tags on transmit?
>>
>> When the network stack transmits a frame through the DSA user port with a
>> hardware-accelerated VLAN tag, the tag is stored out-of-band in skb->vlan_tci.
>>
>> By only checking the inline Ethernet header, ntohs(hdr->h_vlan_proto) will
>> evaluate to the inner network protocol (like IPv4) instead of ETH_P_8021Q.
>> This causes the check to fail and fall back to using the bridge PVID instead
>> of extracting the existing out-of-band VLAN tag.
>>
>> Because the out-of-band tag is ignored and never removed from the socket
>> buffer, will the conduit driver eventually insert the original VLAN tag into
>> the payload, resulting in a double-tagged frame on the wire?
> 
> If the conduit sets NETIF_F_HW_VLAN_CTAG_TX (or STAG_TX) in
> conduit->vlan_features, then I think the analysis is correct.
> 
> __dev_queue_xmit() calls validate_xmit_skb() -> validate_xmit_vlan()
> before ndo_start_xmit():
> 
> 	if (skb_vlan_tag_present(skb) &&
> 	    !vlan_hw_offload_capable(features, skb->vlan_proto))
> 		skb = __vlan_hwaccel_push_inside(skb);
> 
> vlan_hw_offload_capable() requires NETIF_F_HW_VLAN_CTAG_TX (or STAG_TX).
> A DSA user port inherits its features from the conduit
> 
> user->features = conduit->vlan_features | NETIF_F_HW_TC;
> 
> and user->hw_features only ever gains NETIF_F_HW_TC and
> NETIF_F_HW_VLAN_CTAG_FILTER, so ethtool cannot turn the TX offload on.
> 
> But if a conduit sets those offload flags, the tag driver could receive
> an skb with the vlan tag in the hwaccel area.
> 
> I will normalise the tag into the payload at the top of
> lan9645x_xmit_get_vlan_info(), following the precedent in
> sja1105_pvid_tag_control_pkt():
> 
> if (unlikely(skb_vlan_tag_present(skb))) {
>         skb = __vlan_hwaccel_push_inside(skb);
>         if (!skb)
>                 return NULL;
> }
> 
> But the outcome would probably be worse than a double-tagged frame? We
> prepend the dsa tag, and the conduit would not know anything about that, so
> my guess is it would insert the vlan tag into the dsa tag.
What about something alike the following?

	if (skb_vlan_tag_present(skb)) {
		*vlan_tci = skb_vlan_tag_get(__skb);
	} else if (skb_headlen(skb) >= VLAN_ETH_HLEN &&
		 ntohs(hdr->h_vlan_proto) == proto) {
	// ...

Side note: I *think* the unlikely() on skb_vlan_tag_present() is not
needed; the like-wood depends on the actual traffic pattern.

/P

