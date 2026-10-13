Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9CE4FDA54
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 13:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897047; cv=none; b=SOqo1yfVbC9+as9INrYvTaIlp9ccMuhVhXNKxQNYytUWEeF8Yfhv7quvFTcO2Eu1c3X7jyzHL+sdMA1tTCEACgTjbW3hC8WqlRWdpKUsO4bUKckVr8HSzmFmLzXIZseYs/pAb7JCbCxCDyzuXpBDWPVCM+jV3G22PEKCOYXC2Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897047; c=relaxed/simple;
	bh=bsRO/iTejdthPjBoqHU5n/YPihT/szZz4iV8OFYt/U0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BNg32pPYuySBRn04Ixq4qO2zgIUMvW/eoUZHzOL56XvBbYfpZU0cm7lfjknDpJYc4hTWi00mdcu4cZ6fYFBaZTo/ws1dUpfBazrMGxt2D9kukcouL3EJufFSvegcm/r+2hGaMfq7eFjasTIC+3gM29kyMcY4VguRe/wDK69K9ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fTA33Mcz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bwMYlyMq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fTA33Mcz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bwMYlyMq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8xvv7790919
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 13:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	USyrGF8Nhnu1MYzPEZbObCNEl7rw6nWzZFLMaiV8C68=; b=fTA33Mczwo7uqbLa
	LH3dsq6Lsyq6TDBA1GXQowwDnxi06n3gvcjrwKMIMX+B/rnk48eRtq4Jf+gf62Rq
	lBgnGJOc8pCNZrK6+8qzbl1IFg/mn4jMqXdUTEEQC17d1PF9rKf0frcj3eoa40eZ
	SgOkBRtDtzuVvyhqNYw8AuE3NRqRoYcpTLKdkuJ+8RBJS+MqTWwPUn5FLAFRL6Wr
	ikBLkJySenp69k0LfSP0kLMWJ2S1gzT939m3YHlHI9NZ47xPG4Y4xUtD3RHZ2JWt
	NBTRCawxFyY+seJh8PCd8fs4YU8lGXNOJm5qvoIIHl3mQNfYbfS7ks1MsZn7AUGt
	x6YSYg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjs0bp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 13:10:44 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b04ea2d440so33304247b3.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 06:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791897044; x=1792501844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=USyrGF8Nhnu1MYzPEZbObCNEl7rw6nWzZFLMaiV8C68=;
        b=bwMYlyMqodTUcQGE3/xN3gryXPMlwqizy6anyjJDUod0tPnWk7sdqHIbFf2WjUd+sh
         2h1aMFIGM/SdEy7lPCyGoXuEcZPii3qRQ2zKYLubDm6+Nukln+W2JqzSTO2EEf29NyiH
         pTAs/8DE+nbiDARFIi/D7BNZzT5GA3ol2WNJDoXQ3tlpD0VBqbCipqxRVVtdNJLOh+wU
         dN3F9b/6yfETHNPGD+T2vfwYOFTz2SNeXsuaeKhB7Ute+AVJsBL2TMMZpAIBmu5Drtyo
         8vsrulebPYF1QTBp4umileApCqJ4UGcBHuV41wccgX3ys2HR7FEcoEPNjD/vUOoSssoe
         lY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897044; x=1792501844;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=USyrGF8Nhnu1MYzPEZbObCNEl7rw6nWzZFLMaiV8C68=;
        b=ErPwG4xloySdyV1SSiAV389nCgfpO5dmDFJSC8WF5AQzFYcxSd7tnNtURcHR99u8vT
         aQDK3mauw548Whejo2ypkNXibCcA4zOeZ309Pq4iOCur732wI4Gptx0m8PvxotTZAGsu
         /UM2r8ShF1qq/n1tNHzSE+2YhLQAWmpOK9S0++20Jn0IM547x/WRyb/FlrB9hG9Nf1ty
         CXgOM6v1xgU6oX7tbXC5SVbq1FYiESDKV4HFBgY4+D8YR5+yPXhYuotzVJcLJzpdrEf3
         sy5egds6JmjZkbxZq4WytMQz0fHGqO8jIFDxN4Kojyp/D7T0mtiCyvh5qdgiylm+4mC2
         zhqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzH645YWuQu1lXCB9dojrnCzp8PuDyBrcAm8rGEU0FOn/4fCvQxa6c3EuLnB/kF8zpk5xJFwseXlfol@vger.kernel.org
X-Gm-Message-State: AFq9FYI+n1ljlLFz1HVe/dpLWHUj/BHfBXL8ubnBfEElSQBpKpZicbCd
	7rbz/j+M/3zQL7QD89C4tzwmo6g6cfO5Mmk7DLURNBshp2YMjHDszAj1K4MRlmfOvAfQ+JjLfD1
	jxquvJzABR5LioBWnZhzWIWjc2UJtFu16hp7iDxw51cR9YeGmVIPkvdhMOGiq/CfnoHVntZlT
