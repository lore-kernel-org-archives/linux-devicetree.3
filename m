Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C1A277007
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784008546; cv=none; b=ezZ0vYcHXvFdE2N4L6y4CXMC5x9IPx4C4Qa3/WhoOLKQ15LpeGq844f3ZwOpCi0vOKbHHTZ3+8eYEvbUw0RBtLYgoUelID5yM7elOiVJKd8Y6dYZIwFH9DpVgCWFwuhEvakuk2oWbAXiGVqwdFNTekxYzHervmJ2Q6OKJaFnC7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784008546; c=relaxed/simple;
	bh=wUWUcD4R68Lr0rxkifUjlkVJWZqTBScP772FzIxJa6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OFtfCBwtp591Q79Ju3oTs1fOUZanQmn3Uz153c+J6JmD6hM82frJ5KOu7kUw7L5y171aMSD+4WVGjRvIAgg/+PeaEZrUI/g1QaRgss4hjkPXPuMj1Hz9R/GTKVCF6ZXss1ef0W9hzQEHp1ExWheD3wW7X02RCI7uPua3y5Ul59E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fd3izyV3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YsQ13uq/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fd3izyV3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YsQ13uq/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38IAC3441399
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zgjH+BGbOMEiI1aAjJ2gxRsDYPA25+0SJdQxcLp1ziY=; b=fd3izyV3MWaQQBhT
	Lcu8o+kbIAkT147yLm9nRqx2viGv6ioUc5RR7J7LeOn7zBBsZwixIGapcabi1We5
	5jwG4dKz4BO+KJcPLJcjh+BnsAkatAca3IT8DWH3yS5XG0JdHJN5z7gzdGrh6BWS
	ZWFC7A6zXwA9XWzMI5tFjtzDmkfCRgNk+uHx2S4cyc33olcGcstuLXc4aKitfqMh
	B9ZKB6qXuIiizbuMFo2k0rE/Q1przwTwNMo9BjeoVITkKO4Wj9dtC9Jiy5e7Tboz
	xtkoggd3OvMNZC4ad43srFcUItRb3OMNoAASbE89Xj/hSSIwGr/w9tLw76IMboYR
	G4ZsMg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr48qmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:55:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3811ae55313so632754a91.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 22:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784008543; x=1784613343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zgjH+BGbOMEiI1aAjJ2gxRsDYPA25+0SJdQxcLp1ziY=;
        b=YsQ13uq/fORK2GITYbavS8riNY9Hps9GN1rbOiFUNj4nJPF5xX6y3h6tlHfBlDs/GR
         f4YpL79HQH8A2upydNWO2T0kMYxVhuvNwDgt+FyWdxwj6YqvuFzjwB6FpyL+EZxCSWgK
         9/vlrSgOmcTgQqSIZmpoBItM79uQoHZSyXoeeWv52YMsWxH+qNJco8C5/q5ZfkSkZGW0
         jWr33+9glMk/zVayAZADsWY3s+FnD3t5pwS+Pmjg1w2D4BdwY1r632ZNvLqK+i/yx1xC
         yo0+ZRseyBjX4OSto2AhGQ/96CzwNgFb+leiUCNqVlaaYYT03ag8vqBnRU8Bn7FXhyu4
         9q3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784008543; x=1784613343;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgjH+BGbOMEiI1aAjJ2gxRsDYPA25+0SJdQxcLp1ziY=;
        b=Ke2/4AKXuGeFUZq+jtjyN3rZn83RepHcAa/bRN+KwAph8rYNl+LqVCTHtHax1pADl7
         jMEerGU4NxTFSo+8QXg8FFfwLK8rfqDW+2C/IijGN19jaarjhOb3AwT2V7j+TIQXcI09
         GmDH3Hx68kzUbrcMK0FyN1Ur5Bf9Rfbi7Bvh4eDdbyaoHOJjvcXkitxY1dJAG8YWiHgL
         /IT83GH2cZ0kW0/a4LgNZdMOYFYGEaUB8Lq7JtI1kOvR53n3kQHc+gL0jss8cSXqZQto
         haEezq676L8OWX4q1mYJMb+4iF2SQ6xji5iFwj8M/rKnc1N2qvr0LaV2wyarmzoDkmbo
         KVAw==
X-Forwarded-Encrypted: i=1; AHgh+RqwJkOAbmJ6vXoaxK6Sk0K42/oLoYn/GKWVq7RVLDeB4JG1rsgMOwAEMaPWwlsVE359ptluBRgMYLdS@vger.kernel.org
X-Gm-Message-State: AOJu0YzoIxme94ZJ68oaHui2zPTetqXB0eR/R9qLpPrJP4vBibXmYuni
	1qyGMtrFV4TRJaupxlAT8Gsc8I5qhd1nM1lOQVMncB/aD/CDT1gcMzagfSihDDPJXdac5uGsjfj
	VUOxjrURVJvh0pRDijGrPO1F4DoQRZ65XGtW0Oy+lxcZP9NqLcfLy5TxXQbsYVVcf
