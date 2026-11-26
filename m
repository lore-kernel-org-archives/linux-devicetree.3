Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672336;
	b=Pik7gnQp7DZJ+unszFNS4DV4a7K4mpRSWF6El6fSJT268NG7dXHnA+M8k5dKvxEUBrji
	 LHTGXtMa8qjucpT6ht9UVcr5fqJr+zxpul65NFahD8GsD828Wwbpv+WoFVDbORLUrc35a
	 z0ULVpWnow9CdjcAH3fPeS4HNg+SH/emWEIyHN/Paq1Ov2GXTi8EW44GHnqOxV2rngE3S
	 0YLOiPcqtFFdi4JFWq4MA3qpbWD7q0Z9uYegS2OL6PliKtE+ewg57KRFeotZqXdY0iU2N
	 QlE+OCc798EXTOrFFTU7kqqcsdlID/RNxsJZRV36XV0oHuEFkjOvIAV0u0UDgjZVGDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=CZPWEk037QWIcnrjW4FwU0aU2BDmAlHR+95YsRtbxp0=;
	b=STqAWK4uKLOB7ZFXbLlHcC9mt/F7fCDselgpBPmpsIFD33TT2wwEno/7teOEN2tqAstM
	 Ztea+L8xkO+GX8lUD+8K/Xk9DHqo+C5PmBMNO3djM7qIC2hPLp5D0qKOH36+INttWfKWH
	 J2SNaPdXGtznnbDCR4MCJ30/HR/CmAThUHFqVTIUURpk6PabXrNIGkzhaivRU+eFcnIhc
	 Nwo1yeTnH0cEYybXGDROjcY3iRmHRZBuh2XsEnJsrgjuPNy1GL7UsPzKmidn05jswV11H
	 9QEsGhdikdd8v8gH1DyiKM5+51ipjPan5JvZ2kYQB7LRbRiy+cWiS2w5HATNvr38yoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Vp6h4G7h;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B515A606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B515A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Vp6h4G7h
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c00b0866b0so381300e87.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 21:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795672334; x=1796277134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CZPWEk037QWIcnrjW4FwU0aU2BDmAlHR+95YsRtbxp0=;
        b=Vp6h4G7hpleX+FTb7fdJNRAUYd9jz4lCrh33wMt0Ysn5Nb2Xo1Zb1+kzJAUVK7M5YB
         tzwbvxW6rKNBTKwTsrFX6mUrY9wdUCBJPrDzpBluNzFfe+x0SzxpDd7g2z+1OUc7Osxz
         uEIu5Xt+UxUDEqs5lNqsReLPF3kyI+cUNMjCtVEpEL3TvMV5sjx43V662aDloiIrM26H
         TxMW/fWmkaBqAlyrH0tDhiQQ6TXOAv0/7qWniaGnVMQPuWrv2jbIZ1+opl8j3/zzSJ7d
         R+f8ajGcN4IcmH5VH5PoeMz8OGFMF3xInqI+yNfUC/EWj2pL7DZx/tLkPlZXPn23Ic/6
         qjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672334; x=1796277134;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZPWEk037QWIcnrjW4FwU0aU2BDmAlHR+95YsRtbxp0=;
        b=pdE0f6AlZqdGttbf70r8PxfGTAqpXiwWG8NxopJnihjxRBon3QwegNfC3GYVONUldo
         X81h9QvRH8Dat7SEI355qPuGuDFmtZ49aaaWc8wcxx1k85NxXE9k78MMMF30huys5fl5
         bcFjOG+hEj53EM3OYvlyt0DOQc0fwmotHVoZmRS4sCyg305QcwYeIWsYZvzQAVA6/AGC
         HAkHmnhzQobggn67M5KSl6dQ9W0ffUwcSNPidn7kkPRgngYDxAfN+ybyE1+PmMqoDPY7
         cV8bmjmBiSCXai4DH5HP78HieSpimHpPm9b5h1/g9Z93hQrrhWbirs0LsnZSGBeuEVnw
         6vdQ==
