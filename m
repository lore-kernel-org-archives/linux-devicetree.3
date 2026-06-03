Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02881382F26
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 01:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780451539; cv=pass; b=UmedS/m1RDusq8fyLL8nWFRp15jQqqO89fcnQoTIF5tF5JfhZYaVQ8ykttYaMPEokfQhqU2CyvknHeAaDZ1Aj2mExTQbaqQdSoCOTFbBpCNo0rvnCGXQDls513FzuyXy0DH/rPQXvnxMPeHORhazL+Gxj7nPYgCjuXnTA/yP7F8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780451539; c=relaxed/simple;
	bh=E6JvOgQV7Bmt13obKxm4OfMG+JC8GEWWSMrT7CakhmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AID2j3eFrPLi+BhVhxkD5eFa47tAAYBZd1lbnNFh2rWWLRQW417QW8mqmFC8IT7fppSrdogmDYFApzaDwHK7aLiVhMQYUOGEdw4jRzT/eGCnWjchDuUKQRtQUWRGYYPLmvPW1oNDe69mwlViWtqj7Wo7Cz87FuQ6vmaTSOJHcBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nZW9bTv4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MrSSRNBe; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nZW9bTv4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MrSSRNBe"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65318Ldc1260373
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 01:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	20YEdzy7J37X05bS3dlnzzLukGWboG1hOMONXXVmKzk=; b=nZW9bTv4NQLFgxHw
	UQjl5ZVrg3TCuxv5gu9hcp/di+VDKFuJHLFITgpEzntT7gislx7qbBeToY2MxIk/
	ivrxmrzITBrlr+S++AoYdCdg2I+ClrIJnuao2wdx/yHwB1Ky6bDzaqb8iP5Q2rWH
	4mE39UNCYroe9RdcLS5BNp59VKgfKpykoCUkBKAGSm/frD/MIzkwRYjI/PikMamB
	IyfERYIZ8MoPWRJaGzXvZ5nQ+sA9/OX4sqc+Fhx5TZh4MnEZP0s2ubAaTbP8Cgl2
	5BtP1/MvfzTGAjDO4mRInehgeXcKO4Vh+Rp2NY1S7WOYnE/ms6JQ9dCqyOd6NmIY
	R1zBdQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabgg4ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 01:52:17 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7dbb5e586c1so133702327b3.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 18:52:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780451536; cv=none;
        d=google.com; s=arc-20240605;
        b=Wtkepx67ENVmsJfeE+eFLYUNrrwcTpcIJQBZdNcrdPISWtwME/MFU9Og9vJbgN9Isp
         HU1OS5Wv3SRMJUncgcefFIGY4J4gWBHOAycZv5ga7WTASwdm3DkwcOfTPlVdDe5EIzSy
         dftbpMsgOocwMzwQNGn1fcMxliD/JS2SLWjTa/FP5Gyj9mYp7f0DZAaHBHTCL3+AYjXY
         1YbztmFAOvAIN3ai0DO1Sv7MxWOf4ZyAhaBZ2NzebYh/HiBiBCE7dspcuYn/h/nYfk7E
         ump/zbHJ3tgbuiAB/1BZMZ5cHGmVshvvmdp5/vKflmN1NEamu6hd4YEAc53xR2bYT5HK
         e5RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=20YEdzy7J37X05bS3dlnzzLukGWboG1hOMONXXVmKzk=;
        fh=53qvJawqK0TJTsq+MaD47KBMEtgXQmC582XHmZ7TrbI=;
        b=FswOSl6TMQ/3zYFPejJok2HvDRVhLdZv/Q4zzSiu0jQ1HFpKzJucE+7GfgTCExK0CJ
         0kSf3aMGxZ/pwkPLGTdW84pDBoXTQHVvIkSzg2w0+ZL12itn/LM3Au8ZTUWpuF4aAOAY
         KZYuvkuY0zv/u9Qv66tK2Buk0Am58yNR7dRE9vYi1mFljAgBxV32XC9QDEDaiQyXj0s3
         OT5ZGz6CloY3wyes1oIGEhAGkFYTvu1Pr9dnVADyW1uZGLLBd5jywxzLsps3VYUJFN2k
         fL4eB8defJOjYtYXtFZrSGJA0c1qnuax3rHuzbbrWQd54CeGwNRlvelNZ68u2NLKL1eD
         eMGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780451536; x=1781056336; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20YEdzy7J37X05bS3dlnzzLukGWboG1hOMONXXVmKzk=;
        b=MrSSRNBeQwpIYc2uw9wOY4aMPDsrPgyGyfkCHYdzPaGdBX6nbU2U7K4HQzOqHOgX0O
         joAOM3OYHcPH1AWewOZibonq37dbSFqsioFHz/WOgws3f2xc5IjYinhcQ3ChrtZffCKf
         TSWRJx1dsLCkm9fxjdA8J91qy2pVSKHj6qWxVMqZ0NFKqYgfqTPlKaR9kNc9MT7tH4sB
         kAH/Oe/3TguK5EQo/ctGr4m5d0yC4IadPAm30jbH+exrh+74q5gJrNqWHh74ekN5nMMu
         bLvbaSlzfWV1+NixRkWb0m5pZei/04x25CmHy+TYSRr4BmF+S/RqWhKoXNEhYB5sqBrb
         dgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780451536; x=1781056336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=20YEdzy7J37X05bS3dlnzzLukGWboG1hOMONXXVmKzk=;
        b=TfRxXrK3WjfhpkTmuzqztQ7ABtF6HFYSSYBHr1wdRhKDIypiHl6n/USBXNzmxOtJ10
         PgEJPgAzO64KkMEGg3DG/OnIxYeErfXlF57vfGyAsFFARhrjlUIPLNnPNXltIZTod5pj
         V0Paf+mL+kvKnaVw5pQbDEpHmGk1uNVY20/21wo/9c0KqXMtu+UPXOjUbLo5nFRfl6IV
         WtgSN/XOqTTwezcOsc53VmglVIXbQPfsxiAeIvJE+ADEnoxmI48oobn8O4meOCdHD7Hc
         eGV++9GNuQ82wLhW2QTZUr1By7dLMYwUgUWk0ANluedvwDQ1hnWEDqv0dfMOcY+mIgGM
         ObZg==
