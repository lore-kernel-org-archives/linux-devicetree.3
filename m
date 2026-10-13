Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F5D38D3E6
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886311; cv=pass; b=b5G1jnDmA29r27TEKrp/YZtZx4ep6Z+jep6BR0rS6wmlIcXWL+KvQ+Q9szcEo8vW0zmnCqkY4WtFrpP6k4WSgT7Vicc4BSUKkkzIdzil5eLvLZqBTpS+GCs+NGlOW3eOrnIORTvNsPolwoUk8x9g9rV8OQpgmngGrpWzA+FJ400=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886311; c=relaxed/simple;
	bh=Rh5sLLxFP2Sa8hBKcYwQzVB6G/uNzhJkAl2GeVbLNj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZVCGBa9+vPxhwpharQsIDgg/GCHVxI+bNjmlOoyyLpFDz1uPY7DgFwm4U/HVwvcqyXNqSRLm4GOx83i7J6t5jz3bupG6xhdto/rhxY6MRwC2finji2OvmkFvmDDfr8H+xrBh3GACQbs92DU+kVyBnPadgj28B7nrQHOyRPUbmB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SvRCFEAH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eqV5ylyc; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvRCFEAH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eqV5ylyc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8ODid3054788
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S9aK4EA3wmMxurk3lpWsAkoLI9+SiYE0UjvlE70PuVk=; b=SvRCFEAHC1G3i8+Z
	H5f1xhAv9VzXlMCF32lhbEXY6hhKiYr7KIULE1QmnmUvLrCOgHh9sDkMBm9SGhjp
	bqII3sAoH7+rin8gJUTN6sLFd3hgwgdAoXDC9yzz9cnqfdQj2marcOLs1MfodNPG
	SL9cnWywJb73QpHQlh3tteCcIq6leEXn1RUVnALb9NVdu+Gqjn6+vZemBhOcZq2Y
	imEUjif+YNdqLDXh7TTNrJMnr++xjbnfkKvLoVpMu56nZApftJYoPdqghGKTwgsD
	TfJYJBoVFeT75Qa/pQKj0sFE6c0VLw14hGbiW+WU1lmcqu1+r+n+Ly5PyxSCz5cd
	CLr91w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aeuqqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:11:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df375fb9b2so35089545ad.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 03:11:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791886308; cv=none;
        d=google.com; s=arc-20260327;
        b=eC14cD4mAefgaEWctg0MuVhAETb/4zTunlRJsLBu5/jaeun7j/onIbEYilg7+YL7Oq
         asAPciBAx5nwl52zCYFUdq6qt0aASj9muV0Rki652wHL1ViCF+eDRyiigFUTCed9SZxm
         TR05t3ampU3vpoMiW/7ICOBVxy3Jw6fRfZnCxRNLieYtVQnsCbBEz1RYEPES5dmdykdl
         4SdW4vWbL8BsT+D3Kc/gMvBV5sqZdwGQHW9SqVBFtvwS2dAYaWoOrdznGvJDMDyYyB9m
         HZKJa7lDdtpLSsJn2YLWOGBI0QBUwSeofvDfVI3WBr/VWfoQiLdpkbZtvfoXe8EfxIYU
         3kVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S9aK4EA3wmMxurk3lpWsAkoLI9+SiYE0UjvlE70PuVk=;
        fh=eHoDFgWKF4PfmNaW0kXQUxy6NQ7w7R07/lUP/r2HaW8=;
        b=M4chbA5Qbr77wAiz712aqu75ersrN5zbZSt61jvjVsy7epIOJ1nYltgP24K6qsD5O5
         A0+v1dQx3OXfmWj6YHl6dyF+cEU19abpIDS/JGUzxmXJqzwIeD3cDlYQDMvgU7UYBcF+
         qLylTZzm4WEgThBFZVTWXb+xF1kFYr/2LENHG0iWUdWB1GECMLbhI0vF6kBOFd3ntcWo
         YT+EslzupJKCdkRhrS5WIScSruBwbFXb9qtkm/2qRdUnA2RDKBNviEFp0KSeBk2f5nIf
         rohlMSTK9jw0mdMF6oQDreU04HBXit51Mwa/wGhigPHAg7rD7W09E88GGgUO8g+nAS/+
         Intw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886308; x=1792491108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9aK4EA3wmMxurk3lpWsAkoLI9+SiYE0UjvlE70PuVk=;
        b=eqV5ylycFY/4stCYJ3sLw/Y/fouSE1/dBseluEZVGInkpeqBsysSXYT4BZEq3z2C72
         Q+VWYoFS2CMsbKOGeKT1g2gMtqrSaLbZed3rCit6dlYEONpYpwmFy39KFCMKHXiSpkMD
         kyZ1533qE0kuM60nV5/Hskcww+IN0Elei02fnxbXO+eErtVC6H6Y2XMs1UHQspVao0nY
         4sxiaXhBQfXLON0/LZLlVzJoHYE4IE8Kv5VqAf7Pdyhd4Hb2rXjgVdlQkT+IKhBu1HZE
         CDdv7jPl6igIu06x9vLh8WbCsneMrTj9nPYD+MXZNaTeKptDIWNRqPsPlfwCfxcL91Kq
         cW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886308; x=1792491108;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9aK4EA3wmMxurk3lpWsAkoLI9+SiYE0UjvlE70PuVk=;
        b=o+nKw4fk6uaL9vhIVU+ijvI+j1dwVrMr3usQuwylsyfjyrXyc4eS0vgRhhgdNUSyao
         9pfkeGqNUqmyMDNA9ziByDuVc3Fpq5Mxf2KIa8xjI5EzzVBHD6NWJKuXu2iKgzdx7w5l
         8ryQfPTmnBdUHH7gbCkLpWWS7A6wTB0Eflpb4PtWke1p055JnswM/A90TRqur9pqZ5WG
         RyDeJCYyqBmbZcWOn12es9DcMlfTQagIIzS1GnHmqPcqPPtp4KEfkkmeWgcwC2cR88gb
         vcEQP6damzFehIzl78YY8Wi89W0laPGsJHXNju5bHraMJahtJU3OAlKBIIGvYTQqoYs6
         dt2A==
