Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07EB3E5EDB
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 04:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790225843; cv=none; b=k14G4sHdfj46M3hZUYxtbOl3Cj9NMvJbXtCMiGaZyIQVi/0eTNvS73moaPTuOHeovKOU9zuvvJcLXhWmSahSNRqVj+WpmOu5BPjlsYdaCtfYFXtqeXhedETxF2QfPETIM2AqQ7fXI4wtw0E6ENWfrrPWMBMXEBGB7GJJHSgKIQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790225843; c=relaxed/simple;
	bh=Mpco+6yNdH2y+nlCpp5arIK1VEtWdHw1yaMXxUPtWOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DFpsMkOWKhfddCo872qXj6uqcL3LM/ACg+E3vlldDSHq8Www1+O1y89iwqDrhQYi47lIQ5Y7rxtL4yiYAZgaXH9kq6p/3ysIwWp0CN33RIVEDIZIqh6SGeC2JowqotxcBu2D3xXcyNwpYhxShXzs4BjSFnKtRowqXgwLVyiHZ58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fFiYGhSW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCSXbeCm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fFiYGhSW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCSXbeCm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O36gRe953521
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 04:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ut8DVTQEfpH6qJZsAQxJYFs6sRDVv54/ARUFWr3kTyw=; b=fFiYGhSWRQWymu2b
	PSG/AjuiAoXlbs0NkxQmWgI4tCo4OFt4fiFScB94yiFXfGxQRm2LWFkZegMNY2XP
	Dyo1ieW4T3dkXjj3CVgckAAwQih8li0WUZqrVWLHlhyIhFaqtWSTLxUU88kha6+N
	zrKiaaytH73VlTeEJBLo5yMZcsijNGTbT10S+GinUN/Z1jqLH0DhscPBfT8dQYTS
	s05FiE/rJggcmh6ri6VTIvS0d7DDYbSLlyfTxanwRDtAF6c7S7zI5Sua0DKwqww3
	Oy5NrcNd4HFDzyQdDgv5NYjGGnkSqfyS9EAYgbgFeMeVTPmKaFUCQqJ/7LzJgX69
	Cc4gyQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvhsb2nwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 04:57:20 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1416f32fe11so2199942c88.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 21:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790225839; x=1790830639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ut8DVTQEfpH6qJZsAQxJYFs6sRDVv54/ARUFWr3kTyw=;
        b=RCSXbeCmY5kIV6rLkpryqp7Cjw9oPcTE4bs/KKiG7foUoTZF5rPYr88RN2ekDKmxDb
         SyxTqIV9mQMtvEVnBSSE3697jHqnbzU6Y9jd1Yq7+GlPazbVZXMP0SAhfJLrjoN6ynhU
         CTXuTiFRcn6/GTs5dE3m/g2La4NWV8PVE7NkP+h2fTV67Ib5WNua7bmy2TVHbHJcjOtv
         TzaTE4Vsq8ic9UYOMesqPsP/jmy6BAP1EFF+FMYYfjWHkXKqv9gXnYFItkSYvAJSCgbJ
         1HS/LQmeZpGXw+kaqi/k57u0XufxMMyykHLVttfYSXXNtK08DedUX2EijnbM1uDXKQ83
         oYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790225839; x=1790830639;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ut8DVTQEfpH6qJZsAQxJYFs6sRDVv54/ARUFWr3kTyw=;
        b=YmVxqvmk28BYTffsPJWClNfdq8s/z2VCl5FRjmdxS4T3+8Mn6ePatp5HGUlCqVqAF9
         7+remNAjcQnwsccXb919RgkctlxwxwVwxkn3GNVsXYmCLK7A7AcRrZzCpq3ff2HBe8DZ
         LbYfwA8hifxyj+yJgfCfvRH4FBKGUzBCPfGqWLqQoq9pCDTwX9MWa3C/LQLjq5+y4XV+
         JszwVGb7vhzwg0jKjVwfxy8F3SAShiUndy83qN4InoVFRg4NSvvERBeo+2FhNbYlPYpX
         eMbHTRCB2F4AgTJybsHW64VGG6hDUSR+nm2Ek84w6kxEcbHWJZZFZMdDK0O/gOgZ2/7q
         CSiw==
X-Forwarded-Encrypted: i=1; AKwUvBxE8ybA9U/ZLSjSMcuvMtmExs+MGFVyD7QrR8z8KMlx6HUt65aVggvug71TfTBKKnjh8JS6We3Ceu63@vger.kernel.org
X-Gm-Message-State: AFuF++nu7AvKokqKIJ2spXqMojF8nDGpiE1D4qs3eXgyFwchbFF9b9wF
	REoem5NArcgBuugr+ycEbYgaTyyuhF0esJN97IRLWAx9wpB9DY/oYWWb/7i+I2d022kOFFMBVVy
	NxZ+wb6EoBn7pxMhm/lLQQaqYJPcYN9KXGx5ghV5BTOyqbEuTCYhwVX0s4hOUX54J
