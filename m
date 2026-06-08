Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AED3A382F
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 21:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780953732; cv=none; b=YfzUCEjn5e9dBvVqw3BCUJcxfxNT9Tb5QgCAFLHgMY3q385zWfwRwNB7YgniTmn1Pl+ellkEpTtjRBFHilbdlDdwAQbJPW6f+A/Xnqfmd9tEiidVrDbQzKDaY/LoHyI9UCJO0FxwiRLgKC6/X5Q3K8Wz5SstwrB0mr1MiM35foU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780953732; c=relaxed/simple;
	bh=XbUyMXtBZr9pGNlJPLsBaaQCIaM/yl86rjmWv1KCVOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cna0VyewNkP/MkGHLw49cnXqI2w02pLCS9EGN5W8txlxS7gwoEeBK0rLEy2PksC2EGQhA91PltWklcanXkKT2toEIQgAXw7l17b/TuXkyn40lST2bnLzXyw2GJlmbgVh5cgO7xDVgk+mvYUP7ZGWW7rYlNFsZiRGUf+18VudQC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RmEelbEK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jWBrG/wq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RmEelbEK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jWBrG/wq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658Iv4Fd4086325
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 21:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hVz+fOVuKO4smSW8RDC/ZccU
	4SsUeieaUdAdJIiuWdM=; b=RmEelbEK52Q87W07SRl7Rxzb02+Hwh7d9WA+PbLh
	BZSf8fLeV7k3EOCjRrOsGL9r94GdzmtxqPpUJaywqYTtPSVsGdRjoxOmbKuepUgC
	CnCQht+Pmj6RqRYEnMvIZDqQc14GDp73mfVXerfarVcW7lPYdvQvtX23Wp2/5uKS
	9yXahyF/fztniHGyR39wXQj0JxWDcxP8VkGPZ0s6ERnSdHyXJpx0SRhyNY4pb25U
	vLh+1TWEwiTCCqH5okO5Rg7/2rKJSDavBTHfL8It7wHN9SkG3toT7hs8pId4O161
	Ys3CxM3WIUyZDHGfD8UndoZ+9JpEQtLz7k6UZHRQ5bs5Qg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun430bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 21:22:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf08c2a24bso45214005ad.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 14:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780953730; x=1781558530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hVz+fOVuKO4smSW8RDC/ZccU4SsUeieaUdAdJIiuWdM=;
        b=jWBrG/wqMwAiP7GdJjYbmqs2Z4yDWdyWyPNCiQA37P6G0fgMF2+Y9ECkELMT91hTbq
         LDRRt31aP1fzV/WXkxtITrPMs7ejV/e2u6iEIzqfZWp4rMRGv9ctOf7hR28JScjZ2kAk
         lu4jOAY3ZEej/hQqLhCSv2xhZQVyHmgjabxBkH7QSAYpCFDbhkM1cICXGi3Dm0AsJw+R
         OVKNiJIEw95FOGzxHhxDPnPfswie7s55aW0L8nn3msnjH1IK9ZMQOilYXm6ZMgbmz4IL
         bLRLRf9eZMc4QMPmB5IVgQrOfFOeZPA5FAAF59iwoUrrK3OX0hu5TuvGliFdhEIj2SIu
         eXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780953730; x=1781558530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVz+fOVuKO4smSW8RDC/ZccU4SsUeieaUdAdJIiuWdM=;
        b=gTFdEPmFxhBrlwrb2NdGdaLM9RrGh3YGzZ813hAo2BjCW1mwoOEkaiZp7+4VMvutYj
         0OFCvRvRgWCMwZ3Mc6/2SEhlHGYLzevoXoNl12pVzpha7NtcxetQ9ETUZaRFUYOQg8sR
         TUiDmSyTq4F/gtRaCu/6y5aERiaC2eIYiidD7tN3Vn678i5Ja0gTHjxvxltlUz1q1EE0
         x9wlYfBAIeseg8413ToYwTg5jlTmfz5DwExN+2WU4+3CjG/wYCspMH0wbPIfJZLU2tcU
         Q8TXVJq7UAfuAEEl7R8dSI2Y/g9NDZhGI7t4gLjckEzJ9mzM/Ov6nCybMk5KZ4Ga00vK
         H2Lw==
X-Forwarded-Encrypted: i=1; AFNElJ86Rur+7/JwiOE1yt3BTwKJiBHL5RMQ43fPyxUZ46Oh8GE2m5FaqTLNoUGNpPYfS44vkLmBVep8/l+N@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1hIftZ2i6nJKEAFoamGR4Tgcua2IEh577uVvgg1DeOFPBd8LS
	jKCjVKn1iflxOMnKTwRG8cKKwgZLqArcQRixdaSe2Ck1sFiw1jIYeOxeR/OTpsiQeYhA4MR31rU
	L1tC127MBV5tslbgk3WggeEcIWuJ1hvtVPnsb5y2zPUL4Z171pb0RxpLqjW6ZNGE/
