Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6CD515886
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 16:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790786556; cv=pass; b=T+kBSJDc4sMvn3TkutYcO9wJEI4O3GrE2sbvpTdKBt7kzdtJKlWhNcvkfCwxJM7CGDgsSuoSUTf+kx7+Mah0BQfWJAE/X2KG8vdaxuRHismPa2lrW7FrFVLyBH7ma1Gtb7FXUZ2w5Mrn9GXGyz+UNUpPC/7mFJYdADBK2qn+1Wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790786556; c=relaxed/simple;
	bh=gTj7bX3vYf16RXzawtYiO2NasAUyGzbiOsZs1/XlKb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bjyUbcbpo5+UtORMfFOHiBx9RQdA4IAWVudTGrlnJyyaIC8bOpgjoSKosmeYXLWY3S/AgiOTisddY3k4x+JX9AGcNw2h6I2HYC5XlClk2iWoCwfR2Oqm4pv/EfDr0FH4NEpBizTWvEEBYDNNMuQ9Fx2azGz8e0Adm02tQo94UHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pBU0+pAN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gMegx9i5; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pBU0+pAN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gMegx9i5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UEvFAE273533
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 16:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bUM7uZQADhHABqd68so1Mp99N+E0onvzt7ltNYA+wn8=; b=pBU0+pANHB87dG77
	A3fm8IveP+Ag7UyWUl9XemM+27sK/70uPWCCammhgyIHxwpqWO2cMKmk9cYNz3LI
	IyUtvE5QN/EmzT0TJpn3rVjXoKqKq+jvjPe7qGyMGPoOSEbkbRh+Pjalzb45Q7hp
	dcgmoLdWDthQNv1aYqGBWhDfojNuWuvWY1+8SAyYKpdGZ0YcFoPUz2zWT5uyivvu
	14zuD3dUeEXCzu1oOqnN6XqZ2TrJ8VYQ//wWqYsN4ORiuN/mrfyCHdr9ej4Vb4j1
	OkqcF3X6TxyZidapwVOcUkdrCAwjhNtYlBbS8Fs7whk4wSP17hFy3DJFa7RO8LbG
	dXP0rQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h14n20gj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 16:42:33 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86a43fc3527so2175902b3a.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 09:42:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790786553; cv=none;
        d=google.com; s=arc-20260327;
        b=nRc0ber1NWhu5PPeEWec8wL14VbcFECFCuOhUbBexLhshlha83eo8aXT8j7aP3aft0
         xq41bQmrJfeieKD5qzcQsrxhoyTSgVSqGl0t3ROydHZWWfZ1b9zIxqmpB2nnemV0i17o
         De+kYVbDBbDgqyQXlUGtqOqUJApxm73u8Sy/a6+C6uCui5cF1Atok2L9rvL741sgA/uw
         SdVtpDOUfXnRBYZpo37l/ht6XPgC8B0NzttcP1A2CdBpiF21RDAMInFC4wwXUmq5F70g
         fM59HfC0Noy6dDUZcKVeaKtZsN0Mf3PcuEA6uoXK/3ZEELwM9o0nY798v9T+WrkOBQOD
         CI6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bUM7uZQADhHABqd68so1Mp99N+E0onvzt7ltNYA+wn8=;
        fh=qUb5KYSw7MKl/UR6MfRgGe3X0+m2xtPuVMzVnMJ0CU8=;
        b=eN0lVXa7JuTeNFEFaZK6ecXA5aVEeHNDv5/2c+Qovuy0PEgxEoYxqeGdyL7sNSEYNZ
         JIym4M5vb9KjQAlx7VHCZUwCPz2cvl6yao2W2pqZEKDqFXgwttYyiYolaG0Dt5kfeU5m
         O9v8zuxGWTdX3/iyJOYaugbt5rXClhJxkiO1jFmcHWmTu62vwi8HIe9OG4H4L1U/4bhr
         COeTNbPv7QIpwJxfS55CaLqBoPlTd2+hUk3dWQtiBw3X8MvGz0kr40eFQmZ/o+5xHaUD
         q4J9jOiWij4Rg3+zCSHjwpTSiELZQ2393Iwh9urs7frkT/ZS+IFIXoGHWAA/ey8cIB/t
         v/Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790786553; x=1791391353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bUM7uZQADhHABqd68so1Mp99N+E0onvzt7ltNYA+wn8=;
        b=gMegx9i5sCVOnYzNFag0LPOJvzX/fiCBs251aRvWVfmItmP7MHzDax6bk4xkwbTdx5
         NOIuNvTR5ayShmpKBsyub19+SEkGJ0SE31z3f5P/w0tbyE4WLKJtzQuQp1LfVQmeDqyW
         oPov4Q1YnizqRgRVHe2YNEY+sLHJCMaVyKkjowDJM9OW0zv12T7oIA20M2jl8ZCbF2gP
         Jz+rJFoQzAPYQgQMdZhFJhG94tVNfO/QFroYYWL8AFaCtAodyzXyy9vah1zhkrt7ck5w
         T6qCpEUrAprS0d8EPSF/5+YPQnscyKrTK4dYNX13dFfZuwNlWxRqfvkgk708aNxkGySt
         /Ogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786553; x=1791391353;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bUM7uZQADhHABqd68so1Mp99N+E0onvzt7ltNYA+wn8=;
        b=NvIEYMgknui/INjQdunmVKQkCFHrCEjSC/BQ8avBY18EtMJOPc+tmJzszgStU1QFRo
         iPcgnyT5utV/IFVrCSe3MetzuWM8JCteHwsrnUy6sR3KQnAesRzJseQZGeK5fwtc4Yom
         RdlVm+sQ8tx2MwTODssYMVIhKkAdt9lE29L63VR+3fySvds3ogLnhvd3vBwQltPdKYe1
         k8hy87lf+W8BbMC9BPt959iTWY3+D9QSjExut6J3Wu7dBjo1sex7c/nOntXniy7QcWKE
         7HK8ZlMQ29+puvz5eWuvJL/coHBHYcWeN91MYD4RGmjsm7FFB3NoHyvSatZ8L64NnGHz
         oncQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3vMc44Gmjc8AUNJ9GqMbx99AQa/6EzlzLMcfeMqE9iR4NI4jimpxQAiEgJWh+TOKUh3NCHbbrPnY8@vger.kernel.org
