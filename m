Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD816255F2D
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 19:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776886093; cv=none; b=TwdEvHai2dnYoLtdZIFjhbqCqkytaa6opXPmbllApNy9SNE665LjW8WQG0d+LCfgi6FcEsVX9cBvFVL1hGRix6Ca3Bf+b/rXSDXZ6gTebNBNK2osmL1ToOKtW3LpP8AOFGRMmuvLDPjXsm6LNWoQbzYLbQVj1GDq4RzhRtNUgvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776886093; c=relaxed/simple;
	bh=0DjEUblWGTbJoOhpgEdJPZMJd5VbyyjcPT3YlGY6UkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hAwZ4r+JqhE9nEFjOCKALJn6qZnQmnhfbE3X+vgUXmcvjsqzPjtyeJd+WlYQTgRXIFRmZWcxTaBk3J7WAVILwNHZ8ecBchLIaLsQ/wYHANTc4KI3QMHoO2Iye2YK0jXzdKx9rEYdhSq/UmpRlQGxmJfZBBHnBcHUr8qLO7b/q/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AnFKCVmU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hlA6/dCy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AnFKCVmU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hlA6/dCy"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MFfK4v2956096
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 19:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7ECK5SkbPFmBZFdl6CqV9JhA
	4e5osgvfe81v/IuaQqw=; b=AnFKCVmU0zeblI/PR3sZ2zmC+NFTCPQXItedvzMG
	A/KmSrLUGY/0a0tkMK1x3MMjT/nRmg/D/T0oyp9GXvov9Y9oj0aw6blRdX5dIlek
	v/q9dITpPXGRUzcZfD0cErbnElhMHUjA7wqwpA7hVKuaQTqIyMHBpCalM67t8N7f
	IT45ATglKkJsH04V4wCoUYW+lR0LJjDo7cIE/V7VOfTKKe9AQPUjUyyE9y0peLzc
	pUJh/Hr7WPE6rvwpazJ60ewWeMZHgGszOTS5MnGDDV4lTGVdiRbsY/6GxMcRzo2g
	I/tyGOAVkOujO5KAKTUXuGFBNMWxSoZL4kplKJqT5FVOcQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16q0svu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 19:28:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50da31af14cso158272761cf.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 12:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776886088; x=1777490888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ECK5SkbPFmBZFdl6CqV9JhA4e5osgvfe81v/IuaQqw=;
        b=hlA6/dCyJitDbPs6FSkRVNpxmKLRKnH7ptQz0UCFr7vznwIfBn0owqPPySsqZTHiRr
         VQlrQGo4wHPUrNu9H+Cc6JjjGd/SAT1umX517NK2KKROltMptM21w9cGYoQuKU98rm2R
         CAemkUNb3EyEi1BqAXKXOl138xj97xRdOEXTVCRN3b60HtYP8kGmTu6ORewT/ahRjBhW
         P4QMJjR/zf0ye4nlx4ziMY45ScHDp3rOuMv0qs4caTrccwXH8vGi/Q7ATW3m3r2Zc+1X
         BjcNdrxDfvIAdtNubXqDESHvCcG8W4VS/yyAbRRCOtzKfkns6cjHgLTPK4ChZo6mj1+2
         lK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776886088; x=1777490888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ECK5SkbPFmBZFdl6CqV9JhA4e5osgvfe81v/IuaQqw=;
        b=aNH/DTy8HcCNvZdSUNtrAKpKuBIJY3yNqGdvNXg7PUF/Nkk8KW5tCW2emZ6PbxLplW
         YmTDIMu90aOOelTXqKRgmt+CJ9ZeYDTeLSzo3e/A4wrgIjV2TM2rqXyqZALrTCE2LCCF
         FIkoq/iwDcR9cF+4HXL3MDuNwYEtNFiyVKPWRc5BPF03ynw8yzYFaEc1SvEEj9pQoyQj
         mHsQ1ygQWPofDU0OEx9ANqf1ut8RnoCrDwaHR58PLK5mnZAe7jzMkv0SaYZxFTfPuIRC
         6ZxuGiTC9yLRxrkN6PKamkbQ/7B3DPh1UM94WkzZuVjRdtydrRagUckte2tbty34QTWS
         QS5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/yxa9y7o38hQT/1L0gGKK6/UW/TehMhE74tUh+1Q6ha1/+lUiUmIn/h/AIyrAoZ88cz9FCUxFQqXWM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5gWTdnK+/19aq3tgE30cpYKSkfr8NxQO+mDXmujM1Y0acZgQw
	lcU7bsisFfr7DiPBO9SJ5PzlGvTNkPrKXLcJRmHevvN90hlh6Z0NHytM9OoLWzHyf8Q5dSRJ+4F
	C/+wcRYMKXopY9mTTM0wqxgFON1YMYdhtRxcH7J7XKszjGAMd12Yg5zHAeWODTDAu
