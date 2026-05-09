Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979632628D
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 03:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778296572; cv=pass; b=shp+XQr5+ey/5mp4miX13UK88YfICtHNAxujt+z9oRc+Vw8s2spJLSNbpR0BGiXoqD35T+NqLKlQRqIoxzHVvF8yo6NNhhjLvqUglwgnP+kD4oahY0hBd2GCvojv51X56Zr3jQ6uc9uz2bY+L8MvXSqcNzIjkEUeBgis5IwJPnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778296572; c=relaxed/simple;
	bh=iycAiiOzBlvvHwBW8cQsDiVxW5Pp1tObCCKfH4KZhw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KC5IR3lp8h2sj/61fs6YV3S8Lf4Y5JdjG/Uft+ACA1PLRBy0RIO7phzQbMj423CbojeeazcJmNlUaeEttn38nObSpLK2mqFThNukKgS+dyuCrZedk1ziUTOWwoDdGcWS625EH9UtJkZcsQyJA6lGw9q89qO808/8eGq9sBoqmns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxngzWGO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aaolyrTj; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxngzWGO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aaolyrTj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64928hOe3600440
	for <devicetree@vger.kernel.org>; Sat, 9 May 2026 03:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qPGv++bVJSB3zXFP2t+WPVXGM9RIW9lIFp4uRM2nOWU=; b=lxngzWGOx5fJa8hR
	a8n5EPOfx5pm68O7+abtDbYJ6sVTcNWkNcjkSQJht8J4Gqc1Tn4Tb3SEbzbipKPF
	o1zdBS1w3KqyWu68hystnj88s8b+FiR+IW1f3uw0elT3NmU9P74znYMjq4Y3Iv8m
	dosI5WNEl8ltP9zDCDG8R0OSS3bJ3iUfcpNcbh0D163YZ1sSdirsciJmHroXmIfD
	J3ZmDtbO0uuMlCwa10yh/61K9dhPLMpMaBQZW+XZRnpNmfYeKRhiMCs59fp3T4EJ
	xMnHEp+iQMFswqh+EZCPViDxm8M0z79ZcNw+OSObjBvkE02JHdNdXGwfy/ugzBbf
	WOFKng==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1uvsg49v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 09 May 2026 03:16:09 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7bd49a2467eso55109497b3.2
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 20:16:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778296569; cv=none;
        d=google.com; s=arc-20240605;
        b=AIv5WAA+lOIjlyuLhTlEy2rd6UVImSkcAglx2tQHkyIoDT430TMG34ajiN0+Qvv36r
         U/rXs/sdCAy+NNHI3Mi2phxk0/jJM+obEOTbxHUJ9il4G6xiE9olR5umgJInIOezH4NW
         Uen7TkLwnICRzoLFWOcSnSfD/S5/dFfh4U77wihS4+6BkWPOSREohka+dbchjyeHox6I
         khjVuuwBSKau7qB8GOwFp1bM+zXLPDKestF+HLHxZLTfibQynuarujLbaWgceuiF2SZf
         Qxv1+PssQh+X1BwjAyjgZShgbnT4BWoC6wu2AR3Q7cUZSg9qbT3tqt3kHvZdX0Z2KcI9
         78Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qPGv++bVJSB3zXFP2t+WPVXGM9RIW9lIFp4uRM2nOWU=;
        fh=0VUNoBXOQxsKab7ZjmFwkn+yCu7kdQ2l5RHJOYcfHro=;
        b=gqJ1QJ3kcM9y2ZE5SNXAUQmiVTWzZsMiGF7QP7SkT3NexJK4kjk01gMU5xaT/VocOR
         jIqU8Dj5goNoU3hZOXUpJ/WSw7S/HyahKSvVqS/nm0y0ClHe4dyL5JNW9JCVq8dm1eZS
         /tgA5JzdhS8FckLQTmmVYUXvxdreVhmIe9/WQ3n1Hz/ijs9efDTxFrxHH9qv5wCzBnCl
         UnvDc8poygIK5PN00Hqa1Ai0zszlOuQP3xX1rxh0cdrm9QC1zbO+Ap4ozceA07k3b1eK
         BYgKVIc+7zK0jN5GnHcpD45SYGyxOqajBn/a/ij1nqXkW/HET9I2hc1WLN6gmWkK4GO0
         2HFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778296569; x=1778901369; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPGv++bVJSB3zXFP2t+WPVXGM9RIW9lIFp4uRM2nOWU=;
        b=aaolyrTjVrgqwz031ExrsLE5C8NgerS+Q1WEP8nfIJko7IP8WvFsaAqvzAi6kJPwpw
         NF2bpzLaZyhJA+E6rl7YQ7QDw4ofhEz+BDb2Tqio+TacbdQdbHw3b7Tc18YErYQSqQNF
         t/7+lqMeVMZ+EikxN0ptjqKLSozZ0P4UAVLLCd1DGzVarj+g+n4ZzGhG3gGgaK3JwozT
         BF7cNn7SqJ105J7mHFZw7UetaJ+aZ4Q6nYMXW/znFz+iqBFs4tMTVzA04DrohjmRmPsC
         5Es1nA/Gu85lqRGFH9MlI8DFcJzxIeWS+1QSabw0+7rcEkU6HaOuNzrAzSNE9YLVescx
         +McA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778296569; x=1778901369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qPGv++bVJSB3zXFP2t+WPVXGM9RIW9lIFp4uRM2nOWU=;
        b=lTRPUurOy14/7KP+XRw8YWFpXyFQN9dPJN7lLIZBDphwxNh5i2aD6GVP+9DsKREZxe
         jU4+xB7t7c5r62yF2RTgNzwxNNVzkZs8H7y1KHKDnE7w1nlewRcDG/yUnfL+9tsc/nWT
         ohC5COK00WfXHu+17iX5Mpr+OGEvIfMSYYEQbUEsBKeQaGbUbv74XPvLTvntUFz2EZoE
         EPcjXHrPsbttEnSJQ/rCa26Yz2xMmjFqezBFYAAryjVaBzFb7fRDjBQM2oPp+OJWlRjY
         xOIVELKz283x+2zPghEZU8Yyju22MxGmdqrJM7kvVic1p78LSZaM4aOz/K/3I77ijdSV
         ZseA==