X-Forwarded-Encrypted: i=1; AKwUvBzrNvPtsnHSjfI1DaCIKzJnxAx+LbpnTyy3zVsq7pRZJChvD4JuvmZy+AGdne108pMYlmgjevKh3ZfP@vger.kernel.org
X-Gm-Message-State: AFq9FYJj50Tm9boNFxdhAEbcPZxOngSfinCUcGG5iGK2Bj9G7A+NLcXn
	Q1etqoLsmQH853LBnmSPORDi/75tTPZRt0H5+X9F0Uu935j7nGUGjuE0gmhEeD/3L/AE9x/he5W
	pnk4mfVm7dBSDfGZ6UQq8EXizL3f5XujgJeqJO1wtAp80vFpkkBSuVzy9t0c4DG2VNZJ8Fe+xY+
	dwV+J8OIQMtdn8oGAHiCRJgFe5EQs2o54Ww8KhZnI=
X-Gm-Gg: AYBFou38vrPVkjNkQS2pOuvk2Pn1dRP21r6t+NF6pg6WC5RGN+Cmq3Rcvv9t89pD9kg
	O/bGx8wV6YTx9+EwwdwBbvau/+UtqzydIJWdMAsM1AyNyeif9cbCTxV9SuZlJj/1IUaH+MAaK7p
	BWtEoPReSrzMz2omU81J8Q2ZMd+yy08g5vtIpOEwYpH6P+fcTSCh3bp+wTpg==
X-Received: by 2002:a17:902:e74d:b0:2e2:cb65:a719 with SMTP id d9443c01a7336-2e842ab6a10mr89373415ad.15.1791886308185;
        Tue, 13 Oct 2026 03:11:48 -0700 (PDT)
X-Received: by 2002:a17:902:e74d:b0:2e2:cb65:a719 with SMTP id
 d9443c01a7336-2e842ab6a10mr89373115ad.15.1791886307458; Tue, 13 Oct 2026
 03:11:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
 <20261005-s2idle_state-v1-2-3c402c66f388@oss.qualcomm.com>
 <20261006-romantic-stalwart-seriema-90e71d@sudeepholla> <CAPx+jO-T_0KT3GytYu8w6QvrhXFQNZQzR496RL=McU6rnMtnPA@mail.gmail.com>
 <20261009-frisky-rottweiler-from-avalon-6c409e@sudeepholla>
 <CAPx+jO-_aY5pMnWyy1hAs1WRmfW33vc317jdtBsEXYBoHsPfxA@mail.gmail.com> <20261009-skilled-mature-bittern-2206fc@sudeepholla>
