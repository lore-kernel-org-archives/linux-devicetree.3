Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD0D3B637E
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776768582; cv=none; b=YCzrKWnofPKN+ChenfyOMs16Hry+NIbnNyfSjN1iVe/abxdh82awvuYjNlY7YM4djaFbO1J26PGZCxkIrFH4X9CN7efuiXoSUaBk07G4ywX0+mVjmXrOVqtRccSj9MrXc9nKhTwWOgnu49iCq8RFyyQmHJd26sPesgABRTEYMAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776768582; c=relaxed/simple;
	bh=5Mxv6sRGC7EoiPhv776UB/ohXEcR5kJI82wF+to0esY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNFBru1Z5zRR1Wjhzzah6duH/UOTuDSC+FyAoT1uoSBpxQRvjYmUh9D0fezn5OP1jIF8nGTcjaFkaqDCmgrvZIMhTckDUNGCfj4F7oORy4oZbAsFlpPchphc0m9LblZ3C6C198x5dX83ElPZ8Pukk8gxsiNGI6BfmScVlPKvhDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=arh2EjKO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K798nl/W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="arh2EjKO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K798nl/W"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L7PEim1127573
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0kxXr375XYtQSccstxrcJdmfdnVBc/C1d7xSRxVxEqE=; b=arh2EjKOh5dfjwUV
	weP+Vp90WbGJFv29m/ZeBKHBy0Kjr55r/t05HDJoSKKjjVfDUA3h2QRt8VCuNf9v
	lPsumsSqDO75ZBNh4FyRJ9NhfqosZRcSrmkKhNl+InqYnmypUCV0RJUZZ+N+vfOn
	fHKId2pwtEHa5wnHqxp64IW/9picdVhS18Pbp370kUVaDxao9+34XSjzORgDoCWL
	puSW7x6K5SDDk8fJtK7p6KBDuy4BGUnmmKH7BavFNxSid5XBh0CYRg2zGLrtzFK1
	bxxKW/hnE8bWiDJNbSgqP5npZ+sroqkq4neGAZyxLPrycLLJl03xVJJd0sO2aORl
	yy0JIg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnw68t8x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:49:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d812c898cso112702431cf.1
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 03:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776768579; x=1777373379; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0kxXr375XYtQSccstxrcJdmfdnVBc/C1d7xSRxVxEqE=;
        b=K798nl/WdGoOkyK/Y5E5V1dIc4ZjGHQUWno7GfahnLcLlrNe6Xt5xIMUGTMRdKklje
         wl+Z0MmeYUqUuT5QZQpDL5USAMYC2tmdMQH1b7qaeOLZriMUSj3Vq2sER7JO8NBBHMVn
         JWmy63sUV+j+YqCNU7+2piOalRyjuJ0oXbOeqqyuO0C14fZzVhAWB0ag9eKc1P1Qu+to
         E/aUAIl5c/BOICfPWZ/Fe4t8x8inqxQ2P/Wp5cz6fn/FgOQt+5R2v3yq8u311ydlFbTv
         TiqGNMYgHrCaf6O1sm5qbz+4WBfJ23sQ3DMc9tAUQyjctuBp8P3rH2aB0CvO+EkdD2MZ
         ShGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776768579; x=1777373379;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0kxXr375XYtQSccstxrcJdmfdnVBc/C1d7xSRxVxEqE=;
        b=b1+rqBj8Z4SNiQa9cFSIIlFqJg0P7JrcKcFFJKQVr4kQOEJ2MT0Ss6F4ElpoC4fKFa
         sxqFa0IeKCb9mKK4rKYH8tcmnpbwZAA7ON44aFcRqnvBMap8j5MKUWoAqNyVb6O64vva
         eMxvF2F0tFL0P1G8w1clRhReMeFgXLUKC+3rxHGMJfmMEHhcklV4qHBTI3MfmxjFWGUW
         7/MnnrTNrV8PhFjuPKZ5Vf83PSoF6cELNBBz4S7YN4zPGTRYWqpP00EdTyzwyNrRkVj5
         3vbNOU8o3Qj8FaN4vWze6QW7goXg31QFJ8VxKEOS6zze8/vIxNw/8bqq3NyHsU7+cOPx
         7wgw==
X-Forwarded-Encrypted: i=1; AFNElJ/pCpSZD8CP20hY1dX9+ouTnwgsPYxt0603FcbmxWYaIWH+G8ZiS99mglStsWpRSumsYTNIoN+z7CIf@vger.kernel.org
X-Gm-Message-State: AOJu0YxGg1dXTEdXSVM2LycayV9X5UacFynas11oLeDqjrUC6KHiQXb9
	oyIpTqE2TT2I4oiC9tthJHW3hrC4fPDPD6abLjHU2PBmZO5sqf7ZNrr5Pb2cOwB/84DBbyC2XJA
	d6ZNvR3cmnxkQRH/OZWY4GJGK33wdkBoOiem6B2PNQ07BXbzfQnLBzpxWLbBJI5hL
