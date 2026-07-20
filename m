Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E97431E67
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 21:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784584738; cv=none; b=f068WZEI+jl/sK2WBJdlrqUvV2pE0N7+94alDt35KPcL4pR89nLCZVlo2Yu+jwvSTYXtiuOE7Frs3vym8TLFw8SGRD6tv2a98nzlJnD+rTyawBqk1UX4uRJrUa2NvX5GbvO9DKARxNmAi58nfJB2OmzECBnoz6ahB6uR4QA93ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784584738; c=relaxed/simple;
	bh=nnXMRDXG+C6GKw5pZ/mSE9jdYqsRmUdUtldszivo8YY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdRn2YERLMjuyXvPxGtU1V/HupFIocbkgFIsIrYLZEse/LhVzXlHTrRm2CEjF9GOHxH7JZg9EjMU7z3SCZfN+dqQ18ZF94+3n1O+BgalbvwWAdoYSI2IonW3RT17ZVGqDBR/FmEDA9VE/rQZPGxdRcFfjwX3ZjEOlaVr/Yw30eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mOv8NYKa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gzt6UnTk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mOv8NYKa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gzt6UnTk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTnOQ3599212
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 21:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XXSQ55rES2MHDQrNC+JjspNL
	EwkMWvyc7txH2rTHa+0=; b=mOv8NYKamXigJAGFQTRQFCGruV/1BWUqWg1TbvZr
	68o/e7Ab9mD5E5yBF0sVPrFrl6unEiRf71iBUOxgiDfE8UflVp5gZM6zGVU8scYo
	3NOH+H2De7uraCbkGq/ussh6WSr6G9CQdakPgX97rRUEaABsA1DLYR3eylgaX2bj
	eQLBfVNK7O55wWgeXz1HdXgd4COJWqGOcZAMrzRFXQKcPojYjv2Hp2H56a4wvw5F
	/KeszZfRyBDVezS64V/OYbzk7rCj62Rxj5yV9/+6grhBpLtW8YGvp39YsAopsfiy
	1hkuQcanpufOyywf7R17imRh+P3JF6hfSxDLWN49hyL1lA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgrebbkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 21:58:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0ab07320so150674361cf.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784584735; x=1785189535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XXSQ55rES2MHDQrNC+JjspNLEwkMWvyc7txH2rTHa+0=;
        b=Gzt6UnTkoaT7Xduy9w51TZ45smyqI7Dm2Xo1U2vWpG8fjGOoPR0RRfgqRC7PiJJeut
         K4NbSjjNVSmt8OBUn6rnm1LMYwHG1+bYbOS6NDPZGGBt/B8m0laDxojA9hbb7PBoTjYJ
         lPE9hH2l6YGnU9nTXRLtADlMSGBxVROcKgrpLQySm/ApeFilG3kjkxFE2pu1PchrUkJD
         IS0jA12dK8rOjEVxvgjsDtjZt0YwwfLeUZ6H6MzxkEiVjCa059P82+5zIu9qK1/6+8VF
         K10Q4PkAzxDmNmF0/nmvdYaTxOCED/8FZRuOsDGq12GstPMiH1gZi9J8iKFFBWhgPSas
         FFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784584735; x=1785189535;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XXSQ55rES2MHDQrNC+JjspNLEwkMWvyc7txH2rTHa+0=;
        b=OVnBepsACLnnY+EvSg/cxqbUfxUCJmTDeOS2pF5LolT2DJoDZ1L97Tsw8ozKJK0a2/
         DG8UV4WboudVqQCC1qvb8y/r5HqLR7YRKbs4UZay4yTy9wJDw03kL6Ij8HbPTQ5qN/yv
         nQceC57ykKSmOhyqjKE5k6goVRYRWIiSHyym7BzK31eiVENI3+EKlTMkslwq+HTk8v4v
         QwRyvIjCixO3bgu/kEdTs98wMmNIYDpdIJMzmpbCEOX8d/jkkqfKjt2is5f01oGSswZ3
         P9RY5c9V80HnPBLlZusjmNP8DNhK+Jydm7pnv9G/yqn7mV9muOYmOM5B46Sbf/ltfRgJ
         zD2w==
X-Forwarded-Encrypted: i=1; AHgh+RoZcDlCPM/9BLezJu+PZSvTCPrF59PDcmvWLVXTa022d5SQGNX/pmpefShNfz4rlLpEk0eGmO2cN+Xz@vger.kernel.org
X-Gm-Message-State: AOJu0YwByLoGEtH4XuDl6Gwl6tIhFUg8pdtojQVuJ4TWmvQvdqWOFmVt
	rV7tbhx/13fPaBkfrD2xqe5k7rKHfawOXlMm7uZvMMeI9Lwo8kL8rj5c8N8rfTuf18xRrqJn+4t
	XDL6l2Jv+sFkdJqjm3TGS7djn6ZSiJcZ1VizO4ryStGUz/2NJxreZWoSBv/et0SNr