In-Reply-To: <20261009-skilled-mature-bittern-2206fc@sudeepholla>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:11:36 +0200
X-Gm-Features: AclHuK-hucqj9IGIiaorMG2xXuxJ-qOYNImY5Izp_FoXJk3fQG3HJiolhaI8eq0
Message-ID: <CAPx+jO87gkTumF=Tg=UPWpJO6O-CRF4njT2KxQ3f=4nF5m7GiQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] pmdomain: Add support for system-suspend-only states
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: jLl-MQXGB_ZBeEWL7A0QO3nHpwKhS8JM
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6ace03e5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=d8yA8qk_i9ZICp0znskA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX7WHd+mjdmw7+
 haMfpiy4sEdvDgDEBY/WINF809gH3x9dlAPLKyfG3Qj+bw3niHSIhj60csOxr3N0ldz9n/Xfpl5
 /5YE9x2CJ86WhRqCyklqr4oXrH9YYSg=
X-Proofpoint-ORIG-GUID: jLl-MQXGB_ZBeEWL7A0QO3nHpwKhS8JM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX6dgV+yE1VR63
 PoEIHwBTPJvdbfd1l6OohpIr+1WUJqnxWOgdapV99VFX+21f+N7aKTx1hzroXKsnE/jemmkVtou
 64KFDkvoEpD2zfOKIsXpplnmQMXZY4wlol8bflR98stVNuLBdEAan2+FSNDiiJchYSoHzTGsC4I
 SPjztew5pT2PIyJkbMTgsciSrQH3CzbFBgmbsV6ygxEQke1iSKgVAOsVR4V2OxkoyzkkCS1T7h+
 352yiKyxk3mjDI+UxRIzNP9m8BaAEkf5MxQCn74i77g4E+tbw0g4gRkbjlZ7ojligqaktdIYqgj
 wa6gedyCmpx4edTVX3aNY0AMhU6sGaqJORfQNByxAjzQ/M+I5I3DpIdNfDQHPzUx8n2ucB+jhmo
 PcdkW0OKkFRi8TdeVWZmMvif956dKhe9AOJ7CmE8HWl/Ak5JmnFaG+4MTaepoEkXicEJB2k3KBY
 NHgAyxKOsY8aZvc/1nA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130040

On Fri, Oct 9, 2026 at 5:27=E2=80=AFPM Sudeep Holla <sudeep.holla@kernel.or=
g> wrote:
>
> On Fri, Oct 09, 2026 at 04:26:38PM +0200, Ulf Hansson wrote:
> > On Fri, Oct 9, 2026 at 2:21=E2=80=AFPM Sudeep Holla <sudeep.holla@kerne=
l.org> wrote:
> > >
> > > On Thu, Oct 08, 2026 at 02:21:49PM +0200, Ulf Hansson wrote:
> > > > On Tue, Oct 6, 2026 at 11:15=E2=80=AFAM Sudeep Holla <sudeep.holla@=
kernel.org> wrote:
> > > > >
> > > > > On Mon, Oct 05, 2026 at 08:59:43PM +0530, Maulik Shah wrote:
> > > > > > Some domain idle states require system-wide coordination and sh=
ould not be
> > > > > > selected during regular CPU idle. However those states remain v=
alid for
> > > > > > system-wide suspend like s2idle.
> > > > > >
> > > > > > Add a per-state system_state boolean and populate it from the s=
ystem-state
> > > > > > property. Make the genpd governor skip these states during CPU =
idle. Leave
> > > > > > the system wide suspend path unchanged so s2idle can select the=
m.
> > > > > >
> > > > >
> > > > > Instead of this I am thinking if we can QoS cpu latency setting a=
nd block
> > > > > system level states normally. Since s2idle is user driven, it sho=
uld be
> > > > > controllable via user-space and we don't have to define bindings =
again
> > > > > if systems that use platform-coordinated needs this too. They may=
 not
