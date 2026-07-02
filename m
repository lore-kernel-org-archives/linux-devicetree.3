Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F513E44ED
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 12:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782996256; cv=none; b=Cfrbb9v3E+2ygAOddwZVshTiBHvI4LQ6f4hfFv2Y7IqdBqs+VRnTxd9K2pCcnyRiW0wH+5qM/Buse8VhuOYAmdBggWzdWTLOryBI4UB3lMZ20/yN9Os1cj5nsD5DCbFBSGMgM5vgxDpUTskV4cdWuLSpjb0CcKg7urbci/xMJNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782996256; c=relaxed/simple;
	bh=KSEMk83LTvH1ntmywIj4xfqhbRZJboxTUOGjWyN+i1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WP1hYMjgN9a1DyA4seEy1X0ulytxRnoehtXUx7i285ZEnU74ncYEJO047Y1R080su1eLGgVcL4QeNnT5dkVyi9MvSC4dUwylgynK6nPlZve/Dv+FAn/hBD/va0PEMThG5HO2CpWCVlgRi/m0U3/G2QxhaG6SZ0mik41KxjXhQg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kCMY3zff; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jNtsaInh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCMY3zff";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jNtsaInh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629KP6s4115627
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 12:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DwO3VIiIxXw3d1C054wPvvl7
	WENNMj1otLTOtdBbpWM=; b=kCMY3zffz4cbVZfUtG35Tpn0fYD/KwtY6N/D/gPo
	NfSF0HzLdDfhuirPU3dve9J9AE1fmVMgWBXvrF/mxNlXCFmOYn9MkR6JhXO6QxfY
	cBsuMq0dyHBd1ZD8Ucg7p3E7yKosw2OUCi16bUqvH1pNDQjXTR1YESrLX3a8mcQ1
	BRlWzaTR3pkEsbMC17kcjdGRsvmzeGRsY+4uqRWCj4OJO0wtBxQKKLXZmPWyJoVa
	7b/GOKyalKCEXmU9STpMusVqO4ovi168NTQ5FTl4PWO7EAFy4Jv32cf7C+dm9mxW
	s9o4xW6tkapOZwx/QbWrj81R41qjtJJigPKdLttZA4GIbg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n940sas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 12:44:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e63df032bso50671985a.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 05:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782996253; x=1783601053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DwO3VIiIxXw3d1C054wPvvl7WENNMj1otLTOtdBbpWM=;
        b=jNtsaInhGu5ck2hCtsgowYLyL3WAdytTLNFdZL74SYzaiU0pgDXIOkrayg9gkrKbsM
         FQKp/k+XriRg2z9Kbwr0IX3ym30wd04cuGrj3eU6UVBjpsvlCTO2JzCUkjrBKHcDTeuS
         /iKZlBVqg15HVM+00SIqWXP6+tvhyx0coHHLj5fssr463MO0wyQFzipx6alJpvodMRyX
         d0Ut/2akCJZp3Xk6C6GUsPuN6XgkJv0xrvTQ6LmOd4uwUHKDFG0OE/774isc4r0V1qs3
         aCtWpeP5xo3cFrg9XWAe866NyuhLAwkXh6jTZl8g4eRRoDGfhk/o2zgZBPvbtWlLN8rA
         ujhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782996253; x=1783601053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DwO3VIiIxXw3d1C054wPvvl7WENNMj1otLTOtdBbpWM=;
        b=l6T0So4Cx5FDwdg35eaA5kzhstDbPXVlN3ARA0KzDKT8jXB9KRWFyFCJI5iVT7bN4I
         U6SYAAk507e+L4Z+S4KFZFAkaCMRnaskiRhdNnEMskqXhgwSMY87ZSDhYkYqOS4byIvZ
         vkYyZCUH0YAx3rdCmlSj3CMNxoyrGbHYUiNNRJzWJbOAE2d1C/aA/ZvAe4ErW8RawqyE
         GQFoVvPLAvpNLl0Qrspa5iUZBWAtkM1NZh4h/HfNw12snmv07vq7O7Ay5BBgbjCLRxPZ
         H2YkWWa58GLlbOzWJteX2ecMLMSMUcDXUmypSQw625G8ww6XLW4wQush0zBrEZS2n+H3
         xCwg==