X-Gm-Message-State: AOJu0YzWM2s+fuDbv6JLz+s8nB6pJR/hxjBgu0Jk5Y837mUd93zy8Tdx
	K0STKjusJVtx2YM2xI1D8mjgXLm5MdboUiJVLpwbSWUPePTXlw9a/3IUe9BerNUElrpbR3u8l/T
	pWIdIN7eeqd8Unju7NMmeUjxNcXjacgIvApGJDrYqdwkS7iNH+Jeka5N+8TTUVSpo6g1jHT+cqn
	Se+G74wVN67Lp6wdNFZd5tdiOfEk1rFjJ32TZ7LFA=
X-Gm-Gg: Acq92OGM7at4y9PfvZ/J3uKNTGiVBVFq2aptbq0ix8QLzFmIOzKWMKtWmzCpm/eiFkY
	3c6STn+BrQESwuo2EBtnzBmALjf7PTyd6oNfn53GQX+tOYu3KfVuUC413UBTEjSjzr+i4cBDx4R
	8yb9gbgYMZb2aoe0GJ+XeE+Uy5LrfWs0ckWG1swxgCtFkxzumqQ5/xIvcsdl9O4mrfvDEJuc7ij
	/49SeobbGbRlnxAcg==
X-Received: by 2002:a05:690c:62ca:b0:7dc:25df:cf29 with SMTP id 00721157ae682-7ea4a6439d5mr13117977b3.37.1780451536364;
        Tue, 02 Jun 2026 18:52:16 -0700 (PDT)
X-Received: by 2002:a05:690c:62ca:b0:7dc:25df:cf29 with SMTP id
 00721157ae682-7ea4a6439d5mr13117787b3.37.1780451535862; Tue, 02 Jun 2026
 18:52:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602070530.4194262-1-qian.zhang@oss.qualcomm.com> <20260602072137.794E61F00893@smtp.kernel.org>
