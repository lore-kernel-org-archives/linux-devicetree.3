Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333423CEBA9
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167946; cv=none; b=hZWyBvqE3ATeiCGAdkrsF41oeL1+f0/boYIscc9oL5qzgYwXjKBz1FZRf76d1DsBsiYYBUTw9zzEGCDnF94xEq+t7uj6nieFEec9HBHY8EiGO6Jb0NzdRhL44O6Y7odd3A/4OvUlUdhEQzF7w/undOKVbsXJazNCV4bVtatAzs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167946; c=relaxed/simple;
	bh=JNwWtAAhO7ZJyfVunLJ+BIlzHK70a/jomuBilwewcRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hy8293bZ56TC0F7B+BlJBQpaMnXC5PHEo5ePG/s3qtfj8bgZVrRmsEiCdinrOu0YhR2osNB7YQ3GSELD/dyY2Ot10WR7LdjapieLx0hV7+G4+Pwjfr6FylbWTtObnTzGZCDYIGED+uo+P5oQ1KwFU1+giczDkKmWibAaTy7q87M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=PHzN0WAm; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="PHzN0WAm"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c0006ea8eso21083621cf.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1785167944; x=1785772744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mWElXlJw5cE5TIZC5LPg5qcPYX2T0RVaHVwfG55E9MA=;
        b=PHzN0WAmsKnnvJA3sQY2Mlbk348JgVfInI6m9hhDA8dTO6KlLFwtmc5nMi0AysgOr9
         4ZBwGRu7zikEakmTYvfEWL3iyziUzk+t8fNmwi9wJocFCgusgk2Z9XgvLcpxCwxZqpN5
         CGosrnBgi/bPSVwlnSkKJfj5yNMjsb2hiHEySRsvsIDsrULt4yxj9cYZTjEzK4HeBTxK
         vwSf+JB1KF8Nb6hALZ1yADRKy0fXcyTRVvYluNXFvrMpTU8GXlD+BYyFP6XUv44872G7
         b3sSJRM/DCvOK3YgtHcVAnU5fO9FkD+WeS4aIoaM1DuVurpD6VNrTCX6R3rQFOGKLcgI
         FtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167944; x=1785772744;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mWElXlJw5cE5TIZC5LPg5qcPYX2T0RVaHVwfG55E9MA=;
        b=YSs3jAUSeJk7KxF1sn0t6YQxTvxmmv9leUlu0Sjpf8v5J+ljmOfOPCesGdV8gOwxGQ
         lpa1fI17B9C0k2qFnzHMw4nWg3Z7x4wJS/d+VHKrFslLi9omGXmQjbqdmQWBizA7s46N
         iPQLq+KsCGNrDj6ps247LHpW1jVUDVCSdhSGqDIt3anGic0UJ+Tc87pd/yHpQuuPayNW
         YKJGjeFLIHlXlZsOXD70cCtLX+yCQsiumYeYF9Pdg9iqMOEtg+e3T1HTEicVzZrFzQo5
         tbUyuufYw3+KrE2yDy9yEjEoZd3ptgS5LfZ26y3nEqsAn/JRaDD4xivmQNZ+lRm42zSk
         mPcA==
X-Forwarded-Encrypted: i=1; AHgh+RqrIU5FsJPDtYaR450NqrJjjxsSacxwlvycfPex6ej4DtPDe/G8kzD459s4Rsv5SoHai4oa9QKrXd+2@vger.kernel.org
X-Gm-Message-State: AOJu0YzNXb4Wj1jsAG7Ax3C/dwUcTumm8tGTtVv3FBsNcYDaOCwipOy+
	U5jJoCHStS2S03WGIhkMuAqWEkWFO35mvd/JVSSCU5J9IJQ/RUzx03NVcw8tbHvKJyA=
X-Gm-Gg: AR+sD1179ju0dhg0TWOCbJVTcLS7/WQ4YWuEsS32eBnF8SEbT8TfPQCyUlBbkhp7z+F
	N8U6rVBYw7zOK7YSC5CBWFTF3vXT37kdYo1LIRNgsGf3zB/Ky+bNlSv4A6wAJOHW/yN/d3ZLQNN
	IAzRxNa3Vl3s7nvPbTF5utsZmswmZZ57RnLan2spnaqrdztSfr2vYIJ3OVlE+AEpQ2udkT22W9+
	yHkWn1+zJVDqWCTHv7Rsk3WfNuccbjApT/JW4v/IKXO644hqLgTPMjeeawY6mswTNbRGeUxvVNI
	CPMNNsWzG7t8B5pZgA1U3eBSpC9KoN6WM7cs88Jb6wFdeOuioILGjgUNngvS2hVzGFeHAjslUTK
	lzjMK8DhZsBvmc8A4WdsNVKYTD3pmfA0WDqL/+kNSOV6BtmVZfWE7UqVq8cRkXFOW2kbQ6eqR5k
	Va7Q==
