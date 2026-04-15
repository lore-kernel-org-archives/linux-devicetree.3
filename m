Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6AC2BDC32
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 18:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776277322; cv=none; b=WgtnLl0SJQM4aVDU/MW5GFnPhyGkLrQeaJeqqrpyAv0u/+/BnGR7NbTyR25cWkaw+SwxdDeNQVF8KlMQ5c0t+3vESts8s3vwb1r00YcKnX7TIBGQRLwXNZbrlxToe/XU+oDjLL4mp/03KtFpOGB/5nHTnvpv7rdGKrOhruui8Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776277322; c=relaxed/simple;
	bh=H7jvNxMoyDOskGYfx3Wf2OxswmTnEl9blys24JcUhHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s5rW0pHi2YNGEJsgOELEvTQcR5rRldFRJXuQrFBb+7oG4ZLBXzCYR9XouZyfpyWbbcdfYDpkRfAx9i+t5oSI4KCORNmJP6+dLK8AdVGyOqsV2GuNo5Uv/97pHVVH3eqNaAvq8xF5ZNNHxaD7lhrgCkOpw/S1v/DlQgn8PxuTSVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WHTyKiHF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WHTyKiHF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776277321; x=1807813321;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=H7jvNxMoyDOskGYfx3Wf2OxswmTnEl9blys24JcUhHc=;
  b=WHTyKiHFn8MvY0s+dUg8jHcbKyEx/BbdZOsNqnpu8q1GfcMMezTJ8UJ5
   7AhqsokVb5vaBEdO+KtSXA41bgSvC/ymxnFDxPDj/TtIWQiHAA1JQa9Ya
   pAXnxXH5YOAAoOtf1y9gMpCZNqLHRVfO5fW/KvoE4SPLYLidjOsgdVU09
   uPrRH5TQJ3Tygbc5Jtl5AeupGIAuAW5h2UGyxFja7QplWxlZJCvnFYe3B
   gZez/9xuY0wxFjCo5DK/kSDuAVFCu/XWcbgm4vd07+PDfh/nh7q+t4hj8
   bYJijN3DAiLCighRawri28kVPd1L2A2iw3A2ZlykdALHgIupFilGbHrRP
   A==;
X-CSE-ConnectionGUID: OYMNXFZpRTijw5OqT5B25g==
X-CSE-MsgGUID: Ugcps/8ZR0CuFL4hFMV8og==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77141905"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77141905"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 11:22:00 -0700
X-CSE-ConnectionGUID: scLcZlr2RIyw2mcbKX1FTQ==
X-CSE-MsgGUID: Xa+s81DcRsK9kV8uVfWbYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="234524620"
Received: from dawidgla-mobl.ger.corp.intel.com (HELO [10.94.250.17]) ([10.94.250.17])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 11:21:57 -0700
Message-ID: <cb0d16bf-988d-403e-8a8e-c85bf2a208d0@linux.intel.com>
Date: Wed, 15 Apr 2026 20:21:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] dt-bindings: i3c: Add AST2600 I3C global registers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
 Maciej Lawniczak <maciej.lawniczak@intel.com>
References: <cover.1775679285.git.dawid.glazik@linux.intel.com>
 <7f55458097ef651b4fc46650254afd3fa7b87348.1775679285.git.dawid.glazik@linux.intel.com>
 <20260409-beneficial-sociable-tamarin-dbcaeb@quoll>
 <d74e7aa8-1110-469a-ac7e-3829c2458852@kernel.org>
Content-Language: en-US
From: Dawid Glazik <dawid.glazik@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <d74e7aa8-1110-469a-ac7e-3829c2458852@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/2026 9:30 AM, Krzysztof Kozlowski wrote:
> On 09/04/2026 09:28, Krzysztof Kozlowski wrote:
>> On Wed, Apr 08, 2026 at 10:34:35PM +0200, Dawid Glazik wrote:
>>> Introduce the device-tree bindings for I3C global registers found on
>>> AST2600 SoCs.
>>>
>>> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
>>> ---
>>> I wasn't sure if I should add newline at the end of the
>>> file or not so I took
>>> https://github.com/torvalds/linux/tree/master/Documentation/devicetree/bindings/i3c
>>> as an example.
>>
>> Answer is: you cannot have patch warnings.
>>
>> Documentation/devicetree/bindings/i3c does not have patch warning, does
>> it?
> 
> And if you tested this code with standard tools, you would see that...
> 
> Best regards,
> Krzysztof

Thank you for the review and feedback. This is my first contribution to 
Linux kernel so I'm still learning the process and toolchain. I 
apologize for the rookie mistakes. I will address all the issues you've 
pointed out and resubmit the series.

Best regards,
Dawid