X-Forwarded-Encrypted: i=1; AFNElJ+4CHx4lHSkoxc1k+ZxzSE+IZ+gdJ5FAcGkN32KcKqGdxSmRwjL/k62bYcvy6Ujw1orcufksrwRc/UP@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg8eSS4rtUJ0D97SGJB9CdVY9o2Aw3+/ZM+tjgGuqauOcHrob5
	x3dmDcqDTDvV+Fe5XXt30adWpilduHq7dJz9583WhAdr55gL6G9rNdnKmIwf7DDVewE0LjQiVd0
	55+HTFOj+3VtMWomfBhigKaWlyWPUr4xsTCSRA05S2O8xvQgITlH22ocjSpsuH5++
X-Gm-Gg: AfdE7cl4ryrLMZca+JLks9mEQxgSq7Zc0r1RCIy7mL/n2te79dg432dkZIWBw9KaU0T
	TY5xqLmG9Y6M0XBr83+ufZ4CozBHoTuVJJvlJWLTkmwa8AGrP1FQK+Oa//8t9cofyyixH0nYfB1
	erXJQnMN6XMHHdJ0/0S/j3ovSJ5h3qeiPC2zdXdX2TZ2kSatiVbyJZ0qV2qP0LlUHtYis4RMoA8
	9iq+3Rza4Bsdg0y2PZRihW9OSuTYI1W0z4OcnMg6mdg0H1qgmfOSz5zqlS/QLWZ88Hq3YaG+o6M
	9+KOuqWK8+n02Rmnn3/arObLQu/C9btMi8nC3ZrHD97ciQEJbsD711MyPLC5azQaQBwggCaf9uR
	/MKTWHsJOWQ21gruqPoXv02I0Iac6lU6mla/G5XP4w4lD/pteyCDbSJYIPZhYiGwoAAUHOOO4TU
	CEqRm3uy0ZlHJdnH4ocSWUuUwC
X-Received: by 2002:a05:620a:44ca:b0:92e:65d0:1cc4 with SMTP id af79cd13be357-92e697f1e73mr1201652485a.30.1782996253090;
        Thu, 02 Jul 2026 05:44:13 -0700 (PDT)
X-Received: by 2002:a05:620a:44ca:b0:92e:65d0:1cc4 with SMTP id af79cd13be357-92e697f1e73mr1201649085a.30.1782996252623;
        Thu, 02 Jul 2026 05:44:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec899a3a8sm655055e87.31.2026.07.02.05.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:44:11 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:44:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 3/4] arm64: dts: qcom: Add SD Card support for Glymur
 SoC
Message-ID: <w2ml2bktc2a725reirixn7yu7d3aihua5dap2klp6bkr452qee@j3p5nulud7xf>
References: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
 <20260702094056.3755467-4-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702094056.3755467-4-mchunara@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfX1jDraTHUvzVE
 4qSw+ILJL0S2R6U5BkAc6NrhJxEnpDbCHQmXSrsswcG6M4SfjafuZXU7zxYEow5cIZISl3DQoCp
 Euaf+mApZxKtPJuNxnMCXcglhmSadzafLxpsKRUTtIJYTQCCP+Ng2Mo0+StGsFKti0jhbXTVRNu
 FNG9Njx3vdSm9nd0L2DoK7c91rqwMXZswQbsMrBOBw+2QT3tw3cCa1tCRwnzqTKy9kADsh2hDmB
 P0a1bgmTk7AgIx2/GJPJO8dwJKcwE2PatJHRRzkvd7beyzS5JhTu5oHYXtCPNVu86CxzCLeu8k2
 vtxJ9pf1vPj4RG1+nuyLNauXF0UXVUlvF7Dfby1HfqK+YBxXDuoqwhM/YLIG2IDMY0E6EZTLCJl
 SfdWmsKK18JRS4myz5xzusn88HpCsRNlE+Jg2l7t2SzceYNCQD/lAoihqbUMfTHlmZ7dkfWv1wS
 +lXWXr0uQVKcVkLYTVQ==
X-Authority-Analysis: v=2.4 cv=Lv+iDHdc c=1 sm=1 tr=0 ts=6a465d1e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=FZAofsGHiTNuLk9495wA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 9kr09ZRzJZcmigaolGb5dHwNNKdMnjmR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfX3JYZBVz3+ZSe
 PcD8jTb/2VZDtSfn8qenQl8UNujuwyz4r/GLGRY//mY7kcCGFJHQ4zQFv+rZlS4eaT7soGTCkxv
 fWyeruhOgyuuotCZWoGyWC521EEdn8E=
X-Proofpoint-GUID: 9kr09ZRzJZcmigaolGb5dHwNNKdMnjmR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020133

On Thu, Jul 02, 2026 at 03:10:55PM +0530, Monish Chunara wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> Add support for SD card on Glymur SoC and enable the required pinctrl
> configurations.
> 
> Co-developed-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Signed-off-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 91 ++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
