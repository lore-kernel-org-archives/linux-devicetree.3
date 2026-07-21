Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA1944BCAE
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627818; cv=none; b=OuVvAbyikJPNhX1CigVziJ1EJGZYpvJF809jnCn+XUCStpDF851wChF+JR+80XOSmeQAclxj2KFzGUTHcvCd04l3+1xSmfCYt0eKpuFwjVv86LcLMYW92SCsRkQocoCZoH1j5Vh54cLiliJPfxbQcDZSGW99E7KJ682c/lJcSSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627818; c=relaxed/simple;
	bh=Gcg+IT6+eQ9C30qzQD969Z8vRx7pDNkFThBtXNgQK9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oz973PvnZi03Vrq39bWAe5ePqD4AEA9iVHGI8dVFD3krfPuq7v5TDwX94DY8aZTU3u3Hivfhf2lnSC9q7sYp/BDVv7uR9HjlAiQc4cTsO9ycjAQ3yh2uULXNze6/TOTEbD7O2lYNHlbreTaNyNTb95VRsAI6R9g9Xq7ql3dLp10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cmmf0O1e; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cmmf0O1e"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeafa51b5cso1319490e87.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784627815; x=1785232615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PlDMh90wfY4dRTCIsx8e18xxobLQnLayOa3bHMPPBVg=;
        b=Cmmf0O1eSNhDl/dE9SY4jDmIDqiPYr7R+tS5sgvK/g1aSqN/26uT3AEIbZzkEGpjQA
         F6sN4R53AGiZqpKnAw4tLbqMxkN2NIBacTVMhWh8YU4JhPK5J9h8XIpYq5jbM4xDKzh1
         AjNjR927d7QxAqkwoXILDOejvM/WnL2VWRcaRmxH2R/+ZFikP/L2xERSZpFqWbwuUtvM
         TgTspazMSFtakWNTK8sjXnFNmj+yd2PP+30h5EuZdHRNnxzAweOUO5t9ovBHABkWU/8Z
         j9VDgmH3BktogVsmW9VJs6mbFLitWb3XnyHh8bYDGkIyPNiPa+nXO1xEd1n4YU2tmXdJ
         lrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627815; x=1785232615;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PlDMh90wfY4dRTCIsx8e18xxobLQnLayOa3bHMPPBVg=;
        b=kWHLJjz4pNJlW32Frjk1A5zm/X7ZdZLNLAJWxNFmbb6HWvk0B3UYOt594w0wHU4JaJ
         tOxtnkdciM5t2WyeE4AQk+I/wyre5BrkzOZ4uSCpoTkYQR/wu5azIWQ10LoGltpy1J2B
         Jl8Y7jH2whlsaTDwQ0bDgeWZOPzw0ZBLGE3MGkxrRGJleHwjZvJTJhhDq/EEiAk1m3r3
         BBaMWtxlIE3VQHOvXvyrJ9cJUzdsXF0lsal3MwdcBg7dniYUR4i1Vz0Avxy1/ocV06vN
         0uiviokoRVUX0Mi1mCp2DvoljsDOfDoviK7ozDQP99HrwxVAHtV3ge8fVFmOXgg84VEx
         VaYg==
X-Forwarded-Encrypted: i=1; AHgh+RrlxR/Z9q9NbUYR/PvX+WgeN3QP0puY5kTVf3Gz+iLYZEuEUhWwYgy6RqzIRWsP6hnPa5BPlGmvXyJ9@vger.kernel.org
X-Gm-Message-State: AOJu0YyYncUgKzFV/9qz1wcqPm3By8g9/N1I37qzdv7hw+aJgJsY4nHW
	uePP2LxfrRAihi2cTtDzXrwhc4cNIvIlyKcbMhB2zgfRDKsljtCUKpVzgk+o05fzbsE=
