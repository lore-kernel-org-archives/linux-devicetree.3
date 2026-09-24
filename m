Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97384766A5
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 11:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249347; cv=none; b=Ga1KLimxLD1dldgaP8MdRRAqD6VtzimlyZGPQtwgMmmg3zKJbSUVIDUoEMK/kvUWDYvTPTO2eYTVn/tI1iDx+TsoBpOK4FhinK044RY9XwPPR/k1J7KSVaxZGv7Lbz8sRN5c7p/XnceeFOI1eMLne4KbY7ifOlgr8Wxc6nv1YxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249347; c=relaxed/simple;
	bh=901dGwwGWeM97UvSCfaUjJ+Jy7KFMI5sFO3aLsz983A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fw4gOHqtoabC37CXGkfS+zYlsJKYJcZzBdx7etTMR21287fS7eaHqRXTxrEv7LqxmhyD1Zn6jkyhRHb2FTyXaKSWbMx9HlSJBKx/qvNFLy/Ir10Uh8R/QHSWrpA0/WEivYMfILdbxIjfkCWCvSvpQcxjdD5O5oheNrWiSthf12I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aUyc8jwn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ky7MsPN+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aUyc8jwn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ky7MsPN+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PCPo2025616
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 11:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qH3AKWtb08ijvgAHQk4wbGp4
	z6QD8iNHR70hZb76a84=; b=aUyc8jwnNSxsy4ttNv/BvcM+/y3GZChoEOcKi7IU
	WJERRgVVwIKYeeesS3SeVKQm2oiYnPmr+bYHVoTKg+zm+ahHP2+87E/Bv9dM/9ce
	ZuS0whcwgpr5PPXMb5iu3NwGIPsbRRvgWIYKq/N7nX5rD2Vn7km+IgntA5rGJfpN
	HgGJiwzRk9cFlzQgbtW2zmpj5uDTy3s/lmfibGaUHeWkSO4S+7oS888ZLb2pnFmU
	PukERyD/bX36JlUi45zJRZrW4YjJpboWc180IaSmsNOAFS3yWcK9njMJrfdpgES+
	LsDMA5ypStW648s3YkkrF78nOPiMP8mPJxA/m1xhkQnNzA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvsfgt83x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 11:29:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so379810385a.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 04:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790249342; x=1790854142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qH3AKWtb08ijvgAHQk4wbGp4z6QD8iNHR70hZb76a84=;
        b=Ky7MsPN+K+yURLhY14GrtBSFfVAij0yCEQOqbcuaknBdJnyKil+ORtqjJBv99PfA9j
         S9YnQgP1Rfav89/nA+RlcVPCL51YBNOOOBB8kyl3+toKOilQcGeZt1epqgWW1JqvgI9z
         DTtdreLohelNCNgztmPvwTVtZ+ulAnxB5bfLgHZucZeawHvIKK/gCrSRqYSKLP8jra1L
         75Yh7DS6WFjtfKiWPduK/QgJQePA4pxyQNyitNg2I1BIhB3wlcRX13NQIyoPC+hk8ZNL
         Ff25Rb6xuf8ANjZKatBqFdz+cWO50ptl2tlOPSATneekOlkLrNc6al5upSCvSPwXS0jo
         k3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790249342; x=1790854142;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qH3AKWtb08ijvgAHQk4wbGp4z6QD8iNHR70hZb76a84=;
        b=NA0M/2PmPVLKtukQQB870XNb/WOA+CMnRue/iKh88WN8hRRcD5l6XtCAwdUL1JBX98
         ecOG7efwZuanfl3+CTgB5r9McKHyg5YpoybcX08RGAIDQOWddUd1riaznKjwQifeb1TL
         k/P/fabawIKRvRz9uDgpnq5yTHNI3I3cDC3ZnD4lOki0eDYX2Z27HNzwoQljpeCD250Z
         pwm+SUkPrmraSEnZ4wu3/SXTUHQ7vAtjPeEtIk76JzPuiKZDfPgowMga+hNMU3F4lGn8
         sTX24NzDDfRbdq5IXlPzgr4sjRYtIth0EhLSKnVAa3Cy0xlBHSrrmuP5ChYdVMwEPbAL
         RU5Q==
