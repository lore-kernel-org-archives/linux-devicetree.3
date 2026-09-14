Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35788415F3E
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375815; cv=pass; b=s0KgOdLFhvawRil6UI/yFuyua3It618hbAxL16nz9FqeeGQex4zAKgH53NITbmk/fQfx+kTW9Fd/qNcnEAgU62syIoBfdSitWTafMSdBR95SD4uppUuQVMcRXPSvaJNI4ZSztcNZDQ4xt4XhXy5ARlcmCWCP0kLlFKy/N0tsM0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375815; c=relaxed/simple;
	bh=rURd6TloKr3f0GtmYotAt/Lt132i4nJ02pnGCrda06Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tu9qBcsRkpTwYsfPPo//QIQUz7tzSybmuaUR32HlVIIZlbi0LuKaVHNJ2p14JSA8Vm3YVrSoKzQ6ZRB+TT1dzIbJ0hRFt41Pi/GLUWen9KjHS6blK2eT/1s8mrSYGtqd/v2Hyr0eATml/xyMQinau5MkDcjdpJY/vptjjY9SdmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVcAMdwb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gIGQvN00; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVcAMdwb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gIGQvN00"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ijUT793264
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rURd6TloKr3f0GtmYotAt/Lt132i4nJ02pnGCrda06Y=; b=UVcAMdwbCwVGAbCV
	C+sUaDdDX+wSQ71/mmFXzE/+9fIcAZHzaY3fc/XfdVRB0NaaSP0FTc/4MgstqM9i
	si3Mf9Gz0rfrpoHnnL29Lxvcxul1FW2q/LrvaZU72WTE22DOmEuQqcE7sXLJ4nql
	RysRQcME7N72Fq8zodzLw0YqGXZ2HPtP4KN3XlDFAS4oTAGE27DHd+3Q0Sk2mdgr
	HcDGrJUw0yKoh4BLXGkfEu+jYFQpdNDIpOFZbGCEpjO/fzR/N9wHNjb1GT2HOSFM
	EAD5UqdxyBLXVJwigrgEiRRIaaseVJ8EKkFKtcsk1jj/AXalu8ePqYGRZ5iV3fBL
	YOVQAw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cnsaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:50:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so635432685a.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 01:50:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789375805; cv=none;
        d=google.com; s=arc-20260327;
        b=DqAizXeScw6eU28Kc9Dpis2AbB7CRAserojVKZBsZ8SeUHWFzWV8i5PEArQCPENHUu
         NxO3HkTjKSOVFI2vOtUMkudSSbF1Pk/1bNE1f5LKGmRtwnz4CFL8UYhdNd4xk1hsCeA0
         +qA/5Xch5+ZswTQy7WZQatJEuipKLPnl5i4DD6CbCserO1rWepaLhmx2Z+8/H2g9cY49
         n+0D9er87a3lzmKgrVjLVu2umyfTppWtDrx6p1oXwA+dO3gWcytgY/457gH/cQR152X2
         x8krIxyIauHiDDNOze10cfA12yEBuInNcbTz1RmhqeqPrM2Ii4y6WJylaWFeM4TKnOlt
         H5LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rURd6TloKr3f0GtmYotAt/Lt132i4nJ02pnGCrda06Y=;
        fh=vEiEQKviXXmdqw/sYq50xogdbjVk9HL5QkhPpO3Lxe4=;
        b=CjCcSCDEbDrBeJy6oHmfwM7gcskz+hdsF8X/B8UJVdt7YZM/ktly9zfeO7frS9typB
         s0uvcUnPEDyM2lUHwNpyi3SDSfOjsfECGfhABEPQlUf/JFU0M0bVvMOSV99ZT0eeojkD
         27KQNYSk2RR/IBIZnqJdkP2Jk1PrbtrHR5izSiUKuPcQzE7iM9sxCnWGq7ytL+coIPmp
         Q7XP3m8/bbbf3cqmG8nr293YnRXWH3fb0ZD3kA9KGZ7XgJu7oxGLCXsg57/QI0bNo7Mh
         vGLB0f/CXgdxA/0RmlK5j+hePBWndfKUWgeAEE50LhAAJAgJkOf3KXLrHTeUXlGkRoEK
         9XjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789375805; x=1789980605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rURd6TloKr3f0GtmYotAt/Lt132i4nJ02pnGCrda06Y=;
        b=gIGQvN00XlJLIlrGcPqcLt7HHVIulIL64nwmJTXgneCQNFjmVn2g7wEZ0fzrW/2l6z
         kWff8ehsldkj4SlnTEFMq4A2Y5khFOk243AzI1o32GikMfmaI/v6Wr4i8ucNS7hfqi+K
         XrfUGRYWYxejsZnUTEfYZts/yvygqON7vSF1pCF1ecI5d0Q6V+uBcZ/4n1roS1CunWDa
         Kfc3IVJj8wuY0YvJbSaJdKqNedCMlP+fyzM5eKJNF860nauB7TM7Q8MxFXGuC598OGP6
         DUmtJfSQSwmIZE6QMQ1wXQ1UdFUVYgcUh+bZ9CYZO9oF0PkUTGcxCJ9nmimt1Y9mksjF
         PFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375805; x=1789980605;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rURd6TloKr3f0GtmYotAt/Lt132i4nJ02pnGCrda06Y=;
        b=Ys+vSgquqMIwU19giWd4BLLsdhKdyIUg4Hq9zBMUwluIPvWAAABBqHjr85orYNeUzb
         IuRd25O33JTUTP91iTr4NUWSjN/bx30e94f+N3MWut2eKsl38NMoxxzwRFiJKpXTpPMx
         mSCdJvIPtqBg7cYDsjdC3dICege+u6/MyYy5N+nsc4JfCv43C43qGAxFjiWf0JDnNo/o
         fFQRNCXyB4g1HE0tiHbiD+vRwLmMlHVf0Uj4l1SXGxSoTBFa6HGOx54NktFPHa9/i9SL
         WBeby2oTcksenBn2POn/cf5tX9mgxDJiHxxgmqBUa7B4jh73tPFUZaHnPk8d6aVco89g
         LxSw==