X-Forwarded-Encrypted: i=1; AFNElJ8JzEZ2k+97GPkBWX1Oi3z6HipIo8T4RPvIaA5IDL1eEqC6lWrm18CLxVLyekoq531LqkrMftRidz4Q@vger.kernel.org
X-Gm-Message-State: AOJu0YxKLAkByhegCpZ40ehokj0FvoyTa7Lgr27+FVry48bGPe04l7mL
	oYNrRflLuR7p8QD6qwq1oF5FDUFJtordkuLX9XmN2N88sYhkKWI1Ijn2i8D08EXF8SBIV9MJDRC
	GYTFoJ+27DQSamgm0yzWA1j1fgOsNlKhI37i99PJMpLirakbK8DQOl/sOqsPG9dq/Pdx6ETTMvr
	gL7Y8mFcRZhrCMQoEz8tPMSBmkbOaL3rUCuTlYCOA=
X-Gm-Gg: Acq92OE1EKFzowgT+tPfuL6enjH2pWzKoYCATALPewAJwhZDM/y+FDzt2VwMZqpxsG8
	qfbYn3WEn+xb/x2bU3OteqFHP64Rkwm4Mmh2QcvY+mmIVq8ZI2kQoab3jX+xKxMt5BiIuSrtHNu
	BWA0yXFNhlgijbvMvnXY7XDQna/oHc9HUg2dLslX+j+Ssl9FkjAXgLZVYHoX+gGZn5fTpRQodlQ
	VwqtXc=
X-Received: by 2002:a05:690c:102:b0:7ba:f6b4:358b with SMTP id 00721157ae682-7bdf5efa71dmr161075697b3.43.1778296568965;
        Fri, 08 May 2026 20:16:08 -0700 (PDT)
X-Received: by 2002:a05:690c:102:b0:7ba:f6b4:358b with SMTP id
 00721157ae682-7bdf5efa71dmr161075487b3.43.1778296568576; Fri, 08 May 2026
 20:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260501051918.1990713-1-qian.zhang@oss.qualcomm.com> <afyYaCSFXy-Fm7DR@baldur>
In-Reply-To: <afyYaCSFXy-Fm7DR@baldur>
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
Date: Sat, 9 May 2026 11:15:32 +0800
X-Gm-Features: AVHnY4JRNYyNdgV-BrokPZ8M3cAiS1CkwObBGsuROTFKDePN2XI0KmATtKyrv-4
Message-ID: <CALC2J1NG1CqbEcTOEGebEmH_3R0TSfPYJ3SRQ4-pwfW3DDdGtA@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: Add fixed regulators for WLAN supplies
To: Bjorn Andersson <andersson@kernel.org>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDAzMSBTYWx0ZWRfX/q2JuUcMFgiG
 QMZealp06cfPqIvZTj1+a1dIecPOw4ToZHSPbnTl+NLa4U2NVTZSmogpYoCXASyJnrA1lXQn4fC
 WFvKbftU2imyfyt3bmJ4lIEUG8MU+Ea5QVJ9AYVZ1qr106I/goykGQ2/THyrgyRRfUcxh3RV1G7
 vLpIgDtNi8MpS+1uyMrfa0bvM/qpFrgTzaWV8s+nNyi+SDUQhJMYuqnitc/1MxUQmkHfrlalXpm
 2VZm6Iy2e73pWPmwmnaCqQDmGj4PusXZb7LCzn1CvT70KcJ86ERe+GtQszeN9IibzdIOOqo66CP
 RBV6JaWr9hHOB6mPTZJ/IPVT7UIQUlfcoxG6adsvWQbwVyNepFXvm9CinBCtr0M2KEgVJHEJJAv
 K7tILno0Kaib+kKXW/urv7Ueyo0I8HjFgYZ1upK7iI/MfCch5e/pNAMJi79PS4Z/bi3xRVQlh48
 nW9mTNGVUq24+FJlEbA==
