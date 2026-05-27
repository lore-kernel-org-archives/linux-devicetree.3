Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388BB3D1AB5
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 15:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779896382; cv=none; b=fpI8r9qCvB1+GxKtuOVmjYDVC24X1vcydDRqBr7kxf13mtjXuX9NbGMCvRfUYKDy+KEhhunS582B9tfxwQdrs2gM6RrupfKc0fT89hzQxero8RZc5DfUswrQ7W+FBUvzlZqvEMo7HIZD9LYk0WmfOlCYyAAt8j1y3KssaVwlS9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779896382; c=relaxed/simple;
	bh=onG1RawqFcI8NnhLU4G5xlXfAOmprRvmPVBmdp31/80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nbk8SoaGGdDue+myEI6HetPBYxxJYjHfmnszLRIsl3h/6rqJpKw6KHE0tKThSKpMhMI5OyU5ud3oKVzb4jbnVbbQ0pR389lm6ccr9fgannwYU6z2gw3Ob7qeR983mtk+CjmWzNu0pCw+PX4r/nJzwKU3Qhsr/54y1M4b9DJA5bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4/H3fCt; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4/H3fCt"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bd11a3729e8so1835564566b.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 08:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779896380; x=1780501180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S0daKFRaEmuHFhe11WXYlg2kJgS3CypnETaj1XfTD4g=;
        b=A4/H3fCt5PNt3vNNcRnjd8AToa27YHRdnxJPuWORfzcvaq+W8ejpkaq+WzszdWKtDa
         h/breJbeyOpCEoGfW6bb0Fpf1A1E4hbzQLFzaqi9QMgcw+931MBTrQhh5r8qXTwLiIb8
         Va7i4ALvoE0BeUWE1E0s/Ip/x94p9cE45Q/VIynl79tXr1WIZ/nC0BNmMjOSJoh6yepT
         rmGYJ52wVLfmABWENjSGGNOSL4vVqGlXubN2lYd6SD0PLb8U3VxiHhsnESEGhCNNkali
         xlna+NtmRsPjqWYkb8P960u5ugpxlGGGXZQrpHxa6phOoNM23zW5do5j8aXnXDm5s+zM
         wBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779896380; x=1780501180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S0daKFRaEmuHFhe11WXYlg2kJgS3CypnETaj1XfTD4g=;
        b=NPn4pU7DG23EkaMSUHUWAuUZiQSbwi55ImMsvpn8rLBPrvDhIoI3apBFH7iW06Y7Km
         LyTVAJnr1gHRzH6EdhKSxZPQKghjA+W5I0N8jOL4krAvOJokVyxOVS1iCIXlsB4L2v0l
         UQTZLIkrZJs17MeEeYjKgacJM9Vslid2t/2Sp1+5lMDobLqx7xb8a3BoyDI015AC1rgZ
         G6XyOMaHkEynDjRSwaZC3a/Y/dNHlZFCqLqU8jI3elLET3V6dHDapVwb3EMsZfqcmlbf
         Ldq4wfyiyPKneaiaCy5DzvxlDSa9/3Q6WOjqQXCFyy8B85p87K8twVWGaYRqat+DWERi
         R6uA==
X-Forwarded-Encrypted: i=1; AFNElJ/Jo6or9W8ntD/pJe7uLhQxnKyadViRaHmB1/tABuiuRL7OfUMEiFF/4R/weC6nX7AC/eDVUu4D199W@vger.kernel.org
X-Gm-Message-State: AOJu0YyhQ+bD90nlySJyiu7Lf7oX6/O6NAekXw4ZkF5zSKXWBdIs9RJP
	mcNN38AmkGRyMRSlCCmX2ENJFC7r8Qzb6EUIt1eNQYLyM9sexKscDYSs
