Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631464;
	b=V0mpJuf8MSML6SxhycyBTzXu/zC4ZnhPuSHNR9Gc8RpYCk0njIH9eEZMVSLLSR/iyQvS
	 uTi2mB7blj4LBlZ5VB9e6hLj2qj3hBrJsmqQGoDfsCAdPGhxAHxTEH+7EQLcobkuqpXsf
	 RP9aV4ew+EysmzzEzAzkJZEPSlAWUYPRvOVHVAdNfSLwJRRC9xUA8UD9CjW87SzbrZ5XC
	 CvjCZeSGUpFwJZhkDR5yC/yncV6xciJnh4QT9P/12Q5hUX4a3o0G+irZ/URdU++S3Ruvf
	 ea4avRZ95FN6vtXnvvgVqxCUIGv/hK8pnMqj0MyvJDi+DHBAsljVWsewGfwp1mbyuVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631464;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=V0mwm2S6a5RQ4bVt2WgjrUUgoonka+5P78C1e4E9nWs=;
	b=VwQSIzYUNV70N9ZPEAChwy4/1SFI1UFcH4l7GJl56wOV1yRBCNs/QqfEBJBgsIEdzn+t
	 dVJH9KygtgqEN+utzxhGskRCkoXu+LLMZEYHDZ3m5CKIw97h9Lk4a1TSa9DYEtYveGrWT
	 ML+cr/7C4t8IQ5uuIO2aakrxG+iH3UcRhhiwO74B095eNEs2uSWFspNYq0vcn1cTOoQJw
	 3nV6caxYW5Itu1MVCJWfNKhldKhnXjvP5xxytk27zjDPRduYsG6jwKNUSOuFa4pNn53av
	 l2f3GhAejIhGTrKhnT/ilS0tHUJ0vb6Fxi2i0HsGm4XRgiAhtCr1g3+J0ma9sRi55Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MOpZb9qc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M7LHIB2L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D82606A597
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 14:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6D82606A597
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MOpZb9qc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M7LHIB2L
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DppOV3716250
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 14:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V0mwm2S6a5RQ4bVt2WgjrUUgoonka+5P78C1e4E9nWs=; b=MOpZb9qcza/MuWZX
	/Jhnru7VEoNOcXEWBrMOe4c8Um46z8/+YAJvZR/yOMWhkntzp0w73f2g8COfrVBp
	ZkS+uYPf0SuJCg/k7HoBtS2yIzuqS5yDwo9CwDwyFK7aaFg8LvzQG5wdcLwGk1g3
	Yy4uS4mgwYvNqsjB7COwbhe8pOVb7+qW6NYbuWZ9hhVJea7hzpIcvOXaVoiwPuD2
	9UkJ7P069SjJQCBj92oquJL2kEjHOZnaQDsLWv7W2mdvxbHf2actDhwEl5BwR8jk
	pLDgUmg/PFMigixW/a6hGVgJmwxHue7j/yc4KvptIwmCOd7z9BUx/AXPBYYCLCdZ
	qwzWIg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka62bqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 14:57:42 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc450e6e1aso119538137.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 06:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793631462; x=1794236262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0mwm2S6a5RQ4bVt2WgjrUUgoonka+5P78C1e4E9nWs=;
        b=M7LHIB2LSlAmt2WIaDGGugI+e0LZN2Ap/7uQhtFI6O0FpThwkasInkZ2gbutZcrzpM
         tlDNqeLB+JRa4aqXSRNvrKY5cTHflQ3WvgpYC3I+uPXGQZPLVvwcQiBOauXN6GQcWGJX
         Wy9lAadPnolUuG76oJEm3D5pyGCY4w7I3ZcDRn1+F4o9snzRsV9MJPauXVt4jKCm+uew
         /1CVY25WyI0/S01hMUPkdywoGjaM7DBQA0qdANn9jNz5p22AI9L/EnCvLUB33JFpsVlQ
         MA8tWn5mzaT+ABGFiGxrbPkc0r25iC81JwAwNAd2ommuGAppFoL07qblA5pQG4ipDfp+
         6DdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631462; x=1794236262;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0mwm2S6a5RQ4bVt2WgjrUUgoonka+5P78C1e4E9nWs=;
        b=iYyuoAreKecHLkOPfJBTQwrgwL1o652+yknKlvQ5zH8h9OnXI/9MCwKpyJDVDQywFX
         dqjhG49L+GqrMnYlRKfJVSy+jNvwhb3rtInbe2cdKEUD/7ykVSXSTZJkyZ7ibUJNNCv4
         6Yy/l+SMtlin2quoAEgqrsygy6/EwBmtPqwAzurl17eS2cy4TptPwPJGIpMz2Szjkp68
         8KY572XbN/e1KvQ3zO6xglhlwE0uBDphjOX/1KES8KT/5hvJnr3ZZGlU3VbGZqco/QCU
         VWHLy4CKEzEum76PvAvHvEfVDDoSbg7okCS702aJBh9571RoyxWgfgCusNlStjeDgh4d
         ds2g==
