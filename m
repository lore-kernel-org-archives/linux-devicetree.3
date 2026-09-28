Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1381B48989F
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 09:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586433; cv=pass; b=JyRYV/T+ctTxeSedUkLLQoDDtp6QE1/mBWg8Sz2yncmHrSsaatkg52b9A6fN9x+zlQ5Au50CvmTl+r5uLANnDUgblsmdGa8RvXkFcfSQdHvm77f7Be+KHoR+547IPdoOtqlCrYFOpTCF8Edorog31vMTrUnN1p4A0oClHjXMQ/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586433; c=relaxed/simple;
	bh=s2Enupyeibtnt7iImD86TsDrfkpy6GFHBVU2jucmNWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eYQv5ceV3wFqMfWcmd6NLeoS5WqCWAIe38jULFU26+nMzLasEojbAMN+jp1W9A5d7TBpy3LdsadCvU/b3a+rVLtkhlVHZTrW7omNcM6kquxKGbiji+lnDxacvuUmq+MfSSnvDDS3VYnGKd/Pp28FNGQtCs0141rgmO5yb7vuhys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IROmiQzM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BRgV31EC; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IROmiQzM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BRgV31EC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xqVV361314
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 09:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n19NZ2DZer6lB8ryYO/o4o4W
	WUSxviNywHDQ+d++mko=; b=IROmiQzMOCN35QWrXMKhPyYSyMmuA6jkxAyjmPhC
	0UETZgfIDwCqiu4QPlZUilAG1nVma42171hArilj2c7EALEaPO5jZc65CbeUadU9
	V9Q31Ks1rNu0G+K8HpRwd+cR1xTDB3VwgE+k2ieRVXXmzwWn2X7MITPKN74sC5sw
	ZQxAQ4aDFePZX4BB7nMOYUJiAdd8f/I6EJ2HsZdZadi7hSE35qV9t1cEIKDCSeml
	eK7v6lV8WzUmVpJyx+z9bOf9YA6EXyBYTqwGRw3U9/tadcoaOYG29myWOTpoMNd6
	kBGF8GMBR0iUv68rTTsWx+vGkZmb0ZzCxIOdPfLng6zgYg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav49q3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 09:07:10 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-892be308686so34546437b3.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 02:07:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790586430; cv=none;
        d=google.com; s=arc-20260327;
        b=jS0FX1/3zbTB8bcnn3ySa3ohRfewL8oerEUDz13IF8o/uEpqY4Q70luvJy3x+k+YMp
         sicuTUBfJpEZTI9V6EoDXSzv75gYWv35FqAPgI0089xr4g07C/EouYPLwv8Jx7u1pfPq
         xDmCHLFuAN5Fj4ZB/XAK0spLCxpjYHnoVEeyI619LP1MHSTrTbBYylxYzFzzWtHsiOvY
         orY7qkdh3EW2KfHqbVyclwtpQKrBXz0ldf14S3JPCeKZt3mQTMyF0COtwq4wlRvOg5Me
         0On6dKz9i79yzYan1SUtgU2TwaR00hVGf6z3emcdhIvgS59QskALyTZxuXtqcnWQEH//
         KZ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n19NZ2DZer6lB8ryYO/o4o4WWUSxviNywHDQ+d++mko=;
        fh=aU/tnA4v07rOkSwnFEFohdu67CkpSHU/ho7D+Xi4Iig=;
        b=bo5YpklU7NQYZfWcEPh6nizAS5MH+3ii5MVBQfyadjTOfUhI7v16ESgIF2t15pmWMD
         LWjuAGoYcI0YNrc0WhyPNndKxxkzYasViM9LbDAxLom0a2VYo4dc+FpVi0ewr5F5mvDo
         iz0TMsX2jr0VYtcCicKDR+6nGA4gk0Riw6UlHYDHzVo/SzUEGQ/WfR20xXab5+3UuJ3f
         r1CffUzfnhEJkagd5LFfuGYougkXJZSLkRWNzB4mJ/OQSOq7+4tQ4DjXwZyyOypl7tjL
         WrSF9Cy8CKD9QVX9z9lUk2AT+1fkuKxKIDeSePrSZEx+TnNMXJrPVPxanY0NH1UoNyoh
         M7gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790586430; x=1791191230; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n19NZ2DZer6lB8ryYO/o4o4WWUSxviNywHDQ+d++mko=;
        b=BRgV31EC1wVDSY3eTEaG2gDR2V2Ay7vsWbRTpcni1sjY2fL9fzScoaX7ysyKzql+xS
         ypST2GZCO8b3W1RhJg1xkUx1Vx2cUsYyuqv+8g+vTQ033yLG1POBVWMtXWDn+6pEbVPR
         Y7lYUhKFVIVBZtlg/EoDnXedpATqN4A2qShCxKOB53bRzkwLseG6TBWGt8EM5Sn6Y7Ot
         QIlBhukufru7wyEb9g0RFQ7tgu4VvaNWfUbolBBdZEon0MhdjopYcWY49YPPjyYsVL2w
         +9TVS6oXT1/5e1SajbZQ3uS1eiNkD7aAIzOZ0NWUOgQVbjVcSNhl1WQCx3z6vPjRf9oB
         eNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586430; x=1791191230;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n19NZ2DZer6lB8ryYO/o4o4WWUSxviNywHDQ+d++mko=;
        b=N7tEwPv1POIaTHc6n9Lii9V/ePrx+Ut+k9KVDsnUaCFEUfah2dgrEH8ZkRmOngubhs
         RPwL+MYyrZprDUa7LfhUnI3NyVYxb5GnwKsEUgsYkUlXTLKQ2epy9tiEqeFAiq3NkU8d
         RL3g6WaohbSno32ZbdndKGDXWYPuPcJgTfCJ1njGLyWO/1jjV5m5DiTIWlP1O131cM9P
         j9MLGGI8d1VhhyeWcIBLb12DMzr2w8PUwt5KksteUrQqyaFtH/2Mi2ds7BN/ngjMLz51
         xBmp2q7FBaHkxZFLPiZf8mFHCLgJDD3DlUTM0JHa8R90jr2Zk0/RvBQ90vvtLKOMyv2M
         Mprw==
