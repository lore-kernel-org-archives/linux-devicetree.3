Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B4E47F2FD
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491470; cv=none; b=atpoMfTFTtnMi+4xuDLTnGN4KOwETYSoiEk+attwDn+ptrV06sF8EEGYzSC+UK+MfmNv9l8M8iFyrfxYWRnDLBKeeXviZCMd6CCGVVdziJNXmr9x2h6Jq20Qu+zNDgBYBmDjXxk8uwzc68INKTG2GjtF2s3tlJR5LfWy19JPUbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491470; c=relaxed/simple;
	bh=vUeXSaHLUxfrAP6wWj0TpMgOgk9qoWtX5OmAgms/TCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zxv0+s1RpyPA/zathwzCcwyxSIpkhIixpjzJnITcgT08F0aApe5hE9a3rywk/utV2YX6Bg3Yl8aMsiRQqeVlqV+NBVwETGHsrIhVamrxyPs+HGxxhEwHjKCNRuuO+fHGUHBur15J4GKlc5zmKfmGbPOGJ1ycDAcCxXXsfPmrMHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i1VrJ7h8; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i1VrJ7h8"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-68d2342c5e6so5652241a12.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 05:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780491467; x=1781096267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AA8bcGrflv3zc6PRP3K/cb0tnkGVq1FBamekCJeKaGA=;
        b=i1VrJ7h80fV7fSOBlXAnfdJuY+2fsGyyf/tJ0+12SfuTR/gMcK17mObitwToDy01fU
         Ei2Omm8OTgi78nLT9S2pkawz7CVhjmQBfknrM4slQC2vGgfjr//yal6FSG/86aOB+Oub
         Gj22c0DfOBfcxv+81899+FcaWybl7jwULfWw0E2ndxzzzHcNF093Ef5sa1Jk9W9p26uC
         D8GGxUuRVUmAaCcc8SzYfo9CneC6prHxoRCTm7Qu+Is1H3mlHN2vA0C3gNHpenuoHuDP
         w4H0NNTWwh0VW3ZjH1R1E+GP91KsOVhAcaXkItkWWQ+KbRidt3GYsRpKufSPgYiGCLpy
         oF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491467; x=1781096267;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AA8bcGrflv3zc6PRP3K/cb0tnkGVq1FBamekCJeKaGA=;
        b=JAuH1eV3uZe/paFlE2CN29IhQgX4yEuvUlchNx/wSe1HCBQ4x67CL3dn5ESGutdsL6
         Rjw8n4tABHxRKqg36QbpcmMoXFyyFL0TgrRHWThOM+bFJ+hakAhSTQDVYGqep8sSPka/
         WtJ4wlFcZxICa74ZKB6GOeuSZO5DFoPsKvfqG3KQHmy5+5+cHsttSpwTG1gkSeOUVMog
         2vYQoiyuFvfroUdq+CupewDP197p5WO9bTJ8LFvbHb301pE6HKAxebjHqr3eOr8brB3g
         E1WILoq87I1pbvqpIuLUh2b4tjh2NTlr40sdH3Ec7M8w6wThwQ11MlYhiTq/s9YnagF7
         3zuw==
X-Forwarded-Encrypted: i=1; AFNElJ8p+jct1GcCX/4FUBUymiGzpM83NC8fvJVxQMUJ/Ssfm5H0Yvk87prKeifeQc5kVA/sh9rE3rGCBVDV@vger.kernel.org
X-Gm-Message-State: AOJu0YwHu0pYmhBToFfdPj8ptvSg5msy2UzS2y1Ee/CasqmL5v8s2M+N
	V8x30jddcmIsSY4OgMQpSnGgQ/Pe0oGRJ6corjBoTkfdPWJWJrfGIPDHdM8xx1Cjcio=
X-Gm-Gg: Acq92OG1l2xlL7+yth+hiQSexKI7dDviXuUGHevZ4RSxLcWdAdoePs357qgTRjnXFUl
	16svBd7q2D4YoLGJnoFUTPHO7HsYYYn2MqhOUAFjAY7IY5PCgvk/ckcRsuemzy73UNPJqcSXoVa
	WY2tkpVyyq0xYvgdrAVdKENMrXJmDq7PqVsE+D51/lkwvvQRQC5DbX79y+H9yWBgn84VfxKwjXe
	IhfOqHS6YOSrV6NyIshsXsf+TduC/RgABydqTZ2JRdtcAFpOMJ+agURVX4f2Lz8/iACVVrMyZB+
	0Mx43c9eOVnGqnxOSl62BuAn3n19VUwHl1BGRxgtxJbbhJmhYgFfjTMWNwC9o99PUfV5GAfh3A9
	DrOzj3olLfOpHfsGp+o7pyIhN+sdg4pSfykGTGOR/zb7ACsmTCiN2pA74TCtGaYsy+eQ5xPJiHe
	gAW7y355Mbff0pzaIc/u52+UMwvp7ADDHjJBeAlYbhCMDMpQ==
X-Received: by 2002:a05:6402:5242:b0:684:32ec:2332 with SMTP id 4fb4d7f45d1cf-68e6f4b5a53mr1709091a12.2.1780491467112;
        Wed, 03 Jun 2026 05:57:47 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.42.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65851786sm1107720a12.17.2026.06.03.05.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 05:57:46 -0700 (PDT)
Message-ID: <8eb709ce-3469-4303-9c3d-8d1a221cb8de@linaro.org>
Date: Wed, 3 Jun 2026 13:57:44 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Bryan O'Donoghue
 <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
 <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
 <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
 <c6aetoiz3dcedlxwjmt5cqh2mngswtmanf6p4s2molemnviwdc@btotpaqwcsoy>
 <f6c91099-0002-4580-a5e8-5611b089024b@linaro.org>
 <v4vz7cistjb2iuzha4oykglar7duw4y2uuyhumzs33yvpwrxcu@i5tsg4uzpuwc>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <v4vz7cistjb2iuzha4oykglar7duw4y2uuyhumzs33yvpwrxcu@i5tsg4uzpuwc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2026 13:40, Dmitry Baryshkov wrote:
>> Are you sure about that ?
> Yes.
> 
>> ipcat I thought designated lane 7 specifically as clk-lane i.e. named it
>> CLK_LN of some description.
> Split configurations explicitly use other lanes for clocks. E.g. check
> the RB5 Navigation schematics, CAM0B connector.

Can you please check:

CSI_3PHASE_COMMON.CSI_COMMON_CTRL5

0 LN0_PWRDN_B Lane 0
...
7 LNCK_PWRDN_B Clock Lane

... just a badly name field

CSI_2PHASE_CTRL10

Bit[2] = IS_CLKLANE

Right so CSI_2PHASE_CTRL10 controls lane mode, indeed. Thanks for checking.

---
bod
