Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8E5375AA2
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 06:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774076356; cv=none; b=N2yci5dbXY86Mw/Oq3NhjRvY6G5C12jszFCMmk48hFbMMA+OWDje3T8p9TevIOhzHO2wqQCSz2/Yo1wr8Smym4Wart1t4+EhkJETRftSxm8U9dSH2cCC88CanC+GJBkNHS4oT6rkxKr2W/VU5mI/fXDXMEof85ZItO44AMkhSuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774076356; c=relaxed/simple;
	bh=YLxawYoMqwrDagQHNtgY0UdSsD2gPzPW/6AokfN0m3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRo01wmvqzxPFIvWAM/iL0WvTJL3R/Sk4XNzkg0lvr02BJRYo//bvuP/DwZcCZ9cDXDvLtQLrmblypGKP1FIfNpn0y2bzEVoHOZBmMk/EgyBA72o+bbZ0lhxkCCQI/K/NaKb1ksMkHpnF1rSqHi48APwBBvszU9VpU5PLUOJPY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W7e+/x16; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/QLVlYd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W7e+/x16";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/QLVlYd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L4l56w279679
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 06:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rGg/1MRgLOoEks2DaxJ/dsu3
	2MUliD5DG//4EHtCw2k=; b=W7e+/x16b4k0EUI9yHZWTYoX6jIM26Go8NoMvqny
	7bCjllck9Og/rHSzIKFxpnoG6MMxEXXOY8onab5C54pKGK5NKKji1YVXx74Vosrr
	fFVDtnJ/6KQZfMNclYbTu64ktE6KefGialLht70EHgown++JrtWaXe7vwCq0NvFm
	PFjuwmrtRMdgoiOTWpys98xl5GauVu4cLy+J1hHoFYlhyabc/aQ5vCjGd3NZO4H6
	LPJWktRNML1RBDsnjYjTBy20xvtiUSCcx/ApuIxS+dxtFl9TWkMVObiqSEF6bjoa
	mLT3+nnSGd/GYdvWfoR4bHg9BSFqK8UTo0sVklx7BNwEcQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1j9r8bg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 06:59:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50911c94db1so148206161cf.0
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 23:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774076354; x=1774681154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rGg/1MRgLOoEks2DaxJ/dsu32MUliD5DG//4EHtCw2k=;
        b=V/QLVlYdTTzzJD67Ucb023CJzUBoNoT2q8VJD1a7n8nt+PgdTA3CWryNSDLsThxu8a
         jS3FHhOCP7wv5YS019fleqiBDw/+/3oMyAlJMAaGzMmYlEfETan3WtluKZkOjXqtWkL3
         h9WWALWOFkl34hBxv73DUSi1ek+4EswmiwxAu6S+oPWp8q93xez9XfrCjPPqs1Vdztus
         TpU2TpBATbnjeh1HaeI5GwnsyuchYkRTFJ3PVgsDdObt+LScBlY5rPPjLdCPUVQwzfYZ
         Ff1pwydDMOsk4YJLk1TKADLL8VyUq3ziL5Rb8uqF2cxDIa3EFWOHzeWVslx9XKoNAEZz
         ASAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774076354; x=1774681154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGg/1MRgLOoEks2DaxJ/dsu32MUliD5DG//4EHtCw2k=;
        b=nFm+hMrI20fehHhIN9xr4b4wi8fuFZzEFo1nIWASBaRDJjnOjmZvY9l08GwW5QGT28
         JIaCCXbx+D4eAStTXcX/cUWpgstN5NvEmtbzknIDT/+Vk4HvMOC5/aDxei3rVEnjoF2b
         /Zkh7nXAKg5GinZVHBjZkWE5yc4SBBktDn/toDb4+cSJKPsMzY5ZwQrvr03Ou+jhYHaV
         YoAyhi10eGbCXUCILNAaVKD3Jo+EGBBbjDNrihQoUY3CDaGITn6Pwy6n+0UTdLufk4Un
         gDFa9m5lvhPmfEkODA2nFEDodR9Rq+xviZnYwCEdo3JlUOC54UKi1wFUZqTveA1Eizrd
         k6zA==
X-Forwarded-Encrypted: i=1; AJvYcCUkdJlsat0jGcegU3fUeQMRwEYdqS4AWmGNlDrgcvJU7A0FdL0GjEbaGaQ+q/Ydl1UaKoaBzp4YVcY8@vger.kernel.org
X-Gm-Message-State: AOJu0YzbST6i/XnnnX0JHhXcxJMrTwtTL2aog4TAUjSviKf4PZKMBjn5
	bL5vw+nNG8CNtimq7WON7YcLAjimfBwWQyVWeac2Y56lQyUV3sNVX5rtliOHJ2Lv3MdgvD3UdGa
	smCQpqq4vi13eFMZzjc2k7w0x9W1Nocb+prC80pIO0mFbCVMp6i6cL5qTFb4v7exq
