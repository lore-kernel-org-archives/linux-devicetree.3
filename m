Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED35B1E515
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 18:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777920259; cv=none; b=Loc5OnQGRul5ZpfUOJmRcmWV3ZZWYLMaheRw4zz4Cs+HJwWvvJxSabAi3v3odZnqG2SxtX0dhC7+i5yER5seCKR5sqbubM11u4MtyB6r4paYfn+CxHW84fPs0rb9CVI64rqw1Y9yFvSzcbRVbzJMMf0uM6JeGAuCLJUUlz0EAvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777920259; c=relaxed/simple;
	bh=WD4j2H6bjtGAkyS0SVJAyteT6SmMdBs8nq9xxpMfJ7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTrq/P58PvlFvlKYdccsydv84Da/UQgdibktquiQiruA5a/pTvo323P4teYghPjNhAel0kBB2SDtPA25pROqRq6/ZFBiMOzjLv/iDC90TAqcdJs3auBmuCCDBID++pmprPoYgg4TciJNTzeqvCYKCOq8Uzg6vEnwfvO4M7dbn1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F/DeQ5BI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UAMqMe6N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F/DeQ5BI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UAMqMe6N"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644Dlefg299216
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 18:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ODJgdbaATypYTwgXsHa+P3wZ
	xEFcEM51s1kFGKOx+lQ=; b=F/DeQ5BImE89iAmE2mNHtpS0OVfObuTgXNNGmbk+
	7hWMknWEdQ2C0RSzlrFijJjH/Btco+AYHVlUvOC7E8mTadbqyPjcXjwx1wzccN/k
	2s24wfRi9DxB7/pzmBH4zns2pZtyHDcoSWsd2NgpM9FLGQVgCRt3DaqtsaKoJnJG
	rmO91m0Dpqpz46yuK+JHGHkCXusQHUptiVw9K3UUrj3qtLYumiukBc4+mfUeQ7fj
	UmPT8F6cv0MoWBIZvyxS/7zst+vsCAjVH4R/digvuFHDRoMWC2z+XtZP7nW7bJA+
	uvOfNo/Ch3ANjoYn7im5i1OF9Ilrx8TcRwDw9++L28xkLw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvnd96sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 18:44:17 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-62f471aa288so1123966137.2
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 11:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777920256; x=1778525056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ODJgdbaATypYTwgXsHa+P3wZxEFcEM51s1kFGKOx+lQ=;
        b=UAMqMe6NPQWcCz2yiNvQPYhyOqEEOvrxKBSWjRsUiA8t8z56LZJpCa64E5obEUy5x4
         VOxlaRfFHNP4Tnq4qw+XhNuIfeUd36KZTz8eKuqCq2NKpwQPwKD9n/oNXGaP7XZ6J61s
         f3bmqNhtPknc0cMCJxZRqEHIAWJkktoVdmEAk2cDYGyh+I4vnSSQivj7LYsCHFxrDwAq
         +dYu0DtJ/W5zylAfE3ScG0JzTQ8iD46Yr7Hh562kHBLS/mNo3md7CCCBvaSMOwTAqKcD
         pwnxyqtCV5WRaS+ZGi/d1642WJkj5x43V1FxpB8KiM1fo77TyeHLrx6WeC9SFBNMIk3i
         tVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777920256; x=1778525056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODJgdbaATypYTwgXsHa+P3wZxEFcEM51s1kFGKOx+lQ=;
        b=CmBYEaRP+E4787qSzfDG11SDPuBq2JapLnJbs2af4h8OtMpaNOA/rh6M612P2A4DlV
         Ey6imJ+2o8GuY8x9JxMKNHZVyKMlSka1mEQbhtG2bZX1VrGbmfcC5AISVrmytvDdn0Eu
         JPflSurcGlSpD2pBaXUdQt+FWf+4KlbxIDQ9Dx78zmjwUeNb+xTY+z47wQq1fWlQy/Mq
         /6dZTzbjts8g1yaOjmMH3XHtOHYo9Rz3/keQmGW/4889AYBmUhl7aYwE6T+jBdos+O5e
         y7XPf4T3PH9F7WrH13K2EjbeUPdM6SBqzimSl/PNeIiM+YCx+lm5uXSabxrLZmDd/d/w
         KKYw==
X-Forwarded-Encrypted: i=1; AFNElJ8CzT6UOeaJ4ZhA60+SInjR19WTRESXfwX+Qt7hkI+cEwVdv0LnjlS7PuJbpAEZv/tk5CllH957wTYm@vger.kernel.org
X-Gm-Message-State: AOJu0YweOjEmjcGF2XXs0Ib0Czqp6rXTvrj0J8lTQOIFylGTJe2Xypmk
	ifOfCf/LxNQEux/OFkqjiYCIt84thHboTCv752aVZdMgWYJrta0qZrvlUb0fE7cj/jHiy9tVRwC
	ZL1dfpUe/k8Vf0O01OdGE//b3GcgugVCWNzIQ1X0Bu1Hicw9JN6mo/lJxWfztxY/m
