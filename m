Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FA078F3A
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 14:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777126483; cv=none; b=PZJmn8kOumraCqwlC/yP3R+39BXAP6xVXTcUprwA99BL11EoyWwUm1cB2u8I+5A2ivFUxVF51AtB7mai9F27ZMtAsu61PMyLqjmNu2LwXXhmatuffZJYu54E5qWzvKoyqZWHn/+zuhtVq/3/IBz3Jp2ieSQEbCJRSrNLMEzRDS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777126483; c=relaxed/simple;
	bh=eYGL9lE3JVIqwAAW9KWYWS5tFK2BAmUw9UAz50Q8GqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XyABIpfCXvaFPwwws7U7Et/vVj9liVeScZ+zTgnxJsm94ISqMRpW8oLhizRc+VtOan9OQNcL/yMbIensJ0FlqIdCXi//hIjFMMHdF+fq8EujepUb++ScEvqbd+pW2njkzAjXAB8caOhTnQDbgnSNNc/9e4zk1ecIykzBP6GQb70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p7BFeiVc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WD+sPSlj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p7BFeiVc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WD+sPSlj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3jpbh1016133
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 14:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yVmaNDoZQRpaL1NHPS2XxDq3
	ywskpFtbeygHqbfYChg=; b=p7BFeiVc9Z5CU6IjeCOro7SJoS6zJvMvFwSkup6+
	wWZtrdCXIrWt/6eBAeG7bMd94GcQCXdEFUr1L9+fCe5WlLRj4hKk6EJkzs+ii60p
	l/u2KAkO5WZvDBkq8KOuUa5MTHEX1ir1V/IYDV1vNKh8juyV1LHqhUSEm3bs/+ET
	aGoiKfF9nJCP9fA/erswePhZBO4lIcdTdPkjXerir0e1f/LbSkJko5KzvBEEdpXd
	DlDMXO8xHhPbEZ57m/0UV5EaFjgTTe9SG3r2qHkDV9VvBz7WexsbhzxDc/xRWOAG
	ByRfE0k5ese/ulT48rY58uvuoQex+J81/7bd99frzOT+gA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drp07h2fa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 14:14:41 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-611740c0b8fso3927387137.1
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 07:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777126481; x=1777731281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yVmaNDoZQRpaL1NHPS2XxDq3ywskpFtbeygHqbfYChg=;
        b=WD+sPSljP5cSQ5Aho/aDe04A0V9QsXvqhSGMHCs7I3ehS/1DSgy2VhdC0g6bUBJqcp
         gJAlGlnJe/Dc4rkiVylR85TsDRafjLex4R6vWEoZBipQOGEhoTyOd/m2XnxnpaNTx69i
         1Sz0+FRwqhfNKYnEKGAdxZsIScT1WBVoOkrA21pletGicDLtJRCZRufNoNk2SjmlFtcr
         2kovaWoYs/HSgCxV+joZYXxKLaoPIQJtOqhTjqLkGMLlK6yL8urORXhsiVX+IUPXs763
         XrHV1ct97pwuRdiIX8O04VsD7739hEcyOSzSN2M+p5h7kEnpGYVLLUBPR/Ifhnv56eYz
         V7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777126481; x=1777731281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVmaNDoZQRpaL1NHPS2XxDq3ywskpFtbeygHqbfYChg=;
        b=QIASzs7Piuu28LCqotbvBLjhmdxUkAbiyynpA4nULsO6uSsh81+PPYXhaRNKJLfyK1
         rseq7VXSI+1kJxpRiOlwGC8u3eTQHQqvMtFaMYsU7VpmNI2e7JaKdDldrh/EssMi/xiH
         Y304aXoeYiNkmD1B/WgBtrsp6m/C+OBpuUrPjyCSE0DiaRnH4RGMgoz9266snLIpgBnK
         eZ34qpRV4WEyXyeP3mCVXKvuaBkSQjD0tV0lUhfjGK0TO2+9lwWqqQkzSV/kPHH65TT/
         EGBhtqX1vm0pAPXYULqO5rwbeI7GoLEQq7HdnxMU5+cUq/Hyse1zxGiBDr0ybN9FeGJ9
         pwPA==
X-Forwarded-Encrypted: i=1; AFNElJ+2NmdyDJVyFYCxSuMNvbRxF9exKFvXFH6sY1A2/G6IxAfWtOL0DavzBfAczJifUmgxBDpDwT5y4L/G@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Dh9o4uLj5UR8+pWx7yDZAw2Y9xvgeTFxe5E8IbCMka9CiIGS
	viqh+a02cue7t1MwfLQa7sQeuZQRe/+s5vV5iq3S7Iy2M+n32mVP+peDOghwU7euP/2T5SJTAVJ
	aCoXUJV2jAvpmI4aHTliIqvOoKnFSFWxKgkHrA3Od84akSRLmocX8FHMUQJnWZ15c
