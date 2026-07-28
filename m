Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244B229C328
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 01:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785201783; cv=none; b=K30OJH9IC1h5f5ZaCU3BhyEBN/TRKkNL+zDgaBppYUF6CHxreZ5GKb+KTgLTtBsaLp+36PyJ5CGUK71+92O+sSB6qUCAdCgNzQ+hfviy4rAWdOgU74VKVlSktFheJdRs9aFPtmJ+CCUES+stKNCt9sB4Z+d1FrmASZyoyqHi1iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785201783; c=relaxed/simple;
	bh=LpZS3rhj9NJKFvIJI7FN8hPjP3xXKbk+YEgOZBrftlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NiBNA9mTx2Xvac2NDavHbFVPSTZIP4gZIoD4jkgwxHwjbt8vYCvttzF90R9aNItyyia4fn295StXxaQnmqXRrbKHlZ7S7FiCCEjeszx86ShmWzLuDFRQtIusW91uazJkAWPsDjtOSg6CbHqjqrHAkQgFLFp7vhXJ/EBwAe8h+Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lmch1zbP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LSjr8f62; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lmch1zbP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LSjr8f62"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S0kvRx1048214
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 01:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZQI+wLteTtR5K20lhSYOSjP3IWn79oesMFQlZQs3Zc=; b=Lmch1zbPFY1am8M3
	KduG2pg04nxFkKUU0oufCEKjeho85zjKY8V9ykNVfoTP5SOfynfoLFrmk+nno4Oc
	3kZ9Jnzt/bC0kZ5ka7W25pcHunu0dqn4MJwPy+Vtx+3txwoWaxSC5cp3Lt+A/myy
	m4YsMWMlet7qSAYvsHKcbcnoH5Sk4DEXVxk8qwkEFzpnWrwo0O+D60swqHm+R61A
	BlbmzwkV2te8T63Q0htzpvaIHMTVcb/tBJJrT4PSW1i59EP5vGnwoR39t84yJSCl
	aFaG+Y/XcqeJtDQFpoZXfUBiDRz6O56nMwx0Tazb+npdqoW70zH2YtkBObEkXcGf
	l+P9mA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp3v2m0wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 01:23:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-526da7e3c9dso36889831cf.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785201780; x=1785806580; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WZQI+wLteTtR5K20lhSYOSjP3IWn79oesMFQlZQs3Zc=;
        b=LSjr8f625pw15AsUohwHpmGzpNvyWSmS6yLoXaS09TwfPryBJkQvsfKTcVIJ5HKv2c
         t6dItZZMjgzfqFD13TW3q5VOj0r+fCgJISKuK2/8MGmQNBpM1I3szjivbw3xHDWgVNiL
         Bp5dwmDjB501luTs4Jj621L45W7PyRxn7DvNYfu2R7PShXbKe5Ir7Djd23yK7HnXn/X/
         py7B509/LA9Il9ONFw5DvtqYni4Abx7QLl7LM3bbOWmQnxmlnk6vHdi4jrdyx2BP5Vl3
         McySiOAH6+HBYCfnhQR4zh26QvW2/2K9wzP+0HqTiwskC8xzrJShdq77S7b+/xDz8QoA
         f3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785201780; x=1785806580;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WZQI+wLteTtR5K20lhSYOSjP3IWn79oesMFQlZQs3Zc=;
        b=ILbdzYMnnERXwT/cNp8jnxSvvVcG15o7wRhX3Mc78mMddrdNv8lCvmHGTk1jWOPFnQ
         +aoTw82/UY9rX7xaKQJqDTSSufXXb5Y9Y+BwsaAl2wBLeEhuhbK0Ph2vbymK7hxnpIWN
         SgCR7cB527cgXkvV6Rwl3vXK9PK8RR0fgrMg298fmQPjY7OaIeOFfvX7+26zFvUHS9sR
         vXwaTilJ4sC5SjddhFlJt01Ou8/h+7rLGttR3Dsst0ye16Jhk5APZFbxv2iRwfSadxfu
         JIPfX2co2104/sarT1ITJcN7Brt7NE9IzyKJEL2YVeCOVGfQ20zvaSlBVoFB6WkxRsXv
         TENQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpiyuhya7Y73C6KPeBix+84e7p3O7Gm/hCetmQQul9qpCo537AM3OXVyIcOCNa3spVV8lAIMIFrq03K@vger.kernel.org