X-Forwarded-Encrypted: i=1; AKwUvByTAFid0FZyYGEyEmtJDJ6lBwloqpBRZvzX13qmwxGrujTTjMEunUhkZ5epHZ36miAqHdRQOYTX8/BO@vger.kernel.org
X-Gm-Message-State: APuU4Z93rZ0QBe4VQookzFKZ7Vve8X86xDSNjGUU0ZLJl23pKq/Hp/hL
	F3+8SGtASHPGIPhwsjeEdWohz3/QdZJfoh4IWkSfaPJArEjzg2KxTud4SEcyo7G2rwVwaPjM99v
	O5OasFeXYyE0+ifv5XBcohDohfId+WG0NYgBvTbMqlPp7BhvBP+IBX4dBMQgqGouf
X-Gm-Gg: AYBFou2Xgmdz+MhZQKYZyUflxWcAm+5bZqDsbS+AwKKFaPs0ENh/EsiOgtUWg8Mu180
	1da9nJOB6L9qhOPCOBxQ5SXDCWM1nP3kC20ZEpjPF7dwRbKRwWbGkkZOQM8/fhpVEHssBGv9mb+
	QAtS7u2cWGv4R+tgXG/MZP54AHfqd9MXTq1b4qFXnVOwmYp03vrTCfOrC6FkLXWVcec0FUtPNKH
	3aOcfNvQB0EvQmnnLZwJUHTwEY61ti5Av5tmSbVkEI0+/zUwl5NyG7vd7cEBoiuJ/c7+zT6e77F
	zFpaXEvqalfgq7aa1zWAb7HUfWu4T0awKWZts2TXiVPw8Z6o2K9rtdslSrHGoBN+1sQkiK8qsSj
	Ra+ZD87rncJVk/1ZZhV2lLwex7eKazPuTQF2zJ8WWiN0vyduwin0ikmdbIApN/P1/sKMXLQ==
X-Received: by 2002:a05:6122:512:b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ec682924c3mr5548014e0c.0.1793631461836;
        Mon, 02 Nov 2026 06:57:41 -0800 (PST)
X-Received: by 2002:a05:6122:512:b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ec682924c3mr5547994e0c.0.1793631461382;
        Mon, 02 Nov 2026 06:57:41 -0800 (PST)
