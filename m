Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201086;
	b=NmNTDhJIH0/RhH/uD/TzEIw3sAS0y0St0bqRhJc64uLvROgqzSeaHxFKDuSPM3ruKPsY
	 9Fn9J7vDPJCVNwGJFC5wXzSrZ59xHyvePcNcMHBsPLAXtZYdQWzBz/YePi/HHVhxB8TT+
	 cgnMWUBC+G2gwPV2cycMB5VDsjJIB5V3qhE/PkUxqfuJrsVS2MmUilq8DblpncAQrJDgq
	 e22T4lrMH0Q2fshd88ca9yRUHxIKznstOHKiWPevTZqbkfRvaBURmO7ube6ntamujSc8H
	 G6iJWFLSWdCUOjIy9jkkx9edypuINU6QxebXLU5N3ZgBYnQ1WlDQXQtb+bfQHruDqnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=H4FGooqlFWyqGkh+aQ/av1H1BBYV40gcH/hlMVUd0co=;
	b=2olP9NEbGDRhQ11vUq6ElxIpb9BvxhWaccUuGTMeKddM5ansDesB9HF4UcaBwtnAqaeT
	 kS16mD9RcXDi9ScWIvJEZikDvBlnNHMxZKVG0BSWqYzsQ+RAf26Q8AqkBJikFWcbc8e8U
	 09244teBKpECjFk9bsrOJ7rOlU917MnewLjUZ9QNlrNcvkX5E0AtiTIKcfWWV0QlFqV7R
	 1CEcOQTMYamto5XANnpDtmrzmU5M8Qtu7P7DYBnUJltXYp9zvRiyjIvz2498ebP/tdNmU
	 O2enMU/u0EMTQ3Ff5BaF1VzRYXo/0NNKfi1ghWJt3Anfe81hzbRUTFwCl6ZIeI34oZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=9elements.com;
	spf=pass smtp.mailfrom=9elements.com;
	dkim=pass header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b="I1S/K+J5";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC6660A3804
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 18:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BC6660A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=I1S/K+J5
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so15603705e9.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1795201084; x=1795805884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H4FGooqlFWyqGkh+aQ/av1H1BBYV40gcH/hlMVUd0co=;
        b=I1S/K+J5WENcmKIVe+se5Cu55JBojsi/lBc2bisqSx4Hn5tZvCqCM5eiexZXWFPHG1
         Uz0mKIipl6OORTGKhJC7AhxciFbWcgaZdBKkYxvuXVFSBBadh7XG0Cwg+vkwP+QT13zW
         bLJ7q3sr8/ifheeI/Dg3j4g8l6L0xMCnmFuXeBuPS1OsIgnouhmrouGaeJI7aotn1BUV
         BnRkij4/NyHfxVlRH+Q/OoEd8qmuD93JcBvmpdTuHnJ7zAQ5ctwffFow170EYSi6Ejav
         5vIY+R/FXsCtVzjHlCYZtJ/I8Y8BFhGQ3oxm7xdmf9dk1PJdsM9mnHaEhj9/BDmWm3eq
         lEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201084; x=1795805884;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H4FGooqlFWyqGkh+aQ/av1H1BBYV40gcH/hlMVUd0co=;
        b=y7CjUaUfLTY8NfxrE3NACVb0nJmWxUKVoaf/Vzst+v+cbkpiFKKAp6J01FIRLbdc/S
         DddTiItPaWtbesvmpmT32npTd5HXKfcSmSv4d3YbggG2Yni8ihHMiDGvdly+GR0kax+l
         bysCPIKdDkluNFt3bRIQ0IT2xuOss7CH+BSzH7EBBoQKeaOmjM7FQZYD9W745MPZhUVV
         uA4WgIP/TdpYSuQqdsV4wT5vyardHBlv3RxmhbJKaI6lyO7Xua/SC/qNHCiXQgwLNmut
         3NBIhu56F1cuf9uL/3h+6l+VamojBp4aVHzS4FvdIQa8erHlY0u9aVgvF32P4mFWeCCl
         BPDA==
X-Forwarded-Encrypted: i=1; AL+hErEN1C1cH2ZcoK8+ep6eD/LeFRqaG/Ic1Lcl/v6vmJDTuHqzNFFCxFRZrbFYnLO26d5iztmZgwXSHyGE@vger.kernel.org
X-Gm-Message-State: APuU4Z9h357j86HZua7LhcjwjJBXs5MBVYXqKOk6ZtHBL1PqDRhg1sDn
	tvPLoU00sEF+vbfXbmGroriBeRJ2GbPEQ1JIukFw1x7BvLwqbpvGvbGq+poti9U9E+M=
