Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF7B403E8E
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 10:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787566270; cv=pass; b=e3ktpbQwF7Ryk3RolL8NN5K6WJWAwvOWLTLXvBJF2ZIhxpl0bP1ohQje1whksvgg4GjQUwz849Ir33A0gKuOhXW7J9ulWz9WVQ5oU5fhCD9a700v2oCgwj42CPKP8ahcLZY2RUck88s2pP3ZqdrjT8UMGAvAH9LV0Dq36WW74ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787566270; c=relaxed/simple;
	bh=o01YkiL2PGmOZI/FMH3AD2Qj/EckP+dFtIF5ig+V9Mw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VTE0SkzFGSK8omgVWgC0kM091dtGxB3BMwkATiFA34kAJzntfPm7RCg3JISq/klXlyFLcUNKg9X8EobECvUvK+C6HV3by5aWG/q3Y8TAkGD+xS3nkbk85oIXlASfbsklVBIy2DuyYnyUDuMMZ9e7MURT5mPY6OoTrRhdJC9J5OU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hrnQ8ioh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RbG20eSK; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hrnQ8ioh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RbG20eSK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O998xM1378549
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 10:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xFdPUis+b0SAqO9e1+lFVcsXPknHkq+UuXFEMP6x2vY=; b=hrnQ8iohcG6Rjk1s
	QqP/iPbBW1WPpiy6kAdH8IJ2EyXnqCUdL8XLYFHTI01BwCQPMqZ1s5CNcfPm24uO
	zv5gtNMDHKKDs7b+pNpQEfC7WAaeDn1ftcn9znPvLwQADvtGOuKyTfxzAoTR7svv
	bHRAixOHElB2RMZRxck1dHapFCnw6IyBlsIKbl0J7JtoL4WL9APJPY4TxyWZ+57v
	eqw0wVnYqEvMLLrQ/iQA4CU5wbRlAbZ15BE1CJMIhyir6GuPj3WuNsxUt2jAmX1r
	6DJlhyaD9A8Uq9Qfb80HdwSO4mSTWosEI6F6H/PKnFPqncgnBEEJuyyBv0n3uj/g
	qFA6AQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf0pmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 10:11:07 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81e6fce9ed7so88380307b3.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 03:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787566267; cv=none;
        d=google.com; s=arc-20260327;
        b=ENkCODoxNTu0+4seXJe1zelrI8SZcuE//ncBOhkzyQaSGA3ZFfgnp8dLQLYEpy6WWf
         tktEeVSW3wdTyjLOJHV0txzXrVwg3iI4PakLNQCwfPMeoz1qaEdcpdoV7lZ+ogh6mRWH
         FW5nS7yiqotifEdENauvMUrT81/zEivPsAa0GT8K6LKJvpCuOTKawgbiZtMpoK8F+p4/
         DBQvc4/gAXIeLIHOuQegPN9dsO/q1VUFFhYALmL9IZp4Xjg6hc0MJTMxgJ6JoOtLydf3
         F/5fRyPmbvq8xvFJqxoTrLC1sXEtMRJhV872EfuyccQoEX5mjihKglTIsgoQGmLUKDRI
         BwEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xFdPUis+b0SAqO9e1+lFVcsXPknHkq+UuXFEMP6x2vY=;
        fh=8+NZty2K3JyNQU0Dc1b4/zheb/Wnta7gBcqaOp7bzL8=;
        b=ntCk3ZsxChbi6cjq+Sm/kDeEEUKddhWIPAJRxsRWJfPZ9gh8n0KWlU2QNqHwe/IGqz
         gGYGJ+M6345EwhciN0XtG/PjkbfkaH0zziDJs/j0RMWHbOBbJ/OzW3JmPbssCUiJ6s2G
         wu9sXLHmI2/faLYTERe8nzUggsWqe8whzSIOep6Kvr53iIakeKyDYmSoapTvP50R3XkF
         BlcLZk9P8jjNrVbkoA3bGydXxLC3V9cBcSc6rVgvxzd8LvMvWZntdF9iy56XcVr5y71T
         an788THg+8RfJw1ybH2ghMHROnfrNRPILGQKcaesEcZJAPgEHIEY6rWYxAYVLrbTAWQM
         dwgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787566267; x=1788171067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xFdPUis+b0SAqO9e1+lFVcsXPknHkq+UuXFEMP6x2vY=;
        b=RbG20eSKP/nJjPQwKQLauiVzD8iFaECGB7C416kzcc0P88Xop7ShBtoKdTFnMqUUfY
         jeWmUQfMYJJx5qouk/RxQL4FpBEVgWneer2uxhf8jGsp4jJsT9P8DoJZKWBrdhgDfufb
         VRC4S1uA8TJ5jRYVl8lkswCiRiL0HOyvQjs2D94gv1tYAUWNLDXxer9nZbhm01twVrBk
         MvThmgR8/R4DuGQuXy2IK1OKLx2VCrTgR31oXRouEmdJgd6pdwbrKxIMAVrL+Ph+y3BS
         GKTZzrQmtGz5M71uqgsIpfgS0rKNmU17C2Sy52ni60faexi38f+y8Y/bICwtbnMcvuiM
         YEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787566267; x=1788171067;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xFdPUis+b0SAqO9e1+lFVcsXPknHkq+UuXFEMP6x2vY=;
        b=RzsBA7TALr1KdtBcNjqpLjosFaTZkAMtEroaAVJ38ZRJpnRkWuaVWWw30qb9FBi3x9
         Ic237vQ+XMyCf3J6W7iLHcrF/YGddThagUePI8E4qDd3Zn0S4IIluLwKeWSaIG1JLbFJ
         itUagFP9OFtmu7VfmWVqPUoj6xmF799vz8XtMDbzv+7La4LJtlqxy3m+TK6P405WSmcH
         NIPZojnLAFk4v7QKvO+4niOrfJwEMgwBwxTpF73F8kVrsGEOqPLfZUjODeoXQ+ppiysJ
         yCuw+TO2L2MdSu/VNX81W13AsFMEv79nlftFD2WWnyb2Dlry/d6A/b4PI9tjsJy9jEFh
         gWRA==
