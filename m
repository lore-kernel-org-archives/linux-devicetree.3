Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430EC3806D9
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451996; cv=none; b=nvMIP6URjPkXhd/DhK91RTikXmSx3azEA8z1E51RnDyKCMpQyltwZ0n+nMGSIlUG7noKTN5nbmxSNvBeKao46XaiAlqf82VaTZ4gAyVE7AzO/lvZDIiJ+OFNDUIigORYGRwXn7g6vyoid7GTypnC7Fbsdgeu6QF7u2C+k+EJkUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451996; c=relaxed/simple;
	bh=dsFCDXR6KfRqwQ/1dEbG5yHBbEaQjAaKEfASudO2kzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FAhFHXwg18eI+gPEK3Uw/LP01jaUiNQbfyj3L6Aae+AKoyTmuC+1sxVmqC+iBpVzaXL/eVR3e8LnD/AhirVbLQm/pyY20AIiMM/BKP9XHawo19QNVxTptJHQsWfuYqaLWsUQ4PfIuQcUZpIwfbWMWaB5+5lNZUoehZiLDF5CbXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eHghqaDN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tx3h/y4Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eHghqaDN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tx3h/y4Y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8auo2399343
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qxMK/paVn1ngW6KHoUEHILSkmmr1MWqnQJ3Uf0bYrz8=; b=eHghqaDNzay+elpc
	kIzOfma9K1chVowFizfBShC6YMxRItbLGZlx7ZLvqZqY3LHT3DqRvKAMEUn0NhKw
	lQOsO14gb7YttV71il0/J+FnyHSmT3yDh8u1Q01PVYgwVSPkvfH6NGoW80Ku/tHj
	cSh+6EfRxx7LiO1t/voE0eYi/esFdSUna4mSY6nz1bUlQ7zOFruRz4UOD8CJiCYk
	mvJ8Uxpn9A2RF9asxV/416WAymPg4AhNF/94cVWlu/xVYH+cbygLyuGn0J7FAoY6
	oiTkNbojtQ1HlfdIFCwKBZFlVvph3pn6SwT2KtfA74JegP0tpZA1n1AZz5uwnc4y
	0Hlf3w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea5p9v797-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:13:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516cd650fc2so3445571cf.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 05:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779451992; x=1780056792; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qxMK/paVn1ngW6KHoUEHILSkmmr1MWqnQJ3Uf0bYrz8=;
        b=Tx3h/y4Yk6yqZ4bgRaU/BZBj9DE7K8AFGtp0RW82ogHOGQfEA9Bp0vLLRrZ8xF3fuA
         mIg76cpn+d6WMbz1OwXxI76fmgBJc2OXbQcmLoFyBVBaatqAcxx3bh39yQjYZzo1xIb7
         YBRP16a8gorOrvKjh+jgfqwxCQis0ecrh8FjEetkcyZNdBvEvgZH7Ght8SMI61vRjmnP
         4PdD+A5HWEK/QNM87DH7DeWnZ/soCK2o4D63nYjEtrAzY9EfbBcmSI0UzHEm8xsiliYa
         HcUH3NgD3qP1xe2vAM0NnJZ/OmgBN83vQYTxYptslVfzDY04E9chjrjjfH4Kv/QTlDB6
         nQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779451992; x=1780056792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxMK/paVn1ngW6KHoUEHILSkmmr1MWqnQJ3Uf0bYrz8=;
        b=jDTVm5egLb9FoWNz/puvBfofXlJYwiDKrZao1q2YGGDF+iPkBL5lt+M270i7fc+938
         9HnZUePhnel/d6b9vhm8keQIJfQRo4H5aysBdegkyiKeZEc/bqbJl2UVRyiYb3WkwEiW
         8vV7v7iHpPjctgc/YhHgxYqBkSVys2NR9VG7WC6CIfyf0m+te/n++Lqku6MQhkMNSSeM
         TemGO4pPDQiHvALOOrCZ+mEMk15C76WZbbEqLrNQdVvndVas1GraQgHSnV0x4HWITQv5
         +nRiIswU4Z2+4WS99SEHW3gm5VPOKGd89g8t3TaeFG4VDqDQTL5+6F1om+8nOgd+KPog
         Kydg==
X-Forwarded-Encrypted: i=1; AFNElJ9OQhihvXJB/5zFIQ79qzNuhzszDnVqdrHfQ1RTYaQD6Z85gvVkqnh9WArcQbGlXEPK42Z5D49GlrSh@vger.kernel.org
X-Gm-Message-State: AOJu0YzDj87IpRj3t5K7mAicKjvBjFGLIh4UIhW4o1+aw9Ik/FibMwYK
	6Vm53gneNS5bcLRo4anvwR+jw1S2k++v+jKVVubUF8bFD991rcXK6iq2HG2myTlQ5ZQCrv/k3kl
	J+aGWxdUldNrWboa8MH83ag/EWCOfvhtdKGEYqfdBkbhFBrCsHMQr4u409nFWflUc
