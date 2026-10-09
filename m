Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF553E9F76
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 08:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534880; cv=none; b=UX3iwQ7x7Jl0gqiBaBtqrezLolXA9OArEgSDQAdUd5EZ6OW7VyAkdNF1aHfT3CY+0oDaXkWQpayjN2+y7Mxk2zNp0z97CYzutoqFenViezHO3pTm9Pf0JZi6oV6gl1YmEG2mqSRYhp7sKEn2GPS9Z9B8v/hQpBabgjQPKCZQTDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534880; c=relaxed/simple;
	bh=lAPdSxc4N52ymWesLJxs/NmVMPwU4ZpskHIl4jduCwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YeVB7hOFtCO7VXNWb8mtwaH8u5BqO0mg5Sn7hPenSDWFa7yAUj07WTbWVFiv+XUq+WmiXtL4gX13wZGzbuQ/Pk8bRFursISdJc8v5G7/A1OjL227K3vWkWK77vwrYsyDXe+wKCqYu0fXYFucgS2lTGnEiA5V+wDwsbXZWPF5b00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G3JmpNuR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EYxUVJNK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G3JmpNuR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EYxUVJNK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KJ7H404410
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 08:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pKNoPzYs9svU6eazntWGtkQq
	4hl2TnKUIjurAm47tJA=; b=G3JmpNuRKq8VIslY+OgL6deVdaPG4ukkBvVnmJYO
	ePlZqQOBaIg7OaQgHr0rFOCWAnkM1tiBgsQRfSVqLtLG8mawsSz74HInpJL4Gsj8
	1T5V7KuYgH4ALnWjD3guijJhwqN4yXLN8+AA4keRSG2t6p0g3arVUSKhez0hCWxR
	eRqvCxI5AZwi/ADYQXmEStlVLy4gDiNnZTdSy9KvnhpJXW0V61vpJMF+31zx81xa
	Zarwiwhg0rfx6XsZw5ck4kF+3Qw339Q1kW6jbV3HmDDGDjExPeddDPYHPh6vlc44
	tojO+ISeb+xbMGARcO1zwCYImtm/IC2hEwNtVn9UqiRhug==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk2q4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 08:34:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e92aad34aso818316285a.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 01:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791534877; x=1792139677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pKNoPzYs9svU6eazntWGtkQq4hl2TnKUIjurAm47tJA=;
        b=EYxUVJNK+8iqPlUY/Z2Z7W4qGpK1yxQ8QC+fMRjGYsQTEMERitGASUmvb0F5UUKkRo
         4Vik+jmZ59XIdn14gOxRAHB6Jrs55PvBokTctEBs/KM+k4znJVCdB+haOGTkXFSqcKK2
         GUiMo21Xni0ndAEvz/8tpsNDiYWkM8USQk4LzKeURFy7See0RPEdc2RkylR/ZiBwFbuZ
         an7NWqVvJFoXIsD16GYAxkZl9PnCY4m7TIFzChB36KfX34bXkKb/GG9y6qY8IixxJI0f
         LYHfZeqgrPnjR1YKjJvePe1711FnaeMaGsJ6wEtPYiW3o4bE2yx/Eu8kLqI5SoWg0VPL
         Luow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791534877; x=1792139677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKNoPzYs9svU6eazntWGtkQq4hl2TnKUIjurAm47tJA=;
        b=GPhWDZu1GkHANU8ArmzgSpdqw0wDS/KYK+yE2BDD8P9F4+OSw9vpIrE/wgI1oCxwhZ
         EB2dqFk7yVG1QPn7nO0mTB8lJ+5XuG8KDyLcbC9RxFFku/RAoKGAPHgzyuEubF4HgZoy
         Ntr1nD03tjkyqmM6yu6nW7Bz4SqWWQJxU6yh8VUabuqoN69izV31mL5/e30Ztk8JzTkN
         iG8ciCY3bK7A3KSy+6ruEfIWp+GyMZXAF1QK1Q9ZfKfaWURIxxcInasptLeLRIIrTnzJ
         RaGe9zs4q8lVirnDldvSguo/YWoeR4pN2z0qXv6/prSOX8ELy9VahdVsLmYkmgeN2Rx9
         wv8g==
X-Forwarded-Encrypted: i=1; AKwUvBwF6H7Y1Fvs8WI6MkIeKyLD45wWUhbPyp3NFL5zsIbnEMXSPFEIo5Ene4JzYC2WHhrbnJCEuFLd+7+I@vger.kernel.org
X-Gm-Message-State: AFuF++mzMmTvtJwiCdT1yqx8kpYcYovMQ6rA5xCuFiVAz7B3KdK9VLGk
	IRuOExL1Dsu63uUGWwFqCKnXMHisZOr/PVP9OnY4MzqUq+3WIJlWaHCaumhJJOajOVeAy9TAZEe
	k/bmIKW9Q87AQ3gCy1ucxG6qd7/yPmZlyKAkhlwD/28ipIRuRuhmsXK99SuaA4eHr
