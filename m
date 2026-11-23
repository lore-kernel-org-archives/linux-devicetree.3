Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450225;
	b=ZEM7FlbRB0mE0MggPipMisqhMzCHSkmcpYIdYyFOR9wJoVE33loExf9R5UxfCtq0H7Dm
	 Jaifeb6/3VuJM42iia94qrc/6FKp8t+YR2l25zUWsxDwsMM0ar9ibU2/NnE2nmLNFtYjz
	 RpPpHKs1aH3pWPEIcPkZlI1LmHsFVDZ/WA58JibGnWAx8Yi7YoXJziIgmLmdpaaDAqAaX
	 l9drwZZzFQ00XBRX5CQW0zDcrR67Qe6LGKltT3RGvH2UaqEH7DDBiEVyUS9Ak7XNlCYLK
	 eOHMamdrQPWDaCmWENADW5eaDA6D2Zk1BFTbbsWavzM2qlXbeBwARTgyBj5Tp6G5upQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450225;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=ypOSzkfJxIBRiqRs4/JLRl10BT/rd5hCCDRvucj2Z1Q=;
	b=Iitl+xaKx4r5aetKnztHj+zAJtrYBD6/YCwA8+syLhDgkl03rmkZXeP7N1haamFuR2p+
	 qzuwqZ5wjTpcnjX66LOm1eSnNoz0tOcppi1y+D7U0lr+lDXIBXxPmwOoadI9JsmJF7UoC
	 1gvETt9HP1DHlVbUuNOIICqLCLH8VyLq1zfzrSdqRLcaP0YBX4AKJ6CVDHYk/m5f/vIzY
	 R71Re473Be4t14q3cmbIltQRVFPUBcavdvBKoVDJBoAtF0i9dTsELXjfHlhczC4bMlVAE
	 kvKUT+MDndvl9s+cD+6qyAkeQIYuOalLd9O2u8Af/tGODFBolq2uyxda/XUznQYdV9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gM81qaTc;
	arc=none smtp.remote-ip=74.125.82.228
