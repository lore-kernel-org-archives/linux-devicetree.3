Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C662A47DD75
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 13:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777989194; cv=none; b=HwNH9Rx3NEQXso0edMKMM0Q5dKWl3eeOrR7zxjOqXOlicsOF3NOkgHheRO03Ac29OQnnN2sJeFPareUpzcPmSmiYVQIXd47/o2zmADOXEkHTuD95ludOoVc0CF6604TsU5FGBo+GGJ8nHbkiOnEUdphx0/WjE4fE4ZPn8w/dk8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777989194; c=relaxed/simple;
	bh=TNhWjzdEghFHJNAFmjOMhfHZQ8f2WLJBYXhEETPqwrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MKufKQD40lAN9oM8VapcouEmGZ77/MjwWMMTC99XmAAyZtLDVwV0i4mkOCzW0wFU8OtsdN10peEdJjl9BH3zDkA3EAoRCXsjS+X2SvBPvkQeQtJSE/0lOQ+Uq05DHWPcaYgiU5Ng/8V9w61qKKEeuYxxIqg7gMgiW0Von8y8Css=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YwIBM+5k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQkYYwV4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YwIBM+5k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQkYYwV4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645A4HeD3740717
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 13:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ytR2on/u6KptxUeENDxG4kfoJZLPo0FnB1HrFH3+m8A=; b=YwIBM+5kVjS3yA3K
	M0kE87hEd5NrtTvr0wlV2AFAAp/4W5TmE9d4XDwpKV8WAZOxVMhkvku1Ge+4FqwE
	iAhCG/AcFpM/65IEdsf3aO4cI70GRRI/nSsCPBNjRsoMleB1caCaiyhxv0UdbOxG
	fm+fG0kvu2b/tyD1oi1uLY71No/zBqjuTwvroCwaPyQmWgx7Zhr3Iu0MEVLqY4hw
	tjbMEGfS1gW2G+UhWALeqqFpzwDTo4ChgGgq4BDXn30pvECcCp3NrBLMEJQwPBYI
	lWN4Fy3BJepkWiSYxsXKoLo3RcM97SkNgiHDI0PY82skUy/0bP8aNobZmETTM3ED
	6BtLmQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyefq8vwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 13:53:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8353f5242c1so461769b3a.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 06:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777989191; x=1778593991; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ytR2on/u6KptxUeENDxG4kfoJZLPo0FnB1HrFH3+m8A=;
        b=BQkYYwV4zARZRcmrqyw9ty1sgAGlg1PPyZqf3mTPUxm6SyId9I3nwf8ZfDz5In1uem
         3yNBv7/XZZIveFBdzqC72+NMMGqvhSlSwf+sWnn2rmM3eb2qL4ifHlHVypj8g2/tDO+c
         T3CJX2NWi1Pt1Mn/FUXNywrYDw7qw67uXhBApLETFvSiv7w5klKzRM5ASX3ed9iWY5Q2
         hPw+Dfm6qYOce6d+fKaBvCpHE75Glm+wdEg5PDVhdWwIV8ICNNsU4rUysjwoW1Df7Xdy
         EtRZjglZGOlONJds0lQYUcUXR6Pfat2jUa27lb1eLrVL2/lgJJ8R2INIAUVcvcqcOKdU
         cXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777989191; x=1778593991;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytR2on/u6KptxUeENDxG4kfoJZLPo0FnB1HrFH3+m8A=;
        b=PxugcuXj6WYL9qyp+VGfzk8Ho4x8ywnIYl51Nkcm8YzL+OUklPXdqaDbfYEMzqo7/O
         +dKhCaUJdnKanSZUjxn5iTgIhyusTr8cPskPQgsKeJWMMPVsO7H+hBG5kpEvaNW5dhaf
         jWAsdZUlWfPEhjAIwPTGVNr4sANjnWQH8AxeM81IbT1g6wplsaDv+5qvO35zy5KkLlpJ
         Q6WAQLLui44w/4waiEnwGWlSAUuM8qCZLysAwT0ar7DvkKc9vsW9KaTMZNh12ha8V1w4
         Fng48QkSEkeJX4zrye5DXd6PTv90piRfROOhy8IB1WjjPdg694IUayfN2Hds/QBfZNKN
         waPQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Ex8a+54bSY01Z2Ojcjul/ssrAX1PIimO76d1iUOEkqd1W+P9844carDX1Ruf3NWFWWOsiDnhD8IKW@vger.kernel.org
X-Gm-Message-State: AOJu0YwmQ06o44LTaxW7OY21h5+IUVYhLL4JcUB9uEfjv4+QDh0nX4Lm
	H/zab5UD7xO0WXTJ8i5CwMPDGCzxkJda2rqX3uH2BYr9rBU51/jQ6uTS2RDmfTjlSDNyd+E8CaH
	HB5TqmKarbhmxY0JcMgTjX80sLQYFHW/eq6p3xlM+4ZnBh6hSqoxNSh+uYekpuQmp
