Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653C93EB10B;
	Mon, 29 Jun 2026 11:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782734380; cv=none; b=tHjFtjA0Su5rC5uHYHxNc96RYuBd49bLar0AFZR0vc5P19mK8yqhYR95eyGXUQ6KuGBFTl2+0vJfS4JM9SluGZIGPqoaoCErXpDs43bPIcO1VSMOBPUz9xOWoPRkX1GhdaRobhLOg/H+/oMMtI0BhjjhcGEYU+YF1EgU1UUp7Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782734380; c=relaxed/simple;
	bh=Lpn5QXx75NTgdaXFTlCUA3ps9jvTRH9t1eKrDXP3g1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ki9Gct849mhT699d6x5MNdlHV3kW67d/2T5vibRCzCHzngk2dCpvCuR10pXQY1OUB2vTh00zHZByf7wZxAUjFFuc17hTFQwXj+OnF+j7HUlfyBd4Pqh7iNTOQaInaO7OGqE9pQmYJAmF6b4XM9ojSPkUytRo4L/9ozAawAxV+Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FpbSdNuj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FpbSdNuj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DCF01F000E9;
	Mon, 29 Jun 2026 11:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782734379;
	bh=nlD9gBDSGthnpLs7mRaVqJct2G8s83VPHOhqBqnrraA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FpbSdNujsOFWBRPrHI9mek8x+VdNNTbhKxi3Jl5C1IU8AgoNupDghMEe4yRsVfqxL
	 r+Vv8uILazpMH9wsQQHZ1q7CP0NzqS8VRzzrsoDEajVXLHfBY5xcsCjHo4u48dokaY
	 /nV40wUh3l+uHD5cGMeLD46ZvTSFGHwS9mNVjEoRbCDVV6QPiIn8diTDkJLbSBw1Vs
	 gYxEB+PQEkaKh4u2M+x/mTJIrAGAQualgRg7pIZEPy58r4QA5Q8lwo4hURaBgeJ0jb
	 ysXLs2qKEqpd9dopIob6O4YujouvUJaXhpbIHnZ+o0r44hSWSRP3kfWKih+U8mLAdG
	 zy11Un3JrnP+w==
Message-ID: <aaf4af70-be2c-4d12-ace6-00cae6dcec6a@kernel.org>
Date: Mon, 29 Jun 2026 06:59:37 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] arm64: dts: socfpga: Enable SMMU and add DMA
 coherency for XGMAC
Content-Language: en-US
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260624062203.12221-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260624062203.12221-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/24/26 01:22, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> This series enables the SMMU and adds DMA coherency support for the
> XGMAC nodes across the affected board device trees.
> 
> Patch 1 enables the SMMU for the SoCFPGA board device trees where it
> was missing. The SoC uses a different memory-mapped base address for
> its peripherals, which requires the SMMU to be active so that the
> Secure Device Manager (SDM) can correctly access those regions through
> address translation.
> 
> Patch 2 adds the dma-coherent property to the XGMAC nodes. The SMMU
> is enabled and transactions going through it are cache coherent.
> Adding dma-coherent prevents redundant cache flush/invalidate
> operations and potential stale data issues.
> 
> Changes in v4:
> - Remove status = "disabled" instead of setting status = "okay", as nodes
>    without a status property are enabled by default
> 
> Changes in v3:
> - Fix commit header to follow subsystem naming convention (patches 1 and 2)
> - Remove commit body line that restated the subject
> - Clarify which file had the SMMU disabled
> 
> Changes in v2:
> - Move SMMU enable into the base DTSI file instead of individual DTS files
> - Move dma-coherent property into the base DTSI file instead of individual DTS files
> - Improve commit messages and cover letter descriptions with more context on why the changes are needed
> 
> Nazim Amirul (2):
>    arm64: dts: socfpga: agilex5: Enable the SMMU
>    arm64: dts: socfpga: agilex5: Add dma-coherent to XGMAC nodes
> 
>   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 


Applied!

Thanks,
Dinh