X-Forwarded-Encrypted: i=1; AHgh+Rq1uS9WzVxnO2N2uFGDwSckspZEArj/fut9NJcMGsLhjQjgeLkcb7fxHARKluVIk7dZvPZCdS+uxwAC@vger.kernel.org
X-Gm-Message-State: AFuF++nggTlWCPBcogyB35Q7rMsrRDPNgH9Fcc1ntgEC6TjrsugMHWct
	2+t4LA973hlxXQapkwX2tnoonbbmDnRLP9iz9qa2CEy26hetkO0Pra3VOjCSyCBwvQyy6yhYWZX
	dGMXM5oxMyEzVYnxobUa670Qvfj4EUPpYU9EFoe41H13j07dU0uH0HJBYNd7vcAJwnT5E56Wfuc
	8MBXhzbWZwpDiDeYs1oqbrZtmFRl35/QS9YLTT118=
X-Gm-Gg: AR+sD11opdsuSATsh0qHug5yAYvAOI5YtntIzTadjA3YjRUtU2venE586yknPtL9gKe
	OV6tvi2FnaT5MTc22YH5YLw3+U17uonMFBa/qMegKth0qnCMwMsuO4wyXbAaqZRydgNIQWnjjA+
	/zg6R/hUyR/XvJbTK3q9HubnvwSnGN7VS31lnfgGwz8ehHXAKL7tfd/VUp1+Y=
X-Received: by 2002:a05:690c:e1dc:20b0:7db:ccda:a40d with SMTP id 00721157ae682-849f01479c1mr74939517b3.5.1787566267312;
        Mon, 24 Aug 2026 03:11:07 -0700 (PDT)
