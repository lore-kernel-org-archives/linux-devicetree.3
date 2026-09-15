Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05854CE683
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 19:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789500503; cv=none; b=RrgkkEQsIhe2DiT5FKMv8w8qu9xmWDVXz1ro+iqdpLWh3ZcwHeRsd/7R/MvLhEI5YvbxWJZZ/5wRGxnJTNatgGfWvrl/3IWBfgBKxI4L73wR3L1J2fbw2INXMof1nTLluoROj6+ikKtmPGdcJhT2XZ1VHxg8L4lvmPya4odlmsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789500503; c=relaxed/simple;
	bh=N+4D/99f1HY4sv3tB3meiq+ncE1mGIAIII7oB6KO6Hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OeyKK3tW3E2LB+Pd5ylpbKt2jYYxWJteX4UeKlKI6HOkF7qY+UZmvwJp/spPSW1rwj+yNFHIGiw+P2vdTbxh7uBa9srCFbrhGgSo/5t401CgPLNcjfDywjyle8xMAfNOzy98HvEVMWz1KuxIP3lNgrKxvKtg6y4mvVt40U5M3Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pMy2FBGg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZm3JfmF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pMy2FBGg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZm3JfmF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FIttZr498884
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 19:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ojaDUPtHd9cNx4slbCoFV2pZnXL+A0EcEEXwY6+H/Z4=; b=pMy2FBGg0KSMyQ9c
	PHxpTC84ELI/yk0d6Vbgiwt6drPpMKNfm/lMfhoOiVcIj1OhWUHh6xIfcjDtFswZ
	4yGgY7oWZVPyu4lIICecP2XbL1td1XZkk6VHIAp66Kwrj3Qw5IC52tF5PXTxOGjx
	DZm1QIVkDn9owl4UnxDHvaAFwcmhMKCEmlfAX/6aqMIYdbq6pkeTnBMg4ryjSd/7
	cvXrGDgsEqQTktkkhc8of97xYFVK1V0xlrLa0OUdCTmX961+cdrmfdY/9hCUBLDc
	nMjQyp2a8tMboW0zp/tfxMYHMiXQubsrMwn+Voq2ICDX1U9PoqnNfV/c4hWNNqSv
	Tbi/Aw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc3atm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 19:28:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso6040213a12.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789500499; x=1790105299; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ojaDUPtHd9cNx4slbCoFV2pZnXL+A0EcEEXwY6+H/Z4=;
        b=IZm3JfmF+JxDlQOuXtJ3jVxPDgazeZfRgCIUZjH+iPxooy/Bb6w2cVTzR8qt0gLzBe
         5c+vS1h4uCkjKt0J+Wvf5BQHd6y3VS7i4WoeyaXYmMt6FUwY0WKevkOOHL8IM8HMQ/fU
         N3rs6a5S8VupE/Z4sKaopIkdJK/Pwy5Nj9EweFYwGJH4mBX4niTzg/gWeaPm0hdgQHsY
         vS63NAVpy0PT/7hc4G6ojsnJDXIKV30Of7SPcuzoZ+IM6eZisBbCv4e4Vq8PlS0C9gek
         mC/eNW4Y81cCg0WVm6PGEEI3pgmZtJ9Zfbm+b1GAvf85UgyvLcG0T8xGCwpWNfWWYBtq
         9/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789500499; x=1790105299;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ojaDUPtHd9cNx4slbCoFV2pZnXL+A0EcEEXwY6+H/Z4=;
        b=OGncmb/9mc4ZmWM1iP8LffsZMoPkIrW9Q3EdliKXujWCS8gfy74BWsTwIoTAx/jM1Y
         DPhu2DTw8Yqyb9ZVo8MI+McL7ApScjkI4j6hFy1jLYdsm2m/deI7IaiknXDK12PKixDO
         +uTDweBIoKoCrOGKoomrcnjQLPc4ysux8yU5CKZNbvNFwkNh3nRZfsapAHd7/1uahqsS
         siPu7p2tzIbNExieG2cDV0Ua2jcZ3G6gUtF5+4qlmG9z9XtND7KPtXoIG35hMaImDNkd
         yK9bxm3dwVZRiElSnbqN0NfNAQt0SrBE3rIL7A4dB5BWvz+au8Us5wIvwIly/zJdOFxV
         rhng==
