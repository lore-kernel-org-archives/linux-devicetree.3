Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513504B04B3
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 09:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786094554; cv=none; b=XDV3Od/djJEglvle+beO0sk6dsEm0OSvsf8tqzxcplXj8tXQs6nkxj0IT3Flrih8dNgAUayZjOiXW7SsTqVwz9D6zDZPb8N9E4pzxCwHmGXzcM4VUE57cY+KQgWe/yRKoswnaFaqWI/ZerlURBKfbVfoh5j4M0VuwQawqI/FDTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786094554; c=relaxed/simple;
	bh=LH04lPQkaLKxsaogkFvPl0JnUsycA5CY3SThuwpZiRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=szt1/5/s+25N2+o9e+aaQP7tWiyDPn5BMClGtbYTEYbSxVz33S4sOxVCYZh28MOGTIfMloT/MBD6xPbYch72wXgXyf2h5QlnHRo+06SdmZCDJmnv6m5D7P4OLV/WpK1golJF6dIIQzoeO7A5HwNRlKJmT/1MS8CDBZmKiunZ/RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4mXtxyO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KyGYOIl7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A4mXtxyO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KyGYOIl7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67783UPh3564366
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 09:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TXEizd0UsOhU+MZfiQQUd2IU
	V81zhg/D6jvHU/Pk81c=; b=A4mXtxyOaDny+i9uzBo9roP+aj9PblulV05DlMPd
	qNsU3+nQ1NBVapJGV9IadT4k0woPV4wv1eN9hpTYqeM/uQ7Q/HHGalC4jI+2NffP
	sKXWTBJiMTeeAIYtoDRKucbnKJomb1JyeBt8VIfKv/z5AuiNaFbRkkqVDHV1siQj
	15XqJGVCRDEUZI187o7BV69ZAb+9gNVwgtuihOZ+9CKaZkIfyLa8oANlQwbxfEkW
	gfUN14seDiRNrVhgpM9j124TVOFmEVar4ArKXiqbsHS2ZndnYmgDrVSxD0eQt8FA
	37pBRkDzfyRJ3V/zc7CjbApDoqDJFDyottlDzGOKdbQb2w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6ju4cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 09:22:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-529ae8e96e8so33813831cf.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 02:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786094552; x=1786699352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TXEizd0UsOhU+MZfiQQUd2IUV81zhg/D6jvHU/Pk81c=;
        b=KyGYOIl7CDwF0s5+6LGvoBnY//nKbgda0y57jZbySLsa42wE7AgjBLqmhJg/erWDa3
         VB4RbO5lpwn/lRoibuCiueYC/2wI+NXuw9K5BZYt6DF1BBe0mBztL962yIMp4mU7XBov
         Dd2MjY+1Mqw296Fyy0Y6u5A/HpcMQgWb/FX8PV+wnXzlH4xrQp5gxKYuSt6M8/AbcaTy
         CPl64HPZFBM6/xjyAeAFy4hGwR6R2h8qsoD/pySgG+lSjfcE7EE3YnSDLrmkYuHKViWv
         XgNn3Gn/wP+pbNij0Lh1Cdp1dtmdVH3zI1JlQnt2OoJNico3ezO4uY0N6y/UBJTLTql4
         SEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786094552; x=1786699352;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TXEizd0UsOhU+MZfiQQUd2IUV81zhg/D6jvHU/Pk81c=;
        b=RdOIWmGBqUTPSOlOjZIoJECWzQcTBQ51tD6/LFHtXmGog4Dcoreapc4pJQ9df8/QRv
         AkI1d5uY5zQBsjzt7n71eP5e/vKCduaueaoa+6wEcjbMrNu7bJrrPNpes+xx/9Vwj6Ia
         SX13zebpXSlWozvgVt3jkd+8tGhxtvF32atz96xJ4IagW6uCmifsP+1x69NalUn0KKQJ
         1n9NsridrVEHInvcPUYaIWNy0gfUuYjuyKb0TmhvAZdajETIBlWUQSAMct08y+K7gjQc
         BPfNZg8BAvBfM4eUJGpCGvCFtwwI+3G3IOKCBUcY+YCFR6Aab82grwI24/BFdJJThs+q
         tc/g==
X-Forwarded-Encrypted: i=1; AHgh+Rqur6oousAbuXIwkIG4RAW1GBtEMKbZekLC/AXDoJIPBIKLCWD2c/1Jp9HnId3fEgsSOweYvONqLs+N@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzef20GQqxYznPLBaHGuwuNNTtEvAkEfqjnBmAKGnN2OhiwkPA
	rUULW856C3pzfPdTG2asvvoerIbw9b+tUVZD+VCHR1FO7hqHyTM5VAYzGLsJJC3U1jeXBKcUllF
	8DcMyG02PNL0n/CxbRyhgibaPVR0II+/+QYmfV3l0+OKWB6vVFgrkn47O1Et/Rzse
