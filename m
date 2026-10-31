Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483100;
	b=Y4X+5Rop4AmeJTgX4us521z9egbEBPONUSbBYW5Lsyr9Dy0oDXBC6ZgzjOdaJ+NbHHkH
	 9UeKlnqLJnSbBuQSj02h1OIizz6cuxHo1KrzGWxg436dHdtSSHLt/l0XajesZD9pJw74L
	 Unb7Mfiq7J3Lmhct1F7IhrAuZiepFvs+hm1UZR8QGh6N1zAMz7ax21jqzXwQDKlWqFzid
	 KO849IBjun9LZ6Mrmb89YDImlYOI98ZWQRslYJ67oQwI0U5Mv3tvJ0UqH7UT21egFjTzz
	 DsiiNHY7BMRNypIM+3JWpqkMNUo/+043muW6RIPh5TIZn0FFib+lwdgTw33nqMN45qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483100;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yDGBpE8wO71JGfIhhYSREmTTDT8BIMcwQoGjF/pa28s=;
	b=SuV6ba/GUpaIgsdAeHqwtbKAc5q72sfTJpkftzzq2pXTK5xJnizIX+SFu2YYDOxVcV+F
	 2gF/59vSyrSVGLFvnC4ID4LnyMCX0wyCj9SlTTmcLGrj8jYbivdMcybuRqM/OAUr3zi2e
	 4nWMYY7C4YfVYrmmR6nGgy/FPhrONy8JmJ3XGdzG+8VUNzt+1/f7Y5v5oJ30iu8HOl810
	 JooQl0/9zok9CnXnvJxSZBFD2bCJuaIGyovPEEDYqK8867amPLmj/y9Vxt1UPQUif+CTe
	 peLQ4WG42NlneWaFbQrP1JRY1ePtk6H7XEMyi3wLiMfsGVgKW3SiRzMMS7xu0WPtzYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tqy0g2u8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kBrnOx8o;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C60606A320
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 21:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7C60606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tqy0g2u8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kBrnOx8o
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJF3m22969664
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 21:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yDGBpE8wO71JGfIhhYSREmTT
	DT8BIMcwQoGjF/pa28s=; b=Tqy0g2u8Y/mHPZEmpqKvoI9nEA0bTFPbKTpRDOpo
	cSXiT5tsequCmwJxCOE7xbvLLdGx+iOEyL7B3jURpVBQvAt4BcUO/q6aox/lAPfi
	RNHnN6R9yDreV4fzjOUy7nqhJxaw3fach0IFzS1ZUGsrev8SyuMPQmemBcX3PidB
	d4jvX93H4Y7+c0zbWrekez2g5VQ7Zq4jil++c1Lwpxj1AAWISfjkcrKOh09+7AmE
	8xyZ9eAv4LoqeLFIZNJSKkeuupgYAaxOmb73llTamWZC1pT0jdZ/fhP8Vwt8r3fU
	NvV/WdmnR4hp6ibPfIBTiGMbxBUIit2ZwrcTiRSLAs7Qaw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn5pkjgy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 21:44:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1e62510cso420672685a.1
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793483098; x=1794087898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yDGBpE8wO71JGfIhhYSREmTTDT8BIMcwQoGjF/pa28s=;
        b=kBrnOx8oSeL8mEkRogeeYNnuA95pZ3+ACCMQnVqx9O3Q0w/Wpd1RLfHlyqtR541vP/
         h7BbcxbebDpH54cDftLL3qqHXGrMYOYaDO2c9LnHdN/68PkEUDDlXv4+nAokqIWqklGt
         sknrfXE/Yb/AgkkHOKhO5vEZdqIDy948DQn8YLRsGn1NH48036Mk4GG4NvoTJWwX02Yo
         xgtLHqaRVZpw149y0qshKUVNpHkZ1qUAXw8WBx0n92FVEHSIebF+n35S8FR6gvcfqaT+
         PhTIXbY+bF96BQQZaStOl2n0BAt8Y77vCj8wTBVqDXB40U+QvWuI4AJWsjMWdr48eGml
         UzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793483098; x=1794087898;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yDGBpE8wO71JGfIhhYSREmTTDT8BIMcwQoGjF/pa28s=;
        b=dr4ebYFxW8ADnfnmofR/ec5cZQrmNlU4hYIRE6ZTh4FAd6UvG+9nrLRiXmVS0xrGBX
         8lS24Fo+libUWR+fel5BM1LCb84X35aqsbB012Xm1quZqGmFYl6eGwFxk8SE+M1BJmpH
         H7WOYPXaUHeWNTH/GfpQlkKAtdPo1dQbbFRXBQ9FOVkPY6k1/OGQHhJqA9jE5qccJjpT
         FLzMoQOzF9DroHInGwNcqFDmcQNXdyaoWYj6+emzS1Dr1j1/g4HAxNNSjrynrF9zwpPc
         zC0UY0ZEbs8uqEIC0dYbkdH/yf6MjFZ6YlDQIrxfAc/ZJODZ4dr5fydM0RoDgEbWrRNs
         +q3g==
