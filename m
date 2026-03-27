Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E723932E2
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 21:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774645781; cv=none; b=cXLdfuZW1UFFY+Pwsb26ImVoWvtPnFna4e3abLm9exuL1/O7EtxeqkxoJf6lsSjS0IDnlEQ2hmshFEz6B9E3KW6EPTWdXrY6rTGDNRz5cCwwT3y+qd6pF3k+K3+EkB4akb8LkZgdJZt8x4EywNtJSP2gjK91+AUkFRGJePwCRVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774645781; c=relaxed/simple;
	bh=xPmAaAmRjskAsbMZwiz5rfebC20GUQmK6lfDzqPwRHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFBsc0PrrhwtiFav4mvfK2FjXXQfq4ccoArElK/KZgP4rSVXcjUCV4h2zYd7MsRkw1xl/AM5nQM1LCR/NITm6UoNuV++xfRwsjzFMYfT/bQF4wKK72NiJw1YBuLV4m1u90WDDYrnRlyVWHnry6/dOYcgvxpxUEHbhMbwopsdp08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aKwJjL51; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KpmaFQXu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aKwJjL51";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KpmaFQXu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RKtRut1260361
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 21:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YzZWfr/MDiiTVEfHoij/tw82
	t2ttCOqWWYKj34YtaYQ=; b=aKwJjL51sY4SYfqN/KszZgteRf0sBMB9nSs6Qy0+
	g8OBzOLEo7KR8iEFjMqbimk3xjw/R7Ftt4laiiCBwgH1CNwc4Q6sDU0OdogxMjMv
	4vl4WI+O25PerZpTgQf3xhmtHBFRAWnDAlG1Rq80whdwjLyCwVHNw9iW/CPeUUMR
	ZXaeVGKsc0iPHdHHXwiUBZvh4cLIR8sl1sJZzppdgmv9uaDNJQ8pBBrbOIpHXFaW
	DDOIIJb/QyZR6u9s9jUZ9fKzXpE4Z3/7AnQ9EoQ/YkESS33DN3+matD3TF0e7/i6
	+t/SYc1y1MG9KivqjABJGt7qo3CEWCdpVqXxz+JJHMSVmA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5vf6s2es-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 21:09:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093787e2fdso119702331cf.2
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 14:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774645778; x=1775250578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YzZWfr/MDiiTVEfHoij/tw82t2ttCOqWWYKj34YtaYQ=;
        b=KpmaFQXuzAuTZXWYeO/26H5fnpeHafypUut4AOpmYL9iqGdafAV21SLTU4D7ndFWP6
         RRmklgOKV3vATTM/GUU/tCQxVv0LQGfp3d23LgbcSs4McU8C4DWJGUCEs5fFqMZ/tc7U
         HB1gwVxtv2A6zSTmXh87Ykq2xQT4J8Z43ffAv/r7UVIPiospsTfP2yCkYyqXt9Ux/QOH
         NHWZtQo+z5kt/fi5S1neEP8r/ocEBwtbqvTs8z0HmG6QzkVywmJUbslsUH22yr/des25
         w9U264y+xzR0rfcpC3HTUW6CrmiZV5mO/aNY7BYOwIwIjdXRNWiMPMjkxRsQThRmGDLL
         iA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774645778; x=1775250578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzZWfr/MDiiTVEfHoij/tw82t2ttCOqWWYKj34YtaYQ=;
        b=sa3nY6V1UEe937l0uxndOeLC/p7C7hgHqaK4frjL3qyE0k6Uz72shooNqYfg2TdkMZ
         o6Oa54+hJqnHiCxJxCcbYUxU1UoHFjFfsjVQ26dT0W7zgs2JY+/GY8zlBPqyZaBhlLVc
         v29AHn+be4W7s6irMAL/6HRHqRVCQq1sPTihMpS2DW/E2gVUo5hqACcoX93TYBQFGEFM
         tfqAc9MgJLUuUOF/gR43JjZh5pk8YzYf8DU2QMnBStZ1YcIkCrsUabrGNdNu3hHGDCx5
         4ZLE7wcKU+Woaov2+WqsdrEru+kHlc7nytbjfRBCdf/FI20clV6345OSZcaaiMsYscHx
         1/rA==
