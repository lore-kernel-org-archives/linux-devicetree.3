Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B732B3B1B3
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774237545; cv=none; b=o2YOX8WZY+NDK20AmsUT5SS8O+76AlXCW3QWEoF+K/sqTWItGgXPL4mNADZVDz0tHRfrfUAIlc3PWHjG7XLwZiGCA9cTVjaU0eceoUYuoJAdrTgOvxrYCM9orpxeOOowW1fEZnbZ1flxd6RUShkDWtyfwt5NQhSOWbVigtnpec8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774237545; c=relaxed/simple;
	bh=rUBo7ScMKOaN+oG4Rx3+tq3xk+YAX04fViqlvJJOwSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htpU4EBWjgrr3olL2rJUTC/nGGRaAGPTaKLZfvfX/sz5DMwlLE7/o15aFqM1eHyasxM7791qGlCuAN8xySc6kV2A58K2lGgwhaduK4IJVYgM6NQBLmbdl7tebxsm2+Li4ifWhBPjh82imoqXrLQ/zETHXt93y05QmjwK+Ojzbzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NPMmsh0S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T2z8Ws52; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NPMmsh0S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T2z8Ws52"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MJeKXD1040726
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=771hqY1mCDIAg/yx+uEf6Ttz
	Hkh8ia+W+7ypVEyNNiY=; b=NPMmsh0S+owYHSkMHe7FKTXso9ov8bkoJHssgfpI
	QUuIAvmzADFOygabkrTB53bIqHT7UYxLCoyOabZX7cXwnG5NIMo5IjKHhN5+1ve5
	Gk0yEsmWFG1dmGm+D9V0JmGSnt/U0TB3fRMxoV5bGOCLGpS5vEj5u7dubAKcvD2u
	x8g47IItRdSFL6r2RQHhJ92nxH0hzFTz+LlBiHvj6+FJFp4vpUhcNP3MeSEsT5D7
	XZRuA93iE0BlQYVreYiHd0ngaT4owpVG6NcrqfMHfyIDPIxDgbbHBajQDCsetLWz
	cvJju/Fa5yuKzfqct2CrOkLebbtY84iKRau6c6WNfGhQvA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghbfcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:45:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50939597b85so193621591cf.2
        for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 20:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774237541; x=1774842341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=771hqY1mCDIAg/yx+uEf6TtzHkh8ia+W+7ypVEyNNiY=;
        b=T2z8Ws5237hhXjAFl2wUhSEv5wd1zHakUDAScepVE7r11dBuf2PrX4uiV1ThQJ5guM
         c+HUUIv8t6P0ql40uvpy1d4MTBl5SM/yEWNu1mpUhvuNWpzbxmo7ymU7E6AskyfOlK7L
         eXHYGEap8WVLqWqsB8HN7QMqge7VC/Sx/u0KJQAqIBXH1WRaRrGbKSlwft/M+6ucLlNM
         85Bot5lQyPrzlHKh2GA3UcEzuiku1LCujPZ3hxNleAMy/dA1xAza+r0hD8AOpiwob3Vd
         zZJTHlliAh8mShUB1C8voOe/vAMWEgmMmDb/6i40JLEXb+vH1jzRM2C1aqT3ptAh0Jdg
         slow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774237541; x=1774842341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=771hqY1mCDIAg/yx+uEf6TtzHkh8ia+W+7ypVEyNNiY=;
        b=lmzz0cjl5GKiqfHRA56dUZrd41xAQlZJiWdwvEDVWxiSnqgMuC0f9RJOGNIEY2njx8
         IuRWsbyG4fqxlWzq7D0DGNUJ7AX+uvfq+ZC2bUGylOeqx6niQIYnGxdLqhJHcSuFV1oq
         iDiOe3Wm+HCvn4DbLeCARGpTiHj4/EqgW+CuzWHV3PgjjWGxgrBWj7wTTfKaBFg2A7OS
         Pa4BPaWx8jC+zO94e5pyhPet/Q3qP1P6xlgALqP/LC77OmuKl1uOordsh2icfB4LulB6
         ZtH0ig1uo9v/dzrFMaNnx8wn6EeuPnG125MQe/otJOHvXaJschcDMKthFsa359C/QMsI
         iwsw==
X-Forwarded-Encrypted: i=1; AJvYcCWp4XOcyAStLogv1KWZfqb0O95mgQV/rByK4gsBhEG3xsqTHNScgsw2Uj09W9qIu/pR1il9I7RvlDIC@vger.kernel.org
X-Gm-Message-State: AOJu0YzRQ804OCwt4jmEzRRARUE31rIuZZaCrdvLkqujIcFil8XB5Jrz
	hBBQbx7uCJkVoWojz/jpiYgfY1RfkKFZrFV44RCCWeiyGdjqBuQEnLFI6s7DQl9AnesrSgjfaYn
	qSvzdNQeUdEdVmi+dsps/hhLwlq1AMT6K929E/Km5QvEVQjD0Wa5+6DkYNyZY2Byl
