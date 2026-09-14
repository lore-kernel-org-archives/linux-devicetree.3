Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A193D6CC5
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392291; cv=none; b=SzJnoNdOheVNRf+W2b9sNOlDH9srAhqctJtXQcKElrOYl9Bx0WsCVkfIRraXn+gxnFsXSjy+vETJ6pALhCMJxghBD3KDlP0Nry1oWj6lHdBwoW4+PzdGlaZzHYLvSPFvBWR5yjxm3dpYgivLuF6oyNxWxUihoiwTwhmeJc3Ya1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392291; c=relaxed/simple;
	bh=5KLPdncsLccVWG4vS1VbkO+4SihTxYoWlWEpXBujLM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iScRYkEUkBiUmfjwKLy7lH9tw4W3RkrsmWfDUjy3pFYfVn0x716XWzThehvko6FPac3duKwhjjkU0ND4F8QH62XqjUB3lPMFDtVb0XcS7vKUGTxbR5lcSj2oIjW4NFdPV8LorHbaC80Nr6ofvXaeeZ51YueEYTHfADJte+GR5GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QWbNb02Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cNtCCiDe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QWbNb02Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cNtCCiDe"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Opa607370
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TJEsqlbhkeYlvOTZeQMhupa6Ph/sDiB31OAPFik2LLM=; b=QWbNb02QNVXvEYSI
	LSHs0mIIGJEbh/T60hOsLDfGeW2+GMdGZgtgPBLfnuRpRvHzI9whPWMqZB86tGU4
	F9Go+RUrpDjru1FiBA3stdJJu47PqKS9Z5kGo27IFKcinkoCSQTC198YnBCTizSS
	ttcOlgH7DjXqVvTOOKEM8duu2LlXmt6ByPebsT4qK8MFH2VOQceaHToc8TlTntSS
	Jn7hcGDiwvYgr3Fb+R6PtOmtQl1oAp8Lo9ckpm5fsVNJS0O+rlcpLsjr6E/Xe+FD
	OtEhHqF5jl8gITZcdzYhNROZS9Stzi7zQy10Mx/ibD95d4dH+3yam4vpdPeXUsiA
	44yPZw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2krcnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:24:47 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98055f91346so2357402241.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 06:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789392287; x=1789997087; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TJEsqlbhkeYlvOTZeQMhupa6Ph/sDiB31OAPFik2LLM=;
        b=cNtCCiDeibDi5/bc8ZxF38OlsZA4M+jjBdAOsIm7ByWVO913r3NfhHOM0HKxr4imAq
         Yh83r7fTbEK5yuhPYNCcuYqeFAwJGj4PwwUQHxMdz56pE/GpDNbqKkniUqSKVjSfz7cd
         DI3xuze9kL5keqJ96+G7xBDdE7HLXpjTCt333PjM5uBlaljaDmeM+PNO118HxLNDIFN0
         IAJ+E1mpwF3Cs80L0VcfO45czc+V6/yBHq9Be66YFyPLdHAAqhbX0RI1hSjC7CVWIsAO
         x8EKVlbu9d2S3U/dOMt8ddlRtKANlzYe1bMKOk6SjBR2s0+1bP1/TeWhRt9Sl//zRdf/
         5VuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789392287; x=1789997087;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TJEsqlbhkeYlvOTZeQMhupa6Ph/sDiB31OAPFik2LLM=;
        b=CS4cZFEm1TOkSsMA4+IAqd06V60mMNOX6o4EftD1gWoWEZuQvFX3g9wXL0fFojAhIr
         fPg26yN4hdbh5Y4llF1auQaff4tSzN+PlL/DCyOjItiuRZ3mRnpEJiQVAPZp9J5dtK6W
         O1Ekk95THV9OlzlD94rXmaXzGYCg2UotZvXp69OGVNn6oAh7PWDhnRKKkKvLY6mj/eKK
         a+7jzRzm4t7DBunpo8g7SxuucHhBOwo9FNc38v6xzTv691mNb01Yn37jJQ3uZeWIq33C
         IeH6fnFzGFObx0WlxaI8U7tiaEqbpwHxhRf6KAjlfTMXAsFJcY+uD1gLQzHyzcZFPWvb
         7vuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzH906pwlCa0j3KolUl/XWQXE3f9QUyK9kOQ73kxMyA9F9emdWO//27W40Usg7YDPEFY728nrfng4MN@vger.kernel.org
