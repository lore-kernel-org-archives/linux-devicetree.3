Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE1931D757
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 11:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782293; cv=none; b=Zr1uY4CJF8oUKT2BTpaiojMhl1kQGlWDUJmonWhKkV0/iny0OROWquxYpv3Pz+rCJDvfSMjSIWxcvhcGke5asGS66N5QjT2dTz5ZVPPb6ZGEVXNafO9fwGleGnzQR5TorNGlPKBviAbQnzfRnwQcKOS4fOburX/5s5e5BEGKVjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782293; c=relaxed/simple;
	bh=IQn9Lo6NDC69G/SKfImAg6Do51foG5sJRKiGAiAzsP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FyuWlT1tv51/5WzGgfJqhU2ShUQwf305Lp7iVD56GG4MgPsXAMFJU6Qp4OqXABwatpqgi3bprq2NugWn8VRuSxcOH4EmzS6kQcJOMOO2YOV+VGpEeu3vwtK9YL4+/oimh8aH9yIAWLrR8hCfYGiIP1xa7xzAm071zoaiw290m9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mk8LzuMm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O8+Hc5C0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mk8LzuMm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O8+Hc5C0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AmpFC2652023
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 11:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tdm8BTLKZ9ikHb7V9OMkXJJkkiZ7urcEJl44QrGBl7w=; b=Mk8LzuMmP7TNJuNO
	iq6CD2fauFhV3AsA9VQaeb3SCUq4bIdO/4f5Y9sYBwYIBXofjM0/criCAMDj6uUC
	9TSDoDOlLR0nz9HxsXqgv9pAwD+AwX8ojQ4ngzW+J1Cg0Q/ZA9/ZUdKtJOBwqpbs
	kKjHmbMYAm6N/g+8MI4s6b6lzEkb27h3H4rqiIeN/w9kmmBWvatYoORvmtxzkegr
	e/nHYDhQdSDh1IPpG+y3edtWwilaKJ5Hy4UlKSkt8d3ckPYAD4LSMNHjHQ2/oFXU
	aQlab8E0fySg2CUgaFi9Toq3s13d5Fc5+1YQE4SCh2MgkE9punF+83qpJuKqrgyG
	11owog==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty0gp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 11:58:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db22383e8fso36508495ad.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 04:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788782291; x=1789387091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tdm8BTLKZ9ikHb7V9OMkXJJkkiZ7urcEJl44QrGBl7w=;
        b=O8+Hc5C0zPXsmZSyIXdCmFtbzhN+PuGQQjT1lMBfPwSl4LLI1W1bw407Af8NgUHL4n
         WMsazSvx7d9B7p06FPyJZunewkxQamuRjuzlKX7oxiz74dcKdCCtET8AW8cZEwoBq7hW
         2z88bq0ie1ACo3F+RAT21WAmi8u0ghsEWa8TBsmfOaLa9kGJZyIBtXSPYmhi09OSwn5X
         1jvVYmHu1f2br5u6uo6c3V5Umbc0vWh2t0oPmeXoV4ZxqGRU5mY+mEqgW06/poalKV1F
         NtH+UTjIaPOidHYU+cwb8AH7nSgOzCQQjJFjvArwauWBmUClDuG3Bgn8NgEJdEvBGz1q
         FiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782291; x=1789387091;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tdm8BTLKZ9ikHb7V9OMkXJJkkiZ7urcEJl44QrGBl7w=;
        b=d09XcGaitC2JDHzoMishaOT5AxBZAYS5Rp0rf4ebxibCRr4dDfe3ZDSB/N2hqa8ULh
         7eVK5hPuJ+vMZNu2w0YCacokOwRVBXueaxYyZ+z+feE8PASwUuyK/8CM8bCkn7QoHskg
         4TsCcbfPNT+zoVRIil/Ao926MhA21TrgRViabqMZ2wSGRYc8mPqYoP5tgwKHAWnVV40V
         nYyGB6fUKpfAazAnxs68k6vyiShi2T9NcX8eOKDnBNt+9uJdOQuDepRdVEjnebtFQDu7
         VAHUkMDicQIRLiT/Shc/XNFRqK63IbU149OBSm51XTBy+8h/LJRqvWXqpeWAIJy72b98
         yHJw==
X-Forwarded-Encrypted: i=1; AKwUvBwI2/IufMQheiEeqFK1BgTpAHsLs7pckTwiSSK0uM4Shloh2Vq/vXQfM/XopTDdXNnle+86Ed0CogLm@vger.kernel.org
X-Gm-Message-State: AFuF++nq5QzgainM+DS+6u/JNxi75BJ9CSzi+uue6YnjwscHAm1051Pi
	dpoZMYSIGDNmzK+kCP6P7TQIuiAMyDf2IG1yrghz+AWunoPbXcR/Vv7bdB0LxqQAemSApov6+wZ
	fOfTAaFPgIEZCrLdOuqmf9pynfXAs7o2f2jcatsnfbuOFhV044HhlGkmqGRKM9Mfi
