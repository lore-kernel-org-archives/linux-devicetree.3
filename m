Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B74175A98;
	Sat, 11 Jul 2026 15:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783785530; cv=none; b=LNYQ22jmxjpvDqvOqo9puPR0+T0HMH9YkLumjL/NLFpy63sIm24zbdWoNn4AS38N/2+kzJMTZIy+OucfybYDU9jZKD1JEc6rccEHZHZ79ghVQOWdDoqUxbxdS6q54+jnrTPwL3p9FnUGGTSsYTVvf/Sx9nFWDxwlDZm+avoGNiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783785530; c=relaxed/simple;
	bh=/WJaGtcKeCgiWBjOf5FdEK6cigCyzJkYJ+OQPDfIeXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=usZSPr+Bs3DINxt1knNJ9We5WPObPv2//Z//3eQOYDSCmYTZ6z/hWBDJ0s1TIyTUQ1MmTxTWmrE1AbCUXTB3sN50JRt9lvbEL7swbN5Ps/X4LkTvJN2g77XbDCIagP5sUCXprFGtN5ElT0rnyGXJJjaQlQ7ES0HLNSdfqiXstW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+H+ibS5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+H+ibS5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC2C1F000E9;
	Sat, 11 Jul 2026 15:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783785528;
	bh=cqHC99aJIwl7vQN1I11jd3PmgBWGZRgmYFcHBY+LQDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N+H+ibS5/7/8Jq6qJ0PCZussMDDA/t9HL4cdEzpglrOXP2yl+hdKn/1u6+B+AolYs
	 hzpHU1PCx298mc6huNw+RoGwbMlXLd+s/zURCRtK8BJPcPNQ0TaYlQl3ggUObhy55o
	 aQcWHCWvjld+LIf/bCUCuvMSRrE/9dfpxMNl/om11XDemE+mzfKB3s0ukOAFgWJiFT
	 NJEP+AJFatENo6iytw1daX+j64q/5V7qNucA31mbUiuxnE/4JUbhPUpHAFu9Pz6zzH
	 M3k3fm5l/S+9BtF/xXHYIGNBI0ggsrT0QDWE5nqaUFz4zRGNl6Pv/B37AkHiLiKI/5
	 NuTIFhaT8vl9A==
Date: Sat, 11 Jul 2026 17:58:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, daniel.baluta@nxp.com, simona.toaca@nxp.com, 
	goledhruva@gmail.com, m-chawdhry@ti.com
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: ti: Convert DSP to DT schema
Message-ID: <20260711-leopard-of-unexpected-vastness-870f10@quoll>
References: <20260708111914.1706800-1-egbostina@gmail.com>
 <20260708111914.1706800-2-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260708111914.1706800-2-egbostina@gmail.com>

On Wed, Jul 08, 2026 at 11:19:13AM +0000, Eduard Bostina wrote:
> Convert the Texas Instruments DSP bindings to DT schema.
> 
> During the conversion, the following updates were made:
> - Moved the binding to bindings/soc/ti/
> - Make the 'ti,hwmods' property optional to resolve dtbs_check
>   warnings, as several in-tree device trees currently omit it.
>   A review of the ti-sysc driver (drivers/bus/ti-sysc.c)
>   shows that the property is not strictly required for probing.
>   The driver only reads it to populate the 'ddata->legacy_mode'
>   flag. If the property is absent, the probe sequence continues
>   normally without error.

Text feels early wrapped, please fix your editor for any future commits.
No need to resend just for that.

https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

