Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB822FDC5E;
	Tue, 31 Mar 2026 17:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774976715; cv=none; b=n8RAfkRmH6DNMtAY+eUCos2fX0brB1CD6aY3SsyH4RGsLCQyVu3OkbptLbKx/MBRtmA0b4WjxjJT056DNhC+aQgs725U9txOzQO9Sd4ms5+LBGCXXiBg6KWh/86ZOsri1bJCBktK3ZmSLMAaoh5++6pmHVRJzmM09i969tAbn3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774976715; c=relaxed/simple;
	bh=p91wn6iDlOyNDvq7BGjP8kMFRBLd/B/AzRO79xA2sFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WDIuilvd11LhmP9h4dnmIc+twEwg/TvMLTtWj6fNk0v0FXudbv9KlwgBbtSfV8GkmQ/PGcXxSg1Qz4pYQGQOoEk+ucjjEEYL453XeH2qMK5mZktlcur7dvlGqsJZe8cyFIdG+VZ7evsqARQUUW73KEPQ7kwalrP+0yuPKsXyHgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=JyaKvKLa; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="JyaKvKLa"
Message-ID: <33c0a723-7748-4199-9623-7ed3eed8bfa0@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1774976710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DitiYmGa03P6cnaADhTmkOMLyZ82FG+RUrubTXpBKds=;
	b=JyaKvKLaSrQo/X0LDC5H3UeOq5dGVtIM9N+kTknXCkQeKviVXKKV7WiC47YzgW0gNXJ07y
	DaYcrVV3SMmNzrP7qLLf04c0mCgfJniCuZbr+glIfhY5z5+lMAyN9F9WpJsdrRU6qXNYhF
	f37ooU3CiV3Us73Ed/4sAWq4GFTj+jPA8KH0I7QoQiwV91H5og1tr2Zq/NLNUUO0bxRsJZ
	Amvx6qEHYQIBIrXmKmoIhczCMPvb6gi9PLx08IojR/iqF3YgYGXdT90WnSpTjDMJxsV0YM
	J2q6+thH480h4+P+Sjy6PCdV5Mcb8YGqFxoHeLsZX6/+JAjleFHwYggEjbYPdg==
Date: Tue, 31 Mar 2026 14:04:56 -0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-dell-xps13-9345: enable
 onboard accelerometers
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: laurentiu.tudor1@dell.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260331-dell-xps-9345-accel-v2-1-7dacbd24b43d@vinarskis.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260331-dell-xps-9345-accel-v2-1-7dacbd24b43d@vinarskis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 3/31/26 10:36 AM, Aleksandrs Vinarskis wrote:
> Particular laptop comes with two sets of sensors:
> 1. Motherboard: accelerometer
> 2. Display/Camera module: accelerometer, ambient ligth (and more)
>     sensor
>
> Both i2c busses are bound to Snapdragon Sensor Core (SSC) and are
> typically controlled by (A)DSP thus allowing for great power
> efficiency. This however requires DSP libraries matching ADSP firmware,
> sensors descriptions (must be extracted from Windows) and other
> potentially closed-source libraries. Opensource tooling includes
> `libssc` and `hexagonrpcd`, but they were not verified to be working.
>
> Until SSC support for X1E lands, bitbang both i2c busses to enable
> accelerometer functionality. In the future if/when sensors on this
> platform can be used from DSP directly, this commit can be reverted.
>
> [..]

WDYM by "support lands"? It's a userspace setup thing, nothing new 
should be required in the kernel.

It is amazing that this bitbanging works here, I don't think it was 
expected to ever work on anything newer than msm89x7 o.0

But this is likely inefficient… and "stealing" GPIOs from ADSP like this 
sounds rather scary. And would definitely break SSC initialization for 
anyone wanting to bring up hexagonrpcd/iio-sensor-proxy.

~val