X-Forwarded-Encrypted: i=1; AL+hErE/mc3Hhmf/9Lxd3B+7gKu7Tih/xxp8rJluXhP2ThytPXY8E2Q0bRhW+hp7BR+5Sz2SHIKYocBFm3Pd@vger.kernel.org
X-Gm-Message-State: APuU4Z+TKiXG6z/VKgGNTfuR2xKwzJqJaiHxifPFxn16myc9Hp3LE9hK
	R0QD9KyFxJbIzMrj5TLD5C37T3oVuaKWit2Qs0B7CLvy5gpTeLQxNC+OXP25QUP48hg=
X-Gm-Gg: AZFdTZfdFiLg3sURdn1/WwYS2WeryfR2iCxHGb5WC3EBkMUMYxNViH0IUqRmNcRRd+O
	EQX0H5xTDyTiUrd5CWlIR2Rg1JA9lEmKWriJTLtmLGB8T0vHExHLTU6O4zQEUTeUkksB+y3aS2+
	KSeqXsWmrVzVi+Zu8juTYaDmylBphV3grNJGvic7AfH8756Cu6EbElebf4L8zfVnl20gynzP0Zb
	KQRKbnRYW5L2L4XKKa2KqIuNZfj0dNUFtQw8RD+tw+V0WEN2de0Zj0xOIQo4y7SNVJXk/Tt3YL4
	G0aJUzhCFhGUVZ2qoDwF0c6/6J9D24VR6WajXABjthrOkvnmSv+uHbX1Y3fbfCxZomhiNNUaTq4
	iH3aFuuql4xHGgqdgik0N7Y3tL6H6Dy6Mna0dJFYCcZ8s89x20FGIwa+Akc7Qt2pU6P1D254Ssj
	z96x2ytxE6iPUzodR+eBuneq9hjd35lh/fU5/8sWtYMOxMVARNQKAvGME1zQNwT6QI+0ehaf5FC
	snC8RvtNksScFjN1SI4qDTlTLS+Duop4lOaRDbe2LNe8jU1rSCMza1YUW1aLaJovS3AzoVehF0X
	LLSL0iJNtev6DyM1X67d15CZxaJjp/GFt8jcsOsXL745lsMsQZDhD1RU5OfkOzpe6CBKYDrX4C5
	GCD14U9s=
X-Received: by 2002:a05:6512:12c7:b0:5bf:a48b:7827 with SMTP id 2adb3069b0e04-5c1bc6bf385mr6657518e87.2.1795672333627;
        Wed, 25 Nov 2026 21:52:13 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf33a96sm5147700e87.11.2026.11.25.21.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 21:52:13 -0800 (PST)
Message-ID: <044783f4-29f2-4a73-8b2f-d06fe4a5ebbd@linaro.org>
Date: Thu, 26 Nov 2026 07:52:12 +0200
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
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>, bod@kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-1-d7c2983d6d7b@oss.qualcomm.com>
 <179561294019.462348.12092000419789488599.b4-reply@b4>
 <238a552a-ca4b-4997-aecb-fdaa278ca1c4@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <238a552a-ca4b-4997-aecb-fdaa278ca1c4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 07:41, Nihal Kumar Gupta wrote:
> Hi Bryan, Vladimir,
> 
> On 25-11-2026 18:52, bod@kernel.org wrote:
>>> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>>> @@ -16,7 +16,11 @@ description:
>>>   
>>>   properties:
>>>     compatible:
>>> -    const: qcom,x1e80100-csi2-phy
>>> +    oneOf:
>>> +      - const: qcom,x1e80100-csi2-phy
>>> +      - items:
>>> +          - const: qcom,glymur-csi2-phy
>>> +          - const: qcom,x1e80100-csi2-phy
>>>   
>>>     reg:
>>>       maxItems: 1
>>>
>>> -- 
>>> 2.34.1
>>>
>>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> This series is already present in the mainline tree:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml

Likely I've picked up an old series for my review.

> I am not sure why it appeared in your review queue again.
> Can you please review the follow-up changes instead?
> 
> https://lore.kernel.org/all/20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com/

Sure, will do.

-- 
Best wishes,
Vladimir
