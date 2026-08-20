Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BC433CE9A
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 17:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246332; cv=none; b=OIwBU5rCKltsT38/AiRrcjvvtKzefHU5eUC479+RZi+3BJarxpUknqUKDuSAsctc8+FV21tlpf5HxcCzMXCg+Ai5iJCgIzYWYiX9bH0cuWRmRojsI1RVfle7ANyRB+168V6fJEUSMIAU2DI3JTHh3VzztIUjZYQeb/eaOHUcBVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246332; c=relaxed/simple;
	bh=iNJqeMqjI6DJobrOGzMqO8mZoPkJe4sD2dN06To6hCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NW2wouer7vQS7mSqCXyI6yD8/KCkJzsgYtL6C9xq3dgOCEoFOs5+EcblccD679LbM3oYKN7JcGHY59WmqedolfVqTtJvzBK1vEjO5RyIXBUTTUmyWAfJLc/3tRQsSjd54HGQB+aSeWrfFcpXFMv/CPSlJRYPAsIEAoaHmD6Ep7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=N22PgAYO; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="N22PgAYO"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92ed19f4d60so1354885a.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1787246329; x=1787851129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eCCdoQqiaW1nj8J5UXUMFmTcHTDmPsmHtrU7WPub7gI=;
        b=N22PgAYO6psqJ0oK842Ey3x81cCZxmIY03IvyLTyHl0J467qLbZW4o28yOnUFap0rF
         O96VQp/dwch4ZJgbCz91L56nPrvIM5LEWesZEoWHShZO/KJeXwsRiMBQnQ9cLCKKV5MH
         TH5/M2ly32yl93a2gL9fP4wcq5n5vfOqWtgs0Q7xazJhGhbQmaK7/iP/97XYOX3WHGRE
         8lAacBSrsK6RGbi+4JsjQGxk4DY8+QtNvASlbZwI/wkiFPUC6sHPhpj6LB35xYhAXqZz
         GNPb6HmKdYuOGmmI8Ark/y8y2zhiYkIhGRlJdeuhaqBtEjYK28jwi+HP7CIuSNnUTYXG
         zK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787246329; x=1787851129;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eCCdoQqiaW1nj8J5UXUMFmTcHTDmPsmHtrU7WPub7gI=;
        b=DyuzrgPpC3Il6TUWTb4/0xryhIJgPugJVBpqOh0JGlCvofaoTNOwfLQSqT+QnuoQ59
         gkjivl2lVUTnOTQspEUS5t+L6dCE+BFz2OfnFQE3LAe5nbeHEmLNBCxoY42d9FTFXjC9
         ZA5zpmoWU2DwZLCe7udY+UgVroe5hmEWnY1cHg3J2ieZbwGKelSPwgQQ7Pu+8jVm1e7b
         DOONG/USEtjrvDyRX5PH561XMH22+eVhtY6vX9ODLr/uqdPkmE5WJJ5oQlgu+GzV7K/s
         +V+9KQ01pjw7GphzPrR+rj3QLxY0mZWz9FAWmsTvFdx3o/5EsXsZTjd3gbjEx4zhzULR
         VcUg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2rVzAqFEzNy0Hrs2F36PisHxrGZS7BheBBWfUaUJox5dyw6w+M6iR3vO7jEy5YANHqx8BIr9I6zDO@vger.kernel.org
X-Gm-Message-State: AOJu0YzJS9kBZzQqApfm7zGarbJeuUGX6SJA+zw5MptJSivuXYuRjyn6
	J6QElNuWB/xPDk7XWOMJyvG9Nzd65nANzf5KSZDPfytUXYiFcppvhH04GNLsTg1emuY=
X-Gm-Gg: AR+sD12RVelnQrgL983yEaqqDCuBN/xcSNS7dxypp9ZFIEPUAHutG0gniXaxdzwEVPw
	zSDtO7Q7tmbU8bZarKMn+lU1wSwg216tH6DCcsV/su96lO6/QT3/qM2IuSR1xx8qsJ5tSD0pNp3
	RPS2qn6QSwpvsdN0EUxNk+XCy0qGB8nCj2epKzcfTng4YgemwZYq7VjXIVeaZRfulLsOey1zY7Z
	RexGGb1+bXHEMOKOzbfHUjrET+QD/CX4sxT876/fvvrbSFKuZjkk/yoHLHzXlalEJEHxly3ToBz
	xs0ZLEd1ofObfCXpbG8YlatP19JtjdijKzJAsbAlzfRk1S4Bd77KeYH4/2VHisVc8JSasQn45l8
	Hpjn1l/3qagGfAzzljPSsDLnpv6PibPNsWqoWKhBdEtPAuko7EETt0Lv3jPahgXIddg6UDXoMOm
	M2xxVgKSaXMvnXhGecnCDSO0vN9u7EmfhyLRqJCk3lgTY5za/MscXOE7UhTpfq4bFfKtxF9TI=
