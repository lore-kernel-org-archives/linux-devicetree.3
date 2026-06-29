Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9E93B4439
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718865; cv=none; b=fldXmJVoctAHhsBtRTSph6ukRS3iVdv71t24rZ1GlBj1kgU99RJEz4P7fLNFS9ijkGXwBsiJGJX9urlCFTFiKR03fkK4m1dEyJ1mfbYmBPD/0I1j7sYHUJ5rypPGB7u5ctmpRsp7Th+z7e4O/4PDiYatcKfCtsHYdq4zKIgfOGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718865; c=relaxed/simple;
	bh=66zTjTSSwTG4b3YNkMn0uHr+RMqoFbdF5t0rH8sHp78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UAiYqJvqae/w8k/cdqLgUjp6QlBOmAUqbCG69TNOPN0DWjRaCWd3YHgVQXSsXOfRKH7QAd4rTUGFvel0Asul6CCtFSa2E5F0UqsQyu60NYbT4enSpOzA5ypo6hTvgbTkju9kT2FEVdPHXQabc5nhSoUwv2jgPYVcjOi9viYv24I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lt9AErWW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J19Z6f2k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lt9AErWW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J19Z6f2k"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rSUh2124840
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kMLY01MXHmgEqL1zNbJ6LeGmmyFvOsEKBD+lEg7spaI=; b=Lt9AErWWQjVCGaOX
	7mC3938AUiLp6i5hoahtI1WOV4LxHZleTo0ch1jNDJDdG3eRte8EOUrTFa+H3zff
	Y+fIZA5tcA1tO8eZzLAcYW5fhE9pAUVs1YIP4gAbQ4AlidaKcli3DYgTDE2+c9Mc
	yQ3Z53W+myPTaoni5kzXVmyIO3/FFRyLOFSIudJLd9aApRXJxcYaVmXHGObkTu+i
	19bWk6wqGOEmJniLbFi23tTKinnJg4IZMatzGZHMXohstUQUTI1WuOLeaaahn1wy
	UMs0+5Nm9IlpXXoL8LmxfsKYZX+p0iQoxsd1hf1w80InWrmGvHzoz48O+WmyQS5Z
	l1MmEQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27335bqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:41:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84531eaf8a8so4467417b3a.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 00:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782718859; x=1783323659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kMLY01MXHmgEqL1zNbJ6LeGmmyFvOsEKBD+lEg7spaI=;
        b=J19Z6f2k1GfU4nK79UX4TvqewOM3c88X39HtMYLWwrwIysNRA5FQa6idGI90uBRlt+
         Z3bYZ5MHHHnKNZrwbwBPHW57syJs6UYAhtXcCqn59c1RymT6K7RQuhritjHOXLaA5+06
         zHRiODWLzIa8DYD8CRNhn1sw/Ku9cL0lpy13llQuPqRd7udltw3iDHxDEPxs6Ex+nHXt
         OAFtLIvrZg+LJyucP98LbfEJVstBFH3YXMDNL6ZfGkBWsBSKI+t6/YoDfSaFcMH7bipT
         8Q1QooPOUuP2g/femJ54n2WvxsFFmfuTr+35nTyEnfno0VlJZcCKEiyw725O/jwXUMXN
         vREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782718859; x=1783323659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMLY01MXHmgEqL1zNbJ6LeGmmyFvOsEKBD+lEg7spaI=;
        b=dxt+YTUt1HGHFQ7Wt/qiJeUX6VINRguCvQsBfmOhh19ik2ZNYHRoLu6srzi/uT2PJX
         A0BeGwWrxTjOzna4aT7neAEqc2RtSB5drAwP0pQteIMKL5cFO+aLZDLI80USq18jxXYn
         PM9IGyW08WISbHTorkm1rEfJU61YbpJnjNNLsAy+/M9ze+Z8z7Cz+W+Akvl+TM/JPGCj
         SosUGtvEmjBrgwutTw/COupaAP9uYP8h2PTgiDWs0KvRXkkX8qpY3/Gr2BHz9VFLjdmT
         S2Z3J3VP2uv+HQ7cgtQp9ZI6FhG0nFxg1dzDnbfN9MvqAa0LrBHAJzwNOWouWSukB1uP
         ZXgw==
X-Forwarded-Encrypted: i=1; AFNElJ9yZdm4ZMkFOZqIuLF0e6335Vxw0n1gkY1FFA9CEUg3W6z9bqe4VUEAPnjuI+3JI8raCyICsOOdWvCV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8HrjQvjbPWouHdKKr/t/PEiz4oI4bdWE8vuVHD6LgUm5Q6aPM
	XLh6ICGIcc2f3JHJVYMFNViHafchUjVjFSirGl+8/7qNDvh1PBm/DwrhfW6dtzTij8i9CDs64rV
	v0I94PdV/9DHVq2mCE3B8CIuTscycI4TxTeWado7VJHsCAcJv6LmZhuSJ+vNmz02y
