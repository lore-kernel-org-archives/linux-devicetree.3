Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E12741D62A
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 10:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234041; cv=none; b=kppmm2A9T6HBsrWYFhp4OW8DuIhwC5dlhMOdqlEoVb5nwuZrL4V4h4WUPoFLXIRR6kiy/gdB/Crrp3RALbw6muUbMMXyKdfgEs40ElVl9/6/Y+0TxEDiSNdAzMlzBme0YkLVo7FImLOJVprSl5RcpOuXi0UrxWPlfYOdHJFagNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234041; c=relaxed/simple;
	bh=AWPu1QYh/YkbC4gLDMzFOq+HLdgSiX43SmK40xk8A6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWBb8d1EUzUz0y2epw6q2ZnhQpYHHtDN9RtTQFQ2mUsYJlTLNInVXriEfQQYKPB5QqooHiMmwG41nXCnydApwM09dR+iBPS3MJFyv9cUzHJZii21Rd4QZ1a5tT0AoQE1N9LcpeKT13kLicEdIKEx/6+O9wtpSymulDiRrY0kne0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUG0hYoc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O6Dcz0CV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YUG0hYoc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O6Dcz0CV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82n9X2309785
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 10:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KLZ5WSf9P35tXLsEc25HzV/wI2h837sZFl1AcAxf2gA=; b=YUG0hYoc1LFSM5AZ
	L/UFDaMDb3Tq1qzfxpGmtKiLfKNPOiva0SmtzAyPkf9b87d7N6mUngzZ0DCJvj55
	G2DyoKfly36fRrjRCa92hE6Bx93F+z+8qEJBmbOujVtEYhHJf8LDp3O52s9S1F0+
	l/RGibWNeCTXv7EmeU+dVCVk/t7OWSJqBFtEK+ltYcQ1yxxxODAkmdkT83vZUE4G
	02Z98EVC8Ig8QILCzRKbZ3QmaDZO2Ukpipyk63A7JaDchkMi2SZh80A3SNMmQnJg
	p29rvQ3oEcxdfeb0XHHpteA/Io/t9Jm/7qfpSfil9hXvdWy3muAefv+dkqzNLEhO
	V0e+LQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fphh7j88d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 10:20:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d137a68so75825001cf.3
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 03:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785234039; x=1785838839; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KLZ5WSf9P35tXLsEc25HzV/wI2h837sZFl1AcAxf2gA=;
        b=O6Dcz0CVi5SJFKZRHh/4NZumzcLgXiX6U/q8Fp3dLG4Eb81ChbAo93JmIEo/UPVoWH
         nBDNuGGrS/BnBx2CbNqN3O84QcJwzNMLj7PPjsdMbmIm4XhpKMbPmxd+xqKeN/CiH2KB
         ynLCxgJsFuA+pUW81Gfrj6lxqYHGcekJbEESLAlPUQ4md2ekoTukezXp/etDWKrs6fIL
         pRoQKxBLCFInnYWG7SAP/9ckCVnbOoxg+WLmP44gu/3bT0FfFTPUfWHCfNEVSE5yasjx
         n/SAW4TE44J1F5SwOk7kX8tHkCwac45tYnB4wDYNWjZvluX+VK08zNIunR6rXV8AINzn
         inbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234039; x=1785838839;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KLZ5WSf9P35tXLsEc25HzV/wI2h837sZFl1AcAxf2gA=;
        b=RJAgtrIDiML0vTH5W5hJ9irW/qEbTeel6sRJcfoI88IH7qJGWthfXw4AMc97PddP2t
         YWFm8iaivHEN9lU1GO2kH5mUUPxPGvinb6/+1TVEz81UE6EB7nRbUiER3aDwMuuYJOtd
         E5MPxS5YyRyEt+zcBpI+dua1PSpDdWi5MadDAbsr/bsmS4SvXyL9KNs/F5xUuCCmKyYZ
         GqjlUSQwl5JYq8Nf2PBRPg/0ihclPbgqJ1a0VVqY8TARPKCh8I4ltR8bATb2TRgJJeqj
         ueQ6poP0pFEPTvLSU8cesnWmGaJgj2iv6cMuB00md+9YMROWjwhnWH0nJKiMQTpwAmHo
         Bnow==
