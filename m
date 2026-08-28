Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551023E5EC6
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 08:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906289; cv=pass; b=jeNwxbxVK6FBkCsZ/wC2Ph1N1AqkeAj/rZ+a3JK70H6jIqrHTkr/2zud2gASmaIX1/vVb21JAtb0YE5kH46+tG95qeZtSc4abdIB8u0EbjNv9TvZd3QpAXn626tu7a+o0fx3g4Fl+xhkagbYGTQ6KtvrCi4gH3vcI/emEYQSQeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906289; c=relaxed/simple;
	bh=Ov7oNLMXlrDII+yjoRbu1WpWpBvD+/TAzTcydjCpFgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JXEbfYdMJXjJ+FkMHbS/ibqlDcrqCU+i3PnuJZHNrcVelccLRZDRqpXCXWbMKHmFWFRV59ApL3F5NoRvo1cF9IQmaK3TpV0IZ+Sm3xYen2yND1amXozOVOXAQ8N9qZ58wO7t0x9VlXwxCzcbdqGilVoJDdghcrSn7lCvFiIb4v8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fL9UtJfQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EiiWbcOP; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fL9UtJfQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EiiWbcOP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66ii21940957
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 08:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QaKy5r5sUgNHinEqWyUrjHzH93zojyTrqfcdfZ0ImOs=; b=fL9UtJfQBopg+Dyf
	KjIYOkoCrV/CAztJwATKLOt8FKtaJ7OTm93FRB3aZlVth5qyY6FIXSIY8JmjQ/eG
	SVee5/Pawj6P5JoW4//IIEFaM8JMWoZnJiGH5KYqD+mhZBl21DGfpm7nykBSKuuT
	kGdDl5iAZ2UjnkzgVgURpSvsjBfsTEPDoQh7zgbcjVifKdwd6wcSt/KSJ43tkotY
	503Cc0f/AwnCNdLDIpjz3TqRDGZYaqyslyoZjMn5xPJpkhbLCiOndwzMQirsntZU
	l5ubctFuzWSr9Nkoggez7n6sLy3cyO7+J+2gexOWX9sHmswI0ad8C4kmMzOdn8vj
	Thhopw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3hs0vuu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 08:38:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93903622880so205341385a.0
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 01:38:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787906286; cv=none;
        d=google.com; s=arc-20260327;
        b=ZWPVDzTDJzDfx6JPUUyhveJw3HARSvNIuUkdh79BA+zvVK+9VV7gbbmkzev54NDP5s
         SShpjJevWjuBDxlzUOTpK8m86zEapHKGljeMUQxhwPh2+A4h9M0hUCcy7mCKjzMIbTg1
         jTiVVaWnYEcbudw6vQjdokOMQMnRd5J7aC28Tw3Kung1VMpfSLCDUBWdxzz+X/CiAlhI
         Wk79o4uYcF7tC/aKK9Auq+Y5i3Tfo0k+IBamhnNvdDkhJ1r3CkfMfyOoKuK1TjBUsnzy
         6X8EvLLrmXxB3nHpG258pppfNky82QC2RgjgxT+PS3vhN7aMqJDZ5gBFqCAqgbl7UcVK
         oG/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QaKy5r5sUgNHinEqWyUrjHzH93zojyTrqfcdfZ0ImOs=;
        fh=uE1iCH7hg3WbacYa4o/Uw4A7mLO7wUmlC7gCuH37A7k=;
        b=G7kO0SO9OVNz1xp6keTW6z142cqnhjMCVuqPjp1hItKfLLAuFuHe6kBqVLKKTvZPX2
         izFU8Ob8gG9UyxFSqwl/BR/tnQwKwCOuoHH3GgbZ6wpwVNhuGam56QzLwYGmnfSYwHrH
         BGsqekoInvk5KuVMCGsH7bfBK3owHqoUwFiG7npiDdG5iahXVQQKq2vCNeJkDxzIjmlE
         w+sLRh6EqqxsVCknDyBhMTONIGaqQVpyXNMHKdBlTbIaRZH0vCQhIG1FHOYGh1BOIqq8
         6v2CZJxGMTWi3cHwRy7l3LGTS5rMzvpy/0Eu9fqHvbM4mw9H8F+IfRTdJW8oqBbUNVFS
         +SuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787906286; x=1788511086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QaKy5r5sUgNHinEqWyUrjHzH93zojyTrqfcdfZ0ImOs=;
        b=EiiWbcOPXb+a2xQOewQEL0xw22PGH3OB8o9n2cVW1lmrJ7aLOQYeY32M0z8WxLXus5
         Je9IqCmhv7avaQt0ZW9BMPPavt7JYg7vtas7wgT4l0xJ921YPQkESHeioTXEREvBMqMR
         wvkCFRvCX41pMTTpjJVrDmmi4jKMh0wEiCD7KrHaD5c1dbJA++JmbktGQe5B9HtS9oiN
         PgLrxwI5X/fa4x77Cyc5Gyc7jYFtURrVxI+Or/3QoUYJ48TQxQSKSkX+x329tX+7FREn
         odiQ6gn0VL/2yaXEd5KjI7nA4jMLde5UcIM6A/fBcJ7CtO/11BTS5S+kEDSoxCgjlOQi
         7QmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906286; x=1788511086;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QaKy5r5sUgNHinEqWyUrjHzH93zojyTrqfcdfZ0ImOs=;
        b=qB3XLdbl0Wll6HYWeZejbKisthdoUu70s5ko7eJYQvoV77ydDTczxPIIWqO+9SLxHj
         Gk54Cj6VxakIZORLySlUzlTh2db+UFd2Tfcw8UCBbSE+ey65JN6eF2DPT5tvb+ZAlsZX
         UtPO0Mx4akmhw3IBjduIDh04z9RphCVwkYIlZaBqe8q8mkz11LoCxBjwDUE+Nw5EOgC4
         jokAC14xv5y84aqMj8DolpGhnP1K20fOt08RqXvrCJhv5CYOuq2QyzNd84JCUTSn6kn/
         BOl2KkB37ix8WNEbbsHBEPYg2O5v35nMG0jbcnjwaP4x8AeUoP01065KM8M8LA3Is5Md
         gdhQ==
