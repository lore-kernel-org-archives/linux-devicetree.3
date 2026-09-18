Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3F14E36E6
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 11:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731000; cv=none; b=qiHAjjTmu+AW28vxCO77QkrrPS2dAyIbClmTGdppTWsX08gYHE/dZNoiaddn6Qj/Y7hjO/6mAZLfZ6O0hXbGfRitDWd0+qGSbxSQDnNPW3aM2gRpZk3CvHtBYuCPV6kbJ346vMxoC4+ntJmjLStizasXeia/fy+AYhSxDGGZn2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731000; c=relaxed/simple;
	bh=NHdyr5irXkAWSK7SovevL6gz1Aqt/Mc1x9NZQLzd2j4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nk3fKr8gEKjREHiL2tqV2fj1xSnLqwtLHltbqNFVIZtvihg9t3CVBgtVtBbeD8jAprhvNDXUeZUvnJNX0U3kp5rMFHD8Wt4sRLgdv3DboM/AVWZpH7rCVKX4yh9sy15B0aaMmjwfm7MqQQH9U+DTxdH8jKLRzdHZjUccbT7Dth8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MnkP7CEh; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnkP7CEh"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a5e971c970so2202352a12.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 04:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789730989; x=1790335789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+UlRdpKqeY/71MgfJXq5xM1feUDii+5U8Wx3BoLhe8=;
        b=MnkP7CEhHlUeledK+zFMFuPwFEBrH+frGemfVlXjx+b/cikFqSd9Z1MarJr3vT4kwW
         ULF4NSCv3OGu/sN2wtVQbGRdv0DnAAHCTsb+IzkO/wJTLtsumKDOkrAGgfxM0jBunTyY
         jwHj9sF8k3kK2q+tvBLIv5m5W/6KMMXvQNAzw7WzgEU6ZQXtNbhfNJ2AwGzfJY+neqH2
         VmB1kravRsbmcWNBiGI9Qc5FIu6cvyE+bwDaXF3i10f1NdG6OEmRCsa+AUyS5aXXRzK9
         h4LERPco4Ie1BNlggs74oQp9qE8yx+c929v9Ma49gRrMtPclCxJXOpVRLiltSNCjiLpS
         2+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789730989; x=1790335789;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+UlRdpKqeY/71MgfJXq5xM1feUDii+5U8Wx3BoLhe8=;
        b=AdTjuIxvunTq5rKjD3jxn0wydr3l4elIT3njVKU00A1WEGJHH+UH/yoZlWxgz2iPoy
         1O/+D+4vmt90NzR47nm95TAP95ky1UHNrhr41VAU2wiLWmCA1kB3LOHyeRwIbmTjhydk
         xOUOnsKq8Dx84b779vMzFr6jSjrJMPOmf3gw5VYoNCPHQi9TSo5SbxHB+S1GwhezVaS6
         00+T1FX7hQTB6LMGKXeqTNWIM7hjdWYnJ8fms5ZUslbfh2RuiYZtU2VL3syi0kzqNxrY
         pFUcvIsIo+0pvbXVEKadRNSCvFTaQGbiv4HHqjwtuXtmUqte374eV/rJ/dD568l1xYKs
         tbLg==
X-Forwarded-Encrypted: i=1; AKwUvBzXoErJ6057PqL/ievdFntSH6ct/3PKPcvJNMtbVlH316CGkC6zpz0TMIqPztfurCBx37tD5lLYGdGi@vger.kernel.org
X-Gm-Message-State: AFuF++lhClqLuTgv6TPsDj6+2mZI/3wk1x9g95WKICptp8H0EtOJB0ki
	JzR2cJdGgy+o4hprt6Iza8fKxm+rJ+5kIGuEBGrx15NfOxlm9qlj5rqd
X-Gm-Gg: AYBFou2G++q+K3TcnKxKujWMDF3u5wxYfmXR9xLP2W8HUjCzTBxS37Wb2w0zIL/6/XQ
	X2FSglITbkl0bkWLl6J9kSnCs0+rELAFSqR5VexXqWsTGQ/f6fp/ntkrmJ0cpw9kiIkLeflqLv3
	RkX02Cq60B7N9TilQbgudJugt58werfb2rz7d5oG1Bb23ivjDTSQMk3ftBx/GtWCBoJx85WsPk5
	A+2tWp1Xgq9p+S5wCwEKbg+iutuBv/z1hFpqKU2vIdW7t8b3vIygOt/ADFEnoXa6hFFIULVoYY3
	V3YNEBjl4oQnti4kBNPfO5KjTrBJhu/PFPjeHYZlAxYE1eVtLk/4Lh7y4OswEImAC9zQvOM5UnG
	j2SztNYHEBMANTNDsfmCQ3CKv+rrDtA4C6bMNfW2LrZFbcNI3jxpCImkATQB3xbUpi7PByfKciT
	KbC3/vyIyEn+iWN8mazlcppyjZZ5l5Hc83Oyu8PCD/WxM2PiIywppquawQQPXTXT8Z7WaENncas
	A/SEbzXOrvUwAdI6GZTSh1/d4N6/KmyyAk=
X-Received: by 2002:aa7:c9c1:0:b0:6aa:17:3b6b with SMTP id 4fb4d7f45d1cf-6aa36cce9e7mr3591718a12.0.1789730989123;
        Fri, 18 Sep 2026 04:29:49 -0700 (PDT)
Received: from [192.168.1.30] (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59710fb4sm775318a12.14.2026.09.18.04.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 04:29:48 -0700 (PDT)
Message-ID: <8e7cf0cd-5db8-4565-82e4-932fba96f21e@gmail.com>
Date: Fri, 18 Sep 2026 13:29:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sm7325-xiaomi-taoyao: switch to
 device-specific pmic-glink compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260915084901.56622-1-zstaseg@gmail.com>
 <20260915084901.56622-4-zstaseg@gmail.com>
 <6b2c1fa6-5bf2-4c1c-8046-929576ddbc53@oss.qualcomm.com>
Content-Language: en-US
From: Stanislav Zaikin <zstaseg@gmail.com>
In-Reply-To: <6b2c1fa6-5bf2-4c1c-8046-929576ddbc53@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 1:31 PM, Konrad Dybcio wrote:
> On 9/15/26 10:49 AM, Stanislav Zaikin wrote:
>> Switch taoyao to "xiaomi,taoyao-pmic-glink" compatible so
>> qcom_battmgr can identify the device and apply its taoyao-specific
>> battery property mapping, required because its firmware shifts
>> battery property IDs relative to the generic sm7325-pmic-glink
>> firmware.
>>
>> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
>> index 6f8bc65bb99b..bc4dfa49ef38 100644
>> --- a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
>> @@ -72,7 +72,7 @@ key-volume-up {
>>   	};
>>   
>>   	pmic-glink {
>> -		compatible = "qcom,sm7325-pmic-glink",
>> +		compatible = "xiaomi,taoyao-pmic-glink",
>>   			     "qcom,qcm6490-pmic-glink",
>>   			     "qcom,pmic-glink";
> 
> As krzk points out, this should be a standalone single compatible,
> because it's neither going to work with qcm6490-pmic-glink nor with
> qcom,pmic-glink
> 
> Konrad

Only the battmgr implementation differs but the rest is compatible with 
qcm6490 (UCSI implementation) and generic pmic-glink (basic 
communication). So, we should keep all 3 compatibles.

-- 
Best regards,
Stanislav

