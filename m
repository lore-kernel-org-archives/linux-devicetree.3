Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FFD3BE651
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082937; cv=none; b=FZ9TFJVDrB8UWacH3xId3KQOAIJTParEqCmJNEsggwxhYoG4GYNrjd1qD/MTVumXFU1U/c5TeHobLHOiBXsAM2iT4INcUtInQE0Bzfihm9SHq/JgeT/Etk2qODP66mI+nw5XShopF67qG/kImCkTfXgz5DqITKdhm3UHoLOLRrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082937; c=relaxed/simple;
	bh=hZcomtwpii664f+hVQ0Lm90qeu1yAe9XyRqvPFvR/w4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dzsyt0SScUrxlEK5yeZlBiwbezX8mq6QsqP7m2TsSq5hpwMWFyPFPw3tHQ5LidkbjODodN4BRfKsP+efPDtVmZGyy7y3QCdU0zmYKE2DdcJQF77naXrV26qD1bo5epGNG2F4JOFMSz9ulZZGAQC1udcGwrnv6yuODtGH5Zf4bpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Olvl/u8X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fL4w8JL8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Olvl/u8X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fL4w8JL8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7im9x997516
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sip0dgLR4BGySyHDaI0mFAbiDm0nM9UBC3biLXvy6Pc=; b=Olvl/u8Xo1jmNCw2
	NyNNxc4/0YW99yeRg3V3+aYudCag50TDO4JaFAFSHtrxTJI4PVtMDdXGCfkeMHWZ
	cgxwQtd/i5iiBHftVlJw/17OhciOAnTBGvkzAzMMZRqp97tEzwPpAEuXeYPR/se9
	kugLBSa5V4VbwHMRbtqvQRzShtFLfXopvK3a5lkDpNaz3TbjwAjZEAdrZprh0qd6
	/nBj0O/meHD3eye1jCdR9x8zBDdqc+A4VqAgYmNs829dstfsZ2+GuzJqFAWbHQuF
	XrMjuMVi5O/j5bvQEu2slN6rU/B/O7pXmxy2R6POouIlai1FKEeJzKA+GmBvdnVL
	y5Rb5A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq10a90wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:15:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915a547f4b3so156322785a.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 02:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781082932; x=1781687732; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sip0dgLR4BGySyHDaI0mFAbiDm0nM9UBC3biLXvy6Pc=;
        b=fL4w8JL8zy7jzglE3TaNFsi3jc8q6NO4rKjH92bug7tm9puaGHg2K4qVafg8qtCegB
         MVtBEjcz3xFOr6lKuQMPy3a1GRVVkWbz5JM18inU+pA3cxXcQxK/hST+vbU+CyPbjEE1
         xq8c36rzMtVrfsDT6CCvXv1U6CkAXR/0Z+XYZTq7UvtlcJOa8wyXJN+nB0y393xgWEc5
         8zaSg4FVEwypO9U3gpD5rNdgMaoOYDlxDGxjoJjqe7kWDljCp7xN9994A1I0XqP2Yc4/
         Tg7RMSR/McKU3347j2RkeLdSFVmhwGzsUMMeDckbfvlUUCUedql72m0QU3MGIGmXvNjH
         CMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082932; x=1781687732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sip0dgLR4BGySyHDaI0mFAbiDm0nM9UBC3biLXvy6Pc=;
        b=CzbVOP91K2gXEDDXKmYCnl2Y50MvoMakXi07tSWIlQ9SZrt1cUMiRnW4zCIjR8yKmp
         S3C4ylYmk2TyxmueLPLVomaQof8H1LcM7G5DWzbqPgeVnGZNd3PttBY7NrJppPsnl9eq
         qDgFyayaR3aLzto4Fy1/gFxc4sufdIw6QK9006cgPRSyM9cx5MoEuwKsrGj6OpaauEen
         UoLrvbyTsz1O2ZINW9Tv+psGIeZiyNAlqDT/sZ8elJVggVPQwd5FHN5cHHLsG5o7WsEJ
         CAINNRX5NgAB2sKy4qKQ12dlXXgayxbspf1kfYK9q6m2CIqG9vZOpqfmUGNfN53PuJjB
         2xeA==
