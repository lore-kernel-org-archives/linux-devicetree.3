Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABAE23ABB9
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789346966; cv=none; b=VMHMHy58cLz6RGIztJZ4ODpz4Klqu8xDXlv+uUwbNRkFi1rwfMjDyHDmf2UIyj54bq7rV/akmmSEAxDp0Nw1kC7m7PzqgzY3IHpkQeiAnzXgyMMaUqAiZB/QoIu1Y9AZxjbnr3c5GLZzjvAgH248uj9e1sXLsCXFzwEt/NlocQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789346966; c=relaxed/simple;
	bh=3cjKVHWORn6ZGEgvMZDwA2bF2hSojbqa1BIxYtZnTmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3iMYVstDZd0A9X4tOYnVDZUa+77644zQvxapHQNfZpi277vfKqqgYxJ/oYV54Oa/IOg8r80Y6O5hSrjhrDY+mShohqEteKLKaOk9Nowje0HDKkKsRD9fD4i94Pye0ZSIkSGepOd1dG1uWM/z5ZZNBKPG33V4iyXVI2W+52vPj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ivwwbir1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kkg44NFq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ivwwbir1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kkg44NFq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E065bR2421585
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8NmfChnxo2IRmwbHnf/kQA3C
	nLeLHIcwhqHWKX+NDPw=; b=ivwwbir1QmoA/WcQUVtfLIY86ofLq1SXvX4BIJup
	0ul2sFFHAp+KiiXI2i705dfQgd4SWlF+RzFaBWlXmf1e5w81EsS8PYPdGH3pr03R
	kDNS6f680wt6BR9ISGBekyLJz66JImkhtvYeh/zWNjZrV9waXTexM+3RtA52CNqY
	rGhxFuv/qE1NmlZyftgQPhqWGzq8CidVnRnoHTc5pYzBUCTx17AnwdRxSnR4YMBy
	GM+xdSOkv7zD9SuGigzd2Y6F5G8EbIyW3bn1rlcr+YlA0dkwoe15fnZ3ClIysVoJ
	p43qKCC0Ce9yWmmtNZf80BX16++RtFkSPJaHI0fHj5TXIQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gn018may9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:49:23 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cc46a7765so196851241.2
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 17:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789346963; x=1789951763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8NmfChnxo2IRmwbHnf/kQA3CnLeLHIcwhqHWKX+NDPw=;
        b=kkg44NFq5BdL2/CIFThDGNY7PFGS+HJq6vEJYei0XxAdStLI5ouog8TUdab40Ri5be
         8CrLBZbyQz0smpAvHGesqUgBMBXRV8/vOrbBPDpgvWVr4c/1iX75OaduzTQknMUzscob
         7yUSgKWTieOFUqtuoakTbpnbymZZRsuHnlAN/XLBKXz38wtrCzAkZ5ZCPPlZycnYjkvL
         7m4PMC/nX4b8TqVeQ04k0fiPNXbiEJx4kPzEkKeQzg46p5wxdfUCKmk3RA4hPOCuEUFd
         JW3dgKelAEAFePfBL/Z7uOXuHPN4xpMZXrkPi07yBYqRTFqxPpnxMYB7olpdTO/CFp1z
         s8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789346963; x=1789951763;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8NmfChnxo2IRmwbHnf/kQA3CnLeLHIcwhqHWKX+NDPw=;
        b=d44be9IwcJ6dWqo9TcRzpC8kn4Ogu1tErDwLA8vq5es2dqRjInhj6hstU82UnbLKNj
         gW4K1hqWo5JvDsxoJvSO0tWQBjiQ874d/rKMMB5mXQP6BbS8YMc8+mhRd0+q5AZ7Y7Y1
         qCufs/CW+WF6EsCmrHu+0PD2BjT/IFhdjUMAFsqAJKxrWWtOntarUMtHJYo7qWGHPure
         6gzCx81vK+s6+72HQSyULakkAgzOPJo/KIFZEq4HYgqdZtBanZACSl0J1R9uhnqvx25n
         APWxars2jTgV8BP1e/Wp5tE7NApWi1bGQ+1yqBUDuBqiyOAfNC5KbH6+nJV81Xgq5co8
         wnbA==
