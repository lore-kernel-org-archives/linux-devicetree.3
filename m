Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCEC313540
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 04:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792126150; cv=none; b=VPdvXKy1BaB9WMhng9rEZFbJUrZ62siT1WqiZJeJ1TRLF8b41+q+RFaBeLWoRAhmFczZYXzWzrx2SocZ8wFKmf2o2+zzub0Kbsn29c2nQdLisGkIjCLxebP1wFoVPKTcXwJIjgnxevfQSFOvWX3nMKceaNN/W0tuAmHv4lNtE6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792126150; c=relaxed/simple;
	bh=VhOJygrLbJVu1QiAay9j6a3lqhd3vK1xPCERfvkhOKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tfQ8SzRMYYub/8CcMABzqfnNYRQWFMmE9K9EyTfjZKHwQXBZAZqzU87nArt9MlaBDz2LItuUXWSs6bOypR/r5di6RWjJa8217GnM6TXwpZoSyuRBLvYhdXE4kBb6gwTjrEO73wDXR36y3oRqY9+/NFSOLY0k5fgJM7td1NPa1zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=STu/2qjW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e4R+u38w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="STu/2qjW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e4R+u38w"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G44I7K3875616
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 04:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MdWvKoNv/zR1uInkMslEraEnYwrLaVPBTjCpwAlZcKg=; b=STu/2qjWYM2tNdxI
	7bXh00GpabQ8v1nWR2gQMIHPOEo7uE7SQnGO8FmAsWo4+lUeg0eB+pBf53IKLHZi
	gas9iuLjcL6/7vZinSVhbg1ODGryEisOhEp3S3ZWKTgMQnzXuaMsVyQ6GPg3KTi2
	fCNT9cDjNznpMgxmSsqmMF+ETUZITAfnwLlCj/cnvBCrl8DAtDjhTjGGSr/NgL5p
	eQtJbGJ077779GqbX3UnbMMC0NqU46msrRTItVzih9t3YpRo0wEOMfxxp8GnXnjs
	MB2kzKkY0Oi/t5nDx9LtKl//Hhn1TlnAXkg53rmfKZ+kI9P6xOtiiteLFEQbUcty
	+pR71g==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjt84hb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 04:49:08 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-154e9d2d94fso3595768c88.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 21:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792126148; x=1792730948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MdWvKoNv/zR1uInkMslEraEnYwrLaVPBTjCpwAlZcKg=;
        b=e4R+u38wKfL5z189gWd/Eq1m4EpYMqH4vih+5xkb+hxNLn2fCw2IamlRXW+xqAqG2G
         nsMPts7U0ivbmTjUe/T4672nByF9DRH34xPtLUhsqkMNxzABGYfCJapEi+v4LVMfkogW
         LpRwqQSEpDJhlBHuxtgzJln/Q0SftMMYUDe9Keejs/ByukKMu309g/Yi1Vk4+kl3nvPr
         WCGb6RrFu5aHjkRJcEr314drC2P19VQeWoFcd5lu6oOImqtbAV1VM34l62PA8wJFuHxd
         FqWrUi/Fb4EpBwFAbT0y1QPHABsx68Qn78Olu5l0aUJSdoLcAoy7Haq4lM6gkLAOiuJX
         ogQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792126148; x=1792730948;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MdWvKoNv/zR1uInkMslEraEnYwrLaVPBTjCpwAlZcKg=;
        b=d/9AWT1EmX+v3Rn+RgO7EYFN9dH37D63zSlmDVmu/4heq+ZyszSud7Fvp6jytoz6ZN
         D6gE4D3U7j9zBxjxVJ7zBQ7TOr4FDMAkgtxlAZmQmjqZU3l64JIfsxdXCLfNygVkjRoR
         2LAuWkISDOpqhCvIEFj7co2nG/vMvD4dTfUeAV9e7cGdJJoT37oDm1dveIUjzcy5AOOA
         q9fGUsTnrpwJIvl+1Qk1Y1BY3uJ/Muvw/sZY6AKVwLYD3DLwjMxapYV0vkvL4q2aMm7y
         7vJRkbhqgBO4Kx9cukh6fOa3uSUeZKDDUEBz+RnoblKu5dvAGaNHRcRD4dcDncqjz5rD
         Bsmw==
X-Forwarded-Encrypted: i=1; AKwUvBxUAzNnd7sRwOo9YXSIFiN+JHd73kSP8UQ5wBs3hCSWda3XjPznrFImVWS+DqqbVlNHAdLTy9HDD5RP@vger.kernel.org
X-Gm-Message-State: AFq9FYJlAVaA10L9FMNffBrqMmMQ9BvInIRI9IIHuhittEiObcVfWjhy
	ABAyeMdvx2dETwK72flWQH0yAJcDb/Oeyp8WkwkxK+q5ua1iQrcJ4LcvL8e/zRIdd54GlhibrcU
	xwzuIQrJ06t6LdTw/rnoOl0vfGthq+BHNv70UcJoVtE5bU9YCpOGyB854SN+BRpgV