X-Gm-Gg: ATEYQzwb3WILz8wsreU49rXlg7xr5vHJr3G3ZqdY3prwGLL8z7CnjSec8rkTUHgyVqM
	jPdqRqAzK51gTgsxx7pNXllxdQzYBs/eJ8sDoo0c0MWWQ/ypl4gofhdHq8t1a8b/zsS1nyAoXZm
	BIRk7HHyGiTpkJJJKwjxVN9zx9E3jKBW3/ZzvLaaeDjqZsIF2ZI0fQtoCPKLdf+6fxXcUurgiid
	F/ZbzGhLN3d8nv/csBNEEewvtV5ByAIlZv+3kdgLRM5O7sZFPPDnsl/p+cjJbMsETCIe1begNx1
	+wC+X4mgzsTYDYVF2jKcETjyzvjEVENhVtuAEl91LGYvce3rcUYCrJYSQz1dUgNk4HQ7L3FbX1l
	cq/ZtsT5EEgyM/FJYw/j4R5X6/6wJUQ1aPcYGf3rzhhsSg6YhBcwXjLjv6uuGfhqMW5aCwHbOIz
	zLEGk9uMOAhdnGZE24pdJlvBNIbLRDNnFRQvw=
X-Received: by 2002:a05:622a:5c9:b0:509:1766:2f45 with SMTP id d75a77b69052e-50b37511914mr162680541cf.51.1774237540982;
        Sun, 22 Mar 2026 20:45:40 -0700 (PDT)
X-Received: by 2002:a05:622a:5c9:b0:509:1766:2f45 with SMTP id d75a77b69052e-50b37511914mr162680301cf.51.1774237540560;
        Sun, 22 Mar 2026 20:45:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530bd3dsm2247739e87.73.2026.03.22.20.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 20:45:39 -0700 (PDT)
Date: Mon, 23 Mar 2026 05:45:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Pet.Weng@ite.com.tw,
        Kenneth.Hung@ite.com.tw, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] drm/bridge: Add ITE IT6162 MIPI DSI to HDMI
 bridge driver
Message-ID: <hylxawutrdmwxem52lyhhprkdm4oc6bnj2w6z5p2e2czvwmhgq@apcxe3lg6kgd>
References: <20260319-upstream-6162-v4-0-7268483ef03d@ite.com.tw>
 <20260319-upstream-6162-v4-2-7268483ef03d@ite.com.tw>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-upstream-6162-v4-2-7268483ef03d@ite.com.tw>
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c0b765 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=Ns9eNvu6AAAA:8
 a=EUspDBNiAAAA:8 a=QVOp_v3Uv6RRArEZA8kA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-ORIG-GUID: rf8eRBBDNKOB7YFl8ZuOuAtSIV_w2pkZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyNSBTYWx0ZWRfX8gJ1oLLO1r81
 KQByWDhF2bKEqu5Ks6/Gb8Q3u69m3kYmdQyWLzyvaxAGRSPXps8d1ZwS5ypuX3+Q8xJ0dUA9BDd
 3dI2paqCWCnRbFQkaM/10rD33y50TLdaMTX1/oyyDwaHnRNGY+mk03lR37Go9Xtr0aPTVNlpgpJ
 3yJEyYRX1P26Vhcnol7Wwr9k7EW7fyJyHtpac9f3VMovbaAJG8PDwhV/ymJX/OY/1cazitWjugP
 sw68uKJvp1kbTUIZ3gcSeBhr7H3ImiQRF1v7Jn1cDmxQ2OWWzVJiH9tkvsTI6/l9tag8TnqL+UB
 vEDiPuO3yS1HPWGLuSAaWPUNI2R+ZGNEd++8uHDXaAn0Zr/gELQlSKPxkrIf5XQ8PO50enjQg1y
 nt8R7N4wwY15EUKiGFRtIQ/lGeFca7eB2fM4p+wTy9QNnpKwsziCjsjlcJCcM2oiF1qb51Wf65l
 kShweVs7kkX+ej9CY5Q==
X-Proofpoint-GUID: rf8eRBBDNKOB7YFl8ZuOuAtSIV_w2pkZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230025

On Thu, Mar 19, 2026 at 02:37:12PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> Add support for the ITE IT6162 MIPI DSI to HDMI 2.0 bridge chip.
> The IT6162 is an I2C-controlled bridge that supports the following
> configurations:
> 
>   - Single MIPI DSI input: up to 4K @ 30Hz
>   - Dual MIPI DSI input (combined): up to 4K @ 60Hz
> 
> The driver implements the DRM bridge and connector frameworks,
> including mode setting, EDID retrieval, and HPD support.
> 
> Also add a MAINTAINERS entry for the newly introduced ITE IT6162 MIPI DSI
> to HDMI bridge driver, covering the driver source file and the
> device tree binding document.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
> Changes in v4
>   * Drop struc it6162_audio
>   * Add HDCP_AUTO in enum hdcp_ver{}, FW enable HDCP by sink capability.
>   * Call drm_atomic_helper_connector_hdmi_clear_audio_infoframe()
>     in it6162_bridge_hdmi_audio_shutdown()
>   * Drop  it6162_bridge_hdmi_audio_startup()
>   * Add hdmi_clear_hdmi_infoframe and hdmi_write_hdmi_infoframe
>   * Drop it6162_parse_dt() due to "ite,support-hdcp" is removed from DT.
>   * Add DRM_BRIDGE_OP_HDMI to it6162->bridge.ops
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
