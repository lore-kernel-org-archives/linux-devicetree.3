Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446765;
	b=MvCjCpJNoXMtYwH9qIX1hoIbxhIYShTTrgUPQM3TUE9cf4oaKYArw+7TrvexoUMfseAJ
	 ya1XCWkDygQiKB7OIqCk14gD232+PS8hUOzh/MabGGmjRfeqgzODhdtb73LbLPYccSmVf
	 xOQC9QSbVRhJWvmKJNDQ2RbS7L9aGnQjrJtY61NW2LSBR3wQFNWxpnn+atDWWGYWTRGxP
	 m7ObIvpLQ1HHrphZXapSNM2EtxrpM0+8X5nfqCjE+jPki4meoWMMTo42dqT2TYPDYpV1I
	 wjupeHyMdA7rf0giYm87Q56AfjPAXcYxza1/9vtc/mM53SOJ+dhD6Lj7R2/Vhg2jO1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=m+Hm8h27H+tMrn8DnDQGWdsE10AXH5b7GXOSSBSzWEk=;
	b=Ey7GZeRuo7U1KnEhNhpEkh64bVGi1+J3D7w+W6Ye4Qi5uqoZjI1fMbEWcXqB9JIRUYvK
	 074/kU5H6Vr7NepbwIeHTlqTjiZuJN+19UEHpPSZecX4eyM9iAn+Jr7LOlSQ9UvNWAZ5I
	 TCYshZLkuTq9T29otP2k9PQbACJ+MuY7CGEY0lm+/dhOU4QLYlaCDBuQYXTndKZ4DArBX
	 s9x/7SyRtZCQUxBlX2xZJ5NYHUX8UkbFgJL1NZPQuIYEEDfiuBBAO7iBValITpYWPCQBe
	 exLGRumJqsW2zvkF5hpEXuFI9d3Fwp3d0ah8S8uNxISp8d7QrFP9F5ngv1EKv0Fe/IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZsYPY1kc;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5BB606A32E
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 01:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A5BB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZsYPY1kc
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1931ff67a29so6665747c88.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 17:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446764; x=1795051564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m+Hm8h27H+tMrn8DnDQGWdsE10AXH5b7GXOSSBSzWEk=;
        b=ZsYPY1kcOQ1ZkbpwRFCLeOhKMk+CXgiVRlqpcHA2KRBb/wtWm/38P5ptumhbwtMSMs
         4Gjx5DC55qOIiy9xR8C5F2UUSvW1hdJ46sqxWm476o9UBQbatqeXDYrDStIwCCQf9gTs
         1Y0V+4AepBSMO5tvFvdmYXeomHELECh7nIsRzOM1ukxztuJBZWrh+f0DrI/kX+SzGMoA
         42YkjlF71Om+oH1VlmZHRDR/0y35e3VXs9UL6FvlfOhweg6D0LxU2MTirGODKqbeDuLx
         RajSdUIwg1iExbxEMTMSyPSPErbxU4Hg8IEeenIR/z9Ff3waNPkk/Oxjf8VEG++ZPq9T
         OGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446764; x=1795051564;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+Hm8h27H+tMrn8DnDQGWdsE10AXH5b7GXOSSBSzWEk=;
        b=JY283FPt40CfycTlauobrBsBpkr1Xs3A9Mk0MDUFkUYUtHNNgVyJmhpefGRFZpmmjG
         knRXZS0KRgRWQNcA3Mc1/MnTsHy2exVjhAHSJSZuWnbjKroAI31igzEY4kp5EqccBVzy
         Epn5F/SDTCRkhqjvsnn/ka0ga38AwM9ExQZWJmZ3gX8oVmN0S1BmMpSdLFjQWoafadjp
         4Mhi64Z3H8kin3WtFxPOvpU5m6Krmxz2Fh+s+xx3v7poKEMVK7HC5FKYBVBvl1ey6Rv0
         Wnc53F2oasGIXCabF4F0szGvqLuaeqC7F8vYMsxL5a+ib0/GDSZTdAiewvuQc5ejA2ix
         Gv6w==
X-Forwarded-Encrypted: i=1; AL+hErGlQt+K2FqOU2Jhbwjm8hCQYQixPS4OqvBxz2yPKNL9v9Ur9vO/6Qu9ACd6qfahw9btIEhhGGC6Sh5N@vger.kernel.org
X-Gm-Message-State: APuU4Z8TM6PVaVDC2O66Pm9ICTR/eS2QVjUCx53tQIPJq58bV9PvJXXl
	8BB2FTWCXvYobTPkA0VebOZutqD7moYKz7miwCZgNpEQOTSY3Zx9XTjH