X-Forwarded-Encrypted: i=1; AKwUvBx3/MjlgeHXNDjtnQb8H2QKCOl2Mo2C6Dpf+RfAD3pCkO0GnvrFIUw1uRjkcxrJEenr8n58Eqf78JYF@vger.kernel.org
X-Gm-Message-State: AFuF++naM/FhjF6bZXhzOXQj5yL88JRAval8eyGcOuEMd6pQw8ony65q
	rKX7ETwQHer13d4KBbriQxW9X2Azn+3+9zN3XiTeiCxfC9Jo8s+j3XJcrcR4Xya30Oo1oZrXl2r
	wc4i3OL+IKWQPdGrYepl480iZy/faX55cZmh50AB7FT3bO0HAlTRkwcNuqTffXIbInVzY7/EzWY
	dYzydZKy9m+K+c8VzT30bk8S+j1vevYRqaLoh7v+g=
X-Gm-Gg: AYBFou11lh8fyhtFxQkul3j5zheGF1QNdQLNJ1B/G0eF0uU38CmQcFFC3+Kc/Zx3PLp
	rDVVDgUYXXuoqnXmYQS6GQcqYDmNA8GgSwTuBurrvpBcG3ri/9AR6Fa5YRLvfa/eR4g/bFhAxde
	l6Umrl3FPKrQVM5Cd5WrJ4HXcDALWEurUOptvqzCwfomRuxBl6QAkZUmNgwmKXWLij7dhVKdLZf
	23kpQnq3tIQeGLGhtELhrChqQ5R3iX62fos9jWaHAfwzvlzUQTJDR9Iu1sgjBUNs5voWNLF7+I=
X-Received: by 2002:a05:620a:1b87:b0:939:9fca:8d2 with SMTP id af79cd13be357-93a2981322bmr224905785a.18.1789375805359;
        Mon, 14 Sep 2026 01:50:05 -0700 (PDT)
X-Received: by 2002:a05:620a:1b87:b0:939:9fca:8d2 with SMTP id
 af79cd13be357-93a2981322bmr224901585a.18.1789375804889; Mon, 14 Sep 2026
 01:50:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com>
 <CAMRc=MfDAiUMzOYRWioK2NDM37=yQqb4pQ5ETZz1PVOKQhhdug@mail.gmail.com> <CAFEp6-1PuGMGkdfWYiUQnYffm7en8b-DQybg_4M9xw9MVDNRsQ@mail.gmail.com>
