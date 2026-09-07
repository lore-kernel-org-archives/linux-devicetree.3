Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612992DEA61
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 04:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755811; cv=pass; b=gAooosNZN4OkE3kT0Mz8ovYa7Q7yWh3cOkHZH0A7oLT0ZgFBPOU/ICXJNrSC1oKj5WFCAtt3WpnlVHd5fpFRRTWYAmpb1Vozuw5nU7aY4jbeyzIMMf5Zx4RdAJY77NdA8/PSvLi5wU39T1e+0s7e5tBDaGOPMA1e0hDHB2cfS2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755811; c=relaxed/simple;
	bh=hUnGH29frAUOv/0EuRdjA8PunMlslRH8ulu+jotd78o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hd27wZh9S1L0usrzNAVAdlBktKqRWa+/O1yS19EmXiulZq9wDtTQ+VYx+GvqZPLpqM7y2eLs7NHGGNzY5+VP2BBxmYhiX47eAVEMkvuowg0zRI+mLCM1Dmgymqz/SWOZW5TxsbZfy++nvDAOZEZGX9i05x2JAAPAZhZyyTXfElo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FiljLwxk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H8XR9sEP; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FiljLwxk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H8XR9sEP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873l27S2390292
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 04:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bXvOVPq/0G9Af1iQjBbrByfRCSP5jsO6db1GgQhts08=; b=FiljLwxkZ+eG73E1
	RsvV7XSB2GVymZn2gg3R9KWDIAmbOy3hiL0PJT9up2MxSTuKpkyfzZXeHRhY5jZH
	mHBO2/NAqLIppSNvzn/Hl4/KdGdT2WPjFr3w+dJcyBpyJG6M+BWO/0Qk+mgdNAwX
	lrXC/20md7FR0ZW6PNiSuX4+a22ElBT0sOb6FTMQBKL/6r6uWCn4z2CD03mvr73n
	1NbX49uAYrxydeEGCjfuv+w2cLLwEHkNhrKQd1yoWWSO3xjh/Rb2vNtt6RJxDZW6
	WC+AuTSBzMOn/Nn/VcwawEtjkhRWSKRalQYGTqdrso3+BFStYZr1AVJWYxiLYy6f
	11KYHg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbuen1u3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 04:36:49 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-87014338e7aso57787927b3.1
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 21:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788755809; cv=none;
        d=google.com; s=arc-20260327;
        b=BFZDK8JsrWy7mwEoUrclzy2pJgJhSGN8LRmkQr8WjS4sW+mMR2FtdsOT8GbFN/GM+w
         7RXeBLD3iRELuvTkCiax+Rzb0pUVV9RyGLePgphwTVBlZ1a9FYE25pcs8fe1TDG0IOp0
         aHu/7BwxSWGm4C1bINvM4vP4OOTtDBG5i5UvvsqPa0LlpSAow9ebisbG2in/YNJzykVy
         J6gjw1gq0tpee8RLJ2p37n8s+n5QzEwCXITOw74hIeQ/nnywaQfMIFtwRyk+tic4rEIy
         E7Cxh4wf/IloiZpLF0WW7Vt39i+ULxQ0enP0MkrTKCcSmwWeO604FmMX/7m43Jbk48fm
         vv6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bXvOVPq/0G9Af1iQjBbrByfRCSP5jsO6db1GgQhts08=;
        fh=xGuDJbrhMFunLhUENLdxKFAiCswi1cPXgMIbe4/aLBk=;
        b=b5hNAa9JB/x9JLK6x2gT5YxEM/kXzbXSem6VBqWzYGnX0FINb4Tf0gaBR1Um7bMaRB
         B6WrCMukwdMFZ8lvyRNVvalj97rKh1LYiv75LaUEObT8KdDcbyuhMADSDehpMZhBDgBo
         029Hrb3ONfWSrCPq4zbGMPa2J1nwV+EIZKadE79QqaCPARGUVHm0IcTcRjdpaibqf15U
         i5ZHFtkiFSdABHJ908GIg7Pre6IpQlZr2JU5orYmfwzIdrRwoOWkDCOUeAczsLQMkxQB
         mC6pmLdiNiWQG0wT3cqx5RjyAvEhBsIu/whcjClFb/Y4ezlJdgFcchm0f4b4bc+afw/X
         I/Hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788755809; x=1789360609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bXvOVPq/0G9Af1iQjBbrByfRCSP5jsO6db1GgQhts08=;
        b=H8XR9sEPNuAdIztPqIeF6oS7KntDjPjj5DRqiZwCiHfJ9BnNhQMFdSJ4VI6pbouHyk
         Zqwnj5+gJtGlNx9u7T8fNLjVTfDvGJFm5CqPb/TdYUXr+Fzdej7GXjjlZ4N0qGgD18eR
         FyhuKJkMYxfGsgUAPuDekZI2imqmUx87r/FMppCn46jrheyt1bo3LiKRmDeTHIBvsMQK
         CuGaZJ091I4HdtXpP5X+yBdd3Hhg24zmqct/Jtq8lKp5AUwNuZoa1mhrURtZAvSMa/RB
         mHtLGeCz3IiUyF17QmamBT12bbCxjoSVpIRsAZIBjcDI7B8IeVZFjfuX6fkhNT2iEjeE
         RcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755809; x=1789360609;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXvOVPq/0G9Af1iQjBbrByfRCSP5jsO6db1GgQhts08=;
        b=RpLu+Jz9XCpoVKtwbLOXxmP1HalH9zDlFglUQozUfKLmGyOxqwFxVMoZPivz6jMhvj
         dQmc4TnqAG+hDUSSlaJ0a+pnMOrSx7HdlyQNCMDMVz11ULPxGOqAXBvymUyQ2izebDvw
         BiFhDYjEzX8QctJ8uVtYskbyK0EMkndOD4GrcJHM7huh++Znm+QFHS4mNcap93I+Q0on
         OpG4btDMWLwtOSL7CcseyBdDyh6gqaT6suSzTS9xrO8rcEUzRr9FpqMZkYiyYn2hq/bM
         kO6Ls1c+7LoVC5hok3GHr2cJx5hoz2dLZwJBAJxQcZF4iJMhgRKY7i81jmgfzBRSsDrP
         IvJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHmzsmwNYv3S7DJHzW79NG0kKcbg1KjbOZa7uVXHgMuuE7WfgZXfsd+OZ91QypX9irPJF+dzkW/IPm@vger.kernel.org
