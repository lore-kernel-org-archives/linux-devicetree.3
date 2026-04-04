Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FD03191D0
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 19:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775331185; cv=none; b=nuU+ZlJW3+jbxjRgYLC7eL60/3OjEyFdHlKxJBgmeTS3ofytOpglPxCya2u5C2kykBCFWG1/D702u+yXE8PCk++oAYFKyhB1TbkyPjvNXmqfcC47FkCZY+84cWxCPm3dhd3DqBckc/Q8NY7ghOYQ04nz1jCHCWYHElRdPJsmq3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775331185; c=relaxed/simple;
	bh=DeRN+dhSPVtH237e2I5oUwOFlcxcTUfyd71zgDaZA50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MlrswJR4iL1YKfoIgXLNgVWgjVPLl5Apk4Z/K1+C+pS9JB7HiXhNL/DsfEhXiO3HWTIr08BFirtgVXb2X4e9bgqafIlAPXp3U3H4HU9hwQmUUOrgXWIq77MC2XqcgaiNvfeo5j5q19lIRr2SghmJCEODp8kO+upBJlxCTbJfrjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k48eJ9qV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gnlKiwVd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k48eJ9qV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gnlKiwVd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6342CPuN4115652
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 19:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3At1cOoI+/INm38cpRwWB0kP
	WiIwZdHs8XrXBBAl3/4=; b=k48eJ9qVqDmrRHMcPSbiolkDFoagMRqys3cDzr0G
	89qYVJ2cXmysnbOupxxBpppks8HIKZzNkswFYQwuyI2XtJwgHGtmn5qp8XtxJQMT
	+okKBHVySiLTr1g+z8nfl4cpKOsuwaOowvhpxPJiUJVpAGQHkrCb70OGe874fsLV
	G4rGLEOo5qYGV9VrMCSV8VylYI0yZhAJlwwPm9GhXqg7zSRFLrUSQcwOmtCnVsF1
	7uwyHfETK+z/dVBzetwBuefSKZ8+J5ERy6oeuc5GzFq12aRg1m1U2Crja0aX5CGC
	SfY5XrF1i2qNXh11/whjQIdca0d7ufw5gIc6R5NogGrj2w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasn5sfys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 19:33:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b323c43fdso62604781cf.2
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 12:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775331182; x=1775935982; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3At1cOoI+/INm38cpRwWB0kPWiIwZdHs8XrXBBAl3/4=;
        b=gnlKiwVduy9Jl5+7NATNxcEMzcebTXGoNyWVzcy9GTW7tw/vl+Zw0jacvrRuLr42Vq
         PZGpPiKRgUugOlYYo9i3qMIx/stweT4r/QvrWxRXOvfdXoLUzdzO4iQBVefua49A0GVU
         OYk3TLXdKoqoZRvwtVWT4oNPncEi8eDeT/9CVKvBKaKcAVGPS2aH7PqbZ8WxesOdEgNB
         EaM3SbZSvV6NEBFrXvXzFVJ7v9tw9We+20/ePHrbuSRVceiT3cstC9QKAD65ZQxrX25F
         bEXuuXhowo0BIgUE2FJflczOyq0m2Ci4ZgHCjuHoVbFozj1YANFt8WmlO3eunxY6d8Dz
         JmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775331182; x=1775935982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3At1cOoI+/INm38cpRwWB0kPWiIwZdHs8XrXBBAl3/4=;
        b=aRATu1mv03wHj2i3fcuXMW2MGs7HsHmWf8f77l6gCyOOe8G6VKTuWrhkwJgQrEWfEa
         N0H4nJ7DCW/NpR4MnblK66rli4DC/6Vuqu7Os5LfVDUuo2/6oH0vVL5bbalctRck5usU
         E4VskTQ3BFTbSzi+g73XYwjT1wKZ3/Xgy9D3rHvguPqz2drSmOZAFAmjXIeXRwmKRquf
         XKRnuCVg4TvejLP93FvIhKrer8eRuN7JAmACh7MKDGkqLq1n7pusStkJSTZ034KU6Sbw
         3l5Lyf20vZ3yLLVwYgR84jGo4u9TbxhqpXOXoLHegGLHlqDF6QJAhTbuETeS56ErbJnR
         3sBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUw8LRnI0MqzGSClUnl8ab9FW0ZcxD8EnwQobtFlZC2uSRED0DMIaMTfpgHZ5xyYGVmFs0oOzj9+YD@vger.kernel.org
