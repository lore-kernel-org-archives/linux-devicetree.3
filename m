Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B84D2D1303
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 13:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011666; cv=none; b=D3T5fMKIK1xr0slzpjC5/Z3lbij+06PVOcWDiRBGQopJTmpLqhEDWcN5nVZgUZdTYOpRZnWtKZQGHyufb6q1bgxgEg8rPbVH3dzTOa9yoPy6JJdQKccH6tqVVPUVMBKk3i0xsUBUuolZy31RO2DDXhrmJTqgCioxY175gTZ7sD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011666; c=relaxed/simple;
	bh=nhc7KCz+OiYOb+UWgD3CZUOWb1ZWdh52MnddLfgT8QY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YGQ9FFVEQ/ysytBRa1ds2P1whgD0PhhDZozU0gBCQl8ACJiuWELAPgi66LTeIRAAFJ43h9SPR3CG3Bne7yvWFP3frf3Whueaj6JcurxAifIkxVmJFbeFwm7lmHSibX5Pi9tr3F0EGuV5b9xtRU+q6a0pzRi2rgF3ihG1nkPVHY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kMFXdbLt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iTePdh9t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kMFXdbLt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iTePdh9t"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659Cmis52700873
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 13:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rgnLV2/w2XT7HKp712UjzXN1qIRKgOYZl9HRj+d3eUM=; b=kMFXdbLtYgXrT8sa
	NNtgbEqztvNikKrbSGT4KgTpkyEE377r12AZdx4Q4gsQ9HCCXamDs/AG84QjJu4V
	6xFT0nHSDSUy+vLhhmbsAaqM59S6nPCvKzPpxEqBObgMAtQmIxBs6CYwVTy9+f5C
	wAo/JWM0xpQkpr4C7y0l++x+aBadls/np1Uy3PWugi1p1IM9APCulfnJScl8VXyc
	Tpp4Zrvv2xXlXlu7RZ92dZScnEzC0Yvc1BUkPrFIbIhqt9X9c8GRw1zn+yDFDLvU
	ZHwg9QaVcws50w/cW1x2iH5rCiJIPJB5vcEDMfwwWKVR0HQoCQGJMf+rHbT/uBlO
	CU74GA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeeashaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 13:27:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517647fbff1so18697081cf.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 06:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781011664; x=1781616464; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rgnLV2/w2XT7HKp712UjzXN1qIRKgOYZl9HRj+d3eUM=;
        b=iTePdh9tlDtOHRYalu3pLZSDBKWbOqAiWVAc2XCvx7zaKbEIoRoMG3QpsMVYgNNYKL
         wUIYXmT68mINlil9dJOR4/Nn1OljEuv478z8RMj63sG/PmEC1ZTiySNvVuVzotVX5bBY
         0M0pMwZAbYUReEgT3Kcj2595liYE6YhtpsiVcmiiApdXlwvn6a5rxYFYZKyFPO+VfWbj
         WgrTdZ3Z4tzTtxDjXecWUMstVqH4YNPaq1ONCf+JsTSvTTiP9gZuno3p7Q0y7DbZGqUx
         136kvnonI76QVefg+mrufGeYnNCfY+GGkltsMXl2zo9Vio4ZNkdnhWUK1voA/0sEIGes
         hTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011664; x=1781616464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgnLV2/w2XT7HKp712UjzXN1qIRKgOYZl9HRj+d3eUM=;
        b=PcMvZ0No9pao0xAcJDV+/5oWdKuUTR6mdEmf6FgmseC2IR1p2jOOJwqKsvLEW0bkU/
         6ZbNLzHUeo0pZ+O6I6gP7b3QMJBPpUbwXfkYbH1oMEN14L1AvV3oHENrh39FMYBqyqcf
         a6pK+05u18eNpMQAdlvrUK4HVpVCMg/fuHKtlu8Un17HBNjl8pjMGLF+DhgoksW61ifm
         G2NzK3xtkzUgA5Flc9AUd2m7BlOJOvuQJIxqMaa/gOt7bWWmHsyI6CPD/T/W2xC1e5Lk
         nH3CrjgtJnkMJ+WIP59qbMU59mAmKxK2Y8yxkoNpyAzORnPs3pfy9k1jWPAwPATGi+5S
         DA0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/e49N5S26FKbEMEc7KJaamahpfc3cBr2D21VLo9RIsEtXSwhAER/XmHbaZd+GPXZqn6+DxAvbNygwG@vger.kernel.org
