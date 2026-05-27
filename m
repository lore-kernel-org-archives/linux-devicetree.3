Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303173F44C5
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 11:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779880348; cv=pass; b=fI86solqX+AXHQHoWU4Fa5uK+uuFwx61xo2eX6VB/tACwBWPlqIGLqy6kbp1pTfOGQ3DSM3EvklfRydkosvyAHpS+Ywxoj6Fil729aSiEaBMhhCZZ8Qd65XtEO3Bq+6YGw3TfOFjsCPn+ODc03y8iq1nbApWHHNJyMOz+Bnc8aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779880348; c=relaxed/simple;
	bh=HTceJQna5R3QW3WJqxkF236wdYrDkM0RWh/xFCEyxIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=McxSttUElaLeeILgKD7zkI/0TI7uSS3SiJWruqENpOifgg9tDK0/OiMne+H32wwezN3l9gAzYfSryXpOx8Qgxdn0okWSVqipM3gQVyWuvdeRqEyIEHu80mmaaKSRIrqX8kJPuZWaCBQ/mf9z3BCUCucb16hrMHHGCMElW4oAR34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iu20u3Cm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hMtQxuIN; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iu20u3Cm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hMtQxuIN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mXQ4879397
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 11:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cwRzmP75XJs3nF9sZpC7Cjqku07sxaiJ9gxjgau2Vvo=; b=iu20u3CmaeBbyCKD
	WmeGg4dZg2KuyOUguEha2GyUNyXtt3wEepOGGB9icWJ7cEG2hwGDP1bWW/Zp2qGO
	0BCceIjqSn32veNGB6+7ma1Fgi6PS48U93k8Zkp8u49YtxDso/Bv0d9Irvd6WV78
	cS95eS7bLEWv+vqm/1tNq+2dPruW3g+miIY8Etk1K3v7MzbJixa1uxKG/AxD+YxK
	6inKRD5xv2hJCBh73sUGXj3XCMRPuaoYDcJN4gJ6O9BzqdFhuGyEoTHVxZt+NbVo
	wMFYmqF/nfZI7kePbd2wivV4zyGGfYIY7YkW/1BS4SipfSlN2LCmtIG+XgodsOi0
	FqbkWg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edvvqrpjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 11:12:25 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7bd49a2467eso206205677b3.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 04:12:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779880345; cv=none;
        d=google.com; s=arc-20240605;
        b=iK5siIu5FNFn7VgsSKEooNp8Z+KPRoQhLZGGdgEU5221xbDnCsvz/pOZJLjjdaV09j
         s1H+t2tIa914RtQFqzSqKOucCbzi3LSezLyUzRmA3/bHGtGmrsERW7ONXBeD3NzCBZRF
         ZTrfrna5y7VvVM67D1B3bFAV4tkVclFeV0moOwtfhvqbqatTsLC0CcHTxF+5zwheS1g8
         kGXgtX50T+KaAiicwE6TbQIUAcC/cw94cOjKN6Ys9bNN5v0uUGmDbnQfsirctv3zzxIA
         6rT5BjdQQXHttWxrrftScjraaIzhlDlxA0aq3Rw0+PWHZ5+IK4LJd0PjVZaNnhBPBQ3H
         CtTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cwRzmP75XJs3nF9sZpC7Cjqku07sxaiJ9gxjgau2Vvo=;
        fh=iNZFsM18uxSa1wMyhvgYNhU7uN/QXC4/Fa7TEJOEbx4=;
        b=QYep3QFSzIkNIQjbmUcfm6kFazxa7/BnmkKxYrUpWrPcRk70pb2jZ66aEcmJszxN1g
         rYdgB2ychYhYuBJvpC1E9E94iNsDCLrkMNS+HarQByU51jLEuWEGIl4p2yHtlm8RzEOb
         M2jtpbLJC3+ki4nYDoU/dN1oW40w2+23cCcKXCFOUdk08fAtw0UFbt8LlfiNlm3l5DQd
         dgOSH7UC5xG3Wg5KigbFFN6ZdKiNXmhRXp+hGlfC9swuVvTpcrgdQAIWnWW1TokIENFm
         5vxCGPLQZm6201LNY/Bmol9MS8ng81a/CR3RjHWK2vCA1PrTDDOMRmtK+EavU146HLsN
         gNMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779880345; x=1780485145; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwRzmP75XJs3nF9sZpC7Cjqku07sxaiJ9gxjgau2Vvo=;
        b=hMtQxuINnbm0TeZFUa8VBH0z+zBbgnuEBVcMxqRJiBijKo8dyX/Wwq01uRMQMfK5X6
         +uWhpTYNV62vXZyoguZyTCQmxDosqpR/KhvB6Sdg5VYCy0uCnYFse1t+KMO6yy1UPi3q
         TPXjMLvgFLbLeUglkkY1vk93GqSgiPp44WbOKBceA+evMrHeseqXqiqzujqkoX1Wm3rY
         LdbsiPX0R5i8FNiU/WYZJFY/fXQf1xyTycBCLZTKPp5O3+RLj0iSDSKoj/ZHcFYVBvCc
         OhIc6QQPIfWMVEsin2D2yvQ2Rlw5bfxrQokxZC6CSfQzhyBol/CPHTFtr52vFyul54on
         CKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779880345; x=1780485145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cwRzmP75XJs3nF9sZpC7Cjqku07sxaiJ9gxjgau2Vvo=;
        b=qbrg7eMKWzY3wDr753UmHiBxTmOs2SfEFPCfqhVOdhUNoitUiG/BaGzx8B7C5plUss
         IaJ9StCPvc8y6BKnnS1YEuXya3EIS3BxthcDRYu5zczf/s8Z/nKo2xtwYukhnCi42lsB
         hu5akOiV8EzNtOSrsQTOlyW3/xxEgzIICcBu8XnmV5YTSFOWSs49K/0AwsgBiERxyZ8k
         f+DlIqsmX9zgtYnz0az7RJJRDOUCfzyUCm8kOaT6DB355D3I55HUunV7o+PrlAIjG2gz
         9vzRMx+dBeQfIeeo+QKm4YueJkyHG8rqqia069jh6/qePIuLPW/rVT2K0MgdOU/4bmJH
         +vCQ==
