Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7223A2E2852
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 14:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779977457; cv=none; b=Qsp21Qo9oZHeQFjVnwtA60PnbUzHef4fXaP5hgaT1E6FsIMJQgKUkGy3uYK3JAnFCvae/hlzknlltk38GW0fRpm4VfPzmJ47ZQXYh7clfzGE14Z7Fj/b2B2MZId+tLBZeDVsLQVgz7y7+lFi1pRCz+XunuDhq5z3m5vbNsimlp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779977457; c=relaxed/simple;
	bh=4rZJVp5bncr+uawsObC7M/OUhB7Yjqizbpz8zuZmW9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RvN8Q3VluVevoqzGnzTQJvTMZ0hvnVEKn0tnA6M5bNQuMklOSpB3P6ME5I0nq9c+GaWRyJQ9rJb5R8tkIf3op/fOulXFQ/bcYPoxI7qjOiQYlDPGKKJ2mwmsD1xlGmUMm8JKUqlnn6ubqNs4V2lGVDgL2LUGicyklRRENEQ6KTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D78VVkFj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KGzeBcys; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D78VVkFj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KGzeBcys"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vQwi4016279
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 14:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJ6t2LX8Nf3WHTmQ5lnb3pmaPw0YLr8cKpgF7Dcvu5o=; b=D78VVkFjlkuEcyzV
	lA5MQoHG+VL+o//HIRREbJTwdUOSH12gv48aMjCVORR6d88dLvsl3OvOwfBRPrNi
	Q5FA5uGDReErbHRo9RAmcTfVU+qTbRWt3lpZt8WMKkDvHeXKSwtFaV+tGjnthuzQ
	+1eCuA+3k49fs+lXWCknDat69t8FSVMB8OqK50nsgcK2OJWbCiRygTYVD4Pgsnxt
	ZoSlO/awycGLZ505VX2jGI0car+hbc3UlGFUo2X8s7Dd9slO7e7HquBovDRZVSh3
	UosDMuifqT/2UFc4Iu2mf3O08uNizPJUUeh9S6FdRISZY5cByS9PJVh9fIU9QQjF
	5Jtv1A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y5b0q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 14:10:54 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-631289505b8so5115522137.0
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 07:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779977454; x=1780582254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJ6t2LX8Nf3WHTmQ5lnb3pmaPw0YLr8cKpgF7Dcvu5o=;
        b=KGzeBcysYasT/96Fvpr6rEWEuY9Lo97M3jYNFv01g+FVdrWblL59JNooIg8ZqDh1pM
         ncG/W9xy9x2IkwAJu8A70doY2qjgzHUK7FZNd9DeOXxUhMBAzghdg4y5Jp/wu80Ut7pm
         xa4s0QfGH+Q4KqO8oDradpryu7C6WnU6Tvzr+/Ze98MiQFdp69ySIFPy/hNdAB3k51Yp
         Kba+As70UyxRyQr0T8IHl9UitKrrXEt49NJm24vps+OaeQuBWdJgPBHDzrtr8cbCLAbj
         Ci/YoTyFCyZ4IFiOhY9rGjhjKtnEqO52sC+zjvteTsgj+V3yHaKEYvYpc7x9Wh36ZiKL
         TJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779977454; x=1780582254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJ6t2LX8Nf3WHTmQ5lnb3pmaPw0YLr8cKpgF7Dcvu5o=;
        b=M0P55YEZKiiJUV059zr87TD61973doZtDi2Cewm2e1DWsKvW5C1Q7LdAYyAd1msV/c
         YwVey7jIVBuPF3lJZVCekZO2qPF3gUMUmB0E3D6ghCPf7QbFAtRTH3z9kJZvat7BGps3
         Esw1tbgSB76kHGLU3UdIfQnMDrlfbj24GufqF93dekKiSCmnbq+2v4eXdJHoS+qfez43
         fhf8LWmONP2GH3qDF+qtkOMw9TIXWpB+FMrGUgMXVpzuOcEE8oznDT1M/wY0pUMlJ8ZS
         ut5M38dEkdbYQznq9e6+tb7AHWWAbAFDKD6E3diLu/E6VKl6gTfm880gzQ7U/hGEzvUy
         MsjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gNpShU/R+kuZRIu/5jpnPJwDtU1cBQRZksRL8JZJisSCGs1LpT6btrvD4x6qUbMvfj3yug6Ogzp4z@vger.kernel.org
X-Gm-Message-State: AOJu0YxPsza9u8A6uQTjq5st+glZUEdsBweYRsK8+dEsBL7BF8FfRKsv
	WPPOwglpNEjt16L9kicR4aRsK65oLf7jglTLJ/cbmqGmerNsTiakqzI5R0elPX0NV7sVyr7YaHc
	9u5GfAeeaqKL0OHhmKXOUzGeGyRHlcRLwVL4u43cdzfjHIHc6NQZ2zud25kEf2cSe
