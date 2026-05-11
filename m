Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF943376BC5
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 03:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778469701; cv=none; b=N8ECPs/LyJctTdUPk67VbkxwKqdLAwbxFn2pLr+TsOVldZaCPi1RVh33e/eqWT6ngPz7EutLpNO9R8z4+9RefWCyHLWlZMXw+9y6VgV2ndaLQM0WYYxR7tJdQIrv+SCKe29xMksgBjb9pwYiZC3qI8lENNu5mgKh0mJl9UfiDyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778469701; c=relaxed/simple;
	bh=eNRiDEIcluIRSwWhC80cEyHWCnUatRnuX2GHrSiDM30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XEifeREyDx/rR080taC9wC+uJN+C4oTprVZR7Ze5G9lIPSj6k7r4yxnurK88meydhTx2J/1JI5V/MKbLzUhwWm01AlQAGirNPn1uXMUCaj1IqMdhppFLeWGcz3OZkuDJiSCOeZqLzeZMbKtoO4kz4OKWpVrYpw0E/IshlUvoOMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a3Cbxw7K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FZlnF3Sd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a3Cbxw7K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FZlnF3Sd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B0hM3d200221
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 03:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ot0AvZ++ETPuA0JLPkzl0nZT
	3QrDG0/3gj0Tx8fDXqQ=; b=a3Cbxw7Kl1S1swM5iIsFNoI4TCsmooEMOyn8FK7B
	20EXYxGH7whoOf3X/iL9dZeww+N5rBcJ2rmEsT6u15lPaI48QLfv/chJme+xJgwr
	WfxyCOOguqwX7krjnVWuTovV9GZ0WP7vBDJfnTf54DouxpN8pzqnm9GQdaoPyfmt
	c4ryzb8M7ORHQlEJuWazeQ4YUrLxlhHO8BqckmgCxQqkcLFEbO7MigzWWbMBl8Wa
	nyoqIN4OD9O419U+b1L1CxOVO40KR1omHOX6w/6le0Y60tNlPzsPs+MFfLhye3Xv
	6xTq4l8MgIuAdhqZcFFfT0Horxd2m9TdQ0fYwYiqJraBwA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1wa9c6c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 03:21:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so90260751cf.3
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 20:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778469698; x=1779074498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ot0AvZ++ETPuA0JLPkzl0nZT3QrDG0/3gj0Tx8fDXqQ=;
        b=FZlnF3Sdrpa3uDMn0A6uhCNbs+3S+Z4c4wiVJFubaanlNaEf17he2CCTL7GdDbVF8S
         hPYTWiuoNH/2WXaXoCbEDA3m9Uz8ugO+BeHeE+lALKanGvmvLeOsKTuaR6IoHj2mEY2z
         4x6tm1Pf4embQcHKh4Y98f3CauqnjzaBNDFGvIPZTivsArUo/oguzMPq3lq+foTYZu9r
         4GBtb0dXmzyed45mqlqC1yA/d3Pq1xEWl1s0QSY57Pj5Q0c/blo/KTVbOpfp/l/u47Zh
         Eu5HX0C5VRHKLQZEocfsWTC0qM6kPvP+f4xoNL25gBp5Y1U0KC03843Ez8tLPnslW+YL
         5fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778469698; x=1779074498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ot0AvZ++ETPuA0JLPkzl0nZT3QrDG0/3gj0Tx8fDXqQ=;
        b=qP8hlI5hs2hoFFVvw3KZWok4q1sWCz1/h2BtS8k3T9WKl0QyATysjn7b7gYGz8T4TG
         UHRMGx8Lfa6uCKK6VI3zwRThCMPXxGH6+lCs0kbvVK/jgyqWoC+darjlW307HuG1evdg
         1IcwPBYJGO0e6CPLk5C7cna1+M8H629LibvkeUOG+yXC8/2aepP/BzVqD0awNDWlMp+Q
         ArdZ7GhqB+xextB7fiOcQw3/6fNbhgMjcAWwg2BU/U84t2xgPELlR5NpFuzssKpUDc3H
         7hgtN7U6SkbcPkTMzHrwN9sZRhV5s4ynCwC2s3PXImTDISclsxcM70wuK3areKhYehY3
         joPA==
X-Forwarded-Encrypted: i=1; AFNElJ+fPSc7jfVA8OYEkcUnUyONAI0cYKNBfkaBurk6NUKXNg2gPKKgkfugOVHVSCdnMIwP3eSPG4Jz/diU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx28kQ2ELnOtP/whTIgqzEZt1WdgWf3wxAojyCbeCIR68CPuKf5
	xJ5RtJwZ/K9OJiwR/ttrvwmcbUf0MxjhC1SwovHbySvZmsgkjFq25kVUF4oAXbq+sV1eTF249To
	h3swBLLHB6uF/mmQ8GAQVEFtSjIPJy27S44yLKNVl0tN7R9oKSaPWM29IVrg/NNVz
X-Gm-Gg: Acq92OGWJwULmSr+60pfVmvS2tBXV9FoHDksN1AqVC2jpiKRWq5dFc46f0w7uJxYbeX
	rAvR67UnlafEJM29hABf5HhUtxJnNKc9HC/GlIaqyID19igYEA6iQxJM1vpHriUTQ5PiEF2L/lY
	sXLHwUmCl4tNIOVKZScU0+6o5mdu4dFeR9wgI56LNlJMWODt0LrTBUWH+QrY9Xp66mRe0fK/fSz
	gA/D8woF6cF/jkzkez+biDxa58cdgvkFrssTqtXpU0e/il6rudutQT0gW4L+8L5YWMVxvJOjazp
	yF4fACbihfD7vReppOstWe8EQnT580aWFCvWzKX0GNuLumyTgwk1sPJkAVrS3yqr5H7MBPYP/Lq
	BuJ98LHItTK3yqXMZfUJMiKubqv1wn+k1yG4TrwRMqfrNfhvQ/cVRNDTsWHY7McAIoPD5G68uQM
	NBxgLnY2KfAl3ZnZWXKw1PmxU6ZEeHtteWPgQ=
