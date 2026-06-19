Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1BD38237B
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 13:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781875003; cv=none; b=akqJTgCGIMfvCY7MbtKdQ2NWEOiev8isPFAXeFYQghyBuHRIBUpRmZlZLg5On9ZadQOaNt7PxbQBqe35210W0F/ymTGSphycViswo3atfi3xu0jR9Nv4vcMOnqRtvxAJCnTDGqmG5+3w4hm4RZth/U1L5HSNxHvYWRWMT3oxyeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781875003; c=relaxed/simple;
	bh=4sgAZRMpN+E4EFV/WjC2hK1lLof0TXc2GUU3wBWck9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ymz9FBxDHetVbE84DI+3x8klCn5U8sLZXRsAjZpiiSG9Ra9KuedTLS455qEPGQZeFZLAqkYpFmuZzBNT0oXbMT7MysYaIe9qAGABnKnwPEMU01gBRIYIvcocw72fWlcVeTT7taa/ujD0NtHEMkLXqOJhD8M5w08v7T6dPfeEWCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hv2I2P55; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hv2I2P55"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5ad4c966e63so276607e87.3
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 06:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781875001; x=1782479801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgcSYa5jaMnEPZ3HUYjkicq09TjBCnm74Jqw35loCI4=;
        b=Hv2I2P55R9TuDnUNArOg0uQyLd83K1vnyVWf4tWVfcdqhO91rIZqXRpTw7z2y7e4Xg
         zSmK039nzfVrmXwJN4bWbNLEE04bcfRh0oyNmgIGQ1bzPiHkGRjobojbTx931T6Cz5TA
         Wbjqx/iVipc0shqSCGRqVGLrDnhHpEr2AklKGyNWOK9W9fWYwSl+EX0tVx7enTFCNHtG
         560f/Re5c0NbctZdZjixz9hDpHCokh99FggpZVu+cGz/3BuSjs4QAy/E8jUcqoFAjE90
         J5rrUIUmcivQMRSsrJ7AutdMZXKfIL0iVhRNAatF/cOqClhuYpbGr/bmqaGcOvowvdIw
         2TKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781875001; x=1782479801;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pgcSYa5jaMnEPZ3HUYjkicq09TjBCnm74Jqw35loCI4=;
        b=SkzLZvsl4nBgpiU1m/8uqKrfMDPeDkh5ihImokO8KZS7DdvVx8URhqmXXJhEH0Ocas
         0A3zk7N992kBQ8zWqd6p1GODd6afT3stFgxGzGzSeOx8m0g/LpKClrBYIfiRVduIwBvO
         55YrqnMBinhjZLTGrCQkWxjdWUkx8OksVkDSNruD5DLT9MUyC9LHWjic88iDMpwWwb8d
         t0Bsty83pRa/SSOb5tTHcXGdqAeq6KhCmmaQBGCzjwEBdxjhEzBa8Un8G22IZPhEAfer
         ZvkjT8Rs0wwr3Ksa4Mhje4XEjURyBxAQjVdpiaX+m+TcQqLq0OcHX8YX87GkwRON5cvW
         FBtw==
X-Forwarded-Encrypted: i=1; AFNElJ/8H5JYNLunSuze233FVXDvyEqPCmTCasA2iFcCuMC2zDk2JHwUPddHS895EC8izGZ2pnYejkmahcyy@vger.kernel.org
X-Gm-Message-State: AOJu0YxcXBfHEaoFpoSvhLBEAm0bd7gdXXdGDfVclmpglsALy4TfJ4e9
	saQRB4O82uyUeN6RPBWCP+R+ob1r1cp2hV5GHX1uPSfc610IsCOBLf8KwfhxDP+iHCHoyrXpf+M
	4HiCTJHs=
X-Gm-Gg: AfdE7ckPMobHGuEI7t+pDUmP2r+I8ic7fHIJYuI9e7cYZH0B/oYOP2xwkIX3rhVmTea
	X+BjH0dm20oQvEShqGvf69YW+SkkB7zVUFDOIVukXrrB1MEiQfIoQFAk31cpuqoWxo2gumw11Ty
	WQjy7o7sSzzHejXZSkmZbhkN5rrtNNMQLOp2XBjhVZKbjw32UuDcJLikty1iOFBS2JXUfrYvJyH
	KQQAtNPx93b+UeMeDLqdqRfb0mtIGqdau9San4gxjQfNBmCS0aLm5mmIyhLafbNCw6Zezcaappw
	k/H78qUoQfrOo9bGawalJ0FvqjzahMrK9huGHWpuzw1h8j3LttUbr99H5EGrG7/UCvUAFfrS7VQ
	ij/+XBHhu9wCepgJijBccVI9egWdk6XmVwJpA3qtnHltpLBEyAFFIZ364a/QTfTMiPzZv1E6Xyj
	lRpHObJ0cmYE9SFTPvJBiBeHEiECpOOsq7KweR5Kf6ahHdpjOcBTwdB45SMhZesQIxCj4=