X-Gm-Gg: Acq92OEwlmD3oE5nwlFlfWown65iwsY+wvRo6CbQQeUi3dFy1FOUO6Pffsh2LpM7WFC
	rf/bxetXsb3YZnFG7s9mt0smDnNmZxEoYLLxZhny8Ul9dUma+JP0E4GQhRrCdfrDg1+RU/5u7XN
	/ZgK0Vg+AZoZa909jQXpUACnkaSVxfdvag0Yu/oDmZUoxKvp9iTbRAxanishtHqDQ7QSDZ+7+cV
	fOGqreDGBeVAmsKqkfb+YZXidvZHdwGCkGxSlJPttqOl5T32LuZzhpaf034kXbgLn+QOyai2+qh
	Gz3p8OHkFxIY+20XjxHBcTxiWsvRcqbiPrqXwMq5O4r9GdFZhvLoHiE4NfZAkEW4GewNBVXfAvG
	keTrB4vpyQj9kjzye72CJF//XWmziRmRSdCSD33NT5d+T/JDA2CepikRoQsGVTmdAc7I8IQ==
X-Received: by 2002:a17:902:f606:b0:2c0:ccdb:e02c with SMTP id d9443c01a7336-2c1e7b3fcdbmr203235745ad.7.1780953729922;
        Mon, 08 Jun 2026 14:22:09 -0700 (PDT)
X-Received: by 2002:a17:902:f606:b0:2c0:ccdb:e02c with SMTP id d9443c01a7336-2c1e7b3fcdbmr203235575ad.7.1780953729507;
        Mon, 08 Jun 2026 14:22:09 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edbb49bsm62610475ad.38.2026.06.08.14.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 14:22:09 -0700 (PDT)
Date: Tue, 9 Jun 2026 02:52:03 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: lemans: Add OPP-table for ICE UFS
 device node
Message-ID: <aicye2g/HRlaiiEl@hu-arakshit-hyd.qualcomm.com>
References: <20260530-add-opp-table-for-lemans-ice-ufs-v2-1-2b46d3ac37d5@oss.qualcomm.com>
 <b56341c8-eb31-44a0-9385-778b5d24ff36@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b56341c8-eb31-44a0-9385-778b5d24ff36@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE5NCBTYWx0ZWRfX759WhHT0IvjV
 J4mS+8nvCsyOIjz5ssEO7I97HVEqeplXFfAOJ3Nk9Ynai32ZRXG48zeyhTHU3UHU0TEwoBzrQhV
 6MT2ylY9E5jo8aBiCFTXw9EEWuXFXkZP0hqdF/YQ3FES9fT/SLDQT8Ha+EOC1O5oNOAPJ/JvQ3B
 gT7wWx6eOIU8UTfHYjkpCLjlIdzGCp1T9XM/BNEr6CvqDVtCpKzIdEztDvshAnqv2pnBVvCvrwF
 EQUAgD6pSVkwIKlk5LWNY92xyd1Lua1J9RjGHYLespfcVxbwtMXpT9a0sYkILgvtTb2XyTujCIc
 0Nj93gWavAZxDqldwqVj9BuFYzTDk2UaeiKGcQVNZcws5jsytvhNnbYBfqSGygTlHrOPxRKy6HL
 lPrGhZIATabn4XwrY5PgoBFBxa3hEgZeV3034EBKcDA7FcQLYYN/Rh96Nw9iIHV1a+v/0+Mok1D
 BwRThTdgkmWT7HfjRSQ==
X-Proofpoint-ORIG-GUID: IfWt0x3rJcZcrO6JKoMeU2M0Yuy3xoPB
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a273282 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i-L58Xp8eqOkf6jkiZYA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: IfWt0x3rJcZcrO6JKoMeU2M0Yuy3xoPB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080194

On Sun, Jun 07, 2026 at 02:15:38AM +0530, Kuldeep Singh wrote:
> On 30-05-2026 01:57, Abhinaba Rakshit wrote:
> > Qualcomm Inline Crypto Engine (ICE) platform driver now supports
> > an optional OPP-table.
> > 
> > Add OPP-table for ICE UFS device nodes for LeMans platform.
> > 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> 
> This patch still needs patch-series[1] as prerequisite and cannot work
> standalone. Can you send this patch in same original series just like
> other DTs are updated?
> 
> [1]
> https://lore.kernel.org/linux-arm-msm/20260603-enable-ice-clock-scaling-v10-0-b0b728435356@oss.qualcomm.com/

Sure, will include this patch with ICE clock scaling patch and post a new patchseries.

Abhinaba Rakshit
