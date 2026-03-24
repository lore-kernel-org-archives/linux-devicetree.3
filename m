Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E666A35DA6D
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359589; cv=none; b=Glnu6pvtQFl+WoZzsgG+jGtAiyfquVatdQfs/x4RgRZfQyd+ZGIdrIYmHy4dqvBYv212zHjp4gM1ofmtejvNwcpJdDmgHaTd389+74IVlv58FDofs0hWuh+OfRavIATCzPq0AEyYQZqxW32Hcvg7xSNEL9NmZQ3vz4TO8jsa5dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359589; c=relaxed/simple;
	bh=dr1tvWY7ZMmEmWK8yyOSc6Ec+cf+WDspG2nMVqEu8mE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tvNCIqFrnx0Ygnstwo+JXvIM8qOwE6htbrSBgz34l/l+uNecjreMd1Isub4ykbtBMlbfmBIfmuLEIB4JCERfxJQdQbf+Key3W3alHIbk5CD0MEmXA66jLcFLEAO+2z1X1c+2EFhMMittIOYXwO8bkyb4is0AnngD7/98e4T7Pc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJW/QyDX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/ekz+xx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJW/QyDX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/ekz+xx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9g8803903825
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DFKGVncG92dG4KH7j0lXCWsMdOyw42ZEb6lpcZBcVeQ=; b=aJW/QyDXCqnqIZb5
	y8nl2vSiaU9XVtMhkQY6JCmkZiloxRRBteRKdIPMPxXz+QqkIBn83sA5TTU76az7
	FNu0Xd0AQP0u7Nr4tku1DpYweb1ObOFzL0SvIfEhNBzufLA8KYavDb7AEnHLwaXG
	McFyrW4qnDRhCqezXD0pd2dtQSLGqIIpYOGBnP6m//Dc8kjKBms5I5xeSZtfvPR3
	e14jhnOVPqqRhpLHKQAZBkzyqg7tbNi2VT9qGP9FGL0kSy60XzV+x0yh9B5MEZbX
	NVnL2zYkFp6HVliNDv10jG+LABqtIy2kyiEwQjuXjucfCmDCroha3GBqiKXHtvA/
	wfclVg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jt0j5ep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:39:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b68af943eso8798151cf.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 06:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774359586; x=1774964386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DFKGVncG92dG4KH7j0lXCWsMdOyw42ZEb6lpcZBcVeQ=;
        b=e/ekz+xxImacvRN41X2qiJfn3M9WUjlKOjqG9hPYOjgG85qQzizKBR7etGEFMITQ4R
         f6MGBkaYQR1AnMyP+ex+vZrkRgJGdKMeP3PfYvnAPdnAZlNcJoEhgCd2BUD93jscsG5R
         YRLC3a+jvUDo0SEfGEBmIEY0ayFEdLJlOZCgj6ltO9Vak4B4Opef4dd8d7ezVRV51U2f
         sS4Wzou6h9gQzB0KOFe5sdYJWq7fRFKuhtQZNMVuRs3QqKgaO8oK6Yt8i8iE0BjqXg85
         In0oQ29ij3LRdo2suTW+YjnXBnwuXNBd+RRMItSTbqeZ7a5zfqQID8NTaeTIWSXwx35G
         eKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359586; x=1774964386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DFKGVncG92dG4KH7j0lXCWsMdOyw42ZEb6lpcZBcVeQ=;
        b=XWC2pE624a/5j74/ooDc4Wgb7ErzodrKUNx6XVlXc3A64Pk7W+ywe2Sj1Me1O/wyKx
         rfqPM8dOe6q1IVobtFD5slzXNKvaWAEECsxdNchz3iAKX9zar2p9B7nIu6u4jQsUHaan
         cWBtLk37corM+I2QBOsmNC8xnOymsjp+SAQsRJKjHAT4nnVL+PDOFuuatYIinwiMzSOO
         H8E/tIduZNts9w+KXNTLFVx//46mRdqb+ldxKOvHC5Lry25k9hVkcjB0D5hCS/O8tXjn
         xx77/rFTAXTsEgf/fNHbGQuSdmQOr3BubccusG3jEO9OtG7LkXqggg06zxYf4tCRGQrY
         OPLw==
