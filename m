Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794360444;
	b=XQEHCLFTceoxddjvcmAfWh/MwsnZliVMwvLtyGxTsc2+9gXjWekUdsXzeom7+b0TU52N
	 u0ZLPJ8XXsOPrR/W4eTjV6fiDLeeTnFJNhwypdqfgIzVFFv7SiiH/aPYOA49LjNbT0Z8k
	 K9TDcDRrvn23+oDIq76sGpomJkHuSuIU54XIYnAi4AyCgKkV3Da4u57wZeB0K3BAY/lkc
	 DYyL10oElB+PDovK4B0E/NmAHiP6LQpZZ9tD2GO0O+lFFYlLLnbJlJv0qu8v0+jkx42/t
	 Gz1Zf1kbvUJDJoVmie7W/USDMDnbodQZRJLN/xe3RQ5tMFGglAAJFn2L4wW+HjgUuLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794360444;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=BLSB0jc+PDfoGDhBATE5rNyu65P6DKBdBa7UuDK+sb4=;
	b=UiQohn4gj4ndDMB5agcm1CO8RZyG8D3ecQwdDbNoaJqs3epmW7hid6ykDWteT8tsAbpA
	 xjeL4NjAzkbo8YdwEwazK80U5x/YhWYaILmu6cK+lCgCLeMIjiwivKWqw9v7BHFvUrug/
	 hLlpPB8x0KL9/1DwF5ZLSq+lB5YGJ9lyxqftFl2sZu/NkRpCzBPNu6H2rfWS5MnnaZyP6
	 x2qqeJ2RQVxwLCEVMc41S3fpxb9WqxrB7tmyOSe6s+9w86rMd2Smg60HLD+fL6A6NGYr9
	 1lbFZ2X/rJ6sX4lCL/CcMJXE214xYGueqkn0H96NYUdWqbgQ4bjQtaOHOoTN4SdLmwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB677606A326
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 01:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB677606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so5288178eec.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 17:27:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794360443; x=1794965243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BLSB0jc+PDfoGDhBATE5rNyu65P6DKBdBa7UuDK+sb4=;
        b=jpm7biyFdOv7DEkPA26nx84WpDRt1RTrjqT3jQbuTMgVP/xMtfBmHciMvvnPaJMzre
         UKnBdpm+0eDM5aG3yy3XBM0XLPebAZ9tOGEusnbkD26+APDmUvqKvw+lMobD0vhP9Z6a
         HBuax1CbWLJ2WleVpQWGjGime30HpgKv+78imu0Ttx4tYCIK6G9AKv9Yf54fmTan3/F8
         z1+3KMkta+bx3qwkQLyGOkz0rcpEdQsYNpmf+SNLSRdYJIdiO6L9JbES9PQtNZjV4IuH
         NHZxgbbDSP6cPx6PMYqAqN472LaCd9zrVc+gsb+3OWWiGAQjVB/cWS7UflurLHEU9D1t
         MPAQ==
X-Forwarded-Encrypted: i=1; AL+hErHMUXtxTS5ex1gRMBuZgb9lv6fNlcKDSEnTO7s6cY4i0Lg1UMWBxOh2Ffz7UB19aig+et96pAPgav3Z@vger.kernel.org
X-Gm-Message-State: APuU4Z/rsNOWKnIatQagKM2FaZcOFoq7+M5cpeYADWyEXs9XjA510CQR
	/t7LHwxCFp6NUB0Q6G2yxJsoihQyMj703p++X8aIZzS6SM06M82prWX9
X-Gm-Gg: AYBFou31TkXL3K/he80ARz3XbziyyjTWxU4wYlGpsI6BRZ7hKILdUnlH96VdBOLzmPh
	dW6oLcuCUKNzz/vdo4uEYXBT3OTcWGZ3L/LNQJxorqdonJ50lKmSajqZQlep9SIrk1dAIw6iV8o
	Xi1IDK+O/Pfi1p2vU7acVtMd/CDJBTDxynHSPipPvaqx0+2QfsiFfnSdo6KZXmFACnvqlpXHXnm
	e+F1HUbkf8fmpm8zkgH1znlbym/jdNeJk5Th3VxdwtVDl5dvMJsrsBkmZyoIh728YRVqnGYWlgC
	4ooFt7ckaUBjzpCAPK4icbMPeJOwkarzEabTP5/UzQ9lq+AY4hbNXRVGSMRSKJDCyRCpFg9n+2w
	iS5oBsSnKZNA5yzn7W5jihsGRQ67wmcu+Wl541ZDwQF1i/fa//UvSIsUYRfKfxkFSFVYNX1BIzU
	ZOzawxybgx4xnMR81Xr2OJuxrzTPp2arqOnDdyaqfzUp9HLshKE4nrJVm37ibtZA7J86hThmxTi
	gbBuP0YDHl+Wh/Viru7GJJSVgm4v0ZKE7mhmPKjBtPPFb05iOVZ9VcutsxmpfB5aN82qSVZPn14
	YNIg5EeqvqbOiFl5Q/mRMCpFHtUrTkQk8QYjN5e35mGQtBnfJWOTzkR35EslW79JCWy9+7+H
X-Received: by 2002:a05:693c:8219:b0:36a:1008:5815 with SMTP id 5a478bee46e88-3768385dee6mr1611656eec.5.1794360442766;
        Tue, 10 Nov 2026 17:27:22 -0800 (PST)
Received: from ?IPV6:2800:a4:806:ef00:2f77:7097:372d:6d14? ([2800:a4:806:ef00:2f77:7097:372d:6d14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm16548467eec.22.2026.11.10.17.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 17:27:22 -0800 (PST)
Message-ID: <9988b8c2-547e-405a-9c76-a4e6a59c7dbb@andrewgigena.dev>
Date: Wed, 11 Nov 2026 01:27:15 +0000
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
Subject: Re: [PATCH v3 5/7] media: qcom: camss: Add support for SM8150
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-5-0103e8a0bbcd@andrewgigena.dev>
 <160aa94c-c726-4cfe-b8cc-b1f974b32f13@linaro.org>
Content-Language: en-US
From: Andrew Gigena <mail@andrewgigena.dev>
In-Reply-To: <160aa94c-c726-4cfe-b8cc-b1f974b32f13@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Vladimir,

> Drop csiphy_res_sm8150[], and pull this:
>
> * https://lore.kernel.org/all/20261026224957.1115370-4-vz@kernel.org/

Done in v4: csiphy_res_sm8150[] is gone and sm8150_resources.csiphy_res
is NULL, so SM8150 goes through the PHY-API path and clocks, regulators,
registers and interrupts are owned by the dedicated CSI2 PHY driver.

I folded your change into this patch instead of carrying it as a
separate commit, and credited you with

  Co-developed-by: Vladimir Zapolskiy <vz@kernel.org>
  Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

ahead of my own Signed-off-by, plus a line in the changelog saying the
fallback comes from your patch. If you would rather have it as a
separate commit, or want the attribution worded differently, tell me and
I will adjust before resending. I am not enterely sure if this is the
correct way to cherry-pick commits since this is my first kernel contribution.


Best regards,
Andrew