Received: from [192.168.226.93] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc7bsm401506066b.21.2026.11.02.06.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:57:40 -0800 (PST)
Message-ID: <ce3b0670-3de1-4c3f-a485-e6bdb8d3d95e@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:57:38 +0100
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
Subject: Re: [PATCH v1] arm64: dts: qcom: purwa-iot-evk: add missing DP2 audio
 link
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Le Qi <le.qi@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20261009030404.1981995-1-le.qi@oss.qualcomm.com>
 <01b4728f-a78e-4932-96fa-795283e91cb6@oss.qualcomm.com>
 <55e20ec8-d6fe-4613-b7c0-d748f2e5944e@oss.qualcomm.com>
 <23ac857a-b340-401b-ac24-77b89da2aa8e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <23ac857a-b340-401b-ac24-77b89da2aa8e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8CKklkyB7jnV_rREkN0uAAD9sqZpJL6g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfXxLTyFs8KO+6w
 2Zx1nb9X3d7PUnRi8FJU97b9pe0lzINFOAxlna/SNqtpO8R624k+HOnOeZPT1tSzRbencli1lkl
 Rk+2GABBOi2tx9s/97lOm18ZwO65HNg=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae8a4e6 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bylRaU9mNTR0WGHX4M4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX+rXhcHpFareD
 wMmjjuBAs6erCsdEGHCg3Pcc2GqoVrO4xyKtexAAPcmduw2g6ipQLjfp/WuATGdv+GT0iAdmIB+
 UQ7Wx1H4sf5DsFt0mx4suzHz+MBvtvtGxXu1M70kA0DklyXBz+/5K8SfLRdJzAoi7Z5E7oKfidw
 FNPWDW/O2gVtqBYE8JteHkqC9C5REYtyIfFgrLxYS4Zr1woQofICJ1e3vdzMGx2+5ZMaTo2mdMq
 75mVnc4nwhDfu4+Mg3Q4Iid+owIniE55W98qYQHu08n63CYHtQFsAIJ1wJBe+y6duMX3qWKozfi
 30a9t7Ob6w8XtWSIQXhLPl4hvIGmJmmhW7JmKUKL6mJgOSzJEfv0jAlJLZs/O7CQCTauluuuQZN
 PUgGdRdZ/y+EAGrAZQgQ8bFNDDfBreJKVZ/e+HGs0gkaGFb1M4Rk9M3i79hZNLn70mcSTSi23H1
 L5HGE1+MJazZfiq1+uQ==
X-Proofpoint-GUID: 8CKklkyB7jnV_rREkN0uAAD9sqZpJL6g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020059

On 10/30/26 10:09 PM, Srinivas Kandagatla wrote:
> On 10/29/26 3:27 AM, Le Qi wrote:
>> On 10/20/2026 6:14 PM, Konrad Dybcio wrote:
>>> On 10/9/26 5:04 AM, Le Qi wrote:
>>>> The DP2 DAI link is missing from the sound card definition, preventing
>>>> audio playback over the third DisplayPort interface.
>>>>
>>>> Add the required codec, CPU, and platform DAI configuration to enable
>>>> audio playback over DP2.
>>>>
>>>> Signed-off-by: Le Qi<le.qi@oss.qualcomm.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 16 ++++++++++++++++
>>>>   1 file changed, 16 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/
>>>> boot/dts/qcom/purwa-iot-evk.dts
>>>> index a811d8ca2dbf..93cefffd1f46 100644
>>>> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>>>> @@ -641,6 +641,22 @@ platform {
>>>>                   sound-dai = <&q6apm>;
>>>>               };
>>>>           };
>>>> +
>>>> +        dp2-dai-link {
>>>> +            link-name = "DP2 Playback";
>>>> +
>>>> +            codec {
>>>> +                sound-dai = <&mdss_dp2>;
>>>> +            };
>>>> +
>>>> +            cpu {
>>>> +                sound-dai = <&q6apmbedai DISPLAY_PORT_RX_2>;
>>>> +            };
>>>> +
>>>> +            platform {
>>>> +                sound-dai = <&q6apm>;
>>>> +            };
>>>> +        };
>>> Srini, can/should this be in the SoC DT?
> probably not,
> 1. because the dai-links do not have explicit disabled status, so these
> get parsed
> 2. sound card itself is board specific.
> 
> --srini
>>>
>>> Konrad
>>
>> Hi Konrad,
>>
>> I think it is better to keep this in the board DT, since the sound card
>> is board-specific. DP0 and DP1 DAI links are already defined here, so
>> DP2 should be added alongside them.
>>
>> Srini has also agreed to adding DP2 support in the audio topology.

got it

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
