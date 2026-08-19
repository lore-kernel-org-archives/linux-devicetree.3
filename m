Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A8D3E7173
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787133610; cv=none; b=YKA+KPEfYjZBKv0vB3EAtSMG+SGRBLvm23x9LzsSXY+9rP1/6UD8tw5sboovIEWMdPR/HdYwaFYikYoIxyXxMVdRr+DiNJ5COqdcE64p862tMWxTtZoufAnuLOk6YV4SiR6zBBp/zNgoLhZpVkDnkGtmPI9IAUtLV9OfGG1xWKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787133610; c=relaxed/simple;
	bh=7ed5SxDggbHnFwXIIjFtDKvoWEg9B4r0mIvYhOCSwBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KtM/6e7Hog8tMHQLr59bR6+v3+GigEjWlWrDEsY2f3+h4e3DElCyeNokwtJEqg5CZouBTWOUcOnzz5u9ucbUJT5xRkPKoovvrZHw4kl96j48oJB42JGKHPMjNhfzOWLH8ArMxOEjFXe1jUdCrjprp8LqJUH+y9d7LXiq9Ym2t9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hc4VaF32; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fDr1raHk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hc4VaF32";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fDr1raHk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6ZGXo4012697
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mPoykIfnDDNY6H0zkLiKVN+66mtRRt7IDkAgMoj8KhM=; b=hc4VaF32bDBvZrEE
	UHblxE9SeGkFrYyIMxof1mtCKfxDt+YyJEizAnKr9bnir4v66yU3ZIPbYP7UR/9q
	WzYqbp8z25KrshUQJrinM0EyDMVcE9vsKhwNimDa5tpttEvusWi+RKo/2WTZrW0T
	nEyHChym7fPrQmlAm1MY7AT63Hg535rH/3Sg07a31jRkwYyIsmaP0JFGPRBweSyg
	Dk6kCmd4NmQKIrk/zLhckRQk3iVFraSrIrMCTXn0nNSS/fdYFlPdF89xLWKT0JiH
	1qgzMjmyTp7c2Psv980CCda/BrKHbQ9LdojqeVdi8HoEYHV9IvPdL6DvvzB9+81s
	a8GHyA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmahsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:00:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c21be5bb4so1697691cf.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787133607; x=1787738407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mPoykIfnDDNY6H0zkLiKVN+66mtRRt7IDkAgMoj8KhM=;
        b=fDr1raHkej6HIOxNPfWrrVldF2N/mI7kDSf2cwtMbmEf3ZY4V0qbRaQoZUNm72sQ/F
         9Uq0yzBg1S6pzsSC8SFSqddpMtCX7k9HWdstXNYdGTBd7LjRaumVUsFYMfhVZgwYrPuM
         /+NBjlzv6e9h9mr8AIfgizfnp/eCTNJB867yPtIv12+o/EQ0WKb9lxehRhFYijFJxlEu
         mtl5Ib/tkFrMcvaTgKaQ2ICC+MA4m4Yni1QylkoqK/AzKHcgXfNwJPyf6Sme83pKvndX
         gEENunNkQZEpo4GTh5t7AUb1AISpvzRiIFB6qa5raKC3siuz5t9MRRNaTPlB0sCGZlQh
         p7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787133607; x=1787738407;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mPoykIfnDDNY6H0zkLiKVN+66mtRRt7IDkAgMoj8KhM=;
        b=l3k2p1GuqsmQUldwfAIw2JyZV4352CWdngMcJCbs6Pr4QoGvqt3lTzyBh3xHZwb3mB
         dmyl8qiaOb+8mtuhFzq8FhQCMJgRw0DIWqINBhshEz1sByc6dSVHuZVcXRnLm6xxiGjS
         OZ3qqCplvaRT3F8JtNQm0ecLCxAfrRtu0uo0itkIl09UH397RGhNP4tIXAhQnWO5/nLd
         YVGOcpnkeRIWtDxxI4WWune0//TM529jSJYhaJY5pdLmPwYca+yBVUBKF7W8z4+1J7gd
         NjG47Zvd8jYIdBYtte0VlwjmgP8K7OAsjhMbkieuAwFMOp2EjjiDSVOQ/Vfht8KXXPLJ
         rY/w==
X-Forwarded-Encrypted: i=1; AHgh+RpDFDzTtgcpm13vIJyyb5CtiYoBk7wHJkCUDtJU34HXBdCpc0OsZrZUQ3u35nNZL8DlIax5FHgvsZFT@vger.kernel.org
X-Gm-Message-State: AOJu0YyN/RJr38BEmo2tUjCPS8FTsGCelLOYbhZrK8JPpzm/qDC4DvaP
	mdaKuMOiMF3VZdSa2utxnW54saD/b5Jh84fj9rab73AltivkTwhTvDYLtFrY2MIfwj8qka5Uek8
	jAsLbZ8LcCCfMivvW/GjnCBXUq0xGUESpFuHkbVuVzAnu6pVAoT7SQH8wExzffVg9
