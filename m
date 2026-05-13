Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D054DD6CB
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 17:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778694860; cv=none; b=b4J8cU4rpVPmV0Efio5pt5ZmA5v9gaettpPxj3SZI3vs++/8ayBUJzJ28g3pcJm9GEaFU7B605HQP+nJfXJTBzu2yAWjgZ6C6J/luqrcHDzyBE2Gmw4hrO1Tmn6n9+YzhmF4OYkEolzqu62CE5gJAfjDYLHLcnJIL1dQErm6toM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778694860; c=relaxed/simple;
	bh=Ud6HHue5cUw0cb/NqF5AekrfW5/jUOz36GsfhRRCz/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oYx9qI135n+XFrI5w+7wyUSCBWkt6FbdpCjZ9hjOIbqhqIAxp8kBO50JQyHEdSmGUvOSghFwbr5LgMsv/WCla/d11XWWiN6xlYVoQyJ35vZeXr2JSXxIBKsJDaEuQwrmTPad9bag2iCTCtYCqXq92OJdfUH54+aTt5LeA6uFzOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oax177p8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hENag+1d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oax177p8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hENag+1d"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DHM3dB3430351
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 17:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C04fNeLquaS7uemBA4+Am0E2
	khDbaAX+WsMNaX9Ovo8=; b=Oax177p8aI3km8LgiNOtkYjekiQ0Imsft1DerYtc
	jvtmBnrShmz7Nqzh6axl3hpXAgZxpyJBdlscrW7C8S8C22bKZYoE9ubyd/8mRFeQ
	lMVdLBKtUiLcrGcDJDEf18j0zGPgpTG0B+X/vMEv8epb/uJlcOCdX+oQtDr9xReP
	Z1IbFZODpZ6Lfk3aeaEROGwTglWx/gB4DEmgMteBfhQKrXDPuyyUb0TJxLVE3mhj
	eWjlze8sNV97zvqIGCwB5sZLKB2EjuzmKPZnpmxIgezOXo7I7c2Qmeh5N9B2ImHk
	0t6CuNQGNWf4w9c5ER0+puVu7hwxiVs3diiBTy9IE+PvBg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmchr7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 17:54:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8acadca1ac4so178922396d6.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 10:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778694856; x=1779299656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C04fNeLquaS7uemBA4+Am0E2khDbaAX+WsMNaX9Ovo8=;
        b=hENag+1ddsR98gzqNOZ6sZT3s1GBXQyMncS1tjyDb+A+Xcn61yLCbCmUCXYLfQuCAE
         hzTmk1USQLoErwelmew6iP5FI81TExJ1AMVxg4YLzZOEvs6k74hnvCN67EkCSv6d1pt6
         YjYzTf3qc2woqkIHdsDkmL2cq10eFl8Rrug8A8zQ0Qx6DcpSmDRzf1o0xgNRv6IPfSDt
         zmyDphmYLb/hD7ee3L5Gley3Ycckcp1ccT4urjon7yznADs/W+Hlz5pkglop7FXtcpTl
         TZezvDOqJR54eBH7sQDFcafTthvlm7s0Dr8SlhOv37X/iQ1E5yGRUQ3Z3pZKSt/f1Arx
         dgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778694856; x=1779299656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C04fNeLquaS7uemBA4+Am0E2khDbaAX+WsMNaX9Ovo8=;
        b=mWY027QEkl6OxsJ/TkxjTlxDP3pnt4vV+jk8BWzKIOOm+iKUZWDQLQXxMKN+60bX4w
         sx5k/gzumxu/iG5Z+pg2D4EiNClEyNBAlXXP3LQE85GOJNZuh6LmT1KhoPcdCJG+2X/w
         0Gva4kpt4W0vKP6BqLPE5cB1mbc7TWGCVdNJ+n4VDEy5/7rVp3TaENLe1M8BaLw1oCEA
         J/Ct1B/dXaRhwRcIE5RUDiFizUs8OikYwevx9M/5YmL7JhcmsUC9XPwl2nKgu8AHyGRs
         riEWrOtVlKiDU5YVe8dpYq6yCm/+XmdJAUzVE+WXsffaEJmQnluZM53yHSAVT9+RVoI3
         3GNg==
