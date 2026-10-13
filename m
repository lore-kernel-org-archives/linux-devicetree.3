Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4D6426431
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887312; cv=none; b=RQ/5v9IDUDmtTSSVfdu3nRMBUlYi0uTQhfdJVXSFlJIHlAM3Gzv6lSUnNvy0M8Dwef6e4yF6vQv5G7fsAwHzVUziZ50ywGvjWKCjA/dcQgWsAJ30SFacimYNtzOppx7KcNDlq2oLq16Qope1Cg9HepkHDj/JtDls8L8Q0BkHyfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887312; c=relaxed/simple;
	bh=NDDyimJay41Q8YbZxA74mfwjIjsKdQBWWx4V87lUn34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4Cn0AdhCJwwb4TbiRNE8cNMh5PysUOakoKUHMGYkS/rC7DskQflziMK6x359i2F5xzt3W+C67YAu+HdPRKyvxbtooRtuS/eSZaV2F7ouSIcixPxxp+YKoIfaV37CIYnX5FvhN7EVxLpV+YyFEc5ls3Fbx+ImgqlAgusodhckKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ch+CpLRf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jfnWhSDK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ch+CpLRf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jfnWhSDK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8NZ3k3907376
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bpe8qQ3M5h1iDZEhG5mujR04
	iapwZbDf0fYwJj5/lTY=; b=ch+CpLRf8vZUGgf56aNlWN/1uHUr4tjEFSawUP0G
	hvgrzNqir+yvF+vo8626EQ6D/RSR3XUhr7rAIuQCOJ1um8YKFTPhUhNNtHKI4jvJ
	wdMCptXNiaZqoApCOJOxNmJLnmECRM/b+Lq2W3sh2hOe7tQPW2ewzyswVPl65tKV
	JPeNqlcUO+DO0CI84F1s10yXiFA7HnT5tS00xjcBxYM0tF6W55W6KmH3PnZw9uXj
	HLEZqYLmYIA5ubqTQNoy+h2nhpBJZg4qMS8zAWNsLoluw5WaDfAZRiUbPEbbXY6/
	pEihglGTFqFeFpWudux8AF/AKJ6uq+++QS6JnbQbSoYeIA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xqu24c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:28:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf7856ffso564668085a.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 03:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887307; x=1792492107; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bpe8qQ3M5h1iDZEhG5mujR04iapwZbDf0fYwJj5/lTY=;
        b=jfnWhSDKMDf17Bf8MebZwYdqMx1/r8NzulstVpNFs0FYyfQdLuQzLHJ+Vc5600I/rd
         phLn5mWtOpD617AucFNFkNUdDEAzL/UiwIZtCw06HVfyrGfU31+dFUBoOcpcwU4Ajhsh
         I1uT2IBgScYupjlFtMEtuO0/Jsy+gOAqfpN+1sPiZMHHfUsvVa/jRIxltkrc8bsIok13
         scGINAfKQe+Q4yqHOqz948Os+a+aaDkwG53TskuAo0GzMNlpaATo6sWuqTohcqgOOAP5
         BdIFhfo/7mPJlydr2pAQpGu9UugjQbMw4AXOJqwI1FKJzS7YlDCL7gVaKUlV4mAQCcol
         9uXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887307; x=1792492107;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bpe8qQ3M5h1iDZEhG5mujR04iapwZbDf0fYwJj5/lTY=;
        b=HpCIo9sDhhoccQroYYsV5THw9qSir/gwIgI31NwKm8rffvOfR4HBXFkGGWABzcvPQW
         h8IbSA7bb20BPh86mNqws/htCwjC6CZV/R8a76Lb4WK8u4SPHXf7g2NHnyeBV2Jv9yqx
         we1WHW0cuQDXiomE9C6nUbn/kkNyGAMkDXos04wDqzZQD2kmCK/OtnsOEqWtlBWD0wGd
         CwVfrQ578kWUFxf7sNjjUeW1g1pKaoqZ2y0h7ffeus6L1rP2vPMEWlOqreYX0736y+6+
         NE8Z6cGGV0iupwroiALIlZY5WKfN8iYypos0vxcf37bOluFGGA5bqHtAfYaRJtQ56/OB
         xa9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxGU0Er/kqn7T7ZpGojkogDVZ8GThRmR85xi1pDjaBa/3Hw4ytL0gWGtuE7Zexlo5teBwNgnCo8rY3D@vger.kernel.org