X-Gm-Gg: AYBFou2HBk/iLm8Mdy+f7DceLl3atlSHezcbKp7nrvMI5iOFm+j0PeX7RtBDJ+MeiSD
	wTBeM6TIt+NBQvpRCY6zTLRnD/A7C+2Jvk1G/0ZhzeQBCy8H638RA54jcqi6TqpWPOJJ+txNruH
	UPY0KVe5ir93lX7NfEDo61jJsq8Jwr5DePASlQGhx9/1o65D5z3dv5UkVU9NqSskoGvIKuy69AV
	O1IQVa+AY1IxIi5Lpjo5oTgCG6dGa9rIR8e2Gbb8uKkb20xs72s+6L3pwUSprTOf3FeL5xD5/+s
	7jYlUGIQAGz59oxB9k2axccrQKW+LGAfNQeiQouU66l16Z2n2qEqJDVI8B7HQIDJQ6ZuB5uNm8F
	Hov919A5d0gTOMeTI6CBLLpAbo91OSNczbcanztlEEjXRm0ShQzfjQ9W2KDli6RwJd5RFmCqZYy
	siYz+PMnfy5Oo8BPzA+/EYxU+FoWbPn6/mi8SBRnjGzuwtClyduw8Frg0UH12Ie4vVzaQQve4PW
	JXEEklAnxVZGpllmnCzLclO2al+k1z+Ud2VokqNDmAmVehAGE/o/ZPYh4BH7YjhriiR4+KqlTrK
	CjsbKvmymGS3zHRlSnF4N8/v2ATaSk4o9FUw0rYXnUc0uBjzssjZOWBK96KLzm1+JDnYgElLj75
	f2+hn
X-Received: by 2002:a05:701b:21c3:b0:1a5:9abb:fdd7 with SMTP id a92af1059eb24-1b3c02fdb4fmr3591375c88.9.1794446764133;
        Wed, 11 Nov 2026 17:26:04 -0800 (PST)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm20110159c88.2.2026.11.11.17.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 17:26:03 -0800 (PST)
Message-ID: <c52e7b57-9d40-456c-a2f6-545c0bca9b46@gmail.com>
Date: Thu, 12 Nov 2026 09:26:00 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Victor Chernyakin <chernyakin.victor.j@outlook.com>
Cc: andy@kernel.org, conor+dt@kernel.org, cwweng@nuvoton.com,
 devicetree@vger.kernel.org, dlechner@baylibre.com, jic23@kernel.org,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, nuno.sa@analog.com,
 robh@kernel.org
References: <20261104091136.151269-3-cwweng.linux@gmail.com>
 <SN1PR12MB2528F7F6F04801AB698A5A60A5712@SN1PR12MB2528.namprd12.prod.outlook.com>
 <avR2DaxSJJwpnWP9@ashevche-desk.local>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <avR2DaxSJJwpnWP9@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Andy Shevchenko 於 2026/11/11 下午 10:05 寫道:
> On Tue, Nov 10, 2026 at 08:08:03PM -0600, Victor Chernyakin wrote:
> 
> ...
> 
>>> +	if (!num_channels)
>>> +		return dev_err_probe(dev, -ENOENT, "no ADC channels configured\n");
>>> +
>>> +	if (num_channels > MA35D1_EADC_MAX_EXT_CHANNELS)
>>> +		return dev_err_probe(dev, -ENOSPC, "too many ADC channels\n");
>>> +
>>> +	channels = devm_kcalloc(dev, size_add(num_channels, 1),
>>> +				sizeof(*channels), GFP_KERNEL);
>>
>> Couldn't size_add() just be regular +?
>> (Question to Andy who originally suggested it)
>> We've just checked that num_channels is small and won't overflow.
> 
> While that's true, the other aspect(s) of this is in play. Namely we want to
> have the same pattern over the kernel that makes code robust (tomorrow some
> cases can be modified unnoticed with opening such an issue again) along with
> the potential of finding those patterns and update in case of mass-updates
> of low-level API, and I have heard for the matter of fact that devm_*alloc*()
> are in the plans to move to something like k*alloc_obj*() or k*alloc_flex().
> 

Thanks Victor and Andy for the discussion.

I'll keep size_add() for consistency and future-proofing, as Andy suggested.

Thanks,
Chi-Wen

