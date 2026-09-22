Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C8354774
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790044257; cv=pass; b=AIdD2WhCeXvD0q5I2/QKYQofHX5+JThNFiljr8EA7HdiP3V0aoZLq0ioZX3oOL/2JTRlmIpiAb4Sjz6SGEeyya+Ip8boMJvacdmJ0MwgtCwo9ieNVZazzQgcsb39tPbvfsmWa/JhR6lgTCY0rgWU7kSTN8N/+kQGiZYpTFIrmzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790044257; c=relaxed/simple;
	bh=AW06IYGBZCMrnj6vF3EjvS2PfT8TCt5zGPrwG5ZFPyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oe0iATGBOE8H9Taua/UpsSIzVtxx3dKybd6vlSjLYUdFy6Mgs+aVOLZ63MiwPxZWcVP57rM1MRMpCa9DnW5PWTNU0d1IEPrBJPgDOAhx2USgzjL5PyYAzIDhSJjPPDA+HqQQvkAfzyXHUUh1t6wfk/FXDsSw6ezQb7u4bfz1mEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OmgSqfXt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GUbOVOaL; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OmgSqfXt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GUbOVOaL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M1Atxw2173114
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A7JiqZAdlBgbBa5ulhMzb67AxAAG/vlMp5Utn+aZ8no=; b=OmgSqfXtSo9MtmfT
	2zAqToT9hUME0YZ7jll34Ab7i20/Q5mET2GUbb0pqMcDLIvmuxTCoc27nVu2XzII
	yOnX7o+VcZs4tO6G5VCQTW1LuMkflRW2QgYgZanKQD5rNLIyfvsjuKZiMcOudEh+
	WOWou7Pq9+0F/ODvw6S0c0kfwfOcyk8qDfKDIml2lKOf5zTJt8ZEk86hWotjCvqR
	3pT8drqXqcEP/YlWhem/BKG9yIOCfOfvuOaBnfG3GYlhOlWAGiVOGfU3EfH9RGAy
	ybcScBRc0z1DooHEHxr4aplAqN4VYvOHrMX8pUN9P9NGP9kutHQTpbXpKibI+xDd
	EmsLwA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufsq87ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:30:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8632fdf67dfso552672b3a.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 19:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790044254; cv=none;
        d=google.com; s=arc-20260327;
        b=SYnU00hqkDloNjbc+1f4ImxfFPquoLAGLDAvREeTcV3a7VE1kcW3zdTKo4f0dHzBhl
         kr+DKzV6rW+Hbyc3qaiskhge3xy/oIKJThe+gWV/A34WlkoQtxi4suAOmw7XlletSKL1
         8qhkDMcX2LgF3xgQkSts9bce5Hf48Sy8irnWgm5pjUgm/PKfRSWSDOIO5fr59kXC9gFT
         b+1YNWVO26UX+2o69i2lUsZ81AFB8XiUh2YZ4mnBhW7z69G2CdVTOQcZSTFbkNL53sbk
         dKgdPyvvPpHxpG1KTr1pjaepinGU/Oa2TwdshE3PxgnpoHd4q9W8pbICA5XNP1Y3Eevb
         Uorw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A7JiqZAdlBgbBa5ulhMzb67AxAAG/vlMp5Utn+aZ8no=;
        fh=pObSNez0utm69iA/ov71gSs1mfy8xJMu3yV3DCDVR9Y=;
        b=LkxA+JjCZhPw2nREw4QZVmAOKC3RXmzarS4Fs/rQuHb84VKMDtYwY+zVG2J+rjlWJo
         tvRisrmrZHRys8ZJk5P0+zc0exG2hVfbLbZEyY2LmQ2QWyIDI/+Lc5CVUxxThg0WhfaV
         +2UDlvyhwLa/byFvWTpT1ZDyYxMyrmhqZNDSCWs+jbOz93kHrhsAwH21LmN/2HkVqwR8
         DZ6swywswpTAtqUAvtVXEmO+nRPOP4nDANLIakII7856VFGCcrP4GFCHdOm5AmaAzP5C
         LNAbvf7e658At4mz8zTeTuzn0jrE+jnJDal+piD1zvTeBPbmrJA27bN4jJw5qMDWkAR3
         GDUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790044254; x=1790649054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A7JiqZAdlBgbBa5ulhMzb67AxAAG/vlMp5Utn+aZ8no=;
        b=GUbOVOaL8HZJmUrwA19ddVNAwKo1JcdYyyDTWc33q2JDXdgQCbka0R1nteBWiF81SB
         wlo+edgq6mwUG26wB5GB3EpMopDTZ0cvWbLcUjTdS9uE2TRR4nplBHYpvZafmQOGeAXV
         0xpgaP5jZrWSE6LyaPI71foRIPTKy+MJSCwVPxb6Hw2qM484cUr4UbmS3XQ7LU7n9AY0
         UsxMCyPQtOU03A4Q66wRQkKH/pPBTBbSccHi5ggJS3ZWP4SVdm7EkThY6wic80idm/P8
         Y+FjcEMfQZt48K2VUPG55ag1wpcsLBYFStAYdia4/Z44L/nAItiz7z5c8rM3q8SI1VUs
         VAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044254; x=1790649054;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A7JiqZAdlBgbBa5ulhMzb67AxAAG/vlMp5Utn+aZ8no=;
        b=IJ7qTx4s3bbsYisBlhlrZaYzO5u8uAeV5X9d4Sdju/vlsQVbLM0JyR3DCN9KH1rzm7
         cS31IpIFMCxqCkwN4l6HEgX+o1dTXzTPsYNtKb48ucZP4duze7Nov8hJqfyz/zOZrM72
         tWX69TNe9HLqIoIhCJ5Q49kT37Z5w8HmQXhz4bi87t9oAdCPQwYynDcQwCav6UDdN9aV
         H+YSiqIN2nBPT0iIGnOSMM3kafnsAXtUZhQuoYruBJHal7UjhfaTqRs2M0AhyU8OWlGK
         snCK3uMmkcWdP/zVULplJsY0Q91h5o72NEMGyalw6d8Yo+ITBN2cPMacKkOA2Ea2s4nc
         /Oow==
