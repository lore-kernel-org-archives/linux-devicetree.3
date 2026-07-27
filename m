Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B99242BC3D
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163478; cv=none; b=shMsUtoXYabt+G2PmusGNhR2g7zG9FhQ5JIPhKhF2J2eFU6TM9KO9EEWmrl3HoAH0PmERs9iFh0NP96Ew1Marv8HhshUv5zPviXRS5C62zNkqnd4w5prZB2Hwg0gylMEl6ykr10T6HllxkWk98NCK1EDF8TWdK6dieIJPC+ETtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163478; c=relaxed/simple;
	bh=XN3xa/48SqChZE3wm/lRlklcT6w8t9N6WIhdbCnXc5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BrZ0SvYFhtY+FmEhdxL1Zy9OifoH0wfrtwrTKuGMOWce/gCz/QMJ4Z49tdLMRce3KBNRQVJYEX/Gh0zyGMhhGtALWbu79iJqIZdsVMjVGTR5xP8KcqbnCQjUc+6Zhk8nf0Ln+v0zb2vaaectf/9Ltw/oWvTSYXx0I/Q2zH/pCcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDH0wSwp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QSJ8D5Vg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDH0wSwp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QSJ8D5Vg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDle6e033159
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tj5xAxumuNTcwhfMIoVyv0E6o1XgIr7Yq39yh6tYNNI=; b=gDH0wSwp8/jySBt6
	kNt7q6ZV7A4AFGeeGI0CJwodjzk1u8O1BCHbtFhm2G0/P4cuL9Ld+yGdffn7QBRV
	ZVefXjqeuLqa1oEDNFVl9ZuZyWE+s8BDs2UaYy4zcQKRVKjnkr3WT2P4fT6r4Mdf
	gffhzqiCyH/TeRNhkjhVipcKQDWRfesx2ECp2eSKlNdzyzwn8CitYg0tgTQudu9X
	Mze5/fMaXL8tqkkX1Lmg3GfNrKsIauY5wppGqa4dgxTMnzG+AikOAHW5FcXeIj7F
	opNr42EyiFOHjefHEaEVuo5L5S0bSRwhUPLYmZ3fhvEeGIjczzPqYkwkLLZxJytt
	NSu50g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4c61a4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:44:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52845bd815bso5202751cf.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785163475; x=1785768275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tj5xAxumuNTcwhfMIoVyv0E6o1XgIr7Yq39yh6tYNNI=;
        b=QSJ8D5VgizWY3Q4fbAc5xek0rhImYnn5jZywnEh9SSfVE3Hs2tgMGikKwa8Nm7EmOb
         IlxUB8/NLLD1WIndbZ5bOhIuaibtVVHIkAQy7VS90txK6DZiCYQCtUuPxbznGYvId8Mr
         d/fIKOsxEZ0GCjJz84ewI1gkwtilDrBUWntujiD2HI54rSimGsnvRl8dJWlkX3FvxyrY
         NOIjG2FQQC3F9Q9/XIo3FK5u54q8t8IBIcxESJtTg0psyceFPlmualXMCfFqQAUUORnK
         +DiMIDolhT+1Ok8dyFxyvDoD16cz0UjVnpXep/SmnGTJ32hccmIQ9uk3IOsDBQfDg+Jm
         JBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163475; x=1785768275;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tj5xAxumuNTcwhfMIoVyv0E6o1XgIr7Yq39yh6tYNNI=;
        b=YuzvwsuFOKJ1fBT/lkDRww+GsSzJ5+fvu0or53fmepI5WBxCFDBFaxqqWHRpjFhO4/
         craEwVorv7xktXsqeQ2FrTJage59dZrTnOduZn5R76qjcXacqhZuwNM/En4oP0f/IgPp
         Pn0Dcq54+RiscS3TEqE+Bt8H7stqWCNaWRk7A7h2sjeSWOxm3ZPN0TXY0LLHlsN8VUtA
         uJTTVantb0OYbV+dvcaQD9WLBCbinwHofY9++CIVTiBVARBPWq/h0canhHd6F1r2lQ9x
         jr0Z/0Zi9JkXCEbZ7Cful82IsIuMBxVVSxhry3lAhmXFQkUwGaaVAJ/tuuakDEEqYRI7
         fwmQ==
X-Forwarded-Encrypted: i=1; AHgh+RrB1vcH69Qgn/AVmftvtG1ue9DUAIaBKKXBS9GdTXQCD+Hua8PyGYFnzox+irTtPQM2MTYqqnNDUArH@vger.kernel.org
X-Gm-Message-State: AOJu0YzWKjfDISwgUE4GDehthEXTNxVTWfs8DtXayv5N4mdjj2WgzXPz
	xrNP4pBuMkzO3p2KpyUEI514etyAQtjQKCiGdMR+RkJ+6Dy2XRtn/pwf/YtRwdNgj8TrlJe2kEN
	VDMXua2w3dPpeb7p6NsoC6iD/vgaYrJ1tMfo4xWcStF80F541FOMd1G/25P/7cgdH