X-Forwarded-Encrypted: i=1; AKwUvBzm6uiHZx9kyNFzgQ2pOnxe32ODReYYtlcQznKhK7dDI+4oeqGlBkoznMN8XMzWZJ0Eqp3HyBxIqIrX@vger.kernel.org
X-Gm-Message-State: AFuF++kgmXyOYdMIL/0XFmH64ncS7uoLZ9tXk+dB2nqKGsQNlXvoUwj0
	5Lt9oJNAT6S91KR4x3Gv4Y+39qL8fUMRJlXDJI/g3DuQi310dPqT+sbmqAbZb8ZNVGuE4uaaAys
	wBc3E+Vy9aNjnUL7bSLNv7bDcMfyUcfMITC8rqD0V2MO3ChmPGoiNJIyiC7McIUu1
X-Gm-Gg: AYBFou0OETnjWqWIb1K2CkvWIYmh8+vSMMV7eHDBV4bi27QRzoNKn+MiEVNvYDBOxEf
	Gdqb8wTEazRWHB7uwmRSlfhEGHbOJyUQ89oZx0/RUBC4iuWdkstJvcYjFwFReTebhhbWV+e2jTy
	q+hZYYY2rRDx0ht3fLvZNr28vFHWtSGOyiwSpCckLYGpzhRHdMEXwZOsRjGMKrZGdQ9jaOznsDz
	9ev4dq3iOIDHySkf7OAKnHjMlRPCUY9PaYITDvUr7C2jynOhMgsRNNRnbArydu6Ry8bbLfoZLCd
	rKHWwPngZy8fOgDPpnuGmUM5L21VEZP3QmYesiR00WFegkc/YF7vpZC4aIVaHQ/af8xO6jWZOuD
	BtkMg9lF8SleZXc3WEKqtscPOvA==
X-Received: by 2002:a05:6a20:b40b:b0:3d3:aec2:4dc9 with SMTP id adf61e73a8af0-3db405976a6mr19102814637.21.1789500499072;
        Tue, 15 Sep 2026 12:28:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:b40b:b0:3d3:aec2:4dc9 with SMTP id adf61e73a8af0-3db405976a6mr19102770637.21.1789500498610;
        Tue, 15 Sep 2026 12:28:18 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d76834sm782199c88.14.2026.09.15.12.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:28:18 -0700 (PDT)
Date: Wed, 16 Sep 2026 00:58:12 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v16 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <aqmcTK4vyKX/J7dK@hu-mdsor-hyd.qualcomm.com>
References: <20260916-lt9611c-v7-v16-0-c65042fcd245@oss.qualcomm.com>
 <20260916-lt9611c-v7-v16-2-c65042fcd245@oss.qualcomm.com>
 <20260915190337.607831F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915190337.607831F000FF@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: yfqoPfDAMXDUS_0fVN1a9X2cnt4KnqaS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI4MyBTYWx0ZWRfX8emHkjc1jBUp
 nh9h53wJYL4P2mSKXMY340XrXBov9+PFNO7uPLLVBwmxiTrDZKLaUqMEica66+qlEE3BYEZX3K8
 /YG4x44cLCLkOFH75Ve86Xav8riPwtk=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa99c53 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Kz8-B0t5AAAA:8
 a=JW9JmUXexGuFTMD2F-8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI4MyBTYWx0ZWRfX1BDa/9xKwgZe
 pNPQbyHiWSHOdPd6XKnE6vH9uNiXLYx3SETMmqQRKEAZnUAsqB6O/9uJEKSXEGxBwn9XeWfd7KS
 rhGp/d9jHu1ZgMWAnsacbnyzuMTiAd5oko0JYbTiy37WeLIZkzY04F57tw624f45hdinCwEjgb2
 ld+UIjFx96r+SSddFEt3+64flHm60sk2Xpok76sdsIRE3YpPcCLS5yV7kWbK2PnTmfMJULVw4f2
 OR/qqnftigvcUvmEuygHMnn01rgzjvq9Ptwx37A9cVywbI+YQR/HCug6NNm7Nakkr4PvC8qXWAv
 X/xxRfgQlfZjdUTLluPmAyTqb3djvcoTt6mZ/h+gXZcEH5ZV0TcFAl4M8UNMzjyD1kHuftXlKrs
 9DrC4SZO3v+CnujYR0Bci1Ozn/+qu4bAL7gFrBeZAmZ3a2cKqiquaI0+PrEgdlUAZmp/aM2kw2x
 F83pbfWPNZLLm/jUU4w==
