Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702A539CCFA
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 09:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167865; cv=none; b=aXHzyfgTC/59+X3vHri2bt7bspmf9KvavvUTGkvENYWJa2TEE86ZOAVTn1tZ0iWFumwYYJHh9wLO0Mt7SJil4Iy7nsJUWmlsliTqkbL5AuOTn0/234/+w3IjR5W4vw29WYd7BnX+fwCTIDOGYtfGRy+DUUyu2/sJK7bD/H2+3Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167865; c=relaxed/simple;
	bh=Z1RhNvryup2JnUxJvC04syHHCD4QZdNMEgs4nYuzptk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q71VnrzyLUgLOECOlbii4MW4k0l9P1Jkw4LBZQG71QILVndbgIFoN74Z774gtY4/59WITjI2KB5ft2IWoIcPjyHf+Rm548ONFncNESqYDFfmOS0CeUqGyDdr1QC4nx+aSvNfcTPPuVu39xD7AvBeVZ7HZ42ng1eSvpEzNby3n/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a6Cl4L5R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ex3GFILT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a6Cl4L5R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ex3GFILT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xaxD2924397
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 09:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iA3QMMHVEsPmME4HCgD644tjsXU5xTSR7oKywSBS2WU=; b=a6Cl4L5R/rIQgV3u
	xDqECEQNP+XCVoTGwLkV9GI9tmjsq9eG7t7vZaHWTsdYdZFjDxKXTW+tHt8nkiI3
	2pttUj9367iZ4IuDVQP0vXPQFlzG+UEO9U7veAGZi/Rfrfmp8XLtWVwVwC6rkYQN
	UlI6/1q6BlEz+5wTESkgglCytKz/rV5u+mov+yYe0FDZ6kEq0vavPPGJ00Lci85b
	w1Jv38lVmehvnFF59h1q4TvP6Y713VldiAKGekWtX/7wxeTTLUdCiAzPjHYJu/JQ
	rw32bA3IaNKVvy3Djyi4ESRYVt/GCBCXGJTDj3Yh/Wd74uOAtL5P2Vv4XR8Xb65B
	oW6xhA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv7w9x99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 09:17:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6f56fe641so9551915ad.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 02:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788167857; x=1788772657; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iA3QMMHVEsPmME4HCgD644tjsXU5xTSR7oKywSBS2WU=;
        b=ex3GFILT9HzT67nHPuMhVbH+U6WdZ/BZY1j/eea7YFpp8S/v5ibYK7v97VV6KZa7EU
         WLrnG1hDc+mkzMbEqq/9U+5721cMLyQre4zJjselMAVLoFh4q7xJASecXRBWIRwVm5IW
         thLNsbp4sTBIcMm5+Wm1nsfZQs5gZwOghZh1ZSbnRILHB7tJ0O/l8AWz0jtC8YTIO8MT
         zrXDViHY+C0RlZL4m+CDgVo7zQMb5ha217v9OjTXXWFR9/CaxdDgZqNTF7Od/vYCs41X
         4mE6ILtOq+OfCNhWiX0pYR+SK/jlihlCiC4cc82FkyxRNRDJXURMCMB286MfXl+gDtxU
         zLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788167857; x=1788772657;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iA3QMMHVEsPmME4HCgD644tjsXU5xTSR7oKywSBS2WU=;
        b=kbibune5KbXvqI2rnwMPoDRp7SHrLIuAqywjOfJ/Q1e9RTfvqZ2ZmI5wa3raTh45LU
         lKZCpjXHQInAGbyCHMWNxBjUMcJrRltcpw2K0UKak9NiZbm0VoobaBbQ3LFj0Z/88urR
         EidwglblV7t4m5biFY/i1SFcp/6rICz7h93AveP+CubNixDbb7s3mW/d7iCX/LSfsFsI
         5DP0F1w4/AB2XJCYoGzfBj5w+6LrF0gpC4AwqjntIZIrR4uelzUSL1Lq1WL5QecFQ9dH
         uzCkisE2D+RZEvX/NnBPoYnFK4SUe+bbV8bUcoFOkRXjznF4LeFeN0UPjjkljGcPso4g
         BM6Q==
X-Gm-Message-State: AFuF++kvSlq3xHwxM88AfHgMyO7cv4qBsNWTshqzb5t3S68IEoG6jt/W
	Dvi5+WNfFaohEQpppq79RfaR8FpGUARHGn9fbWQqrWq4aSkbGns0UVR+p4r70abVTFSLfjLVbPq
	kdgSABBiALy14/J1kgAIAWe2jIDJM2JAh2zuRMOGz5Is15+4MLaIjKRP0pcS237PVfmNflKzI
