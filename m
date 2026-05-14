Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9FA39A070
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 09:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778750626; cv=none; b=W/z0BuBNLyaTYDnamXSkJdGkHMPAE3QnxL8cko49OXiRZxKSZLaK0zol19+iFnOqWN2yX2BUw3+DCWF2SGWY8Vq1NNE3rekqL7q3Tb3cNN6oa8NPqax6TIP5FSlifV1gvj+20nv3NgaVkR30PQCwXWyTWf+WmxS7LXOIK5nGf/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778750626; c=relaxed/simple;
	bh=D+0UR+tuvuV+iGfThn6DdO0atxo4c51hBLb9B9cq4+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rY/lh69L5Ds4DNMFq7w5VOmcumFMe6nF7ZeuGMRqXncqzriXc1ygBOANDGLOSNhnt4IFc5cn+lLGmvISJCgrxj2o3dTqOK4do+IZ3atBPxfiNrzJfgsPoLmr+zuQrYIzD8EWU3GZginPEvIZS2tpFrla8EwJG2crSeNdfBo6pZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dIDd61Vs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dz4MRTcm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dIDd61Vs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dz4MRTcm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E93xbN1095250
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 09:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7mfb7Vpn1k0Bgb4UZHW0W0XQiV5frm6lZKL/dZelLY=; b=dIDd61VsmW15KdXy
	ruWqI5i4785aTYCsObwOPIZnr4VeMUPMgh2qD+fOvSuNKhW22+fyI93n1xS8oT3j
	hljoajyDUhFIJ69GIjsBa7GvYGgiEgxTgZh5fJRZWDzEipLnkclLtR9iUimhIFlH
	qn5HTK56s3S2jyWl4ystX8fYrSeUgeyJirpM1+iIHOhr+nstiFIx+vo4YJqDnrPS
	/wVKDgz6Q06Mq6JSCyXmrW4TXErseNTpNbkMBivkh8rXXVj1XdhR28NyUN7gJEiy
	sZPMP4HTlfd4ROl85FjJ4up8Egao757BPo0Gq4fYz1+ag+wMQsuWQ8+NDIA3dwkc
	/kWPmw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e563hh7u2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 09:23:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-90e0eae822dso53570485a.2
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 02:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778750623; x=1779355423; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B7mfb7Vpn1k0Bgb4UZHW0W0XQiV5frm6lZKL/dZelLY=;
        b=dz4MRTcmyWq6urB0W3bJ6TomXomCdp7EB7Gninsk48Q7ZuseTnlCqUt1NUuCWAIJSr
         XmjSg3e/gbiAzIiABdOF9a/TQZpOcLPut+GTK9lqIZHk6E9f77JdozgBXUSxO9JFx2WI
         wDHTdtxOuDGo3nzdIyJ6NCpNWMA2SLxJtkOrGNpuEKKvCvjZRHxE6fc8wmt0+mOmp2Kf
         f9m7Yr7P3E1xihCVyEWDF2RPP1MEkjoF0LukjVuM3Lkf1aM4ZZAnu9LhCE/LDjDreQOM
         aOTIpFY1DG2uGNsTzk1s2XfYpWBb02Apuh/X02OSjjK3oKiLw1OAwxGmbAM3bSU642dZ
         twnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750623; x=1779355423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7mfb7Vpn1k0Bgb4UZHW0W0XQiV5frm6lZKL/dZelLY=;
        b=he3UYiXZprtaypWNKW6h51ZC+++QNPWm/SVhINJqhRh78s53ZnffQG7rtDqzD60d4g
         ioDwNI32Fa52hRFJaWvZ5S8tOCpb6I4NUWO/lk7PZO3/bpHqOx+bTSPQUo+d4K8/CffJ
         Bco+Txa5M3QRfj1dJmfbTgG2drMhtkpQ5peh0I0kg1yl0Y8Z+3v7Rpm6Ka5bNp0VSFss
         uKWCiuTJ5LFQderpkmFb6JToL9sRFKJGGz21skaVwgDUijsqdj4xQL+7pSvnGJ93Xqns
         jxw+uG46GEc0w5KmJOmXDXV8gmEJ5JXQ+PjLsFKQpDg5BynwVF9N/d+2sl83jE/gbefN
         Q/6A==
