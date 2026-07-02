Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FEB3603C9
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 04:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782968153; cv=none; b=FNOsABG31aSWG+rFNwuoTbVkxnS1zKTY5nxeP5CbeXOMmRdav95HiHOYIrpVrlTOpt7eQH8PL7YTmR9kIww2z33ZnwFK6O+HkvDqepkbOzb7jNgqwJ8fz0+EJfwAf+mhZCeXXFistRDrS93HBQ+HA+PQTXBpcnI7+Vqy8j4kBgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782968153; c=relaxed/simple;
	bh=GSS4EZh7oBQIXtndY45bpUY9Co6B5hnpvR7DwawWloc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XcrTAK1n3n1E+4Y7jmemIOquTo0iPZFqyewGzz9gKT5T290YnldvlWDIr5EqNoJOrE9IEmKfygb6dVFl0p6TAcYyvAsVZQJBHrTBtsoRwbVHHdmQqeRzgxnmxuz/7vrvxYKcJ9l/q12qsXQ85LMPtCNSfllxOixlj5FC4m9f6/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=srgtvfhF; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="srgtvfhF"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb36ed873so1092257e87.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 21:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782968150; x=1783572950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mMGAtiVG2tLVc2K86tjnvaWkLMJ+BxBeHK0dLBsStdY=;
        b=srgtvfhFk392LBY/6lVHEi2vmEXVgmIWyyUnQ/EFsiDv8xWaThAuywIYyhMplm5LVx
         CHWityjtWP9UhcEcM1B5laazeZBU2Lp9gFAGAKtDd5szXMniofUVWypUHz8vbHhgNF3k
         0kQ0MLMTUGqeD5G8JOws2OIK9upTJQOT/lWX9BqqYRzteKwjR1fCFfYAejA13JFdsnEy
         /jDb7q/mnxu8ACzGqPQKFY0QE6NFGbZc3AHRcJO2nViXJQ/q6vhXKGft3Y5YnneODMhH
         bB3AHdjUBo5zVWJxYA1U/HWW1H+jOCW4fqscw1fwHKxFnnlGX365zbc+Yuw9+NeN+j9l
         tCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782968150; x=1783572950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMGAtiVG2tLVc2K86tjnvaWkLMJ+BxBeHK0dLBsStdY=;
        b=fDdHYu0sUFX/tePuXM2rMf9t89ly7VS0d/GIyLtunXlLS5LnMev0eNUet15ngT6eEU
         tecHgHOk8t4HKC2LQY4vAigufvB5McZD4FtEnPiyX2mwA/ccktUEHg/DWt14cCjwqwBA
         dTLe5ptm/c35EkvkuWym7yR+wQ/qqVjJmwifU94pB7d2XBf39DQDyMIW8UO2VOE0fnto
         ClzEBVOnJJj23l2zQ7BNDwqhMZ48r045hI5QCqTGeL5CUMWzzUVj8YngMl1DU3V4LqLm
         m70Nzt7SPovl3xII5x3z7XwAuy4+cmIkAYHqu56w3qNedEHNoubc3DXSWPkqvAq3iCpf
         9zZg==
X-Forwarded-Encrypted: i=1; AHgh+RoAd6QJQ+6fIl5CS8IG/yfeITNm/z35hjrwSwvpEnnv/tAYrsGZxAg31IAJ+PmE1Ig3ifczxp1qZJoG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6+jlaan3XVd9z8u1aQ8+iWEHu2HFGhlnQ+lcqxBG1ooaDDgpv
	3FWVFMWnZdw5XHzDQ3m5Kb+Vzwb7zXEZM+n4eiXczZe2n5ylCL98Wr8TJ1+vQcTb
