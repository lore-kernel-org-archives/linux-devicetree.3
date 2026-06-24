Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35943D9DD9
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 15:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782314843; cv=none; b=JXuf2T5WyOPrJw09AUVPOzVwFz8BFcrzkEF5t7joIEbn9ClW+gZRcFO5oVyhvHxzi5TpBnT9Z0SZtckrNCvC2XZWNURERo3t3uUU7Si7iJj0Yp4Y2WbUPysS1khpW5Rgorbh4yQeYeqVnvjYOzsKOL0mn/H8pD6xlYR489e6Jm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782314843; c=relaxed/simple;
	bh=zQlht0IsyQB1oNhNfYXgYgQbV1Y7rokfYO480Nk79qY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KLEZBsohyrzVCDzIdIpI/zSxhV8x38FaOTuytkfY52NTwybI9jGw73WDhQuUZcbMSHb4qq+ja58z8XdyN06kk7s9V1+/Bb+Lb7SNTBl7SfvnQFq2DAEtlF5pC71KFDnxF7/Z52LwioxgaNH1If3ucI+W+sBqMNghmj2dCgyb9ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TVI+Qcdp; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TVI+Qcdp"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-447efaebabeso226308fac.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 08:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782314840; x=1782919640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fjq8lD80zO6HiyYMuWH6+pjiwlUb52f+5tf0ovQAwVM=;
        b=TVI+QcdpMI3gzRx7l3JLLLB5sQGg3piLry+GcCTA5BxoD+KBsB3tPvy4HxUpIHxhqK
         wSlAcvWsHnGKXG03VwM4A5aFP9xiyo+lB2WtFA6yWUS87wNocMowf3EOtiBHwEHcBHdu
         U2Ir1u4g1w02xirvTNygo+DjlkTI3RSntD7iIes520e35AS00NKB8jtqaccxMrAm+Y8X
         gC2OQ+gVV1inlg+5U/bPqKBT9KplfjhNOzBOLXjuW16lJdctd0mBgSppV3/9rbPARJh9
         H1x4/mi5msywP21t3cglyP/VQjWp+BAVJ4ytVvH+f2VApXP1bAMRz64HIOrf5h/UAlZm
         iiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782314840; x=1782919640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fjq8lD80zO6HiyYMuWH6+pjiwlUb52f+5tf0ovQAwVM=;
        b=tCil91iJP5yNxd3YUEGxvuJ6+WPwWsZqq7u8JXYFSp2iYP2ys46rDOSMEp5+D/wQ06
         0eSxnlgCqnLHcLCDuDHWo10sqXJnLxBonpvfVexIMaymLjTZ4qXV6HM/EjfAxokzja6f
         io3GXO0DOtg8u8oNKYaN3ulTAiz3HUlTBoUSElmRvqjKzHqVmmTctIFqtZJEzR/+QDH5
         mj/ig0lh4i03AD0ejsdwrI0hl1z9bzNRBSSbaWTeYAoWwfYZy1i4k0hAGqCTwQEi86gQ
         wSwYHfHLsKhUBrJbViBc564vVJ2YtmAidbNficVvLG3SNJXGcZtHDbDwvIbQuiAaCxaO
         W0pA==
X-Forwarded-Encrypted: i=1; AFNElJ+J4dGyA1qT6gT0C6+tOAzzS+mawmyjZEpoFzlY51VyOfc+rxMtOz4t3JLCifOqFExx9ixIzsuYZLpu@vger.kernel.org
X-Gm-Message-State: AOJu0YxuknJkCHC1WTU7Rup+HPwbJoUZXCuydQnA51JmvBFxEOI2IlJF
	POIUuRpy4hSRG4mxkPDTTkugim97g1rFVn02O6H+GQmHbvL+6Tb1tRzvHZKBeijaI3w=
X-Gm-Gg: AfdE7cnyO6dj83MS8cgnWhxSinxQCrkwsuTCjCcxO9zcw6hM+AWOCDC8NSP9dAFabSr
	vNSOVcmuAQxgiptlma79567pH48WsnFfsTrjonwNrCkWuIMVfS3UoZ984GbTa7De3QwDR9rTP9b
	bNYveFxEBDWBAb60hDALT9f9wW8oe+7KSTuTB8pPQpLYsEWAAVeWA1QwhsFMV++M5jpNJeVrdFD
	XGnpnqY6P0UD08Pq2VLKyhBXNrKQKHjHFrvfcWC51BgeS0ME/Cyhn1oX7a9hHfioW0S7q3dH00/
	mJfgfGBZWCsTRMEhlriAyjpy3WAD3sh235Shwv/0FudyfNt4V6tzdxUcULPw3n9Kzp2Fr/XGmOW
	CI+YYnndf4IsCzVd+BoizWnC1Jpq7pLeIwdbluIVJjW2updOhuX1t3XEFTjVe+OGYO2lS/zvpdG
	CcuIYtvY+eMChxaE+yNRv1OvHWHuslmss9V2gwgNCRmpF1llW9PzGQhkyaCMtMmwA=
X-Received: by 2002:a05:6871:7991:b0:42c:4c8:4a5a with SMTP id 586e51a60fabf-447dce9b4a5mr2572915fac.28.1782314840687;
        Wed, 24 Jun 2026 08:27:20 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:68dc:b788:b3ac:e34e? ([2600:8803:e7e4:500:68dc:b788:b3ac:e34e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4472ec6065esm10933021fac.4.2026.06.24.08.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 08:27:20 -0700 (PDT)
Message-ID: <afebba8b-ec1e-4b91-a600-f4df0c576219@baylibre.com>
Date: Wed, 24 Jun 2026 10:27:19 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] iio: dac: dac8163: Add driver for DAC8163
To: Lukas <lukas.metz@gmx.net>, Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org
References: <20260623-dac8163-work-v1-0-5b508158faa0@gmx.net>
 <20260623-dac8163-work-v1-1-5b508158faa0@gmx.net>
 <ajrg62FtXNObGkmc@ashevche-desk.local> <ajvt5J5Cs5cOdTLt@berta-MS-7693>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <ajvt5J5Cs5cOdTLt@berta-MS-7693>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/24/26 9:47 AM, Lukas wrote:
> Thanks a lot for all the comments.
> 
> On Tue, Jun 23, 2026 at 10:39:23PM +0300, Andy Shevchenko wrote:
> 
>>> +		dev_dbg(dev, "%s: val=%d val2=%d\n", __func__, val, val2);

Trimming down the reply is good, but in this case, it would have been
helpful to leave a bit more context. I usually keep the full function
in a reply to have enough context if it isn't too long.

>>
>> No. Is it RFC? PoC? Or production-ready? If not the latter, come when it will
>> be production-ready.
>>
> 
> I will remove the debug print. I tried my best to make this driver production-ready.
> I saw that other drivers also have similar debug messages so i didnt

This one jumped out to both of us as odd because of the __func__ and the
fact that it is in a very common operation (raw write). Usually debug is
for catching odd things that happen, not normal things.

> remove it after my first tests and thought it is ok to leave it in
> there. My intention was to try to apply the suggestions and comments i
> get and send a second revision. Do you think thats the right way?

Yes, you are doing it right. For a new driver like this, it is best
to wait about a week before submitting the next revision to give ample
time for review. Your replies so far where you think a suggestion was
wrong or have asked for clarification are spot on as to what we expect
for the review process.