X-Forwarded-Encrypted: i=1; AFNElJ9wrNwPfzE6Ez6d6J76lU9rFdzv0DmF6azIFOZiP+IsHChD8bRgFFHj2svDbO0ucckfY5lrFQDBbT+x@vger.kernel.org
X-Gm-Message-State: AOJu0Yx87abbZL8x7fpsZFSRNxnGBckBGzN19a+n4NGJXs8AAvXKBMol
	dCUHYTiMF4E4bMMGGACMjGVPe78jHOEkVEON7PPwWkPqaexbmLVEJp+tzURiUfHZa3nF2Ao22Ls
	YvGKR2Vj+V8hKeUrfu4GMz+Y05D2bGdNi/wo0GWGBDUYnIHeGOxkheMJyL5DC3M3Iba4MSYCq5E
	lKrkK/iidKcOX94EixPQgqqYZ6ha4/fbgB9c8T/7I=
X-Gm-Gg: Acq92OFbx6+fBXHcDSFuHWwbZianVzMxJlv7EtiokKncL5svsxlWidYckYNXp+t3oT1
	NPA9fbe3uPvGBM7JAEtcSEK9iCrQA2eXvuJTeagmfnoeYJuu56sVVcveYK3tC9hpgHBJvPKV3tP
	dJMrwp37x9+Fos0fCBRVXeOB/nxo7cNAfyIPz3RBsR3QkTDi5RHU7xXKe1tdQF0Xskek/xng0v+
	tbk4hUdseFELBa70g==
X-Received: by 2002:a05:690c:968c:b0:7bd:5d03:dc18 with SMTP id 00721157ae682-7d3356de607mr235106167b3.29.1779880340472;
        Wed, 27 May 2026 04:12:20 -0700 (PDT)
