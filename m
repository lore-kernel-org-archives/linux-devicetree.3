Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005045;
	b=Epoa//UGYNHamamLB2Sqy54ME6ZFbn5txZywfx3bwUYz7DUh5uV2fhTrNt6Y4pjMvlEp
	 1htbdMOgzLqmWW5iMpwIZiW5OsrG9dn7lnXwhleVPr1mw1sUeOl3anLjGTGDsatm6GvOC
	 iVwvm4D8Ni/gdPEpjaJ81xjcUjSDTLcUhff3OJOFoFB9LChDMmvfN43YfGGuiRCt3SVnM
	 53T0TU+jYVFsBpM24NTwcBM8x2rkXoffv97PCZjM39+FAt/4jXn9Gg/xbKlQnPd3Jrp1z
	 vlr1ERst7Ry5Zh1uLa2oKlKgKy8u1CMjYtjQ47qDGm8Lt+rHnH6FcxGxIOJbv0jSxRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005045;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=m6c/qR56253imWhk36Gac7berOasezUTnHhNbfxYNQs=;
	b=pJnNUTaXMZnVv82h/Lf1oqpAVu77/Cob4SepJXtA6bwpr5qPj99Ez47UajK7unWcrj4k
	 jsoLEVr0NEwhg26UbEHit8QShl8YhHJ1maDv/+zf7G4QB6/KXB05DhKhegJ4Byxxy+Rw3
	 xQqj1zfuTebG6s//FepRWJx+P4KlaXF5gtCU1s56KoFgMeamxta/tpI+U0Yqazk6qucJy
	 MYxCLjLi4zwLyfROZIYAca9xWUvsVT/Kg9+WN8kUpmq/7BpQvhCOM5iYtGubZlZQTvIte
	 9DMnvMhfw4VpbMzIjgXknLlGsSeVBS1gYRDZ4OLMd1g6cuuz/Sjtr4B30LkbPBzHnug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=J6xF+Kr0;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85CC606A31C;
	Wed, 18 Nov 2026 12:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D85CC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=J6xF+Kr0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795005043;
	bh=OrEqqezQnIfFeKtDs9yFRb0TBIDDG9P+MV5KTuORKgA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=J6xF+Kr0e06RAg6AcR/bhID/hpKlAsFDZ3vGBMYsF1DG5vepCedI4aFuAGOxfK1TK
	 z8rtXYQuMimFfItjbiBz3XpHDwND6lj3um2VekcpWy59DG7Bb5aVeXTJuGfURRgZQw
	 tyxn/wJfMzaypwoG1xRi/mr+sGWDVqxVptc2XAES6Nn7GqXMm+eJtjGpPip4IvChLQ
	 yqda27wlsuZpe4DRGIK7UF32JDAZGjjFph5YFtmF5fzZbpaSq3iPPWg8CfgM7ZNnbb
	 i8uEXKd3z1SGE+V3/ejDI9dfBiG3EHvrCTHcbUhkxWzVrRwhiXR4QIqns5o+4ZE2fx
	 JG6r0/f8W3Nsg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B43F917E052F;
	Wed, 18 Nov 2026 13:30:42 +0100 (CET)
Message-ID: <68df102e-66e0-4049-9ffd-8e2746db8403@collabora.com>
Date: Wed, 18 Nov 2026 13:30:42 +0100
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
Subject: Re: [PATCH] arm64: dts: mediatek: Remove undocumented, unapproved
 aliases
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
 <3882ec4d-9f99-4419-8914-19c3a2a3cc46@collabora.com>
 <96e3cc39-d10b-4743-bd9a-d683a91fdf34@oss.qualcomm.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <96e3cc39-d10b-4743-bd9a-d683a91fdf34@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 13:09, Krzysztof Kozlowski wrote:
> On 17/11/2026 15:06, AngeloGioacchino Del Regno wrote:
>> On 11/17/26 14:05, Krzysztof Kozlowski wrote:
>>> The ovl, aal, color, dsi, gce, rdma, split and other aliases were never
>>> approved by Devicetree maintainers, because they were never documented
>>> as actual ABI.  Drop them, because no new custom aliases are allowed for
>>> years now.
>>>
>>> This might break users of this undocumented ABI, so these should be
>>> updated to use only documented and approved ABI.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> That'll just break everything.
> 
> True, almost everything. I suppose few aliases are not used, but rest are.
> 

Would still create regressions, and that's not acceptable - the cleanup can be
done only - and exclusively - after addressing the situation elsewhere so that
no regressions are seen.

Still, a question mark remains on "new DT on old kernel" compatibility which would
miserably break - that may not be something to care about in this case, and I don't
think that it's time to start thinking about that.

> Well, it's a start of a discussion. :)

Yes, I like this spirit.

> 
>>
>> I do have a mediatek-drm restructuring series that is partially resolving this
>> situation, at least for some SoCs it's getting 0 and 1 hw instance id dynamically
>> recognized, but with some caveats that could be unacceptable (as in, if 0 is
>> disabled and 1 is enabled, 1 becomes 0, so it's not actually resolving anything
>> for real, it's just making it tick right when stars in the sky align in the
>> right way, which for some SoCs is reliably possible without side effects).
>>
>> In any case, all of the ones that have only instance 0 (and all of the instance
>> 0s) can be removed even right now already (still needs some testing to make sure
>> that there's no regression), but everything else can't, at least not until the
>> whole restructuring thing is merged as that'd break things.
>>
>> Worst part is we have two new SoCs (MT8196, MT8189) ready to be upstreamed here,
>> which took almost a year of development... and it also does rely on the aliases.
>> I was in the process of slowly cleaning up those (as I said, there's already a
>> restructuring that makes things a little better in this regard), but at this point
>> that'll need to be done with the highest possible priority.
> 
> That's unfortunate and still new DTS/DTSI should not come with these
> aliases.
> 

Indeed.

Since conversations went on in the other thread, though, if we have to spend any
other word on this topic, I think it's a better idea to continue on the other one
( 94ed1340-94bd-49ee-ba31-9bb63164c89a@kernel.org ) and let this one go.

Cheers!
Angelo
