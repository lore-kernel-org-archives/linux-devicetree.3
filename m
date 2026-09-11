Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6743B41F7F2
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789108314; cv=none; b=UGuzc+668/br8cDuElSMVMidBsGGjGeDAKieRaxcSYGTUBmAXrBMrKDS5gqEGzs/4kN9lMFWDvC2GzgiBlNvkospJsxs2ZYTyRiUlA3LiymOL7FFuqFHDGMGvC9v6WN7lPqMyP7K0WYA4pHDjOAvTIDD7diVB+rTBtnCuXCJ+NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789108314; c=relaxed/simple;
	bh=841d5FYBA+uiiw5q64ZndC+xRGtfySpWCw6HET1TXoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lag4T73u08+RY5uibCgg+OETClX4cy5AT/QUPf/Lf3d3+R3nmh6nErNGbX22IlhQ7KtyQkRCLzLhtgu0i+3vVSm+7hZLtZX+oXifs8GPsvRx9vMb8a2t2ZD45M5GQD8KgS6Dfe0FhXofhmE5EzYKUBTJ7048ecr+Q6rY8SMYdEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGxcgHTo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UtWMt4kJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGxcgHTo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UtWMt4kJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4vxXN2987499
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iJNryjpmXiJCbdcmZCcawGEz
	28hmwGABzhorM5Josc0=; b=pGxcgHToG6N59Ff8MHXwVZgysvYdRwdPBUdX1nWo
	4s9Ws6G78hRFJ3xko66Guf4BN+AcZAUHu90U3ciS9P4EXTHZpa958ztGHRe2MB0s
	J41WZaHJ+m+Cwl0mQO2ByNF/aZmroMOvGlSQ6UsnagAARICzfZBSEfHV7zL00qWO
	1GVrLmVtFPjEfu2ULTJ5cXssUm9UFmy5XIvQTIwGgcTO5NXHUDdw9py7mg+ZzajV
	zBm28iSBySCAsYn+cBcs5ZteCTY4k/kUtFA+a20oBIPbiAztEW+SWSlzrHWiv6aX
	FlNkwDnkpKsqHu/5XyfUgZadV/qzZMfRC+YEcNEyqKA63w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm1k2ad5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:31:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso698978a91.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789108304; x=1789713104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iJNryjpmXiJCbdcmZCcawGEz28hmwGABzhorM5Josc0=;
        b=UtWMt4kJ22n6cUKBatcXL9KxtnRWLJq3FA6msJgtzoluiPhrNPnPkgaQ3znG7dYrRY
         Ufk2ub3ix9NN2r/s0PACA/86Pkl62bmOlpdzhM3Gk8Hqm9EthqW/yq1/7QZCy2MkmpLq
         GlrR+lZWm8zcIkSLkzbcayGhsNfiyzCfks5u7y8nfRyQowCbypMuqU50ZNDhKLMqebZC
         0C+uR2g35vUlnjYZQWkrkduJZUwGPy2l4UeqXmsv6ltm/ttmW7Nrjuk/djTmZIqX61hx
         6wqnAjqQTMIW8xw7vE+4hvHL7oQbRWEHsIZXPviU4xSJnn0TmujMnWlezSE3ZBvw6Rv/
         nhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789108304; x=1789713104;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iJNryjpmXiJCbdcmZCcawGEz28hmwGABzhorM5Josc0=;
        b=RuHroG+wmFmQkJVHrTOzgGml3PqANd6tNVtt9FGdBv3E3bT+bxKHiY9hDImwDUG5IY
         k4zwAKSpOfAFY5Uhon1MPK3oRCMjWSqUx5rHTFsOHU4V9+4v7Wc18PeQJsyw7F37bOBr
         2Gx2PovXmJZWJr5dV+m+VBSu3Da1GIOEBGz/6iNMgbARvHcAEd/BbL8vcfd849kZmbDV
         r4egVqDqR/MWTQoCTD8JtAR5lJziCU6CFC19sQCl7Dx8ksI1DsxDtjwbQWpKMoopbRNP
         8wtv+oYv5V+lehivNDxYUtwpnyfVZ8crTemx5GHy9LG6AZb4dLAuQ7H3DsFG/asuQZQ8
         ST7Q==
