Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33761E9B3A
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 19:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779738331; cv=none; b=Qhj5Yd829pVQQcIObiY2npPcc7s2L6LwkhNurArQEs87IDdSuOSO4Puoq60yn7DbY4id61YwzjnjopMCHqLWTlSVraU00E/lmK82WZfaVdxZ+WW1dlDp4Nj0KPKjUOt/DsZpA7WzsZyFtK8+SQrkQ1NVZid/HEHe+A7FuwgwK+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779738331; c=relaxed/simple;
	bh=YrSjkm1pVvbbbAOZLBsdsaX1UWYNBbU/q4pxoxbJebc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cEonM2nSeN56Gp9XY529Ix7C4p/damv6EGllKo+huHgyyAfaNafQ5joLyqfb786uh9T7EyXN9fQ8rHUj3BtDp7BS0kX1zMl7bcHxxFw3c55ux59t7WF521aP4azhMrRAY7aKkq69pu/th3OuLEffctfngWz8H+qYcJnNER4bIVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nlgncCXG; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="nlgncCXG"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gPRF20XWSz9tKc;
	Mon, 25 May 2026 21:45:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779738326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dMHLpJaQFOsrnBC8AP7rRNUnoEDnBXORgAku0499nKM=;
	b=nlgncCXG2/zkn8y8yhkMdcUDBMeMLg7tgH8EdFqNa338iyUHl41G6hWFd4LNAn286FwSLS
	PEVeF9sYp11ZcRC2lgBGbQnidP96hbArFNY/3s8YheqaXEo1RA0tvM40VGqWkWK3H21lfY
	9ifh8nae0Sw9+ZXyVSI5RV67MJRHSBQ4GwN7xbAIHQPniTFvl+Jb0nqL9Kp+wWiQyApPJf
	EVbzgppk6BYmyXWo+aguvb+yodqYN/9NMvu+sKueP3AwXUtJYIGrjaLtF3422zAepSax3x
	1D0+SqL1wyfMY9NiDgQQQxy54oahy1G30uuzF61kcQBZdeGfR+leO50twpAvig==
Message-ID: <e5153d48-a566-427e-b288-b335cc9b0f6d@mailbox.org>
Date: Mon, 25 May 2026 21:45:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] dt-bindings: clock: renesas: div6: Use ZT/ZTR trace clock
 in R-Mobile APE6 example
To: Conor Dooley <conor@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260523192622.56605-1-marek.vasut+renesas@mailbox.org>
 <20260523194047.AB7CA1F00A3A@smtp.kernel.org>
 <20260525-myth-flanking-667fa0a706ac@spud>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260525-myth-flanking-667fa0a706ac@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: oqxx5dum3snyrfo5ff9eabjgpji6fmrr
X-MBO-RS-ID: e6bbf6c40b0beb3432c

On 5/25/26 6:37 PM, Conor Dooley wrote:
> On Sat, May 23, 2026 at 07:40:47PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Low] Adding 18 items to `clock-output-names` in the example triggers a `dt_binding_check` schema validation error due to an un-updated top-level constraint in `renesas,cpg-clocks.yaml`.
>> --
>>
>> commit aaa0ff6ae07f5974071a547fef4a5b41bc484428
>> Author: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>
>> dt-bindings: clock: renesas: div6: Use ZT/ZTR trace clock in R-Mobile APE6 example
>>
>> This commit updates the R-Mobile APE6 clock node example to include
>> the "zt" and "ztr" clock-output-names entries. This aligns the example
>> with the expectations documented in a previous commit.
>>
>>> diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.yaml
>>> index 2197c952e21df..b6ee8c8efd46d 100644
>>> --- a/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.yaml
>>> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.yaml
>>> @@ -60,7 +60,7 @@ examples:
>>>               clock-output-names = "main", "pll0", "pll1", "pll2",
>>>                                     "pll2s", "pll2h", "z", "z2",
>>>                                     "i", "m3", "b", "m1", "m2",
>>> -                                  "zx", "zs", "hp";
>>> +                                  "zx", "zs", "hp", "ztr", "zt";
>>
>> [Severity: Low]
>> Does adding these two items cause a schema validation failure during
>> dt_binding_check?
>>
>> The top-level clock-output-names property in renesas,cpg-clocks.yaml has a
>> maxItems constraint of 17. Adding "ztr" and "zt" here brings the total
>> item count to 18.
>>
>> While the underlying limit omission occurred in the earlier commit
>> 2abdc3dcf978, modifying this example to 18 items will now directly
>> trigger the overarching validation limit error.
> 
> What does renesas,cpg-clocks.yaml have to do with this?
> This is just complete crap, right?

The example in renesas,cpg-div6-clock.yaml references a binding in 
renesas,cpg-clocks.yaml , but the both ingested some nonsensical version 
of the later and produced nonsense based on that.