X-Gm-Gg: AYBFou3IFscqitd4DFi1n9mCsj7X8vReeyt4WJJuHeEplbkJ4+Qq4MzaKyBN+uaKwGV
	cUOWQeJzytU7P7rkbUht+GiHmMZw11W84WqNnYzE79wqx21jUK41gSck7wq2kgnBlSHySFLFe2w
	pUXKw7sxRutZPp462yeg+R1/0L++Mq+mUt2JlewDDlVqiofyxHIgaNu+PL3JP6UaQplXCiBA6ok
	iTvRzS/damZi6BhWV9DU/XETwrDFXNv5TiVEsB3t/0Vvlf4lF9NE0dpVC9/r/gholnYdU7Yz5Rz
	LjXtu7jP6GdBtC+aIivpFzoJ4VBH8TRra8+0HLDRBJ77i8LjCV/sOAfGk9EF/YrC/MI9yOGcmiv
	0LV+E6+cTwZlkpQQd2jn/KnJ95t0dFA==
X-Received: by 2002:a05:7022:283:20b0:179:b953:a14e with SMTP id a92af1059eb24-179b953ad1emr13247055c88.45.1792126147827;
        Thu, 15 Oct 2026 21:49:07 -0700 (PDT)
X-Received: by 2002:a05:7022:283:20b0:179:b953:a14e with SMTP id a92af1059eb24-179b953ad1emr13247032c88.45.1792126147295;
        Thu, 15 Oct 2026 21:49:07 -0700 (PDT)
Received: from [10.219.56.188] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831acba710sm2900617c88.13.2026.10.15.21.49.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 21:49:06 -0700 (PDT)
Message-ID: <88c9d069-b6df-4a32-b8c0-75a182ef26f9@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:19:00 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] arm64: dts: qcom: sm8250: Make the ADSP remote
 heap no-map
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
 <20261015071511.977-4-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261015071511.977-4-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxOCBTYWx0ZWRfX3+VzKsNS+rX2
 e4QlpCyo5lfZy8bpwbxBklCozzxGE3c4XNmEjjJYu1OIVIQc649mrrwwkfD9w9y/nWcAjLAvEPe
 yC69edeJ/vDoG7fMuFJ9DCTP5y9aBrkBiDeSFifaNfXdkaXX+/CQmLDSTqZwfFBDtBD0Jccr/4p
 kLGfzPqzXipLBGYrhX7iDSdT8j+H/X94xkVAAKKieIa48FfQyV8aspqMa8k/Ddjp1mCRAcpeR8Q
 fWBOBwycQAgcul1nGmfm7BGFmSEP8iuUB6YRGo6u8ffLo17aUJijfJ9CL83adbDNA4bbBYKiorp
 qH8sHaX+vMi9YY1c3BeaCA4Lb2+D56B6Wyz8x7N/qNnZd8v4PCJyvukCVRoVxQvN5JdFrQqZpZz
 MKwhWsKjoRuMIh+tRaVkMGsc5AIlT7n026P4JKGdgr0c9UCrGG6wOybYnBFzPWXi+rbroDSZQ5W
 M8uyz2JUX6sMwoB4Mww==
X-Proofpoint-ORIG-GUID: jsmuiFtbEhZGUSIpi2cqNyxXuIeux7j7
X-Proofpoint-GUID: jsmuiFtbEhZGUSIpi2cqNyxXuIeux7j7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxOCBTYWx0ZWRfX90wIbhVzEUWd
 iNKMFa443zA5qaTJDRVdNkp8OhCDJMcN4nPEAFKm+3pnFnha75Ra5cR3KpzT6PLkNkgESHKVyoV
 FYwGzyvznPrdLxHH5pIX5oVJ1Q/K+L0=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad1acc4 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WxrJ1OjRqBU2I1o4brwA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160018

On 15-10-2026 12:45, Jianping Li wrote:
> The ADSP remote heap is declared as a reusable CMA pool. FastRPC
> assigns the entire region to the DSP during probe without allocating
> the pages from CMA. This allows movable HLOS allocations to use pages
> within the region after HLOS access permissions have been revoked,
> potentially causing synchronous external aborts.
> 
> Replace reusable with no-map to prevent the region from being reused
> for normal kernel allocations and exclude it from the kernel's
> standard memory mapping.
> 
> Fixes: 531ce288b6dd4 ("arm64: dts: qcom: sm8250: Add memory-region for audio PD")
> Link: https://lore.kernel.org/all/20260619-sm8250-audio-
> v1-1-8a76e033e209@oss.qualcomm.com/
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

