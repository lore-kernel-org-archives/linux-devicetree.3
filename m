Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D66448D13;
	Wed, 15 Jul 2026 12:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116864; cv=none; b=sL7buc3CmjsOz8dSpRjOPoBc4YVzJAsF6FzjtrRpwnEjZbllrn5AsE5UWoXDjzNIyFCwTJHGrERKyUJqpDPp8f4Q+xv4cWD6iBCiiOEHiBH2Uupn7VYfhCDLaFBi9E9EbkFS3raNuE5JoJi1CXAt77xE/R3jIRXnDCSeCffzVHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116864; c=relaxed/simple;
	bh=YxDIJjLunXFjPXYlZNPG+F+TXz5f9JYTX8dKFMJ8Fto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fh5yPK7PYTQmAN/r/kdossvItRoi5xA+XML7E5/vij5fqiUXPKISUS+xKyB2IXfiHrXYIV5GPT6VvppRS+iRGVSuFNh1czfI/uFLwbXLNlyc1j13Hrfe3pl97fx9Bw2KBkmNmNHgMpAtQPywwjzdiR/XYEm+ocJuIUhWGXWHvLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ok9cbby4; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ok9cbby4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784116861;
	bh=YxDIJjLunXFjPXYlZNPG+F+TXz5f9JYTX8dKFMJ8Fto=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ok9cbby4QZVRUcodeY8oSolFWZTcfJ7iK51/Ee0ySsKd+QnXmsYI3pzz5d0kuPV1D
	 cSL7S1oug0X02dy5wpsKsszBYaWLh4ASC3kUMDFAVEqN/q+BdWN3h176zGYXdJCGZj
	 H5iEG7QuP/IQsKN58oOQzBCsXpd7mDm3vwrDROHMdup1W0hgnSqhQpxvra0/9a32BD
	 EvnHeeYgROk6AYUCeMrxyA/UTnJsCwecIYnj05jtTMpN6rVTUnDux356ldgaP46iqG
	 PpspMKxeYFVp5kiBUkENLAPmuK+9rqY5uEnl3B7gWwqHq9XHb1Rdr40CautHTWctM0
	 tAbqEYZKppXyQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 41F0717E071A;
	Wed, 15 Jul 2026 14:01:01 +0200 (CEST)
Message-ID: <d2a9089f-9c86-4c92-8f6c-e85952ab8502@collabora.com>
Date: Wed, 15 Jul 2026 14:01:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] soc: mediatek: pwrap: add mt6572 support
To: Roman Vivchar <rva333@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Flora Fu <flora.fu@mediatek.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260714-6572-pwrap-v1-0-d8e5a39cf7ef@protonmail.com>
 <20260714-6572-pwrap-v1-3-d8e5a39cf7ef@protonmail.com>
 <3c112acd-5709-4144-9cab-54e0a51eefc9@collabora.com>
 <4W-fQkS-fQ5Wxua-0vkMZoLw98eklcnIN_ivaYjpWLIVX7qfCBjHGRJq8xQ59PTTIUNbzdT3EqkCsVqz_smuozi0Q3kq4antn54-rPXdmdI=@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <4W-fQkS-fQ5Wxua-0vkMZoLw98eklcnIN_ivaYjpWLIVX7qfCBjHGRJq8xQ59PTTIUNbzdT3EqkCsVqz_smuozi0Q3kq4antn54-rPXdmdI=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/15/26 13:24, Roman Vivchar wrote:
> Hi AngeloGioacchino,
> 
> On Wednesday, July 15th, 2026 at 1:21 PM, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:
> 
>> On 7/14/26 14:42, Roman Vivchar via B4 Relay wrote:
> 
> ...
>   
>>>
>>> +static const struct pmic_wrapper_type pwrap_mt6572 = {
>>> +	.regs = mt6572_regs,
>>
>> MT6572 only has PWRAP_OP_TYPE, PWRAP_MSB_FIRST, PWRAP_GPS_STA additional registers
>> compared to MT2701, and the three are currently unused.
> 
> GPS_STA is indeed unused. As for others, downstream kernel includes mt6320 path.
> 
> //###############################
> //Enable 6320 option
> //###############################
> #ifdef SLV_6320
> WRAP_WR32(PMIC_WRAP_OP_TYPE ,OP_TYPE_CSL);
> WRAP_WR32(PMIC_WRAP_MSB_FIRST , LSB);
> #endif
> 
> Though I haven't seen any mt6572 device with the mt6320 so far, as well as
> pwrap_init_chip_select_ext is configured for the mt6323.
> 
>> Instead of adding yet one more huge array for 3 more registers, since I'm mostly
>> sure that those will never be used anyway (happy if you prove me wrong!), you can
>> at this point just use mt2701_regs for mt6572.
>>
>> Perhaps, add a comment saying that MT6572 does indeed have those additional regs
>> but were omitted because currently unused.
>>
>> So, something like
>>
>> /*
>>    * MT6572 has additional registers OP_TYPE (0x10), MSB_FIRST (0x14), GPS_STA (0x40)
>>    * which were omitted as they're currently unused in this driver.
>>    * Apart from that, the register map matches the one from MT2701.
>>    */
>> static const struct pmic_wrapper_type pwrap_mt6572 = {
>> 	.regs = mt2701_regs,
>>
> 
> I'm not a big fan of dead code, but at some point the mt6572+mt6320 may exist.
> Would you suggest keeping mt6572 array or drop it until some mt6320
> device appears?
> 

Nah, please, drop it until some MT6320 device appears.

Besides, you also said that you haven't seen any MT6572 w/6320 so far, so it's
even more unlikely that we'll ever see one.

While at it, could you please also add the information about MT6320 cases in
the commit description?
Something like "blahblah additional registers blahblah omitted, those seem to
be used only when the MT6572 is paired with a MT6320 PMIC blahblah" :-)

Cheers,
Angelo
