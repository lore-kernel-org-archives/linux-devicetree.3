Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0673D6CAA
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 11:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780399495; cv=pass; b=WRHrJqc3i9Ssr3KCsm/HQ3PVWPEjG3AN7+YrokgEtWBXt5/k2FM+MPIpjOA2j86us+3Go6CGVtiSvRp1TWPUaSV/S+vtJGKtRF7blRm+/Admnz0JC34DQyoaYSJ0H2aZ7zBGtDoNFJ1qeNiejYk6at+tmwqP4loElr8fI0SFt/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780399495; c=relaxed/simple;
	bh=X47oEhG79ZOk5pYmVAHMJJJSIftNMeWrdQY4BRw28GA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UHzBsMrvuRmcgW14KRkhAqKv3pLOsSk1frKbqmUTIUXH4fwmkcUrZ6/EEp+wsrkZHnUaFfLlEAFo2II9QdvvydaP0ecKlZO1bLe06HnASnh1YscxxDftXoqgzyBPgBQsBlWdcpuZvVdMyJlFEVpQ9Bdzyh9vxo/PjcMaw56QoG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dOfuHPa9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M4BARJ13; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dOfuHPa9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M4BARJ13"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6529Ua6U3355448
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 11:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j298FfzUxAqXX4V8Mg2loPDqY8Lj0fMxwT+dqa3PSRY=; b=dOfuHPa9U7us0FPo
	hDKKLj1quA3qtn//AnmVsWfiEgVtBQ4khww8vv/PiH+m6QJin19didMr0jFMH+XX
	SnPyRfwNpymh42ZYvonA6IF047hyQm5K89i4pfywALh/vF+cQFEsLxxq+6bJO16Z
	WYOOOXIufx4mcb+P95srL/dBOJfJ2A7V96Oww2hAgQv5SFMODFyz8en6DfEn+m5E
	0jdlFVONn11tOSUla0ltzdhJB2DRAcgyNsQKVrwFfgXG6jHOdJMlj3rojCoOF8zO
	eMZeEAKn/84XcvlqkE/sBgTG9rriGuPyoTFa1X3NsAiVrYMyvIL66mfAkHweH52b
	18r+gQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehvkx8c0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 11:24:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-914b4036b15so1975669685a.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 04:24:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780399490; cv=none;
        d=google.com; s=arc-20240605;
        b=keaQRxlBA8hY7DEkY+nY1L3M8n/iVuyQA7U+7Qz3igeNAWNMoE0+RzPWR8J0lz0Oe8
         HWThgyec6GzLUs9udjjfgVmIUwwZCGAyRs5lN0WtWAsKPnQhAs4XSp8BmWQS1JJhYr8T
         UzxgbuW88V8KgCMdEIzGWQbALr22jjY3ySFLiyW8cHXvnx/RYKOBUjnK2PJyD91NU6fh
         2ySxvbua6wr/cIW43cPR76Zkm1lix5dl1BCRN3UNde4qhXlXkByZJx+kE6wBi2/uL6XY
         S0blmrVptezdt90O7ExEw/lH1eBduTLaIlLW6uTC4ZZz5vjMzkt+1LILuvembFKBRYXS
         Qm9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j298FfzUxAqXX4V8Mg2loPDqY8Lj0fMxwT+dqa3PSRY=;
        fh=E0w3xx/AgQVl7ur3wK49SOe/JHIBYOR+m9pY2L344bs=;
        b=K2yrqYdusYD/YMm18mGYtzAyhqUpHOsDHZf3Y9I9ygAKE0Ty+i8hHXYWBOVu6Tb/VI
         myP5dafs6ggW8SmYEk9S1mYvzR4MIuxl7YvUqLFEpzXTo8yN5BWdJ9irNLILpuvIegQE
         cZyLGEJVRFXKJAmKqUMILEWYBD4R5uTqfnF+aY6pmJu8vo8a0pgvZbhi5Amd+DOgVWRi
         DPhd0Nvb7UcS8VMZHcQD8YV4HwDD2/pF7zB4CYm7/hzHCo2HlJXKUJVLcI6rHyEDvvAj
         aBpGKgotdVzDi0pnbAtg3WIIxWnnf0Nt+SW1jjbrYTH+LeQBbDuofASzlAR5bcpAHxQY
         /5pQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780399490; x=1781004290; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j298FfzUxAqXX4V8Mg2loPDqY8Lj0fMxwT+dqa3PSRY=;
        b=M4BARJ13I9ZXWRuwD4HqJLxdaIEVnMmIpBNhIv9RMOiGaZ49CfQsqloRHcxgJAg16s
         w4z630Xm998C6g5aic/x29GEGlWL22E2SF9SYfVzdsWH9rR6WxTzjN4uoTGfJp2UysqK
         4MKHqahud942To8UlqVPheKKqQaKdo2cQ5gDUu39V+XvUBVtDAANGaoNjQPC7Zw9DnLY
         dN62LP79zcTnNqxp2Wq5kasv8/vrbCXPLXeOkAf7QFZLjb/YXo2hbIY7odSfnEd/+Wo+
         JfVmJhqYxD+usfHJVI2GxkaBhqAJI+9ygMXV9Iwuzq9sqFSXIFxIkE0MBg37BAcPRQDW
         H4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780399490; x=1781004290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j298FfzUxAqXX4V8Mg2loPDqY8Lj0fMxwT+dqa3PSRY=;
        b=rNp+gAaIsDktodC75nvGaymi1WDpKefPUXtSOlGaxRJWb3L7U63NuY8uqR03NXNCsb
         QUTwS0KGX1lR217LtwQFaLDpwH5+YKPaEBbEP83k/TBr8KFzMT+mKOgmNCNuO6JoHYGU
         hZMNDIgPXGr10IonKGg4nkK4HOhKoxwHceCp2K6+p8fDhUq7znLmKXPckCCK6k1Eu3Pw
         vhupIgq1weXCFihiwtQMxkTbYwXoFMbuTAI2tx0Bq9fnpXhXjRrt82/ZrRMWC/tvGsl3
         i7mEh7TSg01H/bQUZAMe6/aFdZgUG8yrum3SzqdKMWYtef/65W69x4TRL/hRS0P2uYpW
         QIJA==