X-Gm-Gg: AR+sD12OGu5KI1SriE/FnjWkUNDa/d/KxlIT9gTKycBY1868/BlWdd8e2440wicBXJw
	aDDQRPbQQyxemQlsLNBBIyWSpspGtGqkAKrL8LYxyfpkZ7uQXQqcqDUNtKeUEO9M0EAI5u5i6D5
	i63AeszBuT0IRft3y8S7UIrRHsi92O9SrKIeG+LqAXoT1zZ8p4W9jKipatubIFZhH/Ev5Uqhxj3
	LN2fVwmASa+8Y3qQlPR8Kaora7V7Gi0v2QepVp8CiIrQQOqqDGFSO6rSKEVLYU1MjX3ezeO7u8l
	WCLU8jq6QHxg1+K4F2ACK/qzOczhWVeSh9uFOL5F1Y1shtAM39rxaMFjaQ8sJk8xIHwtCP4Qf7H
	iXxxgmKvzfOTO9NdIQTn/+xZRRvydXXeA09EOtsFfRMfZoPIWicTo3hEZYPkyZrOr/xaj+7ltJ4
	QC6va54YB+kz7eUIBSuUK8w2mbGVdildNDVlxB4+C0zdCIJ9L3zyM2Ro4H
X-Received: by 2002:a05:6512:3b98:b0:5ae:c5b2:9cbd with SMTP id 2adb3069b0e04-5b2a4a7e164mr328522e87.4.1784627814976;
        Tue, 21 Jul 2026 02:56:54 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e18811sm2797516e87.60.2026.07.21.02.56.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 02:56:54 -0700 (PDT)
Message-ID: <345ca98e-09f6-4965-87bb-e64dac096498@linaro.org>
Date: Tue, 21 Jul 2026 12:56:53 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
To: Bryan O'Donoghue <bod@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org>
 <20260720-x1e-csi2-phy-v13-1-160c31958863@linaro.org>
 <LyWJAb2qKsAFTMHNJUce9VqoqbkFKUQanb6z8ziA63RYZ1P9jj1XpA83uGPvz9m4QnWvEjJFK8dGD_8EtioHVQ==@protonmail.internalid>
 <0da6d314-bfa9-493a-bcc6-8c3b75751d0c@linaro.org>
 <88ae6662-cb85-4e3a-bbb5-1b536348df34@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <88ae6662-cb85-4e3a-bbb5-1b536348df34@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/26 12:39, Bryan O'Donoghue wrote:
> On 21/07/2026 09:17, Vladimir Zapolskiy wrote:
>>> +  "#phy-cells":
>>> +    const: 1
>>> +    description:
>>> +      The single cell specifies the PHY operating mode.
>> This has been reported before, #phy-cells shall be 0, the operation
>> mode is selected by bus-type of endpoints as it is described in
>> video-interfaces.yaml
>>
>> Two competing values are redundant and it opens a door to a wrong
>> hardware description, the technical discussion has not been started yet.
> 
> So as I said before, I'm following Rob Herring's input on this and
> Krzysztof has given RB for this binding. At this stage, I don't see
> scope to change it.
> 
> Adding endpoints was already a compromise to address your feedback,
> which I hoped would bring you on board with the design.

That's my comment dated March 27, 2026, and it says moving phy type
from phy cell to the endpoint property excludes the need to set any
phy cells:

https://lore.kernel.org/linux-arm-msm/e37ce438-12c7-462d-b2bc-1351be62b806@linaro.org/

The technical comment is left unresponded so far since then.

Since there is no expected phy cells to get on consumer's side, and
since there is another link between CSIPHY and CSID described in
video-interfaces.yaml, any kind of dependency of this IP on phy can
be just removed, which serves the purpose of hardware description
simplification.

> 
> There are several SoC bindings as well as new CPHY features which are
> gated on these changes.
> 
> Vinod, Kishon I'd request to merge the changes as-is.
> 

-- 
Best wishes,
Vladimir