X-Gm-Gg: AeBDieuQ938uQlxizIM0X3W1FSrP3EPPkym2v0hWTWDUblsaxBJh56/HgMO+HxUQnk1
	qXHAXxg1IjZTys4St1frz/hkuyHTfwK16aEiuAzRWzRX6/AsKk72ZyQl6fnNOahWpnACtklmiG5
	eLgEyRRLIufFK3qVL1oZ2RkEoywJdPa8qgBxgdgxobIneY4YlRRbELOkCC/LFLsUm0sdI/RRYcq
	80bYtpAFoBBJ0X/Z7JJLUcxZNmrqrhzQtSRiZwMc85ojhS591AwMXLInKK2Im1ySxNXMHWCi3Oo
	VmnOzuBO4LvnP6ZmS4sbdoQBajdd+Bp7enwBiO+TGbDddnTZtTLhh5HdgUQCILN5hYsVXv4ydZw
	8MdT0oW3NLmBXKwJ6/3XASNtB+T155PLrUEWvultL5ikcHuf7y7ewq30Ppm2lRN4X23FcqdpVt0
	sEIg4GgU0C7BtEgpNoxC3+LxQg4q4JLItUWdzLx3/Y+3bmMQ==
X-Received: by 2002:ac8:7e82:0:b0:50f:c15d:3f65 with SMTP id d75a77b69052e-50fc15d4453mr58228341cf.1.1776886087718;
        Wed, 22 Apr 2026 12:28:07 -0700 (PDT)
X-Received: by 2002:ac8:7e82:0:b0:50f:c15d:3f65 with SMTP id d75a77b69052e-50fc15d4453mr58227651cf.1.1776886087155;
        Wed, 22 Apr 2026 12:28:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad11fsm4607044e87.14.2026.04.22.12.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 12:28:05 -0700 (PDT)
Date: Wed, 22 Apr 2026 22:28:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Jagan Teki <jagan@edgeble.ai>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Marek Vasut <marex@nabladev.com>, Kael D'Alcamo <dev@kael-k.io>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/panel: jd9365da: Support for Zhunyi Z40046
 panels
Message-ID: <gyacssx3h7oowxohwzeup7dvmtlrrm7oarb3zwne77rvfysxwd@cvlghspzfdcb>
References: <20260417104740.259689-1-l.scorcia@gmail.com>
 <20260417104740.259689-3-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417104740.259689-3-l.scorcia@gmail.com>
