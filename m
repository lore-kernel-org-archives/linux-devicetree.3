Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2CE1A9F90;
	Sun, 19 Jul 2026 05:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784440689; cv=none; b=Wg52rckqACa+oHDbkmxCv8TtZ+4HvRqmSoJ2+2gD1ENU7h4AYyxkapZUmpkM8POnH+JYFCOE6cVBL2csY1SCv+3whQgl3Id3lkEriJP7HUpo1uvEG+gxy+mmiuxdfPZ7N/Vp6LvUSjRPEq1dJ27Lhy/Guww1aYNz1hD2MN3nblo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784440689; c=relaxed/simple;
	bh=wUHT9nEK6Yu905UR13NLzU7eNlfBtmgIe5XQ8r4E6kY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PklNND1p9JNWjwEVQKDXIA8yl1fEiwKKfT1hFehi0RCHhxttZ7W6N3/eb5ul5yb5zUEc3GtQ765w9f6ArlHozJujPtRN1Bh5JCo6bBePBY3MATIaDcNnz1/Zmf7F7OHL3eKJEhLyzJ1Dd2HGkZ0pQHVhUKKRlCBgOcTYGcIZePQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KKduVpL3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKduVpL3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49581F000E9;
	Sun, 19 Jul 2026 05:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784440687;
	bh=p+fcCmVhgwWoUK/cGcXircaGZxNi64IdTofNZ1i1kH8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KKduVpL3ujEzyGu4BSec6tIyMTACLbyw6CCxq8+rGKeTKk/p03+GYTQ9PDwn3xk9j
	 fT45lT2wRQw3vOrgJkOLj5Pp+7kUsZJoiqIwAp4jnbOEUysuWLA5g1lb3U5YdPB4Nr
	 EjoUf2P4/vc2jBH+94XvNveM/+1eNn5UXd6iJz8O385RFe3X89YzzP0fkPfB/Zvr7k
	 sATUzl0dO5Hbjcwq93VVXzMEFKcu2rIy0AZ+1XNXF49Ih7VHBTu6PBqsVeys4ZLKyA
	 kFAmJ/3J4bS51hVCfJ/tKbTM7weHcQum5KB0sxS9rSKkMXH+WJw7Kh/ZKcsQtutbBr
	 E1cfsnrc9t7uA==
Message-ID: <98848a59-6385-48d0-926f-3e78aea9a386@kernel.org>
Date: Sun, 19 Jul 2026 07:58:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] regulator: dt-bindings: Add Silergy SYR82X allowed
 modes
To: Victor Krawiec <victor.krawiec@arturia.com>,
 Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260715155141.128601-1-victor.krawiec@arturia.com>
 <20260715155141.128601-2-victor.krawiec@arturia.com>
 <20260717-nostalgic-raptor-of-sunshine-1aba9a@quoll>
 <fd7d5b72-a400-435c-bbac-9e661d98e3c9@arturia.com>
 <94ce2136-3adc-40f5-946f-b56778f6343c@kernel.org>
 <38adfbda-2cdb-49bb-84d4-aae0a6258f68@sirena.org.uk>
 <c3977e59-951b-4d91-a775-6c96cb84e37c@arturia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <c3977e59-951b-4d91-a775-6c96cb84e37c@arturia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/07/2026 16:14, Victor Krawiec wrote:
> 
> 
> On 7/17/26 14:44, Mark Brown wrote:
>> On Fri, Jul 17, 2026 at 02:31:51PM +0200, Krzysztof Kozlowski wrote:
>>
>>> So you are adding constants for one device but used in the bindings and
>>> driver for other? Are they valid there?
>>
>> It's one of these devices that's got a bunch of clones from various
>> manufacturers with minor differences and share a driver.
> 
> I checked the datasheets and all devices share the same 2 modes which
> are Auto-PFM and Forced PWM mode.
> 
> Since devices are all clones and share the same modes the binding part
> can be generic. I plan to rename the header and its macros to use
> FAN53555 name and add this property to the binding:
> 
> regulator-initial-mode:
>     enum:
>       [ 1, 2 ]
>     description:
>       Defined in
>       include/dt-bindings/regulator/fcs,fan53555-regulator.h
> 
> However the implementation I made in the driver is currently
> restricted to SYR82X. I could make it generic but I don't have access
> to the other devices to test it.
> 

Old name of header file is fine, but please explain this in commit msg.

Best regards,
Krzysztof