X-Received: by 2002:a05:690c:e1dc:20b0:7db:ccda:a40d with SMTP id
 00721157ae682-849f01479c1mr74939347b3.5.1787566266757; Mon, 24 Aug 2026
 03:11:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-7-harendra.gautam@oss.qualcomm.com> <aff28775-b27f-4440-b7e8-01bb5a8ea906@web.de>
In-Reply-To: <aff28775-b27f-4440-b7e8-01bb5a8ea906@web.de>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 15:40:55 +0530
X-Gm-Features: AcwNN1Xdai-XKJ9Ozv3HRsrFmel4SeNQCvovlso6MLPmQjGIsIp6fX_fta8kZDI
Message-ID: <CAC-tS8Cxy9b2CwBTno5fAcjeXBd4jYj7KV2NqCjOccu9i5HxmA@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] ASoC: qcom: Add QAIF PCM operations
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4NSBTYWx0ZWRfXz/oKtpOGFPrt
 vov1x2CFVm384Eg7Fb4/XrVjIhtUZswL8jTQPa6SuFsMQAaZUw7wozzMOAYWaA8AliVwvS7D4it
 QuX/jzzN/xuDUIPrJyFsJc81UPHRDM4=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c18bb cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=P-IC7800AAAA:8 a=HWrUbPwSkS5HGAVXgNUA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: Hga0kh0gth6k8fKjv0SjqQa0Nu1cqQpL
X-Proofpoint-GUID: Hga0kh0gth6k8fKjv0SjqQa0Nu1cqQpL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4NSBTYWx0ZWRfXw3u6lQvLIc5n
 h723j/M5xhCxOB437JmeO0SxNbBXzIULBPwG8RvAwqiTZDB/aBAO6hAx1IxUWLnunJjlesWuc9O
 Y6zk2zX2qRaTifMB1RQIAGlBm/KOy2FB5k6/AmgfHot/XGfRg1hGWcl8korGEIebc3FNKiZK2Uu
 foh1wpxsOKVy224R2v31NVs8ohQcaDa6qKYJEFkhY39EajCTNIooZm9LLz8vw+91fm/N0fINECG
 1iuEUZvuLgPa6XKaOUJDwZH/zzO7ezCHf3RdvKV9n6QPzivlZVhdaFb5VUIBP/h35VQyWjXb1Ep
 ndmYfDhKAj18VKmY7Qi2lgtqaJtStdMVGG7YsnXlwAroC4TJk/KgONkicEwuPAPakwTZWpEVAJ5
 KfIAid+5sJkXvMRA0+cocUfD6gXAZy36NJV2fbPW8Nj28zb+wn/oZ2yiadzWmw7y9T98Ym6ZH9k
 VoGow41dScaTaXK4K0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240085

On Mon, Aug 24, 2026 at 2:55=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > +++ b/sound/soc/qcom/qaif-platform.c
> > @@ -0,0 +1,544 @@
> =E2=80=A6
> > +static int qaif_platform_pcmops_close(struct snd_soc_component *compon=
ent,
> > +                                   struct snd_pcm_substream *substream=
)
> > +{
> =E2=80=A6
> > +     mutex_lock(&drvdata->stream_lock);
> > +     if (v->free_stream_dma_idx)
> > +             v->free_stream_dma_idx(drvdata, data->stream_dma_idx, dai=
_id);
> > +     mutex_unlock(&drvdata->stream_lock);
> =E2=80=A6
>
> Under which circumstances would you become interested to apply a statemen=
t
> like =E2=80=9Cguard(mutex)(&drvdata->stream_lock);=E2=80=9D?
> https://elixir.bootlin.com/linux/v7.2/source/include/linux/mutex.h#L253
>
> Regards,
> Markus
Thanks for the pointer. I believe guard() can be used across all
stream_lock. I Will address it in the next version.
-Harendra
