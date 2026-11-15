Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794764644;
	b=DqzFZrfh1dl/PPULC6xy3fy+14kjYhfs+fQssX8v0xVW1+oDJa/YKIkfCoZ5e9s7vkK+
	 d1ioSHF/p403rASTeq7Xjf97KuD0h183xdwCBSKq76UhIH3r/GSj7CsO6v6IvSxEoKwoW
	 jOa8RwdASscfJkCszkPfblbwqwouehAL/5GO3cgFTiD3N/FpHHDP4TdmyUhe+ZK2bomFU
	 HNI+V2euAWbXZ7AnxD1IWonEqPDon8P8jLEG6aF00+gwZi2j/+8q968jNdyh84FsSvebw
	 j94WeoasAOGr/MWXX8KsO7pRsmWrgGLnHrYfa0ggmIvNQG0fi430XiAqftVIJW1W1wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764644;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=JG5H9JarkiKv0nTbjM+OOc7AgOFCx3xSzyv2tj4IAT0=;
	b=F5g0tSsoGZc6RUVYLrULoARa3d6MAyXsAUeAq1YXNVgCEtUPnJ6ZXqp7Z5K2e0hhYCqo
	 Wy40ePteDNBelP81B9CBknRq25OSSzEaIty/sonFSW1xoZRhVF7JPGX0UtPG8BdmWvEqB
	 Gn9/mtiDItTi3C1LiBiIIlBq4azmSxLNzNImCebZZfEycStILzIdjblmKzk6OwfF3U1cO
	 Ow/zYbXslGlfXtPkMEcxlkj+k9iQeGdyYOQdsFCwZTGQyHi7wf3ujWOot7awFOJ67ciUq
	 mfR5oqdT2JR6sTwlttY6ulPieLSTtVL9JutSShZ06jLknGwcniPhiFmbYb5aNQ4GS8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XF1ByjTk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208D8606A31D;
	Sun, 15 Nov 2026 17:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XF1ByjTk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3711F000C4;
	Sun, 15 Nov 2026 17:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794764643;
	bh=JG5H9JarkiKv0nTbjM+OOc7AgOFCx3xSzyv2tj4IAT0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XF1ByjTk544+cIriMpcTtpo4o7kIYTagXf9TZAKw1tZDPIxzfoKwgjIp7365gaaaW
	 Tvd88CJsFj4z22/eF1DdghmsFV2fp7z/SJOQfap3rAGLpixuFzceNHm1HIczjXL2dY
	 rC/Q4ACLfjWu+yjn+wp3eWYGq1sdNFsk/AQUJqCkdfMYMB39Neu/F/qbRBqWgz0Xai
	 b+8toE+mkT4EwyKKNvx5BzIBkc9wwl6X7ld7Et5ibUD8XMs2UCKd4Dnf6XV9qEpN4v
	 MAk0fkd2+/GTrFS8vMfl8uKOkYCuyH1Lq0AwvRGUv9UvstncpUBWF3ThQyP4NtuGz/
	 qXIcKYxRlwOLQ==
Message-ID: <57ea8341-4685-4b50-9072-cceab6fc1623@kernel.org>
Date: Sun, 15 Nov 2026 17:44:01 +0000
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
Subject: Re: [RFC] phy: qcom: mipi-csi2-3ph: SM8750 ships CSIPHY 2.4.0 lane
 table - preferred shape?
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <Yl13atiuNZfluvtbBiO7_SVp6ksRx4_d2sBrIXHM5KRs95q0VwSYuBGhyKHRhOj7BMNoXlcRI2_WAg-ZWaf_yA==@protonmail.internalid>
 <179472053649.14538.1565870277822789081@mail.ustc.edu.cn>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <179472053649.14538.1565870277822789081@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/11/2026 05:28, Qianhui Xu wrote:
> Hi Bryan,
> 
> SM8750 (Lenovo TB322FC, mainline bring-up) carries a CSIPHY whose vendor driver
> describes its lane table as csiphy_2ph_v2_4_0_reg. Upstream's lane_regs_x1e80100[]
> in phy-qcom-mipi-csi2-3ph-dphy.c is the 2.1.2 generation, so the two differ.
> Before sending anything I'd like your preference on the shape.

OK I's not clear to me if what is meant is stuff that Hangxiang is 
working on

There's a v25 on list for sm8750

https://patchwork.linuxtv.org/user/todo/linux-media/?series=33877

New work/additional-work/bug-fixes on top of that branch or absorption 
of downstream work ?

> What I measured (vendor camera_dlkm module, unstripped; 103-entry table, 1648 B):
> 
>    - address set identical, 103/103; (addr, data, param_type) differs in 13 entries
>    - 0x0000/0x0400/0x0800/0x0c00 : 0x8e -> 0x8c          (DEFAULT, 4)
>    - 0x0008/0x0408/0x0808/0x0c08/0x0e08 : 0x10 -> 0x19    (SETTLE_CNT_LOWER_BYTE, 5)
>    - 0x0060/0x0460/0x0860/0x0c60 : 0xbd -> 0xfd          (SKEW_CAL, 4)
> 
> Those three values also track the vendor's own generation numbering across every
> 2ph table in that module: v2.1.x = (8e,10,bd), v2.2.x = (8e,19,bd),
> v2.3.0/2.4.0/2.4.1 = (8c,19,fd). So they look like generation markers rather than
> per-SoC tuning.

OK but I still don't really get the context - against 7.4-rc3 or against 
that with Hangxiang's changes or something else ?

I think I already indicated the stuff on-list is good to go so if you 
have more fixes/changes/enhancements please ensure to base off of those.

> One thing worth stating up front, because it bounds what the patch can claim:
> in phy_qcom_mipi_csi2_gen2_config_lanes() the SETTLE entries are overwritten with the
> value computed from the link frequency, and SKEW entries are skipped (still
> "TODO: support application of skew from dt flag"). Only the four 0x0000 writes
> (0x8c) actually change behaviour today.
> 
> Questions:
> 
> 1) Shape: a new lane_regs_sm8750[] plus a mipi_csi2_dphy_3nm_sm8750 soc cfg
>     (compatible "qcom,sm8750-csi2-phy" with "qcom,kaanapali-csi2-phy" as fallback),
>     or would you rather see the difference expressed per generation
>     (e.g. lane_regs_2_4_0[] shared by any future SoC on that generation)?

I think I pointed you at Hangxiang's series before, if not please check 
it out now.

> 
> 2) Evidence level: with only one SM8750 unit I can measure a 30 fps capture
>     regression, nothing more. Is "matches the vendor table for that generation"
>     an acceptable justification for the 0x0000 value change, or do you want the
>     SETTLE/SKEW entries dropped from the table until the driver actually applies
>     them (so the patch carries no dead data)?
  > 3) Binding: standalone "qcom,sm8750-csi2-phy" const vs. an items 
entry with the
>     kaanapali fallback. I see a kaanapali series in flight touching the same oneOf,
>     so I'd rather follow whatever shape that series lands with.
> 
> I have a two-patch draft ready (binding + driver) that applies on 7.4-rc3 and passes
> checkpatch --strict, W=1 and dt_binding_check; I'll hold it until you answer.

Please align your work with the on-list stuff.
> Disclosure: this mail was written with AI assistance; the author reviewed and
> verified every statement, and all measurements and decisions are the author's.
I'm finding the LLM output pretty difficult to understand to be honest.

But if I've understood you here I think you've missed 
Hangxiang/Qualcomm's work for 8750 so please pick up on that and see if 
there are still gaps for you.

---
bod
