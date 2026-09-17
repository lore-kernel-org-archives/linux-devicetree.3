Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF964FB9B1
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789649049; cv=none; b=tN7mYD/Oao6K/MepivSgqF+gmJYgLWdxTFM0Im5sPWD6XgG4VMp2VSRrioL+ZuKqc49f5guVufCF0wrwzfbxpfr2vVAOaH5S87lImp2tVEhYPusL7mbkF7kanX9UuIMqlzxOq8e25ePAji4Hdr/A7TGl++40uMlVMWaEt8N0zVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789649049; c=relaxed/simple;
	bh=X++7KAk2FmgKKTdfe031N+A5JegX9n/upfzGbRy0M9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pNwrKrw/Hrcc1Q+OvkmAzJIQzx6BLOJ0Y6lnkNaARdKZSIyXdcNMWPB8Wx5waKfOEtJmIxf8Z7UT4706XJx0evbgeZ+eqZ7e34bFq1vF2IdGvpjhNwbYBCL01VGhaNzWfVXiFglyLFbqOpcOngDFOckfWMU0quzFNvR6sCoYI1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H+K9UVO/; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H+K9UVO/"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa06e51bc3so1385360a12.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789649035; x=1790253835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T7EV5DL8qRH0a/MP26yVs5lc2kWIGglCyt84hDRgCrI=;
        b=H+K9UVO/rzs+TITURqIIFQIdtEsgnkt36Gcksij51sflBHS7pb0Tf0ho02panhb/gi
         ZmyLiNLheYB/+rvei3VN6O4nQmhSHo9RdtPa4J0pUQJd2bos6Ln5ciSUlHHrUS5z4Tsm
         YgdTixm3vBp/N4rxxojEaMQR3D+osNRqIYO2PEDo2KFFT/KdJBsFa4YagcIj0Nctr0iE
         DFg+epZMXHQdT+mH3oPNYFrV3gdIdflt+Tn/2i3Hf/kuGugxLE+gxwUIzjUsLLfScMX+
         rgvYppHKqbhKn3BupkNje3PGrJO/i2BF9S4omEic+GJo7eiH2E3dDw2iowKsaq7E/vFl
         sVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789649035; x=1790253835;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T7EV5DL8qRH0a/MP26yVs5lc2kWIGglCyt84hDRgCrI=;
        b=iI3lx7fZvGPicn5cYaTFNnIp1ChUJeHiExILczsiZybkXkWLNccRBCYtP0muN/t3Ln
         By0IzOWtjAx/VHcMUukqTGBXeRWdY6fghw+47lHRjKvfcY/m5MZNX7qCpiE+i5UwHqIB
         kko9EU9Is/h9m3E9qylJ4LtKE75i9LLGyNaUa9o5iZJUf2hMi2ysIKoifddsrbpjwusa
         q30hIKYxlr6Jq/TsJL2m9CbeGhRYD2fE2x+ByjorOk8OUOs77WrFoBs/L59UVHOHYXfI
         HZiAu32vpSW+r9g72QmT1GcJL6uyFHLTyJaWvgBByHQie4+OTzqd+araM/KZ1jNEEEWd
         MsiA==
X-Forwarded-Encrypted: i=1; AKwUvByHYLwuBPivrmfgwMc9dP6LEBrILwBMwkuz4fZM8LVg0ujmuvIv4IXnU+vPvsRphmNjazhOYIrJ9LJp@vger.kernel.org
X-Gm-Message-State: AFuF++nRBtqvLEUHpgYH58VYsUkaQANjhFfeHfXNtwGeW09lWK1cePIb
	J4mJ/ZmHNAO3bKoxc0SdJBFpsCHtmEL0bvOb3hJWqcP83M6UvP4sTQV+4h5azQv5Od0=
X-Gm-Gg: AYBFou21Fn4YxWGX2HOtbyuh6MOCpX4NRD3wHScyKbmix+IwgGe/mSXc3mQ8HR7XuHk
	HOqbo3V/jDir8vpNkm1gl8YXS60nxgFGdhmO0wSH3e5r++M/x4VmN//7nWwjNCQPWZs8nyhUiIi
	LNS9AcfZ7ryXLQqkXUh5k6Mj1mUvIoAl29QElDVn94x11TZi0mmvn5jVeqkjyz4yb+Hay+pqzn7
	2sLCIxEbe8dXmQdDUahKGoyv/A6/ofTmB6TO9C1LyQbYcSJcZ5g6B5z89AZDyDCWDaS2VyuCeTv
	1WqBfbJkp25F22EuazjST63FJFROvWgYwV3zuiY3CjkTTBEmqNf6wqIby2Znr7P5ryaz9M0DQYm
	gUFmdKFxy7Si+/moeenAb1Fm3aNxee1O7KuOh1wxVMVXgl/Paz5f2onjfdTCTCOIRrnJuS7T1KR
	1bucFMJ8uhyN4Bp3MX7Sv73EAuFCBXJLCrb/fbimMu5xTxoDOtOW19a/eVfPyLAqfQuOYuw13pV
	22x0rIGtvc=
X-Received: by 2002:a05:6402:360d:b0:6a7:ea53:f62c with SMTP id 4fb4d7f45d1cf-6aa2246021dmr5023762a12.43.1789649034670;
        Thu, 17 Sep 2026 05:43:54 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d228baesm3705562a12.9.2026.09.17.05.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:43:54 -0700 (PDT)
Message-ID: <be9f9890-1bca-4f25-9005-faa5a4413e98@linaro.org>
Date: Thu, 17 Sep 2026 13:43:52 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 3/5] phy: core: Add devm_phy_get_by_of_node()
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-0-f85c9103177e@linaro.org>
 <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-3-f85c9103177e@linaro.org>
 <9e8ae55f-6d95-48a9-bef1-ab653d0f1c7d@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <9e8ae55f-6d95-48a9-bef1-ab653d0f1c7d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/09/2026 13:32, Neil Armstrong wrote:
>> +++ b/drivers/phy/phy-core.c
>> @@ -833,7 +833,7 @@ struct phy *phy_get(struct device *dev, const char 
>> *string)
>>       link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
>>       if (!link)
>> -        dev_dbg(dev, "failed to create device link to %s\n",
>> +        dev_err(dev, "failed to create device link to %s\n",
>>               dev_name(phy->dev.parent));
> 
> This change belongs in another patch.

yeah you're right I messed up my rebase ..
