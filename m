Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E180043031F
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240376; cv=none; b=ujOvMQ+iBtMmwmBEr0uApdsxldz+/51pgDNCJRS6/3zRg2oIZCyuF2Gu12qSzg0r9rrOvCX4ljMHS/7EjC9y4RIZBCVynPKiiVRuLKW3MAoACCXUXkAMeyHdty++zfkSXavUmyYv3e9/26Xdf9wlaumsr+Htkazfhim0jZXbP8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240376; c=relaxed/simple;
	bh=DtghnU3zUVvgE4G94jCndqj827sk2LBqxMt8/WFWoWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o9tgS/W+h+meFxut5QEoO8Ned36e1wv0vB3joeAhIerwPOsxu9+M83jp31PzkPdlwClu0zkbzpIJk24jb2IKeMpR/vHXYNN6UGW30yRRaZkObre8i+q4iipRjl+e/U3gnojofMdpmygj4Z38djO/7BuY2hiH7jRNDSmljyscPo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MjUUPzTz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hj5EQstp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MjUUPzTz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hj5EQstp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBHhAk2941429
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F6ytuslCG0pq1HL4h8Lyr149/N2ytTGcDm3j8uDWkuQ=; b=MjUUPzTzjv1KiOP6
	Y3by7YgCgd8kY2oL7V+QmWTVqSeey8SNO0gAlL0D+r2X+m03cUtFF8wH8qJxMp73
	BOgG/sEnJeQh8RmX+EkkNVws2rAHTkctc+5K23imjm/XHAuPd8f0N+A6cVYuYwOz
	VXv9j6k/ndmMtliDkCyfDjBC6DTk40SttqSiUH0RUamuKtOxb2bYH7hByMgdhk7Z
	tBt29KUvsN7kepcyh5AFutK7wuA3zP+v9XpB0uL4hiNeiScgN688bb9oFIIafL/e
	qMKZmXn84eTF1q6n35enCul3Vcyx3v9Qx5iV8ODk+nrC9hZw1BVSVl7DmYac8C2k
	omohWw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpmy11vh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:06:14 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bfc23053f6so94370e0c.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 05:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785240373; x=1785845173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6ytuslCG0pq1HL4h8Lyr149/N2ytTGcDm3j8uDWkuQ=;
        b=hj5EQstp4OJuoj5Pu3S0LX/JxRRoZqFkh3IG0vqtcAKf+O4h/p3NpB9HNKFK1JuxlI
         MaBae1vzYMGxaYEHyHMgPPwkVmKSpRWNro7TtrFMXneyacBUqlkt+kJoXomdad1HqsYF
         fQL/zxCAW9/WjUfg1X+usn0LU4JxEdr6Ifr+K0ahGxvh2KmaInDSSS2dwoXRt4+bBINq
         ZOMLIy2jQ0ekHhCXqdZ152QcUAUXxXwq56NUKX/yX2M9ajCiEMPhEOJeANZpFdMZWI67
         tXebd5tbKUR7Lt4Tpj23PvK6XCixBXbjVybTVSgAMgdeVk8Cg5MqUPwUEql/RqzaKGrI
         RNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785240373; x=1785845173;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F6ytuslCG0pq1HL4h8Lyr149/N2ytTGcDm3j8uDWkuQ=;
        b=tCg/aLSC9UplIEV/zP49S8LrEyUBu9EQa31pYCq7C5cK9QdVUK/xtkJAYWMzGWqFFa
         QbrVUgwtKCZ+I3MO1l4Xctjt/GQNSA7qx8B0QC6L7qY+P91uJku4tNF7LUlfBg6NHMnL
         kGuknemGhyg86A/qb851sdnHiEZ+t9rpn5lqkJaA8byS/2xk8F0nS/Rwi2/F1iqmYgIZ
         uns5OeiqjyxvzqMJSnR1bwB+UvIoMbN4rFyAV6JXxYOPSRmpRGOG9HON39MueLMVhw9q
         MLT1fVdDqhhpc1mHBrJcpaQ1k8E/cMORafEufjMM5ckQHCjWc2l56+ogxBnjK4Nff7dy
         7EIw==
X-Forwarded-Encrypted: i=1; AHgh+RoylF+9A7UPxRbhgblhU2LOmNRiv29nfydr/3l3n4mXIVfJRIRA/vUPQcigT1Eu69IjeN0t6ZFE3eUo@vger.kernel.org
X-Gm-Message-State: AOJu0YxYGQLRB2JkwIGJWuOqFFZzkWkO5189TiaaeiOsOw7QnWhZe4sU
	SqJ2SaCHZ8T1l+bssmTkZAhJG6zVf4QpjJCLivG7ho779xJ8bZxASBwaHAVg/5m7GbQspZE3S5u
	C7Dkd26Pxw1yIPStdQG8rZeU6U8enUw63YlX+SrQSkV0x2DhRo6Zv6rdc5SQh9uo2