X-Proofpoint-GUID: yfqoPfDAMXDUS_0fVN1a9X2cnt4KnqaS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150283

On Tue, Sep 15, 2026 at 07:03:36PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] drm/bridge: premature bridge registration causes UAF on probe failure
> - [High] drm/bridge: missing HDMI formats and max_bpc initialization causes display failure
> --
> 
> commit 845a14001f40c5c49616eeff3efbd5f04313cc72
> Author: Sunyun Yang <syyang@lontium.com>
> 
> drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver
> 
> This commit introduces the DRM bridge driver for the Lontium
> LT9611C(EX/UXD) MIPI DSI to HDMI converter chips. It supports single or
> dual MIPI DSI and I2S signals to HDMI output.
> 
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> > new file mode 100644
> > index 0000000000000..54ae535339f74
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> [ ... ]
> > @@ -1160,20 +1160,20 @@
> [ ... ]
> > +	lt9611c->bridge.of_node = client->dev.of_node;
> > +	lt9611c->bridge.ops = DRM_BRIDGE_OP_DETECT |
> > +			DRM_BRIDGE_OP_EDID |
> > +			DRM_BRIDGE_OP_HPD |
> > +			DRM_BRIDGE_OP_HDMI |
> > +			DRM_BRIDGE_OP_HDMI_AUDIO;
> 
> [Severity: High]
> Will setting the DRM_BRIDGE_OP_HDMI flag here cause connector initialization
> to fail?
> 
> It looks like the bridge.supported_formats and bridge.max_bpc fields are not
> initialized before this is set. When drm_bridge_connector_init() calls the
> core helper drm_connector_hdmi_init(), it strictly validates these parameters.
> Because they are implicitly zero-initialized, drm_connector_hdmi_init() will
> return -EINVAL, which would deterministically fail the connector creation and
> render the display driver non-functional.
> 
> Should these HDMI capabilities be explicitly set before enabling the HDMI ops
> flag?
drm_bridge_connector_init() uses safe defaults when bridge->supported_formats and bridge->max_bpc are zero — it defaults to
BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) and 8bpc respectively (see drm_bridge_connector.c lines 826-827). The bridge fields are
only used as overrides when non-zero (lines 911-914). No explicit initialization is needed and connector creation will
succeed.
> 
> > +	lt9611c->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
> > +
> > +	lt9611c->bridge.vendor = "Lontium";
> > +	lt9611c->bridge.product = "LT9611C";
> > +
> > +	lt9611c->bridge.hdmi_audio_dev = dev;
> > +	lt9611c->bridge.hdmi_audio_max_i2s_playback_channels = 8;
> > +	lt9611c->bridge.hdmi_audio_dai_port = 2;
> > +
> > +	drm_bridge_add(&lt9611c->bridge);
> > +
> > +	/* Attach primary DSI */
> > +	dsi = lt9611c_attach_dsi(lt9611c, dsi0_node);
> > +	if (IS_ERR(dsi)) {
> > +		ret = PTR_ERR(dsi);
> > +		goto err_remove_bridge;
> > +	}
> 
> [Severity: High]
> Can this sequence lead to a use-after-free if the DSI attachment fails?
> 
> Because drm_bridge_add() makes the bridge globally visible on the bridge_list,
> another KMS driver could concurrently discover and attach to it during this
> window. If the subsequent lt9611c_attach_dsi() call fails (for example,
> returning -EPROBE_DEFER), the driver calls drm_bridge_remove() and returns an
> error, which triggers devres to free the memory backing the bridge.
> 
> Could the concurrent KMS driver be left holding a dangling pointer to
> devres-freed memory? Should drm_bridge_add() be deferred until all resources
> are successfully acquired?
the DSI attach path requires the bridge to already be registered for endpoint discovery. The window where a concurrent KMS drivercould attach is extremely narrow and bounded by probe completion. We'll leave the current order as-is.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260916-lt9611c-v7-v16-0-c65042fcd245@oss.qualcomm.com?part=2
