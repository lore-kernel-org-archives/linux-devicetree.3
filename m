Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792495410;
	b=b9bMm81VryKWPrteW+3TJgLra3vVEfYSjkaGf76df8XveFNx0ahwf5p9o5zvxsayHL4/
	 e+99NJI/c8hcMNmTeWvvJmEAoG4n96wP0IRPUQyQ8kJGMAObAOEs91l2GYj6NA07shhnH
	 sd/G74e+THiKSIIn7DywGZhGM9HX9FzM25oI+yNJHHD4/O3iIfX/YXtdAivZ/+PVL9Ajn
	 rSJNM0bM3Qpk6PBroVv+MQLOc5kQMPgvOyfDM81kfb9naZFwE/iM/RPGjbAf2kCUd1KGE
	 +Gvy3Qz+1QTgk7CiC/kO0kR89GaYJ77qk9jD7pWOqzt1QBME4taZaDpsLL85HRABnVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495410;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qhh0ZV45FGIUTeIwsmsxV4mxFb/EQ7WWA7zG32iYPew=;
	b=tfnJilbNjxrBefjAdkTxe+5dFiVU1JQr1UW+JWv+1YDxiF7l/VKmH5qfWy1VHMwBTCB/
	 aRvFhflG810ZDpCpS02v5obmXqjOGlRzwD2dPw/iCJldd19o01ujtwYqaSC5M8ZEmHOdi
	 MMuJ7ajqOzctirbeiZZ+aOjPzvSHRpV7+gFaqeB8WIANGV0KeJ8y+YpnSJffG7ZCV51lJ
	 XsDF60yDjPPOXKeo0rBUBcAGA0KmGQKN9bjOmkejWWjkG9+K94jGLSLDeaNMSxjRUPMYj
	 IVYbFm5wLx8qyFVruj4WiLxoBW1nMCq0QlSEhverAUF3lSNm5q51bXt2ojsh5rDHSsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="B05AQ//3";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Qk3ZT/dB";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35D1606A322
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 11:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F35D1606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B05AQ//3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qk3ZT/dB
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAx3TT2562795
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 11:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qhh0ZV45FGIUTeIwsmsxV4mxFb/EQ7WWA7zG32iYPew=; b=B05AQ//3bin4597i
	8GD/kjSrr0VfInVU74gSPlE9m04Eh9WHk19sJCGQunDEY+DJgCFZtdfgZ+SeGadw
	LXDJDBd8djPjp0Lu2UQQjst3x0OeE50hedLwWFjiR2NqOGCphCKhtIDlYJRwU51l
	R3yovryvY+oXf8J1BmPNZhz3v/rvkJm79FUqenDj6oAo5B/mxfCDZjaFwLf21Kpc
	xlCBZ1zK+oGNX60eRFdk9y7WR2MkbwS6XJT8td2yS0fXxMz+WenZDlk4dQsXWWq+
	knyXHi6yhLXXdF4PzW7OHfhQ3tCzBh0yCYpeaHGreI2MpDCJTNwkzijNqwPoSxf5
	pUKJjw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5na7gn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 11:23:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so6791679eec.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 04:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792495408; x=1793100208; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qhh0ZV45FGIUTeIwsmsxV4mxFb/EQ7WWA7zG32iYPew=;
        b=Qk3ZT/dB5mzLfwCY5TIaGz1iOmJupE0ocLnMSlq1y6tg1ayBpb9US7rNJruL/g+B1M
         2urdsmkpIgpv+mPcZEb7ppq6r9d4tvC3IVt1v9UVT59BTgrwZPiGhSb1SCmC6KubqgXT
         L+hVN5iKuv5PnfGuZEVHy7UOUqy5bniHpzPe96YQz3oFfzY+cXaEUai2Tgf0TF3H9mW6
         MmT5yfEJ35uhBDgD8LVBPNu9q8258TVHqxniT9PqUTzfImk/TCt5rs9FPAJ4XXubedUq
         jytrp4Y/F0j4UU2TDGsrFz0HGvPJLHTkb3uXc8iGS2JJROAFVCkq6JDXcq3DPe9pgzKH
         ajhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792495408; x=1793100208;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qhh0ZV45FGIUTeIwsmsxV4mxFb/EQ7WWA7zG32iYPew=;
        b=LQh0N81otOVeEd5civ06ppz8K8CWX1Sp+vYYcBa+iQ7tbhD1CASKl1a2RuWVYlgDka
         hxvVX8jMKa2Hhp8I8LbkWuB8e5MSAamnADZ3D/cGKZFnOMqw0vlXMRmRlr91R6k1t2Ax
         hHzG6QZNEtOjnl1aLGXmS34WooAUP+9obF6p7nWy2auuSTOsodxyr9F8eN83iQmEFzs6
         DkL9aE99byKvAO1Kh+qaln4LtfnlPMJ1rR55xX7RJKfhMFm9bBYtRbiaUfxF++dTK1Hm
         DHNqdYwlV9s/Kaer8xglWwMRu6cHlo0hlQvbgTl5zIIGUvhe+03JUod/pXYpq6o7LDOh
         DN/A==