X-Forwarded-Encrypted: i=1; AKwUvBwmmaTMlKdjZXmqILi/9tOYu2tLMd9vlxPh0VbiVIHx6JATZr8Y8vCJkPWvQaF+gN/kqYnAzJJ4A3m9@vger.kernel.org
X-Gm-Message-State: AFuF++l3y2gB/5BNIc7IMQuXMirNAe8NeO/8lVzf8wkEOhFp07E7sKZ/
	l0e+ZXxYzq8YRYN8e9q2Kj2FGKjX7xB/tG+jWQW2atw4Gwt3NQm8Ig2exkSuQui5o/3l//fKQ4/
	WVW64NeOCscuJxR7Y6V67nD1UOraJ1+M0a0vLZeW7fuvDzg4tWorTnaVwK6QfUBM6ZexwXjuGdm
	awaP215sIXlOpPYB7RDW55y0cM9ewPCKZzwuB15oM=
X-Gm-Gg: AYBFou30M3TvYqVhh/HfH2P8gSbXeAyefOeN0EoYVuLnAK9FEmpZfbT0Vypg4Jvo+iN
	blyyPhyR5lEQSIbsKOpr6oJVKaQeInFd/m2Qqyv941xyKuzn5Ez062stYihGVHKdyZakTFGVrWa
	eWSNJvEl5gu6FA3pPz7+71l/HMXnVRjMPFoLgpGwHgVZzWFMnfOfmV/D2uOA==
X-Received: by 2002:a05:6a00:aa05:b0:854:b3d3:8631 with SMTP id d2e1a72fcca58-87bbf47c483mr1080940b3a.12.1790044254195;
        Mon, 21 Sep 2026 19:30:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:aa05:b0:854:b3d3:8631 with SMTP id
 d2e1a72fcca58-87bbf47c483mr1080908b3a.12.1790044253705; Mon, 21 Sep 2026
 19:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-8-mayuresh.chitale@oss.qualcomm.com> <BA4ECE62CC750889+2da1a0db-8500-4332-8954-e9f126604258@linux.spacemit.com>