X-Gm-Gg: AYBFou0aM6+hr6B9R5B1wG4HY4gc8DKROlokTqA7uQL+M1bBU3T7QZCbZZvlUfGwaEu
	40GjU8Vo4n9d6pkYHb+Idsz8ozOSfoAE/lxpqbt1w3SYakldM9wGwfo3x9Eb45hAw3P/Jk1uthh
	zpvfCt+dCIxdEQ5ZRhs5141QMAXTJgCFjSLUmd+M8au2DvH4Sq9I/b9WZJIKOOiZaEX/h5fU0IH
	k+xgpdm4N6PVmtXeDuDR6tmPHKgJ2XmT0polqZ9fH7q/FOwMmH9IxJuLXqSYDIqVJgVF02pIWwM
	it3Lbmg3hg8BpHWLOT5cqBg4aIQsZznd39on1ewOVY1MzL/ILkA2+kkOEGSgh6jCnHhX6cC+K/c
	Fm5muBilycE++3g6hRLjyWJn0U2bXYyuhxkN8DJbX2lSKw70/vJfGj+vQ5PhpkdwsJx8DBQ9ZxU
	j1SKKZhiRjUPJT
X-Received: by 2002:a05:620a:468a:b0:939:57ca:7e08 with SMTP id af79cd13be357-93ebd0e4190mr162080185a.2.1791534877307;
        Fri, 09 Oct 2026 01:34:37 -0700 (PDT)
X-Received: by 2002:a05:620a:468a:b0:939:57ca:7e08 with SMTP id af79cd13be357-93ebd0e4190mr162075985a.2.1791534876796;
        Fri, 09 Oct 2026 01:34:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3befd30sm4730841fa.3.2026.10.09.01.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:34:35 -0700 (PDT)
Date: Fri, 9 Oct 2026 11:34:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: kaanapali-mtp: Enable USB headset
 and Type-C accessory mode
Message-ID: <ytqzmngqzb2ear5ovqexrzcw63t7plac7hvsbh3ce32krt4mfd@e3yyzs6y5anq>
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
 <20261005-kaanapali_dp-v1-4-6faeac3a6d59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-kaanapali_dp-v1-4-6faeac3a6d59@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac8a71e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=bh13_d1_8jtD0fUh7gcA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: IU96LRui0vJsBsgvYCjZLV-h1YFoXpXG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX3N/BhfNP62j+
 iu9SP1czranuj1im5Gq5988rkV4fWHyzotiwztvUR4BhlUav5OUgI1Fg9PzWiRXvfno4DvQuN3O
 nLByrnvj+V9RvrF9rI9yNQEV4HgxqCo=
X-Proofpoint-ORIG-GUID: IU96LRui0vJsBsgvYCjZLV-h1YFoXpXG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX0//Yc4AGheo7
 rGPToAnWcrpr/DAjTkvYNqHpt4Mu2Tgo94WCSGsO7frInCPn4C20LOx+lntDWQFjzKintrqyDWE
 RGMz6uTZiz8WVknHU8Zusk97cwB4EwgZ5qW7g10cG/mYiyuetNkcYtlp7GUt+IlSNyJkYYsdC/I
 0dcVGRPX/tl+TvCIV5i/1eh0AWf8OLEjf7bTEVKLuJZwm/eGUqE6Z4nhZ2500HaoFIy9/e6pmB2
 kxmEEaCTbueB/0YFdQcp9Pf4H/hXIWjqeFBTHzA60Q3WGgJXvRrtyt6lM/8ypT6fVNGYijUTVv0
 NFHC5ZnzbMR/LXajPESOcA2nKU2BRxP/gbUd4ZYzvJsHGOWm3GpmpOkbm5Q2x7nOVqJhHS6mEv2
 lG5SQjLxH/+qTe0N/A8il+lV1NEnMQ/PQ/3hfb2eBQC3SunZ9wckx97BpaJ7PNYLNuMqowU3V3H
 DVynGrKp+4RYhP3VAEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090032

On Mon, Oct 05, 2026 at 12:54:29PM +0530, Balaji Kalkonda wrote:
> MTP does not have audio jack connected and relies on USB mux (WCD9395).
> Add necessary nodes for proper audio headset support along with USB
> Type-C accessory mode and orientation.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 51 ++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> @@ -916,6 +926,42 @@ &gpu_zap_shader {
>  	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
>  };
>  
> +&i2c3 {

No clock-frequency?

> +	status = "okay";
> +
> +	wcd_usbss: typec-mux@e {

-- 
With best wishes
Dmitry
