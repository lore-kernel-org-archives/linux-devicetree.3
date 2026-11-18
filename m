Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794982708;
	b=iDuZjRdzwvMwIWlhWMW/+j4JP3XbIDSuJJVPPZwldZrvy8kcLMWa488BsWa1eTlW3J6q
	 tf+daeoiDjB7MoXvxFxUE+qN2Pq+t3TMwWpbpp4R80Yylt7zk2URrRd2+ULTKDwzMpNZO
	 UfzMwECKQr7ygJWNLaB0ZoluGq1sLIDWXRgC0Dif70vkfgjr9J15Nz2HfBYYDaF/qh4OC
	 XTDnNAX14GZxcbF7Zyj9FTf8jq2eeB8hWYOfIdMUxmLaVmLoUox1ZQOCnLCvWeVFBRs/1
	 zEEUbtV8JjqyNZlDXfgJ2DPjN3UPpE1Mac8nXu5WFRWO6dZBv8YmJGpKcMAeRKnzKnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982708;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G66VmJCCH/MqEN4wyhIyeBHBx5El4NJh6hfbFgk5zIA=;
	b=MBNo2uaD/EaOlHSeCDXSYBuVgS/vAY9RXeLELl2SgDsIqgwRRYn/OZhFt1DtTFeaVm3R
	 vFtQO+2h6Ny/Orwoe7AMnpeXxWpet3UJYw2ijW2/BDjOKbLHfbA9tkuU34kGG4PbcWOiz
	 jsFdKqgF581M2JJssfMr6mFIKQiFoyThY50/TuYuAnFfAjbkF1tCyPfvu7py0R++OyRtY
	 bSy6S7e6c/ygw3TDkmTOy+Z889ew11YAjS0CDGFQzxmyRtEBwn6a1CVG2SnulWKj3mYtq
	 FA8KJdLCQUwdqj5vMe1sq7DzrbYTeNmbDgvKIjwU7Iyn3iELe4v7nL7YGi526efJkrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ld49XmAX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPMriWyQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54967606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54967606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ld49XmAX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPMriWyQ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V2xC1959905
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G66VmJCCH/MqEN4wyhIyeBHBx5El4NJh6hfbFgk5zIA=; b=Ld49XmAXACB/M0kr
	Tmg+9yxrxPm5oOu6CqBJ3JTobvNDRzgnoTSocu4Aq/nlVcwyl7OFqBmjC0qYfPZZ
	XmvQxnvnjT8p0e7jElVqfNOw5A0TPRe0DPAtc4VmLtKgLXiehaedq7lqRoWPBnXu
	PPizLVeF/DrPvFYjZUE87th30BuDOprmG0bHiw8WYAnFqdz/nIVo7rRkdb5tg1v0
	2KpCJ8geLzc8AOSFnlQq2XW3y6u9srjFCXCjAahu0i/PiaaW8hiOx5wjBMNO1bjC
	YY4dLgXbd5g8t7AUoamfdYTfa4B7FORq+mlAMSrR4i4P+o/wFoBNNsZh7KYTMLHE
	5z4KJA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hgjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:18:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ee184a2474so5655895ad.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:18:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794982706; cv=none;
        d=google.com; s=arc-20260327;
        b=Mxs7/Jhj5Epr/slzKsGnKgI3NmGq0daXkC/XB1F06g8Ah4RXG1XCuRQFdOXlY/Lcrn
         LkinL4lEixBE+xvvebKc+2Ip6x702CQFGG3/Zw/198yT+sQU9p66Z2Q/8zQ21tildDFb
         H4Wu4WRnhGnm+yVfxFf7od5uinCxEi2eLU/eNFzz3Ye7i97X6WHT65azftVf6SVxfhfz
         1ZVZvd5qVsE8yIZANI1po9YgOwThj9OMc1czAElnpiQXsiUfaZ/IHgAIjyYbX3WUCPtb
         S+HVo4KxzJVcEqmJXw5U/3uXDkGkDaP8slzxzfvVMZ2kRmgMcjG8IMBhB5cpJZBjBC0w
         Vclg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G66VmJCCH/MqEN4wyhIyeBHBx5El4NJh6hfbFgk5zIA=;
        fh=KWdX+zQAvE6or44u9zC9k1iLilDah/dC111iF8RRJ44=;
        b=Ad6vilrWed6bbOu5IfbFGDxXFV551ZbuqtOXOKCyBmzz2lX0RvzsRtACub9z8DrRl1
         09mnQjXB4Xy32WoBnp/s2488F5oS7kaCvvvGu46xB/P9JyLxr+oP/o16B/KKXqjikwCN
         uO7Rfph1KpYk4VgMkCb1khQHYqmJHaG2BjkrRxVxAlaLHpuYcwy3VosAz0wV6qZ0NOuS
         tGforoYVH92CQeoEw6ihdRl4e8ZChosi9aZBb//IIUL3J9VnXPX8wOAiVufjKhU9ka+u
         Jndlabcd91ElYAu0RMBgLY0C+nRGKoF26Rh77QDoK/J7STFYVcXCwy63cN8I5+3nRbAb
         0aQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982706; x=1795587506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G66VmJCCH/MqEN4wyhIyeBHBx5El4NJh6hfbFgk5zIA=;
        b=fPMriWyQz4uIdt30OkRCZ5LWm3aQSS57rZTt2wWfM37LRau66UlPQPav7lBK+ru+n5
         2K5rQjwAMezAovZfaYVEfRnEoP8JMbnVyb9qIUWoi5zWczPY6kc30GmihZbm+clxLRhE
         AXbJSY85rwKLB4Ux59SD35g7cAT551xYb+35eGgoGfCL00wQhSFU+0j7sGCBp1Vs5VLO
         r2vos0oNgJuJ+sJ8hpCCHr2nnWJWkGkMaI7l45Q47ehoW/QDPZOMc3F1H9A5yaFDp1kP
         HBWouoMfmcUx9dweoGe6cN3ce8oXHKTIENyU83WRn7jui7H1AWxyoDhfTRObUyOc3upp
         G5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982706; x=1795587506;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G66VmJCCH/MqEN4wyhIyeBHBx5El4NJh6hfbFgk5zIA=;
        b=PO7JKM+joyO8KJZ3Q9jZEsQtgEMJWczKrc+iSFFdH3TjswunLal1jw3NvvtXs2GzeO
         yEqLMRCxe1zcqI13TfD/R3u+RVnOtA7inBqqIRrhXO5c4jiY2pH70HrcEjhAoreTfYPH
         3qr2eY2ZbtbOsH/Js44ZrSML7umwvjF5ezT9/LOIHFyXrSl2m43+i9UgpHSUR1adJ57P
         /3RTNOUDLoyECOU8qxejc/GUF62Lbg9YlURqExAfyMkmmPOcd8lhAcBRVEFpN2K/bJnT
         9gH1x8Lu0L8d96EdEQmr6HTyCMmvqILdYYno2XGkGrdNkyb+P8x2sBdy4V4iR5H3JoPt
         zjkg==
