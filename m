Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2085344D80
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 01:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777427866; cv=pass; b=aB3YyZbQgFzXA/NPdxNjmzRLydNn3+qK5/nK18rfGau1skS851MR+1b+lv7/hslvJt9tJa/psqw6ffSzvW3PMI8ozrmRsqCKQLqTQ6B8pIU2lATODGP/cm8V66so1T0PhKnnMOnHVzopcSC1rJJPQFsZCaWCv2l1tIDPUCDyVIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777427866; c=relaxed/simple;
	bh=v0pECtDLS1/N/08xgmMrXQST0ph4UNgD2w4OD3nqRrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TcANILZF/3jVSq7rFiEGZP2aG3Zf4XvsoG39ehPxjqzWW7EK5ooectjsc35eUwmMZbzTIzMOepkOr2Ie06eXU/98FaYhSf/p/Q2eIC25gu/gX3RFjttfd8ms4pLDL+wOF01fKKitZBQxY+5sSIwqnhiijP1F2Zx0rNh4cr24Cxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PP8XlWyM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TAEEb+w8; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PP8XlWyM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TAEEb+w8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T1NDhR1796713
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 01:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QGdi/0odJyQdRd+R58nzgomfaTnHnMHFNBmgVpxzfGI=; b=PP8XlWyMxWwT4ci6
	en9xn2JHZjvetwxHwd/WuPlvYhixLk7AyHlmfqI81lcxXS8QsAx9ZlBZs/gt9GwW
	6ueQJ/Ab/Gveciw1C+1cIJn397SR1MA5k8IFqMyWmvG7EOo7BhjfL9ciSRc4iLzH
	6ukgF9Bp/2SPwHXFh6axZGrfoGkAZyWzBdJQZYgw88T3WOnnG3fuRIYcDBM4iZSx
	AtJQxISQcC6iu4uz9KMmujmGEpMcNgKXuigDCRMqncJ1c29ljyVfDCbAPMhpsi0D
	X/hGNIaX/W64h/DHC9Jeaxp4iYM2z7UrefBJOkWCa/dFJUJ4yaFmjriu7t5b/jvB
	ve79JA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttt2uauk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 01:57:43 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-79064868702so67614627b3.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 18:57:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777427863; cv=none;
        d=google.com; s=arc-20240605;
        b=SsY2TzrUr+WRfn+1bHNIUmrkK6KjgrFb8sTFgeGGoiDHExhhsAfIqfbo3lSvG2T6Tz
         aWG1mX/z9nvIN6DWNeOniBPic46R3Ow7rBa7riLS1+uOtXDW6SUqiGu4qFCIkJavd+mX
         3OitXBRS1HJWAs8oUsmxU/kzpd+eO99CG3g6UVb+EVpQOVjK/sENy54eLHYpW0pa7C5S
         cKpWE6ci2O6wCrjNMDxZYpD1bOQt4PqUGK5oT7o9dAIMrZkvQvitMZbiz92MapZun5aQ
         g2PN9SaHcOGJYAxcIoq/rc0cK5F1LYXrSLPI0tZhbPLrs+WyhkrqHtIM8eX1P5QkcYxl
         TGWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QGdi/0odJyQdRd+R58nzgomfaTnHnMHFNBmgVpxzfGI=;
        fh=fPk3eXPEf4Mynut2/QbDl3RnxmlgEM8ivqPStxYIYIY=;
        b=Ca1QhIMjLPc2xPgx3vrlF3PjduRJJYjCIjr09OLIg0SRo6vgeN6G8PR5fQh2+rujxb
         rL51uLkZJvx8oG4eln0OEOa6reOo4IPhXZsjJ6m2neOB9DiT4q0K4bYmnCcak3hauxKi
         f/Ua9hwFoT8Qmjsy/AB1ZZ6GoJCeARaXpfViJhwDfFsH9GB+bEBsWsGH76RkRLpdXHS0
         HHdsJF+zURUq4oKe2BnW2tToMW9r/6s/8SgF5qvlcvFRsY3dCt62lNAtM3E9UHvckCUt
         N49hRrCLyxy5Fu32N2UvgcvpsSGSwHiq9FWrFOeKkQ85dDAC7A48618buIIcAClQZy1s
         EQwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777427863; x=1778032663; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGdi/0odJyQdRd+R58nzgomfaTnHnMHFNBmgVpxzfGI=;
        b=TAEEb+w8ybynUlOOLnp28a5QfVBXOtbbzEJofBuGyuFF4wUqtHwtBfk+gV3C2M0Ahd
         rrIbKYzfCjMP1JtaEwK/B1PVv0pOOEiHyn+cIfTZ0k/H/iOP8J2bNGXNvLL7hScg8O5g
         hwiJY8e+jHDYQcngVq7TcFRtrWghdt+gX2miyaU3MUxy2aY7fn7tATsdZ2RtoL4nncyT
         8MEAX+zdaIH9yHELTsvCi5xtflPeXsAxNLpTOVp9sB8FFkDJSsvNLogGkM8kgwLY5r/J
         J6H7nT+Ax05+Qy9pDr5X0cCrLMLfg/7reFkxU9Rg9eHy3GtmMcg0yZkD5VTDlfH+gZ1d
         wyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777427863; x=1778032663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QGdi/0odJyQdRd+R58nzgomfaTnHnMHFNBmgVpxzfGI=;
        b=CiQzrnN7BkVW46fGZdmrJG3Sc7ZI7uigX36h1z0nIS9iF+DfamAyaDjlqn8fhqDnlc
         gKuUMmCn7XS6MpbbXRIOPE4jc0k0NQOWRIoTMDEhl937VkoaujmIoLTSCNhQNYd01FH8
         as/kIVlYuD3iUuv9sypXtBQzaEC3h5dephLyk26qDBBY0H2aPN4C1hSYa8xv3fZHS/7q
         eVJyGgZv//k8fWLrGTDQOrwH+BSzTB5TuRzBro9GScQLZYNKpQpKASkvUhXa4Yw+6iwZ
         t6QxpWfr4m2XxO/ar+avcm/nOrC7F/ZOdHwQspBAYkdMkBAsJwIbv997mracdLxZRh4k
         +xgA==
