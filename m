Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FE4382372;
	Mon, 20 Apr 2026 09:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776677177; cv=none; b=JlX7HDhTNBFbwEZTQ4jBtbMUw7+9vevYuPHKHjXjfkWLTEvbsMdx1TXNpNzFzdPSxUxVxnmdD/CLNBOdmWZnJzOUBMqG2pfCWHx2rlWn8WrL645JRJKoHGs67bSUI/g5bpfAdpAqSrwZ/r5Wsbi5VrsYjbLsbCz9935k8JNADdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776677177; c=relaxed/simple;
	bh=oiwQ/JNg7RdhRLU0hLjyT7kxMO4nyPSt86GjWiTFxkA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GdINOu5hipn+oWsoxhbW5AFh5h6DxDvua+hxhTpVrkcRGPYPzzyuj7mhQj6WsSLZoNN6V22KzwOdalAgKce70GLP1oJsepBs1gwcA/AgPj31fx5Y2neqrrOg6oceNMdY7dIBlQLAiqdYuV+Jp0adXHhUmt3FgpAUD91q5BgmXmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=MyCqpUsG; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="MyCqpUsG"
Message-ID: <491eb101-0b4c-42e8-abe5-55ce6a50ea36@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776677173;
	bh=oiwQ/JNg7RdhRLU0hLjyT7kxMO4nyPSt86GjWiTFxkA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=MyCqpUsGeKdkAwkQQ35XlGPy+eBYAaIbH/NY2/CJ95Yy/oeco6w20eW6edgX6d1q+
	 An7FFMlzPHBZOEn/Ut0SiukmVPjLn60IPilL6mxxmD6Uh5GyKyEuONB2+xpcoqynxT
	 NvFyBx10UPE8STGpV3dvkHADfag7cuvuMT7lRvwE=
Date: Mon, 20 Apr 2026 11:26:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v2 3/3] arm64: dts: amlogic: t7: khadas-vim4: Enable
 Bluetooth
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260416-add-bluetooth-t7-vim4-v2-0-9a57098fd055@aliel.fr>
 <20260416-add-bluetooth-t7-vim4-v2-3-9a57098fd055@aliel.fr>
 <c9c3227f-2a46-47b5-963f-e784184f7f31@linaro.org>
Content-Language: en-US
In-Reply-To: <c9c3227f-2a46-47b5-963f-e784184f7f31@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/20/26 10:47 AM, Neil Armstrong wrote:
>> Enable UART C on the Khadas VIM4 board and attach the BCM43438
>>   compatible Bluetooth controller to it. The node configures the RTS/CTS
>> hardware flow control, the associated pinmux, the power supplies
>> (vddao_3v3
>> and vddao_1v8), the 32 kHz LPO clock shared with the wifi32k fixed
>> clock, and the GPIO lines used for host wakeup, device wakeup and
>> shutdown.
>>
>> Remove clocks and clock-names for UART A, as they are defined in DTSI.
> 
> This should be a separate patch.

Thanks for your feedback.
I will then add the remove redundant clocks before that one.

-- 
Best regards,
Ronald