X-Gm-Gg: AYBFou0CBBp7oRrSdfOMtIMtHu9o+Jjreo7RyInF113ply8PuVGHlcOnkHExY0ztWj5
	O1H7nzTBPXy2Zl5bo88K9S+eqVcEpcgrIAXipmZMpHyMOUmxve4v1fhJnN71NZu8ZTQaum9CZCq
	U7aGW5OV5HeigWRImGNHQ02pybN6530Xod0yxUs5YsPw5ugX06Qijg5gJGy7EO43DHZxnQ4Fvye
	EYI8j+3fGKzf1IgSz8hPfHhw+TwiY00cfc2nZfWNEAEYtSQvBqKE7NHNq7oLu1BvHURTdNjy+xw
	zcYwegdusqILW4EZLQBFL5lsoOcr+oSaZeLTzivESFlgllVDRnzm0RtNTglAsxkdPX3JrkmMMpV
	BBZfLobApHKIHWuLmOtm65NvSg3YNsn0tVJ/n419CAFCqwzZa/yWrBw0akt4j4/U98s9w52Kgp8
	d3hLimq7g3jActNxeOUzr9d2pUwr+mSNw2yS6r4qJnyql+K21Rv4PddWbaqKCtkQCW/wSozzwoM
	cw5lyG4S2BQutiWdKGhR5ZKQn3yaYU/XPaaK8muJPcon0OOcW6WKBtOYOFlxjMP0zTHYu3z79H6
	JkhwnJ6FR2wVIV+Wla4/g6MdF3qtUazePCQWi2mrZFZe6vuW/NJCIttne0SHiOXjbyXPnn2/ZCa
	ujySODRHx3Pm8/QJFX2sFZ2RXFZ0=
X-Received: by 2002:a05:600c:3491:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4bb8880014dmr95550835e9.10.1795201083545;
        Fri, 20 Nov 2026 10:58:03 -0800 (PST)
Received: from ?IPV6:2a01:599:241:b744:2c96:9736:bec3:7db8? ([2a01:599:241:b744:2c96:9736:bec3:7db8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm97210445e9.1.2026.11.20.10.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 10:58:03 -0800 (PST)
Message-ID: <9519e889-8c78-485c-a31d-28df8b7cecc3@9elements.com>
Date: Fri, 20 Nov 2026 19:58:01 +0100
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
Subject: Re: [PATCH v2 0/2] nvmem: aspeed: Add read-only AST2600 OTP support
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, ryan_chen@aspeedtech.com,
 billy_tsai@aspeedtech.com, neal_liu@aspeedtech.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, srini@kernel.org
References: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
 <20261120174440.123487-1-prasanth.padarthi10@gmail.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <20261120174440.123487-1-prasanth.padarthi10@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 6:44 PM, Prasanth Kumar Padarthi wrote:
> Hi,
> 
> This series exposes permitted AST2600 OTP data through root-only NVMEM
> for userspace diagnostics using raw offsets. It adds the SBC NVMEM
> binding and a read-only driver adapted from ASPEED's downstream driver.
> 
> Changes since v1:
> - Add the separate binding patch and rename the driver nvmem-aspeed-otp.
> - Poll once after a 1-us delay; retain the 100-ms timeout and log failures.
> - Initialize read mode once at probe and stop commands after a timeout.
> - Use a fixed secure-prefix keepout and check the live SEC54 range on reads.
> - Simplify copying, locking, configuration and Kconfig help.
> 
> Tested on B650D4U (AST2600 A3), OpenBMC Linux 6.18.24 and upstream-based
> Linux 7.4-rc1: repeated reads, cross-pair reads and 40 reads from four
> concurrent readers passed. A 12-byte range matched the saved ASPEED-derived
> reference fingerprint. The 7.4-rc1 RAM boot used the working OpenBMC DTB
> and initramfs and also passed the final-pair comparison. ARM zImage built
> successfully.
> 
> AI assisted with driver revisions, validation tooling and patch text,
> using the downstream code, review comments and Neal's hardware guidance.
> Hardware tests were run by the submitter.
> 
> Prasanth Kumar Padarthi (2):
>    dt-bindings: arm: aspeed: sbc: Describe OTP NVMEM provider
>    nvmem: aspeed: Add read-only AST2600 OTP support
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

Again, please fix your threading... Other maintainers and reviewers 
already told you in other threads that sending a new revision must not 
be "In-reply-to" to the previous revision. See the "Explicit In-Reply-To 
headers" section of the submission documentation [1].
Consider the use of b4 [2], which can handle it more consistently.

Tan

[1] 
https://docs.kernel.org/process/submitting-patches.html#explicit-in-reply-to-headers
[2] https://b4.docs.kernel.org/en/latest/
