Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BB11E98FF
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 01:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775093160; cv=none; b=NPMtPYGlGKaWGSxWDSKWZdnW3W9yzjxYN0BDkkBJ1FoAyEBi2bdH3up4aJ+ccjQzmi4bI2yFpVY8sBN8Qj0OiTHtmZ+yot4X5mNm1PcylKneYRQuAJi5azOAsEvU+Ju7cakBhYL5poOj+wGxzqJDjdB6qvUGuRuXDjaCOwPPEeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775093160; c=relaxed/simple;
	bh=evfYIKJkPHZ9+yUV/8inPLH60gyR9XmPjdvpEZbmVHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vft0qidoJYNYRoLLaqkeBJT7wi4INbqp9ZwWSmCWXJt8KScLpj8yhXQdLvXYSuAAvbfeOzPaZ0bCkLMBv7kLwfqH+9CDgPO0zNepmHxEeqCn3FmPbOXvomKikeHVO0npVEeqt1fd/UbR8fTMhoL2gvGMnueaUr/g4e8Gce48BVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pWvMSrP3; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pWvMSrP3"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c18af885c0so775246eec.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 18:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775093159; x=1775697959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w0TTSvzfniH028lzX8No8jAcQ7PnQHkFWjL5CrlFmII=;
        b=pWvMSrP3g3ebFOk9pjA+H3/BmMbMXn55mhxlpTneELsRD5dm9b3Z13QXPMg2wNxWJj
         peOALi5jY/t49jCgxJCk+Awr2EJypLlL+IuRnVWsUidtpceq7KW5crNXY51Rg15XzMXq
         ubwZ12FgnPQK8HJSLDyOfbblGV/s1rTXWnbNkkRusbXqqz7ozQXGIILiDH6LeyQAMCtR
         L2gj/QAR1elR9jjdD0Ow+6pdw/WC/MsdXUwIe4KpBjpixkgr6JQGK5mqjH65hzEZrrh1
         adc7CbKr1xMzgVqNgyjFULbvlFGSo0h38K2UYEmGZJpTThgOrVNwnefrb5r9pttNX0Re
         Fw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775093159; x=1775697959;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0TTSvzfniH028lzX8No8jAcQ7PnQHkFWjL5CrlFmII=;
        b=ego6zqnQYph+aZcloY9cqM9hNNZvAgxpKbWQPMMaPTONGt4RPT5fvoJPN5BrFPRBGD
         AefYTjozvLg209k5ULDlqx1TYRs4+ktBZxQPqbVNqeJhOX6jz7RcnHEi3y57etklhU7m
         hprOFNg8EmjWmhJpG7i6kVLtGqsprfKUbOGpMby1GEfM9iJuX+CG/8t+FQPBL5zRYxlc
         jHeUVESx4QhJNCyoPQZBIURDOnnqyDoe7JFyuUTM8uCsfygtmdSHtdrYuSP6LevP09ot
         6QBoEHmaiWP+YhHxkgdT9YBuf+/YTYbYyECbgo808XfqoV9Ta53kcmYSGINBNEJOlxoy
         bTjw==
X-Forwarded-Encrypted: i=1; AJvYcCUCuJUO+wo3zkd0EpzP84/hOINj/lLOphrgxLVTnk+4E/GCkUp3kCr2jJDljE5idIEHflqgc9teDweP@vger.kernel.org
X-Gm-Message-State: AOJu0YybTDELyNjEyGbXF87aW4T+iWGxEehy5kXJQZK+8oawE4fEtAb7
	NTLzZ6pR6ISOhV6ONCuMGbcNBBJKtFE12lU1Wh4QP9U+jCZDvuQft0CfbJeoCFTR2S0t2mXV44r
	7v5f8YLYjj0A=