In-Reply-To: <BA4ECE62CC750889+2da1a0db-8500-4332-8954-e9f126604258@linux.spacemit.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 08:00:42 +0530
X-Gm-Features: AcwNN1UY8XV7_aUB93jIu3Bz-IyBK8F8R8tUINGupIRIRT0pG87pNdVga_QmFwY
Message-ID: <CAHuiULDiFB234ev1R8bJKVppj+odtupmr=ic01S3a_HCXnHQeA@mail.gmail.com>
Subject: Re: [PATCH v5 07/14] gtrace: Add function to copy into perf AUX buffer
To: Zane Leung <liangzhen@linux.spacemit.com>
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: aPwy2FDqENrvlHkjxSgyzscrHacmekI7
X-Proofpoint-GUID: aPwy2FDqENrvlHkjxSgyzscrHacmekI7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDAzMyBTYWx0ZWRfXwR/SXdq/6LnG
 4VGzbvEVW4HbT+gcA2MpnwYMlmG7QSIb8WQs7weoZifXwDNvu3jgVurl8Yz2ICC18vKynyLi5+8
 roz6Q7spGXOodM+xTkbsAaXMOEu4bkk=
X-Authority-Analysis: v=2.4 cv=NKBAaE6g c=1 sm=1 tr=0 ts=6ab1e85f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=lv0vYI88AAAA:8 a=EUspDBNiAAAA:8
 a=G_Gx11oXSWwxtuNH6PoA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDAzMyBTYWx0ZWRfX/JD9gupdn6gq
 miG92y0CHXi3gMCXcVmOKxaUyIiINPUKhrResCbwGrYZvtGPbpW36e6FixgHyv8jMnwXJdlrWzR
 C+wOZ2rvml5B1aSEczUWknA2zOjPGBmptdNzmFySN7h/EYyVTAu86krH1N2sWzEjwV74PAmvkBq
 SRzXJm6QwOaxe6nmo8eGjQqF4Jz9Ay0rxF/QotVSTAy8iIvsbXds2WhLBQLwYQ7gaGWRmq4OoAv
 FC+I4C3nuD5Z5hNYnVMk0hLebLr+AHoNgncNhW8wOGciktVPeDi4n1HMMJKhB+RVf3XxzpIDJK9
 XuJjTl02ZY/uCgJDspInSgs7JpA3t4Cyhf4QG64RhGwe/B0bP/6UzJtPKBO9vMkkI1szMmaCorA
 5ZZZPNB6pdta75OsEpH5BGRHV0SQy7tl7qBmJQwPb0UjXcDQLR7HTn0weuU2fnOtn4sZbOCyz3Z
 xFdkqLLMSqiZCUM8uxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220033

Hi Zane,