X-Gm-Gg: Acq92OE1fZEaN9bS2pIehx1Zrik9E8zRLxl6VkS8fdOKiWD+r5WoBjP81F5s/zQxk6T
	nA9NxFNh+ODXF9wnj6Ohwpu3gWa0W5wYP+B+8HeBXfZRQWK+Eyuvxtju0RlJV/+MPBHnpV5bZyE
	4X8o4W/LAlXOyc0azDCtq3QIFQfAXrC21nudtxw2yKSnWOdVdl+chmuD5Rapwc5+BaZxgRDMKTM
	FIvp7snPESQ2msa31pGQEywljsaVm4uGh5jKBemhBDr+8RSi0RD2RS2FF8eNHVnP9uSA+hP2Ozt
	CWR0nTcpIge9c2hMek/+lsA3hGeyx0OV+S0bD0yYxU13vEKqDAEKDXEOXLilomPmfrkzUKQx0n4
	YVkMLXZ+NFDyK6WS2w8cJ0Z7rHINVDBcLmyYRB4rycI8HMQ==
X-Received: by 2002:a05:622a:a903:b0:509:e68:22cb with SMTP id d75a77b69052e-516d439424amr24955351cf.5.1779451992464;
        Fri, 22 May 2026 05:13:12 -0700 (PDT)
X-Received: by 2002:a05:622a:a903:b0:509:e68:22cb with SMTP id d75a77b69052e-516d439424amr24954851cf.5.1779451991851;
        Fri, 22 May 2026 05:13:11 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5ecedf2sm48860766b.37.2026.05.22.05.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:13:11 -0700 (PDT)
Message-ID: <db13f51a-98d5-4793-9c7d-3edccc3a603c@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:13:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Add Shikra remoteproc support
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
References: <20260514-shikra-rproc-v1-0-9afdedeee002@oss.qualcomm.com>
 <20260514-shikra-rproc-v1-2-9afdedeee002@oss.qualcomm.com>
 <g5wv5mi25l7jyq3vbe3dovriyxguw22m5uvyslkbjbyprbxfnq@kep4x3kxeqmj>
 <fd67b063-a986-4d34-99e6-fe55e72d0187@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fd67b063-a986-4d34-99e6-fe55e72d0187@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DKm/JSNb c=1 sm=1 tr=0 ts=6a104859 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pC2wnO6ryxLTosdQjxEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: LC9r6sQ0Yvr2R3ZnqZpf7XLX2DaN9i1N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyMiBTYWx0ZWRfX/kSHIu3Y/nYo
 XRdJgv6hclNJrYPnrWO0qhJDiOQZRuBfUsjuR1dkiZtI9QunJizUVbj9vO2TMrpShK4zilk4KTF
 UpotPDox/MMpCpKYxOYefuVNJ+TA5A14R62FXkdkdH+cM3Reey00cO8XHYQEvdUdgXmGtMrir6g
 FND36rIcI26MAYR7h5eXFFgZhWo/7TolXA1Q4n0oM4i+uCsUyPWxoDcKBSmbFX8rMeGfe5unGLB
 p/3EubBsdMwekHfpiKs/nM+nZvw2smo/eiu2bzrDaMw7izFV5iFvK+NPbaPtR2EjIw9Bte9mkro
 6hVMq+y2M4TqikEtVWwPQAvsYBqyq7j95bVPftOoU2pMSL1gOp013mCtOHvtl0QZEo2KL176xQu
 oDB6ted7LZzNywxYGJRs3xKPmwdL0I0Kj7EQyRAkch3ngZhLIEFwADDWq74ENUV6u3Rvloz4ts3
 Sw8zOBsMXThxJzDL3cg==
X-Proofpoint-ORIG-GUID: LC9r6sQ0Yvr2R3ZnqZpf7XLX2DaN9i1N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220122

On 5/19/26 5:03 PM, Komal Bajaj wrote:
> On 5/14/2026 12:48 AM, Dmitry Baryshkov wrote:
>> On Thu, May 14, 2026 at 12:17:31AM +0530, Komal Bajaj wrote:
>>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>
>>> Add the CDSP, LPAICP and MPSS Peripheral Authentication Service support
>>> for the Qualcomm Shikra SoC.
>>>
>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>> ---

[...]

> Ack, I'll address it in next revision.
> 
>> point you can use sc8180x_mpss_resource instead.
> 
> minidump_id is required for Shikra. (decrypt_shutdown is not applicable and will be removed in the next revision.)
> For minidump_id, we still need to use shikra_mpss_resource instead of sc8180x_mpss_resource. <?>

Is there a chance the same ID would be applicable to 8180 as well,
just that we missed it in the past?

Konrad
