Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396723BB115
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 06:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440339; cv=none; b=BAJN4g2nydpdLqz6/4jlAYIE5rnN6kiGAJ9Cdfn25LiLa6hyJaOB4Bz22gj4L8vusD56wZdHyBz4TxdZOAv++rpS6O05zcFck538gMYnNvBr+90Uaf/qSZn2kL5Tuu8u0CoY6Tz3o98LKUNoYCVSci0+Mo+Ygx1yiQQs2jxQJk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440339; c=relaxed/simple;
	bh=EAEruviiYG/N6nple+mn9NdhJEM/dZOzYksLjrNmyuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tiDC8a9+T+besy6N+WHZO6nBZJxIVwPuP8nknv11X+bZm6A3d/XUBvXNhZRqs9sx6sw7vtJdtXuqJlyRZmgl4hOAnebio9GMWJP7bpb0r1UeBTuDdZBbTOnNd+9DijbKAzKszK4/AEuKw2R+l0wPPuMTpDoVYFw2cNlewicFoQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gW2v5S5e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=frY4xPd9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gW2v5S5e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="frY4xPd9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BjXY1776135
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 06:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RLa/JHNXfr18gNmyy6T2VPCPOXnWuKMxuMPJcaRk978=; b=gW2v5S5e5sa5Yb41
	tkhYl/JefCzIgByxIoWKayWoEjlGs+o7BxGfrdi5I7/DQBHO9fG/857kGsp/r1YG
	3dcOPYIdnm9yYD2D+CYaipsNYW5Wd6uz3BsA1OyD8k4iR63P7/QXLahXZFslPUif
	njCLrDG6P92+PnIhXv5A12ld6WEU1WbDSOL6kpb024dAZWUVl/UCdIh3h6o58+bh
	xPVyr1w2O5hzt4QBVMektOkw201yAfcWMR0otA3TeQJv73CghMsXwfKgh+ZYMZJA
	X/2hKzAhZXUj728/QTUQzACXEP9sl3gQLK4qqHr/n8Qg025FhQ2/TO8PE86Vq4Y+
	sUrjgA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe39cj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 06:18:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e2d4a8623bso47946775ad.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 23:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791440337; x=1792045137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLa/JHNXfr18gNmyy6T2VPCPOXnWuKMxuMPJcaRk978=;
        b=frY4xPd9+lg7heXH2YL/tK6vb5Sa/p5bewYSbQcaxKFrMp007qEvxJDR2aHviofwxz
         J9SVn1XjVKBj4bLYLAKngyOJvs8ojcuGid5sb3qNZVnDol2eIHYSc6AmgB9O87q2w3HR
         Mox5c/vGgYshSsA7AyvjEr6OBuikJhi8Npj+in+s0W6GgN5Jg3HSdpQYooa+4PxvaGD3
         jSUSJSwgJm5tcku4Bnu0iuPOivQx0tUzXKBSg6/T/vNswvlX7CTwdPU7r28F9ByLlmrc
         ux/UpJd83eu7KX54wFcuY/ncjgNHPyCYAiiJyVpAmEWbkgyDIfdwycwuWFOW9bngJZ5M
         7Exw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791440337; x=1792045137;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLa/JHNXfr18gNmyy6T2VPCPOXnWuKMxuMPJcaRk978=;
        b=fMticKp976lnJtHEjOmUm4Nk3HCLwdZfTlQjnWEjFVFZs3nEHyYVNyVwpQ0yQogbOz
         xve8ly13Ss2dzHoOD/hJUc+I0OB05pSC2tujVwYiSU83p4FuDxLxjvMlUaDWP4Ntsxkz
         Fgr4lIAUshEUl5BCsCYKglxlhEL2a5eva0Wp4n3gz8dWchUxTbCW8mXyULntbQ0eG1bf
         L/biT9CfSp2KRwgmGmg05FEwRilqBV2zviRyCqXmoFyPV3z7L/eySvj+Rz+1B5azY3OX
         0tagMnYv63R88BZSl7DP+qx/XlDi2DolsrffmTTIZ1EYzmfKWT5bz6WnE7qtPozfsDFh
         svrg==
X-Forwarded-Encrypted: i=1; AKwUvBxoj0skr8OTDocc8ameFTcJwPZpSkossjCMhFVtw7m9v8cPkaUsgl0trJ7SUYCp7pXd7KShJJplCAdT@vger.kernel.org
X-Gm-Message-State: AFq9FYK+gWsOHNRt1GsUyx2LVGtlbYRXPOTY9KTT9iNwhwUZ9DHKwoSN
	IosF2AQO15RoprFHaXShUfg3gXagSWH4bG6vPBxakshi+AYJaMMmNLJMkdHyzJCQxhPWsnl9zoE
	1wt+I95C4M8WtJifHkTSZYAVVVvdA6L/4Rtgf0Ga9XUfg3ol1bsteSGbYM6CcTwxI
X-Gm-Gg: AYBFou1TdGPPwpBXJIUDv+TQE5dLOTlSRtAk78Gp8a1t18pgpXMcWgjexM8TDxJjpCV
	Nx9fGkx829vWZHdmgJyMiguTsY++81cBWKyL4NiVuUFkRmUTAPRrB58jAVQ1QCo4rKGhnBdX4nW
	UVKR9+AfPCrnc45l6uw0TPtfQeDWaD15b1RZ+6Ik6PwZc/ld13XyG3SNGIi5hT/n9MUxzBRTaBw
	b4IeJOiXsuD+LnNnmSbWfNITiZQ11JUMoWwhYh9OARur5EMaCJzB4gf21NzyqeuPKbk+GDvnk0q
	SIKjXOI8W2rsnZ0Uq96vwqkbTHloBboCf4PFYdgmCVSuo8GZFxSRkiRVbthb3nbLvMGIDQhbJZb
	IhVqaXU/2XTy9sFVj4w8THv2ZiyY=