X-Gm-Gg: Acq92OH7hx0I9uHfW7gG66b/pw93/gEBDH3u8XE/dKt37UY/ZcbzHCjnHEisRI/kyJD
	DQmJuTLyykA+ac/UfZuJ0x0Q5LVGaam1qqOiRI8XuZ9gx9EjGLTvWjwT6rd1/PelskJiCtr2aJp
	tr2zXNgQQr3ch5RiWF6OixTQIbHXHgqi3mAscQ5gwSP+u+SuYBpCz+tK1LcrpdipkpFr7/siBQP
	XhMocgPJhkv0aU9GtGxlOpg8Q4jyDnF1YF3koS3qni9KJZG+A4Bll9KbzEAkhXDK+Znc+QBR94U
	VWcdmdv52LRPA7ggzWx4zle5IU+329QZycqCqqpHM+ZLzn745JUk3hP8EYtnjRHXKYJxP5WoDKR
	4+SiHcJo+MaJXqETtQvnD2oQBHRt0b4Lu1FW9NFnriE5QLItuG3cQmp63d9ZPZSVd3yEuu/JXn/
	oN7QjStEt0t46nqifmPLiaHXJBOliMstBvUTK0Sq4orVJ7NKw4xjmePXUDt6jUMs+QDAHWspg0I
	vw+EK4Qd47WV62pGO/N+pCwsb6BPt5xSDIev7Vz6b9zvu52q1gijfpdkeNCKKUouCCZulpxT52z
	3BatG90Uk7f6UZVuemc=
X-Received: by 2002:a17:907:b5a3:b0:bce:4be4:cb9e with SMTP id a640c23a62f3a-bdd25ce0c02mr1052749566b.24.1779896379332;
        Wed, 27 May 2026 08:39:39 -0700 (PDT)