X-Gm-Gg: AR+sD13PMWf5T2A68cOEFL0MYYRY8mrO66+7C0EcQS+6sdM5FS1kSjnZBqk47i0OfxJ
	DHPGWWe7WaJqo4xU9qq2vm6T3hoPhzkJs7GSlVggami3JaUAw7OrjsclO3Xz7faleDfwuBJ7iVm
	PyExM78fQZwGk5iwgi37jelMFnCvgWjyRPEciGHXHsMgmipV2ElISa6oOnqDYEDKyOiYpDL714j
	fh576AXvXB8KDifurciuFscNGy/k6t988dWMzZwf6l0Yh0ugqRc3HmxFtQAPSPlCdvqN7+ll79e
	WykijakNELdi9+a4Q5hlm7bH7RKy5FZUraAaODr8go1mucSpoqRcZwC8jOvvHzsrxaFxRPrZiJW
	WAmoagDgKJ7vkJ2829iQu+ymE
X-Received: by 2002:a05:622a:a9c7:10b0:51b:fe41:4764 with SMTP id d75a77b69052e-529cfe3683dmr2895401cf.7.1785163475072;
        Mon, 27 Jul 2026 07:44:35 -0700 (PDT)
X-Received: by 2002:a05:622a:a9c7:10b0:51b:fe41:4764 with SMTP id d75a77b69052e-529cfe3683dmr2895131cf.7.1785163474685;
        Mon, 27 Jul 2026 07:44:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1e6525sm1469468e87.58.2026.07.27.07.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:44:33 -0700 (PDT)
Message-ID: <a93f11c5-d0cf-4acd-a959-53fecc996e5f@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:44:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: lemans: Add support for TSCSS node
To: Imran Shaik <imran.shaik@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
 <20260727-tscss-v1-5-beed14e72510@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260727-tscss-v1-5-beed14e72510@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a676ed4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=5lWD-fOefMpBFsrRanAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzOSBTYWx0ZWRfX42ewfyEZ4N/Y
 NOSdGTQdTWkqSmvfsz9DmJ8Ewdiu/uBmHhe8FXdFXrwqaKtPkUOfd9O9tLhClHo6SV3S5+sKs+f
 KFVo3kgfTKrSwJp7p+eZtVzP3SKCPgw=
X-Proofpoint-ORIG-GUID: DcqEGGh_0Jns7cEBDyykQmXCBOKNZcf8
X-Proofpoint-GUID: DcqEGGh_0Jns7cEBDyykQmXCBOKNZcf8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzOSBTYWx0ZWRfXwQhvX3eiAq1m
 x25QgoD6K5bPOFpfsRqIWsfuuvQ61cfh/J2+IZoGFyzeiSVmDw93h9r9fGLlBYkqJ/cM1f93Wd8
 mGNpW5ZY4yi3ME2h3dffzWNTisWlYECW/zcAd6OK35YzwxqgLClVHLN0ReAZef4oUuN/C5/yl3q
 aBtaiSrUJRbu/Rqyb6b9EoLlJEAx9goP80ccEEXh3fGMHF3/IcQVkvTlAMWumFRyYpvOXoHWqRT
 zxtF0Em1cK0147pPv0E8rn+/0WK04k6u4q6ZGnGpGbNJbhGpZzSGzewOYFjKg3Or84NL8+RB7v6
 tkNj5csp9/KNt4WGjo4Iz7q5KTvjec7b3HsYIMg1+8EzS7AQqNZz/r5re8CVc5d8J5Xn38QGjhp
 h4bFoKyPX2V9IZ2/LV7INA8IoEP6FG1cEf12ieNSFYGdkoVdAwX8cNDfUDRXj5j/0HieDlSAEFT
 ZSkGoe/1IruOC8CDHIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270139

On 7/27/26 4:11 PM, Imran Shaik wrote:
> Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Lemans
> SoCs.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 3b0539e27b5192582e0bc9ea248f1c0382e05030..e225292a1e41a5a313aca188ca04bb12474995e8 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -3023,6 +3023,17 @@ pcie1_phy: phy@1c14000 {
>  			status = "disabled";
>  		};
>  
> +		tscss@1c80000 {
> +			compatible = "qcom,lemans-tscss";
> +			reg = <0x0 0x01c80000 0x0 0x2000>;
> +			reg-names = "tsc";
> +			clocks = <&gcc GCC_TSCSS_AHB_CLK>,
> +				 <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
> +			clock-names = "ahb", "cntr";
> +			assigned-clocks = <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
> +			assigned-clock-rates = <15625000>;

I'm guessing this will only ever require a single rate - do we
need power-domains pointing to one of the RPMHPDs and a
required-opps reference to match?

Konrad