X-Received: by 2002:a05:622a:4e8e:b0:527:2b06:2bcd with SMTP id d75a77b69052e-529d1c5c9dcmr577301cf.79.1785167944070;
        Mon, 27 Jul 2026 08:59:04 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529a262fa9dsm56944561cf.0.2026.07.27.08.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 08:59:03 -0700 (PDT)
Message-ID: <5ed98bb8-566a-4054-83a5-f7dc64c8600d@riscstar.com>
Date: Mon, 27 Jul 2026 10:59:02 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: PCI: toshiba,tc9563: Restrict Tx
 Amplitude, DFE and N_FTS to USP, DSP1 and DSP2
To: manivannan.sadhasivam@oss.qualcomm.com,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260725-tc9563-fix-v1-0-ec4286e31331@oss.qualcomm.com>
 <20260725-tc9563-fix-v1-1-ec4286e31331@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260725-tc9563-fix-v1-1-ec4286e31331@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/25/26 3:59 AM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> TC9563 switch allows configuring Tx Amplitude, DFE and N_FTS settings only
> to USP, DSP1 and DSP2 ports. These settings don't apply to DSP3 and also
> the integrated Ethernet MAC Endpoint.

s/and also the/nor its/

Also I don't know if there is only one Ethernet MAC here, but
the TC9564 has two, so maybe make "MAC Endpoint" plural.

> 
> So restrict these properties and also move the
> 'toshiba,tx-amplitude-microvolt' property to DSP2 in the example to conform
> to the binding.
> 
> Fixes: 26f3ac884835 ("dt-bindings: PCI: Add binding for Toshiba TC9563 PCIe switch")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

I have some other questions with implied suggestions below, but
this looks good to me.

Acked-by: Alex Elder <elder@riscstar.com>

> ---
>   .../devicetree/bindings/pci/toshiba,tc9563.yaml     | 21 ++++++++++++++++++---
>   1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
> index b3ad05d90201..f084830c6d0c 100644
> --- a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
> +++ b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
> @@ -54,7 +54,7 @@ properties:
>             - description: I2C slave address
>   
>   patternProperties:
> -  "^pcie@[1-3],0$":
> +  "^pcie@[1-2],0$":
>       description:
>         child nodes describing the internal downstream ports of
>         the tc9563 switch.

Can you offer any explanation about why the settings apply to these
two downstream ports but not the third?  (I think it's because the
third has a different type of link to the endpoint.)

> @@ -64,6 +64,21 @@ patternProperties:
>         - $ref: /schemas/pci/pci-pci-bridge.yaml#
>       unevaluatedProperties: false
>   
> +  "^pcie@[3],0$":

Can this just be "^pcie@3,0$"?

Is there any need to define "^pcie@3,1" for the second PCI function?

> +    description:
> +      child node describing the internal downstream port connected to the
> +      integrated Ethernet MAC endpoint of the tc9563 switch.
> +    type: object
> +    $ref: /schemas/pci/pci-pci-bridge.yaml#
> +    properties:
> +      n-fts: false
> +    patternProperties:
> +      "^ethernet@0,[0-1]$":
> +        type: object
> +        properties:
> +          n-fts: false
> +    unevaluatedProperties: false
> +
>   $defs:
>     tc9563-node:
>       type: object
> @@ -154,6 +169,8 @@ examples:
>                       device_type = "pci";
>                       ranges;
>                       bus-range = <0x04 0xff>;
> +
> +                    toshiba,tx-amplitude-microvolt = <10>;
>                   };
>   
>                   pcie@3,0 {
> @@ -165,8 +182,6 @@ examples:
>                       ranges;
>                       bus-range = <0x05 0xff>;
>   
> -                    toshiba,tx-amplitude-microvolt = <10>;
> -
>                       ethernet@0,0 {
>                           reg = <0x50000 0x0 0x0 0x0 0x0>;
>                       };
> 

