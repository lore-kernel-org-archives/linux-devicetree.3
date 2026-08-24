Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544833B3887
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787552934; cv=pass; b=C1FkmE4+ICskwYesXAjMnMEeiMxUHv2AVvehqHIKyrnyQES0rRVyNx6h6dExATKjmqJxyDRB8hgnb6RBL99mcHEdD6XxLEaXLOaL61q5rYFxE6VwMI4DFqGtBcmm74Sz0x8s2Ia7eOWp+gut3dyq+XVV00Hf9OkACS7gUMro4mg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787552934; c=relaxed/simple;
	bh=8tQHV/73xtSPfe3J7XUwOfa0NijqGvcWe31f0juGljI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MHLearvKx3kVHJu6a0YSKZsx3doKxE7+SWcN07JZLBR8sNn5qH/sKkH3QU+G6s4N+JmG5JVGBP/tx0AMAfBYMDDyEgXxcwfp3lffqAeumD74G25vltaNQgwRzYbvxYi7I3ztqQhZUvFW1HtIQ4TmC6r5khGHlbTf0Y+xfR72yRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oXZO3xgC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sk+t8rDz; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oXZO3xgC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sk+t8rDz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RYqW2042553
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l7lqGvWnslH2LeHC0QphtHUs/rofAEdSxXz59GB1W6g=; b=oXZO3xgCTEnzRx6O
	DCDjysNfCLa7odGctBwh7MOe8QIg27u7XXeWwHMucWEMPu4OA369rNwOG88oVJE0
	8TZHCxRnjx418fatitk1eFIgLogkBD4GQLGgpWZWvjNKZfuUrR4pZUG0pxtuOWhp
	wFksQVkIvhuME/8azW/Tfxtdu4LZ+mJj2xaHVozMfL8OBn7GiWC65sBODI4qOiKy
	2ZwA2+ho6HkAK5f0VHrgfABnnvcWSFHLgei9eLLsiV1EmTF0XI8J9oIqrFDwgm8L
	U1F6yBgwDTUV1sIDG8OrNr7H7JhNvaFEIMTyrBjaYwg5OqSB6s6l5Fq1IZKkFqCK
	xJqiZA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7h4yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:28:51 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-836c30d4695so20737407b3.0
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 23:28:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787552931; cv=none;
        d=google.com; s=arc-20260327;
        b=baToHRUGW689+xXKf7nfsdh77S76TqQSK06BNVoBqQkG2cOrk6elMcb4GCiHbhLc2F
         to9Sx7Eg863SEokCIZeUsRy2vbK5+Hh8xYNkLiICGKB1l9nlx/sa76pt1r0tAmIiBTAt
         WBYLcf5xMLIy5LgARyywE0yn0KMnXGDC8X3daVPvfAJi9UnhrE43at1QPyMHYW+GQqGu
         ZSj/WE61u2jSlw/3jlvrJZFnZ4eTAR/p9GAxA0wQ7AYNqmVXI5E/w8bPgJ3gi1KO2Fhd
         g3Ozp379HD1awWde7K+eTg7CQSb6sVthiEI995tRBesLSzeA333BPPSt7swMXLbgNMij
         Lrlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l7lqGvWnslH2LeHC0QphtHUs/rofAEdSxXz59GB1W6g=;
        fh=Sx4nQp0G+HRck24zvdcUf+7dZkc2JX4EaUPt+Vch5CQ=;
        b=VJNGUfafkZEMYRLjBvRIpHXF/aSwZ3QrjV7jJZs+JNkwffYCGMv7QMIGJh9hPNcY6N
         Uxmuu148R4nInuXOUjdBBM1/M+fib3I8xR+uiVeP5wj07fq25LTpVxE2jSS5QQIIDNYv
         DyOjQMLnmVJlE86j+QHRZLiHmCFuUrcs8Jpv3tkdIMGQ93FhPgyPtMb678lcUcQkNH1x
         w0VukjBJEY/yzTeKtroWB2JHIj6tcReCLq7XxnMjj/RXpCdhQ/tWw+WPqnui98TYIMmz
         RbUUNEoeVF8JyT0AnlX/Hd49KCCvmDTlLDm6ijND5aB4RYMRl56OUVq+6amF7IO/JZXI
         8dGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787552931; x=1788157731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l7lqGvWnslH2LeHC0QphtHUs/rofAEdSxXz59GB1W6g=;
        b=Sk+t8rDzmotXBF+5QueUhLnqGpjLN8Jy0XVxSYZPffnGFUHHNdSBvtbh2siYrSwtPy
         rmWXvs7aC5tYH2C9Vc43vUZtkioU+2opu44VFKcZiQnoJMFl4yONkojsIG2i6Q4avxf3
         sO7h7L4XiPfckrngiTP8IhR1rRMbwG2gFIVo5sNve1HZg6XqPzo/a5t9d8HMoyTTIDSX
         yRlGqHV3i0yjwBnLLeGZLNC2FutPqdpUW3Il553N+UcMx2tCI4UqyVwERFQ0y/bVYIC5
         U8L9PEn8evK4j8D7533Bfhteq6ToLlnesz//+lgtkPl8NmehLqWwKG/9UnJ4/av+nSIy
         AE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787552931; x=1788157731;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7lqGvWnslH2LeHC0QphtHUs/rofAEdSxXz59GB1W6g=;
        b=ZhhHJNYalxRlp0DOZiJnvnvdahWVLcksPvmUTwYvqWiFJWKXDoZG2crrbYXE/73jyc
         IihUr6t0yZMY52BYrUUajM0FL0NP0e05eC9/ap72PupE7S0X7COCpQcgWA0uFYBD439S
         T+uwplaIiKu/KVb9DMV5EP3hLv5oFmJ7z7DSZnJcGEPzjJ9Sd7r0imubUuQC6hW9gNf0
         mt3zpky5MOarPCFQYnWW+5tB/LTu53ei+fmWDb/aUjE9IfRz6TtMjLohY1TPADVvJL4D
         Fd8PbvyFcToY0uNuEvRm8la/wad8xTPewF7ZI/Iw7qjYIxslYDGjZfvGy8v3keO22Het
         h4eA==
