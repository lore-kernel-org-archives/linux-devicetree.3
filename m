Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC7E3A7F66
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 09:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788428756; cv=none; b=MHo9rLGVMxnFiixyJFr8k9TAaB7r+Shf5Z0Eq9fyov/vKSFy53duKZVuDLnKu1iLD1+gv73R/lX0K+k1+bXClBo9juq3PTpQRNhsI1eOBWPsB9OQ3j9JCspAzngZKNqpb3DZ8Pqhc8e8Ct6JjVA24H20VdPES7nuMN0aqASowBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788428756; c=relaxed/simple;
	bh=bjN3M30Ep3WgmUgjhhDmuncCbH8FYD+tR8QRFkjuQn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HZZOUsgVpJr6AcQTudcigh5oKoWLKGeFDvi/kRC/VQlcT5KjytInvwSLpL40KRra4Xcd+yK9j5S+8vABKumArsPkbxzYmfjrkkTSP/nMmDOqOak63u7XjtxMBB3rsZplsTHcXYTdnJWPkfX/2bc2NIXT7Om9rvgXGMVOb+dTFos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i8sAFUfX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=enIZJ3q1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i8sAFUfX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="enIZJ3q1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683920Ys3682303
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 09:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U0lmoue5eucI+rt1G7AZu5sBjUo04Z78KhxZq2assY8=; b=i8sAFUfXSEkYKyzy
	kZ1mu/S8BnuJRg7AS65UyLAyAnzE11ToHM7aYAZ4CD2AtI7SC6mabv7lv2++B8WD
	cnyus6NbgNNxojnAnLhhB2WOIwFzG9pqk/mgoSlyfr0mBrOcCH7LMQXTB5+MDLmB
	HsCq41xmadauTBv2uNw1pD3CylGRGU69+UF6Gb90Pp+JV+XOzsPcRSkk8Y8Ws+M9
	nECHQzUDS+vaL4A2Gm61YXuweYgSd3FYcji714yBl1jJ54OQE9Tfe5yskM5uexU9
	UqsbdrO+ZuS3F4RwHowRwZsB7P2nAodkcuWfdbdcsnzQ98HEfyj/ArwCC09Ak/h/
	YoJXPA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m0e9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 09:45:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so3688291a91.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 02:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788428754; x=1789033554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U0lmoue5eucI+rt1G7AZu5sBjUo04Z78KhxZq2assY8=;
        b=enIZJ3q1NrWddZNZOg24tlH2SdocM4io6YaTiNUSLjdq3bNl8mX9hPbov0W0Lq3Hkv
         pAfGplatZQ0Lt3IM+VlCie9DazFLzO0E57wDBgeex5ahQrQToH+Fbidw8QbFd9SeqQR/
         R9nG0LVP2uiu3a8EOJJq0eRu5W7swQ7IA8xG+Ki7uQe5kVN7Zldcycjl1LYiHS2/qlIx
         bLxOIvr2/ODwiWAl34Hkq/546JwoSt3Qt4fvfe4MoNTbk4MPv14rR8UWPkFvRElSbOY3
         tJbbmH20u1rYwAvjlujgsMm6oP2v+yXqWTPj+2+JvfqVKgo1jPWpHkVE4OWRHfntmXMk
         uWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788428754; x=1789033554;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U0lmoue5eucI+rt1G7AZu5sBjUo04Z78KhxZq2assY8=;
        b=qly5fzoKk7czukSVS+K7Xmid2+smaogHXg2u6eINfUzPHsEg/RQaP5SYrnMbwxfXce
         BD22wGOUrlyYG6piH7Qbfq+WAYZqFpUjun6awOBz2K54pIqKvocYbQXNRc9RyIiJwm83
         Lap2ur5wVypmZL+58sbeQpQQEe10eFUiMnDnLrBiYnloHtZeAExblLXcYg7baWgiX5iy
         7U4YbiL21vFNrpzPCQFvzHSNL/K6GuWBxU4CAlXnCjBDQbETCPopReybQxZiU0JTgdNN
         nTXpFushZywKUL2DtPnrCugnacqT0ekZ6wHTt9h8y20jr/3kZ5JtvTvsGe5sijyBDkrE
         WG+g==
X-Forwarded-Encrypted: i=1; AKwUvBw2GaAzOCm1/jgx7/iJJKUWRNvnBnXWiw7GDiz1g76Y7s1ok6r1cQXOD9dmOD7wA/imy9EC5ky2q7vX@vger.kernel.org
X-Gm-Message-State: AFuF++mxIRpFmWNIZTWPNAEiuF0v07RZHLgpqyzQjjVjkaBkHHZWc3D1
	ZQfoxadFgoamiGqL7qtnxDjO/qPU8w8/KiDPoYObrOb8YdfJ0qFdYDUIablyA+qURjboUV3QzRo
	07IJWoA8a6o1qs1IQ6IdgaB81yxOh0Xtk3qOrE8Z05CzyIl9F9/NoPuDvbEELMr/4
