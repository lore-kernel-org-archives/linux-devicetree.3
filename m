Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4301E33260B
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 02:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779159531; cv=pass; b=ZDSMYWbNe0dJhdnehuqjgMWsx7XCG5SlPX2PtYodWuNDgR/gz9IX8oPQEdX6dVxpOs7XnBhKYYGTGXaAkG0b/IxBWaDyQCdKjsRc5V3h/4PjywbaFVi586Z0EEmwUv9qcJMT/uFOqbV9GaZ1l9z1nzp1NkwhLmD9hFHV2sCk3j0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779159531; c=relaxed/simple;
	bh=tDJJIZdHHeYBMT8QHjP9BeHDpFpK/+ux/cgHMkuzpRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pHPdh6yv5agnxJNPzbkNOa2LthBaeq+3Vcg+Oz96qeMU2bcfIFgLmi5IdlDPCXhrEgKYfssKayBUm9h/KHmMOeofOgNFT6U7qxaXPBuXwt2g9ME6gzAWWhHwImth+1I3fgu5Z8HfSfIwhkYI7aRq/JWLjv37l8Dq5/4dY6aNunw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkFVTV1a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4OsQdlq; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkFVTV1a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4OsQdlq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IGLEi42091264
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 02:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7T6HxxfYbMXy8mZgRtMzDKdv8XFY+6b8//+YsG7AGNI=; b=MkFVTV1aG/qrMgwL
	Wpc+MWIQZOnTDk0Gkz5QvPr4OKJ6KGixXTZa6b03iQCpc6nyaC28hcYJnO3+CwVN
	gnMmuvdP+VvJJhqzbt2efdDIg5ct1FmARF3m9agxL4vJLblzOiknrL+NlBC0uAZe
	7hpugVcAneHxjCBhV1xlDy4FXOKYDGA2PF+R2yBvxDrW3Ol/rP5kvEDpppT4VFiT
	lwZNtm7GDmFqH+uewvaYGuZBm9O8HfmzxbogtheMgUtPYe1zYWCcYZfHRWV7R2+E
	2Z4+yHaPQSV0fbQEOT7BrWoUXyqNIFqwYyg9yca5hduCbyYP0upFyP2rVIpWtENp
	HazNoA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e80rpkcm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 02:58:49 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7bd6f72e5aeso46560087b3.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 19:58:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779159529; cv=none;
        d=google.com; s=arc-20240605;
        b=dPQLOrvtPDx1kFNbPRkTF81WQMWDEltrP0yOlRXh8xZiOJ0dMlIXZ54Hw33lzu7wZE
         6GxHeZR/hzBfr0A+BNDKt9pUkAD2WMfZ5/e2aN4ZwQkgULvTiltUgI230SmSeRJoCAXE
         hN+lMdg1TVKJWLdboBdxxOZG0bwOKSFs1dF2jBXA6m1WToeeEXYxGrFnkr/+04B54aH2
         Kr4s0kHzxzLt6DBMuyjC1RSW0pQVZod2UQzPcAuJx5i28ITpZI0kiA25Aae9cATHoNxl
         xKksmrohf+8Hh7aGlCZ/ZFKbEEUvAPfHlp+GMA11RQql5X721EdbXYzxjQwQ2lZoj1Ax
         gOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7T6HxxfYbMXy8mZgRtMzDKdv8XFY+6b8//+YsG7AGNI=;
        fh=5N7CabdChxVbHhZBpD1xL7mqPGcU8HP9lziLWBVAPgU=;
        b=fLVFignDk5wyjYDiXK5OBqRAC/wvBE81Iu1H+GzKxAb5JAC80H1AGr9SdxyquO/Fkr
         gVhsNJuO0NKFWPa2KjJj8d8BOFQVG7VyKcdsSZZbreMmffhCZDM7GP3RKOS3BtmmH3FZ
         iU5HKcfQsXtVOUP6bG8KmXeuFpiNjfIA5ETBTwV5i65ONWo4k9JaaV3tXVbY7qYXHTlT
         vPZp3gBcG6hO2eOm4ApRHs2i6BB6xGbbIyLOT9PjFtemZckwYflUE5/thtQHAjjbxAL3
         zDeZGCdF6qmLIY2RWS4Y8E19w2YEARQ8mY/wEmEIKS15GmUSAtjFPjOQkqJDd3Tv8lMo
         zRHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779159529; x=1779764329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7T6HxxfYbMXy8mZgRtMzDKdv8XFY+6b8//+YsG7AGNI=;
        b=G4OsQdlqtcinmF12SZqgKMdcbwCRQA8bAH2QfPIUMOw/tKIzG0i6MsohPyHTdt3HyM
         812Tme4tYjg99pM8YoZk2VBeqm5F3UakiuyqrPm7UcdGFuel05TLA/miiP2qPsDms76E
         yPbd/T5sHwWZOpobxvmy8qzzYTxuQ6Og25VgBwipmChu19EooRV+OTqAoMLamKdRhmCE
         CMh5YpIctMRmF5j2L2Jrsw7KCOWwo9nxGx9apClyufTOhChz7POvjfzqlJQfw+BSCzac
         2kcP5qdRkhCT/WnHp4pSOYDRGpT9d52jK+ZcEzTQJrN5YI7AsXukweiLV7kLfEkXQrJd
         u8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779159529; x=1779764329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7T6HxxfYbMXy8mZgRtMzDKdv8XFY+6b8//+YsG7AGNI=;
        b=BIKA5L1RhjHcDdVmYtyZhXbr0m5UEM3bSkSyi6k2aDHqegIalTL0hMZn0k6AEv9703
         ULdp9F8BEaub8wmnMp2QwBydNEqkq3qzMGoHLOSv0aXP71wt5sraq9H+vu3WDAU4PpXh
         Ie8gsMLW60nKYbiYsjZh69jKMTXgyjVfSQiQ+90I8oC7b4lYmoz/qhml7pozxrR6QExT
         koVOiO4PDHcC/LrWWJgRA6bcFX6dQyRoiCf+Jm+N+ePCh34jZ/zFRTZjxH/to2ArFmME
         2g9eE7/VOTK9YYTKP2MBbf3P+pG7WrqWHjnuj+Z5I32ekn12rcyJangVB9Ht31Sei6Jr
         1vXA==
