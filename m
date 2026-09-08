Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11BB55D898
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 13:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874082; cv=none; b=AbtRuqYXT6/pj1xXdMrDawaQl/qm+OybNj8R6umUOaPcbvZdYZWi3bmQGF1VaLV7jCRc7sauptPKeHDZ5dLJGjLgKt6hmVeVjd4lAwvwqPDr4RAGwIyGKOtaIiq9g5hdTFTFTXkYcZMSRP/KOo5STwzHo38t31qn8v0M4+5S5YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874082; c=relaxed/simple;
	bh=pAsEvkPu3covvOGoVW/KlsUNTc00k7Qd0xwuz3K8QkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TD+hjED75fICzuwaf9A/g+X18t6J27mxUbz8FvloV6LDt3DzlFWM/5NdZa8cHJbdFyS5YMCbzJOLn4sUaCXLi3Z51PLVRx70duXchSzNGbBs0Ip8DXbiHExttMm4KRIYCg4wrMiYGa3j2K7cvgMeYGbU4vDvIzHOOr0n+Cwhucs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=RNoQ8z7X; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="RNoQ8z7X"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-9399ec950caso209275985a.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788874062; x=1789478862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qNO/TqMTBOHVJmTKy/WseOZnYihRsPoGCcusIiyOoTY=;
        b=RNoQ8z7Xs/IqIBn1H7QZuEX8UcDt+ZJXY+/HJicZ0ZlCoNsm2JNSYt8+FQqVJWpA28
         83nAk1992L8N6lSwVm7EhMiv432dxySWQs0/XC/FnPF0HxrlScto18D346xICY/oLwyl
         irOEbF7GJoHQuL9sh6pVrmojYxJkyztF3mTnr8KtPzJpaswh3uIv4kst3avjigaA0Sal
         9gm6EEDGuq9/tvKYGCmkq9m2HIBkcbg7W94vFh2v55S9QQLgJi5p1xNRwrmq05uxnPDv
         9GoK8SvimaKPug9Ea9kMdPURJcaShAFvniEEAZaJaiIRTtjIurko2iE/a+zOS1UF95Mi
         wEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874062; x=1789478862;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qNO/TqMTBOHVJmTKy/WseOZnYihRsPoGCcusIiyOoTY=;
        b=qKulQ7yVx218/sYjPsiRaJptuQNXpi4/MvP7XTJ0KoOSNJr3PdQZN1lgMlIw2Ytsi0
         ROz4K0WfGPkvXSZ6VIK6yduGgXotEMOyJY1WI/vpLW8SkrnNO17gEeVlQf41X+9/ejH3
         QK2GMhbpG2TAEC26fwlHsAFxkpxuK/+flGFzV2zMGW1b3uZNimz2xlRywnAvJvqXmp8L
         0wLPVSCSJYIpmYcUfrRaOANqmAKOTcRmMoDSKDyi2WSWkiORFSGSMfulYSkEthNuroXm
         HiRn2EEp57hvddC/3/49cH627rwLCqj3fSa9xTOIK27j+ZGj9IkEbHCF7QvYSCmICMF2
         4Hhw==
X-Forwarded-Encrypted: i=1; AKwUvBxLctQe9hjbw/35AUvCHywyyygr2kRPb+0jwakTgslr02GrQG6rY8TjtXmezi25lfCjmuDcntzEYqAq@vger.kernel.org
X-Gm-Message-State: AFuF++l84AHQXXHLhqVoAv4vJyLhF2ddfmMOJTKihEDCIbHetVKoZA0q
	xmjQKIr5Gp+6iW3fxVtQcI7Sq4LAMHKG7u95nbvS8U+0xgFDwUqQn7rTHFVpLZPKfhU=