X-Forwarded-Encrypted: i=1; AKwUvBzlBDwCEKKbJSyEtF+F5ZL4Ny/z3WQyucg26t+YexXC9hEYrxue7MqMTM2wL4nSAETXQlCAnHjbfR5j@vger.kernel.org
X-Gm-Message-State: AFq9FYJfQ2Nij+AxTFkq0xpzdgoMA8cDxd7bwd/sqHKlOvGniajakk2H
	wOMPCiooJ8oR4saWDNKbfue0aEYyymVIcPNKRCxR5QLdjrcR69tgztsvWUEe4y4xDjfjUKII2ZQ
	FWaeEt+sw0KbZHPl5BmmPVjtvxzSkkvPe6JcYVOLPbcpeE7E+xem31jwzCzojx7bl
X-Gm-Gg: AYBFou389CYmEi39FTcRH6AX2TLMKMAC0Rb6YU7XpIJY+qfCJgDFBxK64pyGjlO+hY+
	XMuZP6L8LpD8ERol4V6RlFJdNF72vKemSDPt/FL1F4/NEsOwClCa9Rj9GyM9aHEOMjcKhyzTG2d
	NmlvygyUlj7xw+rcQtMcLAyZUndll+o5zxm+i3qpVkX6swBzRJ/VSdbJ78G5OxkMKT0iUhGaud3
	Rd+zblDNfY3XV5BRgrdCp7Ht5dRk0HZ6gklgoFkPFFbaRR/CkvjEht15tkOOZAgfDfOw2w9cdME
	IYU5ae8CE9ylacNTC7MaWoXi1X8EuKoFSpM5WNxTGQB9gyD6oU1fojCB8EvoPPVhMw1T6pe82YD
	rnAH33ouUWkzOuFZGERmVcrUOnLa94E95mj9dpl+Dar+PgNT4e6hN1le/thMkalIo+WC3rJACAs
	u1EohD37/PokA2LEVfcvQyfqQpUEynpOKfSvsizT6IuXTD389eazR8eIYZzUQ6qg==
X-Received: by 2002:a05:620a:1a20:b0:93f:57a3:ed4e with SMTP id af79cd13be357-9442175a8demr1040524485a.40.1793483098174;
        Sat, 31 Oct 2026 14:44:58 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:93f:57a3:ed4e with SMTP id af79cd13be357-9442175a8demr1040523285a.40.1793483097768;
        Sat, 31 Oct 2026 14:44:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edd72sm757409e87.1.2026.10.31.14.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:44:55 -0700 (PDT)
Date: Sat, 31 Oct 2026 23:44:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ishu Brar <patches@brar.si>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] drm/msm: mdss: Add SM7250 support
Message-ID: <qshcmax4t526oqoj2udcub6oqtgnkol7fptswvxuftlizy2g2y@2zqtdemmz6a3>
References: <20261031-dpu-sm7250-v1-0-159f403ec405@brar.si>
 <20261031-dpu-sm7250-v1-5-159f403ec405@brar.si>
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
In-Reply-To: <20261031-dpu-sm7250-v1-5-159f403ec405@brar.si>
X-Proofpoint-GUID: ndM4fVmsSMVj8jP_bDSdCAwhG4H70KxD
X-Authority-Analysis: v=2.4 cv=Z4F5j3RA c=1 sm=1 tr=0 ts=6ae6615a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=r0WxMInjeZJlmvLLs6sA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfX78OSGNnoXV39
 +PJs7O4YCH1hFb9HpMAQc97UVCQFmuGhupaa7tHJoKfcMpejRYXzgW+EKyvf+ScnTpYRBcErDkq
 zdmMFQnXb1y1iEH6zlk/TSCfAlENG74=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfX+N1+9PTnbH3p
 rPZZS6mt2q0yBrvuDDK4uUiyqE6UUEMRsVTX9iwHayVhVX7TTee+0a5cNPY5eYeLOeK5RS+AgJz
 5rpz7F1GEOj7Nq6zsIdPbLSUpSmevCqccP2eSB6i6yPY7xGaA9BmKdL76AHOPaxj0DnovwB618a
 jSEzGBeisf4bD0OFdUfojo7JCzIV7O3NObUrKFAqOp1OLYMcgdHosG47bKeJgBQH53s/uR7za9f
 zz/FsLOyRTRatCVEcNdbUXJA4Mz+pZxQ7ca8u7reaszmmm+z1aZHEitV/Nj0S7e3CpeuUYclMa5
 5fFwWU6sS5qmytxsBFqSG/yopLuvhynFT6eeZ8odP7VzN3YZW4d8A40rGvLbfVyr3S3EgO2U55s
 rPmDQTrT97lh70DZjk98VmfxFI3SB1hz/WhlE8MFfVjZkVosm1DzOktofadprhuUa1FXiiC491i
 pfX3YAFFJJOSI2e3DUg==
X-Proofpoint-ORIG-GUID: ndM4fVmsSMVj8jP_bDSdCAwhG4H70KxD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310086

On Sat, Oct 31, 2026 at 01:23:41PM +0530, Ishu Brar wrote:
> Add support for MDSS on SM7250.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
