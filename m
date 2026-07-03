Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA8930100D
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 17:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783100205; cv=none; b=FmQzVX+IcqeoUXwrflwrD9w3vCJ63FE4vS62GBfZVFbhdH1eufcPgn5g4R+zKDdcyr2yxoLzqPm3rAX1udKqDp/ASXoJH7jZkeFbH9EpmXNjIvYdPYQzFnPtiSJR7Y3PxEteVLr5Y0oCFcNLJBkjxOUAVWnprd/qHhiyAEyEff8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783100205; c=relaxed/simple;
	bh=UqIn74vDfHkpSSpIDqvrqWCVWTw6WrgqocAQXTALwIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dTBz4D2/ocsVAe1uGHdFO1j+sKHHmscirOQxgYoOPHAP+fmdWUPyU5Iv3OarJb9La1/zE7s2WIh6OXLtkd/OfD4fA3rhWiweZCILm+1dR2ke/Ay6H4uNBJbjh+VCv4JV0NLCJLF6HyChlavIBOp6HZSHyphHlACEbYV7iN80O8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ue/qOweb; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ue/qOweb"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-664dd23829eso725924d50.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 10:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783100203; x=1783705003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=swFOHxWnwsi80sOoNfpTLmi7to+o78mL3eziN/+vZ9o=;
        b=Ue/qOweboVu7n96wWDZ7dCNUMjEco3TT/sUysOemX9WDsblD9kFSmwOdx+v+QEbXFE
         c0FSKumm+xHoSAokBbLCN1iPVZTSiNNsajvDb0sZw6Bcpc5ncSy5p2vKKoc9cW8Qdrxv
         rx0o1m0CQMLuIeolKEa1nCCIxpc3kgReltAF5RbupglawnxcvE1WCakTOtV9eH3h8zX2
         6Rav4+4YpjaBeNK1Y0hxq+p8xfr1MegRZbDI+q3L5lCZITCZig0mnAHr7B9mp1QAnOg9
         WRCmL1Eb47mhVC3re8DV9QsV84nBbHIf1BH3alrhciBpvrDMrIRftIiPr+meygOS+aTl
         oHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783100203; x=1783705003;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=swFOHxWnwsi80sOoNfpTLmi7to+o78mL3eziN/+vZ9o=;
        b=GXdB1COLU2DhJTziay6qkWHvYnIdYOOdcBA1KgGvQmcjOD7TrkLtpHaVelTn3h9yOA
         SS6VrTLdW8muw6PuenH684gNzdgQ9qY3tlqRRTG6O5leVYkDRDfduFhNVKmUF1AQ6qsZ
         L8OFs3Kbyond3pVt+2Yx0nrTSN+035nlxskAYjqEwssFQ5QP+kzzP/wrSM1OlRN58B/b
         Fpr+OZE8necLEhcVaGrC7sCbWp8JrP41DvcgTXVNfkLwjHdDhloJwLmv2e4igJpi5QX8
         3BvcHajOvyUgkbSw/MJx1Ap77YJHfvllZW/ZVln3e/6dAHNP2Hy6BwB0q0ikuHjV0bKn
         x+wA==
X-Forwarded-Encrypted: i=1; AHgh+RrUclwKiu7yA90m46mYnpz9vHcpehajf7qIli1SmMj7BfWfkDaEGCSrtAavd/LYFEjB0+cN2UVPtsgL@vger.kernel.org
X-Gm-Message-State: AOJu0YwjF3OXabtWLalUyfJ1F9fnNrRUOcHaX3MlK4c5Bb4VoW37gQ36
	WDHZ0hUUhy166A6OMTZvrVR6t/EauTfOu9Ac2LIVP33KLfHXb1v+XWgA
X-Gm-Gg: AfdE7clH2QQO0PihNPI8CaC5Iz5KBTqQpVOo858gP5kTeaXt4a3gT1+ryvfDAX64tvE
	grpFnv9kO31cAXYzZag6DIiwOKC81E4a3EjclthI6d11r7/i7Pv2GjOUvqgWrBNVq+t49hpXsnO
	e/HaHQSjqfaPWTchPq4/27+neCDBrwEGnISp4ErAAXKFrHBuzkjlrcWcVljTaPeMoApZ2QH/zxP
	8JjORA81Y05OSuea4gMyKKJpBAAD15gSS2U4b7En8tFx7QFjf63pYy5ZYlcwPEsV1nun7LhRUSu
	B6C+6/q6YeUuslM6aYxgO7bPmt8seY9T3Bn7MZ32SojWlPn1cieedu44dxDc3WwnoWImTxiaAjE
	PII5403CAliBW64c+RT44zh5lrbaz5PGJydLEWN86aqvJOOM/jgzpHQaDh3u0UI1B1uN9Lt7ffr
	aAn8340fsGDHyhVhM=
X-Received: by 2002:a53:ac91:0:b0:662:f405:5d41 with SMTP id 956f58d0204a3-66652e3dd28mr53777d50.33.1783100203109;
        Fri, 03 Jul 2026 10:36:43 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6664087be45sm1050084d50.19.2026.07.03.10.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 10:36:42 -0700 (PDT)
Message-ID: <32510c42-5448-440b-867b-c4b7404a4dfc@gmail.com>
Date: Fri, 3 Jul 2026 20:36:37 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
 <20260703-sm7125-samsung-v1-3-3e5f752048c1@gmail.com>
 <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

>> +&apps_rsc {
>> +	pm6150-rpmh-regulators {
>> +		compatible = "qcom,pm6150-rpmh-regulators";
>> +		qcom,pmic-id = "a";
> 
> have vou verified your reg settings? incorrect ones may lead to
> hw damage
> 
The only deviation from downstream I have is in ldo5 in pm6150 where
Samsung set it to 3.3V exactly, but we can't pick such value in
mainline, because it happens to sit in between a step. So I set it to
3.304V instead.
