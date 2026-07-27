Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA4341A90B
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785160585; cv=none; b=PpnYo8y8L1zLfNyA/MEydwSajK1GFnk/kM1tADVplj7i+dynnB9Rd/HATO3nG9vAepOWQ3Viban5x+Rq34Zn5EXN1ZMKSWRlcJbv0oOvc9DgfaDqpEQhehKI9uu0oMerChkHJTOU+gx1zO5oHMqGyRnk9Y5021Ft30SZgu1LR3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785160585; c=relaxed/simple;
	bh=qA326r5sqZxYVFdkUlp/oF9J4KEqqBGpbD0f1T+3rf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qs4J7IQu9EQ+zfgnD/sISCuaKsWEb75WPLjuxXJ/6deVW38r92aqHkdS0qPpJFZe7UTpdnLb+6n87uhSWjBrmDYsJ2/ksbDDd+xLd6/5kCoSJjmq21pjNhwY1fwnEsx+TfDw4nISqulRZR8q2f49GUu1P5zMTU3sUpTRyR8ARf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g1hzPGYB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bpni96Rh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g1hzPGYB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bpni96Rh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDliUO4061146
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XEdThMl9wB0HUHCapGlOKYIA
	ukDNxU4aWNkFOAojSDU=; b=g1hzPGYB160xdVffc+FN+nhqdoD2S9y4lo66GNym
	g814L44HzLD9Unab1F4KdsqZuIEHoNb0Xb/Qidmg0IJvMXzneA+Ha3YK/BXbpWDF
	zMWNimzhe+y8ygHKm7OIR2Y+HZQ8TJDHlFXJyXq31LT1pxAhhIavcxpZGpv9gJxv
	gkCx2F2ECpypciJeo9O9/SxSJxnL/PmazhV6lo98DjmYLCfH6mMPVGI4ud8Jaruq
	2R0QUNp0WlZUiBqJG2FL+K8LD9oVGIFpKWydJSevetfvxSw7Y5yN3jy4/RffmK/H
	CrTpk12mMMbLbo2idoInnRFFnqKJuPJrl+pSpWBKXWSj/Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mq111p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:56:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c12e43b98so34661071cf.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 06:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785160581; x=1785765381; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XEdThMl9wB0HUHCapGlOKYIAukDNxU4aWNkFOAojSDU=;
        b=bpni96Rhp5SoFG1NsmO5TupE0pYaamx1WZZOwmvI30lsINRaimyOmOgCr2tJE/ziNZ
         C0L+044tHGUxK4BNC+Ntaj0+F6QOzPFm5l77fVUQaThB85k3HKoR7JQ71Mqf2B0xsXhp
         LN6Be/2lpkwI3OfPNkXE1N0+Qg2tIEAT6q7TwjQMtzKIrLPaHN7B4s4PyfGIfi+skhIL
         eEDB2W/5BvUXco10O0zVBOiwlVT042FG9l4mmPJSPAvk8vyxLTrZhYawjU88cPlyTz8z
         y5sBjh5m2sjU7kfuFmZ6PWIbT4y9KdtdKNLhmqGopKjRQly3TtkJQGGiTde9iUwe6uOx
         HaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785160581; x=1785765381;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XEdThMl9wB0HUHCapGlOKYIAukDNxU4aWNkFOAojSDU=;
        b=muaXXqxWLrEi7YMOy4UBMI85OBKDxHvgG/6CjXBHQMpxFZ95/C4A7TgknIRlDX/voG
         7FisTlh3Lkph0P6jRyy0I5o5qBPHpIFR22NCB0d1VnL2xw2nl/aNQwuYqrqTWWfqtgu0
         Tb74KoiVsfQqTbkjZg9DdYTDNQ3ThGfyePCjO4JM1Eag+fj56xAuWmt22OSWDMzA32mN
         s8XkI8uz3vqCXWlZpqyq4jDBTWbV55ppGl7dK7/I0qTtUBDOPp0qEmM0WdbWq2psRS1V
         gGPnxXU7QUiZB5kO0sDJbDXqMFQGWV9mTji/NLXWGfSCNIDEZlS9esnlarOPn6yQcDlE
         L0Qg==
