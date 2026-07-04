Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E28E1D47AC
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 00:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783124449; cv=none; b=dWy/fcuGVWB8WykgaT5BjHACFhzS6g2CHw/T2KVjS1SrGoZLGh2Abnvy+4LeiX9EPsybWWn2k6m0u6UmgW6oQctfytc2QPyh+/MSjbMZrMvuRUGBzjRulEQOhiHoyn6aV8+ofIbokv+u9FGv+L9WRXVtnq/teUnoi3ihJvTIajc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783124449; c=relaxed/simple;
	bh=/3S+Sc0qUdx04iSana84C+LKlwW7PylviyD3NbYx6GE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sjZZlRGEGUPApBGdM2CP46nOnrnJWXPD1xVtc9bKklfCqUJeNuoxyoruaFDcW4tFfnbIkTNXmEJuuntc8SY29R//enbOf4GTtIIGw0uoflLvtxzXqjBRPCKzE28sXelxZpz29q7S9kD6Gu0sVao/N/fV8GsYBsQQFW4cw6THZQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jwoE7EXP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cviJ88uK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jwoE7EXP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cviJ88uK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPYZ6837841
	for <devicetree@vger.kernel.org>; Sat, 4 Jul 2026 00:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LpRkSJiIILmsxhLK0DIvM97s
	GwfxmQw0i+mZQB/ozg8=; b=jwoE7EXPgIU3VYQYBRaatIdmDV5wzTJ7CwWOr8T3
	I2qHaoEttiXBVw5nL1qF4MlcAToVN7RNUhEf0lD0C03KOWE1T3MfyNOhuTNWkhm+
	Rip+MyNxPDwMM+iB12yj/wwpnx9/NNoqSEompjxF6NO2Fn/Ah2FnH5JRxj7TxOip
	RhP1xTPYp6l5hOG74aOMJ95wC/TwRCL61YbuJvVxGQsh8/XWUA4GL7wAiLJ1c8BT
	pcpuTIrA3936pHTZdccewA9ZGMGY6qzQmMpxqJGWcS2DEslqY/+/e5qm8KPiEGYP
	GV7hkJpb3VaFjTRc5Grv34FHvh+5zEYHPTU2QfShUDulrw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyu5xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 00:20:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e86066fc53so13116346d6.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 17:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783124447; x=1783729247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LpRkSJiIILmsxhLK0DIvM97sGwfxmQw0i+mZQB/ozg8=;
        b=cviJ88uK0FnLH4C3cR8WHlJCUlfw+FiUpk9e8E31R8Vvhq7eUTYIAj1uR8FoRn1FTh
         z0BZlORsfSzfIt5BD31AbE04QSyRE0zANr2ESFLBSaQEqN+1rjrjlh7XBfL1oS1Zj5kw
         NLXYT89wVNilLu0Tq0XmHBO19RW3cmHB4Cr/Ur+2dZfd+s4Edvi5Fu+ROucfYLjhqZQu
         3maajeE9Gkf9ZjRIJyCvyQchfzkTuDXNPWUt4DGOMMSXuzT9V3/7EdJRHDCY56My6dWC
         nFpQ+jeE3EBol6cmtVdENwUU1HDIwG0LKsUeED3/S3kSkdlY6iqmTs1dUHY/NVm5uhS0
         To2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783124447; x=1783729247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LpRkSJiIILmsxhLK0DIvM97sGwfxmQw0i+mZQB/ozg8=;
        b=dCb2zkQNnnlaIEnDEkyL4Apv0Z1VhevgVbXFi4iMnOsOi0GxZNDTkMd88YXvkdLgL6
         bTS0yZoPJpQ1TnE+d3DcDxMNkJO8Cv6URLp+LtzESooW8i4hJ2DQM/SCmbC7K2Hxc0q6
         3zUq74EecbtXVSzmQuddwvZD+TC2RwWVmZ7Zdh61YIQ+QVHm5/fVyQDWt3W037AuBBzw
         bhBh9X4WqF21EdlSSw56V+XRrOkPd07vZNTqcJ64Y0A3hzA+nV8lY6bOgdzFrpnYVQ2t
         WIp09L9XZ0wAyri500L4wlCj+DSm15sqxE9+HmUzS/E/o3OLAd5bLauYPdzYDc25nAb4
         j18A==