X-Forwarded-Encrypted: i=1; AHgh+RqhbqiFDti5JVtAwJNwUDoJ+kNj5wOD1ALFLfPbuYIRCAnV/1JIC7rmiDYi4W15UzGE77nEiECBeUe3@vger.kernel.org
X-Gm-Message-State: AFuF++nrNtyYucC4yIEz3Ar4CETwjhKPmKBHiHgLl/awk9r3dIcQ4lw8
	+LpwGiAXKoCuCPtDBHbsd6Qlm01xQcojC0+W5l9OAlocR5ztnohyRLjuylPlUdEW8JnIPW6bl9a
	3akEJPvrrFcMmC77hsGMnoVRjkMxXu02BiuewdbDCd5rNLZPJJwB1u87OCeKTzwXlIHweQu8hJb
	yQCuispi1ckq8ZyiQdUQknIroe9SE7qUCNHzsTkkE=
X-Gm-Gg: AR+sD126QTCBoNxeR6YYWv/AJyJ/XHt2iMb/tlFNmIBhNhtL1VA5/IBywGK+b1WyKY1
	zZuGgZZc7zyHhnuArtjX6f2o0MUvcY6/7SrF2pwdG2nQ8un6cLU0/V8DkP0MAMgt76SiIIWVxMh
	/1cff9qGuIs8nKYDhNWlqVRvsJpZtyRGh2mENcfFne4xLsJXxRdDOaxUMUjZN3/LELmHT7YVTCf
	W8Sy7P1Ou4zudLtU+TiVf/wJ+aOihDlXoGHfmxe/eX63hNDZSzamsdSebkFSOrNC8MsQUsjLQVd
X-Received: by 2002:a05:620a:aa1a:b0:937:17f9:da2 with SMTP id af79cd13be357-9390016b299mr1349502385a.6.1787906286368;
        Fri, 28 Aug 2026 01:38:06 -0700 (PDT)
X-Received: by 2002:a05:620a:aa1a:b0:937:17f9:da2 with SMTP id
 af79cd13be357-9390016b299mr1349499285a.6.1787906285947; Fri, 28 Aug 2026
 01:38:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820-agatti-audio-v3-1-47337097ee53@oss.qualcomm.com>
