Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699B8349B0D
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 11:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777461246; cv=none; b=ge/NM0eF87KXIXYxYQPBFPXh5thBg8vyW/3I9V7Wh8+esngFqTuqU/EJ28pPzFrWvBnwQqPGbekgdzKjGbURK5fOcQS3a2as6Dr8US5g6MNJhwqs91kvb33AW7QeTFq1Yiv2XZ6KzrjnujfbXBK7qIoSO3CoSyH+pQwUlTZ3ltI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777461246; c=relaxed/simple;
	bh=NwdKNv9Hu+IWNEVQY+p5RpQP4NJdLi/dq8xnqnYaRwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qp8+oRLTGHJ1btdedeYpIt/s6x79EINEki/n/owD+IK+Q/JvTIl9afUdVQhG1190OIXKnqpYe3rc0ybH/JVV9nRzzwjhQrOFRiLt3Pyo0OsIOuIoic6lANf7+aXuwPsmY+NWu7hqsvAOsEYp0MmCdOIz8gV0TThmcFdMeRsl3Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L4ci4D7b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M5ZRz5vS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L4ci4D7b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M5ZRz5vS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qj5s2016286
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 11:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j992D0crgViSah9SzynZETMed764JJO3ToIXrer4z6w=; b=L4ci4D7b7m9Y0Lvd
	OU5xI4yGxG/tQDYOuW0NfXMpXASZf4an0LV8mRIkadB9P+TOzZVFMQlhRWmBEqPw
	YUz9AOFe0Kde4xtFhJewM26paqu6gOy+ixNU6jRpv9yPlxKtexrnkpTmdrNKuoRM
	kyc70AJeIqdpx5w0Xy26kt5Dk4/QnUU0GeKHqMXcqLx2PeJ1QsAoNpFMni9asUPI
	sECI7bfDWssTt50K6ohMoY0t+po/ivuA+DBDynvjgjWHcqKqeb36UNqwmhNJnZhm
	88SW8ZjsoUIwxETWSlio4GWy3BxsJTydMh7Is4Ju+PXPinn+NOWfyE2/3Ujk7as2
	AtxefA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du1eebgpp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 11:14:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24af7ca99so167744045ad.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777461244; x=1778066044; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j992D0crgViSah9SzynZETMed764JJO3ToIXrer4z6w=;
        b=M5ZRz5vSxR//HSfcvO1iCIWg72UNeSjClyaCGHhwZkDHGploemhrZPD1HzrpgPEibQ
         owimUM0gWRRaxWizjdFRL441dhyJr6EDSL32YmVtFJD0PWH0A+ePaEWzmPQKNn5Q/Ilm
         jJmwmZuxJHTkavqcQ8tYhfXcFTWk/caFmXSIlpW8h6S3gFpWuzLJxb5QVqysSiU3WqA2
         f0t6ZmiVkAnL9B7ubkRCYhyUdjqqlJuhmPs94kMySI+lGzdYNJ7duAFuV70k9kQYnKuT
         1ajN8PCbNkoWAjD6xI7mxCTLFO5FZgPEsPeWrrGOzJNY/3Y9yUrs3uIq3A1JxcobpvF2
         kfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777461244; x=1778066044;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j992D0crgViSah9SzynZETMed764JJO3ToIXrer4z6w=;
        b=beOoqrUru5FVMZSBjIpGpIViuR1rRAkv7BLa7mKlakfReLVRPLvRvKco2nRm7aRV3R
         VkchG9u+ZMZcv+NELE/VMkkYePzXPoENIlh9mthGO2ThZvZ8s39lKSyhiU8GNdp0JWZY
         Eb6+lmJ6wfw1jluEGcVjXYIHiZ3kbqYNn2nG0DB1tQb/kWsAlYbevHAW9TEI1BAk91dl
         MGDqCcQaeiJHLck/OUZ45yZLP1kuul3qFlib3QEXTcIPlcAsKlN2E4+DL92PmlGVBY5V
         cXeFJ0Ga0xEVNs+7baWV+o/lCSJTsfgsdD6joUmbienn9Eok1mkYCZWkysDR3V8PriiZ
         azag==
