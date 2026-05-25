Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9641381AE6
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713573; cv=none; b=nuvLr3MSYNjKmHItscRs0vzUZoNYPsjAm03+hj/EHyzgEYZo5tfeEjThsN47MVcYyjE6WOhYdOrUsBIQB+jlVsek0fO+0Ld/S0jEwpjkQ852Nx9xaZB1VF0pnpmyrb6TzId69WTvh0XH4Q7SGcLEDUAHNxpUnMVQi62r0Elcnjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713573; c=relaxed/simple;
	bh=eCc7hZro3sukGdKk+rDds8H6ZCx+O9dGtp3uVqlctV0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=luC3FU5CW8gHwjnOGEjwhQLXTAdl4kkwt0SNx0vTddBzt5blr6UNjhbQxRs91imtg7tLED9WPBOpMVFJWDtAu0tyknolU/ye6Xs5WqJhsgTGk9+eAYoqLqYoTSPchRkg3Yd0Yxbrn4rJg71BxGKf4c4Yl02bA6nX0wfpYGEM0vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzijUU48; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzijUU48"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49050bfe053so23015355e9.3
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 05:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779713569; x=1780318369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H9aiTARP7drgu+dP0YCc4GfgWTsxTwUR3Caw1q6/RRg=;
        b=fzijUU48k/vepNszAUK901cYf1r3irIkIjmHuTjkBC1dbFv89jOUGIWRXPn4eZHEy1
         +3arK3SGl9cngDP6F3rBKy+jsNTA7VPtav6RzyFodUPGaenNQOn3aNxhR8dB/ReNrSOk
         uQSDbuuBHTsqX3kLJPI/8IAE/SqJ9oIVBkrksk71i5JPeWYsempJXp71OWXzv30yw4DN
         IitpSWt47uACuNiy2OmJsKsNb3bE0ZGTKP9XCq2ZlpLPTDjDbJWzr6VVgck/XizVMyeL
         kW1N4JECRcMpx97JtZG5rGk4RnWbwVGFQtpSSWZGERMyi2WVlhvcRMZgP2O0EFjvbrC0
         mjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779713569; x=1780318369;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H9aiTARP7drgu+dP0YCc4GfgWTsxTwUR3Caw1q6/RRg=;
        b=rPNqsVOtTvM3kqars1yprFBwoVkmv34O9dJO2wrR2UwCcjB1xLeGlIhiy3MeaDelqy
         8/A2OJQgt0XCxinV1P2qnL15hER/+FaFZKvEjdjSuj7oH686N8ihSWkfe18GkZadI+60
         jqrWjJfPc5fFsAD7UGH4WJORUo9A1KzXuHQTlnvH3tX9+ffxUPHi19zGWbkPPudMJocy
         xyNRUhQ/0ShPxAdYakSURjzNfVPzBZZ5NCgviKpYUhf+jaumNvjHieyQdf6O8m4GwFFM
         rhFb+gY5sM5Ru3TPNcsc14gfruXkfQotbVpu8OHRfWAbU0W+KXurUnpDKpBdcBSVXz/x
         b4SA==
X-Forwarded-Encrypted: i=1; AFNElJ8sUPedsaK/swxBqLRrrpmbhHnkwKfVukc9aExiAwZzkGP5nPElzdSgSUO+q/Q2G1TgrWyyYdp7jtyS@vger.kernel.org
X-Gm-Message-State: AOJu0YwPC42z2OGP++JJ6BRrtG4eJR7ZXGA4D/aNZI2GNB24BEo4ZXD5
	/eporuM0euS8PdKStE3eGvSlqZ4mJCOsNAQb6UsC61ivcWgEZ3H51fjw
X-Gm-Gg: Acq92OFUXH8QaUGD42fhKwHrWUWO6fmqiJWl5YjivWGmZx48R5LF5LXmVj1uZHYrMf9
	0ObXYSsdQ1B2mYxHGI6gXnI8wsqwv0BTICZMlWftsU57pEYvso5z+KBPsiXBuS9g62gNsORa1SP
	UT09fXwMMdCDynRz/OWR5+ShhpRVz0tTheODyIS06pU+cd50D2BXA7rl+nEbfxhTfK2T8c5JAKI
	25X+GbbDAdXJI1uHOrZdzu0exw6jxzAIDmuDlBeoSIIJiin50g7d61zfiw+OiponhuVTLVZ6ty/
	JhxczzCOe6gqobOfU4NNLkFtybGDnObuTkylvmrw//QKE/hb/YpZOslI4GCezjVgoYcQeUeM6Ee
	JDXymZyZO1derGfw2LSfjuY8w5OG72flaIKdzNdWhjyCQIqXREt3OvG8xL9cGdvFtYtbpWevjpK
	JvOG/uvavHSDdtjroDc0agAsb3pRInxl5wF8xeTbN2dBQc5rUP5NI364/2
X-Received: by 2002:a05:600c:1c0d:b0:48f:d612:3c59 with SMTP id 5b1f17b1804b1-490424b3927mr260477655e9.9.1779713569065;
        Mon, 25 May 2026 05:52:49 -0700 (PDT)
Received: from [10.25.212.250] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904561f682sm267142095e9.13.2026.05.25.05.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:52:48 -0700 (PDT)
Message-ID: <a9e929ef-f8fe-45ce-b1a1-de1c1e23dfa4@gmail.com>
Date: Mon, 25 May 2026 05:52:46 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: remoteproc: imx_rproc: document optional
 "memory-region-names"
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
 <20260522111849.783-2-laurentiumihalcea111@gmail.com>
Content-Language: en-US
In-Reply-To: <20260522111849.783-2-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/22/2026 4:18 AM, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Document the optional "memory-region-names" property.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml     | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index c18f71b64889..6679b10f9da5 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -62,6 +62,14 @@ properties:
>      minItems: 1
>      maxItems: 32
>  
> +  memory-region-names:
> +    minItems: 1
> +    maxItems: 32
> +    items:
> +      oneOf:
> +        - const: rsc-table
> +        - pattern: '^vdev[0-9](buffer|vring[0-9])$'
> +
>    power-domains:
>      minItems: 2
>      maxItems: 8

So, I think the AI bot is right on this one. I've missed the fact that the programming
model allows you to specify additional carveouts (currently not allowed by the constraints
here), based on the firmware used. An in-tree example of this would be imx95-verdin, which
takes another carveout called "m7_reserved".

Based on this, I wonder if it would make more sense to leave this property unconstrained
w.r.t the names we allow.