X-Forwarded-Encrypted: i=1; AKwUvBy90ZpzRNalvJa13BIt+dTptzSW//Th5P3DyFeMZxaYkCTAvvgsSd2sNTSe08F3Z+wJ3K8X7+IoMBlm@vger.kernel.org
X-Gm-Message-State: AFq9FYIgaNuNqajs310BV2YOY0TbJJTLcugXTpK2S8dvIN1Hu0gHU6aJ
	FQW8kaKnpmBZ5IyQFT06eJE7GJVVCW1lBPIHOxknZoLL38YhgaFNiqja0+ugVSn/Gdty8S7IeQc
	c+xpLkcPMEPd/9FKIfkowBmdIJKtfx8t+ti0eXPt3DqDTCcMtUks2mgcTtEYn9IkjUexDGi1Uzc
	l+jlmXsAJhUzxiKgsfdTyO4RkwqzK9FTSETAvHm0VurptKV+ik3Q==
X-Gm-Gg: AYBFou1qDEvXD81RnhR4vXBEekjYDYGqYYgqnnLrw4XBGjXHE8nGZeSApa/Hjl/NPCz
	ab3FXOEDq86W5TCDfE+sq15xiQTQk9pF2SxWaU9ErkSTEWMm07RSmOOkgV/1nT+VZisl2VxUuff
	VhoyRr/yo+fxtoOeef0BEIXcKhg3Fhjm8kY51Xo3QC2o9SODeigjrOGi08mW8=
X-Received: by 2002:a05:690c:281:b0:8a8:8f62:e92 with SMTP id 00721157ae682-8a88f6217a1mr34619157b3.55.1790586430076;
        Mon, 28 Sep 2026 02:07:10 -0700 (PDT)
