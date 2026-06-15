Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD53B3E558F
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526205; cv=none; b=n35crQH74ia4YFQiMDoUptQebsK9e/Lo8LK9mO/eKI7/y+8/mXJnYve+NSDOy9wfbteC5+CGhfMawJvDvD/TWQkIYIZi/VF2ALfjlQZrKrzV+WozbE7wGAgI4asYmRA1rNB41U7doggdKpIeItgqVvcLs6FXZaaMvtZh+qJgRjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526205; c=relaxed/simple;
	bh=8PeQBj34V5c0RfITfinu1f6KT50KbVyD4JOtxTy+Nho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DAlvHEIF5z2Dy5TF6s0ERag7I3XilrjsQE/u72pZrcSJz5wGMRz5hNL5CR63WPKLUF3TerU+DUlCZUuS1BG1hlfqC6lvFwQveYXTMNMbMunnANn+JxK+Puh3niohhLoZY4RDfcnWLI9X2v/jjzJmAR7HfCRdQaxkEOUjc+KldvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bp77X5vD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bbs7ONnv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bp77X5vD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bbs7ONnv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FApZOM298373
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E7sv372Yo1BuVVOPLRYh56YSH/Q4RtdRYSnzm2ofdy4=; b=bp77X5vDkcJ9TRlO
	306T0sfA9nlwh8v+9OgMwcah6LrWn5ena05Z1+Gbh18jWOaHLsnmbNJXJKOw3mG1
	CZ2t0VZhQ3s+MnPK0zv1ZfxsI2DbZbaP0putJQ7rdDkdIRaiC1UPSv6eH9NxdwX/
	qplscIVCNHWxXIY5EacmiFTruZG5g7mhF/p8nNxiX0Ok1yGCHVNynp+KLrw/4MuQ
	Ha8n6zfKWfEOSyBBEGAUFfojV9GtGMSIxihBcVLda92LtsdWhZdaY0is6uMrtPRq
	XWecAClUyFeteVMKEHWVmoFNWEJNi/UNngE4sNGPYJ1WfgGax4hQo+e7KIhaqzrF
	k2xwFQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter20ng1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:23:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9157a31ac37so483784885a.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781526203; x=1782131003; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E7sv372Yo1BuVVOPLRYh56YSH/Q4RtdRYSnzm2ofdy4=;
        b=Bbs7ONnvzZ41NO8AQ8PLtqE9J/c4RZ8RW3JMMg8EQ3vFLGqSddEhJ7MxF9DX24nomU
         koKChcMB2kBRsY1zQdHiEe0FzxISADuTT7YQYHCUidgWG3SlfqHgvBJ8MZenOyW95V8/
         dSmHV759misNO6wPib13DjfrLlrowCl7xMCMyCxqbnfKOhW7hhJ1SF0F9mc9vOecWJL3
         tfgztMqfaRjaOH+4NFdH5/Qxt+5+hMHz/oBzRDpulM0EXNJCxAxIKYJbBzs/FyHFxrwd
         CuO+8gyZ2bVouA7c511eqb07zQ8kOLlFN212O3JYO0tqYXoN2g7ZzwbFUwzewwrOcbeQ
         SO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526203; x=1782131003;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E7sv372Yo1BuVVOPLRYh56YSH/Q4RtdRYSnzm2ofdy4=;
        b=kT7sqFcvrKwSkk0SmHjV/nWGHGtHtGw0J1oq6PgIZRWmYxzrV+fCrmf6blmqLRhUQl
         oJkJET+awtKIfzTVfxEzIPg939wJWaOkh7IEc+M1/Q8ZPA6LcF/lAzXoE9rlbEeKxMee
         sVb4jjVbOUYkr24BBQ4tV8S/UvrU+v7SIPEiM7lVM7UJITTcLQ9mwnq7rJJ292oj0Bd7
         6vmWAuR1tDuQmFntkp99dtpG0wyIpMjN0+xG6kcHVEm/so47ak1Q7b6z65f+/JSfdrOE
         h9zrkvLo6LlyQSAWa3U9YMCh6XiBP6QJK4fqK/bTEVlEA/W48jN3eqZAqcpDM0sQ665W
         qZ/w==
X-Forwarded-Encrypted: i=1; AFNElJ8OYV/UU+brBUzDYYxBVj7dGobiFiAdR/SVWRJKcYDUEOjuLJN5yPwZTbQONUoRtrf5sotdUSJhBLak@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ+5yd4UxCJ567cSlUN2N5iTU9zvleZmaiSXnSS3K3h7yhIe2v
	W4VB8xqr1MbDImkf5cHaUMyImcUOPqbKejoal23DYwvY6f9XKsxbVfcqRwuEpmNfYFkBRa0AwpD
	Sc7+V0tC5iGBv+aDsZDEoQNbxC4NErpK1BJvki8gRs2RQN5x598jqlDlxMpoe9xFB
