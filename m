Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5D03AB281
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 18:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776449335; cv=none; b=Vo+AL3NHZQEtkTN6Ufk8WnWw/nl96XXHdM3O/8evwUUIVtH8vYxycRx1xLO6/aKAPI2Ei7RhlDZQxLU+ZB9kHTrkyQMmFQMShUWMPIwJ6aRhQCUYPmC8H2kf+H+t6IYKU8lB/5soeb5i/c39cAZfj88cgU1lvK9sfj0r08cqfRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776449335; c=relaxed/simple;
	bh=ttiUZwPUDs+ec+VE8ov+y2dVhFjYc01N1s3FIbv4qlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbnSfD1npcRyxd0Do53KUJ5ZyyhOajMjhTnM4Fn6BGOEHIToUZvha4pvJv2fKYZ+aqRDTaEIH4Bj6fYUqci0nZOrFSBjOQ44K1tRFudg6a77KbhsMqqp85mYtfxdBwE0s/xQ2+/pKY5CHdg3cOo4jHC66BO4dlQfT4JwPu5t0Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLPvWDAV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9itKb1j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLPvWDAV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9itKb1j"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4hcN2669960
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 18:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zIf/DYTyho2jmhLk/HUTDnyC
	lp9GQO2z8UG/IsIZPdk=; b=FLPvWDAVg+1cwIKwvpIk7dQdkFkrJaI2nWAorg7h
	lJ0dlUSoLy90xtbWK4wVKnB/h2t5eHoJFfVXyjkhlJjoRhubme0JLeuOp3y7hw+Z
	GcCoa1Ir3i9flbtlVZJ69vTpqUopbD+tjnF3A0YbnviuqblRdftZx6A4R/sXlI4l
	fvVJy6Rb7lY/U/EgH7iaK4+Le9eUmSKQex6PAsQlX5SXK+aTuVFmG4n7uv8F0vWx
	6CHSUc2fj4g1bSQxsVaUa3n9UNo+e+HQ8lk5VDrFY7SAp52mnTFIoXdNuDV5l1nl
	qi8tDwFG37ajTxjdxFt5eVjRQ/Tea4TX1wwCCFCCM5fiOQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkaxcuben-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 18:08:49 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-605664a1046so474467137.0
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 11:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776449329; x=1777054129; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zIf/DYTyho2jmhLk/HUTDnyClp9GQO2z8UG/IsIZPdk=;
        b=B9itKb1jp5WcfQT7RJ50F3H5aRhn5sa/y3Kvgw8Tzev5o0/iiZFJRwLgYZReTLe7xe
         CZ+3xcciYLdVGkM3IrvjSLnsg8IP3Dmvj9UjSTcKtOz6YDrxC6nKvtipugs8YNJc4XAd
         gm6stVFtWXyI6zUpxTQhf+QV/X5wRBfgnOmDX518m1LKgU4fEzlVHT1UO9egkf3chz7k
         y/rKosunSBq7ke3Tj031M9j15YiQAYpvFMlcDkns+olckRZBzGDWQWn3jlWdBUniMHTy
         LUw+ZwxxeP0QodmPgYXAoSRl29YlSC4MbaUzVTozh4GEOr7QwNEOh2rh1cFApMci6i2D
         d5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776449329; x=1777054129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zIf/DYTyho2jmhLk/HUTDnyClp9GQO2z8UG/IsIZPdk=;
        b=HnPhjxHsBXdqnYHp+sRj3Qy2/EOb8GULjvDBj98aYjIC8r8i5ht9RtbYx+OZeAjYZO
         F+GSrsZwdJx+7lp5SqLBbORY+jApwde6xMTdkIhzEUnp0e1VTwq18jl1hDNBjqApHWUt
         KeY9z2tmvFkZRcGP/Z+rNnSfbACu8vsNhW82h7mn9Ng5Gx6xovmcN6qqNlNj/YVLeuQG
         +bqjEQ7mLr3e+VVnTRI9LPYiRjwp7vpmmG1qQwt0WbYTSj+XcfvpS5j1fX7WUl1OEv7r
         MtzCrZVCcnpRyPCtJDThkfflEDn0TQ9eccemNu3qx7HxE3Z54kdFaIWUa6AXjyYSC/jy
         3amw==
X-Forwarded-Encrypted: i=1; AFNElJ+0rk185oEMFxN56QUbxcdWLJIEVg/P0LA/u4EtBPxvK43HAb7A9oIoHzP4QRS5IzQopPaEj4paI9R6@vger.kernel.org
X-Gm-Message-State: AOJu0YySeEul8xATOY5SBdyg2W1355vVWeTBu23khFKWklP/yjrUu852
	iTii6I6v4tOChYhB6mRd+cPwCn/RYQ4Dm6ppBfs86HtaEjnS0SqxMbKDdtlAB5hkfpVNGRMehPA
	SQTmdVMUNg4K8ebd4Wx94+zCH2hilmwxiaw8rSjjyHhe0IBwqSt+81IRxwc38U5qm
X-Gm-Gg: AeBDiesQwbyB8WthQkRi6rApIIZNkx20WcWMZMx4X2JdFyz30Ov3O/xFnSHInmX/7+J
	pRO+4og15ywESVG57Hrh6VBrTUADH8ByEtSc+YLRb4eOKDSNFyr56xyW37RwFKyH4snf4m7IFGh
	SJSgNEj77lgDa6wKbnUP3ipDKsQrM1RpNoXOO8GTdEROSQJuHIhNhJQMNCrMpbIX6qkMDKguBbd
	iRdG0PYuOj1YlX6SGAX36tvuo65nJEYmltUoCMoQXLcwuOwYxLgjD2BWReJ7LY2eGwSH76d0PIF
	NHryFyJlMCBIpwOZI/imhcX2I4IwjSjkhYNNVMedZY6ynboLWmxV47cBDdPDeNfBLyfUHuWBF3O
	rlkecmJtEGuLLClCAIhf8srRHNoBzoJGsAb0/TUnDxQyt7Dn5Ypyr8LCHtg0UpWmcI9sZo1GaVZ
	EKhXkjTPpS3xaRD5slnyy8sFSfbdsQASCVxtEqJND2rZ4rpw==
X-Received: by 2002:a05:6102:3a06:b0:5ff:b684:f796 with SMTP id ada2fe7eead31-616f559e76bmr2093433137.13.1776449328727;
        Fri, 17 Apr 2026 11:08:48 -0700 (PDT)
X-Received: by 2002:a05:6102:3a06:b0:5ff:b684:f796 with SMTP id ada2fe7eead31-616f559e76bmr2093419137.13.1776449328311;
        Fri, 17 Apr 2026 11:08:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7dd0sm592057e87.69.2026.04.17.11.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 11:08:47 -0700 (PDT)
Date: Fri, 17 Apr 2026 21:08:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sdm660: set cdsp compute-cbs' regs
 properly
Message-ID: <zatl5fgxuckxcltwhgzu2ksj7kfv6bk5uaq5i4jhcexhcmyuao@2kryrrypeauh>
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-1-03b475b29554@mainlining.org>
 <42649c1c-3868-44ea-8186-49e34abf10b9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42649c1c-3868-44ea-8186-49e34abf10b9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JcqMa0KV c=1 sm=1 tr=0 ts=69e27731 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=OuZLqq7tAAAA:8
 a=EUspDBNiAAAA:8 a=qIOqSNWHgndfu5AQeQMA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE4MiBTYWx0ZWRfX9MbXf1fuZ9Og
 boTR2SyPzG3roc0PSx8I0zIKgrI4sQOQeQJD2cNsLHIsCUgu9XGkaotSK95GtzGeelep8Ai48BZ
 sSvtenNksK35PtW77TnEy7SliroYSoXX02Wez/HF7/R3NBO649BEgpQKuVsOiXwE6zrQ0jNODID
 Mu0GyoBXInU7XAWlfVL74CQVNXK/EJShGs+ImdPjidSiJCMVLVK1sKdItHFd9EmQzdFoa4rvD+J
 DnSN90W4M5H6EYBKOC0H1EcULGk4IAFdSTZA5xo+N2rm870o9y/Iz/NU18xjai1/j2Z32iO+vGo
 BZgnM05I8LdRerMc12s7jEjapCdWt1AKYC0yaf5wSPnqIEfz6Wvhu0Nx6vPlW4T1M6Ji4qpvx6o
 SuAxGZmY60mErVIJWq8F4q34DHLjOBjRxqlBGn7gm5L2QvQMzSTvdNou/X8ypWfVMKHCvGTqLDi
 g4GM9ZvOHYQ49m0ZTRw==
X-Proofpoint-GUID: SfRgNMqNkUvP5rtnjCTZef2_Kg-TZ5Q6
X-Proofpoint-ORIG-GUID: SfRgNMqNkUvP5rtnjCTZef2_Kg-TZ5Q6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170182

On Wed, Apr 15, 2026 at 11:43:29AM +0200, Konrad Dybcio wrote:
> On 4/15/26 11:40 AM, Nickolay Goppen wrote:
> > Changing FastRPC compute-cbs' reg values to matching iommu streams
> > solves SMMU translation errors when trying to use FastRPC on CDSP
> > so change FastRPC compute-cbs' reg values that way
> > 
> > Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> > ---
> 
> Fixes: c0c32a9e3493 ("arm64: dts: qcom: sdm630/660: Add CDSP-related nodes")

With Fixes in place:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

-- 
With best wishes
Dmitry