X-Forwarded-Encrypted: i=1; AKwUvBy0X9DHVLvfoQR/LYUX0iLctcDQ4vvX+HzrrFOaN4EZycXi7iksfrXOgOMSGfBOZl3p+S4Ave4b2LmO@vger.kernel.org
X-Gm-Message-State: AFuF++mDM6Mb7HMmjiLxXP9em8vd2sOYnEllsGWhMVk3JV01JslsspE0
	OP1e1Dxj8MxBkwvgJ+EUoAA5CivkWutPwx+UvXxH0aOjYYkq9g/+wjJqzCHphPdwHpaCMygU95Q
	WUI27o8ip9TaG8mXPyx7+wYdyVFoyuJQjaVnzz5s1EySFMVaiilhbZPmmte6NNrTe
X-Gm-Gg: AYBFou0GcT+Y/79WjofHAlVN4KgHh9HmQN/pBD883nNUV/kGcqkHWK1zikwjkYkucZW
	MiPNqmhF6vRmnSLwSJPSxKDwRvPnJyuxJBRjH2lMIcxFQJvjwOntmlMnonUdpIs3wVlOV2GSbBt
	00PIRq+ijErwJ5yxVJqSD+TQOZzCCUbXOv8StUZ0iE1zgJHzKGeTx/0rC4BOZG14/iMYCDdNm+1
	gOH92NPkGttOAkwZPv8UzmaclCiFIVR8RHZ0t3uUGckxUjgzpWjo7kQMz8G1iX4a0z/jcyad9JJ
	Af8yst/ZaHLVst0ELwJxM0UMrPLpT32zk7JXYPnkWi1He2V2HnZ50xfEiueOm2CeKSB4AN8oD3s
	Y58fKe6XaVSLzRo9FK0NmDmbhGB5S3BNDEwj4PRVnXck=
X-Received: by 2002:a17:90b:528b:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39d9c35a3ccmr4440602a91.24.1789108303995;
        Thu, 10 Sep 2026 23:31:43 -0700 (PDT)
X-Received: by 2002:a17:90b:528b:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39d9c35a3ccmr4440522a91.24.1789108303439;
        Thu, 10 Sep 2026 23:31:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm6290797c88.12.2026.09.10.23.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:31:42 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:31:37 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, zhangfei.gao@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Add Nord compatible
Message-ID: <aqOgSe_Q4YWBLnBJ@QCOM-aGQu4IUr3Y>
References: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
 <20260910-nord_llcc-v1-1-30fd1cca65fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-nord_llcc-v1-1-30fd1cca65fe@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cM11IVeN c=1 sm=1 tr=0 ts=6aa3a051 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zkjlvTYbJJQcmHsFOKQA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Z0-v1gEWlD02wSY2f1iOKcZK-smkj3fw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA4OSBTYWx0ZWRfX1pjHKts9+1De
 ScN1U09nE+UZ2TpE86mmwdMvpsj30yDGsBUdVdImZAcyIDxeNPccfOmCysR1zKlN6JA8+BVkBBs
 jN10lKkCxgE8oQ5MhBbxG/To9dzPRZM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA4OSBTYWx0ZWRfX6dY5+CJANgbO
 UBKm9eVCHtFoC+qL7d9YIoK4xmf49DcBKt1K5BRkUiE9ln53alavpkqPWpY/vLcJPRmfT6nmW9a
 ctwoG+dFnnRiiO6m436DVvO/NAOEKiTTfox+tCd1USbDWxroT3MHS1n+IeuzGG7yef7Vvf9VQU2
 Y/m8WtessMLzZEIqS6I9KJjkccAfqAFZ860fbWwHLDdsvLZvOsqv3mlUgg256blWYaU9Zu0XapO
 zJ8pGjERX1O6FwkNO/CfSxiDz6aDAspR1XVsK44vu9COPzu2xqEvfo9y9uIhQBTOcaCFJhaXNp8
 Js2x7zH/4OU+kweopGcrc6wERAPg4eDGlLW6WBLbBKDzvoEDXcVafWAWVVBrrXkGCS5oFhquit7
 tfpxk2GxLGmP5iqE1eX6VSqolN3eXPiLm1ZqIl7C5ruyIaUMicW+4sITXhUCVC0k/RiKJbajs8r
 UnWPTB3o8/XRQsBq/9A==
X-Proofpoint-ORIG-GUID: Z0-v1gEWlD02wSY2f1iOKcZK-smkj3fw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110089

On Thu, Sep 10, 2026 at 06:30:43PM +0530, Anurag Pateriya wrote:
> Nord has four DDR slices with four MACH9 LLCC banks each, so it exposes
> sixteen bank regions plus the shared broadcast OR/AND pair. Add its
> compatible with a matching reg/reg-names group and raise the top level
> maxItems to eighteen.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
