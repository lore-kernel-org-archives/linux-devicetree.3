Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB51415B7E
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 07:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791359330; cv=none; b=UkwcPqzEzDPRo/PAUlzI1mN0V9m5ZBuLDpkmPmvfzFAsjNbbAV0ZS1CcVloiXX9Hb0Qfsb/tpALn9EZooJzspnnW43FjaWhPUcnC+OEmeezjhNJXfl4YN43i5nN4nhxPGvdJyn04FCzz46ZKyo5vrgLZ9VNgHNiSELP3TOFa8RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791359330; c=relaxed/simple;
	bh=6utujesN3gBDkB6EXPDDR5CLOd6jQ6lyXe/vePhF3yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q3JPDw5iq6qD6ZoQswzeGgGZZdX53DPmriqupsE1C0AFor1gWinlCRzKYCVmj6isRfX49i2mPQZ2v8VSmG++hiZeMzz5EQhEW7aJ/LVUUZjlNJz0ByWG69BmnS437uXpcjhkwy9Vbc69Cqua430pRE2cNxKjX2w5wEdWC7d+z9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSZMAxOg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z0Q6awI4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSZMAxOg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z0Q6awI4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jZsq1873483
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 07:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oKC0olzQ/PU2CfzdnylEFRaa
	rNGXMHbrSZbNQIRuiC0=; b=PSZMAxOgGEQEhm89sbEvTLpFWOb5QWK00OPBYrc2
	A+zE3XSaPZ1e2Duxm4SodKC91gIMcqojDtj9ItSOuB7D3UP5YGEYXzVRsiGINVyu
	mDFobZS0Ia+VVYR5Lbr/1YHMoOhcQG7woLFKK4hMHgzqv5UvFf6L7tq25ZU8AmKN
	biQ4yfs3GDusTtpcyBfi2g3Kpos5aoIXqp4QsObFzcIlXOsCdX4REqyyIv4u88bm
	KKurEAfa58ivg8ucxHkbkKFmY+8o2L5hxcPSTlY8D/iyl9lItBNoWZv2yOUKCZGy
	JxmBUDrhKcLKmeFx6OYYjvGPgYRBfR511/d+eFVtbD0Upw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8re5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 07:48:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb71b1443so710830385a.2
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 00:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791359327; x=1791964127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oKC0olzQ/PU2CfzdnylEFRaarNGXMHbrSZbNQIRuiC0=;
        b=Z0Q6awI4yU1MaMn3yz4JCIODiWk2t6s4mBeCT0jBeAUHBSYjfvhSerg7hINi/8mQ8t
         JDuwTWLRAsGLldxkrqEjNaJThF1Ss1bcvZ4TcOa0o4xjFoyjuqI7k2o3vwPJKtOi5thL
         nSs0OCt+PDFlasBFP4DbtS5BdJF8Tj8A2NcEdmBXP69kEqhEQwViFLsSWSVOPf5vaFaf
         QQmK6X+6xZvW7iw5oCTIap15UmBW2NJfNwU3RtrOv1loAXDVc1hbHux+zOb4wCtWhM4C
         zLTCT2N8pEThc3by49bq2X0VqU4TRSf0edNuilGYyiCzrg8Ef2CP+C/8xBTyHOKJ5Jgn
         Y+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791359327; x=1791964127;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oKC0olzQ/PU2CfzdnylEFRaarNGXMHbrSZbNQIRuiC0=;
        b=vrgy81Ur2IenJ96imrxI3tg78r+Ic8YMDh4K1EpXkKRbhVdJDh31iNa8q0U9zLolIS
         OARXLu8izNSoMJfAqwn5RJawXMf48JjJtn7s9RPlhuaFqctEe5UHkeoaJYxOzZrl8gzw
         wyTILt6jAt6a/x9tGxGIpst0sBR/zcBIuYsJqDUKXmHaSUQMXTECgufvkn0C5+wjc+36
         LkO6iHRuz1rwYlaOwwH2MetL7M7Obe5Dljm+iCN1VdkTxTTgPDLt0dfl4bQETsQSph7z
         tJDLo86fsjElZgX3dsm1sU95IQJVZS62UF+yqTuChgtVxQoe/1IzKw5Op19v8PzBAh+J
         be9w==
X-Forwarded-Encrypted: i=1; AKwUvBwwS55xBZGggbVbyX3QKcWkWldxOxhNGvs6TntaCKjoE4j5IpbAQGH8aowcAne4RgcCfp+rgz8knaI6@vger.kernel.org
X-Gm-Message-State: AFuF++mYrP5iO5oRHzXb7fO4FyrIpuUCXEeKYGzhxOP36MROssHBKtiB
	4BjF9BhBGuKmY78c1WAOx9/DeBgtN+X/2DKNaT2D3cOcMhRtaoJf4nzRfUFTSo363CW/IRmid2/
	0J7sf6nJV386Uppc5Zz70cZ3c0Epj2WnIjB6Dw33o+J0b3JauxxssDk8NPsNJbv1o
