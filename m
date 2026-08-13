Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D0E49502F
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786638389; cv=none; b=T+dQ9mOAexw2m7awXmFIF5SGJJQBnSVD4qI15DG47Nx2J9XUtPnRughyLYET47wfD8AshlqynS7gSHTKPbcZ92lnj5o+a9drFOT4sMSd3GWe8RxH3QdWFRLUNZRjeRG7RjdD7/w4eBzCYDpV2Mi74iXtv6y8/qfnBGXdwiJ7hKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786638389; c=relaxed/simple;
	bh=eIUJTWVfIK5NoWbIj8sZsZZIkRY00tWVLfC6o8gUNho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WjxWsM2sEG4ywx4OsJXPysRo5MlvQ3UtcxdI/wl9QPFysFpm9Z84DblukF2Qsqui+VOITJ/okAHIGMznMFnIVfdAzCtaUJzczHwcrOGmsXWTU2o4qL/BbiozeiRp1BJ/rkU81Wqz78z7sLM5Y7oBvR3t/QEMi9uMEv/VlWmzvgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=byomBt3V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gZOMEAw0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="byomBt3V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gZOMEAw0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFwrTx3249266
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6RfxM2ertZqIr+2plkalpmps
	fFAQnAaF+gcYLua2ztA=; b=byomBt3VpgmEO75Eav+uM5WxGNaJaSzHFLXCVFhj
	iaLxn7f9B/Lt32VbKY2Mf39PzdfCKGRunJ3NHkfSpntJeT2F2IgeQIzromBvs/ij
	GU7Qhc1jFQrgCu2uNuRwmvjMqzzOtuev3psln6gA4UGRwZaAiJ08qm2VdTSBGQzH
	n4dc9j9NmEg4cSbKX3JEVy2bIMMot0Dp0rrdIcpVIlgygQc0D8XIqM6Pv2/mFxqf
	JQ0rNFrzeaC7Je1W9C45f/nUXxDTXHMbJElYi6nKiT4NZOjaHDspCre4yJwGExZq
	r3Zn6R4zhdlbs7sEI1zib2WhiNeeqnGbNcgWqTbZ2/6EVA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h1ur538-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:26:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5283df62d68so1506311cf.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 09:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786638383; x=1787243183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6RfxM2ertZqIr+2plkalpmpsfFAQnAaF+gcYLua2ztA=;
        b=gZOMEAw0vafhZz4oN302/hTBfhZ7vW2hZChYi7AA60YQ2F6aUQoYdX+vyzn8+41JhC
         rDUuyHQbrlFIbRkosFP8BRrUQX3nv1e77LgDXNJvcstDxYGTqOtcl8uMGvAQ2tZUXcAh
         IArXgos6yUUmd5QNfR42HkNJTmZhuOZnk+6XQK5kto8E4s63pHTSPY8gZjuuTZwlw2b0
         QrOIY5WuBbiWmm5d8j4p6bBN2jpE2NQ1EsiauyXvc2Lw0Y5vRd4u31WoGQVydx7e37PY
         MJXPGIGGejOK4bpgoZ0iPLcYE0VAou6VLhnMbnXrFnYd6D1GZpIYQ1xdQU2xTYTifP+w
         pYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786638383; x=1787243183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6RfxM2ertZqIr+2plkalpmpsfFAQnAaF+gcYLua2ztA=;
        b=dXnQTiBmfMKo7TKTzbKumSEUHK2ceOrskWQgPuYrjwBsZUVsX5ZyQ+IP0/Rs5NShHv
         UQgZoWsv7omdIXsjGdIfid61CybHiW72tcTq1t2SlCQXRH4n0Me0WSO8Ko648fVfo+KJ
         2P/A7nnjyDl2xoOkUWv84Cw05wrvlO33txdcc7uNOx9BmRaH/aUyQj9e1EWm8AW1XwKO
         xUZnNro68kIrZ0xnYzPAg5jkXutAUtfaVL/sG/AWYypJIn3BT+iGafOiWUMrmN/RBeN5
         yddH0I03G/hov2lxafrxLrk3zsp/fc5J5+TqYO4ghR1C0jZvm978ueM2RH/q2tiVjCcZ
         q+Ag==
X-Forwarded-Encrypted: i=1; AHgh+RpX7GkMudVKNLT6J3AducFZQ/DUkWHWxthry8xGV+WeheUlUJrd74bLG40yQx5QPITZS6dq4tJdSyZ3@vger.kernel.org
X-Gm-Message-State: AOJu0YyDVAgOVd+DaDtjIgu1QNIjhA6rIxm4K9uGTQoWL7NKYnCllYc6
	he9FgKyfJnt+3MTXL/uV9hBedwIIyzQuhFL32U67j1lgMrHxqLYgeAd6QnlIahwQRpOPbLq20vN
	45CDc1DMx2JwxqyFDPt+slvs1H5G2KUPAdI+BP2Y5NDtrlBRVP0gOQKo/H8YxOiGU