X-Forwarded-Encrypted: i=1; AFNElJ8QLKE5dEwxFcxUnHyIvwS8Ci/tqnJcFGjAAw6Ll08BiADCnSNNYlHAK4p7t/FHo/2jWxFX/OW6X5Ov@vger.kernel.org
X-Gm-Message-State: AOJu0YyziV90QMiXDUSviZXl0seV57woik7OEoULpVJSwa/ivH0hffTS
	hPZzSeDYq9dJayk9KSJDZKrWiWzSt0Qa3oj5lA8EovnMTAgaNPMbZnRmF15tFXj/y7X4xrp6txG
	6dUs5KTp1aI/dF7Dgy6vihkx5eP8COY1vHif0sSbDqpFlU6oKVLSOkWsda1412Wfb
X-Gm-Gg: Acq92OGOjVYDnQvuEf45L+uXF6ShcbhDtD3ZruyJIbUUAENIo9mr7ZKW4WRzR5FRltf
	pzpNNusRNUBwTioROI60dQHkNgL+QFZ/yFQy3B4nxgHZGZo+rdSHnJsLRrCLjKOThZntPrZPyCm
	IIt3PYaGToZQnSjlGQrcEfn5afZNL4XD9pES1pdRtksaEmMWLXxHbE/OnPUjXHLlFwP21pnIkXK
	kxw3DQcmtsaAL5xC0xxTMh53hVz2olCT/eEZaJtuz/Q8IanQImcJaYyIvubhEcNQNfaFTEznpkh
	QNIgnWglT10UNuPvi8ZIJ4X2QJ74CnQ6/r5RHjVd4OTNgdt1nKBW91H7aCiF2wOa57sWh5Gu5xw
	6b3es/yIv6kXYMVq8GRuEeIildEAHPK1NAEg391TlwHsPL8Oa+CrhP9pByBOMoOL7XJJBjkMDrI
	KrASM=
X-Received: by 2002:a05:620a:4043:b0:8cf:d953:b4ec with SMTP id af79cd13be357-90f8a634f71mr758713685a.3.1778750623316;
        Thu, 14 May 2026 02:23:43 -0700 (PDT)
X-Received: by 2002:a05:620a:4043:b0:8cf:d953:b4ec with SMTP id af79cd13be357-90f8a634f71mr758710285a.3.1778750622815;
        Thu, 14 May 2026 02:23:42 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311660f76sm513638a12.19.2026.05.14.02.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 02:23:41 -0700 (PDT)
Message-ID: <d2025522-ac5c-4e45-8274-1cbb49b7b348@oss.qualcomm.com>
Date: Thu, 14 May 2026 11:23:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: rpmpd: Add Shikra RPM Power Domains
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com
References: <20260429-add_rpmpd_shikra-v1-0-fdba28564380@oss.qualcomm.com>
 <20260429-add_rpmpd_shikra-v1-2-fdba28564380@oss.qualcomm.com>
 <e032c072-57b3-44b4-84a7-5aff062b9c00@oss.qualcomm.com>
 <20260514084512.q5pzh226zdkuw53f@hu-kotarake-hyd.qualcomm.com>
 <ezpigr442rjnodqcg5fqsyaik3tkp4yyw3cbu6j75ra2vidnnj@7svqkcz45sdi>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ezpigr442rjnodqcg5fqsyaik3tkp4yyw3cbu6j75ra2vidnnj@7svqkcz45sdi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QCQyFexg5GWkNMqjoKDLpqmJovlRT-hn
