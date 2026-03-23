Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D013914E0
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263159; cv=none; b=DRwlexIfgyFLXhgsYy8PQbkLwDtU4Fdxu7DOCqZ4/wCYhF2R1j7XqVKpXtWMsXMIaUo3YeiVQ6bFd3I24bA3xwOcRnU4v8ca753pSswUFOK65cxcoONCBcNSgIpiQnam7/Q1UTKuNoG14Ow0PR0iCkLH3V99ynqNKE/UMxpWSD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263159; c=relaxed/simple;
	bh=63XuFVU91Dh8SfSSdrM5+ocQ7GwUchBk8bh+oStXhDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=INoyuVC/YFr6PTsWx3uLhNw7Mo+fKQX/E0Nny0XKL0tU1fnJXYIOH7YKRto8S/a2M9hBnzdodis1a7ihnUqNQ8YIs7w+tWd59O/3O0+qEa7i5U/zvwAmod1XOHq41KKJIyAKThttwCFXZJaUS/d5yZ1A71NnLkFfKRoXqrdf6+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4YRlTuY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dt0qTXS2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4YRlTuY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dt0qTXS2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7taQ71627158
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KYGocshpbXFcrfOfvQgf/WesrIOihcHdA5GDk2E3Bzk=; b=D4YRlTuYV9+HbP+h
	C9qWOHmabtiG/YpE8C44Os+PkPwuSsgv470MvbTLBu1cJLexmJYPMSIymkxm63uX
	TniOOWimoO2GyO9WWQ07OHTMtpESEAFDU/YfHbX6Jwy+JrKd+/0fyQH4H0QoTxPc
	zgJSwZjHRTtcjoZgg3GMjz9WI2WqNpct1N/wywuChvn+8465WHsUouLIeB+hfWi+
	nOaNhy2qD/GiwKWb6WmHRzg8M/duaNFw71B/Tb+rkPzrlvD1+7ma5kMA76DNPgQs
	aFClfIo3KnpktOxBRuqqjDOF6Es/CYodGmy5iGUfwNd5mv3hBRhatZZXmZdk+Isu
	pAH/5Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc0mk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:52:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b33a19837so40009471cf.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774263155; x=1774867955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KYGocshpbXFcrfOfvQgf/WesrIOihcHdA5GDk2E3Bzk=;
        b=Dt0qTXS2bJnydMieQWFDYsGzx1TTEBjfqqeGYnCkfe9JmOR81CoIIHLcaOtc8608au
         qFk/k8lhMNZnYf9qqzZXZ8RIk3JH4G5YYW1KaX6alv/oLVg7sGcFut9lOEMSEW/gKXtA
         h0VwH9GF5dADe3ejP6S+IfG4f2A0UB9LXWunPWizJQPgWkZPBYHdDQ/SBT3DYAdmRHL1
         ViRaKO87ZnOQR2a5DoU53Uk4ZpB4V2zmyGXWe9YhUEVOd3TW+YsakT6jGwI/mMgnvF/0
         mlWIulTVMGYHsFcooNKJDSSqwC67ZjW3ap3xyrFNrDbRbmkItWIoK1SGCsuW1uKCJs2e
         kkzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774263155; x=1774867955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYGocshpbXFcrfOfvQgf/WesrIOihcHdA5GDk2E3Bzk=;
        b=PcTRBzxmgB24hZGcuvE823Qdg35CBqbrQY6Ej7vL3ysIsWrND7g3jtvcWHOBwm5Aoa
         6xMkNgM055MIPgxP//EH1crdBRnb8W5QMISm5HxyshB43dOaFFfNqQm8p/bBX0A75b/n
         oJHtJKS7FRvXPkqtlMMc7r6cj8q/hmWSBwMURj/Opb3gxSexpS1pJphAzAL9Q/utKAyv
         7dVnoP191fzz3mmSya70BAF5UNkLmVxegK7YhXinWe65RG/VTA/kVK/+ztUSnAa6MQuj
         eDcsMJIpmUelvU5QM9b6bUQ46HNVWbVGt04hIokRzPPgFBOSGxmNQWQFpCmDVl0csvEe
         eWyg==
