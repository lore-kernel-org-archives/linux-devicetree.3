Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0850D397342
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 16:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783699308; cv=none; b=GvQar3ty1SJswPz99VFMjDA1c+K1kc87GgGL2esW90v4ovYcCWzL7cCrlDQ+1CcymaB1Uvfte92/wySiE/Ma2K94Ul7h/rWu70ZhUT7DHgY16b3jsUqWN2VQiQJ6cXAkUaQcHibg43me4IxGjupZN6MHIgHnYg+SQ91i7HS8PyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783699308; c=relaxed/simple;
	bh=FpvBMFOBjGbtex0F2E85sDkJ0mHA1kFz8fwtEFKL9Fs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QFA9HEV1+Y+xnBpjyjNKOJoGTGxr7Dv8u8g4VnSnps9YHGLbr2gLRYMVNZz14YtAPj127endHqB26rU9Iwwi/xIRuZdZdwkiGofE1+r+nuTwUHLWO1tdfjWt9LRqCFSU0eEUXc/AD9XgrqZb6eNhHHdjmUqd+9PoXDKKAnt2TcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=YMqYFWBH; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="YMqYFWBH"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c0c45c580so7334431cf.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1783699302; x=1784304102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xplki/WjnUaATCo6uGj8PBglmca7aRIHrcSArfmWE/8=;
        b=YMqYFWBHH3a37kqe/Jc/56EqUtfRQqBlg6YZmh6HajWWXHheWFEfPvkYeQoN6OABTH
         9K+nAf/FI7lNo+1rMbGACesyTcZnBJ3iaa9bVTWWiXI9aqhprCw66xzOEiHH0t4pHUDm
         9F0TiiPv/Sh0RjbyctyPl5i4uwkWWTIhAfXLdgQ8XzS1ZR5u7jre2hlq604XreguIz7B
         Hs35lVokfrCXvgZNSHXfLfFHYB6BMAAuAhQO3NmXzeagV+lUwqPOLs/a1YeUMjuxuetD
         bgILXOUIFUv6/mTcwZ3caimiuO06QnaeAR0CQDPTdlZtwXkyuejmBUMKp/PgC+uw5sYH
         pGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699302; x=1784304102;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xplki/WjnUaATCo6uGj8PBglmca7aRIHrcSArfmWE/8=;
        b=A9RZHRoJoBUcU7w2tOer9ZJ+FzKUhm9Q6WpURMKd9AEcR/lkbBFMM4zSfqHSk1hd2h
         D1S8NLBymz3pmCw5fwlh1NoASOAIRihMIEVPuf0Nv7VLIevF0CvCvqbWrQXwE54exryK
         4R22htwbyeDcZnc7g82+Ev5Zt3SCRkq0wDgps02hLVzPr5apyY36VJ2F0dcUBE/WCrVd
         +rJJGVMU9GCCoTuLwF+EbhukEKGdz2IRHFzhyG3joNgmy6mO32rOsgzV3T+zynhn5vmE
         FARNpjm9X4qlGIkLuWodgtB0c9EyauY1Xy+SosIRqnld5Qb9Lw9d26YFnXTJJQCyUGAZ
         HHAA==
X-Forwarded-Encrypted: i=1; AHgh+RqiAcXdJCrPoyEN1F5f5/a9cG+/JlcbiMIGD7Hp9e4y0r7Jwe3OsR5NcTUuIMTLca2+9Qojs2LdfI+0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9lV3hW/7RgbgNl3kQJdvd6mQAN5qh97qLJb+SfTZ6TwnZwKPz
	kcNkn7xvCV0/I3xM3k78D002o5oDB1HLwjBYtNlSq5M1vmlqfwDGb3us7uo7FjMyiyc=
X-Gm-Gg: AfdE7cm/ulrwgL8of26n3jDBsUoY9ytQoUNdUaw2r8uUAayDyJ+9YBgYMWzgnN6+yjl
	VBsYnMWqUWxzjAvlIGNuRhhLJw8B/Kpft9S/V/qTO1UIs/xIN/bamGP0Cf4pfF6KQsU342BTjl9
	zxpZQDP0enspA477C+GzkH12vEt7tw988FR+vw/hsEYWTKqnbUG3CAfsH64GdeQ52ssQWzTRtxN
	69m1IPmffgXkkQ+VF3qm1nODC8YHV6/yLJk5fIduwEUwHYPRd2DTSOdZ5VQEd8rttgj5eghSh57
	lUPC72YH5FAc0z/959cOmNlbAzh/N6Ugke69cABSN4GlPqv4PRjmkKOooYIr20ZvyB5aUHYiRWO
	jbM7hltz9gjsD8nwo8zBAlVQ7mokQscs67pYMxU0I9M6bkvdhTpQCvtZCZEqxbKLTvmQAaDTwZn
	twOr05+c6vsFp5
