Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421644;
	b=DVuggHx8vroDA9C+Af85jI7zmwtJiwUUQxpvRUedEXng+66/k+n4SITlN6bluaml0a1j
	 O6X81ZoqTPR1oxmCino5yQbx4aqsGlvnO79Ja4HFt0ejzAzvonP8mCFhcwN5b17rb4/Hk
	 I+VQlgIm2l5nLJqsdX/sLESN0wlqviQqaYdOUiPQ5Qv1naaVXWsBdmC+RSoWg7YNXxfgR
	 wU3An6j8WqQsHGIdFs84mgC52/71yH8i/KQKxLTgW71P8ZksRo/b4X/PZLM2C0EeIPEsS
	 eMsHRn+OP88UHlcgmZwoGboS3YaoU4A0IHHkySsBkd5VEHBjYnbryL3w+RN57k0Wkxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421644;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eK0JG1u1qqA7ghPWdXNrnsaSEhGioJpdcPdEtMTuC9A=;
	b=yyyo0J55z1duGo2d8i6hEuhfhZtvcc2SVp1V4VpC2LQhupANRK1NVbpTjZmgtdkwZgQT
	 fs79lxSaMl0Anni+fJh6LdjfQJWIm+ErQs/uFcvYr6Xj/roG+88kpoOMUrlhVwXNQtQ45
	 L4B/5cup/vJ3GPI7gfAt0TpI02aGVVdoa38iruAkajfxKPvkevg51STUMkzMqdTnehdQI
	 rUgPzt2QDiofCgl0xsqbT2rkSFZpb9p01+zGv4fCtvTmTFkKvcarq/iM22ZmVp++OjaUd
	 eRjamoiDOT1H2Xehorc00bISFut4T/vNNWyxJL2Q2mY+tLGkPfRGO460EaquZyl4krQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JDzs1drh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NbjU3ILD;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F42C606C17E
	for <devicetree.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JDzs1drh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NbjU3ILD
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB944973B1
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421644; cv=none; b=IVsafCSKqnsL6XET3Ev38utfCRkdwVSOeYF7LlRI/i+6wmYLpsbGcI1Ho5wRLqL3KFe+7K3I0LCrKNkHZ0MtKs8VUiQtLVngb9AkE8iXme4cTE9NOnZ6sZPM88oHazT9UrD2dOYMdSeKs5Fr4PzGtHfUFcHUHamqa10/STHmoRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421644; c=relaxed/simple;
	bh=iTgrOGbnyKTihKA/yOPRSWcSu2GJAEs2AInH7inLQ4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lzjrs7otr2LwvaxAfVEr3af8t8cWrR1Ouf5Bhc2bLYMWth58y88T78zIkAxy37S+HmGEDSnQtPSfVGXghXfW69QrROUFnMgShgCpZx3ELs3F8qHW7VNmDnfkJh66vJ0efeAwzNW4kPfmpg6AABEAdiLKjln9NHsireVdiwzhgHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JDzs1drh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NbjU3ILD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE077R3485414
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eK0JG1u1qqA7ghPWdXNrnsaSEhGioJpdcPdEtMTuC9A=; b=JDzs1drhI+XmFFj7
	A4+OLzDU4EJ3oOZ9o/jS+ZurSZEMV8nm3p4AfKzDQwCSY9Ifcb307NYxWEV/ov8E
	F5cITVq1QE0dPN2paRQMgTBlOlAgYDG4OtcZ7J7wz29LDE6muDYl6QYKT2K2k5vz
	BfrrBy4xTwNvRWgmIpFmrSPRspLtq9eLPOsLEHZH6YjOzqqA9JA/O6WFssI4xJZ/
	aE66fi/08ND7CQ+y3z7ihVJw0ZNoNATb0D041Mydw0qX9ydRXxHUilr2rEgpKbTW
	18n7TedrdF4IbsulGl39gtRf9kA0TGUvLI+kgfFOJsmx4+3c6zrSf7l1DqpTQ9cA
	Ah7IhQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48hqb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:53:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179d9bc964so6710186d6.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421639; x=1793026439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eK0JG1u1qqA7ghPWdXNrnsaSEhGioJpdcPdEtMTuC9A=;
        b=NbjU3ILDHlf5KyCKvu+uEQ4Aq5ydAfBKqaufzI0ZRGqzOmlZaJ1CyNGI9rjlDYLGmH
         kNyp+hefIgBJaP2lTxucXLc9rB0Hb7H8YcsYkpfRJcg/AR/Zz/w6w97jAaIYA3OB28jy
         nuWa0bznfnxCAkukFe0yqkliSTGSyzeNkO/ekIAwz4VL56b5OCes0k8H6nPe7Q9dS+pr
         JOnUXG50aFNHaY+z+IHpZAycKunvQGH7Sg/i8nnQ+e2YTryl4DvDvsDYpqj4Is3RecOB
         uxrJabFMXY+bTE71aiUDcC2ijw6F+LOvfDhnRO5VPAmD/6ArMbB8pX+xEMssnR32Qxuv
         6WcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421639; x=1793026439;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eK0JG1u1qqA7ghPWdXNrnsaSEhGioJpdcPdEtMTuC9A=;
        b=0WLWWwedkpSgUtst9fJ7nNgRvbtWruPm+HbCNKkTuN25WGWbxmlVFgblVVmycgNDka
         BvJMu4U5qbC/Kk21HTkDrDNSsM1z2GsZUC1Qh846hGa7mS7BJ+zp3Bhh9vqP8adoN24x
         sg5pa+l6yYnrHWSi12TMPkC3+zoEGEKjxqQ8AbLMf9kdn/fK7XLZEK7UAfWpRBgAzBrV
         tIj/cb1nmayfqIdXxz/w1cPk//4QHFKlXmcQ0EUtLQPv2S3x8w44o/VHrb0eCYO3rf84
         fEa9NMgi18BiYvioo/Jnj1253NuIFqLRKiGlFeK2tM5ysVgIH4uChgxqvpo7iJAHZWQ2
         /U/g==
