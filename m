Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28423AF672
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 16:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283495; cv=pass; b=MgeQ7DyN0go7/wejJG6yEwUHYJivIEmcpNSYimk2R8drlTfp7Ltf7Hulq01Z14GJlRRqJ10v+yXMNHjDVF9z3gWgN4EGrLNNP0vi4L8RbNhoS74hWuGmpS3mx141eUwzJD7GCR9ALbJQzTK94MyR8CQwerUFgPSRTUnJlbuIIME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283495; c=relaxed/simple;
	bh=nnrPf4ABal+ROA9j22uCLWEuAIBJc+AQEH0rvl+UZZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V4hiJDmbW7YOrrwTMmYrLg1S6rbNmSBaRATBvYWLgNwXbDnFUiiWKCUFcxnO+chWFfIAEqxeKnndRbu1bk3FxYlMNKBadfR86F411+TMdLRsiiWoLRY7f9Wmm8JRLTI5QaDsp1l7SLBg1CBftPZOXaTlRAmJUQHeVrqtQTgTy6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kb5nB1aE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h+qdLUcE; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kb5nB1aE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h+qdLUcE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGcV32829166
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 16:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JZ572RpNkD9NnmO9VWS6w0u0/xf9rfubmv+0bJXXOQU=; b=kb5nB1aEoK7BdaVV
	WTt054uNoy73wZjBqSM81LPUUmy9P8P7LSkYVseb8S/tEIJSMLSBQzBTe57sc67s
	/9sciPLMopCBFtobPWPFBv9YDeEr13NgXG1ch2qG5lBpTj0cJAvQg43rXO7ZqRQ/
	blT6u+lqAzwUkPiBInFoTBNe/YRWLPRRrauju9ims1c4CBFxDvHDwaYduTMGGN0x
	MheNL8xzpzHweKV3nh6JjRNqhOJhF6NrYlSrdx2iCL22sy2T1d8AcVbHgzMNvyHq
	nu+qbNf2BujvLutE+r4wUobuRuq+swPFA/dJ43S7oeXftkxctFhLSavmN2N+iACD
	3SIe9A==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r20txp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 16:31:32 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-41c08879ba3so45754402fac.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:31:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774283492; cv=none;
        d=google.com; s=arc-20240605;
        b=XzpbQj1wqJNlZjh8/bAJK2cyZdzO8DU5ANnXBP3hVSL0jW29+xcoAIECGVyEnYOLZC
         oBWLu3HViQpoWJ9ao/Aqg5X4O/xNEoUu4zQrSC0od7tUvhJ/1BjHt7uMIJhTLeHecAu/
         1JuBukOKiVsOopolRvU2TWsZm2WIIHgPKP+Hjp3IfPDzGPIKOup0Q4jET2p1WGOstGqC
         tIbWSS+Js+HGeb3dsmft/9xT87aww3ou86rfBiOXcGV29rU7ql4XwpNU1NOcdsZSv0kq
         nLYVkzsmFLy1SjcHN/nZqF52oRXoliDSPcPtra9pCVErQLVCK4RlSuEgmKzhO4E992D0
         e9tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JZ572RpNkD9NnmO9VWS6w0u0/xf9rfubmv+0bJXXOQU=;
        fh=TiUkJVEXfnR1uIxzVK0uWHCnOQo2iZrG0cqxPakjdvU=;
        b=Fm6CQFMkMsGkHFIOXh2VmYhqRubEHnUGAzxLE22oHBsAfgjR0zYP12ft7yyXA24YzI
         iU8hOKbYtwwTP1qLSXYxKnS7/1tKYiKZWBIjO0BiWhFs6AWQttMuz+T28eQWkm4rZGm0
         arv/smTGNhEht6zWKp+1kzH3UgC9EyaU679nLx+4igr38EX5D/BDfW28FiBWewIZv/lP
         OG8W/YQ+qojHtNO9jpzAnbrffet+2Krv33/5Ua7o83GxxJgZ+sonZ//copAhthQ4WX+d
         FmSV3RS563xQkLrCy7f2itvOsprmJYPT3fdUXm1TEW74Susaw+EHnSjmEXC+Ylyc3bdX
         4qUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774283492; x=1774888292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZ572RpNkD9NnmO9VWS6w0u0/xf9rfubmv+0bJXXOQU=;
        b=h+qdLUcE2W4EbNzQMCw6zwb3sPipLSQJ8R3HuejwbB4qLqlyVnFiMVeOfOEuZRKc2L
         yX7JdykZqLXgIo2TU7Wa73ftR3+UsgeI4QVacuFA5kdMJ3l834Jx3hSBT6vkKQnJsd/D
         szznckP5SMxvmKhp4Y9h1ZPWWK/d+oqtE9+oajM+svd8tp0PysOdY23H30Y2Xm/9bdtH
         7hM6kfrOJWoCg+wUX9UE3UHW5GWzChz8t69dgBhJncRADppK4MgktF18AWYWitay7QSz
         d64u2kibUUY0OHACAb0VLR3q+Xz3dzxtx0ZV7OeWG+Qvd7DG4Hk4XQxSMENwjXt30zkv
         xSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283492; x=1774888292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JZ572RpNkD9NnmO9VWS6w0u0/xf9rfubmv+0bJXXOQU=;
        b=G11xb25Pre7t5WL19p0Ge0yIUKGpLjvKuRTpSzZ6DVesLq36QoQa7swKK5miIqyLeE
         ei0IV1lnZ0/YT+AAmC7qgQ7HGM5ugvlXVu7rX9mgnDUoLln6a3tm1ndJ6zDAs1up3/nm
         J6iRRvyFqU0UicxE8/h1a4hOk947ajMYeMyDx6PFYGH78mlWO/sFLkwWOe4w0lFEPBD8
         hVaBOnzR9icIPXUnyUD1VLCfiTQSpjeKl5i7GImlWyt6EREx19X7yDtYibPYqBQQZj6q
         TMG/ToG0t0WV5UXqXzMW24Jd1EjJFz85biSNpAsUkjIm5TbuQ1Yf4Kq+8PVaZO8NnxiR
         waOg==