In-Reply-To: <20260602072137.794E61F00893@smtp.kernel.org>
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 09:51:38 +0800
X-Gm-Features: AVVi8CfotaJLlnuGfvA473UR7dwf2nlSUrkKW9CkVYGNWbt9xEdXbK_KGiJff3U
Message-ID: <CALC2J1Pjj76Pp+PLucS0uUqp0NKWU8eYvHVR8u9wzVm4Hzqd+w@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=R6sz39RX c=1 sm=1 tr=0 ts=6a1f88d1 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=YJzTSrPj2WyKA5JjjykA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: PJis8UUOqn5SV8MUGhNX8PYXEPVrOJ1G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDAxNSBTYWx0ZWRfXwasBq5zkSywq
 QrmImB499rrc/6JqYnhu1Z+A3wJstgYbNH4QOLqICQamtnNSzN9+LoKTt1iFXIvpPBVIhUdNdjY
 edtg9s9U5KeM/zjYwgfl0eTX4374SfnvVCk+zKSfdTOat5wPd1KPEXI4X1rVSyxeFzuw1UjVk2T
 fh+aXLLAsDTdC9GVwizw8o9kz7kF+GcDRGsVUrNUC58bk4d/XQP81KDlq3NzeDgvWiwsbP8ZB3i
 5bzZf+uWJxGtGmXXsZAIDXt1SeBArbkMPpbF300FjfwFXU8QpKBAu/e/88uVm+aRmu9ewa3r9Pa
 mRoQS71kuQldakwRyenmH0smBZNy2raJAWjqAN4kHLctNjOZWG76ja9+glivSsM/8UM/SnsjYRA
 eQFKvmG1bzVEDlclNGXbWC5liR09B7a1SaIwAI15add2aBYTOmyieJyy58rMdF3Kwr2YrYXFCEd
 EQS3Hsoz2QCaoKgxNFg==
X-Proofpoint-ORIG-GUID: PJis8UUOqn5SV8MUGhNX8PYXEPVrOJ1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030015

Sorry, the previous patch is incorrect (sent wrong version).
Please ignore it, I will send a corrected version shortly.

On Tue, Jun 2, 2026 at 3:21=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The `shutdown-gpios` polarity in the `wlan-rfkill` node is logic=
ally inverted, permanently disabling the WLAN radio during normal operation=
.
> --
>
> commit c96c608f286f34bcc2c474aeeb078a7d4cf17161
> Author: Qian Zhang <qian.zhang@oss.qualcomm.com>
>
> arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B support
>
> This commit adds support for the QCNFA725B M.2 module on the Arduino VENT=
UNO Q
> board. It models the W_DISABLE# line using rfkill-gpio and handles the mo=
dule
> power supply routing through the PMCA6850 PMIC.
>
> > diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/a=
rm64/boot/dts/qcom/monaco-arduino-monza.dts
> > index ca14f0ea4dae6..b90397c7000e3 100644
> > --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> > +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> > @@ -153,6 +153,78 @@ vreg_nvme: regulator-3p3-m2 {
> >               enable-active-high;
> >               startup-delay-us =3D <20000>;
> >       };
> > +
> > +     wlan-rfkill {
> > +             compatible =3D "rfkill-gpio";
> > +             label =3D "wlan";
> > +             radio-type =3D "wlan";
> > +             shutdown-gpios =3D <&tlmm 54 GPIO_ACTIVE_LOW>;
>
> [Severity: High]
> The commit message states that pulling GPIO54 low disables the transmitte=
r
> at the hardware level.
>
> Since the rfkill-gpio driver treats shutdown-gpios as an active enable
> signal, won't setting this to GPIO_ACTIVE_LOW cause the driver to physica=
lly
> drive the pin low when the radio is supposed to be unblocked?
>
> When the radio is unblocked, the driver asserts the GPIO logically. Becau=
se
> the device tree defines the pin as active low, a logical 1 translates to =
a
> physical 0. This would disable the radio during normal operation and enab=
le
> it during airplane mode.
>
> Should this polarity be specified as GPIO_ACTIVE_HIGH instead?
>
> > +
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&wlrfkill_default_state>;
> > +     };
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602070530.41=
94262-1-qian.zhang@oss.qualcomm.com?part=3D1