X-Received: by 2002:a05:622a:2c6:b0:516:df62:bdd2 with SMTP id d75a77b69052e-51c8b3c65f5mr122904381cf.55.1783699301497;
        Fri, 10 Jul 2026 09:01:41 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caaf5f61csm18644921cf.22.2026.07.10.09.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 09:01:40 -0700 (PDT)
Message-ID: <58948c74-0990-449e-8eee-88cbb38db7e7@riscstar.com>
Date: Fri, 10 Jul 2026 11:01:38 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3
 PCIe host controller
To: Inochi Amaoto <inochiama@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Christian Bruel <christian.bruel@foss.st.com>, Frank Li <Frank.Li@nxp.com>,
 Nam Cao <namcao@linutronix.de>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Xincheng Zhang <zhangxincheng@ultrarisc.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vidya Sagar <vidyas@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-6-inochiama@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260709040027.958400-6-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/8/26 11:00 PM, Inochi Amaoto wrote:
> Add binding support for the PCIe controller on the SpacemiT K3 SoC.
> This controller is almost a standard Synopsys DesignWare PCIe IP,
> with some extra link and reset state control.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

This looks OK to me.  What I see is that K3 does not require
the interrupts and interrupt-names properties, allows up to
six PHYs (not just one), and adds a dbi2 register that is not
used by K1.

I might have missed it, but I don't see where the dbi2 register
is used by the K3 code you have added.  In pcie-designware.c,
I see that if no "dbi2" resource is found, memory at offset
4096 from the "dbi" base is used.  Does that apply for K3?
If so, maybe there's no need to define dbi2.

					-Alex

> ---
>   .../bindings/pci/spacemit,k1-pcie-host.yaml   | 50 ++++++++++++++++---
>   1 file changed, 43 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
> index c4c00b5fcdc0..54817d6fd9af 100644
> --- a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
> +++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
> @@ -14,26 +14,29 @@ description: >
>     PCIe IP.  The controller uses the DesignWare built-in MSI interrupt
>     controller, and supports 256 MSIs.
>   
> -allOf:
> -  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> -
>   properties:
>     compatible:
> -    const: spacemit,k1-pcie
> +    enum:
> +      - spacemit,k1-pcie
> +      - spacemit,k3-pcie
>   
>     reg:
> +    minItems: 4
>       items:
>         - description: DesignWare PCIe registers
>         - description: ATU address space
>         - description: PCIe configuration space
>         - description: Link control registers
> +      - description: Data Bus Interface (DBI) shadow registers.
>   
>     reg-names:
> +    minItems: 4
>       items:
>         - const: dbi
>         - const: atu
>         - const: config
>         - const: link
> +      - const: dbi2
>   
>     clocks:
>       items:
> @@ -66,6 +69,8 @@ properties:
>     interrupt-names:
>       const: msi
>   
> +  msi-parent: true
> +
>     spacemit,apmu:
>       $ref: /schemas/types.yaml#/definitions/phandle-array
>       description:
> @@ -84,7 +89,8 @@ patternProperties:
>   
>       properties:
>         phys:
> -        maxItems: 1
> +        minItems: 1
> +        maxItems: 6
>   
>         vpcie3v3-supply:
>           description:
> @@ -96,13 +102,43 @@ patternProperties:
>   
>       unevaluatedProperties: false
>   
> +allOf:
> +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: spacemit,k1-pcie
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 4
> +
> +        reg-names:
> +          maxItems: 4
> +
> +      patternProperties:
> +        '^pcie@':
> +          properties:
> +            phys:
> +              maxItems: 1
> +
> +      required:
> +        - interrupts
> +        - interrupt-names
> +    else:
> +      properties:
> +        reg:
> +          minItems: 5
> +
> +        reg-names:
> +          minItems: 5
> +
>   required:
>     - clocks
>     - clock-names
>     - resets
>     - reset-names
> -  - interrupts
> -  - interrupt-names
>     - spacemit,apmu
>   
>   unevaluatedProperties: false

