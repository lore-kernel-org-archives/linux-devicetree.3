Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792812082;
	b=BdwRwMxZZvfIwM5otBtxafc1UPf1iQ90xRNhnFiwYRrwquUdRopLJ78/9eD4SCNpQFQx
	 tqkY/PNUxKzcBTqgM9P3IsIF0nviFjakbmIlmUT/iDzFj+Fa7HadQO8sz+s1YIhSz7ypR
	 UWEwJDA64yyQ0OMQ7gye+7cA3V5j1SZ7ke+eapNyFzQKBzT0wg0DwaCeDwNGQzV5qBu11
	 XwxZhbFjcBRw2zxz8oUIQmGirfbwEeOeZJo9kIXAz0cyB2O9puV6pe5fkPdkE561mFAC7
	 CfGDH/GdkCoXugqtEBx6fak26/4Jp3M7xQ1v1UQiE/ZzYn+5pbJ2uIyvV2Ir4Ae8NKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792812082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=jS7Czz+wiu7WFrzrtvYg+PFvQraU5/rTwcpARPMwsP4=;
	b=G71hj8Wx5fHjD/etLT3O3Spmg3+nzms5TEamN7iYWoKp9ZgWa4F3m1laYdmZIQFeSBN5
	 m2fEEYjG6V5LINNjGXf/88ha5A0JJsI/c7viTaN+gs+I6JFAFWoI2pmMKbTWpvQFjr+eo
	 eMjwDXXKAl+AXsZwE0ef++LqpJBP28LVbALlZrblkDqWkWuDlrvjlE4rlFLk2FEIX9B5G
	 pLKcmp96jE7xu12XguCgYX2VC5bsruAtVsH5O0DmwFJ/4ZGURWq5bfXnVLzDixqEE/Rek
	 x6XwYFK8ldN0oeFN2WFUQBuNLhKc0f5VWz4YSQ4Br2I44N0nSP96lLYv2BLlmXwNnDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QFYU8gQh;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AB6606A31A
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 03:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23AB6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QFYU8gQh
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-354ba08cfd1so2569865eec.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 20:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792812081; x=1793416881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jS7Czz+wiu7WFrzrtvYg+PFvQraU5/rTwcpARPMwsP4=;
        b=QFYU8gQh0JIU/1g52xf3dEHUMnFoatncMZt//oVQLvOUORQ3+YpGk6I+NlObMEnGtG
         0wUOG9usTSJR4MqdM4LoI6Qyit2Ydh6/vnmXXKXp6TMfZlQC48aNe2TyGiEgFho1Q6dm
         lhd8pjeM9yZ0lxMZQzazMovsYJDTmyJTatJ9/g2sy/E45676EIAnohGaMbXW3ypR1qkL
         8ucgiCaXni/7EuO7B/iNmMvwElKPWr17+bCCiCYNVPeFou1cs3+oC2u4G7r2HcMXuk5p
         8l0cqwM50t+/tUVPbSa+fBP84Baa84M2VB0ehYRcarH6ZtFaTPT4DMWAwA3d39r56OqJ
         ATkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792812081; x=1793416881;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jS7Czz+wiu7WFrzrtvYg+PFvQraU5/rTwcpARPMwsP4=;
        b=Lmk+CxSQIK3f02WCGJ2o402a2dEmBrw36oTxQYoEhMPxskebMeaGHoUNoh6Npd+IKt
         EromWHhsLRmezARTj2jzE/5ZRf4/bvFZpRpgnv2ZrOXqlSXVatZJX10Cdq9Y4UjoGyGK
         mwgjz3no0RSk5Ph3JqVTSHDrGVd7XEa/MOM3g0+C8UqnPZ6/Sfowp36N8iG/rJhM1hpR
         8wZ5HMnYm6tdGtYLtfCNUUOrKarN9c4huf0R5ZaLmb0SmSPv3xP+sAn+C0Z3ZrkTTZ2x
         PvNtUyC4qAsT82ixDkzFCEw/1gJP+F+NzdU9IBtfHaTQY208kRqBkarb6vuizFmZlLqr
         roIg==
