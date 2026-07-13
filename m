Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B71D385D6C
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783941290; cv=none; b=cOvU2/IIRcoMGl76nFBsFRryq5H9tWaZq3Uv/OOCxC/6L8sH9kpnaItpcURewqHPC22OEm9W5+YjSnV7thMQhAu6i0lEXxOcWMnbTiO25grmcc4yuf6y0bjFnhrnp4Xp6MeqCuE+vU+MwTID7PiackdzUrE3lJYoCLpNweyvLV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783941290; c=relaxed/simple;
	bh=zAetDQromy2N8RZpHM74SaWCREepLFBCH0p5HhPOOoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=otpgFUyHvJ+1bn7hRGI6iXruVxZwJIjZisbwcqa4lH2Bek7XMAWDzSzLeFZXt7mVqxS5AAmKFqP9Ln2nruSymrVLZRyT+8AqydC5eOuNLYVCUYWwSICuiN7BwObvl+RooRjuxWqmtldNaHjHhIe86YUA9CsO7SrPAls5AhKE1n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtySJ19h; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtySJ19h"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc61541f8cso45270095ad.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 04:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783941289; x=1784546089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qy05wQX9tQW4cKDrF9CYFi6hXbTRcwSo4hY7x3uhFf0=;
        b=FtySJ19hZBI4tdywwYcBsPGpfz42JiVbkyBy+NR+1n7oqF7m+Y2Lt0KepaaXjLa2oX
         rePVoB7fqJjPFiXfq1kbi39ELlEpOXmjk1E8E0sMGk+6eThEwxnFNLl+XczNX8gsDwTh
         LT21FaGS+HfUuQ/MSLk6OoZnirWwgULqiee/LVE65T7OQJSEsYD+JPh/pZueL8Dvl6Bq
         GqzPr+9afm0t9DUyLp2xm9RYnFLj6NpMfOsnPzwePReehcHfsTY+XBAQjIOQw7053+l1
         8QXJkLXSHFQm+T8fRnnpg3w0tA0BNx4M1nTJxSRGBVfsWaIy0gjnjvqq7l3wrFZoKLpq
         9aYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783941289; x=1784546089;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qy05wQX9tQW4cKDrF9CYFi6hXbTRcwSo4hY7x3uhFf0=;
        b=pGb+YGlZAoEkq1Vvt9AxmWqpduhrG45gvTgLf82qe1qe8fj/Cl9E3CE978nsBp3okk
         Al+0eFG84pRONxRxnnL4v8JjKperA4zzm9Z/kMXz165khTCVu+jhYAXmVy5scYKrwJqs
         i//er0JY1/jK4sotIRbiBTh3sdlhyXQfgXrpWOYpiU0+CzqRUjFkicgTZdSYaOScIUsv
         UvE4XcdShJuR3A2itWs3SgRrzhDgnj+8hqhZ15Q9YG/o5Ha7/w26ZVqnPHVqR9++GOX0
         rydEHUjw1aS5QDr9nRTiku02qwkEwOLrkz0HSErqg1UEBwf6aUsnhDmASv17+XMD5O9+
         x7+A==
X-Forwarded-Encrypted: i=1; AHgh+RpZKFa7hfmK/JudL7qfaC2sKomWEJK8NxBUv84Fw8g9lgEzisnKSB238MnfKnBNII9yBaAWQ4JZoMDJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwKoujpZZhcedIvetEtDrJiKAHkQwxQekE/LIZql0dbAumzCuON
	quNV4ThM9T1UvVtzkeFeT2KZGa+KloFXaHDaplFnZsFAYMmbzw3deGE8
X-Gm-Gg: AfdE7cmdL+x7nX3ua6VkW1AwKuhTmm98+W9NNYPTOAa4NYU3fKcfGo39SDpo+7qWcw0
	lYYUIRKldwg2bt8xW4/fU3MvxMS7h3PvPevEgQVP/9yKlN8/2K/Eu0tbw/5mVeJoGeEvtusVKTD
	55rToSxIhrS6E/ut6+NVkZMlFgvUPDlq58F9TD9JrFdXSbktIqhCW6TO6pyg0nwaNWQeXRRWL88
	iM/dFsqLrRd083N1I4hGk/cytBeMsEzJajrKmd54A5ze2KO2Fqbsa9zAPMGkJsSmdDPpFRTOuRq
	DIs50hLwzytS17QTJXrO2ZnOJdYV/PAlaa9VSphspZr0UHeqa6MJvocvSCJ+wD+HYZhXNjKIQjX
	n9X+SEWsOIqhrQJbeTMP8Zf1ggIFt32I4RNuUWPlu5rKsi71OmFSTwDY5+GzpgINwX5lccWMrmL
	Ow9q8org8yUZrOfr2602S2NeWav2OUUnp5uaCiM7ggnYvjJvhxK/ZE6s0DB4Y4lfl/Ibs=
