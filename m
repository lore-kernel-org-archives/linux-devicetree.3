Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121693ED3AE
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270576; cv=none; b=oeqM2eoeCYU9+2RGYOkcfFL2JNK4YUJ15V1VEC2P0+FKwMPuKJE4FESOAprF4FONEXwNuZBLK21j0sH0+hFfu/3uzZoKRDvWXgquLd+FBq6RZMDjNQYq+twQ91QmjaxlwMQRR9y2+n3vvsIETr2DT6WjhHdh4LIuK6vjQM6D9FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270576; c=relaxed/simple;
	bh=nf1g+Fqp30YmpIaTMZMXYpVgVvbsOlnzP3kXNlN79yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8p23VWESs0JwvvZdJNRCmkvq8pT/MMJmao2IHSZfMo53dQ/d467WJHHnFPaqZAdrbKf+nUwValO1ZRTHZrcS+QlwSyFiitrwQSgE09VTnaB0yMzjCUu4dWjpLieMravkUt1ajL3f5d3jPILmFRoFUjF6pAonQyw3vHh9y1qnwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+lCBWFm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dSe3B+oc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H+lCBWFm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dSe3B+oc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCj4x93714739
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=221wATpxxjDRdtKDabS+fEkS
	ffVXjJazSuJCFsqtxp8=; b=H+lCBWFmNNU/QZcPhIq4/YvZRJ1iWT5JDEdgwwhe
	IBZ7XSBZZi1iUvCHaRZeK1vSB3napk1wahd0XfYRlQHF+y5hgXN6hXG5IVWbTQ+C
	8b8Idv2+6IB1lyk7rcmZA+ymr6UkS/G/QUnbbLL/9VriGT+c4W5Qv8ymKUgNi56q
	I9c77UhJEk4Z0Dsf0qKIg7Dzptyj+vy2uOrcY0Gh1EDM+b30bvlntXIBtLEVbTmN
	sWYSRBkUo3Es2fK71uewQRQZ3nX9f5TvFkjNpgvtUuKbRQwD7aU5HSBKc0xsbekQ
	yRYx5n3LoMAsYBJ655rFUytFEbGVp2lsynKb5H375Cr4uw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0x7kh2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:22:53 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6a2b8b91dc5so339569137.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781270572; x=1781875372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=221wATpxxjDRdtKDabS+fEkSffVXjJazSuJCFsqtxp8=;
        b=dSe3B+oc5l2fLTZ5Qz5X8V46tlh96N+bREE5mLLwhhvBhlLNrFzLSRvTl4U0UC2Bcp
         9eXC4SbNmnbvTOy799ncq1BnMSOMC4yCdw1K2vo0YvzdyuTYm8epQ8DV1tWt4OzBHLBx
         fjXxz91/46UwBeowlRLE2uVBG40ww5qFTzdiE/6nOkVHM1ifUAWxP/1XoXkDr1Q/4i3Y
         3npTVoeQvQxpcvUoaJX2yk4++CC85IRjt5szigQKVeuRTSZuf7i8LTuQjetNSIyb+pXR
         nY8Sy3nPsV/JLriVIqxI+bNUaOTUJSA0VrmiN2bY1/p/H4nMXboZUCr3s4SsgyQoDJQV
         Mlkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270572; x=1781875372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=221wATpxxjDRdtKDabS+fEkSffVXjJazSuJCFsqtxp8=;
        b=ViCMxIvl9umBAkcitl49SOxa/Pi1AsNGJ9nOCpw+vrqu5lPrmbrOEgD64cmadIU/M3
         ZDK8ud6otd0i0NoSoMO7gWGW/KmQiH3MwaMUonXM0dI7qabMkWXnNpnbtUizdwBfyGy2
         Gxq4BQ/54Ew/cYfuj0HjBlViY461yiVdzU5nYBw5st5mfDZciCcNWCEUTFxhJYansiaH
         hbcoDAloGg7W85EFXZ2r5YrQfh1AeN7f6YypR+BA95LbzFw4YT25asaukpUGzYcnftJS
         RDaJ/ekM3xNLakFgdwjV2W7HFrr+KLR9M97Ze9cqhokJtZpJE/KFFTyuSxWc6Ua8xGxn
         zRfw==
X-Forwarded-Encrypted: i=1; AFNElJ9s3nIZwFRNVhJgeuPxv08jJkb9G1L/2HjyxKVRw58dJjniRvmF3vs6rpOUmFi5OOQtphbpya6J2Rj/@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ9AOdEgbFUSeaSuDn2SVWsvVSClWocgyTnK/+wmElozqoYgWk
	VpsKWnDa+MF+newrnQMIAgSIA8LYuvDw1Xgbse5BYCVfTjkCWn7iI0YRsACiwV6v9ESjFMPzcqY
	TsfJnzscVVG4DAmZOti1O7xhornKHet/wg3pd54y2qMrbNEZEH0z5Hq60LglitX0W
