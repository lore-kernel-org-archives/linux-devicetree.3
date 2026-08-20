Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB5C3DD84A
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 08:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787214760; cv=none; b=ZUCMi1alDuXALZn2516lfxDMPi+7AtkcnKxQBadMpl+veyuRDwzLviVdfY8jn0Bud81zVP79/YQugwU8PvHgBHKOgXbeg2w49PLRuCeIvCTmoA2X8yHAqNxlEDwNWfeKX7XjDXMUpSn0n07CL6klFZgIgVY80Jaik50Oqe8SkvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787214760; c=relaxed/simple;
	bh=d3uVzH6+MZpEgvBkqjCnKeOHu3+EMSSpR9ydtLT9G3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttZICfFfXZZoZPZChNNCMtdKYlIFdvwRyzxj48QoB3+rFI005EfQfYW0uM32g3wNQrYPg9QP3TAJ+UCUTbG6UdCWl/3KY1A6rVMu5RyqxAb000RrNvqjm2JuROMw7Ms9224x6+eU9/TgBG2zXPU4sNINkkYUHVoYqM9Xd2Oqh14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NWrcYRLJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ew757NU6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NWrcYRLJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ew757NU6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8KfB91680221
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 08:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NMhNcVIIev9w418/r1jeFcQu
	gt6ylFpMeNWt9381RdA=; b=NWrcYRLJLNyggHIjakcSG93Nat2PXJx59zxeFsjF
	7sGb8lr2GVZ6MwcFLvYYG3LEDj0p6uGrPqBdZQRney2bYPrdD8FEcDpIkjsFwJv7
	v61Q59vQQYg/2gAgQU5Sydoqq+5hf7RRFgmmpSKLWfuP53WneKfpORkTrTZXCeQS
	LwkNcHBrYf8FTlKfNrjVqwMaoqUulBJYjy5UPH3FAipZTo14e1eGg84HJjGN0OXY
	VjPu32n0zBYCMlJvvX/SnhiaVZIGoMVXGfdEb8ESJCKlTxKuLqJSwrmf2DwvKqzt
	7V+Istps+oGi6dVnMPzh71gcmB1JqS/JeGFw6sKNvDCh5Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x05r1aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 08:32:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e62e3459fso226469185a.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 01:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787214757; x=1787819557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NMhNcVIIev9w418/r1jeFcQugt6ylFpMeNWt9381RdA=;
        b=Ew757NU6suh1q75eWddAuDg3pFjLn0wpq0iFK+e/InoPtVd9WRKmSiYEXP9HxSZybU
         NwTfxIecyW4hq9gOeq7pCcjc3fDjcGorCFQjAG0ZN+nv22vbo/+6NJ220DOLDBltZiIl
         Mac3qiRgDe6Dn9tvFXGe4GpTh6Eceuv3+DLkToKq7OTQgKrK9Jn6l634ZM8aeXjxatUr
         GJ9K9WrNpNevkeWCKlS5gVwcc3IdWRAb3UTYhKpkngqJl389gzAqZgCNMvrxFUfrVi0A
         UtIOYkLjtmoLVeylmFZQWlm+M5MDtdvfYDBLwoxSNPRaOu7zDZVA70YDbuX/o5wxxDpz
         +owA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787214757; x=1787819557;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NMhNcVIIev9w418/r1jeFcQugt6ylFpMeNWt9381RdA=;
        b=Ey7DcODfBPY+7YDyN9EcoMht+cTXwLmqWeViUfTR+x3naotN8ycbq4hiIJD1ICNf2U
         fbI2Q6nDHdK2K6efntFLoBOPVxn8AY+cBiVfRsB+6yezWRtNon/TbMQVZ3YXZSeqdSx3
         /LSj69CR9m6BlRRbayke+pYGkEk3hLRitTlMN7RIMw5w4Df1++CxmZAT+SWrtac/rZpx
         99L3yTW091QcCePVM/zt6Zqkyg9jSrQzkDJ6w1RUdGciw9NNXZzwu23Cecj1msjX6TNF
         uSKSChP6tGQYsGMs7dFWbWnBxDe5MlKHpIW75YBbnJtsg8TrhCQtlcXmnmWivYeATcNx
         GRzg==
