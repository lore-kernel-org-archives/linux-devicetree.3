Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483407;
	b=nCDzb7bnDfPvozPvt6MndHYoF9HDNDSozNnRlp2o4a0bPyyQKltkXI/cUjarILBpv1NB
	 QyfqsE7OE2Xf/dfclZo39MN3JQTx4keI5qEK2bAaP7jVNXeIApdpyUTz4Qhi+AmlDvSOg
	 PIENxcsCnXdw6e96JqTJgW3BnQVCy0Av3XBcxmr0D2ZD212aEVgtqk5Q8J1RmEILYpRc8
	 6Kr5h6RHywVDOhQDSwTXdXEIhVRKfVzj5peB23AnX15b7n42HI/SvajONxORlp5trJxYd
	 gAG6FjNQZDX9VrvkF4Fg+GU/KYjEYIkLDxPZwubXBOaxm4fNpvcogfyHBOQJXkOvUvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483407;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5CEYrl9haMjCN2sIMSQLbd9UGHWcTYC3p718awO/Bk8=;
	b=ucKsZ0IUumcre6I495FuuUGB5G4VCGMTHIkcpD3mPIqRuzpnKcStzDwlPFq9Q8RzJanT
	 hLnuxDdJ+Fmbuo9aN8Bv+hDi/f4pSPfKrfl58g8MrpjRJ6NOGd1fdNZXYIlFbl/Q00JAl
	 7La+ZI1bGEwTxAojU31W6DV8mb7NeLf0CqZ9dWE87MgVWO4enhLyKz2zPeJqh6zISUbQr
	 Oo1jTcyNp2m2+cbmn9Z8tNn3D2yCD2/iV4ZewQol/GZkhbsj3Ze2rb6RLtYpRV8eQTkay
	 qPnfZlfsvQDDFRcB1Gtq4z6tOOACv1ZQwX2Jo15TX1NEKaKJ3kn9gYnfqUQG4glFWGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZjYNNiC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kE9b3j6F;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FE9606A321
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 21:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98FE9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZjYNNiC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kE9b3j6F
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJFFtx2928501
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 21:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5CEYrl9haMjCN2sIMSQLbd9U
	GHWcTYC3p718awO/Bk8=; b=nZjYNNiCkssu1Ro9mj3WH3/3eFnJoJb0o9HszMMb
	TRWBC0ZDzXKevMibx/BZFuM2yjD7n3wwuIK8771Bd1h5kHW05cViQ9RrH316eCjW
	mA3zPP7KG3ZdaG6ebevmvZl1VtWzyK5yyNL6bW3L4A9l8TuTg9JP2k5kom1+t/kF
	iinJwfP1BGi1HG/ZoC4dOV8xMohSQ9PdPYDfZT5NEx7FhWBbW7w8LJqBL8bLSDRj
	oOzenK4Kzk+ugl2XqD4HtpIDo8FD8lHRL3UC80z7GW1VI+21u0tjp5hgbr6VNnG/
	I6PKxjNt9Th2ftFMiz7GJbkYnaMPc6d0jdLWgxX2nHBBHQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8j2t55x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 21:50:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c7c7e8becso54800306d6.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793483405; x=1794088205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5CEYrl9haMjCN2sIMSQLbd9UGHWcTYC3p718awO/Bk8=;
        b=kE9b3j6F7rHcBPtP2oI1uoyCHAoWHPCE1g2ROUBzFrs+LES3htK9ipZcQbSV5/HNV5
         rLaWcuOc4Cn6DRyre0wfN8CzFVkgtChA0ttd7pts0mcanim3gtQg3QjcJGcVhKS7N/Dg
         cGjTGMB3cboC5JkC1MvOAGTEQykMEq8eVfsTrdJn77jr5NLhj10yRS+yl5wTA1H7iBkS
         L0NNpyddAZTh0BxsXZG7FfAoCSbtWb1lclRCRsZnbCkq2VxuNhiaSgg+3jBiBvXbjJ7q
         fzm7qflIHCCPKvdcJAhq//THLsSSRtDVe/Q95vhygCNZRblhYBVi3gT6f7+nbk2oDNmT
         mASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793483405; x=1794088205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5CEYrl9haMjCN2sIMSQLbd9UGHWcTYC3p718awO/Bk8=;
        b=HIc6g4AJE4iF7scn+hJW2XRItSSBUsn9+C0ArLpyJ2r3gZ8nyupbAJ0Ed+UJOTz+JB
         cSXEyT9s32XtE+PQcr26r2FmzXTkz3Ve/1Pe2gKT7hR0150vxXkXLJWYvGJhuKgDOAco
         iYYoCNMQ4FxhnLZxeEZypXDNlg12EfpAdb1BzvMZm+0KYRBIlqoaVgIAkFh2BuLk6c8A
         jw2bgMngzkbKS/hWwnXzeT5lY2PxcDISXRg4VDwb1q6tyl2CYlfFexnYrLw3P1wBHXhO
         ziI5uVHY7h9cthLcXHVQgC7CpXX9HIZKcE7QkOBpsHLznS7pAiLTuHTVE1m+I2tVXdPp
         YD7w==