X-Gm-Message-State: AFuF++kcWf2REOu8NZIeYTl7QuX+EQAD00Mk+5vJzLLUFtwSoKX3W+Z0
	tO3kozZGQZ8l45qtyadlOkDXNZppmqBFlgbXxfKSydtzJCQgjEltvV5brFatJS9rUn6qFU/nNdu
	Dz9eVJokqETupvCv0fbKVglJng0Ct3llLg1CXZX4JJzBKPrCrfqP+B4x9wSnP1hCQ041KQMvPWo
	I+F6UAeuv/3ygiRf3ZK67wXn7ONTgIE6BRlOCvZps=
X-Gm-Gg: AYBFou1ccz/dMkwGCy9HVyjPCWo9GhDCScwT/Dp99liw5qr0TpY90R/A0+kjG4Bn8zC
	AnPPiWesOOta1TvuIpRjitolKbqO23WvFmQaa6k6pc1kU5PNsO/vYop+AeUR3JaLOq+TnH0AWcn
	MZzRDJMkpzBKgU0WLibZUSwxOtEGs0NQGBj9SksRGO+vEFEghQufz0iKwsIBY=
X-Received: by 2002:a05:690e:4508:10b0:66f:c7df:1442 with SMTP id 956f58d0204a3-66fc7df14e4mr1070530d50.40.1788755808734;
        Sun, 06 Sep 2026 21:36:48 -0700 (PDT)
X-Received: by 2002:a05:690e:4508:10b0:66f:c7df:1442 with SMTP id
 956f58d0204a3-66fc7df14e4mr1070527d50.40.1788755808367; Sun, 06 Sep 2026
 21:36:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903072902.3870009-1-harendra.gautam@oss.qualcomm.com>
 <20260903072902.3870009-8-harendra.gautam@oss.qualcomm.com> <1bc82ff9-87a2-45b6-88cc-43acf92c84bd@sirena.org.uk>