X-Received: by 2002:a05:690c:968c:b0:7bd:5d03:dc18 with SMTP id
 00721157ae682-7d3356de607mr235105977b3.29.1779880340058; Wed, 27 May 2026
 04:12:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511-linux-next-v3-1-3e22737e71eb@oss.qualcomm.com>
 <920223a6-4e4a-4ebc-8a1c-c37d0923a470@oss.qualcomm.com> <a79100cd-0e33-4eb6-9452-c4458ea40bc0@oss.qualcomm.com>
 <b71f7653-78bb-49eb-b4c4-3fa8bca3e705@oss.qualcomm.com> <CALC2J1PqdKGozWX-WapCZSkjGZcM_JjOX29HQ8r7ghKyaBXj_A@mail.gmail.com>
 <6bad01bc-3329-4a8c-a812-a6d058e15efa@oss.qualcomm.com>
In-Reply-To: <6bad01bc-3329-4a8c-a812-a6d058e15efa@oss.qualcomm.com>
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
Date: Wed, 27 May 2026 19:11:43 +0800
X-Gm-Features: AVHnY4Jb9evRIHABNlMMFY1oDShTMB9ty8jTUMmcbx16UVg2dcBWzM-LB1-fM_U
Message-ID: <CALC2J1MKV1D+9kzux_wu4S6Z5WKMOBw+n3+1PTk1fRJn8KaBAA@mail.gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEwOSBTYWx0ZWRfX6t1nV2Rk1PNC
 ohMnVsQxPY5Dpcc+rP+3WQvtRuttN8d7m8SFpCTQVD84hK/Q2spM/2VoIJKBQO6gsXLuieDl5QH
 moZ0D0n9ux9knL1ewYwY/SXJXupvm7OO3KYPf4vuU6rcBf8DmNLcmhd8z3YDuL2Zp1CvMSMzGVH
 bCYVX80EMx9G57OS+RDbf90eVNzlLhGZL6kBiN4NVXq2YbP+T9DTEh1epwzNjUDuuAaKG0HWUh+
 VftmD9E5Ux9bZ07qYd+TDukOY8CHje6IXGuvluon291XK9klJh/opnhT/iDtPpEqU+kYB8g72lq
 NMviC+nyZJVy8s4rmzvOfSjFqp21BuzVbFvmDjTdOZ4lKRhxblQ7uIlwkCFcJsE3cVwrrRLz3Os
 VWcbZeW+hOPHOD5om5Mubt2jVYA0Hx5kIUNYuo6JToE3gupANH4szhfjy+XFCecqPXhwhJcsscz
 05gVwYodhyuX/Ss7eAg==
X-Proofpoint-GUID: Em6q9lWXcS2SQRShCMKc78C6XKxCm5ax
X-Proofpoint-ORIG-GUID: Em6q9lWXcS2SQRShCMKc78C6XKxCm5ax
X-Authority-Analysis: v=2.4 cv=fLMJG5ae c=1 sm=1 tr=0 ts=6a16d199 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=l703-9IPqgHXV7_gOVUA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270109

