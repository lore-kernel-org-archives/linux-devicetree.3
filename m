Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A47383C68
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 07:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776757175; cv=none; b=LtxYhnah3oQiSI1sREW2fRdG+rLg0aKzI5Ai7hV4WISezkYOG3U/ur6MCwenW24Aq+rUcUxXGj9fIahc1+nJZOm/XEcW4uj3ITM1XU9hurMUMZZyaqZSNkzjVLrg68QNtrMkUFF077m9c96zRCaB1y8ZmANmmw6T7VyXBgkS9vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776757175; c=relaxed/simple;
	bh=AHVDlaiPLZGv5Nr20tU+e7aqoJ89J/Y6fybbRvNtqW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CgbRcz2hGryXxoBFdCUFKzAc927/+Xw/mC3S1SjkFC6uBWdHVfHRpIcXtnvx3/uP888evOa3bwQ34gS79HvHtN9xRWzGDjzm6lunBPVzAY3tcbGQjzBgVmm3t1RtLYW1v2t4zLLSMcVTKXA8WdAU8oLWy99/oE6sE1oh8QlCPi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LG3mgwLr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BU+/u14g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LG3mgwLr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BU+/u14g"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L3Petv4168274
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 07:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YFMzs4xFzTFlKpkighB7F1f/
	Iyfj9GNd+fbtaY4rXjA=; b=LG3mgwLriOYT87TGWJpBg3Ydwc103wi13GWbQfCY
	qWuNmFNj4LGx1WPFQ/9K3c/NKCA42W70t7IThEbsK5l2nache5POPYe6qCyhrbX0
	I/juHrv//VoJ1algfPd1+bzgfQHkdmIL8qrVwtrvZxOcioxyvw8eLZ1rGnc1iuKq
	BFN1STChaGSx0QIfck6cDKzzobeAyZzkIQuD0TPMVXtJ7DfjwKhqkarj+1kGwSC0
	/XvqMNUWJ6iIk3EzDJHdpB/b8dOUZC27K2o4qSiQzlNViwnuhmx8OfxEhM3TjZ/Z
	g5GAJ0HSAdCW5rK7Rty8H/fcgXywyfSDsrndEcD5GxFuhw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp1au0w3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 07:39:33 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2dd6fb4c867so1680779eec.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 00:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776757173; x=1777361973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YFMzs4xFzTFlKpkighB7F1f/Iyfj9GNd+fbtaY4rXjA=;
        b=BU+/u14gzSVJk9CR2tEYp+a+W2abOXOXabYXcZJ4/K89dw3qtPN13bfyIxHJCNKhbX
         XxFPmKtCYI/n8fE/dUnsv4mUku0IPFQG2w7goETbbGfG+BUPkpBh0JLnrRa7XVKsRVqG
         Ow22BQsSgZWkf0bJOz/qZZjQSCb4nugemfPQPOYwmEYD2iX9K2X5yMyfqh+riYCB7eio
         wwvUlf/iQp9ek1FqZFX78cpd3tW0R/9ARO4zjBHR7ZFT1fFUmktbvqlJMcGRHY+aZ6V5
         B1AR0FMw1ktjQSgohuDEeaiOOsbeP3NMKsSo+XrlCuj/0hkmMhFZFBiQegfl8j4vgznQ
         VYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776757173; x=1777361973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YFMzs4xFzTFlKpkighB7F1f/Iyfj9GNd+fbtaY4rXjA=;
        b=jyMzTrxD9JWp77yOeG4sYMjh5gE+/O5/hAPy4DMXV5XZR8O9RxZ9WGqe8mTikQLSlP
         Ir8731aDeJoJ4x9I+hVUF9N81KCFhPuDsrySIIJMAUeHGVFNtiyZ1CSiZ3xmpqV2QMty
         MKjZQMeF+lukqOmOS6C8d08u05q9PQmq5bOBKC4nHA4WEKnc+0P95rFVBkBuNdsUDgDM
         zVE6ISC8YImuUtNIqX8u4MkBSvJwYo53PA3yL+X3Riq6gj9V9JBL9OZhiAVmDpfNxsFi
         e06asr1pgHoPpthEb38xJUoutx53h4hKe1WzlJ2iC0dlZsytMTtpdA4e1ci4oquFUwgv
         1D0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/DKuep1BKAS8Gy1ApwcoLGs5cnvb/4OUD4UlPz7wtbYwJQxnMzoS/KiGIxrFELdW2mmMLcxiqX+79v@vger.kernel.org
X-Gm-Message-State: AOJu0YwlLrZ4sEsIZyuK99Kf7+0Oi8v+q3XQmSJf0zqpisTU+gs6ORCz
	bJN/ZrFwLlmEzhtcNzFGFswjfrr6SxbjnigbjGUMJ+l7yrcI0C2qyfIsHm4YPSg61nNFoIT0a5K
	P9TbMll5B3jGtC5oJEZYBhx9NBHkeLV8IyJz4NDEgSC6ZPdPwGHrWl8LX/biqLKaI