X-Forwarded-Encrypted: i=1; AKwUvBwGcaCENpUlJ23Kty1ACcZvwlloKD+AjetD9iWIxiJnKcfPnjWGAK6+RQCci2r4FBG3DZr2e3md/a4G@vger.kernel.org
X-Gm-Message-State: AFq9FYJzyxPi/bshz8blodx3DuxjQ1YEBgeTvr/6iatuLoUUmO4QqIVS
	KX8fW9XumMvhm2b0Ucbbsf1FxLbUsdyR21gObC6S64n98R6WTc3WM1GjPUCnI4ORKwFDTw25kzm
	AGnr+tE35bfZWmhKCBiMszKdXyEH8utQQFbp/F4RNO6a0nP31z4gyrVUkVdZA+6Hd
X-Gm-Gg: AYBFou2tw4jkMOkpjHyrO4nN5C/XMnc9zQClDUQWbwYZi9nPP86uRBpbN3uQrmKpchd
	Bg1hhkJSKEYo3TmMvy15hrGJIgp65Av41fE4xqTTLTyW0Q0ncReiihzVEmNcYuM0oYhN9y+1lL7
	ri8VDkLmw5DzHv1Q8fXG0Vp2U+xMpJ5Zq8u6AUamwVVagVPyoPak/no8CusO1VO4u5PoeXSaMeC
	xIuZ2BYTKcqpio1PzqeQ2ske1Scx3VI7HNou3Eosrvf5i/l7dU4J5oWFsF82Pzuz8+McWrEQfLJ
	tNp97aO3/rY5fDmen2AGcrGub9lV8CwE2J6f1X8Ao4NeKLlNfgKsQGuKOLZwTRfBT32uyl4BDRf
	pDbUC8WARC2IVy0BbpRJ+fvhvmg==
X-Received: by 2002:a05:693c:8092:b0:35d:8c3a:38a8 with SMTP id 5a478bee46e88-361a2942646mr16312724eec.39.1792495408289;
        Tue, 20 Oct 2026 04:23:28 -0700 (PDT)
X-Received: by 2002:a05:693c:8092:b0:35d:8c3a:38a8 with SMTP id 5a478bee46e88-361a2942646mr16312690eec.39.1792495407584;
        Tue, 20 Oct 2026 04:23:27 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b792bsm41575611eec.5.2026.10.20.04.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:23:27 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:53:21 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v17 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <atdPKccBp6CFiTzp@hu-mdsor-hyd.qualcomm.com>
References: <20261008-lt9611c-v7-v17-0-1e8f5f2b2f19@oss.qualcomm.com>
 <20261008-lt9611c-v7-v17-2-1e8f5f2b2f19@oss.qualcomm.com>
 <sashiko-outbox-163341@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-163341@kernel.org>
