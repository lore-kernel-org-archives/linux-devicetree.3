Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501962;
	b=iKTyDQpKM40WjB1PeSsa5G60ec2WJSEm3Wkk5ns6OFchc95D2Ghhs/ywuy7BtADIRQei
	 R4jj7JfP9qOxH00kMUCitVl9lS32+oR82RoILKtxNW1ZWLJHz6emaWRsC6oBwaVGOVOWg
	 zwcGLcC426JrdVcSz8zxgL1qFY18uCKSLxkBZTg2VnoNXtoARahbFMh+i/AQKOlpxk/Rw
	 3ZkCOhEeLOfgAPD+i061Rc0w25/hejLF49uwgHErBbBc9TeY+Mom5XFbWgIwZlOLTuCrc
	 cYvB9OOw52hqfgfQFwgjpAYE3eAyCsPejg4dLCjLvcXpAVY4Mfhkby9RwYRS4QOzW6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501962;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UW1vQbaFWJhWbULotNLMo4piEQJWdZbWypx45nJnwSg=;
	b=UitNPfhDYvjr+W42+a2pfwqb85T+SCW7RH/SH8mlNwuJRuOCroYVrGuFNvMxe4le72ZC
	 KOa0q6lx0RhePmwFonCSZg4RZG0D8zBb+M5UZBTytw4E4W3uu5o2dzN6vstoj37vY5Q2Y
	 8JdoIW7kNXGtXqnM4UJItwOfOQC9BHs+/LFwFce+DiNzVPAm/H2uufi4ffLAORhp0jMdf
	 pVHnhToMuIdL9Gpj9t5PR6CdX/ahPESOCma19kTLp2k/wWFxhE4RuC0UNvu59wdIa/EAg
	 hHTkUitOIthUrwBEedk2z+RJLqXc1uTVokir+vk2WVZT/5ykAxXDz9OBKDHrHD9sVtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MP3ZJgF/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CttkPhLZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78399606A323
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:12:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78399606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MP3ZJgF/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CttkPhLZ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA7tk1575403
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UW1vQbaFWJhWbULotNLMo4pi
	EQJWdZbWypx45nJnwSg=; b=MP3ZJgF/FAlQUyDw6+XzcQi5v0bSP+XtRuLy50Le
	fzNmSB3NjW6qchpcOAY2bNp3FTzVpERDE1qbj9t6SSwrT7cQersODq6vT1aBbwwj
	EVImjOpK1o54RHAaeIpIMExbMjyaypbz9ARdxGL5DoYeBcDziJor30LsL80y/NpY
	cizTIJ4RED5a20FCSFytRKs7FMp8oA5qf6UAJbKXgIRVwIZkRbBEqCm4uPiknK7P
	ur9OkWND1Tm48bsnGb6GLtrsPUeL0Lb3l6Rxg/eTLz8XqW7qFm/Bg00rJSr4t2M/
	eaZZy5WZkONdeNv6HOr0JN++S8KfnS7SfolkCXiyTyNYwg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2kmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:12:40 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-988bea8fed6so2532076241.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501960; x=1793106760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UW1vQbaFWJhWbULotNLMo4piEQJWdZbWypx45nJnwSg=;
        b=CttkPhLZfpnX2Ae+1gxBfAcHoIhbwLTV+bx8gTovNjS/FvaUH40K93fQaGpUQjuE2O
         zurhAZ6E+5cbt+/ycDYotvtTkL3ZgdXSqU6mY3umpKxYPY7AFvKr9FcUe246bnAm2IT5
         002D+Aiz4zvaDCA3LLArIIKjOfIoT7V8oF0Rey7EeU7QPJyLcWEsTIZPNNtvtNdzE6ht
         MIKzs8On9BSCJ+9wOaShmA5Zhp4y7RESZij5omuHFUPzECt9gqjO/1ElqT6sbAwdk8ef
         grG7CDcZhrdnhU7MNwwyE/U+Rmo+A9EVEzgI8Uhh1NlYRoK4IBq+yJS0T9iZsfWnN8ZU
         W8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501960; x=1793106760;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UW1vQbaFWJhWbULotNLMo4piEQJWdZbWypx45nJnwSg=;
        b=Nspg0+E+YjEytRGrhmLfdFXB8yhcKsayK6bPs5x3e1FAaTrcnJKOWNPvjXBR3xuEw7
         umZARkXS9qggv6joouC4PB3kDV6dyzUqt1Jdbwl3ptGOdbsLLh7vCPi8R3wkS+B6p3qt
         YuclSX9R9GEPsNxBrE/zMr5r8WUPA29TRlFprtLtWmRoMfV15Ru4lKFesbMT0idD1bNx
         TeqNK+278TaPKaGCyU7hecRHBqNqRBns4n6aKgR2qtz0h1/TxNvgbyfSb8vKdwivYGy9
         bTzo00ngZZg9UohxR2VU2stpeiHbeRWhvVVo1vHQOpEfq2tfP70jforIxFyw3PepN/eL
         4B0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxpC5ZB6h6igoFZWQAIFS/yIMi/MCrGjo8TIY5gN7JMvBEXq5SDsBcmQ7GMAPf5YuyQm9EG56nNqI51@vger.kernel.org