X-Gm-Gg: AeBDiesS0myH5zq9YM5reaivG/FRtfozy2O19vx4EUHBaZAfTF0Io00T2ae8ln9Hra6
	GiJVM3TkB/qd22vNYoaKEAtfRcSTl8a8YTTudqLep3eATI7zaQZxm7s0I6yvhgegDhhksLWbS3N
	TpAbQ28MdVa4o9wakbBYQ6PXJiaxieIeTBDAEnzMuDEhwLKpZEoS7i131TJuXzlSUMoJZs0PiLZ
	MfKx+U1ZDDrGH7XZJ2BlzyrtBiZL2W1zix4q35fUAclrA/4xcXxN2MWztXPJwShUqvoVtAqgGA/
	Lnz/GEpNZkWV6BACHFlYE/Yxi9iHePUakta2VkaEjZt7p6+Iajq1wGMLZROuMIAGT4XRqs3XWbv
	5dxNyWcOCOKFe1YXMqKRZZVlAYL8YcyvjExNy06/Z0Yyo2+a6Gtc67CUeitu0iP3XMxdVG/yqkm
	Ogep1iulRk6iTYkZRvunZD2SkKGQLUf5Okco/hnSxbEyc/kg==
X-Received: by 2002:a05:6102:6045:b0:609:4d86:81b with SMTP id ada2fe7eead31-62d87b816dfmr4742505137.27.1777920256345;
        Mon, 04 May 2026 11:44:16 -0700 (PDT)
X-Received: by 2002:a05:6102:6045:b0:609:4d86:81b with SMTP id ada2fe7eead31-62d87b816dfmr4742493137.27.1777920255883;
        Mon, 04 May 2026 11:44:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3936138e55esm33135481fa.42.2026.05.04.11.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 11:44:13 -0700 (PDT)
Date: Mon, 4 May 2026 21:44:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: monaco-evk: Extract common EVK
 hardware into shared dtsi
Message-ID: <36ghmwuwqgm3d432nkklw4igl6wpr5snug7jpha6ioz52qev7f@4g5pxcjxx5rg>
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _dL9nsnvKbnOrTHQq1XcldJopgo7k8pA
X-Authority-Analysis: v=2.4 cv=d9jFDxjE c=1 sm=1 tr=0 ts=69f8e901 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=5bUN7AB3zD810d2lrvgA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: _dL9nsnvKbnOrTHQq1XcldJopgo7k8pA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE3MSBTYWx0ZWRfX3wdQg2ELawi/
 mpEolu1iy1frraAVT0otH9ixy0/0J4KM8cXip89GI4Emb2ZGYlD2xAvAsA4yKLVsoxJr/SbEUO/
 dWTq8bkw+2HPhgo4sx2phtD2gEXB5vWUCUeUzwjvtWt6CbpN5JxyFdCmtooQE+Rl/QZ8TYC1eGh
 6EXB/sMLRKx8xklaXUtPtA9ebAmO7z7JPvGSzevj++P41RR3lbFAT0QXecrFr800UjfDfEDshuY
 ek2RxChQS7yHg2qgZTNXIafK4/dWgc4j+g817kcNQa1PQcLluNcYXxmGnyXxacCm9RGfJ34N+oB
 bKjVpWn/h/NXXDOVQ6eEWp29qnjsd1qu+xZ5wILnmiq2VzfRTDX0Rlau1QQaXNft9sPqFmiqBBx
 Y4iBPyELy1dqLhbvvv2NfRiW7MXvFba2NvLcNgqgIQyhgKxNu2E7dmOQXrobQ0kSmaLB7F43Hj3
 q4tde6AeD8Nm2bJGecw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040171

On Mon, Apr 27, 2026 at 10:35:02PM +0530, Umang Chheda wrote:
> The monaco-ac EVK is a new board variant which shares the majority of
> its hardware description with the existing monaco-evk board.

No, this is not a good reason. Is there a common PCB? There was a long
discussion for it for the Hamoa / Purwa EVK.

> 
> In preparation for adding this variant, extract the common hardware
> nodes from monaco-evk.dts into a new shared monaco-evk-common.dtsi
> include file, and update monaco-evk.dts to include it and keep only
> board-specific overrides.
> 
> No functional change intended.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---

-- 
With best wishes
Dmitry
