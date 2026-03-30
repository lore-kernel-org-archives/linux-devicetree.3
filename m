Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0041620B22
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863260; cv=none; b=J12KON/smh1ZxFhkQ9udWR9SipAO0dy6kirld9ywCZKxCp5+SYCsym3Sck2A55ZNzgC7zzu/Z/HbPxqATbXcXemALfMjy/N8+yecX0PtdAGwo89ut+SQTl0dADh3XcmVWFArgocs5oTA8/0FVCy+/KT+Yjdo8SkZcrXlLp10rT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863260; c=relaxed/simple;
	bh=5uJprBWt5bWW0ogVM2lNsXTOrmrzNW+syWto8Ndsu38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fA0AdqnnZxc2MsJzfgsUKIBZtHY9m5ANSYQR8EpmX8lLP7oGj8u8nkzE5ae1j9vdeJ2uCND4At1SF0r1bDIMM9oQuBMd7X+aqghZX67ejydYT062bIbVSAwCB1ZgMafPEISaKVZbT08Vc4VB2MaJxtVHHgYZ06Mn8GLvnYAExPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IHc51k4T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R/T4s7eL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IHc51k4T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R/T4s7eL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4IUIZ103746
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XzA9qbXia9AY9WuzIn0BQSgRJyalnkbzGUH+5nSi/fg=; b=IHc51k4Tovggj73r
	cE6dORyMuQm08PVxSs46bhMiCVXv6fUmbAGclEBlc8TkhNT8QV6QJeB0Q9e7SiNG
	tv+5ADwwOq+5qt6pCzpY/G5Le3QoJh/q6lAU/GVQk7iaIWmxuPpDDaFPHowbHTsc
	1Q/mONWOTLmjOKvb+3cuTa5lL5ojV58+6M3EGzhC7OZx1fSb3dv/HCqmh+gaNk7o
	VGC7WZ0DIdIZVOaAZXHY0DR75ZrjvzWK4R972JjZYykRnE5OnG8JsJ22mhR2XJXd
	ivyj36UDEATC5TC66HLTkzdIAJs6P8cTFaxylFE95IWRN9lBVMBP/4oc1AhJUv1n
	5URx/A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67715g34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:34:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8a18178713cso2494126d6.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 02:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774863251; x=1775468051; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XzA9qbXia9AY9WuzIn0BQSgRJyalnkbzGUH+5nSi/fg=;
        b=R/T4s7eLkQbnfZpAF2EKr23w+1wDU7ZGyyEm3xuAs+M8CevvB5j//6EpLGky9VIS8L
         bfo1VrmZUZGyzHOebJtJhWgwBIY5jwmEAZUEJSNn0li0EjImCgyYOZYkWZoVtojuKl1D
         H/A7K1CtNbt0K9p/UrLc6stVdJBD8ccQpIN/kajI1kyB7jLPbrGzZPBR+6Y/yoE5QjNS
         3yI7zq7fr30iUxo0u+hruiWB+2tBClt6QQhRGaqbqO6Gq8SLssGzz+ogWDKwmqACraWT
         YMd+w0mpI/DMwNYenzBW010GG38Ts0XUmHTxPR3RaxN7cyXdNrHHa3H2p1U81ijonwNg
         66DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863251; x=1775468051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XzA9qbXia9AY9WuzIn0BQSgRJyalnkbzGUH+5nSi/fg=;
        b=UbtI/4EtmdcSjnxLtGm+I0qb2hGBC/jmC9HnczD6JVeYyLUT6hEa2sj5eESkXPMyTt
         derfvDRNVeD0DG185yJZs0hF2/xsOUOgEGkRvbIPlWJbJmCrJYrkmSiLS9BWq4Zs2G/Q
         +Ver+Y/XO9BMGXcJzPFJSgHZdje9jprFHC/Vm3/JaoxS6No5G3FRjSrO6XT8HACBRiRR
         l0IXC0jXrb3M85Ci/wUzM0/9EjK74C0aswm6BSIpnHYdjzKij5UO0Dws2Q7+07UKCz/C
         DZjKCBeahd2W/8sE9eH2rMdl7Cu5bXLAND7nUlPEMvGlHBZz8YG2DyJi0xnuxXGJ9Udh
         1TLg==
