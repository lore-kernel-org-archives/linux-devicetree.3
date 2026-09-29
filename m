Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74EF3CA486
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 16:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697919; cv=none; b=Y5QfxN/2zcxHe7m2KEFklWU0RFI+C+30MhUxHijndujtg3UWwjgBkcVf2nQ+SzF/4ZIx+MNDG1Ru4DkD/eeAdpvdirKRUjtUrs4Eg+Kr/wycib72cO6MajyRJlgeN2Q7XGo2rdRAt71Kh1/zjbc5wGbaSeWWLyHlSF2XIWsUCls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697919; c=relaxed/simple;
	bh=VRbaTYq0LDvYFPXlaWJ6IR/NPIy2iu3IDxznvtKDrsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+H/k4NFW/Yetr/tv+Y0Cb8a6WmShKeLebPhrqRTrudWc372ixWFgAg7PRDMydrEKNcLYGyZFtOTet8lI0PSAm0cuAolOPhfVH0MF8B9T+TGoRw0QFWU5i79GZMiVS7G66/j9A+7R+0l2AQx8sBn0bdLt5fwx0eLnbuYFgMsPhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fah6eOVG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gZYUJumQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fah6eOVG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gZYUJumQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TFUSOa708269
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 16:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+11nj4pCyBkvkRwYq3yMNaOm
	dTpCQu0BySHcZO9yZcI=; b=Fah6eOVGotweigw9NjDr8Gz12aIenYAuxGzEm9JF
	xOYAXosQHU+xW+snygKr5MRMy28GeKd4BkBz0+vS0lmClIVEGvIKg8uFPlG3CLvr
	FPXMparGnbgIKSaw47Ry5NyQBzsvzK0hbH9QmdSyff5oJCnSjMA17iXl6mPZu3/f
	yjAdCX1/z8HJO2Ml+hsh5zstaEGLrpTFhftoE7SGvUVmRuB6AC4uoPuuwE7cD1NO
	bkZ/PJTAdX143lYiShkD0gH7QRfwmULxB1GB8XAina1MLyGnO/pSO8pn85/QqBJC
	faQKsPPzAt1Gh5fiAt/rFe0Y+jMK3lWFmLl8HYEwgsgFKQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0g1kr5gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 16:05:14 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988bbb0ed9aso902012241.3
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790697913; x=1791302713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+11nj4pCyBkvkRwYq3yMNaOmdTpCQu0BySHcZO9yZcI=;
        b=gZYUJumQmBOd5UApELWZCKtJzcz9kK9p3inrJv6Ua75UeDC9MuUmdHTs2vV1EpGz7r
         5yRl2g2argAjRkczQQ5l/8MSk8TQqvvcneVrsY6JLirko28lu/Dhf4f2JnUNpfzu2Y/r
         N8Mt5cE9aTR0HBNYmLyGg3KRe4KXEJiaUVRQ98WstKRd9OsRNldSw4FZAOz921nv71G5
         CuAr/S0vkkE6vyYXqIXJVBqPE92E+yR3YCrczANUpzDQp69maUAKLVLGxgOiqnwmz3zf
         oMT3nJ6rUzPG3Pmavbr6LWNaLFDYjkexe9TuX1aesnyffWIksnEjpjtEMuOnYItWOmt/
         ssNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697913; x=1791302713;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+11nj4pCyBkvkRwYq3yMNaOmdTpCQu0BySHcZO9yZcI=;
        b=R9o00cEnIR0+StuYA+Ie4UdqPpqEjhixEo48btLg/+QOPrGn95PVCI/j8TU4+XJ6PB
         Cr1XRTDoM0i+Taqh5AXcZSQLEbWCBCU7xW+ZSrZkQw/EwpV53ImzfZDIqB/J67qsli5g
         9J2JW9BJXuvyWlEJV8vz7IZmM4XzjTGu8+2aGK/s9yVc0HYdSCxw1ZHyh34hRnEPY0CV
         GLVkxz0LaNqkKkZhSiEaB7H9fk1GrMMEzFESdMauZ2Q/P0YMkGRMHpasc+y0Tq4pPtyi
         rIMsAGQ2xgRv5rtGZtIpnemGJBaABeG1rGVt1SD/7hojLEypJDaPD3eYt6gvG70PrZZy
         amQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtWz6R+mOF2oEx0+n3bWZKVXt6N/wcy8mF+Gxfeeb6daCIpl8PNXC8QCPN+lIWnhmMLcAfgvUggjhI@vger.kernel.org
X-Gm-Message-State: AFq9FYL2gatY8SOfysi4dnm8XgTYWNVsxbZC8biYn+JhJwdV4YV5Y3Io
	+lrncwLrP7JTLlZ1Dx96CCARxkB+p3KKbI5z0NAL0XD1Pjxmr4HNgqYtdk8/SJF1cnVp7ejirlW
	fZ+9HgCM79FcrN8Q8ahk+WpOUcxBZkSyDEnJgtVcB3acdgWPYbL4ulUyyCF5KGVz4
