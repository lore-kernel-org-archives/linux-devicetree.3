Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0620E3B8407
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789120354; cv=none; b=ZFhisGqiFsHaJ02yirT/Bawt8voOC2nnvPHvIeJxe1KalNMhhiEeYB8eVrlk8pDUbfD3gT4/+mTov1wjMFhMamKjh+LxUhBBFkeCNIHOYHqoXgdTAgF3cy2AJrWjsFYRo81+NI5+IO0h2yrRwo2UqTAoAVlYkHvRemS3My7az1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789120354; c=relaxed/simple;
	bh=3NmbvHcdNHb2ax4IS5MGihMyuSj7LIc21eicMTlUGtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TUrQPdZmmVxxQXmdLnFIZn3GWIRNoMUlB17U08YeTEPYmLbYUAm2Td8kKQaa7C+dJ7Ird3E0JDz3/iVIL51YIWcx0OZoKDYExMlQMQSRBrLxvUy9VKWC2eF8ckLoX9haqmQKzV8PBXQUBjebgpAg2m70iatXKSms9HXJ+rSqMN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMM/dxcy; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMM/dxcy"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9c60b9so54324666b.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 02:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789120349; x=1789725149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WTJ3Yl3D1Apzgbf0VLfYhSFknYE/u4woMT1MsBZYWs4=;
        b=cMM/dxcyZuYmF2kG3VuCYOFuJNyFN4D/eOCPBZpsg/xc7J7+vzUHTIDqgLHLfMIlso
         5FFnRIbCrW+ghZT4dTUuo6PwogfYe/mSgo84GNRPD3Ng/zB0xerx6tUstpF4vfXZLf/P
         JgSX3PMRf1X3syx17+5p7jtyWoDMuzdBZTrv4XJdEl/N7iQqkUMu1tM/xRaYEecIwlV9
         1vHklTyja3fJJkwMmlYttU8WoT/54B93gog4Y4luqZNDE7pSy985mw+YlCndS+Az1G2c
         avujHNL6OTxRE/OYdmrjlgbHATsA5RoQQFbNRJxhZCIsg8LyX3tnWLmKrkQCSN4MuajI
         Si6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789120349; x=1789725149;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTJ3Yl3D1Apzgbf0VLfYhSFknYE/u4woMT1MsBZYWs4=;
        b=B2Miz79/K3f+722toNcybXBqiDHHQFsJ3FU6D3k0ypr7sx/19vaFdGXKZLvIPzOmxM
         Gus0yUcXgL6f7NwRQgHEPCy0fxViUZeEJP+iqCp8A5k4+sWxVVkDnHpJUiBQKxoKXQuF
         7DVhHUTBzEq7VSNVIjFSUdh+OGFJ9HD6KH9n6M3SEDzzO2TLM6LbQI4dXmmHrKC5QXGZ
         jk4lLwJozN95bqu2ogLoL3NByDlviDFfrQPA/Fv/DTpKNGpY7l0dzgkLXjPiP8Ml1I0Z
         6bftbujhBCQucBzisVtTuu9wHHmZXvhbC4EYlCmN5TfPnZNKuihTzw6JAVRmgjQeEHNT
         qt1w==
X-Forwarded-Encrypted: i=1; AKwUvBzHOoZG+qNuoF5h57iYeUFw8MSnttbF1CMs6my58gER4RncYZz8Zk2rQig23J0PQDZTq701BP4qY8IM@vger.kernel.org
X-Gm-Message-State: AFuF++ncBrtX9mHxMSD+irQ/PtwtuMFfCCr69BpBzrDj3zpVLcXj96Bz
	t9q5+elaxxCaQ2F3OxArA80ShRXWLb6pzsDbk+6iPQ/jhfAcGIR7GVax
X-Gm-Gg: AYBFou1XR7nwLjhrtCb+b3pY/7EYLr6dbPuOpbyQCxEzbOfE3soajwzcPesSdQ4Ds5Q
	wZf/EB5gNYQsVf8XLG1PhxF01YnK1E00aeslaQdACgvzEiozNIXUfX5juQnQVcD6xmo7gRKP7QQ
	zk5/mdBEQw+vEPUIUuL5wRx++T45bvmfPDshf2CaI7SDc6d3fSb+nHjsSr6q69brPFCoEFtHGj7
	UvAM4Dt0UoCG5OvYRL69FppkfufcsmOclrEH3lv6aUtr6nOc7hvns9mfaMnPeIbx9o4M8oh/bTV
	wRPkiQX05KjIpLRpigsd8aBi+XXVsA55IQmvSAx3co4K1o+KfGln2TsKAh3E5UvDcyTvTcwm0f6
	f5rd5RLm/HxBUWCPK/c3Klu9Xf2D6GH9lKGGmpnlO8e2x8X2FFuE5sesMfz71z2SpeA2rvP45W6
	a+MtSBZZRryB9mIbHs8Ji9Q/oL0XKWWzbzkPGwq7f3YvM4BZauQiIZo9nO32dFRSt6Xog7VdXek
	DoF3ehrS6dAhEGOE0W+euyuuKvK/OcPYjuG
X-Received: by 2002:a17:907:980a:b0:c25:f7db:4beb with SMTP id a640c23a62f3a-c2962c415bcmr196891966b.17.1789120348977;
        Fri, 11 Sep 2026 02:52:28 -0700 (PDT)
Received: from [192.168.1.30] (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966024941sm62574066b.14.2026.09.11.02.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 02:52:28 -0700 (PDT)
Message-ID: <930e17e8-8fdf-46c4-9e89-3eb1d7cd58aa@gmail.com>
Date: Fri, 11 Sep 2026 11:52:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/3] dt-bindings: soc: qcom: add
 xiaomi,taoyao-pmic-glink compatible
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20260821123711.1579539-1-zstaseg@gmail.com>
 <20260821123711.1579539-2-zstaseg@gmail.com> <aqHLuHr-Vf3gtz2T@venus>
Content-Language: en-US
From: Stanislav Zaikin <zstaseg@gmail.com>
In-Reply-To: <aqHLuHr-Vf3gtz2T@venus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/26 11:16 PM, Sebastian Reichel wrote:
> Hi,
> 
> On Fri, Aug 21, 2026 at 02:37:09PM +0200, Stanislav Zaikin wrote:
>> Add the compatible string used by Xiaomi 12 Lite 5G (taoyao) so its
>> battery manager can be matched to a device-specific variant in
>> qcom_battmgr.
>>
>> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
>> ---
>>   Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
>> index 16ad4f5698fc..8ca057c4e3e6 100644
>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
>> @@ -41,6 +41,7 @@ properties:
>>         - items:
>>             - enum:
>>                 - qcom,sm7325-pmic-glink
>> +              - xiaomi,taoyao-pmic-glink
>>             - const: qcom,qcm6490-pmic-glink
>>             - const: qcom,pmic-glink
> 
> Is the implementation compatible with qcom,qcm6490-pmic-glink? The
> driver does not bind that compatible, so I can't tell. Maybe some
> Qualcomm people can answer this question. Please send new version
> without the RFC tag, so that DT binding maintainers review this
> patch series.
> 
> Greetings,
> 
> -- Sebastian

Hi,

Thank you for the review.

Yes, we still need qcom,qcm6490-pmic-glink for usci_glink driver 
(there's a quirk that all sm7325-based handset uses: spacewar, dubai).

Will send a new version without RFC tag.

-- 
Best regards,
Stanislav