X-Gm-Gg: ATEYQzzyVZO8N+HghaF2aEMyViximee/KQC/Cc/Oh9yErvVfYCs7fZp50JKP3OHtaWT
	yyy4OtO+XtEGcpgeK3Z7r/V6D36tzHrXGwzZHRODfJL+0JL81KqyHoVOKUZGzb2wP3yDl90oHMY
	QUrXYb8N4maUZY2ihKPA9vPB/OmMnLMQVvYI53GOAKXipnRY7LuDeVPcrKy+BoMAj5a5Ocdjhy1
	ZOlQkDekGi7GjvbBjgPfgA+WFytu0zKQB4PGVyKxg6PcNtwNp+G9cqp/pR1zv9ZQbK3FllWJgLd
	skRPurxhb3BIJM4fNa9/2fjNl/FR5vVt+zBIUf3mRLRrDPCQG6+QxSuO02n74R56SVF+785NlTl
	epGgTiVDPanU8K7dzDshDAQzGw5/HQI2Kbjx5Z9XII7KHC3xdlFDbvAh1p2f7VnE5KyydBiDf0P
	PZG8PREewjF+lygB84BYN6A5gGQpfVSugGz3Y=
X-Received: by 2002:a05:622a:1b29:b0:509:2ef7:7048 with SMTP id d75a77b69052e-50b3756847cmr90079571cf.66.1774076354087;
        Fri, 20 Mar 2026 23:59:14 -0700 (PDT)
X-Received: by 2002:a05:622a:1b29:b0:509:2ef7:7048 with SMTP id d75a77b69052e-50b3756847cmr90079271cf.66.1774076353618;
        Fri, 20 Mar 2026 23:59:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285206f24sm1011425e87.39.2026.03.20.23.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 23:59:12 -0700 (PDT)
Date: Sat, 21 Mar 2026 08:59:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Lei Wang <quic_leiwan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/2] soc: qcom: socinfo: Add SoC ID for SA8650P
Message-ID: <g2a2eh5eqjedqucnn6h24mwb3k5ezew2zbmi4hcvmgbi6urgfh@yu6elitm24q7>
References: <20260320205933.992852-1-rrendec@redhat.com>
 <20260320205933.992852-3-rrendec@redhat.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320205933.992852-3-rrendec@redhat.com>
X-Proofpoint-ORIG-GUID: _-MqyVYx4wTpBUJPw8--X098HPFDaLGf
X-Authority-Analysis: v=2.4 cv=ZPDaWH7b c=1 sm=1 tr=0 ts=69be41c3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=COk6AnOGAAAA:8
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=VBRRJ0ig5K1ZyVlATl0A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDA1NCBTYWx0ZWRfX2MWCfguAc4mL
 wELs1zQjsOvUwVfN+54y3v43XlLqRurERYYppLJ5EmoJzxLdoI11NbmXYhFI48TyLXwsVwXYdjT
 bj3iFHBN0RnMrjWJ0YbDouYeMmUHbMiDT1G7OzTG6+ioUi0aHRBO1dLQJeK4g4I9yw0ezj+kgVj
 Pj2mySgwnor1NtsgaZ1RbG5VZxObJzmy7WBZFWUxhM9IzXSrlm037F0NiHaTC/TE4Y+P74uSOEF
 KEt24O582xe7TK8zMMO/YKvXSGUTSCap9aIbDZDOKqfispwAZcETFig5Nj/cJ0iHf+8ciBI+gV+
 j3KR0743mwS8NSFE9LSe+YyehTtVl3A3BEqyTNk9Zs8juqITYS3ImONw0c7twDRL3v+Z1k3Uin9
 h93jNdPvc6tX8UQoIOyQ8+iIu7cGYdHCLPdMbK86N6lAavNhcPIgNReQNon8Ae9zOdbclhxK4sL
 NXcaR/SNbGAmsQmoTEw==
X-Proofpoint-GUID: _-MqyVYx4wTpBUJPw8--X098HPFDaLGf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210054

On Fri, Mar 20, 2026 at 04:59:33PM -0400, Radu Rendec wrote:
> From: Lei wang <quic_leiwan@quicinc.com>
> 
> Add SoC ID table entry for Qualcomm SA8650P.
> 
> Signed-off-by: Lei Wang <quic_leiwan@quicinc.com>
> Signed-off-by: Radu Rendec <rrendec@redhat.com>
> ---
>  drivers/soc/qcom/socinfo.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
