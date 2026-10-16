Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4D33E44E4
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145098; cv=none; b=X6roADQR2hWGZm2Tjnz+o2iE7btbcQUIR5AGbYo58+aqHgIRDg2xgFVh3C0uzujdmuxiVoGyxAZl+nqXaC8V3OiqTJKz9CXvxAM/ddNXDqZERJp91dww0PHrLx2cP1bah4uXOalC0UEkWxNxVUESO4nMmSp5+FMiccYtDGHbm2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145098; c=relaxed/simple;
	bh=6nMflZvMJMgWGGh3gas6TvYF4zUj/8fC3ydtDn2h0lY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MDW2qG7n0I527Mn5k9xO1u24cBMoqPtsTWwsaDn+noTQCjBC6+Y7mMdTm/np2y1KK0rbRDW1VGa/+SASb5SqxNvFEGI9+Cd578R585TThbB7MZsxHDmTbnXoDC9vbtSYD2plD3Z5IXg9dbm59lyIhFmu/zVoY12vkX6KrqBCPcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bk1zrW6f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fJayVWHk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bk1zrW6f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fJayVWHk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lHdn1797611
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lEyGzHWseU0y8G/3h8PBhHtLrahS4TkoKfI5G8pJg7Q=; b=Bk1zrW6fVMQbP9Hu
	+z+7SE7pM5YhieDZ7/xe6aCpAiCt2F+N1iNs0jy6EspynZMRGjr7tmHzZ+JoaRmo
	z+gqkuMjX/SlFguftuhuRYOiS781nXWVB2U+R5wZ69UkzkWEuHO7FY3X1ER6wCKT
	LypqEgEPlV5wi6pWYzluvCCIvOU6NsxlYZE8qNghvqiWyOX5dIofhiIGh9RaWgtf
	15iinKFbh/IGjHBKU5iy+bg8Y0/isrnAohtllIiQriEkWr+tB+GGGqYgskfmXU8A
	pzrc/d9DwZ2uDy93MvjZRiVtPBzT3lyvNd62Hct1juu8vnpJP0Y/sgjdv1C09a4U
	gpuKXg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a8a392-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:04:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5356c6d98cbso17138591cf.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792145091; x=1792749891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lEyGzHWseU0y8G/3h8PBhHtLrahS4TkoKfI5G8pJg7Q=;
        b=fJayVWHkr2xRlkZrqSm3ft5nL6pfPtj169b3TFLHXzoOP8Gpql/JxoqycDRD0fnwcl
         Bq2+DBptTv4/em916KaG70f1GFw7NDFV3oSSPvPjWs2/6JphFQeGmXzlUJEqsOozc+Os
         /+znLig0qdtfki7HlwTyUMknIWY6MCOM/HF9IPqkKWP+EhHtUSRMVNfhOD+N0yirCpp9
         4j2fcLe9lBlhvj5NUt6+xzY92N8QEKsX3siUT9/R0/+cU3+BEaB68ntO7JJORu5loyLc
         VEKi8tRNsnlHaxngL9HvAYDaW3R+MdaoZRKUudi/H/i3/VGwiEFZCWS6B+8Kew9nlLeF
         Lr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145091; x=1792749891;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lEyGzHWseU0y8G/3h8PBhHtLrahS4TkoKfI5G8pJg7Q=;
        b=bGt/YNUZ56cbmfmaOhuXkD3uz3P61WeJopmqCN2ZiKydPO0x5ze3pMEAMfAZfiFFxj
         Gf02A6ExKh1UXtLdLne/A8vfR4q3U9PEdC+gzzlkutBFHleOspYpJsSQoKNRyjCVmeFT
         26ru3GdMtS77SHG30COHlR15gIEBWEFzwDwDhSnbYDT6Iq5MrYWej+bvKhzvkTtm0jIn
         gWJEqT2KHfnO4WMMqnenYpdvXb54Sye5NE4jE1aRSTWRQzOQb8+neR8Cs0mf8psyxdxM
         zD2wq5/5wUQz+oarqk1Z7CyQRr4BqYQE38/0VFLQzV4OLuV9UEOTfk9ZqYDn/gLQcbHY
         uRsA==
X-Forwarded-Encrypted: i=1; AKwUvBzM3PoWfoSJsVz45UtCpDZ5gaGuO05KCMf79dC7MLjd4crRGNfy6maGtJKh4liqkytTPfU6ewxeAUCh@vger.kernel.org
X-Gm-Message-State: AFq9FYK0r/NwaDZINmpR6VWBAF7fr6SFjAq3ZoegsAL4bPdZ6jaatR/f
	KTlgCxvuDPjvJWJz7L4WRNIjwPTw3I8x/07WBT+bMX4Wyuzj8a3+x3GmBtuInjnLcyyMZZczc58
	nVz7RrOk5J2/OC/rrq+CH2CBSsOVYMOLCOUKiLCBLT3foXVnFmYdGrxhI+j2frDeC
