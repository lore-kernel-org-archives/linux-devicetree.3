Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6238F377553
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 05:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790746152; cv=pass; b=uhxEOA72Sm3Q6bo+KtBOBXxKnTxV84mFlgCF1QyxDgFiV3s3E/Y1aqbnmL2iSjE3OGBQ1CFWIAwD38lHvirt168DhokI9GPXYxyrklD/R8x4T0mY28qS2L5h5u2jNFk9OSlKk6N/ilhwdYCH03RA5+N4YtyAjB9bps7pf47uaeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790746152; c=relaxed/simple;
	bh=tmkV2mmrDajYN4om5U0hwK0CBQDJGtjxBhnoqqbgOyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jqf3QUtUHu/wF4Gxc0OgjrjhWQLnKXO6LBm9ygoNZRxYOs+RPdQXvVWIn1sszZ6nmpakRcpzxRhuz179N4HuIOJkh0G1XUqnxdBdp5KgxYOX2P2BcZU2GgtGWQlm28YbvqOU8n6AQGym5hqavXSJVF4xdfK0OcqoEbYc8DdfrqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pjSZTXfV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CJoz0vFj; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pjSZTXfV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJoz0vFj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TNQF262010175
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 05:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dx/vIXhRvwG/JlTZaI/6ZuIX
	DRsDVwL2S+wzlVM9WPA=; b=pjSZTXfVK5pKLSc2tlWVvF+bggB8RgSlMVso3NBO
	in3EqWupw5bRKnJhOmltx77ioExVOUg90cnrtmtRENoKTecmwXTlD/dow5qZAYV0
	KP9Z+YtGZOTnWcjL7scN/B+8PH8jTT03tEnvuChgp203ZQ12res04g3zUtkKNVYz
	sstctbaGkJoGR4mgQ/wR5hOUrHc6d6U9nf+iRFSZhf7zivrYatuhSAUGUrnNL8nc
	KzSHnJmi3XJlc7oURLU9NnyB7mKBlNRVWWJQ61HWOZRm4MVUCzs/4TnJZ5n5J4Vq
	gnjoDIydEfNEvLzhNSBgr5yCr38lw1JIJEi2yZGsJZfoHA==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0ftuk8v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 05:29:10 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-674098a3b87so8819489d50.3
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 22:29:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790746150; cv=none;
        d=google.com; s=arc-20260327;
        b=Qezbe+HDeEMyrHO5PgM3n4Cd2AA7eotbSegVSHskzMBElgZMwy4H5QVzOnEUqn5/dV
         ZfRqIFg2zpxJ8DuwX7zmW/JFbdZYnSnphfkroD11Mn3gN98RkjURhi2eK3cgEAdyDYfV
         m8C6+4hbIoSQelGTeUw9K6R4eES7KLtxNlVCwa+TP77zjBgNHQx4zIXm2tN4PIdt4aPZ
         zV3H00mzP4GGuRiQCNZVjTtP8GTr5sGvehHnbYGsM4zAw/FboVndYbz4RVNEGxPXZ1zw
         me1C1l3p0CGwe0tFlmHXBWdIEft5LcO7mWVdYsomMBAWe+vulgr/a0c5nioGWESMZspM
         MDEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dx/vIXhRvwG/JlTZaI/6ZuIXDRsDVwL2S+wzlVM9WPA=;
        fh=NFryb4FEsPRZsLkUtMXuNd8n1mMGr3imu3fvba6lL4M=;
        b=pnE324l4jmWT1+CH6Zhbi2+Irw7tdUbvBz0niQpoyy7qw/jxS7qOqvO7/x/IPcwzBC
         JODls+yUdDmX4+8Tne4Aw4m9M3Zgh5/iuUk2UJYOI6Fun3YCtRBXKq/hY78ltQ1rxnNt
         2+TgzIOgSxAOZMJpfe+nYRDKhh1co+UPTFiF9msu3dfSxecR7KeDgXHvLmYHEWwCX+kh
         ZW5XxrGXsF7yUNISYDMm7p8lr7ejlriPrBh7j4S716Gey/HjXRkGsEgBwZj3YgphOHgi
         E70ZBR+sTmDNJNpOz49WFlK1S6MO5cVG17L7t592hGPfxV+/pjOGZL8lLu7ZLir0HasK
         tpcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790746150; x=1791350950; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dx/vIXhRvwG/JlTZaI/6ZuIXDRsDVwL2S+wzlVM9WPA=;
        b=CJoz0vFjqksus96ZF0nl4mlNfSiDP6EkBClOsXIIYbZPHOBr4FTYHaFN9hNwmxUJ7a
         Qbhr8RG5KZx9CNyWBCd7/2KVdEzPqLzx66D7P89sp2Ga2lt7n6T5tLx9mdW3ER34eRYG
         6k1+xmiZeDX0uSBU/9L1UGh7d0OSXWkX9qrbfC8q0qmBeJtJJqLhFCiiLJ4jbHkvu7Aw
         WjPnkDDrtpEL5oUR3/9zuWeyZFjbQ1UVmoDolqEC0R5ACkvAX3BQRBBfQ0HIVoGhF0v/
         oDJGiVhCa17T7zlADd90hSidopTSjfUbABIRzwPzEJBqF02Yil9qdycNZhc8tqbwaVWU
         C9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790746150; x=1791350950;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dx/vIXhRvwG/JlTZaI/6ZuIXDRsDVwL2S+wzlVM9WPA=;
        b=Bd0GSgogIg2RFf7rNeIyYEFId/Y6RGPFX5yHkvZ1wE5MIDkF3Uk52BACDQsD/Sq4Gu
         b+0mJUhlkZEefm2k0rrlYpjcdCFdHRyk2SdF1psOAkxpUzjZccCMRCmQau08qHIu8/H0
         mdwqajlCiNlvUteFmUem52nW0N25Y40zsvGA2S3oZLLaz9vZSakpYeuNWw/BLBK394/H
         GmdikaIjjSpfRUuLNm1LNMuk+SJoByCtBr+hQaITj2Nukl3kEDHC5h9TlX+NO2dbVatz
         ee1motvn4b5KfCmazWRe7/nlkwu6JJQtP5IAdCrjATz/edzIVHSm+1fT9sap7Aheg2YQ
         7NkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyi5k/K86hHE9elaJ0ARjFvMz28Q6b3dH5Gx638vfoo3pHRsTcXgSMvqghsiBRAZgDisyIaXh9tZKH@vger.kernel.org
