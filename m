Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B15F3F8230
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723692; cv=none; b=ZVnDS2i331rTucZfS979ntr+CdUF4O+aZoj72aN7RtTL41JcCY7A62Yf5zMG1WZhnt1Yz5GJW5uaO6LW03FSDdMPQeDRLCmLkdwXRZ07KOQDOUujhFNevb2yq2HqtLtZaTt4Q4k6bHWAfWJmN5e8X8VBBF/fD4UAw+Q6+VY3Ftc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723692; c=relaxed/simple;
	bh=iQaW9efmJxsFty8KriV+Rc8XYb9AyVC9D15vgPxxi8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HnAWOx0eCFoXoV1i+IQr8ZFpn4YrQdeRfaETXfMKp8a3T2XzfjollEHuHV+xUV13dFocBb3++QL8Gr4n0FWT/Za578GdMtVcZWRpRQNH6F6UOoKR4IKMh+xT9csbW73A6/uzuJRGGvpJwd4AQPtZH/ZtJlLrEmwvGdjqMvAoSjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=moYsVQWO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YNrwbIrm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="moYsVQWO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YNrwbIrm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8wbNN2391544
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZR0HEeEszfHRexJKI3MVdAYdLZ6rfFh6jHay7D8y83Y=; b=moYsVQWO5O1l0wv/
	YpX5akfMpl7u7eibf5fssfB8G6AnwviprmB9g+k5x1dS7m4D6eLdErKTvadUsF7u
	1S3ekDL1gn6A0f7JZfK0wjMZdXv7McSJBisLiXKmk2tsdU/l3hHjOIzoOzzCutLl
	wXGaU3ce2FX0jPF1SglaBQWWf/RJ7atTwq7PW3rP1FxyuWHzN0aOUvfDNmg6S7/k
	nHKCF4vUUzesmHi+Kk5m2wmdBc1xrqTSREEAJh/HLp1xz12+uodsZsc60V1H5ofm
	iyUn9pvdfIdwZl9eRtPOoa4PesxlxfcSq5eynqY03zmCcOrnWXJuqdlYG4aAhJyX
	8qfqLw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw80ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:01:30 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-734f7d8bb37so229428137.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 02:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723689; x=1783328489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZR0HEeEszfHRexJKI3MVdAYdLZ6rfFh6jHay7D8y83Y=;
        b=YNrwbIrmDcM21NwxvBlwRMWfbYNNb17OmwxzKqZe2uIW47QABOrLCznOkcZo7hyQRI
         XP5wDBkh2g0rdlo4KCzFxHVv3mT0FNCGrehNL8zzcHFHm0d8tHLxGnBb0Zgl5xjqB/yF
         CFgl4V3tuByl5CcxSAJ4ZJrn9XzURPasSDE28t8Ugw4dTyLklOrszWOLCdyXe3x8lpoZ
         Fq0KzO1KV+lGc1gE1iNNgQQaqDbXu1D0Yidn7Wtk5NQefiu87iNS52jBCszsmSn/+/Hi
         qw8ZnbhLDSCh40hMXEjCgTlDZ4kRnQD6s5OFA1LW0WssvHWCupDHzgwlqVexNH/lLUCm
         KfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723689; x=1783328489;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZR0HEeEszfHRexJKI3MVdAYdLZ6rfFh6jHay7D8y83Y=;
        b=B7iXEeUVroEZ+c0H08f084WePDWjAQeXDv0jVRwmHeXVu3+9lkFM2I0Bog8cgA54kT
         uWwsX+CwFhUXjtISNwblOTlEQZk4krUeJ4hErB1ZYo3eJqxYQvvINX/5Tln+rTsEY5sN
         EUPRy/I4d1e3gkbMemTId8eFg5pR1yZsLjbg4QmHgtgsHsTBKmJ7YhMvV9iyRpzDFxFN
         voVkUBmCEJbOh0YOpVxb90bSs+a0mYaiGz5iF6QtJ3kvJVcoqV96klHBbtMosbQLq/Aw
         aXc8eSO0mi+0IEvxMrn7fSCG5qSQh0i31bE/+IWDAd9lpK0LZCQKqqWb4Vgszso6FChv
         Yj6w==
X-Forwarded-Encrypted: i=1; AHgh+RrCoA/kB4qp8wjQeQeCmEqMpezSNkvSwPqBGxqPJ3eXK6z4HRwfN3dhEs5AiCfV1Y/obaEOgX/hDC5F@vger.kernel.org
X-Gm-Message-State: AOJu0YwN/s+kiO2c3yIfa+hO+fOEgNcFzmCc9QTedwTkGmW0Zf5mDQ/7
	mYESyIXZ0k9kgaxiKpI2KyghsMoGCziQqlpQmzi9CxvwjFtZ7CX9ibq2kTem8Ee6FAy6a2DzOOP
	Tf424ugAyi/NMi+dBj73l700SLkFmyVVbGp/wXcHu8+Sp88uiY1djdGRzBwGILdKh
