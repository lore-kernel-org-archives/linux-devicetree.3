Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5583D3335
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840700; cv=none; b=OSYghbJ04rKNFYNoHGGUI62cHxTeugRhyUUFXfF6ZyLw/ToqxItFBfBEySxfymyxe/crWOeAVAGFwKIID4U5NbmtLcB7+6OzhaoFAg2UibqoT5kxuU0sCM3dlkJXMNbmDST8OzkPgDvNTviRC7Mt3MavggrgXhuXvwGNURocDDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840700; c=relaxed/simple;
	bh=XPwFnz6nRbNHsdZqMleOnyjBbhO0wtzOzsq9bxbSsZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IUpYFsDANgpB3B4QJ1Vi/8toCBjrajflvxJbdT0xUrdlvEGYDe2HoOoHUOPGdxXHPknJYmhINXR2doYH5ZzkcdCh+2+ahfOMWl30OykZEkRFOs6eyvPduX7tdm0iT4ZVl5fIfjP+iNjsMUkqVM/NYxa6/w8gkiXX12pToU5vyYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=llmYrdTF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j16PCA+1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="llmYrdTF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j16PCA+1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5GvY53198067
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XPwFnz6nRbNHsdZqMleOnyjBbhO0wtzOzsq9bxbSsZM=; b=llmYrdTFsnjF1cFw
	vx652tQFYeJyq7+MsR+c7pP+zZG5eZh7sPBt8RiuBC6m1btwTpoR5qO3LnmASLuJ
	cOKiFs2MJyEBU1QaO7BHYLazANHT0k5DW3z2+QBW4sn0hYO6Slh1JqUrmdpOAHg9
	a4bJZ2wX3VAHHenQbFx1NicjJsJu0xvMg838+1Iqqldy/q1uEfKfsFRcI7dmzMIV
	h6D/hzadeRvAEG3uN2SC0Oiw/Nxi02rjBobsAMlMFWSjFXrMxK4tlwfM7Z/1gazd
	GZ0TNM/eC3dkwS+7o7Yn0kHFVQf/E90ibOA+iy4SM1ZM4VP/70FAP+iQOsqcJQcI
	yyruUA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qatqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:24:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb98b09d3so26624541cf.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778840697; x=1779445497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XPwFnz6nRbNHsdZqMleOnyjBbhO0wtzOzsq9bxbSsZM=;
        b=j16PCA+18YUQdiIjDY130qdeaK9IER8GnEKuIssoOEDcMZl3Q6fVkZpOuHP8RZPOup
         JAcdH/2rWJY2Hi3HhIBinb6ejFR3xqZ9LHqlo4FMM1CmSzAiEyEwUwS4prwRoQeJ80Rj
         uV7tkDquLx15dm8Y8oDBDKjsMs4InHdJutc1Bt8E37r12yb53fqp0B7WnYQpgfcyyzYo
         T0f3g+j9QyqmenX41A5X5Toahfi3WlGFVeWVzyqi9RiJT6TPpwMPqM9IOPSrQ7afnKzF
         9rkjT2I9G3Wx05STX4iBKQpFjB0HRmY/0PVFai0vC5yEwf9dh2BteIV57P7v0uW7uVnw
         YlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840697; x=1779445497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XPwFnz6nRbNHsdZqMleOnyjBbhO0wtzOzsq9bxbSsZM=;
        b=M4eui6UJu8GJO5czgFNXJ3l0kP1sXnIwEgJdQAKuTOGR3Xg4nOMqRiVstCrAZ1Bwmj
         zX9pix4OLx29p3wi3RQYGHM8SjB6hzdk/wuKqKErl52KTVvAoAkbQgqofsuj05tsmT8A
         avLMAgvXulS2sKfALMK8eExyYP1GkETJ3FZPl/EJsZqlSJoHo1XIcarQa9ntIlNOE+AI
         +IorD/y1KyzrtGRaVhp5FUG8fLXUo287MVEUhv+XMiGW80dTdgIn/UEQiOQcOyBIgp/b
         obJUqwfzbNwQ/MbKwNZyvYQqexCgLAU+a8kafIFDvLn+t6Skbx/RahktJZ6grH+iNrqh
         wotA==