X-Gm-Gg: AfdE7cnFUkSHOa5Lime7yIxyOO4ZJz33TVFcUDse3lj4ik2XaeGJUOFi2is6siNfemJ
	wM3DqypZ8pxwG8DUGHM2iMXSuIGNRQ+CE1MMbJ8885NDji2HoO9gHH5YS0zsWeMaeqq83c/K8VA
	Mt1IizsvJV0PBBbAAzjV5+1gjkyapO4Dk/6j/PH2CTdRrXcxLUaJrApkaG3EXvRseG4V0lQSR8f
	90gV7/rYA+2BJNBlib6lrCO0PC2xB0+KP/R9GuimCNVWTKFNzfOBsIKFvn8XO0FSbWvut/howUF
	fMjtarGgWwWQjg8uWHZcJ3T5CF+rWmjjuRfbIQdCbK6z7O/G0TMAsar1M0ui2rnL5DTKTkyZpOs
	YMq+wneDowQj6Eoa43rXojYWTyVowdjoRf66eLmGwub592r9tXkT4ao9l1kPy7m2XcJFsxemDiJ
	F5wKLS2lPWx+kCd+yUGibfoTFL8csOMKC2A3U/IvGfMJfIiWvXWkzOJt32eRcazMZYusB5uQ==
X-Received: by 2002:a05:6512:4502:b0:5ae:b489:95c0 with SMTP id 2adb3069b0e04-5aec8026071mr740640e87.16.1782968150042;
        Wed, 01 Jul 2026 21:55:50 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec899a3a8sm430135e87.31.2026.07.01.21.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 21:55:49 -0700 (PDT)
Message-ID: <96afdec2-db03-46ba-96ac-f52b13a92d5d@gmail.com>
Date: Thu, 2 Jul 2026 07:55:48 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] regulator: bd71828: Support ROHM BD73800
To: Mark Brown <broonie@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1782909323.git.mazziesaccount@gmail.com>
 <1d00359236272fd1fab0dfbcb9119d2f91aa0d23.1782909323.git.mazziesaccount@gmail.com>
 <bf744d4f-eabe-48e7-92e4-b147b8d79d91@sirena.org.uk>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <bf744d4f-eabe-48e7-92e4-b147b8d79d91@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2026 16:01, Mark Brown wrote:
> On Wed, Jul 01, 2026 at 03:42:35PM +0300, Matti Vaittinen wrote:
>> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
>> +	nproot = of_get_child_by_name(nproot, "regulators");
>> +	if (!nproot) {
>> +		dev_err(dev, "failed to find regulators node\n");
>> +		return -ENODEV;
>> +	}
>> +	for_each_child_of_node(nproot, np) {
>> +		if (of_node_name_eq(np, LDO1_NODE_NAME))
>> +			ldo1_use_high_range = of_property_read_bool(np,
>> +							"rohm,ldo-range-high");
>> +		if (of_node_name_eq(np, LDO3_NODE_NAME))
>> +			ldo3_use_high_range = of_property_read_bool(np,
>> +							"rohm,ldo-range-high");
>> +	}
> 
> Why do we iterate over all nodes rather than doing additional
> of_get_child_by_name()s?

This series has been sitting in my "TODO" -folder for quite a while - so 
I am not anymore 100% sure as to why. I believe I've thought that the 
of_get_child_by_name() does (internally) iterate all the child nodes, so 
using it twice would cause code to loop through the nodes twice. So, 
looping through all child nodes in a single loop probably felt like the 
right thing to do. Furthermore, I've probably written the first version 
before I found out the cleanup.h...

But yes. I think you're right. This can be made much leaner.

>> +	if (ldo1_use_high_range) {
>> +		d[BD73800_LDO1].desc.linear_ranges = bd73800_ldo13_high_volts;
>> +		d[BD73800_LDO1].desc.n_linear_ranges =
>> +					ARRAY_SIZE(bd73800_ldo13_high_volts);
>> +	}
>> +	if (ldo3_use_high_range) {
>> +		d[BD73800_LDO3].desc.linear_ranges = bd73800_ldo13_high_volts;
>> +		d[BD73800_LDO3].desc.n_linear_ranges =
>> +					ARRAY_SIZE(bd73800_ldo13_high_volts);
>> +	}
> 
> You could just do these updates without the intermediate variables.

Yes.

Thanks for the suggestions! I will fix these for the v2, but it will 
probably be out only during August.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