X-Forwarded-Encrypted: i=1; AHgh+RqKUXBY/Slz8ape3d0aQWR7KBLOMIS4j3ly5+CobG5bqNeoMPZfN1JIr0QPrXD22cG3ygFtG94jDJ26@vger.kernel.org
X-Gm-Message-State: AFuF++lnV8TiyhwhZqLsi6dMr/rhZJ+sxsjqcU7824uwsuyLqL4Y5xhi
	gG3HuqVvFWy83HIF1WVv6x0XDcz+FEgfKZ+qSjIVwDac0PqGbQMV73pPmMO2O6+kt/OHsWoVt1H
	O85CAVYoP9QQGkl2aWLxy7GeyspSmsOsbpaq46vodSaNagjgJjLNCCcAo+zD+nA7L8Op82DPmO9
	BLfoHwhtsqojeit5IOrukkOcwsU2jQWtjC1IdYxwQ=
X-Gm-Gg: AR+sD12ENZnG5I+IjoRn153TvOwVa3yE2HZsg1ix1z0KvZUKhjgCduWw7NTQUFLoFO0
	gW5ylMT8G6cYHarwulmVEHFbFpekcQWiZOTKCq1arI7+99dM1aIo+8iUayyKmT8P0hmcbzy1clS
	CKIP0O+TCx+is+NPW6OeUNH7oB2IOql0hgw0qjsJz2yVfyYEFcYQTKMEBCR10=
X-Received: by 2002:a05:690c:c386:b0:814:5f5b:6378 with SMTP id 00721157ae682-849f15b9f28mr79525847b3.12.1787552930631;
        Sun, 23 Aug 2026 23:28:50 -0700 (PDT)