X-Gm-Message-State: AFq9FYJmsIni44VChAeTdsnqsIdSZJtag6ogTrJZpxObpHFWqe30J+Bz
	Idgj7tF6kWGLrj5+yy8Z/kUQRt4MLG/sC7FtdIq5To5J7Rge+6lykxb5/lzZ9fztbDtAWEiBqAH
	KrCT30M9VOfgDOXyAcprfgzdtEl1u/H9Y7fC7+cJIeGLq24Fh2Q657mVnBTbT25On
X-Gm-Gg: AYBFou0OKFyGJb/KyqiUt+fRQaG4q+CQ5NvAZJfkeu0Nv13M1mUjoj8tXViKsc9eyyl
	XJn8I4qPZhIgVa3MlsQvxlth2F5JTdAYhwITIRJZEQ+XHELqmoJeF9nAV24ShlFupzoLVPK+y9y
	qANxbdToV5cezayJCasWwEf/x0IQGbKOUFDCf8J4M2uNtu8w1XR5tuHiEPaHf4Q5fEDm6eS1Ios
	kXr9+TeEQpkhh0JQfX1o3aW5nLufaQT2Pevj0p4J62Tgzmepo836y7wuaWYLVf8SjLY57EPU+tw
	Q0Xa6wJQbSpZqlLFW1Uu0tBhcWwJfBSaI6pZ3LJAeS1mMREZlx6XPcLc3Zb2seAFL29R+6GdkBb
	EtKOR4yYUoet3+QclcL89latG0lgc3K6N6sVNlJyF+08JG+k0HRKZ34F9o6Tt75t8YlgfdqxzzE
	AbcizF3eDw8pf6
X-Received: by 2002:a05:620a:4693:b0:93c:771e:b672 with SMTP id af79cd13be357-93ebd2955d7mr2099039785a.54.1791887306583;
        Tue, 13 Oct 2026 03:28:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4693:b0:93c:771e:b672 with SMTP id af79cd13be357-93ebd2955d7mr2099035785a.54.1791887305992;
        Tue, 13 Oct 2026 03:28:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cc730esm34197011fa.26.2026.10.13.03.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:28:24 -0700 (PDT)
Date: Tue, 13 Oct 2026 13:28:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v2 10/13] phy: qcom: edp: Add Nord spread-spectrum
 clocking configuration callback
Message-ID: <ix2c336s65dqq3trynfpugujuadqcrpojef7vov2g4h4sek7eu@icwb6gfeewax>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-10-a2ab9af954d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-nord-drv-dt-v2-10-a2ab9af954d2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX8G0+7UW9gh+G
 uavV+cExzioYjaBNpL9yQ9kaz55ZpzYdATnQOgqxERadtLhgMX6mQdeHhW5q0zqXkLrkIeZkcI7
 jJcl91Q5+LzcAXkoiT7DszrqASLQMshi3fKxlRuEQ0M0QmvJK8q7zAEGJYOgF99anaTkSo+cGvp
 j8AAyeNPCtPL1YEie4IdbtZldM4opsgkzqO5/kCz3Qd8IK4GQjkbWJ1KzmWgxb15TlJ4Et5MAQA
 6HTjI11J1EWiWjcZQ16+/EOKYotlIoao4evtAuUFydD59QSJDGDiA98Z4NXUwloSIoUAPpBe+TW
 ITRt6H05LnAVt2y0QkMYP2rvaNlXdBY/bTsYv4q0Yi1nyoteITpGeBHbnRle3a9LMUyWQu/fsDc
 VgaS17hSmVInZw//kF9BXLCtvm+NmcjtNbF2WpDYi4voR1pLxdgH1vnfLKM7eKIfMMh36Jya4OE
 4s5PKaT4qdR2W+0icYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX2VDsn0Uidoj0
 YGhQZ1EZNr7kogybSoE+J4M8v0UmecsCT/6507xWaNoOog3uyhSXqBD8ZmDTk2hDQQQM/7/+snu
 7j4cR64cvRX2SQovezTzY4PxfZVcjRY=
X-Proofpoint-ORIG-GUID: IdtTYSde3dxxiHiaHUitGxwDAznhwTUa
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6ace07cb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=kwn4x9jUkZ_pmG-z6m8A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: IdtTYSde3dxxiHiaHUitGxwDAznhwTUa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130041

On Mon, Oct 12, 2026 at 07:02:20PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord requires different SSC register values compared to existing SoCs.
> Add qcom_edp_com_configure_ssc_nord() which programs SSC_PER1/2 with
> fixed values and link-rate-dependent SSC_STEP_SIZE1/2 for RBR, HBR,
> HBR2 and HBR3, per HPG Table 2-9.
> 
> Assisted-by: LLM
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 

Squash into the previous patch.

-- 
With best wishes
Dmitry
