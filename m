Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE6242643A;
	Mon,  6 Jul 2026 12:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783340816; cv=none; b=k+Q9ISfL1rq2EUSABCD9H7N6XvfCV1jGmMdeg/2RLiUEL+iLWTNbvT3teh15EDc+eB2XmI+930DUBvX479EqVDcXPIDlU/wUX2D9ThDoJDc28Idix3xE12HxZ2r5VFirWl7zPbaySSVuVdFHi+qE/jZPDhYa3DDs0flCl5QG2EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783340816; c=relaxed/simple;
	bh=R5iW2J4Wt0b/7Civ7nHldFkoAQLPimKYVhJmdKvmcAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cB8Ywm0DGdhJekLuBB9fxRI2mDdiEiVdafwGmgJWEXVYRwsLypnzjOgfOkIaYUYYMeUbBJE2iV1NaxeI2x8PNgNOC9an3bvM+b6tjq2R/+M9a9N9bIh92p7iqpviwt4n1TrvnkZjSXHSJ2wk4m+nCAlI+OtlzWTci91DylDSu9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWzDCUBB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWzDCUBB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAEA01F000E9;
	Mon,  6 Jul 2026 12:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783340810;
	bh=ubzG+N5dF7Qux5Abapxe09RhaKIm4ikD7IMFkXKdFms=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JWzDCUBBafu61PBzD6eebOiSNJfoKLUuHka/9VffasSZ8L8q0xr+w3U7TMp1JtlEP
	 gFv8blBOh6J3Bu8nJEi8VcH5w9X/u50AwP4mTr4vNHm+vssahZ/WFM5C05CapZLGEq
	 zVp1l8Rgma9AYRCl6AXOHq1NBGbbnEPakkoSMCvbkY2e5D5Nme9xu3919+VMPbTBL6
	 KbUlvSZpDCD9YtjfwQVD3xvb+zIy08Pemv5sO/yuvJ9BmeIK4XWI7f6idX7XP9LPhJ
	 VxX++lPcgqjjKnpg2US7KUnGaHhEHg+pv7d/wqlaHoAUyw5cfaHogXbjKFCiHT+isq
	 TzZOa1D8coDig==
Message-ID: <0b4d9e54-d443-4690-850b-1cc9ac59869f@kernel.org>
Date: Mon, 6 Jul 2026 07:26:48 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] arm64: dts: socfpga: agilex72: Add initial device
 tree
Content-Language: en-US
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260625065329.20274-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260625065329.20274-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/25/26 01:53, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> This series introduces basic device tree support for the Intel/Altera
> Agilex72 SoCFPGA platform, which is a new SoC featuring a heterogeneous
> CPU cluster (Cortex-A520 and Cortex-A720 cores).
> 
> Patch 1 adds the new compatible strings for Agilex72 to the arm/altera
> DT bindings documentation.
> 
> Patch 2 introduces the initial DTSI and board-level DTS for the Agilex72
> SoCDK. The DTSI covers the core SoC nodes: CPUs, GIC-v3 interrupt
> controller with ITS, ARM architectural timer, PSCI, SMMU-v3, OCRAM, and
> two UART serial controllers backed by a fixed-clock placeholder. The clock
> manager driver for this platform is not yet upstream, so a fixed-clock
> at 125 MHz is used as an interim solution for the UART clock, matching
> the hardware-confirmed LSP_SP_CLK frequency.
> 
> Changes in v3:
> - Add UART serial console (uart0, uart1) with fixed-clock placeholder at 125 MHz
> - Add aliases and chosen nodes in board DTS for serial console
> 
> Changes in v2:
> - Applied relevant feedback from Shahsiko's review
> - Re-add arm,armv8-timer node which is mandatory for kernel boot
> - Rename platform from agilex7-gen2 to agilex72
> 
> Nazim Amirul (2):
>    dt-bindings: arm: altera: Add Agilex72 SoCFPGA compatible strings
>    arm64: dts: socfpga: agilex72: Add initial device tree
> 
>   .../devicetree/bindings/arm/altera.yaml       |   6 +
>   arch/arm64/boot/dts/intel/Makefile            |   1 +
>   .../boot/dts/intel/socfpga_agilex72.dtsi      | 156 ++++++++++++++++++
>   .../boot/dts/intel/socfpga_agilex72_socdk.dts |  27 +++
>   4 files changed, 190 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi
>   create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts
> 

Applied!

Thanks,
Dinh