X-Forwarded-Encrypted: i=1; AJvYcCWHdih04ak/Zw1M6RpQQOKX//pVDl+b4Ahv35q0NNrSJAEOlBS2ojE6vkOw5xJMCRs9kmceD61BruWp@vger.kernel.org
X-Gm-Message-State: AOJu0YyG8wY8NmNhUOLofgxogbXJUXbJlgi7v0er86je9fRIch0TUFfR
	+vNe//6khqDDppbOlluc8sUhdE+a5tSOpzddlsI9Gauq6QySLvNAHThap11sYNZiStvdh85OeoU
	/vZPDgj4m53H1gwdz6NbHbHA494WIm9OKexueqbVo44m8hXWRPjbSbgqruPzid79WekMY/Z06sM
	GzBIhgQy/jfhEj9oMJmeoOPvhg8cH2l5fRlIX6zks=
X-Gm-Gg: ATEYQzwJ1EUmFujwFibUJtDkdLnSCyeF1mEgXNKdaNl96yEOux3cIBMVtio9Y1YHPYV
	wlPjSY7+7Up0xYhy/75DC2t0J0B5pjGXnIj8uPx3aFmUiyelfkgv/gF/6chFrm7GJyZvwV06mtT
	csyr8gig9Toi0a1C98vONBL8K+WVm+D5BOwGbsQSc4EvCnwPkjWcReNVIbnZhvdjbFscrzKVEOD
	g1GTqR11Dnkipo2k+7XpPIXH529AVubv8wJPhIh2gdVirY7G/S3Jk1bLpMioEXWiL9K
X-Received: by 2002:a05:6820:60e:b0:67c:3142:b191 with SMTP id 006d021491bc7-67df5d8b201mr184609eaf.24.1774283492045;
        Mon, 23 Mar 2026 09:31:32 -0700 (PDT)
X-Received: by 2002:a05:6820:60e:b0:67c:3142:b191 with SMTP id
 006d021491bc7-67df5d8b201mr184574eaf.24.1774283491520; Mon, 23 Mar 2026
 09:31:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <20260323125824.211615-4-loic.poulain@oss.qualcomm.com> <76edd04d-7bd1-4b42-bea1-79f4b149c0bb@oss.qualcomm.com>
