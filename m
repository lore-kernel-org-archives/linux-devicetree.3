Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED90C3A3811
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 09:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776762860; cv=none; b=dY9JpdQXtT0GbxvbAD6C2DswPvDWDONyCwytmpPHMdPbEWCFd9FmWQjtMku3URnG3LLL301sdj3UTwEo5J+8ZIcNQ/iwlS+/zHkEQvg0/cXGjE6eq1ABafGUYi0kEkgM1nGp/QXLejFQRYUxd5Z2I890DAJcvx0K5x0J5A5DDmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776762860; c=relaxed/simple;
	bh=c2RbYcy+iFlDl5AFfa2xTzWrlBsn2+9E63+1Jd4Fxzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q20w/Xje1o48z3MuxXJMQdmCgYoYQ3x4uIi8/KwrkHe8C75Pjm1lLPdf5QBFk2E96OilptJ4Mpc6mBDEiUIM8lTpgCht+Z3u4IFvxoieaCZxEuVBsV/4Q3MbvS24R/AWHZ2Ue2Wd91YlwccOYYo5Kbw/cNGUAw8DZoHdmLjbu+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqxyvcKQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g/e5HPZ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqxyvcKQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g/e5HPZ8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L8RQ5V1600585
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 09:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4GypfJ8XGBKC4oouCH61ngZdwxT5uRzGs1MoGPINQRI=; b=iqxyvcKQXqzx3s+p
	isFMG8LLzkrLwEBXUXzJs6T5c/yxBOzup3/CdgC8Xu93oejm7P5N8APh1fTtjNku
	CP5F2m4fLD5e/ELMR95SjYTiu6Bra2c3J2xU2WNjDbN5exSGiPLh48EMDMBcvLIY
	XxOwvMzgth75so9FRHqabD/8+6VT7UuTTbiOplYAfSf1XiqYTmmt1IbPArY8hwjB
	8iIk8RC0s1KEX8SRDKDXnjxqUDixdOB9PVmhnDl6D14ozN7FeYkBcd/+GtF2YOsp
	lbwoQ6ZYiBZ3p3VuYvlF+exsGjpVb23Xu9yzAnSfVCIsDAkzF7wv7LNABNVO76rt
	8Ew0NA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh89cq6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 09:14:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c797d8c9c2dso3725435a12.2
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 02:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776762857; x=1777367657; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4GypfJ8XGBKC4oouCH61ngZdwxT5uRzGs1MoGPINQRI=;
        b=g/e5HPZ8k54yIOth0Mh8Hip3tAATCZrnTK5Xypxdal4Jr3NodF2z0nH1RfKROV8Fn8
         2MqqmUbkMbrtPvHrEfdn2F7ylVQFVucKRj3isPROoHjQ9QWCgT7vQsJSilGU/w3VhTg7
         Cv9NadnIGPIQZcFac8CEJTh1oTTFpSQrq1gkT3iTBezKYVRHvj0VOUGryEwrpvVyeeEz
         UeMrBZKpj2UQ5MYXL6x6L+IGtstwCp3wBM1hG28G4lJ7HJQQLsa1TVvjDPi5vqT+1PeY
         NcB+CrywCQpdtUtaIf8GtWegzwRny/KYPGh82aGVWcfXbe80gmx/JP4i46aLsiun7P+4
         WLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776762857; x=1777367657;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GypfJ8XGBKC4oouCH61ngZdwxT5uRzGs1MoGPINQRI=;
        b=ARGX7eBCYvDPt9v8jrf7ESYFIXxmdXL2LIO/oPelN5LiKqIoYLiucqmsqJFUNFY24s
         IskyPU3adWbem9K7x0ZDtUMdgWbnqdR9MmJWUPUkUUwbvRZI1tiSsqJHIAdLQ64mHo0W
         g6kqdARO3jhBHsORl6W147Np2IY89qOF1+zdQpm7nO7ge1QapgeOcU322Rx5wgcia4CP
         OsOS4TrgLUxKORNLcz6Mqdr+7txiDU9EWOnysQFttAYjlF4PxYa49zNGmonCvvztY4g0
         RcmVEhDD+eXQL8JFeTkV4W0wzaPo+m/zAa3qnP5UUED+G6jAbtwG3+T5vulgVkSfDnwb
         U/Bw==