In-Reply-To: <1bc82ff9-87a2-45b6-88cc-43acf92c84bd@sirena.org.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:06:37 +0530
X-Gm-Features: AcwNN1Ut4lERX0ImtklUb__wwFFA1e6nLSim3GBD2KDrKci5MjcsTbDpGSY4jXQ
Message-ID: <CAC-tS8CccoonxXUEeGhEd9Ct=DuQWALJJr6S52fonPG+SRoNXQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] ASoC: qcom: Add QAIF PCM operations
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
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
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA0NiBTYWx0ZWRfX98FsaYCkZA+o
 fTvrTvR5quwxR1idVgnZ4UFr5+pTDuQa+5tcyWVNvdjXinV/mlnmyJB4axYj8tyLpubIFiwFs8r
 xMvKim9EQHI6+lxBCzxy3U1b8Pg/VIAgb89TukOFj555eyvV2hKN6D3n5q5lVJ0jHznAe5nJcK8
 cwxkriM5YN2p2in2fvHXHWmGdy7kc4kGHiaviOXDAVh1TOpYoSp8DBIDEJ2qEldWJJUhaXlADqd
 +zwWilSfZ8Ye8lwrRwQTqxsEjAFtjSqcqXrXxeKRVf0BgCsVGygE4cRJ/ub1ltyKdBUdbNmL9r+
 4AtXMfnRZIyD1yXYUvJehizDAUxRsfG88t1uUWlF4qGJU8PYjOn88y9aKYzHZUrbTZhDoK7uguI
 ri7A746tB3hgJkmsVF8D36iHVjfS3TUC7lqQyvL+TYWx5f7baGFukZqoKTTGeKGalJMTW/trq/B
 562qzwdrvlcNDiOobTA==
X-Authority-Analysis: v=2.4 cv=P8AKQCAu c=1 sm=1 tr=0 ts=6a9e3f61 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=WyqP0FlduNzGPyTG3yoA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: GBzi1g2wkqVZ4L0SzTo-cs2vLQkkI4Us
X-Proofpoint-ORIG-GUID: GBzi1g2wkqVZ4L0SzTo-cs2vLQkkI4Us
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA0NiBTYWx0ZWRfX4S0X7wFmZMn6
 rfHT1kN6aYw76WUiM29tfggH5B2Zy8GDpn7W3uxpsmE3/iDJCmRZyBTsmDN8kN4YWuedAt+NA7z
 RawWI+e8snjGGnUSiWkoXwyCYJI9avY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070046

On Fri, Sep 4, 2026 at 1:04=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, Sep 03, 2026 at 12:58:58PM +0530, Harendra Gautam wrote:
>
> > Add the PCM platform callbacks needed to use QAIF DAIs for playback
> > and capture.
>
> > +static int qaif_platform_pcmops_open(struct snd_soc_component *compone=
nt,
> > +                                  struct snd_pcm_substream *substream)
> > +{
>
> > +     dma_mem_info->alloc_size =3D qaif_platform_hardware.buffer_bytes_=
max;
> > +     dma_mem_info->vaddr =3D dma_alloc_coherent(component->dev,
> > +                                              dma_mem_info->alloc_size=
,
> > +                                              &dma_mem_info->dma_addr,
> > +                                              GFP_KERNEL);
> > +     if (!dma_mem_info->vaddr) {
> > +             ret =3D -ENOMEM;
> > +             goto err_free_mem_info;
> > +     }
> > +
> > +     mutex_lock(&drvdata->stream_lock);
> > +     stream_dma_idx =3D v->alloc_stream_dma_idx(drvdata, dir, dai_id);
> > +     mutex_unlock(&drvdata->stream_lock);
> > +     if (stream_dma_idx < 0) {
> > +             ret =3D stream_dma_idx;
> > +             goto err_free_mem_info;
> > +     }
>
> Shouldn't this be err_free_dma from here on?
Thanks for pointing this out. Yes, you are right. This I overlooked. I
will correct it in next version.
-Harendra
