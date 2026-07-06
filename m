Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D78542379F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 14:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348851; cv=none; b=ZaLSj0wKKKTC777Jykysh6tBjM49moNrB5bDsCki+IAOvYCRp3yqVBmPlGzfYj3CLSYC/wryQ0Th9PscbYZTbk/6NH4X4PIDOrkpK/CVWJT/eLjCZkkxHonhOqXIDhJZNTrzWWASLjk9ycPz/uygwbFw8Aa47f1uFQh9eEQpTY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348851; c=relaxed/simple;
	bh=c8ATsYZUarDFeBqoYlDvFG/Y5KQ0FdsdVPsvH68dptE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyeLspaic2Hxg1DaFKfe4LAfciLYplBi5Mi/acNVAKPxSTrT3KQOVE9SGAK2y9zqWEfCUAwC3jvR4EkzxukMlGER1w/aBo63cZxAxdlLoDnU4x0yGTRbVJ2Bgi1K15NdCI5EF0tIT0bJKTEUbkLfojJ2E9XgIPAE94kUbJerfow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o65x5f+4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a676ZJbM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o65x5f+4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a676ZJbM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EE6xm680514
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 14:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1YXelcpMQyjjqfxAH5A3yTNz
	T1Wua4sYEO1lqx6kVXs=; b=o65x5f+4NZPanmYwqNS94I7vdzPdP9qW60/M3cVn
	os1yKG92mdOmzrsV+lhvRobK2pIITSb9mGgYFcXeKzMei9fVuuencaFw4tiBpW72
	y/TPARkcA+iPAdnx7Tg0SzYfH5VTjIrOG/m1IUM9+NgGgOf6OOKoq9CfNedxO774
	MafP6ONjIAvAWS6emjWRLzReOssZuhk1Kq6Rtl1rRxdU8yuVvty3153HfT3hJecg
	0n7JtbONr046VR3i9jcOwSGfOFGVyLMYHjZvzVq3Z6kpYEXASDynkcHcHGRHnZJ6
	6Lb63vHqd1kB3ugvhvBXM8oSFb3k7BzbpXaRNQIunClPrQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t89jy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:40:48 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5be0de8bf7cso248128e0c.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783348847; x=1783953647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1YXelcpMQyjjqfxAH5A3yTNzT1Wua4sYEO1lqx6kVXs=;
        b=a676ZJbMRPKXCiLxKweawh4RKZFRhFFSO46ciP4iBvbenxdmr41YePBvLXytbkSTik
         kUqCh7gc++hC7K00vXS0IAmkSOM5lACPJKA9knXgJfF+bZ+66vtNYSXNdTL9ULjmIYD/
         fmNFw/zrK/WoDQUvIMQ4mMe1KwkqqVA7XkjfZ8SdKV/bF+81TQtk+AmHrx00yB77k25Q
         Ck0isJDOb8rrJSMNAKtfZ2K2eaF0HGdsQ6ri157rQaoP6j8xSriBrm5f3p23yj8jhSly
         X+uqyLfxc6OOvYGi4mEkJYIZieaAMSFvRAtQARdNdGEq0wxr2C8Fq/Ofqkhkv5PT/npO
         JNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348847; x=1783953647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YXelcpMQyjjqfxAH5A3yTNzT1Wua4sYEO1lqx6kVXs=;
        b=dVPuJdfob2C3+E08jGuqlPI+6NlAlHMPANXKoFHz1PYq3T0REMw+KXvQx/8/ek9h/L
         Z47flNT2kKQ9YRNdeY3DmnzQBQieGIBMEcywDf3MoRuTPHrmEXEyeDtpIRYV2dgob5DZ
         SCMk2ZF1atOYJkVy9AE93wxO6xu2O3uV61OEOyKeT5/n+UffefRM/xhL2d99Imzf41fg
         BK1xquPHUXLqw97GDEHSopsMAFSVJcmy/q1zL5sexa8FUxGCQEc4ljgHeKk3mBb3fCd+
         yET4UWMZqF5N5A0YRgTaFewU1HLbf3vPWEbB8wygoLfYsbhdg6mJG9KjGtWZCfZxlfde
         zltg==
X-Forwarded-Encrypted: i=1; AHgh+RpA8NAaJGstwycZBz4kWlU1PatjprZfpDk9HksGhh/I2A2FEH3FMtC4ChUzhidlczUy+/LVXGFR4hOA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/lNw7LCg0QI6tHL5JXp4jP0O1Srecuxuj3rhZ3T5N5I1TcXy0
	8uvdItSFWoC381gmeAxe/XjPqhNYDRivnyuqpw3Fl0sEQbHC7zTjR0BwrlDBPaAYpnEe3SgW5aI
	GNyTfuP3Wx8OI+hji58a1Hu8kOPWLXzpIsCYIVPiZWGtqjM1wdTKeNk7YwFRnUZSr
