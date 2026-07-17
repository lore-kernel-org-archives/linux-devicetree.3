Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79963C2B9B
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784287986; cv=none; b=rc9tJuhe66SQz3oZkAF7lPSvFAmCTPWA3HXOXlCunzIgs2ycI2v42aNMMUT83j0Q223H9AcKajZ3Tv3bEXueVg902JIt+onyWYmpP+so4y/QLhTDc8Tfi6wYeLA9QQqh5u3nBcWrekLWb3hGikv9T771QgnO8RO0zLL4EjXvGhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784287986; c=relaxed/simple;
	bh=Ei7YCl18wuW6Pxk9gS2iZPPB1ZFP4W3PO+F2VT911Pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMMSL+jwkFBkF0X1cXOEE+Xz9hYpWrkLsSepqbNDPEVfBJyNGgYGL0xJ2FX2/ID6ymEd0LpZOiSNQ2ph1A567bUVLCCwQNHPHv3HJxbWjEWqYRHxnIHqAYsuaiA02TvtD1TfpFpNXOyEpDAUToWbfFDzsGGm1tBjnX6OHz7+OiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gb/z5oEj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VKFeEb4b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gb/z5oEj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VKFeEb4b"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HATOPN1388536
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ueu/iOFbUnianrV9Fi+TMS2hFdG1bHSGmXED9Y7SgRU=; b=Gb/z5oEjXr5hxopF
	OrHiboeuW9As3N6xUsQM8LzDv4Ayc6+LDXKuLK2zpL2MyNCvQbCNKep3ZC0Rcmpw
	Dc4gUcVd7BM1UMFOD8KrKfLXH03GyJHCPKDxvpn+cRS/ycuQKbscr++/D2xQSoId
	yUD1ei7lfY5gIVhTii9q5zEILSuOoEbqfyNcvN6JbxfiDKXemdvrdSsa8kJHoNDL
	GU7tpf7DPPWFRiiBPpmzZ8LcjiIoU9kBIVmu6Y+o0KcLqcDZdshu2YqYssvmcYoR
	Qiy3jHHPvzQSng/s5GtvqZKGX1CKOQ/D5cWTOn7m4RDwkETdeQn6tKrOzC/1/rHt
	vCy/KQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9p92rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:33:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso165699985a.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784287980; x=1784892780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ueu/iOFbUnianrV9Fi+TMS2hFdG1bHSGmXED9Y7SgRU=;
        b=VKFeEb4bCY7SYPcDeRNd/reWnA6/HSiEKRN0oV+LFSSo2vq+5fpKpzstU5GcAW2Lq+
         /umVOkNNth73fi+DffgZoRUimnMjfXlRJEu92p74Cw5VkiGhyQOecFBujF7u9eYvCU92
         8BBytCJSAhEshu7YUhIblpoQLRJ1EUxFAY2s1uxSG8N4JRX5BWepk388Cwhs5TbkFtkF
         2hlfOphNT1DRz8V7B7TJu82uUv3VguWYXK+fOX5SqgiVmmx0IU2f2pnFXHZ1ott7DD6b
         7m6IeugCKB8xbBUgfYg9HYUxPHbn5pvIqJ8u5gyekAJyryiW+RnmmqZdd4xNx7ZmJfjJ
         to4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784287980; x=1784892780;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ueu/iOFbUnianrV9Fi+TMS2hFdG1bHSGmXED9Y7SgRU=;
        b=NP1qLS7G1/fTFN7lJjnmbGqGJdt0OaR23bTrGhSb+8u2pT8LhgkWgMfz07byCaBWWB
         5hqNuw0Unus2hidJcW0JdchPoCyF7dxYOuTRqqxpPUEghg5CGZBPCwOcwOnSxWoM4/CC
         TbC0yB3djd33Tdnx2eqQsCY0GgR8aE/g0lPhXhvaX/E1VdEOvP4/xCY+TqBWtTvfVJV8
         Et9YpamgKgvLKMd+ynVajWVDnFyHeQQn3vxuU/IHR6iCrt44bEYzYm2iMTksgCIJVBjw
         vdtFOw/Gy9IpUMpJ0R0KxAcrDSbkmkrdSpvfaqkyMaJACnSpF21WedKos4NQAqNAEI5J
         O0CA==
X-Forwarded-Encrypted: i=1; AHgh+RoZOrWZKj+kZQJiDSCqQpFFyV98stLbLi07FW8ERnFS4z47YaeCYtanIMCV3PGGJw/lt1vkJp0XQYqh@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnoqo13uiDoIkgMMeZbaAqMiM5b73JcnhoyM/k4KzcSnMdm8jJ
	Bshmia8FbOpMWrwkkon6pcsT4nBIrdhjmb7M9hXeUWS8QMGUbrliFH5pmVN3iF8X2aZOfQsUCov
	2N58ku4sxYfHkYEtPiv/WxfnaR8MRr2L5b/XJnveImP7y41bWoRilylznblbw9Qi9
