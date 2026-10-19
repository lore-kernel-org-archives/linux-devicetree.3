Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79004E80BD
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415563; cv=none; b=h+dNQc1c95rw26rrEOYVD2lXrV0nnu+NchZDdUGWo3toK9aKYGpzLZB0odHyA9wFT8KlwqFwRNQ9zYtd82Q8LYQl1ZK5Gu9htjcjIHDco/wqoO85AFqKt/rZmCuGr2u8/ttBRuzTx43Q7XR7OK8lBbG/8bRNHMGhEvSjPgtahIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415563; c=relaxed/simple;
	bh=GvswLeoPMq9qUuYxNaLFi9EH86eoSCSL4PfQ/S5C3S8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WCXUn3GQs5tRYdkFRiymsSW6knYx8eSp+E8e32pTkBukjbLVzbkR90EPjUFgfLP+j3VDQU+Y15P7PlYQLt47eh41VLvSs/TPFm3BebxQbyylRsXYPFs4h1eoYdwApIal7EwfPNjsslmKd0+hDVu5V6e09ZosVrFy3MleEjSoGFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i9nUne6v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GicOWVTK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i9nUne6v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GicOWVTK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Yhip2688707
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/qNr5y4ZAaHaRtm/DLNxynk27BAss8MqyZxIcCw0oJY=; b=i9nUne6vhgE41aXf
	lSkrffUUfuRxkHp+gVA599Dd9cZ6xzZdCAQaOMZ9WHyyaXG6Ws602kjBjePooA2l
	Epg4wreDPVh2RFlOdHr3XDcSQ92z0Jf+0ibFsS0HUF2qnHGRaqF2Q+UnYfJ2BfBk
	kham9SHdLrcRxej7OsfBtZ8CXavt9x20hlnTwptzX3KBZWJp97VpmeRGOCyH4hJb
	GHyok9sQhrb+hNPHah+0QGlQNnPpit00diYem2TbNTclbQbJPdhn59CC3fA4uhlO
	E6tw77sEpXtXgDOxfy2dA10OiyyXIl/NcAAvWAHATKSZbiLiB2nxZ2OmWG3MV7F1
	ELq/4w==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn11fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:12:39 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c97957d83bso56936e0c.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 06:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792415559; x=1793020359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qNr5y4ZAaHaRtm/DLNxynk27BAss8MqyZxIcCw0oJY=;
        b=GicOWVTK8fmEkH56PzBamDYN7P+iHKnSkAhyOYmo5JLBjE/bu97IkD3IdIGVWqphyF
         RTbREIOYhSFWgfbJwv/TnSYscnOAvAhfDqD+7Ukr5B1OOBYh32aGGwy4ES/EJMXagcME
         0LiN4IckL5kABMPE7HIMqTKB22p3Xg0wT/9RVPEWwW2WO4FBo/xbJJeCiXYPN6qZBUJ6
         g8ZVjvnZkJgpv20Y8xooTF4NJiHh2xpboUrgNp5/I4nWrQR1PZuzJehxggYpwin2DIba
         HDiwt6UJSNHpp2JB63YqJUvsm9tikAqlc4/jXWXr/675vdFC7GPDBVXHdS/H9JSNDqxf
         qqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792415559; x=1793020359;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qNr5y4ZAaHaRtm/DLNxynk27BAss8MqyZxIcCw0oJY=;
        b=qhw51AWEeA4gYtNk+0Ll3WevAWNnnWa8uKWn89bFDwrxsC2bjCw7PDo2rqyCYMKnxF
         O71ajeeYTs6lPm1rngII1qPAXjespLYsy8cWvjlTCkJn8pg46aqctk1UCLSeV5WiI3JP
         mrSooEuLbh43um7im3eV0uasxmNY57o+mk/SXPBgjM9xJ5IKouTtioxPLYom5esCYAt4
         BKr1wQYiAH1wfs+4KHWZwQR9THKYOrtqbHnqAvVHbgasItD6hRqcZAPz0p+jAkGd/W7A
         E/hV3KHnzaVuYbbB7R4s/S+AeYOF9RoTsXm5zGIDsYmgTiWKzn1Akd2dhhO1ItCJYp5k
         tsDg==
X-Forwarded-Encrypted: i=1; AKwUvByx0Xe2Ydoc5nG0QpyynIsWjX5TWEnAUWcwm4HlapCzEhiE7t6amqTLf5xZMXrzcNYzxidi2VWqde/y@vger.kernel.org
X-Gm-Message-State: AFq9FYIDe2Gs9YA3UN984taX3oG6KySwPhVZ6tdnYrcvCgBOTqzdRXDX
	/g2Lr/Ppg6FDOuYCGIvc6PDhIjbk7geLevUMzBpPSKmNOL+s/Tltau1dsWcjDexhmbXF6Rfz2JH
	5+C24cKdNfhEM37VlpDNdjL59V1ukDzUFkIjUP54Rle4V2J1KzShzVvpsoz2khyjx