X-Gm-Message-State: AFuF++ndbbOzXT8Tp5oYHDEAhPayEciBYIPvsWRq7Uu8T7v/h6sjKxhS
	AYFSEwug6FaDNGH73o1btb7WGZG27WdJ+MP/lsalsauHYobXskumm9Bp4ivFtZBGScdAHMWWLVQ
	MLNmXaSfOnYTnX6ePGRdF4mM+6pH9sIglBTbWbnATb++NGAq1XV/Yk+7JX5eR9fHd
X-Gm-Gg: AYBFou0UiEmHTtXkNnlhSbgzSPBYDbuaMOUljXBa4JNTzG10nPiJ9X0lAiSphc3Tc/a
	1Y86Q9x9XRkXBlpE4WD55OjoqUO9arFa9OVRWhDeE8DiFxPyF8Wxo6L6ntnCX9HgNtbJTkXuNp1
	UXvQ5G8l3Kx3/jALzZ74MADvZeKOEI6rT0+/9h/3KJj4Ze1j/uUVExnJtL7iwYAIVEUuD2Aii0O
	mK+2BazVPb8vgjymcHsKhAEt8orCQGCjCsBf3UlDPjI9u1zhKTSf+yeNWmUMB8DrfyMnQtGF+Qf
	DRMiHNNyNp4ZL/j+eahZyKUpL+UQ/s3DsaBzmPd9ya0fQVoXd9TipBQyQDXk/36lbnD1NYNKqDw
	wpS9tjigBZOc/ONiM3yzdexjaLeeaYcSQmxwpXzEIXIJL9Ob2OBmKQaJNYOEIpL4KFC4rAz0Kjp
	3QE0c42algeG1T
X-Received: by 2002:a05:6102:6a90:b0:795:1be9:661e with SMTP id ada2fe7eead31-79b570f4ba8mr1228029137.1.1789392286996;
        Mon, 14 Sep 2026 06:24:46 -0700 (PDT)
X-Received: by 2002:a05:6102:6a90:b0:795:1be9:661e with SMTP id ada2fe7eead31-79b570f4ba8mr1227965137.1.1789392286464;
        Mon, 14 Sep 2026 06:24:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0472bdasm2443458e87.63.2026.09.14.06.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:24:45 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:24:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: kavakliyigitcan@gmail.com
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-input@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 08/10] drm/msm/dsi: make command and video mode
 configuration mutually exclusive
Message-ID: <pnlrq23steuyvrqm4e6krzdlaa7pqozxqcaaakzsmqajuo7n54@hhhu6chgeei5>
References: <20260911-ginkgo-submission-final-v1-0-0e68e63a18d4@gmail.com>
 <20260911-ginkgo-submission-final-v1-8-0e68e63a18d4@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-ginkgo-submission-final-v1-8-0e68e63a18d4@gmail.com>