In-Reply-To: <20260820-agatti-audio-v3-1-47337097ee53@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 10:37:54 +0200
X-Gm-Features: AcwNN1Xrc4yuLFTSexVNFwDPpWatuABG_1Mx8-1NlWVrfGRZ6KtGSzjHOyIqCdY
Message-ID: <CAFEp6-3O_L0dSqGWxg0TKOBTWMeAm8epikTzRBWa0DyJcQ3MLw@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: agatti: Add memory-region for audio PD
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=XKYAjwhE c=1 sm=1 tr=0 ts=6a9148ef cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6amzoLWt3lXFUk3ngxoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA3MyBTYWx0ZWRfXzMOu7HI+avLy
 GuugMrVKXVbGIK2+1nSre+Pp5b3ttlPtEi+w9wV54ybOudGSWER90MK3vaiX/eW1uzoosRYAyTE
 bRdsmegvz7SjfqygNPqvejGl2kQ0/AVo+xjSHcXAeKs29uHUDdrK+jcgAYgEKoe+dqSs3s9EupB
 RihS4MCtDbwl2blYr5+BHYrA+D/CwotXEWLyqWcdzrXC8pWoDLdn3fRETwLSGmiXQr/hpmcvv2l
 Q6aAu4LVAnkWoC65UH+hS67sJSi0hZDilNzdpoVQHQBHKB/gxT5XFfDX9IzNGBcqkvlziir31nU
 d5/bOoQAoQkbq8R/xZqN6KpK7e92qSpqGsYjg72iSwAqAI4/Waec3LOQFT4aZhWdOIfwrRd5GM6
 J4mrT/6vesISD235X0RMwHU2N1vnohiAyvXAQz0VFqybHwYSt/YB0YHDJmQbOLz+jJ0QdVinvDt
 t2cYQj/Jt9kB2J9yZ8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA3MyBTYWx0ZWRfX9yUkEz2ViTKl
 OQyiCYyV11nsQFJRWFjmPA7PorVwsXe8CRcYnGFBEQGfNGfFLjXBZhQzUtBrIoxIVThUfGl7tGI
 j1G/Guo+OChOY9edkNQEb59xT+I5CrI=
X-Proofpoint-GUID: lr0p_LBQtk-47J9suQrYMC989VYzCeID
X-Proofpoint-ORIG-GUID: lr0p_LBQtk-47J9suQrYMC989VYzCeID
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280073

Hi Vinayak,

On Thu, Aug 20, 2026 at 7:52=E2=80=AFAM Vinayak Katoch
<vinayak.katoch@oss.qualcomm.com> wrote:
>
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.

My understanding is that this patch fixes an unexpected reboot during
the launch of the audiodp service? If so, should we add a Fixes: tag
to make it eligible for stable?

>
> Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
> Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
> Changes in v3:
> - Changed alloc-ranges to <0x0 0x0 0x1 0x0> to cover the full 32-bit addr=
ess space.
> - Collected Reviewed-by/Tested-by tags.
> - Link to v2: https://lore.kernel.org/r/20260807-agatti-audio-v2-1-3959b1=
ab8059@oss.qualcomm.com
>
> Changes in v2:
> - Fixed VMID list alignment.
> - Link to v1: https://lore.kernel.org/r/20260806-agatti-audio-v1-1-cd6766=
cc9ccb@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/q=
com/agatti.dtsi
> index 590bd2432d85..d010ef7fdf8c 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -381,6 +381,14 @@ rmtfs_mem: memory@89b01000 {
>                         qcom,client-id =3D <1>;
>                         qcom,vmid =3D <QCOM_SCM_VMID_MSS_MSA QCOM_SCM_VMI=
D_NAV>;
>                 };
> +
> +               adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +                       compatible =3D "shared-dma-pool";
> +                       alloc-ranges =3D <0x0 0x0 0x1 0x0>;
> +                       reusable;
> +                       alignment =3D <0x0 0x400000>;
> +                       size =3D <0x0 0x800000>;
> +               };
>         };
>
>         smp2p-adsp {
> @@ -2348,6 +2356,9 @@ fastrpc {
>                                         compatible =3D "qcom,fastrpc";
>                                         qcom,glink-channels =3D "fastrpcg=
link-apps-dsp";
>                                         label =3D "adsp";
> +                                       memory-region =3D <&adsp_rpc_remo=
te_heap_mem>;
> +                                       qcom,vmids =3D <QCOM_SCM_VMID_LPA=
SS
> +                                                     QCOM_SCM_VMID_ADSP_=
HEAP>;
>
>                                         qcom,non-secure-domain;
>
>
> ---
> base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
> change-id: 20260806-agatti-audio-357bcd74ae9c
>
> Best regards,
> --
> Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
>
>