X-Forwarded-Encrypted: i=1; AHgh+Rq5a6lNPzN7tOHH2NFCIHgjUEr7uST5z86ZqBlXAqrKqn3B1cet8lnWn+ZMgZcYDw7Jjgm/mN9V6hq9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3jdPs+VRwe8yFo6X68+L3XvJHRqAeOV2T5AB79Mu/mz5lj1B9
	CC9My68V819qpriF/XWnj+GSZ5simy0oCUY6a5feSuY3tWjKxAv22iP2uiGbdincXWZlccVrL9h
	RnKEWYdtODEoEfI0QH2vwDb0QV0IkjmGJ0SpTDFqo1Yvv99qgCzh62+weBSd1kvWp
X-Gm-Gg: AR+sD13MjfGZtGmOHq2n/Ze+AZf/GpoeV+4gKxFxBLU1Hyojzjnrb6rMAlzC78WvdLP
	Kth+7gc5piHsj8nK7NmRO8I4uRTO5bhMrb8b6rrt5UFIjRdwwLgTiRA9pm61zNW5tXu+95fgAdc
	3dwe3WFQeUQxLMUFDwszEWJKA1AVSWgKatfHWNtCPYz/xTytgTdn4ocDgEjTE4SQpPBUx2lyz8B
	Voeyr84hquNwXIAxg5wnBejhLcTCSeKefrTbM+XfS+xsOKO0iSEcUyjnidC8GVM6+e1nC3OQesH
	rXPwDE2bQr879sMN/mjNXpFvyULSZKSwKdVWzREB1XsriXA+PZugl5RWmATfIzdWzzFYhARvxYs
	zy1uKDDvd/Rz0sTQ=
X-Received: by 2002:a05:620a:414a:b0:936:bc78:791b with SMTP id af79cd13be357-9371e2210acmr965403485a.15.1787214757301;
        Thu, 20 Aug 2026 01:32:37 -0700 (PDT)
X-Received: by 2002:a05:620a:414a:b0:936:bc78:791b with SMTP id af79cd13be357-9371e2210acmr965400885a.15.1787214756736;
        Thu, 20 Aug 2026 01:32:36 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b20a14c6sm34410875e9.0.2026.08.20.01.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 01:32:35 -0700 (PDT)
Date: Thu, 20 Aug 2026 11:32:34 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: agatti: Add memory-region for audio
 PD
Message-ID: <wyttz7lpgasuu2pxt5tibxbpq5eeav3oyezudousw2pvji7ub2@3odnelomtjaj>
References: <20260820-agatti-audio-v3-1-47337097ee53@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-agatti-audio-v3-1-47337097ee53@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: TN6blJKBex5pNVaBNY8H20H9-uqNztC7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA2MSBTYWx0ZWRfX1JxJk1yBx+sR
 jMvJScJBptPMk8o90BUbQU1P0b7eyUtJ+NnuIkIA/YV03ohDGgX/CF4sxA57F0O0Qx3lb6+6Ka8
 Y3XNp+5O3/5QwNlrTxeCjQqHFV9gSMiq7gdg/NxuxfKK3wO44XeVfIeHXNI4cDlRDFQV2GPtGQ/
 3/y1K/FFqxbeKXL6ys+WL7gZba0fpjcriP6OqmIpPP0BNnuX0DNTTIdwmdCW7yYz552i6EE5V5v
 iiDn1ccikZEJrV+GKYv95pLLqd3RRv7ynw6dwnghtSkl+qqPPdHnE3nDgnEsr4WtcuRAmgzUeM8
 ODsCN7koLzI6I8q56gb7K+5yAZvYAEgqphSBbe3Mdvc3MTPAJ56jyj39xhj97m6odJUOHS9fEOM
 fHltV62PHT2iZlGUn0HFsXIWGthGGeKGfLbIw5I3BPXyb5uwtE015CAe31n4scKY0FH4ynE4Uv2
 jd0VnofjyEkIcVJTgTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA2MSBTYWx0ZWRfX3jnXRXY6TdGM
 1vNp9mhub6P0cTNhleOseg7qZJXQHZucOPaetF7m6USPrr+d983AV0QNtQnP+IxHzyhjt7BoaPX
 I+KXrWQYCSoy9Cp5rcDVZwUKRamHR8M=
X-Authority-Analysis: v=2.4 cv=VfPH+lp9 c=1 sm=1 tr=0 ts=6a86bba6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ev0zJbSacn9GrfYhrHkA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: TN6blJKBex5pNVaBNY8H20H9-uqNztC7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200061

On 26-08-20 11:21:28, Vinayak Katoch wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
> Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
