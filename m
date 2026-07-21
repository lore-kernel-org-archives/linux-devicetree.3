Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8DF3E121A
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784673035; cv=none; b=EvC04+w2jNxn/FSxSRceDQro3LtJ5HPi4yHYb2OygugLBwGD4JVuRVsJ8lmuDdhFru13seXyIzKiiDDut2IyAsu2M2rp3Ag4aYanyHxCOZtGbKGfZrnOyVXSYZsc3vfH78nGh9g8+7nzdbYJm4NjgmGmaNtIFWkZkTJvjm/DF6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784673035; c=relaxed/simple;
	bh=Erg7g9q7TZiq1rHK3zyUp7jFTq+jGCPwq5CdloiD9zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u71Ve34NTT0uaNZP18SiYjh3+/YbC/ZrzR3unYZPPMJAT1b5bYuwa1HB+BRHdacKVwfxKe6+U+iAQD1lh0P2ICo9uY89Mw/YN85Ji+AtApVQtMaK0HMlJ7HnL6KwtJH8zcWmL9lfD0s0te+i+Df80+UlItlaHxSWQDG+ZZFJnls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W4TuhwwL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e30BIGDH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W4TuhwwL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e30BIGDH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKlaWf2676512
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ndQCe1+cYT+9wYrpR3g6pnWQ
	4JRCkgNfhxAWYUi2AYE=; b=W4TuhwwLH/dM7zgB2wLW3dKyJBMJCDyyd3Mh+J3O
	0gppZEeF/5OVpLPU8ziP/xfx23R2efgkHVVbxRW9hg6LKQXHk/X9gxeEpYKqXsn+
	e/qoMIm7pkhNJevd173FwV5gKURJE1QuqY1kaXQJSIMjCdh0Kuo9NE0Qvajb1dil
	8vKuCrK9cKQaHa/DEIkngKpGpaQFH6e8atxZY4/QNyTBxIFLhn+TD5XPjcA/qqqP
	MWN+yiBi7TtAkGlQM/BHQUjJhid2kE1fQE3A5YKkLB8LAOZQXoMVXwAbPO8w0IME
	ftkcDMO1DX9ONISgG4rAOT9IroT/8ewFjdSo+6pKadXyzw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9c42cw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:30:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a97644aso25488111cf.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784673032; x=1785277832; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ndQCe1+cYT+9wYrpR3g6pnWQ4JRCkgNfhxAWYUi2AYE=;
        b=e30BIGDHiqXWT9pYE/NEOnGWK5KSAyU9uCxoclyMcRia2R4yHqK9WK9pKn7hium9Hl
         OUTLsWbRlAw57HVzDncezMvE4ryQIu9GPwogq8D7jiOVcXrL8B2yvu2L5tLS7qcxiWVw
         DYsii8lhM2rRuzn7GlvG/37wH5QU5M5Y3iP3goXCe+5r3bMwGCw82/AxQ4uikWaR3iBS
         QD+mbESOWli1rRF+1OctXanAESGde7ncA+2rfcHyrM/fu/HsNT70ziMG81i7sQUh9Jsa
         CnxkaB2QttjIALp/z9HPUt+HvVPislMax9WfKcCPwjOrxQdrwTTxjmYPCmczTb4BAcx+
         CxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784673032; x=1785277832;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ndQCe1+cYT+9wYrpR3g6pnWQ4JRCkgNfhxAWYUi2AYE=;
        b=fRJnX6qIhQXRG8H/+o8JIa6nAfXhvcDAbEMxZVAnB3Qw+Ek/kHWBf+o8nv7R1MUe6X
         uLMMiP5Cd0T1zdgONk8ptcGhQDVRH1ne71tisohOXuRHC9PPTWGxT7c8YAabkJd/a4E6
         KLaXHnFo0BQZ2lAz+BBcK7v9gRKvr4XnXm7mmj2Yl7cwInn9kZs4tGSD4dgwH4h3FQnG
         AWcZTOn9EUiJSjXKNAYGRY0zGxfoOFkOgUPB6eBo0nAsUI/xZ8NXaTlMR864B/rXgVhi
         11F/WZACNosGl9Z5uyx0MgQ9UN/YvA/d9i/R3dfZn3q6EkUf7DY2IT9IfvKYJZSP5dDL
         H0dA==
X-Forwarded-Encrypted: i=1; AHgh+RqcD/pYHcRoKdGNHH+p3gHXrSZHWSUpuYnI8FSQPczXjV84TNGvsZIoOzrbhFqkcdwhv2SvoQujeqyg@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9/RrIdIx4iBInHT16TyTjWCDkssqLh4v7gew/hsnKUyGDyPsY
	LCzk6fuKfehOtXYZbcfQmSl1xc74u6QHJbyr/KkBNOWD5vh0y/6vJQ4cFfyudEOsFBYv6NsJmW4
	s/l00NDguwgHFpRi6gRBAntAXMPcRiNZCOysBrJi9SWmE3khSyNY12m1+OkNwQ3Ly