X-Gm-Gg: Acq92OHPQ4zRKcbKIO07dyYuTsFhpzd0k5wEuAlDfQoigDGJRl7GNo5Zt2UnyXGCPEp
	YhtKzJr1sY3nLe8n/tVTB8X7jDh9hWCv35FIGwNPy3AsDhX1Kd6NTkF6pwE6T8S/7Vq2SX2dBhS
	duyVlXHSdFoKI1SJe9DQNavJivwqtk4J0iSumAkTFpwWkev+GS6wOj6onQtAjgAvyxn4fNoiVOT
	n3dQPDlmDgjXu3jSXdWrzrvu5H1msXt5vUWqdsZeR3wFjbcQOKDRRglDJeX/kIpHZ4wpoDczXzC
	wl9/1H2bOXyk1vOZOXsDHYHBCNm73chg5wceNoYBWRrAbKrlSMRtXbQXK/PBh/uJsiE8CqsWwZc
	Ld89n2eq6MhyLPks9/aAbLp+CI5uJp9KGrHVUFkyt/e5nbqowhcGRDGZP2618oi6H2k6vH9Sgpe
	0JsZ3r6lE47CVvySOYWd1RVgI3fthvEM2zIIo=
X-Received: by 2002:a05:620a:269e:b0:915:3d27:a816 with SMTP id af79cd13be357-9161bd388b8mr1960981585a.49.1781526202958;
        Mon, 15 Jun 2026 05:23:22 -0700 (PDT)
X-Received: by 2002:a05:620a:269e:b0:915:3d27:a816 with SMTP id af79cd13be357-9161bd388b8mr1960975485a.49.1781526202441;
        Mon, 15 Jun 2026 05:23:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b3253sm2757033e87.68.2026.06.15.05.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:23:21 -0700 (PDT)
Date: Mon, 15 Jun 2026 15:23:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
Message-ID: <q4t5f4aiapowojbz2vh7qmcwvia56gc6ytzj3rys7ingisubid@ddlwb3qi5zdg>
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com>
 <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <CAH2e8h5Swn2mWoz+t_nrSw1=hQttwi1Hx=dg=cd9S3QRnHjpSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH2e8h5Swn2mWoz+t_nrSw1=hQttwi1Hx=dg=cd9S3QRnHjpSQ@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEzMSBTYWx0ZWRfX1v10J7LDr3yi
 dpUoYVXZhVy0g/R17zYog3cfiRlB2TIo09y1ZhSz0iJ4sDASXHi9qLergjskByUCtB693O643ib
 6H9tN2oal7alUEpYpmROTESxd8Xj5+A=
X-Proofpoint-GUID: 21nnUdy8CBXbV_gNbbg6xE39DOLx-6Vz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEzMSBTYWx0ZWRfX6V4LvAK8tBrL
 JibvyzXc7ELcVB0PdUEDL4E0UDxvkXcJ5r8pcPApD1a/Y2swrIv1eDKfLx2wQMZkxKufDsKhrNZ
 fHC5mszgmJp9E67s4Qfii3y+5pBnOnv3AmlE2fO3+Fkg39OapkVlsE6pP8OQYATRsXiIZBwW61W
 8CYylN1hE3X+EBqdqJiidEWKFCsbWQGzunURlV3923RxJ7G4hGhGnhYXzNXeBPl7s32vzTNT2xx
 3GnigsMCgr5trXdFwjOw7lhp82iEBDl8J17tuWv+a0bN/cUmlNuLhewIEo9j/xJ9WJsHwG8FUfQ
 uzuxhNgxTbJtBJRAzHZLf5rK7IJVhF4SDyWnqDe+i2qKkxT1T1JuJi5VLiDAdi3+dvBI9ujP5X9
 XyFKz+CZG06T20O1CD5plKHLcPzi6r9+vt52jd2w4pPFoQaPNPLJLiazvXqp8cEFI6SOF9V2sxv
 FVuqaOmm3OsaJsIxV3w==
X-Authority-Analysis: v=2.4 cv=F4tnsKhN c=1 sm=1 tr=0 ts=6a2feebb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=Gh1C-VzVOIyvPQshHAMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 21nnUdy8CBXbV_gNbbg6xE39DOLx-6Vz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150131

On Mon, Jun 15, 2026 at 12:25:32PM +0800, Pengyu Luo wrote:
> On Mon, Jun 15, 2026 at 5:18 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
> > > Some devices (such as gaokun3) do not disable FIFO mode, causing the
> > > driver to fallback to FIFO mode by default. However, these platforms
> > > also support GSI mode, which is highly preferred for certain
> > > peripherals like SPI touchscreens to improve performance.
> > >
> > > Introduce the "qcom,force-gsi-mode" device property to hint and force
> > > the controller into GSI mode during initialization.
> >
> > Ideally, this should be decided by the SPI controller based on the
> > requirements. Another option would be to prefer GSI for all transfers if
> > it is available, ignoring the FIFO even if it is not disabled.
> >
> 
> I have read reviews. Can we check if the compatible
> "qcom,sm6350-gpi-dma" is in DT? If the gpi dma controller is
> presented, then we enable GSI mode.

Can we just check for the dmas property? If it is present and if we
could get DMA channels, then GSI DMA is available.

> 
> Best wishes,
> Pengyu
> 
> > >
> > > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > > ---
> > >  drivers/spi/spi-geni-qcom.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