Received: from [192.168.0.2] (dslb-002-205-016-123.002.205.pools.vodafone-ip.de. [2.205.16.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc30528a7sm626790066b.21.2026.05.27.08.39.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 08:39:38 -0700 (PDT)
Message-ID: <2bcddaf2-e3b4-4f72-ae2d-1ac22c2e7553@gmail.com>
Date: Wed, 27 May 2026 17:39:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 1/9] net: dsa: add tag driver for LAN9645X
To: =?UTF-8?Q?Jens_Emil_Schulz_=C3=98stergaard?=
 <jensemil.schulzostergaard@microchip.com>, UNGLinuxDriver@microchip.com,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Woojung Huh <woojung.huh@microchip.com>,
 Russell King <linux@armlinux.org.uk>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260527-dsa_lan9645x_switch_driver_base-v6-0-4d409ae64f3c@microchip.com>
 <20260527-dsa_lan9645x_switch_driver_base-v6-1-4d409ae64f3c@microchip.com>
Content-Language: en-US
From: Jonas Gorski <jonas.gorski@gmail.com>
In-Reply-To: <20260527-dsa_lan9645x_switch_driver_base-v6-1-4d409ae64f3c@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 27/05/2026 16:49, Jens Emil Schulz Ãstergaard wrote:
> Add tag driver for LAN9645x using a front port as CPU port. This mode
> is called an NPI port in the datasheet.
> Use long prefix on extraction (RX) and no prefix on injection (TX). A
> long prefix on extraction helps get through the conduit port on host
> side, since it will see a broadcast MAC.
> 
> The LAN9645x chip is in the same design architecture family as ocelot
> and lan966x. The tagging protocol has the same structure as these chips,
> but the particular fields are different or have different sizes.
> Therefore, this tag driver is similar to tag_ocelot.c, but the
> differences in fields makes it hard to reuse.
> 
> LAN9645x supports 3 different tag formats for extraction/injection of
> frames from a CPU port: long prefix, short prefix and no prefix.
> 
> The tag is prepended to the frame. The critical data for the chip is
> contained in an internal frame header (IFH) which is 28 bytes. The
> prefix formats look like this:
> 
> Long prefix (16 bytes) + IFH:
> - DMAC    = 0xffffffffffff on extraction.
> - SMAC    = 0xfeffffffffff on extraction.
> - ETYPE   = 0x8880
> - payload = 0x0011
> - IFH
> 
> Short prefix (4 bytes) + IFH:
> - 0x8880
> - 0x0011
> - IFH
> 
> No prefix:
> - IFH
> 
> The format can be configured asymmetrically on RX and TX.
> 
> The IFH get/set functions are declared as inline. All the field
> constants are compile-time known, so when these calls are inlined
> efficient code is generated with branches pruned and loops unrolled.
> During testing it was observed that without explicit inlining GCC would
> have trouble inlining the functions, which hurt performance.
> 
> Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
> Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
 

(snip)

> +static struct sk_buff *lan9645x_rcv(struct sk_buff *skb,
> +				    struct net_device *ndev)
> +{
> +	u32 src_port, qos_class, vlan_tci, tag_type, popcnt, etype_ofs;
> +	struct dsa_port *dp;
> +	u32 ifh_gap_len = 0;
> +	u16 vlan_tpid;
> +	u8 *ifh;
> +
> +	/* DSA master already consumed DMAC,SMAC,ETYPE from long prefix. Go back
> +	 * to beginning of frame.
> +	 */
> +	skb_push(skb, ETH_HLEN);
> +
> +	if (unlikely(!pskb_may_pull(skb, LAN9645X_TOTAL_TAG_LEN)))
> +		return NULL;
> +
> +	/* IFH starts after our long prefix */
> +	ifh = skb_pull(skb, LAN9645X_LONG_PREFIX_LEN);
> +
> +	popcnt = lan9645x_ifh_get(ifh, IFH_POP_CNT, IFH_POP_CNT_SZ);
> +	etype_ofs = lan9645x_ifh_get(ifh, IFH_ETYPE_OFS, IFH_ETYPE_OFS_SZ);
> +	src_port = lan9645x_ifh_get(ifh, IFH_SRCPORT, IFH_SRCPORT_SZ);
> +	tag_type = lan9645x_ifh_get(ifh, IFH_TAG_TYPE, IFH_TAG_TYPE_SZ);
> +	vlan_tci = lan9645x_ifh_get(ifh, IFH_TCI, IFH_TCI_SZ);
> +	qos_class = lan9645x_ifh_get(ifh, IFH_QOS_CLASS, IFH_QOS_CLASS_SZ);
> +
> +	/* Set skb->data at start of real header
> +	 *
> +	 * Since REW_PORT_NO_REWRITE=0 is required on the NPI port, we need to
> +	 * account for any tags popped by the hardware, as that will leave a gap
> +	 * between the IFH and DMAC.
> +	 */
> +	if (popcnt == 0 && etype_ofs == 0)
> +		ifh_gap_len = 2 * VLAN_HLEN;
> +	else if (popcnt == 3)
> +		ifh_gap_len = VLAN_HLEN;
> +
> +	skb_pull(skb, LAN9645X_IFH_LEN);
> +
> +	if (unlikely(!pskb_may_pull(skb, ifh_gap_len + ETH_HLEN)))
> +		return NULL;
> +
> +	skb_pull(skb, ifh_gap_len);
> +	skb_reset_mac_header(skb);
> +	skb_set_network_header(skb, ETH_HLEN);
> +	skb_reset_mac_len(skb);
> +
> +	/* Reset skb->data past the actual ethernet header. */
> +	skb_pull(skb, ETH_HLEN);
> +
> +	/* We must deliver the skb so skb->csum only covers the data beyond the
> +	 * real ethernet header. The fake ethernet header in the prefix is
> +	 * not part of skb->csum already. We must subtract what remains of the
> +	 * prefix, the ifh and the gap.
> +	 */
> +	skb_postpull_rcsum(skb,
> +			   skb->data - LAN9645X_TOTAL_TAG_LEN - ifh_gap_len,
> +			   LAN9645X_TOTAL_TAG_LEN + ifh_gap_len);
> +
> +	skb->dev = dsa_conduit_find_user(ndev, 0, src_port);
> +	if (WARN_ON_ONCE(!skb->dev)) {
> +		/* This should never happen since we have disabled reflection
> +		 * back to CPU_PORT.
> +		 */
> +		return NULL;
> +	}
> +
> +	dsa_default_offload_fwd_mark(skb);

Does the switch (by default) also flood link local traffic (e.g. STP, LACP,
etc)? If not, you should not mark these as fwd offloaded so that the kernel
knows that it needs to do that in software if requested.

Is there is a bit in the header that says whether a packet was flooded or
trapped to CPU that you can check?

Best regards,
Jonas
