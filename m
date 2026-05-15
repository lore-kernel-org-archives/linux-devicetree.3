Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199BE388361;
	Fri, 15 May 2026 06:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778828172; cv=none; b=Ekk++8ax4tm64M9FiWQrnW02eLEZXYCG4+L2H3tOHog0xoFlk1Qua9/hWeIGjf3MI/ImzBtkzgKjGHNvToLyT4kACHYqUoffzAYSAc3xy6dK1i1oEuUTW5ictTt61QekwX6VT/G7nNiExonxrOGyx6FNlx1hKV4iVvAuEvuc7Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778828172; c=relaxed/simple;
	bh=ps3BKhTYDYIeixkp1GdVg1MTtawBVyK9KNx179yqeR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R27UWSqJVAEZpFhtb/z4l8Elv6sjWqeKdxwPArCjgg9RODv7S+ZKf/0uP+TBhZSp8z+t3yeR3JCkbv2WszrBClremzkP/B+FzH/oNV6ECdMByPx+shPKWMNJEqAkNnNWzhgRrwnD0B/nAHhywmr+C+j6UF86hWW5KxtIct8EYaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pBKDbeMF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pBKDbeMF"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1ABC663C;
	Fri, 15 May 2026 08:55:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778828159;
	bh=ps3BKhTYDYIeixkp1GdVg1MTtawBVyK9KNx179yqeR4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pBKDbeMF+GjZyp98W56ZvpE3GUil0ccBPRjHr5WJH0zvdBaXpZkbWaKL3BhtrTDKz
	 DVK7fga7NlGaPMizWa9yP0YdETGbVy+WSbtvqEQToVoDQNzXXjZ8xWFTfcfwvyR4Sg
	 bfp6MAyBqyQsxvXAMnZq45Rnp5n6sAH+zn1rllwU=
Message-ID: <3e5ce95a-10dd-4520-8bd7-7d4cfaf612d2@ideasonboard.com>
Date: Fri, 15 May 2026 09:56:04 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/16] dt-bindings: display: ti,am65x-dss: Add AM62P
 DSS
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Louis Chauvet
 <louis.chauvet@bootlin.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
 <20260513-beagley-ai-display-v2-5-9e9bcefde6bc@ideasonboard.com>
 <20260515-certain-honest-wren-f03dfa@quoll>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260515-certain-honest-wren-f03dfa@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/05/2026 09:52, Krzysztof Kozlowski wrote:
> On Wed, May 13, 2026 at 04:17:27PM +0300, Tomi Valkeinen wrote:
>> TI's AM62P, J722S and AM67A SoCs contain same implementation of the
>> display subsystem (DSS). There are two instances of the DSS (DSS0 and
>> DSS1), each with two video ports (VP) and two video planes.
>> Additionally the SoCs contain two OLDI TXes (OLDI0 and OLDI1), a MIPI
>> DSI TX and a MIPI DPI output path.
>>
>> DSS0 supports:
>> - VP0: OLDI0 in single-link mode, or OLDI0 and OLDI1 in dual-link or
>>    clone mode.
>> - VP1: DPI
>>
>> DSS1 supports:
>> - VP0: OLDI1 in single-link mode, or DPI
>> - VP1: DPI or DSI
>>
>> The DSI is only connected to VP1 of DSS1, but OLDI and DPI are shared
>> between the DSS instances. Thus only a single VP can output to DPI, and
>> a single VP can use an OLDI block. Note that in single-link
>> configuration OLDI0 can be used by DSS0, and at the same time OLDI1 can
>> be used by DSS1.
>>
>> The DSS IP itself is compatible with older SoCs. While we could use
>> "ti,am625-dss" compatible string, we add a new one "ti,am62p-dss" to be
>> on the safe side in case the driver needs to do something special for
>> the dual-DSS case in the future.
>>
>> Original patch by Swamil Jain <s-jain1@ti.com>
>>
>> Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>
>> Tested-by: Swamil Jain <s-jain1@ti.com>
> 
> Same comments.
Interesting, looks like "b4 trailers" applies quotes here. I assume the 
parenthesis makes it do that.

As for the tested-by, yes, it doesn't make sense for bindings. As the 
tested-by was for the series, "b4 trailers" applies it to all patches.

I will manually drop these in v3.

  Tomi

