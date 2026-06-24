Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06201FC101
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 08:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782288049; cv=none; b=MkK+gfTNZD4DxSzNaT/108V6/2gPNif5/Dm0HJEqZeAVH8l6NgNuZrHeap9P1PxtIWj6DEtm5Q/nvJii0t4JkG5cseKtk6jkJrOGNqFTiKMYlIZXLFBaYTDwoYgs1DJaIKiRu+ZZaQ3amB7JkHo5WgqMiWEYpCGa4ms04tFEaoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782288049; c=relaxed/simple;
	bh=N/YmEEM3JnJUsV+8++0ZovcY2W6+bqMcuqvJyy9zv1s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=kFmb75e5E+Oh7WyQ9ko3gX3r9YOUADFXLWcgJkG34r04N75TEUfdOD5OcpbN9GS+3xOdUbxdgSJ+h9PC66hPaGc68ry3jV0fmjUFLtmFv/pUPnJAlepfPTAjKed/aJ7QaTPF28fbzEvAHeXte7jBssK6bgz+7jzJzvPVSXmQdJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=pD6F2IU8; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="pD6F2IU8"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490ac357c55so6554565e9.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 01:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1782288044; x=1782892844; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTWWK32Ejjyq6jHOCCUN+iBQR69zwL/fyrY9B09gGws=;
        b=pD6F2IU8XyjlwbKBMiPB1AuY0GTqUqf1IW1Lj+vHEyrQFu52+gQRj+C6RcKjRHeod7
         PJGMMH2Y3LBIX+CaBzM4hZD5kCUBhCz/wFW8GY4ml+0q2Degapn/JSCO8I8SqfuhmLsv
         TePN/+JouX4sk24eaUNErpw2yMR/zZ0AdGxpkVFU20KyrVwG5N4kkA3DPmWkcNuHn9GG
         IdPPE3Id3FlE9aGZ7QnRubaLEgc85AQu2OrEaAi3f0sYiLMaW4l24PkGHNB0tDTNpyXg
         a1x+3KArB2WkyM9U4XoKXpJBCHcsynFnkK/hBp3WEQYsirfFiA6ISobpLfke0QvGUMzq
         AhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782288044; x=1782892844;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bTWWK32Ejjyq6jHOCCUN+iBQR69zwL/fyrY9B09gGws=;
        b=E/oALxgp6O369PLMBBOvP0GmqxJUgQf75KHpjIcGI6fOdQD74nsMu9sCje3okw73lc
         N0oPGcaO993sdzZ7zYM5CPBFsaT3CUtqh6U1ZG4hibbE8U/CAirY2ww2jM7GtjXPIqDl
         K3e9vLEUYgNNOtHm0b+IVVZ4W0McQRiZ4+OUq1iqbjQS24noYyD+bTTUD77xronNV5FI
         2ql/LAb7fcfUsT5Gi+f6VX/N4jaca+/gBZKkLCgidK8ZAVdGzFp16jtG0W+OS5wtSfVn
         8x2aAt17Ezj82u46hj6XE8O/WUdQDJm9DK/N86ZFa35KmbLeOvIpC+HczUMhcga7VdWk
         GlMw==
X-Forwarded-Encrypted: i=1; AFNElJ+3MU8P6xF1keoB5qdE4wU7WSJMDl6fbTRQyOWjKxro1MJWK0D6Qg5D1bPLBkW/xV8zWY8MJz+2fLHd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Iv05p0eWXumDu/SBRagn3cYaExnDncSyLzfIBpUtarz0pbUk
	SLBWDVRum17nmJixIKWuvRf2dR78iZkXSmmKhbwGrHqHfewamzd/l+DzMfqQPJccg1s=
X-Gm-Gg: AfdE7cndNm9igaSID+t+Y04NdOvYVXFjVNEsHD977ub3ns+y0ZLbXRt/ZVULFAZN/3+
	5Iw80sw82CcvZz1OROl76UJebWJi+bNVl3ROpKeyCivoctL8CPugSznmBuZDMOww5rNM4S3q5D7
	6D7gtXgy5By/rHL2vpwFBZnP+Es5UAh/bQITMhSX/XYP7t4QzjtN9zz8tjKAWlxj+mSCsenhJS8
	X/oaFHC4/e6j1PlJZjcdjRImDGAxe23j8R4fUi5B7RucqFhYjbIB+/Pvb6/E1OoGX/PWpUaMGVk
	cuzeYEDuDhSY3DH2jZtsKigmaDZ5ZrAsy5OQ2OKxdTNxugKmkOUX87dFK5cJmiapqbacYVy8VtW
	FC/CanWWGVN7uLAn7CTav1wCBmP1jTH5vKog/x3G9quONff6VfllQrFAp1u3kcdyxg+8MDiJSKU
	Y81dmv9rk4bNPOhISYdPApprLidJCx+/JJwuEjOfkvIJU+K/kq50bzgpY=