X-Forwarded-Encrypted: i=1; AFNElJ99tWK/kmiCi1svCAEeSRuUB3Ua5wHaKXikN8zdJhsYUH66kEy70FmOkkQiBu15iScWpJ8LEAvlGIVQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx9yLmRxMjmV5B5GJnEm02Sa/RD1ypI8oL8mgC4Zbc6gPAC0wU
	zkXDev/Hk+rCQU5z7fB0Eg4oS7eNsHBb5oq0LQEr52N+oqjkz9yVntlM0Wz9RpX8cLLhgkCGLwz
	9YTO+9rrz/f79TENQGOZUwdFWWtkhs+m2YjdaRe+v6Q6JnMY/48xXjyEVK3On1Pw5zDnuoXekmE
	abB7SPx00mQ2XQE1W4mR4z2+j7s/wxEbfzJ0YSfVg=
X-Gm-Gg: AeBDieuamUFbYSkcDMlMy2cHKhd1QNeNyEE92G5REAcqw5Pqvu9DKRKImHJupLkszqR
	CWHu456RlfTT3l5PRJGYE/VcflsGZv6VGtQ/7t0azKisGY42JyInJYE+6trtGGK3Df8viZz3xsO
	J93ifWpxqag9VJCwgxIfhfWozD+1go2D7ClcWbhUmVO+sbAm/X3C6cNzGUrMPviy8Y29jz0I+kY
	WT7n9ReCuqOC9omOXxkmyVW89kXWpLxE6PkqoqW8Hni0kHPBQ==
X-Received: by 2002:a05:690c:95:b0:7b2:dad2:5e0d with SMTP id 00721157ae682-7bcf55984d8mr55189007b3.33.1777427863023;
        Tue, 28 Apr 2026 18:57:43 -0700 (PDT)
