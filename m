Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5813B2FD7B1
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 21:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775339295; cv=none; b=plSFqaBhT1HDMMLsoQJcpecuH+QT/DsEWEvIMdUgdbp72f/SlBR/eW30Gbim4AZicqPMiE0mhO//iYrnnIy2U+XJac/hvvWMBmXxSCQUY7xUXbN8fJkSJuogwUdCz9N7Uk91s8V8zx+CuRF/AbcXWLOF/pFl3c3004gp+LA3L/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775339295; c=relaxed/simple;
	bh=R5MFZn7on1y6XbobayspmKaqSBa/YVcbEAuZzGT4MjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WH0XWw3JoLMqIEb/2hceOB/bw6KxUs25SNWmNEB0QXTcgkfy3Jh/kJf8Ubb46roINMrJRJEkelK3BjDX0Fe4U24x8W+mge3HqmK9z1/ub0L0ZtNdlZ1cSJmKHGyFqbzl/mYAZDfoUsk/McsxRDjwiqX+LsiAln55H352qLe1Vzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e9gfYadd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AQfReWEm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e9gfYadd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AQfReWEm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634LghlS4062347
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 21:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tfdwPZDSDeozlLQiB/sIpQb6
	Uwmc5WQ9+LfB1oCVSs8=; b=e9gfYadd/zBkqWiDV99vJ+ePfiDxYXw2wWA4jPP8
	U1lJBTclnvhMopIC7Vj0CLFiwi2r8dqV2cFaXND2CDeP1zPq8PbrxMtoG7uzHtx5
	oMtUwebtKsnOLWbA1jJjsqBUrQxpzPGktTnNNsu8+7fY8+9HWRD8mqXC1POicTIu
	OFWyLLbnFAwgKuUcMoklN/FZP3QQ+NxTak3D4adTp3ygmtWbdjva4pSlJ5X6S4KE
	KDmW38WLcj1bMI2MXxy/1SbCH9NQXzHzkBzf47fP1bqkbgUyVY3nXiHuGlHhUTA/
	9tCPcKpmqg60oV9WoWsPikE+VQngRBWeyE/TepXGq7Lhgg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datv19hca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 21:48:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b34223670so140291501cf.0
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 14:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775339292; x=1775944092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tfdwPZDSDeozlLQiB/sIpQb6Uwmc5WQ9+LfB1oCVSs8=;
        b=AQfReWEmQwwW2Dg+Cs0IPOJuVQV33g/vgYdnZce09+2RMauaMQza4afJiTLRQABT+l
         qdEFmv4zVV3Ga+RKjC4xjGAN2xDhPRFywqehAgKppIHGWh9DUHb4dcb5lIn8HFY5tz8C
         o5JGhCzKzdRYFD9FnpMTKpO/lp9O2H/yPQmbHCJSxXXPWllE7HxaO0PXvK2d+F5zz4kD
         d0ZNXRqPEGLKK0CTY7U2Ju5e5fNfRhLYNGEpCd380V5B+v6SZkEeP2l+dUt3Yxhoq6uJ
         qo3On35bKpLXPBwxxSdV2N6qHcpq0r+dZ2I2A2ubVNDrNEd6+CP3FwxppGGixWCL4ZhB
         v4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775339292; x=1775944092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfdwPZDSDeozlLQiB/sIpQb6Uwmc5WQ9+LfB1oCVSs8=;
        b=GOgmJ0OLIHGd16d//7vmfZURlnNBeZAXtF98aMtYwwCZBkVX+/ZRI8rMXHrZ+r6mwG
         FjbGV9b0IoI2Hy/TqoUqUxJLRXSrcoIfA9cbYqXnLGDT5R5W+E/vJl0+S9gduu7ViXkF
         bPgDPHGtGqA/PenGYgbY/JlVS6pQrLOqvJdduQSk1CWvExQr6u2mPakZXMdqU2VlPeXG
         T5THbf50DS3SzraG3AMOUhK0OOdjKKsh3z9hgWZCNFbwawUgzGt8DskrJVqfIvl7tREe
         04bUJtLYvHYqFoRmWdxdLrGQPb+SSEqS9Bcb+2ILqOefZufA4AILrVq405WkcJiSaK6P
         R5CA==