X-Gm-Message-State: AFq9FYI9IUHV4TCQVU6Z+oDvyi6L6z/JxVnNERUG7FgsBhfq8W3Xrg+Q
	QWrrPjYPTXgfI6FfVMGLKj95Ku/Tw993yNZ9XT6uZKl9t3C16YyMYIrzIdkao8Q/aU4bSD+BXvs
	RgZtPT7+9JlRlVXgS2JhP8p7rdNt5pyFatXoAD5pb4yKqGjM64++H1ibvl0G/oY6K/f6ow4y/+y
	Kt/O5kANrsTl1ac/vVkmiDX1Fo4QicsQqaji2GbOY=
X-Gm-Gg: AYBFou2oh4PfbRF1ZKL3hUAyIjkmaJDjLhY2SIpozd0nL95MuP7fMTRTH4zHzUH5WHg
	3AOphNV0wpYUsHh6Qfmp4xdeDwEqePe8OOKNlCC49TBvRiuV6Pbbnu3QuIiERRI5nuPzqS2jhNd
	Sn70f/vG92joLA8HxNhrZNavdtIaqKBLvkNY8V79A5adk7RUj5K4P6ijT2ET0=
X-Received: by 2002:a05:690e:804:10b0:66d:ca8:bed2 with SMTP id 956f58d0204a3-6768341b8efmr88865d50.40.1790746149639;
        Tue, 29 Sep 2026 22:29:09 -0700 (PDT)
X-Received: by 2002:a05:690e:804:10b0:66d:ca8:bed2 with SMTP id
 956f58d0204a3-6768341b8efmr88852d50.40.1790746149235; Tue, 29 Sep 2026
 22:29:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-b4-qaif-shikra-audio-v8-0-ac618057fe85@oss.qualcomm.com>
 <20260928-b4-qaif-shikra-audio-v8-8-ac618057fe85@oss.qualcomm.com> <35e41446-631f-49e7-83d8-bdfca469bc09@oss.qualcomm.com>
