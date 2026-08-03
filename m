Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E44438485
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 19:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785784680; cv=none; b=ltGqwCbbYUMXO8QJScJ3mMRVgYbNZ/w7yQVX5E4YT3rH8ABDUZtiscOBiaADrHYWL7/TKCiBWwgpzA4OLn6z89FhtGGFsLlyTmWEay3pwLmVDlUifGKXxUg1M8ryasgZXK5Sbua9glK4OQlhTPiLVzTQ8TOyAN6pc+TDLAkl6Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785784680; c=relaxed/simple;
	bh=GyqRxIWFe2NtZzbEBfI/BcT4uX66KMapq3ElB/uV/0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJJ3XHm+qrIj+8nNXJPLlp06pNRGyVGxWgJoyNqOqlsN5/rvu5GsLIZWp9KC0ecQYYjFhHCCRNwaBqBKH56LXk+ZjVXSyPzXS1c6Eocx8aookMFtol4UPdPDNynVi7A9cUO2iVl7hxdsudvFkxGdqkF3AuU1SyK0NGa3Okx3loo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CZi6COh9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ANdVEbwb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CZi6COh9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ANdVEbwb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673Gvv1Y617374
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 19:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KRPjAdCw6C93bb715vQS7riK
	2PYzmQqIqKXKyNnULY0=; b=CZi6COh9Eq4EzDR3dgJRaTINRnCMPhwhIdBt5ktI
	NWZnSTIP/HWUjN7T51i0xFz1eoQHm2jb+S7txkXswKD5RugG6csF1nRW/joRV28p
	1sq3A3Ds8rY/Z43cx3FcZNWorSTDtUB/YNsIjgnk16seMWqngHpAhCAIwDcSW0FZ
	/saV6RN7hVxu4/LjBZSEo4uoiKQr/7+1LpG+5keWHyb4HZzxQUKtYpD+URSHfo49
	l2inNXVAIi4Mgi6VEM/VMfrb535IACV1Lze9eabbYpbtHnPHbuzAKpET99zoNKZM
	LbF9QkbZgQWoay+AOPon9qNNqNWc70oyw3K73c8i/CfSkg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftx7m0w9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 19:17:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb6ef846b33so137043a12.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 12:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785784677; x=1786389477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KRPjAdCw6C93bb715vQS7riK2PYzmQqIqKXKyNnULY0=;
        b=ANdVEbwb/APYM3Boy/rGAmk8h9G2eIwO2PkWacBoOIxsxYjBejj3THdGuztb0m+UOz
         WOEr53+FphgD+lpqJIswcGOB+208l+H8dlkiGIQFeaYCFBWQhlSGK11/H8bWPHnO01mL
         Kie4wnIMRgfjmgDjfLa2Fn/lBVgNaFBzonsBRmqsgUzAZEKjy/1Kqv39gNKpdQrbP/sH
         u21ARcKGJh1efZFuYJwJxp3AWiwcrqsJ63NRwmqQc/eXX1HvNg1OXrl00bTLRKft2HMh
         Wg3qHANWoHGAf828oykCgawbn9PWqrbtADL4H3yALPND/xIsvX8ddPgvQgEPkPuTonlX
         fZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785784677; x=1786389477;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KRPjAdCw6C93bb715vQS7riK2PYzmQqIqKXKyNnULY0=;
        b=cbfskHbAFLqAysdMGgcWluwWT3BJMTADVBi2LixVya26/eKoMWM43SYlkkO01Hc0hV
         RiWDm5fqkswVdjzxW3Aj7RuEY91VIw5F6i20SE+8GNTLphAZB/mV2O6Hd7mT1lWYbauR
         H0SGMoDoL/V5K5pwl80afESh+8y4cucZE/p2CLI7xc5qc/hxPRQ+YxsJjA5FNT/xzxIs
         3VmpIV+NMoRrWoR1i7kI5lf/fhVXE+TDZ3WTZLwL3nNuE8f679qymU+q5ssCEdkb+0mV
         ekW9O8hsdTRM0U2OmVEhjqRnxm6NWQ5fSy3fh8QFD2d/izWrGQmbOUrixULX/IWpXEJy
         SpQA==
X-Forwarded-Encrypted: i=1; AHgh+Rryk0MnDnV5udxOJcrN3mqa89CgDuprkkMOvIlgcV7HeLDv8xSTbWIxUuQacrmLm81fsOhrR7DRhOW+@vger.kernel.org
X-Gm-Message-State: AOJu0YzsN2q8m6IBjpLdeX77+/JshoIaeCvzgxl0GmuR99bp4cRKZw+a
	LwGnV3FHwP6aQxgML9d8JKGjgXMmKxbsldf0kWp1B4gmzhB4KzsXS6cvJLwiY/guVrr92LikMR/
	JNlA13FjhiEFMdRSSO2saZT30JbCMMA91dCTCUM5LhXGAeoDdLmaobi/2W+6yTyrm
X-Gm-Gg: AR+sD11xR9b94MlaNOrNWkF1NJ2lw7GkZmvkwphK4lggiwMmj4BxGf+ftO+Pmxh5d1/
	9TDGopif5eq8dhHvXnZLJN+/Zo2lwDL6CS+tvEuVR5zHOem8/oedD0E6ODcWjNtN0D4pzWfPJu+
	gV9bKQQ0aJRfAzzzJqn8s/uWNvU5Uzk0V5VDqc1rGFrxLo3LtLs59bip4HRPLSHLw0qNRmpP5N0
	aOaC0KOvCb+AT8MebtnFoBKEsgXXzCcsYZ0Y1Q+TOAKgUpqJ3fV330AocTmFIWky2cLa/mxWDKl
	9u5iAPk7RwOxBAoGGoprmLqzmraDR3xa7lSxQuAIMoSHUil42Bai8pjug/4Cqohi+90tLcGZHRC
	vHCwPW1tn8rn6IsNKCuLTXUiQcQ==