X-Gm-Gg: Acq92OEFUKe7qmt5Jue/XY345eP6Zc0mZSiWihqAlTEFrHQ/zdWUUEkAJerC4nuirgB
	+OR+ACdlwv37K5QB2qgV7vYmZzLzMYvptImZcc+AB53ESrXsU5pVzz80Vzi8peAsCMUE1edMHmk
	1Hn52eD58A2lueCG6Iba0Gk6qoMbSplRKdXpeLRRjQCcclBZbHtqt4lcz6TnIkEwl7851yssara
	a759/MLVXQvDGjZVGizkEOYidmSKwo2PUzU/sbeUMQsTAbxHap8vZr0paN3SsQNrKXbd+gPybUB
	IrxOW4vnzhOSlOLkAoSCERFjRkbWLXbhtjZyWTYBe4L14ynnoCs29uHkK/2SwDQz8ijhQA57AC3
	rajEKSMfKs82UD9VaZUrv13xJ7kDnjJ0sHgGHHp6Uguf85jcJmYitmnq0kEK8CZVBKQ70jWUoAl
	E2kWbbkvbmhB59WMWXzlogWHzZO3os5IX0lhY=
X-Received: by 2002:a05:6102:6a8f:b0:632:29a5:2b27 with SMTP id ada2fe7eead31-71e88ac8d00mr1220313137.3.1781270572394;
        Fri, 12 Jun 2026 06:22:52 -0700 (PDT)
X-Received: by 2002:a05:6102:6a8f:b0:632:29a5:2b27 with SMTP id ada2fe7eead31-71e88ac8d00mr1220257137.3.1781270572006;
        Fri, 12 Jun 2026 06:22:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1aea92sm532555e87.63.2026.06.12.06.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:22:50 -0700 (PDT)
Date: Fri, 12 Jun 2026 16:22:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Val Packett <val@packett.cool>,
        Bharadwaj Raju <bharadwaj.raju@machinesoul.in>,
        Bhushan Shah <bhushan.shah@machinesoul.in>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: qcm6490-fairphone-fp5: Add AW88261
 amplifiers
Message-ID: <qc3khvuiwllxkaj2btmtevh7vxvdkcnnqemetvh7mqeuoe6ieb@7nkztniqusxu>
References: <20260612-fp5-aw88261-v2-1-f7ef7d060170@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-fp5-aw88261-v2-1-f7ef7d060170@fairphone.com>
X-Proofpoint-GUID: q4ZlUSaT4EggDZgWvAQCJkdrgZjLPDyp
X-Authority-Analysis: v=2.4 cv=c4abhx9l c=1 sm=1 tr=0 ts=6a2c082d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=DvXHit-es2HtMH40iYAA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=gYDTvv6II1OnSo0itH1n:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX84Nr7plxRvKZ
 yDHfBp37SAlYswpDBKi2F7S7Gbz0JABXr+5WAO1dF8FltaBig2RBlTlxYJuDCsVVOpzlDJxoiID
 3SB/OlqFSGLM1bUDtNnmVMa+EftOoynwWoqda7Sbm+/gkTcIJ0QRPjw8894A46X72C/T9QyTs9J
 44yGoO/b7pbcFl4maetW6mYeqM+P1rQVIMOFX4BiJDO38TYtNzDZY5YmsLyhsFlqxd2EFE7+Soq
 5yUu3umorNtOR7Hg9nRYFy1lhFRz0Hdjk24pQ3JVx8dlqENe7OywJ0b6JXudaa3m0MymKMoXc19
 QMkwAtHmYMAb8mQYTfQ7GpskoL69xkPtVD33v+eU6uzoRjqLrv57XwxxkowdvSFlQboa5V88lp0
 9GG2aRw6TOtx/9LWqTOvrnJHdDJNgKHVkmPVDA2cIxYubSTsbWMx6FmcnR0h+BVYT74gNM34vxk
 9Mj/k5sdwqwPtDYHIvw==
X-Proofpoint-ORIG-GUID: q4ZlUSaT4EggDZgWvAQCJkdrgZjLPDyp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX1ojc/Czt1ybr
 YR46IN/JoXzCdLk8x+mvyZGhydec+BD4m2Jm/NGBjjPQUHbo7LYmqiat4OgQmbbeCSbi2BRII0i
 dCTx+ravimrguNFIB6IEErCKoaZHlqI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120122

On Fri, Jun 12, 2026 at 02:52:43PM +0200, Luca Weiss wrote:
> Add nodes for the two AW88261 amplifiers, for the top and bottom
> speakers of this phone. Hook them up to the sound card.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
> Signed-off-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Changes in v2:
> - Remove awinic,sync-flag for both amps since it's actually not needed
>   (Bhushan, off-list)
> - Remove RFC prefix
> - Pick up tags
> - Link to v1: https://patch.msgid.link/20260522-fp5-aw88261-v1-1-20e412eb4c4e@fairphone.com
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 57 +++++++++++++++++++++-
>  1 file changed, 55 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