X-Gm-Gg: AYBFou21LrW9vCRmjBuUwmDcQSnFG2XFgqsK+u37M99pu01/p58feh1xkGIc/0BbcyV
	mn1yYOGsDXPvkA5JqNdWTg9UrfLgDqma5LSChCCqI4mPwk2o5uYBYUZU5ykNUq4TBQ+jn2hSeGQ
	sOgZTGoMPEeKqdNF+DT155hvoecxsZYsbRf9fMdfQic0aOvnzpCjufL8atE6a3HLk3KIV0LxBZS
	/Jh9Cf5TOvEHCC+/aRV9Cxa75wawRaC5ujglFZdwjZrbEHoh2t7u/Egbtd7tsYWzqhacWIH+UCL
	IkvwagoS20JVkiCSYIlP5SKRUwuqdGy4cs7qOOSltL/ZNUgVKqnNlabgo4z1GEOcVmxgMkCfUDq
	4EzhhD3JqmqB+pJCX8afDXWSBO9DEy35sFxVWHSdirGiSZgZm/CIEw7PvF61chkp16qj7JI/lHu
	je+bHorP1jz3Ls
X-Received: by 2002:a05:6102:f97:b0:7b5:8fd9:27e2 with SMTP id ada2fe7eead31-7b58fd945d2mr2639566137.12.1790697913160;
        Tue, 29 Sep 2026 09:05:13 -0700 (PDT)
X-Received: by 2002:a05:6102:f97:b0:7b5:8fd9:27e2 with SMTP id ada2fe7eead31-7b58fd945d2mr2639538137.12.1790697912513;
        Tue, 29 Sep 2026 09:05:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3b470ab2sm22486e87.33.2026.09.29.09.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:05:10 -0700 (PDT)
Date: Tue, 29 Sep 2026 19:05:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/6] drm/mipi-dsi: Add flag to support dual-panel
 configurations
Message-ID: <gu22hz3dnttzyu2eewpalgzxtocmlbfvnpwore36ufmyr3xtag@r5bbhafsn562>
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-3-c042266b9eeb@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-sm8650-7-1-bonded-dsi-v5-3-c042266b9eeb@linaro.org>
X-Proofpoint-GUID: 6D7Vc4AcB-E5DXdKN07b5dSWzc-Dly1I
X-Proofpoint-ORIG-GUID: 6D7Vc4AcB-E5DXdKN07b5dSWzc-Dly1I
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2NCBTYWx0ZWRfX5vxojck0Q1VT
 3TWx4ybaph1EAkT0YN+t6Qg3c1xvUWt6rGQCYVpi+L/FmXT9fVtz1tEMxIucMEPCcZa0nIyzs8K
 ynriF59I+VL7kPLU8WiY2G6jCUIp5uk=
X-Authority-Analysis: v=2.4 cv=Ysia1IYX c=1 sm=1 tr=0 ts=6abbe1ba cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=JmB1tVOSonE3mgEak7wA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2NCBTYWx0ZWRfX+DOYeKfqLoKU
 QT/a0pou8Y30o+xzP3ZO9K7oAASVswJasnbDm/PixwIF39+Dg1+GS0MpPm96ZNtoWs4NOVIyDMP
 36vc0XbttomjbU24RYYLCGZRv/uFychqMqdqxFCpv2PdjpMVWfH40cCrNPd3Qw83hl5Pvo37oCf
 9vc1EYx23nBL59QS4bP738sb1LlsWwOAwdYZiPR0+NGQMGvIM+LdUtgjv6zTWYZADa03djz59Zh
 CklLu7qZBIC0aXSPjdqoVVNYftC84m0vVKSz5+/34tdSyykV2XbAyf9IBBRS+lHb2fnXLIpx7Kw
 xRRSypI++/aJh/pRzLtRcQouMdEsZ2buYdIqceOC7fuVi91GJhjl86n5UR7DHW/yuMnU3s21hYn
 PYph7Dcfo+sQCg1n+u8QyCkrRNQGkwMPTqR8KaIHxQlW3PbWKjfrjone6WhBU2DSaTzSx+GR+JL
 SEo67tB9nomfP2nvKMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290064

On Mon, Jul 27, 2026 at 04:08:42PM +0800, Jun Nie wrote:
> Some devices treat two independent physical DSI panels as a single
> logical panel from the CRTC's perspective. However, two separate DSI
> hosts are still required to drive the panels individually.
> 
> Introduce a `dual_panel` flag to the `mipi_dsi_device` struct. This
> allows a panel driver to inform the DSI host that it is part of a
> dual-panel setup, enabling the host to coordinate both physical
> displays as one.
> 
> This change does not force individual panel driver to manage
> system-level display topology if the driver does not intended to
> support dual panel topology. Only the driver that set the flag to
> true need to take care of panel topology.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  include/drm/drm_mipi_dsi.h | 2 ++
>  1 file changed, 2 insertions(+)

Do you have a single MIPI DSI device, or are there two independent MIPI
DSI devices? In the latter case, the flag is wrongly placed.

> 
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 2ab651a36115d..889ef1421207a 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -169,6 +169,7 @@ struct mipi_dsi_device_info {
>   * @host: DSI host for this peripheral
>   * @dev: driver model device node for this peripheral
>   * @attached: the DSI device has been successfully attached
> + * @dual_panel: the DSI device is one instance of dual panel
>   * @name: DSI peripheral chip type
>   * @channel: virtual channel assigned to the peripheral
>   * @format: pixel format for video mode
> @@ -186,6 +187,7 @@ struct mipi_dsi_device {
>  	struct mipi_dsi_host *host;
>  	struct device dev;
>  	bool attached;
> +	bool dual_panel;
>  
>  	char name[DSI_DEV_NAME_SIZE];
>  	unsigned int channel;
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
