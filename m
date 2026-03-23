Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3F379CD
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 23:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774306881; cv=none; b=paE1WBSXlr0IxKtTFDRVLlnHrq+hwNz9bcLh2jYNqw0GRvwzSXmLmXno7/pkGiV2SOo4a/yZfYF+kUFMXk6NxQx3Iv/f7p9nLI7phMtJ/BQt6B2SdP0T7FurHUNxid61d9QuwD7Yv07x+S8jx7Z1aLYJMAjb+j4Fvqa9bNaFvRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774306881; c=relaxed/simple;
	bh=Tb+Z8GuKeek48XbV6QIpX2DPLuWKYStlQGb3VmRTzFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMotTG3L9bM67qPas77bMdaWHq5VTMdojitGT7F8td+FeGGnPtFGRi4+jXp19kp2Xd+jIYa/IA+QE4OUeDdug7vdyyGAY/ENcT1g3IXoywENychvZOGdccBMDkmzSO/Kl3k/hbKZea4kF3JK+U9zlyQFh0Xfz101mfejoCOr0nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BvtDVydc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFZ49ESN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BvtDVydc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFZ49ESN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqie72681190
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 23:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q83DlxsCYpBtiw5cxyyfSIM+
	Az8n5kRS1O8Tx0ZwVCU=; b=BvtDVydc32e40118HQDIWurp9kmaWhyxxQDrEcy2
	KcVz2YDnEpysi5JrXCv9lpDt3RQXh7roVCIBVEPanaJXNW1vEP8dgaGUyUgzg/gW
	kYspIEiMzMFhBZo7f5fEsLaSMBFTpvGdPlu5JRqTvn7BQomeLvdEogxreU3abc4/
	NU+CLVkej7sgBCwuXXkhIpo2Q+Wkq4ZyD3XhYSg/s6V3ff1VdmlnTJLZXVqL6+HC
	UeJdT7Zy/WkNXdPZ6nsBQ2d8uubKgPe/3NxPuanDV/5XguRmtAzoOkkB25W5+qAQ
	SmAmSbdAcDM1RhkQy78raSM2A9kxvUhmDTGqInA+Xf3fjw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p7b0sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 23:01:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4987c698so246283961cf.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 16:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774306879; x=1774911679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q83DlxsCYpBtiw5cxyyfSIM+Az8n5kRS1O8Tx0ZwVCU=;
        b=KFZ49ESNXjMH1Jy/lHFsdHzEmOLwUQXu4ddDzGtWSkBiQkgS/KwmCTvb3RzYrd4+Ey
         xV5WEajpIFIVPSSey5g3MSBOtBsrUtJ4a2mNy29u5HCvR8ImEIyp3Z4yFlxeKsRTJXeA
         vU/tx5CsEVBi+awbePWbtT4vbWNxQNlV+OGrOtQbNlvcwTu1iw9o+uj8MtGivG0ukynn
         CmI1dvajkMGDOJUPt7POtyLLJFxSbbHttito8mKlARXuQcPzdsMVxr5wIWWknCzV8hGa
         L2cs6on1WrffHkqcQoIvsxSHQ4G3WC4Tcei/iHmhrDmedJ+kyhokkq/qzpX8xu0Ap0DB
         K5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774306879; x=1774911679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q83DlxsCYpBtiw5cxyyfSIM+Az8n5kRS1O8Tx0ZwVCU=;
        b=JFg4Lb1n0EQeguvGMMJ1R4ZDjPpQOkTvdLMTR9OxzfLZcHr/cpAp0rwJ8spk/tlYpc
         DKe71ajaafnYw0hnrIBDeukIcS+vWBNlPYjd27vfLbS32GSWOMgydYqPXRfHqvKaUl+y
         KfMUhyScaAKrFf3EFLPu/46pAhSwwYCEdT0c0XGbI9xACiPbwLd84QhA1nh3MrtWZKpJ
         /2BQtUay3Kf+bFta01JblPnyjxyXx118IjmqOF80iHTR09yErJ0kkIXLVIEfDzMEwNHM
         HiaU1qASdFIIED+zg0Q+nqLWriLWLGlhyfgnpP+CMvfNlHvWL9RxI8slm+eX+hI7JFoY
         uVxA==
