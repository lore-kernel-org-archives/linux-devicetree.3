Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17DA40F726
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717326; cv=pass; b=rELWT6TDQvLgJzlgtOTMyuBnCee8Z+Gn7jr6aquUd4PEXxrg5JQZrXrziqq8+CTErP19fGq/bb7ckeFVIUc4icN2hibCiWQIf5La/IeRwueSLvP+By06TkP5CBigCBdG0MplFHIQ/7corUv3nu8syabxilAWTpfpIsIxrjFw76c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717326; c=relaxed/simple;
	bh=TJdCxPLRucrgpVqb8Q/p90ezgDTTziOz+2tb9QKZq8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Za50eBl2vNLO5ZzEshaSjoYK1B8St4PChEs5YZDQpoF9JtcuJoJ5x+3zzyZRocr97JAoqxjBLR5QMQCkN2qBus+Tw5uS3OWjnd4huV4uH92p757s+QkwOcSEJ2kVQNeCHqaHUNUS/qj2VR0/tqgQAYbYAAEwrVh3b0XA9IMegRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eYrH2IjR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c6LAl3/l; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eYrH2IjR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c6LAl3/l"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x9pE140659
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x9weLpInmFviAD3H6syM6zH0
	Gtd5QFWFlEYwRfjMy1o=; b=eYrH2IjRrClTZEc8uQyOWXvoeYbNQoAygCso+l/5
	cNABL4Z/N1JyhErVGDFRCfdTUUfFeu3hwxiHLf2KPV70UJh9HlnCDJEOnG2AQWyQ
	vyZRGnMwCf2MALMuLsMAE+MGnf9cdmqiMnoetZWQ5iRUTGoWW7lS0bRK1AFrCXGs
	94NJ2dinlv8VZuF6wQ5PJyUN2uFrMdqewIMtMZtl3TFjgKOEppCiwo5OQIaXd1/Z
	QMsr8ccJn8kd72utiHts34Vh5PTeLwdct52WZERLCgrHCn25ssh432ooNzL1smJt
	l4tqx5+leDCGxARByr8Fs1wlCl4kWyH+p3AQaDa0UGbRDw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjtn2rg6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:48:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccbb61893fso262157985ad.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 03:48:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784717322; cv=none;
        d=google.com; s=arc-20260327;
        b=bkyhRrSSPEWCSoW0mUoTBRKkzvb1SvlwDFxOhAFts7sc8t7zrj97uMWAhdx090pRnL
         7i7J9U2QEVqvNWLWGj1L9nLTmcOnJ8nFBd5yePTKfrSrV5oZd/HR6y2Zds6ntZ6D90ho
         Qebw9vskVoZNqB9aKXzv27AdT667AN4jGSyyh/dy+DmWU7PXnC4kby7K1hL2H0BPoeJ0
         EygQHKA3YXveCMieP7seT+hli4O1g2cbfWHOlxSsMp2GsnI56D824VubAiEMkYN2dMPA
         WXg620EeQ+NytMuARwI5tYwcPPo2QTjP7CJMlS9AQ2Zbac3/9/l1kechfIXDQAo9Geup
         dXHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x9weLpInmFviAD3H6syM6zH0Gtd5QFWFlEYwRfjMy1o=;
        fh=4BX+xklawnUgdR3UVdx0oeL2CO8/zgaSHRM4k2jFzx8=;
        b=fs0AkkB9LnTC1i9tTOehdAr4G3bjN6/7goaBD4iv1g5ElIFLSn5e68KWg8EN2206hx
         CvE/sC4ItxZ4oytjhXITcZXjiDLuCJw9Cq9O+HYnAp27Dcrar5AY95Jz82PL6A14/G0m
         rGRDbp4W6G1FqNQzhKENkX25J8uTEwcAwmAscNLgQlkiJp6haTbKWXBuznrayyqI73gJ
         tNtar7zn+41UkKQ2xot9TPVHGr7jIwwy27BpK9EuuqViKon7IWMjXA+1IByNVSMSLZEA
         tRH9jhXaYmg7/tBa3SYON/8oipTAIjnCLJ05sA6a8l9uWKut1XIvNzxK2bJN7wYWEOBK
         e3hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717322; x=1785322122; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9weLpInmFviAD3H6syM6zH0Gtd5QFWFlEYwRfjMy1o=;
        b=c6LAl3/lhfmCxgrp3Ec40S44lTOzlxoFn1qirkdxZcpJWvhMt6l1Szykm1xyQTqKs4
         iEVZdMjmqjQ0UkiUUm6vExsiTtNihx0tOaGVWMcgMVxdwFtr/mWYOU3+LliTfOLSwzCX
         39LMFdT74gCFOLeJJXtvVh2V4HDWe3LK7i3oR+aPIo9kTVnAssGBWE6dmZUnoSniD7H6
         wZ59LiSYlEYv60c2Xvj09L+BCXEn+gI9cBFiarauaEyNm7Z7E9/HD3+9bnm2X1Y3u7uv
         KKroI6zTBCrk6DNKtn4h24GFqs44VbluCDbku0cVmjGmVnsxBpx4d5vahtMXMrF345j8
         WEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717322; x=1785322122;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x9weLpInmFviAD3H6syM6zH0Gtd5QFWFlEYwRfjMy1o=;
        b=lXlyevhV7Kzh5lsjytePvh/4+SAymzCGkps3bjbgbI5uixo0ALSPDX5HKMV9S2ffht
         eIsMQSeqsxR9jXOw/SA55Ihti9cVol2BVhyQTHHSarqyZ6mLuyfxzY9HEBeuZKZscAFO
         avv8XTlf9xx/LqE87C7Cl+hNT25QVUKWByN2pkRiPNZkJUXSPsTx2axslRPQ+uPEOV6D
         arFUJexQddCWVJXZdwCf+CARJE7m6n3+gMN10GiiB6MDEgiUnpASdCsgU/XGbFbTa9Jt
         XUMLy39oh57KhyZq2426/nZ0/41YxG69v0G1c+EkWG9c5zfx9L4nkHDQgn+sX8Fe1oaE
         E6GA==