X-Forwarded-Encrypted: i=1; AJvYcCV6JbqImR69Gjxy6PBxHz3inU9dlJF2hrkrf0ZrdGRumDIMAU5iDEcLsBqrJZpGn+MqmOaug+A5PXX3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+qtLVL1jRyinFwmZpuymrdtlSdgcWnj6CevsJU3B46eSlaSG6
	2NGIC8ncXfavxFfIuRTeEMrLljhFr6awR+75LxwNnw4xzwkVUr0ge+Uslq2+A6zGfkU1Up5CUEd
	7lpLsN9ds0FFrMolktHFoDqUJ6+YMTSwkyRGd1702yOrxz744Yl2j1rnj3CkDubWF
X-Gm-Gg: ATEYQzwMWnIA3/lC2P27kMt6q0FWFXKX9ZntS5C1muqBUX/6l012i69kUa5WR0MNpv+
	tbi7B84hc669jkS7SiKEbkP+lF4LTfIUGGbSRfoBMiBuDWMU+putVXMp2oSOPsxZf2lW+dDK2gC
	c7071skkfKdSo5P2LqGXm+/NO3epG91X3vxe0pUoUJbnIMKEmDpy5iMlLIj2EbqlHrGKwOWPLYY
	7KJrtU7pwAny3m7lHEVb8dxf6CqgIXgC6gTq7l1dcfckDxRg2g5Jm3DDIKw0izVumaLtI8c9rEw
	3HfqQ7qQ419pzPTT336UrgMz7FYgHCp1eRvzJr6/LUr1g0c1QVKnFKgmurX/4ZmmZ/tPeCBrNiS
	ycIIiHqA0I71t/Lt+RYLI/LYReetKm5BOSgjDdzjPJZZsagdo/DJsy6AIV6+afV5ARWFt18OZS4
	tN0YU=
X-Received: by 2002:a05:622a:46:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b373d0bfbmr201484151cf.1.1774359586394;
        Tue, 24 Mar 2026 06:39:46 -0700 (PDT)
X-Received: by 2002:a05:622a:46:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b373d0bfbmr201483631cf.1.1774359585842;
        Tue, 24 Mar 2026 06:39:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335de3d7sm648605866b.36.2026.03.24.06.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 06:39:44 -0700 (PDT)
Message-ID: <012280c4-48af-4b3a-83a3-c93f01e52625@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 14:39:42 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 15/15] arm64: dts: qcom: sdm845-lg-commmon: enable dma
 controllers
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
References: <20260323-judyln-dts-v6-0-d89f07897283@postmarketos.org>
 <20260323-judyln-dts-v6-15-d89f07897283@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-judyln-dts-v6-15-d89f07897283@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zzBegp4g14vRElcOrYXwKj2NVufHnums
X-Authority-Analysis: v=2.4 cv=Nc3rFmD4 c=1 sm=1 tr=0 ts=69c29422 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=nrrofH4WB8OeSbHxBjgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: zzBegp4g14vRElcOrYXwKj2NVufHnums
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwNyBTYWx0ZWRfX5qnLlmHGHho4
 YL6srAHpkeIu3VPMnnH1LWDYznXFEMlr+6FLJqpH/09LfG16SqBywDhpmyLH1G5gNHDlkZHLOnF
 owmU/xK6s07Mc/Qne5pkrta8eFUtsXQBGB1Ks77vuqmZMpJwuyETUa3/GH2nVsclMgfatmXNqEY
 BJ9dkluon5O8pThWpGasDsmVrHZqPybaENQSpL1wNFxm5wISpwJGHUNjBofMTaA5cf6R9nphxYX
 n5O1yTOO5PZTbIR7PbZKri9oADrn8NTRmxLVsbDZmygSuYIs999I6L1kRp5MxIcTj5fCS+QwUpN
 ylJDnwD8ZK8oE3Ixt4jLePQWww3grjVqmhkTdBf8out6xAp79egSCiKhSNqertoB3Va39ZOFN/3
 V9sq6IRLpBe9kle9QicAUgPln7gDY+a/N5JhayDk9kKHWg9R64FNggNhBwsFyDU0p0u85UaJ9FR
 mo7PNXn2Co9u37UBhSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240107

On 3/24/26 3:42 AM, Paul Sajna wrote:
> The dma controllers are referenced by the geniqups in sdm845.dtsi
> but disabled by default.
> 
> This was causing issues with the spi touchscreen.
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