X-Gm-Gg: AR+sD120WtYpiP1LG6cMIA4n1jTqiZbsPTSWEgQ8rLnBLJmMboqoJww3bbArg/R8tnS
	eEx8C4HO/V4PVqsQasfLRBhyWVcTjEVvDRzb5vbTdTDJdYJ69c4OGcG70SHAvrtHVNBfXOKG1UU
	CQsHQ8eD1NGPwMCiIDVDCSYphgDyKpDrZ4/2JC8+8mfS5ETjGCSJYl4Vg37GIZEc/ufAg4MxRos
	bvLrjJ2B2S1Z0I++NrO8kQ4N2F3OpxRv5fWNRzBQgfjXaFNB5dnBCG7bvNURvVz84WoxI6Fg5GB
	/jfnaqbqzxF9mYgt2PWk+crM1AzMg75BWaPXIWy9B3wYCFjcO+ptD6A9KAheVWcif8KZ63gPtNZ
	u+fK1CrFMJVusKPptNGfIiu41
X-Received: by 2002:a05:622a:2d4:b0:51c:2324:666 with SMTP id d75a77b69052e-52dd5e287c9mr22891141cf.3.1787133606384;
        Wed, 19 Aug 2026 03:00:06 -0700 (PDT)
X-Received: by 2002:a05:622a:2d4:b0:51c:2324:666 with SMTP id d75a77b69052e-52dd5e287c9mr22890601cf.3.1787133605825;
        Wed, 19 Aug 2026 03:00:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0d362dsm681978a12.12.2026.08.19.03.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 03:00:05 -0700 (PDT)
Message-ID: <ea250ec4-3962-4de1-be39-acbf4b8235be@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 12:00:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] irqchip/qcom-pdc: Add purwa compatible for PDC
 secondary mode
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260806-purwa-pdc-v4-0-62467f4b4ddc@oss.qualcomm.com>
 <20260806-purwa-pdc-v4-2-62467f4b4ddc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260806-purwa-pdc-v4-2-62467f4b4ddc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: J2PZBLpHtD_de7axf82Ya51Y5DExORx6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA3NiBTYWx0ZWRfX0ct5CI2QUDdN
 1ONczbg9WMtkDynvyCht5pEDK+MX+t3K9JvsPU037FrMlFnpYDuqHTbChl1L73INRJXkVe78shd
 L3a97epNByjS3LSMQ4tdA6piUEw9K3E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA3NiBTYWx0ZWRfX8Ei+DWdSS1kx
 aiC/WbME59BlnVjDSlNiASA7ujv6cYb7srNsJkvmWLeAgg/i73KcEKEiWAiSUNk9hZLGLaMLG7j
 Qk4nZ91yKqSgpbU8JRMusAOe6kGzrwNRMiNXmyB3ezxmcSZc2gKaEMmKynBE4jdj81z/GpZ7y74
 AEeEQTNu+ac20s70tAEHkri31UgNS6JAcEyU1Cj32y4/WoTWnmtGvLjJDwmFz8MVKw6MXCBgKFO
 381+S9QRcEdGp1QWd88mCGHelkaOG5Xb855qmfsg7KPWlq2WSU2P/BEgC/t60ocedloBVRoD/vj
 BUYIn5rv/fR+aorqxQ+AFM0UDYSRD2p3FhMewtVWZVYPtthVB/nBV0632K0K+koJT608aT/WBcU
 SUFkYqpBD0fgQqAMLWldT/27xW+hhGDo33xdzuAvzuQUYRmEd++q/Bvvpm962ANqsd6k0mZRtWt
 XDeOX+vCcKvM+fG4zuQ==
X-Authority-Analysis: v=2.4 cv=aNrAb79m c=1 sm=1 tr=0 ts=6a857ea7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=b8JVUCK1TJT_bdoyVbAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: J2PZBLpHtD_de7axf82Ya51Y5DExORx6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190076

On 8/6/26 10:56 AM, Maulik Shah wrote:
> X1P42100 (Purwa) and X1E80100 (Hamoa) shares the same PDC and windows
> firmware sets the PDC to secondary mode for X1P42100 too. Add support
> to reset the PDC to pass through mode using qcom_scm_io_writel() similar
> to X1E80100.
> 
> Make sure x1e_quirk to workaround a hardware bug is set only for X1E80100
> as X1P42100 have this fixed in silicon.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
