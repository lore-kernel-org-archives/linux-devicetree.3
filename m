Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16DB3D6CCF
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780553720; cv=none; b=JLHBTnR+RnBYeehli1sBhy98tkwsn1cH2kdZxvkNJjneNMfjwE0R9NGYbcFJy0/WMP0XSojT0tp4gj5YePXI5X5KU3IzBmXWKJP8DEaBORqvNxurSwJZsmM4FlL6GtX9TvOhEKrs7CzJFTvkzvKiRqb9b/4Ip29XzyoXSc7CD+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780553720; c=relaxed/simple;
	bh=l/ipR7J4Gn1OuOoiyhxZtBOgRqVxGgZsG44uG/aCGdU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=F9HTkUeF7E0hpWhMSwK3uElMoM271IvnroF6avebJcVfXVuTPYyoD73+8TNLbLRxuSgCJwBHwxc6ulw+Y6Zr1sU9GfdfEb8rxcnQrvAXn7TzKV85Gf906YdNL7sTCS29yu/0blxUV1pNWLxXCTrbV3+5uf2bf+zTEPC0pUo7/4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOj0p0pZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hx/Rtj/9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOj0p0pZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hx/Rtj/9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6542ULGV3552309
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 06:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pm1lmiRraz5tQhBBiQXHAywz2nv5ol03QuUwN7r5rmM=; b=YOj0p0pZTfOeNsdf
	tpHy7bUuSPB3al2zgsjQSY1R0yPszYZdgsfEYzSkX7xO4EIvyaBFfzAad4R6MHkY
	8i+E+Nl2CN5a0DDyPYORL2slZdaJOVQosrSaus35IZG2AzWKvwAhFm4WHK6TlCRS
	EjfEraBiNF4m1OAVJUh1392KVPgv9bUyJhOPzMHciEbiLWN08Jf+LOvWF+maDVfF
	BFiUTPV95mGbCwdQ9VwgzxInPEIUPhZvL9r3zDKU6+iEc2vtSsXSbHPX1+az6Ak9
	lNXxcivpK3dAVqLUpEsJBS62dMNnAl0MjI/eFAy+DEnxYol5qNi6SMrH0b6GDESb
	9mY6DA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj9mv9nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:15:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36db995d083so290955a91.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780553718; x=1781158518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pm1lmiRraz5tQhBBiQXHAywz2nv5ol03QuUwN7r5rmM=;
        b=hx/Rtj/9GfPFi52h9oHs2/GcWaIKvDcsEeJqQs3J5gSTx2a+aQr/TjvrRDVlfvfdb2
         NnoMyD3TsDVYwYkQDePzPUW8WRQg9Cb1XGZvTmbjeiwcW5DEiMq40efDAG7Wsjt2QT5a
         zg60Gl7UQn9P+bohUTFeU14TOfHE53v/zPrQKmB2/DOxo3qBVMEW1XhDfvniQoIQTrRP
         jewbOxVRidW5IgiJUhzBwdtvjDahoRkXquR20xwgFrZW+qEUc1/bsckRwGt/8vXkvqXE
         PgMkEKGvYAXic/oXFxXuGOosTOfdFxggLHRw6OKfKaMHbt2Hw6Sy8NENpQW2UdXjA83x
         x0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780553718; x=1781158518;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pm1lmiRraz5tQhBBiQXHAywz2nv5ol03QuUwN7r5rmM=;
        b=f/asyL1tl8mRTv/qJO0i0iIjiocd7q2rLYLEZAENWKVBSOfjSvjPUQm3UonQwngsrU
         Lqg+DA9ebJ0DukxoDKNEMKZcsvy3LLmz0gkxc/jaV/10CsZITkOBIzwtQcw9rN9H79oK
         sdtQZ937LCPu4QlXWRw3oQ7D/WzfeGQIsnLi3T78t17rX7dNS0TiyqaoF84oMJ/MODCq
         HrYjS7l5vvMY9PkSFvev0JxrKuUnvULPyTBSmcJkyHiPR1HXXccNR59lLEjExp6IwcC4
         PgbdO/GHZt0VtVXHHso7frAlOehDwO9G0wJyABmDwb+3EZe9N65ab91NbYdaUnl+rqxn
         d0fA==
X-Forwarded-Encrypted: i=1; AFNElJ+Kqlon1D2/IzmD3Mhy/TpqMxTnCHVdzXghck8Z1EJmeD3XI9zXwSt/M/scToOtXk0hZ+zXa4qJeh4d@vger.kernel.org
X-Gm-Message-State: AOJu0YyvHqRi73Cvk+lUeSoYpu7fcD330LqoKwO152aYCg3InhfyJRHr
	Wa5St8Gmyzufo+SNZ2xt7+5AfuaSbSefV/L6tRUd3LfbcyMYwLi4qwqXDfyV8DznNTSIXuwFRra
	3XM4/9WjwUd6kb1uSAeb1nVuK+LsUnVbbXrbfKz0w87egscROMjOTIhLUAKTDlPpK
