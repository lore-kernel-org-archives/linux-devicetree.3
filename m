Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFD338A73C
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 13:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158128; cv=none; b=IfBh28V+5eLpRqlr7JTGOf4lTzLdPD6vfBGWeGdQBcyv2GUM+o6SIDlDwYucFNn/NyKrUsiZZWOO3MOLwRiL/3Ll/hNAF/OA+qYXsVAYSLd05qny5aPml/rPieQvmvm96r4G0U1iMHddDtyd8Q66F+x3VpGV1zpBKNvNJFNdudE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158128; c=relaxed/simple;
	bh=RKgV5hZvafCihZFGYAAI/L2obRXJPdA1lHWrYC52Kok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4eYnsuQTCPF1yxSeDcPdIRdjyXCr+McRL6OgEkDd0QfzisgQobOi4vomWIeXeV4K/UOy/1s36gakKampEkFxWh7Ea0FuotVK8g3N0uc0kkK3gYsrezGlbLm9yKEUd4/1fRh0quBwSMXrfQjmF7UdXgdATjxc6zV1wYRqUk1juA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=orKZ0Li1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCg4LdH4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="orKZ0Li1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCg4LdH4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAHA91793734
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 13:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hXlYtj95HgLNKsldaNN7asPVeJJ5Fh4BlficT6fRyak=; b=orKZ0Li1t4druC1H
	6hY1MMvOXVDwKuo+7DpV93/wX0dUWT5ysZNdQwDKDYzgEGkGB6nYunT4cGGJScOp
	cUFL8cU1iLX8RakwqdJs3RP7RkbtOwGGLMqXyXURNnJ39nEcAYX4pOMXzMCmycRD
	DMWF8iQOZyhMa/yj2jWeBcufHGq910wcBNM9Ie6tEgsyWYJsuS4ekW2t1KyQ+IJx
	iZNpBq/D4cpIpZDBx+96U1dFshdK7X11wy2IEPdODUYPNiFeFqMeTnwX49sjwU9y
	L77MLVyAk5uMy6HiHViVYwxy30eNXFp51jh4d7NeuslWaDO1TL4+4Pv0GSPbGYCy
	ObVc0Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3seuxpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 13:42:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a54501a8so16567076d6.2
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 06:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792158124; x=1792762924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXlYtj95HgLNKsldaNN7asPVeJJ5Fh4BlficT6fRyak=;
        b=RCg4LdH4q+LZeU/U/U3vCCcRwr1QT4Gx3xy7gbJ954dzvwRRb0ID9v1qzjrOdkTNiK
         z7iKfPPyXnjrt/iMvxXyJFUYgNvhB3U+7OvaN+TZatzI6AGKuXCQBxZ3mQ+QVAmhLbUK
         bg80BRHDMSNz/q3w5K6zbVtCnsZ/OmIbJoel+HSSkFRPHMToBJ1p7K+KsXyGWaTYgU4y
         vv2X9Sp56QdBIaIJD2jspEGJnn1IQxlvmeIc5fX6QISyg1DkWQpynqvjjHiBm7W1NoxT
         gPfs+0Jqw3pGLEvb6Yja6v0GvdbpanG+L9p3TLAwRljXRbn1u92rrCzPdxUXnLt6iJwR
         STpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158124; x=1792762924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXlYtj95HgLNKsldaNN7asPVeJJ5Fh4BlficT6fRyak=;
        b=znf2ihKTiNuK9ejlASv+Z7+oN00wEqwLnHw6cr+UvVafDnhDaiK3QqqFSeST5NhiaA
         y04wL5Kl4os0h/3oQUrYgQ6opK31Qa32xpBCwlNYK0NXdhMNmbu1Ndsvt0w/yDCyNMH3
         ZtuyGnoq0lPLMozlGivcVt3R8erC7pWoLojsP4QmEG+N+PIXHdxCuhJqopEHpNknjEbL
         +LTk+ZeY8WSIPVCt+JCy+jxAT29HgPuzdplaBARRqhKNprmBTvCnPygheIUWN8bEE5SZ
         ndXijYojP5w0t2nwS9ec8dN1RdC5FLmlzQu1mTT1GoEYzUrDUFAVoe9VravwyJXIFcHt
         PBJg==
X-Forwarded-Encrypted: i=1; AKwUvBw5CIRP6SmLvF0xoiUXXSwIydk9x0wFCWAO8cFingrKAKdF0wbJ2EIVmH1ZjtcGLKuRByFxQTrI8Q1z@vger.kernel.org
X-Gm-Message-State: AFq9FYJn8Zk8wPnCOCHMhrBxhHgkl9E9XXLsXIDzQZx3crBeaQDiAi+q
	JJudrHIEs5JqQH9nOgMS/R0+kv2fI2eTFY2LJUwrnLEryTSy7QqmZCJKvotxA4mLj6a9kezpb7s
	kGXUcnk8qlgggVjc798fRrJKB+gHKso/8JgRQIbhUhfWl1bhuGC4ZogXGkE8xReHS