X-Gm-Message-State: AOJu0YwwAdWFZz1cf7vmVPeliKVdLbfPhcSD7JTVTOK2ZILHrxlhje4j
	lizyPlZIIgYwHhX4YaCqn5kGKfd3NsH3ukigjV6PCqgXwFJrS6kN6AqyFXowTfDbTwRP4xieeLA
	WVLXzav8YsjxvBUYSvuqC0JwnlWRxk+CSPBAyE2LIoUnh5RNSwIFRchRltyeVhHS9
X-Gm-Gg: AeBDiesOOAr/Cb5qLcfsy6i01OgG3b9IsEziqZIj3iIegNrQWDRYDf53SFqLMmC/hsX
	LU8KrKK19qjKds2Z+gA2Ww4y5tECPgBscrHeqrhe5jXsPqmJNv9VCMQ/GliS8tlkdLb89Rkw5aR
	X8EWmc1G0rlFvYt3mqJtJWV3eLXtAY0yamuML2vKNqJBnj0o7Pc4OluwENKEdv2YOMhbfs5OAWH
	evUtEViyw0SQOm1yh4YnsbHVXMide1Adlll33eVNnBM/xLZP5hMZO/BQLfXYtWPnBCepjBI38OM
	4fyaG6dCeccKSN2YRN7kbiHdGhUco3EYe4weWEftZNzohxAM+f7x3mL7LhFkmjI1IhtUizI1zEL
	hf8tC+qy5wvrEvDuc05XjXpdzyOVbGMBIN3J7r3+5lLXwCvE1RJPhMu1NpwwBnF/NN+AjGQtFWH
	N9AjhTk9o+OgI0Vj8xQ1vNfxnQkarapFWUJQc=
X-Received: by 2002:ac8:7d50:0:b0:50b:4ff5:9658 with SMTP id d75a77b69052e-50d62b13664mr110539131cf.55.1775331182397;
        Sat, 04 Apr 2026 12:33:02 -0700 (PDT)
X-Received: by 2002:ac8:7d50:0:b0:50b:4ff5:9658 with SMTP id d75a77b69052e-50d62b13664mr110538641cf.55.1775331181844;
        Sat, 04 Apr 2026 12:33:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd34f0sm2299930e87.76.2026.04.04.12.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:32:59 -0700 (PDT)
Date: Sat, 4 Apr 2026 22:32:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-dell-xps13-9345:
 introduce EC
Message-ID: <suabmy7pom5qc7vv2rrvy64pujnziubghgp55gjvatdmlo4xo6@gial6xwm64dz>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
 <20260404-dell-xps-9345-ec-v2-4-c977c3caa81f@vinarskis.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404-dell-xps-9345-ec-v2-4-c977c3caa81f@vinarskis.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE4NiBTYWx0ZWRfX1i6lEkakQ/rt
 n1qYV3jI+JpJZAcp7FC7IScMgIWZmlM13AI/BmUp6KA/sDVGb3gvHMEIWIUdgIWg7a8xntX3qwy
 AZUJ/nxA3c+f7j9SUSkWVr9e+VFGV95T51iXt17Q9/1cei1b7kghp9pEeO9Bpa8UiXRHMnZMUr4
 gRs82Iz+p7gSQeT0TBtpBVGg3//iILgw8S8Pd0/Qb2V1O12hfxplHfvSCaY5Kh3yLqYW8HLIkSq
 IRxCj63f8ue34AS5CmdCVY4QQFO63n2Q4M1TEeUEdfoknEF1Iyi/+7x7oPM7gKFx70IQgjZlOlB
 dtoHJwEtCDCq0DatXQ9ux3/fs0OEV35Z78qcZ7qKTdhXKglHi9HQT3ZsDVLtchBpqKAznTtpSge
 I+ScmvacteSgak+BO08O+dOY1Wy0zc6yH/13Gvl36OCfGWsA1aIlgMH+uFF0y9UbM2503mGLjGS
 rvMEnwXob0+Fz4YYthw==
X-Proofpoint-ORIG-GUID: vDD7eaup-k87uKkefZMaxcZoQY0NewMh
X-Authority-Analysis: v=2.4 cv=K9wv3iWI c=1 sm=1 tr=0 ts=69d1676e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=I76Qk8w-AAAA:8
 a=EUspDBNiAAAA:8 a=BDX-M9UYCxStvK4FQfUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-GUID: vDD7eaup-k87uKkefZMaxcZoQY0NewMh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040186

On Sat, Apr 04, 2026 at 02:55:17PM +0200, Aleksandrs Vinarskis wrote:
> Describe embedded controller, its interrupt and required thermal zones.
> Add EC's reset GPIO to reserved range, as triggering it during device
> operation leads to unrecoverable and unusable state.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     | 94 +++++++++++++++++++++-
>  1 file changed, 92 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