X-Received: by 2002:a05:690c:95:b0:7b2:dad2:5e0d with SMTP id
 00721157ae682-7bcf55984d8mr55188847b3.33.1777427862602; Tue, 28 Apr 2026
 18:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
 <20260331-eliza-adsp-usb-v1-1-d8a251be20c3@oss.qualcomm.com>
 <69d644bd-d64e-4ef4-b0ca-b47103e84764@oss.qualcomm.com> <p6duntiwahnmxwit2qgegcmqerv3or3h36y5cel36ekw4vkcfp@exmgriqkkqqb>
 <e0dacc06-432f-4924-89e8-f5fafaee4906@oss.qualcomm.com> <jznwxsifczinkboh5kakjj7etxvfbvn5hwbxvxauy42mr3cgph@dnnqiihclguy>
 <CAEiyvpq0e_VgTq0FYOSKGxa_d88sz9uOQgMCBoZfztRk1cjD2A@mail.gmail.com> <5c7d64d6-6fc8-4323-894d-56d1dffa7d09@oss.qualcomm.com>
In-Reply-To: <5c7d64d6-6fc8-4323-894d-56d1dffa7d09@oss.qualcomm.com>
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 07:27:30 +0530
X-Gm-Features: AVHnY4LyHrK-I6nTHLOE19T1AkoB1MuHWhjX8fcK-VvNG_VhF86VFYS3RjZ7nEo
Message-ID: <CAEiyvpp42MsK_vr1kw86KZUWtP=VWCTPWzCJFdq5Qgd2k91x0A@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB
 related nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=HbIkiCE8 c=1 sm=1 tr=0 ts=69f16598 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=Gu81GBfdrKZkZUyCsUEA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: wlXZH6IGKQ4TPFefjwtDQUOlKSGg2MOz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAxNiBTYWx0ZWRfX+YInVf3usdUO
 rZ/8O2X3LvVfekIjFgK2z2eegyBGiYnDvvkGbY9E5tOc1uJ/d1TVJOVYOdvITVk7TRkl2TxP+PR
 8PG1P/VGecDepZuv41Sf/boSOrf05LHvhcUDHFs9aUjUf0VQ3Cv70lwmxc+D/5NqObj3hR3JnhI
 0qrCA+Mp6BDtzXdEG2kTMqpI3mXuyhuotijx+0a/81Nh7Wysy28iQm80N3GnvgdpjiFVP2XlyPZ
 RTJmPL/1QnMd9TML/3qNECaua/ZE8AGcYShAlV5BMgiUBhFTHiWi5QhN17Kwe6VfkPDmT5i1bJR
 S050bxNIVUsGTA3swTPLGx/xWqg6NpWgIXU5p+/5LE7G9o7pOfM31ouBJ5R52lzqz97JBlYxSMF
 QrC3QkiLGRvY3mv7W1gjfkm5thN/524RNiT8dggW8bEj9uJ4Y4WoX+S0D9F2L4z1Jt6tUCcEYeP
 ARYNjrWry/+MDOgdpaA==
X-Proofpoint-GUID: wlXZH6IGKQ4TPFefjwtDQUOlKSGg2MOz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290016