X-Gm-Gg: AeBDieuZ5M1Y7uMOjWqDlLMYsoEcEk2M389FrCET1IIZ66dF8AZKQBfYtbjm01q0G57
	0kahmLHe0hCRhdoiGXZZmykj8cAxMmWYsXeuH7t1kCVTu+N4i84PenguBDpuALr80ZLjETAhBS1
	cWuqIhYg75QVNk5Kjabyr39WD5AY+W78YLH6qSNEfzb9uVJpBV+4HnplbSq5/GxNrgHrvrnVrHB
	ZlGUxpr+zlGyOTlUADRw2BUXeB1qLfb0Q4xCok6LLwnygFnPH8OUFjIyvDYebzKC9UpfDihtMyD
	ey8oOMHx1uHdiPeZloSS6W4PXfvF+7+RmGDWzeMaMSAju2yjv9HRZI+L5TIkNpWKS6aMJ/3iHL1
	qPdfOZPjHnlCtJPRCbfQa8aT7nyytjydOjmSvX9JvZmijN+3VjKTCfwRHZeKmNv/0Hwuyyyf9hW
	1wBopDFDKL1tV0OahFSwAy+66h7B9p4Nm92sd/T9M9SI1eSQ==
X-Received: by 2002:ac8:5987:0:b0:509:1579:7c38 with SMTP id d75a77b69052e-50e36e9be9emr267738441cf.35.1776768579415;
        Tue, 21 Apr 2026 03:49:39 -0700 (PDT)
X-Received: by 2002:ac8:5987:0:b0:509:1579:7c38 with SMTP id d75a77b69052e-50e36e9be9emr267738091cf.35.1776768578971;
        Tue, 21 Apr 2026 03:49:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad0b8sm3595646e87.15.2026.04.21.03.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:49:37 -0700 (PDT)
Date: Tue, 21 Apr 2026 13:49:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Cc: syyang@lontium.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
        rfoss@kernel.org, mripard@kernel.org,
        Laurent.pinchart@ideasonboard.com, tzimmermann@ideasonboard.com,
        jonas@kwiboo.se, jernej.skrabec@gmail.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        xmzhu@lontium.corp-partner.google.com
Subject: Re: [PATCH v3 0/2] Add LT9611C(EX/UXD) DRM bridge driver and device
 tree
Message-ID: <rg6zbch5ihz44fwwek7hqn6nfgqtmi3zetynn3rekdezfgozyq@4hy5va3fpvw5>
References: <20260420061644.1251070-1-syyang@lontium.com>
 <CAO9ioeVFHn3ARCqL0NJ9jRCJV2P9-Ky2c105iF7EwLUG-cV-QQ@mail.gmail.com>
 <CAFQXuNZd8B0spcF2HNNRdF6a3UxELaEriGssFXL+se5dhoLj5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFQXuNZd8B0spcF2HNNRdF6a3UxELaEriGssFXL+se5dhoLj5w@mail.gmail.com>
X-Proofpoint-ORIG-GUID: _uGDqr3jBL7bEgBI3J7onee5l5_NAtap
X-Authority-Analysis: v=2.4 cv=apyCzyZV c=1 sm=1 tr=0 ts=69e75644 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Kz8-B0t5AAAA:8 a=e5mUnYsNAAAA:8 a=VETm-ZgMAAAA:8 a=BKPnJh3IeGRwXN2rGlYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=RuZk68QooNbwfxovefhk:22 a=Vxmtnl_E_bksehYqCbjh:22 a=TSum39mKrd1h5-tZHgHT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwNSBTYWx0ZWRfX3tR8zBa9udA4
 koVSEvjvoiFsk9B8ChKASZ4CQVGgdWsu1/U20KWdxP/L43dMZFyxZdIWLvZK/64LE9VDfq48kvI
 keDkz0V0dXxoVSydrn80tja7y58BD+PIRznbYN2ZS1yjiKTUKDxC8ZiqTlhZEf1+4Oaxs4HFtxP
 60vS1RhYZnPCTj4pfl+JwmZxcpzcoFsLqZb7CXtRQ8PH8GgXIAXf7sDxyqKg3iIwhEPXoDHl7ls
 qa8In0yI25ztF3uX7ebwMWsYl92FvDQxyIpTUy3U3rZn50U0SmNcZnPrTk1IhVg7766WYIV6o+m
 CWD5ODiAmqNwZA3cJfOj0ajn4UkfOWbS3mfHOrSrWSZvLPrSCGWdZ9cZKAJVxwdktWqRW/mPBS9
 KanNVScyhfNDP7McYC/DaVp3ewiJi45nrtDdU8XtuOa5vfExTpyxtJHN7g+3VHSoH/CPTVBofwm
 Oq+VXBEGTWaQhokjeZw==
X-Proofpoint-GUID: _uGDqr3jBL7bEgBI3J7onee5l5_NAtap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210105

On Mon, Apr 20, 2026 at 07:05:58PM +0800, 杨孙运 wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年4月20日周一 18:45写道：
> 
> > On Mon, 20 Apr 2026 at 09:16, <syyang@lontium.com> wrote:
> > >
> > > From: Sunyun Yang <syyang@lontium.com>
> > >
> > > This series adds support for the Lontium LT9611C(EX/UXD) MIPI DSI to HDMI
> > > chip:
> > >
> > > -dt-bindings: bridge: This patch adds new content to the
> > lontium,lt9611.yaml
> > >  binding file.
> > > -drm/bridge: This patch add new DRM bridge driver for LT9611C(EX/UXD)
> > chip.
> > >
> > > Signed-off-by: Sunyun Yang<syyang@lontium.com>
> >
> > Once again. Your messages are not reaching the dri-devel mailing list.
> > Please fix your SMTP configuration or start using B4 tool and B4 Web
> > Relay for sending patches.
> > Most developers wouldn't even see these emails as they haven't reached
> > dri-devel.
> >
> 
>    is it dri-devel@lists.freedesktop.org ?

Yes. Currently all the emails seem to be reaching dri-devel. Maybe there
is some internal delay on FDO.org.


-- 
With best wishes
Dmitry