X-Forwarded-Encrypted: i=1; AHgh+RqomT4B4p6FoMigX6dK9sdBA/eQizohGH1oj4p9e6LAIzr8yM0g2XapDnFHgGoy2+ox7/jE9zFw96qv@vger.kernel.org
X-Gm-Message-State: AOJu0YwkcHyE4b5v9uFNG7pVt5BQugjmCs5eJ4ErrpfeIx0GdWWd8jRe
	xv8MBqKNZlolukq+VFiPRAvYRD8sUCPQzZHtg9IlVMD3aEPJuxIKF8AYQ3NEqMAUg/VCg9pzvhj
	lCObJPDMNXFxdcr77j5ULvN5fnEgvATSY8zBUe8JiCsV1JNpY8/9214ToqwzNdITA
X-Gm-Gg: AR+sD111yzaWRTn+REdutA/57JPINfZuMaJtcMWepsqHEtdQpPMqqk8ATw6NqPu1y1m
	8l3Kvby9L3Vr6HZiVizowZGP/TMjNRlY7b4ofkGjFwEhwQDO4inU7xoa7PZtnNt28L9Rj4U2xDe
	0HwIx9p7cxe789DZuHB0Vcy9xmnUcA0GQ8Q/XjIl4lot/+8gXNLk7FErwno18ysDQF6dFIi0yhu
	wQPGyV2VQlutltFwAuxqaMOv5mWjAulOCzV4WWd78somsW/EzOQnPCOKrVPPdcAGoLLi/ZhRIir
	X9Su409cBNgMM6RfPwr23XDJZmSxlovq2YBB703AY3EeICbytibAe8xTQiYVegodgDfJ+LMx9Zf
	tR0WpIwCfQ3UUuHg=
X-Received: by 2002:ac8:7fc1:0:b0:51c:7b13:62fa with SMTP id d75a77b69052e-529cd094f4emr9239401cf.80.1785160580669;
        Mon, 27 Jul 2026 06:56:20 -0700 (PDT)
X-Received: by 2002:ac8:7fc1:0:b0:51c:7b13:62fa with SMTP id d75a77b69052e-529cd094f4emr9239081cf.80.1785160580162;
        Mon, 27 Jul 2026 06:56:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6ef25sm45010704f8f.36.2026.07.27.06.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:56:19 -0700 (PDT)
Date: Mon, 27 Jul 2026 16:56:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 07/10] clk: qcom: videocc: Add video clock controller
 driver for Eliza
Message-ID: <rv5s3s24nyzg2ue7ywspu32l23dqhwi2rupcrdzx7dcdgtbyap@pmftq6x63mpw>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
 <20260717-b4-eliza_mm_cc_v6-v8-7-5cca1bef2e48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-7-5cca1bef2e48@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzMSBTYWx0ZWRfX5ljnFeITzVeC
 N97PlOSLfbJmg6ZLQbtRNBqPckIvrFfzC5B+bPSGEioYmdQW4AXIJkDMkLC+8ZCXiUGvCHKeZeW
 L8MhVOdb7wWBo8x/BbnrcpuEA1oB1rI=
X-Proofpoint-ORIG-GUID: TLsKWyyoAxVGaPLVgIUP0O9XcTaXOr9t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzMSBTYWx0ZWRfX8rY7Rcie+vy/
 Z8aZYjMd/kifDnQouALn1ZS1msu/qRog88IhQPulUkHmoVkK7OQR9g2i65P6+UlTNpCqLqh2Mvo
 JdyljNW9K2QDhDjOHVTgc1txK+T1qodjyTmySPbCjFvVcQCm6o3WDWPwsa1HSK60J+wFNIbJYTB
 Q8t5zCE6ULJ/KqiB36DOPUYkG1q7Ic2zwxsqmYXY/o1yOQve3WX7YkCMEdqd5f+CDWA+FwrsiJG
 NVEE7akgllvwIBLrmuikxbDAYqx0SHwMB1uMuzQ2/TLCz/SeDQ6mN0dEc5fGKUju0kyl1TqOpbW
 CB7xF9cbSY6ojKhqTDM7Zsp1wSnTxu85/gEZKq6RTSQC7lCr4wHSskbTA2iW4TD/xBYDqVwTzcA
 RFOopXoQcbFlbhERqNNWPeGAbkY84T3EZSv9Z78ElYfnz+cARAHJONONiwfqrWZjX6VZVSmLhQ2
 jJGHF4/DHoVCWezRk5A==
X-Proofpoint-GUID: TLsKWyyoAxVGaPLVgIUP0O9XcTaXOr9t
X-Authority-Analysis: v=2.4 cv=TemmcxQh c=1 sm=1 tr=0 ts=6a676385 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=d7ClhsmVZ3m4v3ji_18A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270131

On 26-07-17 13:01:51, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Eliza platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
