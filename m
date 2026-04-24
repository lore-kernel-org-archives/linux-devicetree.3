Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B3733E346;
	Fri, 24 Apr 2026 17:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777050251; cv=none; b=Zxy5TuyHn1a6pOfCJRrfkxX/WZvmcSgytqyptc6z7wBqNXc2vwwGO1riV3epzoA8WW6qumOjeKPyGN56P+kPKAmvpFd2wQxcVDLcOwBbB8VrVOt80cMfWDMxEZAcx8m9gRwYlJH7rrlGXjYsQBWjGkmyi6HJ4ms4FpTxUAWbG2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777050251; c=relaxed/simple;
	bh=H5tHFyISA/0brrNnyaE2kzW6wQFAU93vXx+COSGJ2Qw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BlXrC10sgdB7bMtxxcQai/ak8nmxEjRMeTpoGTtZ/w5TOT13k2ZS332wIGJlo8mUuiQ0oJprMW+zHgnNpIJ7WbRqC9JOrTPMxDKuJKBc/7vZr8s4eM0VjfPBMUB/3k5DHHtay7bjLw4I6WwSQhOJG8ej+jaKHShtoAVHfrqmzEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XiAHcg/N; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XiAHcg/N"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABD1D1A96;
	Fri, 24 Apr 2026 19:02:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777050147;
	bh=H5tHFyISA/0brrNnyaE2kzW6wQFAU93vXx+COSGJ2Qw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XiAHcg/NYff3donuXTxSvj6CvLhyxI2BBomH4dXRaejocQyrdW7dv7FtdpgHaZF2n
	 nET9x2w9HxMtb50x46PRDFf8rgWRFM+gEK8h7iTqsLD/ZXzE3fKbHbemOoeXal04c1
	 sLLz4bAF2drrLzX/PlU3F2Yc8iDiFqYHpilDPpRE=
Message-ID: <cb19eafe-6c25-4a2a-bd31-9fb280837623@ideasonboard.com>
Date: Fri, 24 Apr 2026 20:04:03 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/15] arm64: dts: ti: beagley-ai: Enable HDMI display and
 audio
To: Robert Nelson <robertcnelson@gmail.com>
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
 linux-arm-kernel@lists.infradead.org, Andrew Davis <afd@ti.com>
References: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
 <20260420-beagley-ai-display-v1-15-f628543dfd14@ideasonboard.com>
 <CAOCHtYjJgqomKreDxLUiVbUtpeh36f0bL-jA6P-6rsoJrweshQ@mail.gmail.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <CAOCHtYjJgqomKreDxLUiVbUtpeh36f0bL-jA6P-6rsoJrweshQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 24/04/2026 19:16, Robert Nelson wrote:
> On Mon, Apr 20, 2026 at 8:04 AM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>>
>> From: Andrew Davis <afd@ti.com>
>>
>> Enable HDMI support for BeagleY-AI platform. The display controller used is
>> TIDSS and the HDMI bridge used is IT66122.
>>
>> Based on DT by: Robert Nelson <robertcnelson@gmail.com>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>> [tomi.valkeinen: cosmetic fixes]
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> Tested-by: Robert Nelson <robertcnelson@gmail.com>
> 
> Thank you for getting the display back end working on j722s family!
What displays did you test? I don't have OLDI panel...

  Tomi

