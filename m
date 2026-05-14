Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B723A783E;
	Thu, 14 May 2026 11:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778759918; cv=none; b=tcG3Id2znZE5dQEp9tRUNyKOwA7xmLv3RV7JN/FmxFaRauX/4icfKlrtH/IVllUco2udrPMa8g2jzFjjhZ3Keao9nlOcAqF5eFqmynNXbtRS8jQw6ddjuQvMLG2vHGR/083WPgLvFX/3Tp/TqFqhf6f29vSlM5g/NnJWAoihgL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778759918; c=relaxed/simple;
	bh=cP7vBRjto0Od6hPwUrxpJPX5C1cOvW9fCZloovO92yk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HGIsWAPenMMnQUDZ8XXiq7cSmSu1T72bjSKQKx1idH9Oa+WruL4H/BVdQ6xwP8YIdvjoWXuQoVJ3Q/cLlxUSmJeZ4eLMpSJKJcUCybyyUxx4K9noFXchip7CAI+1mStQ5XpP+wHJtWZ7rBoylvb7AtpoMaDF39TUvngeQxCcdoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g2tKX3gI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g2tKX3gI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40699C2BCC7;
	Thu, 14 May 2026 11:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778759918;
	bh=cP7vBRjto0Od6hPwUrxpJPX5C1cOvW9fCZloovO92yk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g2tKX3gI2mKWMo/y3h3hPs/WksZanf1vX/WLc1WLmJlFrdi7cvZG+Ssz0vKTrFuZ7
	 HQY1OWP4ztQ9XDiRDh7uxwrG+ey6nIkDUqeHbw1CQyBHUvXyc7/bwzq6N3uFcugNuU
	 NuiinuzzZLQpmFXtcYzmt2BrRkWiBISaHX258yE2AvxumgOBoRQ0xX69GvUjxa4vS0
	 VhfJtk4dpANL3OXPhPZKvefz+XQ2N1YSA2Pl/QhlLPy0zLh/C0+3sg9F0Fov++NQjB
	 Y+G3yRNneXRVjXNSkSvPNCqMs2b6fv1CCedF3q4gXsl2DXQivK1QIBeKN2Ate2j3Hi
	 vgnZLmoXYxnGQ==
Message-ID: <4b74eb09-4265-47ac-93fb-f6ad7f231b04@kernel.org>
Date: Thu, 14 May 2026 06:58:36 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: socfpga: use consistent QSPI boot partition
 label
Content-Language: en-US
To: tze.yee.ng@altera.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: adrian.ho.yin.ng@altera.com, muhammad.nazim.amirul.nazle.asmade@altera.com
References: <eff34df0c67d39a26d20ec91eda8dd9e15f9f5cc.1778658884.git.tze.yee.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <eff34df0c67d39a26d20ec91eda8dd9e15f9f5cc.1778658884.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/13/26 03:05, tze.yee.ng@altera.com wrote:
> From: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> Several SoCFPGA board DTS files labeled the first QSPI MTD partition
> (qspi_boot / partition@0 under fixed-partitions) as "u-boot" while
> others already used "Boot and fpga data". Align the QSPI boot
> partition label only so naming matches the combined boot + FPGA
> image layout and stays consistent across Agilex, N5X, and Stratix 10
> SoCDK variants.
> 
> No QSPI partition layout or reg properties are changed.
> 
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> ---
>   arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts         | 2 +-
>   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts         | 2 +-
>   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts    | 2 +-
>   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 

Applied!

Thanks,
Dinh