X-Received: by 2002:a05:6a20:cf85:b0:3c0:b598:4983 with SMTP id adf61e73a8af0-3c0f0bc744dmr14145797637.30.1783941288539;
        Mon, 13 Jul 2026 04:14:48 -0700 (PDT)
Received: from [192.168.68.63] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b87b92b27sm27749509c88.6.2026.07.13.04.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 04:14:48 -0700 (PDT)
Message-ID: <fe802ea0-fa1d-415c-bc9c-1f534e9df26a@gmail.com>
Date: Mon, 13 Jul 2026 04:14:47 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: opp: Allow optional -vN suffix in
 opp-microvolt property name
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Ilia Lin <ilia.lin@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260527-expressatt_cpufreq-v2-0-b9b7726ccb6d@gmail.com>
 <20260527-expressatt_cpufreq-v2-1-b9b7726ccb6d@gmail.com>
 <wwzqpnkhdepkgl6bdmcuwep7v5m4rb6h3vfdbqmphxvmw4ao2m@efgv7wvm6cty>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <wwzqpnkhdepkgl6bdmcuwep7v5m4rb6h3vfdbqmphxvmw4ao2m@efgv7wvm6cty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/27/26 23:35, Dmitry Baryshkov wrote:
> On Wed, May 27, 2026 at 08:39:28PM -0700, Rudraksha Gupta wrote:
>> The qcom-cpufreq-nvmem driver generates prop_name as
>> "speed%d-pvs%d-v%d" for Krait SoCs, resulting in property names like
>> opp-microvolt-speed0-pvs0-v0. The existing schema regex only allows
>> opp-microvolt-speed[0-9]+-pvs[0-9]+ without the trailing version
>> suffix.
>>
>> Extend the regex to optionally match a -v[0-9]+ suffix so that
>> devicetrees using the full prop_name pass schema validation.
>>
>> Assisted-by: Claude:claude-opus-4.6
>> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
>> ---
>>   Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml b/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml
>> index fd04d060c1de..846f49a99484 100644
>> --- a/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml
>> +++ b/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml
>> @@ -81,7 +81,7 @@ patternProperties:
>>         required-opps: true
>>   
>>       patternProperties:
>> -      '^opp-microvolt-speed[0-9]+-pvs[0-9]+$': true
>> +      '^opp-microvolt-speed[0-9]+-pvs[0-9]+(-v[0-9]+)?$': true
> I think this should be fixed differently. There is no version for
> MSM8960 / APQ8064, per design. It is only applicable to MSM8974 /
> APQ8084. You also need to scale the core voltages.  Would you consider
> picking up the relevant parts of [1]? (also see [2] and [3])?
>
> I got stuck because I couldn't implement L2 plumbing properly and never
> pushed the series further. On both MSM8960 and APQ8064 we can scale L2
> cache to follow the CPU frequency. I tried adding the driver for it, but
> RobH requested using cpu_subsys, but there each cache device gets
> created multiple times. Maybe I should fix that in the end, then we can
> scale the L2 too.
>
> [1] https://lore.kernel.org/linux-arm-msm/20231002185940.1271800-1-dmitry.baryshkov@linaro.org/
>
> [2] https://lore.kernel.org/linux-arm-msm/20230827115033.935089-1-dmitry.baryshkov@linaro.org/
>
> [3] https://lore.kernel.org/linux-arm-msm/20230702175045.122041-1-dmitry.baryshkov@linaro.org/

Hi Dmitry,


Sorry for responding back so late.

I'm not too sure I follow what is required for the CPU frequency patch, 
but I can attempt it using AI. Would you have more information and any 
specific patches from the patch series that I should take a look at?

I'm also considering putting CPU frequency in the backlog.

Currently Antony has Wi-Fi/bluetooth working (Which is depending on 
https://lore.kernel.org/all/20260527-expressatt_camera_flash-v6-0-de0f150024e4@gmail.com. 
Waiting for Lee Jones's review and I will send my Wi-Fi/bluetooth 
enablement patch afterwards) and I've also separately gotten display 
fully working and cameras partially working. Currently I'm trying to get 
audio working and recently I was able to hear a click and pop. However, 
I seem to be struggling to get Q6/hexagon working. This seems to be 
required for the modem as well so directly controlling audio seems to be 
a temporary solution. Would you have any tips? My source code repo is 
here: https://codeberg.org/LogicalErzor/linux/src/branch/expressatt

I feel these subsystems will be more important getting in compared to 
CPU frequency. Unless I'm misjudging CPU frequency work and it's simpler 
than expected.


Thanks,
Rudraksha
