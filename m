Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D928A3B9616
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787149439; cv=none; b=GwzRhaQFUGR1fb2GfyYd9OUToAU/fP0+oP5y/xPGCtBbPkPA0Id2uZDqO1O0BR4PV6CsqAU3QqNtQserUmi5DnpSnefBCJ5a6nHX4E33G5+y10GAQoGOC0z9EL/EqjIqAGTydqhSZlWzLNL+viJz2L/p54wprDk8P1RbXTJG+1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787149439; c=relaxed/simple;
	bh=X+0QqnQ54x098/x78IfpKO2AIYJW2Ks5q7VXDYoJeqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p8mw1sSnpDFAC3ubiTtDXdN/SKhFoFR4ssOPrehRa/rxb6BRb7ruR9OP/1Ib5jO2nLUAagNip4mvodDTJGD7l9obqTfGB/uI1qc5elkc18GtylyafWqmWku88DeNokVi6VXqmfm6HTRm0WHMv9NTTlSv1MCAh8D3fAajtjqJJUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=SoykcU/O; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="SoykcU/O"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1c52d920b8so154701966b.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 07:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1787149436; x=1787754236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hp8kNEPjnDTC5NVeVfx3xxeYDcABG50vdRMH6GzGxns=;
        b=SoykcU/O9i9xeyQ4mG1C+coy3NSNkxx/GSdSO0++rfIqQTaNcQbIZJ3O9jJ+fkwDyU
         NG/zsJGzCqZlVnp4ZAaP6mzO0Di8kSOmiL5VhDYIVgMTdqCCU9YhD2knRMcPDHbpqWz0
         XpkN40/4ECDE/tU5CPlZzY8yVdhe6DErCDl6sWZv/Yg8Cs6VYhYG9uNMyrbb1v8DF6to
         d04MgQJ6M1hCcOznzWFBkhzJJYLopdQHNrXw1r+Pz2Y0EMI9WzCMn7XS4UBH1FuQCLPP
         M9JjUb10ACgarRfoFsoq9nrfxn6gVN3ryF8VRTFhzeSq4mrKv1O3h1FRa48oQO87liBY
         wcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787149436; x=1787754236;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hp8kNEPjnDTC5NVeVfx3xxeYDcABG50vdRMH6GzGxns=;
        b=bATiQXgJBkT+MAusqijlcPlHIimAxyq/f9OvQoIafMGLE5p2PyKmgcfj995p8w+e1c
         VJVwldzQetiKAZAxXcgi8fO9vIaHFJ/uIlcnQtRXhwk8YhDNWpmxogurbryjNs2WbUKI
         j+dDq70aX7qCF0TBe+xy5GhU7Tk/m8PWtV8+wesMgnJyqA1ebGP7LDj5Db7txeHsvGJk
         ThESyCmWkyecmwug+BRJf23siNejRGJLQIveovz8BoKWijLttlwsNPu4mRSfyBSy0VgK
         Y0lI8/gCzixSvYH3YjPqyNuia+Ool+cxAj7rtk3xuBS08BbX7Rs597QvDWSbGrh46ikY
         O7ug==
X-Forwarded-Encrypted: i=1; AHgh+RoUzTlbU1srczxX0vmAdm7GLNrS04Tt88uhunuCE1nBfC8UiXGg4g+iZu8HpmhzLg3yAQqQ4YGWnCB5@vger.kernel.org
X-Gm-Message-State: AOJu0YxOpI9PZ1LAnL08DBkjHJBBxjWCtBe5WcqoKcn2AJh8tlFcxE6v
	jjEp2gtQCdbfVt9ZRVSe8HCzNIWrUS7GtrnHbwHGs65I7uNAs88zALTy8rRDrna3q7s=
X-Gm-Gg: AR+sD10H5o5t2yphzlSxWF8oxN3VOEZ1PFSNkFXHf7l23LOeDh5SZpxd0LZ7LLwaEKF
	fvfoWljQGetVzItpEh0RJUswt3GpVohUWFTjuE/EmavqbcnZ/5Dp0H97dGa4+7LSsTWX5aV/Lct
	Owi+vuk8wjrjlhIzKChHEMliLANA2MlIJErCp55ark+dTIbCuq73z8ykFkevdmduQ8tMcNnNzr7
	DTnsFQvbp7f2bJal5ZzClSkhdSrWKj4ghPGzkMYpBdiZJ5a5nU9h7zMBc5BLl8uGXjr+D6Bn/Ek
	kB0+9Ud04X+0B1H/lSeYUTW8MpHyvVrCNjdE++JaBBGWBDB6aBIOPBp13PUFXwbyw7pc9QpGQ5A
	/K2yn2uq1r1JHp7UdN2AZStMCdy+tBqM8nmtZNqSxyVqGXexXNluz5V5iVTESNsRj1ql5X4Bne9
	iOT99gC+RuGqx00A427vtt11qDMOjGS06TPPkYz9nAF0VLN+CA/GR8daU+yafV
X-Received: by 2002:a17:907:7247:b0:c21:74ad:8b7a with SMTP id a640c23a62f3a-c23f92d53damr354892366b.9.1787149435413;
        Wed, 19 Aug 2026 07:23:55 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c7c2581sm88382966b.14.2026.08.19.07.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 07:23:54 -0700 (PDT)
