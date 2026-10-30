Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364806;
	b=KGlIc/olrHuzxacDHL9p4lS/pyH8TqcTRbxuXL/H9fvzPpT64QG255Xnp9UNtwWfMtwX
	 Bps9v9kzpFxZyFro1Q+DCeMZkYVccH6mfK0uHAjqDKclGyVUJ13Lrb3/KMEtd4+pEJ4f2
	 cTsvhmp42gkvgv+9yUllrtOWYu7TGfnOoYi+VEmeDcmYFR/VgEImvextIJobbv2EdRfDX
	 itQq60VC5zN/UA9SnrbRn4QYglkc2V7lpFYmBGuxDQvq8ka4xOjJIXVsmf3iZQAwL+qwT
	 zkZPd3MF3ipj0SZ1gIB4j+DrfADN/n4Va3jub5KZ4mfSS4TnDDDvQ3aozhthWpLhaDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364806;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=g+dtRrOqxcIMInZ6Na2UXxrAIiwdWRlYssjy62GnXog=;
	b=N0g+jaqftmNOtkrjyqfgadfhssOqySnlUxckfTr7wrJw2xKOGNixXfbm58qrJ4YKTI+z
	 YhGDfDF3idyj4zz812JhQZQwcLniGjTXVc9YoAmzAEhRNaJx9LqIPChM3LJmqW0Tj5YR2
	 qMI7r/ixBrG4S5q9HgIc8WJ4/pz/25EC+4FcVNiPUSYDz3symR9NcN/O3VbtTBmURBWDJ
	 VkrXdtexVcE6eWI2CwI/CrYtjr6q608o1uhTxdtt/Vd0j188SsEPeK730f/5RQd7nnVK7
	 UPOxEQPiiDWmz2WnbLMGj4ah/xjyJ03KLTd6zEOu0Dk/pyv04CmcAvwA0MIn410KclA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QHLg8D2R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K3blMq+d;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4778B606A31F
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4778B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QHLg8D2R;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K3blMq+d
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG28h4144618
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g+dtRrOqxcIMInZ6Na2UXxrAIiwdWRlYssjy62GnXog=; b=QHLg8D2RjXAaou0v
	R1IjeLGQW/bJr9wx7PDHnJoz6QxHcuu+OSaPeqhnUuwDgqUJhjj838LUGt+xTG3V
	zXJDARApLPB6FiSZL5aVY8guaoypz00b20wpF7AeyirK+iehxUv+BfZc9npuZlGk
	RXN1rraLVUIUbonQfOPBfJGfbS1cC+kUlg/sqzGsR3lgCtjBHz92iJAX+jHQWghg
	6/6jCnqmvXIPNDoDf6TbIEnwlSOCnxnziEImiqXjODaMw4zIAghEjzXEWDqbyzt+
	LzqT989BVDhaDJ4JIBEBcs2ArQklEBOrZDxkR9z30HiZu/FeKWBlou7zMw3ey+iT
	kNU3EA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme7532w6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:53:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso14893685a.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364804; x=1793969604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+dtRrOqxcIMInZ6Na2UXxrAIiwdWRlYssjy62GnXog=;
        b=K3blMq+d1BLeWDJN+pm0IaVzxw/NLpSXOhROOsj7YNHsC72hR2NbzRcIimwlsisMbY
         Z2ukZjUDp2GI7qzvMz52d77QPJlzmkNJKLWzhu8QpQYEpO00+qTfHiniZmF/Ofl72LWs
         4Me8AOBGSG5oz88WdAFOPYwYkCdF9USKb/g6wmYGXnu19r7t+eojeI1W+XbxjqTA4j3d
         94++/wixPxqZ1hCqMAk58dFv5XMKxi15bVvqSe4ul5byaDRwxYqJ+ZQh1igO/fqkbPA4
         CB0+XcwqrE+qRERJp1veUJPXzbTCVs42RqP0hiy2I2Re7j9StB9rwX0KlkzL17ko6hP0
         BUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364804; x=1793969604;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+dtRrOqxcIMInZ6Na2UXxrAIiwdWRlYssjy62GnXog=;
        b=OpZOcj611hDULHTdT7iKp28QHVbzQ19kqrLDBZNg3AA4ViHmvH2sGvuBiOa8sOwKr9
         ok2HLS7e6LCivYTLZycT/3o0TKxwH7IrbO9DZbql93gnGG+k5aRWgHNNfkxc0/v4LK3M
         JDRtrtLbysnYO/8w5jWYEe3A0igcfWODqEGdFZ+eYon4pfHwU8KeC2jXq2i/CetdMJV1
         7HNP5BpxKeILXeR/SsDAtijUcmShh/GaQlRT5pY/SJRZyfUfcXp6zxKrAzmyhl1da/Ti
         ZZhH9gCv/Q+gSN/hS4Uupxzph0mTCgildimKeDsqR7c0e22FIoftRqHEhZMaMN7XdY04
         e63g==
X-Forwarded-Encrypted: i=1; AKwUvBzRj4tq6aPHqBHlkBi7jvmXjiBhCI9U2XEGbDw0fT94hAtzNFq0xSK9eXwgdNdYOGhh1sYIKjEqWbnU@vger.kernel.org
X-Gm-Message-State: AFq9FYKV73dx+2UQswb+MVdjHWZxoKJhDBIybmE2BkCLuTVPdEfzsyb9
	KuratqFoIZZ5J1SHTp+Mh+mOxnYn0XkqrbsAU0eqM4/b0HNvAE7WKNXNSXKAw1JDWW+L/xNWutn
	3/YS1dq1iv4mY8R2JsaZMPhtcGDEObnru4Mz+QkM0SERB8m+91VExkOsEeZ3L/pvG
