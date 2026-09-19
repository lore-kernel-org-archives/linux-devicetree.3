Received: from mail-wr2-f39.google.com (mail-wr2-f39.google.com [74.125.225.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3E52494D8
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 14:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789827502; cv=none; b=c2JcuKvcpQ2JkgfG02kAsqSqC5vF597wY0J5V0e5GeTBoCt4yplKay/IGKwiF0HfjzvYuKNynyl9G1+rVhQ5GKcpM9udul+godtmoy9DhOMWgp64/DHqU3tE17eLj+2z9/vdZhuAerkENmrN1PfJEmuiEHmMBvb0puec4AGytOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789827502; c=relaxed/simple;
	bh=PpslIjtfqdnivMU4+zxZKe2uCZBrq5qLNofJ1sx/HeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VNPQW5K7hBAAlyrRcEo8lMkdlawlkpi0SNOSc+rq4HkwbvtkZw2+lErAx4AVp5xJIluaKJ8r3I+t+EUsieBApO2br1AMSAFlytPzXJD+GjBdxiqM7kSIDTn2w7JKY8ILGX3qXw8/KWB1VDUxHS8kG7fMSznpn51Mgqo7gbFcYt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=oGR+jQPf; arc=none smtp.client-ip=74.125.225.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="oGR+jQPf"
Received: by mail-wr2-f39.google.com with SMTP id ffacd0b85a97d-482f633ece3so1267123f8f.3
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 07:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789827499; x=1790432299; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3WVdtse4utFqdGo5H8fnCG1N9VsS3ll8DP5z6tgaWzw=;
        b=oGR+jQPfiTfptyCXAWBXQe9Cit7QtF8B6k3YHixtP+Pk9Z0zRWvKbPghLXi/Xg+yxQ
         OIbTKkOC9DJDl7ETC3kbR+2ZHFY5VN3wXDrQ7iUPfrVXr5Mhyg2O56nt5h/C85uL19Rh
         WQCAcDSG5pLi+NWCXKFNoewm+9p7UsAmOH1AmerEd+NIc4lNRHQe4MBIK5iJITHBzU3+
         Qj+ax8iVagCST2amDdNio1XJkCK3f9W/q6vPI3CAcBrC7ppXr/8xziCK7THezbyu1GY3
         8EcYV4BFWgCQy5R2YnzUSL0ChDxSTtKXkAxOuDtg9q6CstE9OueLX+ON8ZU746a24yKP
         lFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789827499; x=1790432299;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3WVdtse4utFqdGo5H8fnCG1N9VsS3ll8DP5z6tgaWzw=;
        b=SQ1H00M7CC5HMrSOS7krEN6nFWhYqKvGPfdBCCRN1qVJ8qmZQgGtI9I/URk0jFKZBM
         lkQY41Z0xZkNMs1q9A6qjQLq09ffUYK80qSczHH3FhRY+/5oeKBGRgmLI4uiYQL3CmU/
         v6tT+9RGDK9KTvPlFjalli9OgS5fZccKpIY70iw/JPcoDFGt/Yig/iJ2H/SDdnqJqnid
         8Af6PDBkQ8egFfDDoFkPvFO3nZrcATMVPKuoLy19b1JPbu7gRjCY+Pwafni9ck0nFY2R
         VzsP7AxHlxX/EAZuzGKv3SLRc0BCHFAiZP3R/vXtigWQr3IgtmACDeFyB0MFzsNq/rXG
         Gv+g==
X-Forwarded-Encrypted: i=1; AKwUvByfmu3BOVRUeHxIW7ywq2V3bpsHmavFbjtWoc2P8wzBjGG7jgsgJzfa0RypJhM+iixE2AWcvmzwLcqS@vger.kernel.org
X-Gm-Message-State: AFuF++mWDYq6oSCXRoVW9O/maofbctMzYHKlZFeUrVFAffcmqR47GUt9
	kXmvhtvWbrP+YCQMTWukQYJQ00zfyzVzP424UI7fa5n5Qw78hSTHwpUPLq1nC6WOFYg=
X-Gm-Gg: AYBFou2sNOo4gs8COzrRRG/MjpLUwkTgNXX0KydASy2LMEvqUgxPATCLZMzYmYHdxQ8
	WIWgCi7IcuHWVhVVWan+w671qAh3J5eW9MuxNKx+shpQY0SG69aeAywZJUv+gQqCrARBwmtml8A
	Pcp7VPcwzJuWwsPqYrAWPYd28maVjDs621ACDIwlP/sW+yl+BZ+vJHFLQuoVPGgUFXDF76P6QnJ
	kAkld8bDhyZxKDUmY0CvsJdpFP0FBWsF+hN/G0Zn/yDm3BDuQttjauSTmQZGBXQ08j8M+kw43P7
	FeErGWaBdgqDDsFJ4VoQEeExvC2l7z52FrDDH5aBX2iCEU6PrvlShlzlERF6+zE1RzFTbdHp6OJ
	iPZvSA47OHfie23GW3ZWoRwKN2OPFimS/K+NFwihj1Tt6L+Ai805qf3/wTx5XtXD8JbZt5JUOzv
	in4pKH+J41GDBCbGh2AO8ygxi56iPFh2Vy8QSVoJvHThlhiOkawZ2iHC1QX8NBuTwm08S1ACCS5
	PsNYLWCv5af0mpFHljcKRo5IunjqS5jzYxcGsTDdxoWaICdA9Ib00dB
X-Received: by 2002:a05:600c:c493:b0:49e:74b6:740f with SMTP id 5b1f17b1804b1-49fc573603amr76055195e9.17.1789827499187;
        Sat, 19 Sep 2026 07:18:19 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd090f0csm106407185e9.15.2026.09.19.07.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 07:18:18 -0700 (PDT)
Message-ID: <5d09e717-a478-4c9d-b5b1-9f309edc064d@tuxon.dev>
Date: Sat, 19 Sep 2026 17:18:15 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: microchip: ev23x71a: enable eMMC
To: Robert Marko <robert.marko@sartura.hr>, ulfh@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, adrian.hunter@intel.com,
 aubin.constans@microchip.com, ehristev@kernel.org,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
 <20260907132617.1198548-7-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260907132617.1198548-7-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/7/26 16:25, Robert Marko wrote:
> Enable the non-removable eMMC connected to SDMMC0. Configure its 8-bit bus
> for 1.8 V DDR operation.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
