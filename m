Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712DC36C9EE
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 11:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778152894; cv=none; b=lytUs3DNwHWLsrU5DkfKsN4iO+GZ3rraSOKzTPp3rXxNdiZHMlB7Pbo1RRjZiQ3ZsPTnErlQT6+3hkIiaHasI3awZ5MU42fFjlDchfrH2fVIJVoNr+CEwv0UFjnd01BqfoMwfThlQZfgdJDZERxnxsgvfXaDO79D/621Uf6b7Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778152894; c=relaxed/simple;
	bh=8MB2I3zIP42cWhcQIn11YXaXLNBvIadHQ8zKz2SSbaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXZo33la7hKS+BO7O4uX3ec7ah8ZbYMhlNDdcGcxoJIKFszDYrX8LUtFtbmLioJsCLwqgUzhbypy80gr2hHrL4vvQAge0ZR/0cFzDWiiNV67lKq/RdIVTovCbE6z1oKycLOY0kqE9TBYTzhKe7gEfyZdndxAvzdliOmpzALOdcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ONVH7j4k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PvBl+bWy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ONVH7j4k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PvBl+bWy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475Lpat682778
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 11:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u/mKZsfu+vzPsOkujCLiqglD
	wWI00N7ItfTwCnxyziY=; b=ONVH7j4kqYQLVl2VDhduBWcGX2I7Y1tUe6W7YhGY
	ASv6tAYNq4oGoFyxWH2Cb+yTb0AyGugFFAGynBl5+yP/uNgOEUIQ2LRdjmc0SXWG
	MNGJO/EtQ2jyAMQS3N2UzopFYwk6VfT7N3d2u1IThslCGAMszSWbjeXxxf3SUlsr
	7XbwjEzjD9a/joZbgPCbll9swdBe0WEv9M8HqGVHhhZGVczg9zBV6k22nzn6Famq
	fHklI+54Ji/zfMPl2aG9U06jJu5MxRbIfOu/7bjIi7T1uOpmLs5MdsL928MHNumq
	PQGbYb/Do9J5L5tGWCbhQb6DqE03zud+T3A4H4/6tzmTVA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhasaav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 11:21:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fbc70cfbdso16839801cf.2
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 04:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778152892; x=1778757692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u/mKZsfu+vzPsOkujCLiqglDwWI00N7ItfTwCnxyziY=;
        b=PvBl+bWyqEe223X+9NKxnjcUS91hwmgYwQych3XXZWjHYF2YPyGLmCm8u4MyMz0hN3
         J1bn/CtQ5d/CapOzSof7g04LQ9mi2gOg8teAX+oxJxneCpxiUptRMsBGKd0Pa7Gr7+ye
         8LwWn4PX2/i3LdLYEf8eIedIN0p+qIw+2dmrc74mrM7/d9rIHU/on+vBuKn9/3STAxW/
         KfEm+YBQuCbEIAv/Ru5xyn9oswiycDQNYIxyKQto8c9DuSRJyRwJJc+jqs2sIdPgHoP5
         5UwKWvVd8ad5mAAxXqg9B9iRMV6Mlw+QJBd/lX0ra2fLj1I3HAtaNmW5uY88eH2EsrA7
         +UCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778152892; x=1778757692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/mKZsfu+vzPsOkujCLiqglDwWI00N7ItfTwCnxyziY=;
        b=fCxsGNZ1Cr5T5sw2I3mg2ejbwugoo6LQ9gdLfIGRBsVBvN+KaIe0E+5pCJqzCKI3l+
         u28e/M+ptpdmFgUDF2Ewi89ejMNvtnXqsE+9PnMR8ZESL9B2V/pdoMS7k5Sp8p7OiA4S
         3/rC7X3AvacI1fFTQuoENvoEhQ55GFyBeN0RaY4+kAFWrurxYn5cpEZeFRqE2rnV69lS
         154JBQKDd93EeqCefNZ4/j41wK8LIWPdmm5/JshS2ZrkVRYhmfU3m4BQ1K27FWE9w6RL
         L1383/u2xgIHlBQmREFKqoCeJMyv9M6PRDDtXsP2T0+JOdyDot7TXIXlDPRvpeisdBB1
         KqIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NuEoUiYVxLO09zk7dAg6iRVULXQCA50NGnquEw+Sf2R5jQrEoOKq7M9oHGbEfaHssYs0E1tY6PEXl@vger.kernel.org
X-Gm-Message-State: AOJu0YyfDj6AW96g+PXfEyjjuzSX1OPy0j11P/hWwj3xQ1oJmusCig5n
	rgraC8u3oQMkQNWaAinPRkxo1IAMNzLGSEqN4up+MlhFgYoV5YLNaeaARfbEvq/QrST4QVpuLCz
	EvpicLB3YRXHGJ3xiQ2dS/STs0fqWqIuuo/AInErJAuilc8jHJOSPyAZm9dlln0yo