X-Gm-Gg: AYBFou3RO0WcGkcfRv71qn9RWetjw9JZnEFMswrgujn0bguhai09J5x9UWkCXGsh0Ra
	JbWXKB7Qu0UWpbt5X1BEa3b4VG/e+fYl5su4MivHd1O45HmXq0ojYW8DSTHO5fJ5Kt/vsT1OjA9
	D+9ZFi8yYWAKBhx7RZ3RQos0D1t8iKEZ6E1heUe8lnJXz9z8CBzP0rn3Wjo6e8wOo2Air74tuwe
	V7MbKl9hn6AuAIeLSmYwHOap9amn2nySHIMpw6HvZ/R9RTNkF8j4aA+4xA7304BwL/DDos7+guH
	V87JUqyarKpoUt/5bUz4+a7sI81BPAEXlTcHWuEF+1JlWFTWG9t/qepji4HQhI/x6gTdKuREaPy
	8kkXTnWBbalfTbtL0fhl7lspKswk+Q9PmuR4t0ylMZQYbiPecM0haojoMHMi6auZvBJU+pf1DU8
	jWIPlsLQarOW9TphRQ1Sw5
X-Received: by 2002:a17:903:228a:b0:2cb:2b50:d9da with SMTP id d9443c01a7336-2d74df53523mr206037065ad.3.1788167856701;
        Mon, 31 Aug 2026 02:17:36 -0700 (PDT)
X-Received: by 2002:a17:903:228a:b0:2cb:2b50:d9da with SMTP id d9443c01a7336-2d74df53523mr206036655ad.3.1788167856110;
        Mon, 31 Aug 2026 02:17:36 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f784857sm28142921eec.3.2026.08.31.02.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:17:35 -0700 (PDT)
Date: Mon, 31 Aug 2026 14:47:31 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v7 2/2] drm/bridge: add support for lontium lt9211c bridge
Message-ID: <apVGq9dlMTDTgOkR@hu-vishsain-blr.qualcomm.com>
References: <20260822-add-lt9211c-bridge-v7-0-7dcf567d57c4@oss.qualcomm.com>
 <20260822-add-lt9211c-bridge-v7-2-7dcf567d57c4@oss.qualcomm.com>
 <20260822171512.3A3391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260822171512.3A3391F000E9@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a9546b1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=8nJEP1OIZ-IA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=RqoEFDNdqNvBIBNZC6gA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3OSBTYWx0ZWRfX9WS0sRxhf5Lu
 q0MIKZZyng3W1fwEGGVd8+S+hITXCsXXd/PEjTsxCsl95WfHp/VKuZ53bgDxnE/OEemB25eFw/S
 DiBJGGLTv8neRcBIynIZ0y929EpdF1M=
X-Proofpoint-ORIG-GUID: eTDZctmEAVCZYs2ThFkZPFlcAvHgzP9c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3OSBTYWx0ZWRfX0hS2sw/RZCMi
 NGxNgNDWOkiCxUhbAM6uR20NY7L7j2Q5PPuhNgfCYi0Tog5eOC017M+htGcUjp9JHYXmAhyaVP1
 tU2XCUNe/MwaL9dwHtsiJf9zCHCB1Fbu73P/xVWDi5jBxpWUXerColyx2yr8KRBbUr9RObXKmO2
 n9azot4VMIu1N5zNkJ47C1KZIimyQ9gpsAzSQP7eBmkzCpBppvhIa3yh74+UEj6zcxCXD8M98vA
 Vq2EiPRojtXe9kReXO5UilOflD+RsqP+8Rl4pbyR7nB7ud4/UtxiyZ013L2LCcL8iEbfJyZDIzZ
 8VBmOTtD5Px3cWL7KI8csB2MuKIEofkbC4unKRpzhhYR3iG5s+LIuGGUfqXtzjztZ3GO07sV1BO
 vg23t3r/EN0QRTZD4iHCRNkgEdsx8OmhUt0I+RBqLwWnTL+iBsE4og/W/hO58J76YCOuEv2sSVy
 zUWF8RbEve4hqPVprrg==
X-Proofpoint-GUID: eTDZctmEAVCZYs2ThFkZPFlcAvHgzP9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310079

