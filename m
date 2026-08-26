Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA123E316D
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738139; cv=pass; b=KPXxRb3B79T77W3sMOVZqgHcrl2cR4vCa4j5jgLrsAlmiAli60c6nxMK0IBC1/D9IpzUtzuzdQWgA7qXUKhQfCFQ5iP4N0T4xZw+h2piTyNELyGqzOJUlxbesF45Hmu9AlEx1OijS+taSO3ylBBRjpE5+xmUr6KvFyhktuuxqxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738139; c=relaxed/simple;
	bh=b3ei/scJgqf6mMPZy0JCl3AJkVZk5UcyBZq61g3/Kfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eixVo2jK/jZqxwfiFlfSY6o0+OsQoVIQUtDd4lJXFLK2aBvsOt+u52OkNaAdubqMfyF6NBX86OL32ozBbmSn+48I4Ow4KdqvN/CH/ilRYSkzt+R5Rw5ZInn082EYfzodsM+mWNijZIJzIED6f9gWi1ysZYS/Ti6ph/Te/rMJPGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h/2GLpI4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O68A76sL; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h/2GLpI4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O68A76sL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9CoPV279612
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M2bWbTkVFAgOM74BazGMrLdyQn6F7QMTe6rJKc2GfOA=; b=h/2GLpI4/WKJvtw/
	YGFKEd2wE1FIgXMBc8uz9Oa/LQNNavC/FHWVsU9LHeSx5xOuxTTNO31BXU1udSK8
	ZFhZzyXSonIO7y/DDZmJ+2WvjzKuN4ldXt/YXkz44Uah3R/93D1VPtM9CTIdHGMR
	y2s0lNnsKQ3rQbuNw+EOUMTBJoSKMTkDXI9Sl1aXPWnpsLzlSu3BHtw+04yIjzhd
	XY5HpIK8dvmJkjNyOHm7ele3ZJL6FIqEJB+wV9rEA15AoEO2N4h6n15ozB8xSdOm
	AkB3ZcAFKLX4M8K3oWE1Y92h3GBlQOv8wZL6bdStvJXkG2xqGjpgsU/u2t4Y58cQ
	VxBLJg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fceu9yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:55:36 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-858b746a9a8so8074067b3.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787738136; cv=none;
        d=google.com; s=arc-20260327;
        b=Ke5yoHwI2cY3XWkM6wtyT3X/48MHuEgXC9WSqiMzZ2HkhpfRE35GjkdQteE+apqbhM
         YpDcDaaXXErJ99zq367nt0WVqSTiDinMa2pWrUGZxKjDSD77d09YmhRhs5EptoUxTHbJ
         t1OFf9xfKCP3tErAy/G/qgISGR3L7fSb+7rroxwXeVG+1VT0UXH1Sa+G08TB8G9ZqY7z
         X49px4QXGPSLvOUphZe0xPsiGaDGs2QWTFOOIN0d7qu9TNJ2/BKCV1SDnpgpPSkZUpiG
         zWTdkYcOSzpAD9iKvyyn1pr/UB6k963mKVelKeSC/fNW72W6ZW1btsEUSSQJ9F7jFbRT
         9j1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M2bWbTkVFAgOM74BazGMrLdyQn6F7QMTe6rJKc2GfOA=;
        fh=ZLnMx6FvRMKjI9uY1ghba555CootmVJ1V9VvEz5UJDs=;
        b=Xk/DYEUR3CG8vQV7fhHJm9+u6vvjbnfxHJ6PxIX6Mwp79meC7ER5vAedDIRkOaxX91
         zF/uvqQpBBThkX9dOLJ5yaA6k1WKY3vn2J27LYKjUW9LGhyC6XbfXytrTv2vrYI1cRkt
         5/dBmbYx7B09cROyw2vxrbMvk0RNrB2tLzi7chBHZdp2MOwkqAJWTX/7y7p7IphH8dMm
         k2NcjNEukuXCYfyX5DuWU9nteB5GiWP3OfGX6ELuZxyb47CgJJEmp17PERF43Zmr40WD
         9SIKZiP6AbzpDhZA/68Gg7QP3gfG9rqa7zqqXaaOVQkFfqjHKx3L9tGDYdiu+bj0nucR
         bi8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787738136; x=1788342936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M2bWbTkVFAgOM74BazGMrLdyQn6F7QMTe6rJKc2GfOA=;
        b=O68A76sLRef5uhsGZ6uG2bWXwYrjM5IbdLnn8TtD8x8PCRg0OSlK8VSh8FAVE5sYJe
         HKbW2FYkGqi+D7vpjrp9H7R/5GLRTBf8mPH2C5j9jVzzashlPFEI4YtcI+xAZoBQqcfU
         vHfQudSV+ok0oWwN54Fk9Z/8F/V0UrXkDYVhsuavGYraR0UbLJgYbFHYR8DTCiaSi3OD
         HHbGPnLxV0yp8bz4TPXiyGTBmnqDuS9FxzaMuHlQ6ZFerxEl26jm/nFT6UT/GJz97WtT
         eG68tEoBk63VCWAMiV8v0uX9NO1GPjXm8U8TbWTnUNzT/ZhO9Zq8cGjMkKRTdDy95RfS
         Vv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787738136; x=1788342936;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2bWbTkVFAgOM74BazGMrLdyQn6F7QMTe6rJKc2GfOA=;
        b=YdO/Vfj95Fm/17M7FnO6pGH3aDl21YHV0GDCFI80YwJUGsVOVFoFOLPrjkQVixTEMc
         pcA+QBRcQ9iMOBMIubdvgcPJtZmDwwBJdO2akRjcCZXKyNs/iriSClDiPsKL4DRwALkI
         a3VtdQPpxSP8VOq1JCUUMao5viZxY+zWqdcy4aAbGAUrS3WSuZRyypK4Fg3WG2j4khev
         TLdmXWmdZS3gXNxcvvGqWcfj2Oe67SPxCl/l5b3B+ITPcirXAYIKrLJOFYBC8ggLvIDw
         Gl5E7cI7R0lT/aW9j+GmUGnZ0p8t4x9fsx8Gu7DXDvG4Opfx0/34FojNr0vV+aq6qx21
         4UYw==