X-Received: by 2002:a05:690c:c386:b0:814:5f5b:6378 with SMTP id
 00721157ae682-849f15b9f28mr79525777b3.12.1787552930314; Sun, 23 Aug 2026
 23:28:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-11-harendra.gautam@oss.qualcomm.com> <20260702-invisible-caiman-of-current-4f9baa@quoll>
In-Reply-To: <20260702-invisible-caiman-of-current-4f9baa@quoll>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:58:39 +0530
X-Gm-Features: AcwNN1UpF6blUC8b5vWuOX7xBCKB2F1efjn6d5UhHwQGZr16LeDgxEiVtbFWdHc
Message-ID: <CAC-tS8Ct2tSuScAr_cD0_LWSY4HnwaxLnONY4-P=r1o1JF48-g@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] ASoC: qcom: Add Shikra QAIF support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8be4a3 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=aHnwCF0JnfQvHnxt_YYA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfX7466Z1m5+lm7
 q6tRe13Cd0zvRGh4wFCoNwqaV07ZdEz7GOMMGJgt+r1g59IvqCnl/5b2cdfvelIt2S03qnkXVGK
 +Fzvwh52B6qkQ0kV/kkXo4jYZgDYJqI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfX/k9+6Vzj8kVo
 yFXrCxo4oARPNWOi2g75CMjKvrMHyB4BIBcR3biSSRfNaNI/o4p+7fGyggmqpbpZBHLhGtR8QOQ
 ezh14GXwWJB0ju4XxEw4Iyvp21gnUf//sj7+GX5vH/7Wz5cNtWsaLXLeWB85Yy0CGyMbNkvgzAb
 oFyU8XUHca0M7s3Htx/oeE9itBWls1uDADtpvq6ps9qczxBFFTnKt7Wyobi4Ktc8M5NggyQsZTT
 QK2g+0Dgm2VZ8AROhXC4wwPB3IPgxVImRv4ZO3lzks3PXbgsubC91Md6HlhIZbzlIQjZgjE2l6+
 vBJkKXJToSnMXS9cHM8VaJwu5ZTROdiJWg2emiRaYgtxfBEb157pKEKsDWe+Kte2kpTu80hQbPK
 EY32VekBYLS2usXMGpwtQdM3naRwx6n7sxvDnjRVmx2sTyzOOMYa8kiffjt9fGXmWy5hjqtoto7
 490yZH2m58td0R3BkvA==
X-Proofpoint-ORIG-GUID: 8V8NpJoHpgmpHrnvYjOF8AfIxOaHcf9U
X-Proofpoint-GUID: 8V8NpJoHpgmpHrnvYjOF8AfIxOaHcf9U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240055

On Thu, Jul 2, 2026 at 12:31=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Jul 01, 2026 at 04:27:56PM +0530, Harendra Gautam wrote:
> > +static int shikra_qaif_free_stream_dma_idx(struct qaif_drv_data *drvda=
ta,
> > +                                        int index,
> > +                                        unsigned int dai_id)
> > +{
> > +     switch (dai_id) {
> > +     case QAIF_MI2S_TDM_AIF0 ... QAIF_MI2S_TDM_AIF12:
> > +             clear_bit(index, &drvdata->aif_dma_idx_bit_map);
> > +             break;
> > +     case QAIF_CDC_DMA_RX0 ... QAIF_CDC_DMA_RX9:
> > +     case QAIF_CDC_DMA_TX0 ... QAIF_CDC_DMA_TX9:
> > +     case QAIF_CDC_DMA_VA_TX0 ... QAIF_CDC_DMA_VA_TX9:
> > +             clear_bit(index, &drvdata->cif_dma_idx_bit_map);
> > +             break;
> > +     default:
> > +             break;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int shikra_qaif_clk_init(struct platform_device *pdev)
>
> I do not see any response to my comments, so my previous comments stay.
>
> Address the comments and respond to them.
>
> Best regards,
> Krzysztof
>
Address comments, will raise as part of the next patch.
-Harendra
