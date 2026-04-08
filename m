Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A388A2135C5;
	Wed,  8 Apr 2026 07:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775635102; cv=none; b=XcPV6FtlHlikCOZljGzKnyTf7TUX7Kido6Dsd0m8l8iWVEQzMAilFoU1vmingqstNx/39geRvs7y233t9eUz15tRReblme/aa5nQLHZAgiQSiq+wyUE5V51auB3FZa5UpgBQjm80DQeQzGcu+6asgyE98UuVI/cX0HyQp/HeduE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775635102; c=relaxed/simple;
	bh=Yz6zaA7HccdnO8j5GA8dM2q2o4G4Vg6cmhKKXLwtRT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zz3w/9WltRT/oypD2bvUaRrzgFbKJe/fZpzjDSNKw3SZCx/IWcoaAew6Y5C++bNCYkzOnBjm2TqnMMq3zGRwwEsWq2hQwi4BtN36XvDyHPoqW8xA6TGFylODfAt4Nv0ONIULiRc5UEmItW5W7NM/+aCvdkndz/duxIddXtDJY4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=J5SOlZhi; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="J5SOlZhi"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 59CA9C5B1AB;
	Wed,  8 Apr 2026 07:58:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 39D7F603CB;
	Wed,  8 Apr 2026 07:58:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9771310450313;
	Wed,  8 Apr 2026 09:58:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775635098; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=td691qGU7Hw7dFQz66Ba4guExquNXTBzAl80jvJ+rKY=;
	b=J5SOlZhiU3WBnY7s4i9AdcF5QhiB5sCOBMEu4nSkem191O7NtUPiR+CdVHg6Rh5Wykdn2D
	6emsZ4TI+oidYjAxhr7CkyXZOVuWIDJDbA3VDcWKKmZV2n0ex6bZLOfc49lzenXs1cuTXP
	0xhtB3G2Q/VJvTGCRQAeLcNJmC93PJdUznBIZonV9OJ1EwiQHTp2nlzqGmkDSioG6PB68t
	PEtg61+OEhQVYkjKtrbl8JEeK8JaLcVzEt718EUYz6ay8/WFpWNYzpFc68X9wgfMXjSWkk
	/u58jULiQdGzd/Xlpcglkz2jMPsSd1UnsedVRmsq+/TOH5xwVF5dMx8h0xwDoA==
Message-ID: <9d76f827-3967-4ab6-b6f0-77d1bd564278@bootlin.com>
Date: Wed, 8 Apr 2026 09:58:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] dt-bindings: regulator: ti,pbias-regulator: Add
 pbias_sim_omap4 regulator
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260330-omap4-fix-usb-support-v2-0-1c1e11b190dc@bootlin.com>
 <20260330-omap4-fix-usb-support-v2-2-1c1e11b190dc@bootlin.com>
 <20260331-funny-impetuous-bobcat-eb56af@quoll>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20260331-funny-impetuous-bobcat-eb56af@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hello Krzysztof,

On 3/31/26 10:22 AM, Krzysztof Kozlowski wrote:
> On Mon, Mar 30, 2026 at 03:43:59PM +0200, Thomas Richard wrote:
>> Define pbias_sim_omap4 regulator for OMAP4. This regulators drives SIM_VDDS
>> supply and allows to unlock USB I/O cell.
>>
>> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
>> ---
>>  Documentation/devicetree/bindings/regulator/ti,pbias-regulator.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/ti,pbias-regulator.yaml b/Documentation/devicetree/bindings/regulator/ti,pbias-regulator.yaml
>> index 3e020d87701b..908fbb46b5cf 100644
>> --- a/Documentation/devicetree/bindings/regulator/ti,pbias-regulator.yaml
>> +++ b/Documentation/devicetree/bindings/regulator/ti,pbias-regulator.yaml
>> @@ -89,6 +89,7 @@ allOf:
>>                contains:
>>                  enum:
>>                    - pbias_mmc_omap4
>> +                  - pbias_sim_omap4
> 
> Names cannot be fixed, because they represent different board naming.
> Why growing the deprecated style?

Okay, so I'll drop all if statements, add a regex which matches
regulator names and fix the regulator name in the driver.

Best Regards,
Thomas
