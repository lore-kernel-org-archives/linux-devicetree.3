Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865540;
	b=uO/60vCExmppObps/CFEA4a6PO1riCIeKffvVhXEfErlJaf5ub0LJgAQ8EhY2Dcjzcch
	 cX0+Tk9QN6OAVVUD8f5VipKwb6zt0BChx/1I8VcKSLdcOPlIOWOT0qwYV+EfgEyrQ7k2m
	 PpliegCnEld2h0LFuMoiAhdFuIJkz3NUZvZpRP+z0hgO93wcX2NcVECBIfeoGY1x9sCTY
	 lE1b6vFeZnEPxToOBbdWcX+Lpm3Fswud/eVbzH0tpk/POOBoBYL1mj+FSNwUQvp2wfeSn
	 Ak76t8AmseyVXpB9WHiI9cys4dIGI2i8lyew2JburrsuWsSWqL2siSIvYPR8hBiFXiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865540;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=d6cyErUoZNT1XzAJAXdnq0q0iukKQ64jlicZjmtk+Xw=;
	b=pZCSsrQEhMMtTi0UXanc3rrW1zd4CsxucjmF/KmgTjFebML0oKU45m0uygPs2opa1HOk
	 atCW71xC0DmXS2eOKuNtsvFz/j4+ifza/M2LQrKoxYsZor/2vRxMSLcX4oKM75nM2luNj
	 n6wTlcwH8k9ekwwHZfTZbXvJ9Nbl1+xigw8BV3yoqtjlFyRHdGhL83c7w4/H1SDLfw1eM
	 9LBBbHFbJ5fCyswlSmM1Akrwv1ZPUi3dBbNxcHU0TGQT+wlwXfbMwEEY1FXqcbNLCds2A
	 Qz4ROyXeQp4Pa5r6UP5fZyy1u+DkdFOGrgQbL6cL9BSRcgVX52u3jTGTy2gTfnBXMeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OOlZFjrD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YYOMT6wK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0FB606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 07:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D0FB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OOlZFjrD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YYOMT6wK
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56U3CD4139212
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 07:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d6cyErUoZNT1XzAJAXdnq0q0iukKQ64jlicZjmtk+Xw=; b=OOlZFjrD9w0GeGCz
	YEebaqdzGvX+Zz6fYOfT25DN+oBAkUZ2/pEB5DUq6iHZ6ghWtPWNAG1x2V5WBJO/
	yDB0G+jqksL7IfQhxCI6FvgcrTtCv3pHSNlC8wxcyG7zTf3XH7c1u/Ku5ro55iuf
	So+EB42xFzGc5bErYOYBHjvm42UtdCFk0XNPBWNoDHoV8x30iH9Fy7cOQl5t08Se
	aAkqNR/R7QffC5YvRWbWPOT5mfYPTNNW7U9Fp+guKvAvJQiZoY+wk6bPOxfV2Xu1
	IL0tw5qb6NnLmgv3w+o1WcjQiEMp4NWUZqCT4ddDW2LAHMI8yxk/Gc6GRxp1FSiD
	MhNk3Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrm9v0d53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 07:58:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91e751af52bso3704756d6.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 23:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793865538; x=1794470338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d6cyErUoZNT1XzAJAXdnq0q0iukKQ64jlicZjmtk+Xw=;
        b=YYOMT6wKlFykMzkGq4kaY185fDMGjAF+l+GMx5QAti2f1tOgIFpCpLw/MWG4eg7gER
         K9SzN2gN2Ho1SBNZlWoLz3Bi5Mf0EDB1IMoiiVJ73gOyirgjBP99aRjNG/t0FXygPLqV
         UJ4zU3N3FwoobwN7g7r7TspyKrI3Z916VD/9XpbeQd3at8bG6BFzCXT4O3OyJ54aH7f2
         01s6KVhjhwkgcB7grcOjOlkc/0tSWhC/MqiV2IL5cqLs4dE+TAJ46TmIuhz/m1ZwHtIp
         FitaG4aNuqFTSDwCMZLzqbvtFuqolJvmjImlFvfuuo2M7QHLtpC/ZhewgSVbPv9GfYyz
         Ynaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793865538; x=1794470338;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d6cyErUoZNT1XzAJAXdnq0q0iukKQ64jlicZjmtk+Xw=;
        b=Op5YbersqtyiLfLgHNUERGihX324Onz83zT+McdiVb7g2xYygkK3QQqGMIYrLdxUhx
         cw2WoyqYHLoZE7wG9xNz3zpKcshvrphZQmRs1M5YTSC8Ilzsb6M626siHkknV9FFW4Br
         1wPATBoTjZ3vX1mo3pW9QWRn1zTlkpnuwq4Ja9iVC72m29VtOxY8KAgWn4EjWiAANBc/
         deEmCh4VOP0NhAu7AOovbjD2XNRHlrJDryJg/Z7Os74Oz7z8LciL6obQV5B1kTNHrHJE
         ZxJ/Ha2nutD0Qg5oj2sqv01zfrjHYWABwQvh5smLntSCxZV4RPmKmCiQyjt97pbYR6OU
         VtRw==
