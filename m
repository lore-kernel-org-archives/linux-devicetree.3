Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A3135B631
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776158204; cv=none; b=aqbrErIp5rNyumzOTLRE/5orWuN9u4NNK2hcLg+Yw9bRrtGoUI6IomR4J1Hbo0w+DqDotYg1y4X+iu5TiTxitZodazJSAMfOrTYynUIV5xIqcwB0l+UTxjpUb1Uxl9UVCzk9GLBu4sPU1KCouNZAX0lSxRl2vodrlHT4B4x5lwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776158204; c=relaxed/simple;
	bh=CyuUOsZG3F1ayuCpTDlkKhEZiIianfiLsgXjXTRWEC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fl6D/j1BCCPny1VoNPivfqhH9RYXn5uO/yPxWpuEntJQi3S7bpi96nvumRZwcoWBBf1/0FdCozM5IxiejMK5TDVAFEPTO2Z/CGUYObI5GbtoEuUZBj4b3LEwlsLCde71pbwZNbWNsfckrczy8bDLSxhgaZDobk1Ieib7IW5uaaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwnvsFfp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bLtKD0zW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwnvsFfp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bLtKD0zW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6SAiX362960
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AQlsZPfk6eawYKqaJllXe5Qx
	E8W8/7tu0/vCso1y7dU=; b=iwnvsFfpUWv6vjoC5/GuaXncBzcBmXRmpAnkLAJm
	V5LPTJWcVoOo3KcQfDhKbAKIVPHKndW23YVCNn/dCmByhYpsz6PUpVDcjgTy0Dg2
	hC0sC6cmhj3wDu9UtENpfHB8Kjg4W7pbahxowmmIHi/iwEG6i1RVqNOhyrBgqJXy
	2thqq3OFd2trt9gqnMi1z1vUoiJ2CsYxJLZd7JoTEvMyCW94M/bkxTOwub5UBCLt
	l8894BLNLij3DECRWbGlteWUZ6/xC1958f/qpJvtryN1q2J84oJ9VictcAsamLca
	5qb/GHNPCoMLlnjgVN70mlYX+3DP7Y7H3UZPIrZUJZQbSA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870t1f3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:16:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4530a90fdso48818625ad.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 02:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776158201; x=1776763001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AQlsZPfk6eawYKqaJllXe5QxE8W8/7tu0/vCso1y7dU=;
        b=bLtKD0zWZka5DgAC/tu8lkO+D2G+VP7QGU9nvOinLmHtMWP/H6x3fX8tgi8qX5ScUb
         crvxnHvUwQhnJsdWsIFbtOC1hlyjmMcLsBEoja24wa6aG+yncvGt1EqpYKJIYnluXGYm
         NHb8M2kS0s2EOYSVS8Y6HYOCvmFuOBbSUxpcCipkMvG5gldl/jioZ0Nq4ENb0shbfKP6
         tA59VJH8pAaxCfnOcAhSO+WGrH9yQngkVLXkxfR8TibyPc01+Fv9fdCbFd+7QGu6x//C
         u/Oc0p4YIt6PwtLf9OgIotwGbgXs/yf9fMqw4HL6zLjNXri9nJ67499FW5c3+zWNDOTD
         luTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776158201; x=1776763001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQlsZPfk6eawYKqaJllXe5QxE8W8/7tu0/vCso1y7dU=;
        b=k4B3WALG0qR3+j0PkvlYyIzTFxZ/fdyajDoMY0SiUI9vEiYD0WjjJ1RzfVlu9V9r01
         PPa77oPk3HOIMJtGIOcUaAAqOMM7hDVjWESKLQjwA9ZmS3oyzfcNOnhQRGrZqnJektR8
         7EnYteKOJSpxIavxbfL9Ln6e/FRO+nVMENtqPKIYE1YZfmYj9HIpa8sGLuLwz94kOEjX
         JA52JS3Bs4hWIDrzj1peR1b48/eLTTIaesFRkdAL5SKZvGczWMBMAjK9UYqIouvm4SaG
         LC3apEcQ/qG06qTYhzBQfTX6nXU0CGn9FRs8EUCxNG7FhzjN6WRz4fIb3EN+pQEdIK4h
         7pXg==
X-Forwarded-Encrypted: i=1; AFNElJ9bah3FRyfhZrjOKGvfyQKdnKlPgKnnh7uHt/KFROT1yxzrDBhy6ypULhc3tBp28QvnN9+q5UvqvjAW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4KewopEnPSDTCXNEY7hz7mfhLcEjmryTK3PpNvoq0WJUnyWnY
	P1mArgviMkt+l8Za9CMl84T+xr9GndrEIMJgYAvPAHGggVSfO6EW2bFkfCNgfuaXJ9aQocMfrhy
	0ogu32yf7tE5Cwz6Pqrdzrgz3mx2z8VAoKpq8Spx4A6JqgaVZCcbTXullRmNKzKOO