X-Gm-Gg: AYBFou0ifCiht+nPx+908Ewn8OPBGP3DgwYdVrhGH1NRVUVm1wc5cIWAso2fBFDA29M
	aEEibP9Or/1VbpCtwQa7Ug/BkC1OO7VEvDVxvi9IkhizJuewAl/qv9TQH+mGk35fJwaXow0pnX9
	BrWHaZjAM+D91c8Dkn2oS1rqzI1CCEs6sawHwitgVheRFLQ53pDlSmRwAw4Jyw4dJjzf70ntYz3
	0C7DWqEORVwBiUAMRfX0zRT94Yul+sAJNHQ+2/WUFB7OjtIBKBLA0bqAY7BTkrh0vA7wyYelrfn
	GXElKuq8biA2nHFvqBQSL7Jjo5wABWqXT2VN3QhwE620KzPS/bbKMfL5AqgNUdcSJGkE+Fnaf0s
	qRfuC8iEGGt5Kexo4OiYDJ4iQ9+gT
X-Received: by 2002:a05:7022:eb47:10b0:144:f480:3541 with SMTP id a92af1059eb24-14503fe8205mr1007934c88.21.1790225838833;
        Wed, 23 Sep 2026 21:57:18 -0700 (PDT)
X-Received: by 2002:a05:7022:eb47:10b0:144:f480:3541 with SMTP id a92af1059eb24-14503fe8205mr1007916c88.21.1790225838269;
        Wed, 23 Sep 2026 21:57:18 -0700 (PDT)
Received: from [192.168.1.25] ([122.183.173.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983d73fsm12919002c88.6.2026.09.23.21.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 21:57:17 -0700 (PDT)
Message-ID: <92ec9d68-2baf-4b8e-a8ff-74e0d2c7295c@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 10:27:01 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/8] arm64: dts: qcom: hawi-mtp: enable audio playback
 and capture
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
 <20260923084627.748920-6-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260923084627.748920-6-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: b8gagqgLnlBUF1Du9-WgbHx3mpJWbuT3
X-Proofpoint-ORIG-GUID: b8gagqgLnlBUF1Du9-WgbHx3mpJWbuT3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyMSBTYWx0ZWRfXyrkSab8jN2OM
 dnZukBk/rar6JV+jdrSbPbW2TDeNtvSW3wCjceSlCVucrq7XKgHXWr9Pr+kXBlZnkzGeQwG6aSS
 rfHJvWZQXxKwYavut2WFk7xt/KG7m1weSV7MTu1Kfk8R59w6lRwtpwNmUoCcslOGxUNu9vhs/79
 XKJuFQ+qQuHjdMRZtKJf/OC1KMLWvPdbufLDgJw51+P1ncX9WSpjbilpgHxx1J1Q89RX/xGCo/B
 F/dZd0w6wAqsxukUTaZl0ySDr4cZ/fhdq+AUIseaUENfuOPeAgdNw9Kfa9L246Xsw2j6BP/yQz8
 irU5l3WcD1aCSbMafOfR0GifQII+Up+mqSeo9/dCE3yuJUFb8Hz2otSLS9kfQwVf0pRDPXkvRHp
 Mp2Ost48fbiFCy7l1PTc9JivfBYICCBOEUFMYexh/BynfyRYHD5xD6icOCW15sjr9ZH+MXhuPg1
 EZ514lCT/gSx6h5V6Fw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyMSBTYWx0ZWRfX4UKpjm9TIwhB
 0xnj2zplMEqSiClBIjCr4aivctjf7IedKAq2N5SQTmthWZ+XLIJsrxB+BISCRTjc8tmrBv/G6lM
 lRCNmmxliuI/EjwZ6INOB2ASgKNS2Ik=
X-Authority-Analysis: v=2.4 cv=f7vdl+yM c=1 sm=1 tr=0 ts=6ab4adb0 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=uk8ae9/F1LYL5lfeGCaUoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=xu3tYevT26_x5ihNIyMA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240021


> +
> +	vdd-micb-supply = <&vreg_l10b_1p8>;
> +	qcom,dmic-sample-rate = <4800000>;
> +};
> +
> +
> +&q6apmbedai {
Nit: extra blank line here; please keep a single blank line

Thanks
Ajay Kumar Nandam