X-Forwarded-Encrypted: i=1; AKwUvBw+BxV6S/+v1TBc+6ziXIqAXNl2PDEa5oqU411mDPnYuhstT0L89aRW9rY6rabdA/u1KE18UC4oh1u2@vger.kernel.org
X-Gm-Message-State: APuU4Z+/i3zh2ib0vZWDn6m8ZBTYzYGOIH+G6jT4ybq5maQZwbSMOJOb
	3b6rbNd4KrOLEV9GL8Jb75qr+OLsXbUh9IJVREC3mU+RXPHConqtxVNsZt1anWIKVeBjsh4owCP
	wIpSX2tP+IbfSFnm6w2MTwlk0bBz29n9IWo/GaA/MfYO05fc36uJkitaKJ4Bx0B21
X-Gm-Gg: AYBFou2oGFcW0NfzNKtqj+9k5/rLef1J//qxE9ylTCBvkR5EYR+STLMJPMsMzVzArk6
	fqxylkGS04voTK7c/RNRxjR3pmVoV78CuwBkuPVqpSdi9U6JcjvzxsLyqxhyFu1QYnbRtAsV3y4
	3Dajd10rhgaM7987QZXH2s96bPxy/n1Uaz1hHVzoFL3MKn1zYsNN0vZIPIGZN6tyujFi1uFo116
	8v59kL4XZAdNHMCL2f8NOR4FnDG4lvu6EDPFKpcwTsvtigpLx0O4HvkAP/xnTedtbSaANNQzqYG
	ZcGF4+6TJK5HllgcKnX8pf8CdYISjY1HR8N8ThWORD34+hPe8gcbzlFoO2ME/TSglzerhazxNqi
	gIHky70fJPJlztlsBWyEPdAYHu1kou09XaJPCUSPIWLQltcFLKLPiLADPFIasu4ao9PSf
X-Received: by 2002:a05:6214:c6f:b0:91c:6ccb:4442 with SMTP id 6a1803df08f44-91ca4a4b1f1mr414798676d6.2.1793865537470;
        Wed, 04 Nov 2026 23:58:57 -0800 (PST)
X-Received: by 2002:a05:6214:c6f:b0:91c:6ccb:4442 with SMTP id 6a1803df08f44-91ca4a4b1f1mr414798016d6.2.1793865536835;
        Wed, 04 Nov 2026 23:58:56 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e46876asm148250766b.57.2026.11.04.23.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 23:58:55 -0800 (PST)