X-Received: by 2002:a05:600c:4454:b0:490:e913:656a with SMTP id 5b1f17b1804b1-49260874c40mr30465665e9.27.1782288041332;
        Wed, 24 Jun 2026 01:00:41 -0700 (PDT)
Received: from localhost (ip-185-104-138-186.ptr.icomera.net. [185.104.138.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49249238bfbsm373948445e9.5.2026.06.24.01.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 01:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Jun 2026 10:00:39 +0200
Message-Id: <DJH4DPXBAJ6V.1TJTFGBP413TP@fairphone.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Sort pinctrl subnodes by
 pins
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Vladimir Zapolskiy"
 <vladimir.zapolskiy@linaro.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
 <f05ad4ae-140a-40a7-a6ef-9ac2ddb0a939@linaro.org>
 <DJ747VLQEHIN.Q3SS1FFC9I3L@fairphone.com>
 <ba0e9f93-fd2b-4895-b8a7-8e38eeff9bcb@oss.qualcomm.com>
 <DJFDYAS1AY8Z.3GD4A5UMWLAUC@fairphone.com>
 <99654e01-3a52-4a9e-b003-24230aa6a248@oss.qualcomm.com>
In-Reply-To: <99654e01-3a52-4a9e-b003-24230aa6a248@oss.qualcomm.com>

On Wed Jun 24, 2026 at 9:59 AM CEST, Konrad Dybcio wrote:
> On 6/22/26 9:05 AM, Luca Weiss wrote:
>> On Mon Jun 15, 2026 at 2:09 PM CEST, Konrad Dybcio wrote:
>>> On 6/12/26 3:46 PM, Luca Weiss wrote:
>>>> On Fri Jun 12, 2026 at 2:59 PM CEST, Vladimir Zapolskiy wrote:
>>>>> As documented in the "Devicetree Sources (DTS) Coding Style" document=
,
>>>>> pinctrl subnodes should be sorted by the pins property. Do this once =
for
>>>>> kodiak.dtsi so that future additions can be added at the right places=
.
>>>>>
>>>>> No functional change intended, verified with dtx_diff.
>>>>>
>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>> ---
>>>>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 1382 +++++++++++++++++------=
-----------
>>>>>   1 file changed, 691 insertions(+), 691 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/d=
ts/qcom/kodiak.dtsi
>>>>> index fa540d8c2615..62daef726d32 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>>
>>>> <snip>
>>>>
>>>>> +			qup_uart12_cts: qup-uart12-cts-state {
>>>>> +				pins =3D "gpio48";
>>>>> +				function =3D "qup14";
>>>>> +			};
>>>>> +
>>>>> +			qup_uart12_rts: qup-uart12-rts-state {
>>>>> +				pins =3D "gpio49";
>>>>> +				function =3D "qup14";
>>>>> +			};
>>>>> +
>>>>> +			qup_uart12_tx: qup-uart12-tx-state {
>>>>> +				pins =3D "gpio50";
>>>>> +				function =3D "qup14";
>>>>> +			};
>>>>>
>>>>> I understand and support the intention to keep this change non-functi=
onal,
>>>>> but this pad "gpio50" is for qup16 also, right?
>>>>
>>>> According to my QCM6490 data sheet, GPIO_50 has these functions:
>>>> * UART for qup14 (OK)
>>>> * SPI for qup14 (OK)
>>>> * SPI for qup16 (no pinctrl)
>>>
>>> "no pinctrl" meaning "not defined in the upstream dt as of today"?
>>=20
>> Correct.
>>=20
>>>>> Similarly pads "gpio54"/"gpio55" for qup14 function, "gpio62"/"gpio63=
"
>>>>> for qup16 function, I find all of these are missing on the original l=
ist.
>>>>
>>>> GPIO_54:
>>>> * UART qup15 (OK)
>>>> * SPI qup15 (OK)
>>>> * SPI qup14 (no pinctrl)
>>>>
>>>> GPIO_55:
>>>> * UART qup15 (OK)
>>>> * SPI qup15 (OK)
>>>> * SPI qup14 (no pinctrl)
>>>>
>>>> GPIO_62:
>>>> * UART qup17 (OK)
>>>> * SPI qup17 (OK)
>>>> * SPI qup16 (no pinctrl)
>>>>
>>>> GPIO_63:
>>>> * UART qup16 (?)
>>>> * SPI qup16 (lane 3) (?)
>>>> * SPI qup16 (lane 5) (?)
>>>>
>>>> But the GPIO_63 looks weird, is the data sheet wrong?! Where would
>>>> UART_RX of QUP1 SE7 go? Maybe it should be UART qup17 and SPI qup17 an=
d
>>>> then SPI qup16 ??
>>>
>>> GPIO63:
>>>
>>> QUP1_SE6 SPI_CS2
>>> QUP1_SE7 UART_RX/SPI_CS0
>>=20
>> That matches pinctrl driver and kodiak.dtsi at least. Still, the data
>> sheet is just wrong there. If you have any contact to relevant people
>> there, please let them know!
>
> Please share the 80-xxxx-xx number and I'll see what I can do

80-20659-1 Rev. AM

Regards
Luca