X-Forwarded-Encrypted: i=1; AHgh+RpGlRgOsfinwmeMNBPCuyAFQQvpovA0qUzXMYt+IElWoOcLOYntilPTCI7o3MKBDK3g4iJnXihZcp2H@vger.kernel.org
X-Gm-Message-State: AOJu0YxLp2eDXTbFivWsitpWr7WjmUbjV8hdudTYUhFCxllnREAJ2zBf
	nTz+ZQmLyK1Jdu1ajj+vcux4ERA/qPd4KPNm+qIaN/c7QGVkX8nPHI823e7xpZZeGXjSVSfThc+
	V/O4ryhPCNX0zqqAe16g5Xn2ddsZCVeGWub3zEHEQL2sthKfcdiTFtq8dlss6L/BP
X-Gm-Gg: AR+sD11/ER89Mm1kze+eabPIFLKKieU3TFZsJoeGotgmjHy82Mqxk0JSPk6wslN8qH/
	rFXYbgCXqcqpL7HruJVfTMDG4H1G1sGM0EGIZnwyBrSdoEstXBe6z1VH2iGnDeLRlRhhxbhrxLb
	gt6/SClsp/R6h2dYM/KQ9SJnkbAbUB3V+Mdqh52MJfgapXW8rOMuc++1U8fnjNwtqOKZ038xCpm
	b3V5X8HzN3P0IH9BvP6lWA5KBE4U7aHrfQjp92Osw1Y6c9jhTxLHP39jPnBfzPUyFsTLh6KCXQ5
	/3XGvjQ2hXjsYWOHEhjpx87NXWhvJ5brs8m3HA0fQgc658u90ftvymRgjxcBpc3EcO34PK3e5If
	ZVEb2ntnyNSZSEb7Vwda5hAJ5Eo8xhKl6aXTwUN9fhG7cp5mtxoMbdWgYdR7PF5x/fViitoEkkd
	GQKa/A9XeJjS1qng==
X-Received: by 2002:ac8:7d81:0:b0:528:2e9:c0e8 with SMTP id d75a77b69052e-529d7260239mr12230241cf.79.1785234038490;
        Tue, 28 Jul 2026 03:20:38 -0700 (PDT)
X-Received: by 2002:ac8:7d81:0:b0:528:2e9:c0e8 with SMTP id d75a77b69052e-529d7260239mr12216511cf.79.1785234005745;
        Tue, 28 Jul 2026 03:20:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be0806d8sm1946188e87.22.2026.07.28.03.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:20:04 -0700 (PDT)
Date: Tue, 28 Jul 2026 13:20:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sunyun Yang <syyang@lontium.com>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v17 2/2] drm/bridge: Add Lontium LT7911EXC eDP to MIPI
 DSI bridge
Message-ID: <kp6eg7dierl5iqkr26e3uflyshjxes4kxrzgcw45etqfzop7d2@os3chspox42p>
References: <20260715015438.2770155-1-syyang@lontium.com>
 <20260715015438.2770155-3-syyang@lontium.com>
 <20260715020616.B73771F000E9@smtp.kernel.org>
 <CAFQXuNZdwNxbAsnK7P4zs0eZnm4pN+6kKkO-aP6Q_higPEW-yg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFQXuNZdwNxbAsnK7P4zs0eZnm4pN+6kKkO-aP6Q_higPEW-yg@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5MCBTYWx0ZWRfX8DX0nZmqsko6
 LP55pKj9j8oFDTony42Q+AX6OSQx0BHFGIkDOXumCM/fXpWfET6OETvzdaSpCP++0MhStH54b8D
 l1Dkhbz3hH14OMZbRb0IYVAPu0U4bqsXb9s+bo7WIVxnyCHKR00CoVD3qR22sa0PZKCezM3l6M0
 AiKCGsXSLS7Ungnv0vwAF3NlsG3G2SFUdRRktq4eTuQmkutNOIdTUgIZ/BBhqV5P39U0Zx/oGtn
 B94mX+stbyHUFkBGB3v2Qc0thDAmAoUWYkfTkMxJwDSgV9B5TkDptIU9YuvdjmsRtSsBDFcD79R
 WrQEqmgWLcf4d+1eRf4DIWmCb9bxnRKB10Aq1j0LeJ7FD3SX8JSW7RjhriSodQUToT4keSXa+R8
 e2CESSOWjm/lLg6R+um/iQwoGZdZc7AG2C8IqiEUoF2M6TAVTQfk6WvTx1UFjPVHh3ZxOUFazd5
 3I38nggKcUrsU9lvnEA==
