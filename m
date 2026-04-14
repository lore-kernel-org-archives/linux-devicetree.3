Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA76A37CD31
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 07:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776151009; cv=none; b=qB6sJj/9/rIASnPdzXweJhJT6KCXM1kJscThZl3pKMqE8vI/HezUcXRTe1HWjS2rT5KYq3OCf53ZtONf6+enJVorhMV4aaiA6L9pQdZRfKazwsvo4Cbcemh6SI4S8hA+Es1alFe3Hqhu1dPRjltNKw0g+N8cD6eme3FyZ7+IobQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776151009; c=relaxed/simple;
	bh=Oyu9hMZpLdbkIeLLjHSSf/QrtpxQZFaZr442VT2jh9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W1sp/FjiaBagc5QovF8xl6HUGbziVP7g7P/SFSUD/JXp7qvHBiADavv+WDCzExq4M36e5CUwIgk0qExQl06Rqdkx1xIqrKMmEKYmg+ZqOXxLvEe1bqj+poojmJ+wKvfLQL0ntEuFJwudcy7asH/H6LLQ5yaQI8heXyNyYBXr35I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O6C1sVnr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O6C1sVnr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CD94C19425;
	Tue, 14 Apr 2026 07:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776151009;
	bh=Oyu9hMZpLdbkIeLLjHSSf/QrtpxQZFaZr442VT2jh9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O6C1sVnreaI0jCGpj8UCyJEgx4DrxCSc1iDz6SgiGYoBxJKsmKZ53hlcEbXeCgCDp
	 B0SRqC5hw/gke7FOqiKddfVd1KTflWnIUp/OR7A865wJMF6AIAyuoOlrWOZvZ1JLje
	 z9F8aK3lpNWRq/LW6TCD2qkv4gqUiLDp4J7WUZmZlWJcufpT6twaUlBpefxG6gwohP
	 cuQYZvxn8gKVYQ2P8er5rFEWD6dh/tCJ+O93hHZM/GR7Wc18T4Zdy+Jlxn7tNF/wAg
	 iC2CGir+de6EsFHs5miew19XEHF4EkTme2fEDYP9Y6yFhvZsQkQ+bDW+pys117zKHd
	 Q5mOd41GU/qCQ==
Date: Tue, 14 Apr 2026 09:16:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: socfpga: Add the Agilex7 series SoC's
Message-ID: <20260414-goldfish-of-striking-shopping-aab9a0@quoll>
References: <20260413144553.132737-1-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260413144553.132737-1-dinguyen@kernel.org>

On Mon, Apr 13, 2026 at 09:45:52AM -0500, Dinh Nguyen wrote:
> The Agilex7 is a series of devices from Altera that are derived from
> the Agilex family.

SoCs?

> 
> The Agilex7F device supports PCIE 4.0 and DDR4. The Agilex7I device supports

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

> PCIE 5.0 and DDR4, while the Agilex7M device supports DDR4, DDR5, LPDDR5
> and PCIE 5.0.
> 
> All other peripherals from these devices are the same as the Agilex
> device.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/altera.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
> index 206686f3eebc..5ee09f8d4698 100644
> --- a/Documentation/devicetree/bindings/arm/altera.yaml
> +++ b/Documentation/devicetree/bindings/arm/altera.yaml
> @@ -115,6 +115,16 @@ properties:
>                - intel,socfpga-agilex5-socdk-nand
>            - const: intel,socfpga-agilex5
>  
> +      - description: Agilex7 series F, I and M boards
> +        items:
> +          - enum:
> +              - intel,socfpga-agilex7m-socdk

Why does "7m-socdk" go with "7i" and "7m"? If these are SoCs, then board
using soc 7m cannot use 7i or 7f fallback.

Or board is not using 7m SoC, but then the name is misleading.

> +          - enum:
> +              - intel,socfpga-agilex7f
> +              - intel,socfpga-agilex7i
> +              - intel,socfpga-agilex7m
> +          - const: intel,socfpga-agilex

Best regards,
Krzysztof