X-Forwarded-Encrypted: i=1; AFNElJ8uzIrwr+mD1PH9PncvieJec32mTaDGBuvANbPNuEdS1lYKXQpAuoNVcHuxj8Zc7AQyZUZbzZPcNye9@vger.kernel.org
X-Gm-Message-State: AOJu0YwGJFW3iruUWMN4WHEUNmdBBM7+Ae4BHZaTrH3cPkw6Vv1fl0Bt
	nuKD/+mJkIXkQxNEf/ZwsoiHN1qwSSytwh1FuipcIXC94Y6jQkoH4TNrhgFUfB2OD352pb7Jb4t
	RVLgNaBAaFGmO8fCD4lqNE4L4C2J7heAEalnbjs7gaIisLCWqRf/OXOyVx+8qCbI59QD5c343+7
	5b0Ut1tUh+L/Q2+b0+L/0OFd2tgbucu1I8t1P2is8=
X-Gm-Gg: Acq92OGDyt81S91fvq+5sV5EnML4PJDE+EpSmmdeFE0UZRvpvQr6abfIMHnrVC/8H/C
	i8xrd8XJmwnObUhzCC/wb/ks7UvRXxTKJ0GidHS1Ioc/kQvfzAKxlFghRLT2QdGyE+bOrpmBFW3
	gREcyOscBmEIUt9WEE/ScWAagC7L20idsLbMIdmcSlCednGUO2UOvjEIpTee2FgPfgMwXmyv0DN
	3xLbas=
X-Received: by 2002:a05:690c:86:b0:7c9:30f5:203e with SMTP id 00721157ae682-7c95d9a0e49mr185757717b3.45.1779159528552;
        Mon, 18 May 2026 19:58:48 -0700 (PDT)
X-Received: by 2002:a05:690c:86:b0:7c9:30f5:203e with SMTP id
 00721157ae682-7c95d9a0e49mr185757637b3.45.1779159528162; Mon, 18 May 2026
 19:58:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511-linux-next-v3-1-3e22737e71eb@oss.qualcomm.com>
 <920223a6-4e4a-4ebc-8a1c-c37d0923a470@oss.qualcomm.com> <a79100cd-0e33-4eb6-9452-c4458ea40bc0@oss.qualcomm.com>
 <b71f7653-78bb-49eb-b4c4-3fa8bca3e705@oss.qualcomm.com>