X-Proofpoint-ORIG-GUID: KMaW-ePE4o6AhRaR4oxgVQIKLteWsvaP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5MCBTYWx0ZWRfX77U0mdPUgbdn
 +FQwTha7KFw8aN/2MoxYusjgtNNMZ1Twnc5qgIFvNToBZ8tX+nLLOBM5xFzgl93xxmYNYwO+wFD
 WQToTy0jrhM3B9Q8+NTLSksqOUsKsTk=
X-Proofpoint-GUID: KMaW-ePE4o6AhRaR4oxgVQIKLteWsvaP
X-Authority-Analysis: v=2.4 cv=b+6CJNGx c=1 sm=1 tr=0 ts=6a688277 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=tlYR4POETLUKK-67TRcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280090

On Wed, Jul 15, 2026 at 03:42:55PM +0800, Sunyun Yang wrote:
> <sashiko-bot@kernel.org> 于2026年7月15日周三 10:06写道：
> >
> > Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> > - [High] Missing cleanup of `output_bridge` in `mipi_dsi_host_detach` prevents DSI device rebinds and causes use-after-free.
> 
> Intentional design, consistent with cdns-dsi-core.c cdns_dsi_detach()
> (lines 1082-1091) which does not clear output->dev. Clearing
> output_bridge would allow re-attach, causing devm_drm_of_get_bridge()
> to allocate new devres without freeing the previous one, resulting in
> a real memory leak. The DRM bridge framework does not support dynamic
> bridge chain reconfiguration. No use-after-free: the -EBUSY guard
> returns before dereferencing output_bridge, and bridge_attach is not
> called by the SoC encoder after drm_bridge_remove().

Luca is working on supporting (more) dynamic bridge chains. Don't make
his work harder. So far:


- Let the DSI sync be detached and then reattached. There might be
  reasons for that (e.g. big DSI panels which use two DSI hosts). Ignore
  devm_drm_of_get_bridge for now (though I thought Luca has provided a
  better API for that).

- Use next_bridge provided to you by the framework.

> 
> > - [High] Sysfs attribute `lt7911exc_firmware` is accessible before the driver has finished initialization in `probe`, leading to a kernel panic.
> 
> False positive. The driver core creates dev_groups sysfs attributes
> AFTER probe() returns successfully. In drivers/base/dd.c
> really_probe(), call_driver_probe() (line 706) executes before
> device_add_groups(dev, drv->dev_groups) (line 725). By the time the
> sysfs file is visible to userspace, all mutexes, workqueue, and regmap
> are fully initialized. There is no window where userspace can access
> the sysfs attribute before initialization completes.
> 
> > - [High] Asynchronous firmware upgrade worker accesses `bridge.dev` without holding a reference, causing a Use-After-Free if the DRM display controller unbinds.
> 
> This is a known DRM bridge framework limitation, not specific to this
> driver. drm_bridge_remove() does not clear bridge.dev, so all bridge
> drivers calling drm_kms_helper_hotplug_event() share this risk. A
> proper fix requires framework-level bridge-to-drm_device lifetime
> tracking. Triggering requires root sysfs access to start firmware
> upgrade while simultaneously unbinding the DRM master driver — an
> administrator operation outside normal usage.

I'd say, I don't have strong opinion here.

> 
> > - [Medium] Driver illegitimately mutates the state of a downstream bridge object by explicitly modifying `pre_enable_prev_first`.
> 
> Hardware constraint. The DSI output stream (register 0xe0b0) must be
> enabled after the panel is powered on. The override is safe because
> transfer() is a stub — panel DCS commands are silently discarded and
> panel initialization is handled entirely by the chip's internal
> firmware. The panel driver's prepare_prev_first preference is
> therefore irrelevant for this chip. The comment above the assignment
> documents this rationale.

Commented in the driver review.

> 
> > - [Low] The `lt7911exc->removed` flag is read without a lock or memory barrier in the firmware upgrade work, leading to a data race.
> 
> Valid.

Should be fixed.


-- 
With best wishes
Dmitry