X-Forwarded-Encrypted: i=1; AL+hErHqoSU+kBpbGrW5Mbq3TUC6bo0nIpW5W7mFuavay2Stujwt7TTeJ2xxEkm3kalUoZI4nO322vqMqeJ8@vger.kernel.org
X-Gm-Message-State: APuU4Z/Opq77juYnWAJUTJUtttLr3Y388I/7VmkEr5kT1hat152Clnl7
	19SqK4OzTUQmKuCMlGCL5sMew5rsD62DHM3JEAsjKHEOdn2SHKKLvPn9+GtV490gf2nBXVNnv/g
	J0omPgplguXFrqQBGF/LINrAnO2FsPA7psv0MQ1cdsF8ysNRj5xWNrKbenW9TpCcxb+slvGR7+J
	o4553iZ0rjq5QXdwhmoV1pddkJfGTP+g4GGk0pqPk=
X-Gm-Gg: AZFdTZfooh5ZBnfizccG6+RsqIfKjFBdOPCyQe8/SODAdgjBw4m18BrZn3T+RarvMjL
	5unnCHA3/oXpGPULQ3OniyjSV/ijSY6QX9w3RFSizDWGjZdaasgt75sBIMB0RG9CerHcJYHZH+C
	Zop+2l7jWTh5KoXmBtLU7u5YIi+sKK4L7rgTbdot7KqiidxTM3/XLxpoIWSrY=
X-Received: by 2002:a17:902:cec3:b0:2ef:f3fc:e610 with SMTP id d9443c01a7336-2eff754e4d0mr17636875ad.57.1794982705316;
        Tue, 17 Nov 2026 22:18:25 -0800 (PST)
X-Received: by 2002:a17:902:cec3:b0:2ef:f3fc:e610 with SMTP id
 d9443c01a7336-2eff754e4d0mr17636585ad.57.1794982704875; Tue, 17 Nov 2026
 22:18:24 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-4-mayuresh.chitale@oss.qualcomm.com> <auAubdjHl1V4h16N@lliang-1876.localdomain>
In-Reply-To: <auAubdjHl1V4h16N@lliang-1876.localdomain>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:48:14 +0530
X-Gm-Features: AclHuK93Leu4hHdh8zwa7f5_jOXasRQchKpCNV9Lz9duf1vReWB65vNkuZ7HV-8
Message-ID: <CAHuiULAq_ADvcbmiyZ5cxjeeuD-5=6-GL6uDdwCYC2GDnEq0QQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/14] gtrace: Add RISC-V platform driver for the
 gtrace framework