X-Gm-Gg: AfdE7clmLU3uh+/RzbBmKpy6mVBNlUX21lRU0Qvz4iiyCQtobr2OvJucAmdTYVJGsX6
	VJwXIq6qN25jHtRWn2/qjp1rZi4J51JmcrBWTmry5YZoMdptzvbwrTBLJ7pKyNRVMJEP8pjEu6Z
	09SgcF/nIe9QvS7sMbWR1GwZiVuBy5LPWLu0wF3OVVqnneJrrv6lrNct5LA8CwN+MYXVfL3w13x
	wLzaXrPoy9AxhSHcvevSipbD4dAspScdTeFirzuvVvhm/usuhWSbUkic7EfjNePyPqUg5gkYsiS
	Tq27NLAATNA5hhCoCccQYKsSa2zPTgXYcqw6IskFbJHL8CV5OQVDvAbdtUF3ovnhRbW0eXTnrg/
	2WkXi+ZVHhOZSO6E/kRBzoFLYEaqu93tI+j69YezIox0UBF3b04hf08tSpG7QfMPy8+LJUucppI
	1fCuoid2VGrqk1lw==
X-Received: by 2002:ac8:59d2:0:b0:51c:7b12:5ff2 with SMTP id d75a77b69052e-5213d7a6561mr143559631cf.78.1784584734756;
        Mon, 20 Jul 2026 14:58:54 -0700 (PDT)
X-Received: by 2002:ac8:59d2:0:b0:51c:7b12:5ff2 with SMTP id d75a77b69052e-5213d7a6561mr143559311cf.78.1784584733924;
        Mon, 20 Jul 2026 14:58:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e245e5sm2554800e87.71.2026.07.20.14.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 14:58:52 -0700 (PDT)
Date: Tue, 21 Jul 2026 00:58:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
Message-ID: <ddvifgm7kbklhypg4wr3wne4d7xobdnxgkv53x7kgjg637ntfj@7vpovixvmz32>
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
 <20260718-b4-kalambo-crd-v1-4-a1069b5a2757@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718-b4-kalambo-crd-v1-4-a1069b5a2757@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIzNyBTYWx0ZWRfX1jxzFyZmh3oe
 5GeXkWBXyNuHtDq5/nGdxon2ipIM7boSxIWEwIosIPTlEMz6LbSFvsCreWWh5fxrDmX5RZCcvcu
 k9jWR14qq63Ept5Ti/vtnjyhoRgtlwY=
X-Proofpoint-GUID: 8NZAI3TEoycltmycemmm3ml8H2ucPtwv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIzNyBTYWx0ZWRfX5Ss+36NwzBtq
 nRp2S1rfGsHZGjwyMDMVq+9h8ya8Oi/XNm0m3bjSbqGuPwnwW8Ivk4PYd8hiQ7BXK+G1Gt8quUu
 LT0PYIc8spTWu3Yc9DTozQ2pbq2+YYowPOjUXJjhmxh7zpPeIzKWaVi1vt1ix1nREKwqw+lYBBe
 hfMNyHYD+O+doirTC9OS3T+XF4SHxV0uIdrkesemfgtJm+XyoZY+wifFJs00r/akhgVEVNgdYdk
 odol/I2Y60/fFw86om3RdmWb3XQdUzjlYUAsI+bGIo/wwjNAHd5FexFP10YvVAQRPjwfnc+3NhR
 yC198/4HMvs9wrBXIeH+77IvMuLe8lWOo5nBCl/a3/Qf4JlVcMxycBDbE9DHa2NQgkNweh9PrTW
 IgHGaH/E5TtD0IQtEjoUsqUsy+GRpU/x3GRzDfDepaS9GolmFJ37+6vjLRa9cu9vHdAzpwiPuqz
 vRtofSILH4STtt4gFmg==
X-Proofpoint-ORIG-GUID: 8NZAI3TEoycltmycemmm3ml8H2ucPtwv
X-Authority-Analysis: v=2.4 cv=foLsol4f c=1 sm=1 tr=0 ts=6a5e9a1f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=4_LmeBUvQ-T7zM7h5YkA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200237

On Sat, Jul 18, 2026 at 05:06:24AM -0700, Gopikrishna Garmidi wrote:
> Add Kalambo CRD board to the QSEECOM allowlist for enabling access to
> efivars.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