X-Forwarded-Encrypted: i=1; AJvYcCWRTpvyMFsvFipyR5EHwaHmNbVjA0ayxyvfEk1pF4c4ZKtRFgxgIU4GrPO7EmatiRVZiLqOcSyvk2Md@vger.kernel.org
X-Gm-Message-State: AOJu0YxL2a7mJ66xbG8MKFVneLdyoU2I4zcdfzb7VbAc9E1BwpQjOJhK
	GPmPBfDW3zpBijz96SESYecjmKHhvDO0AMJKQr5mARuhqMbQ8gEoXED0Tg8AObYyaRtdumXH7Nd
	Kr6UWBZIrWxRSnTSvELfSKrxOx2ukVyU/v5sK6Gw05o10ohi5bB0jb6nQkq8UIT5Q
X-Gm-Gg: ATEYQzymyNVWbl0PvtCxr7WBkxAOutw60CBoGEFnz7+blIRZumdiTKqa8dWQqHZ+F6F
	ePSrrLl+FXUyKP0Hi9llBkvGZcpZw5iOOdkyzjKpfeiV2WYevBd+HeBvQ77bRHB8EvLD5nC39i2
	YdBNYaBNEN/wvAbYqyjKZJ9FolM5kLnuxNj14csi2JB8iYUdXUPaAdnR/s1P1QMIXe/5Gc67j5D
	DoZk1kLxYEkAw3pVkOajyhVsHNr/NS4seHTKzK4rcCHSx2vY9UiZRAaUc0feFNMeJaaKfwzyHgt
	nBuDLz9VSBbz5DMT3A+LJNd/9zYhZ1ePun241HII1xr9EsK63LwytppjPn5e7wOrws6CoYhzm94
	Iz1PMA1gLFkMTFqnJfs9umyB+TYKmkwaHciwe67VvnKC0OdLVIIEyG8Gq2rn5oRYX3EQZnsuZop
	z8kq9IVdFfIsY/S4dlMv4XbF6bvtnH1dHBDtc=
X-Received: by 2002:ac8:5982:0:b0:50b:346a:d253 with SMTP id d75a77b69052e-50ba38c99c6mr52460321cf.43.1774645778342;
        Fri, 27 Mar 2026 14:09:38 -0700 (PDT)
X-Received: by 2002:ac8:5982:0:b0:50b:346a:d253 with SMTP id d75a77b69052e-50ba38c99c6mr52459751cf.43.1774645777872;
        Fri, 27 Mar 2026 14:09:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b144e99bsm23482e87.56.2026.03.27.14.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 14:09:36 -0700 (PDT)
Date: Fri, 27 Mar 2026 23:09:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Steev Klimaszewski <threeway@gmail.com>
Cc: abhinav.kumar@linux.dev, andersson@kernel.org, bod@kernel.org,
        bryan.odonoghue@linaro.org, conor+dt@kernel.org, david@ixit.cz,
        devicetree@vger.kernel.org, dikshita.agarwal@oss.qualcomm.com,
        johan+linaro@kernel.org, konrad.dybcio@oss.qualcomm.com,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
        stanimir.varbanov@linaro.org, vikash.garodia@oss.qualcomm.com
Subject: Re: [PATCH v4 0/6] media: iris: enable SM8350 and SC8280XP support
Message-ID: <ebzdn3aplm76xkvljwpg6v4mid7ljslhzwnf45u4obgwhcnckh@rtdv64on3y6b>
References: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
 <20260327164651.45628-1-threeway@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327164651.45628-1-threeway@gmail.com>
