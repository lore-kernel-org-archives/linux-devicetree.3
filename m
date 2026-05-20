Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D12B3DE439
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284649; cv=none; b=uz3fVEB9J7u5PWTlpIKdbVTQyXQadcE5kgiLZQHQugb/DepPAELXOG/AgUby66IAwtluEr7fE4Ff/1iISu6DmUoZNlxpEFSV/8dbjHXNeg264jtgcFTLy9Wcbg6paNi7jJs33JWOW2qs1Ww3TLrZK9gmsVqCCFeqvloXwVz48B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284649; c=relaxed/simple;
	bh=8ZAIWW++k6Z9mhB8Rofcy1NdGaNN4FGMQCXX4iEJu2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PnrxSq23a9Me8MEclUtOd6Qoft+zeCSxw8iho8RaFStlntXi6Y4lQyVuCewHtaj4jLpCBJlO9lR6POfgNF9GPco9mgSvVhrsZg/8miWcGDPsj4pLsqGO/bUCzjL3VLvwbHS5+uNuRg7tXYVM7mr/K4Nw86b+QonQmte3JTFjc/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AVbr0qqz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CYoJNhWK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AVbr0qqz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CYoJNhWK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7kqc82065141
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=560jRcjDyg9F+NbpaPbaEIRF
	vJtrmZpNd2HjsFPSqnA=; b=AVbr0qqzKN9iGNa5ZHb10SMJl2nEPHCZ7b51Jn7F
	JXEHixen8d5/t7VUJqmio/iqMD8PBysDY7bj5MTlzCqyPkGiXHGouCqpKaFPj6QP
	amtvfQurJVHFkhT8SWqarUkbM92gCAOCeJ4zoD7yIS98TrSE3yu8IuWHrlO5m/Ai
	GbPWjkz4j2rXFohlJ9AccXM1KOlqViwtLMj0JXUgzWwPEel7ZLdG5HG+hV2tSPWb
	8yb4G1qIGMsqE1m8UPRasnuseFRPI9PMJnQmHo9TwVzOFLR798klJCEbtKwmR4kB
	tndl2UAPFZY8+TgN4m4YrosD8uVRONuyyNAtkCtcJht9Ow==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t4wk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:44:07 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-57584c23424so13086274e0c.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 06:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779284647; x=1779889447; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=560jRcjDyg9F+NbpaPbaEIRFvJtrmZpNd2HjsFPSqnA=;
        b=CYoJNhWKjzEXEj74Voc6fWP2VEDueZ9FuQW5TNbLplZJIF7uqXqq3fTNtqkVF3s1/s
         0o3XNg15519QVRtFLXllE5/L8tIxjkifpIaXHg3H18BGvi8CDKqf3epfIpCwp0sEsC1y
         H9cd902YclMzE4sRUKSLd76KHEsb5uDpJTHZpakq++u4+7BJqhpi/xO3xHR6qFnzcG84
         M4rPZN5TDhwhJOY1F6/z+Tbcy8ieo30lUoSCDSDIqG+9CWBOqsuvU3hpOGO9agaIuYZZ
         1AruBe+pfLXAqvoxk6ibbooEkRVvrBzpIMvs3dYNiTv9lJcDddKpGXjdnUVC9I+CypaD
         FZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284647; x=1779889447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=560jRcjDyg9F+NbpaPbaEIRFvJtrmZpNd2HjsFPSqnA=;
        b=E2pReWbSPnPymZ9L12vRDRSiLMS6ZfC3c4jWrKy0i9QjsFO58qxy9lvYwt9rthze41
         1Tl+2ytVDWGgjdOHd6nEHTERRlUOTgGi1DQXOsTH611JUyRrgtYsykt0/NN33KYmmnGw
         Lcia7O47f5WnzHY7ISK5oFeHaZZFK5KDkNwLIxPYHILksV1ynu4/KCBYwEDGnt01cmSJ
         ZTP0iHhOUywz1tbuA0VwyH3GfcDCp62yfwC9SLrwmTlf26pIYC05EqIsKguFHKkAQYho
         V0HP+HNyqbssS2TuGQS1+MHgPGtuLsQdSS7uWCVceNHm5wqT1UQFWHtih1QFnIgTpZmd
         ElHA==
X-Forwarded-Encrypted: i=1; AFNElJ+c1vYpLC2QY5MpS+xFs8GnUUolbn4T1Jr7L+WPZ/m7MrMCOMG6Ps01OuU8IlNVY4v2LEStdaVS4EWb@vger.kernel.org
X-Gm-Message-State: AOJu0YxXjiMnFpEbSkPIUYvlPl/Euhnw6mfJjwkUGnlV3dlwz02AaStS
	nT2EECi3JmV+FJF368pAK2YuPp8IHbE4OFaWu2vpjBAOWN2tpzYmKdUXHX9dFAhO6J/gEoN8Oif
	2mG3yT5B76G6a83azQOMbj4pVGUapKmIWbbBfseqYHO9leYpPFiylmI4u9SE952Pe