X-Gm-Gg: ATEYQzz+uzRaTDbTEKhb+0qL+g2/gZ3UJ9oMPI3pImAfl3ah9UTFBvtamhirrkJGhp8
	J/BWfdzSib+UKoTFncg92DB86bn/d71ZBbcV/hY7TmRl6qR0VZMt57rB7p/yQB7u6yWDbaHH25S
	/167SHk1wHCWvGbE781TpH3j16Jwjlr78bb+ejILw6O2rDy/OeArH5qXNzUZ12OAe2aW/8bAvMO
	oH/gklYr22EBKy/VgISaXzREK9CAmZN+lA34tBghy1SsoDgg+wmc7Cb2W3jQsuJB80I9M1D0sCW
	9Zwy/vUAI0hHAWQf2WVBb9d8wBk/cLDJ+c38AijUeQPXRRS+L95sJ1/ryb7XFnr/NFU0kQVes7B
	l1OUs1gvrhKUYKWFyGXF9hPKcR3cRRsY+ysHUCQRsM/raM1eQwZ6tJ2KerX9IEZ3iOCdNJFQR3x
	CdgV+NEKute5tZH/9eE3CbTmlYoFDPABGGZGWKEyOlC7nrHiBzgzGEE8YC2ruyOW+yg8OONbeKN
	lwqKfM+GdncWCYVxjp7q7iV7Q==
X-Received: by 2002:a05:7301:fa0d:b0:2c1:6676:5ebd with SMTP id 5a478bee46e88-2c930e6b1fbmr3100327eec.10.1775093158301;
        Wed, 01 Apr 2026 18:25:58 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:9:862b:f392:67fb:ffb1? ([2a00:79e0:2e7c:9:862b:f392:67fb:ffb1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cf1271asm1676362eec.26.2026.04.01.18.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 18:25:57 -0700 (PDT)
Message-ID: <dc670de4-2dae-4d5e-bf15-ac52c5a0868a@google.com>
Date: Wed, 1 Apr 2026 18:25:55 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/6] power: supply: max77759: add charger driver
To: Sebastian Reichel <sre@kernel.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jagan Sridharan <badhri@google.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20260331-max77759-charger-v10-0-76f59233c369@google.com>
 <20260331-max77759-charger-v10-5-76f59233c369@google.com>
 <ac2jYUA2F5oQsA2g@venus>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <ac2jYUA2F5oQsA2g@venus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Sebastian,

Thanks for the review!

On 4/1/26 4:17 PM, Sebastian Reichel wrote:
> Hi,
>
> On Tue, Mar 31, 2026 at 11:22:20PM +0000, Amit Sunil Dhamne via B4 Relay wrote:
>> +/* Charge Termination Voltage Limits (in mV) */
>> +static const struct linear_range chg_cv_prm_ranges[] = {
>> +	LINEAR_RANGE(3800, 0x38, 0x39, 100),
>> +	LINEAR_RANGE(4000, 0x0, 0x32, 10),
>> +};
> Let me quote from include/linux/power_supply.h:
>
>  * All voltages, currents, charges, energies, time and temperatures in uV,
>  * µA, µAh, µWh, seconds and tenths of degree Celsius unless otherwise
>  * stated. It's driver's job to convert its raw values to units in which
>  * this class operates.
>
> What makes you think that CONSTANT_CHARGE_VOLTAGE_MAX is
> special?
>
> [...]

It was an oversight, I will fix it.


>
>> +static int max77759_charger_get_property(struct power_supply *psy,
>> +					 enum power_supply_property psp,
>> +					 union power_supply_propval *pval)
>> +{
>> +	struct max77759_charger *chg = power_supply_get_drvdata(psy);
>> +	int ret;
>> +
>> +	switch (psp) {
>> +	case POWER_SUPPLY_PROP_ONLINE:
>> +		ret = get_online(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_PRESENT:
>> +		ret = charger_input_valid(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_STATUS:
>> +		ret = get_status(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_CHARGE_TYPE:
>> +		ret = get_charge_type(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_HEALTH:
>> +		ret = get_health(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT_MAX:
>> +		ret = get_fast_charge_current(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE_MAX:
>> +		ret = get_float_voltage(chg);
>> +		break;
>> +	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
>> +		ret = get_input_current_limit(chg);
>> +		break;
>> +	default:
>> +		ret = -EINVAL;
>> +	}
>> +
>> +	pval->intval = ret;
>> +	return ret < 0 ? ret : 0;
> As people like to use existing drivers as reference this definitely
> needs a comment, that none of the properties used by this driver
> support negative values. This is not a general thing as e.g. the
> CHARGE current may be negative depending on the battery being
> charged or discharged (OTG mode).

Ah okay, thanks for letting me know. I will add a comment.


As these patches are already in flight and part of usb-next of the usb
tree, I can send the suggested improvements as a separate patch, if that
works for you and Greg.


BR,

Amit

>
> Greetings,
>
> -- Sebastian