> > > > > use domain-idle-states.
> > > >
> > > > Even if we likely could make that work, it's seems not correct to r=
ely
> > > > on userspace to make the kernel to pick the correct idle state, whi=
le
> > > > the decision should be based on the characteristics of the HW.
> > > >
> > > > In regards to PSCI PC mode, I believe we should consider adding the
> > > > similar DT property for the arm,idle-state binding and make a
> > > > corresponding change for the regular CPUIdle path/governors. Althou=
gh,
> > > > it doesn't necessarily need to be part of the $subject series. I wo=
uld
> > > >  be fine if that is handled later on too.
> > > >
> > >
> > > While I agree with this line of argument, I am bit worried that there=
 is
> > > more deviation from ACPI _LPI binding(equivalent to these in DT). If =
other
> > > OS has manged to run the same firmware without adding such informatio=
n
> > > to the firmware(ACPI in this case), why do we need that in DT. Is tha=
t
> > > information encoded elsewhere in a different form in ACPI and is this=
 the
> > > right place(the idle state binding for DT) is what I am trying to und=
erstand
> > > here.
> >
> > I don't have the information about ACPI at hand, so I will leave that
> > to Maulik to be answered. Or perhaps, someone else already has this
> > information and can share that with us?
> >
> > In any case, I don't see any other reasonable way to describe this in
> > DT at this point.
> >
>
> Fair enough, we can consider that once we finalise what we have in this
> set is the way to progress(not important until then).
>
> > >
> > > Also taking the example of screen on, won't that be prevented as the
> > > system domain is shared by the system level idle-states we are talkin=
g
> > > and the screen/display device. So it never votes to power down that
> > > and the PSCI OSI domain idle driver must not be able to choose the sy=
stem
> > > level state.
> > >
> > > In general, there is some device that doesn't vote to power down the =
domain
> > > and hence we can't enter the state. So my question is, will there be =
some
> > > device that doesn't explicitly register vote and hence we need an alt=
ernate
> > > mechanism like the one proposed in this set ? If so, what are those a=
nd
> > > how does that work in system suspend states.
> >
> > Assuming I understand the above use case, you are thinking that the
> > display device (for example) is a part of a cluster PM domain, right?
> >
>
> Yes, exactly.
>
> > If that's the case, besides that the cluster PM domain topology must
> > be modelled accordingly, the display device should be hooked up to the
> > cluster PM domain it belongs to.
> >
>
> Ah, I thought that's the way the whole domain-idle was modelled as we
> started this OSI discussion a decade ago with an example of CPU clusters
> sharing power domains with some other devices. I am surprised if that is
> not the case already =F0=9F=99=81.

It works fine today, I was just trying to explain how it works,
considering the use case that you brought up.

>
> > Beyond that, it's the corresponding display driver that becomes
> > responsible for what should happen during system suspend. If the
> > screen needs to stay on it may need to call device_set_awake_path()
> > for the display device - unless it's a decision for user space that
> > can control the behaviour for the display device via its sysfs node.
> > If things are managed accordingly, genpd_finish_suspend() may decide
> > to keep the corresponding PM domain powered on during system suspend.
> >
>
> But the s2idle and s2ram anyways suspends all the devices, so they need
> to vote in for the power domains to be turned off. If they are supposed
> to stay on, the system enters the state it can based on the other votes.
>
> > The above said, $subject patch doesn't change any of this. It only
> > allows us to use more states (deeper), which are limited to system
> > suspend (s2idle).
> >
>
> Still not convinced, if all devices are plugged in to the power domain
> hierarchy correctly and the domain-idle states represent or carries
> the entire system power domain topology, we shouldn't need this extra
> information. Having it make cause issues when it conflicts with the
> topology information IMO.

No, it's still not sufficient to model the power domain hierarchy correctly=
.

These "system states" are special since they require additional
coordination in FW/HW, to take into account votes not directly
controlled by Linux.

I realize that the description in patch1 should be extended a bit to
explain this better. In principle, we can compare this with the PSCI
SYSTEM_SUSPEND support. The difference would be that PSCI
SYSTEM_SUSPEND is limited to support only one state, while the
$subject series would allow us to support multiple.

In regards to ACPI. I think this is as simple as comparing it with the
list of ACPI S-states.

Kind regards
Uffe
