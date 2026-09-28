Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCBE4E9C21
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 15:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790610855; cv=none; b=mpw0II8Uk8+fxFI9/zYbL7Z61VFafUrKqzIbtrttdIZuBJ2QwPeTpkSSNA4UBTfBh0LUikCbNZQpxHWIwu4zQBt+ByNnwUl3yDdSMY5GyfnxvJ0ZMGixxC/yhLT9Qa+RuR4XItvvGPqnvo+ddV8oG7cIHolsTb0ZUV/YpW4W5Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790610855; c=relaxed/simple;
	bh=btGCnFhlcQ9Tjp2kCrPOIBm9c9H5F/PoS4B9XE+7z0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LfqfgOtm6S+Qcz7PGBnyi4/6c1X3AM3c5J++5sGxCMjaq4EcgNg9+QE9fs4xJD6Fi9OUYKPCkkBBcsAVG4pEd/hSqGnmYjqcuGhjoM4U2TxS5/tKr990p5jzE8HHVCUQlYAyQw7RkN7BMojOfacJHDl36Nj/LXP9mE0NqIJuZag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SXEIvKXy; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SXEIvKXy"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dc83so2732993f8f.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 08:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790610850; x=1791215650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NZXqqboH9bZP57KAcRjQkDCBUvfiHeVgKVSx3nYEKBI=;
        b=SXEIvKXyIXNyFGjC9wAfQ0wy7KpcoEEft6qj2cHLHzkCiGslmRG/3MdJuJAd4Cq9FR
         MR6kMsItepCIZ2L5cZwnwFJgaV7Y7mEdsqQqfm9bFETjH5tE0Rvym9wtjWuJwxKMKA0R
         Ics/VBsilEY3UVL8fhPLv7ao9FTAQt5fVmpE0FSIoW7LYDRgdf2vp8fwuA8f1QkZRmIE
         OKDsGnEFRR+5bFfat3vOBfeLWQ+WumxqfImwIH41Ma4PWOOQfGSCTz/hghhCh/mo4b9K
         vrcZ9L++fhIGc0KcglADhiqx/8qkPL/lgvDuZ6fZXQRbNntavrUqMoW4yHhVdqDKXces
         gNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790610850; x=1791215650;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZXqqboH9bZP57KAcRjQkDCBUvfiHeVgKVSx3nYEKBI=;
        b=Vxmwi+zLsyXg/wHwJ0vQGfNuDKDEN7bgYO6YpfysxC+FKFx5c59QO0ioj7CaLEU2Is
         C8+5cPRno/sl37jX8+J7XSP+wwKxuOWQT4LEb2rW4dfyV+8oY9Rb0Zn3iv7tbgpI+38B
         GhMcjSNmoc9EHjibWu6SaQ4VqpMCxdwHI2VP4MeAytEh3V5zZPOOC68vVdr0o3u+KhP5
         XPJg26xR/hAgPIg/oqxOwAzEuPuKbxHpTTrXlhUGI/syhw1AajeVw1js/jrkvTLxso7t
         hz025x7Qho9Z7gU1GBQNbTmfmUSJqoLQHhcfrHkd53xaaD3fKffBYMsnhYGgLnBR15ym
         CsxQ==
X-Forwarded-Encrypted: i=1; AKwUvByAukO20cFD+AnRw7Djmbv8AE56Tr9evVGfFcWlmFghn1+/aOFCWrQ8nvfeaSZc9wyvU9Filceeckz3@vger.kernel.org
X-Gm-Message-State: AFq9FYJrOpzK2ktMtILgqueIvKnOsixWyFNquoSUfS8LP0I8Xn9OIXo0
	T4PARp4hUvjkE0eblMPGHQheqyTDWt9P+git3us1oj6fH8+OWYjeTTkModFs9N0I09s=
X-Gm-Gg: AYBFou14tsXiK9pA7stvFjQqa5+TJfF8DkNNfnP2CupvaWHaEChQl30UCA/Hw/PG6X0
	dXn5/fBctf4mKXl/JFhw/n507evSNAHg5pCUGsshYLWdfLC+tes0M3foZARTLtPbQnLTKJCD8Sd
	iLGPwbkCFcncKJNNq0Ty4ozUj/t8xps1cutNpfumdnxalcEwilFZBxVhpEikhUZB5hccC4QeDIQ
	6rKbDhivtoJVaxeYCoOx93HXCe4lrdgmqy+8WHB2NTGwqmeKaptPKdE3Q9d4ZgQTiZd/mOsqvnJ
	OHDANS6b+Eg4gkzdqxkUmyWKI+NIB+X6un0BBnBqmfswBr+lumGrsLjgHcYYe+S7EN56HsW7tRZ
	4aefnnGEohQSkoG6h6TXSvFYU1GgUggQtirA1mf6ysYbrllfaOmIr2K494huIp7VNb1efx4Rzep
	KDXNdhe6y6YlY/whgVuypEM3zRo9UlpwQAgfUTv2XlZJTNr/fxxkXWaMkEpKFTfO4zk7KAaq5EL
	10RwZny3axTaAJuL/B/8vU=
X-Received: by 2002:a05:6000:2608:b0:488:84ba:ae2e with SMTP id ffacd0b85a97d-48884baaf4emr13756148f8f.0.1790610850114;
        Mon, 28 Sep 2026 08:54:10 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.243.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-489bd7b1df0sm7993153f8f.31.2026.09.28.08.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 08:54:09 -0700 (PDT)
Message-ID: <5c41ef43-a065-46e3-9522-faaf3884b487@linaro.org>
Date: Mon, 28 Sep 2026 16:54:08 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/12] Qualcomm Type-C support for 1st generation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 David Heidelberg <david@ixit.cz>
Cc: Alexey Minnekhanov <alexeymin@minlexx.ru>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, mfd@lists.linux.dev
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <voc4ie6fcegr3thk5n6dib4pkdxmracch4hhgjdih6pxrq2bfm@lq7mx4flowqk>
 <f85cdfb7-b797-4b4b-9937-670c6dfe52c3@ixit.cz>
 <zb3s4fmwx7vu3kcqigensacbgdqoaqnipfn4ntx4dh7ahrfr42@hvdw36dqb3qn>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <zb3s4fmwx7vu3kcqigensacbgdqoaqnipfn4ntx4dh7ahrfr42@hvdw36dqb3qn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/09/2026 17:33, Dmitry Baryshkov wrote:
>>> One major comment. As we see, on SMB2 PMICs parts of the Type-C
>>> functionality are provided by the charger / FG device. I guess that on
>>> SMB5 PMICs we will get the same problem once somebody tries to implement
>>> additional charger features. Would it make sense to rework the PMIC TCPM
>>> driver to be a composite driver, taking several components via the
>>> existing Linux interface?
>> As this gets decided from the QCOM side, I'm fine with whatever suits the
>> hardware best.
> Bryan, as you are a maintainer of the PMIC-TCPM? Would the use of
> components be fine?

I mean maybe. Would it not make more sense to land the TCPM 
functionality and then look into adding charging moving then ?

i.e. finish off adding this piece first

---
bod