X-Gm-Gg: AYBFou2Z2q0Llxkf/+F5QXABk9kF3Y1f0x0CUZ93dtL2BULl9irc+ostgwEVe+2XzFs
	OW2Qg/YOzP3mirO8fx/56JZtgGf/KiQ32VJQbkiAEqCI1hlk6wptzPmS3WGGnLnx4BwDvmMh7gT
	InNtPiuxOuqG7IKZdb2gv20Niz3KygjW6Qkvm2YiD2mqtXKSUki/jGzk64VmZOa459hrXUckbjJ
	r1EIiKrjxRFWghbLrOuceLyjw/nhzqmPrf/qbRMEYMzDY/bYhV7+2/icL1CaN8vu5t03g4R/zlF
	KJuiJKM2HgZai+Y2Fjp49L929safwvizsyTGylvX/p7aI8icU0NtgtY45JpyXQozOk7rMAjkfi2
	8Bn1KgSSPG9a3vHAKL7Cl897wPRldecoUtLsSubLpju0=
X-Received: by 2002:a05:690c:6603:b0:8a7:d419:e275 with SMTP id 00721157ae682-8b07eded800mr38593027b3.26.1791897044265;
        Tue, 13 Oct 2026 06:10:44 -0700 (PDT)
X-Received: by 2002:a05:690c:6603:b0:8a7:d419:e275 with SMTP id 00721157ae682-8b07eded800mr38592897b3.26.1791897043515;
        Tue, 13 Oct 2026 06:10:43 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.80.129])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f22c8d5sm43613047b3.33.2026.10.13.06.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 06:10:42 -0700 (PDT)
Message-ID: <f916924d-a1a2-4d58-b5e1-ffeba9fd0b5d@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 18:40:36 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/11] arm64: dts: qcom: ipq5210: Add SPI node
 definitions
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-10-77bd3d68d850@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-10-77bd3d68d850@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MiBTYWx0ZWRfX2lHrFu150YA5
 Zt2ww5jNk34evB6pHW7FVECYLwkr0390x05t/tISTWsq4pNz607VUXW9ndenZIcWWLVsjj094Ud
 hdDrpSC+f+6+Ot5X00gFB1FOT9NFJgU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MiBTYWx0ZWRfX/tfc///o0D3u
 SF6FKpaULR0WTrXhcAXN1wYimpG6wbxDCs70c7WQXh/YjMD4nnp98Bww46bwd5qSm3pbPERrVeK
 V9uhhGyt9tDua1zXRvQYHORyEuceYUJCfu9tcBdM/RWLvJ69fhM9U2NVoUSX2D5Camu0sg8WNxn
 sowiQGWESsyUJ9dN8Paj6pCuZHWqYMq1NAbxAn2e5UGdyStRflDYEXYmYlfcFqob9w1Ss/P4OWH
 vZMDhs0SfyvmMsK9xZ1Z74X8kEAk6iHH6PQWT1BBz43KqEwkRY7vyGE1xhGFKfnO34hGxRS93rW
 l2O2Bwx062XmQecqgkQyRAVDfcVgc5oV3z4bY/yXYmNKQXdif6ryctkrS6ApoKvOUG8PqBci8v4
 dEXmWiAZfLeB9CCp2rgNIeZSFnFk+K3mP5lef9CCtV5b3NYx2qRQJo92TI5fQxzoIMnMTlRLXvw
 7+7G+7VJnsh1/LNdgIw==
X-Proofpoint-ORIG-GUID: JaJGqeSwPudAbLmv9NWpbIqR3b8uqefU
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace2dd4 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=vSQal4Cqo5fxyC+YxRTyzw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Yv4T5JIdxMWIWJiGo94A:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: JaJGqeSwPudAbLmv9NWpbIqR3b8uqefU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130052


On 10/12/2026 12:53 PM, Varadarajan Narayanan wrote:
> Add SPI node definition for the QUP SPI blocks present in IPQ5210.
>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/ipq5210.dtsi | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> index fdfeedcf5618..cf1c9898ddb8 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -418,6 +418,19 @@ qupv3: geniqup@1ac0000 {
>   			#address-cells = <2>;
>   			#size-cells = <2>;
>   
> +			spi0: spi@1a80000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0x0 0x01a80000 0x0 0x4000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&gcc GCC_QUPV3_WRAP_SE0_CLK>;
> +				clock-names = "se";
> +				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> +				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE0_CLK>;
> +				assigned-clock-rates = <50000000>;

opp-table here as well.

> +				status = "disabled";
> +			};
> +
>   			uart1: serial@1a84000 {
>   				compatible = "qcom,geni-debug-uart";
>   				reg = <0x0 0x01a84000 0x0 0x4000>;
> @@ -456,6 +469,19 @@ i2c1: i2c@1a8c000 {
>   				status = "disabled";
>   			};
>   
> +			spi1: spi@1a90000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0x0 0x01a90000 0x0 0x4000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&gcc GCC_QUPV3_WRAP_SE4_CLK>;
> +				clock-names = "se";
> +				interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
> +				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE4_CLK>;
> +				assigned-clock-rates = <50000000>;
> +				status = "disabled";
> +			};
> +
>   			i2c2: i2c@1a94000 {
>   				compatible = "qcom,geni-i2c";
>   				reg = <0x0 0x01a94000 0x0 0x4000>;
>
