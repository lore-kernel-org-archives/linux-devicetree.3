Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C454236CE03
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249528; cv=none; b=L8454bBUOE6ZgHagjJdsAPGAMiXOoLg3Cvl567jI9yY+qT3zT+oTI+GH3oWriq3LJukWEQir+iIFLSPEcqqNVV308AU49qPs/IusrwZObOVMbqwyvPq1hJlYVWlQdvHeXKGvMqY9ssp12RZ244/r4lia2MobOiXVWn61hBjFMVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249528; c=relaxed/simple;
	bh=T3pJhMSkxWslrK2cMqFWBnYqYWWp3AHVzi92QE8YUFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DsbNLemJumTZpwnVJLiSpljlrFUKjAvTAM3SnJ3e0r59ngDTEByK13nVb6h/Y7lxKRwGSM1fXgMCpb4yS3OSXEmyMWjU/blz0hXQqz+WTdXJjPPUKvCQyTf33ET17CQJgGDHZWDCoAvRrSS+K03IjRgRJKM/82B0wEN/iPiSHW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mPPjoMfO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bU3iR8/H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mPPjoMfO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bU3iR8/H"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3CDcP2534915
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=37tiZOsanjd1N+Fp39afaSRg
	h1QXMtS7eaw9kok6fs8=; b=mPPjoMfOA/nIeTB7be1z3UYngcQpbS2cNw2W8Zzz
	9l+lya/wp/fkyrIb9vcIFh9e2aVjsRZzHsMv36FMApMvUMLhKMUiKHncI4lWO5kq
	IwzhhVBA3lchaI5k91HQGq5aLiVNjzgYlXsgcQdKzmxzic7DsloEVXMyloDa60QC
	wPcatE2uKuFe4a5oKHU0oUjK0BWAtVVOr6pZ63VhXKQYXUT5bUWLj+Er6Oj6wIYZ
	kqdpVoJJHtHTD2MYbYYCMuvUd6SKQSL07Hp9TEMTfYvGPTsb9IOLRDGwK92AlX3n
	mI/uwKiAwxqusqY68Wi5qSjHuO9p84SLncQECeNjm3WTEw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er76eh2kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:32:04 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9661acbf65cso727223241.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781249524; x=1781854324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=37tiZOsanjd1N+Fp39afaSRgh1QXMtS7eaw9kok6fs8=;
        b=bU3iR8/HUY4BwglMU6jI08rOuiM8gkbiLtPVfrXcsGNm1GAUMqmW5q3nhey7BFGMdD
         cwdn0qXItoCC8ExQe3ChY5eSj/qOficbGZOfplxatZWWXsGuBhPLdDFWEg9cqqJ1M2Jr
         p+pHUXXEzcX5EqUKB2Pv08/nFgogSKR/+tid19VDlLLTl6XvtdCYrEheY6fphhO5J8f5
         +3F9SMMyP+LfSGPVszQ22grYChmpgV+LcABD2IJWw7lkIlya9DvR6eTqhZf5ZSpJmEPO
         zQ/DFpGZEu8JcFcqgu/VAXSsvLquS6LnPI/ZOUsr+VPBcEr/KAyqnnjRCw5XXTzhgNsN
         wCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249524; x=1781854324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=37tiZOsanjd1N+Fp39afaSRgh1QXMtS7eaw9kok6fs8=;
        b=XezXydJU76jPu4OFlvmxJsCXdYigfbLNHkfktqj8RSKuF/E2CvBTZH3Ok3ZmeCD3e0
         XRpCvVz3HQxtGxSH5s55rhT0O5U02s3sM8k3fH+pBl4dBtphK628B/7DCU9lsBdjTjKQ
         zSOeGcV6fShi6TBYnCG4jGDeThhwoNqy0vB2etp4KvmvkstH0ZuAApGwBzAoKTMFaPQc
         UbkjJBgnRxr3KOQ1vg38koEGZTahtAZPn/TviprMZw+zbU7qTXDTfEU4kuXbuZuh2H0o
         xYbqEPBEPZEm1gxUDlIRVASqbXWjhAo9whsxJRw7zqeULxzJbpmzmqu8wyoWq43Sspx7
         Lq+Q==
X-Forwarded-Encrypted: i=1; AFNElJ8lwLQbdO7aqOZhzQRjjOKFM2PVrUrfw30AwGtaZaVR+8Ro9StrWoRaITIvMVJrX5ZQD46wYALQoMcW@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr92s7pqTRZ3fM3QPlS7cdV4+4UqXWeBGhXu1WQmk8Z/mdF4bK
	z/L63rHAuOcvUHSbXSr+ruGS0bcB2/bhmlp+2aulrsQPvXBfihtioA6/B5eNmv2M/HbO1egO9fJ
	zmZdx0/vDvtR3duCpozzDtGuM6hkhijwGeGmrkt/HkrD6sfJfjUM6/Y1iC7Juln5R