X-Gm-Gg: AfdE7ckgMy19F/4M3ozT/O/XWHNQA1HbirAZsp6KNRWKhr6S7PQMSMOUR70dlP5AOaF
	KtyCqklgOsfVGcmzdkAZdjcqLLVhTaMjSUHJS/AAAliwQ76nz1w//6Nxaz5aQnKV1u6ITlWA1qa
	AdGj3stMhE1MqDVJ/++I5/WJ4gGrpC9znqgDJFKjxkJ3lEJtxLUhd+RlSan19aSVzQPjUJiSphx
	fXwlJKAhXGr2qOn1ABofaUjgqdu5UrLE6MWkAayRM30PMdWwR+hjBnlzQP4nuRiahHajwzNkw8Q
	dXr+c+swN0XqYJSrw42+avZPpTwiYM6wMiOk4w7Au7qjSy6bK1c9LPo1iqkkF/Nl1NCZGBcd0jW
	QALdD6rJQvGtffEBv7FL11JN4BZEwwxQtvRUn9MHxqnDZa3jLO8jOd89fI6hAVOhmt10z/vnDNw
	k/uwb+s5eRaHoG7AaaTAbZk56v
X-Received: by 2002:a05:6122:219f:b0:5bd:c11d:ecd8 with SMTP id 71dfb90a1353d-5be8c624393mr453071e0c.1.1783348847431;
        Mon, 06 Jul 2026 07:40:47 -0700 (PDT)
X-Received: by 2002:a05:6122:219f:b0:5bd:c11d:ecd8 with SMTP id 71dfb90a1353d-5be8c624393mr453050e0c.1.1783348846933;
        Mon, 06 Jul 2026 07:40:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed136f908sm2893565e87.8.2026.07.06.07.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:40:45 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:40:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: qcom: camcc: Add support for camera clock
 controller for Nord
Message-ID: <bokzk3fqi4mvlx5bhbmrkeqc6rfjpjmcuswdkji5g5si2x3lxh@ryshvgru2mzz>
References: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
 <20260706-nord_videocc_camcc-v1-4-bae3be9e9770@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-nord_videocc_camcc-v1-4-bae3be9e9770@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0OSBTYWx0ZWRfXy1NPkiXOyzdF
 OsTBQ/WTtvATGACo6u8b/hT0O/sW9M8d7+7QpF+IYgDKf1oBlBepHktKQvLweOtPSxibfqHlbVI
 nJCKPxNe/YKJxhx8G9FiiqSP0pdfjuE=
X-Proofpoint-GUID: Osx7NGLP0-JfY-wNpUbElTF7D49A2B1c
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4bbe70 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=7Mhvcmd6cMb-wOCvpSkA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: Osx7NGLP0-JfY-wNpUbElTF7D49A2B1c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0OSBTYWx0ZWRfXzxA4yqhGKPnM
 Z1DwRPh+fRAki7qd8CgAN7hOPfwxVbjQZ6jUmiBfpzjTRZVBa16pUv2U6Xrfm/1KS1PgSowJvyn
 uoioTK/Df4js5hnsCpAc01RKk04X0N5h3BzhIx+4625H5oEACFdRLzaBgMFkF6gxzVDPnNzZFzx
 NH5s0dbQ0gQiC1yUL5INdtaAulNBNKoC4omastvxPRuI0k07NipHnPuxndzcn/IcqKR9eUuJd6S
 47X304F4nNu8MQ+Ds2FxuUsvuXr8GNunNtCcX/roDfzt1WPzoYFJ4ulnhXBeGR/EOraKpO9TNSc
 hPdWjLBC74pshutaaJYnacUd+k+HMibAp1ZoDnyjWnF0QTiznkX772CtiVzmrAorgWEKVSHsjCM
 q8/T4lDUG5TKIHbB4WVXSQZITNC2y7cjUMMqYScvbaIm/k8selep4A9ykJ7WqrczxcxA2xFtBcp
 5bqvAwVB5DBXSbd7TMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060149

On Mon, Jul 06, 2026 at 02:27:16PM +0530, Taniya Das wrote:
> Add support for the Camera Clock Controller (CAMCC) on the Nord
> platform for camera SW drivers to request for these clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig      |   11 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/camcc-nord.c | 2941 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 2953 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