X-Gm-Message-State: AFq9FYK6ZUatAq8Wt2ufMN7uNro+S06pd+pU+7vILBUVWAltAbQJmkoF
	M1/vH8BVEZWBTOznWnAZgFJdYvDts7IaQG5tM8yjlYWuJGwKtCbsIgTs8cg8zCoCbDeXJRIxBF6
	dtsXoeDnwUGGDloTcNJqMZ+RFvollngZ6UBZPyml7lbbQpwAw7/blxB3qfjoreWV81WfNQgqVhS
	AJ9gLJVR7qyqaAV8qeiHgEZ8rNvWxksArloDJQjmc=
X-Gm-Gg: AYBFou2g6wi6OuqUjG/3WLA+cg7PX18L2l1fdBMoZYco90WcQwp52xH8JxTIYKvWWIb
	TmV8Vp3H+osyV9L+vUDyzpdX8Od+svMQhYFlUoUt2P0/ZPMwJcX9JNT89Q8QIwAE9lEpOIUpYOJ
	wX++vKm3QD/RqRUp/p56wkdsB0u+AyyfBZHoGYpEFyXVrrN9cmZ3d91P5oiSruoZ+UXwRgm+Z+L
	WCZT/dnEGrW2+idPA==
X-Received: by 2002:a17:90b:3c82:b0:3a4:9462:5a69 with SMTP id 98e67ed59e1d1-3a4f3512faamr135077a91.21.1790786552669;
        Wed, 30 Sep 2026 09:42:32 -0700 (PDT)
X-Received: by 2002:a17:90b:3c82:b0:3a4:9462:5a69 with SMTP id
 98e67ed59e1d1-3a4f3512faamr135035a91.21.1790786552126; Wed, 30 Sep 2026
 09:42:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-10-mayuresh.chitale@oss.qualcomm.com> <CE261C82D3A29A3C+1dca40d8-c022-4120-a3a3-a812a34cffef@linux.spacemit.com>
In-Reply-To: <CE261C82D3A29A3C+1dca40d8-c022-4120-a3a3-a812a34cffef@linux.spacemit.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 22:12:20 +0530
X-Gm-Features: AclHuK8WzaQHu8Kb1U17BIo3W2WEuj4Y3xTSWnhwaShvCMytjWvQEe1KjMXTQoA
Message-ID: <CAHuiULBK9wawyubGsqJPSjDdtP2=qDG6RU9_asB_6VX=r=-5zw@mail.gmail.com>
Subject: Re: [PATCH v5 09/14] gtrace: Add RISC-V Trace ramsink driver
To: Zane Leung <liangzhen@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6abd3bf9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=lv0vYI88AAAA:8 a=HrkiEsUUJrMWRHDLxzcA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NiBTYWx0ZWRfX4yQxTm7Rfnue
 0NuFG9l+t60lV/Eg8zL9V/RM6WvH6PH5kgzDreiFKGcCpMWS6ter9zVSWyWS/+dneesyBUahupS
 /Zl+/sepewrSc2bDOQcpn2b399qYP6Q=