In-Reply-To: <35e41446-631f-49e7-83d8-bdfca469bc09@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 10:58:58 +0530
X-Gm-Features: AclHuK_2UWWBuq0p1Je2wHGBs_QJZlSZJ2ybw4Wpxuz_xTntYkBQ0_fPsF_Bplg
Message-ID: <CAC-tS8CTOcAZ-x+q7mnvJgc1ZgiRLmQgvsqAFWHOK7YLSfCLog@mail.gmail.com>
Subject: Re: [PATCH v8 08/10] ASoC: qcom: Add QAIF IRQ handling and platform register
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyMSBTYWx0ZWRfX6PLmoPXouGhE
 OKjb8rSyoAsusSml0uw1+GuWtMOZXERlM5PpnrPNWoE7irKGfjg7ORN0AjhI6ZIVQGJbzBVKQN0
 Mdez7MxutzfK5kEB3d5LOyI+0B6McyW7CIKi9ax1VPIcFlBrNUIUe9687RbXQAbajggM985mMrg
 ZYiEB8cqw78sXYmTK0fG5zXv1b7EkGFM42/355ie1oBvdgLcKGyIgirDua0hvHvS4q4GCcfu7tJ
 8a6VZDSDLHA1TEeV5h5kTmEsywKM5CpG7vosOWQirAtJGnBiz6JdHG9JjVZbpX5ofRlaKluvZpG
 Nn1iSs8B82TTquV0CVRtMDntT/+kKEdF05KYKxfIlbaafo4wzDPD+unoTclNom5idmvPxTeFwRf
 fk/XHzt3oQa/pCNLd5Q839kMjrVt+RTkkjvGLTSJAPsw6h2muP4O7YME64INvWXV/crHwKetsXU
 zHD4xvQGWb8bFonVZPw==
X-Authority-Analysis: v=2.4 cv=AoB7T+9P c=1 sm=1 tr=0 ts=6abc9e26 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=ub4Fp3YvjE6bfjjF_tYA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyMSBTYWx0ZWRfX2zcSgJBX/R19
 DADvBGuiryR3QI4a1+be0vIfbvAOoOaGxFM5xNSYaNaROW0sW04NZuu6GfWxEf7lPmzYzAJ0fYs
 9Q0It53eQG9nKVd90AWURcOsK93a+8o=
X-Proofpoint-GUID: IMU3zjOtp-M7reEA-3nbBoEDDX3e3MGZ
X-Proofpoint-ORIG-GUID: IMU3zjOtp-M7reEA-3nbBoEDDX3e3MGZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300021

> > +             }
> > +             ret = regmap_update_bits(map,
> > +                                      qaif_dmacfg_reg(v, idx, substream->stream, dai_id),
> > +                                      QAIF_DMACFG_DYNCLK_BIT, 0);
> > +             if (ret)
> > +                     dev_err(soc_runtime->dev, "error disabling dma_dynclk: %d\n", ret);
>
> Should this preserve the first error while still attempting the
> IRQ-disable cleanup? As written, if clearing `QAIF_DMACFG_DYNCLK_BIT`
> fails but `qaif_platform_irq_op(..., QAIF_IRQ_DISABLE)` succeeds, `ret`
> is overwritten and the trigger callback returns 0.
This was overlooked. Will correct in next version.

>
> > +             ret = qaif_platform_irq_op(drvdata, substream->stream, irq_type,
> > +                                        idx, QAIF_IRQ_DISABLE);
> > +             if (ret)
> > +                     dev_err(soc_runtime->dev, "error disabling irq regs: %d\n", ret);
> > +             break;
>
> The QAIF programming guide's STOP sequences describe one more hardware
> completion step after clearing DMA ENABLE: wait for the relevant DMA
> shutdown status to complete, then clear/disable the associated IRQs.
> This applies to the AIF RDDMA/WRDMA paths and also to the codec
> RDDMA/WRDMA paths.
>
> This patch already has register definitions for the shutdown-status
> registers
> (`QAIF_RDDMA_SHUTDOWN_STAT_REG()`, `QAIF_WRDMA_SHUTDOWN_STAT_REG()`,
> QAIF_CDC_RDDMA_SHUTDOWN_STAT_REG(),&QAIF_CDC_WRDMA_SHUTDOWN_STAT_REG()),
> but I do not see them used in this stop path or in `sync_stop()`.
>
> Should the driver poll the appropriate `*_SHUTDOWN_STATUS` register, for
> example with `regmap_read_poll_timeout()`, before disabling DYNCLK and
> IRQs? Otherwise a fast STOP->START or suspend/resume path may race with
> a DMA channel that hardware still reports as shutting down.
>
> Thanks
> Ajay Kumar Nandam
>
Thanks Ajay for the deep thought here. This was intentional, on the
assumption that once a stream is closed the QAIF IP is inactive as its
clocks are gated. But you're right, concurrent or suspend/resume
scenarios can be affected without a complete shutdown. Will add the
full shutdown sequence in the next version.
-Harendra