X-Gm-Gg: Acq92OFrvspUnsQq8cobrM/Wmz64KaAIvhvoDhYzjeD+YNyyEmSpSpjc/tzD1KSGGvw
	p1EgBWOfZivmtkPb7gB6H4IN8zxpoTcOgQtJD91+nzfASFFP0xlXDaE5IQonuDWxEzghTcLR2dP
	iyA/lI4Ew4Wp49ZaNo3lHAl2FWm2fNx7ObxGm5pPmgCClWh+5A2ITUAeUBUHZFX9mq1ZaKrBkRd
	1z2bSQ+h0g4WnXBOXmvnqLhTT+CrLJxUjzaovMcM/jeXFoTmsRyevR97Mna6ftibUszJvGbzt1k
	vqqv+Xnn8b4jwrHugbJELXWGglZHRY75pcpwxRs4eXARxfmblLha8+8vtlLgBKaQscH5A9WJ4eZ
	xxmhJl1B0+JOw1tox+DpS5/TM6iC/f8hD2uidKUI+08+lG/bBxdG83kkpdTLrlgR6HGgzSFjbdH
	yb2jsMQ4krM/vt5zdRrw2114P4ovM7EK5qRwI=
X-Received: by 2002:a05:6122:1c85:b0:56a:fcbf:8aa4 with SMTP id 71dfb90a1353d-5760bfb9623mr14884860e0c.2.1779284646673;
        Wed, 20 May 2026 06:44:06 -0700 (PDT)
X-Received: by 2002:a05:6122:1c85:b0:56a:fcbf:8aa4 with SMTP id 71dfb90a1353d-5760bfb9623mr14884827e0c.2.1779284646263;
        Wed, 20 May 2026 06:44:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc407sm4927823e87.52.2026.05.20.06.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:44:05 -0700 (PDT)
Date: Wed, 20 May 2026 16:44:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur-crd: Move common board nodes
 to shared DTSI
Message-ID: <fr7pojzxcpahwq5s5bhniwbxpjboxsjuc37orpn5sohxo675el@qtyy6eassp4f>
References: <20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com>
X-Proofpoint-GUID: Z6Qi_Bwl7cgr2m3b_-3zmPiCsqXwwhpr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzMyBTYWx0ZWRfX04+6NYqfd6zJ
 8JtFhFW49IsROrp315wjNXWHWw/E3C604ItYwa94QeYavyRYDtbO0ujR63Q6jnw9ydOnqK3GY0u
 lFfdqRLguiS2uOIPaNxy+Vle14VSlnjysBa6q3L+StjZRbWOr6mxAf8zOKO+7kSBBhUk2zypEFh
 gnP7SbP4txMszD3EemdNjQFi/Jo9r4/gMC4JW/ZH9NPM2VH10IPpXAeInUyRBNU/qBQK3ve7CZv
 0HJUotJ4moUOanaywQWYmkifYuuFDOrxyOJxpQvyhAHx6ox47GSIASgisBkRPYzBY07JYTtvH2l
 w35GmFBhl/9+30pXLVNB7Ub64Z7Uz/0FHR+kXsR16ssidJQ8/TxGFh3+AKTb4NHnE/mn12HFj/W
 hzNNHhapZF5gupxcUBHnZ3dkPqX4Y1GEASG7ZLNp6y22dFizYaxto4VMYhClL8V4KzJvmivtreH
 WBij4myJpO4KE19KL0g==
X-Proofpoint-ORIG-GUID: Z6Qi_Bwl7cgr2m3b_-3zmPiCsqXwwhpr
X-Authority-Analysis: v=2.4 cv=C4LZDwP+ c=1 sm=1 tr=0 ts=6a0dbaa7 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ArSBqUEsZOOXoIw0mWcA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200133

On Tue, May 19, 2026 at 07:25:07AM -0700, Gopikrishna Garmidi wrote:
> The Glymur and Mahua CRDs use the same board-level hardware for the
> eDP display panel, MDSS DP3 controller and PHY, USB-C ports (via
> pmic-glink), USB 0/1/HS/MP controllers, QMP PHYs, eUSB2 repeaters,
> HID peripherals (touchpad, keyboard, touchscreen) and their dependent
> regulators and pin control states. This has been verified against
> both CRD schematics.
> 
> Move these nodes from glymur-crd.dts to glymur-crd.dtsi to enable code
> reuse with the Mahua CRD.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rebased on top of next-20260518
> - Updated subject to include glymur-crd scope prefix
> - Rewrote commit message to describe the actual shared physical hardware
>   rather than the code-sharing intent; the commonality was verified
>   against Glymur CRD and Mahua CRD schematics
> - Link to v1: https://lore.kernel.org/r/20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts  | 399 -------------------------------
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 396 ++++++++++++++++++++++++++++++
>  2 files changed, 396 insertions(+), 399 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