X-Gm-Gg: AYBFou1b6UGUbZSYk8pxFC3Vs/VAiiNsuSwVvjlLqbeXEXi+cV8RwqdLxRBztSSr4//
	u7VG8LeodFocCr6R1O1AigCrgatGexMhSVYVEeoFZ9tdNy11eNdkNwAPZX+gWxE3BLgsB4JgI2A
	FpEz6rD8F2GZvbiTmSPvh+Ivlrl+gwbOpzzjc7daf5taoneAV1VVUA8SxjMBPrH9e9ZX9gEKbDY
	x3c8mh0++lVXXjPP2nbCVbOs+6qxkuZdbMGyix5XmJ+xUPdAut2JPMHxItUjM+8MigJLzTz4WNq
	5LXFB2e1hZ1Qnwj27jtP+7jo+L5M4ThhBZt6JyfDTckjlMOCV0hNTQBYb4vIwygHKLTqvDfumKm
	UsQoZpzKr4o30JJqjHkBc3exNcZqGXdUdsUzybIsg7K4djkeyHwzqxN/yVKD88V0rloslSuh4iI
	740/kw/8BVD/mRUXbiumjr8n3IbF2oHT5fFaFihOZvJG+9yLVZyzZzYU3+VMck
X-Received: by 2002:a05:620a:8c0e:b0:939:6dfa:db9d with SMTP id af79cd13be357-939804fa21fmr2230570085a.50.1788874062236;
        Tue, 08 Sep 2026 06:27:42 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939b8fbc1dbsm249492285a.11.2026.09.08.06.27.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:27:41 -0700 (PDT)
Message-ID: <8f6cbccf-3169-4b32-9c8b-406d53449590@riscstar.com>
Date: Tue, 8 Sep 2026 08:27:40 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: PCI: toshiba,tc9563: Document
 embedded GPIO controller
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Michael Walle <mwalle@kernel.org>
Cc: Daniel Thompson <daniel@riscstar.com>,
 Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
 <20260904-pci-tc9563-aux-v3-1-5b1449d62ba2@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260904-pci-tc9563-aux-v3-1-5b1449d62ba2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/26 12:15 PM, Lorenzo Bianconi wrote:
> The TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
> lines. The controller is registered as an auxiliary device by the TC9563
> power controller and accessed through the same register map.

s/power controller/power controller driver/

On the other hand, this is a devicetree binding, which should
really focus on the hardware, not the software.  The auxiliary
device and the regmap are software constructs that aren't
hardware-related.

I think this description should focus on the fact that the
TC9563 SoC (which contains the PCIe switch) *also* has a
GPIO controller that is managed via the same I2C interface.
And that it's possible the description within the binding
should be modified that way as well.  (However please defer
to any input provided by the devicetree maintainers...)

> Describe the switch node itself as the embedded GPIO controller and

s/as the/as implementing an/

> document the per-port reset-gpios property.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

I will let the devicetree maintainers comment on the way you
document your properties.

					-Alex

> ---
>   .../devicetree/bindings/pci/toshiba,tc9563.yaml       | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
> index f084830c6d0c..c4cd162cb084 100644
> --- a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
> +++ b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
> @@ -31,6 +31,11 @@ properties:
>       description:
>         GPIO controlling the RESX# pin.
>   
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
>     vdd18-supply: true
>   
>     vdd09-supply: true
> @@ -84,6 +89,11 @@ $defs:
>       type: object
>   
>       properties:
> +      reset-gpios:
> +        maxItems: 1
> +        description:
> +          GPIO controlling the reset line connected to the downstream port.
> +
>         toshiba,tx-amplitude-microvolt:
>           description:
>             Change Tx Margin setting for low power consumption.
> @@ -128,7 +138,7 @@ examples:
>               ranges;
>               bus-range = <0x01 0xff>;
>   
> -            pcie@0,0 {
> +            tc9563: pcie@0,0 {
>                   compatible = "pci1179,0623";
>   
>                   reg = <0x10000 0x0 0x0 0x0 0x0>;
> @@ -149,6 +159,9 @@ examples:
>   
>                   resx-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
>   
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +
>                   pcie@1,0 {
>                       compatible = "pciclass,0604";
>                       reg = <0x20800 0x0 0x0 0x0 0x0>;
> @@ -158,6 +171,8 @@ examples:
>                       ranges;
>                       bus-range = <0x03 0xff>;
>   
> +                    reset-gpios = <&tc9563 2 GPIO_ACTIVE_LOW>;
> +
>                       toshiba,no-dfe-support;
>                   };
>   
> @@ -170,6 +185,8 @@ examples:
>                       ranges;
>                       bus-range = <0x04 0xff>;
>   
> +                    reset-gpios = <&tc9563 3 GPIO_ACTIVE_LOW>;
> +
>                       toshiba,tx-amplitude-microvolt = <10>;
>                   };
>   
> 

