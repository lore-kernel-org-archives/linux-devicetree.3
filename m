Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B023101A6
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778681470; cv=none; b=Tm9w/II6+YTauI+E1V/RsPLvhSPcqdYUnE4J3LaGARUq5d0hQMR2hBBv5pltc1L5xPJ67bi+RANoa44g8vEUO/0AXSPzcob6MoGkORKegEU5jLQqTdE/qHnsJVC2K5o+QfHihALCqWAEsnCExE3gkawcBzrf+N580dRg686BzEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778681470; c=relaxed/simple;
	bh=jWE29w4nh1ds+QkDLiiY5h+gfOiFbhOX8+ULzkp0trk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VT/c3vVVvexaqWIqHEMACcf3SRhk4Gq2855Z/eozIsw74peep7p9SSr2O/upoHvTJURiLMAlePGfKtQvjQETa4bXfMLe6DSOt12TbbaIIWqnIl0bIBZurAJcEdT6w8uDSG2mi8CWWgXXhStNPPB83WFBmRaruF7rzWp4+kr2O6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fu4TBP68; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1l6nbjX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fu4TBP68";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1l6nbjX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DCGVkI2965201
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t8SLqEZHWB70SufbsgWahPyh
	ySxOVNvIZVdCxL+wGqc=; b=Fu4TBP68CspN4MooDApKnRAVoNX/vS5Nyv8FI1iu
	SoC9IItvqWaKJ3Tzu/oV1Xn/eysEwlnGJsHMceigz0c8rwALfvCgXV0qfvfbb5Bq
	+UfyTcMZVgrv3dmYXJ4HWUGcW2feri6u8cJur6w4dFBwnYSCi9k0G8NWW4Lya0FX
	KizohsduCHo3tSuN0e4M1JOVmX437KH4xWo6MsDkisvhJ4iFjb2tXQqJ59WM46Q7
	x8yV0C9c78lnhorIn2p7svinAifUzL115pQ0C9zPyVyvLjgdDkmnIrolxkHl9q8+
	vdYe6JWgyxDeEcRET52ofWTXOrG6v/uRjXm1d/KuFE5BPA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma59qca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:11:08 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7dccdbdf5c2so9246148a34.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778681468; x=1779286268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t8SLqEZHWB70SufbsgWahPyhySxOVNvIZVdCxL+wGqc=;
        b=I1l6nbjXFmA9UmOUQIvgyDFN3GjTJSB6hAtsXMBJzKM+BQr1+tVg1ZjwEWakTAi4Rg
         Ju+RatfI2FR/YBw8QEpueqi66xhM8n3pQaNoLexGg8TbiShmbFsASOnaDTupTNGAR8sU
         FQXKoZvGItmf9QSsUnIDdkHwXRa0TB25R2eamzjvXprF4R1ne/aigiglPiYMMxlZcSfP
         yow9uSVdevzc9vfSx61XnljTncJdkQ/K0jSxdgmCgk/SD+KcNddYA7/M5I8tm3jUGfZT
         YkfMzvPpJ3C9ltgqqi+HEXoV4dxN/wmz0UYO6H6iW9maGICU+zDXUih0kRgqXsW4NAAK
         E9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778681468; x=1779286268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8SLqEZHWB70SufbsgWahPyhySxOVNvIZVdCxL+wGqc=;
        b=DUJSEU9NilUG89W7ywS5698ExHab5IVMiBU6FmHMBxmkviA/yWL3QzlO6zCnzX6HJp
         3n3HP3XN6V1NFWMNYb3JWQj+vSZebr4gqr77Idv88Vt+OjGbk2K8bbrPVaBtg6hCR3eK
         eeW9tnCc2n3q6yr7OjcXWzi3qi4+oC0W4seWm4llz41jzFFEXu73oO6FDL61d0K3K8X3
         TbQRstaePqMRDXMAb60WfD1nvdieQdNENO74rXEgp0f+JVjw3Rvod10soyEL4SQAomLu
         tbHBHlPc5D+mTeM5jSmOylazRtVj+IwSR3VNbmaL6H+oFzs7EBkJQj8RiBiAWAE+gmXk
         y/Eg==
X-Forwarded-Encrypted: i=1; AFNElJ8fWhNnFCBj1wSSFJuBNDkh4YaehWq8lvjKJ6FvOSvYNTeiaMd2AjBhdfudet3BIaOxyQ8wsTI/PgeW@vger.kernel.org
X-Gm-Message-State: AOJu0YzJWLQwTEvX/WEM4Q0/Tqcza8YCO75KFE7tENpCMFlWMKJ0fQIA
	6PR21rrhOs4+pBqEhnLHgY9Cm8UQI94aFlocd+EpMADR2zZ9d6PKQGxkuyF6FDgt7VnJY61pAeQ
	NCqUYAnE066YjsgMrP3D/hS5KTCuITxXlfNFDopV6iEf2SzgrymAghsjtqeCPE0fS