X-Forwarded-Encrypted: i=1; AKwUvBwKWD4lgTE7NKCSEkOzxsSKKL+C9dUPoTjun4bP5ijlMFMlyt2lZrNruslFpokRQQWWrtLe14Gsbryz@vger.kernel.org
X-Gm-Message-State: AFq9FYKkWmb8Ph3sImCUfTrXK7it+aRlgTRg3sLI6+xrkHvG9CvuDLC5
	/TTCNBcjSEjPMahX/1qWo9A7Jpc5YxAqAxcWjN4ONb/kCik5//TkuKFjoxpEvaUPKE7cijkawXB
	FxUFw/TqV8zz0u1M0YblUQtdmevvnjxtgjb0oOHqRpbQnd+OZqiXi1aanPnpCVyPLSLxekZ8L
X-Gm-Gg: AYBFou2fq5HSS3k7+nr/yqOF28w982L9TWsx0iJaBTdXeLaNZGxUPgjHOz07TI7MtoB
	gqHdZmrNxheDyGFSRKgws7NE07U73dlCPtwLXO5z0Mm9WvMXy6eOd+QzgECq5XBpmvGgKDg2Hg6
	RLi5kHje4C/8as69l9jtMDDn7+wKTvJNUTBJ4JWc1hPWujOxT8VZd0mr9U2zRzfBmz86rfRE6jF
	xpGzokA+zP+qMgDdd9Kc6WUIuR3w9PSL/+jn96bDfWO05GKKK7ex+ONFc+Ug9r9VnyqP50xdiag
	kh3L2rERy1SkFD0Jq9rrdurXiVmyTVRyCuMpHuUAyFnHNLWkiByd1fmFezpGxhXfOqzyTQzxjtU
	hyK3Rmb8L4Hw32NdtNS6p/CfV0KXOmfhFOaNZEipxx5bkxazR03a+jPESWf5yvivV9cj6v0BTnV
	xkK2VTmRh+Kmi3IXQopM/DpowldHCjdxbfSWuEUYMXyDAyi8llDJU639dkd53gGw==
X-Received: by 2002:a05:6214:4302:b0:917:91bb:c63d with SMTP id 6a1803df08f44-91ca4b9e629mr106936456d6.38.1793483404833;
        Sat, 31 Oct 2026 14:50:04 -0700 (PDT)
X-Received: by 2002:a05:6214:4302:b0:917:91bb:c63d with SMTP id 6a1803df08f44-91ca4b9e629mr106936276d6.38.1793483404449;
        Sat, 31 Oct 2026 14:50:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbef03d4sm13068941fa.21.2026.10.31.14.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:50:01 -0700 (PDT)
Date: Sat, 31 Oct 2026 23:49:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: milos-nothing-asteroids: Enable
 UFS
Message-ID: <h5psr53lgdjyypspsxhsbnaq4xwxefchr5w2us5cmllouhszyf@coule4xj547e>
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
 <20261030-asteroids-dts-updates-v2-2-66a56c537749@pm.me>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030-asteroids-dts-updates-v2-2-66a56c537749@pm.me>
X-Proofpoint-GUID: _bL_lDtK9Iwke97t2J2xkGhIuwaATamn
X-Proofpoint-ORIG-GUID: _bL_lDtK9Iwke97t2J2xkGhIuwaATamn
X-Authority-Analysis: v=2.4 cv=S5RMU4sP c=1 sm=1 tr=0 ts=6ae6628d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=STFXn1ACf7ZPQ-DneOQA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4NyBTYWx0ZWRfX7mSG+utIZacF
 v5fxlzK4+QFXUF4EcmXqZtoOVF+Wfl7ZySDGCN3is2LVFFNqjI4GcEIvsDAzbVHV1JTWmvzP0wA
 /zyCdv/47Lu/PHW/xp6wLHRfamRDzjY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4NyBTYWx0ZWRfX7yCXoA71rW3z
 uYpeF7i9wrSsIYypAGlIHrnEed+8ZXO+07iZjBn1vRxdvD21Mjfe4Sh7Ca0wDdSAyp9Uv6NvwLC
 56xoIFjWVxj46JINLQ52bJtpPDJB8D5defriisOuqn91snFmF52x8h+MGG6QbdYDoCNZVz5CrnD
 SmqkzLZunEnKLfeOzqR2jc90XmkQOTB+Xus0d203EJn2M2BHfdxsQ6KkuOy4r++F5QUTKFusF/I
 ej4m9+QHUXfn8xxJ7ymRF0IpS0UL+zSMyFZRfIUYGtoXniwdrmpfdeBZKcuuourE4o+EsVd6Oip
 bHodDWfq9TR9OiM4XG/cS0L27zAWnYorb7jyFynWS69EtC3nYXZyBjF3EHhfqyTzU+iCn9clBaw
 Ao5wpzvY2KO8SRATkUx8STNgy1jBVFGe4Z72HaG8bi3pGTbav58sKAHMNB0UL3RCsCqkrY91fMX
 WWiI7GTjjsA186eOh0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310087

On Fri, Oct 30, 2026 at 10:41:33PM +0000, Alexander Koskovich wrote:
> Configure and enable the nodes for UFS, so that we can access the
> internal storage.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