X-Forwarded-Encrypted: i=1; AJvYcCWDdl5MY5cR5J3stsbrwvSEzpuMpBao/etgbRjVFCuk3CUoUOb7OaX7jW4f9NmbNA/VrKSkKkixUDhg@vger.kernel.org
X-Gm-Message-State: AOJu0YxKQWaP3f9fNEHWXA8t5yQpgbDJStrCpAh7ojh3Gnr1Z0bHwVTd
	boUc8H1v06HGpZ2EUd+vcu7UwZQAQI+W6uw2dg0NMrIXSsY5OZSDy/rYs4G2LDdBdR/pGskdU8Z
	anisEtW5qzve46EB72j08fM/28ZLBzFk77tLuMrriUDGZNuYe+g1DJzl43nW9OCgy
X-Gm-Gg: ATEYQzw0eShV3hs1ZXItinHyGcdFRJzpHqqobGFVzmvNsBmz64/v6DwdSjpNToe99fL
	0pMi1Vjyv3jXdj0/gf+GU1YfMauPLfC4ik6ySqOJKqjXlLpb4Q7wwSNJ2+ZreFvecVUUwYjC3tI
	IFPqBrMmseQR00ZGP3nf+cHP1NL/nHxDE+F/7oGvFVH4d3Znb1rgp70tOYKDNaMX/3vo3NyFj1a
	sE6V58+uIsfNKYA/69z85SuuupO543jf+V+ErmjkmlLoRlZLbRJJbQ6KTmRFeu2cx/+3Q2tW2Zo
	b7dNTJZznwg2PMilQv33fnAX9l1HG217zAKaOue+JToX+rbqZY9DTtQxuo8138P2lMonTv8rKts
	KDou7gljaN0QUAeZq7VrEA96ffSCHW1TFFSr3qbvskuEptKyYczarklgzIFMWKY39cax1jwg89o
	26dv0=
X-Received: by 2002:a05:6214:2a84:b0:89c:47e4:41e9 with SMTP id 6a1803df08f44-89ce8f9a2bfmr137820566d6.6.1774863251550;
        Mon, 30 Mar 2026 02:34:11 -0700 (PDT)
X-Received: by 2002:a05:6214:2a84:b0:89c:47e4:41e9 with SMTP id 6a1803df08f44-89ce8f9a2bfmr137820286d6.6.1774863251121;
        Mon, 30 Mar 2026 02:34:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae23dfesm267894766b.13.2026.03.30.02.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:34:09 -0700 (PDT)
Message-ID: <31dce358-face-483c-bd8c-ebd473b9e562@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:34:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sdm670-google-common: enable
 debug uart
To: pabloyoyoista@postmarketos.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-0-53abd9db8f0a@postmarketos.org>
 <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-3-53abd9db8f0a@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-3-53abd9db8f0a@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: e-CdZeFIvl00uBlAQdg36m1IHJltStJo
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69ca4394 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8
 a=x0-Ntm4DP0gVEan9CnAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: e-CdZeFIvl00uBlAQdg36m1IHJltStJo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3NCBTYWx0ZWRfX7byreCxHzR2Z
 O13WU3TfqGSBUA1MPsAFz7HsxAMB89Hb3xR4cb70CEu5/PuAa/sVfIBeea290E3MecT7TutPWbh
 nA6OdZheFm1bFqA30MVBoEbWQiNjvFD4fxystkgdjI9qNCkJTMSWJ6isEtJl7LDMQFCMOKx++Sp
 59qrOV1Xt8B7c64fFOrlx+PwcmxXWnuiK+weTPOQK9plaKiZoOiBIKSP327hQHtZyJOqrAFITfe
 MjQmCD+2B2LvFkjR94ykIPybGqtIrQd+9N3VETYqfdSEXHHeGDKhWGmp+TyJcIIJrTsg8EOD+jV
 0peHEmpqo53CWlRCZlKJmb9eBNbs7SHn0N1MYqqIpl8ohRrWXUTlLYrAh/mv6k2zcCtNA0NN7IX
 eQ53gl9C6Ltmo5x2CAQ3FA4QvZJV13RE4+0HtCfhsdxwZAB/SEYiV9+LEHg03SVUMgpVrLXoyD4
 SNU0sHSpwxJYk2FME2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300074

On 3/28/26 11:58 PM, Pablo Correa Gómez via B4 Relay wrote:
> From: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
> 
> This has been tested on the Pixel 3a with USB Cereal board
> 
> Depends on
> https://lore.kernel.org/all/20260310002606.16413-5-mailingradian@gmail.com/
> 
> Signed-off-by: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