Received: from mail-dy1-f228.google.com (mail-dy1-f228.google.com [74.125.82.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28BD606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C28BD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gM81qaTc
Received: by mail-dy1-f228.google.com with SMTP id 5a478bee46e88-38587f3de36so4198214eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:10:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450224; x=1796055024;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ypOSzkfJxIBRiqRs4/JLRl10BT/rd5hCCDRvucj2Z1Q=;
        b=UtLY8+QYnEgTzwERyDOUPM/+kMRyJWzJvBYTaknjNsVYUXXn6EC7UPY97ENJ7bterm
         b23cUmTvpRWhXXu5cNBWpHWJQz0vjw0m29FZv5C0KPCP3L9PZFOqXpdbEnHBpyzaDghw
         mHcR6dmfPs7t18wxNXSTe5NrZ7lJfYWMERMz73WLhjbhQd2zhSJjPN5boTves55lstfd
         pLnozjoczwwM6tGjRtbT21mQPuZywQTurWYMoCAnFvv+QYuQr9Oyxap5CcI9n0AO5YBZ
         dyTtOTaLrJRWQYQJs3pUmYBaZPSfvUhCVisjDtpraVS0mlR3ECQmmyG3MqEcC9d9Sxio
         aXvw==
X-Forwarded-Encrypted: i=1; AL+hErFPat2l6dqjREub8XGJVaILtLoh5zzkBKmQZ54QOhdUPpWq7D6OXYg4HowHgdVoyTDDUpekcVXk5T7M@vger.kernel.org
X-Gm-Message-State: APuU4Z82ZuEPAkC203efT9JtQ8ZgxdKKquAISq4HXr2HACSausGVLQIt
	x1xbYRYt/JWb9CB+hj/veW0iABJiRng56Y3Zsc339XA4VHsZMYh+MfKKsYV1ewK0kLgZZ+oIjtg
	RjZ1E8NGiOnFlyjGdXzNhRG6k0VQf1N+Q6GTJVhIjC/LPLdT6ccFCWBVnDi0Cm/vIyPdos6gMPE
	dQckI+R04KeXdZoCWIBhuxt+3seIiM9dLqhgBdJtNusxzxzCdOQW4CmqH8qdICB6pvr0eVnsTMA
	1Oh8td9xi4bW5gOl1zELw==
X-Gm-Gg: AZFdTZfU+VBAhvFcFddHSMdOnNHMOznEpO667LiB4A9lxuz+sG/QJLxPQZGca8Ktv/u
	mfD3iVzNB+PY7EdIV+OIMIpqFIujYwZXtuEUTayzj6DZI2plyfBiTZ+nFddspLLAO+H6xo3v6xS
	sMXKev8ZasZ47tBuBk56iNOnNe9bD82sBSdSq+7JFsRf6GeolYMhtNtQoOT43tUlJIxWeGDWQtx
	vOz3C0W814+kp+IpDyXu5I500aY+lYc8IFbRYNHX0coGxgLjpqInAvfjHnBbesdPCYZDsHGGV7H
	gp0dHhlUWYtgt2lEi2YLujYe8G2wr/hUEVusqRgTxJhUXp0mv1GGrzuwDoR23+TTMVKLkhbCtVr
	t48xKnTxa3cPn6DAizCAgnqJqNZ9Yvu0sKKS9aNATgx0cZnQz/G4JcqD7mn3uspuvAG6YdgvNr7
	Q8i9i1dA/P66Tty38OgZOnJRTRGn8YoDSG6GkXZ+B4
X-Received: by 2002:a05:693c:4001:b0:370:d6e4:e8aa with SMTP id 5a478bee46e88-38570b34fecmr13124653eec.41.1795450223601;
        Mon, 23 Nov 2026 08:10:23 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-386a58bd934sm916437eec.29.2026.11.23.08.10.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:10:23 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso3597103c88.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795450222; x=1796055022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ypOSzkfJxIBRiqRs4/JLRl10BT/rd5hCCDRvucj2Z1Q=;
        b=gM81qaTcVbNLppi4ERhQA+iFdyvhxyA786MlSXuu3iNrSvd4cnB56s3iPQjEE7BQM8
         0y/lgC9jhTwcgipShOESHGZbMmHHhnRRNiKna5v7KEfhutwTlaq0K8by6QaPfnxuoHgq
         gA1Q2PRZOkAygqHKS+wSuND+r/V3zOC37D5/U=
X-Forwarded-Encrypted: i=1; AL+hErGuPCO8Wyjnr82P75Uy7eN5NIgddiSw3JmOFBcbEZjR2bd3zeH8cFzj9Mqy7VWY2UbUdipphSFVycgW@vger.kernel.org
X-Received: by 2002:a05:701a:ccda:10b0:144:fb42:52 with SMTP id a92af1059eb24-1b5568fd903mr12257221c88.28.1795450221745;
        Mon, 23 Nov 2026 08:10:21 -0800 (PST)
X-Received: by 2002:a05:701a:ccda:10b0:144:fb42:52 with SMTP id a92af1059eb24-1b5568fd903mr12257183c88.28.1795450221034;
        Mon, 23 Nov 2026 08:10:21 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55ff0e4e6sm22003793c88.11.2026.11.23.08.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:10:20 -0800 (PST)
Message-ID: <b5a899c1-c1b8-409e-8b50-ca722c229f5b@broadcom.com>
Date: Mon, 23 Nov 2026 08:10:16 -0800
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
Subject: Re: [PATCH net-next 6/9] net: flow_offload: allow drivers to validate
 and invalidate cached paths
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netdev@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Jonas Gorski <jonas.gorski@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Florian Westphal <fw@strlen.de>,
 Phil Sutter <phil@nwl.cc>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "open list:NETFILTER" <netfilter-devel@vger.kernel.org>,
 "open list:NETFILTER" <coreteam@netfilter.org>
References: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
 <20261116222519.1416501-7-florian.fainelli@broadcom.com>
 <awI-mtwn3ohPw-fF@chamomile>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <awI-mtwn3ohPw-fF@chamomile>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/21/2026 5:00 PM, Pablo Neira Ayuso wrote:
> On Mon, Nov 16, 2026 at 02:25:16PM -0800, Florian Fainelli wrote:
> [...]
>> +static int nf_flow_offload_validate(unsigned long cookie)
>> +{
>> +	struct flow_offload *flow = nf_flow_offload_cookie_flow(cookie);
>> +	unsigned int dir;
>> +
>> +	for (dir = 0; dir < FLOW_OFFLOAD_DIR_MAX; dir++) {
>> +		struct flow_offload_tuple *tuple = &flow->tuplehash[dir].tuple;
>> +		struct flow_offload_tuple *other = &flow->tuplehash[!dir].tuple;
>> +		struct dst_entry *dst = tuple->dst_cache;
>> +		struct neighbour *neigh;
>> +		u8 mac[ETH_ALEN];
>> +		bool valid;
>> +
>> +		if (!dst)
>> +			return -EOPNOTSUPP;
>> +		/* This is the actual route selected with the packet's policy
>> +		 * context, including mark, DSCP and the reverse lookup's oif.
>> +		 */
>> +		if (!dst_check(dst, tuple->dst_cookie))
>> +			return -ESTALE;
>> +		if (tuple->xmit_type != FLOW_OFFLOAD_XMIT_DIRECT)
>> +			continue;
>> +		/* A stacked path may have a different final Ethernet neighbour.
>> +		 * Do not mistake that unsupported context for a stale owner.
>> +		 */
>> +		if (dst->dev->ifindex != tuple->out.ifidx)
>> +			return -EOPNOTSUPP;
>> +		neigh = dst_neigh_lookup(dst, &other->src_v4);
>> +		if (!neigh)
>> +			return -ESTALE;
>> +		neigh_ha_snapshot(mac, neigh, dst->dev);
>> +		valid = (READ_ONCE(neigh->nud_state) & NUD_VALID) &&
>> +			ether_addr_equal(mac, tuple->out.h_dest);
>> +		neigh_release(neigh);
>> +		if (!valid)
>> +			return -ESTALE;
>> +	}
>> +	return 0;
> 
> This validation to catch for stale entries looks very similar to what
> I'm working on. I guess there is a chance to consolidate all this in
> common infrastructure for both software and hardware modes.

Excellent, happy to point you to an off the shelf device where you could 
be testing this on, if you would like to?
-- 
Florian