X-Gm-Gg: AeBDiev6n4Yvsvga6kwMCAbxMDCDg/cC9yRq7XbWtCsEv6oSExnaGfOeT1ITTmHGJR0
	ElITGAod5VMhhMupAeTIWu/uhVcQUxeToeX5zxwIV3S5dB6K0koug6nryCV8D5Yl40JIRadcwtY
	HFQq3soFLlTcQzwxbtT6OAM1xSc4APOKgvqBytrgcx7f0bolKQBGCzslY6zlZjjWPGzzxSPkHir
	emyJjW9CR2SmvJyDsHF4cH+j41CEldBGMbfINDRC5k/zj4f71H36Tln8i60YnxODvSqXRk41mDi
	0kp0R3gdBK5KEpUDeuYVw18KYpyWQX26C4dBnFV6p9aw1j03Pp8xrCyO3qgpoTK6Ai7KLcHoRAW
	gn+C/1ETltV6a5asZYLk7/uQHc8O9q5lJwQ8/pHgETS/egnFyxfknSS7elNsJ
X-Received: by 2002:a05:6a00:760d:b0:835:36f2:7332 with SMTP id d2e1a72fcca58-83536f27ff9mr4928782b3a.2.1777989190707;
        Tue, 05 May 2026 06:53:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:760d:b0:835:36f2:7332 with SMTP id d2e1a72fcca58-83536f27ff9mr4928753b3a.2.1777989190057;
        Tue, 05 May 2026 06:53:10 -0700 (PDT)
Received: from [192.168.0.5] ([49.204.27.125])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682a4bffsm2164299b3a.56.2026.05.05.06.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 06:53:09 -0700 (PDT)
Message-ID: <f759f97f-1231-48bf-8d2f-6c13ccc841e8@oss.qualcomm.com>
Date: Tue, 5 May 2026 19:23:03 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: monaco-evk: Extract common EVK
 hardware into shared dtsi
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
 <9ece279f-2f57-466a-9af1-9fc8670c8ef9@oss.qualcomm.com>
 <4a41079d-4e3a-438c-9996-c756206c0c3a@kernel.org>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <4a41079d-4e3a-438c-9996-c756206c0c3a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEzMiBTYWx0ZWRfX+aYpKMout9e8
 aOL7/92xjP6LXQrElOBfz9GrC/KICrCehCiE4G68zjqMXGM30fvwUGZZ41hlUqpRY+Bi0T5MqDP
 ARVu3AuK39I+OfeUrzmMadxiUDRkVyDchlC80Eu5KVS/Vfoi2ZjGVkLrcN7tzU64igTZNmCkoUP
 r2vAUKYZlOqtBdSMg/erDqXYPJwrCGtojuAI88sfpZf9X3f23COhWM3tG/AUdXANWvIOc2wLWZy
 d/k5qBihvF9R/gXALpkVjJE8oatQWJZZxAkYJpk73bUQ+K7o4kLST6rThB9tP5mv1S8+Px05fHt
 GtOAj77GITBn97edf3TEwNY7IDamFL7eqUBkGvsaCH8ogfiXq5qbUldKEucNa/mLHqtsPSPFl5c
 DOMLEPtMQVCQoLuhIxdF1hlyQwp7bFoZqWN42aVMclT1SvKitMcuBqOKZQIs8a+QRF4rQPSX/EQ
 MBLiAvLhd00jtu6tD3Q==
X-Proofpoint-ORIG-GUID: f9yyvxWFIUMpmf-iXFa1h74Zj2NVu-24
X-Proofpoint-GUID: f9yyvxWFIUMpmf-iXFa1h74Zj2NVu-24
X-Authority-Analysis: v=2.4 cv=edoNubEH c=1 sm=1 tr=0 ts=69f9f647 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=9uzW0PS53YT52NB8YZ7Mfg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7p7hMAAamFtOh5F3elAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050132

Hello Krzysztof,

On 5/5/2026 1:49 AM, Krzysztof Kozlowski wrote:
> On 04/05/2026 14:57, Konrad Dybcio wrote:
>> On 4/27/26 7:05 PM, Umang Chheda wrote:
>>> The monaco-ac EVK is a new board variant which shares the majority of
>>> its hardware description with the existing monaco-evk board.
>>>
>>> In preparation for adding this variant, extract the common hardware
>>> nodes from monaco-evk.dts into a new shared monaco-evk-common.dtsi
>>> include file, and update monaco-evk.dts to include it and keep only
>>> board-specific overrides.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>> ---
>>
>> The patch is a bit difficult to view as-is, but the gist of it is that
>> the resulting monaco-evk.dts is:
> 
> Diff should be fixed and since this is not even b4, than producing
> proper patch detecting rename is trivial. :/

I acknowledge it's hard to review the patch this way.

I’ll rework the patch to use a proper rename (git mv) and keep the
follow-up changes minimal, so the diff cleanly shows the extraction into
monaco-evk-common.dtsi.


> 
> Best regards,
> Krzysztof

Thanks,
Umang

