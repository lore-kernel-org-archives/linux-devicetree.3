Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DF537FF54
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357498; cv=none; b=NQzx9vhoB17z5T3ApsogLaIxlhJck8t4/qRIgnNdxpMmRZjdr0Wse7Lp05Q26x4gsbU1nEE4mq/vi7hmQ5eMj9lxZ7qsciOTZacJFpGQYmYsf6WYyGblA2UcT0VELz34wBcroBMuZcRV/IxJcNPwPHlJhy0v0JGEdjxzKjSsiM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357498; c=relaxed/simple;
	bh=iwRni7YET8FxX6xbOUKaSqI6koM88c23NPlbPCikH+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A+E2LrtQ9XyQ4iSwmFAt7liQbLkF8/sYdL5QhRXtAZXoj89pk5Q4feigqp4WtuKNhdyxcCUSQCOObHMqO1QcSIaaiAHYzV5ZUfpBlDyAzBM2on3fJj4UuLEJPShRuqbYSrVjSJvCs03uGFRtSKfb8CrEAX+cguzdCKGMSZkRjNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kpW9Wpzz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y15pe08M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kpW9Wpzz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y15pe08M"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AKP7620453
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=; b=kpW9Wpzz90SqZ4WM
	hJqiDoUJvuIznDANuE893vOdUR29VnKWHPA3tCDdyoZLntSdQ3oUDIbTaAn8RLBU
	PYHrLbPM51jUL1a4LKoM4O9cUpnuCWv0FnMW9WiHlC+CJLzED2GhRv2uP2mfbBqm
	IkGWVVUd0jJ097850KdNNJtP+K5n9I3iOTKjMaRddLFYv/c1kyuKD6DmFKwjUhBL
	s5YVhgq+tKxrmn2OjuMCbD32bHGHIpppD4Cg3IDfu5vJODIpVFhyNZYdy2cHAvRj
	gGSx5H84cmGFtggWpif50tYtl2aYTgzoAIIDJrxleGPvXM0WblTOEbKD1L5sytTc
	W/NgRQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu4da9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:58:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fb98b09d3so19016641cf.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 02:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779357495; x=1779962295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=;
        b=Y15pe08Mej0Klcw9EDZJGrBGsZ04KoHf79WtQefQ0JRAI4zgMnN1U505eCg1lmt41b
         ohy4HpiJdt0+U7b1/9T374aNCaXLjqeA4Pqm1LqqZfKBT0+d1JjQG2XHm94Xxsh0JbC2
         ByLaozgQBUvVdzjRzMrt9jKG9/zTxO7wykalsc0bcz1F16iDM1dbH9AteT9FuU/N3cRO
         PwTnZ415kZb8fGRc7wsnObNhBVutRm+fzm+x0nEhX5vClv03LzDdu5E9NyA0p8gdaibx
         IzeXXP3h2kcf5MxZPHLUHmxLcAKwp1pG8EOkL5f6EtS9lvgQUur8UBGwJb8R9XD61uFk
         zquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779357495; x=1779962295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=;
        b=K8U3wReVMLYXVMuJAj9YEINGZEaOlIJyXWJPDtgXvQxCrclbe71QRsEZznYmR4HOZU
         qQQOCvdIqjbJnDnEXg8rC8psyx7xyxcE5AHTQcgUufO7OuVXBs980KJBUa/VAR1w//J8
         5nYIq8fHQKOH1UFV7MO6457WItDvHU69BErPJrJM6CcHo5RmC7f37+waVmfaensI2rNJ
         ySqFSmj6DXEwH2Dj0iiaHXGu4uUAZ74idUomFdMUaOc5YOO2xHwIPy0qEm5MKPj4Z0Jt
         h/f0PD6eYZ10gL8sbhqV/OCQKcGE6pKIzI6hmMsjuJCoKOgzq7/mRb1U1axtutW3oSHN
         ANrA==