X-Gm-Message-State: AOJu0YyImE2dEz3F1ViDOaOC+YHYVZt8edqBy/K4aZ+AnhhV3sjhxGpA
	bvtk9X4YcnBiuxpTccuIWRLhvCVmfieTtn+od1nig4UBJoF3dwW013W9xTzIgrI4iAIVlkMp0jA
	Yl3VqQ9B3WP4GVX3SHRJtBSFazNkoOeqrFm0UrYsxMEXnDT/qyG6i14shFQtut204
X-Gm-Gg: AR+sD115SNrZjco85lg4Y4nsb8C1zp+VX9cEfbj6pioWx2vVn5blA/OOJ+rU2JBzT0X
	ZIyjrppmyANvGHeix/uW0ZsSCQIiLDqg++JftOXqdU1EhGwFdf+nRGxRLS2F1KoPFW1eMxfUdJf
	8/C/ra4unGuYZpp0pftFMvjQ8sSamfw5NR19tE8jhhiK6YlEKDoQTCJ7SM6uLHktmLfkCyCb8xG
	DtleANeoYNVwsbAfxnDDCayoWWym+O7QjbuNzbkZT0x8qJRUsGHOGZmfN2Kxi1OEta/tz1QEACy
	ADneFrs7DA7rFIKKtHgF2286UaUfeuId1qE7h9/R88h3HfExoR4kVu2bEK6X06DNx0OOjPmc2FS
	JW/B32H8n7JlZHMwgCO90qbWn6eKbxh4RJv6rQMXcFcmnqTc+rsdSxY7e4Om3YcLfLM1TpUl4KU
	s5DG4kM9QUmkA3yA==
X-Received: by 2002:a05:622a:1443:b0:528:3123:6142 with SMTP id d75a77b69052e-529d713645fmr2594061cf.70.1785201779815;
        Mon, 27 Jul 2026 18:22:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1443:b0:528:3123:6142 with SMTP id d75a77b69052e-529d713645fmr2593621cf.70.1785201779110;
        Mon, 27 Jul 2026 18:22:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1e7330sm1742959e87.62.2026.07.27.18.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 18:22:56 -0700 (PDT)
Date: Tue, 28 Jul 2026 04:22:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: syyang@lontium.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org,
        maarten.lankhorst@linux.intel.com, rfoss@kernel.org,
        mripard@kernel.org, Laurent.pinchart@ideasonboard.com,
        tzimmermann@suse.de, jonas@kwiboo.se, jernej.skrabec@gmail.com,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, xmzhu@lontium.corp-partner.google.com,
        xmzhu@lontium.com, rlyu@lontium.com, xbpeng@lontium.com,
        qdchen@lontium.com, llzhang@lontium.com, hfxia@lontium.com