X-Gm-Gg: AeBDiesQnb8tzxAhUu10tmsL4dtO4y0DadyV3wVcQj7ha3SAtOcIIeO8XCFs14QpAFe
	ClqR6ICG4bPLlGRtRYr3rs/z8/LFezE2fd/eLbdIp+3eclcQvZ2aaauMjVhZ3bStZMcZht+woBn
	CFnA9IMVLye6DhI3oYEjZx/Af+7ivyGuMqWP2HHuDkUya+GXyFaJPBEq0PP999sW2nEfc9XIxI3
	ELwozs8KkUKfsdtjuXzKSiR4tU5p6Vjpg3qfXIMFmQroi6NnALoCPVLJLt5PgtwIFQYjdWPpdEx
	z3s0KwdmhmP791ufSOij/mBAPwHY84Vq6yTL2L2Zm6tBK8frTfMH8VBvRp/X7JFXhM93we/ntYH
	+DHGLQKsab4e224KLfHNxZ8yliGhakrLoP/J0UZ09VBK6ookEr7RHe6dJO37A4BmFqLYOcN47Tg
	Q=
X-Received: by 2002:a05:7300:dc05:b0:2e2:d94d:6185 with SMTP id 5a478bee46e88-2e466044594mr9276966eec.4.1776757172741;
        Tue, 21 Apr 2026 00:39:32 -0700 (PDT)
X-Received: by 2002:a05:7300:dc05:b0:2e2:d94d:6185 with SMTP id 5a478bee46e88-2e466044594mr9276946eec.4.1776757172170;
        Tue, 21 Apr 2026 00:39:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53dcb487bsm18275263eec.31.2026.04.21.00.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 00:39:31 -0700 (PDT)
Date: Tue, 21 Apr 2026 15:39:26 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] mailbox: qcom-cpucp: Add support for Nord CPUCP
 mailbox controller
Message-ID: <aecprtAMplWlaiBI@QCOM-aGQu4IUr3Y>
References: <20260420034932.1247344-1-shengchao.guo@oss.qualcomm.com>
 <20260420034932.1247344-3-shengchao.guo@oss.qualcomm.com>
 <43db2263-0dab-4652-ae1e-f827d1dc5c28@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43db2263-0dab-4652-ae1e-f827d1dc5c28@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA3MyBTYWx0ZWRfX1lviDHEp8xZj
 KsKAtzygpUEs9BJJY36WoxT/LcVhyX2tPqfIivgn3cNNiNNcCiCzUjWdn9EqmeO/SpClGW8txgo
 005E8WEbvYq4foXXckoWnuyEtptQD1FW0CcSoTazm532R7ui/VCOmPeEiKH6QrPAYWCtdi8XJgt
 +4HiivRIy4sRM/rGjrBsIKZ87dl9PXdUX2Kk0YZeMeeTVbrg1RMgMc+PZ86ipfi/JPrCpfnuDrd
 +iOMSD03NQHwhAkzl4wqNNV1XIth7EVOVgVgW/nyEzmKzSOEVXoCV5mDOmmhcx/KdJmbyzucs0n
 LFfp1fp7eY9GzHni7efunDl4uf6Snb/QRnTLWQc+yIjUDu46YUKmgCM6ggwg3tqchw+cTbOwFwA
 92egjwmEnfZGPbLh2iLVhCvyONdppgpqYU1nY2CxQjUPaaXSt0K+fw0EB5+49GTTSuHRnRBBICJ
 741dfYEjGFe4yPmSTeQ==
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=69e729b5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=INs1rN3GQppflMMUrBYA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 9cGiP5rvNpqXSw9iJbPpd4G4qXxtmIsF
X-Proofpoint-ORIG-GUID: 9cGiP5rvNpqXSw9iJbPpd4G4qXxtmIsF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210073

On Mon, Apr 20, 2026 at 10:22:59AM +0200, Konrad Dybcio wrote:
> On 4/20/26 5:49 AM, Shawn Guo wrote:
> > From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > 
> > The Nord SoC CPUCP mailbox supports 16 IPC channels, compared to 3 on
> > x1e80100. The existing driver hardcodes the channel count via a
> > compile-time constant (APSS_CPUCP_IPC_CHAN_SUPPORTED), making it
> > impossible to support hardware with a different number of channels.
> > 
> > Introduce a qcom_cpucp_mbox_data per-hardware configuration struct that
> > carries the channel count, and retrieve it via of_device_get_match_data()
> > at probe time. Switch the channel array from a fixed-size member to a
> > dynamically allocated buffer sized from the hardware data. Update the
> > x1e80100 entry to supply its own data struct, and add a new Nord entry
> > with num_chans = 16.
> > 
> > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> >  /**
> >   * struct qcom_cpucp_mbox - Holder for the mailbox driver
> > - * @chans:			The mailbox channel
> > + * @chans:			The mailbox channels (dynamically allocated)
> 
> I don't think this line is a valuable change

Indeed!  I will drop the change.  Thanks!

Shawn
