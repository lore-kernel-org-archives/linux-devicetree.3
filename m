Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30779426EC2
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 16:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778516653; cv=none; b=pPSnz5YWUeD0s8NT6pge43A6hkBLcE5Rf5sgi/0lLAPEomJoDW34EP6oDuW/fhywHzzdBCAEOWXDWRc01jOtNLdonLNDM44m5jTK3p2lgIKmPbFJuOcmA0T4NlS/mPR0r6E2TlvkFr1kY5yTWFMEBioB2hqhzpR9U+EHzRO0nFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778516653; c=relaxed/simple;
	bh=4OQTAqTxlFENdvERXoD2aSmqA+TiRfec4EPy8zG8gCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FILYtJp+IqCO1C8gKI9ra3HIlLBtpyhs/6Su2Q+S5wN44Rptz68W7fuQm1gsRUClAfhWbUd/Magq3Y1PofozOPwtoDRsenE8b5WF6e7ZNba3x7KeZ1BGTGHS1wbQLxgTQLoYJP0HC8mF2PjfzPumDjTo0rV5Vo1VhvtV3c6O1Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=pNAUTsOE; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="pNAUTsOE"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-479e6bc357eso1678728b6e.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778516649; x=1779121449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KRJlnjgoFe7mDl6//dS8Gjps/w53SHPBrqnYZwHQd9U=;
        b=pNAUTsOEgRkt7Q6svAuvxDRbx+u6LfPovstl3KWbiW6rug4DMuZDwyzucAZ4NLM+i0
         QLy2AXI5h0TgNxlkFBgm4qIwdlX/tvzh/L1y2ZBbwtKanjH6w5PN9akDy0m82KHcawwf
         dHMouc/Kn4dNatVyfH+qia/WoLJ4hI7qw0nGKMvufOg9BCA/zysPZQSoajehIOv+7Y01
         TF9enkJwhKZXVLRgbjGLHaCNWkT3RWh/fV/EoY1QGlgflPArPhcH3YttnL5vU4jl2BbN
         KEhqf0NpzOjSUJR5Z6Hgdp69eclk+uzLpzood1gqbGUhPhmOg8T6NRdsB3QpJW/PREoP
         6L3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778516649; x=1779121449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRJlnjgoFe7mDl6//dS8Gjps/w53SHPBrqnYZwHQd9U=;
        b=HtHW+2WGa0r/XfFmfJQXW60kpI2dpzVtsGPO1bvz6lVp3D6siB++AU+6ICC216f+N/
         7+CUkOi/CXs6oRpWDQLSBk4JInQwyI0qYsOuf878VdMnmcZ/CRd5y62YyCJoe2ya82Q1
         nYLtNx6upLTuCq/Aiema2oWcBnx0d6cYIrKIR6TRwmIP08APIxHhbyHgPWF9MfU9GV7z
         MiRLHVi14gB/TmABLbVe4xFozObTTdi2pwX9zj8nzCPpVwXrTwY7orQe3tseMxXHTWYZ
         8k1x73kolYrOCCfdwzM4QttwdLqnZBh8mSp8lUFmgOGiAREju+cTzXQKxMAAU4WMldrm
         1+SQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Q7K3qrpw84WFstT2PdQlatTJq3POlbviuVIyjbM8APF0xd0VANnonchLotDbRisn0xnjEp2VSWfSV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1DP7p0iJZrogD6DPsQWZ/KL49+lp7Qm7u/46CHoQVB6H5zlp4
	SWN/bo2ly5FUye0I6cWnwTq2st9UFrt2zXpFFrvgJQmUeDDT0cT/3TyJnw2krZ0V6z4=
X-Gm-Gg: Acq92OHzWA1wSCA5oT/k6iDiZ7DhOq3UMVQE135f3Rl3Q1ssSk1+fz4B8A1z6uOkrbL
	3Bv8ukN5x3OZi9PuuluJmISLo+qiSves3SUNvtHzPm/oH/oXZpPjoq+P7Ll6zPE/Q84ClMsaElv
	AhxkDsHEZN15A2merUEJnAklQgH/vkclWFLt1ED7Try+BQDve/peJzhi0+OY9PV/7Jsw89cmNs2
	uy1ogSBKeMClZubWgYh/7YEPfnOcMiR4f/OhdoMHKx3eXRsa8BrKJ2UW2wBTSlWEHgB360ROswI
	MENBqvGrXS8Qp8F31309fbfZhlf1vkiqxZRqrD6++2xaKWn8DFYwuFLQhD1qhoN15ZxCFJtWiqy
	recaNeKRflG1vtJROOFl3Szz14u1xzXzGDQbgmHF3VtWFswIigGic9Co1muW9IQxCeFia7YID2w
	MbCrtdY1tACCVWRtUosOXJ/UG3cwDa8xQ89f9zAyoHdI9W9zrvxf9ZtbXgjJC0y1Lg7d7y0tM=
X-Received: by 2002:a05:6808:e656:b0:467:2a6e:adad with SMTP id 5614622812f47-4804220b8b9mr10538869b6e.11.1778516648981;
        Mon, 11 May 2026 09:24:08 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:591:4577:3439:3a1e? ([2600:8803:e7e4:500:591:4577:3439:3a1e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e367c04e66sm7104662a34.8.2026.05.11.09.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 09:24:08 -0700 (PDT)
Message-ID: <7baf9ca5-50ff-4131-995b-70ee094ed247@baylibre.com>
Date: Mon, 11 May 2026 11:24:07 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: iio: adc: Convert xilinx-xadc bindings to
 YAML schema
To: Jonathan Cameron <jic23@kernel.org>,
 Pramod Maurya <pramod.nexgen@gmail.com>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260510083219.70224-1-pramod.nexgen@gmail.com>
 <20260510120141.118057-1-pramod.nexgen@gmail.com>
 <20260511171554.6541042b@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260511171554.6541042b@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/11/26 11:15 AM, Jonathan Cameron wrote:
> On Sun, 10 May 2026 08:01:36 -0400
> Pramod Maurya <pramod.nexgen@gmail.com> wrote:
> 
>> Convert the Xilinx XADC and UltraScale System Monitor device tree binding
>> from the legacy plain-text format to a YAML schema, enabling automated
>> validation with dt-schema.
>>
>> The new binding covers the same hardware and compatible strings:
>>   - xlnx,zynq-xadc-1.00.a (ZYNQ hardmacro)
>>   - xlnx,axi-xadc-1.00.a  (AXI softmacro)
>>   - xlnx,system-management-wiz-1.3 (UltraScale System Management Wizard)
>>
>> Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
> Hi Pramod,
> 
> Something went wrong with your sending of v3. I have two versions sent
> half a day apart and no idea how they are related.
> 
> Anyhow one of them got feedback from Rob's bot so I'll assume we are
> getting a v4 and wait for that.
> 
> Jonathan

I think Rob will have to fix the bot to make an exception for the
legacy bindings. This should have been called out in the commit message
as requested in a previous revision.

https://lore.kernel.org/linux-iio/20260220053941.611415-6-sai.krishna.potthuri@amd.com/