X-Forwarded-Encrypted: i=1; AHgh+Rrz3rjITccjdDZkKNVRHpOzVGuB7RpNieSYvRmRd54JHN9Tf+R+fJAK5KDMsOw+kU4jv2yXz/maDuwG@vger.kernel.org
X-Gm-Message-State: AOJu0YzQnAS3V/7LyHIJ2DMqIMW6OEIipe1Ihrh1+AIgYSMzi1w76YVa
	Ve52ZZf3P5z4/EsJgzzU7Alz9XOZbXtjTw0DShTzmvZrByiGs6REjzATZCCC4b3fMriWciGdM3m
	mA+ai8GXmZUZFwwgaWY6ObCrtdGarEQ/l6uc86gRjinacns9aiLhFqr45v6UhLwQ9zjpenvL5du
	JsGQCDYw6atva7tKi8pqZiRi/ibYxqQsTTxq3SKvo=
X-Gm-Gg: AR+sD10eJZaCSJrnCjyMo+gUoX8xfn8fF47PfXuhQ0vPWZjxQODkx0RkPRy68zIECJP
	g+UmdB2NZ/HTHVOR/XIF0DSY8+UXZqOL0Qf1YDKuOPyLFNCcBT1ed3wpgly4LBNdXgZwLL4V5/d
	1La6OGpzBa9dSX1+izVSaaDCYdn8elx7E5LPVla/9q7hikhC/HEEK8zfijrHOxlwcfp0aUGJc=
X-Received: by 2002:a17:902:e80e:b0:2cc:9179:32e with SMTP id d9443c01a7336-2cf3481bc46mr240434215ad.10.1784717322123;
        Wed, 22 Jul 2026 03:48:42 -0700 (PDT)
X-Received: by 2002:a17:902:e80e:b0:2cc:9179:32e with SMTP id
 d9443c01a7336-2cf3481bc46mr240433755ad.10.1784717321579; Wed, 22 Jul 2026
 03:48:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
 <20260721-drop-sound-storm-v1-1-23ae4a689ffe@oss.qualcomm.com>
 <85f2799d-fadf-478d-9f3f-fb8ff91ba84d@oss.qualcomm.com> <6a609d87.87c5160c.1accad.0f33@mx.google.com>
