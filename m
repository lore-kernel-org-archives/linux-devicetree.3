Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCC931F9BF
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 23:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776468448; cv=none; b=A5zuTaBkzjjXY0CfJ+EcbDU0FAILzoNcNaNLwqZddelKNp5cTevbcJLH/a90GcVR7jhrn0U5WoSxDDhRhJRRPjaoh7uttWk5tAqbqbo2/9RJCObq6JoZmMtTr7H9bmr+wNVNX+Ku72sNbhwC3Cz7ph4NrBBDk7mRRS60Kv4wNeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776468448; c=relaxed/simple;
	bh=3r0QSKsoUObaFpYZ1l0DZY7WdO1zVcoHrJ3v9kXtM6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NbT//5RNmugkCmPvhf4IKudGeBEuVmBrxnHM2ThtpnMpwvcK56pINHiYz9KXFF2BRsDb1VTEiuEGdKcHxsB3/BNbToe/iYDBcXWB+2zs+vzCrQNdhiC5OkIF9txNvw2lm4oYrjJwzZJZwLv1N6zKnV0y7ORMgVfbaW8uuMeKrc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSXHH/jQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pzs+vPeX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSXHH/jQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pzs+vPeX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HGML6U3190037
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 23:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9WjPnYzctFtluAFILHss9M5b
	QcOlyOhl44CK8PDA718=; b=PSXHH/jQWX0ApqTKKBhahRXvAdK2ynPSCiZjP8mS
	mbQ+Jn6eWr9spbmHrx9Zdf1GFBwvSNPzctuWut8wQoKYJ/nA/fsdnC+FRHoGEMaO
	SmKhBzxVx3cTy0dYssSiLQrc/o0J4t7Q38/VRkVTILoZ3z4TkfUv0kzDqKj2nDSH
	KQqQ1KaXRHjHfIW2DUW/4CnD5jm2DLx0AvcmewsoJWEFvtHbDlXBVVczvFRPXNrL
	UW9N1nf5Z8OLY8k4j5hWX3zPkMHNa8ptvxlgXycg6yIVi4zygsSNCzHOeh5VFH0J
	9voxuPFvZwHI4Tv32syjrvqwvXCUG2YOgFVi9RJBZ7/HOQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkravh34q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 23:27:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e423a05c8so9101861cf.0
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 16:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776468445; x=1777073245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9WjPnYzctFtluAFILHss9M5bQcOlyOhl44CK8PDA718=;
        b=Pzs+vPeXdEm3KiyX3uO8MbK70ikm0DMUMYUHd2uQnm2Nfi2tVePaTPIJjsS1GYvwim
         WkrpQUeyqMMJlN9V2CcodHX2ztVSYDMEqszljXfgL4zSmFEZvhLr7jOcC8QCHa5Noc56
         Nk0wr5VOvj4CUdb0F5209pjCQeWtr/wHTC5L1FkRZQyKuLaaUX6l8di849WBMzdEXjWy
         KO1AHDQpzZDzzjD87MnqTXmX+PfbwHbHAbqBrB46fZIfR27pKEuTlmJHgydobFHucyi/
         uL3BfmndiF1MZB/+YsS2e0AfdqJx6O2EUKAzAWhaP+bdGDQ4mDtbF1KWvNjc814WDo1g
         pf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776468445; x=1777073245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9WjPnYzctFtluAFILHss9M5bQcOlyOhl44CK8PDA718=;
        b=klJ5qqOr0AVKTcg9v+T7ubySdgyoIYguYEjteUgn3sXj5wO6Fl5AVEDto2LasbgTAH
         2IFcaBUnvTSNHjakClZgimkCnVGcz8NMfUBNbjD9BLK8SEmmL2vnAxUGmFcsC6a1yj80
         mkNJN1VjpGL1tyckCQI+6tsO5+47RWHvf/N/0qBEWggQb85WqBmVlBIrR83yvRq5ohbm
         YdLVqtovxQQsmh/FP177dwqb0+gf6UkUnlZxS9eg4u9PU7T70EK+VjKYmCWswciVF+4L
         nDWOs5w8Qv8KRkErRQquclLoXN9r57EwcoqUeoMFZYJa9kMZS/EVYflfAMZZVEoeaBQw
         IQ9g==