X-Gm-Gg: AYBFou0qCzft/8Q/iJHV77GeDGYnWhA69G46i6ubLg6fAapSmGN7dFw4ACs+ec2X+jh
	MxkMZrp6Crxd7xGGMVQfympKQPey7SiZ2zA0ZvFCwj+fwF7SY6HIfbMfl3zhyYeywMSeLbufqnC
	xWhr+hxqVI51o0ZPW4+Yo9F6vgcS586gdp6MQYex9p5hhCEpPcKuHlOz6euEexNRtQttgzBu0Ex
	3+3lP3F16MofAf3zEbO2KenZrKBzgEV66fkbzAQoDIF7qhn7a3ccquVwOZfWYxECdY80E9JiieL
	RWWioM+BgktUv1VVueL6tGw5e54m4gRF9CimwYQ126Mg2ctjh7DoUOAQ9Tdl59g/J8TyRcG9lVM
	h8Xgbylq7Db+xCruLHgOmNQjV9bi9AOnREUCCw3RWXYLin/XwbyxBtBy79PvwpDsGDAgsJ4uwOq
	EjtM1A3OGk/B2g
X-Received: by 2002:a05:620a:4802:b0:93e:9834:3863 with SMTP id af79cd13be357-93e9b775f0bmr271074785a.15.1791359327195;
        Wed, 07 Oct 2026 00:48:47 -0700 (PDT)
X-Received: by 2002:a05:620a:4802:b0:93e:9834:3863 with SMTP id af79cd13be357-93e9b775f0bmr271070585a.15.1791359326627;
        Wed, 07 Oct 2026 00:48:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bccfe9c6e5sm448023e87.55.2026.10.07.00.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:48:44 -0700 (PDT)
Date: Wed, 7 Oct 2026 10:48:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/5] phy: qcom-qmp-ufs: Add Glymur support
Message-ID: <zovl7lrhlleflaewk32o4wofr4bzm2bmkdnakev47peijrnkfe@p3ixrxltdpcm>
References: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
 <20261007-glymur_ufs_qcb_enablement-v3-5-84cf4f861415@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-glymur_ufs_qcb_enablement-v3-5-84cf4f861415@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzMCBTYWx0ZWRfX0M1xnY7E2dBP
 VNFpWUAHGDveWJ3DZmeYwWTBlfv4VHmcDsqEw3VasHBy5xXx4m31kVzW2iytufAwD5AQbakOvFo
 SlJwjWJlMhsMyUoNWoaSwO3rvFizAi8=
X-Proofpoint-ORIG-GUID: iJQvHKOIpOUsEiTlqKMMosuy4xCQsP6c
X-Proofpoint-GUID: iJQvHKOIpOUsEiTlqKMMosuy4xCQsP6c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzMCBTYWx0ZWRfXxoOA+gh4vZiv
 UGQoUiGODqLxZuXWEOjJvZuAzKYZPzOLuHCG/1nKtdSO6BFt5RjrheBfmj/UgP2mSPbvZ9BOHB/
 ACg8leUyMAsvmwjplXttSdMhR9DWyUZTyvvky3Bd4AYnAXLmzojD89bi8Bp340pI0Lc89WddqcP
 Y8AUx1i7nSwTdpvWWJY7Ene322y4WPYWH0axncL70Ci1icyLap9nyhvykKKI27x2IjmFFr3CGNV
 fC5gFNSW6jczX3uMI/XyFVNBtn8zyj/EvSTTjbRf2YueB0fXPpunOcVxH+of8v2Zk/+atZ9O+HV
 tzbL3XpMEqH1ycLYjsWoQLdisdbsbDcv+sexdlN/8LaCJZ0gUj/caXaqxH56e5mzD34IRuJD/nQ
 PYHCzykXTsnT8ZoU9Di5sDV5Q076wl+Pk2BI5k64DTbZ1gn4fvCfPLhGANspVD31ZzdkEpOCBsL
 GSytfTSXlefLe+Cx8hA==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac5f960 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=BBNwevgwxSeHGHzN-EcA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070030

On Wed, Oct 07, 2026 at 11:59:38AM +0530, Pradeep P V K wrote:
> Add the init sequence tables and config for the UFS QMP phy found in
> the Glymur SoC.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 99 +++++++++++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 
> +	.offsets		= &qmp_ufs_offsets_v6,

So, is it a PHY using v6 offsets, but v7 registers inside?

> +	.max_supported_gear	= UFS_HS_G5,
> +
> +	.vreg_list		= glymur_ufsphy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(glymur_ufsphy_vreg_l),
> +	.regs			= ufsphy_v6_regs_layout,

v7

> +};
> +
>  static const struct qmp_phy_cfg milos_ufsphy_cfg = {
>  	.lanes			= 2,
>  

-- 
With best wishes
Dmitry