X-Received: by 2002:a05:690c:281:b0:8a8:8f62:e92 with SMTP id
 00721157ae682-8a88f6217a1mr34618987b3.55.1790586429555; Mon, 28 Sep 2026
 02:07:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-7-d5b6f056568e@oss.qualcomm.com> <arOfufqav6zRT_Rd@sirena.co.uk>
In-Reply-To: <arOfufqav6zRT_Rd@sirena.co.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 14:36:56 +0530
X-Gm-Features: AclHuK-5ndE__5TsHzpVHEV0m6dGW20Hk6VWjJY3Bt2Guaa4yktx6YOghplq7oM
Message-ID: <CAC-tS8BscYoSU41qHTC9_8Ajq-MuyfOHWzt4p6v6NN8HzsRVaQ@mail.gmail.com>
Subject: Re: [PATCH v7 07/10] ASoC: qcom: Add QAIF PCM operations
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: UqppASrQL6wAuDn7bmxvXiGow8Zedhf9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNiBTYWx0ZWRfX9ECs3d56Jqk9
 HkKcMs/6iz0HYmM8/Yhwqo7mFszUcJIpU4X94I3RGVywTG9nNWJxOA9xDfSByD4kiyAp4xuIbAv
 qqXdZO0FkGMSjp5IPZlvlflU/EzkSJnFgvUy8QwWLjM/3FDq1tKvDoy1J4ZCumQSBJB3dQdLNfD
 ZOf9BLhn3Cd1u/aao+pPZCTlS6v4NVwsfjClkq5tBKJBgpxqartb2FkEKrIFIfoUDolipds3Uw/
 JKHW4Uacc7KScvulfHOCrqNi3TPQkKH/w++EeGjrrIilDziduU4U22oZzgjRgR8ZiTr2BZvqQz+
 uFOJ1VPmJvjP0REh4kW4vm23zZJviES3aaOZhokCs1sCQAtUlFqvLKlQAEYeY+RoOWm2FxoPFUJ
 C4/bIkTtSgFyxHkx74eGElUZBoI4ib06tHGncHsGFH8P4sfF4UQ7ola6uRK2NEeBYX/liyGo6AR
 vB5/TNyoWWJUIayb43g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNiBTYWx0ZWRfX0gbQAwfzrlTp
 dRlA9lqooi51Bl1mwfQjFfzALJ2Onc2tptKf1OnbuHS7+GsuJsCiBd52HPRQWlYs7iAXl6VXYYB
 gpclRCnMJ8M2GX/O/DYx0CYibS6WY7g=
X-Proofpoint-ORIG-GUID: UqppASrQL6wAuDn7bmxvXiGow8Zedhf9
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba2e3e cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=r2ZyNpLy9wB0e1xT6XIA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280036

> > +     dma_mem_info->vaddr = dma_alloc_coherent(component->dev,
> > +                                              dma_mem_info->alloc_size,
> > +                                              &dma_mem_info->dma_addr,
> > +                                              GFP_KERNEL);
>
>
> snd_pcm_set_managed_buffer().
Thanks for the suggestion. Will switch to
snd_pcm_set_fixed_buffer_all() in a .pcm_new callback in the next
version.
>
> > +static int qaif_platform_copy(struct snd_soc_component *component,
> > +                           struct snd_pcm_substream *substream,
> > +                           int channel, unsigned long pos,
> > +                           struct iov_iter *buf, unsigned long bytes)
> > +{
> > +     struct snd_pcm_runtime *rt = substream->runtime;
> > +     size_t buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
> > +     size_t channel_bytes = buffer_bytes / rt->channels;
> > +     unsigned long offset;
> > +     void *dma_buf;
> > +     size_t copied;
>
> If the buffers are already memory mapped why do we need a copy()
> operation?
With snd_pcm_set_fixed_buffer_all() in .pcm_new the buffer will be
coherent and directly mmap-able, making copy() redundant. Will drop it
in the next version.
-Harendra