X-Forwarded-Encrypted: i=1; AHgh+Rol7R5cKuwq29uYd3nAj9oRIufqqt8HpZW9y/+d1zg97s3p+U9unFs4Odr6kO/dbmdgm3dDn2gEqfMr@vger.kernel.org
X-Gm-Message-State: AFuF++kAV7/E0VBVJv+pE4Qdnj9wazSN0TSASQ4bmyO+UL13eyhtqacc
	KaeTrAYE9y2npohVcnBUXQOp4eG32vUaPiZtdN7Fx3Hdn27rg4y0fygjiUouTETuIjpbPK2Cva4
	Pcmht5mNcYCuMVCCWuMjJ25McGPTKzcbBM6AFrTT/VIBKQjD03J5ySf6fVrY1jTq7hRxYahPh8r
	yEZ8jVGsleNgCS0nOe4gm4wRVVsO+FBxYEEzH4lYk=
X-Gm-Gg: AR+sD13+Rx0cuzMRs18CKlQR98eMZ83wyjGNbG4hndNYWVqxKWkRU3OejreJeRxCM4A
	heQ0y5qJ81oVlKG0oofm8FQVaLoU/XudSgpm3pHCaPj7K6VOJm7JyGhrR1MRZfoRvbhhyRcvvn6
	fp/SsEnE0iaQjIQp4lFXqhkHJV/BAROKJb6BNsRqH16ryNWxQ7QBh5PvLWqw==
X-Received: by 2002:a05:690c:4b8f:b0:816:b469:ccec with SMTP id 00721157ae682-8573cfbda13mr22927527b3.15.1787738135957;
        Wed, 26 Aug 2026 02:55:35 -0700 (PDT)
X-Received: by 2002:a05:690c:4b8f:b0:816:b469:ccec with SMTP id
 00721157ae682-8573cfbda13mr22927347b3.15.1787738135581; Wed, 26 Aug 2026
 02:55:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com> <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
 <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com>
