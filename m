Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F902EA154;
	Thu, 11 Jun 2026 10:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174370; cv=none; b=AynGPq+uKGAEgCmrSch2OziVfMvu3QqmEPNuw57TlYwDjGVgV0ez9h1jF4oGqsXA6qd7sGXxmpnZFEvpdRSn79dSt7Vi6EypHvwTHN3Q/2YLxA+4HJyjV6Ie2AmyACkwCvJvxxOsT/IU9p90esubFSCHaz9YKWwnLV3FgqBS4G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174370; c=relaxed/simple;
	bh=WltHJUfd0xr3v0RsOZDFLxauT/NJfdf3oq82Oh1X/EI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PL5g/8MSHn4hDPJXV6pOy/78Xi51J91YHpak9K+nwIwTNM7FMIdEh6BL6obbmcyBxXGvD85/UXf8+h6hjWCssLilIGw70/0QninOnVnRPhqEP1xIFtMZlBlgAl+SSE/h8/BAln5R/wEGsmovfTzpTORiYOwarNNuO2Hqq4N5228=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MY6febmp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MY6febmp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589B21F00893;
	Thu, 11 Jun 2026 10:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781174369;
	bh=hIfuSrctBzrlRdhYCXK7h/WnxikqtQHpoiE+oxwzsr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MY6febmpsry/al3XEKzqKYMuzgxuePM+9nJyS4i9WZ45kZSlL8HrLJM3R4WoBNmQH
	 D1T5Wz2sepTzcqeAq0os00hsnuUMpVbIDGOHUMNLlIVsySaiC+DIwob50VAZ8aroOY
	 hQr2qRdQRJuH5XBTR7lVe7cS3tF61DfxzC5XohTNBFmDaF0HdDS8Ge6xlQTZm58st1
	 X7VCo+uDXqtmVw+OpaRiA3jlmMhuynr5jadc7WldV8IChUIwEHVFjTSHFhmjX9SGtY
	 FMJdHGRMLEmM0JeLNEtAIMKdCMtFQZyipnZIIN8zP8nbPxLGFGfvM/cu3auimEVzEF
	 koYBtLsp+P6YA==
Date: Thu, 11 Jun 2026 12:39:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Amit Barzilai <amit.barzilai22@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, javierm@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: Add Solomon SSD1351 OLED
 controller
Message-ID: <20260611-psychedelic-funky-foxhound-a8e39d@quoll>
References: <20260610164428.180091-1-amit.barzilai22@gmail.com>
 <20260610164428.180091-2-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610164428.180091-2-amit.barzilai22@gmail.com>

> +properties:
> +  compatible:
> +    enum:
> +      - solomon,ssd1351
> +
> +  solomon,width:
> +    default: 128
> +
> +  solomon,height:
> +    default: 128

Drop both - deducible from the compatible.

> +
> +  rotation: true

Either drop or reference panel-common (if this is a panel) or at least
reference that property:
$ref: /schemas/display/panel/panel-common.yaml#/properties/rotation

> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        oled@0 {
> +            compatible = "solomon,ssd1351";
> +            reg = <0x0>;
> +            reset-gpios = <&gpio2 7>;
> +            dc-gpios = <&gpio2 8>;

Use proper defines for GPIO flags

Best regards,
Krzysztof