Subject: Re: [PATCH v17 0/2] Add Lontium LT7911EXC eDP to MIPI DSI bridge
Message-ID: <tfkg2cjn4uznzy57rpkqwan26sduqzptnb7uwsucfboz37wz7k@rukuu36mozif>
References: <20260715015438.2770155-1-syyang@lontium.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715015438.2770155-1-syyang@lontium.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDAxMCBTYWx0ZWRfX6z5Je6xaViTH
 e2YAojePGGKWN1oLcw1jQ9eFHK6VuYoQ/eL9kT8t7scm5PMp4zwpWMY3x4FmnVn/pGDzP7/HCTw
 D0bvBMto7l/zCm7Ug6WaaZDD8KCssuE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDAxMCBTYWx0ZWRfX/Wi3M7kRXJ0Q
 47PMo5OVHeIWAoYHYh5ZKjmPU1h82WjTydVXRp8LrZY0TzhZtWo8w5FvpbovWUbi4ucwYcBSNRK
 an56I8sHCFo2XEdF7GeAx3pGyjSqM+isio1I5kbtJCUXayj7W9dpxySbxPqhpCB7ncNUYpML6AC
 n9tLtLcTtJVWtrgU56LF41ixMHVIPoCHyV1DnnlhPrydA1y9h6T7vjcFH+jM94MP4b0U9K8HT70
 Fxu4/Ha8+iz3o1/HZ478+/VQNACDcFeoAqRtTl8iv9H2nAmhjBqLRFxtSeBCeKV5woLodzHo82k
 hZIe48gCsLbxDoF4k8/T4wkdmQrAZDp7WGsbTD9olRTmBBIa9KXXt9+AUpvCx+EgKem34XBAutJ
 H0PEYQa0aj4vbsRW2RGMSWAStgnzQ6fgvvbcJD/QNCStyhdzI25jeptTAkvmee5YgFJWDcqs0KM
 s4R3jmBSF8PZVTpMQDQ==
X-Proofpoint-GUID: F63zfQD_eu3WL3aeMQ1A5FRKwAEJ4U5_
X-Authority-Analysis: v=2.4 cv=KJ9qylFo c=1 sm=1 tr=0 ts=6a680474 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=Kz8-B0t5AAAA:8 a=EUspDBNiAAAA:8 a=QNBHPFAzgITvUoMTdvsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-ORIG-GUID: F63zfQD_eu3WL3aeMQ1A5FRKwAEJ4U5_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_07,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280010

On Wed, Jul 15, 2026 at 09:54:36AM +0800, syyang@lontium.com wrote:
> From: Sunyun Yang <syyang@lontium.com>
> 
> The LT7911EXC is an I2C-controlled bridge that receives eDP1.4
> and output mipi dsi. This series introduces:
> 
> - A device tree binding YAML file describing the hardware
> - A new DRM bridge driver implementing the basic functionality
> 
> Signed-off-by: Sunyun Yang<syyang@lontium.com>
> ---
> Change in v17:
> - dt-binding:
> - drm/bridge:
>  1. [High] devm leak and list corruption on panel rebind                                                  [sashiko-bot]
>            False positive. The -EBUSY guard at the top of host_attach() (line 527) rejects re-attach
>            when output_bridge is already set, so neither devm_drm_of_get_bridge() nor drm_bridge_add()
>            is reached on panel rebind.

This is not a changelog. Don't mix replies, with the changes in the
patches.

