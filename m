Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DA9282F34
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 05:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777873321; cv=none; b=a+yID6ngeXgLDPnOHAmTVX+wr4V286SgFUbtJlmudTjx9sknrCKhK2N8IMgY8x3ZA2WunDSsQ4Ahleo/zTAcePN4g7x0Cm82GAVB4Gb1iDxHz74TPXM6XPHEUYSAV6HgpmdM4vlONzyr2x0ivGaotqwTR3qc2NKegY6WqDXsHGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777873321; c=relaxed/simple;
	bh=ayZN1CjPuHoiSqFqdoT3yNtgcowtRvwd+7Cuzfa/Lrk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AYxMYxKRvwjMTObYQX6JQ4hUzwk1zs2W0x7mIqIYiyMDaO6ZOyhmdN7bF2h2kDytrcvOUpZcVxMMBcfDDE1R960D5vyb8muzz9CDTVRjaiAyzRgmEFDeFGi2K+N94JmyPdpytd8AcSORWISRvcrfuwuc9p6Hva6UEZZiN9J06CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g6YynaN5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jCwwQf28; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g6YynaN5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jCwwQf28"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6443nARq178657
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 05:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ciq+urNIWZLv3PTQAuHFezEAYLVh6k3QEkWU4p9VXIA=; b=g6YynaN5sdlxxvsX
	I/IcTew8WJE6AGsJBYF0YcNU3xtpZeJS0NkKN3ZwGjnZ4llYmiO4xE8nHC4HMEdC
	zPLkmDL++s6M3XXTyMPRXeLv35SFe50eGQD3zizWDU2cKEYOTivUFJT1Ygj+n+rO
	nRYbNONWuwduSmO1Odlnn0SNBEySE2ZWxcsLeKMZGsmEEW1m0SbvJk94JWB2A1RF
	WV/VacXkyiGbozYp7xmaGI55TNHl1PAcn/cE5GcymUqeL7rfueeEHDTqNuROCUQ3
	3JIP1ZIrMqy9/ItGfZ0C8molpvuS39jeW2KqLSQO3NJoQB3CFyV/XtgGKC9XKVwV
	6CFDDA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw87scgq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 05:41:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3650a4eb60dso2248073a91.1
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 22:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777873318; x=1778478118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ciq+urNIWZLv3PTQAuHFezEAYLVh6k3QEkWU4p9VXIA=;
        b=jCwwQf28Rr0+2qisJo7M1y8FwnBrUOd8OIt7PPL4KCn/E5/a4CgCCLO5TN4y5DVc0K
         4pb5ms9QS55/r8lyXzoNfGqD62Lkm59iBHXvF85CEa2G2dTl/0RplrgAEjbmJRXnT05b
         +gwJc+LA2teNJV6UqF9L/jjYI54AP39+GwY6vdzggHVfNdyho0Ey0o+x1cPuou9TWxeR
         jD5s1v/ddp499D4hjbtpi5IUf5ZaWddDUiVMum0C72xRyqCXgv1QhScxt2+2+sHYBahm
         enj5sdQk53TsvnMsfPo5LOROOgo1iwraujRjK93zGgrykZH5whAHiotRTO39wT1jGb60
         cPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777873318; x=1778478118;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ciq+urNIWZLv3PTQAuHFezEAYLVh6k3QEkWU4p9VXIA=;
        b=imCDGACqSBAHklodoocRBq9Bm9xi1aELtW1L8svjXGuYTuOkXuWIgSN9ZBMjiuSYH7
         YHz+RhEfDD2YZhFaYPk6jCixulx4s7l2uA0/qYt9xOnnAOAb4frTpRVksfyJ632JMAOj
         t04lPoEgfIJilXchVcbDp6kohK9SYbySv4KhlfkDqkCq5w6/Ef0XCOB3kQJsCPvRSwqp
         QM3EtLpRlyxHeXnjNoULi/cD+exKfkdNdK0gE5+PDmT9RZ1cR4EyeDsv8vXqSAOLppOQ
         6jpUzBhwU+TltYAixxtM7JwzFcAH8HTUnUs6XROzDM9G/HeYwbgWL6W8jRkgdOTV8QeG
         oc5w==
X-Forwarded-Encrypted: i=1; AFNElJ/cttcg0ZtxUilKSLCyiL079HMXsq4MVg1BiWaxzGDtYlQ2ofqhdT0fiOnpFqaREu4yp9sNeAkd5PA8@vger.kernel.org
X-Gm-Message-State: AOJu0YybaRnOQAI8gcMfIAaKrsv8R/z/R+veDycLvBgE5UBPsqAuo3pp
	dxpK5So7z/gYT1nxL23jdnra0j+y98iJneQSBU4ZYSsh/2yVKw1dWMyr+2qOdMvZWzppRc85uJh
	mCUY53IgG9D8WqTTVwSlMwD8CSAjdx0t5HefSETlJccbmY3bx3+x9d5gx8uznJE5R