X-Proofpoint-ORIG-GUID: wU0Mzb7wJjkK9kIQ5EwEtswfT9dhReY-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5MiBTYWx0ZWRfX+BMQf/XqnHEH
 hQZM3VHPl35gS6M7oBs0D8BqNFEYuE5Ltw7iMZmdEhRilBunNkkxAlasWGVzjceoZRaBRTtIv3M
 E2Zlq6jOIdgoY0QDfy+u/hBBCGv/SN+3P2VQdPI/hgVLeiSe5Drm7o3lWhzm8xVFU+aiKCQRH3/
 7Alub3JDuL3nfUnHE0Od/FI84TrM07CiF/NahjoTcXhjbqk6DV/Z+bbR0mHNMqIn3ww8kOlV1WU
 GKh/kSnwalU4qXh6bAb2bpQdP/YD6jLsF7RaR6E2CwhCQirSGc+sM4psaCDDbBVeuMUFAxlPY1h
 cGfUpAVsO4ZHTwPh2tTxGeSaBXk2NBxKEwECspt7rAzA9LtuspZMwcI8GhV3zDD24fnOEt6Qq/p
 N7KZWQdGGc/MWbJWSe0zt3PRAAZbEKFiM9r7axxZOHH4z524Hoc07ZSeMUN5aP1oz37byLMgxM9
 HwRDMnISD6KExwDIwog==
X-Proofpoint-GUID: wU0Mzb7wJjkK9kIQ5EwEtswfT9dhReY-
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7f59f cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=irAkg3Ti1NS2jvoIXoMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5MiBTYWx0ZWRfX2Uhxunv447x9
 eJNWLCGIAIAuCevajuchhSAtRxlzMLmL9MFnP+jpy8R74zpkIgaIAYlih8VP5ShmRbc9vrK1x0C
 yyIs5p3Od9UwnkJMoGZMKBhDzKetI/Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140192

On Fri, Sep 11, 2026 at 11:51:05AM +0300, YİĞİTCAN KAVAKLI via B4 Relay wrote:
> From: YİĞİTCAN KAVAKLI <kavakliyigitcan@gmail.com>
> 
> In dsi_op_mode_config(), entering video mode sets DSI_CTRL_VID_MODE_EN
> without clearing DSI_CTRL_CMD_MODE_EN, and entering command mode sets
> DSI_CTRL_CMD_MODE_EN without clearing DSI_CTRL_VID_MODE_EN.
> 
> Ensure explicit mutual exclusion by clearing the opposing enable bit
> when switching operational modes to prevent hardware bus collisions.
> 
> Signed-off-by: YİĞİTCAN KAVAKLI <kavakliyigitcan@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 7e4e3718b536c92dc555de213042857379499447..b9e2867d435a3ad8b6db6b57c440bbd827180b6e 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1094,7 +1094,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  		dsi_write(msm_host, REG_DSI_ACTIVE_HSYNC,
>  			DSI_ACTIVE_HSYNC_START(hs_start) |
>  			DSI_ACTIVE_HSYNC_END(hs_end));
> -		dsi_write(msm_host, REG_DSI_ACTIVE_VSYNC_HPOS, 0);
> +		dsi_write(msm_host, REG_DSI_ACTIVE_VSYNC_HPOS,
> +			DSI_ACTIVE_VSYNC_HPOS_START(hs_start) |
> +			DSI_ACTIVE_VSYNC_HPOS_END(vs_end));

This fixup is unrelated, please split it to a separate commit. Also, I
don't see corresponding code in the downstream driver. Do you have a
reference?

>  		dsi_write(msm_host, REG_DSI_ACTIVE_VSYNC_VPOS,
>  			DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
>  			DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
> @@ -1168,8 +1170,10 @@ static void dsi_op_mode_config(struct msm_dsi_host *msm_host,
>  					DSI_IRQ_MASK_VIDEO_DONE, 0);
>  	} else {
>  		if (video_mode) {
> +			dsi_ctrl &= ~DSI_CTRL_CMD_MODE_EN;
>  			dsi_ctrl |= DSI_CTRL_VID_MODE_EN;
>  		} else {		/* command mode */
> +			dsi_ctrl &= ~DSI_CTRL_VID_MODE_EN;
>  			dsi_ctrl |= DSI_CTRL_CMD_MODE_EN;
>  			dsi_intr_ctrl(msm_host, DSI_IRQ_MASK_CMD_MDP_DONE, 1);

For this one:


Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")


>  		}
> 
> -- 
> 2.47.3
> 
> 

-- 
With best wishes
Dmitry