X-Gm-Gg: AR+sD112wDJV+ipybaL4AxibW5cRADxOcDEy5O49+ZISbZ5RkcubcCdtrlfv7rchC+u
	BEWT5dROgh+G22NUt2GgvXiku9N8adFVUN4b6aQqQX4kX34r/B9H5+e8UGbrKN2c3V3gsLvfLtJ
	Z5Zs4V6S8CZCH95HjxQxycgwlQPbKVR4KNhWjQK/Q99RjlH2BJHDsuXLo8ZEyZ/vIwAACCe3wFA
	BBup32T8Uv1i8pz8PpVxdppB5AX4+YDI/dvTsmO7aKxsUzIwj2s9CKH2Fz7USe5nUvaeC+szVZx
	L6DHUplcLM9uabrXJEqWAtv850rTpP9mFHCYy+Lz5xHxnBnshodaBus/GveEKARRPt/zX42eFk+
	Iuvizvl7skt/vYFK8+9mN6vUI5NrqLk7QoBSPBVHXyii2FPKUf26Q51t1+zl8Fdg+YGqPcobCZq
	DJXfYn5f+Cmwi7Ig==
X-Received: by 2002:a05:622a:13c9:b0:51b:ecca:f2e0 with SMTP id d75a77b69052e-52ce5f44c7dmr209192791cf.5.1786094551752;
        Fri, 07 Aug 2026 02:22:31 -0700 (PDT)
X-Received: by 2002:a05:622a:13c9:b0:51b:ecca:f2e0 with SMTP id d75a77b69052e-52ce5f44c7dmr209192471cf.5.1786094551281;
        Fri, 07 Aug 2026 02:22:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fdda7f4b5sm2351931fa.6.2026.08.07.02.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:22:29 -0700 (PDT)
Date: Fri, 7 Aug 2026 12:22:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com, vishnu.saini@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: qcom: Add eDP display overlays for hamoa
 and purwa IoT EVKs
Message-ID: <eemtq4i5xgilmy2g2ap7d3vnvgy2yucttwbujyhnn7otzavbrs@nzg3zbsbcszk>
References: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Rt/16imK c=1 sm=1 tr=0 ts=6a75a3d8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=FZbN8ehnm3fXj2eq2-gA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3MCBTYWx0ZWRfX5US/Z5bmP4yv
 bSet351MLAosD8uW00gvstCGtKDmTtw2iQz+WvrzCjwZXUIPc65rVZdxRBUCFStDTNJGejFouuF
 q0SOkprnPJJzBhMMCwKHqEA/MyOKmgkXk5Wc9xSL3MQw+RgR6rsLaJFJ5NWzbbxm+iC0TMSgr0c
 i9H2qHlSRqGW6ucodS6XKv9YI4n/NhJkqjZkAcW9TxebvfUQn/jmn+E7h78O4JUh7o3DDc3zyPN
 Bg5+7hGWjQyZYGYZCZ4KkgFrH/GntbY7KoVmbUh2dK51yooBjSn7YbBtnVeN2ZUFjdXJ23iTCvK
 U7FbbJJqxgRjDAu1G8c7Yx9R9P89iPZykKRQuUoYLCDE5IWtyGcD/zdXLRIwSuTHGhQKkEvkOV3
 hQxmvEZ/r71iHUM9QD95zXXxUxlvb3KMMuFuEXDn1y3Ve7OOtH4ZqvAd/2lZbotyved9bJ9GYFh
 BVM3SisCGZH047ROdWg==
X-Proofpoint-GUID: N54Z_BFI_oSH8cSnlppjtOY189K6XGZU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3MCBTYWx0ZWRfX/Bd6zKsF70Gv
 MvOnmJOIAfxPCaVbsSKCYvE2OG4CfU8p59EWa3YpVxiqSulY0PmJ/+sD5YX5FF7TT/MVsNwqJxy
 OssGOnXT7mbeMeAUat+2u4JHcmHGfYs=
X-Proofpoint-ORIG-GUID: N54Z_BFI_oSH8cSnlppjtOY189K6XGZU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070070

On Thu, Aug 06, 2026 at 10:01:19PM +0530, Anand Tiwari wrote:
> Both Hamoa and Purwa IoT EVKs are available in headed and headless
> variants. The headed variants use an eDP display panel connected via
> the DP3 controller, while the headless variants do not include a
> display.

Is DP3 routed to a connector or is it unused?

> 
> Move the eDP-specific nodes out of the base DTS files into separate
> DTBO overlays for each board. This allows the base DTBs to be used
> as-is for headless variants, while the composite DTBs enable eDP
> support on headed variants.

-- 
With best wishes
Dmitry