X-Authority-Analysis: v=2.4 cv=KPNqylFo c=1 sm=1 tr=0 ts=69e92148 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=ctVrG-z7Z985iPdsjCgA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: W9QRPYYNYwSW5kF1vBX4dYI8PdvQII53
X-Proofpoint-ORIG-GUID: W9QRPYYNYwSW5kF1vBX4dYI8PdvQII53
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE4OSBTYWx0ZWRfX1oTrg37M0Kta
 w9pBDL+NeLkjT7eWTGw1CKo3xUFF50psnzX3uN/e6mmlKC1qHfI8V9o3wYkdi4w51acNbACIFXJ
 TjtdXc/in9Ks5NOR6TzOPOyfzF+pmJVDPPp9RWIaXjYud8i6BiDX4BJEprE5lApTAAx9rMwbwnB
 MNrzZ9HDrEQ+g6N8cN3h0lMH4V3ZbWJOQEySifvzjNRzxMZVCZUvNN8HpgXMoSbLjh3aXoqOYVv
 eS+O02w6ldKczFftYFmjwVz8cDWOoaE4k1pUQ4wGCEJ5DgsJeaBiRVPzHfvMwZRUkCtB/aK6Lao
 FDioivRtGlBQrMbM+ozWRrQPI/JHLqqxeTb20OWYLAKDctwyGf8t1Nbm+bv7jhbj1VqyXkFUv7Z
 EO6CRI6BZkXM53XSQ45YAUvBQfpCVAV1Yv/5VYY/0H9UNOMHTNYRNuBsX1zvl5CUvvkLH4VFevy
 gqWQQPF2jZOreAuUa+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220189

On Fri, Apr 17, 2026 at 11:46:31AM +0100, Luca Leonardo Scorcia wrote:
> The Zhunyi Z40046 is a 480x800 24-bit WVGA DSI panel based on the
> Fitipower JD9161Z DSI controller found in the Xiaomi Mi Smart Clock
> x04g, apparently in two different variants.
> 
> The Fitipower JD9161Z LCD driver IC is very similar to the Jadard
> JD9365DA-H3, it just uses different initialization sequences.
> 
> The two initialization sequences for the panel have been extracted from
> Android original firmware for the Xiaomi Smart Clock.
> 
> Variant -ctc uses a CTC LCD panel and has been tested on device.
> Variant -boe uses a BOE LCD panel and has not been tested.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 313 ++++++++++++++++++
>  1 file changed, 313 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index c33c611e03c0..7da064567248 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -46,11 +46,22 @@ struct jadard {
>  	struct gpio_desc *reset;
>  };
>  
> +#define JD9161Z_DCS_SWITCH_PAGE		0xde
> +
> +#define jd9161z_switch_page(dsi_ctx, page) \
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, JD9161Z_DCS_SWITCH_PAGE, (page))
> +

Just my 2c. The code looks similar, but it's true for large enough
number of controllers. Please consider splitting this to a separate
driver. It would result in a cleaner and easier to follow code for both
of them.