X-Forwarded-Encrypted: i=1; AFNElJ9O5FOkNEssSNnEcKtK0L6QRS87mcUBb1qKNG1vm+E4XM9FBCcOeH7vQppXDqe5cfzZZjqFtMrGp972@vger.kernel.org
X-Gm-Message-State: AOJu0YxCVYUU9M/MpfiWOH1YMHv5WBpL3QgLHExu3RGvOhmCBHRZit83
	x10aF4RgnJIjIolCQK5Y4iaLhsCPdcdOhK9KmgTyjAhII84OCts3FjaPOB+hOaSsbcN2cI6+f4M
	ZDTjWbbU6/DMstaO+HbSQT3T/L7jYrUkW9jjIr/4Ow09qIe73uFaNpJoEhAo/lkrytt2jYLph6t
	j9LedYWEx/JTtU/MORnfK2n8HsNsdUVcRLTwMixGA=
X-Gm-Gg: Acq92OFOR272pQ5nwb41X2nWuI+lpUDtWzPrR8PscC/wM38+psoUl0DvBLOW9PJiRqp
	xcCGEFVN6qWgr4WTmp1pbVpLUAh87X1eGyo4EcI0SIk8HNFLml7N2EWBlpfIQrixInoCwpmGXFF
	Drr0JNsSphYVWWmpHtwTVP0sr06Vnfrr0+oeobKDsR3noBChwOP8pWWnp9aMGiNO1R1HMZedBVH
	B+BOonk/1HhZwd7mQ==
X-Received: by 2002:a05:620a:6304:20b0:8ed:11b9:1ecb with SMTP id af79cd13be357-9153d9708b7mr1780874485a.20.1780399490148;
        Tue, 02 Jun 2026 04:24:50 -0700 (PDT)
X-Received: by 2002:a05:620a:6304:20b0:8ed:11b9:1ecb with SMTP id
 af79cd13be357-9153d9708b7mr1780867785a.20.1780399489319; Tue, 02 Jun 2026
 04:24:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
 <20260429125135.1983498-8-anup.patel@oss.qualcomm.com> <ahC2y59MHRZa9Ayh@curiosity>