X-Proofpoint-ORIG-GUID: Tp5pM24m08HZkT29Gz3iopoJkzeZALn_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NSBTYWx0ZWRfX7dTEPx0VrwRv
 B8Auv9YZBR610GVDgNnOTlk0IMXeB1/D1LlSvPwNt+4hH0GsM5w53JHGWHKTDsZaYE0JFaCfBmq
 h3PhjLGVYNFYouNu4fEtPwnuYXI6Gl4PJlEHJLARDScQTpeaSRlJe4GfF5gWslv6dZof0Ku6gm9
 /Ecm/N331CalRQ85EqjWNuKxHfPE8smaYfFJPzmX2HSXE4wF3CtJh76rtcE1tMZdMu3U5+1kcrt
 e9aK83Oorm2dqOkC9XraLgOmhRQgUuRoYpbaMBCdVQFBq44Py1nk3tDn9F6CZzIP1JuIg04FkGC
 Q/6eUzhtF5sEeElfLmoBookdKS9YtwqdN9UHazrTUEdGz9nmwawvihpa9LzPPxKBmxbEl2kL5Js
 G6XEGbzX4V3Q3fSFr21Z67hajYRSWCEffP/LJTdXQJQSc869US+UYOfNPlo7M1NNWD7SH7nsBAK
 yfDqhPfLMyM3f/k2+Fg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NSBTYWx0ZWRfX5fMFpxvjMQJf
 IZAZmwYjUMyybhzkEC15A/5X3UTS4nIJiPIw7BEzoaeie2UUay0zlcd/71ViL8HR8QNhNMViXF5
 WrGJhPDvJ+omxwg2RXGNCVz/SNztlgI=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad74f31 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Kz8-B0t5AAAA:8
 a=JYkXmYT7k6CsIRxL8okA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-GUID: Tp5pM24m08HZkT29Gz3iopoJkzeZALn_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200045

