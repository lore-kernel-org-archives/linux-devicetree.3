Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99EC3FB7E1
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066701; cv=none; b=A8W09sP/imiuSZyVixEzzeFk7S+WrhjApeoHZx38FmqKJq3AJQpX50/ZMxiqzz7T7Z0t7hKBiaBmx69ATrsngK+JxRVGnssxSQgYPFHnxgcNP/pUcf6q5rb5hK44ybLRW5oBSLhSzX+iWBCZ2PdHqn3jsffMsxTEwTTp0LuSNME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066701; c=relaxed/simple;
	bh=TvDNOUNE5esDjb0VJzWZLByvq8d6tWkBf2WKUMK9i1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jbN6effKHoxwN4ZX/Ta6L4UBWZUpBqUCr7hxUzdJeSmaf9anaAjYtmn3loZL28EvoPU0WHViYqta1bC0EdloWgnTxSRGGHvwAglmlcl0PtEubqeLe9HWDDioNJ4hQvWpcd38fsM3RWsrzKU4l2NCa1cHaubd0t9DmxVu4gZ9dSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dEp8C/l4; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dEp8C/l4"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso67033105e9.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780066698; x=1780671498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GU2T/pZfXae23cHrpeloETVxMMttaLJWiMdOf7oLCD8=;
        b=dEp8C/l4kP6fTzCOB0TqE8BUSqt69CnDSmzsvE8WbH6NizrhkG8T147dC1PVYuxN73
         EBSHHiYf4uKHpwJ/MEqpT1p+f+gh+LdFJg0A15EnPfEF2bI0MOcRTd47AtAXi41i8eLo
         wF3z3yWSqSqivF8sXBaxvfz7PKAU6/sluHBvH+IbFhAApcX51hsPRttuquZqx78m0oLK
         IL48+/+6gsoD6zNsc66DMmRCSvWHPtS1ZjKbqJuOQ5NOfMr0KSt0oi4aR26Hzt/fpAIo
         ZmCvBEIb4tGWmrA/yakeGSk0z876HQaNoAClDgFu1v6jKWQShyddHXKnpUh/iqg0n7aF
         s6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066698; x=1780671498;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GU2T/pZfXae23cHrpeloETVxMMttaLJWiMdOf7oLCD8=;
        b=PniEEKD65e7JyPPCKaHrPcY2e1pugXD9apWNMUCkyF2fVIuO8v8EA9FczVpYsaOSWh
         zDlAbbg70LXQUhkr9pv9xSrqBYGxymbneDtzHb5IPdVzWFlaiOMddI7uycbz1ScVjrji
         JoTOj4h15UN3jmuuJ3RL1rp59mC3uLe9MDL1IbURe413XcPQVIWiZKa9V7A5HlmM+0Th
         k9QN3mgSnTJx5f5iiclP6KuhDrYtbTyiXiQJbfPtbLVdmCjEm2hEb48rBNoUFJkPfCqn
         iJPwuFO3WdiGKSlHUvm8Ji8tcgt2rk+CN42X+u8pmlAJ9RsXEN3YFGvjymBqRUyIVEgj
         Xd6A==
X-Forwarded-Encrypted: i=1; AFNElJ8DRBhgskHMmoX1cGNQdyL2eRx+SUc8xsksiA8oInPFfh35pycrvP2ztU/r7delNZWeyavI9i+Ehq79@vger.kernel.org
X-Gm-Message-State: AOJu0YxhmaMNmIX30TSek59EkSRBMHDbTqcm/XPz4eAv0Ivc5m4NnFoM
	jd1qqW9JuaCVcaWBTcekVhhB+RLkycN2mUg/5rtaF5+1g8oTw6+b+Ce5hnWqgxMY7e0=
X-Gm-Gg: Acq92OGuzyrdEzCOtq/8yEeGJFdFHiWwMMNsZSfWDOFCMOyDHeWSAmNBmySnFHRNokt
	kaoTnMu7dm2CgTJD3pBJTJ9LKMs+npEY12iAHO3tXyyna0+hGx/7JV7Nffm58SS80RjjuZCbzRc
	bxB7zVK4zASCDc1T+1Qd4OwF/CQtZovUEZwiNuQdpgywcumZD9HLWfnrr3HliPBLTDW6cCPglzM
	Y/2jHYXOZvZXwU582R/prIkBVyexvh2vQz1Cl6SsMPopw6b5ODe7zT0xVrsj9E5Z2l0BbAX4z3M
	1nQ4MBS7StLBJyOi9RAWWoVI4NeVT8M/pncc3p9sYFrFoETZmmOUVAjCzOg8UBEfzUUZ5DlKbBW
	g9rwS/+3hl6TNNj0E8nVn2B3Gnsj7mLZXhn8h6lnkxNtubU4lB8/hyzThWJiRQT+/NyN51WukKF
	l2JZ/JQ1ioJ8veJPh7aBv3qkCM9mSPNCDmoAyg0z3+UIY=
X-Received: by 2002:a05:600c:1994:b0:490:48df:2793 with SMTP id 5b1f17b1804b1-4909c0e77d6mr57620855e9.26.1780066698120;
        Fri, 29 May 2026 07:58:18 -0700 (PDT)
Received: from [192.168.0.101] ([64.43.33.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909ca6e124sm49445275e9.7.2026.05.29.07.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 07:58:17 -0700 (PDT)
Message-ID: <23d2a824-e894-4c26-8bd1-02bbb8a7c6d1@linaro.org>
Date: Fri, 29 May 2026 15:58:16 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: Vikram Sharma <vikram.sharma@oss.qualcomm.com>, bod@kernel.org,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
 <178000689150.4557.11759359941436928903.b4-reply@b4>
 <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/05/2026 15:52, Vikram Sharma wrote:
> Shikra and Agatti are not iommu compatible in terms of Stream ID. Only VFE SID is same
> for both. Agatti is documenting iommu for VFE, CDM and OPE. OPE is not yet enabled for
> Shikra and in my opinion it should be added as a separate yaml similar to Agatti.
> "https://lore.kernel.org/all/20260508-camss-isp-ope-v3-9- 
> bb1055274603@oss.qualcomm.com/"
> 
> Regarding cdm iommu we have excluded it as we do not use it to program registers as of now.

Which will be a problem as soon as CDM is attempted to be enabled and 
yaml changes are dropped upstream.

Hmm then it seems to me that five is too many for Agatti's IOMMU set.

I'd like a number list so that we are discussing facts instead of 
nebulous hypotheticals.

For both Agatti and Shikra.

---
bod