X-Gm-Gg: AYBFou2a6gif4eny7N/h4zqItPII2pprAdZlOxOCHGylBNyWZhjml/HqdiMVxwRwSas
	SXkHHa+5HPVTl0SDAFCkgpB/XScD3Q+0vJz1+CPQBgF1uGIHxKv5iGhLyrlpnLmwjo9wFRXbNVN
	sAalOqddo3jBIhVfFym6P10nNdqABLIxoioPw6EL5IA0JyVS0z+vPdX4BoQc/jP84x7O6glm2Xr
	vltdvXgb/ID3KtYt44yYmENOPas9bdBiDbyrKDF16APPYgUsMWq7h+E7D89UHvAeDmYrNcsyqv+
	6tRWhOYUJocVrRcnmCuLJmBeKczZ8wyNioQPsO/WJ/Ofl92dc3OoNuxnFtrhfOyNfqDVz+NmlhU
	Ey0gbEohjrQHitZUNjFHVnMdoRiNmUpiqJ898dHSYoq2QXM50nDgVINRIMkwWf20GpkZc+JQ=
X-Received: by 2002:a05:620a:a8d5:10b0:93a:14c:329c with SMTP id af79cd13be357-944214d09d9mr372318585a.1.1793364804313;
        Fri, 30 Oct 2026 05:53:24 -0700 (PDT)
X-Received: by 2002:a05:620a:a8d5:10b0:93a:14c:329c with SMTP id af79cd13be357-944214d09d9mr372314285a.1.1793364803770;
        Fri, 30 Oct 2026 05:53:23 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd249sm63470066b.20.2026.10.30.05.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:53:22 -0700 (PDT)
Message-ID: <cbb0c355-7401-4edb-b67c-00976e1a3763@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:53:20 +0100
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
Subject: Re: [PATCH 2/5] arm64: dts: qcom: milos-nothing-asteroids: Enable
 Bluetooth
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
 <20261029-asteroids-dts-updates-v1-2-79351337d681@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-asteroids-dts-updates-v1-2-79351337d681@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kSs1GjCm_fuV7tZutRjU_ES4prHSdr3O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX9KTLRPCnACul
 +F7WBoFwvXu8ddNq9cGkTueMbows/DBpaMYQzAkE+BMc5pBD1SKGCmrpwMmTRcmBi1yJel77dCX
 16HsbsAsdYq9DE5icAU50UlHp+89kRNBG9FnkiI83ucLP0L937CebrtX8oh40vm0bAJHrIpqmwU
 xHIG6SMVn17n52228KGxCGpfoGE5vIwDMqr99wTM/w6zEDX09Cj7nuOocHQNWzdeFACWRuvx+r0
 kmhybMvawkWOzwdPAUWYg6VwKjcFA+ZI/AstvI3xUVmeUdqslutFSRBBw5g0FMu74SktAeOxkUO
 hiWPdC1iAf6/pgEH89U5G9lf0N6FCrB5dzJXecTH23mpjiQBEFcjn92EKvwzK4qoOId0b9OmhwV
 COFCcfhXsU4ZfK09Iw3FCQTN/O3mseygmo9ElTKIz9yjswyUT6smV5R0QU6fxtM4A45sxBIgSKK
 Hg1PhBj/Kfg3rthKQnQ==
X-Proofpoint-ORIG-GUID: kSs1GjCm_fuV7tZutRjU_ES4prHSdr3O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX8Tv+Jy/CYO68
 Jrdh05DK1ratp+WwUPd3IwPX+fPgzrLIdrocmytGmChdfqDb6TtMsYiHAQ3fjzdtSAJ5JKCn6CZ
 AexZRY+VwmYwbGiqohw4RQ/eKlAuOR8=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae49345 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Q61tBkWn-twudPVU9zMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300051

On 10/29/26 11:33 PM, Alexander Koskovich wrote:
> Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
> parts.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

[...]

> +&pmr735b_gpios {
> +	s1j_enable_default: s1j-enable-default-state {
> +		pins = "gpio1";
> +		function = PMIC_GPIO_FUNC_NORMAL;
> +		power-source = <0>;
> +		bias-disable;
> +		output-low;

The consuming driver takes care of the output state

[...]

> +	bluetooth_enable_default: bluetooth-enable-default-state {
> +		pins = "gpio53";
> +		function = "gpio";
> +		output-low;
> +		bias-disable;

Similarly here

> +	};
> +
>  	assist_default: assist-default-state {
>  		pins = "gpio71";
>  		function = "gpio";
> @@ -905,6 +1079,32 @@ &uart5 {
>  	status = "okay";
>  };
>  
> +&uart11 {
> +	/delete-property/ interrupts;
> +	interrupts-extended = <&intc GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH 0>,
> +			      <&tlmm 51 IRQ_TYPE_EDGE_FALLING>;
> +
> +	pinctrl-1 = <&qup_uart11_sleep_cts>,
> +		     <&qup_uart11_sleep_rts>,
> +		     <&qup_uart11_sleep_tx>,
> +		     <&qup_uart11_sleep_rx>;

Please align the '<'s

Konrad
