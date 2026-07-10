Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441D943B4A3
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 16:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783699303; cv=none; b=av1Npu5oCAM8y74DBZWtBsfcaGB4YhSEIPAaWA1eIkCeV0VnXlc5fDTTtvuE6TIc+cm4ugOgwuvSV04Js2ko3Jyqgms4+/vKgvNRTHbPaNKZg1ocEdBmfQgQ3IXlGPW8yIRpmpAnqGTBFnq6NrPumolsk09HnJ8mfolK6T2Hhg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783699303; c=relaxed/simple;
	bh=VwiAZXZIJdaH4H2GdoTNqGdH0W6/6abMGB1zwC68+H4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zv6LQxXP6Z8py40bNhlQ4CHXBOUlvS/x0mKC/Zwjr1rrjsm3RYaB8Om3U+jrpQOgSon0JPhgD2Y1/VYt9VKH8OkUT2YGiJjnrQFBNuX1E+nSwK9ZWpdVEF4LaDOavfHcqqE9sxJjA6KI/Zpw3g+qRbIkWHCb4He8xrpQprXazik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=fW/C5PTn; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="fW/C5PTn"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8f29ec73064so8021466d6.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1783699295; x=1784304095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBrb1/xcTqbJkDmBUM03GUxf19wY42RaKRfKCOCo/XA=;
        b=fW/C5PTn9OkaaVedVbRIYeolJtsZX3QWZQcB/OPi9i5gyYN09QUgIOkUSTn3NKJ1IV
         Th9DjBBgMgdy2RaJlSL9Zjzgf6z9h6uW5YStGvtZg35/ITdlfNxk/jhOoC8tpcZ3dyBu
         h+aPMYWZtfs54HzvlzqSE4OzMkqGb2nWpHjl6c7gWoaFZwfwNjfHqFMZGiFgPH7amXQn
         CBHaoK4JXffkHjCE01QqubQQXvLl6Ww3w6qxnp6O+IcliYrxr4fvIW7A0cpbPy4FyVYI
         YmeK6QIkEi1TTxFa3Sn/qW95vHdujZ7DXtg/Gra4ZLmfa8e6xN7sm5iAeLaH9w0VLdKq
         5toQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699295; x=1784304095;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mBrb1/xcTqbJkDmBUM03GUxf19wY42RaKRfKCOCo/XA=;
        b=JDcyn7Nj7yljOwhumz10/3rKgiahNhtKfYvcvIv6wPsRAuct7YGC75tAD2tP7b7rST
         dbWQU2QJy79ni52UkS/KeWzYTV+jeHrKLctzVGFUd6S37UgB30nvNvFKHdPJT36qRshi
         dOcIlcZqA6PMU1iQZ9t8YiyCUUx2rm6xwT9WgKN3RHe96a6gVyWzpImdk9t43yp7D5PN
         wlJ9688a/OLje8FcLHg1TQUU/OfAzUpsS5g4O+Iwg19TLMAfqgxC5z6bshoDf41oOWwy
         Inqd6Hlv7VQVD8IGmA81CaH6ilrBSDcSp2b9Vc47zKFg4PleUo6WjcOkWL38WgbiLSGo
         QJQA==
X-Forwarded-Encrypted: i=1; AHgh+RrtNmQf3mWjMKwRDwi/vT4F2Va0SIz5ACmFnxCfYuOhq3Bd23CpxvyLZjjL8cA0n5lwqhgFnnxY8Qdo@vger.kernel.org
X-Gm-Message-State: AOJu0YzojOKU50seEf68dDKwdbrsm5XV6giXQ/l54LRcXcx6oX44uK2d
	bKwdhFXiH80OeIDn/ifkF9Iuj05TWbYVk5OWiH6bA7rvou1z+fmJJjOmi76c/YJs5ns=
X-Gm-Gg: AfdE7cnxQcxsSkBpxd7eJjdwJZbjYY8wGzgcMYqJvxOTLMbAwYt9Xi92+qj30yOzdz5
	NGWPDlGdv/hldcQi8PaUTng2SAIAVC5cbUgpy3pAKfRs9oDS46fnHJLELQrMdmVW7OlzBbM2YLX
	XDfU4Ci/I4/IN9CxTwblHLSVkP5vcf+SDC3TqwsCb/DjxltzdK96eXYikuoI3TafMzY+JXCXmbI
	zzhQYZlD9RjGTOL2fZ2uPBot9V7cx+BKA9Jm7Oxi5GhisiyO27xwf/YNW7KTd9N2qLAFBfiDNCW
	81nQ2xcIk6LhJreAk5g3BtQsMNvY4svhUpcyJBIGtI2CXvQ3n8ab/+FMURAj8XYeE01T2+3bGfH
	FtPYQeNOHZDUoqrn9umNoxXVuLCz/C2HzeGyekoi0ReEyNuE8q2+yAcnU7hgiSe25fZP+ogVY+c
	neQjYKY1ynkVsC
X-Received: by 2002:ad4:5c47:0:b0:8ef:8e79:bb51 with SMTP id 6a1803df08f44-8fec2279f84mr159256126d6.40.1783699294772;
        Fri, 10 Jul 2026 09:01:34 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9036e27f765sm8965376d6.11.2026.07.10.09.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 09:01:34 -0700 (PDT)
Message-ID: <79888a39-ac3c-440a-9299-582066868140@riscstar.com>
Date: Fri, 10 Jul 2026 11:01:32 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for
 MSI handle check
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
 <20260709040027.958400-5-inochiama@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260709040027.958400-5-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/8/26 11:00 PM, Inochi Amaoto wrote:
> The IMSIC device on RISC-V based system does not require ID
> remapping for MSI. So this device only needs "msi-parent"
> property for IMSIC-based SoC, and the "msi-map" is not a
> necessary property.
> 
> Add new condition for MSI handling on IMSIC based SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

I have nothing to add here.	-Alex

> ---
>   Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
> index b3216141881c..91bbbc8924f6 100644
> --- a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
> @@ -27,8 +27,11 @@ allOf:
>     - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
>     - if:
>         not:
> -        required:
> -          - msi-map
> +        anyOf:
> +          - required:
> +              - msi-map
> +          - required:
> +              - msi-parent
>       then:
>         properties:
>           interrupt-names:

