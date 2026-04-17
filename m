Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F228346FCA
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 18:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776449354; cv=none; b=acIkQ527Ryg4Cy8DyXZYe03ITCJoEB5Et2ltUZVM10+Ts8n1dkmRWcqOeVD9YgRxfR0h/4TlNkHTYQ0A+o6hTmnw7RoNRknLOXvQC+WdmvlQFX7fE8o3JhOeCNgVCiFsWUmJJK1AooCpPsPTiLBFKXv42pQt9Oa4h8dg6NY5ZJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776449354; c=relaxed/simple;
	bh=q9rCGAiYadnYJ7Fe7JsPJRrWtMNydJFw/DoXJl4Rz94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BkHkDpzUSBBXNsjIsekcxNrZ3jPKohJ9ykujGxA3WmwbyRxK71pVmXCQzEfcmxliTAmi08np3ulOSCkF1ICqZI4ERmyq94XVpN7qV3iAu+6fDyvk4OmW2yj20irrvnN0x6BG0Jurs928RMKUVU3kezDwI1BYhJrUvDW9IMv2gm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjAU7Swt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZrwXpjAD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjAU7Swt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZrwXpjAD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG45Y31889570
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 18:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZyeGSFzRFFB+mR/bjfoEURvl
	sP3Ob9G8OdzSVxeCj/4=; b=TjAU7Swt83FIjs0odS29FXnO4JEvQKq6K7mFLtwA
	QpJFOFkdc95KgFlk2BWqZodRr35dooMp8vyjq/ZH6LwdnJrVZn98hdj5usKnXaVx
	4ERPjGEuyxf8576IeCFP3sGI2XJwSnpN5QzXVsgANWfWqy5JWrMNB/NLsouuFb3k
	TfipPCGdR+9Nj442mM5SNafwkaXGMS09gTNGl8KNxb89CHGLFmsj+FxGWYxnNPlc
	jKF4LTPZ5PbXWrTUp9mTlrjWarS8QUrV86ol1pldCKhWrVHHSS8t4rD7FLB/aYDC
	t9GTiuFTqVSHc8cvpD8EVqTXr8F4E59USchNv7c2EnmnUw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkjhdspqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 18:09:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4031b86dso20797971cf.0
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 11:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776449344; x=1777054144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyeGSFzRFFB+mR/bjfoEURvlsP3Ob9G8OdzSVxeCj/4=;
        b=ZrwXpjAD/3hAphn6r3ePAMA8RrQ57bosERxuyHxsCNGds3gVCegx8YAOJrX8g5okDw
         iNBszOBTgAa7lmuCj6TMHJulExp2NTtR5sNiHtk/LoJ+7WnDROcjDZlhFU3YpDN5A/L0
         DpTj88tfOQ3k9fbHXDnHCrJOZQQ/ynPzCwiwA9eyR6XxVP4XH+kVqpY78u83Pl1YDUSr
         8uBt6aWFSXWYwtw2klJoab/NPG2y0qwsmLPoi+zndlA/z2R7ihSFn1OJy+xy8DjggXVe
         mM0Bfts7B99l95gC02CaxIdt4pyHv6hWWxzHa9mYptG1LftESR9uf7znfiV+89NiO3O1
         xM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776449344; x=1777054144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZyeGSFzRFFB+mR/bjfoEURvlsP3Ob9G8OdzSVxeCj/4=;
        b=PVpdhzXD7GVoFWLCikbKJEMrtg1QJ+u/BNkcAMYLyefm7k9CRvjvQDEIRnwP9NAA7G
         OMrpcvBszC06mS/oLjvGmn7qbWCZJesFaZSo9gkF4JqxdEvERjix6/yT2udE9fXkcOiL
         QQzMm7YL/yVXOf26/isv2bwFNtWMqYd7+O0unloivlqjlmPm32TVR5Gstzwd2Wwswedf
         CzYNJQU3yBF98lU4+i+E78/36blXue97vjAvUO6JOLmH2P1KbxHDF6/bX8fAntm1xLtl
         uCOE4j0SCPHkT7OIn1RPeQMN0e1WBGxBRX/mlmrYk40MP1mv0+Z57L/E6EuNI/pPV1ZR
         paNw==
X-Forwarded-Encrypted: i=1; AFNElJ8ViSoBS5RyQ1BVt4o7kQTdVmIZ+hPJwsGer05xDYpL7Q8nesmicZOmZew/l3MOiP5ePAsMasjBkYHu@vger.kernel.org
X-Gm-Message-State: AOJu0YzQiVldVXpmRhyk5mkB0Vf9gt1sjiV5aoG0qbobpxxHESlHkm4u
	ECeu2sz1N+xnXxqCkcgWY7F8zXks5EqfjTzrJLLcrRkoFCZiUkECJmZog7v8kqtSjT6Nvew6aku
	yVWUH3MUMv/iObrjCW1onN63hymP7CDltni/e6M+ZrwOkizkBBH+sLxG+p5E9z43HosBV1mbM
X-Gm-Gg: AeBDiesgkkm6aJZjkofBhDnuZORdpdkEloUoF4YHNuMsbcq6vg/T1AxMb6ZmbNhi2s9
	Z7Q1q0/pjEdGhMxLfT24HDGtO2Lxb8s6l5hiLcPszTaxLCQRJi917PiIi+5xeVgHUU+PV8aCHvY
	j8Zp5HwZdxKUFF4PSYpa3AJViR+oYhQkTITVbIaBshRHxM6hcU/YcpOnz3vosuVStdtdpuUqddm
	k/ylnfWKbxBXbOlac2WSZavR8xWULzgOVR0QMVIcZcfwLrIW3sP8KFgPqXsZ0CQu4XK6Is2nIZB
	MUh+dZ2Rtp/gMHDZD6rkUtHxxVMuVeKSyTy2efkcxg0piS28dNwMzToe7+rxviaSprFw59L+68C
	ffAtk+yuGdU2wRqGcuBDVWLCLnkhxH5ayA6HsOruMcoDSLQ4hCKAN/1UnVHiyEw/aJMvqkgReQH
	14GiwnRYDBBP6dshd06Kz+TVjUWtcd4mRET/6C64ywwCfX9Q==
X-Received: by 2002:a05:622a:4245:b0:50d:8e6b:96ac with SMTP id d75a77b69052e-50e36ec5cc2mr52609181cf.58.1776449344021;
        Fri, 17 Apr 2026 11:09:04 -0700 (PDT)
X-Received: by 2002:a05:622a:4245:b0:50d:8e6b:96ac with SMTP id d75a77b69052e-50e36ec5cc2mr52608641cf.58.1776449343458;
        Fri, 17 Apr 2026 11:09:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e1131sm612102e87.42.2026.04.17.11.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 11:09:01 -0700 (PDT)
Date: Fri, 17 Apr 2026 21:08:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sdm630: set adsp compute-cbs' regs
 properly
Message-ID: <ero6offucpaarr6vo6vjqxf4tlfpjnshlu7rsjllefh7wggn25@k7lfsyznmrik>
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-2-03b475b29554@mainlining.org>
 <455942ab-a55e-48cd-a37b-6ab9efde84f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <455942ab-a55e-48cd-a37b-6ab9efde84f4@oss.qualcomm.com>
X-Proofpoint-GUID: jCvW5gGzcmt_yabJ3BPmwAjJUQs7zQdh
X-Authority-Analysis: v=2.4 cv=YpQ/gYYX c=1 sm=1 tr=0 ts=69e27741 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=OuZLqq7tAAAA:8
 a=EUspDBNiAAAA:8 a=qIOqSNWHgndfu5AQeQMA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE4MiBTYWx0ZWRfX/pcJlBheeRMg
 Rhuq8GRe4sBX3fFb4Knc9OH1Qlq/2LWUVFHqdTDUSzxYby9t1u1LXzu2E60CRLqLCLhAkFTdPVx
 nOQSfGaQN5h2G9WGvBMHc7dH9mq3odcEupEdjBLn+pSuNGB7aoXw9AnIS4FYTqDm/bK/cc/lCWA
 OkoU4xK+uoVyRpyvFthYappoc7dnSFM8JlRDmb+/L/G7cAuLNz/nXoWefyV/QpJaLRIhMv4pvhw
 2EW4OA6NCIKlzHukzEUtgY0sn/tMv0xcW9LXH/7uSbUNdhI2PAKBkmJEtHi14mFRmvXTDFqumKk
 xUNYbM2jfCf1X2KBUvcxm4+DB8fEK8r/QvrBDO/QyIwoTQk80K5xW9ulMb1TZy9kuzmdnogonT7
 xvoZO3zRXbjpx7ky5TjqoD7cwh1Wh3FA+sLIrD4jo94i9XAsLO7r9SNuLGZPpZPDVUAVjbZ8pId
 q7ql8kN16VEVnLxcFCw==
X-Proofpoint-ORIG-GUID: jCvW5gGzcmt_yabJ3BPmwAjJUQs7zQdh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170182

On Wed, Apr 15, 2026 at 11:50:09AM +0200, Konrad Dybcio wrote:
> On 4/15/26 11:40 AM, Nickolay Goppen wrote:
> > Changing FastRPC compute-cbs' reg values to matching iommu streams
> > solves SMMU translation errors when trying to use FastRPC on ADSP
> > so change FastRPC compute-cbs' reg values that way
> > 
> > Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> > ---
> 
> Fixes: af2ce7296643 ("arm64: dts: qcom: sdm630: Add FastRPC nodes to ADSP")


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

-- 
With best wishes
Dmitry