X-Gm-Gg: AfdE7clUCQfrlWNvmGh1T8UNOtSp2rSA7dYiWDjoCPBRthNZVMEDA+2cCusY/80W8P7
	0vdrspnylBPnwu53wOE+NDEBlPrT2Cbh3C3DqAr/aySgb5moAvDvFHHegHA5wkaKMOGhVBswYzx
	SFIyox4OwCeZUgSj5U9r1n7W4E8VmGyXeS0/GMDp4NDWabSj1bcV69vDut6X+/2n6nytSXQUVTC
	hV+LyJ80MXbHAUKXE7diBHr69Ke9QFO4wwJrKRM0rrJVLVOw22klHja4tZjzXdH/MpdTNUnxwXf
	YYcwd479ZrImlCICa/762CuO6joAjDWhfXYtNeX5hsOTBZWsr7V2r1+8uBmYpVBLclZWgV8gFo5
	Wr2UaOfo4Ky8Exk9UoIr925T/2pjFY6gfdpaB
X-Received: by 2002:a17:90b:1cc5:b0:380:925:aa25 with SMTP id 98e67ed59e1d1-38dc782c682mr11086728a91.5.1784008542942;
        Mon, 13 Jul 2026 22:55:42 -0700 (PDT)
X-Received: by 2002:a17:90b:1cc5:b0:380:925:aa25 with SMTP id 98e67ed59e1d1-38dc782c682mr11086694a91.5.1784008542512;
        Mon, 13 Jul 2026 22:55:42 -0700 (PDT)
Received: from [10.233.16.34] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38d11b82d32sm3345725a91.0.2026.07.13.22.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 22:55:42 -0700 (PDT)
Message-ID: <943eac10-45b8-4301-b8af-8ce8d9144372@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 10:44:57 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add CCI and CAMSS support for Kaanapali
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260508-knp-camera-v1-0-a18e289163fd@oss.qualcomm.com>
 <178352261637.2235436.16367939885864866010.b4-ty@kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <178352261637.2235436.16367939885864866010.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YUpyiANAlaOFE5xoaayiAF88d0Fxrp6N
X-Proofpoint-ORIG-GUID: YUpyiANAlaOFE5xoaayiAF88d0Fxrp6N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA1OSBTYWx0ZWRfX0YCjmaRUD8LX
 2j6K4VjTSKCAtZgvMhaehmT78+e+vzLL+hGcYQzttmJPjcOTCs/5oH5evQqVscA2KYiQQhr0O8b
 wL1EoLctcxdos7AoOaGsrxX7BdEWKb8CYsCRyqwuxOdKrlEfR05YSBopiYBPpUwFAAAnd+hRgmX
 84NdzicBDm4nBCshv+XH5zCD75weN9fcb+YOO19kt7k9FeSVuPwFirAEbjqGKrHAdqTDePXHq7Y
 mdB7B+TduFWfRDetJ54jgRAeKuEBerWfniHSi6Vkushib3eRFXmEJ6hqoGtVJ8L0ARzjHofpVg9
 TVh735lxWLhHtD4ODf4K9kRGfdhvDKVOpvkd4btj0xcCVYFE8bCzNzmZcn1gc9XxA4U1bK61xpK
 Sx5GZbNAeJIkQ9MFTRRFm7tHq6HoS+vmb/ytAPPGo4GthLSPNxHIzfz1z5G+obzDhMDyqmNY8+x
 Qbkbcq55tUjPTEJMp4Q==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a55cf5f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=QiXmUFQ1vzvQmtXJo8UA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA1OSBTYWx0ZWRfX1o7UWqcNQy7m
 bvuP2koIgHSf6kBTwgld7NZ2z3mh5ubzG+sZ1qGg15isEE6GEQVh+A332IgGziCQ6//oXRMGqU2
 NgQiDBhUdyDfHOaqNjGY2a8Mpbc4XlM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140059

On 7/8/2026 10:56 PM, Bjorn Andersson wrote:
> 
> On Fri, 08 May 2026 01:36:44 -0700, Hangxiang Ma wrote:
>> This series adds CCI and CAMSS support for Qualcomm Kaanapali SoC.
>>
>> This series has been tested using the following commands with a downstream
>> driver for S5KJN5 sensor.
>> - media-ctl --reset
>> - media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
>> - media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
>> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
>> - media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
>> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>> - yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/3] arm64: dts: qcom: kaanapali: Add camss node
>        commit: 7cc8ca0387f572a4d69941fe380e7a262342491d
> [2/3] arm64: dts: qcom: kaanapali: Add CCI definitions
>        commit: c25b80614c31a30b1b0f44fc5ae260aff90fa4aa
> [3/3] arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl
>        commit: b6f8ecb80c1f894bcd0c612bf0ed4c5fee52d287
> 
> Best regards,

Sorry Bjorn, the camss binding + driver series wasn't merged as 
expected, which would cause dt-binding checker failure. Could you please 
revert this series? Bryan expect us to rebase on his new re-arch camss 
and the binding/dtsi may be changed accordingly. Thanks a lot.

Best regards,
Hangxiang