Message-ID: <4a733192-37c5-459a-9fee-079f8f813b8b@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 08:58:52 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Add missing CPU7 3.36GHz OPP
To: Val Packett <val@packett.cool>, nacht@dxdmail.cc,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Aaron Kling <webgeek1234@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261104-sm8550-prime-3p36ghz-v1-1-c72630265379@dxdmail.cc>
 <ef120d58-fb97-4c67-a29b-6b9b07839227@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ef120d58-fb97-4c67-a29b-6b9b07839227@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMSBTYWx0ZWRfX0KbRKlIsO/ak
 LgmjtnLViMp8IRO9d+qI2kUbpvtfaxTnve9qc+MgeMQDYaawRIS37a76AcS0LBXC7IU6/X5bOaa
 XkzlYY6/mvQ9gdCkxVz5q7SgfmY1wfE=
X-Authority-Analysis: v=2.4 cv=KrHYSmWN c=1 sm=1 tr=0 ts=6aec3742 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=9hb5SW-Fs4uWgb81FvgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMSBTYWx0ZWRfXykh1gQBFJd7L
 egAYDkpxHCe2gv+0ZW8KhkwCvD+3bSaA4kKri3Jq3+SxsmdKlQnWxR0AQrFP7KWKDCb2jLWXTal
 jSm2+SN8Uc288KmuK1726zTcLRAgMyQbkk/YfKqCGfGGvLsLI+4u74hELfhqn+zbf8iBzcyNQsu
 UK5hhRU749NM6SH8f88iVB8TgKfZH0dH3OAyfa99WL7yTUROgzTm4RNbzh8Zuem7tU4PtFj8PQq
 gSvavYbL3xpa9NsUlDDF77pplr7QDiqB8oEWLpeIsYUCWJLEhZzRJlVYHt7JwZO5sNlY25gmW4W
 wTeEH2mLWMTWeW9h2IUXyhIPACL1HpUyL8eE+qN+U7bwM1uGj9Sp/yYIFhLiLEvo+rKNqQV2ULg
 vNUAlV+Nr0m7jmUs+zxnyxAIAhggYUVpxfCO76Zy+FAY2KyunaYtwigD8F/CtSnpb+xQg7N95Q7
 eeqmeKBKXvJ/06bVOKg==
X-Proofpoint-GUID: 2Z8wBkyQVc9UDmlNXpxlbxoyH8bQkPsl
X-Proofpoint-ORIG-GUID: 2Z8wBkyQVc9UDmlNXpxlbxoyH8bQkPsl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050031

On 11/4/26 10:24 PM, Val Packett wrote:
> 
> On 11/4/26 4:41 PM, Nizat Mikayilli via B4 Relay wrote:
>> From: Nizat Mikayilli <nacht@dxdmail.cc>
>>
>> The cpufreq LUT on the Samsung Galaxy Tab S9 Wi-Fi has a 3.36GHz boost
>> entry for CPU7 without a matching OPP, so the frequency is dropped:
>>
>> cpu cpu7: Voltage update failed freq=3360000
>> cpu cpu7: failed to update OPP for freq=3360000
>>
>> Fixes: 3f5dcc05cd33 ("arm64: dts: qcom: sm8550: add cpu OPP table with DDR, LLCC & L3 bandwidths")
>> Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> index 03f6d40edea7..ed6e34ac8d56 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -752,6 +752,11 @@ opp-3187200000 {
>>               opp-hz = /bits/ 64 <3187200000>;
>>               opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1689600 * 32)>;
>>           };
>> +
>> +        opp-3360000000 {
>> +            opp-hz = /bits/ 64 <3360000000>;
>> +            opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1689600 * 32)>;
>> +        };
>>       };
>>         pmu-a510 {
>>
> This seems variant/speedbin dependent and does not apply to all sm8550.
> 
> In fact a quick web search shows that your device has a "Snapdragon 8 Gen 2 for Galaxy" which is a customized chip for Smasnug.
> 
> You should just add the OPP in your tablet's .dts I think.

It's fine to have a superset of supported frequencies in this OPP table,
the frequencies available are retrieved from the LUT exposed by the
microcontroller anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