X-Forwarded-Encrypted: i=1; AFNElJ9HbudpXX/pYQHBLCUfgCACVcjhyk3QuKE9vBocqWjHvwA280h1sAEQ+DV0qUKqAdipx7Q1sMb1VZaT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6yhN8xVYkYz8zwuGedw9+0IhlE+CgE7kD5/9boC0R0e90PWyJ
	cZh6NYD5v6YXbLZD9aF1XpCx8Rabrui7bBQ3OHjjBKZYMb4ywGIRpzYA0/pmDSEmIxI79CzleMW
	rtVec0Y9WWiIfxW8/FM50r3W7uTlS2gb+xeeD3R+dP1LjXATxrwoZYJmaqqjHOiU6
X-Gm-Gg: Acq92OHHqmbBVqKfOO/GtSHUr2EONQ21v0r2XgBhL078QBTApIc6ackHJL9MURcfoWN
	jcOFMCwWzkeSiFxOsyVjBpN3RUkuxUen2IgIRm+srZwDB7nU3ZzuakEX96DrRAx//qkE9qcFl2S
	11F9KgigJxEPOkhJqYnDaHD9TxuqfyjUocfRf6EuqJPZ+KB3oGJLgxT0f/43MriEgLNLm6S3dpU
	v8VH39rYuPVgF07OosY+AOQ2UcPTPRsJbbVh836TOhr+zMAukpum1XWn7zd49BRrOX74FDY8lPq
	zwihWEQT3n198h50wueSUcwt47DfRkxiR46UTY91ndcRx7LQedyBaPZTja9TDzfGy4iLwuIwi9m
	LAPcxoBOJ4eihyTQcf5iJ0Zulb/fdJx8+OCVzsd3Ad0X9UWd/7v0WPChaM1TbFGH0xQGY56H9KX
	bnzRY=
X-Received: by 2002:ac8:5945:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-5165a003534mr31631711cf.2.1778840697387;
        Fri, 15 May 2026 03:24:57 -0700 (PDT)
X-Received: by 2002:ac8:5945:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-5165a003534mr31631401cf.2.1778840696952;
        Fri, 15 May 2026 03:24:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b3e973sm1866130a12.3.2026.05.15.03.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:24:56 -0700 (PDT)
Message-ID: <8ed6604f-f959-4b20-8b23-ded130426f36@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:24:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Enable ice support
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260515-shikra_ice_ufs-v1-0-b1b6ced70559@oss.qualcomm.com>
 <20260515-shikra_ice_ufs-v1-2-b1b6ced70559@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-shikra_ice_ufs-v1-2-b1b6ced70559@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: D9triiQFADKfr2Lr7FEuP8pV4gUeQQfL
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a06f479 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=TF-tFn1qDOM9O-gCeBsA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNCBTYWx0ZWRfXzv4LEG7FLPpn
 P8hnl/bcnglqCZaRsbZYSXgDLaKKTi2K+I2zgFDSQnDBhq0f0tZhGSA8e+Jo4NzGDsWwc7AJ8ln
 zd0EkhujRlQgflS3U8dGzqQtZs9dtgmu3DKn/co0v5Dw8zm7/XxFYTvWj+zvk5+d5UF4ZT3vgHm
 pllZNWB9dZYaGUl4Ab/f7uPo0xlLguLJ0wBrYu8ApeagrMDn9T9UB2nvuJpQll8wKn2EnuacjfO
 6RQW1yE4YhVJ6FA9doRfhJuWnSn7OBHmXda0FkCvX5xN4h3Nlx5D6bN37kRSUERCTQ/7e2/1P1S
 4Vh1/mlni2igy6EJMkj470rlgcsIlUZUkk7Wg9J2kk0X95qPBUcbcq71n24A0JTVW3yX9TRKebb
 Y0yquJTXmA0RGJySuaY2Deq+gx0BUTz8305RmOxDjrRhJafplSpHWnr2ju/X7BeY8TdHJ7VJwL4
 0MxdgRtstd6Wdue0YPQ==
X-Proofpoint-ORIG-GUID: D9triiQFADKfr2Lr7FEuP8pV4gUeQQfL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150104

On 5/14/26 10:30 PM, Kuldeep Singh wrote:
> Add UFS inline crypto engine(ICE) support for shikra.

s/ufs/SDCC

Konrad