X-Forwarded-Encrypted: i=1; AFNElJ9V9IC8OlRM3IYmVqjrlsyvcTTnZNcJ7ObxxTu9K3uUEBeinqUgQTnUS1/C1F+K+lJHwMh9GiIoRbE5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh4mp4sjwmFSZNjXySiKYQ0IuwazW9Hi5E+G2qSl/MBi59IG4X
	LAdsPi2vZh7EdkKQnyBaGnkgwMiweM1axMKKk3y7uP3SjF8opOf+590Wkn4ShBKxxux2OtP77st
	DbnpFSkx17U+zs4hiWvItp6p8pjoh+820pcG6sXZ7J+8sDkWWo3TeDMWEOHhwJoau
X-Gm-Gg: AeBDietF7i4CSjRT/r8kZQl3/AeIS3RUI/6eS/ko1pgj0YPViECshGm7dv3DUsnY2GA
	QGDHqZsRKBf+5fvnHWJYiyp5z5V/3k1RIFhpL45AESbQI7hELY+X67IdDgCwC8XOYyzf85YLsNO
	y6/YcoHmZpil43wakhQ1R0G56AqSWhkT3DWBRMfNmGmrZm9tYmFN62cwCwZ5OeSkJX3FT7uLM+Q
	rGpgHcmg748phzGTmIbtWihqhk6/ucSixkvfcEGcUuyfHNvqA4iZtLcMgMiCaofQS1zAZzGMtqG
	QcAn9M1GBkApO5BgUorCfcshHeJ8qF7ALgTUPllOWTNNigcUNvhfe3CpzA6FiPhYjYw/J5JqE5G
	wmIrfSo11UQIsPlJjT8mJbPRO+d/4e9uvgCAqesE1DB8Qr+N0ZfG6U5kve+WQ
X-Received: by 2002:a05:6a21:6da7:b0:39f:2b9e:e489 with SMTP id adf61e73a8af0-3a39c05b9femr8322399637.13.1777461243984;
        Wed, 29 Apr 2026 04:14:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:6da7:b0:39f:2b9e:e489 with SMTP id adf61e73a8af0-3a39c05b9femr8322361637.13.1777461243538;
        Wed, 29 Apr 2026 04:14:03 -0700 (PDT)
Received: from [10.217.216.225] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd6067403sm1735002a12.10.2026.04.29.04.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 04:14:03 -0700 (PDT)
Message-ID: <be36fe69-e7e4-41c1-9dc7-dc2c3d9af563@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 16:43:57 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] clk: qcom: smd-rpm: Add support for RPM clocks on
 Qualcomm Shikra SoC
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
 <20260429-shikra-gcc-rpmcc-clks-v1-3-c3cd77558b7a@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260429-shikra-gcc-rpmcc-clks-v1-3-c3cd77558b7a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C/7ZDwP+ c=1 sm=1 tr=0 ts=69f1e7fc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=G-4fGFNKO6kq0i09DNwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDExMyBTYWx0ZWRfXwAoadiVn0snD
 ZGV/3z9M5LyRYhknF7ub5F6PE0W4yHhu1BTVcrML9mJGmyi9q7w0Iw2s6/vjDepuMowFI9ctr9y
 zW9q/L4rA6t+2n7R+2kUZvbIkkk3bDJjnU484ZS3h0dvt6stsW9gMlC+F9h4F9d4W7MY+w/Yarf
 GJ3YzzWnXim44MUWf0pqFl7hRsAFXnEOYy+RnYGGtPub1lhrOmoMTb95eX4mj0kvy+ERbuj9jU4
 lOn32EpPxIHYTStWR06PQXwl76vNWufx5zZjAgV6Q0LFQXMLyBEPhe2xPzOveHKTyh09VwZWza4
 LNfI07q3NfPVs6hTP7Muko+kEScApv9z67h7BLJqJD+SAPn1TI0eOhVa13Rn6E10/6KIsFKR7nR
 DAmG9+Pa3x09mfMDQ2f1ci4hjylRm9r8bamQarhahsVkpC9+SYDS4W+2pLcGxOwJGiSjDQUzzRc
 C2+tjNOFNi1K7bYVzOA==
X-Proofpoint-GUID: 0HziVJ-E6alHEEvX09xhmr7OhDTRvQ7l
X-Proofpoint-ORIG-GUID: 0HziVJ-E6alHEEvX09xhmr7OhDTRvQ7l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290113



On 4/29/2026 4:21 PM, Imran Shaik wrote:
> Add support for RPM-managed clocks on Qualcomm Shikra SoC. The icc_clks
> list is same as QCM2290, hence reuse the same for Shikra.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