In-Reply-To: <CAFEp6-1PuGMGkdfWYiUQnYffm7en8b-DQybg_4M9xw9MVDNRsQ@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:49:54 +0200
X-Gm-Features: AcwNN1VznECsrEJUnLcouEQxxRZWOhGsAh6qOvyElwlmFiNZH_egy-fEq4m3Sig
Message-ID: <CAFEp6-3gD0xBJZOOmTw1MBex-DYo99MXHsQr_=uLABMHdSjaVQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/11] arm64: dts: monaco-arduino-monza: Add support
 for LGA WiFi/BT module
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-pci@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyNSBTYWx0ZWRfX6719iiyhrjI1
 NPGDlfzXmEUVKz1mVytc9tq/B1TwEd1nmjEsyPeqYHJEg3wt5CEYpWdlIsC3I7ZJ4n2ntK2Q/Ui
 DQMYRQ5qJyVjBDH5ojL9rGGenWRyxRukngOifPY6CPecIM7UH6hS/rGCEg19Dp9xnHI+TznWdkz
 66FQF50JEioV4oWpmaFRtaImogtiUpiEgXAXuQjESJjLhALiymDg6b9GivdTDtl2bgzIGlMJW36
 Sa9I7q+Ve5PG3lWVvCoVP8eF/7ckuaOB/3L3IFm7ezthYmBEE+kcJYS8hOb5vIS2v4Oeh2488HO
 PsjZBfyo+rhU8lSGfVSmTo563lMlkiuaS3Co+8v6YCb8flMb2ZqB9VD7qgs+Y8FNR0+ZNipYy+s
 ypf5IPcQ2L3z2tCTPq7GXuZOvU+AKAlX3P6AtloIRPdh5QbNMox9smoUGwps8npTKmqSNZYbgIr
 klO7BDrV4CMiagWUw2A==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa7b53e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=et7816VZQgabzuuDM88A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyNSBTYWx0ZWRfX2FrFmy5y6Sbb
 kKbpW62T+2FIDu21b3H/Thy8Y4MYsIUj/YGgSPIAKpnpMNtE9NB9PqJgnTmRuUHU+O0VRL9hTTf
 87BYm6oYd0uqOukKfWHKDwomef/1QDw=
X-Proofpoint-GUID: Q-7HZf5JIm830nfMXjHg69dqZzNQhmnY
X-Proofpoint-ORIG-GUID: Q-7HZf5JIm830nfMXjHg69dqZzNQhmnY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140125

Hi Luiz,

On Mon, Sep 7, 2026 at 2:50=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> Hi Bartosz,
>
> On Mon, Sep 7, 2026 at 10:24=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
> >
> > On Fri, 4 Sep 2026 17:42:15 +0200, Loic Poulain
> > <loic.poulain@oss.qualcomm.com> said:
> > > This series describes support for the onboard WiFi/Bluetooth module
> > > present on the Arduino VENTUNO Q (monaco) platform.
> > >
> > > The board provides LGA pads for a wireless module. On the VENTUNO Q
> > > these pads are populated with an NFA725B module featuring the
> > > QCA2066 WiFi/BT combo chip. While implemented as an LGA footprint,
> > > the design is functionally compatible with the M.2 Key E.
> > >
> > > The NFA725B exposes WiFi over PCIe and Bluetooth over a UART.
> > > Both interfaces are gated through the W_DISABLE1# and W_DISABLE2#
> > > signals, as defined by the M.2 specification and handled here via
> > > the pcie-m2 power sequencer.
> > >
> > > This series models the hardware using the existing pwrseq framework
> > > and connector bindings, allowing coordinated PCIe and UART bring-up.
> > >
> > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > ---
> >
> > What is the merge strategy? Do the pwrseq changes depend on first two b=
luetooth
> > patches (I don't think so)? Can they go onto an immutable branch shared=
 with
> > the BT tree?
>
> The pwrseq changes are only a dependency for the Bluetooth changes,
> not the other way around. So yes, they can potentially go separately.

Does the above work for you? Would you prefer to take the Bluetooth
change separately, or would you or Bartosz rather pick up the full
series?

Regards,
Loic