X-Authority-Analysis: v=2.4 cv=X/Zf6WTe c=1 sm=1 tr=0 ts=69c6f212 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=S4w9ywDKMMNP_Wft0cwA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: SWm48fHzGoj4aBDfeM-GxTwcV2EG1cPA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE0OCBTYWx0ZWRfXxzC2IKWIZjF8
 9aJwQlThKti/QUo6/bEREOaga75Vg2eBAZl7myWThlTCtRffKK3NEB5SsHmN6GHhWsW7YvyTPNJ
 92Y20YUgRaWMXAXZpDwXkit8C8rjHOIIE2EzUDBRi23tv6MvhS8Jlsnil/tMXixT5bCVEseaDn3
 ffP9W+YuZt1EBodawVpOdj+ZdJw35bVoCrOiZPUWlPqmrhTCg/LfRHtCqkxrAk8X9DgyviUAeKF
 AlEylPq27aRXdCO+AGf08CRN28F4mtRwlELlNslwSQhCuSpo+VVQ0lWv82r8ActuxoKSLP33q8W
 7yXAXwbDqUJQUtVj3DU9Fb3vtr7L9+pYgb+Bxq22QoMLUtXcAv9J956fJiiPZKgLpyYPt3IM9TZ
 k7nlT+0xjVwHFgNvSi3c0XqoQSxhxnRJncGOs3F+I4H/vQUZ4kcNQAmWuw8ttPXGJlO/k9ZxqN3
 iNwwLZYEMjNHAQTkp0w==
X-Proofpoint-GUID: SWm48fHzGoj4aBDfeM-GxTwcV2EG1cPA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270148

On Fri, Mar 27, 2026 at 11:46:51AM -0500, Steev Klimaszewski wrote:
> Hi Dmitry, all,
> 
> I've tested this on my Thinkpad X13s, after disabling venus module otherwise it
> loads venus not iris.

Venus with the SM8250-related fixes should probably work too. Anyway, I
hope that the series switching SM8250 / SC7280 from Venus to Iris will
finally land...

> 
> So the compliance tests pass in both el1 and el2, however, if I attempt to play
> a video in totem, and then skip forward in it some random amount of time, totem
> freezes and I get the following splat:

Thanks for the additional testing!

This might be:
- A bug in the firmware
- A bug in the Gen1 support in the Iris driver.
- A bug in totem (heh).

Would you mind sharing details, which video were you trying to play (at
least, the codec that it used, please).

Also, does it kill the playback afterwards? Can you start another
playing stream afterwards?

> [  143.388380] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0xd516d400, fsynr=0x600002, cbfrsynra=0x2a00, cb=6
> [  143.388390] arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x2a00
> [  143.388392] arm-smmu 15000000.iommu: FSYNR0 = 00600002 [S1CBNDX=96 PLVL=2]
> [  143.388423] qcom-iris aa00000.video-codec: sys error (type: 1, session id:ff, data1:1, data2:deadbead)
> [  145.913827] qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:e39bc002
> [  146.945692] qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:e39bc002
> [  147.969651] qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:e39bc002
> [  147.969693] qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:e39bc002
> [  147.970493] qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:e39bc002
> [  148.993683] ------------[ cut here ]------------
> [  148.993695] WARNING: drivers/media/common/videobuf2/videobuf2-core.c:1827 at vb2_start_streaming+0xe0/0x17c [videobuf2_common], CPU#3: totem/7330

And this points out an error in the Iris driver. Quoting the comment:

        /*
         * If done_list is not empty, then start_streaming() didn't call
         * vb2_buffer_done(vb, VB2_BUF_STATE_QUEUED) but STATE_ERROR or
         * STATE_DONE.
         */

Dikshita, Vikash, would you mind checking it out?

> [  148.993727] Modules linked in: michael_mic uhid
> [  148.993732] qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:e39bc002
> [  148.994543] ---[ end trace 0000000000000000 ]---
> 
> 
> This is much better than the previous venus patchset where accessing the
> hardware decoding would cause the machine to hard reset at least!

:-)

-- 
With best wishes
Dmitry
