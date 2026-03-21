Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4709279DA6
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 21:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774130092; cv=none; b=qNBHmPyx+Qyxw3hqxn+xM2uFT0E7DKnLJybm4Uxcn76jLZ+Dtjz7CTrp25VGFikYOXdS360HoK8KU2Y24qrJBzu4vjNt05CxKxHeFlylSyXt2DOKk7RgA9DZci100laXOskDMn8+zPQA/uotGJFmtMZToJUefJzoJ4vrYQPQIT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774130092; c=relaxed/simple;
	bh=zytReODt+wWI+R2U3KRLzpb6j/vWNtuVQLp+zorDKiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E4q526QJ6WRAbehPnAxWnDlXxo0xZioV0tvMTZjtCD32DjQ08vVl3+vP6YPgYjzXp4+0JW1mhvF+McC13VjHkVilSxC1/gt7dczZ4LIxL6ol9u9JLZ5acdJIsQ1gkgpKSHoGNoVS0Sa/ioIy6j08nR7G47nR0br9GQlr7CfPydg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jRjvjkQ5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jRjvjkQ5"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so21614945e9.0
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 14:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774130089; x=1774734889; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hJY0CaBiHi95RQbZ6IsRt49BnUeTTxWSTjwF1oFthmk=;
        b=jRjvjkQ5uwS4HNL7u1894cvBlKkCGqwXyHd+Ni5U8eeFZOQfnJCheq2mdSgkPYmuMU
         5OvxDcmxh8U0RNaFfKupLUPGElK9Y0jW7dNfNUDAM25rRdhaVOH00K6prCR16iVCXzbK
         Yr7e0VHwl4a4pQhmYt8obsJz4kZAb9G2Cy6YFIZv4s8WCKqDGP0I9VokcAgbYURFwmcA
         eY6GBnISIOMwbe/E2z6PUaRG0HHBzptS6P7Y8vHDr3W9l/CdUFMncE1noHPfI+wmx2OS
         IhZjJnUqGbNfdY8l+LOVxj7MSnaq/qaqG+ycrzWWCvtAFngCm6GBnJUTf44ZZyPCewJC
         pPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774130089; x=1774734889;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hJY0CaBiHi95RQbZ6IsRt49BnUeTTxWSTjwF1oFthmk=;
        b=B3R5yQcLSZFZxoYJdsesv5FlqBA3f5QTLXO2rVeCrvqgCOuVcMU/+mxrpgbG+kMfi/
         A81RgyiZkuNGt6hj4ZsQP9ip8X4NozV2EFmkWLjXQZiF5nlk2h37xzVHV1ai6jsD53KW
         Id+vLOiuN7oYFNyYoaemU+dnpzPfWuoU7koqpeo89QlGquTeAQ47GCT41tee5k/d1qTh
         Kuf83jKdaPmBVg6xjKchz5nyCxP1CJKb4el069HefDLfkUIrK3tgMhoNzc+GGJMsW0Tm
         cHVL4y7T9oRJyxPAi7fUFFpOU3XVapI8Wa0qZ0Zd/c1DiE1Cqav0o68WKUd15sAnaNjT
         bPXg==
X-Forwarded-Encrypted: i=1; AJvYcCU6UDbEHh7SM8ogWtli0+jfq0XhEI3vCMLpcmOLc7r26S8kGbv9xL8NghGiiYfvmb/Unhnwf6zepFn+@vger.kernel.org
X-Gm-Message-State: AOJu0YxfrK6gpyGuW3XAzupLN3bwy5ta2m495Au80XpPemekQ2yj+NX+
	1LS2BBigH7L/AFVUxNudIRdGk4n/L/rH/gzSGGAHRhENAcdenG+qanjYMBYTzEoXhlY=
X-Gm-Gg: ATEYQzwkwub6HnyZELUslflYOUDHTkzUCMuw1AM2aAx9mEJGErnoTRXeOE1xyed/T1N
	8KC9uZu2N0c7OWfSgQ9LvRthVZpteDWQZQASHac3p91J8JRybSFA7RrC5OJX0999tjvQ2gZJPGe
	S3C9Z7JOGaIVzSB1fjMQlvFJZZLxa/apjIuEwWSYwW4LSS8YO9VBosNqecEwAW0DGDBWqoOjG0M
	UqwI59MbFC04HrAe22tZR0B4/5bTOf6ly3eibbynEQG7JtQOSrWEB0JY2PmCqAE98IQesi1CWBD
	AesMhYaQpLho+tt/vVW6bueikXEnMmQZpmvEi4VcITWAYwdLlzMUlqBUzjwN2iob4iUGJHIjfnj
	JhwdvniXrxhXM18p/Gp+HYcFyaDIu+Zx5E2okuJ6Yt6u1gjjaZCUASBrPAQL1YDYDfadOdVBVaL
	Z03cj6eiMmIudC7npAhG4BPANr5QjG7in0WEjZ/DduHXBx
X-Received: by 2002:a05:600c:3b1e:b0:483:8062:b43 with SMTP id 5b1f17b1804b1-486fee05925mr100751135e9.19.1774130089272;
        Sat, 21 Mar 2026 14:54:49 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.29.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff19d393sm47555525e9.16.2026.03.21.14.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 14:54:48 -0700 (PDT)
Message-ID: <fc1ff1de-2ca4-43aa-9def-4d5f78d6d7a0@linaro.org>
Date: Sat, 21 Mar 2026 21:54:47 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add l7b_2p8 voltage regulator for RGB camera
To: Tobias Heider <tobias.heider@canonical.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
References: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org>
 <20260316-x1e-camss-csi2-phy-dtsi-v2-9-859f3fa55790@linaro.org>
 <CAARv3RSQbAQwDFsfBrcrkXem_jtVy0Xttqi1UZfuNT86twxmJw@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAARv3RSQbAQwDFsfBrcrkXem_jtVy0Xttqi1UZfuNT86twxmJw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/03/2026 11:10, Tobias Heider wrote:
> I included this in my Ubuntu test kernel builds and got reports about
> reboot loops
> on the Lenovo Yoga Slim 7x.
> 
> Your change seems to be based on
> https://github.com/alexVinarskis/linux/commit/ 
> a94d1f4e1d025398060d7e0dc2270b8e375f6f60
> which I had previously tested too and didn't see any issues with.
> The only difference is that your version uses different
> regulator-min-microvolt and
> regulator-max-microvolt values (3072000 vs 2800000).
> 
> Setting them to 2800000 like in Aleksandrs patch seems to fix the boot issue.
> 
>> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +               };
>> +

Thank you for investigating this on real hardware.

I choose to stick to the regulator values apparent on the adjacent - but 
apparently 2.8 is the right value.

Debug appreciated.

---
bod
