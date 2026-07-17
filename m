Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8B63ECBC8;
	Fri, 17 Jul 2026 12:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784291518; cv=none; b=OUuEf9P+uUGQgwOpCqDsRTQRbnQgnI0z5ZHrRN0qfteV1vMzZeilVhPAGUCZxPAhX0T+SQ2mlQdfK6jUMVI5938nYcSeoLPb5f0gRDRqYV8teFhJDWYq+hTniM+FBolA04XB79xQgnPgVL8gPzmvnLeRDgSlWihlCPGXYMXP830=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784291518; c=relaxed/simple;
	bh=Dpv+Xy7W4aWUqzOCFYdd5/X22eVcVBuQoZ9n+7A2Leo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dnSveV/Mzmx1xHEwvdmuEZlr3TCBrIhRRXiuDaXry7oWHjPQuXXuAy8H5ArTNJYKsHYi+Q3q6oyz1TsGtVuEc4BPDCF/+1Ba9Nq93I/cpThhXXV8/gRUj5EqDBrtDH5PShpMN6PYepx4CRr6BfYA4jXLX4oX/d5OHOCFfB6FR9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=erabytZa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="erabytZa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326BD1F000E9;
	Fri, 17 Jul 2026 12:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784291516;
	bh=2wZu4wYF6dMBwvlB8oINlw1/6pL7faAAc2pe/z26M3g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=erabytZagxGkT0YBwtdo9Pl45+mY5mECSDX8yGJbLtKkMs9ljlWhPGzRBmIqDjJyn
	 tK77CZQCz+5+8iErBmzsWYqzhaFSRkZdI8ZHRCcQSAqur1fe/e2VdrltGfZpnmlJvK
	 PmCm7zci5iwKj+rBcw4SLEuvyajKzzdLLeh1l0DS3lNdPSXJwRQX6CvdSQkoyEuAHq
	 YbIGSDKNOExDVRNGyr1YiP0OD8mfcWTUxv/okAzZZMOzshcgnsE31v5eWuVsst6i89
	 S5rQoHpKG8prxeXP6DJ7x1ghBo1dPquGHmTzrQmkpLoVTSw46xEbcK1T3hQERKDjOt
	 f7DLWFsWJaq5g==
Message-ID: <94ce2136-3adc-40f5-946f-b56778f6343c@kernel.org>
Date: Fri, 17 Jul 2026 14:31:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] regulator: dt-bindings: Add Silergy SYR82X allowed
 modes
To: Victor Krawiec <victor.krawiec@arturia.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260715155141.128601-1-victor.krawiec@arturia.com>
 <20260715155141.128601-2-victor.krawiec@arturia.com>
 <20260717-nostalgic-raptor-of-sunshine-1aba9a@quoll>
 <fd7d5b72-a400-435c-bbac-9e661d98e3c9@arturia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <fd7d5b72-a400-435c-bbac-9e661d98e3c9@arturia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/07/2026 14:02, Victor Krawiec wrote:
> On 7/17/26 11:08, Krzysztof Kozlowski wrote:
> 
>> On Wed, Jul 15, 2026 at 05:51:38PM +0200, Victor Krawiec wrote:
>>> Make the PWM mode configurable from devicetree. Some boards require forced
>>> PWM mode to keep the supply ripple within acceptable limits under light
>>> load conditions
>>>
>>> Indexes are starting from 1 to keep backward compatibility with existing
>>> device trees
>>>
>>> Signed-off-by: Victor Krawiec <victor.krawiec@arturia.com>
>>> ---
>>>  .../dt-bindings/regulator/silergy,syr82x.h    | 20 +++++++++++++++++++
>>>  1 file changed, 20 insertions(+)
>>>  create mode 100644 include/dt-bindings/regulator/silergy,syr82x.h
>>>
>> This header should be mentioned in the binding in property description.
> Thank you for the review. I'll add it to the binding in the next iteration.
>>> diff --git a/include/dt-bindings/regulator/silergy,syr82x.h b/include/dt-bindings/regulator/silergy,syr82x.h
>>> new file mode 100644
>>> index 000000000000..6d4aa86bb5c1
>>> --- /dev/null
>>> +++ b/include/dt-bindings/regulator/silergy,syr82x.h
>> Some confusing name. How is your binding file called? This must be the
>> same.
> 
> The binding file is named fcs,fan53555.yaml and handles several devices including the Silergy SYR82X which I was targeting in this patch serie. I will rename the header to have the same name as the binding file. Should I also rename the macros defined inside the header (SYR82X_REGULATOR_MODE_*) ?
> 
> The underlying implementation in the driver (in fan53555_device_mode_map_setup() it the patch serie) is limited to SYR82X because it is the only hardware that I'm able to test. That's why the binding part was referring to this specific device.
> 

So you are adding constants for one device but used in the bindings and
driver for other? Are they valid there?

The fcs,fan53555.yaml does not say that any modes are particularly valid.

Please wrap your replies.


Best regards,
Krzysztof