X-Gm-Gg: AfdE7cnV8bWCJWMm3A23X/mr97hP54N+4mXKGWTW1OOcOUCeB5b4oh5FCi2PDyaut+m
	b1f9KHOG2fZmU/EhGgrIPnWV9jJ5++ekUyMMtEFvQKJvsYeZKzYvuoqLJWHzlGFgc5eje+SPCUU
	xzM4jB0Fh1Erqkp+GiAOX6762vqOtohkEwdCT51WMQn7gG0aK3izXstYdclHDuAaRVAMvecV3s8
	AbkkiDnMYsu8/0jZJKltM2qC3sWbzkV7sMx+UXFUTv4T6vHrKQgnGGD8IMsyFmgsdfBvR/aiDgh
	m8ZDQtANCt7qBhJvyTDyYOJVlobyQfeangTFCTCB3Hi1paaHDRCPassUCzJ5VDeNp/8rZGT8fXI
	z08YFIav+IVTm1eTXRUxc9mjW
X-Received: by 2002:a05:622a:6848:10b0:51c:1c73:51a6 with SMTP id d75a77b69052e-5213bc1dffemr11225991cf.5.1784287980411;
        Fri, 17 Jul 2026 04:33:00 -0700 (PDT)
X-Received: by 2002:a05:622a:6848:10b0:51c:1c73:51a6 with SMTP id d75a77b69052e-5213bc1dffemr11225711cf.5.1784287979821;
        Fri, 17 Jul 2026 04:32:59 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705afeb98sm61675766b.22.2026.07.17.04.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 04:32:59 -0700 (PDT)
Message-ID: <b67a425f-1fc2-44fc-bb70-2a7efa7b68e8@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:32:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE
To: Oleksii Onchul <oleksiionchul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260714125806.310708-1-oleksiionchul@gmail.com>
 <20260714125806.310708-3-oleksiionchul@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714125806.310708-3-oleksiionchul@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nH0I4-aeWNA6nG6qT4orh6R3g3zTncY2
X-Proofpoint-ORIG-GUID: nH0I4-aeWNA6nG6qT4orh6R3g3zTncY2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDExNiBTYWx0ZWRfXwW1RFnY4kcv+
 pwo/oYRKeNG2JBIIctC2+7VONZtCeyFPolwJbKQ3d1B9XF2oURUhh9NlJeAaDe6UOt7hkb5gV78
 TChdpeUUCiwmJNcJ+D0d+2ojN28woLoQsxkwJzp07DZzsvPCtaJzZkLSlrdxGSJCdMZ/+j5VeQL
 D4PcvbRg1ZxSelCR/GTndtTaBIZk35k4hm0FFC8oTUCC1ud1Ys7CirjFnrnKLBgfX2W0DVFfL6y
 KiGKqBhhv9SnwbngfiE3yQMDn9Kho6BBD9PH/LJaEy8piXyM9mBpyYYvADan1egnCOKMcX8O2x5
 ZvyWf29T1iq+f2sFBgXeu2sdc2tHRnjtYPvI7u3s1T6zuVR0Ky0KabWDyZhL4sZKjc5m+TqwjiI
 c/7GOnUCp300nVxRyd7EOf8VrG1WvNdvZYPF0TgBNuQCjkgrgNlo0soVdtsd7MpNouMg1It7vAM
 +JkmYOvYJfhfXG8l6eg==
X-Authority-Analysis: v=2.4 cv=TaqmcxQh c=1 sm=1 tr=0 ts=6a5a12ed cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=uZAEgtoqDJZVUE3vR7EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDExNiBTYWx0ZWRfX2SW3xl4iZ8vd
 I+tvFm76cxz9frWTbmpW9cyIP0/jXdKc1ys7MD96yZmbtCCr8ev5EkV/yQoqralm3oYwWCvlFNX
 PQPBuJF4vyD6PFGy4PU017+9aZ7hPRE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170116

On 7/14/26 2:58 PM, Oleksii Onchul wrote:
> Add initial support for the Xiaomi 11 Lite 5G NE, codenamed lisa.
> 
> The supported hardware includes regulators, UFS, USB, GPU, remote
> processors, Wi-Fi, Bluetooth, touchscreen, flash LED, thermal sensors
> and the hardware buttons.
> 
> Signed-off-by: Oleksii Onchul <oleksiionchul@gmail.com>
> ---

[...]

> +&i2c1 {
> +	clock-frequency = <100000>;
> +	status = "okay";

nit: let's keep a \n before 'status', file-wide

[...]


> +&spi13 {
> +	status = "okay";
> +
> +	touchscreen@0 {
> +		compatible = "goodix,gt9897";
> +		reg = <0>;
> +		spi-max-frequency = <6000000>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <81 IRQ_TYPE_LEVEL_LOW>;

interrupts-extended = <&tlmm 81 IRQ..

With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


