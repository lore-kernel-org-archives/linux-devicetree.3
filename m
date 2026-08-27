Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716413C378D
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 08:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787819005; cv=none; b=CVcbRqAPxFYS+kE0A//Jp8fTGQvYeqUKHqo59Sx4ubKyrPmSjE4mjoZ/As7830XnCte4GbUZPSjS/D/FmKdAQE3Y/BjC7iWGw+7FXa2PGHk3Y4MxTuX0J8N5wS1oAdRFcG1FjPzZKnqsFqZvBNDfr84FEjMAGAm0JNRIZwFzW9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787819005; c=relaxed/simple;
	bh=WPX0/BZ5LnEVrTPcPtmV68GfdYM6tPz4FQHz8zmVGXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gnGlEjmfHHt9mOdMJVc20mxP3mnncpUMtLJIzgnHwIMR/spMHJuYOFZRkFkJxavPLCgeewU5s6f9nCwJi5jqP/cIkrxt6qmujWGmNFTNJ4oKKP3a6gYAkgDgSRNQ0q7Mc0n1v6zceo0yNx42cOzaLdlQNns1+e0lfmHKQ1D35w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDQrguZ3; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDQrguZ3"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47fecbb7000so832554f8f.2
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 01:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787819003; x=1788423803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCTHlFI9MBXTpjo0eWsv2vQlQ5fLMpFKRDETi0QkNLM=;
        b=gDQrguZ3GbygbvSTSsbzOtdcDAZ/KmZ5QpeK0A0GJd92eCwnyEpTX/n7DykR5/EMRG
         Do8E3XWkes0pQRMXViSHKRmqpVePXr3bC4zHHlg5Ca0sBusFMyTZMeEunbnUzUsKbZAT
         UEEMBBYryLKIQTkkkoqCfB/e7uEnWUH3SZGLbxkaJZvT7lsgmfoYdADIPILIzvrsrE+h
         F+/ZI7HTMWnDuTV/h1Taf/z3/PHm/BRYR4TZN940zEqJYqiQJe9f3VBepfxoFyvSAA/g
         TAQuMhaaZOIdFOlatEXzjKk/aDp78x3HxhpqQ5a5nRDx+w1Y4k21OcJsYqRvCjMJw/ee
         Q18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787819003; x=1788423803;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCTHlFI9MBXTpjo0eWsv2vQlQ5fLMpFKRDETi0QkNLM=;
        b=aoWB0HeTG5vQGPzPDiHXlifi4/NNcoNi80XZaTaHoleWs6YPpvan2zb5HRXG7PLnjr
         DlQeoIZEs7YYlNSmtCu92fb8UUiVCYvnvDd/Pxe/J8/qtnm63FrwWAH3vsy3l7Ulww9W
         +3j1poBxEqsgNTLkv3t5Ka7eNZB01ujUDGxfWKhygCjA6iZ1XiiRYvwiwgSuF5Dk3QLb
         RKMoxjZbuEoTLEyKyC8h1xwfTEkEQgug/H4HWtUmE32dzfZPnO8OC9rMWWo8lJcuFMmg
         RGzcYoGoeULzlX1xWEhYu/BDB5phBMPxDzrZGoYAgonXelNq4lCSBdwfyVM5lZXb1cbE
         vrKQ==
X-Forwarded-Encrypted: i=1; AHgh+RoSIHb8EdG4zzpMNLjaZDfFdEV2q2/InUehQ4ZyT/daGn+dS+Lx4pSYkEge+G8O/MMDYX/pdxFpSAju@vger.kernel.org
X-Gm-Message-State: AFuF++ldgvyflHl07VLabc+eiOsIh1l+OJnhR3HuyalQdKVYl5jOMu/W
	hCAnvRiy4KHwEti/adHUlsZevlwJgMlKnlwvbNJtVOqPQMoFAYAc66N7
X-Gm-Gg: AR+sD13JFkkoBk/FbO1M9kucNMg+IUGBMVCjzQZ8dvpjGQbj5PffLTaSc2YD5V50ZR6
	RcpGPhqvrG8UOERx8p/iGNJKESJjRokwa8FlnfyrSRCX8Mgyqzz2979kiM3xkFYSP4xFsO1llju
	lkqfVU2fw0QwqhmJItroCQXPi/6InVPj9S0YSChVMT2M0g25DeS8+5D7HSubvTmqLOnY+oqihxm
	RDkN56HGnhOV82brHY4J7P1R0zM2iFqMR9hV6X2urK925Xo6jWziMKdZh0O1msCwm0QeH8Jau4+
	qWwSV6NkfjHZTZQmi++NrfABdx+b0iI7libeuSp03LzqkLTXvOOdqTz2CN7v9nuzzWyxvGgB7KU
	Udi7IYNjfnmzvgMV63Vn/5EcEHsF5WnOQDI4f09VOxp+SiiOmxv9v+shkPS3CmbHAPV3YxHJUkx
	V5lHCdra2klI2wmK9T/HHkYojjh8kYrck2mEX/f4Gw5pWVxZfeUk+7K0dhmXyUFbzyfI2zekfp5
	4ZrLck6jEihj3Nj
X-Received: by 2002:a05:600c:3155:b0:499:4892:d022 with SMTP id 5b1f17b1804b1-499dc6feffcmr116979315e9.8.1787819002485;
        Thu, 27 Aug 2026 01:23:22 -0700 (PDT)
Received: from [10.51.121.166] ([193.118.38.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab4dasm7350450f8f.15.2026.08.27.01.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:23:21 -0700 (PDT)
Message-ID: <c53ce2d5-4674-4bda-9e92-fb4fbdc32da8@gmail.com>
Date: Thu, 27 Aug 2026 10:23:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: Add GPIO-locked fixed clock
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260726-feature-clock-guard-v4-0-e9c8b372b71c@bruker.com>
 <20260726-feature-clock-guard-v4-1-e9c8b372b71c@bruker.com>
 <20260810164000.GA1846263-robh@kernel.org>
 <20260810165403.GA2145873-robh@kernel.org>
 <20260810-smilingly-kung-1fddc5e18df6@spud>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <20260810-smilingly-kung-1fddc5e18df6@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.08.2026 18:58, Conor Dooley wrote:
> On Mon, Aug 10, 2026 at 11:54:03AM -0500, Rob Herring wrote:
>> On Mon, Aug 10, 2026 at 11:40:00AM -0500, Rob Herring wrote:
>>
>> I missed that this is N input clocks and 1 output clock. But that leads
>> to other questions. You've implemented a clock mux then? I still don't
>> understand for what h/w that makes sense. Which input clock is selected?
>> The locked one?
> 
> Yeah, I thought this was n inputs and n outputs, with each gpio
> signalling that an individual PLL had locked.


It is n input clocks and 1 output clock. It is kind of a mux, but the 
CPU doesn't control the clocks or GPIO signals. The whole idea is that 
peripherals check the output clock, when it's locked that means _all_ 
the clocks are locked and GPIOs are in expected state. That's why the 
selection operation is not really implemented.

Actually the number of input clocks don't have to correspond to the 
number of the GPIOs, because the GPIO signals indicate the locked state 
of the clocks that are not accessible to the CPU.

Slava