X-Forwarded-Encrypted: i=1; AFNElJ9pQTpRVk8XipHOaY4PC0qc0WvzOPS/maOPR6UFL95VWq3uomgI+JLKWxUG6AMeOuHd4y8LIu0Wog0b@vger.kernel.org
X-Gm-Message-State: AOJu0YzKnAuq6lMtlzYD7f2iBNp/vZhTIZJRBMl2bONQ3UQC3trcQ6tR
	Jbh1s3+9Pj5hdpVHsIWQKslpBLIcJHLsBlRoWHYK6g1lQMnw37q8OrzSZH5bYG9lvaU7ygVWniu
	qEY7YZB9+miaTQZQjqGbcwtVvOIBfllz5c3zMjIEc0PXbrWuTpQyhtPTNmwsM1u1V
X-Gm-Gg: AeBDieuzNmITr4+cuwqdpncldbWdIJ/sOODzcN+Ni0ib5IxPThIcMVbVGQR7y3gbZJh
	/2Ey9N/329i/P2iZdP5SShoPQzzqnzyCt+ZabNNynaTs4Zl5MfrEyhItHvw+UWkx/IhwjqJWlsF
	knW2tD92ZYXVJwz+mT3sSM9cEhkDBm4UzPy6/tXNFBhSjqVBV0UVw+TM6nJ7/A++mxy+qI3vwGa
	5yiSq6ifFvd/KPo71l5wjsy795n/GBpRVAqh0ZIimqXtfaxnFN0+SiFi+kwqbzWiCqGV5KrtOY4
	zqWaZIFn0Cgewwdpo1xdAcps1wLyyz9JcMoaPwLeO9yKUiNnxavIgEpV5byOJ8oN+Tt2Hi1a/Vz
	tnFIbsySAm6grrIN8c4IZgZ1FMTMM+xRzetWmX/hwFXzIEjH8b1J22+/CDm1VK4DgSEM=
X-Received: by 2002:a05:6a20:12cf:b0:398:ac0d:9a0b with SMTP id adf61e73a8af0-3a08d93976bmr18960839637.50.1776762856239;
        Tue, 21 Apr 2026 02:14:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:12cf:b0:398:ac0d:9a0b with SMTP id adf61e73a8af0-3a08d93976bmr18960794637.50.1776762855798;
        Tue, 21 Apr 2026 02:14:15 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976fa40b2sm9292596a12.13.2026.04.21.02.14.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 02:14:15 -0700 (PDT)
Message-ID: <f8d43a33-3b43-43af-8ada-9fbdac2df7cc@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 14:44:07 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/13] i2c: qcom-geni: Isolate serial engine setup
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
References: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
 <20260227061544.1785978-10-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260227061544.1785978-10-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA4OSBTYWx0ZWRfX0sfL687YIjzD
 wkfDT82mVHNI7qge6oIuAX35iyVgGR4NLBpAvVfUN9Co25wdILtuqXcrsk3Bkycs+IKeNwdztAK
 JS7FyJfnbtJa+kd1N0BUBe9Uzecd71AZrYyE34nYSr/TaTfjqeiw4hV7gW0JvWsb0nwGEYf8Hb+
 35u5sJ1DjCZpk1YKm1gKGQ7ldgH9kbafeMmu5EXeB6RYBiJGYRW3rE/le0tQyTMm9rgCvczZeYS
 wwaIXgZ4KiKlZMhMOWWF2WmzsrB2/JmK8rRQYoDzTOlRXGYbHUFGj9FWGTci1nAZnb0zX57ioXq
 VmsV61PsAvTcLa1BjjDzuZv98Lu7LkmxR0PT90tYc7SkPsdRReM4Y7qSSOLHha4dnQVnGI94A20
 NVHXSj7S4GNVc0I07t7Ejp0+T5LWodxfy7YOJaGbQvLX587r4HBjbFQxAj/AftJDQMNTuqzQpGG
 EO4ZcxMSKSEUPt4Nq1A==
X-Authority-Analysis: v=2.4 cv=D6B37PRj c=1 sm=1 tr=0 ts=69e73fea cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3uQcbjdxft5aBLpoArUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: rvLjDsA71WOlroG5un0wmyjkCXK0Rpoh
X-Proofpoint-GUID: rvLjDsA71WOlroG5un0wmyjkCXK0Rpoh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210089



On 2/27/2026 11:45 AM, Praveen Talari wrote:
> Moving the serial engine setup to geni_i2c_init() API for a cleaner
> probe function and utilizes the PM runtime API to control resources
> instead of direct clock-related APIs for better resource management.
> 
> Enables reusability of the serial engine initialization like
> hibernation and deep sleep features where hardware context is lost.
> 
> Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

