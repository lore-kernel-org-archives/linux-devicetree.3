Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0880B327BFB
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 04:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778213422; cv=none; b=ucPfLmBZnjDHFNjVGHGakWCzDoj/xL9ggyEXJ245US4RmLw7BU7zbQRasBdwr0XAvOUvRnULbFggLWEnpLEmPblMilVh6qIblAbuJpak56rvP2Ak+ayBfZ8ztu2De0/0/MrtjOlqjtVTze92S287vDPPzFTcMSsvtXK8nYltrS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778213422; c=relaxed/simple;
	bh=s2gPKB9yTyxjgZVwVa4NP1tmUFvQfbZkzJrVgsnItA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=feGuYMrOsUJJTTS0UWSu3aweyzhyrxUhSEjQYecpifvYOuVenqpoGLpLHreuqo1/390sBZUW11V3nUppvYDJbiI83Newbyxadc2MNEa1jdRof6QVXJCQy4cg5EiXTwTucTgi+oCfH8p+Sih47HZs+gO2pgrkxVx0WtkqAPHK8Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hSLxwXpR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BTdR85VJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hSLxwXpR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BTdR85VJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647McY2S1424522
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 04:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C32iP+nSRqdkV0oxopP4PVPbzzEIbj6B7slutkvDY5U=; b=hSLxwXpRqLfskK7a
	iB4m4f87+XUSb5RQuxKBHq15BZDr/yEEr+0tUnJOrARJ9G1Y8qlvvKmJK81wwhXg
	/X8BWMPiOT07fyow35nzDCBiWMQx0G2Hs5ASAYZL4BnXuX9fPCjCO18z/BQI9QmP
	MMu/Aqidofa/pihDENuMcJytgTUULDkkb1FMBaRS6mAN8HShm3qR0IA4IG+BjeQS
	JEdNKz1YLd6RCFZECVi0IDIG431mdw5RyROjD9WFsOz0PBGue54yYKHSwLs4YUTm
	bNR6SRO0uQAxL6vEJBN3VR7GL8wLjZ0G+GCN+lsZacut4sS028TT8pa4aNhFACjJ
	9SwHOQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0pqfv8gy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 04:10:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-835444b6ce1so1178946b3a.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 21:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778213419; x=1778818219; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C32iP+nSRqdkV0oxopP4PVPbzzEIbj6B7slutkvDY5U=;
        b=BTdR85VJRGrKn0rXGhXyCO6wf73VO7C/+UQafDw59MWhuHUa/ZQOOSQlUBeAThEUP2
         FxSPtjLiw56u+hxdRz9bpd35PgRECzPPi/WQ5klbLYSZTx8Nc7lq9wIrvM4LdQ6v1Dib
         R1Hy9IN7mpkIkSMtSKp3YamkuiWVlsgsulNuRJml0U0GN4i+d0woOv+u+oOlnT8QA8SF
         Slwn9unSdXyYxbkHXewn5C8ptb9Jyvj6/IeUC1Ffx20iUGEjqLqNy9QLsAIroOEdJGSW
         Kw3ISZKuPtBlqDUZ4O2z2NY4bAcCN5EkydkDWAcCqEKAFYqNoWqcGL4Mz5jUswasIjn3
         k9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778213419; x=1778818219;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C32iP+nSRqdkV0oxopP4PVPbzzEIbj6B7slutkvDY5U=;
        b=dbQQEV9d/oUmgEV0oMhuq+lbjggXI2pURkUKpNzlYWEYe5lVeJ7U7sN3yRwIP7bZpf
         YwUn+lWRGinrg6unRK0FkN1MDfyJqIqq5PB9+fV98s7A+sYUolBxiOW9ix9sftZYB65E
         DtfH8ldjWjuqanIL2Ao+rAoT+vWj+tRz0iC1MqVtds1p1pWJOs+V0zBWhpSEJHZ1yVOG
         kAVp8/Gb0hyH24zMVy7wsB9lCGvhiaZP64Cx02HDGWr7y72BNx39D6m4wHdCACCzCen6
         4zAQF6dZ3RgQiSQqGD6v2bFxqFVLHp2v8TvGrHbSeRTO8I+a/pj9662MMiPUcjXv92Nl
         BPSA==
X-Forwarded-Encrypted: i=1; AFNElJ9wSX7S5gbOGZ147eE4610ourJtKMFLpaAYeQVgM1RqTaOCXc3VbemXGnIRqiLYd3467rtLD7hK8Ct0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8HAi7ofCpT3mGT9LeYpX59AVslGFFwZ7Bub+Kv9PzLS440sKp
	CANdvrLydB95/ZvcFpXT9N12zhUYzqLTQ2E72HbIdgsrZUqBj6jIQftotCkqOeE1G4NhnBblFAl
	csC2zUxF5ICt+13f0Q9nOUTA/AhLT84vc565fzhrmgTUfcldjQ3tvfqDxfekDoWSe
