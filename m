Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587B13BC678;
	Tue, 31 Mar 2026 07:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941087; cv=none; b=gHXRyPfFw7ytg0we6Jd5p7tSTODHYgWNAex3g1ZZORZ9KOVdsqH7vSxqEX9ACnUM0S2UmJxIMNaZAJX2BUp4Ro7f9soS3QFy9YvpThZP3nGz7ytiDrtzCjrPjAU+zWQ1Nwr1S0gFpaqMzlenNkP26CSbG7/J0rNBB9JwoNfkOhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941087; c=relaxed/simple;
	bh=XdwZEdTlh7eUy97pvQnqE/71BTBUar0XRDwzHcXBMRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgaVAbWksB7Rd4YozVhBAucjPr2OjsnpZdKijvmTKHBigSNO6peHw3cOq0mEAecsvgANvP9lOUADkkj7zY2YZKnpvsPHRPUUQOv7h0h2stKvX3wsC5xsNe8HKQVmtSjwJbKL9GCdi2U85LlRfE5RqbFW3fkDp7zUAuuA3rN3QHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QyRC3uPK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QyRC3uPK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2919C19423;
	Tue, 31 Mar 2026 07:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774941087;
	bh=XdwZEdTlh7eUy97pvQnqE/71BTBUar0XRDwzHcXBMRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QyRC3uPKayasDp5XbK4TcodAQFVigapbBpUw7l9SV5fn2FogMcr0+0H3k3CwEub67
	 ut/eKMiFQW9cbDFEPtncQEvdwRLGDky5jsRNpdVTZJk2L76YBU2H8GJ5m7UxFokgeN
	 Joa8xlffQh7E0Z4x6TX7PnXOVqLpnVFzwADKCsHY6IaW3pWEY3XweYAqXvCK5NTeT2
	 HpaR1oiw3WuQLEIOucFlXBGQNA8CgO/Mn/O5t6qilNFgnNahLE0EnVSPD32geOl9ca
	 nGD0YLzJIO196sqPtQRsydsJ6XIKflDTNFC93Pp87Q8RIoqlVLu3t279lE6fjAi5Mk
	 TUokJqkNqWrjw==
Date: Tue, 31 Mar 2026 09:11:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Moteen Shah <m-shah@ti.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, nm@ti.com, 
	vigneshr@ti.com, kristo@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, u-kumar1@ti.com, 
	gehariprasath@ti.com, y-abhilashchandra@ti.com
Subject: Re: [PATCH v3 2/2] arm64: dts: ti: Add audio overlay for
 k3-j721s2-evm
Message-ID: <20260331-fabulous-bipedal-boobook-b11a27@quoll>
References: <20260330094459.128648-1-m-shah@ti.com>
 <20260330094459.128648-3-m-shah@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330094459.128648-3-m-shah@ti.com>

On Mon, Mar 30, 2026 at 03:14:59PM +0530, Moteen Shah wrote:
> +	p10-hog {
> +		/* P10 - MCASP/TRACE_MUX_S1 */
> +		gpio-hog;
> +		gpios = <10 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "MCASP/TRACE_MUX_S1";
> +	};
> +};
> +
> +&mux0 {
> +	idle-state = <0>;
> +};
> +
> +&mux1 {
> +	idle-state = <0>;
> +};
> +
> +&scm_conf {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	audio_refclk1: clock-controller@42e4 {
> +		compatible = "ti,am62-audio-refclk";

there is no am62 compatible or DTSI include in the parent SoC file, so
am62n seems to be completely different device than j721s2.

Why does am62b appear here in this context?

Best regards,
Krzysztof

