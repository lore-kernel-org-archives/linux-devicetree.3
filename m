Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A482B35C6BA
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 07:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786089447; cv=none; b=ovJRo75IeVeCF7vLjqD2P/iZEzR6omhuC1kx0hbYWrMAAGD6+86gqWrPaUpeW4tIb21cXYX9P0ft11JAt66Gf5L2+tUYExA6HVErAx6WHt3AkCoSwF0BKDtRTRWlwyWB+Sldp+U6KjLWpPLzHClL+wxS3Qj2AqWeqADZ+3MKXMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786089447; c=relaxed/simple;
	bh=cGL3Am/dpGjkP0UgvffaB5WNP5I0zU57WnkGcSi+68U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rQMlqe8WhpHxE9JsJ5zMrmIP6X+jUXoj4rVq02Aw66IqJ7lG4Lb2eeuWB59ItNPI/NRhv/EBT8do5HMUpzkG4NKy0qbczVvUEhjaxo+++z2CpT6FIszNnQLJYa5axtSQT4Zw7Yq06n7kV/Ma4R4A6f9yZylK2PZmh73SzqQcCAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=LslJ6cNi; arc=none smtp.client-ip=109.224.244.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="LslJ6cNi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail3; t=1786089441; x=1786348641;
	bh=zqv8zJFvmVPbjP9s76gjZ7fUWAcpJyUHyf2MwhE8bqU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=LslJ6cNiS8hzkcA8CH7dZ+gmk0YZerDJa8hic6QR6la8e6wcZBd1o4cqIFITIhYli
	 GGwM1J0335Rdy4YgJgObJ6KXIugWxFSlGCxeHvCL0U4It2VHLzDH1UIxZK1UmtGXsV
	 fzKXrqecEs2eibsKlqaDW8D8AytC5sxT2zBGR7QXRP91pGLIchnsdnRbYTIY48jTiR
	 8qb47aGrPBMHUr2WI3OcnRRFzGhX2OFBISolaLHOIvoYjQE8yFM3vcZNOI1fYaMiWp
	 b+1SZmTNP9LGzlHJSXWloxjqLwHfNz+wZbMHm36LUg6asfeaDh4peUb9aaXjgdZTw+
	 kefcNeh+QKB4A==
X-Pm-Submission-Id: 4hGc1p5FH7z1DDWf
From: Esben Haabendal <esben@geanix.com>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>,  "David Lechner"
 <dlechner@baylibre.com>,  Nuno =?utf-8?Q?S=C3=A1?= <nuno.sa@analog.com>,
  "Andy Shevchenko"
 <andy@kernel.org>,  "Rob Herring" <robh@kernel.org>,  "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,  "Conor Dooley" <conor+dt@kernel.org>,
  "Nikita Travkin" <nikita@trvn.ru>,  "Maslov Dmitry"
 <maslovdmitry@seeed.cc>,  "Kuppuswamy Sathyanarayanan"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
  <linux-iio@vger.kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 6/6] iio: light: ltr501: Fix sorting order of device
 arrays
In-Reply-To: <anT_KYZjkX2Tcnqu@ashevche-desk.local> (Andy Shevchenko's message
	of "Fri, 07 Aug 2026 00:39:53 +0300")
References: <20260804-liteon-ltr329-v3-0-c6b768c7c745@geanix.com>
	<20260804-liteon-ltr329-v3-6-c6b768c7c745@geanix.com>
	<XtotGdyhZvQIq-19qWwYJ2t9CGaZ4kcJXvUUcRmfXmC7YVRVj4wVkAttk_2tgzsuymMdFgL7wMAWYgvA8RFcuA==@protonmail.internalid>
	<anT_KYZjkX2Tcnqu@ashevche-desk.local>
Date: Fri, 07 Aug 2026 09:57:17 +0200
Message-ID: <87ecgaxt0i.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Andy Shevchenko" <andriy.shevchenko@intel.com> writes:

> On Tue, Aug 04, 2026 at 07:02:17PM +0200, Esben Haabendal wrote:
>> Using alphanumerical sort order for these should help reduce merge
>> conflicts.
>
> ...
>
>>  enum {
>> -	ltr501 = 0,
>> -	ltr559,
>> -	ltr301,
>
>> +	ltr301 = 0,
>
> Is the 0 required? Why?

As for the code produced, it should not make any difference.

I assume it was put here for improved code readability, and I did not
see any reason to change that.

I don't care about it myself, so will be happy to remove it if that is
the preferred style now.

>>  	ltr303,
>>  	ltr329,
>> +	ltr501,
>> +	ltr559,
>>  };

/Esben