X-Forwarded-Encrypted: i=1; AJvYcCWB9gsIgbzPEXe3+Mfty3vKf0u8y3K4qO8vX7eEGEjpDFpwntR/5zgzazxVw/ke1sWcPJhGwhEXSJQZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxxnPDykLhwVCyVf3qdqNkcq+wKypoOVxDZjpXXfzSUtp59DHzM
	kE2yeg1kPtRUrO1U4x6SJytUDTH+XDEUxQacyCxle/fHx44W2iwp4XhsoVp4mF7yiwR85ZJE0iM
	qf5YnpZDVL7gA+JhmOuB0zS2Q8N9AbXLKEwb+MSvY2bf45libQwoZENrEfGhThXHu
X-Gm-Gg: ATEYQzxQUN8CvSM/3IC3pXoRzLYNxiGvC/9KtdD7LVlNa2GZ1zS6XP07zf4D/Gaw0uP
	3aUNNnCq738ELTTVylCm6HIfP7m8+XXXJc4puOoe+6WFdviLtIOXCRO5r6oyUzGeeNS9f9tlOka
	/pFpdCKx/Zo0a6QYiIsf2P8NvdtenJN/LMDo7jfivkxbDTAgZ1xhgYfleWzvs49kOS/tPpersmw
	ioODPp/sU9QjH33KzltewhhBZOxw45UnhHyLtW6sOiVDcBIoHgfGitr8lzJGOximtgShC1xL6Gq
	sYuGBdKxDmH7QImVz+CstYE9cClshZYHAEGQ/klmhrHNrwDlASJol6TuDs5jSHPFEFsIGq/qNUI
	8dmYjRB7RB6NLckRdp6z3XUTt16YAQMfKZ8x1zlXw4V/YUW+1qjdzJpRglhhe8Fv0yaE8eyqafX
	k2Y0H76wqlm01nBw4nkcgdrB5vC7sHzGtyYGE=
X-Received: by 2002:ac8:5894:0:b0:50b:6d63:6a2b with SMTP id d75a77b69052e-50b6ed42b5amr21243331cf.2.1774306879025;
        Mon, 23 Mar 2026 16:01:19 -0700 (PDT)
X-Received: by 2002:ac8:5894:0:b0:50b:6d63:6a2b with SMTP id d75a77b69052e-50b6ed42b5amr21242711cf.2.1774306878459;
        Mon, 23 Mar 2026 16:01:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a296d7c93fsm82072e87.51.2026.03.23.16.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 16:01:15 -0700 (PDT)
Date: Tue, 24 Mar 2026 01:01:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: purwa-iot-evk: Add SDC2 node for purwa
 iot evk board
Message-ID: <7qjxbdsmscscpj4lx3cqs4endzjumoqbnqujnevnyks3dcqk6e@nv5d5ygyxoa5>
References: <20260323110017.2527956-1-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323110017.2527956-1-sarthak.garg@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c1c63f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=PX_5yWcNQeZoHduem6cA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: _GwNZ5eeSEZnq9vOnPhntq51dQKDpObQ
X-Proofpoint-GUID: _GwNZ5eeSEZnq9vOnPhntq51dQKDpObQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE3MCBTYWx0ZWRfXyL1DbaCy7cf9
 spCMieVK0SE6QGaaQpznqWvNx2ep9UmlZuv/+RK4MU2UWpS7O61QNBnp3JEB5MtHE4XEURuWdKI
 uMmQCfb/GhH64OmMVBi9/4nN+BgojOEWckRr85Tdurvxc18KvoDBj/hIJNAK3WQWQ9v2X3pTWLN
 oM88rHLtRy1raOCdrZsbmS5jVPikjR5DNMuqZOJB8Q5px4iTn+K/HECWNZbNQGL7McnoJ4NVlkf
 48W175o+wvVYiiyfjZ2OgmR9Gu4u5KCnSGE+uN7R31GaslKyKn45eJxeCtXuo8QxF1Q+6Ie15/o
 cSroyUVA187eS9f4Liz5lQgzfDGVcdQ3Hy2W3dNSrwSGXSHXlvAeS90VRhFQ1u0QZWNSak8hEyw
 Noon0/I0QC0M2oIUAt+rjIFCpIUx1hv6a/rY6mMV0/KR3v6V7qmrhkRxh+zAJc4wfPMDCVfVoLF
 tloDDt5PadcMbqtaJOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230170

On Mon, Mar 23, 2026 at 04:30:17PM +0530, Sarthak Garg wrote:
> Enable SD Card host controller for purwa iot evk board.

IoT, EVK. But more importantly: is there a uSD slot on Hamoa IoT EVK?

> 
> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
-- 
With best wishes
Dmitry