X-Gm-Gg: AfdE7clpo1jGoG+2QHlo4oddjD5LACBHAgm/PsWreeUF/1s0PD3TnR6a7oTdZmExBs+
	YH9CJZ7m7LXfV/PA46F17xCbnjGBQSEQ7C9IqCGpFYWFg6y2n3xvPVvCiRZ6Z9sCTr7g8yPEYyu
	Yn7ZwnEThzN+EZ3n6mtC2aWRC69tlv+KehI1NF9tJUlMD6sYUSik2KQLqJh09Fbs/wdrIY7eJed
	prSBLXeWgObw7HaqdkC+7KMTHRxlpu6Ik8+eM8HT5Byq4b+iM3jQbdF/vCpr6KXRoOWrCgZE+JW
	6QlmKE+5/TaugPNZ1wqv+/mcxVHAWlsluLJ8GMTEBnm++76GYahbDVpNjz4Nf9F+3mXABBrC+nT
	SHAcssrIzEPty2+AlkUBXYBMuv2SpwhPU/R97Fa4ArYQ=
X-Received: by 2002:a05:6a20:2324:b0:3ab:2fa:756c with SMTP id adf61e73a8af0-3bd4ac7044bmr15877469637.1.1782718859331;
        Mon, 29 Jun 2026 00:40:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:2324:b0:3ab:2fa:756c with SMTP id adf61e73a8af0-3bd4ac7044bmr15877450637.1.1782718858881;
        Mon, 29 Jun 2026 00:40:58 -0700 (PDT)
Received: from [10.217.222.146] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d09f0sm88825405ad.56.2026.06.29.00.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 00:40:58 -0700 (PDT)
Message-ID: <fefd7333-fe86-41c3-9ad4-1816b2dc701d@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:10:54 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Enable iface clock and power domain for kodiak and
 monaco ice sdhc
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F+FnsKhN c=1 sm=1 tr=0 ts=6a42218c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eVMMNwGAFmqVeTlyiUoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: SQttFQmF35I__lQXXU536i6mQnQ4H-fE
X-Proofpoint-ORIG-GUID: SQttFQmF35I__lQXXU536i6mQnQ4H-fE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2MSBTYWx0ZWRfX+Y3SdcqyY8hl
 g0WVao1fcVhr47ZqJORB2+HddnVfFhSdBE+0qtdbMiWnamWNHCxkxRjDJ0D0IzWNogEzYiMOnJv
 ihlP1Ff6dgwHegfOszWd5s9YH3dC8Mfz9ylbkJMIdb0jK134/rbMG33i5/y3MNfl4J4wUC3iP41
 v1dNCU6ei+vVEdjSFm80iu4I+Kvv609jugn61E5ah54KtuLqSAcRnWE55NqwLE96HdAHUzFO0yI
 IbpAl+qEIlPl/L5Ps1/FmRg3pu3KH9/dWGb98vE1t3qFvfKQYqheTDGHkVIrsSUFBBBCHTN1BRt
 JJ0D6NZm/jw1fKy8wEtwREW4cuRmoo87FqXr730g1P/Q1XYErv5tVWj0nmBtbqk2I0NQDUi7+Y9
 cxHJ5XZ7LSWy+4IiEdd5gtAjoSiJPo+i/IrTayJDNcFc8372ejtpEkMRQDWgFH8fJn1oBAqW7wV
 tqCMjRKrYRKJrWvcCNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2MSBTYWx0ZWRfX9aTWyPj73kbX
 YlkoDnkbzOs4WJrv1ntx9H9jlv/olbCRaQemZkU4F24t7TsiGYV5Kf0Aot348WsqljOWce2g0+V
 WBPZTrXI/3lQbAeURTiUbrLPU/lAEk0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290061

On 09-04-2026 14:01, Kuldeep Singh wrote:
> Previously, ice used to exists jointly with ufs/mmc driver and not a
> standalone driver.
> 
> With recent efforts of making ice as separate module after decoupling
> from ufs driver. Update sdhc ice kodiak/moanco DT nodes to adapt power
> domain and iface clock to probe successfully.
> 
> The patchset is motivation to fix ice mmc where ice ufs is fixed with
> below series.
> https://lore.kernel.org/linux-arm-msm/20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com/T/#m5da5dd7a18318583b23ffeb42fa07ef1438042d5
> 
> Testing:
> * dtbs check
> * Custom monaco/kodiak device with emmc storage.
> 
> This series depends on the following prerequisite patchsets:
> 
> [1] Add explicit clock vote and enable power-domain for QCOM-ICE
>     https://lore.kernel.org/linux-arm-msm/20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com
> 
> [2] Enable Inline crypto engine for kodiak and monaco
>     https://lore.kernel.org/lkml/20260310113557.348502-1-neeraj.soni@oss.qualcomm.com/
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

Below 2 series are clubbed and sent together as new series.
-
https://lore.kernel.org/lkml/20260608041650.541502-1-neeraj.soni@oss.qualcomm.com/
-
https://lore.kernel.org/linux-arm-msm/20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com/

Kindly refer below series now,
https://lore.kernel.org/linux-arm-msm/20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com/

Regards
Kuldeep

