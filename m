Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2AB293458;
	Thu,  4 Jun 2026 11:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780571715; cv=none; b=qo07EYseL2wlfPTRE/ir3xnavAIq7LkeCpd7AL7Nfk39tIlSl2TaESMpMo7MSumTyklMrRizQvkwFjuslD11WU7IGKbsjUP0DCDjUamNLVwaBh1xiRPtuLO+lGT5/fq5BNX9MmEVqrK3Y1KQdub4rJeOxVNAdgbEGzeT/6ymxH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780571715; c=relaxed/simple;
	bh=2hZsUzV5rZSjJFXJN/G4U1/FCPPDFSk/82udvY4q4K0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jLg5XOi+L9Q+rgP6/mGsRx0WG6izTbsGO5ecX+hsMKN+TMrmkE1CFGttAGu7BNOGOvjTqSxixOEiy61dBfPgXE07SV5NbovkPBqrKMBOd8pafC2mnh6DGZTRksLBCU7pjMPqGX9rUYbihHnTq/ntUBDj+iGTryZWxWqd3qgs/VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zwddmue5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zwddmue5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5490B1F00893;
	Thu,  4 Jun 2026 11:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780571714;
	bh=2RHAd0AqNW6F5CWh7mk9JT6EDU1giLw0MsbHsiaAQVA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Zwddmue5OvqEtG41bGX2r4KEWvCz/MT32H+jTB1LMVx3rCTIvqELtjVi9qGC4VXW9
	 4COYhYY70853+E+43ZVLnB6De0ySSWun2X63+fCRLFVloRK7xfirAAICmwJptQjpQq
	 fh35Jv6Yf2qu/lBOEPpfadNw00T56ReoRADsxT+MS6jm5m9v+1FdHFD/M3jtEMjmJG
	 3wj2KUOqz9LxiUCjz77+TcHn0yIQfFtUQRbAPWT8+ibQeb8EgjzYyPCGU7wJw9oPoL
	 WXdK8IS0nI5x2A5ga1L2Tb3v9BJYPd2HkYwyLjeVG55wRl6HpZbUhYO0KAnqvi8n1J
	 poeWYF0EIAD1w==
Message-ID: <62e4809b-078b-432f-a3b1-59559a4aa77f@kernel.org>
Date: Thu, 4 Jun 2026 13:15:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: socfpga: Enable the SMMU for SoCFPGA
 device trees
To: "Nazle Asmade, Muhammad Nazim Amirul"
 <muhammad.nazim.amirul.nazle.asmade@altera.com>,
 "dinguyen@kernel.org" <dinguyen@kernel.org>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260515080014.6260-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260515080014.6260-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <c1aad046-fef0-4c2a-9e51-59e643e7966d@kernel.org>
 <47a7cb44-416b-4e48-a7f2-b6b69b71896a@altera.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <47a7cb44-416b-4e48-a7f2-b6b69b71896a@altera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/06/2026 12:55, Nazle Asmade, Muhammad Nazim Amirul wrote:
> On 30/5/2026 7:11 pm, Krzysztof Kozlowski wrote:
>> [You don't often get email from krzk@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> On 15/05/2026 10:00, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
>>> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
>>>
>>> Enable the SMMU on the SoCFPGA board device trees where it was
>>> missing. The SoC uses a different memory-mapped base address for
>>> its peripherals, which requires the System Memory Management Unit
>>> (SMMU) to be active so that the Secure Device Manager (SDM) can
>>> correctly access those regions through address translation.
>>>
>>> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
>>> ---
>>> Changes in v2:
>>> - Move SMMU enable into the base DTSI file instead of individual DTS files
>>>
>>>   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
>>> index b06c6d5d60ee..64f3739a0c33 100644
>>> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
>>> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
>>> @@ -385,7 +385,7 @@ smmu: iommu@16000000 {
>>>                        interrupt-names = "eventq", "gerror", "priq";
>>>                        dma-coherent;
>>>                        #iommu-cells = <1>;
>>> -                     status = "disabled";
>>> +                     status = "okay";
>>
>> Which file disabled it?
>>
>> Best regards,
>> Krzysztof
> Hi Dinh, Krzysztof
> 
> Thank you for the review and feedback!
> 
> Addressing Dinh's comment — the commit header has been updated to follow 
> the subsystem naming convention.
> 
> Addressing Krzysztof's question — the SMMU was disabled in 
> socfpga_agilex5.dtsi itself, where the node is defined with status = 
> "disabled". This has been clarified in the updated commit message.

This makes no sense. I am asking which nod makes it disabled now, that
you need to enable it.

Best regards,
Krzysztof