X-Forwarded-Encrypted: i=1; AKwUvByeYCyKZaw83gwr7mYgZgSHYYbKLgnemHIg3kzoYFR9oJdtjCnsAq+rjldiZg7YmGSATvSl1b5/o5ta@vger.kernel.org
X-Gm-Message-State: AFq9FYLN+ma1YZXR4Q70GZCjDrtsSPqYbDNiZDZ94AuJ/UKVJ1q9HBo9
	AZA1VtwK7kIx2rxQRHzOI6lFopqsa82TLvAI4EH6NNzyoFc3Nd0MOxEX3Z178xaSOM5tvdHsrRW
	rEdW9O6acBf+DR6uotttRIBI5XCPYbiPWhqLGfR3OOi1IZ5za0F4Z+ka+TxdVedCN
X-Gm-Gg: AYBFou2ov0GOnXQPLI6qnu517cxD9zNqTJlpeE/7DFTE005I+Z67CFuVwnZjAs7p2AR
	d9PT1YL6ntON4EhX96X/kTm0LuNZ6w5jLirlMWTg/XHJQ4q3h3yYRx2zT4L2H2XT2eTaPwUpNVw
	UuWNhlgx8HenNvhLUM1F23iBMrKsz20taUG4DAT6epphjhwV8s2n1m7hxe/527ga4zDt8wPeud1
	80YoMPwdFBHPHzoRukRdysgwpgWVIbbFYJuHinfWPssCnwmpcmtfPYnRlYCW+xvP4uziz+ebGNp
	P22CAnTCQTNuayFoAO6t1/45KeD4oxRFydivbFXIpjTDNuG36uFOnzBT4a+dJgTgUYB/tGfs9Ka
	UxGkHa0EQ6HVjONRFYAJu9g==
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr1529446385a.3.1792421638753;
        Mon, 19 Oct 2026 07:53:58 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr1529439185a.3.1792421638223;
        Mon, 19 Oct 2026 07:53:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c7ff2sm4047490a12.19.2026.10.19.07.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:57 -0700 (PDT)
Message-ID: <6b6f7287-d919-4d29-b7cb-fa94aaf4dc9b@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:54 +0200
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
Subject: Re: [PATCH v4 12/12] arm64: dts: qcom: smb2370: Enable BCL sensor
 node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-12-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-12-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX4HFMIkbJ8EpV
 +vzP5cBmk3G7eqweguch+h0GHFpSnenjXgl13O7Bs+88O7KJ1tEvAoMwBh0yHQ3FfqYaQmi2ES2
 mA2aMp1AGGe3dsDj9IWHSfZkpKbdE029IpCJMcYm0c+fubaYaRtjP2Kipg2ugEi5PBgHLiibfSi
 MJa5HVPZzJCp5IsSdm+qkH3CCA1U3mj9mbg/2FxvLltingQAOrXzgvWQtTUgS/4a2OQNjFWovP7
 qPew9+BlFkWfEjcyM3rYGjswNLA+Mh9Y+7gXWABg/FJYgev+PevW3JscA4HgiQ79Ff+og0W/LxQ
 skGz+AwV8bKUWZqK8cjrM8du9S/ZC5e9+jIvoKsIKUeiD2tJpbBQEVRp3S5TeVFN7e8phC17cwC
 qxQZ7fPn83Gs4yqC+gXiaBsPSqf4EjWiwrdlCaP/NMmKkxvHFf81wOISxIoeK0UEaK8NNKtUBh2
 C8pj6SUKPoKtCeG+8bg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX3dpXBtuYXpab
 nmtD1/bXycmaLM7sTKnY+SkktjMAO9AU+EzX54SJJPn4kTDnFkDgDF7Ln/lMv9GEhkW/VPxcabg
 DYy3DYqhLZzAW/VSL8q1xSCwIm80jTM=
X-Proofpoint-ORIG-GUID: 5aOGnjKvEU0xITeYYPrSxOqcESlG2DOQ
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad62f07 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=55-3qADWK09jOtsAc_IA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 5aOGnjKvEU0xITeYYPrSxOqcESlG2DOQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for smb2370
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---


>  arch/arm64/boot/dts/qcom/smb2370.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
> index 1e02578e4ee3..4809b3d8cfe2 100644
> --- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
> +++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
> @@ -10,6 +10,17 @@ smb2370_j_e2: pmic@9 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		sensor@4700 {
> +			compatible = "qcom,smb2370-bcl";

Like on Hamoa, why just one instance?

Konrad

> +			reg = <0x4700>;
> +			interrupts = <0x9 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
> +				     <0x9 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x9 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "max-min",
> +					  "critical",
> +					  "emergency";
> +		};
> +
>  		smb2370_j_e2_eusb2_repeater: phy@fd00 {
>  			compatible = "qcom,smb2370-eusb2-repeater";
>  			reg = <0xfd00>;
> 
