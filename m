Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6D53AAF6B
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339245; cv=none; b=p3pKMhEiDaRcfTPb24+w+jibLOukNxJ8dNFJqdDaBo6ntAiNpJlL7/OcfMiFMTbr0D2xuD04gfOLoQSeJhSDyva1YvVNcfCvYuGBTFDTYOgDWlN5YESua1nIUhh4cvOP0m9AbY7v7czKbdqHKMu0Br7MC+jIfiET5Mu/a3cZlTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339245; c=relaxed/simple;
	bh=uusaHKhdZOOIa+jdubg/4lcDVO9Mun7Egkmmk4lZfXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7SBOywA1LbWFFqRjQQfF0jOz1GEs/xAKQMoO7fK0upARpJ0xeDj5e9jCb/gpSDBRCGMjz4xXvmKaWyg/qL8xrHKzhqhqQGSuVWwyrahMEitwjcQM6GIuUBp8OH6EpMJ2qy4O02v+7ZWTQexWLonIA6I7yIyO0/k9AsJEOQbqN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kwCMMNCN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PxDLparx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kwCMMNCN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PxDLparx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF32ie2357627
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QUnH+rERyXcOOevFVTmjG9tv
	hkhekENrGxjVVTyR66s=; b=kwCMMNCNfZnAf8pOQmuZW8mEiYknC552j6RhMaKD
	QXbtrnsTBy7EJkGrp4cS3030eX0kyMc2YW166MHlRYIC1mAUmvq0XDJ06OHyOp7I
	CYMDK4gZXqTeIUAuOEdwc5/eNP2UBCRsPkM8OIKcMMP5ffkc4YZLeZcosdHyuZae
	86elXKl2WFhpzbKu2A6A86zZ8V3csxh0usCmIot+Iv2MdGu0Ew1fQZQT2gqN1EQD
	lR4ZvTPWqoWFWH0u7kJqX2xe0DPwjzXxnuaWENzg6/xXjHZe5bKcaYt6rSykmnaf
	dQDd6YLy1lotbwrf1iTiN7QfniDWmdOvFlpw6GgwyIzMOg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqhe990uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:34:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d30035dso9719701cf.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785339242; x=1785944042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QUnH+rERyXcOOevFVTmjG9tvhkhekENrGxjVVTyR66s=;
        b=PxDLparxzLWo5kkqpfMZGnE9tva6fk6i7wV5G/o/NeQGlvgPBs2uYmUAATZCmTbQGY
         YoG3Nm6CBhIQCYi1xMtGqMzOO0rvNOFk3THZpgi0GeuzfM8zLmlbRfYmL9S2tMq5+lrQ
         wda9XBozJ/KysWhcXIhWzp1JL+4wunYC3vXrE5p9csRWC/lDTcJ+WR6yroxCuF2Upy2u
         o2rVXDHWSTrmnPvGleN6n0IDjZmJREhsRU23nkuM/dS4KaEatVIo67EYPqFqbgzX2uou
         nUN0aLJbiEMI1wepG7exUP8ncUPdobieGBLvi0z3hIqOxcp7Zo4rxl1OHqXQGpK9LDdc
         W4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785339242; x=1785944042;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QUnH+rERyXcOOevFVTmjG9tvhkhekENrGxjVVTyR66s=;
        b=OKqqvs8+OwJoDsNlV4loMMMUl1pZxCKeI0CPfuE/oER/s/tXbnoevvgH/rjZcyCpDK
         7Nw4hS6ZW9sO7HsS/qClkcnKzMQqLsGPtxX0DqJXBzaePM2i54BgirojvJ0pxtr9aVkT
         cJ9ak75BBcngUZSADkpAHsBee1oNqrkV8B1swOKnrGe5tq3sXWrX9yhlekcJgZh4KeWg
         ijkFvnk8wkEmUkkdJ7cwZ/PjztybmPMY8wIZ7FWdN3TmEcNl7e+cokNoQsmfz8Y1LVYS
         DRN4TrVYIETDxZPgLdQ2FB6zblmfWsJgzZEWdynvWfL3FBpoOTu9T9H4kIS91Ynn7ElW
         qLgQ==
X-Forwarded-Encrypted: i=1; AHgh+RqiYSNIbiHLjo7TXEfZE3Vz2uIudQSwDUiCKsATqLCB/bpjT32gB0gLcxwckzOyl9TSmlypm/JRNqpF@vger.kernel.org
X-Gm-Message-State: AOJu0YzWGfNsjuC3vMO23phPhgFlDRnL4OCFuL9rcaonlc44fRl0GXPV
	mmrbvugf5b1FTTPrZVhlNTSbyHSmoPOGpkZHmogVXK8KC6JbPtRy56eI0nNJQkAeTnyXVdHrGMt
	O+5QZ5MeYhNmLjNuu1+fSM7Qyj3i2ibTS+TtB666Wnb+EOW48hqsgwnfaPmKEEu5v