X-Received: by 2002:a05:6a21:a517:b0:3bf:9e85:b423 with SMTP id adf61e73a8af0-3cb6ca94992mr635520637.34.1785784676972;
        Mon, 03 Aug 2026 12:17:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:a517:b0:3bf:9e85:b423 with SMTP id adf61e73a8af0-3cb6ca94992mr635493637.34.1785784676491;
        Mon, 03 Aug 2026 12:17:56 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab25227bsm33419253c88.7.2026.08.03.12.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:17:56 -0700 (PDT)
Date: Tue, 4 Aug 2026 00:47:50 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        robh@kernel.org
Subject: Re: [PATCH v8 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <anDpXv7HXgHPI5Gh@hu-mdsor-hyd.qualcomm.com>
References: <20260728-lt9611c-v7-v8-0-bda216bfaf37@oss.qualcomm.com>
 <20260728-lt9611c-v7-v8-2-bda216bfaf37@oss.qualcomm.com>
 <20260728112614.BF6721F000E9@smtp.kernel.org>
 <5xpvwwovgwuxltjqjnlchamwcvppdc4376fcujeqovm7fr3uhw@6r55ztlq47ob>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5xpvwwovgwuxltjqjnlchamwcvppdc4376fcujeqovm7fr3uhw@6r55ztlq47ob>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE3MCBTYWx0ZWRfX5R7u7GOYlt6d
 kv++8T0Z7ahVbR3hVtRZe69O3bSyFOaMFmoGtX9J3QhCWW51Qh/olNXf5o56c67ovfh1S/1TB0s
 aUnRojaMOcBKlOJyYpDA7TdwV7sxfqrxWICsaIgQFrXIjx1Q7dFERDXyxUkKWriA84KEMMVk0Px
 q9D/y6gXfBOmhScvGPBJt+xI7b+NPxKAy60HuBhVyBCvGyWJf5guMxtNcvIor6RE5hOV9sV0Jme
 vfu5Dp2dIV9XWvRoWPl79xgja7OQTMLH5ZPd+y1ibg4LeQtp9bxNXLQULEe+K/FAdbtDGsv+grR
 CfIcAKH5TZoKFBXM35OkykRL1myViTq2IrRkwH1sYMF70CZWTvRftsEXEe/PvYjAb2crHJyC5OQ
 uXe48gceK9OFcCMuWfkkOsofTdKDPxi6uKr/ABA5kjYgSlysEcA7F/Q2h2iBfx8HEIf7tOafj/i
 X9gHIOQZTVQs+rZ8uMw==
X-Authority-Analysis: v=2.4 cv=TIt1jVla c=1 sm=1 tr=0 ts=6a70e965 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=CNQlw8xw5aM3HEDaa78A:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 1C8USE94evXou74V7f5P4LT3mMQ8tNlj
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE3MCBTYWx0ZWRfX4WMZ9Kz69jJU
 6zJwf7H3YB12vYCBsFJR2vV2pt3DB7LvBdnppFtr4B9TkubyYNk0CjhL0Cwn+w/4z+T5+8W0B4h
 Nh48CAD1+l99SUOdzE1SJ1OtvyH7Gfw=
X-Proofpoint-GUID: 1C8USE94evXou74V7f5P4LT3mMQ8tNlj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030170

On Wed, Jul 29, 2026 at 05:05:15PM +0300, Dmitry Baryshkov wrote:
> On Tue, Jul 28, 2026 at 11:26:14AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 12 potential issue(s) to consider:
> > - [Critical] Recursive locking deadlock in `lt9611c_hdmi_audio_prepare`.
Will fix it in v9
> > - [High] The IRQ is enabled before the hardware reset is completed during resume.
Will fix it in v9 by changing the order.
> > - [High] Premature manual teardown in remove() conflicts with devm_* APIs, leading to UAF and timeouts.
Will fix it in v9.
> > - [High] The IRQ handler incorrectly clears unhandled interrupts by writing an inverted bitmask.
This is ok, as right now only hpd interrupt is there in firmware.
> > - [High] Early registration of the DRM bridge exposes it before resource initialization is complete, risking use-after-free on probe failure.
Will fix it in v9.
> > - [Medium] The return value of devm_drm_bridge_add() is ignored.
Will fix it in v9.
> > - [Medium] Selecting REGMAP_I2C without a dependency on I2C causes a Kconfig warning and build failure.
Will fix it in v9.
> > - [Medium] request_firmware() is called while holding the ocm_lock mutex.
Will fix it in v9.
> > - [Medium] Missing `regmap_read()` error handling causes uninitialized memory usage and broken firmware upgrade logic.
Will fix it in v9.
> > - [Medium] Incomplete error recovery in suspend callback leaves the device in a permanently broken state.
Will fix it in v9.
> > - [Medium] Synchronous firmware request during probe may permanently fail if the root filesystem is not yet mounted.
This is ok as fw_version == 0 only occurs on factory-blank chips and
synchronous firmware is better.
> > - [Low] Firmware version is not updated in the driver state after a successful sysfs upgrade.
Will fix it in v9.
> > --
> 
> Please respond to Sashiko findings.
> 
> 
> -- 
> With best wishes
> Dmitry