In-Reply-To: <b71f7653-78bb-49eb-b4c4-3fa8bca3e705@oss.qualcomm.com>
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
Date: Tue, 19 May 2026 10:58:12 +0800
X-Gm-Features: AVHnY4KBa8D76YJCnG0Vw9p4xe2pQaka3Hy8P5fFd-k18lgxW6Ot2JsNRSos1dY
Message-ID: <CALC2J1PqdKGozWX-WapCZSkjGZcM_JjOX29HQ8r7ghKyaBXj_A@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: arduino-monza: add WLAN enable and
 rfkill GPIO
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: y99CAXob39cg-RTSJbJlQWnIzxkB07DI
X-Proofpoint-ORIG-GUID: y99CAXob39cg-RTSJbJlQWnIzxkB07DI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAyNSBTYWx0ZWRfX2IVJagY+aQM1
 ZgqshvtIODwWlcneuOOqcQvbyggCopbg9LM9Ep8/TdEJ5XYgBF0PiNKbk7JiLLFgGR5JC+KRVOG
 sEcmeBUBkNr9aJLPldruVsmCaFycwqY30+aduABRZTy9eEsNSIRI2qyf4+CTV6R/6pdZTfNv6dM
 5guYa6lAUXX5nirTGRZPp+WIAaQ8jyofNrHc5ML6fmj8UYZTXlgcGFGxsVVJQ/C/lGd/yMqFAe4
 9w4tQHP8pZrL8Ujxl0IIPPA8brag415Aai46bbiPJP6b7vxLUxlKMyOxPoL9eRKPJAVIGPKWINE
 dduGz6z/9xjxa8VOcUnMUK+9HQGecHsiug059jtLB3nCpbtAYmgGq5dbZBhQNsjF4maM+ZKCSrs
 RE57it3YSZ760qGUiHzaS9WyBUcM6P5Y4aUKbJR/eZnEKZ8+j7QyyvNQU1prR5cmij6kKyXyC+r
 UhmNVYSVeai3dx6+YIQ==
X-Authority-Analysis: v=2.4 cv=ecMNubEH c=1 sm=1 tr=0 ts=6a0bd1e9 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=PzQuETEFkMCL5wnd60kA:9
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190025

You're right that GPIO 56 (wlan_en) is consumed by pwrseq-qcom-wcn
through the wcn6855-pmu node =E2=80=94 apologies for the confusion in my
earlier reply.
Let me explain the hardware on this board, because it
differs slightly from the typical WCN6855 reference design and is the
source of a problem we're now stuck on.

Hardware

The WLAN module fitted on Monaco-Monza is not a bare WCN6855 =E2=80=94 it
contains an additional, module-internal PMU (PMCA6850) that gates
power to the WCN6855 die. So the signal chain is:

SoC TLMM gpio56 (wlan_en) =E2=94=80=E2=94=80=E2=96=BA PMCA6850 EN =E2=94=80=
=E2=94=80=E2=96=BA WCN6855 rails =E2=94=80=E2=94=80=E2=96=BA PCIe link up

wlan_en is therefore the enable pin of PMCA6850, not of the
WCN6855 itself. From the host's point of view, asserting wlan_en
brings the module out of reset; the WCN6855 only becomes visible on
PCIe after PMCA6850 has finished its own ramp-up.

Initially we reused the qcom,wcn6855-pmu compatible so that
pwrseq-qcom-wcn would drive wlan_en for us. But we hit a
resource-allocation issue this hardware behavior creates.

The problem

Because PMCA6850's enable is driven by pwrseq (which runs after the
PCI host bridge has scanned the bus), WCN6855 only appears on the bus
 ~10 s after PCIe enumeration has already finished, with no resources
reserved for it.

Topology =E2=80=94 WCN6855 sits behind a Pericom PI7C9X2G304 switch alongsi=
de
  a TI USB controller:

pcie0 RC =E2=94=80=E2=94=80 00:00.0 =E2=94=80=E2=94=80 01:00.0 (switch UP)
                       =E2=94=9C=E2=94=80=E2=94=80 02:01.0 (DN) =E2=94=80=
