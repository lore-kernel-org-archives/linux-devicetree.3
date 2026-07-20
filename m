Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7BD37AA87;
	Tue, 21 Jul 2026 00:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784592013; cv=none; b=mQXQMpCh3fRZh+l3TLMlP76Ei+t/6pns9R3V2W1PGdbEockRSj0HzuL1F49+okLzmOEpcU4nNUYQkDMpQf+PwvQlibvqF5G9m5IulHul+8kFQUCMco1kkjKTUQRNin9ppyEdkgU2MWnWMSf9iVeoRaQlI6CSmWIFQWaesluFFqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784592013; c=relaxed/simple;
	bh=Sf5ZpRVPvGF6s+mORjWYGFZkLO6PS6W4keQ9Of4ikIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LaJ0X11Z/A6vy3qkgrXtKgUUtY51sLgs3zEmQZs2A7UTT68IWinpY/l4fEZKxRMcmuVBK7sepdRYFBP+xKogDhB1BDQxWKWO4Dlmd0O7JOzccJrP7dGlVKXsEFhUkB7roLNByn6PaJMji/hHFbOqb09VjKanFrrDJLMpkC5wHDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwvJ87al; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwvJ87al"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C65501F000E9;
	Mon, 20 Jul 2026 23:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784591997;
	bh=SiVJTdCsi3lcgS52ImtngxT2fIovSmwW2tnYtpoBxFU=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=dwvJ87alMzB7g3JLe5T7aXvgAS6F8g+cd7ktqOEmKU4ci9Ay0YaG4LeZ7BHBHY/5o
	 pZFSpKQZHsHTuha8ts0lKahMHkxc28mFihQGUysFktKL+mAJg70n7Xf9S3v+wZUTNp
	 TNzeaYDXWVEpQynYkWE6HqozMWw15Ke6tro7VnGlAeZJ02L7WshVXYTspcm7jmTyNr
	 Uef5JO7xl2kFxfeO0+h/DnUz5vIAMiUH12YOk0+gAMsg2K+OhmNfotlPe7td6cdaD6
	 3pqIfGL7OlF0fRwJsKmEjxBkP8lqnUniJ1v5yGfRDJZ/SrY5B+Do9+0DuCwZozA34e
	 7w9XLjU8gEVqw==
Message-ID: <35520e5f-eccd-4516-875f-2a042107b237@kernel.org>
Date: Mon, 20 Jul 2026 18:59:55 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: stratix10-svc: add support for agilex5
Content-Language: en-US
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1782135785.git.adrian.ho.yin.ng@altera.com>
 <c096c728b7becf027b6e9fcc4aa1cc5dfe3cef3a.1782135785.git.adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <c096c728b7becf027b6e9fcc4aa1cc5dfe3cef3a.1782135785.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/22/26 08:44, Adrian Ng Ho Yin wrote:
> On Agilex5 the DDR base address starts at 0x8000_0000, which is
> outside the addressable range of the SDM. The SMMU is used to remap
> DDR-allocated buffers to an IOVA within the SDM-accessible 0-512MB
> window. Return -ENODEV at probe if no IOMMU domain is found for an
> intel,agilex5-svc device.
> 
> Configure a 29-bit DMA mask to constrain IOVA allocations to the
> 0-512MB range accessible to the SDM. Agilex5 REV B introduced a
> hardware SDM address remapper; bypass it via SMC so no additional
> offset is applied to the IOVA, keeping the implementation
> consistent across all Agilex5 revisions.
> 
> ATF validates FPGA_CONFIG_WRITE addresses against the DDR range
> starting at 0x8000_0000. Since IOVAs are below 0x2000_0000, the
> driver adds 0x8000_0000 to the IOVA before the SMC call so ATF's
> is_address_in_ddr_range() check passes. ATF then strips the offset
> and uses the SMMU to translate the remaining IOVA to the underlying
> physical memory for SDM access.
> 
> The firmware COMPLETED_WRITE response returns the raw IOVA without
> the 0x8000_0000 offset. Compensate by storing dma_addr_offset in
> the controller and adding it back before the svc_pa_to_va() lookup.
> dma_addr_offset is zero on non-SMMU paths so existing platforms are
> unaffected.
> 
> Fix a pre-existing bug in stratix10_svc_free_memory() where an
> unknown-address fallthrough called list_del(&svc_data_mem),
> corrupting the list head. Replace it with dev_warn().
> 
> Register a devm cleanup action at probe to reclaim any DMA
> coherent buffers that service clients fail to free before driver
> unbind, preventing memory leaks across probe/remove cycles.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

There's alot going on with this patch! Can you split it up into smaller 
bits? And what part of this patch needed for the DTS patch?

Dinh