In-Reply-To: <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:25:23 +0530
X-Gm-Features: AcwNN1WVFRPvlQgvshmc0r_etw3NSt1fZg4y_jOiN4z4411feqSqHUo8KXSuovQ
Message-ID: <CAC-tS8CtA+wRuucDskRXSc=AHgNdbuq+khj85pFmCG8dGS3Njw@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=a8AAM0SF c=1 sm=1 tr=0 ts=6a8eb818 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=0RC-DErAFZYGOsEwKv0A:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4MSBTYWx0ZWRfXybKV4whQjrVB
 hJWIYNnudPXPM3y2DFREa+Jtih/MQ8oPfEe1RPuHV4V9FR5zMD3oLJm33AADOSUimzHNm5LgGZf
 5B9AvqUwo6qqxXYOBkmEJ7wC/37S6yY=
X-Proofpoint-ORIG-GUID: hHVL6cxzZcRowIav6TQryyPzad-TW9gp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4MSBTYWx0ZWRfXy5vyIOPwG4Mv
 kyxh4Vq41/mEYiatu5mMsFB2OC2SAY0hjhEDjqWBJghaYOyDamjb79Q32if2sFSic5mXOlS79PS
 EvCTYbLmZswK5kYEjVpoQwpmHVgrSXtYvcPV7pyasVGUNFyIEBavHEfPTuMx0XgdOako7ZqBuaT
 SJ5Psw0uU/qZ04qjSsXfO8iKemXfVTg0j7JJpu7taPf9jovwh5iH40Im4XWNMhoy63pl1+17O72
 ySCRF4oR87xhF42yZfx4Pp/CmI0tMFAuyRPsS5YDN63QWfGqycgudaa+UYhg7iHoQe45ldD93fF
 5C5V0cjflc68bE/lXaKThOEVEvjf/SB/PAB19/ivwWNZCDFTUdQqdRyfFBuyLm6LJzJa0zEWjdW
 Mz4X8EC5gb0i42pItoa5O3M0X5zyVCGKh6kBTplWhdYxIlHMGOE0NR4Iu9OnSMversIAwsLIb9v
 pFkLBdEWwnAqd6BskfQ==
X-Proofpoint-GUID: hHVL6cxzZcRowIav6TQryyPzad-TW9gp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260081

On Wed, Aug 26, 2026 at 3:13=E2=80=AFPM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
>
>
> On 8/26/26 10:39 AM, Harendra Gautam wrote:
> >>> + * CIF (Codec Interface) VA TX DAI IDs -- capture from voice activit=
y codec.
> >>> + * WRDMA channels collect audio from the VA codec and write it to me=
mory.
> >>> + */
> >>> +#define QAIF_CDC_DMA_VA_TX0  246
> >>> +#define QAIF_CDC_DMA_VA_TX1  247
> >>> +#define QAIF_CDC_DMA_VA_TX2  248
> >>> +#define QAIF_CDC_DMA_VA_TX3  249
> >>> +#define QAIF_CDC_DMA_VA_TX4  250
> >>> +#define QAIF_CDC_DMA_VA_TX5  251
> >>> +#define QAIF_CDC_DMA_VA_TX6  252
> >>> +#define QAIF_CDC_DMA_VA_TX7  253
> >>> +#define QAIF_CDC_DMA_VA_TX8  254
> >>> +#define QAIF_CDC_DMA_VA_TX9  255
> >>> +
> >> These DAI IDs exceed the LPASS_MAX_PORT limit, which will cause sound
> >> card registration to fail.
> >>
> >> Check sound/soc/qcom/common.c, as the current indices (246-255) are
> >> beyond the supported LPASS port range.
> >>
> >> Best Regards,
> >> Rafi.
> > Thanks for pointing this out. We can either add the range check for
> > min/max QAIF DAI IDs in qcom/common.c or introduce a common helper in
> > qcom/common.h to validate the supported DAI IDs across Qualcomm
> > platforms.
>
> You should add these ids to
> include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h instead to avoid
> conflicts with common code.
>
> --srini
Thanks for the suggestion. qcom,q6dsp-lpass-ports.h is specific to Q6
DSP/AFE virtual port IDs. Since QAIF is a direct MMIO driver with no
Q6 DSP involvement, would adding QAIF IDs there not be misleading?
would it be better to update the range check in common.c/common.h to
accommodate both LPASS and QAIF DAI ID ranges instead?
-Harendra
> > -Harendra
>