In-Reply-To: <76edd04d-7bd1-4b42-bea1-79f4b149c0bb@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:31:19 +0100
X-Gm-Features: AaiRm53pz500vb6i3cErdYdz3rrYyZsWdQEpVL4m9bzIQb6suv6a2Ww6ErO-Z-A
Message-ID: <CAFEp6-3R+O_j+g39oegS=WHUTxnF2LzPx0t-C23+PA8zUhCmjg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] arm64: dts: qcom: qcm2290: Add CAMSS OPE node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: bod@kernel.org, vladimir.zapolskiy@linaro.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johannes.goede@oss.qualcomm.com,
        mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c16ae4 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=XYktinp8IYMsYWtSA-8A:9
 a=jswe0t86hwuQ8JBO:21 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: SSvLjCirGxuAoKwJAb8k7fGQH75b1BGi
X-Proofpoint-ORIG-GUID: SSvLjCirGxuAoKwJAb8k7fGQH75b1BGi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyNCBTYWx0ZWRfXysNBP5AcTTa3
 O/Mt94keiQCNPxfaOw2FDG1GO1dT2XgpFSIer0yyn2N1iobYPd04JXYQ8RwmnYe4pJ/4H10SwfY
 gTLcL7yjDRYhCESo3+4I9t1Up4GtBxLci2FD95w+NQl/P5yIN2JMdncMzpnh7HWepi+L1+K4oTn
 YIj9L6DC6vjbzQqgzoS23c/3LHfBiQu5L2AznkqmMhKnrWVYoNehyUbj9T9LX8PBdYWSbRRc45J
 4TEWNyDcQQTMftiUQ1FZqXVcQlqpOYvbnIVfap6x4pfzgpSszjZLq9FsDWHR7QRaFxn7h+uWd4A
 iLVFSpF+CgP5riYd512NTVx/7twlIOq9Jue1RcvxGz5+6RurLSApkYanp3Gesabk3N3Ie2uBKQq
 ntICU7uTuxHtI6A6EY0IuzN+4YrhiZB1Q+V+aXuvZKMW9hJl4V2XyC0DNosgPquereBuE+G43XW
 wmuAZfibBLIt11CVChQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230124

Hi Konrad,