X-Authority-Analysis: v=2.4 cv=dujrzVg4 c=1 sm=1 tr=0 ts=69fea6f9 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9BAixFXi0OziPwoLFDEA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: vqEc4ypvUOJuoWizVBJ6GD45abeaXoU3
X-Proofpoint-GUID: vqEc4ypvUOJuoWizVBJ6GD45abeaXoU3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090031

On Thu, May 7, 2026 at 9:58=E2=80=AFPM Bjorn Andersson <andersson@kernel.or=
g> wrote:
>
> On Fri, May 01, 2026 at 01:19:18PM +0800, Qian Zhang wrote:
>
> There shouldn't be a "v1" tag in your subject, and the subject prefix
> should be:
>
> arm64: dts: qcom: monaco-arduino-monza: ...
>
Thank you for the review. Apologies for the formatting issues.
The previous version (v1) can be found at:
   https://lore.kernel.org/all/20260425031712.3800662-1-qian.zhang@oss.qual=
comm.com/

> > Add GPIO-controlled fixed regulators for the WLAN power rails on the
> > Arduino VENTUNO Q board:
> >
> >   - wlan_reg_3v3: 3.3V supply controlled by GPIO54 (wlan_rf_kill)
> >   - wlan_reg_1v8: 1.8V supply controlled by GPIO56 (wlan_en)
>
> Those really sounds like gpios, rather than regulators. Why are they
> represented as regulators. Please start your commit message by
> describing the "problem" that you're solving.
>
> >
> > Both regulators are enabled at boot to support WLAN initialization.
> >
> > Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
> > ---
> > Changes in v1:
>
> What do you mean? Changes since version 0?
>
> >   - Clarified GPIO roles: GPIO54 for wlan_rf_kill, GPIO56 for wlan_en
> >   - Improved commit message readability with bullet list format
>
> It's impossible for me to know if the regulator vs gpio was already
> discussed, because you didn't include a link to the previous version.
>
> Use b4 instead of doing your own thing, it will handle the versioning
> for you and it will provide links to previous versions.
>
I will use b4 for future submissions to handle versioning and
automatically include links to previous versions.

Regarding the subject: I will fix it to:
    arm64: dts: qcom: monaco-arduino-monza: ...
and remove the "v1" tag from the subject line.

> >
> >  .../boot/dts/qcom/monaco-arduino-monza.dts    | 21 +++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/a=
rm64/boot/dts/qcom/monaco-arduino-monza.dts
> > index ca14f0ea4dae..1a40ac5bb4bb 100644
> > --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> > +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> > @@ -153,6 +153,27 @@ vreg_nvme: regulator-3p3-m2 {
> >               enable-active-high;
> >               startup-delay-us =3D <20000>;
> >       };
> > +
> > +     wlan_reg_3v3: wlan-3v3-regulator {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "wlan_3v3";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             gpio =3D <&tlmm 54 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +             regulator-boot-on;
> > +     };
> > +
> > +     wlan_reg_1v8: wlan-1v8-regulator {
>
> Shouldn't these two regulators be referenced from a WiFi or PMU node?
>
Regarding regulator vs gpio: you are correct. These two GPIOs serve
distinct purposes and regulator-fixed is not the right abstraction:

- GPIO54 (rfkill): controls the RF kill line. I will replace this
  with a rfkill-gpio node so the rfkill subsystem can properly
  manage RF state.

- GPIO56 (wlan_en):  must be asserted before PCIe enumeration so
  the WLAN module is detectable by the PCIe root complex.
  I will model it as a regulator-fixed and reference it from the PCIe node
  via vddpe-1v8-supply.

I will rework the patch in the next version with a corrected commit
message that describes the problem first.

> Regards,
> Bjorn
>
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "wlan_1v8";
> > +             regulator-min-microvolt =3D <1800000>;
> > +             regulator-max-microvolt =3D <1800000>;
> > +             gpio =3D <&tlmm 56 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +             regulator-boot-on;
> > +     };
> > +
> >  };
> >
> >  &ethernet0 {
> > --
> > 2.34.1
> >