>  2. [High] Dangling bridge.dev pointer                                                                     [sashiko-bot]
>            DRM bridge framework limitation. drm_bridge_remove() does not clear bridge.dev. All bridge
>            drivers using drm_kms_helper_hotplug_event() share this risk. Requires framework-level fix.
>            Triggering needs root sysfs access plus DRM driver unload simultaneously.
>  3. [Medium] output_bridge not cleared prevents re-attach                                                   [sashiko-bot]
>            Intentional. Same as cdns-dsi-core.c cdns_dsi_detach(). Clearing would
>            cause devm_drm_of_get_bridge() to leak on re-attach. DRM bridge framework does not support
>            dynamic chain reconfiguration. Panel rebind requires host driver reload.
>  4. [Low] Mutating downstream bridge's pre_enable_prev_first                                                [sashiko-bot]
>           Hardware constraint. DSI stream (0xe0b0) must be enabled after panel power-on. Safe because
>           transfer() is a stub — DCS commands are discarded, panel init is done by chip firmware.
>           Comment documents the rationale.
>  5. [Low] Unsynchronized removed read                                                                    [sashiko-bot]
>           Fixed. Now protected by ocm_lock (lines 372-375).
> - Link to v16: https://lore.kernel.org/all/20260714105828.2763677-1-syyang@lontium.com/
> 
> Change in v16:
> - dt-binding:
>  1. [Low] Use standard generic DT node name
>           Renamed mipi-bridge@41 to bridge@41 per Devicetree spec for standard generic names.                 [sashiko-bot]
> - drm/bridge:
>  1. [High] Prevent devm_drm_of_get_bridge() devres leak in host_attach
>            Added -EBUSY guard to reject re-attach, preventing devm memory leak and use-after-free on          [sashiko-bot]
>            panel unbind/rebind.
>  2. [High] Fix double drm_bridge_remove() in lt7911exc_remove()                                               [sashiko-bot]
>            Removed the flawed list_empty() check that caused a second drm_bridge_remove() call,
>            leading to double mutex_destroy() and use-after-free.
>  3. [High] Clear upgrade flag before hotplug event                                                            [sashiko-bot]
>            Reordered to clear upgrade = false before drm_kms_helper_hotplug_event(), preventing modesets from
>            silently skipping hardware enable (0xe0b0) and causing black screen.
>  4. [Medium] Document pre_enable_prev_first override                                                           [sashiko-bot]
>              Added comment explaining the hardware constraint: DSI stream must be enabled after panel power-on.
>              The override is safe because transfer() is a stub — DCS commands are discarded and panel init is
>              handled by chip firmware.
>  5. [Medium] Guard hotplug with removed flag                                                                    [sashiko-bot]
>              Added !lt7911exc->removed check to prevent hotplug events during device removal.
>  6. [High] Use local variable for error handling                                                                [sashiko-bot]
>            Introduced local bridge variable for IS_ERR()/PTR_ERR() checks, ensuring output_bridge stays NULL on
>            failure so -EPROBE_DEFER retries are not blocked by the -EBUSY guard.
> - Link to v15: https://lore.kernel.org/all/20260714064822.2753289-1-syyang@lontium.com/
> 
> Change in v15:
> - dt-binding:
> - drm/bridge:
>  1. Remove the Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> tag.
>  2. Adjust the design architecture of the chip's MIPI host and bridge.
>  3. remove devm_drm_panel_bridge_add_typed and drm_of_find_panel_or_bridge
>  4. Use REGCACHE_NONE to avoid cache inconsistency due to internal MCU modifying registers asynchronously
> - Link to v14: https://lore.kernel.org/all/20260529112928.873766-1-syyang@lontium.com/
> 
> Change in v14:
> - dt-binding:
> - drm/bridge:
>  1. [High] AB-BA / self-deadlock between the bridge's ocm_lock and DRM modeset                             [sashiko-bot]
>     locks during hotplug notification. - fixed
>  2. [High] Freeing the panel bridge in lt7911exc_dsi_host_detach while it is still
>     attached to the DRM bridge chain causes a Use-After-Free. - fixed
> - Link to v13: https://lore.kernel.org/lkml/20260529094547.869919-1-syyang@lontium.com/
> 
> Change in v13:
> - dt-binding:
> - drm/bridge:
>  1. [High] Dangling pointer created during MIPI DSI host detach if the downstream                           [sashiko-bot]
>            device is a bridge rather than a panel. - fixed
>  2. [High] Firmware upgrade CRC mismatch due to unpadded partial page writes.
>            - hardware erases the entire flash area into a default state of 0xff. When doing
>              a partial page short write，the total unwritten residual bytes on the physical
>              flash sector inherently retain their 0xff state. Therefore, no modification is required.
>  3. [High] Firmware upgrade workqueue accesses `bridge.dev` without ensuring the DRM device is alive,
>            leading to a Use-After-Free. - fixed
>  4. [High] Regmap page selector cache desynchronization after device reset causes firmware upgrade
>            commands to be routed to the wrong register page. - fixed
> - Link to v12: https://lore.kernel.org/lkml/20260525010545.9470-1-syyang@lontium.com/
> 
> Change in v12:
> - dt-binding:
> - drm/bridge:
>  1. Move the cleanup work of drm_panel_bridge_remove() forward into lt7911exc_dsi_host_detach().                        [sashiko-bot]
>  2. Do not hold any lock during lt7911exc_reset().
> - Link to v11: https://lore.kernel.org/lkml/20260522015735.2833-1-syyang@lontium.com/
> 
> Change in v11:
> - dt-binding:
> - drm/bridge:
>  1. Removed Reviewed-by, we would appreciate it if the maintainer could help review this.
>  2. Use devm_gpiod_get(,, GPIOD_OUT_HIGH) to fix the reset GPIO backpowering issue.                                       [sashiko-bot]
>  3. Fixed Use-After-Free vulnerability due to dynamic DRM bridge removal in DSI detach callback.
>  4. Fixed Use-After-Free of regmap during DRM teardown because firmware upgrade worker defeats removal safeguard.
>  5. Fixed firmware upgrade performs a hardware reset, causing silent loss of DRM state and a blank screen.
>  6. Use of kmalloc for a 64KB software buffer is susceptible to memory fragmentation failures - Fix by using kvmalloc
>  7. Use the 'lt7911exc->ocm_lock' mutex and the 'lt7911exc->upgrade' flag to resolve the race condition between
>     DRM atomic modeset and firmware upgrade.
>  8. Use the 'lt7911exc->upgrade_lock' mutex to prevent redundant upgrades.
>  9. Use the 'lt7911exc->removed' flag to prevent the driver from being triggered to upgrade during the unload process.
> - Link to v10: https://lore.kernel.org/lkml/20260519135816.26996-1-syyang@lontium.com/
> 
> Change in v10:
> - dt-binding:
> - drm/bridge:
>  1. Fixed the firmware upgrade error paths to always clear the upgrade
>     flag before returning, including firmware size validation failures
>     and allocation failures.                                                                [sashiko-bot]
>  2. Added proper locking in lt7911exc_atomic_pre_enable() and
>     lt7911exc_atomic_post_disable() to serialize register accesses with the
>     firmware upgrade flow and avoid concurrent I2C transactions.
>  3. Added an exclusivity check in lt7911exc_dsi_host_attach() to reject multiple
>     downstream attachments and prevent repeated drm_bridge_add() calls and panel bridge leaks.
>  4. Reworked lt7911exc_firmware_store() to use mutex_trylock() so concurrent sysfs writers
>     immediately return -EBUSY instead of blocking behind an active firmware upgrade.
>  5. Updated the remove path to prevent new firmware upgrade work from being queued after
>     device removal by setting the upgrade state before cancelling the worker.
> - Link to v9: https://lore.kernel.org/lkml/20260519105019.22622-1-syyang@lontium.com/
> 
> Change in v9:
> - dt-binding:
> - drm/bridge:
>  1. DSI transfer callback returns success for reads without populating                        [sashiko-bot]
>     the receive buffer, leaking uninitialized memory. - fixed it by
>     implementing  a strict whitelist mechanism.
>  2. DSI transfer callback polls for eDP video readiness before the
>     upstream encoder is enabled, guaranteeing a timeout. - removed
>  3. The driver attempts I2C transfers while the hardware is held in
>     physical reset. - fixed
>  4. Missing DRM_MIPI_DSI Kconfig dependency causes linker errors. - fixed
>  5. request_firmware is called while holding the hardware lock and
>     halting the MCU, risking a system pipeline stall. - fixed
>  6. Sleeping functions are called from atomic context in the DRM bridge callbacks. - fixed
>  7. lt7911exc_dsi_host_transfer bypasses the required MCU hardware halt sequence. - fixed by
>     internal firmware controls the panel initialization sequence and handles all MIPI
>     DSI command transmission.
> - Link to v8: https://lore.kernel.org/lkml/20260515080934.9870-1-syyang@lontium.com/
> 
> Change in v8:
> - dt-binding:
> - drm/bridge:
>  1. Protect firmware upgrade and DRM bridge callback paths with ocm_lock.          [sashiko-bot]
>  2. Remove the hardware reset from the remove callback, and ensure that
>     all hardware reset operations are protected by ocm_lock.
>  3. crc reconstruction explicitly casts each byte to u32 before shifting
>  4. The display configuration is handled by the firmware, and the MIPI
>     DSI host registration issue has been fixed.
>  5. The batch register read/write operations have already been updated
>     to include return value checking.
>  6. The dev_err_probe() used outside of probe context has been fixed.
> - Link to v7: https://lore.kernel.org/lkml/20260512064013.40066-1-syyang@lontium.com/
> 
> Change in v7:
> - dt-binding:
>  1. fix commit message typos(Receiver、signal)                            [sashiko-bot]
>  2. remove the ambiguity caused by "signal/dual".
> - drm/bridge:
>  1. using devm_regulator_get_enable avoids power leaks.                   [sashiko-bot]
>  2. set reset gpio is low after cutting off power in lt7911exc_remove function, avoid backpowering.
>  3. synchronous request_firmware() call cause a permanent probe failure if the driver is built-in,
>     probe executes before the root filesystem is mounted, which would cause this to fail with -ENOENT,
>     we have removed this functionality. Use trigger to upgrade.
>  4. add `depends on I2C` and `select REGMAP_I2C` in Kconfig.
>  5. add return value of `devm_drm_bridge_add()` in `probe()`.
>  6. add directly header files (linux/slab.h, linux/delay.h, linux/regulator/consumer.h)
> - Link to v6: https://lore.kernel.org/lkml/20260508134702.4713-1-syyang@lontium.com/
> 
> Change in v6:
> - dt-binding:
> - drm/bridge:
>  1. use #define FW_FILE  "Lontium/lt7911exc_fw.bin" to match linux-firmware
> - Link to v5: https://lore.kernel.org/lkml/20260506013153.2240-1-syyang@lontium.com/
> 
> Change in v5:
> - dt-binding:
> - drm/bridge:
>  1. Change "mipi" to "mipi dsi" in the commit message.     [Dmitry]
>  2. Change "eDP/MIPI" to "eDP/MIPI DSI" in Kconfig.
> - Link to v4: https://lore.kernel.org/lkml/20260430094612.3408174-1-syyang@lontium.com/
> 
> Change in v4:
> - dt-binding:
>  1. Fix the missing spaces on the "subject".             [Krzysztof]
>  2. Fix the error descriptions for port@0 and port@1.
> - drm/bridge:
> - Link to v3: https://lore.kernel.org/lkml/20260429040541.3404116-1-syyang@lontium.com/
> 
> Change in v3:
> - dt-binding:
> - drm/bridge:
>  1. already submit lt7911exc_fw.bin to linux-firmware.  [Dmitry]
>  2. remove lt7911exc_remove function.
>  3. drop  the "lontium, "  in lt7911exc_i2c_table.
> - Link to v2: https://lore.kernel.org/lkml/20260428063224.3316655-1-syyang@lontium.com/
> 
> Change in v2:
> - dt-binding:
>  1. reset pins use active low.                        [Dmitry]
> - drm/bridge:
>  1. use atomic_* callbacks.                           [Quentin]
>  2. fix the incorrect formatting and spaces.
>  3. add the required header files.                    [Dmitry]
>  4. remove "enabled" flag.
>  5. remove *fw from the lt7911exc struct.
>  6. .max_register and .range_max use actual range.
>  7. regulator use bulk interface.
>  8. use dev_err_probe, devm_mutex_init and devm_drm_bridge_add.
>  9. Replace GPL v2 with GPL.
> - Link to v1: https://lore.kernel.org/lkml/20260420023354.1192642-1-syyang@lontium.com/
> 
> ---
> Sunyun Yang (2):
>   dt-bindings: bridge: Add Lontium LT7911EXC eDP to MIPI DSI bridge
>   drm/bridge: Add Lontium LT7911EXC eDP to MIPI DSI bridge
> 
>  .../display/bridge/lontium,lt7911exc.yaml     |  89 ++
>  drivers/gpu/drm/bridge/Kconfig                |  17 +
>  drivers/gpu/drm/bridge/Makefile               |   1 +
>  drivers/gpu/drm/bridge/lontium-lt7911exc.c    | 787 ++++++++++++++++++
>  4 files changed, 894 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml
>  create mode 100644 drivers/gpu/drm/bridge/lontium-lt7911exc.c
> 
> --
> 2.34.1
> 

-- 
With best wishes
Dmitry