X-Gm-Message-State: AFq9FYL2msYTcCW5741stfWSvaYjIiTBT2XDRXMFqTF+ZJTkaAp3Ddwf
	eEq3w8jR44iWVxzHppYt0OIBZc6ynreHda2vJJb18/gZMpByWEKEi+FSBlYmfiIx4bvg9In4gU9
	hV4PZSOreTl8Y0ntLa6hgBWVNdrbUz/9Jr0L6j5uDaVm4Lcm0wEqXdvOcvIGtltaF
X-Gm-Gg: AYBFou204risjc1N4DeiPCHIz3vQvRvReWSiCIWn78NeLXYdg6+pPWggTb27AxwXz0v
	6fDMkCVSPOsToXr6l7UfmReEatUlUkT4eri7JksAH00gMvWcVgPAW88wmOlLvAhdgVHu++HzQgR
	pyjVV9AXtH6l2S46sneQ9Wq3Eud8h6BlBOKGwZyYl9GchkHcERuiSLE8T0WJN3Kj2Qj0e77o7tW
	ht3qps7dl1cosBIoama74Hyod5/dxbXm5YTXeU9UH7m3GCvK7sehLtQzuER/OIAto4Mb+Nyk0xg
	OOj5Ssg6ADFaR2Ulynf7T50BkkESNXar8qz8uS2oZ87BWtV3A6g4F3NzFpAjelhWXnB1tPBRQeU
	LQg1em/FWvmDnQwW7
X-Received: by 2002:a05:6102:509f:b0:7c8:448:5237 with SMTP id ada2fe7eead31-7cc36a05fe8mr2648193137.24.1792501959613;
        Tue, 20 Oct 2026 06:12:39 -0700 (PDT)
X-Received: by 2002:a05:6102:509f:b0:7c8:448:5237 with SMTP id ada2fe7eead31-7cc36a05fe8mr2648176137.24.1792501959052;
        Tue, 20 Oct 2026 06:12:39 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f69d9b1esm47118715e9.7.2026.10.20.06.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:12:38 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:12:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Cheng Jiang <cheng.jiang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add RF_CLK2 clock to
 wcn3988-pmu nodes
Message-ID: <s2a5sfz2pbyvfzlmwwteh4tptrbaphpelvd5fomfcm4tfxoq4r@m6zdxbrmvrp5>
References: <20261020130852.3049639-1-cheng.jiang@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020130852.3049639-1-cheng.jiang@oss.qualcomm.com>
X-Proofpoint-GUID: f1hO0l_2_Awh2U6PdAYHyB8jT6dDBQCy
X-Proofpoint-ORIG-GUID: f1hO0l_2_Awh2U6PdAYHyB8jT6dDBQCy
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad768c8 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9xTM98GwyULmpW7hZsAA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX9LhF3IJDqdjM
 AOFSdfc8/APAMBzZaYNwxEAhpCNVlRx3mgK7tfWtQU+RRwLfwMlvR00VC3lxbaK0SfFmGFu95GF
 P4rVVkD45SNfTqz8DJY0QwISnoQirRFIVs4/2L4QCE+DzQcO867CIFTN7uBzBNgAWJ8S5IzxH/u
 3JF4t8vtfEYHhAdHtqZJkakKbPU6FWDgUbypT3NX9iQ6uFp7ZFAtJx/cT8gVEdPHbUkt5eJnQXu
 UDTVJT4Q11EgsAFP32SK8rdFIaZE47oysRfv2eUIh7zeL0D/GVXsKTFbJfCWoN39n08bK1DUGZ2
 Bu4rTjYIehpoA2Wm2dUSHbQDvExSaeyfLlREMTCnmJ+V2M5wO87aSycgalVUjH7oDAEfMNHr5FI
 2WPVqV2o7GVLLi2BsI/iIrBY+DDLiuxOCv/hiEefgtLzUFNHr09CRrDn5UOXBOKYQM+9vh2/HLs
 vj0Yic0RdQTP9njp6kA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX0Mqoun+gEF6+
 hr3O98glPWSxIZAT/hDhfR6MLWwx4R5755lgGN/xoLYb8r/f1cJVU+IF8JuosaYrVhAJsGAGG1Y
 U2YfS7SiHC1OFWxGH6ywNGyFpG132hQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200052

On 26-10-20 21:08:52, Cheng Jiang wrote:
> The WCN3988 on the Shikra SoMs takes its reference clock from the RPM
> RF_CLK2 clock. It is not described in the device tree, so pwrseq-qcom-wcn
> finds no clock to enable and RF_CLK2 stays off, leaving Bluetooth unable
> to come up.
> 
> Describe the clock on the wcn3988-pmu nodes in both SoM dtsi files so
> pwrseq-qcom-wcn enables it as part of the WCN3988 power-on sequence.
> 
> Signed-off-by: Cheng Jiang <cheng.jiang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
