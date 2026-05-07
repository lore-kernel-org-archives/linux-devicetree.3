Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4B52288CB;
	Thu,  7 May 2026 16:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169653; cv=none; b=omcFyFlrk/hRkrvF0vURexM3sBzl5KK+JaG5jwGRMBQNxoa+JeQdXVQa0ysFIC1uPP8UP9z/XmdyHyY9EMrfsR9ByiVyz1UUowbh6nnGNMenaDFVT1PNY/Dkox9hiFrjExwRESxYosoos0lvG7dOFAl0AtK2B4Sd5BVlh6KqZqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169653; c=relaxed/simple;
	bh=8BPtm1ERjnpYkkfFpMlDgHXX0eJd4mOVQdjMNGpCaCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LbckluPwjf52/X9DsT5icTx+ASgqy+z0G3HZqqOaRGUiURi6I86p+NlZU8eE5btMVJPPYjU5a7kInMYwQ0rZCesfJspE9RJfnu6rtPnK7flhn+YvNbo5DMpcz2DE7qmmml7FLsrBFyWKl2N0iCo1FYy/kNGrdkW1U8A5P1a48Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QL791rkA; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QL791rkA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778169652; x=1809705652;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8BPtm1ERjnpYkkfFpMlDgHXX0eJd4mOVQdjMNGpCaCY=;
  b=QL791rkAlX0kOn7IdWIADhDGDoEuDjueLFJm2Tm9k/3m02oN5pVEpw0b
   v+/KfdpWTdj4ARH+C2+ge1+U9q8u3GYu4XFR/RG0YuoF2UWKb7t2I/JUo
   iLXszx8+AXobqh5X62UBkcEjWqOOgdnw0r5ALl8h2pAHE7whFiL4DGnPr
   F63635pomHftaT3iGYb+H+qJp0J2QfH8e23950do88SbEgfXB07IgEnuQ
   0VR4CJJD34aAJdR6lgQXTJRw4rtWU894+jz137CqVYhxrSoGljBvIlDt/
   9fowZgeDjh3+XYI+DcFU2AezHll3lBHyQ74dtOVI6k+vaeG1RohFWwZFh
   g==;
X-CSE-ConnectionGUID: iIOuHHEBQiambNN+A2aRPQ==
X-CSE-MsgGUID: Z071+A7kRLWKh9suCyiIyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="90502279"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="90502279"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 09:00:50 -0700
X-CSE-ConnectionGUID: W8JdCnF+Q1ynh0P7UD8UIg==
X-CSE-MsgGUID: mY5sbussT2WvLYe2eD1VnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="266870993"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 09:00:50 -0700
Received: from [10.246.17.81] (unknown [10.246.17.81])
	by linux.intel.com (Postfix) with ESMTP id 9DE2F20B5713;
	Thu,  7 May 2026 09:00:46 -0700 (PDT)
Message-ID: <b1d56feb-9847-41b1-8bba-733963055cae@linux.intel.com>
Date: Thu, 7 May 2026 18:00:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] soc: aspeed: Add AST2600 eSPI controller support
To: YH Chung <yh_chung@aspeedtech.com>, Arnd Bergmann <arnd@arndb.de>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Philipp Zabel
 <p.zabel@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "maciej.lawniczak@intel.com" <maciej.lawniczak@intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
 <20260313-energy-casket-ca8adc1f1fd1@spud>
 <23909400-4e7f-49c9-a982-14036372af98@app.fastmail.com>
 <c3b28ee92fa46700887d0c68b23045b2418358a7.camel@codeconstruct.com.au>
 <KL1PR0601MB4276ED93723F0B1F42349AD89041A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
 <0f7f0f96-a918-47d5-a0bd-bbde494c8fed@app.fastmail.com>
 <KL1PR0601MB4276B5BE3B96C18E3A66AD709049A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
 <14870d17-2471-4522-b8b5-03cb9002a4f7@app.fastmail.com>
 <KL1PR0601MB42763DAD359305DEBA4B769D9057A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
 <KL1PR0601MB427603A6A5768D6A537CAFCB905AA@KL1PR0601MB4276.apcprd06.prod.outlook.com>
Content-Language: en-US
From: "Shulzhenko, Oleksandr" <oleksandr.shulzhenko@linux.intel.com>
In-Reply-To: <KL1PR0601MB427603A6A5768D6A537CAFCB905AA@KL1PR0601MB4276.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/7/2026 11:36 AM, YH Chung wrote:
> Hi Arnd,
>
> Thanks for the comments and questions.
>
>> These all seem to be viable options, but I still think we should focus on
>> agreeing on a design for the low-level hardware interface and whether this
>> can or should be abstracted between SoC vendor specific drivers before
>> trying to solve the user interface side.
>   
> Could you share your thoughts on whether it would make sense to accept our
> eSPI driver as is, and whether it should live under the SoC vendor-specific
> directories? Any comment would be greatly appreciated.
>
> Thanks,
> YunHsuan

Hi YunHsuan,

Let me add my 5 cents on this matter.

Integrating this driver into the SPI subsystem may allow reusing some 
existing definitions, e.g.|spi_controller|,|spi_message|, and perhaps 
parts related to single/dual/quad I/O handling. At the same time, parts 
such as the Flash channel (included in the current series), and OOB / 
Virtual Wire support (I would expect to come later), appear to be 
specific to the Intel eSPI protocol. Modeling all of that as just 
another SPI IP driver may introduce some awkward layering and overhead.

Also, the current series already seems to separate common eSPI logic 
from AST2600-specific pieces, assuming that 2700 driver is also coming 
at some point.

This makes me wonder whether a dedicated eSPI layer/subsystem could be a 
better fit — either under the SPI or as something separate (but not SoC 
driver).

Given my limited experience with SPI/eSPI, could you help clarify a few 
points for me (and probably others as well)?

  * How much of the SPI subsystem can be reused for this implementation,
    both for the current patchset and for likely future extensions?
  * Are there any pitfalls or abstraction mismatches in trying to reuse
    the SPI core here?

I think this would help make the subsystem placement discussion much 
clearer.