X-Gm-Gg: AfdE7clbseasmTCA7JhSMjK2Qk0GlneM/lZf33CSBuCni+Eh+orUkHDqJVzT+jX/xrp
	L00m6YR5E6tQ8gMi8HU14h+tHr0G5xOun/WdRvAXgAFQDy1awI+uTQ2cPMFXPfRPA4IxpgNIUJD
	SCQyZCBgKRZ7IE26qJ8XyBk+A6vacPOADVj+vI736spTqsD88FmFSVtbmCtlp5CpRWxrZrTq1/K
	1OErRGXDXaQhTY4MTD7d9eGnnjHBKspKrbdXIBzjGXUHxzxbtmnjW54KVocNaUhb3RYikn9yb6r
	a5AHkoqEtHDSENU/F0lbeouKDdFzn7Yc20EOhv46xKQpVnwLewPeuxUvnDBacOU3FapF/Z4sWVm
	ZhoJn+AgUc8TQzsQxsN/uJCVgovSS9tz7uKs=
X-Received: by 2002:a05:6102:3ec2:b0:62f:46c:40bb with SMTP id ada2fe7eead31-734362a802emr2519617137.5.1782723689327;
        Mon, 29 Jun 2026 02:01:29 -0700 (PDT)
X-Received: by 2002:a05:6102:3ec2:b0:62f:46c:40bb with SMTP id ada2fe7eead31-734362a802emr2519606137.5.1782723688556;
        Mon, 29 Jun 2026 02:01:28 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c124d96a2f5sm245939066b.42.2026.06.29.02.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:01:27 -0700 (PDT)
Message-ID: <94cee60d-c942-437d-9136-af0e83728966@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:01:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Shikra LT9611UXD support
To: Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arpit.saini@oss.qualcomm.com,
        mohit.dsor@oss.qualcomm.com
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-5-449a402673d0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260627-shikra-dt-changes-v1-5-449a402673d0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX3o7b4F7RwUD4
 jgoLxOJQO2SG6VvGKlcF6GUu08SiQosU5EDdZk0xexkKB3hK1zq6CbNXoJQmcbGJLfQ1YtRsq2r
 z601IwCW0NROiyINNgUDiW5Iedge108=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX4mkOKu26Cluq
 h5f+gwZJXuWb0B0bgKEVaj0Rn79DxYhk+IVqhsRH2mtJuhCFsrimEtXraLnrV7Kh/EKbjClBPbR
 +yz4kcpgE8yIHSXeLzd1BbScm8fja7m+vcvQK2hPM/U/kIoaKVn/9mEuxyO0Rd3LcjkWcO6EFL3
 LfxLBqQOLES2X4db5TRYWcX1cMMs4afgr/3jzu+GzarAZ5uvb99phuxIMeT+gtrFz+8m3ajZYbQ
 h1sdEtg1nvnbB4u5YUn/H4bif3UCyS+1ERnmf+muGyZP4Gfk+cTPV/Lm/EYmKk37CNSIOuEnIpP
 fXraDkgPrPyXk4yRH5xKcSMxqMc1EJIEDXu8znqbNVDH/eDq/kpgKoVZZM0b9lF5Xzry1PTqhR9
 cs84IgHywwH30+lnmSzwAOf9eiqvvh21ilZIJ2ee3Fr64zKs7y+7R5F2lwhIIYBDjZUG46CjxGL
 j0yEH6RluuZI+1agrvg==
X-Proofpoint-GUID: N8jShHcwkzAI3OmJieDX6fAbJIHGLfci
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a42346a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ApXU7MVGkJ7Y0BAxnKQA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: N8jShHcwkzAI3OmJieDX6fAbJIHGLfci
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290071

On 6/27/26 12:01 PM, Nabige Aala wrote:
> From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> 
> Device tree changes to support lt9611uxd hdmi-dsi driver.
> 
> Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> ---

[...]

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;

property-n
property-names

in this order, file-wide, please

[...]

> +&mdss_dsi0 {
> +	vdda-supply = <&pm8150_l11>;
> +	status = "okay";

Let's keep a \n before 'status' uniformly as well

> +
> +};

Stray \n above.

[...]

> +&tlmm {
> +	lt9611_irq_pin: lt9611-irq-state {
> +		pins = "gpio85";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +	lt9611_rst_pin: lt9611-rst-state {
> +		pins = "gpio76";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		output-high;

The driver already takes care of de/asserting this pin

Konrad
