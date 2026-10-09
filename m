Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B65739768D
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 08:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534558; cv=none; b=FJ+RYD/ls70hUTo1pBtYKDJpRfcWR9uVwbUBSn8ggOd9IPFKps7GoB4hYDY5aaqBmNPpEGPD+z4K70Gk/2P2wzdE/eSJNwo5Ubsku2Il1idXm/CUwk6A5ltpVAvMcVjNiwvzchjp1nh02agdNz6VmxizzVzjCrBvGwZe02gkCIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534558; c=relaxed/simple;
	bh=/SOBR0Ps2BnUTRiVud7w3FAIdcUaSqQ8Mu+izs62k5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTPxYLaMMvyLBywSQajdzNl76skQVBqzr3R15ScEO/Q+Ft4zpogB7u4Q2WSBIdaBOhNjaYszFoVoYXnyb6bIivw8FaVnp67SC14lxN7zBvuf8KAORzoAf8Z1ROCa/SrWtYHYsrOXZTzi3Suwb9BBlZ6yFd7macvr2+UKT6muYDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZwbGWNR6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7fWI+y3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZwbGWNR6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D7fWI+y3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KIvF231144
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 08:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lXGhk/a8780ZR6oMz9Rsju0v
	1tiLizXrFKOLc8mUmHM=; b=ZwbGWNR6D867cmEY0fujoxLXXXMdO9GZAdrDv8/+
	e0SNERucHwLT383fDLSthPXNF1KAzFyvNhpQJhUBAHsaS1eGMckECBE7r894XQQk
	Hf8rFodpCNW3gHgJDjdoNX1LSzr3ij1M30w0HEd85UsXcuScuTVqri5o+TBEZumM
	9PtTghEn+2LgCbzKbix7XtgLs3CLFmBWNbsGZfOHxaRcTJghYulP70xg88KJRKQg
	riZl51lXyfJoHW12Jk9lZkgES4oFXNX2aq5hxnlCE/3hCvN7N15IEZlNVSAWJNH4
	Xci8lMxRItpQyQ+eog1RXbPullYLbdbfnT93pQ2GRngLww==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu2ne5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 08:29:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb71b1443so1204591585a.2
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 01:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791534556; x=1792139356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lXGhk/a8780ZR6oMz9Rsju0v1tiLizXrFKOLc8mUmHM=;
        b=D7fWI+y3/fIqxduMitPaHyEEUGN83TeEZ4QwiaDixyf9Sgse5saZwmtGBYbk1CejPm
         HwSl/+3Mz0uRTGycvRTuXqzct9f6AB3OCaAM35f9aQjL//dbwqNWGAaKHdj53tYzilAH
         mjCrPPSfOZPlsXDy/Zed+whH03bQ1sX9qijt1MKdlzPR9Mz65gTFHEYRUXotMoYzciYA
         M4JNgReGHFimsX4gU8dlD1408G0yIw1xX+FcU20FHw/UdiRdabUdv56jrUsLUpvjHjSg
         TWEEtmvdB7BEAUnh+81pq05PFMiIrsnsX0YBxkfWa70BHuJuOnqUEFq+13S9s3Lp5ImL
         REVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791534556; x=1792139356;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lXGhk/a8780ZR6oMz9Rsju0v1tiLizXrFKOLc8mUmHM=;
        b=A6E/Y/DPQWl+9d0kEaGBwuRZHiSRQL3cggbsR26rEvO4Sjkiv6ErYv1czyGTVy1HAU
         KG7TpbziAtjVL34JsBy5swZicgPVQguv+KnGJw/LNc0fa5tVqT5cmHCc4IdGo0Q6tbXO
         BxTB5yt6W2s0GtPSxRA0pdS+shOIsjsBI9P8EffUKXHgwwr0or3Ix6vLnNd0ISjQ17Kf
         vd2pcpBrAOQD+6g8mZ1m3WpRgyyQnnoO+SxQUIYOd32UflCgU4N5Qxt7TSnk6PcjmRDn
         gwp5ky3v+sw9GyJzijEY9IqQPrfnIoFhPQacHX/vzh7IDAFFss8Eoyy+Rr1W9L+ofPoJ
         Sk9A==
X-Forwarded-Encrypted: i=1; AKwUvBx57M2AC15fYjoIoJFYXMKhsN9QTinNiklglu944k6ZCGKM2ioI+IKDpMFSef3lVxT9Sn/T8QNB0y46@vger.kernel.org
X-Gm-Message-State: AFuF++n+ecqOTLf95CYMXIzajns/78lmlhK60gOCTqVzJ98Lqib1gsn+
	3lI5cOul70k2cmNptqYscX/ultnDBn4fkEYoqe+se/yIG4xJTjs3Wb0NHINtKmRZ1G43fh2jlTd
	YJ/sl5Cz16HD3/obvjAYFqinRpmlgXw7OCB0A8n6zsEnODQbdrXNTp3eevMCPpPjg2zknuiUFHZ
	E=
