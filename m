Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507F934165B
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775640132; cv=none; b=RbWB3Y1kLkq3N+scywLa+6JopeNhAzPQIgcnjKTpTc8r6Ft1pl4cY61mTkGUX6okil/9Ks5W3kV9HCS3399wAdTpZzCZw76rzXcgyDv77jqYWsJ6QD1rPS26YoGW6SEXYmS/UEDxmqy671kgmcPHQlccHOBz7l+L8FKDeo+YUVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775640132; c=relaxed/simple;
	bh=CaCOw+FOn/9ibHf/CcV3DwaYq1XmV5omHNJnbQgrU80=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fLCJNXHGinsHoWgWQ2ExrI0QGAP6xty7K9tKx5HBXr8vwEa5YuyoLs1cuIUyMY7lssuMoZOmDrr2SKd6uqjs+x74gDViNuLTC61MhDLA7ZqtVpbcBOazWBYn3Bd6WDR0mmeJ2sDzPmlSyQFmYVOXufcSSJ0r0eoYREoqGWAN6nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q9mm7gNN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pq9N7UCb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q9mm7gNN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pq9N7UCb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63864sd8071974
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 09:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ZwcBaToOf/8n161Gf40G4dnCQ4ssxnv1Gh/fTyACVg=; b=Q9mm7gNNj8ngkGb4
	EH+ZCMbnuSOO7SxNsgeP42WOpVNYjhXe0T2Gk9s5jW0hHBBuN9TlKM/hoUp0K9jG
	hh09rXHoOMbcAJYPqSOQO8acA9g41JClqqYYtI4aR+j5YGZ4QAqEcQSObKb9Qldr
	DqHOtsqAyLRrlzuDxJxNLPIdGVCkuvM8UJWga4JX42Pzj4ibFog7wWTpO+58f8ca
	q+IVUNSFfjLbiOEF1lbVssGQYOBaq/fDnml4fLhomdfxnz42H/p2yllSMq84qdyS
	Y7ejAmWgWlNKjmrY4QPFRvm4SiQQjgg5glpSlAOdbHbXc1tohUQBkOupZM7xBiRf
	3ky9lg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7sxahck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 09:22:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso13673127a91.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775640128; x=1776244928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ZwcBaToOf/8n161Gf40G4dnCQ4ssxnv1Gh/fTyACVg=;
        b=Pq9N7UCbAHnSNAN3V9x3wwMXB6ycUvr6YzAlzD/IaQWrLVL1xroQnBmIvhDjDQoHfv
         8c52kd67LHcIImLUpJES4kGtjJJoQiu5mafpGvj8BXIoMk/VcIiYCKDt3k/ngC8UYvcS
         fTfgunQpw1r0HNV4tB0I7oiubSD3Xb0kKmmxJHOPyRJROOA0WbI6Fo/KjJtAJ89teJSP
         7xJmODNv3CFvWyPTqYM0HgnpZXlGi7iojgT7VSjpO82Xhd7k4q/WkkvsuFWn3kqlFkOn
         3lcK7objgrzlcMFhP99gBuxorG6z9HaqneXIF0vp9PEDF7EX7e5lQw1MQ8hmMaew3vYZ
         g12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775640128; x=1776244928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZwcBaToOf/8n161Gf40G4dnCQ4ssxnv1Gh/fTyACVg=;
        b=UMd9BdZrgl5t/3b22xhAgnHpNZX/wRKDwtNfaxgXhalRC5dZ5EZgL2FrvGmHx8Fkzm
         6hp3J4UFnzmYokejcZqu15enOF7o2oU1wVGZTJI4tTWSYQjq94kV+jpn2npVFYTm8aqU
         3VdO+xg7fjclGbha9x/QNQ0j0jUgLEhOCHSXw2Zmphesj/4Ny/OBLUEmxkY7bKYXdTcf
         UFXVgxnGhA2XUG3pkrmNXej7pzwGoG6+O+CjhIuoX//MKk9Ksy95it5lK5FOd5oqTt+Q
         YsMkEmmGzk8z8bZPpkQnw5R+xujELWQo9j6Q5yHNAquR1SfPe7MtbOOKybA24Y2LD3vG
         3F7w==
X-Forwarded-Encrypted: i=1; AJvYcCVh7d9zyjgRD1Etk4vWzE4tFxkSWa08+Wfv3I04qZxJ4M3S2/oAHRCD9T0qIbxXQCvklC1jgQeOY4Md@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy9AIuVpxQirG6ArLSGqxGstEDQTRGUBqBkGqQ9dE7rqlBP34L
	b0pDoKyzO4vSRyIcSNSqVI+mcN4Aivmhvl6Svu/HVceDr5EflB3QaB9OBheVMiuYzr6e1VMtBfi
	E+2fRgojjrchbS+h+ugCTW5iSX9W+IGxDnbtuv/3MHp+ITddIj/FBByt8zrMheF6Q