X-Forwarded-Encrypted: i=1; AFNElJ8H9EtKuTMLiNmrqooGLrfAPCM2BbvLFxxqxszomXZFJwIdP1sdVjtZDWJKQst7U3A4e3eVjUkC6CLp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2CJxctj3xN76hrK3Nh3A5ZaZcUc+ldEk2hfJ0OsylYgpjh8Lx
	/9uHhjMCTlPJt4Yl5kjsvLL9yYHKh55qe5n3vspj5hhIweiU7aIJHQSTkHzQdkTyE4+ZGCqlvih
	kVrd9CP61VoS7PjAu2xHk3Df1BkfbUOkzDpKSBn2ZgpvdAA51YdEDyWRY8AfqlxoK
X-Gm-Gg: Acq92OElYvocrkz3qpX52hRtJI+zm440csJXxGZW0pESA9iF8EK7MW1hC5JAB63ane4
	ixAO9HEYNZvWSagtusNx0PikFqP2MjzL0/LU30PxGfbuuT020yDLE98drvU5iofoZkt1Mj0Q33X
	dnSfWMck8GEwnOoYF0zAjk88Y2eSkmknqloqDyMnmjkh3pwqabDmBVcKN4QpOIbJbmVwgGkCATl
	w7Vmvo+vLskJIzExntboBhR0wHJDZrdAkkk+aZD2wuQdKVXwRvJgtRByq7XcbsitGl6t3fcECIo
	iBp3neKs0lJDPk6/MATriW85vMIawG355ZJ8BKDT9JJUEL2bjXuPX/MQd9jZw60HTwqyFh7px74
	hvFMpSSVXBni0jg/v6GTiFoEUGJk72l9NJQ0uouQ7jyPxzqd0+Rg6EiFD4W6pU2W6D3jiRxjOw/
	ej4WdousHBKP7Gh8ZJCHO+6a2FddMkjLXAavs=
X-Received: by 2002:a05:622a:1a97:b0:510:138e:b83c with SMTP id d75a77b69052e-5162f58ae21mr59839781cf.33.1778694856233;
        Wed, 13 May 2026 10:54:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1a97:b0:510:138e:b83c with SMTP id d75a77b69052e-5162f58ae21mr59839211cf.33.1778694855776;
        Wed, 13 May 2026 10:54:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945c8de83bsm187021fa.15.2026.05.13.10.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:54:14 -0700 (PDT)
Date: Wed, 13 May 2026 20:54:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 8/8] arm64: dts: qcom: kaanapali-qrd: Enable GPU
Message-ID: <t5kgyoudahhrii4x3i5eufl5rqdzrcaid2n4yfx5kixm2xrzqo@3sfbgdenehnu>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-8-13e1c07c2050@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-kaana-gpu-dt-v1-8-13e1c07c2050@oss.qualcomm.com>
X-Proofpoint-GUID: MGrh2OcgWXXhXWbAKGRHly5QIUFydGhf
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a04bac8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=zfO1FHEroGhDxMXjEocA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3OSBTYWx0ZWRfX8oZIh6Dy8ZMD
 YlGtLQbFYM8pM9Y7zrpT7xS1uRHb1AVW3pj9jlAtXdtN6X9IP6+NKgAPtzIe0VjGtceqqLAEJua
 heigsBu/2znbAa6ils49ZoP1euAk30bKEe2YA9jV1YhN4ER/dJjQG2SPU1ffJcv5a2qPT+Ilat1
 J5mbWeeWcoiGVH/ADKOFu3vEk4O3Nls8i6oa6bbjvQ1G8oH0b2oPSEhaCHnmec0EoSRfI75KAjJ
 9gDV+onqc4GRiBj8oicOLLIXADBSp4NtNhOZEsQJV5Ju4lk52P1HV5cMxvKi5eLtYjtP5EYpL1L
 kXgzMQq0TNbPUK4wsjUWd8cYBQGR40ItzEhvR6LOLrYoNPbEvL9dNFueVlknGALLreMn8Z4Y21I
 5pWCf4+2RwUd3ZYiuM5il7b9TVgITFTvsuatc3BSxuSa4ER1k196QWvapClT8/8mCKb/AULLkAD
 esfbWJTptX5Ul23iAIQ==
X-Proofpoint-ORIG-GUID: MGrh2OcgWXXhXWbAKGRHly5QIUFydGhf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130179

On Tue, May 12, 2026 at 03:53:22AM +0530, Akhil P Oommen wrote:
> Add the secure firmware name property and enable GPU support on
> Kaanapali QRD device.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