On Thu, Sep 17, 2026 at 3:00=E2=80=AFPM Zane Leung <liangzhen@linux.spacemi=
t.com> wrote:
>
> On 8/10/2026 11:22 PM, Mayuresh Chitale wrote:
>
> > From: Anup Patel <anup.patel@oss.qualcomm.com>
> >
> > The RISC-V trace ramsink will need a mechanism to copy trace data
> > into the perf AUX buffer. Add gtrace_path_copyto_auxbuf() function
> > and corresponding trace driver callback copyto_auxbuf() for this
> > purpose.
> >
> > Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> > Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> > Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> > ---
> >  drivers/hwtracing/gtrace/gtrace-core.c | 22 ++++++++++++++++++++++
> >  include/linux/gtrace.h                 | 24 ++++++++++++++++++++++++
> >  2 files changed, 46 insertions(+)
> >
> > diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing=
/gtrace/gtrace-core.c
> > index 6ff1b3087947..53a3679ba69f 100644
> > --- a/drivers/hwtracing/gtrace/gtrace-core.c
> > +++ b/drivers/hwtracing/gtrace/gtrace-core.c
> > @@ -626,6 +626,28 @@ int gtrace_path_stop(struct gtrace_path *path)
> >  }
> >  EXPORT_SYMBOL_GPL(gtrace_path_stop);
> >
> > +int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
> > +                           struct gtrace_perf_auxbuf *buf,
> > +                           size_t *bytes_copied, u64 *format)
> > +{
> > +     const struct gtrace_driver *gtdrv;
> > +     struct gtrace_component *comp;
> > +     struct gtrace_path_node *node;
> > +
> > +     list_for_each_entry(node, &path->comp_list, head) {
> > +             comp =3D node->comp;
> > +             gtdrv =3D to_gtrace_driver(comp->dev.driver);
> > +             if (!gtdrv->copyto_auxbuf)
> > +                     continue;
> > +
> > +             *bytes_copied =3D gtdrv->copyto_auxbuf(comp, buf, format)=
;
> > +             return 0;
> > +     }
> > +
> > +     return -EOPNOTSUPP;
> > +}
> > +EXPORT_SYMBOL_GPL(gtrace_path_copyto_auxbuf);
>
> Is it really necessary to introduce `gtrace_path_copyto_auxbuf`? The buff=
er copy logic should be
> exclusive to the sink component.
> A cleaner approach would be to delegate this directly to the sink instanc=
e:
> ```
> struct gtrace_component *sink =3D gtrace_path_sink(path);
> size =3D sink->copyto_auxbuf(sink, &event_data->buf, &format);
> ```
>
This looks better.
> > +
> >  struct gtrace_path *gtrace_create_path(struct gtrace_component *source=
,
> >                                      struct gtrace_component *sink,
> >                                      enum gtrace_component_mode mode)
> > diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
> > index 78e2ead3db8e..bc82814e2738 100644
> > --- a/include/linux/gtrace.h
> > +++ b/include/linux/gtrace.h
> > @@ -257,9 +257,30 @@ void gtrace_destroy_path(struct gtrace_path *path)=
;
> >  int gtrace_path_start(struct gtrace_path *path);
> >  int gtrace_path_stop(struct gtrace_path *path);
> >
> > +/**
> > + * struct gtrace_perf_auxbuf - Representation of the perf AUX buffer.
> > + * @length:   Size of the AUX buffer.
> > + * @nr_pages: Number of pages of the AUX buffer.
> > + * @base:     Start address of AUX buffer.
> > + * @pos:      Position in the AUX buffer to commit traced data.
> > + */
> > +struct gtrace_perf_auxbuf {
> > +     size_t length;
> > +     int nr_pages;
> > +     void *base;
> > +     long pos;
> > +};
> > +
> > +int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
> > +                           struct gtrace_perf_auxbuf *buf,
> > +                           size_t *bytes_copied, u64 *format);
> > +
> >  /**
> >   * struct gtrace_driver - Representation of a trace driver.
> >   * @id_table:      Table to match components handled by the driver.
> > + * @copyto_auxbuf: Callback to copy data into perf AUX buffer. The dri=
ver
> > + *                 reports the PMU specific trace format of the copied=
 data
> > + *                 via @format (see PERF_AUX_FLAG_PMU_FORMAT_TYPE_MASK=
).
> >   * @start:         Callback to start tracing.
> >   * @stop:          Callback to stop tracing.
> >   * @probe:         Driver probe() function.
> > @@ -270,6 +291,9 @@ int gtrace_path_stop(struct gtrace_path *path);
> >   */
> >  struct gtrace_driver {
> >       const struct gtrace_component_id *id_table;
> > +     size_t                  (*copyto_auxbuf)(struct gtrace_component =
*comp,
> > +                                              struct gtrace_perf_auxbu=
f *buf,
> > +                                              u64 *format);
> >       int                     (*start)(struct gtrace_component *comp);
> >       int                     (*stop)(struct gtrace_component *comp);
> >       int                     (*probe)(struct gtrace_component *comp);