X-Gm-Gg: AR+sD13ZoWfrhjTY0d9u3Owwh4YxcIvpSkEAEj9+BR7ds9+8OxVC73jeYVmT5ugGe9w
	GUleTaN74Mj9Nepzwb2So2M3SCQ00E+yltRmONQOdbord56Yrf1LAO0gqiyVVCnLDNF23Xr3gfb
	86kGarbzo6fES3pXFM8NVSiSk9tvuOlhSmtTEg6oZJv+CqipCcwFdrGpkI8Hjprl1iTOzbA22rl
	91r+61M+RrQkzDSSQlYTdzvrXnYmD9kZBKgEVjLMP4azCJdzYWFW+RvShZyLG/6Q0qKeOq8BI4Z
	+4bQtZryeZNkJiJMbLnHGVZ8nOgQzGygD8sm3MHXrTkl5n2oSLNp3w9FlrcYkRKB7lqDDOtr0M6
	N3lIrLcEaqfzWkrodfVhHtDZS
X-Received: by 2002:a05:6102:a49:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-7549f65b2a2mr308544137.1.1785240372999;
        Tue, 28 Jul 2026 05:06:12 -0700 (PDT)
X-Received: by 2002:a05:6102:a49:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-7549f65b2a2mr308523137.1.1785240372533;
        Tue, 28 Jul 2026 05:06:12 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb51c98c5sm3883878a12.11.2026.07.28.05.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 05:06:11 -0700 (PDT)
Message-ID: <ad142a95-ffcd-46fa-8d55-b3328bc00e20@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 14:06:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: qcs6490-rubikpi3: Add 3.3 V
 output supply
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260723-rubikpi-next-20260615-v2-0-47c5add80114@thundersoft.com>
 <20260723-rubikpi-next-20260615-v2-1-47c5add80114@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-rubikpi-next-20260615-v2-1-47c5add80114@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qDhC_bDjPAqAyGZFNe_J93qXdvDQ2FCJ
X-Proofpoint-ORIG-GUID: qDhC_bDjPAqAyGZFNe_J93qXdvDQ2FCJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwNiBTYWx0ZWRfX9dgVbpEPBjWQ
 d278YXwWwoT/yAK/al04TSw2nCqyU1ileR7tmcKeUbzPxw9Q1W0FeRtIvv+v52DaIYHQVKI73rX
 1tUCEW1nXV35Q0Zvzvh0mVG8zjW1gFjUzKmp0vlGpaYAzx/mHyTPSNWm53eoFFqsqSm3RonUBvh
 QPjEwyGajHrUEY2HI3jMwhHEF7LU2FRYBmcpho5c0ZeuqwRoMtX4VhGUZTYpMxxPLMEhnbhtO7I
 yWlK3KlG3KrhkdweUqo5CKZLq3yCi86fObQDqAK8rU8s266ardM6IxnvItXl6y6pGWFa/88xXfw
 4G84b4TO8VrD+PWBR0qwV4p/Yg7mBL+4Hf3FEpqqeaL+m506C3s64xdvUbtZpo1He4q+BeUdLjp
 kVx0qN5hqjlUxEvLSckG62QfJf5UC+5EDfve2zQ9vg4bnToRiJ0CB7IhLxqqYDl6ybW5vOjW9Vw
 Qa3LwC+5Q8+CgjFZgAA==
X-Authority-Analysis: v=2.4 cv=PJo/P/qC c=1 sm=1 tr=0 ts=6a689b36 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Wdb1h0LgAAAA:8 a=zsjO2eMJKmvGp5MnGoAA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwNiBTYWx0ZWRfX9EACiNwXtLy6
 kgcNcZyXhYVJSUimafiMw2sLlAbCPw4y4BtAMJWU2xuW+TkGeyFhB6tN82+zio8E+RMzo/MNnVH
 seDuCq39z3Artzjz9Ot05UnMEVpXzaw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280106

On 7/22/26 6:12 PM, Hongyang Zhao wrote:
> Describe the GPIO-controlled VCC3V3_OUTPUT rail. This board-level rail
> supplies the two camera connectors and the 40-pin expansion header.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
>  .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> index d8a9a7e47bdc..45514918562b 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> @@ -214,6 +214,23 @@ vreg_usbhub_rest_1v8: regulator-usbhub-rest-1v8 {
>  		regulator-boot-on;
>  	};
>  
> +	vreg_vcc3v3_output: regulator-vcc3v3-output {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vcc3v3_output";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 14 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&vcc3v3_output_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-always-on;
> +		regulator-boot-on;

Is it really on by default at boot?

Konrad