X-Gm-Gg: AeBDiev7ToBNAEUt33DygtCYpHO9nemh3kPqXOwBjcVmdK+YSp2+NRqNEpl+OB798pd
	4wj9wJVY9+CzEMC9QYX1Kp2Tylg0tKXUItP0aWdVfpmHpeiR0cSmAIlRwIICUkaRIyHKrCYqLVt
	TEtgau83Jq0196A1cdAgr8WD8AuFsePOId7qWG1KGkD4i7AZ8Zz9gInZxLdayjimB55T1j5cRl1
	y6YezYJUgxJ4UJw8SDuQK02ZMoBUDUQnNxXjmLhSeefSiJGjxh5JW85HZ9nua7BpgGKJuHgUoPV
	V90ncJoSX59dBvYeJLZ6LJEO8sJRXokuDaiUItglZviE5zTHKqV7mDk5T9VFmGDo66Ey9bYJH5v
	86JJgaQZOLJUXK2XaoYwTokIChIU6VpsgUNxbl+yGzcJE0jIHsgFMEVGb
X-Received: by 2002:a17:90b:4b11:b0:364:a010:c6ed with SMTP id 98e67ed59e1d1-3650cd4b29dmr8355561a91.1.1777873318454;
        Sun, 03 May 2026 22:41:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4b11:b0:364:a010:c6ed with SMTP id 98e67ed59e1d1-3650cd4b29dmr8355538a91.1.1777873317933;
        Sun, 03 May 2026 22:41:57 -0700 (PDT)
Received: from [10.218.21.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bdf2aa41sm17083590a91.4.2026.05.03.22.41.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 22:41:57 -0700 (PDT)
Message-ID: <f023e969-81ce-4d61-9877-3bdb3df13079@oss.qualcomm.com>
Date: Mon, 4 May 2026 11:11:38 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Haritha S K <haritha.k@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: talos: Add passive polling-delay to
 gpu-thermal zone
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        gaurav.kohli@oss.qualcomm.com
References: <20260422-qcs615_gpu_cooling-v1-1-d5a984ac29e3@oss.qualcomm.com>
 <b86f2bef-206d-4399-94cd-70f7a6859605@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b86f2bef-206d-4399-94cd-70f7a6859605@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: M_JMt7Fo8zoNwUpLWyvfjZW7RxELCgj2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA1OSBTYWx0ZWRfX+Fq6sDxly07L
 663RW5Olnky7LcZsv3HV7oFvA0Ex6GQJ5WOaUYZgodYMPJOm3QLnLOhpp/cqRhzhD/k3KM44bY9
 xyzJ6x01pMbUcoGFNLQvUkQUm7ah8TqwpsuWzHdkxIhGmx0saNKrMzD67dvH/ATUskVSt455/DZ
 QPYo1oCiCkaquDNTLx40XekX5oxsCtovuu9G/NPy8kP6XZmx3eQwl1ANRqYsbasZ32rnuQYIF+8
 j8/qMcPk8aJ7V/4wGcCTrwk/pO5yJQP35TPaNyoGYbA2/7gldpUv50Br/+lJ6GcsibYJFsGQb7A
 3ndC3DX/QQUL5NR45Ddc791ChTjxGFz1xErlZYIfJSTk7jeHMMfbOEULAyyNXQGhdxEehxzbDji
 IvGOJ2Wvaq6vtaS2wPNhiW7mE55kjIb8/WYmKwSUHgUx071FG5Gq8fpMNxQq69sX01qQc9dcHmh
 9wTKkJfKEKq5mYAHBBw==
X-Authority-Analysis: v=2.4 cv=O4IJeh9W c=1 sm=1 tr=0 ts=69f831a7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RoOK_9Oth8sowyBx_RMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: M_JMt7Fo8zoNwUpLWyvfjZW7RxELCgj2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040059



On 23-04-2026 17:03, Konrad Dybcio wrote:
> On 4/22/26 3:45 PM, Haritha S K via B4 Relay wrote:
>> From: Haritha S K <haritha.k@oss.qualcomm.com>
>>
>> Add a passive polling-delay to the gpu-thermal thermal zone on Talos
>> to ensure periodic temperature monitoring while in passive mode.
> 
> I feel like the "why" part is missing, i.e. the commit message should
> state why that's desired
> 
> Konrad

thanks Konrad for review, will send v2 for this.

