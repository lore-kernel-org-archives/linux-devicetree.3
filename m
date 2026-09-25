Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7364CE662
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350187; cv=none; b=h822IllfB60jAW0cgX9tChx5cjB4loekz3XgAHMFOB17edk4tb0zY96K9Xv0IEniWbCdZPAeXavkJ/2qqKLoFasO43ySH/FJiXX9bA+dUK3kY5ibWsGlykXVXHuT3XndI0JYVAmyl4bHSFutz8TMSRZEVGPUlsAEzRBPxDtmUqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350187; c=relaxed/simple;
	bh=upblnXNb+p2KtLS8GurcmAtzvFFSYd4j6PFmlGgUicg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MLn+4NixLpVjX846Y3x28RpCc5A+77xIwdCb/wp1FhCA45i5462wP1SiI3Zw5WUQ4xA/3hO6RnKYnQJn58lWZN5oxBUOLQOo9nIx45yCI7I4hSlcTtcnkKyj8H9LvFq0Z1YEriga0yPe+jTcqMY5Pk90hUDLMWlJuVhASpuYu7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/MHFSkB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q+tAkuBa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/MHFSkB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q+tAkuBa"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PBV8cW425827
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EugQq82UdCAjcqop/r7zwdrt
	/Yc1q9zAWsDcJB9IHDQ=; b=W/MHFSkBdsCw9c2KQmz/KGAY3vAaZNc4yS/AEkn8
	VYlLY/yyn+SLqyp28hFYzS9vF+x1U28X9OmBVqMit6/9ZpK6eKX3aLa/HFOcfo73
	xYJRCEYMnImNx/rT6YInlQFfs8i/OoGF9jP1ToshJj9SPTR+EMyURpRHj7eC/yky
	oVYiG+4WGrb/mTs/swKbo7ROa7H/h+fTH0ZxxnmDc1BiwaJxaoXP7EcmhGT2KIfi
	cue2cpXBSVS5E9Fd8PwyrgyULvv4ON9LmqNAKuJrXTMhExASM4Ivhm7XoeKLtzMK
	A3Iei8AnSc+cpPY6KEnrdcImp7RAkQ6WSe6E9y8fllidqg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr5e8u05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:29:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d94a158dc8so12894505ad.2
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790350184; x=1790954984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EugQq82UdCAjcqop/r7zwdrt/Yc1q9zAWsDcJB9IHDQ=;
        b=Q+tAkuBaqxiSfLYd8XGLW6kphzDgi3ANHRy+SMT24XvdCn7KWXd/pSM/oB/qGenHGY
         Xe4sJgQ8gFRfRcXzzlA795weeY89TtprS/Ou65GjlyahFVHvM92jIVsXSNXlGGNR3Yf6
         URBMy0C/kWVjTBKaU4gh55nXPypk2dozk+vKe4U3fSfVkDG323wWOZSY8juGG1/lwp/G
         QizhsLiNnU3Y3ay1dZ5OO892G+8AjIZGA0cOyEIBbLFa4weQTyyQrVFDQtJTTsPZY9P7
         zLd4NkI1Lf/4OWCzv9OcWCndzzXzei0jAg0jOTXNtnhUORQuOtyuc938/F6V/oxVUyk6
         dzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350184; x=1790954984;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EugQq82UdCAjcqop/r7zwdrt/Yc1q9zAWsDcJB9IHDQ=;
        b=BP4tUMlK283PAsV1PxB8mB6nBMLhLchUH+rB+sQBy+RFTviJKlaEvXhTuaTNcJwJCG
         BpeBk8D+yObhQFSvf6EAf5HQl/42zu/Q8GyiYnTvLJ52qJdif2QWpns1mSB8qty+8DUd
         HTJ8XH09h8046OLVCHCrwCMGob9B9j0CTAIEr2Zd1nKliFXtsPklkGwukeY6elei224C
         0fnSqBZ0vuL/LnNykbhaaXAZpkhh1Y5qq+CupCygR3fz8W2sTSy+fR37I2W4RqMNAP/K
         kmJrCZkYtsubFSoONs3thqRSber2ChIvBdik/nsWCFwixcIByqQaLG3iJKrqd0kL4Vze
         YjTg==
X-Forwarded-Encrypted: i=1; AKwUvByavS7/AaRyWDCjErzjL2Lb6nTnYQ4RWiOwVtuAXPYvOnZ0L/fyeCJQKvv6dHNXgtSnTMCPZw/3LiuM@vger.kernel.org
X-Gm-Message-State: AFuF++mUzQ5GRVk/K7iT8nWlkOO93KeT7gwCyOUGXaMaPyFfwtegD9El
	KuRj73SXO4k8Tsy5pcYpvyK9eIfKXPN9WoQ8VFfOAH1kcxBGHX3/0C/T4+RPKsEvTHZ/xqcXEC8
	JVps24Xo8xe1gylYc/E5sBCv38AdeNfby4QRQs6OsSC3BbRfVpxXDIIqu7TQoKMPa