X-Gm-Gg: AeBDieu9BqI8GZW9oDvVS4jqb5MDZVD4Wwou+hMKmq1Nj/4XvErRmLdlLh+Nm0tKYJu
	seF/w80dSrBQ9GVPYlNF9gPxAT6k/LItT2dfZNIrt9oI+E1G8p/p0BsKEOIm7S/f10HHe7G8dZ/
	7fS2UnPpBrINVlWOUOhz79OMN8N65XlTGyXQ65LpHYVx4bvs/O4B+/hHqzB5cx2fRVIZQv17u6F
	UF3JzJQ6xVqGsTX49mNrTPPN16KRbgyQwR8OQ5vJW4DDL/+WjOyCCCk2qXg1GaYd/wXvrUGZWWO
	xUeRmtamXAReKS+j52yF0oHWqblTvRh6OtujQiN87dho4zweZvGTbgVBl+q1mQV5sDZqoP455qV
	ti4ENwHK4rvJzoplnqLG2TB/6+ujpM7i+4a386y60YQuJa3umw2PHnQF5X9SNsPLa/LjBqtPK6C
	yphc6XNzZqDlRMysBloAe3Gur8R2sWWkgqjc8hEac6dSIzOg==
X-Received: by 2002:a05:622a:a0c:b0:50f:135e:d5d with SMTP id d75a77b69052e-51461be0571mr107689611cf.8.1778152891666;
        Thu, 07 May 2026 04:21:31 -0700 (PDT)
X-Received: by 2002:a05:622a:a0c:b0:50f:135e:d5d with SMTP id d75a77b69052e-51461be0571mr107688971cf.8.1778152891217;
        Thu, 07 May 2026 04:21:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393d114988dsm8231861fa.10.2026.05.07.04.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 04:21:29 -0700 (PDT)
Date: Thu, 7 May 2026 14:21:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: syyang@lontium.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org,
        maarten.lankhorst@linux.intel.com, rfoss@kernel.org,
        mripard@kernel.org, Laurent.pinchart@ideasonboard.com,
        tzimmermann@suse.de, jonas@kwiboo.se, jernej.skrabec@gmail.com,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, yangsunyun1993@gmail.com,
        xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com,
        rlyu@lontium.com, xbpeng@lontium.com
Subject: Re: [PATCH v5 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <j55fc3jzquz6napxloqsk5x2c37s4twl2g4bwjll32ha3kmxbt@wsw7hdlkbdf4>
References: <20260507024214.97708-1-syyang@lontium.com>
 <20260507024214.97708-3-syyang@lontium.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507024214.97708-3-syyang@lontium.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDExMyBTYWx0ZWRfXzQFEkFDcsB1t
 Bc0J3SyA5oROuA5c75dIIRstGQMHVQlzJOmOvtwAnvgEd3vQhAiRHjmhBdWv7nWVjzUWVnLzuzM
 Rona2+6ei2MDyHG6PuCwWWsnLBe9hKLPwURw9GtO8PdOtXro2H56LMb8TBgDe9fAaC/4WfcwQnb
 aqAw8nDU7d4fcxyxRFxu6b4Ul1ocihAXzcVpabuJYhVNhHyeS9ydtkJj8T9jz4Ik3mjw+BVLA37
 wk42bPFKsAM4pb6cOaTYrZWEN2DYe2Nq7AnO1yaMmq0vfe+v1gpAoOzZur6DZBBBvESbFrR2HVM
 fK2h8O6RAHAiJ71UNIfndONj0g/GyT7buRy8CMJopYDkWKXIrrda+61W3fnokg5m1EO9WDO9aiY
 sMk6kRvnF/BkhU3jV5c1W9iPH6791bVPqH7B54hmEzLf13d3Svbv/rN3y60t7UY2NM8ajn9IwEM
 Xo77E+259pqPv6AoOFA==
X-Proofpoint-ORIG-GUID: bHOEn_W_Ul7lngmd9P1Qqn7f2GJGOxVr
X-Proofpoint-GUID: bHOEn_W_Ul7lngmd9P1Qqn7f2GJGOxVr
X-Authority-Analysis: v=2.4 cv=ReWgzVtv c=1 sm=1 tr=0 ts=69fc75bc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=Kz8-B0t5AAAA:8
 a=EUspDBNiAAAA:8 a=m6_i6vA6q9rtELufO00A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070113

On Thu, May 07, 2026 at 10:42:14AM +0800, syyang@lontium.com wrote:
> From: Sunyun Yang <syyang@lontium.com>
> 
> LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
> mipi dsi and output hdmi, differences in hardware features:
> - LT9611C: supports 1-port mipi dsi to hdmi 1.4
> - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
> - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0
> 
> Signed-off-by: Sunyun Yang <syyang@lontium.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig           |   18 +
>  drivers/gpu/drm/bridge/Makefile          |    1 +
>  drivers/gpu/drm/bridge/lontium-lt9611c.c | 1240 ++++++++++++++++++++++
>  3 files changed, 1259 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/lontium-lt9611c.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