=E2=94=80 03:00.0  WCN6855  (BAR0 =3D 2
MB, appears late)
                       =E2=94=94=E2=94=80=E2=94=80 02:02.0 (DN) =E2=94=80=
=E2=94=80 04:00.0  TUSB7340 (BAR0 =3D
64K, BAR2 =3D 8K, present at boot)

dmesg (kernel 6.8.0-1071-qcom):
[    5.545559] qcom-pcie 1c00000.pci: PCIe Gen.2 x1 link up
[    5.882178] pci 0000:00:00.0: bridge window [mem
0x40400000-0x404fffff]: assigned
[    5.912197] pci 0000:02:01.0: PCI bridge to [bus 03]
[    5.917368] pci 0000:04:00.0: BAR 0 [mem 0x40400000-0x4040ffff
64bit]: assigned
[    5.924919] pci 0000:04:00.0: BAR 2 [mem 0x40410000-0x40411fff
64bit]: assigned
[   16.476921] pci 0000:03:00.0: [17cb:1103] type 00 class 0x028000
PCIe Endpoint
[   16.477176] pci 0000:03:00.0: BAR 0 [mem 0x00000000-0x001fffff 64bit]
[   16.516689] pcieport 0000:02:01.0: bridge window [mem size
0x00200000]: can't assign; no space
[   16.516704] pcieport 0000:02:01.0: bridge window [mem size
0x00200000]: failed to assign
[   16.516713] pci 0000:03:00.0: BAR 0 [mem size 0x00200000 64bit]:
can't assign; no space
[   16.516720] pci 0000:03:00.0: BAR 0 [mem size 0x00200000 64bit]:
failed to assign
[   18.093137] ath11k_pci 0000:03:00.0: Adding to iommu group 24
[   18.101694] ath11k_pci 0000:03:00.0: BAR 0 [??? 0x00000000 flags
0x20000000]: can't assign; bogus alignment
[   18.101724] ath11k_pci 0000:03:00.0: failed to assign pci resource: -22
[   18.108613] ath11k_pci 0000:03:00.0: failed to claim device: -22
[   18.115481] ath11k_pci: probe of 0000:03:00.0 failed with error -22

At the initial scan the PCI core sizes the root-port window to 1 MB
based only on the TI USB endpoint that is currently visible, and
gives the 02:01.0 downstream port no MMIO window at all. When
WCN6855 appears later it requires a 2 MB BAR0 and there is nowhere
to put it.

Thanks,
Qian

On Fri, May 15, 2026 at 8:22=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/15/26 2:08 PM, Qian Zhang wrote:
> >
> >
> > On 5/15/2026 6:51 PM, Konrad Dybcio wrote:
> >> On 5/11/26 10:48 AM, Qian Zhang via B4 Relay wrote:
> >>> From: Qian Zhang <qian.zhang@oss.qualcomm.com>
> >>>
> >>> The QCNFA765 M.2 PCIe WLAN module requires GPIO56 (wlan_en) to be
> >>
> >> But isn't that just the wlan-en pin that the power sequencing driver
> >> takes?
> >>
> >> ref: drivers/power/sequencing/pwrseq-qcom-wcn.c
> >>
> >> Konrad
> > Thanks for the review.
> > It's not the same pin functionally, though they share the same name. Th=
ere are two key differences:
> >
> >
> > Different power topology: The pwrseq-qcom-wcn.c driver targets WLAN
> > hips powered by an on-board PMU via the power sequencing framework. In =
our case (VENTUNO Q), the WLAN module has its own internal PMU, and wlan_en=
 controls the power-on/off of that internal PMU =E2=80=94 it is not part of=
 the board-level power sequencing.
>
> I don't believe what you said about the pwrseq driver is true.
>
> > PCIe probe ordering: The WLAN module connects to the PCIe root complex =
through a PCIe bridge that does not currently support hotplug. If we were t=
o use a similar node configuration as in pwrseq-qcom-wcn.c, there is no gua=
rantee that the WLAN module would be powered on before the PCIe root comple=
x probes, which would cause enumeration failure.
>
> What do you mean by "*currently* does not support hotplug"? Does that
> depend on some more code changes?
>
> Konrad