X-Gm-Gg: Acq92OHzWiWe0W8K1AYa4jKgDDBndY4uPbPlMNwLQTk4bm+cgMrLLoAHHXPQpoAZDX6
	fTFUIQ5asX1CRpAFedgfBYi0LIbLrVqvkPbDsIi+2FCM/HsZaQm8/M/Vz5yU/vcEoLurJ2sL1lt
	WHlHnaZc1VnION27rHJEpMzg4vxcc8sICt5r8oFDlSb2yrQ69kzwXe11uTXpU27zbasFq18iSs9
	No7OXdiNFrs77L3W50D9g2ZIrKuvwgVMSlAQe0UE+Hcq9wRPUTmxk+hXnkmPmomnSUqUfyu5QkY
	3hiq5QWVyNvPvZK76txfCHFWFoGLo2+DHou0rhu52/WFQnCKJxalJFmI7mGqk9Ejgtz2h2PzPsW
	SC+HClUkrS816H+sOHLoiBjMesFQKsdsKcSvk/KLjOtFC6bg3o4HiEeO8enLxDr5WE/FCLSd++J
	5kQNR8E3jMKaIJ8kuGKmc=
X-Received: by 2002:a05:6102:2c13:b0:62f:4553:7a28 with SMTP id ada2fe7eead31-67c8dbf6c45mr12405612137.21.1779977453687;
        Thu, 28 May 2026 07:10:53 -0700 (PDT)
X-Received: by 2002:a05:6102:2c13:b0:62f:4553:7a28 with SMTP id ada2fe7eead31-67c8dbf6c45mr12405549137.21.1779977453082;
        Thu, 28 May 2026 07:10:53 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5b28absm14324149f8f.27.2026.05.28.07.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 07:10:52 -0700 (PDT)
Message-ID: <14c628b9-0bda-4658-8e60-7781284aaee2@oss.qualcomm.com>
Date: Thu, 28 May 2026 16:10:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: s32g3: Fix SWT8 watchdog address
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Chester Lin <chester62515@gmail.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
        NXP S32 Linux Team <s32@nxp.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20260528120323.46287-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260528120323.46287-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OM4XGyaB c=1 sm=1 tr=0 ts=6a184cee cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RFvq1impTiYap7nS4gAA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: llI_6E4T2ZAAfFEJ5uYo0Ms8hR9pTRCp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE0MyBTYWx0ZWRfX7kcDHYIAHyV6
 x2asYzhvfNKBxomuq7h6rpDctyXIRulLqGgeng/M4CywQ4VGqA2zgLEKWhxtwBi4v+Y+z/6icJd
 KHM3+MfuVXRZvx3ayy++kK4BonShWLjlwTJTarbLAU1q9Iq0fbstmu3sPLLHPtyoILkhhjQfDrv
 QW5BlRIuT3TM4pJeC3P/MFvu+1TY9FfWMFg2cIToBonq7mZ+Q/z7Qe39Ew4kn9T6wnvpxb9LGfq
 r7tYbxkBE4XsPNVFlKjK3Rq2SnWYrXCnnc0NjPVPs6/DSO4ZIkG5U0ak/6xXpqvE2E+Hl6THDJz
 WQsDkzsK5X1eMLCRnb/njVeHHa3xkuK+XKc27BNZWE2gbNQDl+smzka8K7S2MsN5BC6uXhzoTmm
 jrlU2hjjVsNeWe1Kp2Tsv3IAcz/9Qqt1ycMe55HLMTloSCPrqGR6UW/Nc0dIPI29+Nd4lMl2jOQ
 Hv5ENlBA4dvfIHH3KVg==
X-Proofpoint-GUID: llI_6E4T2ZAAfFEJ5uYo0Ms8hR9pTRCp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280143

On 5/28/26 14:03, Krzysztof Kozlowski wrote:
> Add missing hex annotation to fix the SWT8 watchdog address in 'reg'
> property, as reported by dtc W=1:
> 
>    s32g3.dtsi:863.27-869.5: Warning (simple_bus_reg): /soc@0/watchdog@40500000: simple-bus unit address format error, expected "269fb20"
> 
> Lack of hex '0x' meant address would be interpreted as decimal thus
> completely different value used as this device MMIO.  If device was
> enabled this could lead to corruption of other device address space and
> broken boot.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 6db84f042745 ("arm64: dts: s32g3: Add the Software Timer Watchdog (SWT) nodes")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Thanks for the fix

> ---
>   arch/arm64/boot/dts/freescale/s32g3.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index e314f3c7d61d..7e28dff53a86 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -862,7 +862,7 @@ gmac0mdio: mdio {
>   
>   		swt8: watchdog@40500000 {
>   			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
> -			reg = <40500000 0x1000>;
> +			reg = <0x40500000 0x1000>;
>   			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
>   			clock-names = "counter", "module", "register";
>   			status = "disabled";