On Mon, Mar 23, 2026 at 2:24=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/23/26 1:58 PM, Loic Poulain wrote:
> > Add the Qualcomm CAMSS Offline Processing Engine (OPE) node for
> > QCM2290. The OPE is a memory-to-memory image processing block used in
> > offline imaging pipelines.
> >
> > The node includes register regions, clocks, interconnects, IOMMU
> > mappings, power domains, interrupts, and an associated OPP table.
> >
> > At the moment we assign a fixed rate to GCC_CAMSS_AXI_CLK since this
> > clock is shared across multiple CAMSS components and there is currently
> > no support for dynamically scaling it.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/agatti.dtsi | 72 ++++++++++++++++++++++++++++
> >  1 file changed, 72 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts=
/qcom/agatti.dtsi
> > index f9b46cf1c646..358ebfc99552 100644
> > --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> > @@ -1935,6 +1935,78 @@ port@1 {
> >                       };
> >               };
> >
> > +             isp_ope: isp@5c42400 {
>
> "camss_ope"? Label's don't need to be generic, but they need to be
> meaningful - currently one could assume that there's a non-ISP OPE
> as well (and I'm intentionally stretching it a bit to prove a point)

fair enough.

>
>
>
> > +                     compatible =3D "qcom,qcm2290-camss-ope";
> > +
> > +                     reg =3D <0x0 0x5c42400 0x0 0x200>,
> > +                           <0x0 0x5c46c00 0x0 0x190>,
> > +                           <0x0 0x5c46d90 0x0 0xa00>,
> > +                           <0x0 0x5c42800 0x0 0x4400>,
> > +                           <0x0 0x5c42600 0x0 0x200>;
> > +                     reg-names =3D "top",
> > +                                 "bus_read",
> > +                                 "bus_write",
> > +                                 "pipeline",
> > +                                 "qos";
>
> This is a completely arbitrary choice, but I think it's easier to compare
> against the docs if the reg entries are sorted by the 'reg' (which isn't
> always easy to do since that can very between SoCs but this module is not
> very common)
>
>
> > +
> > +                     clocks =3D <&gcc GCC_CAMSS_AXI_CLK>,
> > +                              <&gcc GCC_CAMSS_OPE_CLK>,
> > +                              <&gcc GCC_CAMSS_OPE_AHB_CLK>,
> > +                              <&gcc GCC_CAMSS_NRT_AXI_CLK>,
> > +                              <&gcc GCC_CAMSS_TOP_AHB_CLK>;
> > +                     clock-names =3D "axi", "core", "iface", "nrt", "t=
op";
>
> Similarly, in the arbitrary choice of indices, I think putting "core"
> first is "neat"

Ok, I thought alphabetical ordering was preferred?

>
> > +                     assigned-clocks =3D <&gcc GCC_CAMSS_AXI_CLK>;
> > +                     assigned-clock-rates =3D <300000000>;
>
> I really think we shouldn't be doing this here for a clock that covers
> so much hw

Yes, so we probably need some camss framework to scale this, or move
this assigned value to camss main node for now.

>
> [...]
>
>
> > +
> > +                     interrupts =3D <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>=
;
> > +
> > +                     interconnects =3D <&bimc MASTER_APPSS_PROC RPM_AC=
TIVE_TAG
> > +                                      &config_noc SLAVE_CAMERA_CFG RPM=
_ACTIVE_TAG>,
> > +                                     <&mmnrt_virt MASTER_CAMNOC_SF RPM=
_ALWAYS_TAG
> > +                                      &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>=
;
> > +                     interconnect-names =3D "config",
> > +                                          "data";
> > +
> > +                     iommus =3D <&apps_smmu 0x820 0x0>,
> > +                              <&apps_smmu 0x840 0x0>;
> > +
> > +                     operating-points-v2 =3D <&ope_opp_table>;
> > +                     power-domains =3D <&gcc GCC_CAMSS_TOP_GDSC>,
>
> Moving this under camss should let you remove the TOP_GDSC and TOP_AHB (a=
nd
> perhaps some other) references

Yes, will move it and remove what we don't need anymore.

>
> > +                                     <&rpmpd QCM2290_VDDCX>;
> > +                     power-domain-names =3D "camss",
> > +                                          "cx";> +
> > +                     ope_opp_table: opp-table {
> > +                             compatible =3D "operating-points-v2";
> > +
> > +                             opp-19200000 {
> > +                                     opp-hz =3D /bits/ 64 <19200000>;
> > +                                     required-opps =3D <&rpmpd_opp_min=
_svs>;
> > +                             };
> > +
> > +                             opp-200000000 {
> > +                                     opp-hz =3D /bits/ 64 <200000000>;
> > +                                     required-opps =3D <&rpmpd_opp_svs=
>;
> > +                             };
> > +
> > +                             opp-266600000 {
> > +                                     opp-hz =3D /bits/ 64 <266600000>;
> > +                                     required-opps =3D <&rpmpd_opp_svs=
_plus>;
> > +                             };
> > +
> > +                             opp-465000000 {
> > +                                     opp-hz =3D /bits/ 64 <465000000>;
> > +                                     required-opps =3D <&rpmpd_opp_nom=
>;
> > +                             };
> > +
> > +                             opp-580000000 {
> > +                                     opp-hz =3D /bits/ 64 <580000000>;
> > +                                     required-opps =3D <&rpmpd_opp_tur=
bo>;
> > +                                     turbo-mode;
>
> Are we going to act on this property? Otherwise I think it's just a namin=
g
> collision with Qualcomm's TURBO (which may? have previously??? had some
> special implications)

588 MHz is categorized as the "Max Turbo" frequency for the OPE core clock.
At some point we may want to enable this only under specific conditions.
For now, the OPE driver does not make use of this property.

Regards,
Loic