In-Reply-To: <6a609d87.87c5160c.1accad.0f33@mx.google.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 13:48:30 +0300
X-Gm-Features: AUfX_mxJVnMuPbQyqLMRl1YwpMnVztpdNpQ2DTiLQfHenm24uUU50tozkQFP1cw
Message-ID: <CAO9ioeUw4QgW47xmC58dGc1_j2UPFjDM+dDRF-bggpBPFA32YQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: qcom: remove ipq806x Storm machine driver
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNCBTYWx0ZWRfX//iK0PBMgKTD
 E3xHFTPBFeSdhFmvH1v/UnHoVJJW2dyQn+Mds2LG4cL0xGxKzLIg3BbVuJLaO32Xo8aZqA99OoF
 JOl9ZXIQG6ZFkX9Y+0W6zr92ldZtf/2/7z6fw9Vdj2aBJMAHso/b/hq5f1T8RpWDNB99Q7b/HTB
 wTV/NJ52Wt/mZWKPOEdsze8tqRNfGXqP49y6Tdww59ADvNA9L62/+5bdA2djhsEMdJw96l5t13B
 i/PoDuy6aDy0wGKSsF/ho+N0ZnNWuTcbu7Wu1w+rn4A+4axkFAPjIsYmU5xRyZQSbfJbOza9AVJ
 u003NTzPxgWx/OVHFoPse7b5T3W6uQcED8cBCI1ToWxli5702lBoQADM3/AzLtQ3vWxhoVmAGZ6
 H6fbaV1Efj0f8nqzCALkSyKrWDFBA+bKzNPH4W/25+uBkhU359qY4FTPfEjezI/nSJFzLHPShb8
 aXbIbH2Rf14c/VBgfDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNCBTYWx0ZWRfXwis1N9iIGmWi
 5kKV1GqNQAWBKjKQF5WqfqyL5xnwUxQMiXZotzrI2n42LhAWCXF0UtLsJEvJn/Duv+XEZPMeobe
 FqT//QZnrXx5Lw6qKydXZTMAdA4s7nk=
X-Proofpoint-GUID: -OVTvOXuIq3nNdvTlPEZWTnQKiRUhFrV
X-Proofpoint-ORIG-GUID: -OVTvOXuIq3nNdvTlPEZWTnQKiRUhFrV
X-Authority-Analysis: v=2.4 cv=T+28ifKQ c=1 sm=1 tr=0 ts=6a60a00b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=s11Qgp4bjunoGJnHrnoA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220104

On Wed, 22 Jul 2026 at 13:38, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> On Wed, Jul 22, 2026 at 10:00:34AM +0200, Konrad Dybcio wrote:
> > On 7/21/26 8:12 PM, Dmitry Baryshkov wrote:
> > > The Storm board machine driver targets Google's IPQ806x-based Storm
> > > reference board (a MAX98357A DAC wired to the LPASS I2S bus). This board
> > > has no upstream device tree, no active users and has seen no functional
> > > changes in years, so the driver is dead weight.
> > >
> > > Remove the driver together with its Kconfig entry and Makefile rule.
> > >
> > > Assisted-by: Claude:claude-opus-4-8
> >
> > Using AI to `git rm` is definitely tokenmaxxing!
> >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> >
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >
>
> Honestly I'm pretty angry about the latest changes on ipq806x. First the
> dtsi just because there weren't device (it's ok and understandable) now we
> are starting to remove driver...
>
> There are godzillion situation where there is a driver but absolutely no
> dtsi. Lets remove the dwmac driver, usb phy, pcie and everything else at
> this point and treat this soc like it's a 80-90 code...
>
> I will post dtsi with actual device for the SoC but really I'm not
> following all this hurry in cleaning code for device that still gets used
> and actually some company even produced new one (even if it's EOL)

We have no way to check that the device is being used other than the
DTSI present in the kernel, being updated from time to time with
non-trivial changes.

For the patchset in question, do you (or the community) actually use
OnHub? If so, please consider upstreaming DT files (and also updating
schema FWIW).
If not, the files will eventually go away. Just having unused drivers
_adds_ a burden. I stumbled upon the driver while reviewing a patch
changing the driver (for the sake of changing the ASoC API).

And FWIW the series doesn't touch the IPQ806x LPASS driver (which has
a DT counterpart).

-- 
With best wishes
Dmitry