To: Leo Liang <leo.liang@sifive.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd4332 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8
 a=0ihfoYnQ4k24nRVI1fYA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-ORIG-GUID: u17sONHnN0509IUm1i5YR1YREbIp4rw9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXyf/ujIdREeuD
 8MLX3GuXfHllTOm5rcdNPzVInezqKiSnZGNuiaSCstbXWgwGsOk+4n3IDY3F+rsQ1yfCqyNVsAf
 D0LgneLEj/MgoPz3t4QSitRnAlraHU4QJxsk77d5umsx/cnfjze3SMRal5CgonKhWYt2nB+I/Sz
 pmxBEoHkGDrWYUW+GQzIGlzgnRdXLdWs+K9T+U5SzYw48IqLyn/mOQcEFF/j5MIm9poFQfuvJpM
 +I/AixkAsJsCYbVZSn7usNkWW5B5qanGqnk1aduDhESPf9TEOURNoNUB9MnIRcr4JAZR0tsnjmz
 XtLzYsljKCAGL5b7ciuj66IQdD8xKOiQTON+uNCT0uafLgqLw1n/vwdnUFpPVxR9nlJp5/vHHY5
 RBgdrnjF62pZrAXLAbRwKRZ1rwT4q7kkOD+EfWyOaJu8CR/BOZubyM4UlaiHyzk5fDyToWw+lOj
 0NE4UpSKR61x3YI7lsQ==
X-Proofpoint-GUID: u17sONHnN0509IUm1i5YR1YREbIp4rw9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXxcWbDVVH6nWE
 XOBtxbs3XvwDZ9V6rQ6pjd52dbJGzX7wgvhUY/Z//w5sSaPkrPsb+/yJwGnIrh5LAKVvZmbOONO
 kuEeyCmxTn4+9PUc2dyjZXaNENHRhgU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

On Tue, Oct 27, 2026 at 10:24=E2=80=AFAM Leo Liang <leo.liang@sifive.com> w=
rote:
>
> On Thu, Oct 01, 2026 at 10:52:14AM +0530, Mayuresh Chitale wrote:
> > From: Anup Patel <anup.patel@oss.qualcomm.com>
> >
> > The RISC-V trace components defined by the RISC-V Trace Control Interfa=
ce
> > Specification are memory mapped devices which are organized in a
> > graph-like topology and described in the device tree.
> >
> > Add the RISC-V platform driver for the gtrace framework. The driver
> > parses the RISC-V component topology from the device tree, discovers th=
e
> > type and version of each component from its IMPL register, provides the
> > RISC-V register level control ops and registers each component with the
> > gtrace core.
> >
> > Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> > Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> > Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> > ---
> >  drivers/hwtracing/gtrace/Kconfig            |  15 ++
> >  drivers/hwtracing/gtrace/Makefile           |   3 +
> >  drivers/hwtracing/gtrace/gtrace-of.c        | 126 +++++++++++++
> >  drivers/hwtracing/gtrace/rvtrace-platform.c | 186 ++++++++++++++++++++
> >  drivers/hwtracing/gtrace/rvtrace.h          | 121 +++++++++++++
> >  include/linux/gtrace.h                      |   3 +
> >  6 files changed, 454 insertions(+)
> >  create mode 100644 drivers/hwtracing/gtrace/gtrace-of.c
> >  create mode 100644 drivers/hwtracing/gtrace/rvtrace-platform.c
> >  create mode 100644 drivers/hwtracing/gtrace/rvtrace.h
> >
> >
> > ...
> >
> > +
> > +/*
> > + * Parse the "out-ports" graph of the component's device tree node and=
 allocate
>
> typo: "in-ports"
Ok. I will fix in v7.
>
> > + * pdata->inconns.
> > + *
> > + * Return: 0 on success or when there are no input ports, -ENOMEM othe=
rwise.
> > + */
> > +int gtrace_of_parse_inconns(struct gtrace_platform_data *pdata)
> > +{
> > +     struct device_node *parent;
> > +     int ret =3D 0;
> > +
> > +     parent =3D of_get_child_by_name(dev_of_node(pdata->dev), "in-port=
s");
> > +     if (!parent)
> > +             return 0;
> > +
> > +     pdata->nr_inconns =3D of_graph_get_endpoint_count(parent);
> > +     pdata->inconns =3D devm_kcalloc(pdata->dev, pdata->nr_inconns,
> > +                                   sizeof(*pdata->inconns), GFP_KERNEL=
);
> > +     if (!pdata->inconns)
> > +             ret =3D -ENOMEM;
> > +
> > +     of_node_put(parent);
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(gtrace_of_parse_inconns);