X-Forwarded-Encrypted: i=1; AKwUvByEVYui3r67ZpJvOwsGpocAVqDQjzstI4my6tIcLAQA4mAkhp4zfry2uPYp18yq7+ertRwwBWCnGI8z@vger.kernel.org
X-Gm-Message-State: AFuF++mVHSTrlhhFojPxWQFvXNB/eKJaSapYe8STbxOutnpNTGhe4wWP
	ozP6q/Met7s8hF8BZqwY0Yww1ulyyYUqnaOS36kulUO9gAQLsy9FlqvDLAShQEkx4uUDfCxKijz
	9DMnIOkr3ZNxDVTGS3WvNPTWbIk5+08jMHpbLYUYug/hc3Fk/5/0omUadZ419+iM7
X-Gm-Gg: AYBFou17fcBAX5dQhB4RkeS7BfNUvosdlMQIXp2gPBgdSQ5fqByzqioR+IJEFy9O3P/
	1E4075ga784eABYGB8pa8Ew1tfSWztb3GRS7wCSR90TvGoyKPVo4eUjX4eHCa3HsN2Eabqckjk8
	W/P1btCimRY3JMKKdyzPZ6tTgHrPEzmO9dcmtyNZPvvVTLkQaSHptfCMwfLYGxceq+EVUbWgd6z
	dpVIl++93rBQXeTGyMVJ9O0MnykkNnaPLz99/mWn71hb26gWy4X/8Epzvc0xlMR5gryjVTqze9q
	nXVWOzhsTKIQl/AHUuJWYZRRiOOGVpNJrVXRQH1+ETKkSDcXW+yxBp+OjmyA0sK/NWrYjWxlYpx
	tjhZGA4xr+q5yrL6rXKfDxmkLnzDJh1AkxQP9OodbdhwHf7z14ot0TrUXf2FJwmBHt3lQqVvuKU
	5QcFHGtNzkX41A
X-Received: by 2002:a05:6102:5f07:b0:79b:3059:5a75 with SMTP id ada2fe7eead31-79b56efc485mr108136137.2.1789346962771;
        Sun, 13 Sep 2026 17:49:22 -0700 (PDT)
X-Received: by 2002:a05:6102:5f07:b0:79b:3059:5a75 with SMTP id ada2fe7eead31-79b56efc485mr108121137.2.1789346962362;
        Sun, 13 Sep 2026 17:49:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0457189sm1977356e87.25.2026.09.13.17.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:49:19 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:49:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v4 5/7] drm/msm: Properly handle msm_ioremap() without
 name
Message-ID: <cnazznrbqwprv753cmzhevttegxhhkkamsfvullaullyo7jjwv@75lksywtfhmh>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-5-87bdb9f1987f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-5-87bdb9f1987f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c4g+0h9l c=1 sm=1 tr=0 ts=6aa74493 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=sfZjJuiDFS-vDwBeDzYA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAwOCBTYWx0ZWRfX9atADwBC+mHF
 Z5r82Mb7NkF/JkCrxnFJ373Cu9qP9DSiAlOh/mGR420VA8h3iDzUWygQBuUCKZezKzvMq1x/aw7
 eVbuAHz71Ou/OE/+5L81bVVr6e+jLE8=
X-Proofpoint-GUID: 1ItKJEOXFLKevA1Knx_-zu_mdulAa-60
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAwOCBTYWx0ZWRfXzHMTWwpG963R
 6vqhxVjDvJ9Brryx01y7Y+aNFOZF16w7ppBf5wvUABlksgqhF6avjzhLEj5m/HH7nOIQtscNQWs
 DSGfkJ02kzCS0mgytsqR2fSiqA/waYkUoal+l2D6BBduaif4L8pm4ajRB7AEiZXxZIu8mo0NR1+
 F6dyIId8wuvem7L6XmCi2/Oek7aSo72mfpcJTT/3P/BUSDcue9r3/ztWUyOJTjVpkTel31pAHuM
 vWwVxzGqGvwQNviWoGCWoMA4uoVOY35XGJooXfHBgdzEOtMJ1Sibg58WtsbcQp0P5EQAnQnS3c9
 tpIaiiApEdR3BVqt2rXDDJUi9bq15QZQQLYY1S42J6yCoECbf/48+c8pmarHct29OwHtGas4cCE
 nt/F2r3p2P4y5pGans54jDEfC9tuXvXqyPqPjtMbjHAxrKrR0PRhqWeXlNjp73fNhqakiSpFakS
 2o1v5gb5dBGgjhyIgfg==
X-Proofpoint-ORIG-GUID: 1ItKJEOXFLKevA1Knx_-zu_mdulAa-60
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140008

On Fri, Sep 11, 2026 at 12:29:38PM +0200, Krzysztof Kozlowski wrote:
> msm_ioremap() accepts being called without name of the region to map and
> in such case maps by index 0.  However error paths still use the name in
> error message.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_io_utils.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