X-Gm-Gg: AYBFou0wT4wM1Bm/Q5ynxwfDlDwV/nD5UDFtePj/2v2l2EULyAuncqHr7mCKbLR2mxt
	kyVPQpj6uryfqZaGce3evXVkdi0x26DujQ/i6bNWQYpykno6YJZz+7naBt/p4JHsfl8wMCjtNOi
	3SFw7EJ5bNGG8hejcZt4pkoozMXpUeJlvvlbxD+AkkP/nyEVVSh+PX+yNBEhNJRHjkXcs8y1TwF
	trYXQZ4lo+ftvUKrhaiW0pLxqJraxQjbQHD4BJrnWqb/+vJCk7HRFZQ7z2J5qACCtE9NOflTDIG
	2ZnBklIftPf7nqJe5VJlnWicyfx4nMOpKRjDi9ibt1+NtjVStQlnhBqhrcdZtC21C9sP9z607OB
	CQDqm+5I0SbJCqF/A5B/iTA==
X-Received: by 2002:a05:620a:ac16:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f1a1a2a48mr254587685a.6.1792145090867;
        Fri, 16 Oct 2026 03:04:50 -0700 (PDT)
X-Received: by 2002:a05:620a:ac16:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f1a1a2a48mr254581485a.6.1792145090280;
        Fri, 16 Oct 2026 03:04:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1334e0sm719078a12.5.2026.10.16.03.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:04:49 -0700 (PDT)
Message-ID: <204766c1-cb83-4636-b779-fa01bbd17764@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:04:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] arm64: dts: qcom: pm660l: add analog audio codec
To: Richard Acayan <mailingradian@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-10-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261003175659.23536-10-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MCBTYWx0ZWRfX+odL3Bkp4l6A
 myft0gqojluVFJ840p4CFMir2hjZ9c7CuDd4o7JiHJBctDMK/zm27as6y9bMnYMJR+KMiM265F0
 9ylFwS691h+TIqYFYyf0olioXrcTafE=
X-Proofpoint-ORIG-GUID: 3M3BuJxSA7ogelbt0_gUBVMeLR-m1gZ6
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad1f6c3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=J1RzbaDzFta3Bh0DJUsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MCBTYWx0ZWRfX8RPvb3EEiQ/V
 tBds5Fg+Gvxh5Li07ur8DN5FBSzkbTwRS5WrM5Y8zeefkwNbDa7lKD7fKANqdyJ4kzGWwboMJJx
 SRf/qvgX2za2O8OpGcVMRp00KVDjjkB66e9ZJYEZTBK9AmHtoL3SJmJ7IKT0+oaRutywuGA7e5j
 /nJRdf6t2DN3L6HJtGjo/yz9tKqs1FCz7/N23KO9W8T5i7V06e8vVLzY54tVFqELQueLZ1mUniM
 /03IMOyO46MTNOcfTpAguKPKAJ1AajnqR0e2oTInJVmruyXLNLXWlNeU91yB8WISzgwFgMn/cnC
 p0cJm9KZ0Z/G6JLysAt4LyKzD3GQ4YnEKJrAonsdALCJuhK1N2p0W4ViJxzP545DlpdTGVByJlu
 nNb2Pkkd9oUtiIliUqAoWayuikKZ4ncOvyG2Wu+rpAzzgaUshJPzH2STn5HWhG6Vs/q18L0sKme
 iBjgOwFOvcIppeeZq5w==
X-Proofpoint-GUID: 3M3BuJxSA7ogelbt0_gUBVMeLR-m1gZ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160040

On 10/3/26 7:56 PM, Richard Acayan wrote:
> The PM660L analog audio codec (PMIC revision 4) controls the headphone
> jack, and optionally the earpiece and speaker, at the vendor's decision.
> Add the analog audio codec.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/pm660l.dtsi | 40 ++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/qcom/pm660l.dtsi
> index 3f8b9eafe164..5b406b83043c 100644
> --- a/arch/arm64/boot/dts/qcom/pm660l.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
> @@ -87,6 +87,46 @@ pm660l_wled: leds@d800 {
>  			status = "disabled";
>  		};
>  
> +		pm660l_codec: audio-codec@f000 {
> +			compatible = "qcom,pm660l-wcd-analog-codec",
> +				     "qcom,pm8953-wcd-analog-codec";
> +			reg = <0xf000>;
> +			interrupts = <0x3 0xf0 0x0 IRQ_TYPE_NONE>,
> +				     <0x3 0xf0 0x1 IRQ_TYPE_NONE>,

I think all of them should be EDGE_BOTH

[...]

> +			qcom,hphl-jack-type-normally-open;
> +			qcom,gnd-jack-type-normally-open;
> +			qcom,micbias2-ext-cap;

And this is probably board-specific

Konrad
