Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70BB37DEBB
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 11:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779363540; cv=none; b=PN5WQ8vUKGzXY9vpw3p5lJSNlkaZM0abP3Lsqr1M/gS6KL1wezxXXWeCZ0wkG5wMi89WBDo5fvvqNsYM9iceScsVNWB/WPiuIBS4q0HlHx4E4DfnxOyURUR0IDYhLCj4sLy/Od4qOKLoqdMZNANVYmraf419Rd1UBuPwnBzVLdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779363540; c=relaxed/simple;
	bh=sOZG44HAL+XlEZxyGEXOLSiTIKnY6lJ2BOOCo6j33TU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f9LXz4yNqilPg4iih8GqLY9w4jSbrfi5Kf38Z5J49JLglJgW74ew0uV4v20fGj9AecFtPlI8OKCs043+2odavoBI9nZ0alGVOWNQOKDci+oKd33NuPJoYaB0M9H1eTS6y3dk5btOcauB2YwsXsRytyEZineyD66f1x6D67pKWOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=znzvohCm; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="znzvohCm"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4585a116a4aso5059309f8f.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 04:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779363537; x=1779968337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bf7++OSA/ehjamW69p/Uz0SzqGOGvNCrQjb/sL6WnB4=;
        b=znzvohCm3N4ZI1MXWmV8FKybjatuhdePUGGRhYza+gCfptK915/NowHYbkYYWryOya
         yippJ9W3I/2e4PcHw339/M0WBtqw79D6OdJAJRenYJ4pcMWFXDMpfzLSU/c65lQGb/cV
         ajoNo+YtUoZGLKdRjxBAM7dHLykJV8XTbcZi81/Tuoz7xsjHGYZ2v2BUN73tFtFtlcPh
         NBUsa5jgArR9leOsrGdRzPbNbjWlYCwZn7CjUCKIQ0jGvBHouNgOeqztTLZO1n5QSP/1
         2PHpKps63ZPOEBzWOkDNGhm83vXVqoKWYcR80ZnYVGOsndKTZZr39MkBWwnG/EP7GsXY
         N8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779363537; x=1779968337;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bf7++OSA/ehjamW69p/Uz0SzqGOGvNCrQjb/sL6WnB4=;
        b=YJXJcsqVxuarfRfeVtjsN6Kx9BYo2lgjgCImKIv7JeD1deCfh8WTkOmNzfadd0Vy3b
         0SlkxU350AWMKCP/T9jCPJrdMaLUicO6q1BaZXhN1AA7bcrg1hz+ZGVVnR98fX4wks6F
         li4CYgOhdPMxl/D1fyxbMovgIl/nJ63iD2pPDWMkDKppAuPtAC+QB0S9JcNcijTkc+o9
         O2T5lU7a+ayIoF2vzi8oROnKM3YYOgbwOXzSJpJq9jQU4mplhcElg0jSBkbs7sEiyZH5
         fZV7Y5nfYRJIAKgchHziPHK/K3VeFxqB82HiDVVfBqYiwmqpM60ghlTIZRkw122FKu87
         blCg==
X-Forwarded-Encrypted: i=1; AFNElJ8KQ7yZ6H2+ToDUfkMS0b6GjzeN8O6gdXNX+HUOa1wvAH46yL7qa0XdBOxogzVW94gkWJ4GponrnqBe@vger.kernel.org
X-Gm-Message-State: AOJu0YxfMS/B13J8XSrBXFyfGVcnfhA7sCGswXyl3hhpzbllXW/kfNVW
	TaL12eIVqvtXy9xBYGURM+orD2fyCqHDQdzaNILuFLDUr/z0XrX5hyW6l+G/JPV5hKc=
X-Gm-Gg: Acq92OHgaod+8rU4nojuJBUmMYHLTjOq0eprwaYDiYwwaY7fgeGRsgSSL3ofOLm0F+X
	0bF2o+emU9nkVYnNBwQrwNItyC6nDlMc7hHqbUeyb3R4nsS+pvV5mjOhbmlzmLM2aQ8i9YzLdGb
	nXtE1qc4X5iroz+zLdmw3f43AEN5GROx0QGTYo21HjXLG4KIpS5SOuavlle85Sfwsd06XNLvcI7
	A2h0JXI92YUzh99h0LkmGLhx+wemPLtgr2NLrom63O+n63KrWqiwdE6+ZPB3SW0JDyI5xwThdd8
	fULafAj/eNcovFSOyd1KEQayp1CHOA2G03ZRQMTnsY4OoV76EqPY+V4bMHDn8nbLKJI0U6caBKy
	Ly6Y04AGVvxaPF/G2dl+K7GUHUcRPBNgp13WWzd2QG9pdVvzceayZaBeb/8qFYiWBcmNrjbxTjB
	NVODCkr7ZKD/RoOsY7F7qnVhwLC/ViQIdkzQPAHD2D1F8kIDjr2M0753gVKot7f2+DpNqXhBmaw
	UJcapqJXwcsn8DhIjG4S4ja+cERz0itRzau
X-Received: by 2002:a05:6000:2f87:b0:43d:762e:76ba with SMTP id ffacd0b85a97d-45ea3ae7068mr3841739f8f.17.1779363537026;
        Thu, 21 May 2026 04:38:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:fdc3:41fb:621:f792? ([2a01:e0a:106d:1080:fdc3:41fb:621:f792])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7da46esm2500466f8f.14.2026.05.21.04.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 04:38:56 -0700 (PDT)
Message-ID: <e73a2332-4f51-49e3-9182-cc34cfdcda6d@linaro.org>
Date: Thu, 21 May 2026 13:38:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] regulator: add SGM3804 Dual Output driver
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, KancyJoe <kancy2333@outlook.com>
References: <20260506-topic-sm8650-ayaneo-pocket-s2-sgm3804-v4-0-7495e7905693@linaro.org>
 <20260506-topic-sm8650-ayaneo-pocket-s2-sgm3804-v4-2-7495e7905693@linaro.org>
 <91ace2b7-a0c7-485f-a464-d7db397e0df7@linaro.org>
 <6689f2b6-b369-4048-be65-4cee6d653533@sirena.org.uk>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-GB
In-Reply-To: <6689f2b6-b369-4048-be65-4cee6d653533@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 21/05/2026 à 12:21, Mark Brown a écrit :
> On Thu, May 21, 2026 at 10:17:16AM +0200, Neil Armstrong wrote:
> 
>> I checked the Sahiko review and the reported issues are all false issues that
>> won't happen in real life.
> 
>> Do you see any parts I'll need to improve ?
> 
> I haven't looked properly given that there's two drivers for the same
> chip in flight, like I said I'd like some agreement about the way
> forward between the two submissions.  I did see you follow up and no
> response from the submitter of the other driver.

Sure, I forgot to review the other driver which is the original
driver I used for this enhanced implementation, done now.

Neil