X-Gm-Gg: Acq92OFBORcCfjne5cRAiQn1hfpikDm/uW4nyweDp38rzb8p0xNIm6EhZRiPKBmTzbw
	WFxz6VumJp3C3993xg4qubGHO3ovlLVH44iWrvtaURHPDHdh5WqKJbnPSdSpvwoOCwoElt0gd3F
	8dDlRbcweI6o/vC0V9cdDWbki1HwhZMwunZPd9Gg3z3kxUZVwf/jqiYySKbjnMp49eARqvPqH14
	kBt9ly22ntOrdOAxDZgvuzZJZL/pc8lpirGq6ObBNd27EBLQtV3VqxVNoCMjRJ3E9Xcyq5pPwvT
	Kr46M36/ukdlor7qUu8xCMcmHgj2QVsbFoRVhHWSIHcz00s7LtwuO/NnH0dKGNOoRCoUnEgD0fr
	ibyDgkGqm35j870c2l76K/mm2yHE/HWm3k+uGIRVWv7i73eTJ8QbNmqwOPpKufYWpCo2bXZOJJw
	7IgI8uBz3f6lXql0siSKfOIQSI+Hw1Tl7BR5I=
X-Received: by 2002:a05:6102:2921:b0:62f:5908:648a with SMTP id ada2fe7eead31-71e88df0a4amr699464137.28.1781249524063;
        Fri, 12 Jun 2026 00:32:04 -0700 (PDT)
X-Received: by 2002:a05:6102:2921:b0:62f:5908:648a with SMTP id ada2fe7eead31-71e88df0a4amr699444137.28.1781249523528;
        Fri, 12 Jun 2026 00:32:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929aec5a1sm4319721fa.0.2026.06.12.00.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:32:02 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:32:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: haritha.k@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com, gaurav.kohli@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: talos: Add passive polling-delay
 for gpu-thermal zone
Message-ID: <vlu7l2vo5jf7bmmnqca3nkt6szbqcxrc3nhbcmimavf6xcmztz@cu44f2ku4iwq>
References: <20260505-qcs615_gpu_cooling-v2-1-1ba42260b29d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-qcs615_gpu_cooling-v2-1-1ba42260b29d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=O94Jeh9W c=1 sm=1 tr=0 ts=6a2bb5f4 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=5C3irSmljBUfJ0kUePkA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: IJewPalLnacKwAqo0tadxXXFvFFtc6oQ
X-Proofpoint-GUID: IJewPalLnacKwAqo0tadxXXFvFFtc6oQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2NiBTYWx0ZWRfX4+hAZmW4TuMm
 LP1ecTX+WW39DLZwB2ySI1o94T7ML6qXnWWmpwgg05XJT7joN4oqwkOnq075/QCj20rQs9Vtrcs
 uHgJODTx0DqRTKeZg0FwQmcoB9RHinMntzDZcrazI2cEfxQ9OL52zSHmyjcTpmTNcHX28keOaYY
 1PqfcFeTC+AcIu5S1XbuzoB6UZH+WEG4g1P2nKYjSrJfnTFiXgaj5mybtgtHNDK8uYV+1wsDyxJ
 ixqN8locDGEnzjTEubCZzZqzCug3B+1alYDt9YFCy3EpYV1CIpsL/bh8dSDy1J7L8wOZkVgTucJ
 Z/vLFy/1M2G4qix24LunEA4gre/EwpQoaXwtMi3mIct2o0pzE4lddgACbWh90dzEl55YK9Oo+xO
 2Rs8Y4rcH2Dgr864EdJYGLtw18GJRNwvekmxVy/ihyLgYXyvgfdzA04qCcP+YmAqw10CwPGHv/Y
 FNzJN7JdUBDCr7F01hw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2NiBTYWx0ZWRfX4IUtm5kjM7Er
 pbOkbONY8t6LAoJMzhhBhE62a6zZmumS9TY7KO74ZsxWwRiusAKXaTxJQ7b2Xqn1yFjNWzgXovB
 QkGbyl93andweae7DJt7o6Y9u4Fnr6E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120066

On Tue, May 05, 2026 at 04:56:17PM +0530, Haritha S K via B4 Relay wrote:
> From: Haritha S K <haritha.k@oss.qualcomm.com>
> 
> Introduce a passive polling delay to ensure more than one
> "passive" thermal point is considered when throttling the GPU
> thermal zone.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Haritha S K <haritha.k@oss.qualcomm.com>
> ---
> Changes in v2:
> - Updated commit message.
> - Link to v1: https://patch.msgid.link/20260422-qcs615_gpu_cooling-v1-1-d5a984ac29e3@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

-- 
With best wishes
Dmitry
