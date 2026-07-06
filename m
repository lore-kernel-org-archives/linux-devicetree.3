Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328D331A7EA
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 13:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345681; cv=pass; b=fxH68tqqBwBnPucpkFLtcVgHXalzpINKGn+H96mTC0VJkgpwX1eDg5WOlThYaFq3eAXisaCvdSJX9/Qx5X0sQXvctV18neilugpn0Wo3btqFac0fCw1nBNIn9Qy88os3WzrfkgG0cQhQu63qGJyiyj9nZeFUWrjbVTEa/nwXJS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345681; c=relaxed/simple;
	bh=yKX3QpsD7jnRt3KbvpEzXQdNJzUs2fSGcUMARjKoeg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LcIGF14NsvTihm4wCroYHq0cfofv2T/L8Dv+XsFoytSdelUGBCQRyVsQKROVxGELm6zVE4bqYCJZZATAFhiq0A9rM5Y1uvTNOF3BwFSPEQoj7vA5iwy9ERdQ48c2xhioWtY6kC2BmfT/y8cFnqEdQekfoK20m54ct/u6Vx5IXzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=diDegdcI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dlsr2Ed2; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="diDegdcI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dlsr2Ed2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxIh1174839
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 13:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/UdN9OJlWbUEGF0w/8hgD+on193H22chezDSr9kjxHY=; b=diDegdcIKsq+G9DL
	tsBdcc9t7yraNFXFOlVWLtIU4Qeq06aN10BNvin892Q7yyjuqghxXpT5RJIm4DGL
	q0UEpI1qwCEHwEVRB6kI9p7nrduhw278ucBr7yiyKRGzHAlDt/jq84Rz9pI5e5Br
	epwnV/Z5IoJ9FeoI8e5XmxH5nJwJTe3xHDPj3XvAz0hJUfAFLKZ7t8ke+tPI6QgS
	oF8RWa/QO9poNHSHaOVQJCStNNBNvujz6O8Ma086V5R64UTVl5tcjPny0CoG2oD7
	LvPzUxhpWw9ERxPFyj237wYPZ5LX/5PGXTXr484Z1T7k2Kx1M3O3rNe0I20cbnTv
	Z5xnHA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxsjaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 13:47:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e63df032bso335272085a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:47:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783345678; cv=none;
        d=google.com; s=arc-20260327;
        b=Qa0M9Ab5FLE+WeX1waZlB6eLNfVK+06SGMf0L/BOVaQK8m7akHRDUxOfae3GrS5dYs
         h3W3J3s1eBQbI/zHEwrFWGWvEGdJUZuQVzv23NN9QLR9Jd70ZeYyLZpgkyY7QM94iZXm
         B43P60K10DOmlSsr/FpexVEW8BLbfwncz1Xklc11JdL+Cd6PhnQkQqN0WaTTYOx9SXWt
         TrYREE8VHojlcJ0PY7lfjXeC7ef/csQxrM2uY6uHoWULuDt21dd0d3Ev7k5rs8vS2mGF
         Py4qtKj3BuNBPlmh8ErvNpPkSjnl6u2rH+PxRbPFdHZc375yvp9TpLnh5OKPQfJ2UJEH
         hIEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/UdN9OJlWbUEGF0w/8hgD+on193H22chezDSr9kjxHY=;
        fh=53qvJawqK0TJTsq+MaD47KBMEtgXQmC582XHmZ7TrbI=;
        b=sNSo9Td40/wqv9GNfg7ukBm5v79L9SftIIi9brZuoc7DN7lsY8Lgh9fQIDiSB0mddn
         AZgOFrLN3+tonio+ZQv+Mp04WExdyVTd9wbTKpoHHdBW3TGMwdDSJJ2tOUIXXUVO1+ps
         VZ1Vda3o7vkZidwbm0uiEPQZxwe8T8XO389ckCaGc91zyN5rdGx1+jg7rYkLW/Cqxq83
         Zqz52ucbSb4Pgtugs2xq7dAjwhcvBR/56EXr52/8f4X1sVBx+mMWLNAcGzEYHx2PO7Bu
         WNn+AGBxv+nXjHcKAg5//Ee8QgVVintaNpx/OukrrQ83QV6AZeCYqfqjrkXuotOArdcP
         UhVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783345678; x=1783950478; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UdN9OJlWbUEGF0w/8hgD+on193H22chezDSr9kjxHY=;
        b=Dlsr2Ed2JaOXeZYZvYdTa1P6/EAjvEzafA+4HialaGoBt5hI3PjqylcaaUg3+qKvAy
         6iQwJhyeavF4uqIa8MOYb/avA0QP/53EPPj4sq0Hv2joNSMPMOEvYgf7x5BCASOmWsoh
         jbCJuo48TiQ5kNWojln4QSuRETS4zIyaezpKgR3xHBIwrKny2IEN7sh4jhJIHt8qSTRK
         /5u5CT9aDLuLBYyJIyTFkMWjiKsP/lMFvrXH5MPnjazeHMdqANp522AU+3CJsMSkBdy+
         AUVjoQu8lB1xP4nFgzoCz51qKI8i1WjjqryMzVnJ8cZkS9HithR4Mu7LvJKYo2tE7aU5
         elYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345678; x=1783950478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/UdN9OJlWbUEGF0w/8hgD+on193H22chezDSr9kjxHY=;
        b=dkg3fnBAn2y7cuVbJDSmEsaR70j1u4/WXKlTo/FOemU1C2jqV7calxpPwn88lw2C2F
         zTYip0dwReyCHAlvoQkwbNdq3Vf0eYMK/Wz4HN3ErzEN2nGbAg7f0iJu1NVlk2nmBBsv
         5zYBufWtqpIEWeuo1d9vjLM+PHF98p9gxSx03aA3OBGG9lCetAVCoywGG9mmS98LEd7s
         0Rg1nCpNMBGAfPErZERAhOFNRY6AJMJFvFpxdDlUZxQ99x2eFw1VwwGsY4jhi+lXdmax
         JgswRNdPVt92EfUyMiijVp8vtE9oO55aLRmVWk14KsMb6BtaiNGGZZlNF3BkyoYtRme3
         w8yA==