X-Gm-Gg: AYBFou2BDwzhSBQI0bhLtPSlIihQF1WUK8I58q57InnKf68rTOYRhT3A8X+mKu4xETX
	nFl5/uAfOv3IEeUunp/IjwOJF7SSJQYfqANHJ9V0sDB6eMdh8UTT9ft/BUQt0PHq8d/nI4hnnmF
	gpLsn1P9pNyKG6anNzk516GBO8Du6f+wDtl77vRaNcFSZy78xSFgGJSTOKyCNbyglOJ6UFHeBW5
	J8IS+AyMQvGkw314Iysajav59tQQWUsznYJ08+TDDKCrt7HTK77n8Tdijj8ojRYIyzAXKbdXRwa
	CQ0dqJqsGuAujMdAkD4h19dSnT0JjwKfaddVsp0a3tvs/p914OAF43cVkCFfmkk/f8iSDwxGWwg
	ubx2YkG46T1x3GWgEVyEzUg==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr3752545885a.0.1792158124360;
        Fri, 16 Oct 2026 06:42:04 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr3752538885a.0.1792158123718;
        Fri, 16 Oct 2026 06:42:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d8b4csm877756a12.26.2026.10.16.06.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:42:02 -0700 (PDT)
Message-ID: <6eaf5257-8c9f-4cb3-9232-e8f9fb19de71@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 15:41:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: Fix touchscreen address on Dell
 Inspiron 7441
To: avalon.vargas.centeno@est.una.ac.cr,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Val Packett <val@packett.cool>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>
References: <20260914-dell7441-touchscreen-v2-1-7f7224c0cce5@est.una.ac.cr>
 <20260914-dell7441-touchscreen-v3-1-062d6b93d1ea@est.una.ac.cr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-dell7441-touchscreen-v3-1-062d6b93d1ea@est.una.ac.cr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: umhJLSMpRahLSdFE3vpsILlZJGAhLGOw
X-Proofpoint-GUID: umhJLSMpRahLSdFE3vpsILlZJGAhLGOw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NCBTYWx0ZWRfXzvW+xt96sIvg
 6igcWdmRTlY0I98WnzKRuxcVJ17DCQ02+qiCwA4jWHqbL8SmwxNJEr6jpZbYra8fk0RNTy3XdlQ
 ktMeNfMCrWxiGHfDOop4KiZKQ+0Agh4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NCBTYWx0ZWRfX0hrs/Ea3VjQi
 djMuOJoohGTB1pR7vgsiGTuPThQM2z82gAwb9bZKO9X6oEkzvp4otOhmHVOs4qkCS5ZQ3WnUWbl
 HHuTlomAUGMd9bn/4iDeV8QtDuiJlu56Wc3uvaUMZeQoiv/XT08g9DVolllp4smo1IZlL153DIG
 AqwFC5SQhE7oajqMI0MqLOcShwOTUWJHohXN7EX3hu5yViY3RaHyU1qcWCti4fKipYYpMvJEVE4
 1beT+Sn+kXSpJfMIsDW6STiYRxew1LaHh6XMsLL37Mpq7zqCccDBD0RlwHjNBPfm9KYWVq9yk8S
 ZKvIZ03K11pe5raHqnerI7j1Jog60skyp4OHqKgB/5QyV5wr3sNth94O1it93R+nOOuIPy12TiI
 0BGJNQ/YP0BVKQXt6akmWQRg2H2wKSJ7I39Yg1A3AWM/FFx71a05Rs+nyLmJMOLwvMDbJkRDzCs
 FkaF06YSiievUwAJWqA==
X-Authority-Analysis: v=2.4 cv=Se1i5fRu c=1 sm=1 tr=0 ts=6ad229ad cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=iLNU1ar6AAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=gXMl86fzaOV-y-lz5Y0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160054

On 9/15/26 12:04 AM, Avalon Vargas via B4 Relay wrote:
> From: Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>
> 
> The LXST2021 touchscreen on the tested Dell Inspiron 14 Plus 7441
> responds at I2C address 0x09, while the device tree specifies 0x10.
> Probing the latter fails with -ENXIO and no touchscreen input device
> is registered.
> 
> Use address 0x09, matching the LXST2021 configuration on the related
> Dell Latitude 7455. With this address, the controller identifies as
> 29BD:1103 and binds to hid-multitouch.
> 
> Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
> Signed-off-by: Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>
> ---
> This replaces the earlier report-plus-diff with a patch submission.
> Only one unit has been tested. I have no evidence of double-sourcing
> or a working Inspiron touchscreen at 0x10; a typo remains possible.
> 
> touch input and suspend/resume. The native upstream patch has not yet
> undergone a full kernel DTB build or dtbs_check.

This is a prerequisite for all contributions.

Bryan, does the touchscreen work for you without this patch? Is this simply
double-sourcing?

Konrad

> 
> Validation: Linux 7.2.4 plus the equivalent local DT overlay, physical
> ---
> Changes in v3:
> - Add the Fixes tag for the commit that introduced the incorrect address.
> - Link to v2: https://patch.msgid.link/20260914-dell7441-touchscreen-v2-1-7f7224c0cce5@est.una.ac.cr
> 
> Changes in v2:
> - Drop the testing details from the commit message as requested.
> - Link to v1: https://patch.msgid.link/20260914-dell7441-touchscreen-v1-1-d79540ca5e81@est.una.ac.cr
> 
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Laurentiu Tudor <laurentiu.tudor1@dell.com>
> To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> To: Val Packett <val@packett.cool>
> Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
> index 75e10d97c..0cf5716cd 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
> @@ -25,9 +25,10 @@ &gpu_zap_shader {
>  };
>  
>  &i2c8 {
> -	touchscreen@10 {
> +	/* LXST2021 */
> +	touchscreen@9 {
>  		compatible = "hid-over-i2c";
> -		reg = <0x10>;
> +		reg = <0x09>;
>  
>  		hid-descr-addr = <0x1>;
>  		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
> 
> ---
> base-commit: 704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
> change-id: 20260914-dell7441-touchscreen-6b6201348ab6
> 
> Best regards,
> --  
> Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>