X-Gm-Message-State: AOJu0YxTi7zwMRT87w5ze4UZRamdgQysHreLQ91uuOfeeK3fi/c/umWq
	pCUe/AI8Ct4ZiPAiD8M0blErdPB2kgPUmy5wDjYARQJWvKmYQd5W8+z+03G1ZullR8v1H9dntdl
	MWPgDZU3PTTIRJdtxtQadrkaXySlZSDV+s+o68WIyAgXDPgHyZEg/30Yxv7wA2I2s
X-Gm-Gg: Acq92OEeFw4HzJQiEvutioL9Lp2Y27HxwZk5hhw+Pq6oFbFt3NB4Cbah7gxpwsL2sLT
	fjj3lPHI0smSBT0dVmT5bG4WxHYFjnUFnYAyRmnzbnQVfxeZ0V8/8SYqa4Er36HUrIhwhwU7y1a
	2hIPuyXVzoCcTADVaXGE/TaEfZ0UBpoPbn27ZBd/XFNYb5dq3yUge2/rkzYDyPxh07OacLMp1wt
	sBkINKHLN8/0dTjlhmXRQe611gbAnx/LUsOcUVx/3E1iyrLgtL5+iSDNTPO/vnHf3oPqVaONOj9
	gDW88JK2d0kKm3qeLUP0ycOGnxvJLu491IhCxEXmIPrhD9n6sr1qkNlbGY9h1tULgESw1FM8c+Y
	NBv28tsUwKLXCxaS1hJ0B0962YgvzbczoTGW5pje62MJZC9zhql608wRx
X-Received: by 2002:ac8:5d0f:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-51795b90308mr190603561cf.6.1781011663589;
        Tue, 09 Jun 2026 06:27:43 -0700 (PDT)
X-Received: by 2002:ac8:5d0f:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-51795b90308mr190602771cf.6.1781011662748;
        Tue, 09 Jun 2026 06:27:42 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1464sm1058581866b.55.2026.06.09.06.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:27:41 -0700 (PDT)
Message-ID: <a516c0e2-0ac4-44fc-99f1-ef8dd051fc18@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:27:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] pinctrl: qcom: Add gp_mn mux function for QCS8300,
 SA8775P and SC7280
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-3-1522662b6c53@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-3-1522662b6c53@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nmWIlSgoP3G2wWw8RY3WYSkWNnPKtp_-
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a2814d0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ZVpGCM6XPQlVWg26268A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyNyBTYWx0ZWRfX/GcImhd2LRC+
 /EFqfKwO8I6bzFRFUx6jJ5f2nHnEu/5ZYvzKKmcrakkoziBqeiGx8HtWOh9f9Nd/OFVnVnnuf5p
 wMKcabtBF5m77n5rS0fF7samfs4apbtGpYuQxjZtPPlNL4Z8tuCy08zx35faoFlpppdJh7RoH/G
 HCo1uDUBwdmpDvsROf0620ixL+Vt00TA3nzlA7ScgESROec1BWLjbLcJ5H3bc6OPx38xcsk6lkb
 Ta8IBClHco7v7gEv/4r/+UsNGt3Jl12OAT9LV+cQu4zZoBsIPWsLBTyCxNtMGelW1nPLOyHK8sj
 IkJuhfd9+nkKBJYGpl7n6RsNebrLAa9+hSNHEVH6pS+LOg9e1Ynl6NNUVbN7dqLeQ6v+Ob3ayei
 yCbuIimRavmfsowNec08TMe9FUGbL0nWPgUy1MXbLC1l1QNogsxOdW1jFGFHLft/ouvyKNIDo7y
 ZKi5VPj7wM3sj6YPhZg==
X-Proofpoint-GUID: nmWIlSgoP3G2wWw8RY3WYSkWNnPKtp_-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090127

On 6/2/26 5:21 PM, Taniya Das wrote:
> Add the gp_mn pin mux function to the TLMM pin controllers for the
> QCS8300, SA8775P and SC7280 SoCs. This function exposes the GP M/N
> divider clock output on a dedicated GPIO pin, allowing the clock signal
> to be routed externally.
> 
> - QCS8300: gpio32
> - SA8775P: gpio35
> - SC7280:  gpio60

With the changes split into separate commits for each platform:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