On Tue, Apr 28, 2026 at 2:54=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/28/26 7:46 AM, Krishna Kurapati PSSNV wrote:
> > On Wed, Apr 22, 2026 at 3:55=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualco=
mm.com> wrote:
> >>
> >> On 26-04-22 12:09:31, Konrad Dybcio wrote:
> >>> On 4/22/26 11:41 AM, Abel Vesa wrote:
> >>>> On 26-03-31 15:37:08, Konrad Dybcio wrote:
> >>>>> On 3/31/26 12:37 PM, Abel Vesa wrote:
> >>>>>> Describe the ADSP remoteproc node along with its dependencies, inc=
luding
> >>>>>> the IPCC mailbox, AOSS QMP and SMP2P links used for communication.
> >>>>>>
> >>>>>> The Eliza SoC features a USB 3.1 Gen 2 controller connected to a Q=
MP
> >>>>>> combo PHY and an SNPS eUSB2 PHY. Describe them.
> >>>>>>
> >>>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>>>>> ---
> >>>>>
> >>>>> [...]
> >>>>>
> >>>>>> +         usb_hsphy: phy@88e3000 {
> >>>>>> +                 compatible =3D "qcom,eliza-snps-eusb2-phy",
> >>>>>> +                              "qcom,sm8550-snps-eusb2-phy";
> >>>>>> +                 reg =3D <0x0 0x088e3000 0x0 0x154>;
> >>>>>> +                 #phy-cells =3D <0>;
> >>>>>> +
> >>>>>> +                 clocks =3D <&rpmhcc RPMH_CXO_CLK>;
> >>>>>
> >>>>> This is TCSR_USB2_CLKREF_EN
> >>>>
> >>>> Good point. Will fix.
> >>>>
> >>>>>
> >>>>>
> >>>>>> +         usb: usb@a600000 {
> >>>>>> +                 compatible =3D "qcom,eliza-dwc3", "qcom,snps-dwc=
3";
> >>>>>
> >>>>> Does the device suspend and resume successfully?
> >>>>
> >>>> Well, tested with pm_test devices and it does suspend and resume
> >>>> successfully, but there is this:
> >>>>
> >>>> [   54.584126] dwc3-qcom a600000.usb: port-1 HS-PHY not in L2
> >>>>
> >>>> But if I'm not mistaken, this is valid accross all SNPS eUSB2 PHYs, =
on
> >>>> all platforms that have them.
> >>>
> >>> Well it's not fatal, but ideally this wouldn't be there. Maybe you're=
 missing
> >>> some DWC quirk in the list, although it seems pretty long already. Pe=
rhaps
> >>> Wesley would know more.
> >>
> >> + Wesley
> >>
> >
> > As per HPG and downstream, this is what needs to be done while entering=
 suspend:
> >
> > 1. Clear PWR_EVNT_LPM_IN_L2_MASK bit of pwr_evnt_irq_stat_reg
> > 2. Clear PWR_EVNT_LPM_OUT_L2_MASK bit of pwr_evnt_irq_stat_reg
> > 3. Set the following bits in the pwr_evnt_irq_stat_reg:
> >  a)  DWC3_GUSB2PHYCFG_ENBLSLPM  and  DWC3_GUSB2PHYCFG_SUSPHY
>
> In case that's related, most platforms (including this one), set
> snps,dis_enblslpm_quirk which prevents the first bit from being set
>
> Likewise, snps,dis_u2_susphy_quirk for the second one
>
> (although it looks like setting these bits is currently
> unconditional upon suspend in HOST mode?)
>
>
> As for the sequence you mentioned, I believe the diff below should be
> OK - although it _really_ just adds some delay vs the current state,
> since the bits are cleared in the resume call
>
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index f43f73ac36ff..e7b1775b7207 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -12,6 +12,7 @@
>  #include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/interconnect.h>
> +#include <linux/iopoll.h>
>  #include <linux/platform_device.h>
>  #include <linux/phy/phy.h>
>  #include <linux/usb/of.h>
> @@ -344,10 +345,18 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom=
, bool wakeup)
>                 return 0;
>
>         for (i =3D 0; i < qcom->num_ports; i++) {
> -               val =3D readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg=
[i]);
> -               if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
> +               /* Wait for the PHYs to go into L2 */
> +               ret =3D readl_poll_timeout(qcom->qscratch_base + pwr_evnt=
_irq_stat_reg[i],
> +                                        val, val & PWR_EVNT_LPM_IN_L2_MA=
SK,
> +                                        10, 3 * USEC_PER_MSEC);
> +
> +               if (ret =3D=3D -ETIMEDOUT)
>                         dev_err(qcom->dev, "port-%d HS-PHY not in L2\n", =
i + 1);
>         }
> +


I think its best to set the DWC3_GUSB2PHYCFG_ENBLSLPM and
DWC3_GUSB2PHYCFG_SUSPHY here as well based on quirks before polling
for the irq_stat register.

Regards,
Krishna,

> +       /* Clear L2 event bit */
> +       writel(PWR_EVNT_LPM_IN_L2_MASK, qcom->qscratch_base + pwr_evnt_ir=
q_stat_reg[i]);
> +
>         clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>
>         ret =3D dwc3_qcom_interconnect_disable(qcom);
> @@ -752,6 +761,13 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
>         bool wakeup =3D device_may_wakeup(dev);
>         int ret;
>
> +       /* Clear previous L2 events */
> +       for (int i =3D 0; i < qcom->num_ports; i++) {
> +               writel(PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK=
,
> +                      qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
> +       }
> +
>         ret =3D dwc3_pm_suspend(&qcom->dwc);
>         if (ret)
>                 return ret;
>
>