X-Received: by 2002:a17:903:2445:b0:2e3:1bb4:6121 with SMTP id d9443c01a7336-2e600510556mr38286125ad.49.1791440336586;
        Wed, 07 Oct 2026 23:18:56 -0700 (PDT)
X-Received: by 2002:a17:903:2445:b0:2e3:1bb4:6121 with SMTP id d9443c01a7336-2e600510556mr38285425ad.49.1791440335008;
        Wed, 07 Oct 2026 23:18:55 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e606da8fc6sm19674205ad.58.2026.10.07.23.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:18:54 -0700 (PDT)
Message-ID: <41c5a595-7f40-4505-99a3-5041641fb025@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:48:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/21] arm64: dts: apple: t8103-j45x: Add headset jack
 nodes
To: James Calligeros <jcalligeros99@gmail.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, ajay.nandam@oss.qualcomm.com
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-13-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-13-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac735d1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=UesLP-FnXeQSrw_j-0AA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX0PeswDmqMa57
 4jykKqV/OhDrtrOHlK3yhygzZXv+ukZNw5Gx88N4QiWrC8eSQxYEdhx8bwiEgevKA38cs7EMPvx
 Nh6Rvqdh48dRt5UioYIeUTFzNPnGN2w=
X-Proofpoint-GUID: crxyAhqnC3076ejAWyr2dSAZ-iluRxr-
X-Proofpoint-ORIG-GUID: crxyAhqnC3076ejAWyr2dSAZ-iluRxr-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX16nAtwmvOW+e
 nPXy9WGsLlKYDef8qALKEyIGS3AYy+URE392JfgMseQ7c1Bcd0XTcvDpfBtURwNaj6EuzPToIiD
 IKd1U5N3my5My7g/YzDjF1O3iLNAF7UJbHuKWQ4qNseCU16EW+kzJa/K/H4uaDVzSA6aQPCHqdk
 NYkYjTgoDRHkcq6Mg/sYlmOD4fJszkwcF95vjB69L8C70tWjo8+6lbPMY32ZpBiq9mK5qfx0wkF
 zarypC9x/fNq5Ld1WsijpoUH0S+mP9cXqbpbLWTljEWZ0Yn+MbjjbtZiS4iBTEPMCprsn3fygoT
 +lLjg5RQ0kXfs6Wu8p1qi8UTlPYvQJ1KoFrzdMLjOzbFJSvjbEQRYDDOAhoSb/85yT3IoAZcL/K
 p7RgAcYFF+J6b0ynEhAG0P1gh2FO2mMy/3BdkCsoTQ64S85N3Nni+v6fUSpb4juIiLtjksm9X0P
 hligWCAGEQECY/tqxHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024



On 10/4/2026 11:33 AM, James Calligeros wrote:
> The M1 iMacs integrate Apple-specific variants of the TI TAS2770
> and Cirrus CS42L42. Since it is not yet safe to expose the speakers
> on these machines, add the headset jack nodes and advertise them
> to the machine driver via the sound node.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>   arch/arm64/boot/dts/apple/t8103-j456.dts | 38 +++++++++++++++++++++++++
>   arch/arm64/boot/dts/apple/t8103-j457.dts | 38 +++++++++++++++++++++++++
>   2 files changed, 76 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
> index 090c97bb781b..1fc74ebf9ab2 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j456.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
> @@ -88,3 +88,41 @@ &pcie0_dart_1 {
>   &pcie0_dart_2 {
>   	status = "okay";
>   };
> +
> +&i2c1 {
> +	status = "okay";
> +
> +	jack_codec: codec@48 {
> +		compatible = "cirrus,cs42l83";
> +		reg = <0x48>;
> +		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "Jack";
> +		cirrus,ts-inv = <1>;
> +	};
> +};
> +
> +/ {
> +	sound: sound {
> +		compatible = "apple,j456-macaudio";
> +		model = "iMac J456";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		dai-link@1 {
> +			reg = <1>;
> +
> +			link-name = "Headphone Jack";
> +
> +			codec {
> +				sound-dai = <&jack_codec>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&mca 2>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
> index ebddde75455c..d8ea6bb53b3f 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j457.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
> @@ -69,3 +69,41 @@ ethernet0: ethernet@0,0 {
>   &pcie0_dart_2 {
>   	status = "okay";
>   };
> +
> +&i2c1 {
> +	status = "okay";
> +
> +	jack_codec: codec@48 {
> +		compatible = "cirrus,cs42l83";
> +		reg = <0x48>;
> +		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "Jack";
> +		cirrus,ts-inv = <1>;
> +	};
> +};
> +
> +/ {
> +	sound: sound {
> +		compatible = "apple,j457-macaudio";
> +		model = "iMac J457";
> +

I don't see 'apple,j457-macaudio' in the macaudio driver's OF match 
table.The driver comment instead says J457 is compatible with
'apple,j456-macaudio'.

Should this node use a fallback compatible,

e.g.
   compatible = "apple,j457-macaudio", "apple,j456-macaudio";

or should the driver add an explicit `apple,j457-macaudio` match entry?


Thanks
Ajay Kumar Nandam

> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		dai-link@1 {
> +			reg = <1>;
> +
> +			link-name = "Headphone Jack";
> +
> +			codec {
> +				sound-dai = <&jack_codec>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&mca 2>;
> +			};
> +		};
> +	};
> +};
> 