X-Forwarded-Encrypted: i=1; AJvYcCUgW2DisOvmBiqtTuFPOQh/SXyKMDe47B5RFsrTzoiwY5ng3MU5/ezeFVbnXTnfZuvuH+JAiMe5cDMC@vger.kernel.org
X-Gm-Message-State: AOJu0YyY4bUZjadLbQe9oKSFo3lms+wp1akr9pGAfziTpBr1/AccW7+n
	N+h+M+kepK9RVcu7vrEn4WcDoCTlF1+HGm60+V+a4V8h/ip7RE0noCbJrQZoEpRM//bR831DdoP
	rJCbwgo3ovrGTwwg0AVtZtncYJ/jJ8oSGompjpvnyb8FbmgNNPdEBoW1dGaRfvBr8
X-Gm-Gg: AeBDietARjBKYw0t5O/9VmTAAciTiwWH+GI+qd3e5NzGWn8JyYjhyELlwuj53bOn2F5
	DhxVVZZfseCqmXnNzs8q2w8cPDo5KGMmMRuvUySGXVYOQdBqE82K3OxSNN5roR94cFJua6vEAKu
	4dEH3c9lFJmJlbkaGXImLkL26c5EOP4iOMFMKuSZzbGJe18I7/npX97T5LKtIVR/z5ZHBdiTeC/
	oE88u6D+5PNkXD8dUKX7ulu4m4raZruXVmCHpeYS1pX3562R8JNs4lBJcnKQfP9ms8VL1rB69sM
	YP4t5zg0advvWxRpkSr+Sxs+Cn6j79UgdHpWFOD2CUSknRD7TeqCL+DJ6H33ntPe59eu8icHcy0
	lXE5AkY6G35c+CjCm4Qp+DSdoOgNc8n6JU2MhBx9supbhXV5cg47pVhc8AjZRZIvm2RduEIzDgo
	1WT4WnBCvRa6GQ3eOYgLcHSoliTLFgODePBP0=
X-Received: by 2002:a05:622a:4889:b0:50d:7135:5631 with SMTP id d75a77b69052e-50d713559b5mr73311681cf.6.1775339292388;
        Sat, 04 Apr 2026 14:48:12 -0700 (PDT)
X-Received: by 2002:a05:622a:4889:b0:50d:7135:5631 with SMTP id d75a77b69052e-50d713559b5mr73311501cf.6.1775339291911;
        Sat, 04 Apr 2026 14:48:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccc96fsm2308220e87.59.2026.04.04.14.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:48:10 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:48:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] pmdomain: qcom: rpmhpd: Add power domains for
 Hawi SoC
Message-ID: <q7nzvopy3mz3o4fnyg7lspaim7ccf7vlj3xlsaaiq57dzvyoiw@xz5yzbjn5suy>
References: <20260402-haw-rpmhpd-v2-0-2bce0767f2ca@oss.qualcomm.com>
 <20260402-haw-rpmhpd-v2-2-2bce0767f2ca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-haw-rpmhpd-v2-2-2bce0767f2ca@oss.qualcomm.com>
X-Proofpoint-GUID: rCItYtDZQTG19nNWeJDL_ZN-UlWe6jQD
X-Authority-Analysis: v=2.4 cv=GLEF0+NK c=1 sm=1 tr=0 ts=69d1871d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=qZ5ZlOtsQYTu7SIoqgkA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: rCItYtDZQTG19nNWeJDL_ZN-UlWe6jQD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwOCBTYWx0ZWRfXzMSCL+irDy6C
 G26YePvCQDnSVd9Bnq+cWGAsOu5fLzYFrSTjm35KzC9S54RrphviJTwORZg9U9i6LDs54/p8ErU
 bwEj6DILVUSBDGeagsW52eCF2iz5g6MdI3WvRssgpEby82WBQXib/wFHk0vIQsSeoZXkWFMbWXs
 Cjt9e/Dg+jdTJFPg3bl/F1TSyr00zXh3LXZZLCDR6o+iIoZoA+/RRfG/+gvu9Brsx/uL94TX/yw
 +4546r/RbmZPuU9IHwZLGK6z6084O4qWGOgkN11PlCDIoS5TSSiyio3MyaU8jVattpU0/jcs4Sy
 5WtiZzo4UfmmZcmSUsoXJYt9x95nUgWcvomc5XZbFrELEzqWC10jrbV8OZ/06MiXa6ATDUpj3Yb
 51MBGTP0MydBGbUQOXq3K5+7K53RbuSCywFHwJU8Ges0SiEwTOrNFQrg93KN3PhoTTgPi89EKR1
 HnY+sVXV1iGIOW0yJxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040208

On Thu, Apr 02, 2026 at 05:35:22PM -0700, Fenglin Wu wrote:
> Add the RPMh power domains required for the Hawi SoC. This includes
> new definitions for domains supplying specific hardware components:
> - DCX: supplies VDD_DISP
> - GBX: supplies VDD_GFX_BX
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
