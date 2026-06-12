Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2EC3E0C44
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781248292; cv=none; b=BaK+fuL29RlhzcRFghbwNRp67yWX9EqVHBg+ueZxUYrDttimU6y7eq1nUX9MrUfRQDvGB0Mg3BS+B8jxsIlK6prisi0wxH5X+F56W158g3dHrJfZungootfBbyvX8EJ8h65KDE/B1S0IVI01Efhmo9HB9eIZlKvd4CIxbi1o0uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781248292; c=relaxed/simple;
	bh=F+L6o6Tr4+wSTemLWchDyR6SdCI9Noc5GlbpDkNWfpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5nkasyTfRK9czCjoWIVOnZVDGX9qUKuFBA64FU+z+1/RBEdr+KLHgb+JCRx2S3Gtvs6d77Fdhot/Ypp5DO4ub7nJwThlYhbgba+KS+Gv8fFFz+LOVdn4awh3sSLV/QzYJB4lmk3Y+N+zLJtXlLShqBDpwOohxUiVYGfiXbbZDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TGu8hlJ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hyIkT550; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TGu8hlJ4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hyIkT550"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3A2nF2412227
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sgRxjNUG7aBzL0yQw8/6avKR
	8LOtMiVPpCqbd9rfu0U=; b=TGu8hlJ4+AWlsPwF81/bDqSYT853ut/uuVsNkDtE
	TAy54zGaPsO5NajMyiDFuAiKir1W1NvYXyh9M5Xd8kOZ0A/wyoszzbDt82RVBoMi
	KNj5ZAYIxIxV19PwHIgMmuOVS8P8xzc/JUWL+89UpS0Z13AiAI3Jed/3WLW7NQHJ
	QxEJBGQhRAUwoafFhqOcCvdC2vgvshSR7KdEzZTXi9jGzWamyhBs06o7F6+rnz2p
	NGvi5XKF8echIbhMQnw6xUyIvnFRARFGI7eEnEJ639SjbPddeVXLMLQwaKBXFqT2
	dJt7nNxArsabCQNuRvPiBFnrWkmnAi7oW8SvudxMhRNjyg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er165agr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:11:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8cce1cc8cb2so15549186d6.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781248287; x=1781853087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sgRxjNUG7aBzL0yQw8/6avKR8LOtMiVPpCqbd9rfu0U=;
        b=hyIkT550VkgTNR0z58SzqTCwVGcX7z1UM3bkgtR9uki/wVXLuZ/aEfDryHd6Y26Eyi
         /JJ4mjjfzfcF67FyfetgOy/dnoKyY6bb8bqO03QWp9g8IA2mTXKH6tSQxYCsYXsKnTOh
         ROwLTrNyKGZLc6XLkE5LJ7EbbdLiV3RfljmqSLku6p2Km9cuSKfWuAf6H1J+CHo2QIq6
         UHeWm6O2PzhfNpmXLMyj/zx3a8hDxKrSpoFSV6GF3jZli0z14idclQk5MrPwlA1fabWI
         zO7lGETZb2qxqkh1PuF4pC4m8mZmGJSFwZEXEL5SRs9L3uC8VE5Mn/qH9n3068Mw/r7U
         E3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781248287; x=1781853087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgRxjNUG7aBzL0yQw8/6avKR8LOtMiVPpCqbd9rfu0U=;
        b=MIaLE41C6kUcO8Sl5ctQIGIZHuEmCCEkeStYSlyR6A/msv1eAm5rnStuWoeOF/mF9C
         1N0qKc113jwNYYOMpfHSDxVJLg5dwcyG0gSKT5alG70xHII8KdK4P5ov90uWJJxPFH3K
         tbfn/B4r+KyavAN8ewPDEKKrWKj/qg53eP3LGxmvFLHS9JkHwvJDdtV6UEBZanemoCmP
         wDSCJBw/mOzkcDX6jJ2q41izgY9pWD0c4KM9PLTDmNv+6pnoz4dmDC+phN176pi5bZp5
         oz2gwe8SlUfhFruAKnB+Zca6TfVyHytE0PzW65EMwbtGFDp3pTcjynPDi9pOD4dhskrZ
         mnyQ==
X-Forwarded-Encrypted: i=1; AFNElJ/MsVHv/hOjyX8jS+z48rioSjC2lhUgmuor9jvpqYDPOxqYNzVpDTASzXcLI2h/YpANq6J+bxpSgCSF@vger.kernel.org
X-Gm-Message-State: AOJu0YxPxSbiOlfQ28CnmjedOIhqLdlM1XtCtp+G7W9LXHgkIt1fWvSB
	suyvtLMWEPwDGYbQha5sXbkkRqqybrRGxcqIohRevkT5Pehc04P32uJ3/7FZ9q/02xSJHBfMWuo
	QBYWRUSPwPbEA9EpimF88kmqqfQmHcwfX4jr2e2LXB4w+RloDGUQBFZ0jpvUJQiGE