X-Received: by 2002:a05:620a:294d:b0:936:a184:3cf3 with SMTP id af79cd13be357-9372840f584mr862546985a.10.1787246327788;
        Thu, 20 Aug 2026 10:18:47 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-937204a91b0sm418891185a.15.2026.08.20.10.18.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:18:47 -0700 (PDT)
Message-ID: <e98e8996-1ae8-47be-8854-55a004530c85@riscstar.com>
Date: Thu, 20 Aug 2026 12:18:45 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: misc: introduce pci1179,0220.yaml
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: bhelgaas@google.com, conor+dt@kernel.org, linux-pci@vger.kernel.org,
 mohdayaa@qti.qualcomm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 daniel@riscstar.com, krzk+dt@kernel.org, arnd@arndb.de,
 lbiancon@qti.qualcomm.com
References: <20260813222943.1655453-1-elder@riscstar.com>
 <20260813222943.1655453-2-elder@riscstar.com>
 <178682676059.2183315.4478974489132403040.robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <178682676059.2183315.4478974489132403040.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/15/26 3:46 PM, Rob Herring (Arm) wrote:
> 
> On Thu, 13 Aug 2026 17:29:41 -0500, Alex Elder wrote:
>> Define the binding for the Toshiba TC9564 PCI endpoint function device.
>> The third downstream PCIe switch port within this chip has an embedded
>> PCIe controller, and that implements two of these PCIe functions.
>>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../bindings/misc/pci1179,0220.yaml           | 150 ++++++++++++++++++
>>   MAINTAINERS                                   |   6 +
>>   2 files changed, 156 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/misc/pci1179,0220.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:

I don't see these errors, so I'm probably running an old version
of something?  I'll try to sort it out.  Sorry about that.

					-Alex



> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/misc/pci1179,0220.example.dtb: pci@0,0 (pci1179,0220): pci-ep-bus@0:compatible: ['simple-bus'] does not contain items matching the given schema
> 	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
> Documentation/devicetree/bindings/misc/pci1179,0220.example.dtb: pci@0,0 (pci1179,0220): pci-ep-bus@0: 'reg' is a required property
> 	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
> Documentation/devicetree/bindings/misc/pci1179,0220.example.dtb: pci@0,0 (pci1179,0220): pci-ep-bus@4:compatible: ['simple-bus'] does not contain items matching the given schema
> 	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
> Documentation/devicetree/bindings/misc/pci1179,0220.example.dtb: pci@0,0 (pci1179,0220): pci-ep-bus@4: 'reg' is a required property
> 	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
> Documentation/devicetree/bindings/misc/pci1179,0220.example.dtb: pci@0,0 (pci1179,0220): ranges: 'oneOf' conditional failed, one must be fixed:
> 	[[0, 0, 0, 2197815296, 0, 0, 0, 16384], [2, 0, 0, 2197815296, 0, 0, 0, 524288], [4, 0, 0, 2197815296, 0, 0, 0, 2097152]] is not of type 'boolean'
> 	0 is not one of [16777216, 33554432, 50331648, 1107296256, 1124073472, 2164260864, 2181038080, 2197815296, 3254779904, 3271557120]
> 	2 is not one of [16777216, 33554432, 50331648, 1107296256, 1124073472, 2164260864, 2181038080, 2197815296, 3254779904, 3271557120]
> 	4 is not one of [16777216, 33554432, 50331648, 1107296256, 1124073472, 2164260864, 2181038080, 2197815296, 3254779904, 3271557120]
> 	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
> Documentation/devicetree/bindings/misc/pci1179,0220.example.dtb: pci@0,0 (pci1179,0220): 'device_type' is a required property
> 	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
> Documentation/devicetree/bindings/misc/pci1179,0220.example.dtb: pci@0,1 (pci1179,0220): pci-ep-bus@4:compatible: ['simple-bus'] does not contain items matching the given schema
> 	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
> Documentation/devicetree/bindings/misc/pci1179,0220.example.dtb: pci@0,1 (pci1179,0220): pci-ep-bus@4: 'reg' is a required property
> 	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
> Documentation/devicetree/bindings/misc/pci1179,0220.example.dtb: pci@0,1 (pci1179,0220): ranges: 'oneOf' conditional failed, one must be fixed:
> 	[[0, 0, 0, 2197815552, 0, 0, 0, 16384], [2, 0, 0, 2197815552, 0, 0, 0, 524288], [4, 0, 0, 2197815552, 0, 0, 0, 2097152]] is not of type 'boolean'
> 	0 is not one of [16777216, 33554432, 50331648, 1107296256, 1124073472, 2164260864, 2181038080, 2197815296, 3254779904, 3271557120]
> 	2 is not one of [16777216, 33554432, 50331648, 1107296256, 1124073472, 2164260864, 2181038080, 2197815296, 3254779904, 3271557120]
> 	4 is not one of [16777216, 33554432, 50331648, 1107296256, 1124073472, 2164260864, 2181038080, 2197815296, 3254779904, 3271557120]
> 	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
> Documentation/devicetree/bindings/misc/pci1179,0220.example.dtb: pci@0,1 (pci1179,0220): 'device_type' is a required property
> 	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260813222943.1655453-2-elder@riscstar.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

