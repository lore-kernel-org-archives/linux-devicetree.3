Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E84439354
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525640; cv=none; b=h8vbbmRJCBNeYMfUNR0yjkfHqKJaISwYyxed+vrHR7CSS19y0oKLeCiBmUmJjpVnDOB9lMuPADb2ZlkfEyZr4HZ9vnD/BDuKF3HcOb69rbIrT+hbH2zZIP/gtiAqmpNy/JOaJuUFIClp5t/ALnRPCtu+XneK1QMHsp6kwUfB8Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525640; c=relaxed/simple;
	bh=Ay+Ukqa3pzCDaC6oLtgtPlXNXQzu2WpmsfhmZGnE6tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0rsqiiaG5ldcSItycA/Q++roGY07KupgXKumf8ntd6yQonGfd+tR015OvyXIvbkQP3NPIaVFiq5h0Zt/QZOCjeC+yfS6XIl/I3pKkLSA7zz3Uqu1Lft7PiRscQ+o8sl8v+kr543KuKSDWOln0JoNLoutrncQtFcjfJp+fsSV7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dWMuxsfp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iMRO/ZX/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dWMuxsfp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iMRO/ZX/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C43sV2752166
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 15:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sx7FMxQAqFR+iHVGYKMVEDh3
	O+yKM78hrnZrIOQBhoM=; b=dWMuxsfpjQaHeGXIcIx3SxqfZmvh8VPG9GXRb70Z
	TBNsC3thjdWSizfnvIFg0vIzQFVWwcqmbKL9YGjkyWfMFp87TOumsX75ldtTmjFT
	6kdUUHKG5fqQcAVwErxNoglDiCpJM3xNmItMGGWTmSVGlc3hL6tCvbFq2CDFLLyN
	Kvvh2KRa0OwafRfBCvj1vX4ifWUJmGGMtBnpHFD8a0jwFVaSQFueCIqpJTPdrkxS
	V0tgtPhGW5J8yFYNh17KQkRETDs+wEis2UIQkgLlOL7+AbAjgX6N5xKupnHsHrO1
	TwjTYCY2mz0ijzRbTJqSwwMFM+uHioQyby620ip9P/BtgA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9cssu8u2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 15:47:17 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-96939fcd33dso191169241.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 08:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783525637; x=1784130437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sx7FMxQAqFR+iHVGYKMVEDh3O+yKM78hrnZrIOQBhoM=;
        b=iMRO/ZX/6Ue7VNIw2j2TMbx+MIiVuy6szYgIBUQdkfIwDvbZXtXcUIfwyZnhFbO18i
         QI0KzLps1ARknRfUCUHrDvJuISZ8bgPLM6K8w7RP8H0DS68rKiC0HTuDCfr0YLLOJWiI
         igK9pYz6LMgMMQi7WfmT/xQdTMGuiXRCK8pfk68NBnQt8TtZyqy8tKc34cSSx/jSwKtT
         389doBjEiJ6DD1KZUwWy3sMQrEG//AEJL5q4hGABipDpCFB9UP7BPzgyzwBH8F7/YQJk
         n8I3brUx6/Q1rNaFSP5uit1EcCDjbB63O2CMxb/Wh+6N7PoPAtu0QBmVamNEsV656nWR
         TZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525637; x=1784130437;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sx7FMxQAqFR+iHVGYKMVEDh3O+yKM78hrnZrIOQBhoM=;
        b=MITlMR/94axKggTKaydnAlkDBoceXo7PILOl/7ZAKal15xwUJp8AzdBOI1IQq4J+4P
         W8Zb+cr6nhsWZ4/JIFdr+dY7NY1MoWgBfyiEQTZOtcicLNkYq+YRsrnpUrf465aQ0ler
         QRYHuY6bRUdeOs8liB1x7455IZpbyv1CDOKL0FtJ4NOgKoMozp57HHUOYI4JxH+GIzA0
         CtNpX4wW+n5KjNUVfCxtbI+ItAp5UN/ZsSuBZB1if04hHcQXIzBUMvd7kUXEVc+9PSa5
         oUFToBAuqTRUWYxckHJrtBwy/I1FadxcW4C4kjogtznfhzn/LCNcFRfrx6Rjs8yKvSpl
         MdbA==
X-Forwarded-Encrypted: i=1; AHgh+RqazXBdwEL9ODwbLqcSG/NZCsHeeWjtRS49/F3oj5OA2+V/iVGUmKsg2VZCp4DSuVB0L6XotYK1da+9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy96EfsITiVpA5B5mhk/QxOzTRoOd3LR+9u32TZEmPxbizhNFVT
	wUejmTJ+Gg8HlG2bfmRYpbNLMKRAfHtUtSumE+oHszoyvPqa7N4rgD4yAkXhpWM0g3nuTBqGcdi
	kQn3iq9FmBqkeCZyyzJLbjT+n2IXz1SiDlOz4Z6JevP6W4XP6Nmv/lm5V47pIboJ6