X-Gm-Gg: AfdE7ckTUoNumUuEC9Y3UHyk9LWG5my42SZuXXQunDK4PVYUdXSbLBBMF7nD5zdW1qQ
	cLqPnShOwWGtcHFBf+rD8LHjUIc2v95qQnCkpUW3+HT9dyzwew6O6A6ZawQkpscitzNqZ3KqW3y
	qAQ2efOnYeP68KO0a37g/K9Xt4DaWeunl0fFfk4ui1TEzZTklaZd11kFCbYaE+5XIppwCKdVc5F
	jS6he82HzNEZ43LozJn/OB1igP+v9fb4wL9AgqN1n0rCJGXlLZ/P1SqptJEFSqEQCo2KKJqsLhY
	xqUL4QodD3sNRBAmBQrnjbYTJ2jNk9v9nl/iEO80mVg34IfZbZaX6rAABJ+ZZoZk1VBANNBsbc2
	QTSGsk65zgauFcY6kTEei2zvEI+w9AxZHapepFC9yHNd98coev0G/SGt+q47Ul1MgM/2TxVt829
	aTtra/39m8rJicyw==
X-Received: by 2002:ac8:5fd3:0:b0:51a:8c9c:7f41 with SMTP id d75a77b69052e-5213ed70eaamr187928041cf.68.1784673032192;
        Tue, 21 Jul 2026 15:30:32 -0700 (PDT)
X-Received: by 2002:ac8:5fd3:0:b0:51a:8c9c:7f41 with SMTP id d75a77b69052e-5213ed70eaamr187927611cf.68.1784673031615;
        Tue, 21 Jul 2026 15:30:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68883c4sm1339011fa.7.2026.07.21.15.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:30:29 -0700 (PDT)
Date: Wed, 22 Jul 2026 01:30:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: eliza: Describe the CDSP
 remoteproc
Message-ID: <33arw44e5cnz3ui54f442rkgu4smczb4fwuyiouxo4lvne3v7e@t2tl3fsq3cxf>
References: <20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com>
 <20260721-dts-qcom-eliza-add-cdsp-v2-1-e1e52bfb3c12@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-dts-qcom-eliza-add-cdsp-v2-1-e1e52bfb3c12@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a5ff309 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=_eC-MrBlR4xPY6TSJ80A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: nYrbMDEJBEyy1tjsPF0zGxhfzuh9phKz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzMiBTYWx0ZWRfX+6zxwrxzqx7E
 wit27iirraj+edt9uLCpTvYA4he7gb5Uq7GdNU5fBGYI3DnTHGsuodNhvAuqBmuT8VVsCHG7N7n
 xIdOmRQxMIofr3PY5ywTYD+lsp4b5DAtehSPLjyVdV7YlZCg+dTVC/TR+TDo9+m9U/hAXnwubzU
 mrhPRhioVGrgkY0Kq0htpWul2VW3X6hDs5/8Huvq6G4TPf2kcZksHsV4Q75USdAaAy7YTqkRerP
 acPTYqt7aJqi/7YllMG2IfwlOnUEPfYob0GByN3ojNQDZHrT0DAXyvpd6cqGTptEzaC7S6583tu
 S04ofDMftYTsLZ6x1KUwNe1Q7Fe9otxFmuoassaVuq84I8hyKwLdjySudg1TyPIjcAPUFyJwMCM
 I8w9568khU8mmN4NDbLK0r7LSBjoHh5lh8v5gmSKqgcreMQliCrFJScdQKP4twZSVqLAt7P83Vn
 w2r8R5B1dtlxGGXHuKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzMiBTYWx0ZWRfX2UxveqjkpdfA
 gWsdNcTjXkQEJMPNQwtc08GDrvXMvti+qjgCacy0blPNISiMpITYCsGp1iASBtYyIG4e80ZTgIj
 U+QzoWcam3iF8G/JndeYk4OMcf4oCQw=
X-Proofpoint-GUID: nYrbMDEJBEyy1tjsPF0zGxhfzuh9phKz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210232

On Tue, Jul 21, 2026 at 11:25:48AM +0300, Abel Vesa wrote:
> Describe the CDSP remoteproc along with the related SMP2P.

Why is there no glink-edge / FastRPC? They might be not yet supported,
but please mention it in the commit message. GLINK should probably work.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 64 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> 

-- 
With best wishes
Dmitry