X-Gm-Gg: AR+sD13x/RO/q/qo3Stvzs/ZjL5977Q9tcJ581yq+fWbEdlxbUWgpQu7H47Rte4nLIl
	kq5Qz8VaP80+Wg03+SjIMzsEZfWEyS64eihU0VZG5ykLCDGjpy5MZxXDV4eAxIEcCmFnJ238uuT
	uLVrLU98VqdFHytAgeELHs2NdbBmgL41JgwjAz4506jy1Ftb+G7TPgLYdNpp2ckJmQeNokHO78n
	QiyH+a118ENIues1PZfMV/X1ZxFcIxG16sE3p1SdQFVI2wd58nxg5X6+6Vz2HctJrTzQysNZcTj
	UdUaDMUlhYCo7D+Cef6sQ2kmxBusNgDfj0ou7EVaXLL+6VOfvbKxoYNub05yE7Rmd+DI+FANRqo
	kxeliI4gvd7WwLsThSOxqwalOhNMClfeLARkYtxGxxvoAk2wf4Ab+MmU5sQY70Oa8WpRv/ke5AA
	zi4oJiE3RcL3gL
X-Received: by 2002:a05:622a:1f07:b0:527:f4d0:4bb8 with SMTP id d75a77b69052e-52d73cf93e1mr88840541cf.22.1786638382914;
        Thu, 13 Aug 2026 09:26:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1f07:b0:527:f4d0:4bb8 with SMTP id d75a77b69052e-52d73cf93e1mr88839301cf.22.1786638382256;
        Thu, 13 Aug 2026 09:26:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b453a548besm600836e87.42.2026.08.13.09.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:26:21 -0700 (PDT)
Date: Thu, 13 Aug 2026 19:26:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sm8750: Add GPU and GMU nodes
Message-ID: <4tr55ef4n3zdcecln477zuxkty7zlv3lkzm4ke346cgcjqnw7z@25npbkmfltoh>
References: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
 <20260809-pakala-gpu-v1-3-207ad1fac1c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809-pakala-gpu-v1-3-207ad1fac1c7@oss.qualcomm.com>
X-Proofpoint-GUID: aR6SNmZcC5f5_PL3xlFawypyPwLB2-Bt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExOCBTYWx0ZWRfX6noz5WGjgH4a
 2/MPsZgipIGC/PRj+SfBDq87CGpAm/M7CAOBUkriA2CalDv6pGnA5UNCvyh/OGPaaZSBNBdRhqz
 e+T9V6m9PukZ9xzXZe3IYOW5Y3jwqxVIQxESqzxn7DmPgaip2LzmSFgJf2JnjyFDn7cLLj2dn6P
 0n7zb90GmHSc/HWM+Vsd5SIA1fZbgF5fZIPGGmUgxfltnVVUC+3qz/jbhfBdoqZogasa/dy9xak
 1d6tPyfvo9x7Ce91CtCajNycRXXf1Auj2/6D9FMA6ZMn13OlQsSx6fAngSO+zhoU/cDTmoIH/76
 VktXDa00zV2k+AMsLBbfQ8j+XdCTk5Jpj9sQXP/AtAA2l62fRkwqalv8QuJRAhiSlGFjtjUCTs5
 OiqZD6FczQrVlNpryw6EKKLHU33Gs5qdk9EAA7E/zVe7uIhsbFtxusSolKkW23thHvW1kzGDlA5
 dea4WYt3nVKlOIhsu4g==
X-Proofpoint-ORIG-GUID: aR6SNmZcC5f5_PL3xlFawypyPwLB2-Bt
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=6a7df02f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=qJow9a4cVNqwEOATeeYA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExOCBTYWx0ZWRfXyTXVC1zZSM/K
 BjzRVbsgXAAjOrONtXHp8whHEeRFQXxc5Fk6sfX7Fl6vbpn+8qC7RRa+7gXsDvtLoWBbClrieNS
 maj/QCToQBlPDt5bl6IhBModPrgrtyo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130118

On Sun, Aug 09, 2026 at 01:53:10AM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Adreno 830 GPU present in SM8750 chipset belongs to the A8x family of
> Adreno GPU. It is similar to Adreno 840 GPU with some meaningful
> differences like GMEM size, register file size etc.
> 
> Describe A830 GPU and GMU nodes in SM8750 devicetree. Also, add the
> qfprom node to describe the GPU speedbin fuse register.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 231 +++++++++++++++++++++++++++++++++++
>  1 file changed, 231 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
