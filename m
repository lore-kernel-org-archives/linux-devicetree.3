Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DCD36A03A
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026746; cv=none; b=pgDKDyWfmar5tYCBZzqrTm9AzptdAQ5ZYRXzaMbwhITNkCxnsx/ai3tHQOMEOPRc4zPzRCos0RuTD6lFjIjh3k1n/Vrlbme56aVfXcPhaho8CAbcswlOw9x09NgN5C41aunpCyJCHFsq3zaHZfqnlgaT8/FaImmlGxhjpOlkTPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026746; c=relaxed/simple;
	bh=T7WkAEnwuSu6CxqIu98ePaTAeo7wDvHto7Da/AI9ks0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPfxIJqnpwUjIwZw6v36BPFo9c+wIJV0bHEGt/TClqnFZtNFW1woUrlFVsBSyN783CZwnGQd629aXvWfVSZUyScv8rBSMe1HosUb/lZdzKs/VuM0xcYRDb9dKwlgMaIjV9G8xhkNaFqn7EvpZhoyHu6MXvlNgDwRXTFdOXJXs6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHISf7a5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYzurU61; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHISf7a5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYzurU61"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O83EWm1888545
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MVkSXzb92ByoCC+6I5IaVA5g
	vdBKNRSIBMB9RsJNUwk=; b=OHISf7a5OP4oPZ8v0BkbcBY9uLx7WZiCTK6DFcIb
	K74x2NBOXT1b8n7eALuqhHok6adUl42I/V0sHEqhgZ41xTdAkntBCEhLLl7qSV45
	Pjdq7iu0/Su2CCYb5RoUU2BI5n5lVt9gmOlFbWX3rLqYZKvemru4mRLrFVYweaEr
	Oq85oxYPVydI9xNPJ8pFtf26r385bgb9CH9B0NK7X/4/cVXK6LkpQE2rBKrPWiQW
	nkFVjHdrLZJJneFPR8BI2bxeLq5W10xmq56VsLQu+6lyV2Cqc4ajkeXayBQLSX83
	b7PYQzyylVvh6Ax2I2Na0UE0nBMwtUMhVf0aOv0x2vu4bw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqp9dv4hw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:32:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d890580e1so91241331cf.3
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 03:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777026744; x=1777631544; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MVkSXzb92ByoCC+6I5IaVA5gvdBKNRSIBMB9RsJNUwk=;
        b=LYzurU61eqjRs6fu7Iao5ABTp/63cEjQuNz1MT8UNNGcJiGVYjrNvcyyltJJcxEUEe
         X3MEBTkYG5LjDuGnUlM+AKO1wx8AgDrW0xiogJuUMRwdkpNuCZfRKlK2eVCoc3tdJ4ij
         K4eEI0icSnflZhdxYB0NnKxj4+UnCmFn114sB4fzmgXG51vEZ27SJ8iHDGUHS/3naO9R
         P1U9ufF1kXlYuqOw52IaVjhpeXWsVCy37ODdKRcajRf/oPXwFxTh7/WKmob8IOA8sveN
         PR/twgCENFbkSQk/FBsuldk0XGBLTeSuZ6SanMElH7K/ffHVFgmF/jYYzFU+zECeklkA
         Ukfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777026744; x=1777631544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MVkSXzb92ByoCC+6I5IaVA5gvdBKNRSIBMB9RsJNUwk=;
        b=A7PUCljoHoQkK1ew6sn/nLjCZNmPDYrpzJ/zZZmDuVhBKEQXKL8PNskRdigdAhFmnP
         gj0NL87noPtG3pwHR5LviIVlWp9I89WgU/RMoM6rzFAyLWt1NGRONmGCcCzXet8UHZ8f
         efrfBSKwpaqTqOTu/M+3j9KpEeE4Xti0/nhjJku8iFS1401PuxIW6XJd8z4/xSJVz5Rn
         7HiFNWCJyME/t3cYTPYcUt/U+1NsFQPgnilHx56QGNH61NMgaI21OawKRGkyA0ozVRb4
         hfOSugZQEJxJqOf4zpc66yxrl5ES3M0al0OKAq9AtYZ7OUpxChPmeGrwGqmrLBfyukBx
         50xA==
