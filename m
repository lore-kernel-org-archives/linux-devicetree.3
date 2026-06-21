Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD19230264
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 20:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782075494; cv=none; b=MMa4yq47qbWeRxjPCo6kRgmnGrStDLlTzUW7q5cCTAwUmZBnZ3y85xxaX36COmNQCocZp/Odo+ag3JQ7RD3pN0uZnDb9EIVk70JAnapl2q2Pm7EWdqZ+HSiD9KorzCOGJOJ8PY/ld1gt/9bzXBFtWLUgdk7REbP/6zMlDOngXv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782075494; c=relaxed/simple;
	bh=0hLkJIrZY5RrCGjWVIwFSZesii7vKOHdrHwtFUUNOZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WqPLVC4QDDqy2cccRBuc3CHr/fk+rhq5oatRatqvEW6p9Ey77wfncv1OXOKVUtfZipg5/SpfK1oHMe5twOFODiQw+QHUamvgVNngMecsyoNO5gq8DU4i5ZDJMeU2551d0TjE5R6xOi4EL0JtWQn+500vMtPbIw0eHACAMmRY3zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reactivated.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reactivated.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49222b6e871so31300145e9.3
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 13:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782075492; x=1782680292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDOOwXlF8XSVB54dbj8fN/DkU+oAHCBK8LyzU2tYaXY=;
        b=BiuZsaKUV6s7o40PjqI5aemgDvC78e9CgdQ+E/O0bXZG6Aua44lKC1Oh3alHIw/W9z
         /kWDxWBkRMg2UbneCPzCQg9Znx5vN+w5r99wmFom9HfD4V1MdtKAp7POqV4M34AAbpgt
         AFDeRZu2mMXQ6E4mBV6DBmbDPGyNWT6mFzmh+x2BwXE1xM0adjTzFsLQaOcfPLlNgcID
         EjSufSDKtxIYXVfKL9sr4Yn6W3BANJtgwKgoLyJV7aMAvqSh/YkyDnhOhwf6/5YnWmlh
         ZAsyAvD2G2kehBUM+asbFkvUxOKyOFgQ5OcAAAs9vzRGwzdGaNpqAAu+YAleVZblu7VA
         +THA==
X-Forwarded-Encrypted: i=1; AFNElJ+EQat/AUxGNRJaFxRNTekvwnLnhIMtWHDIaqVHSG73ED/MBvzjXkH9n6oIRKz0yJB2rWvSF/xtupBE@vger.kernel.org
X-Gm-Message-State: AOJu0YyhBDiANllBeghMOru4QeirJOe9iCmyEejFyTpL7xNlXIinXPM/
	3Kphjl6OoX2YrxwcuDEQ9GNDXhQNOuypEyptM0K9TkQEBnCD1Y4I0ay4
X-Gm-Gg: AfdE7ck0s651937qsq3bAq15vDOBxAGib4dcrrkJd6LBec5WlgCqE9FKoUSoJWUWu3m
	jmM/ezWG1d7NDOic0Tjdvd7/zuDH2NjMloH6/AUABwffz/5/p/hetkqhqDIRoK4Ohj8+wsBz8uB
	znH20/wW5CR1EKEnMy0ZtYluV3VGVkGQLgrODHBsGlbK1mtTlLRnA3LIrzB+ZGzZSfw5CjGBTlj
	VNgOvMHoSk+KAxB2Ro1Lm5RfHbIKE1/p7sugwWZueemmxVs+uOafFJJMfZx+ecabaY/f7EGDKYO
	BdMyjXDdB+OExKrXhFtPeJz0upLI2PDmFKMnOBuRLn37wPgrMEGt8eN5HXXhBAIx8RZPBFSupDS
	FiC5Zf7y9gNp6LRVHodXj4u2AdblWx5AuUw6VJvNxogmWIcZdu7KzqCRRZCWGQJoDNStt8bqHTM
	nIaKHRzEhZQCOPHrRshmIj2WpogdFSVEezBm4p6ULC1BqMJnzs8AKxi0zBRFHSrsR9oZa7vOj+5
	s/q7w4qMfqiS/vh+4G9
X-Received: by 2002:a05:600c:5285:b0:492:463c:48b7 with SMTP id 5b1f17b1804b1-492463c5257mr142771365e9.22.1782075491802;
        Sun, 21 Jun 2026 13:58:11 -0700 (PDT)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fe7b359sm230394915e9.9.2026.06.21.13.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 13:58:11 -0700 (PDT)
Message-ID: <89a39670-c459-4467-a032-a965bc1dea6b@reactivated.net>
Date: Sun, 21 Jun 2026 21:58:09 +0100
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

On 21/06/2026 21:03, Florian Fainelli wrote:
> Daniel, do you happen to know which 2712 SoC revision you have, whether 
> this is a C0 or D0 stepping?
> 
> We have an internal bug tracker item pertaining exactly to the virtual 
> timer interrupt connection however it affected a sister chip (77122) and 
> not 2712 AFAICT, now checking with the design team whether the same 
> happened on 2712.
Thanks for looking into this! I am using Raspberry Pi 500 with D0 stepping.

Daniel