X-Gm-Gg: AYBFou1d0tuQwGMFd4/b7ih0Chd2gv8/7hpoCFxuZCu9LGmAlboTaqnGR88aNd3e4Mz
	tl4M8yCaYHxdpVxOp+U8oUzlLZB6F8czcnvDYO1kY4bu7Twhz04/O4rSZO0XwnDneXL7nrpTTB4
	5ZeidWDQCZ76WotfjBfHt6ZA2z9MSg0KNtV/7PJeH6UINgJ4eWqDxCmPDsdG1k5x8zhZV1Wy806
	6gKuOXJwQadPQwhvGgAEWmtyLgIMFoarnGVX5wlPyWw76ESHt0H4APIDO4Jz83zebHKCELCyuME
	0pEJlFZRZIE9WEazQJDqh/tM7JIpdnkAFE+tUCilJt3MqCpz5lAD5uT+QaoI/IYEjEzBhjkMfss
	xcfC4pZrcYwMEDfhBioXIYmDJMM4=
X-Received: by 2002:a17:903:2ac6:b0:2d7:1858:1d96 with SMTP id d9443c01a7336-2dafaf5f50dmr265918675ad.7.1788782291137;
        Mon, 07 Sep 2026 04:58:11 -0700 (PDT)
X-Received: by 2002:a17:903:2ac6:b0:2d7:1858:1d96 with SMTP id d9443c01a7336-2dafaf5f50dmr265918395ad.7.1788782290731;
        Mon, 07 Sep 2026 04:58:10 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm43995613eec.15.2026.09.07.04.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 04:58:10 -0700 (PDT)
Message-ID: <73411be1-7b7c-4b06-ad1c-f98af338c5ae@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 17:28:04 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260713-shikra_stats-v3-0-4be17121729d@oss.qualcomm.com>
 <20260713-shikra_stats-v3-3-4be17121729d@oss.qualcomm.com>
 <apl-vKnwHWFJ8Kru@baldur>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <apl-vKnwHWFJ8Kru@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9ea6d3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=qtFx27__m5ifiE6ZfAYA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: P6F7aLR3aX3s3plpLpXa0lGh81r-9tKA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzMSBTYWx0ZWRfXx8PwZXzhq8bo
 e/aurgQkhJziTRDuhOrS8L4hISUucXYd0HubJLdqEIdsxgEVOzA5TmXMvGWShvpqrKMyQug1rOs
 YuxrkuLnE7Cyw3004wmowkqbXcwL/GE=
X-Proofpoint-GUID: P6F7aLR3aX3s3plpLpXa0lGh81r-9tKA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzMSBTYWx0ZWRfX8DyDdkYvAJwD
 4hF4FdK/Jq7fJWGmBZTOWz6lfk8Jk6ISYrcq6xNMWy8cLvyKFV1du91Y1FuA0/6GTgMKFEGnybR
 S9V5zfx4QFSOxaNETRf1/b2EUgOpU5cbTLdjNmw5Bzdn0VIw/rnSRNqvZBeGe+rnI61XJbcLaoX
 gNoa6DJ+e5nfmf/T1OIkgn3Uwzihsw0Dzm38J/HVQajrHcPwFW5XgaIYxUtjvjuP5d/PxIbC3E7
 tnIk7eCAS6him8QJE+7x/cjMF7CVA1HFTgDvbW0v5VhI8UkZ/Xip6cK5mxVYQ/X8y815fQIJFr2
 o3f7jm10bd+dmo6fZhOYPKBAnQQnal0BIm2uMVcKeWgL6UnEtyfu1hCLB+gsA2ToUUHS/dP5gLn
 oHEPMaxTDPymP6/dtVchvuUrle4M0yXUogKyfqiw/xwj1Ys+0mRnnqNcKLL7HRfpSyZJdluB5EJ
 bp4zrMV4Ha96Vc01a0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070131



On 03-09-2026 19:36, Bjorn Andersson wrote:
> On Mon, Jul 13, 2026 at 01:46:56PM +0530, Sneh Mankad wrote:
>> A generic "qcom,rpm-stats" compatible only reads stats for SoC level LPM
>> stats like vmin and vlow.
>>
>> Shikra SoC specific compatible allows reading individual subsystem level
>> LPM stats along with SoC level LPM stats. Change it.
>>
>> Keep "qcom,rpm-stats" as fallback compatible.
> 
> So the fallback compatible works, but the more specific compatible gives
> you additional stats?
> 
> If that interpretation is correct then this patch is correct.
> 
> But then you need to fix the binding.

I have already raised v4 with the option to keep fallback compatible
in stats bindings.

Thanks,
Sneh