X-Forwarded-Encrypted: i=1; AFNElJ96OkPnpe0KzStOJ+00mVGU3tvBaa53S60vEqnXX9KgW8A12N4gYgVwYd+DpWE196FDvD+MxgeHEwcB@vger.kernel.org
X-Gm-Message-State: AOJu0YzHQ38Rb0E3fTrpGR994EOOndlgy1O0ey3ZN6lutKPs8/V35VFV
	JlH+OFKr6d+DwvEr6CRvvaM1zFjBzzr574dV2EowS9QONr4Ehgtb3oF21gTLxvHUfFvFmyzgvL3
	AUkzeiIyqn4egn5IjVzBKk2VstWwz/FxtbJr0wYUQQZen4RWVW6DBdGeNzSM5mMV1jSd+xmRB
X-Gm-Gg: AeBDiesanbLfNfbC8lnzgHZmBO+kS2b9BsgQTXu8z0+XGDjveEcA8Xau7DWfoAOH1U9
	8gcQIhspw/SDFdGb8MxjzI+mtiz3lEU9Zu+5GTC3pmGPg4gYLyrE69etlDeH6Hw/I4ObD1AnDuH
	zFJlNgDh99wS5sv5BJbLMpZmiLtYGMcFMfqaroFh8b5auano2bda0Bb2YGVpj3CwPli2eqvudpP
	Zhw5AL3nobLUlfG3KaCgv+Or+jR5YNHTlSPUMV/WNeOs5QbTTW3fk1LHaMIlmLNmayQDLKhdfQN
	1K5pa/0xs+uZl6C1AAapbqVEfPQYoKaAMvET65Ec/hFiqteH5+kJGYP10TGUB4YFk5m0I5r+Wkc
	eJaErXn+/b9C12mj7vNah3xA8ZUfCTkGGX94hV4cO/jbF52wFizxmQXNhBOEaDX9AofEzMnTAiK
	tslTtG8O8NAJlCBqpb8g0lEGIiX4AaBy2Faj80fDqno9V3aQ==
X-Received: by 2002:a05:622a:1304:b0:50e:18f9:b5e2 with SMTP id d75a77b69052e-50e3661da7amr64793351cf.6.1776468445525;
        Fri, 17 Apr 2026 16:27:25 -0700 (PDT)
X-Received: by 2002:a05:622a:1304:b0:50e:18f9:b5e2 with SMTP id d75a77b69052e-50e3661da7amr64793061cf.6.1776468445097;
        Fri, 17 Apr 2026 16:27:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ec277sm812386e87.84.2026.04.17.16.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:27:24 -0700 (PDT)
Date: Sat, 18 Apr 2026 02:27:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: purwa: Add EL2 overlay for
 purwa-iot-evk
Message-ID: <6x5wx4nonrxmnrooejxflmz7i7fi4dgda2buskeqqqaacy2cyk@wkigi7zo3fyi>
References: <20260417054200.2402281-1-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417054200.2402281-1-xin.liu@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzMSBTYWx0ZWRfX1gpiv2Hokibh
 MCOzUtcSVFdpfQHVnlXWV8bseT7Lb25yN34zsPbRZsCkEA9R1P68tuWojNgTozoJWEe/cndWxP5
 5BPMX7k7qZfV4ZxppObnU93CHYz0DDvE8ss5pcvJ4U8kN13okMU3lZnshAblGUoHawG2mHmueTV
 QVyRtCGAB4xD0UpxtVPZPGLrTPDTE3JC7rk9OjUnvdObxe4ttCP0/PHMxtiM+5AMI3D2iM9BW/R
 zl/mAzavj1+DKJDJgz5svyZDXf94iVx8xJ++728cPYbteZ8Y/tzeOns2sL/9Gg5hplYmfvia3x2
 G5V211/ac84OMP4BdG3uawez7AzNoEH1GnQA84Vj57ra3COY5qYfDxkf2FXvwib1svDHj/vu3oV
 7KcQN7NLBcIPUT46fo8Ck5hvVDPgoALu5uvNIfPpMOrMXrulsa4ym1aSO8krPjOnO02uMqpbxF3
 TwcgdbGOvpMiqLHQC6A==
X-Proofpoint-ORIG-GUID: vFa-PkGIt2QGsDbyPhAektXP8MdQQtQc
X-Authority-Analysis: v=2.4 cv=PIA/P/qC c=1 sm=1 tr=0 ts=69e2c1de cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=c1XyI71JOhys0xtxqyUA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: vFa-PkGIt2QGsDbyPhAektXP8MdQQtQc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170231

On Thu, Apr 16, 2026 at 10:42:00PM -0700, Xin Liu wrote:
> Add support for building an EL2 combined DTB for the purwa-iot-evk
> in the Qualcomm DTS Makefile.
> 
> The new purwa-iot-evk-el2.dtb is generated by combining the base
> purwa-iot-evk.dtb with the x1-el2.dtbo overlay, enabling EL2-specific
> configurations required by the platform.
> 
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