X-Proofpoint-ORIG-GUID: QCQyFexg5GWkNMqjoKDLpqmJovlRT-hn
X-Authority-Analysis: v=2.4 cv=DewnbPtW c=1 sm=1 tr=0 ts=6a05949f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=tdAlGey_Py1J2zJlv2AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA5MiBTYWx0ZWRfX7H9kl0gQVV7k
 KKgCvYyrkwiaYlKDwYgPCFsRP88cSF8X79zsZZDRodrkwF1Mt0uT1eAMBl2i2iibjucxosP/ONi
 Q7qD/kwNK8ouFcOuFzbUtTCnvO3oO8UnP3i3UFBpPmmn0uOuXEe1McYO2YPw8NwiMI6ngD7CL55
 1NXKJsUbccWin1aRvrzsoTI7ArOhSfb5sxog3giIedfk6/UqOApI2ie3JDP/1iNeHGnyH7dnBHi
 7AOFVUwR8Ebyj6qPgxBTCj/PJfYcH5759xusv+mtOTCo2dfLCc5QMhDY3QdL/+fSk0RQK5XP9ZA
 FY6KWL9aGMvcFr+Onw9eB2LdUwfs34EYwIYjanBfnPqTw5EWyRaUiKySk4CoxQLEmMGQnZ7cqqp
 DakC+IamOcBynZVKIxj+YsggTdpZ2UnatWUD9HYqwafaej+fVIGboao3Oj3Td470eze8uPKSnsN
 pZu/+iQv8XxNbyb9QBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140092

On 5/14/26 11:16 AM, Dmitry Baryshkov wrote:
> On Thu, May 14, 2026 at 02:15:12PM +0530, Rakesh Kota wrote:
>> On Tue, May 12, 2026 at 02:16:07PM +0200, Konrad Dybcio wrote:
>>> On 4/29/26 4:09 PM, Rakesh Kota wrote:
>>>> Add RPM Power Domains support for the Shikra platform.
>>>>
>>>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>>>> ---
>>>>  drivers/pmdomain/qcom/rpmpd.c | 16 ++++++++++++++++
>>>>  1 file changed, 16 insertions(+)
>>>>
>>>> diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
>>>> index 15a11ff282c3f86b1e86c6604d165e297620f6cf..6f751ee5a7833912d54d2bcfd5d85837ab7a97d3 100644
>>>> --- a/drivers/pmdomain/qcom/rpmpd.c
>>>> +++ b/drivers/pmdomain/qcom/rpmpd.c
>>>> @@ -863,6 +863,21 @@ static const struct rpmpd_desc sdm660_desc = {
>>>>  	.max_state = RPM_SMD_LEVEL_TURBO,
>>>>  };
>>>>  
>>>> +static struct rpmpd *shikra_rpmpds[] = {
>>>> +	[RPMPD_VDDCX] =		&cx_rwcx0_lvl,
>>>> +	[RPMPD_VDDCX_AO] =	&cx_rwcx0_lvl_ao,
>>>> +	[RPMPD_VDDCX_VFL] =	&cx_rwcx0_vfl,
>>>> +	[RPMPD_VDDMX] =		&mx_rwmx0_lvl,
>>>> +	[RPMPD_VDDMX_AO] =	&mx_rwmx0_lvl_ao,
>>>> +	[RPMPD_VDDMX_VFL] =	&mx_rwmx0_vfl,
>>>> +};
>>>
>>> This is identical to sm6125_rpmpds. If you're sure the list is correct
>>> and complete (no LPI domains etc.), you can drop this patch, and proceed
>>> with just this change:
>>>
>> There is one difference — the max_state for Shikra is
>> RPM_SMD_LEVEL_TURBO_NO_CPR, whereas sm6125 uses RPM_SMD_LEVEL_BINNING. 
> 
> It's handled in the DT. As such, programming model and the domain list
> looks the same and compatible.

Yes/no, this is an upper bound

one improvement we could still make to this patch is not to define
shikra_rpmpds[], but refer to the existing sm6125 one

Konrad