X-Gm-Gg: AeBDieu3symygozfD18xO/gRzDjUcqd8uN5WZyBF/LQMTMboBJtcm5jpxgXmaNCaL6w
	4VPZKOGVtouKMzBaPGHQSqfdRr5Vm+9zG7ALLOSIX1tUhIfOZG3k4PD83fivpaUbvpoPn5T/ZcO
	2401iEwAdRZ28bL41WtaeDGVkBxiyQN0KwouzZmL9MC49aKZXkIP4wsCbf9lY2SleUy4BDN3qrS
	wmqt+kjs/yySnpYYsGfrW2Ri5zDYbu1I858nOEA2N/JFReB7HYbnVe7wrRuzJSLL6xRYw/fd0Nv
	JzBRdFXT62N5e5pM4lbZXU12QesyoBBVHe4F3siVfwh5xz0o8weQ4XqeTCQaks3g/5D2eiZTII4
	3AEuFPhrRu5Hmd9PnhLg5etLVyGmjUflVuT1ZwenggmTU9/1OG4CuRKft8pSIiFzZuQRDSCMU4V
	0UbgZVtk12/ha0G3DM
X-Received: by 2002:a17:90a:d403:b0:359:3426:c60a with SMTP id 98e67ed59e1d1-35de67da841mr18575714a91.4.1775640128273;
        Wed, 08 Apr 2026 02:22:08 -0700 (PDT)
X-Received: by 2002:a17:90a:d403:b0:359:3426:c60a with SMTP id 98e67ed59e1d1-35de67da841mr18575693a91.4.1775640127862;
        Wed, 08 Apr 2026 02:22:07 -0700 (PDT)
Received: from [10.249.21.102] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e2893b3a5sm904472a91.7.2026.04.08.02.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:22:07 -0700 (PDT)
Message-ID: <eff7d213-bf02-4971-8f15-0091e9d1c1be@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 17:22:02 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] media: iris: Add platform data for X1P42100
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-3-ca784552a3e9@oss.qualcomm.com>
 <437123c2-35af-227c-3fe1-7d45ea1243da@oss.qualcomm.com>
 <7e7f7778-9a26-45f3-89c1-0113969cc1d8@oss.qualcomm.com>
 <fe1379a5-57f2-e618-dbeb-32d1c3c7536a@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <fe1379a5-57f2-e618-dbeb-32d1c3c7536a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=etfvCIpX c=1 sm=1 tr=0 ts=69d61e41 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=PSu0XLzfcwXA4wXBFNMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Tu-ecr3Dtoo6THx2K7jIV7WU_cRrqca7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NSBTYWx0ZWRfX/KcgrKrLbwPZ
 y1Cv08p/Ne6CW5sU5uJG4FTqBrsvhCYf4lZA4h720w+/FH1jic7HYLBsbFtLJrDVxkvjOOq2VWA
 auoV2h9cdNYKaXJPnWocG/q0PfTfevxC8idq/BRkhPAmIZNbz69Cimk91d/PrhsBcF5Hd6AJuVp
 KJafgxl/qkrJU7T1w5b61VtjGnnzrBDmvFzIFL6SXn/1sYSIidxHb0OB+WRlnNW4D7vTDvNoi+A
 FeW36pRtuM78lKTuyHqkWHeHrubxmET1huANWqFh9ioHBEdibXBxn16BLmA18NsHq7xF/5NrFa1
 vq8S8lTKjdo1vsgorjVd+pBkebPXZvLu1GO4ErjSTXUtJV3tagof3JSGknaGjiZKiECEd0byeX1
 whnIt6nx5PfAcxP+k+kdZhjGu5Bk9wn1BDXEB0lcSwuhJUIb5HiuLELmknsX0Kr/Y+C7Y/hWLEV
 3pj0yN4ixXzcqAlJh3w==
X-Proofpoint-GUID: Tu-ecr3Dtoo6THx2K7jIV7WU_cRrqca7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080085



On 2026/4/8 17:20, Dikshita Agarwal wrote:
> 
> 
> On 4/8/2026 2:47 PM, Wangao Wang wrote:
>>
>>
>> On 2026/4/1 20:40, Dikshita Agarwal wrote:
>>
>>>> +const struct iris_platform_data x1p42100_data = {
>>>> +    .get_instance = iris_hfi_gen2_get_instance,
>>>> +    .init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>>>> +    .init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>>>> +    .get_vpu_buffer_size = iris_vpu_buf_size,
>>>
>>> this needs a rebase on latest platform rework series.
>>>
>>> Thanks,
>>> Dikshita
>>>
>>
>> Will fix in next version.
> 
> The rework series was expected to land in 7.1, which may no longer be the
> case. Please hold off on any rebasing until it is clear what the correct
> base for this series should be.
> 
> Thanks,
> Dikshita
>>

Got it.

-- 
Best Regards,
Wangao