X-Gm-Gg: AeBDietP4otilzfMO3P/QvUA1WSKThG2cPe8hGrYmS8bcyrCIm3DWQt4c3zhaivZvN6
	iMLq5yMFkEtvXpgsK2Td9FsKzD3o0KKlmwcwZuQ6aXmBHH9Sb+vI7I/2vRngq7ovSI/0IPgl/AR
	NNBcXCP1hns7r549nc4NlPXzlpAgcQmvYXmloYKhcVvnmhGfOIs+M/U0ufNBeYOKtE2SepqDvj8
	o2yk7r4mg/tAKP1x1t1XJPVG07G/hAcgpfIzwrxRSQKWcD4u01MxwxW5O5ZjXQKYEg8Wkuugqfs
	E38VQkfCeC3S8P9FqYRGTs4Jf4UpiRULbgZBho5nW9GNzBIrs0wqWLVzjd5m3Fi8ug627fQJLgb
	k9TbgngnIkczmqAK5uKQgOxcwVLzK60C0gtpWOAOsf/fLW2JZbY92
X-Received: by 2002:a05:6a00:2d9a:b0:835:405a:7e68 with SMTP id d2e1a72fcca58-83a5d190581mr10677382b3a.32.1778213418952;
        Thu, 07 May 2026 21:10:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d9a:b0:835:405a:7e68 with SMTP id d2e1a72fcca58-83a5d190581mr10677323b3a.32.1778213418448;
        Thu, 07 May 2026 21:10:18 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d38ab5sm12869458b3a.26.2026.05.07.21.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 21:10:17 -0700 (PDT)
Message-ID: <b92a2cbb-fe8d-4378-aa02-d91e2e4dfff4@oss.qualcomm.com>
Date: Fri, 8 May 2026 09:40:10 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] clk: qcom: camcc-x1p42100: Add support for camera
 clock controller
To: Bryan O'Donoghue <bod@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
 <20260507-purwa-videocc-camcc-v5-5-fc3af4130282@oss.qualcomm.com>
 <26191034-ad27-4559-a845-14841c075a4c@kernel.org>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <26191034-ad27-4559-a845-14841c075a4c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TJB1jVla c=1 sm=1 tr=0 ts=69fd622b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5lBSLrXIlTbZt68WmtgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDAzNyBTYWx0ZWRfX8Hod63wrBPGb
 4qgG01XFkycCQfijDaNMk0kyQ39/hXwrj2/1WNkgKhNm7pkKCElakeL7iw0gHcByJ5CCPNDBDv4
 iBRGw+SbL7v7o6GE5zqixab98iW1h100wllFR/IG737KfvfjP1kEVLa0x1VC25XPwJGRgPqa1FG
 j61gTQ5PJyg9CTkW/r6hKoYZbrjG5epVbiFfATz5uBpoLDTuoVZ2X4DYCpLzMnqzMwmK5bk9ZFb
 SNCN5aD1vGL21Tc6R3VLxjbTiIcoqa0ABeG7eTz4MIv3t35EGvo6B1hpHPAuI7g/FrkhL6yFrBk
 m8NnP2i9L9YRz/C44G7Oob43IfHqQ4mQOdnstBH0XpTCwApZJzCVqDl795vkuECKHD4S9452pSv
 sDTKj5WgzYYxZr4g2tiXowZG136PTEf22wq0/sOD/45x2QzvhPqGx8B0UDX7IAylzv51bKJwIez
 rNdz5xaWma2q5RGHMww==
X-Proofpoint-GUID: xxE0Y-T1vE0hDfkYD9rzwrkTEOvxvOs9
X-Proofpoint-ORIG-GUID: xxE0Y-T1vE0hDfkYD9rzwrkTEOvxvOs9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080037



On 5/7/2026 1:45 PM, Bryan O'Donoghue wrote:
> On 07/05/2026 06:38, Jagadeesh Kona wrote:
>> +static const struct alpha_pll_config cam_cc_pll1_config = {
>> +    .l = 0x25,
>> +    .alpha = 0xeaaa,
>> +    .config_ctl_val = 0x20485699,
>> +    .config_ctl_hi_val = 0x00182261,
>> +    .config_ctl_hi1_val = 0x82aa299c,
>> +    .test_ctl_val = 0x00000000,
>> +    .test_ctl_hi_val = 0x00000003,
>> +    .test_ctl_hi1_val = 0x00009000,
>> +    .test_ctl_hi2_val = 0x00000034,
>> +    .user_ctl_val = 0x00000400,
>> +    .user_ctl_hi_val = 0x00000005,
>> +};
> 
> Since its a script that generates most of this code, can't you teach it to enumerate these magic numbers with defines and bit-fields ?
> 
> I'm not sure if I got an answer to that question on the last iteration of this patch but, asking again now.
> 

As Konrad mentioned in the earlier thread [1], most of the values above are static configuration parameters recommended
by the PLL hardware team to ensure correct PLL operation. These values are programmed as is during initialization and
are not modified or referenced by software later. Since these settings/fields are unused later in SW, they are defined
as static values.

For the limited set of PLL registers that software interacts with, the relevant bit definitions are already defined
in clk-alpha-pll.c. 

[1]: https://lore.kernel.org/all/009ecdbb-2297-44eb-862d-233e3290691c@oss.qualcomm.com/#t 

Thanks,
Jagadeesh 