X-Forwarded-Encrypted: i=1; AFNElJ/yTE3D8Iy7pBh0UGKvqBVnA2/t57JVNAAPUFQVjDmyrYr3rALjV+HJ5Wa2lq1JdkSgqJT4+IFs7PJ5@vger.kernel.org
X-Gm-Message-State: AOJu0YyRcwEBRG98Pi3ukJp4yyno1sPiPCse013IsmTW4FcT7bxyB5L6
	R/Gne1QBtPCPitfIiVF+HdUeBqIDFQsxKg67ZhjAucXy4wY3OrUr+BRpPUHI6EJ2A42Q2ySmui4
	VUqlRALvJUy/oaQQ0dTIk0WR3tEqr97Mv+9F9zvkXMWtUID1yvnxhIiEnDItglRr6
X-Gm-Gg: AeBDievQEJt4e5WgfIyW2/feqyxLihFiQcEo1TESZjz08riXSma4hEgkeEcfWgzHibO
	UpR2Zd41XFFzQyak3BufCEzqK6eb6NtkWd4AB4BdD8K8fCTCrjCJsLI/YsnV7auQ+eNEjkvQhT6
	NExrLPK6nyA8hX12AhPphliFtBvBn6dwOtTgHviCgkcAxNmTmfWFSyj0C6JcPHQbGnK/NsHCZMz
	g96FiHuEAQGRJW/VPKDUHgCttmiqASO2jXYV2+Y3gMaJH48iQ9XYmunHPGiMLkE1hybST+3y4pA
	f4Csxq4sZ4CALVYsb/oymJet4G0kLBuHSTnC3rDU5Xb1/fszpDSYO4AkV+XhsaPbPyPSQaye5eU
	6vaRqX4s8T9eboQUfTv0YDVOYeGvyaWkZfk60XVvJDwRDj/c=
X-Received: by 2002:ac8:7fc5:0:b0:50d:7c13:6b14 with SMTP id d75a77b69052e-50e36bcaa7fmr451953581cf.14.1777026743852;
        Fri, 24 Apr 2026 03:32:23 -0700 (PDT)
X-Received: by 2002:ac8:7fc5:0:b0:50d:7c13:6b14 with SMTP id d75a77b69052e-50e36bcaa7fmr451953131cf.14.1777026743372;
        Fri, 24 Apr 2026 03:32:23 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc09b1sm59904989f8f.9.2026.04.24.03.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 03:32:22 -0700 (PDT)
Date: Fri, 24 Apr 2026 13:32:20 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] pinctrl: qcom: eliza: Split QUP1_SE4 lanes
Message-ID: <zdfkufie5chwqazms3sesgisvitwlwrupmkoqlfcvhpqemhqtq@7uj6qkth5noq>
References: <20260423-fix-eliza-pinctrl-v3-0-68b24893ae63@pm.me>
 <20260423-fix-eliza-pinctrl-v3-4-68b24893ae63@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-fix-eliza-pinctrl-v3-4-68b24893ae63@pm.me>
X-Proofpoint-ORIG-GUID: EAKHDCrgw1B6CZf9M8wTpBKl7TRlp68n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5OSBTYWx0ZWRfXxQwwlHEhYxdz
 5w4UffWOejse5SozCmDDMvqnCFASI9C9HKqCxD78YV6UYjer0qj/yRIbdIRwdIgM9UPMihogVuz
 NjYCh1AsDsdVe11nILonHQVyfT/4yUD+I+mZYfn46S4hVB/ACSJNNNfxc/95Jp8K5BnPIN77n46
 7p7M7mz48LAbUT+28aOB8oBrzTmUyEciC56vWg0GcEcp/mNuREfuoaviOX1J1EOR+2SCBa8FGQc
 bZDXRv19QUazhn7ZnZ9SPPdloVgYqzfFvSHkYd3hGV3ut8d9ZIFWAz3/qpef+BAu+12X4DYZkw0
 TUVwrzobfNnl06JvHkqXTjmELa5mBoelXg2sQ1hXCbc3fb9DsY4EEdHGPMEvXOtDEcTrDigLLRI
 28mSGx0U7Wnx+ckxHZr3AEHG3FWcysPnCFhNM1oZYQnhYrdI8oTSKgDSc130bor7R6DimpOKG5C
 dgLLk2ZNK4nC5aJbxnQ==
X-Authority-Analysis: v=2.4 cv=fP4JG5ae c=1 sm=1 tr=0 ts=69eb46b8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=27t9AhEcw4iSZbU8vf0A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: EAKHDCrgw1B6CZf9M8wTpBKl7TRlp68n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240099

On 26-04-23 04:43:46, Alexander Koskovich wrote:
> QUP1_SE4 shares GPIO_36 & GPIO_37 for both L0/L1 and L3/L2 so the
> function name cannot be the same or the alternate function cannot
> be selected.
> 
> Split them up into individual lane functions so boards can specify.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