X-Gm-Gg: Acq92OHeEoFR2uSQUM3SmApJwB/lQX3t1T/HO/0v3yQLR5vPZ0u9d6Ky/P/7UbatKSm
	bayyw6iDfGzg15jdUfpIeTqRJCwBCt+/bTpK2GgOwWzeNl14s84WrCvLj7oLRd/gw1oKpBe9pMd
	vaLBKQGbyre4vQrNyttb4qzKKxbGa7ZYrmmn48R17IWN8WxieB51n/SmEvv/1Hb0ZdAcX9dreXl
	cSSr/Q7Ftq2oS7+kmHCZrbVfIPs6oFzzvPGkmkzbSOJhxFL8yxrZL3mG5IUfWRAImqnWM1GN7H+
	+5OKpvbnO2jgavTpxa19O5khMdn2wQROPA+amCjNdZnOscpv6Fiowxk4zABMBIW86xctsqz6SjC
	mAbeadZ6dB3jXlsYuZkLO8SMhyKf9qoVL9vmEOb4vvWuQ4kKAZ5nMDV5aV7Agta5r
X-Received: by 2002:a17:90b:55c5:b0:36d:bc21:4ae1 with SMTP id 98e67ed59e1d1-36e33ba4a37mr6551045a91.27.1780553717671;
        Wed, 03 Jun 2026 23:15:17 -0700 (PDT)
X-Received: by 2002:a17:90b:55c5:b0:36d:bc21:4ae1 with SMTP id 98e67ed59e1d1-36e33ba4a37mr6551011a91.27.1780553717214;
        Wed, 03 Jun 2026 23:15:17 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e6b904cadsm4235759a91.0.2026.06.03.23.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 23:15:16 -0700 (PDT)
Message-ID: <4d5eb9d3-9437-c5ae-d28f-93d7604f8cb0@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 11:45:09 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: qrb4210-rb2: enable venus device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
 <20260515-iris-sm6115-v2-4-2ab75229de61@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515-iris-sm6115-v2-4-2ab75229de61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: g1yoiAVBGYSSohGc2mFEpj4KNvCYqYBx
X-Authority-Analysis: v=2.4 cv=XK0AjwhE c=1 sm=1 tr=0 ts=6a2117f6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=7yNcMj-pRB2AcvHbL8oA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1OCBTYWx0ZWRfX08FRq4FahFro
 0DlbKlgnnbfpN+o2C+VoKTbsj1v8rqjNObTPOH8aHW0RyKHnW1EVunYGsCDyjzxlGH/vQuvixeg
 UD8TIVCPCC98rBnaUlBrxnmLSpKmc4unIcf2jOmZeUymEN9+HssPKTL4YfCzf93XfCfNv8FtchP
 PspK2tIW/ydP86qJiAHBpEmpHGbg87+QJZaKDHANhQZE5JlQLow+l+y6U5wmF9gPdZ89PzvFFBD
 cNRN5yEwq4S7Ss7XFY/mSABmj21IyX0tAbxAd9Kb2EriFbAgIY60BtwTz3noWSMR/AJG8HMBACS
 ysfdxtV4ffBjxHLMD0zExjaFqVk9Foes2DM9fP9zS4BHf3AnlcN9tnUz0WNpkqPtbs6OzyJjLVk
 B4qirZCzeMW++WmONNO9LLGPjmO+d2lSx4OPsrDi1hoEvdmPtizSd7sazwl43Mb0reGUU3odbyt
 RE3H+fU3XrmeOP9Dj2g==
X-Proofpoint-ORIG-GUID: g1yoiAVBGYSSohGc2mFEpj4KNvCYqYBx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040058


On 5/15/2026 5:29 PM, Dmitry Baryshkov wrote:
> Enable the Venus en/decoding device on the Qualcomm RB2 board. The HFI
> Gen2 firmware for AR50Lt platforms doesn't work on RB2, so fix the
> firmware in the DT for now.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> index 1203172729fa..a6236b09cdbd 100644
> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> @@ -739,6 +739,12 @@ &usb_qmpphy_out {
>  	remote-endpoint = <&pmi632_ss_in>;
>  };
>  
> +&venus {
> +	firmware-name = "qcom/venus-6.0/venus.mbn";
> +
> +	status = "okay";
> +};
> +
>  &wifi {
>  	/* SoC */
>  	vdd-0.8-cx-mx-supply = <&vreg_l8a_0p664>;

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