>  #define JD9365DA_DCS_SWITCH_PAGE	0xe0
>  
>  #define jd9365da_switch_page(dsi_ctx, page) \
>  	mipi_dsi_dcs_write_seq_multi(dsi_ctx, JD9365DA_DCS_SWITCH_PAGE, (page))
>  
> +static void jd9161z_enable_standard_cmds(struct mipi_dsi_multi_context *dsi_ctx)
> +{
> +	// Enable access to DCS and internal commands
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xdf, 0x91, 0x62, 0xf3);
> +}
> +
>  static void jadard_enable_standard_cmds(struct mipi_dsi_multi_context *dsi_ctx)
>  {
>  	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe1, 0x93);
> @@ -1606,6 +1617,300 @@ static const struct jadard_panel_desc taiguan_xti05101_01a_desc = {
>  	.enter_sleep_to_reset_down_delay_ms = 100,
>  };
>  
> +// Sequence retrieved from Xiaomi Mi Smart Clock x04g kernel in boot.bin
> +static int zhunyi_z40046_init_cmds_ctc(struct jadard *jadard_data)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard_data->dsi };
> +
> +	// Init configuration sequence
> +	jd9161z_switch_page(&dsi_ctx, 0x00);
> +	jd9161z_enable_standard_cmds(&dsi_ctx);
> +
> +	// GAMMA_SET (pos/neg voltage of gamma power)
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb7,
> +		0x10, 0x04, 0x86, 0x00, 0x1b, 0x35);
> +
> +	// DCDC_SEL (power mode and charge pump settings)
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbb,
> +		0x69, 0x0b, 0x30, 0xb2, 0xb2, 0xc0, 0xe0, 0x20,
> +		0xf0, 0x50, 0x60);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 1);
> +
> +	// VDDD_CTRL (control logic voltage setting)
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbc,
> +		0x73, 0x14);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 1);
> +
> +	// SETRGBCYC (display waveform cycle of RGB mode)
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc3,
> +		0x74, 0x04, 0x08, 0x0e, 0x00, 0x0e, 0x0c, 0x08,
> +		0x0e, 0x00, 0x0e, 0x82, 0x0a, 0x82);
> +
> +	// SET_TCON (timing control setting)
> +	// param[0][5:4] + param[1]: number of panel lines / 2
> +	//   400 = 01 1001 0000 -> 0x10, 0x90
> +	// param[2]: scan line time width
> +	// param[3]: vfp: 14
> +	// param[4]: vs + vbp - 1: 11
> +	// param[5]: hbp: 4
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc4,
> +		0x10, 0x90, 0x92, 0x0e, 0x0b, 0x04);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 1);
> +
> +	// SET_R_GAMMA (set red gamma output voltage)
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc8,
> +		0x7e, 0x76, 0x68, 0x57, 0x4c, 0x39, 0x3a, 0x23,
> +		0x3d, 0x3d, 0x40, 0x61, 0x54, 0x64, 0x5d, 0x62,
> +		0x5a, 0x50, 0x32, 0x7e, 0x76, 0x68, 0x57, 0x4c,
> +		0x39, 0x3a, 0x23, 0x3d, 0x3d, 0x40, 0x61, 0x54,
> +		0x64, 0x5d, 0x62, 0x5a, 0x50, 0x32);
> +
> +	// SET_GIP_L (CGOUTx_L signal mapping, gs_panel = 0)
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd0,
> +		0x1f, 0x0a, 0x08, 0x06, 0x04, 0x1f, 0x00, 0x1f,
> +		0x17, 0x1f, 0x18, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
> +
> +	// SET_GIP_R (CGOUTx_R signal mapping, gs_panel = 0)
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd1,
> +		0x1f, 0x0b, 0x09, 0x07, 0x05, 0x1f, 0x01, 0x1f,
> +		0x17, 0x1f, 0x18, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
> +
> +	// SETGIP1 (GIP signal timing 1)
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd4,
> +		0x10, 0x00, 0x00, 0x03, 0x60, 0x05, 0x10, 0x00,
> +		0x02, 0x06, 0x68, 0x00, 0x6c, 0x00, 0x00, 0x00,
> +		0x00, 0x06, 0x78, 0x71, 0x07, 0x06, 0x68, 0x0c,
> +		0x25, 0x00, 0x63, 0x03, 0x00);
> +
> +	// SETGIP2 (GIP signal timing 1)
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd5,
> +		0x20, 0x10, 0x8c, 0x18, 0x00, 0x80, 0x00, 0x08,
> +		0x00, 0x00, 0x06, 0x60, 0x00, 0x81, 0x70, 0x02,
> +		0x30, 0x01, 0x00, 0x00, 0xc0, 0x00, 0x00, 0x00,
> +		0x03, 0x60, 0x83, 0x90, 0x00, 0x00, 0x03, 0x4f,
> +		0x03, 0x00, 0x1f, 0x3f, 0x00, 0x00, 0x00, 0x00);
> +
> +	jd9161z_switch_page(&dsi_ctx, 0x04);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 1);
> +
> +	// Unknown command
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0,
> +		0x24, 0x01);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 1);
> +
> +	jd9161z_switch_page(&dsi_ctx, 0x02);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 1);
> +
> +	// SETRGBCYC2 (RGB IF source switch control timing)
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1,
> +		0x71);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 1);
> +
> +	// Unknown command
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2,
> +		0x00, 0x18, 0x08, 0x1e, 0x25, 0x7c, 0xc7);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 1);
> +
> +	jd9161z_switch_page(&dsi_ctx, 0x00);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 1);
> +
> +	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 1);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 5);
> +
> +	return dsi_ctx.accum_err;
> +};
> +
> +static const struct jadard_panel_desc zhunyi_z40046_ctc_desc = {
> +	.mode = {
> +		.clock		= (480 + 20 + 20 + 20) * (800 + 14 + 4 + 8) * 60 / 1000,
> +
> +		.hdisplay	= 480,
> +		.hsync_start	= 480 + 20,
> +		.hsync_end	= 480 + 20 + 20,
> +		.htotal		= 480 + 20 + 20 + 20,
> +
> +		.vdisplay	= 800,
> +		.vsync_start	= 800 + 14,
> +		.vsync_end	= 800 + 14 + 4,
> +		.vtotal		= 800 + 14 + 4 + 8,
> +
> +		.width_mm	= 52,
> +		.height_mm	= 86,
> +		.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +		.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +	},
> +	.lanes = 2,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +		MIPI_DSI_MODE_LPM,
> +	.lp11_before_reset = true,
> +	.reset_before_power_off_vcioo = true,
> +	.vcioo_to_lp11_delay_ms = 5,
> +	.lp11_to_reset_delay_ms = 10,
> +	.backlight_off_to_display_off_delay_ms = 100,
> +	.display_off_to_enter_sleep_delay_ms = 50,
> +	.enter_sleep_to_reset_down_delay_ms = 100,
> +	.init = zhunyi_z40046_init_cmds_ctc,
> +};
> +
> +// Sequence retrieved from Xiaomi Mi Smart Clock x04g kernel in boot.bin
> +static int zhunyi_z40046_init_cmds_boe(struct jadard *jadard_data)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard_data->dsi };
> +
> +	// Init configuration sequence
> +	jd9161z_switch_page(&dsi_ctx, 0x00);
> +	jd9161z_enable_standard_cmds(&dsi_ctx);
> +
> +	// GAMMA_SET (pos/neg voltage of gamma power)
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb7,
> +		0x10, 0x08, 0x42, 0x00, 0x56, 0x42);
> +
> +	// DCDC_SEL (power mode and charge pump settings)
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbb,
> +		0x52, 0x0f, 0xb2, 0xb2, 0xb2, 0xc0, 0xd0, 0x50,
> +		0xf0, 0x40, 0x50);
> +
> +	// VDDD_CTRL (control logic voltage setting)
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbc,
> +		0x73, 0x14);
> +
> +	// SETRGBCYC (display waveform cycle of RGB mode)
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc3,
> +		0x04, 0x07, 0x0b, 0x17, 0x00, 0x17, 0x04, 0x17,
> +		0x17, 0x00, 0x17, 0x82, 0x0b, 0x82);
> +
> +	// SET_TCON (timing control setting)
> +	// param[0][5:4] + param[1]: number of panel lines / 2
> +	//   400 = 01 1001 0000 -> 0x10, 0x90
> +	// param[2]: scan line time width
> +	// param[3]: vfp: 14
> +	// param[4]: vs + vbp - 1: 11
> +	// param[5]: hbp: 6
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc4,
> +		0x10, 0x90, 0x92, 0x0e, 0x06);
> +
> +	// SET_R_GAMMA (set red gamma output voltage)
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc8,
> +		0x7f, 0x78, 0x69, 0x56, 0x47, 0x33, 0x34, 0x1e,
> +		0x3b, 0x3e, 0x43, 0x67, 0x5d, 0x6f, 0x68, 0x70,
> +		0x6a, 0x61, 0x3c, 0x7f, 0x78, 0x69, 0x56, 0x47,
> +		0x33, 0x34, 0x1e, 0x3b, 0x3e, 0x43, 0x67, 0x5d,
> +		0x6f, 0x68, 0x70, 0x6a, 0x61, 0x3c);
> +
> +	// SET_GIP_L (CGOUTx_L signal mapping, gs_panel = 0)
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd0,
> +		0x1f, 0x1e, 0x07, 0x05, 0x01, 0x1f, 0x1f, 0x1f,
> +		0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
> +
> +	// SET_GIP_R (CGOUTx_R signal mapping, gs_panel = 0)
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd1,
> +		0x1f, 0x1e, 0x06, 0x04, 0x00, 0x1f, 0x1f, 0x1f,
> +		0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
> +
> +	// SET_GIP_L_GS (CGOUTx_L signal mapping, gs_panel = 1)
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd2,
> +		0x1f, 0x1f, 0x04, 0x06, 0x00, 0x1e, 0x1f, 0x1f,
> +		0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
> +
> +	// SET_GIP_R_GS (CGOUTx_R signal mapping, gs_panel = 1)
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd3,
> +		0x1f, 0x1f, 0x05, 0x07, 0x01, 0x1e, 0x1f, 0x1f,
> +		0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
> +
> +	// SETGIP1 (GIP signal timing 1)
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd4,
> +		0x30, 0x00, 0x00, 0x00, 0x00, 0x01, 0x10, 0x00,
> +		0x03, 0x03, 0x68, 0x03, 0x40, 0x05, 0x00, 0x00,
> +		0x00, 0xcc, 0x2d, 0x31, 0x02, 0x03, 0x68, 0x0c,
> +		0x25, 0x00, 0x63, 0x03, 0x00);
> +
> +	// SETGIP2 (GIP signal timing 1)
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd5,
> +		0x30, 0x08, 0x80, 0x18, 0x00, 0x00, 0x00, 0x18,
> +		0x00, 0x00, 0x06, 0x60, 0x00, 0x07, 0x50, 0x00,
> +		0x33, 0xc0, 0x00, 0x60, 0xc0, 0x00, 0x00, 0x00,
> +		0x03, 0x60, 0x06, 0x10, 0x00, 0x00, 0x0f, 0x4f,
> +		0x00, 0x10, 0x1f, 0x3f);
> +
> +	jd9161z_switch_page(&dsi_ctx, 0x02);
> +
> +	// SETRGBCYC2 (RGB IF source switch control timing)
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1,
> +		0x60);
> +
> +	// Unknown command
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2,
> +		0x00, 0x18, 0x08, 0x1e, 0x25, 0x7c, 0xc7);
> +
> +	jd9161z_switch_page(&dsi_ctx, 0x00);
> +
> +	// GAS_CTRL (GAS function control)
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbe,
> +		0x4e);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 10);
> +
> +	return dsi_ctx.accum_err;
> +};
> +
> +static const struct jadard_panel_desc zhunyi_z40046_boe_desc = {
> +	.mode = {
> +		.clock		= (480 + 20 + 20 + 20) * (800 + 14 + 4 + 8) * 60 / 1000,
> +
> +		.hdisplay	= 480,
> +		.hsync_start	= 480 + 20,
> +		.hsync_end	= 480 + 20 + 20,
> +		.htotal		= 480 + 20 + 20 + 20,
> +
> +		.vdisplay	= 800,
> +		.vsync_start	= 800 + 14,
> +		.vsync_end	= 800 + 14 + 4,
> +		.vtotal		= 800 + 14 + 4 + 8,
> +
> +		.width_mm	= 52,
> +		.height_mm	= 86,
> +		.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +		.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +	},
> +	.lanes = 2,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +		MIPI_DSI_MODE_LPM,
> +	.lp11_before_reset = true,
> +	.reset_before_power_off_vcioo = true,
> +	.vcioo_to_lp11_delay_ms = 5,
> +	.lp11_to_reset_delay_ms = 10,
> +	.backlight_off_to_display_off_delay_ms = 100,
> +	.display_off_to_enter_sleep_delay_ms = 50,
> +	.enter_sleep_to_reset_down_delay_ms = 100,
> +	.init = zhunyi_z40046_init_cmds_boe,
> +};
> +
>  static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
>  {
>  	struct device *dev = &dsi->dev;
> @@ -1707,6 +2012,14 @@ static const struct of_device_id jadard_of_match[] = {
>  		.compatible = "taiguanck,xti05101-01a",
>  		.data = &taiguan_xti05101_01a_desc
>  	},
> +	{
> +		.compatible = "zhunyikeji,z40046-ctc",
> +		.data = &zhunyi_z40046_ctc_desc
> +	},
> +	{
> +		.compatible = "zhunyikeji,z40046-boe",
> +		.data = &zhunyi_z40046_boe_desc
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, jadard_of_match);
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