X-Gm-Gg: AeBDies75Bqn56ds29rX31DE3MuyhmmpoKBKiq+/30TCvhz1QTCsLNZmRYhquhExuPc
	F1vqwXC6kEiUAjZ60Dbgardn4mpBGW+Ute0DGO8lT6gMdS4wjjkuhXoXnQvTG8zatvDsziAxQgy
	dbNfl6o3FsTdaZStObhAqMsIFsbuO45xGT9Hri/O2rR2ELZeO7dvetN6TMc4VwBaZaPFQLOQUWE
	5p5rIZXYwX3zKXFdDa/1HZ+qPC7vdlDfZPkNhRiNWOm6hB4o7OLYnSTHWGCHYPIOfKxCMJcTLgI
	Iaqcmf/5YQruIMunSAUjrf1Z9R6LhR8MvkCNq1yMW0bGoCbtou1gPERj3jAhxAY6Fp+WgDlRSh9
	XXXNM16YqFOEBi4xLQgQguKX2Za3rfPhbYSmmIjltzDmuxUiw
X-Received: by 2002:a17:902:7249:b0:2b2:4cd2:e174 with SMTP id d9443c01a7336-2b2d5aa42d9mr122118555ad.43.1776158201407;
        Tue, 14 Apr 2026 02:16:41 -0700 (PDT)
X-Received: by 2002:a17:902:7249:b0:2b2:4cd2:e174 with SMTP id d9443c01a7336-2b2d5aa42d9mr122118305ad.43.1776158200887;
        Tue, 14 Apr 2026 02:16:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4ddb742sm145311215ad.27.2026.04.14.02.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:16:40 -0700 (PDT)
Date: Tue, 14 Apr 2026 14:46:33 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        maulik.shah@oss.qualcomm.com
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 00/35] irqchip/qcom-pdc: Clean up register mapping and DT
 descriptions
Message-ID: <20260414091633.6edoaxktdvw4gj6x@hu-mojha-hyd.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <23c2f6c3-1bcf-4bd3-9fb3-71d6c8d1a4eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23c2f6c3-1bcf-4bd3-9fb3-71d6c8d1a4eb@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=C9vZDwP+ c=1 sm=1 tr=0 ts=69de05fa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8 a=Lp4zCwS7la8W0ee_oUEA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4NiBTYWx0ZWRfXxrxPeCxbeHRK
 oHK/amBoxvB90u90484ovC6tCU8k/iN839wDwH7xrB3r+pE0fHysmtCJT7CbReh1z+BH32YeCTr
 gjinzppzoEYN9Npg9E+b9ClGlIuPmezYZirK6NDksXPk7dBqJEJRMM1sbPMFimXhQ3SqoxZvrda
 eH6R9CwbOB3CvVZnJVijpeN7AAWwAQViND1uec7NT9zjIeYuniHJUfllphgLEYxlPUfwYSv6qmf
 9HJ8IOpo6wFxqgwEG5IJnC3Pgvun5MXmZyH6tojIgKs9IO1boCiwYLotxRIVkwhCFjfR/+dr0Tg
 ukSluR981awPTz71gwHbSrXT3lwUVVXiaV0L2xuFE6dXPWJ/KiuOzoBTq+nFg6KZQHRHuIw8c2B
 XABzEbwXTKNoVXMo+MEa/DLK6A9yg+ta2iuaqLQQs6O16OHyU8LkWVUtWiM/uoyjZjSOIrHeGNy
 jlu0nf/9ykKvihyqt0Q==
X-Proofpoint-GUID: dlGnu39loa2_TMK74_f3wxxI1iwclvSH
X-Proofpoint-ORIG-GUID: dlGnu39loa2_TMK74_f3wxxI1iwclvSH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140086

On Mon, Apr 13, 2026 at 10:27:41AM +0200, Konrad Dybcio wrote:
> On 4/10/26 8:40 PM, Mukesh Ojha wrote:
> > The Qualcomm PDC (Power Domain Controller) hardware exposes multiple DRV
> > (Driver) regions, each 0x10000 bytes in size, where each region serves a
> > specific client in the system . Linux only needs access to the APSS DRV
> > region.
> 
> [...]
> 
> >   arm64: dts: qcom: kaanapali: Drop unused second PDC reg entry
> >   arm64: dts: qcom: lemans: Drop unused second PDC reg entry
> >   arm64: dts: qcom: milos: Drop unused second PDC reg entry
> >   arm64: dts: qcom: monaco: Drop unused second PDC reg entry
> >   arm64: dts: qcom: sc8280xp: Drop unused second PDC reg entry
> >   arm64: dts: qcom: sdx75: Drop unused second PDC reg entry
> >   arm64: dts: qcom: talos: Drop unused second PDC reg entry
> 
> I believe that was intended for this feature:
> 
> https://lore.kernel.org/linux-arm-msm/1568411962-1022-8-git-send-email-ilina@codeaurora.org/
> 
> Is that something that ever turned out useful?

You are right, this patch is being carried in downstream for almost ~7years.

+@Maulik

Do we really have need of this patch by Lina in upstream ?

> 
> Konrad

-- 
-Mukesh Ojha
