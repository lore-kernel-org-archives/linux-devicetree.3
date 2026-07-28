Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE37033AD9B;
	Tue, 28 Jul 2026 15:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253967; cv=none; b=ppIVFHbMfgYa3ghUT87fMMXddUC/PCC8xSAO40vjnukZbwkOK/PVF2TuJBEkfdqQb6mx6rORPPhmQKlcDb75UU/PUNpWnQr6ekkOXlRLS2lRsHILfbp71fw4rUt3Uu+Clgoq1L4W5EM6uSI6meCOw+nbysD52RBEyCakN0kTY5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253967; c=relaxed/simple;
	bh=9Bh8kCV0LkjDu3jkPYXajb/gwkn1SmkxH4gYN3gqdow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ys1m8WSGNEdBpEcfVJchGbRbScK8HcVqUiNjI3OoV0Ly32clNhAxtRCDhOfn676R3xBulQ8gM14nniKMzY+m4otm9me9lF+rXwQlIkzW1l0M1wsQM765g2qYLvUomIlV3Xh3EvmKNkq82w4quwvriYSNXmezHGtFUh1YYRbh9zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YvC3RqYI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YvC3RqYI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785253963;
	bh=9Bh8kCV0LkjDu3jkPYXajb/gwkn1SmkxH4gYN3gqdow=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YvC3RqYI6S9fV2an63aV126TfIWw4t3u/1YlLn+E1H7ZmN9S3IwIPj9NsYBNS5gSy
	 te8fjil7xkJ41zzlUh7xCvDJnlk1l5xDp+P+8vhC6Y/VkDQUUq8oRXrEXflAS4vl4b
	 2sgie/qfU91LSSCHcDoJx3RjNoCshpOb6sBRxlxF0ZxMXGAO3AP8YfjtdyjQP8bomL
	 KtlTZu8OAR0cc97WqH7o7lA1oyv562Q4Ep6tTXRpgqZJnuXZ28qSPf+uZvaC06YBO6
	 yXsvSgPW+/jhdsTopZIHEr11EQenBU3pAooPqhr2ykiFTmmctnKie7l/XGZmXyah7T
	 Khl0fJjLinsQw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E49DF17E028D;
	Tue, 28 Jul 2026 17:52:42 +0200 (CEST)
Message-ID: <79379dbb-5e15-4e30-ab1d-136a40e77af0@collabora.com>
Date: Tue, 28 Jul 2026 17:52:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: mediatek: cmdq-helper: add legacy GCE ISA
 support
To: Roman Vivchar <rva333@protonmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Houlong Wei <houlong.wei@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260728-6572-gce-v1-0-750bba32689e@protonmail.com>
 <20260728-6572-gce-v1-2-750bba32689e@protonmail.com>
 <ebf419fc-24a8-472f-8996-a134ece69f21@collabora.com>
 <W3cNtJeiPe6gmMpfpNJOxa6NQtOyatXIFz6FyCh7pC8jkE90WX_1g3AgQwXadoba0BdHE3com-6cCkym5VCN5d-3sobraI8O4-TGwkqnWBA=@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <W3cNtJeiPe6gmMpfpNJOxa6NQtOyatXIFz6FyCh7pC8jkE90WX_1g3AgQwXadoba0BdHE3com-6cCkym5VCN5d-3sobraI8O4-TGwkqnWBA=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/28/26 17:47, Roman Vivchar wrote:
> Hi Angelo,
> 
> On Tuesday, July 28th, 2026 at 6:08 PM, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:
> 
>> On 7/28/26 11:42, Roman Vivchar via B4 Relay wrote:
>>> From: Roman Vivchar <rva333@protonmail.com>
>>>
>>> Some SoCs, such as mt6572, have different WRITE and POLL instruction
>>> encoding. Instead of 16-bit offset and 8-bit subsystem ID, old GCEs have
>>> 22-bit offset and 2-bit subsystem ID.
>>
>> What about poll_addr, mask, write_s, write_s_mask and others?
> 
> These don't seem to exist in all 65xx except 6595. TL;DR - old GCEs are
> essentially dumb compared to newer ones. They have only basics like MASK (0x2),
> WRITE (0x4), POLL (0x8), JUMP (0x10), WFE (0x20) and EOC (0x40). All logical
> operations as well as GPR/SPR don't seem to exist.
> 
> cmdq_pkt_poll_addr, write_s, write_s_mask are not used by the DRM subsystem.
> mask is the same across all GCEs because it takes only u32 mask without
> address.
> 
>> Not sure that this will actually work reliably (though I'm sure you're not
>> creating any regression).
> 
> I have tested this change (on top of out-of-tree mt6572 DRM) with some
> dd if=/dev/urandom of=/dev/null spam + modetest, as well as igt. Seems to
> work without issues...
> 
> Best regards,
> Roman

Alright then - look, I'd really want to pick this one up, but it's a bit late
in the cycle and I don't really have much time left for testing.

I'm sure that this is fine, but please understand me - I can't take this now,
also because I'm going on holiday very soon and can't be here to take care of
sudden breakages.

I wonder if you could resend it in the next cycle, preferrably at the beginning?

Meanwhile, I'll get this series on the Collabora trees so that it gets cycled by
the CI a bit (though, it's not enough, because that needs to be tested manually).

Cheers,
Angelo