X-Gm-Gg: AYBFou0DKmqHQwzeJZpiEaVQB2dn74rRgoECFydCRxk300w+2nmUcuNwaMRpx8KkSMY
	iOM2MfN2UbxjBmsKsVrfHraBK8dWSq97gLw6W6+Lg4NfJ6aQp0Db7bcfwelkAIgAWVJ77cxjDE5
	yBeogrVgvQ5ZKxo2HagI+k+GKXU0VrV4joaYrrjY52LAGxaculGZ7BGUoursBraERmI1Q5VuUyS
	Qf+1tggsUo90AF+OQzomLLUxjXrpy623dJyxHHVUyByyfAwWBJyZ7dxdbvkTJnm22bFsodVnBto
	IKYDJD7RfzOrGEWWkPOWLWZGmUauwe03eJ8njp6p+RQCowH3lRctAf/i4Q+OPDKqWUnGahCRT0P
	RDFG/ywBVrG6954CN+eAwXQ==
X-Received: by 2002:a05:6102:26d2:b0:7c3:83a9:edc9 with SMTP id ada2fe7eead31-7cc367447afmr1369852137.1.1792415558906;
        Mon, 19 Oct 2026 06:12:38 -0700 (PDT)
X-Received: by 2002:a05:6102:26d2:b0:7c3:83a9:edc9 with SMTP id ada2fe7eead31-7cc367447afmr1369837137.1.1792415558381;
        Mon, 19 Oct 2026 06:12:38 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf100sm353774066b.15.2026.10.19.06.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 06:12:37 -0700 (PDT)
Message-ID: <9a058856-2dbb-4ea6-93f0-ed4d2ccd3ba7@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 15:12:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/msm/a6xx: Program the PDC sequencer on Adreno 620
To: patches@brar.si, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-adreno-a620-v1-0-4a7ed6210d7d@brar.si>
 <20261016-adreno-a620-v1-3-4a7ed6210d7d@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-adreno-a620-v1-3-4a7ed6210d7d@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfXzw0y1JPLhdhU
 s89aitwkm0338iNLiUCjilYxvPXYAZhQz61756onOYUy60bkN1T8w+1+19TY3Z/28dN+pWtdK4a
 8WFtXRM7o45TfT4BI88PjTb3Z3OOM9A=
X-Proofpoint-GUID: 5ihElPVW8Ri_L7z6G_olFy4Y78rpJFW6
X-Proofpoint-ORIG-GUID: 5ihElPVW8Ri_L7z6G_olFy4Y78rpJFW6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfX13xP/oUOeWoZ
 mP+y8aIAI6UnAXPyTvO1MSjtE9Q4VsYd6uy1ZLZ17OjObi1SbwvMwLJMlkjkuD4XMmSwSW0gGC4
 xz83+SoaMRbe/MnrKR/fH8vwdl2JDFx0xi8YP1/8+yw5C/td2wrkon5bdbUAMynsCzs4ttdPJtc
 Y2648ewj/5x2/LHufozaPQ+y4mVN/e9F1QcCGsKin/jCrQK1wRsEdjDL5G49iduiBFWY9Jmka33
 wDyX83HzlzYOD/QDM3DTlRs9bc76iaUzPRIIXFT3YN6NzumyM65OO4yEXy28kKAfElM31i8LJRW
 A1JlArH3AbD8YNqazB11gWv8tnG1n3y53AeUcVkE645JSyDsNV3nwxYsvyPFamShCDuVnNUIaVa
 DvELvRfrTyXofg2sreIwpWMt3do8RI368AVHQmEoBm4gOhtYl7RkrsFXJpdIbAjhybQhLhDoBCc
 R4UblHGW5B/Op/nwiTQ==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad61747 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=ODsmY_3wxSbvKopP8XUA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190052

On 10/16/26 2:53 PM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Unlike the rest of the A650 family, the A620 does not get its PDC set up
> by AOP (the downstream devicetree has no pdc_in_aop for it). Without the
> sequence, the RSC never acks the second power-up ("Unable to power on
> the GPU RSC") and the device hangs.
> 
> Program the sequence from the driver, taking the xo, mx and cx resource
> addresses from cmd-db instead of the hardcoded ones.
> 
> Assisted-by: Claude
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---

There's also this hunk in kgsl:

    _regwrite(cfg, PDC_GPU_TCS1_CMD0_ADDR + PDC_CMD_OFFSET * 2,
                        xo_resource_addr);

        _regwrite(cfg, PDC_GPU_TCS1_CMD0_DATA + PDC_CMD_OFFSET * 2, 0x0);


====
        if (vrm_resource_addr && adreno_is_a620(adreno_dev)) {
                _regwrite(cfg, PDC_GPU_TCS1_CMD0_MSGID + PDC_CMD_OFFSET * 3,
                                0x10108);
                _regwrite(cfg, PDC_GPU_TCS1_CMD0_ADDR + PDC_CMD_OFFSET * 3,
                                vrm_resource_addr + 0x4);
                _regwrite(cfg, PDC_GPU_TCS1_CMD0_DATA + PDC_CMD_OFFSET * 3,
                                0x0);
        }
====

        _regwrite(cfg, PDC_GPU_TCS3_CMD_ENABLE_BANK, 7);
        _regwrite(cfg, PDC_GPU_TCS3_CMD_WAIT_FOR_CMPL_BANK, 0);
        _regwrite(cfg, PDC_GPU_TCS3_CONTROL, 0);
        _regwrite(cfg, PDC_GPU_TCS3_CMD0_MSGID, 0x10108);


if vrm.soc exists (presumably because a620 shipped on a number of socs?)

Konrad
