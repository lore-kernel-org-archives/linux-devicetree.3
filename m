Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B0E4A99B8
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 15:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364215; cv=none; b=HNbcaLTntr6hp85BeMJptmLMW7qH8g5bpbLaSdXp3vkTfgwtJRjPJlqNeyzGL0sWqaShFz/EYBM4s2m/uuJDgK1HLK/tor2XyHYt0KU6uwIsmFzrvfWN0mSsLGBv1gGkLEGaxpaghcF1N7wkjAbFYFFjdzDAAJhfHGgYTYG3mm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364215; c=relaxed/simple;
	bh=zSyQRSX/ch71m5kpxscJdEN70k7ztZ1cUr6oUxNbrTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HoHVOaHYkG/UlP1vmID9/drC7UfqAPLHkKOktETISntpKiU/uRPsxmTXIKdI1XUaCI+czxVg7d4koaskKtcgT8E0K/U46lw2XVrZ2SDwjb3smwoP88OrwYi5TBXe3+kb18i30+euh4ldDEpRX2Du6poE+4a0Fu0Do5SKDUl6PlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ghB5WyEb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P1T3AQ8B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ghB5WyEb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P1T3AQ8B"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Fa7uY1907617
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 15:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ZkntpVMR2CtKH4DeLKNH7qEJxMvwEUv5ynrM9u0XQw=; b=ghB5WyEbrgwoWyVW
	gnV8u9oMY9eXCGCAhl8yU7grN+3/nO/HcKf6hDOgG+N5tyLZ3mdd2ukesqiLet6M
	QWR8S7W9bBwFwkMJ4UA1cV99YUbLVXjDVcsbJx1555+J0louMojpIrkNAUjzxxfv
	y5KZULp6Ln1czahpc1RL1daLRFSdkvZVClgYPNJ7nhW/9wl459YaKzcjtU25Hbwj
	5sohs7qWHsqwux53Dy/eSbId5GMnixJ+YkbLjWCkgDjzcBGDblZl+jXUGRETZG3H
	s+NLO4URGrKxlMzPFdlmC1UDz/LxVxn/2Nbj6NXwuj31T74GMfpOkGKX0yLlGW2k
	1oI1tQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geb562vyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 15:50:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso31872485a.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 08:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788364212; x=1788969012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ZkntpVMR2CtKH4DeLKNH7qEJxMvwEUv5ynrM9u0XQw=;
        b=P1T3AQ8BKvElnVTTjgSlqp+NvTUd+QU2Pj78EjTYn36baK2c8X7TfPdqar7PAYuA9W
         FFlgw5oD51G/cQH6lxTS/eyztoyWuxToBy3uAHjEAk32uBPi7+p+yU3zI0EyXD/TJQ/N
         ZPi37T/wl149/Nh0X5r/wG/ru2yRZzUaoA9EyQ+bBoPwIEgctx5sLyr79/YOsPVdgQY8
         EbZujC0dv9xP0tfgYXGHYaayTvEjXQ2uMClzVLpv5xWCduz/XBwwZDHUX8Fl3D95Lk6M
         8HE33C7N02xTEYv6KMGMQdHhCWbgO2esoW/SbH89BdAHH9aLDxRqjuG3Uvg5i69mDs9o
         XSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364212; x=1788969012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ZkntpVMR2CtKH4DeLKNH7qEJxMvwEUv5ynrM9u0XQw=;
        b=pniekCaH9KZV78InOBs4NQlkhOVPA3TA10jDFrQUthv0iyolxo2ywsmS2mKn3hTJan
         yVn0Of/2tdk7sUYgWhC3L9zbdtv9RrIahI0BG62+Nsb65fPB/0SNlMUNTM390YotgEb+
         RtyJ0qcJOZ+NZn9vBLVGAwg2/lNqirkG+4BYDmsY4pIFlpp1QesOpmhA1OM+HnQ5IxMk
         ia7j7xM5BvNbwTHVcbaOvCK+0mW1AJA9FwWAkBXyTLmE1N7eL8/YRT13FvVLKWxaThAu
         GXH1eQ3fsDvi5j7aO2C/zBs7NLoWaffMeq9PL1N8HWul7pV5uavTcwG5IhcOjsivrQTy
         CpOw==
X-Forwarded-Encrypted: i=1; AHgh+Rq9bVOfCS/Y14OltnPayI3butn4kbUpxEp+Z9EYDa7tZI53jb6+XU3s2NyhDPNxEOh4PHg5PTkuOmOV@vger.kernel.org
X-Gm-Message-State: AFuF++m2l8J+aXW4Mlhw48PxfQbQ2RDnhq+CsfftnO2zM4IbrNFSyP5P
	xuiq1YOHwD8/RfZiscqYmx2XahOBG1eHZGmRLl5Rq0wXkn+Q9r2OlquB1FHY97oc7jzEedweAK5
	1kjE8V+IMaZhd7fcvte5Vv2ROmrjwKkW1EWwTRNy75zjM1okUunzkUUdSmhgygLE5