X-Gm-Gg: AeBDieuMtnvAIiShb4KIWisbCCcNOx4zwn0pPDT9WYydhwpQDX+oPBvO0WY/qWrDb/F
	v2rrDLj7T7brSKpTk+F/5zxR5ouJFZKvMmCDaLaM6F41yXuVnuAhnlNkdpnlk9SRPh9RVgJT0uB
	hYtiiohoXpPUrn3dr4GbFTCJFsveUpkt0UQMMQb/GdNeH5Mqzz7R6SbgC2KuqNoTscFtn7qqJL9
	GIL2w2FQ/LXpjlzq7THbqjLUoCV64eWByAI/AzW0HxNWuD23FAlvKFdvbrZ+kue8XyZudLbP2im
	6757AnzvkEdV40niwmBG4Bl8AoCYI6RjOBRcW+/8cpZIgWXQ7Q8hgcgxfwZrSifA71FA8nYEBv6
	cD4iVi07k1py9M84OQGqh5XPDH8nfpzo8CFR5+h17rL5TNtk4abGQYD0g9yiCyDZImYojdiDPYe
	/3XPaKTbc+MjJFW7QFS5wOzzKpJm1fmyNOJWdb7+uTlootkA==
X-Received: by 2002:a05:6102:8022:b0:611:e0c2:1604 with SMTP id ada2fe7eead31-616f68d76e4mr17012911137.19.1777126480753;
        Sat, 25 Apr 2026 07:14:40 -0700 (PDT)
X-Received: by 2002:a05:6102:8022:b0:611:e0c2:1604 with SMTP id ada2fe7eead31-616f68d76e4mr17012898137.19.1777126480264;
        Sat, 25 Apr 2026 07:14:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3905419b4f2sm34022761fa.6.2026.04.25.07.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 07:14:39 -0700 (PDT)
Date: Sat, 25 Apr 2026 17:14:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qian Zhang <qian.zhang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v0] arm64: dts: qcom: Add fixed regulators for WLAN
 supplies
Message-ID: <ymi3o5tdtcojobsgeqn7mlelcr23bchuhi4jvh6fp6obi4siu6@7h2idqhhrolk>
References: <20260425031712.3800662-1-qian.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260425031712.3800662-1-qian.zhang@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=69eccc51 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=XZbvWPK6OdUBLnbwwvwA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: leKVf1ntfNR89QgW1bXQXysfI1WdCJfy
X-Proofpoint-GUID: leKVf1ntfNR89QgW1bXQXysfI1WdCJfy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDE0NSBTYWx0ZWRfX/pht9e/aYoXC
 b1EgqX3Q7kAnPWj7xgsGrT9E64ssGr3kDHMD6kuaJ52VJegHD+XvRegGnDaj1HLbvzLWrjemTBU
 N7lwQZTRLUO04COC5GOYm1GymYdr8yASCZ9MWYUPTNih4MyEZoFUQkMhNPwZjt40xQMDAoeSh2T
 PBxyhAqvpXY8kAgqYoj4wl0VKxgriNW69K0yxql0aXth1NaZxkRDRanJDpOlid5JbSd6DV0TQ6N
 jP82/esxxL6l6FxTu4gMmUKMp1H02wq/rpRvI5tbiowyR4Xbr4xRhRbZ3y83wg5fHQbPsaIm+ex
 kMOUKTqLO9+/Ri3UcTq7h7zps7Emra50VaQ8Cyu67kEBh5XdBGZcW9sOVyoA8dIVnKSC/ja5YWr
 NdteNf82DFZSVYjJp38N0UAW8MTvvwXDGTSC+sv9YaDHvfDlrPIL2iMa+H30Ekpd04b2Cm2/HEY
 SG7SiFlu5eh+roboR1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250145

On Sat, Apr 25, 2026 at 11:17:12AM +0800, Qian Zhang wrote:
> Add GPIO-controlled fixed regulators providing WLAN 3.3V and 1.8V
> power rails for the Arduino VENTUNO Q board. The regulators are
> enabled at boot to support WLAN initialization.

Tell us something, how is the WiFi wired and powered up? Is there a
correspoding BT, which isn't mentioned here?

> 
> Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/monaco-arduino-monza.dts    | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

-- 
With best wishes
Dmitry