X-Gm-Gg: AYBFou1sX87mBvCxNomQ5+8w0rZSxaD4LF+OcL/Oj0ysEHeKxaV+RPIzIIYLubdy2Kt
	Uen3LNAN+do9l8+SpLo9uuB2Ki+oSgjiYc6t+DJg1pfGSHo6S2B+PA381leYNcg72T7qWCes0gZ
	FJQu9tvdVFQXR8MNVsx6nq19iLOoC4AtGFbWvs0/brYk0MKjujaxquv9fuvNaOJyXnJkDsrFRyG
	m105shJswgcAmS1v2WxgMix3sJ53KIQ9jBm2lldji6xzSVzX7YnLJGMM81Fryuw91f7Cxinl6W2
	Gm9RhYw5eC39umbAujpL20ngZ+PxTuBr0r4WBy/Mi+EWunkXTC/IPh+MXpyHIpN6Te/x0EJsPN1
	/uvLe7FW4+SCEdgh/VNfUpxNSyVYpOeQDq89a2PcBHA==
X-Received: by 2002:a17:902:cf42:b0:2dd:ad74:ac7c with SMTP id d9443c01a7336-2df949937edmr18018885ad.23.1790350184143;
        Fri, 25 Sep 2026 08:29:44 -0700 (PDT)
X-Received: by 2002:a17:902:cf42:b0:2dd:ad74:ac7c with SMTP id d9443c01a7336-2df949937edmr18018655ad.23.1790350183693;
        Fri, 25 Sep 2026 08:29:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91468978sm12693375ad.79.2026.09.25.08.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:29:43 -0700 (PDT)
Date: Fri, 25 Sep 2026 23:29:36 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8750: Fix videocc clock inputs
Message-ID: <araTYLZoYUKyQw5b@QCOM-aGQu4IUr3Y>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
 <20260924161152.1162301-4-shengchao.guo@oss.qualcomm.com>
 <3l6v5idon2edkritzyqlmvdjn5ijt3lytp656sxicfnqah2rga@o6plxiv5d53u>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3l6v5idon2edkritzyqlmvdjn5ijt3lytp656sxicfnqah2rga@o6plxiv5d53u>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MSBTYWx0ZWRfX9ACvi13uH2uV
 jJQVDXMv+6RSFXw/JUMV0cTAJN9nlcBNE0mxZjYdugEsKSl2lSdZCNkxA2A2kICldxGZWmndAG7
 dBNYxWfJjQTZSBoezs2NZpzGVipaIEo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MSBTYWx0ZWRfXwfIbopAVrJOe
 QV2PEqCacs4V7I1nDplo3FrE/1MomfzFTyMdI72NnZ1tNdjHqcM0IDgRCbc9MDRr4ve/BDIwyJQ
 P8WJzIv58sVpdiYi20VzUXRWXxpbY4yT+dfkPcoC9vC0FWPdAj+8fbtOj0Ku33vyJVzhngtk1W3
 j1ojleHh9KDupgRozNgxdREi+4J9+8jT2OOoV8ND4inBhingBDs82Eg6eA36/ryI4D0lEXyJBLn
 uqeA3EzO0uE4EYrYPwtZEK60wTSIg2VIrC0/mcR3htMN4aW8BWlPJBU5TG7qzL1Vu/Eu8PfhI4X
 oLX6tnBwSbIpoQjfV0EZ7MhMWjSTQ2YRKN1l+2Qgm6BmPqTyTNsZ4nsenNBIrGW5a/SokDh9bP2
 QvCW6lAbrlN6vHDdqBAdPzlZFW1SgdhMhbiEd3/YCeao08CafSFkqTYH58xhq91LmPOpRdBW+OZ
 /qfHcNCU18cGlcbTDIQ==
X-Proofpoint-GUID: -ChC5S_WDQ_nvtVKtWv7Zf3cqvdb1B5O
X-Proofpoint-ORIG-GUID: -ChC5S_WDQ_nvtVKtWv7Zf3cqvdb1B5O
X-Authority-Analysis: v=2.4 cv=Hf2B3SE8 c=1 sm=1 tr=0 ts=6ab69368 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=91EBbpWxNo6HCqDt5gIA:9 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250061

On Fri, Sep 25, 2026 at 12:47:16PM +0300, Abel Vesa wrote:
> On 26-09-25 00:11:52, Shawn Guo wrote:
> > The videocc node passes GCC_VIDEO_AHB_CLK as its second input and stops
> > there. videocc-sm8750.c declares its DT inputs as DT_BI_TCXO,
> > DT_BI_TCXO_AO and DT_SLEEP_CLK, so the second input is the always-on
> > board XO rather than an AHB clock, and the sleep clock is missing
> > entirely.
> > 
> > The missing third input leaves video_cc_sleep_clk_src unable to resolve
> > its parent, so it registers as an orphan clock and cannot be rated.
> > The AHB phandle in the always-on XO slot is not resolved by the driver
> > today, but it implies a parent relationship the hardware does not have.
> > 
> > Pass bi_tcxo_ao_div2 and the board sleep clock instead.
> 
> So videocc can still function properly without the GCC video AHB clock then?

I do not have a sm8750 device to test, but I did verify the same change
on Nord, and videocc can still function properly.

Dropping gcc_video_ahb_clk as a videocc input clock shouldn't break
sm8750 videocc from what I can see.

- The AHB clock isn't a videocc input at all. The videocc clocks array is
  positional and the driver maps index 0/1/2 to
  DT_BI_TCXO/DT_BI_TCXO_AO/DT_SLEEP_CLK.

- gcc_video_ahb_clk cannot be consumed anyway. gcc_sm8750_probe() leaves
  it always enabled in probe and never registers it as a clk at all. So
  <&gcc GCC_VIDEO_AHB_CLK> resolves to nothing.

Shawn