X-Forwarded-Encrypted: i=1; AFNElJ/RNm9k46SjpNA3jQ96qLfsLg7GP1GHOMvB/lSN6e0sF1kTK9Poawa5nBPidWE/hCS1a6eB1U57I/Ob@vger.kernel.org
X-Gm-Message-State: AOJu0YyErLXWXhFBMPkonFZ6CyMtKZVjXLPqKnIwd20rV+ZuEGRQTAg9
	PABMcaZde9OyTkSoCy4Z7DPuvsdsgiBAtATi6RJkKcoKCPB6HT/gElzfsunfT+X5eSqYg0O6vh3
	HSaiTIEHu448x38Afp90O27pEWSRCMjieSLBxgfpJDBj/wfQ7mgOJV7ksdxh4bNpQ
X-Gm-Gg: Acq92OExVgVc55QKXecyqpPqDpUlCd0YbVPNV9iVFG9eruincUBMb3rZNQeCl3ZlcGR
	/AADAGLFNZhIN0Of69tcdkxSotFBwaTpPhbToCpez0oYCw8Rs4aHPRSOqKaExnyShRgH2jca7Ee
	99vH1x2OqWsIFQXG9YksqjBpJat0RqfP1XkDTMghqBheNbE3mQSqXM/tBNDd1RnYJH5P+mll2N2
	Fstp4AJnAFDERI/Ir0Ofi1zexugIFWRA2tkLEzRgwP2piDZWcrkwdXnEbBIO1wZfs3F+ESLaYXU
	KrPq71VF6FRCBfgzgd1E1sHMQeRLOyhzbnaTNrRSI9cZfqzpJw5cytJ+hCJ6SU23ydw1jeR4JAx
	v05opOJTLfkk27lZthnqxNKtT/ikx4AhbCqMWjAW6/i5Akn4HLL+YxQQ/offl7QoPYe1WUIPYbS
	TRFFA=
X-Received: by 2002:ac8:73d9:0:b0:516:cae0:c6e9 with SMTP id d75a77b69052e-516cae0c958mr4674481cf.0.1779357494953;
        Thu, 21 May 2026 02:58:14 -0700 (PDT)
X-Received: by 2002:ac8:73d9:0:b0:516:cae0:c6e9 with SMTP id d75a77b69052e-516cae0c958mr4674271cf.0.1779357494466;
        Thu, 21 May 2026 02:58:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc87e79df9sm24655866b.17.2026.05.21.02.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:58:13 -0700 (PDT)
Message-ID: <d92c5d0c-65f4-4efe-82ba-96507537afeb@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:58:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sm6350: consolidate IPA properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
 <20260517-ipa-loader-v1-2-3c3764c1b4a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260517-ipa-loader-v1-2-3c3764c1b4a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5OCBTYWx0ZWRfXwfQ/u+Tt2O08
 58WdMNCf/qDG9eYTYGPKDXN0RvINlj8BG89Zd/Z5dZKYU+ooeBbnVbqqx6SabtVC8HBi5/cN7Bc
 v8uRVBb8ZUlBOpIdj+lR8fmc9ZcXQrb6PmExcwDbZwCYp7FdVgfVlMHbfohtGVhnJHkgrRLFwgi
 lYVNuyrmpPhfTo3jUL36eqQy1SpsSLbqRr9SZtzVAVtIqetNRbr0XsweX1QkgPmh+RATM6AqhGQ
 41ikKLEngnvhBKmezrNntTtsJHSVI5wPjczlSzDGkc+vqRkqZygIWZ6PINwEj3+6Ul+XFU7r7YU
 19OyzaMyG2qgbwez1mzz7ph5kc9Ftu8A4nn4RMZTDtQzvN6Koj0QkVm0n16JS9coDkC16ZilO1N
 RfjUhn8XWY8FOHxxt+v5fhUPuwTktbNIuQcx9z6FXam+h/oGlSRSeYYdZHzdN0lWpKtgketzqrF
 HFPhAGop7mKxLPiJCIQ==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0ed738 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2tTTa69PSMra328FOmkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: eQ9gOBaSiIY9vTky72A5CFdkB5d_yDFg
X-Proofpoint-ORIG-GUID: eQ9gOBaSiIY9vTky72A5CFdkB5d_yDFg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210098

On 5/17/26 4:56 PM, Dmitry Baryshkov wrote:
> Move generic IPA-related properties to the base DTSI file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