X-Gm-Gg: AYBFou3N/S2XhoRsN/Gy74rkJl/0t/ZWRSTGv0jynrL9mKhnUwazRw9/EcUjDkkQ95I
	UUbpJtkiqustdF8ZMjy4j0ySGsdJqnZsPJS+9K+vo867e3MFnmoRUveZ1JhQBP1KyEKLdgfIMIv
	3u9lgL7IQqbnQvuf9eO0+R3dnteAZDxDFsoUuETfyszSI9Tg05O7VWCNtyI28gijXRt27xQJ61p
	GEyfUVRTFatzDFCLG7WYWXI0aZV9nH21tmrdgNBIVnrbM09lcEPExqZ1/onQYGmY6nryFSbzjlD
	/cUqSq6ahZcWZTBEAKECTPkMYV6evqIGsVE93FKPu3CA9UmzzBt7aIWyPOZECAhLQZnzr5F/vI6
	wTel+mOxKKuM43l+1aMnUzl2ZbXadVYoNVJv4+MtFeSZDvTbiISYGAmQvduk50ijQsKP5OK4Nc9
	6sIg6nhl4gvQ6T
X-Received: by 2002:a05:620a:2985:b0:93c:9d56:a860 with SMTP id af79cd13be357-93ebd228f3dmr162556585a.19.1791534555630;
        Fri, 09 Oct 2026 01:29:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:93c:9d56:a860 with SMTP id af79cd13be357-93ebd228f3dmr162546085a.19.1791534554149;
        Fri, 09 Oct 2026 01:29:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde9bde3sm435232e87.42.2026.10.09.01.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:29:12 -0700 (PDT)
Date: Fri, 9 Oct 2026 11:29:11 +0300
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
Subject: Re: [PATCH 2/5] drm/msm/dp: Add DisplayPort controller for Kaanapali
Message-ID: <ayqjh5syjbnayfu7wp647tclaer6vd3jbtfuoj32tlpqjyhfal@2uh543ydchm3>
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
 <20261005-kaanapali_dp-v1-2-6faeac3a6d59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-kaanapali_dp-v1-2-6faeac3a6d59@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX0QGdtBDrSMOR
 Gkk0a78TBhAVz315imXbfUWOg+u1jgrpBdZmD/07dxZ6rZ3GqiZ483ZeqARaMpnsaKhNyICZB+a
 iYZa8y7R0TcppCiXjTZG44jq/2zKh/1Upb1fAiwkJePmXdy7sjBLaXURKllDmzzHD7BPVcU5AGm
 fzGFjTBmJMiITy09AEhN1vT/rIpSZPgi+FVjxkk9SrAWN+fEbEXtcqPsnmnGTXo6f+vfmw1HbeX
 ZPJY229Wdhj9d+r4HilcXuCc85G9fG533grPnb+67ilJ6rx0W4/kI4CtD6OCreFoWN919dKBB/3
 wc9qVrOsZ+zuCNzBxpxxZBUcXNB5dO9HCRPFqXSPejDHvb1xrAhBTyJFGvcGtsroyrvbgb47ssP
 YJc7PmOkuMOFO2Tqnm6FwbQjE21VX0zRzuu4j/hzMuXR3I9j27DCxPJzxwGS0nSBbPhJ4Up1ZIS
 PYNwMY883GIshnumJ6g==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac8a5dc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=OHVtJ8ySOF6wsxM0GN0A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: PUILy7WCjC7H0YOvEHYAMavZc0EMibZ4
X-Proofpoint-ORIG-GUID: PUILy7WCjC7H0YOvEHYAMavZc0EMibZ4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX+u2im7IpYRqd
 d1eTvJYPmtHkk9KVrdKMbk5xpLiRVg4guNSc2BjFeRb9fZYae8oeCnjdFZ4sxU9rembcJtTjzjX
 PwVhZMwfVfeDGArUr1cKCUQXrvUKM9w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090032

On Mon, Oct 05, 2026 at 12:54:27PM +0530, Balaji Kalkonda wrote:
> The Qualcomm Kaanapali platform comes with a DisplayPort controller
> with a different base offset than the previous SM8650 SoC, add support
> for this in the DisplayPort driver.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