X-Forwarded-Encrypted: i=1; AKwUvBz2vavSwcbgf2rKUE/K6Orct6kL7aTzwbOIwB14Ush9sR9Z4uaS6rZOSHF/458gQqPuDUB+VQcX/EWF@vger.kernel.org
X-Gm-Message-State: AFq9FYLov0z6Xa+iEdo9z6s6m47JmfwTn6G4C8DdIrip+wxm21qf7lmQ
	wvzREiwCTZ6I9asNUsb9EM3NB/UxdKk7F2N5Cbm8jHr+02Ah6NxR/zhw
X-Gm-Gg: AYBFou11ThJMzdxgPWGkfFMSVArL0yys7AdUQCHDGApwm9uIYxAfDeNTn307wn9+2IQ
	hBtWECgw298O4LMfiF3llOTHHN3TaCOyke5z0FPfxDjI4CdWK/VgioiQOLHb0UUHXCUxgXcMzpw
	V6dUL0i3pSHCRVMcqil4//b3J2fwdz27f7k/4bk95lOSKsI6NESHtytz2lVm2PHO1wB8s/R2CHk
	FwgHTVyk8hSZUCz9jaVrUD7JwvdWX1V8mDN4i+6WvZ6vCy1vFwL0qcGTFLUa52eytO8cNrBlJdp
	A7mPxjar/o5+kWdz3QHOsnEh9pPb8wej0RNttPswXU11u7B2K4T9PA4M2r2Fpy5PFdippHOWfPR
	9MNipOnIfd34JlQRP3Pca/JWUT1AOy7IDrEA1L5yBMTy65wFM0ymXkN/rUGK42UkeVm9HKPB5mF
	zctoTb/hGzT+H5q5wD6zxg+hrgFPpFBa953qq4xObayq3Zamgc9xlYbL6TH/lGptOzwNdbiJgA1
	CuJcbdSofqo78n1iQZ3aI+IYq3ncGL/k3H1oVHy4aaNIMFl5asAGEtD8JuUXg7VsrAmjOiwiatf
	l+QuFYzyo0f/Wd+R7hves0mNOdM/a5kR
X-Received: by 2002:a05:701b:42cc:10b0:14d:3c0c:79e9 with SMTP id a92af1059eb24-1993505dfd6mr1266066c88.11.1792812081124;
        Fri, 23 Oct 2026 20:21:21 -0700 (PDT)
Received: from ?IPV6:2600:8802:b00:1f81:ed84:76da:ac36:f699? ([2600:8802:b00:1f81:ed84:76da:ac36:f699])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm3107744c88.11.2026.10.23.20.21.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 20:21:20 -0700 (PDT)
Message-ID: <fc0dd1a5-70ed-4c4d-84e0-94080dd5cc38@gmail.com>
Date: Fri, 23 Oct 2026 20:21:19 -0700
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
Subject: Re: [PATCH 0/5] MTX-1 watchdog driver removal
To: Guenter Roeck <linux@roeck-us.net>, linux-mips@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Eric Biggers <ebiggers@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mingyu Wang <25181214217@stu.xidian.edu.cn>,
 Robert Marko <robert.marko@sartura.hr>,
 "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 manuel.lauss@gmail.com
References: <20261016221617.2223004-1-f.fainelli@gmail.com>
 <85d47f47-1432-48fe-b83b-4d53381c5461@roeck-us.net>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <85d47f47-1432-48fe-b83b-4d53381c5461@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/19/2026 6:00 PM, Guenter Roeck wrote:
> On 10/16/26 15:16, Florian Fainelli wrote:
>> This patch series removes the bespoke mtx-1_wdt driver and migrates it
>> to the generic gpio_wdt driver which it should have done ever since
>> gpio_wdt existed.
>>
>> Assuming the patches are satisfactory, I suppose it would be easier to
>> merge those via the watchdog tree than the MIPS tree?
>>
>  From my perspective, patches are ok, and I'd be happy to apply
> them through the watchdog tree. However, I would need an Ack
> from a MIPS maintainer to do that.

Thanks! Thomas gave you his Acked-by on patch 4.
-- 
Florian