X-Gm-Gg: Acq92OGNrGM8L86PiDVoWgpjoZr1HBtm8XLrEqGyulMZ8eu9GEIRiZm0+sVcpiwV0Y9
	GaRHPjv07kUwH6GVzaU6xrQKZuXer+2+Mc/7pMC2REHZRqr1/n9sQjd5cYLAnlGpQbyqtYE2125
	w+LGLvyOlt1UwgQjSauxWtDmTiVA8IG+q0FqN7cXWX+AIBbEOdel7wZOS0PvbVmim0mNKFGNbUi
	sm4s2SRBhM5J+Q/MBymMCsNCgmfDLHNJT3tnFl6EfMbvMBLxM+s0Jhlt3k2EnbSoDIAC7nKu4ar
	V5VCXVu+dUlqPKMn1P1k5gB2bsQaTAulcTd10oZJfaEo+GBlAc4rsIDzkg526Km2HsHNlPSoPu/
	70/rxAUviyrGsUv5JixZlZgK2dMy7JNP2nrzV/Z/W3bC51gOre29Ok2Z5YxR3QVp7ftARkjnf8Y
	TncfVYMsweQbk4iLNvi2rGjS2XcvIDUlV9w74=
X-Received: by 2002:a05:622a:1191:b0:517:5b2c:6aae with SMTP id d75a77b69052e-517fe1de684mr18947761cf.13.1781248287482;
        Fri, 12 Jun 2026 00:11:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1191:b0:517:5b2c:6aae with SMTP id d75a77b69052e-517fe1de684mr18947451cf.13.1781248287053;
        Fri, 12 Jun 2026 00:11:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7333sm281464e87.52.2026.06.12.00.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:11:25 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:11:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] thermal/drivers/qcom/tsens: Add support for
 ipq9650 tsens
Message-ID: <yi5jzdqmmynosrfdkdwz2btesbkyv2vwpkwvpf3yyp3exavipb@2z2gvgg6p5p6>
References: <20260610081241.1468507-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260610081241.1468507-3-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610081241.1468507-3-varadarajan.narayanan@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2MyBTYWx0ZWRfX9EbJ+66dGSe6
 zx/pFmv295GsUNPmUQJ6OPXr5XKmUJBZ+t5c2qLezCJzTvhJqrv24bhDkokNfA37AWjZEWgo9TB
 sjnTkxGW8FPhOZvNfxBC7sGF9pU/Ass3TI9pyfL48Pm5MjrEEMG35gXrniMxMCzODzIiJ2782O4
 pKD67V93The/EUh7pAXW1MxDHYvXCIMVlR9gIFAX7TTqQoDJ+X3RjJsOOSgjCNVp/gKxcezCkyu
 d/az/aEwV4nTKMiJfxCoehSbXo4/Rdu4GDIbLerg5DCkJ053aUtuYSMtJH5j3e39++hy5uP1ztD
 R28hZs/jkJO7s25aFdivfVKBsP12UJzbYoxUTBpZ6j2Ww3C9xr/j4snPHoi0ePMJDjhSsHqdc7p
 +QPr1yTXDpKlv95G7RV7guMaw/WBAUtvgK5wQphsq1VuiYh6emXwp9HJhaJQULRvs5KpelbTReS
 0eJd0hGcdMnpFtc8I6w==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2bb120 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Br5ujosB-dOo-FGV42YA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: sxz7lVj41NYS7nyWh04ih3usuP_njpcm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2MyBTYWx0ZWRfXwAhfbD1X9ASs
 3SXegD34xqivZUx2w2S6RhPkKlUQSB3pvtEUB08ybRnsrcBdEFxJmh9cshaNrERG6o4r8j2118k
 JbCHzUAshATDoFZYRmobdqJtXLk0aA4=
X-Proofpoint-GUID: sxz7lVj41NYS7nyWh04ih3usuP_njpcm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120063

On Wed, Jun 10, 2026 at 01:42:41PM +0530, Varadarajan Narayanan wrote:
> ipq9650's tsens is similar to ipq5332 tsens but has different number of
> sensors. Re-use the ipq5332 data for ipq9650 and modify the sensor related
> information.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  drivers/thermal/qcom/tsens-v2.c | 8 ++++++++
>  drivers/thermal/qcom/tsens.c    | 3 +++
>  drivers/thermal/qcom/tsens.h    | 2 +-
>  3 files changed, 12 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