X-Forwarded-Encrypted: i=1; AHgh+RpPuC15cnsEx4/KvZBj5TIGY/ttIq83/y41zZxHfLqcqnTNTDVwrOLGIa9E5Sr/s0xSnEdXEHfzN/sL@vger.kernel.org
X-Gm-Message-State: AOJu0YzywAzNL7Jf+gB1c7H5V8kX8WIBV8iMQ2jJk9HBagEnKO3UKxbC
	tW4uLfq+YEIqgn8ZezexHzK7rKG1LZrmxrfWzqudfuePRNdY7rsIrny2S8ekXZxQFX+IBngjVBB
	wvYHGE+BRNeJN8uWPW4Ye2Rkh3iiRfs8mAqjFzLPtSlpO3U4WHJlT9QtzXcDBFT6g
X-Gm-Gg: AfdE7cmiyRlZkd9b2anQpUhbuk8+110yWvr9Uw5L6AoAq9mEk/7JZ7WptGt3101ZhDV
	SXsSQ39/YhBIVkJoF3NjJsaUmGYcbpSbVLpO2SDQ6rliPCYD4dtHzSx8xD69or07e8tpOCPRXls
	r6f/d9xheJCFHoVcaTMPWOk1bFuSXeyZYeogV4VAlfWg5KPWfoLt9Ad+s4KCAG5aDLiLDHV9Ih3
	N25hxv28dhL0/H9sNVTOZKeLvMsOZ6WmBhIZ3DW4HN4l38JucZwzMFRQgH97uTdvaOUjEeZMaNV
	3dI2Od05vpPwoTALQYF92omyEk1lUhoNGFPX1YmXYcr/dYwW2JcdFzY1eT5tIr+obHVy191LJPI
	SG4QP5pQjBME375h8yCN0lLOGMTCNk7nlpTK9vROclQtCVS4rTE+/Z6A2hVDKvPgIDAaJfph/4u
	KoG2vst9fIXD6wJZ0zE5hZMTal
X-Received: by 2002:a05:6214:27ca:b0:8f2:1d46:a882 with SMTP id 6a1803df08f44-8f74ca9fa5cmr20352776d6.0.1783124446674;
        Fri, 03 Jul 2026 17:20:46 -0700 (PDT)
X-Received: by 2002:a05:6214:27ca:b0:8f2:1d46:a882 with SMTP id 6a1803df08f44-8f74ca9fa5cmr20352496d6.0.1783124446281;
        Fri, 03 Jul 2026 17:20:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13701a7sm865446e87.12.2026.07.03.17.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:20:44 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:20:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 13/19] clk: qcom: gpucc-qcm2290: Move to the latest
 common qcom_cc_probe() model
Message-ID: <kpg4pwmhu3liigfu5mim6wzshp5swmz4wsamapw2kswvpxlp4z@mgh6rlkkfog6>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-13-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-13-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX0ZjLPgyu2jSz
 RX0pyJyuKV6/v8UxPi6B1EbhOTv6dJqz5pzlU7d54mNT0xMYJVTzy6WmK0Mqwwpeks4n+6QeHre
 YQM266JMjQwcnGgM06gf9vnYk+tjPAQWJuQN00H3HezH91ET9cXzGUZHVYHmoWhpSIGNg0Ncbu1
 5ML3ovTyAbZ7yMDoiRxo+7peh82DcIYWVJ0F3lZJALWRqNJo6/CyDsJey+QBxfH2hbGe6hLOqBb
 O792Ho8b5Jv3//HE9ymVOQf4DYTAJ3+yJ6duvOOSItEIenT16X6d3NF4DwhGuDPKihRtiPpLeBl
 1ofQbAN2nN3QeuW/7dg+I9WH95R+X/oOkJwi/KbzmAxtqHhJuvd0oDziJS9xnX8upYChIYXibXt
 S35lWBEPPFy0IUVrP48IctCoZGQOcVK31f0w2lTvk04eEKVPenS+g32qLxKZqRh67PI70LYJZWN
 DvgJFSlhV4s887eW07A==
X-Proofpoint-GUID: rqmVU4IbT8XlHjEnhLNoMW0qc5XRmJZF
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a4851df cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=244XV8jIjgl5S067L6QA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: rqmVU4IbT8XlHjEnhLNoMW0qc5XRmJZF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX6lstyFK7Pdus
 LKJGJB8jqjzkJsBJGNACkYLlFcxu6ZwvSeciQUlm/NG5yqHJ1Ds/Xq0Lkb3TB54thzxDCl+O0ak
 XU4SLivEkkQdQJjW51a6UQ27y03WoAM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040001

On Fri, Jul 03, 2026 at 12:01:35AM +0530, Imran Shaik wrote:
> Update the QCM2290 GPUCC driver to use the qcom_cc_probe() model by moving
> the critical clocks handling and PLL configurations from probe to the
> driver_data to align with the latest convention.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-qcm2290.c | 50 ++++++++++++++++------------------------
>  1 file changed, 20 insertions(+), 30 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