X-Gm-Message-State: AOJu0YwQOoAUam+p2JjPRs+ihYlNPAS51crLEkDg+euucN5WqxhpImlV
	UBRpaA5Xh8AtFlZScOqWFvnyFRcZCbLmBQX3UsV6Tf69zaGliapkZHJ4v4WxqKQuUjEKxnoT36R
	6mSefFcdeLxI4GR9QHhfsuQuIG/308zatn6IQy9q7BvvStpHOvh0+PrMZ3S7cN77eakrFb3rz0R
	lcSgcxNMrt+qQBzalV1XTAKbZw4W4D91BiNV13Cik=
X-Gm-Gg: AfdE7cmJ79bF2jOxiDwEaY5ZFN1iak/EycgH/YCI/HLHIK3+skdPrXr3omVQLJiG+Se
	ZZLvJzS7gKMXj3oJogVTsQcC/GVnY/uCOgD8RiThlQ0JAwPEkNqJExSbR8h9E3nQV5mEd+u0MBz
	j0/jac855083EceNPSVtXrZsVb9BdCk/2HSdl/63bsqManRmYCZb3+qrTbZbNcWhHYfp1qiT4/+
	VtOLaiwdF7jIatzC2QaTVnSOiyIWHxVJa3AqKgsbpXjARP1BI7cFioko5OC9fVgBhjTOzRJhQ2u
	v9A2wzPv4LU=
X-Received: by 2002:a05:620a:408b:b0:925:dce9:4773 with SMTP id af79cd13be357-92e8b56256cmr1966449085a.35.1783345677528;
        Mon, 06 Jul 2026 06:47:57 -0700 (PDT)
X-Received: by 2002:a05:620a:408b:b0:925:dce9:4773 with SMTP id
 af79cd13be357-92e8b56256cmr1966445885a.35.1783345677041; Mon, 06 Jul 2026
 06:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
 <20260703-block-as-nvmem-v8-4-98ae32bfc49a@oss.qualcomm.com> <20260704134553.979031F000E9@smtp.kernel.org>
In-Reply-To: <20260704134553.979031F000E9@smtp.kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:47:45 +0200
X-Gm-Features: AVVi8CcembUqad3b-OIrhXW-USe8W-sL-DPnI1aY0bddo2h5b-bJogd75j1IHvU
Message-ID: <CAFEp6-0zrw2=ed+eWquvt1WzYG4Hiu3ZfUXM4qLcfBsDO-y6Jg@mail.gmail.com>
Subject: Re: [PATCH v8 4/9] nvmem: layouts: Support fixed-layout as the nvmem
 device node itself
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: Ka0SV8vPI00flmq0ffLKkgeE8GDRjm4S
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4bb20f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=01sGXxyCQw8U16377doA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MCBTYWx0ZWRfX9/AYm+r63aS9
 +vqLXr/EKXhCBw8F+kH7BSrAYu9rjUhDjaV4FKoDoJtLKjBS6VmFCJyyVBkdDVSAb4A9YZ8eD6s
 hVyEriTGboY6Sd7MzGzMzDytLmhCba0=
