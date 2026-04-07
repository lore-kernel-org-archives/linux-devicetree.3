Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306F437A488
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 20:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775594398; cv=none; b=nKhj4Eu0XHr4JGKRJnfzOmqWNq8lnA4JDWJjizqxXOZnTaXx17HOT6dxMN5ROXRtsK5KdjYM3B8XkVywhaJreheoBDCyCtAMbiLsJAhdLyWrcoUzOn9lnyAXXswvJVyrlqR8YVBqlnfTIkQaPJsCNQ8vBHNY7Jo2lL2wsfgyEL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775594398; c=relaxed/simple;
	bh=ZTYvc5QlApW8b7c7LQqpkgRmOrJ9zY7/hhMO3WZOYAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lc2WDbC6o8L9dnomT0mB+MBIURz/JRUO4hjcC28psHGpGfS5AVzGpEjmHjnd5OsgyFgSa1H7ESvSakqeqcixOB9STBhoNAagDDjbqf4/t+4pG58opz+a+eiiBlxU9X6tVvWSdyJd4pvb6mwk8YmEC16l57rCFVhy1fdXwj1tm90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8mP/N7E; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8mP/N7E"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c56aa62931so11241692eec.0
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 13:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775594396; x=1776199196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rG8uT7iFeLc6nzTWdSG+khDtXnia07K9+OVRfIk9nH4=;
        b=d8mP/N7E7yloPigwy6yVohOPrmIy1wlFLL5CffszTIPD6ONZmBWKdwJkplVITZe7n1
         eEVNzB58aqomZM/xrGu8Gy1xwqI3j+J8PmVmW4VLNBSv2OaXdA6TVPqLx7pWZcM3Z5I4
         3iFeLlo9bBjwGe1GyB4ELRvHI7KY7AauXFdHEsCduaV1DTtnv/ocnPm6WkbkFPfQE+zJ
         j4LE8QagayWyy5d35iN5s1uMfRrh5rwc9rEZQAlMd5KV+4RJz0nJC5RaktCChY5/gjgH
         JBqatH6jJ4zeWT3j2kLbW+qhb3qD+9N0RzRyFmsAhoYfnfLdXJ6W5F4WjQlJ8SuaWjZ4
         yY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775594396; x=1776199196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rG8uT7iFeLc6nzTWdSG+khDtXnia07K9+OVRfIk9nH4=;
        b=J3sdh/P9vO2W8DWgkQbQJDRx4pZvyqUHtafVcvLV9PVfK6WJsPvGocd3SjCo09v9g7
         94hxo3Lr0z5Egbvo6KvqA1qgzxu5bgFh4/v1XT6CwoVVP6JaP9o6zWcwFjFWNl5yP0G6
         BHO2sWpQAg9PfETqqY3nfT6cAisFp3INQZlMNqWorwqFypgQKAqHErkcHWIEUCZTqd9g
         5P/PMh6lAsRqKOfcuhIek6p5ORWVsvXgKSrAw8LIAquXMt/1mUPXxZTXBfAkM1mDzD1f
         owm+3tYtPLSbwLGaQxCBb71aP0TuisqHM1Dn5Q7rSUQmhbKLLq8rTF7xdNYCwCnrd6nh
         dtcA==
X-Forwarded-Encrypted: i=1; AJvYcCW/blhcSfypPPlEvHDhjqYCnQDu2aWfD8NXS8e6CeVtnmkjPSwFnJskR87Yc3uPdCWSELPG00ZqbKwT@vger.kernel.org
X-Gm-Message-State: AOJu0YyrSFSfFuGPv5MZwRdGkLtTn+wY6iJLAS8xfViSTXWJD6Mq0aIV
	4Z9kGji/A215R6w0t8czrtldd3M4oVzlsPw8rQolUkv/BNeDb6FVaZLuyJFLV1WJ
X-Gm-Gg: AeBDieviki5LHkDpbUr6hHc1L6VmqVy+LgJhxOOPUHyS4DYz3KJ3wjBuJYyzdHzz5KL
	S+CoyIoNpiGlzC8FnO6rDZ/G3DI3uo+F6blidR0SN3hYaP0g8sP7KKX1yDmhaQu5InIikVGoVsK
	p8kprS1stQ71Wj/yJjSeVSsftOTlAyAwm5JavwWEU5KoMj95ycrSg7Id/QZgqlYHh44qE/o8mzk
	lgKSHTaDF+/9OzdVPUi2+vni/7eZiZvry7fuywUf7iRAVTA/qaf2IEFwNfUzT/bpOo/WEhl66ug
	qw/ZhtkuIMZ1RU3vn8aXESCbK+kaMr50UC+nDXVbcGa4n3+rhwQdrmKXUSpjMkfAT2d6r5T6seE
	PuzAtNtmNIFM8+j0/K4G9cwkxtgV36miEQyDD3Q2StQbbPOiwpmF83whq/5XildaTxdocHblCWV
	ECs+jihhqb15ItyqzFEuRdxJqKR4DIzDF0bPJGAkrfei/8pWVlhNWA+FR/nG9pa3B64ZoYNqKMs
	66K+vJNEmZgpIBy
X-Received: by 2002:a05:7300:748b:b0:2c7:2c0b:f33b with SMTP id 5a478bee46e88-2cbfba8e8eamr10121436eec.20.1775594396260;
        Tue, 07 Apr 2026 13:39:56 -0700 (PDT)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cf1af62347sm10824910eec.22.2026.04.07.13.39.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 13:39:55 -0700 (PDT)
Message-ID: <b8b04f36-2f4d-4d0e-b0af-a01d129a5199@gmail.com>
Date: Tue, 7 Apr 2026 13:39:54 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] ARM: dts: qcom: msm8960: expressatt: Sort node
 references and includes
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260401-expressatt_fuel_guage-v3-0-9674cfc0b5a2@gmail.com>
 <20260401-expressatt_fuel_guage-v3-1-9674cfc0b5a2@gmail.com>
 <8e4ee378-113e-463d-8b21-eeef74b84120@kernel.org>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <8e4ee378-113e-463d-8b21-eeef74b84120@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/7/26 12:59, Krzysztof Kozlowski wrote:
> On 01/04/2026 22:32, Rudraksha Gupta via B4 Relay wrote:
>> From: Rudraksha Gupta <guptarud@gmail.com>
>>
>> Reorganize the DTS file for consistency with other msm8960 board files.
>>
>> Assisted-by: Claude:claude-opus-4.6
>> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
>> ---
>>   .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 408 +++++++++++----------
>>   1 file changed, 207 insertions(+), 201 deletions(-)
>>
> Sorry, but no. We are not taking Claude as one determining coding style.
> Are we going to do the work again the moment we come with proper tool?

There is no tool currently to auto format DTS, and doesn't seem to be 
coming for a while:

https://www.youtube.com/watch?v=cvoIbTL_ZQA


Claude didn't determine the coding style. I did based on sony-huashan, 
which is already upstream:

https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts


I just used Claude to do the manual work for me. In v2, I made sure the 
diff before and after the change was nill. v3 included additional 
changes requested by Konrad and some comments that I remembered during 
prior attempts mainlining patch series for this device.

>
> Same comment as usually - this is highly invasive change which should be
> done with dts linter, not LLM, not manually.
>
> Best regards,
> Krzysztof