X-Received: by 2002:a05:622a:40c7:b0:50e:5f36:1da0 with SMTP id d75a77b69052e-5148e99c6b7mr178858751cf.49.1778469698182;
        Sun, 10 May 2026 20:21:38 -0700 (PDT)
X-Received: by 2002:a05:622a:40c7:b0:50e:5f36:1da0 with SMTP id d75a77b69052e-5148e99c6b7mr178858401cf.49.1778469697725;
        Sun, 10 May 2026 20:21:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8bd7d8974sm1274980e87.64.2026.05.10.20.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 20:21:35 -0700 (PDT)
Date: Mon, 11 May 2026 06:21:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v5 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Message-ID: <s67ja4ae5ogjvidv4b6lzlpiskvowctlzki5idkku5warfdmto@gtfy6nvnf4lj>
References: <Jxt4BbN1dL8VKh_Zjah1xecAjz3c9VfbhKSm4a0K2D1MNKfJKIFnCPLj2VvdW1q4LnMIQy8bCzV3YoVnLFYUlA==@protonmail.internalid>
 <0cee27b6-f566-4958-8634-2c43e099281e@gmail.com>
 <dd435489-0cf7-4274-99bf-a591a15e91e4@kernel.org>
 <-hM6afm_Cu_8Cha9U-hrlrg6CGDEb5D3PFpPPCfIh-QgkdFJp_r0Ah9k1dvAF4zkju2dPc3FZJxvOA4V4hupAA==@protonmail.internalid>
 <69f9a6b7-7431-442a-82a2-6305635a508a@gmail.com>
 <9bf43e04-f834-45b6-8942-bcae2e480371@kernel.org>
 <eiZczGoYszhu5QDfm96oeViUfzDjhlJ8JLLIm2YmOU6S2gfCQoBeo9K2T65EzVLvv9B4lSo0k1KCVWMGLnzL6Q==@protonmail.internalid>
 <1ee77cbb-9894-4b16-ae2b-8e9035fd6cd5@gmail.com>
 <6cbb9b37-9560-482a-9fa6-15d5370d258f@kernel.org>
 <1c2cdaf2-fe30-4443-b164-c37c26f3dd05@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c2cdaf2-fe30-4443-b164-c37c26f3dd05@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDAzNCBTYWx0ZWRfX8R9Fhxx9Z31B
 zThWyVU4/PYQ6rAAJCKFAkvkEfuMpyQJxGqr+RTp/UaPEvQzSZ3+I/TcTscJZ+Md0m72zDTVsiF
 IYt7/AY7ehkuOnY30wN4kckzXXmnXHARL+J0Q+fkBoR90NgmMwTW+QtbaTs8Vxo+zvWN1JifEXg
 dYuLZm6Xdpgi65+wrGOArqi596LzkNf+RvKS0gZawEQyQ16WviBkYUqeKz0FbFJkntEZZb5qGzz
 q8rJcGnnoHvr/+W4mDjObyZe296uOfS/qKvnFDl5Mxt0ft9EmJ0XzumVBwpp6Sx4PdXqSN4r/T4
 2pFgm1mCVobrnAPz6Rh2Gi9azTAIoRSUDoWKhWYSiWs2jb7Y98FD8jWk6butlSqWWtSmR2BuAQM
 b+PLgqF4V3EkxI5+GUr8cjIy0MPHL+3MQMLVN2PLhQv4zvHSR8rKm/z52SL1dYzkiabftXS8MPn
 HWoljV37ppxyty3WJrA==
X-Authority-Analysis: v=2.4 cv=HO7z0Itv c=1 sm=1 tr=0 ts=6a014b42 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=bAtGagR5AAAA:20
 a=e3rO1A9j5ybCLOvar8sA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: o0Qmc5O0XSD4HrxgcBCnCoBnFJLh9g40
X-Proofpoint-ORIG-GUID: o0Qmc5O0XSD4HrxgcBCnCoBnFJLh9g40
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110034

On Sun, May 10, 2026 at 01:14:02PM +0300, Erikas Bitovtas wrote:
> 
> >>> Last time I tried to enable only 1 of the cores, the following would
> >>> happen:
> >> - If core0 is enabled, HEVC decoding would work, but not the other
> >> codecs.
> >> - If core1 is enabled, the rest of codecs would work, but not HEVC.
> > 
> > Can you be a little clearer here do you mean - doesn't work on that core
> > or doesn't work on all cores ?
> > 
> 
> By that I mean that when I tried to play an HEVC video with mpv with
> only core0 enabled, it would play fine, but trying to play videos in
> another codec would result in power collapse fails. Likewise with core1,
> but in other codecs.
> 
> I assume this is how cores are split - core0 does HEVC decoding and
> core1 does the rest of codecs. This is confirmed by downstream code as

This is correct according to my knowledge.

> well (although the cores are flipped - core0 is the rest of codecs
> ("legacy") and core1 is HEVC):
> https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/arch/arm/boot/dts/qcom/msm8939-common.dtsi#L1589
> https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/Documentation/devicetree/bindings/media/video/msm-vidc.txt#L35

-- 
With best wishes
Dmitry