X-Proofpoint-GUID: h6hJm2iuIAjA20cIOAayopMizV3YlZuL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NiBTYWx0ZWRfX170OrLD6Mi+/
 LG963aOwclN/S//CK4noESpjQpBSuBY2gQCig0bYIuzHMf5Weo5S7aaIQaT4WJxrqUzLf8rDe16
 CvMj1H5UVsESndHK7MKSyP8ZhMPCDwKAIrgll/XVeLX27VEN300QkLSQ1zHs9QqZBb8+GvgXbEL
 aoD9GOShZrbDMIICaO7meEhi6cprGoJG1UYaH0HQjz0y40mZvK9xfmn4QAu1bU4jaGwE/gbecOs
 Qm5c+cQQVBWnw78SD1LzWGCVb4j5XwiK0cLhk0rRB5P2JQnPUGJF+w/n9C95EqKJpghBRAq4fsF
 Onaj4ZIjVwjh/3ksjK+IAFNgg0NLD2Nl0SepkkxX8dmqALRr3+9yxLSQ7aJvF61B1WTVWmA/itT
 rshUBA2X1W49pqawcheQqJUubWk871m8dk/3av0Tof8hbsrx5rFeZJopquSv7d2mks1RZfKZwHI
 ovn1sf5XH/2hV7b+bbA==
X-Proofpoint-ORIG-GUID: h6hJm2iuIAjA20cIOAayopMizV3YlZuL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300066

Hi Zane,

On Wed, Sep 23, 2026 at 7:10=E2=80=AFAM Zane Leung <liangzhen@linux.spacemi=
t.com> wrote:
>
>
> On 8/10/2026 11:22 PM, Mayuresh Chitale wrote:
> > +static int rvtrace_ramsink_setup_buf(struct gtrace_component *comp,
> > +                                  struct rvtrace_ramsink_priv *priv)
> > +{
> > +     struct device *pdev =3D comp->pdata->dev;
> > +     u64 start_min, limit_max, end;
> > +     u32 low, high;
> > +     int ret;
> > +
> > +     /* Probe min and max values for start and limit registers */
> > +     gtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTLOW_OFF);
> > +     gtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTHIGH_OFF);
> > +     low =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTLOW_OFF);
> > +     high =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTHIGH_OFF=
);
> > +     start_min =3D (u64)(high) << 32 | low;
> > +
> > +     gtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITLOW_=
OFF);
> > +     gtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITHIGH=
_OFF);
> > +     low =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> > +     high =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF=
);
> > +     limit_max =3D (u64)(high) << 32 | low;
> > +
> > +     /* Set DMA mask based on the maximum allowed limit address */
> > +     ret =3D dma_set_mask_and_coherent(pdev, DMA_BIT_MASK(fls64(limit_=
max)));
> > +     if (ret)
> > +             return ret;
> > +
> > +     priv->va =3D dma_alloc_coherent(pdev, priv->size, &priv->start, G=
FP_KERNEL);
> > +     if (!priv->va)
> > +             return -ENOMEM;
> > +
> > +     priv->end =3D priv->start + priv->size;
> > +     priv->prev_wp =3D priv->start;
> > +     if (priv->end <=3D start_min || priv->start >=3D limit_max) {
> > +             dma_free_coherent(pdev, priv->size, priv->va, priv->start=
);
> > +             dev_err(&comp->dev, "DMA memory not addressable by device=
\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     /* Setup ram sink start addresses */
> > +     if (priv->start < start_min) {
> > +             dev_warn(&comp->dev, "Ramsink start address updated from =
%pad to %pad\n",
> > +                      &priv->start, &start_min);
> > +             priv->va +=3D start_min - priv->start;
> > +             priv->start =3D start_min;
> > +     }
> > +
> > +     gtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_R=
AMSINK_STARTLOW_OFF);
> > +     gtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_R=
AMSINK_STARTHIGH_OFF);
> > +     gtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_R=
AMSINK_WPLOW_OFF);
> > +     gtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_R=
AMSINK_WPHIGH_OFF);
> > +     /* Setup ram sink limit addresses */
> > +     if (priv->end > limit_max) {
> > +             dev_warn(&comp->dev, "Ramsink limit address updated from =
%pad to %pad\n",
> > +                      &priv->end, &limit_max);
> > +             priv->end =3D limit_max;
> > +             priv->size =3D priv->end - priv->start;
> > +     }
> > +
> > +     /* Limit address needs to be set to end - mem_access_width to avo=
id overflow */
> > +     end =3D priv->end - priv->mem_acc_width;
> > +     gtrace_write32(comp->pdata, lower_32_bits(end), RVTRACE_RAMSINK_L=
IMITLOW_OFF);
> > +     gtrace_write32(comp->pdata, upper_32_bits(end), RVTRACE_RAMSINK_L=
IMITHIGH_OFF);
> > +     low =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> > +     high =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF=
);
> > +     end =3D (u64)(high) << 32 | low;
>
>
> Suggest introducing gtrace_read_pair/gtrace_write_pair/gtrace_relaxed_rea=
d_pair/gtrace_relaxed_write_pair API,
There aren't many pair registers in the spec outside ramsink so I can
add these APIS for ramsink only.

>
> They should be used frequently.
>
> > +     if (end !=3D (priv->end - 4)) {
> > +             dev_warn(&comp->dev, "Ramsink limit address updated from =
%pad to %pad\n",
> > +                      &priv->end, &end);
> > +             priv->end =3D end;
> > +             priv->size =3D priv->end - priv->start;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