X-Forwarded-Encrypted: i=1; AKwUvByrpM3Mbx+kI6oAcFcwgV943/NKnFgZ1Y1eg97OwVaF8LuInRQcT9rzETla3M9LvaP/dr+gBGjfr1Uq@vger.kernel.org
X-Gm-Message-State: AFuF++m8Q/a0B2i9GOyLWUJHx17N48onWW3BpB1DTDLcfIHdrjA9IdX+
	v+wmDNj74BX4yvi+kaH3k7qy5/zpQ004POBC7sWxtA252B2/YWu7W+UlzlXCuyPiPbYBTix2+hp
	cPMYdxKSBn2bpbrSSZ/ZFy9AZ+132SfVC+ecrJOvrfBcQ9JcaZJalkKELfhN+I3OT
X-Gm-Gg: AYBFou0pCrDAlXtl8wgjeknHsJhtwLs1dY9nvU80pyT+ojjths+S4CACxNyP+iKieHn
	M+qS9r6wP5rCx7Mf09J0NsWh+UNBLKnVph/Wgbtqsg0TO3XVsfyr2uBbStOc+hkI4gU+0MQQRpq
	05H0szsutgaMf9aktoCTqVxOoOG0x5qREiZWpiGRSI9JkONZk9LgZrkdNu7CUB2yIGin/vIR6UT
	MXpF4YcxOUbFc0nMkuG6APogrgabNnEcD5rwC7P3RrABPJYbkruR8DMli9K37l+VGfArtkO4JNi
	IOGLc23GFctiMCq/vm5coomvw6ucmOtv7JplhFkPkXT68yqvZcyIvLdRnUvddAOmVx39haX1y5J
	SHrWvxdY3ILYd+Ks=
X-Received: by 2002:a05:620a:19a6:b0:93a:1b82:495a with SMTP id af79cd13be357-93c36385bf4mr232409785a.37.1790249342182;
        Thu, 24 Sep 2026 04:29:02 -0700 (PDT)
X-Received: by 2002:a05:620a:19a6:b0:93a:1b82:495a with SMTP id af79cd13be357-93c36385bf4mr232403085a.37.1790249341556;
        Thu, 24 Sep 2026 04:29:01 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4054fsm106427115e9.3.2026.09.24.04.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:29:00 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:28:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add LLCC node
Message-ID: <6pj4rxeansgpqilivwjtugq4mrnfhufxa47fa3ovopxizcz5gf@pvm43wfiqtmo>
References: <20260922091735.491481-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922091735.491481-1-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YfoodARf c=1 sm=1 tr=0 ts=6ab5097e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zdnQAcmOsowbSLqG7IQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Q8VWQZR36LYBekOkP-trl8b3cRDA_QUp
X-Proofpoint-GUID: Q8VWQZR36LYBekOkP-trl8b3cRDA_QUp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NyBTYWx0ZWRfX8wkkUradMQ76
 nvl43NQ4LpUdrYxZeFXtEi7yy5NkCnaPfDCIl+v3CfULtUURXMqy25ifiN617K102drLCwYZtY/
 M91ytlZpM3ehoWafhNqOc9K4sWw/keM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NyBTYWx0ZWRfX4Lcs0xgiFTYB
 3Z7pxHmCgq8ZPX41ombGrxI0SykWkKnL4DDQMqasv74w8lI9yooIEcvYDHU33Dcz+xy6EKGeH2i
 UnecrXF2T9waAjR47d7H5UJJMzIEAfLZOyTkB09wfGmBrE4rfk70wO+ApkkSFUOSr86HUk4QPX5
 ssZ7S8XySXuRW+uYkLdvGkmDkUUdzbBXlj9B5ZrxdsJXP/0qxl7Hly1JLgo2DoyJ/8LAO+uvIHO
 RwArq2trId5GU9G07sb7QIQ7DDgtQqFQZYxLoDNjSsTenp37trg7bZyCh7257bB6HJ+sd2nFaN9
 mlsoL9M27fuxayW0afVnMnNCBBgj4XXn4Gi1YttNGGAYG9qsWhufP5YrWub6/uiB92mc0IMiusS
 WdTo16mo+npCN88wjbFgzNxnGUU5ZwV+DtvG7CWZaKkduFEoLZRd15lOIa+Ky+b8utFubt31lp0
 wZLJamvYDLlt6qRFwfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240047

On 26-09-22 17:17:35, Shawn Guo wrote:
> From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> 
> Add the system cache controller. All sixteen banks are listed, four per
> DDR slice at 0x100000 strides from slice + 0x800000, followed by the
> global broadcast OR/AND regions, which the driver expects at the reg
> indices right after the last bank.
> 
> No ECC interrupt is described, as the Nord interrupt map does not expose
> one for the LLCC. The driver treats it as optional.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