X-Gm-Gg: AR+sD10fpOCcqO2eW9617GTqXCMVAlSza/NSEh6k58B3KhMpiRT/163zfKyiqMW4OuD
	maj0stgDqMsCrmGap/PQjS/WFoZyGz5PHnXZtlFjk2+VM1wr9g9oZsJIq+sHg6iKH0NW8FYcUah
	TC6QRcaI84ZSwo8RSWKizS4RyhJgAtFbwdeTuNnJGskAdjHE3BktvWUGfW9Q5QkF6ERTlBYyM/R
	oNweE0zX9YsaRO7tOuByR5lxhD4TdYDRwPHh8PIoiT/VkpoN9qTq//n3wxdvy7c3X9gcCDRPpEO
	pQx9m2MDPQXqG5mKmsLk+H28AiRWNvQIg4GHLHuwW4yeCJAhRJQ4cGzEp5XxoX/k9mwx1VtZE6f
	z7hRLoIr0kaOWW2pnm+U4Rw==
X-Received: by 2002:a05:620a:2915:b0:939:8bc:8826 with SMTP id af79cd13be357-93960df998dmr431892985a.2.1788364211711;
        Wed, 02 Sep 2026 08:50:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2915:b0:939:8bc:8826 with SMTP id af79cd13be357-93960df998dmr431885285a.2.1788364211128;
        Wed, 02 Sep 2026 08:50:11 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f8c7a0esm1336976a12.13.2026.09.02.08.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:50:10 -0700 (PDT)
Message-ID: <762f2294-27ff-44ab-b4b2-ffd415639928@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 17:50:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/16] arm64: dts: qcom: microsoft-romulus: Mark the EC
 reset gpio as reserved
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett
 <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
 <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-8-f4ab7e4bb75d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-8-f4ab7e4bb75d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzOSBTYWx0ZWRfX/kHVjJJ1LRdm
 LIBgpYySr5l+BLC5dX9Ddg0XAxsEGbUHWqipK+vvYokUE63TB+MHjebVXCSafT4R3Xy4HkK45Pm
 lIRg8xOyvX7TTtnugEsSXMl9GC8D1OWmzHDAc79t4vAkoZ09GMeUFUdVU49L3uvaN6Tf7Mt/auA
 tyhRzwxTKdgAFEVuE8WAYjW3pO5OxuL0ZC7EDkURanqRLiRx/JgT1wAwCEsoI0HKZfIhbl9dJi1
 bpgkmze4Kmbcj5c0So2RcFgR7kheae3d9WI8qNcEPZBUMT43mAPXcXzD/aoaNU5LJa8pRDxxFBd
 hHNKHKovvEOkxa3rcnYzVjY4fnJoQYB97bb2sx1CYVO9Ra4gVk5ZMogVkUzHlaMEzq/Xn3EYwUC
 OPPtxc2qkMUOp9vWU2v4YG7GazslistoAczj1shnENyHIyijUPfVFszA3q9IoNcixBjsKNEqAnu
 kkt7OV2324JPHl0Uw1A==
X-Proofpoint-GUID: 7iEEUGO3HdFBkDaUkgBdlgFMUtA7Vc3y
X-Authority-Analysis: v=2.4 cv=D8N37PRj c=1 sm=1 tr=0 ts=6a9845b4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Wad5cFZijfJPr_ZhbakA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 7iEEUGO3HdFBkDaUkgBdlgFMUtA7Vc3y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzOSBTYWx0ZWRfX8sB/dlxyfo3r
 yC9XZkf8C0g8DwzCL550Cfvn4W4N1Orl0qNcva2uPpMqJeLXKhe6IBj+dKSyblWl0OFsfOZHJ6k
 rvIa3oHCgy7l4D5yWPw1d/uPXjtwqB4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020139

On 9/1/26 10:07 AM, Abel Vesa wrote:
> GPIO 65 from TLMM is used by the embedded controller as its reset line.
> 
> On some devices, toggling the embedded controller reset line makes the
> device not power up at all, unless the battery is unplugged.
> 
> So reserve it in order to prevent Linux from requesting or
> reconfiguring it.
> 
> Fixes: 09d77be56093 ("arm64: dts: qcom: Add support for X1-based Surface Laptop 7 devices")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> index 13d0f09e0c2a..bc684c295b89 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> @@ -1324,6 +1324,7 @@ wcd_tx: codec@0,3 {
>  
>  &tlmm {
>  	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
> +			       <65 1>, /* EC reset */
>  			       <238 1>; /* UFS Reset */

On this device, GPIO_65 is an enable pin for the touchpad regulator
(or something else that is a pre-requisite of the touchpad working)

Konrad