X-Gm-Gg: AR+sD1250ch+EarcIlm8Nb7HqNl3jvoZbqjH3C7cYe3ajbo8n95nNP6fkqYp5lwlAtV
	vMskjsEtbCxn4vzmHt61PWkNrvYba443YQDu+OpuZZlVJIolFL3Q9NziCQkxkIoHav10ibfVXXX
	QlflmEwccnmYE8hAyeDjnSQCZN+xcdyvef0Vc4SHD6L1suihdi5Era94caAtU/GHk8gsksEYNYw
	92RYF9xQxKCCat5ua8IZWx4MRxGNQoHJLJwpJwgMeorBsMubsFKDSQoQF+44YjFDDgsBSgrrJiR
	z+9A5ls6Kofdj/dnRcQFA9ESFtRQU/UkUkIqg0iUZdZ4DZXXP7MCss/xZ3cCVL35HXQZZai+ePe
	tywN806L/KvpPWeQ=
X-Received: by 2002:ac8:5885:0:b0:51c:640:231f with SMTP id d75a77b69052e-529d70d6591mr71296491cf.45.1785339241875;
        Wed, 29 Jul 2026 08:34:01 -0700 (PDT)
X-Received: by 2002:ac8:5885:0:b0:51c:640:231f with SMTP id d75a77b69052e-529d70d6591mr71295911cf.45.1785339241231;
        Wed, 29 Jul 2026 08:34:01 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3b1csm9218589f8f.1.2026.07.29.08.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:34:00 -0700 (PDT)
Date: Wed, 29 Jul 2026 18:33:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 7/9] arm64: dts: qcom: eliza: Add GPU nodes
Message-ID: <gpqulnkjhpp3oqin3xouxcyytfpnaw6bckmmutbzdebfmnrdvv@ylnrzbznwwcn>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
 <20260718-eliza-gpu-v2-7-64379dbebd7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718-eliza-gpu-v2-7-64379dbebd7a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfXyZqkq+Bl1WqT
 rs9V2kTrNhzxzXT5vjlrcUzNlBgjHOvLGfoO742QIDwrkCc/1JcQlQZnllqb/8+/OtflASsv8N0
 s5TChUgFth/PQ4hMuylqPDpj0QWLrY8o0ioauYdosctsxrUGnPY24k/+qCHYTHDsaxCnQNivhtx
 ZPJwZF2ABl1LncPvXlXh18iSYIK+LXrkuuMDLXPIYNxPwelYcA3zF7fi6X+VAh4JxshsopFTJlq
 W5Ht/XjQZdFAgBjFlqwjFcJlhZYp0KwIgpCDuoyt80U8xtuDqsxlw3wRL+WcsDgldB7zPh2suI5
 MR2LB4z9yhOxmS/2r9I05tekNqinwk0X7PJ/Q5VPql1Qg7IDsLwWmzF/WV5j8eVNPNc74uPXNxW
 sDtPrAGUEbycAZqVRqG7AAchfPnburKJits5poAIuy6zCCy0n0OwPeKmFaoWFqldDY6V7LaHAyq
 PROu+cDPVxFK3kuvzsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfX3dtaXMMstvhc
 jbv9fEWMZUgNt/+umwXfyYVMJFGG2ycQkejFUMOCFT0WBL8FT9K2OjdNDeV101qzjHIgHrGNyLD
 jhSvl/MmA3miV6JQ6pYI5On82IGdZCY=
X-Proofpoint-ORIG-GUID: fsLSgOYAmj9IEJhcf_22jOADLuQ_Elbu
X-Proofpoint-GUID: fsLSgOYAmj9IEJhcf_22jOADLuQ_Elbu
X-Authority-Analysis: v=2.4 cv=EsriaycA c=1 sm=1 tr=0 ts=6a6a1d6b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=LzKdWfoJb4QxxMUDPeAA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290125

On 26-07-18 02:11:32, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> 
> Adreno 722 found in Eliza chipset belongs to the A7x GEN1 family. It is
> derived from A730 and shares the same IP-level configurations: HWCG
> registers, protected registers, GBIF CX registers and gmu_cgc_mode.
> Major differences include lower cache/core counts, 1MB GMEM, no
> Concurrent Binning & LPAC support. Some of the peripheral blocks like
> RSCC are from A740 that resulted in updates to RSC layout.
> 
> Add the necessary devicetree nodes to describe this GPU.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