X-Proofpoint-GUID: Ka0SV8vPI00flmq0ffLKkgeE8GDRjm4S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MCBTYWx0ZWRfX3LjYZYk1Qqu1
 aAM3kP21TbEZjpuCRR9B7FFM5h/qrDJl5nlvjiYTTqPHpJlij5KHfSIvVhvG41mRxK5f5cAGIw3
 KAp+VYFziRMbAo6X8gmcq4/4Bk+1b9gELZi1S3g/tKf9kSgk6ivHPYvJ4mpZbP3QorXPpazuGRy
 3CbgyT7hF5lD1w4hj7QvTctm+NkY2hWD0gvwdHkJkS1wrD24QUilXr2PL5XKMuX3ZxoLKiLCJjE
 vPimK7/FJr31Ma7l4GWh6RVsqqMvBfOkbxr5Y0mGN/AxXDSDU2yhTW20xb8K4MI9RFgZdYMWWpc
 Ov/sQsPOCMKu+LRE3j8nJUiZ5VYKALQ9B8+ZUBMa+RhmV7Zs+Ny+CxUh2o9Cbn+e+ET7gWp6r+H
 8vmu72oqKLpLXCBupAoepAkIRpm9+7wHy0qf55xzTFiIVEsGYdd4Psw6li0ysc/snAVIpSbPziF
 4wJktkvjowaMgTfzSmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060140

On Sat, Jul 4, 2026 at 3:45=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Double parsing of NVMEM cells leading to duplicate sysfs entri=
es and device probe failure when a legacy provider adds the `fixed-layout` =
compatible string.
> --
>
> commit 5ae6267ddd6db9a2a2626cb61243805bccbca0b9
> Author: Loic Poulain <loic.poulain@oss.qualcomm.com>
>
> nvmem: layouts: Support fixed-layout as the nvmem device node itself
>
> This commit modifies of_nvmem_layout_get_container() to return the nvmem
> device node itself if it lacks an "nvmem-layout" child but has the
> "fixed-layout" compatible string.
>
> > diff --git a/drivers/nvmem/layouts.c b/drivers/nvmem/layouts.c
> > index b90584e1b99ea..efa631ce7283b 100644
> > --- a/drivers/nvmem/layouts.c
> > +++ b/drivers/nvmem/layouts.c
> > @@ -167,7 +167,18 @@ static int nvmem_layout_bus_populate(struct nvmem_=
device *nvmem,
> >
> >  struct device_node *of_nvmem_layout_get_container(struct nvmem_device =
*nvmem)
> >  {
> > -     return of_get_child_by_name(nvmem->dev.of_node, "nvmem-layout");
> > +     struct device_node *np;
> > +
> > +     /* Search for nvmem-layout child */
> > +     np =3D of_get_child_by_name(nvmem->dev.of_node, "nvmem-layout");
> > +     if (np)
> > +             return np;
> > +
> > +     /* The nvmem of_node is itself a fixed-layout node */
> > +     if (of_device_is_compatible(nvmem->dev.of_node, "fixed-layout"))
> > +             return of_node_get(nvmem->dev.of_node);
>
> [Severity: Medium]
> Could this lead to double parsing of NVMEM cells and device probe failure=
s
> for legacy providers?
>
> If a legacy provider (which sets config->add_legacy_fixed_of_cells =3D tr=
ue
> in its driver) updates its device tree node to include the "fixed-layout"
> compatible string, it looks like nvmem_register() might parse the cells
> twice

This double-parse can only happen if a single node is both a legacy provide=
r
(driver sets add_legacy_fixed_of_cells =3D true) and carries compatible
=3D "fixed-layout" on that same node. That combination is not valid and
does not occur in practice.



>
> drivers/nvmem/core.c:nvmem_register() {
>         ...
>         if (config->add_legacy_fixed_of_cells) {
>                 rval =3D nvmem_add_cells_from_legacy_of(nvmem);
>                 if (rval)
>                         goto err_remove_cells;
>         }
>
>         rval =3D nvmem_add_cells_from_fixed_layout(nvmem);
>         if (rval)
>                 goto err_remove_cells;
>         ...
> }
>
> Because of_nvmem_layout_get_container() now returns the nvmem device node
> itself, both functions would process the same child nodes.
>
> Would nvmem_populate_sysfs_cells() then fail with -EEXIST due to duplicat=
e
> sysfs entries and abort the device registration?
>
> > +
> > +     return NULL;
> >  }
> >  EXPORT_SYMBOL_GPL(of_nvmem_layout_get_container);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-block-as=
-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com?part=3D4