X-Gm-Gg: AfdE7clFqKfLh7wAaYpM9OiwXub1U8iB138zEdDX7JoEf1FY/jMwNgz5l9avcvv1TTh
	Fn0SVFv+OtSZNeIGPQ7S5LTm8wQD69Wg51aIosU06ZixPLZMdP2Eboxu78DmQfz0LwbF9yBNkII
	EzBLy5YnGup6H12K7nBZz4DA20hDfptDmeUprJU2BE96tCIf6p6rBq/S6kz0DZGk5HU9FRlHoTL
	FlVg3B+H7k9wzAgwvldR6xG1A+9UNStRZOgwTNvXJjp4sQozygKHktTiJGZzdixzdk/qfcn+chH
	KU7s5guHh8CF5yU0d2JN5clwWJKX31aLwREjP28Wnn6D0KvCuSPqq0zZN9TaniXu8WozU0D2i3r
	1bLm+DqdxqPKNjGdbA5zpyEpVBZHDqZZ6cMjXVckJmhjcnZ40PW2AmiGLcHdoyvL7gr4cn3+76E
	Xpy2I9lupyUCt4L3+iO9pFybWi
X-Received: by 2002:a05:6102:5984:b0:738:be73:55e0 with SMTP id ada2fe7eead31-744dffae44emr1608169137.12.1783525636532;
        Wed, 08 Jul 2026 08:47:16 -0700 (PDT)
X-Received: by 2002:a05:6102:5984:b0:738:be73:55e0 with SMTP id ada2fe7eead31-744dffae44emr1608142137.12.1783525635802;
        Wed, 08 Jul 2026 08:47:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed136f8e7sm4659097e87.15.2026.07.08.08.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:47:14 -0700 (PDT)
Date: Wed, 8 Jul 2026 18:47:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add GPIO line
 names
Message-ID: <wp4u6kmfjekku3ug7andsz3weyyeqeqxulv3btedou37jhyxie@4x6ncfiqqix2>
References: <20260708-gpio-names-v1-1-9162105b9971@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-gpio-names-v1-1-9162105b9971@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4e7105 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=F2uzNt_Jvis__oCUEkcA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfXyWCTxaf/PbUn
 MeRj+byKhRglySV/UQw2ZcQCTeeC8SDrW1QZo7nlJVBHctoLQbkDNufDxBxW+s4Uwxovxef5ecJ
 iL7n021J3Lgvyv0cKS4lMIdL/N9OWlUtyRSUZ1+j7CLS1y8xVFWpraN/Urr+4SoQ1q59NwWY1hc
 u1+NUFWGC6Ty7UxjIKWZaZJVxV27vaeYDQ664WzV+mVHSTMlhXzSgUe5Un5SGBIvZp2fe5A/NSF
 7fxpnL+vB5Gg+4gu5og8OjoJrgI+Ogk+IINg4iptPbOLHlW4TFU0nm1PZkGOf72B6mbZ0XM0wqf
 /PpXBES3HocCrqiABQ4g7LQggnyaxjojL8wQfJBbtwrS3i8GmY5hckoRW74TBv2ynd7pY6PsAE8
 yB/7IzRNwMVXV5BA7tjgWbphqwdkFwCYXiZAUZuP5s1hryInlFIElBqhlmv8SYGbppzO5NF8Kfw
 cxHyUUCrXSnDiCbrAZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfXwfdVU78XLZcS
 jyTQ2hNYWkV5MDQS/zA45UV2pEEa4vhHppNl6AAx1lCz5WIfi3cltxkg36eW2vpGuD6pJTBXFqF
 Bn+X8G/ACHPqTcmu0EWhfC7wxeZEB2U=
X-Proofpoint-GUID: WWPQW6S9NQ5toTXx1NSidzxTNZVOcKF7
X-Proofpoint-ORIG-GUID: WWPQW6S9NQ5toTXx1NSidzxTNZVOcKF7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080155

On Wed, Jul 08, 2026 at 05:34:21PM +0200, Loic Poulain wrote:
> Add gpio-line-names to the tlmm node to document the PIN functions on
> on the VENTUNO Q board. This covers the different headers (JMISC, JHAT,
> JOMEGA and JCTL), the flat connectors, and the SoC-to-MCU interface.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 28 +++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