On Sat, Aug 22, 2026 at 05:15:11PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> 
> New issues:
> - [High] Deferring LT9211C bridge configuration to an asynchronous workqueue breaks the DRM display pipeline enablement sequence and introduces race conditions.
> - [High] Signed integer overflow in pixel clock calculations leads to undefined behavior.
> - [High] Unchecked division by `mode->clock` can cause a kernel panic (divide-by-zero).
> - [Medium] Chip ID detection succeeds for either hardware variant but ignores device tree mismatch, leading to incorrect hardware initialization.
> 
> Pre-existing issues:
> - [High] Unbinding the device via sysfs frees the bridge context while it is still referenced by the DRM pipeline (Use-After-Free).
> --
> 
> --- Patch [2]: [PATCH v7 2/2] drm/bridge: add support for lontium lt9211c bridge ---
> commit 8d2ec0de9ed01158cbba906a0bfbb93f7fab90c7
> Author: Yi Zhang <zhanyi@qti.qualcomm.com>
> Subject: drm/bridge: add support for lontium lt9211c bridge
> 
> This commit extends the lontium-lt9211 driver to support DSI-to-LVDS
> bridge configuration for both LT9211 and LT9211C variants. It detects
> chip IDs, provides per-chip configuration, and implements an asynchronous
> initialization sequence for the LT9211C.
> 
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/bridge/lontium-lt9211.c
> > --- a/drivers/gpu/drm/bridge/lontium-lt9211.c
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
> [ ... ]
> > @@ -120,14 +209,23 @@ static int lt9211_read_chipid(struct lt9211 *ctx)
> >  		return ret;
> >  	}
> >  
> > -	/* Test for known Chip ID. */
> > -	if (chipid[0] != REG_CHIPID0_VALUE || chipid[1] != REG_CHIPID1_VALUE) {
> > -		dev_err(ctx->dev, "Unknown Chip ID: 0x%02x 0x%02x 0x%02x\n",
> > -			chipid[0], chipid[1], chipid[2]);
> > -		return -EINVAL;
> > +	/* Test for LT9211 Chip ID. */
> > +	if (chipid[0] == REG_CHIPID0_VALUE && chipid[1] == REG_CHIPID1_VALUE) {
> > +		dev_dbg(ctx->dev, "Detected LT9211 chip\n");
> > +		return 0;
> >  	}
> >  
> > -	return 0;
> > +	/* Test for LT9211C Chip ID. */
> > +	if (chipid[0] == REG_CHIPID0_LT9211C_VALUE &&
> > +	    chipid[1] == REG_CHIPID1_LT9211C_VALUE &&
> > +	    chipid[2] == REG_CHIPID2_LT9211C_VALUE) {
> > +		dev_dbg(ctx->dev, "Detected LT9211C chip\n");
> > +		return 0;
> > +	}
> 
> [Severity: Medium]
> Does this chip ID validation check the physically detected chip against the
> expected configuration? Since it returns 0 for both variants without checking
> ctx->chip_data->chip_type (which comes from the device tree compatible
> string), could an incorrectly configured device tree allow the driver to
> proceed with the wrong initialization sequence?
will fix this in next revision.
 
> [ ... ]
> > @@ -454,6 +552,657 @@ static int lt9211_configure_tx(struct lt9211 *ctx, bool jeida,
> [ ... ]
> > +static int lt9211c_configure_tx(struct lt9211 *ctx, bool jeida, bool bpp24,
> > +				bool de, const struct drm_display_mode *mode)
> > +{
> [ ... ]
> > +	if (ctx->lvds_dual_link)
> > +		phy_clk = (u32)(mode->clock * 7 / 2);
> > +	else
> > +		phy_clk = (u32)(mode->clock * 7);
> 
> [Severity: High]
> Could this pixel clock calculation overflow? Since mode->clock is a signed
> 32-bit integer, multiplying it by 7 could overflow INT_MAX for high pixel
> clocks (like a 4K resolution at ~594,000 kHz) before the result is cast to
> u32.
> 
> Without a mode_valid or atomic_check callback to restrict the maximum
> supported pixel clock, could this cause incorrect hardware initialization or
> undefined behavior?
False positive -- the driver does implement mode_valid: lt9211_mode_valid()
(lt9211.c:1342, wired into lt9211_funcs for both LT9211 and LT9211C) clamps
mode->clock to the 25000-176000 kHz LVDS range before any mode reaches
atomic_enable(). 176000 * 7 = 1,232,000, well under INT_MAX.
No overflow is reachable through the DRM mode-selection path.
 
> [ ... ]
> > +	/*
> > +	 * 0x8233: pix_mux sel & pix_div sel
> > +	 * To avoid floating point operations, The pixclk_div is enlarged by 10 times
> > +	 */
> > +	if (mode->clock > 150000) {
> > +		val = 0x04;
> > +		pixclk_div = 35;
> > +	} else {
> > +		pixclk_div =
> > +			(u8)((phy_clk * sericlk_div * 10) / (mode->clock * 7));
> 
> [Severity: High]
> Does this division need to ensure mode->clock is non-zero? If userspace
> provides a malformed mode with a clock of 0, could this trigger a
> divide-by-zero exception and kernel panic? 
> 
> Given the driver doesn't implement mode_valid or atomic_check callbacks,
> there appears to be no filtering of custom modes before this calculation,
> or the similar division below at:
> div_set = (u8)(phy_clk * sericlk_div / mode->clock / pre_div)
False positive -- lt9211_mode_valid() rejects any mode with
clock < 25000 (kHz) before it can reach this code, so mode->clock is
never 0 here. No mode bypasses mode_valid() on this path (DRM core calls
bridge mode_valid for every candidate mode during connector probe).


> [ ... ]
> > @@ -523,6 +1272,21 @@ static void lt9211_atomic_enable(struct drm_bridge *bridge,
> >  	if (ret)
> >  		return;
> >  
> > +	if (ctx->chip_data->chip_type == LT9211C) {
> > +		drm_mode_copy(&ctx->lt9211c_mode, mode);
> > +		ctx->lt9211c_bpp24 = lvds_format_24bpp;
> > +		ctx->lt9211c_jeida = lvds_format_jeida;
> > +		ctx->lt9211c_de_high = !!(bus_flags & DRM_BUS_FLAG_DE_HIGH);
> > +		ctx->lt9211c_crtc = crtc;
> > +
> > +		/*
> > +		 * Needs a live DSI stream to auto-detect RX resolution/format;
> > +		 * defer bridge configuration until after vblank.
> > +		 */
> > +		queue_delayed_work(ctx->wq, &ctx->lt9211_dw, 0);
> > +		return;
> > +	}
> 
> [Severity: High]
> Does deferring the bridge configuration to an asynchronous workqueue break the
> DRM atomic enablement sequence? 
> 
> By returning immediately from atomic_enable(), downstream bridges like the
> panel might be activated before the LT9211C has configured its RX, PLLs, and
> TX output.
> 
> Additionally, if the CRTC relies on the bridge being active to generate
> vblanks, could drm_crtc_wait_one_vblank() in lt9211_delayed_work_func()
> cause a deadlock? If the pipeline is disabled while the work is running,
> could cancel_delayed_work_sync() block indefinitely or cause a
> use-after-free?
This is a known, intentional tradeoff and was discussed in the
v6->v7 review, bridge fails to read RX width/height/format because the
stream isn't live yet at that point in the pipeline.
The delayed work + drm_crtc_wait_one_vblank() defers just far enough to guarantee a live stream.
On the specific concerns:
   - drm_crtc_wait_one_vblank() has its own internal timeout and will not
     block indefinitely if vblank IRQs stop arriving.
   - cancel_delayed_work_sync() in lt9211_atomic_disable() is therefore
     also bounded -- it can wait at most one vblank-wait timeout plus the
     remaining init sequence, not forever.
 
> [ ... ]
> > @@ -748,45 +1517,48 @@ static int lt9211_probe(struct i2c_client *client)
> [ ... ]
> > -	ctx->bridge.of_node = dev->of_node;
> > -	drm_bridge_add(&ctx->bridge);
> > -
> > -	ret = lt9211_host_attach(ctx);
> > +	ctx->bridge.of_node = dev->of_node;
> > +	ret = devm_drm_bridge_add(dev, &ctx->bridge);
> >  	if (ret)
> > -		drm_bridge_remove(&ctx->bridge);
> > -
> > -	return ret;
> > -}
> > -
> > -static void lt9211_remove(struct i2c_client *client)
> > -{
> > -	struct lt9211 *ctx = i2c_get_clientdata(client);
> > +		return ret;
> >  
> > -	drm_bridge_remove(&ctx->bridge);
> > +	return lt9211_host_attach(ctx);
> >  }
> 
> [Severity: High]
> This is a pre-existing issue, but does tying the bridge context to the device
> lifetime (via devm_drm_bridge_alloc and devm_drm_bridge_add) instead of the
> DRM object lifetime leave the module vulnerable?
> 
> If the device is unbound via sysfs while the display is active, the devres
> cleanup frees the context memory. Since the DRM core doesn't synchronously
> tear down active displays on bridge removal, would subsequent calls by the DRM
> core to functions like lt9211_atomic_disable() on the freed pointer result in
> a use-after-free?

This is pre-existing issue.
The upstream-provided fix for exactly this class of bug is
drm_bridge_unplug()/drm_bridge_enter()/drm_bridge_exit()
Its only current adopter is drivers/gpu/drm/bridge/ti-sn65dsi83.c (d2e8d1bc840b).
Applying it here would mean reintroducing an explicit .remove() callback calling
drm_bridge_unplug(), which is a partial, deliberate reversal of this
series' own "drm/bridge: lt9211: use devm_drm_bridge_add and drop
lt9211_remove" change from v7 -- devm_drm_bridge_add()'s automatic
drm_bridge_remove() on unbind has no "unplug" signal equivalent.

 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260822-add-lt9211c-bridge-v7-0-7dcf567d57c4@oss.qualcomm.com?part=2