X-Gm-Gg: AYBFou0ax+WDJWPHuXAact7qnsZfCZ3XZ2efjqcfdBYBNwpllasNe7WYdhvhug0G00Z
	Dc/YVx/A2AK4n9+Ynz79IOLLo50nSNpNy23LBfgJUc4KqDSjhYFWHOUL5HBtVHZQkLqSlda6/HB
	LNf4g1sjNK0HKa3V1WvoFFhRPiH2u+emUFqjHS70GiTdv9XBcmzZcrNIO85jq4kuqfOCT5rvGH1
	p0bsGn72lIbYnj8R33/WsE38ctlDpO0uALIrgw72hOp1V6E25aZMwii3zYrzw1vhO1mJFWkn9la
	Khu16V/2Xm8MH4H7HOj0zK/yRPQz6ryg4D3uK8XHMFsTRpX49ZjoYGTyYCbh2hUz5UPEWu4uuVu
	hHQKi4hpS0rIrlBLjJA==
X-Received: by 2002:a17:90a:c107:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39aedf7c6bbmr18256941a91.1.1788428753669;
        Thu, 03 Sep 2026 02:45:53 -0700 (PDT)
X-Received: by 2002:a17:90a:c107:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39aedf7c6bbmr18256854a91.1.1788428753180;
        Thu, 03 Sep 2026 02:45:53 -0700 (PDT)
Received: from [10.64.71.54] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39451sm4337270a91.7.2026.09.03.02.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:45:52 -0700 (PDT)
Message-ID: <8664726d-80b1-42e5-830c-a5490f8e531d@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 17:45:44 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 09/15] arm_mpam: Fix MSC MMIO window size to use
 resource_size() instead of end - start
To: Andre Przywara <andre.przywara@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei
 <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
 <20260811-mpam-resctrl-dt-knp-support-v1-9-ea6397bead59@oss.qualcomm.com>
 <bd59c8b4-6b29-494d-b540-8feed38d0955@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <bd59c8b4-6b29-494d-b540-8feed38d0955@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: t_CmyfF2rWUNkM53y8jXYQ1OZGlE0FwS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MyBTYWx0ZWRfX7B8iM9FItajA
 +9ukA38nGeMaY2DmX0+dbnzk7GUVG2UZzvG2cQzP9mW2HWHOeuuOsjDO3w60/GTwuyzWA0VFa71
 bg4NrtCwL04PShgzpgC9i4HyT4GdCSXo6/ljYSGi3d8eY+XGNwlEgW0VoG6LecvCfzZX9Rh47Xm
 W9R5Q1lnpT8U1/CWx5+Iea3g7gxcjcYazYif7Z7pTJjPJZL34U0Mje1sngLEt22SkCsKmOmVCI9
 nmoCoBwBpFOWna2vX+qcLKxrtdYLS4F7AgcqkAlFjsRPPRrLBCG4Et0oZ/h+yYdQEHqmdmDGGy+
 fl9E5Q7+dc5HqyFVF1rwot9K42slPKEOTNoQCm/ltHB01G9sqvW3wQcV2CIKaVzRQxfmtf96/x+
 pIXyO/NG4juDdlNqUT/l1LuKtNDnP5/lLtCRQGiBLQcndpoGUhZIFhj9E4m+j+vFdaLKi/HOyRv
 49HLzVgmXUUF4iTg2LA==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a9941d2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=YPZJ3_3Ys_XZ9m81jMgA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MyBTYWx0ZWRfX8yBs43uluGwu
 Q6j79dg3ELts8SHAiNmSDIrIn4obz0OzKnD9LGve0XebXRWgqy5h9R7F3ZcbJbVKam2T4Tp2OC+
 pBZ6vVEKrYooHPuoJFNNJupepkn1Q9g=
X-Proofpoint-ORIG-GUID: t_CmyfF2rWUNkM53y8jXYQ1OZGlE0FwS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030083



On 9/2/2026 9:16 PM, Andre Przywara wrote:
> Hi,
> 
> On 8/11/26 15:30, Yin Li wrote:
>> struct resource uses an inclusive end address, so the correct size is
>> end - start + 1. The previous calculation of end - start was off by one,
>> resulting in a mapped window one byte smaller than the actual resource.
>> Use resource_size() which correctly computes end - start + 1.
> 
> Yes, thanks for catching this and making a patch. We found this 
> independently during other MPAM work, but no one got around to make a 
> patch ;-)
> 
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> 
> So this patch is independent from and non-conflicting with the DT work, 
> so either Ben or James pick this one directly, or you put those kind of 
> fixes first in the series, when you repost.
> 

Hi Andre,

Thanks for the review and the Reviewed-by tag.

Agreed — like the RIS range-check fix, this one is independent of the DT
work, so I'll move it to the front of the series in the next repost.

> Cheers,
> Andre
> 
>> ---
>>   drivers/resctrl/mpam_devices.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ 
>> mpam_devices.c
>> index 1e082fb60e30..5d1854d97371 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -2296,7 +2296,7 @@ static struct mpam_msc 
>> *do_mpam_msc_drv_probe(struct platform_device *pdev)
>>               dev_err_once(dev, "Failed to map MSC base address\n");
>>               return ERR_CAST(io);
>>           }
>> -        msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
>> +        msc->mapped_hwpage_sz = resource_size(msc_res);
>>           msc->mapped_hwpage = io;
>>       } else {
>>           return ERR_PTR(-EINVAL);
>>
> 

-- 
Thx and BRs,
Yin