X-Gm-Gg: Acq92OHGaXETDQH0bsQenfZyC+eLtTisAci6ZysJXDybIH2N7LqIHRSGu2Q6GOraqwb
	QCEhnPw8bqb+lgli6rYj6U5Azn8nE3As+KbtgXxFDLV13l+2Ckt1UHmKjlDwzE1GBkVXsresSEH
	S7ZtorWXhgvTJg5/7UJ/W/TOMSBYEBIh8dV/fXZtMvWHwcHJQw3Obh+Ft2I/9mRSXbXOw6d6F9s
	hW8GKqlA+OvJUXQ5rXY1GHGu817PAAxdVx3YGHqzt3MyFefuLRe8SJQGpGY2D5UWc6fIqKmtPJh
	cP9R8f0VFbovLXlf+Uy7L/RSIqUZA6z44WyFHOCYuRELA8Q2uu0l8pWE5Lv/2bf5v5WipobpRqV
	FrYKdXYCMTQsyX9fu8A6DYpw4k0r2jW2fH4TaHLbjlfOPl2eQGmgtAmK8s1HfuFaHesTqlS4n8B
	/lQL6yDXkECiTSxqMWT5OYjS3mnfQFvTz4Ssg=
X-Received: by 2002:a05:6820:1c90:b0:696:77e2:a83 with SMTP id 006d021491bc7-69b78e5df29mr2043254eaf.53.1778681467833;
        Wed, 13 May 2026 07:11:07 -0700 (PDT)
X-Received: by 2002:a05:6820:1c90:b0:696:77e2:a83 with SMTP id 006d021491bc7-69b78e5df29mr2043224eaf.53.1778681467404;
        Wed, 13 May 2026 07:11:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f18ef9sm40743831fa.8.2026.05.13.07.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:11:06 -0700 (PDT)
Date: Wed, 13 May 2026 17:11:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: qcom: Add support for GPU Clock Controller on
 Shikra
Message-ID: <ke4fzofnylbxtigpmg3pby67pu5kvlut5kbb5nikr5yvpa73rv@gsmhpb5s4qqw>
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
 <20260513-shikra-dispcc-gpucc-v1-4-5fd673146ab2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-shikra-dispcc-gpucc-v1-4-5fd673146ab2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NiBTYWx0ZWRfX1EJD1uaafxWz
 e7hVlmr9cLzb4B9/z1EWLpPTlKS8VtkxMjiFlmHs30weyq2hHuhp9TO+KPEk4ziqyBWSQR/fK/x
 AJSB+EMuOdEbQQ+CeWCMyXdoG+wBEWHY6KCFCdzz5YGs9IWgZnIrJ9bIdsi9QzzhLTRqd7ejSYg
 /03Zuukyb6uNYvK6ogInXj2WnYBGR2SY/FspzKnfbKfh6xEJ8tZoKUUl5YM8XPnvEKyUDKQJ+zU
 NGRT94jxCnxzbvMhlf1/XpvW5snU4UB99pfqJvZv/oP0kir1MpJuDgl1hIbGWos2VDL2o0DnCau
 AWrLEg+zwWRUMGjU5ktn3yP/14PU6G7GuvYp0ukiFP6Pu0H4x10O8i/kyIs7vjzodnpLk3VnwDw
 cRURSB9M2ostu2O/ti3mNU7ACJnLPtazexSNtd7gSviu4Cm+rK9nHenhcbMx/Q9B7HtdnXDmEf2
 3rsV+cH11CpDzZwqzjw==
X-Proofpoint-ORIG-GUID: 601Q56VsEHnRv_vWA0791Wasxb0mh5vc
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a04867c cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=qXpo7wsCot1G_wR8kq4A:9 a=CjuIK1q_8ugA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: 601Q56VsEHnRv_vWA0791Wasxb0mh5vc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130146

On Wed, May 13, 2026 at 07:10:39PM +0530, Imran Shaik wrote:
> Add a driver for the GPU clock controller on Qualcomm Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig        |  10 +
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/gpucc-shikra.c | 406 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 417 insertions(+)
> 

The same question, can we use the one targeting Aggatti?

-- 
With best wishes
Dmitry
