Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1738466B5D;
	Tue, 21 Jul 2026 10:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629614; cv=none; b=BxiT8rflEwN3gsbhfFtYhBuzj1w8ms7hk4Aeb8kWYy0/P+Q3q6cer3mGyQruyJspC+h4jllOg8GvUNMExOHy+8tVRKIUx0qWVMLgQQ8SVoz/qcItkr8Jo7jDyI+dcBXewu9xBRCPiR7nul6hQLkFbhHIkVlFZGJdQKcxpkToCZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629614; c=relaxed/simple;
	bh=Kq81TTJJIonskqg6lbotdHaXvfQ729EiSBkOtiRhBi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZcYjLzz2KyWGEGU28H7D32cjXqeDbx53oVCk/5i/1xp/ZyMmo66cuinUW2zCg35T0nz7hSbC4hcT9iRScqCP7yTSDRH9vPL1v1zlnqbzVximyVzxLH23/qawE1gTsmIxVAMMeyvixLZAS0pjq4xIuTZWuB1pTFOvnsV48Ss8eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ig/0DHRi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ig/0DHRi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18A71F000E9;
	Tue, 21 Jul 2026 10:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784629612;
	bh=Zh3w8+jjbVnPw0DXH04DAtECicrcIUbytkatdIYpeJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ig/0DHRiCub+U+8/2KmC/iEZeMipcKt7nx2ubLj+F+nL9St1WYlQGz2umeaiesLvQ
	 nIyyQqEaJnvndZ6nbIBMDAsrsw0erPa1w8FPphdPfKRfLMKlLkmBxHEVikmGNloi2p
	 fC/lM6i2IfZxpjYdw3MPM9U/ay4HSDJWipt6PEj9YubTYG01PPBV0+z4Hxt7mV85JC
	 a+g/cJPf5xSPHO18RVf4AObR4fOGNJOo/OvANS+urntCRAg1CF/vtUOvoodB60SD33
	 wsBmWhgbOmaprxMWn40W0PCQqeUyeIVe4PFy5IAK+ldS6ydS5akgYAFd/E/0UzXk8D
	 RQIAjmvyWJTGw==
Date: Tue, 21 Jul 2026 12:26:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, inux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, guf296@126.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8750: Add Lenovo Legion Y700 Gen4
Message-ID: <20260721-proficient-happy-porpoise-dbcdaa@quoll>
References: <20260719093226.197740-1-mitltlatltl@gmail.com>
 <20260719093226.197740-3-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260719093226.197740-3-mitltlatltl@gmail.com>

On Sun, Jul 19, 2026 at 05:32:26PM +0800, Pengyu Luo wrote:
> +
> +	reserved-memory {
> +		/*
> +		 * Use this to tell the BL to initialize the display related
> +		 * resources, so we can use efifb. Please 's/-/_/'
> +		 */
> +		splash-region {

Missing unit address.

> +			reg = <0 0xfc800000 0 0x2b00000>;
> +			no-map;
> +		};
> +	};
> +
> +	vph_pwr: vph-pwr-regulator {

foo-regulator but...

> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vreg_iovdd_1p8: regulator-dsi-1p8 {

... here regulator-foo.

Please write consistent code.

Please use name for all fixed regulators which matches current format
recommendation: 'regulator-[0-9]v[0-9]'
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml


Best regards,
Krzysztof

