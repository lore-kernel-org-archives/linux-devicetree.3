Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D016364951
	for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 17:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774026229; cv=none; b=kTw271qNhI56Tina7rXoJ5i5VYZs0Vd1OQKaNPWmNaQnacG/13cWv+GK0IUH4LpdA6vY6vjh0w9HDKK8wwhdEKIcFSdaT0qOojbLU2t/sOByiN7fKh5+2ikjG3+GDi9XD5yruNj+u0CbbWK1PkBU5iHhkX9Y2yNKgw9KBNsPaRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774026229; c=relaxed/simple;
	bh=Gj1vtuwQXHR8UoUYcOrYnXzY7Cxk5iL7v70NyDYKxaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bxJfp5wvUMYS44gTpUGe3FRvwawlkYmbFvRmgPlPRk9u1M1usOjehRn4wiuisRGlkuKYhEWq0zRd9xeu3lT2l847v3EssZrpkW9eWFZEotn4fmbpJH5sqIvULigSo5jsRd+gHO4VFehRzVgJ/rwK3uay3EmfZd2rCBCA5PkClLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=rJFQTNjB; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="rJFQTNjB"
Message-ID: <4bbbebef-8a3c-4320-a2d8-f5187db2d850@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774026216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DwecroZVjODs6pTedN26ECdEviq+g/i3AiPwlkMDrIw=;
	b=rJFQTNjBLoAdYfxmBhtJdesTK73gwyqAgh8WorG1RwYbp4p63tRkPFhaDnsTpQ8Uq/xNXO
	M9h6HzURzCpuCgfivuf2aIdjMSb8NXbGXc92NhPky5bhnE3MQSsQPxkr94Ki20a5kCFonv
	AqeRP+TzacYwJoFnqNPKbSYvM0Lf3N0zpUaHarqpmRTa6L1+Fai27FZnbudaxSDXf5DMSa
	LEhvbaiBDZZko8kHYpkqsTAajB0qpD27SkfpTrTkTPcFcnTz0PXbN9b78M+xIzrhyWbGyZ
	uVMHRVtLGyHo0OPtcFzn5Ngt+YEd0VIO2TR7DNG98vnlI/KNc6rkle5Nsh4Rew==
Date: Fri, 20 Mar 2026 18:03:26 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sdm845-shift-axolotl: Enable sdcard
Content-Language: en-US
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
 <20260320-axolotl-misc-p1-v1-1-89c9b5ecb26e@ixit.cz>
 <8abf3f78-c994-4d05-81ea-ef54dd380109@postmarketos.org>
 <51f16009-5df8-4c3a-8fb9-28af73b8c04d@ixit.cz>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Casey Connolly <kcxt@postmarketos.org>
In-Reply-To: <51f16009-5df8-4c3a-8fb9-28af73b8c04d@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 20/03/2026 18:02, David Heidelberg wrote:
> On 20/03/2026 17:56, Casey Connolly wrote:
> 
> [...]
> 
>>> +    sdc2_card_det_n: sd-card-det-n-state {
>>> +        pins = "gpio126";
>>> +        function = "gpio";
>>> +        bias-pull-up;
>>
>> This can probably be bias-disable I guess, not that it likely matters in
>> practise.
> 
> We could save few uA by just disabling the bias, as the card-det pin is
> useless anyway? Do I get it right?

Yeah basically
> 
> If yes, I'll switch it.
> 
> David
> 
>>
>>> +    };
>>> +
>>>       sde_dsi_active: sde-dsi-active-state {
>>>           pins = "gpio6", "gpio11";
>>>           function = "gpio";
>>>
>>
> 

-- 
// Casey (she/her)

