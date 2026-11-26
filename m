Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702642;
	b=YgOf58F93ea/wfpnHIaMA7Lmm5lDORhWUcKZroz81ujedhlOPRHN45q6nFxwaJhC6Akv
	 5yHa1uPh1FlKqaZKMDqWcwHQufXFBEfAfW8ewp3t8S3dIVxwgZ4TNOXUC2J+3mDLO1B7P
	 YDgpXPe5YKiR/J0ZXBj7gp33LQfviNBvHIjXLZQL+QFt2A1SrklqlLefIF7q9L7ZWMpcD
	 JOb65bhvc8ZvqBV/sB/3RFs0iGOBZ4P94iuSGTjlL+94zpNbaAukUddz0THTJH4SYIznk
	 Rm1haqnqGPgodt4iwg8RqBPdJcpbrjQlSAKM0SdwDUeulvtgpp1ZpI32qwWX4SuACsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702642;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Ek0TAsK5PjVLM/HBOxfS2veUV8l2ImkiOAkwJh/IuAY=;
	b=IIpboJCD2DKd+w4Ppv5aWBhaXOdorvmsYBjeLr+qM5ZNlmKNFyjzyjzcaJ2V9bbHHmMH
	 Lzhek4H//N6GDKOHWx6L4wvlxB+pTNO6bNfDBiw2IJsVWx9MTbh8PWnyo2Z3cIDkeCh4m
	 ezcLlMSxiKxcvxkVVlPmTG6Jhu9xAPcRzUeeW4AYvkDXOSrHwZuzRJmNIfE4V5DGK/sqD
	 oe3HWTyxG5XC7Kqto+0pWfc+z8+g4iUVok38DoY3Pino+ti8/JHRKw3+L3wNK7Mf07gcc
	 hK4cjFyJ+gYXXjLI58sOs1QbtoSMAzk7h38R1XXf6dnvZTL7n4oECiELHaa/zxaVJ+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=kunu7xQV;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=Rg+rCHOH;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69BC606A31C;
	Thu, 26 Nov 2026 14:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C69BC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=kunu7xQV;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=Rg+rCHOH
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1795702629; bh=Ek0TAsK5PjVLM/HBOxfS2ve
	UV8l2ImkiOAkwJh/IuAY=; b=kunu7xQVv35J7CHgGUrHf2X32WUe3xDdbDIjmeyHD8gxIlKitr
	Wf1REQBhLhe0Ar36GV8UH05rEE6xOaJMJKDtosltYJuzo3ZQb8qlwO4ME1rv/l4gdQBYjWC9/DM
	YXprcwt2DcFVzmuFfBvQFqQUzdFf/BGFI8KKOFnQhgx/tANx2M9zDEUwVuER5h5e8/BpR/D5Bo+
	JZdaAryJ5k+WF9JkUpPRS7NeJfPIdpEmTGkrPobVmXipSleP452krDRoD+g5ppoLfsL7CFgk/gH
	a8egm1Q0/sWgHMlxzgV8XaB+jXVHHwLWTBV4Uq4/eT0KvN/GQiJs/hcF+zkGn4QD/mw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1795702629; bh=Ek0TAsK5PjVLM/HBOxfS2ve
	UV8l2ImkiOAkwJh/IuAY=; b=Rg+rCHOHW8HCrl/VqtqJGLro6sxF2mkU9RNUnAPu2DtOZxNRPT
	LenbWjpJL+yoZklfYDLx+ZtCDeKyu4cIlXAw==;
Message-ID: <512c6ecf-7696-465e-a2c5-d414f2d64939@mainlining.org>
Date: Thu, 26 Nov 2026 17:17:08 +0300
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
Subject: Re: [PATCH 1/2] dt-bindings: firmware: qcom: scm: fix CP_ADSP_SHARED
 VMID value
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Gianluca Boiano <morf3089@gmail.com>
References: <20261124-qcom-adsp-shared-vmid-fixes-v1-0-f1a808dc41a5@mainlining.org>
 <20261124-qcom-adsp-shared-vmid-fixes-v1-1-f1a808dc41a5@mainlining.org>
 <179559535967.14607.13377213266450757103.b4-reply@b4>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <179559535967.14607.13377213266450757103.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


25.11.2026 11:29, Krzysztof Kozlowski пишет:
> On 2026-11-24 19:52 +0300, Nickolay Goppen wrote:
>> From: Gianluca Boiano <morf3089@gmail.com>
>>
>> CP_ADSP_SHARED was taken from downstream AC_VM_ADSP_HEAP_SHARED, which
>> is defined there as decimal 33, i.e. 0x21, not 0x33.
>>
>> TZ on SDM636 accepts assigning the ADSP heap to 0x21 and rejects 0x33
>> with -EINVAL.
> So not a binding? The value is abstract, just fix firmware... even the
> drivers are not really treating this as DT ABI.
>
> Anyway, any ABI break must be explicit in commit msg, better with
> explanation what was actually not working.
>
A mentioned misinterpreted vmid value leads to probe loop as tz rejects 
this value and probe fails
>
> Best regards,
> Krzysztof
>
-- 
Best regards,
Nickolay
