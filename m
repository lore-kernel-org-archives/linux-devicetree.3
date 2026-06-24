Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1175F2E8B9B
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 11:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302031; cv=none; b=k0Nh2i8HfoQ9PqUABETuyGgCTTbem3VhdlHd8oinPCdmXySS2d/O54YncNgevSkC+0Kb0bp1N5Lfi7cXtL24UGPEMG8EJkUx4FCIohaXwgPF5fuaYU5Q5UaKUpnMAOYS/QS+ltbtXoD/oZ1jn2KmhcFb/rAKQcz1RcH3mrCwlTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302031; c=relaxed/simple;
	bh=yYzLktbxNfz0/lgwBT2vqn65s1yAgTMWdgHtWZsO1Ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lBeNi2sNmctA4xqe8TrKRG/Sqjd6jDjys22ZHKaSiYCzHbYeSaaTiIHsh2qadmJSmxz+tqERU4XvYCR2huyyrzEHmgyl817EBfB1WALkNLpJOlBb9/jSbVlNGgJIuq640zTrAH5ICAOUUn667OE3stEpuQMCTu/+1wZXJpd/5WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EMfMaa86; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bkMARwit; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EMfMaa86";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bkMARwit"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANThX3069766
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 11:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i8d4ktxPW3oKg7/kzTAfWVLrcH14s0wP2cl364M7YAg=; b=EMfMaa86eUGm0sm7
	xGmh4kQDuhRlnwVj+4Pz9mKOLwUA6ByN03Dcf4Xlavdzbg/isW603U8WwNjkNNtM
	oehwxkc6LxrSxTWEPlSBhq3e5pZOrN7fedTAGV7dQnxMP38j97vuFIugfzUuST6A
	btbUyQrTFobE9c89JX2Lb/r+c6mcSRb7G1x4GXW+SltcBGzohgZDuKgAbYKETt6z
	fh72WQ8h5LRERZLPOk+gZUG2qPmOatEtxAI/eSBnBfLv1Moo5tLYQyUNBc8mJUwF
	i6s+b4OMGnB815tl9SAExRuSRlPJkvFjXajYS3q4i8Xv83iXIuDpUb1vSftOgcdf
	T0nSAQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d5g0cyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 11:53:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5198e72249dso1009651cf.0
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 04:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782302026; x=1782906826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i8d4ktxPW3oKg7/kzTAfWVLrcH14s0wP2cl364M7YAg=;
        b=bkMARwit8BUGimB2fXRO1M5HMOxENW+yKpjQoXfiF6e5SDNj88dwigaTC15uMpfYmZ
         bAC/uuZDxTon4BHTioftpT7VbOB7IrqIkv3RuLItI3mhs20/GkCh5bES22cod6J0bfWZ
         1Ha3Psrd4ufwcIiCdsDPHzEnnOS9RW56s1x9bh3iSMeW8PljJn3lr/ozFukQxn9OZtVw
         1bxvgr7knTUvZO8EGqFu6RCNoXbv04lQcH6ckoSBfqbZXqerU6xDCX55FR96rzQ0nRsV
         g4baOAf95RKx3y3uuCj/2IoaFIAcOGDpOrjkgTsw+LcgpGT8MrbwmYg4mY+XKDpuGvfz
         ObYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782302026; x=1782906826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8d4ktxPW3oKg7/kzTAfWVLrcH14s0wP2cl364M7YAg=;
        b=dKf0TRM1Ph4hGYSP9gRpx6fts0QfkQZMZFgB4N861YAhJFFQXgWNW4sZ1UuW+qhLtS
         7EJvxxZs0rPHKLnhM3uqN6fzJIlfMPtAia4kGOdQ/zg0291KW+0VHybq5ByCoAjl9Nr9
         zrmSEbRkNu8qLSPzMsPw3vWKgTTFKT7bvnBUtZBU5Ug7kMT1MrA4JM0vNJaKniqriv4w
         aBj5AutTl7oT42ZUHTucl924yGtVr5CdAJ0qu3eudfukmsiAMlArCsYZXCOTEUPGGfMF
         8zsk5Lkwk4+3YttsdaoYR3zbR9AKkWqdwPkEv2nZin93pdsJfN2zA+V2O5qivvXU6EWN
         CX5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/AHsBwoDTT5Q9j+80Uuy9qfSMtIp52cl69UT1IIItSyo1KvCak8kRt1vQ3pYx4DTKDhP4j7zO6oto1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz7tCnEgAmuov3VdavOF3o7R/rDYkOGEi2Qv/9xRLDFETsYcxE
	ysq/E3WnLqiLBKldhvQnUBJoLQClA61AaoPb2csJb3YQcoILwRigH4DFsDJG/m/MvSSRTHw9kBB
	BUrvvEPqa0/uInIDcuHGftdYGgoUNReYQddlKaPYtD0dA0+NChM4eyUcMQQ5jIUO3