X-Forwarded-Encrypted: i=1; AFNElJ/4VBuf6EfUWlnWQgIZxt/Hgt7cnt2weCs6j+3HQ0T/H3m1lqiS0NJwhYTcvdkwJQIK8NjpUEo5z86o@vger.kernel.org
X-Gm-Message-State: AOJu0YwwAj/Z6OKLuTJUyXF91Y2P09RS9TN6Lv0pMDe6II2XnMCnFogu
	8wRFn74beqEHWAExil3WMm/P1ny3vRm0SmP4NpD5UErINM6QhFBmG/A9Es22BCRn9WNfq+QfFxt
	6GLOfel153fqM5Af0rTU95AGrFNqC8R+9DMfPPNM9kciqV3WQXAOJsKbeUhiWiKxZ
X-Gm-Gg: Acq92OGO8w1aY9oLZA67ERK/J6BoGjePZrLuWXCTVkLHK9hoUjkXOL5DKfxBI86ofzD
	D1d5hDTrUwWOo6e/jGmCl/AnZS8uYL4dtNrNF1c0CobXUEo1ryVgKLxK9Q2t4oi5zIZlvw+m8mW
	mTGJysEjll+80ggl7rZnfkTRh4hhbg+mhNyWTuMBX/qGBmrouQ37eah9t4hqr78uLA4snDr94w3
	iFKh/0nCfjBnVoQrXN65izaW5H2pmydiMxGku8+1KqXBfpzf3xyaLNjh2sF3ik7S0jtbUZ43QX0
	lpy+PIaKm0rqATGZqCDQXJo/0GtKAPYYd86gOJecGQ0J/CjfdAN5fSpN1evCo/5UOwYMS7YqfUn
	udhiKmlk/YzeL4TkNeRrE2L7aUu8TK9uYwtcNUaze8q6qtVyYV751/Doh
X-Received: by 2002:a05:620a:7113:b0:914:ea37:6f14 with SMTP id af79cd13be357-915a9c7736dmr2089298185a.1.1781082931828;
        Wed, 10 Jun 2026 02:15:31 -0700 (PDT)
X-Received: by 2002:a05:620a:7113:b0:914:ea37:6f14 with SMTP id af79cd13be357-915a9c7736dmr2089295285a.1.1781082931286;
        Wed, 10 Jun 2026 02:15:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0517712a7sm1153176266b.4.2026.06.10.02.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:15:30 -0700 (PDT)
Message-ID: <6c79a38b-1ffd-4693-b54d-78be24a51966@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:15:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: shikra: Add Iris video codec node
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
 <20260609-shikra_vpu-v1-2-3a32bb38b080@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-shikra_vpu-v1-2-3a32bb38b080@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GoFyPE1C c=1 sm=1 tr=0 ts=6a292b34 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gZ9Hao4PvtIMPGLi9fIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: UMFKsF8LFsfe_Wdj716BA9YNK28rmLia
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NyBTYWx0ZWRfXz5HrOmS3ZDuR
 pzJqtMbQXYREMBEbyMvBc7fZppfe8FlA+C1HND2B/qwElgGcN8XRS3r/G2r6LVU3PKiXTPMcaJ/
 9zrNWwZk233FPAtmaFav5Bp/MmzAbjPqTU9OuVhiRvRupYKBkn03xy/SouU6VJP0cNEo+CcP13y
 wpvbHQCdMRD/HP9J2/K/sUkbDjTlBhgcySTljrU/Esr29YeYGCehaVbnkyMRVfMsS5qr3bGQYYt
 uWW8a25VmJAHgm1W+7eo2n6cvrpYkNzZRl0Q20KIV9ufDCUIFB75FkG7FRkW38ZC9/wp6qLUebX
 DpklmtYyCX9GLVdhTBhGGpF/nJZMcOH8KlUT91O8oPQ9l8ZK5mGNkA3khREMMpE/WC8H36tO4vs
 4/s+khaI1OVIntiQl/Dnf7iX0WgdInFRctwEAsSAf1PMyYiWI731RQdNnMTy1AgZAMiSY9ksyQ/
 lN2P/Z0yhvoxpISCrAQ==
X-Proofpoint-GUID: UMFKsF8LFsfe_Wdj716BA9YNK28rmLia
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100087

On 6/9/26 6:15 PM, Vikash Garodia wrote:
> Add the Iris video codec device tree node for the Shikra platform.
> 
> Shikra reuses the QCM2290-class video hardware and programming model.
> The video node is added to describe the Iris based video decoder
> encoder block, allowing the media driver to probe and initialize
> the hardware.
> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