On Wed, Oct 07, 2026 at 08:32:56PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [Critical] drm: build failure due to non-existent .atomic_create_state hook in drm_bridge_funcs
> - [Critical] drm: type mismatch and memory corruption in atomic_enable hook signature
> - [High] drm: missing mandatory initialization for HDMI bridge operations
> - [High] sysfs: NULL pointer dereference in firmware attributes due to registration race
> - [Medium] drm/bridge: missing atomic_disable leaves LT9611C hardware powered on
> --
> 
> commit 0482492a2bb6e8ef5381a82384662e6858358155
> Author: Sunyun Yang <syyang@lontium.com>
> 
> drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver
> 
> This commit adds support for the Lontium LT9611C series MIPI DSI to HDMI
> bridge chip. It supports configuring single or dual port DSI inputs and
> provides HDMI output functionality along with audio and sysfs firmware
> update support.
> 
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> > new file mode 100644
> > index 0000000000000..6082c89b388bf
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> [ ... ]
> > +static void lt9611c_bridge_atomic_enable(struct drm_bridge *bridge,
> > +					 struct drm_atomic_commit *state)
> > +{
> > +	struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> > +	struct drm_connector *connector;
> > +	struct drm_connector_state *conn_state;
> > +	struct drm_crtc_state *crtc_state;
> > +	struct drm_display_mode *mode;
> > +	int ret;
> > +
> > +	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
> 
> [Severity: Critical]
> Does the signature of this atomic_enable hook match what the DRM core expects?
> 
> The atomic_enable hook in drm_bridge_funcs expects the second argument to be
> a struct drm_bridge_state pointer for the old bridge state. Treating this
> argument as the top-level struct drm_atomic_commit pointer and passing it to
> drm_atomic_get_new_connector_for_encoder() casts the bridge state to a commit
> state, which can cause out-of-bounds memory access when dereferencing the
> state arrays.
The atomic_enable hook in this kernel tree (include/drm/drm_bridge.h:339) takes a struct drm_atomic_commit *, while drm_atomic_get_new_connector_for_encoder() expects a const struct drm_atomic_commit *; therefore, the usage is correct, type-safe, and does not require any cast.
> 
> [ ... ]
> > +static const struct drm_bridge_funcs lt9611c_bridge_funcs = {
> > +	.attach = lt9611c_bridge_attach,
> > +	.detect = lt9611c_bridge_detect,
> > +	.edid_read = lt9611c_bridge_edid_read,
> > +	.atomic_enable = lt9611c_bridge_atomic_enable,
> > +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> 
> [Severity: Medium]
> Is an atomic_disable hook needed here to properly power down the bridge?
> 
> The driver implements atomic_enable to set up video timings and dual DSI
> ports, but lacks a corresponding atomic_disable. During display blanking
> or system DPMS off, the hardware might remain active, wasting power or
> potentially locking up when the upstream DSI host stops its clock.
> 
> > +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> > +	.atomic_create_state = drm_atomic_helper_bridge_create_state,
>
The LT9611C bridge does not require an atomic_disable hook for correct operation. The bridge MCU firmware manages its own state and automatically enters a low-power idle state when the DSI input clock is removed, i.e. when the upstream DSI host stops transmitting. Explicit power-down via an MCU command is therefore unnecessary and would require an additional MCU command sequence that could potentially race with DSI host shutdown.

System-level power management is handled by lt9611c_bridge_suspend(), which disables the regulators and IRQ, while display blanking/DPMS is naturally handled by the upstream DSI host stopping its output.

If a future use case requires explicit bridge shutdown between mode transitions, an atomic_disable hook can be added at that time. 
> [Severity: Critical]
> Does this compile against the current drm_bridge_funcs definition?
> 
> The struct drm_bridge_funcs does not contain an atomic_create_state member,
> and the assigned helper drm_atomic_helper_bridge_create_state does not exist.
> The correct hook for resetting bridge state is atomic_reset, pointing to
> drm_atomic_helper_bridge_reset. Without a valid reset hook, atomic state
> allocation for the bridge will fail.
> 
> [ ... ]
atomic_create_state is a valid member of struct drm_bridge_funcs in this kernel (see include/drm/drm_bridge.h:507), and drm_atomic_helper_bridge_create_state is the corresponding helper (see drivers/gpu/drm/drm_atomic_state_helper.c:909). This pattern is already used by other drivers in the same tree, such as chipone-icn6211.c. The atomic_reset hook you mentioned belongs to the older API; this driver correctly uses the newer atomic_create_state interface.
> > +static ssize_t firmware_store(struct device *dev, struct device_attribute *attr,
> > +				      const char *buf, size_t len)
> > +{
> > +	struct lt9611c *lt9611c = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	dev_warn(dev, "starting firmware upgrade — display will be disrupted\n");
> > +
> > +	ret = lt9611c_firmware_upgrade(lt9611c);
> 
> [Severity: High]
> Can lt9611c be NULL here if the sysfs file is accessed before probe completes?
> 
> The sysfs group is registered via lt9611c_driver.driver.dev_groups, which
> means the files are created by the driver core before probe runs. If userspace
> accesses this before i2c_set_clientdata() is called, dev_get_drvdata(dev)
> will return NULL, causing an immediate crash when it is passed to
> lt9611c_firmware_upgrade().
> 
Will fix it
> [ ... ]
> > +static ssize_t firmware_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	struct lt9611c *lt9611c = dev_get_drvdata(dev);
> > +
> > +	return sysfs_emit(buf, "0x%04x\n", READ_ONCE(lt9611c->fw_version));
> > +}
> 
> [Severity: High]
> Similar to firmware_store, this will dereference a NULL lt9611c pointer if
> the sysfs attribute is read before the client data is set in probe, or if
> probe fails.
> 
Will fix it
> [ ... ]
> > +	lt9611c->bridge.of_node = client->dev.of_node;
> > +	lt9611c->bridge.ops = DRM_BRIDGE_OP_DETECT |
> > +			DRM_BRIDGE_OP_EDID |
> > +			DRM_BRIDGE_OP_HPD |
> > +			DRM_BRIDGE_OP_HDMI |
> > +			DRM_BRIDGE_OP_HDMI_AUDIO;
> > +	lt9611c->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
> 
> [Severity: High]
> Since this driver sets the DRM_BRIDGE_OP_HDMI flag, does it also need to
> initialize supported_hdmi_ver, supported_formats, and max_bpc?
> 
> When DRM_BRIDGE_OP_HDMI is set, leaving these uninitialized (zero) causes
> drm_bridge_add() to log a warning for an unknown HDMI version. The HDMI state
> helpers will also reject display modes because no valid color formats or
> depths are advertised, which prevents display modesetting.
The driver works correctly without these fields for the following reasons:

supported_hdmi_ver - leaving this as HDMI_VERSION_UNKNOWN (0) only results in a DRM_WARN from drm_bridge_add() (drivers/gpu/drm/drm_bridge.c:464) and does not affect functionality. The only consequence is that ycbcr_420_allowed is evaluated as false, which is appropriate for this device since the LT9611C family does not support YCbCr 4:2:0 input.

supported_formats - leaving this field unset (0) also results in ycbcr_420_allowed = false. Display mode filtering is based on EDID-reported sink capabilities and does not directly depend on supported_formats. RGB modes are therefore unaffected.

max_bpc - leaving this at 0 effectively disables deep-color support, which is acceptable because the LT9611C firmware does not currently expose any mechanism for deep-color negotiation.

These fields can be populated in a follow-up once the hardware capabilities have been fully characterized, for example, whether the MCU firmware supports YCbCr output formats or deep-color modes. Until then, leaving them unset is preferable to advertising capabilities that may not actually be supported.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261008-lt9611c-v7-v17-0-1e8f5f2b2f19@oss.qualcomm.com?part=2