X-Gm-Gg: AfdE7cmsVXc7BoIhqF7EjH0K7VZEobwOPIJH38mmDiEcET71YHS38VFh8vzShWQ+SEZ
	oK4L4hcjlHbRgZqG1TXzzn4oi5iz022AaccRwU21N+B5LjUBAVooqeLNYlt1dlB+anBhRiZHWgk
	t0NTwV1ECnIAHRvZZ/ejYP+kekfIXS/HbZXhDWjuG2zWn/nbX+VFJqYa7nwS9TeXvDs8TG9J+iL
	IzKZ1uIiptBtapFOAduC4OKrkUS7ei4MDVXOaIiHukrHr2bMWyR1P98xDmJMP/SJg3Se7oUd2DF
	QZt5rhm+dQ7AtVjiZp0VxJYi02rgwN5DwjN8+SyDt9WD7vbo59+j42emCURQUboJmcPAwgOw0L5
	HRPEYrTZTo06yVga8QLqPRLtQZfYnLiznx7Y=
X-Received: by 2002:a05:622a:609:b0:50b:2875:5782 with SMTP id d75a77b69052e-51a4f4e6e6amr84139521cf.6.1782302026118;
        Wed, 24 Jun 2026 04:53:46 -0700 (PDT)
X-Received: by 2002:a05:622a:609:b0:50b:2875:5782 with SMTP id d75a77b69052e-51a4f4e6e6amr84139331cf.6.1782302025717;
        Wed, 24 Jun 2026 04:53:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bd7719sm1003218a12.30.2026.06.24.04.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 04:53:44 -0700 (PDT)
Message-ID: <12bc9f3d-bfea-4ff8-8eb6-d2203bb46b89@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 13:53:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: qcom,ids: Add SoC ID for Snapdragon SDA
 850
To: Krzysztof Kozlowski <krzk@kernel.org>, David Heidelberg <david@ixit.cz>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623-sda850-v1-1-ddd8e62c85d8@ixit.cz>
 <6ddd0652-d18e-4e23-a230-5f5c8a9756f8@kernel.org>
 <16d91c51-9f1b-48ff-90db-7dd7ef056bc2@ixit.cz>
 <80049d2e-ddc9-44e9-b231-876adcd79823@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <80049d2e-ddc9-44e9-b231-876adcd79823@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LdMMLDfi c=1 sm=1 tr=0 ts=6a3bc54a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=JxAcqFIsxX1jjD7gn_EA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: gHOftaC43XY3RQITmRx9USs37U3DVZg9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5OCBTYWx0ZWRfX313QbBraZzVl
 ShLNA9TfbquwYhg+h4A5JhUOjia1sq9cHVZeWHhtd7ZaLk142yYjIZZhEou+zsONRaAVOt+1i+M
 m9knXZX8Gasn14ffI/HYRXFTWPVVg39Z47vAFbnAy0Nmjk+9w8M8QYGECVukzJIiuPtS8d2dDoC
 XSCGNmFYjphkUjwXl6t4sJbVVInyFwrhHNYh99C/Ulk682BAq4mLL69KZPPZQ63opb6+3JWUY4C
 4qL5TjH/hOuyvbuXowGoENC11/vztJ02n/0vQMJAgmKsF6RD29BAlB2zwQp5Y3Jf+wEL1spAfYx
 ZitVNSYL/VttfT+1yNL+jYduOFSqsvngRet+ejgXcoL67ko9pk0Vx+JNhmguZPPjbp4d95MxjzS
 aDznsj8WnPGVz9c9JZ+SXd6kRlO57Q==
X-Proofpoint-GUID: gHOftaC43XY3RQITmRx9USs37U3DVZg9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5OCBTYWx0ZWRfXxUklUTz3LScH
 21+q16uSZw0zNfH1cseZx/rzj5HsMRjOm8j7y6VwbdPtloHrOm7jdl7wDSHerFUuP72qh6lXOmF
 5irvkGOfjSLHrSF9KCAz2ij2XDc41Mw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240098

On 6/24/26 1:50 PM, Krzysztof Kozlowski wrote:
> On 24/06/2026 13:37, David Heidelberg wrote:
>> best I do is close-to-mainline tree,
>>
>> https://github.com/commaai/vamOS/tree/master/kernel/dts
> 
> 
> That's not upstream, so we do not need this patch upstream... Just keep
> it out of tree.

As I mentioned, the proposed ID has upstream users e.g.
sdm850-lenovo-yoga-c630.dts

Konrad