X-Forwarded-Encrypted: i=1; AJvYcCWidzMJyISs9lEGFDSMjWCDNm4XOdAVMkR8fO2OrW5kTF5EdM8w4W7OCX9LhVIdu5E+9axZHXmJw+bd@vger.kernel.org
X-Gm-Message-State: AOJu0YweNV6cBCsZbZRnULoJlyxHubgqxmkcZgTxZOO1N3E3p2Oalc1c
	JWVv7xvN9By4MXHwNI7K5VnOFgNRAkPJVj1UHpA0bruX+KVfD2zpiFUV5MXjOwMQP7qrt1ACIte
	ijp2vIFNquY4DKBJVstj4NVjdeC3+MWHla8ugjDKhvKSp8UiBww0ha0/qpn4t4LCe
X-Gm-Gg: ATEYQzxt/vpPpkWoo4Aps73aOIKEkSCLb0sSzcB4hWAf8tKFScH1fSVGIns4fxcP1gv
	oa1CfR0ablISv+2wFQS5uSzaypekFTEYPRWejhJpoUAugDFSAwZJojX8ChTfUSjjiCFVcxKQ7+h
	6RQFKo0mCVJ2peLmMQCfnWcgzkgTOt8W7ROVrrH1ZAFD+alSlOEB06tAbX7HC2oE0nMWzEyYkRj
	P0/YwDBcoMVdVnvX0NC8DrqWBZtT2YuAXbIb2YAESjqvmF6TcOE9NqS24VxelrfYZpULj5/LGyr
	FEsn3F4TlN/7pnbKqdnOdbY/1rSwy+j1Xd/rdOvFCVD+DetvSpl8+Vd5bQEyNPytmTdJE7nD2xE
	jvXNwuBZEvY+lxu6lEKgHoBFocXFcVF77EoWOAGVkFY14/Z6b8ZHS5qGolQ4AE2BehlWkJ/I+RZ
	o808k=
X-Received: by 2002:ac8:7fcc:0:b0:509:9d9:e19c with SMTP id d75a77b69052e-50b3739034cmr137536581cf.1.1774263155430;
        Mon, 23 Mar 2026 03:52:35 -0700 (PDT)
X-Received: by 2002:ac8:7fcc:0:b0:509:9d9:e19c with SMTP id d75a77b69052e-50b3739034cmr137536351cf.1.1774263154936;
        Mon, 23 Mar 2026 03:52:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9833871a44sm484502966b.56.2026.03.23.03.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:52:34 -0700 (PDT)
Message-ID: <109d21b4-5d16-4689-8383-ecd29bbbf8a6@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:52:31 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
To: cristian_ci@protonmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260321-rimob-new-features-v3-0-d4b8ee867de7@protonmail.com>
 <20260321-rimob-new-features-v3-3-d4b8ee867de7@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260321-rimob-new-features-v3-3-d4b8ee867de7@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c11b74 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=sfOm8-O8AAAA:8 a=4mdWWUweJ5RzV2WhxXkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: R1Z4ii5XYGcMCM0xlwa4MkIfKW5MQNLm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MyBTYWx0ZWRfX1j+PoHgR3GV1
 R/oSmiFZqK8yK23eEepfrPIvoW6cF/Hz0tKYp0ARjwpSTVAXKDln20FDAIW8q7i3f1NWMjP/BbG
 RNbUDq0xxqn3HVb+ZokYRCWtob3w3XUv7qiHmS6BJC67YkXqP4P/rIOQq293yimrk+GcZXlIJpq
 P8qyW0qwdvG+h5YViFd82NN5F0p144EuMF466KudllAefUWIAFnV1ihwOCMpMImjSHwTf4d5FKH
 Uvxed7S4pWkgPT4vKChNzw/2QbNScoQLu7Aw807BMpyo4U7ER9+SoR1T1zhrd9BpQCUheW26CM9
 oxvbyywvQufncGK6wbaHLUOU9hU2PwSrkS7KJ+8OzbxcGfa2rtIj2v8FK+ykLBbcSUB94j91Bnz
 Kg+cxP7WXCP8J220L3U8lASLbWHZUCZ6ALIhFIuWwwtfQ+IfE79Qk2rqjqCh2ORENPapXAd2anC
 hN6+5ty0dfRWYKB7JJQ==
X-Proofpoint-ORIG-GUID: R1Z4ii5XYGcMCM0xlwa4MkIfKW5MQNLm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230083

On 3/21/26 5:23 PM, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Add the description for the display panel found on this phone.
> And with this done we can also enable the GPU and set the zap shader
> firmware path.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---

[...]

> +	panel_default: panel-default-state {
> +		pins = "gpio61";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +		output-high;

This says "by default, actively drive the pin not to reset the display
panel". Is this actually necessary?

Konrad