Message-ID: <d28580f3-233d-435f-9d7e-7ecc13e1920c@riscstar.com>
Date: Wed, 19 Aug 2026 09:23:50 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] PCI: of: introduce of_pci_verify_node()
To: Herve Codina <herve.codina@bootlin.com>
Cc: bhelgaas@google.com, robh@kernel.org, daniel@riscstar.com,
 mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260812172247.276554-1-elder@riscstar.com>
 <20260812172247.276554-5-elder@riscstar.com>
 <20260819122015.7e05e4dd@bootlin.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260819122015.7e05e4dd@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/19/26 5:20 AM, Herve Codina wrote:
> Hi Alex,
> 
> On Wed, 12 Aug 2026 12:22:47 -0500
> Alex Elder <elder@riscstar.com> wrote:
> 
>> Commit 407d1a51921e9 ("PCI: Create device tree node for bridge") linked
>> the PCI enumeration process together with devicetree, creating a devicetree
>> node for discovered PCI bridges.  Its successor commit ae9813db1dc5a ("PCI:
>> Add quirks to generate device tree node for Xilinx Alveo U50") shows how
>> to use a PCI final fixup quirk to also create a devicetree node for a
>> non-bridge PCI device.  These changes allowed devicetree overlays to
>> describe components downstream of a PCI device, by providing a place to
>> attach the overlay.
>>
>> Note that the dynamic devicetree node is only created if the device didn't
>> already have an assigned node.
>>
>> Later, commit aa7b4bbcb3a1d ("arm64: dts: qcom: qcs6490-rb3gen2: Add
>> TC9563 PCIe switch node") *pre-defined* devicetree nodes to represent the
>> PCI device nodes that would (also) be discovered via the PCI enumeration
>> process.  The devicetree node in this case is created with the content
>> from the DTS file.  So when a (host) bridge is done being initialized
>> during PCI enumeration, no node is dynamically created (the commits
>> mentioned above do not apply).
>>
>> Ideally, any pre-defined PCI devicetree node would contain exactly the
>> same information as whatever the dynamic creation process would produce
>> (though it could include more).
>>
>> However that is not the case for the pre-defined Qualcomm RB3gen2 nodes.
>> And in particular, the endpoint (function) nodes include this property:
>>
>>      device_type = "pci";
>>
>> This is simply wrong; that property is meant only for bridge nodes.
>>
>> Rob Herring requested that a runtime check to be added to spot this
>> specific error, only for non-bridge PCI devices.
>>
>> (There are many things that could be verified for statically-defined
>> devicetree nodes, but this is all we'll do for now.)
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v2: Verify even if PCI_DYNAMIC_OF_NODES is not defined (Sashiko)
>>
>>   drivers/pci/bus.c |  1 +
>>   drivers/pci/of.c  | 26 ++++++++++++++++++++++++++
>>   drivers/pci/pci.h |  3 +++
>>   3 files changed, 30 insertions(+)
>>
>> diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
>> index 655ed53436d3e..679afbc6d3109 100644
>> --- a/drivers/pci/bus.c
>> +++ b/drivers/pci/bus.c
>> @@ -351,6 +351,7 @@ void pci_bus_add_device(struct pci_dev *dev)
>>   	 * are not assigned yet for some devices.
>>   	 */
>>   	pcibios_bus_add_device(dev);
>> +	of_pci_verify_node(dev);
>>   	pci_fixup_device(pci_fixup_final, dev);
>>   	if (pci_is_bridge(dev))
>>   		of_pci_make_dev_node(dev);
>> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
>> index 8b18c4ba845cf..0bbf1a915b7d2 100644
>> --- a/drivers/pci/of.c
>> +++ b/drivers/pci/of.c
>> @@ -1006,3 +1006,29 @@ int of_pci_get_equalization_presets(struct device *dev,
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL_GPL(of_pci_get_equalization_presets);
>> +
>> +/*
>> + * Check a pre-existing devicetree node for errors.  The PCI enumeration
>> + * process gathered a lot of information about the device, and ideally it
>> + * matches what the devicetree node says.
>> + */
> 
> Can you switch the kernel doc format [0] or move the comment into the function itself ?

Sure.  I think it could be simplified too.  I'll take another
shot at it in version 3.

> [0] https://elixir.bootlin.com/linux/v7.2/source/Documentation/doc-guide/kernel-doc.rst#L67
> 
>> +void of_pci_verify_node(struct pci_dev *pdev)
>> +{
>> +	struct device_node *np = pci_device_to_OF_node(pdev);
>> +
>> +	/* If there's no pre-existing node, there's nothing to check */
>> +	if (!np)
>> +		return;
>> +
>> +	if (pci_is_bridge(pdev))
>> +		return;
> 
> The property 'device_type = "pci"' is needed for bridges.
> 
> You could check that it is well present in case of bridges.

I think that's a good suggestion.  As I said in the comment, there
is a lot we *could* check, but Rob seemed to indicate he didn't
want to go very far down that slippery slope.  So I limited what
this patch does to specifically looking for the device type in
non-bridge nodes.

I will add the check you suggest in v3.

>> +
>> +	/*
>> +	 * Currently we just verify that non-bridges don't contain a
>> +	 * device_type = "pci" property.
>> +	 */
>> +	if (!of_node_is_type(np, "pci"))
>> +		return;
>> +
>> +	dev_err(&pdev->dev, "\"pci\" device_type NOT VALID for PCI endpoint\n");
>> +}

Thanks a lot for the review.

					-Alex

> 
> Best regards,
> Hervé