X-Received: by 2002:a05:6512:118d:b0:5a8:7317:540b with SMTP id 2adb3069b0e04-5ad562e8a19mr557862e87.7.1781875000383;
        Fri, 19 Jun 2026 06:16:40 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad57246020sm583518e87.21.2026.06.19.06.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 06:16:39 -0700 (PDT)
Message-ID: <97105c63-4e6d-4bde-9053-6f795c2477d1@linaro.org>
Date: Fri, 19 Jun 2026 16:16:38 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp: Add camera MCLK pinctrl
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260607160435.36546-1-mitltlatltl@gmail.com>
 <280402c0-57bd-46a3-b95c-f9ae02122a09@oss.qualcomm.com>
 <CAH2e8h7aGiF1g_LgG4WxEj1eGbUp-T_U-yZVpoHgU8FsMOrWTg@mail.gmail.com>
 <423b4e86-3837-4d69-8f56-d8259be53ff5@oss.qualcomm.com>
 <12a89ab8-dc43-4b55-9c95-36d44c75dcab@linaro.org>
 <162da512-1142-48fa-bf7d-0b2393467a75@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <162da512-1142-48fa-bf7d-0b2393467a75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/19/26 16:03, Konrad Dybcio wrote:
> On 6/19/26 2:59 PM, Vladimir Zapolskiy wrote:
>> On 6/19/26 15:35, Konrad Dybcio wrote:
>>> On 6/11/26 7:29 AM, Pengyu Luo wrote:
>>>> On Tue, Jun 9, 2026 at 8:17 PM Konrad Dybcio
>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>>
>>>>> On 6/7/26 6:04 PM, Pengyu Luo wrote:
>>>>>> Define pinctrl definitions to enable camera master clocks on sc8280xp.
>>>>>>
>>>>>> Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>>>>> ---
>>>>>>    arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 56 ++++++++++++++++++++++++++
>>>>>>    1 file changed, 56 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>>>>> index a2bd6b10e475..0dbcd3069a3b 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>>>>> @@ -5484,6 +5484,62 @@ tlmm: pinctrl@f100000 {
>>>>>>                         gpio-ranges = <&tlmm 0 0 230>;
>>>>>>                         wakeup-parent = <&pdc>;
>>>>>>
>>>>>> +                     cam_mclk0_default: cam-mclk0-default-state {
>>>>>> +                             pins = "gpio119";
>>>>>> +                             function = "cam_mclk";
>>>>>> +                             drive-strength = <6>;
>>>>>
>>>>> Other platforms set this to 2 by default.
>>>>>
>>>>> What's the value set on Windows when the camera is in use?
>>>>>
>>>>
>>>> It is 6mA.
>>>>
>>>> Let us get ctl_reg first on Windows
>>>>
>>>> lkd> !dd f111000 L8
>>>> # f111000 00000284 00000002 000000e2 00000000
>>>> # f111010 00000001 00000801 00000000 00000000
>>>>
>>>> ctl_reg => 0x284
>>>>
>>>> in msm_gpio_dbg_show_one()
>>>> ...
>>>> drive = (ctl_reg >> g->drv_bit) & 7; // (0x284 >> 6) & 7 == 2
>>>> ...
>>>> seq_printf(s, " %dmA", msm_regval_to_drive(drive)); // (drive + 1) * 2 == 6;
>>>> ...
>>>>
>>>> x13s should be the same as gaokun3 in this part.
>>>
>>> I confirmed as much and I'm willing to believe this is a default for
>>> all 8280 devices
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> for the second patch, please mention in the commit message that the value
>>> will now match windows and please add a fixes tag
>>>
>>
>> I believe the second change cannot be tagged as Fixes in sense that it
>> strictly depends on a not going to be backported non-fix commit, and thus
>> backporting of just 2/2 change as is will break the matter. Reordering of
>> the commits placing the fix commit as the first one should be fine though.
> 
> The Fixes tag makes the patch eligible for backporting through AUTOSEL
> but is itself not the same as "please backport"
> 

That's correct, and due Documentation/process/stable-kernel-rules.rst it
would make sense to add Cc: <stable+noautosel@kernel.org> to the next
version of the change to help stable tree maintainers, since it is known
in advance that the unmodified and Fixes tagged 2/2 change shall not be
considered as a candidate change to the stable tree. Or is it excessive?

IMHO here it might be better to properly arrange the changes and backport
the fix.

-- 
Best wishes,
Vladimir