In-Reply-To: <ahC2y59MHRZa9Ayh@curiosity>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 16:54:38 +0530
X-Gm-Features: AVHnY4JtOcMNOj1lpSrePTuWrID6MA1pRk-7jCYV7pNyunfsrcvfOZxPppYG8Aw
Message-ID: <CAHuiULA4UxJBpZxCNBbmHXZWHtmZbTo0_uipV2oLiyOjkC-rLA@mail.gmail.com>
Subject: Re: [PATCH v4 07/12] rvtrace: Add trace ramsink driver
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: aVWh7XqzNBtG8dGLjkCth7SiREm7dMUW
X-Authority-Analysis: v=2.4 cv=GYknWwXL c=1 sm=1 tr=0 ts=6a1ebd82 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=i3mQrqLLjgcqMBBrP7wA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: aVWh7XqzNBtG8dGLjkCth7SiREm7dMUW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDEwOCBTYWx0ZWRfX0QUgoXxk03xo
 1WvhzPurBRwaxViW8jn+uJ0k3b4phl96SJOq7rdg3A7ORcUT2a1Wh0nyyfxG0I7EJPP5gfZPW6E
 4rHclzyQzDS+qIzGhtPwylPZTb7wCyvfC2T8nqsVawBIRjVTa9ctsZphqFZpQ2EM/nxCM0Z8n2b
 zE3N5ZtQElhFJdJEge1CmAIF0XIoimJIGmvuT3eEea5B4ZuvIfFuh/8zFw/g/sKIZsXCX714zz2
 US1Gg+g8HR2f7gIlp8O9Cq/d5Np7j3yr1KuLGMVZfi9NmXyc/gCRlJV0apDicOiiSSE7si80vGw
 o2k6fL9brPuo1odDP3Z3qiN8b1lWMDskCrFfJdHbglCw1QtkZS4GBw6ZXCGVS4Tqdt0fAFq7GNT
 kmbnuh6O6fP/8SMinsRJSBJg98hhjp6+4ChwRNXsWFFLK8oyAWl//rYjtKK1HPB22VgJo+yCwoC
 CK7I/uHqwdMn6M8xnmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020108

Hi Sergey,

On Sat, May 23, 2026 at 1:34=E2=80=AFAM Sergey Matyukevich <geomatsi@gmail.=
com> wrote:
>
> On Wed, Apr 29, 2026 at 06:21:30PM +0530, Anup Patel wrote:
> > From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> >
> > Add initial implementation of RISC-V trace ramsink driver. The ramsink
> > is defined in the RISC-V Trace Control Interface specification.
> >
> > Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
> > Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> > Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> > ---
> >  drivers/hwtracing/rvtrace/Kconfig           |   9 +
> >  drivers/hwtracing/rvtrace/Makefile          |   1 +
> >  drivers/hwtracing/rvtrace/rvtrace-ramsink.c | 338 ++++++++++++++++++++
> >  3 files changed, 348 insertions(+)
> >  create mode 100644 drivers/hwtracing/rvtrace/rvtrace-ramsink.c
>
> ...
>
> > +static int rvtrace_ramsink_probe(struct rvtrace_component *comp)
> > +{
> > +     int ret;
> > +
> > +     ret =3D rvtrace_ramsink_setup(comp);
> > +     if (ret)
> > +             return dev_err_probe(&comp->dev, ret, "failed to setup ra=
msink.\n");
> > +
> > +     ret =3D rvtrace_enable_component(comp->pdata);
>
> Does it make sense to enable such components (ramsink and encoder) on pro=
be ?
> IIUC they will be enabled/disabled later in start/stop operations when
> rvtrace graph is activated e.g. during perf tool work. It looks like
> reset (primary activation) should be sufficient, and it is already done
> by the core framework on probing.
Yes, that is correct. I will fix in the next version.
>
> > +     if (ret)
> > +             return dev_err_probe(&comp->dev, ret, "failed to enable r=
amsink.\n");
> > +
> > +     return ret;
> > +}
>
> Regards,
> Sergey
