Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3FB1BC08F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 21:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783374549; cv=none; b=crIhBSC+52y07QSaY/BUC+cUT/xNOv6+WmGJVFy0ZiNPiKh0Oee1MndxkOj7Ccuc8SpakQQMxO0HPzn2AXwa2/bz7N7RvhIGoH0d6iBtwvDN3jCoERNJOIHzejhI795xSw0meiWufL+gFgSCL8lVPpOydPhPHT4ATxFL/2O5mzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783374549; c=relaxed/simple;
	bh=e8p+d+6gJ4Hz0waok3kgqOeq0L6rx1q+dZn9znV2N9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sw45TORrx+ajzPF29QZVrnABzs7CC8q6o3E4hOTtO2PG2SIZ5/Z8efv9RrwZDKqJv275w/BfuMnyQDkzpJQhgMk+X9T/uV0Ng03LhKaDeY85pdcghW4GVVvZcehGvljNVOzxw2Wd/nMpVPEU/NAQBK/mfD4MwaugfozEGlgWiv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reactivated.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reactivated.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493d1e8aa46so19162355e9.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374546; x=1783979346;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=41E29IfUrYfauL1mCc1Q/S0cQ+IXf5WDP3dpcn7Vhxs=;
        b=Y6bvppUmEGhLujYQnF3KVbFnUu5noP7dFcXQqOIv0CFzmj4pe4PA8SzImSc+oYV8xg
         bUwmnySKvATH8TNj7FL9NiVmo4geuxgvbP6NxP2C/AnFv3OvyLujkiDFDWDaWSthdJE7
         l8fEBDZ7sCOIV3EUgMfkLuMOp1sNuzaZDTvx+jq6rUbT16RthFNcGLfMvUf6lrKzb+VP
         IU18GSUnqanI/NhCZlSCKfnEkmKp3kTJ3xvg709Sz2vRTszjlckUN3EMtoOPMwMTY02q
         COcnUqbGiWwyKKoznMdOzTZxfz85V8Wt019JApREabgrBTka7vqEVFvOKMxSmQ3EiDho
         7zig==
X-Forwarded-Encrypted: i=1; AHgh+RrSMg/4LRS3TjlBFW3CQjH2wdso+vETxwk4LC633Es5zzodzjUzjSxFDQKoXfMfcSsX9rvddcFQIcwe@vger.kernel.org
X-Gm-Message-State: AOJu0YyI+v2l8wktGx8PhKWbMSi2YseVty7bF0KYhpPVNMBAz/Lhu0aP
	NZ6Wly4Z8CFlIKj14e/SNbz7O2LsVqmwL/dKjhlZ0TGHKNhs0Vm5to1q
X-Gm-Gg: AfdE7cmtPXqsS9dvqjaF2fL5gSNLvSUvAbQaH6FE9cOV4/KNLix8D+Ht2rkhHEHHms7
	PGuxEPq5vdTjbqVmILmo1T3t0fbtNwChdh1fhIgoif2/Ai4RAnIkEf/JvmIKKFNusaj6HK0jjEr
	f0OWo0K3uQ158dMHxZiVokxHjIuPkm0ncyhmVV99NnbZK/cUBvsLCbG5MZp/LzPQntx7Uz4+9Pq
	Q87dhXSyVIj6oifkFITHseOtx+5jN2PtvpQmzk/voQ1RhPGTvrsM377frGBieqdLMY10tF66T+R
	5V7r0qVZu0G/9svil1+ZbkGwmsMkaqYWYPvZybMCQXvd3+O50rsRYdNv3dv8klg8gZK+1hDb2Hd
	OjoOySJCrfhndJY/ju4EE4z+lmQIX9pODoog1i/nhjowLuNdUgw35OAuYiE4VBl8H5PaRobhzCu
	ifrajjFlV6/4KB/6gMfZ2KK0s/pTmuv8aFTba/xbNIiW66/vARK5v2sQdmPtsjrdl+cqMygC79T
	2Gfks9tSuPvx6vwEO8E
X-Received: by 2002:a05:600c:3145:b0:490:e974:e006 with SMTP id 5b1f17b1804b1-493df099f12mr26072885e9.29.1783374545908;
        Mon, 06 Jul 2026 14:49:05 -0700 (PDT)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0faee30sm1797975e9.10.2026.07.06.14.49.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 14:49:05 -0700 (PDT)
Message-ID: <fc88dfa5-30e2-4e94-907c-58de0cd8447d@reactivated.net>
Date: Mon, 6 Jul 2026 22:49:03 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: Remove non-functional EL2
 virtual timer
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Marc Zyngier <maz@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com, andrea.porta@suse.com
References: <20260619204832.586079-1-dan@reactivated.net>
 <878q898ulx.wl-maz@kernel.org>
 <223cd514-41b3-45b9-8617-b54d379d5091@broadcom.com>
Content-Language: en-US
From: Daniel Drake <dan@reactivated.net>
In-Reply-To: <223cd514-41b3-45b9-8617-b54d379d5091@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Florian,

On 21/06/2026 21:03, Florian Fainelli wrote:
> We have an internal bug tracker item pertaining exactly to the virtual 
> timer interrupt connection however it affected a sister chip (77122) and 
> not 2712 AFAICT, now checking with the design team whether the same 
> happened on 2712.
Did you receive any update on this for 2712?

Thanks!
Daniel