On Fri, May 22, 2026 at 6:47=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/19/26 4:58 AM, Qian Zhang wrote:
> > You're right that GPIO 56 (wlan_en) is consumed by pwrseq-qcom-wcn
> > through the wcn6855-pmu node =E2=80=94 apologies for the confusion in m=
y
> > earlier reply.
> > Let me explain the hardware on this board, because it
> > differs slightly from the typical WCN6855 reference design and is the
> > source of a problem we're now stuck on.
>
> The wording, structure and magic characters within your reply make
> me think you're using a LLM to respond to me. I will not entertain
> this conversation further if that's the case.
>
> > Hardware
> >
> > The WLAN module fitted on Monaco-Monza is not a bare WCN6855 =E2=80=94 =
it
> > contains an additional, module-internal PMU (PMCA6850) that gates
> > power to the WCN6855 die. So the signal chain is:
> >
> > SoC TLMM gpio56 (wlan_en) =E2=94=80=E2=94=80=E2=96=BA PMCA6850 EN =E2=
=94=80=E2=94=80=E2=96=BA WCN6855 rails =E2=94=80=E2=94=80=E2=96=BA PCIe lin=
k up
> >
> > wlan_en is therefore the enable pin of PMCA6850, not of the
> > WCN6855 itself. From the host's point of view, asserting wlan_en
> > brings the module out of reset; the WCN6855 only becomes visible on
> > PCIe after PMCA6850 has finished its own ramp-up.
>
> The powerseq driver for WCN PMUs exists precisely to handle this setup.
>
> > Initially we reused the qcom,wcn6855-pmu compatible so that
> > pwrseq-qcom-wcn would drive wlan_en for us. But we hit a
> > resource-allocation issue this hardware behavior creates.
> >
> > The problem
> >
> > Because PMCA6850's enable is driven by pwrseq (which runs after the
> > PCI host bridge has scanned the bus), WCN6855 only appears on the bus
> >  ~10 s after PCIe enumeration has already finished, with no resources
> > reserved for it.
> >
> > Topology =E2=80=94 WCN6855 sits behind a Pericom PI7C9X2G304 switch alo=
ngside
> >   a TI USB controller:
> >
> > pcie0 RC =E2=94=80=E2=94=80 00:00.0 =E2=94=80=E2=94=80 01:00.0 (switch =
UP)
> >                        =E2=94=9C=E2=94=80=E2=94=80 02:01.0 (DN) =E2=94=
=80=E2=94=80 03:00.0  WCN6855  (BAR0 =3D 2
> > MB, appears late)
> >                        =E2=94=94=E2=94=80=E2=94=80 02:02.0 (DN) =E2=94=
=80=E2=94=80 04:00.0  TUSB7340 (BAR0 =3D
> > 64K, BAR2 =3D 8K, present at boot)
> >
> > dmesg (kernel 6.8.0-1071-qcom):
> > [    5.545559] qcom-pcie 1c00000.pci: PCIe Gen.2 x1 link up
> > [    5.882178] pci 0000:00:00.0: bridge window [mem
> > 0x40400000-0x404fffff]: assigned
> > [    5.912197] pci 0000:02:01.0: PCI bridge to [bus 03]
> > [    5.917368] pci 0000:04:00.0: BAR 0 [mem 0x40400000-0x4040ffff
> > 64bit]: assigned
> > [    5.924919] pci 0000:04:00.0: BAR 2 [mem 0x40410000-0x40411fff
> > 64bit]: assigned
> > [   16.476921] pci 0000:03:00.0: [17cb:1103] type 00 class 0x028000
> > PCIe Endpoint
> > [   16.477176] pci 0000:03:00.0: BAR 0 [mem 0x00000000-0x001fffff 64bit=
]
> > [   16.516689] pcieport 0000:02:01.0: bridge window [mem size
> > 0x00200000]: can't assign; no space
> > [   16.516704] pcieport 0000:02:01.0: bridge window [mem size
> > 0x00200000]: failed to assign
> > [   16.516713] pci 0000:03:00.0: BAR 0 [mem size 0x00200000 64bit]:
> > can't assign; no space
> > [   16.516720] pci 0000:03:00.0: BAR 0 [mem size 0x00200000 64bit]:
> > failed to assign
> > [   18.093137] ath11k_pci 0000:03:00.0: Adding to iommu group 24
> > [   18.101694] ath11k_pci 0000:03:00.0: BAR 0 [??? 0x00000000 flags
> > 0x20000000]: can't assign; bogus alignment
> > [   18.101724] ath11k_pci 0000:03:00.0: failed to assign pci resource: =
-22
> > [   18.108613] ath11k_pci 0000:03:00.0: failed to claim device: -22
> > [   18.115481] ath11k_pci: probe of 0000:03:00.0 failed with error -22
> >
> > At the initial scan the PCI core sizes the root-port window to 1 MB
> > based only on the TI USB endpoint that is currently visible, and
> > gives the 02:01.0 downstream port no MMIO window at all. When
> > WCN6855 appears later it requires a 2 MB BAR0 and there is nowhere
> > to put it.
>
> This is a separate issue that needs fixing. I see Mani is already
> part of the thread, maybe he can take a peek
>
> Konrad


The PCI issue has been fixed by this patch,
https://lore.kernel.org/linux-pci/20260116192921.GA958817@bhelgaas/

I will revert to the powerseq approach.

Qian
