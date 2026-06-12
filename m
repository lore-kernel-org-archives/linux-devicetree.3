Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BA23815D1
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 10:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781258488; cv=pass; b=FBOmiFyGjiWmm+Tgnr2epaHZ9ReLk2oJqnvgeKpHFqjfAYEsH9862pREANlxqgCCmXUvwZ+Q3GT+awtfbRJdmtu6mGipbgJGTql6HpwcTzv2P3KcDg0c98ChzlBJqnOQqrd6vyIB0yjqdMpE17/FnpJ0Hw2w+qfCnzMyiHnpc9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781258488; c=relaxed/simple;
	bh=cHw3EhfIxeFggCpzm6CPqEcKG4hAZv5HGwcoAKqnwaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YiWx+eMyNthVQVYVHC11lM3VC/qV5jYMcMVjvJh9SiMtDWeZFH9Z7RvB88WwXw0tMLsVTsXtt4lnP+3z/Pt3l63QCanOVLHEYcRqJ61emYqWwZWG0b7qKpp1Z2NS5snLipaaFHenqNTtASWEJquzSl/ZAOZiCBZJfQ1MdKoJNyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IgFMujEY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KVBO0xbZ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IgFMujEY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KVBO0xbZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39Q9k940332
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 10:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oInph8sZQ8Ma5X0t6VxxpBWehRn7abdgTsEpHVxvEAw=; b=IgFMujEYL7nMZWpd
	KLt4YyRgH50+k1NpU1LggBs55SiDEHrC2/PN+/ZHCO7nPlyoEzT+W2Q6BK8LBbmR
	yCFP6p6SX0zKBq5OLLfmZp1tpnnRXVuRO1slxq2z4FMsarT+TYAMGo2sUFtuDXpA
	drZVZb4R+8gJtgY6prfUwMyHi47ZNvlK15W3OkA7E9sECp+s0r8FBguCM6giwm7b
	cc3j4TnyGUf3YiDyV6hYMrMW5MolB0YP+vKbEQ05H/yq7f3IzUnkHzadp4N788ug
	Z32fgVOfw+kG9QHI1EZIkUCeJWo5e77pNo7NA0LP7ntclwZLFH32bN4HLE8YiNn+
	b5HnOg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er014ke6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 10:01:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915f6ff639aso221403385a.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 03:01:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781258485; cv=none;
        d=google.com; s=arc-20240605;
        b=OEi9K38baz3xuNHwIwc58XX+T9d0ZuCq7NaLI5AyuTGHIh/l8REt8ASdyV3Sci4rDo
         UPhV/ARWvPoSAOZ32ike3HmNkAzrkJWmEAxw7ltRxJmuNoAlpiTeqJJCsJ09aeD3RhkP
         QLVF5nPMLv3pAYZXL/ecAkiLMBPbCt1nCKa38JYOCGCcW1lXcZ5hwDcQyVXoh3bOQ9FC
         ZsUUhtR5aQ5SOOHNZC9B+9aOJRISfkAvQPN1CfNtyzfznj3EGiSP33quGmoohqj+w+Kw
         76BrS82CRUS7kpzd3KLCXYuTUUPQIsidYamy57pjQHHeKisibaksdRgQgFhqkbMLJ5z/
         Rmtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oInph8sZQ8Ma5X0t6VxxpBWehRn7abdgTsEpHVxvEAw=;
        fh=dMfpw7rZN1rp+j2sxiPBHY2Twlr8DWKl94VOtC6jRus=;
        b=C5jUS+f2LZVoPGPsgSJgF0gssmfcD03XbrZuKSpe+w6N2tWqUBpjkFHtMYoYIJecQN
         uKkB96fA+Mw3aP8gMl5wBP/XvijmlMwM+E7WlPGjhGm8yipA0CJ5tqXrXkN6Cy5suM0G
         Nk0xM1LcaptA/0o8VxxjD2YpDTxyQhxgN0zW/vWhIyMugRy/HO488+051RPvVCiC0XLX
         NQCwuRf0VuyYsXNRPlaYvRU1o9flOWFj3g/qOgbT16HuuY6o+6wb8MZEXIr1pqGwdvkF
         U+IUjqZf7bYiCqHRn+5MG1V0XLujxA+5CNEf4OS5+oIjvlMUgAN+q3f2zW+cECT3Mgnr
         1LZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781258485; x=1781863285; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oInph8sZQ8Ma5X0t6VxxpBWehRn7abdgTsEpHVxvEAw=;
        b=KVBO0xbZiijgHcms23XEcOxcnvnZ0LV2xRAhrnrAJMSRLMxobxmPjl8ZN0ryGlwMIk
         DJXJ28kubBJno2R4FOyAFTLppUhvKo+v7s8gXdJ9ghgfXOfNnb3dj0QzEZ4zU78naxoK
         LUNPus0A8/FtZCDPl+esxLtvNQw39RODO04YLJzd4Iu7nRGiiegWTz2BF2LhTgiKZeI5
         bqJMTspzUzR4D/dLLZ+uDVoFwn4b+FmfsqBlpzJet0U5wBo15Lt5aHKcPsYPDyv5+tlJ
         ZszYOHLFhIfXf4BuJj3H939dvzBjAWqWgqMAwhcIkITeSQq24IPcvCnf3mMdjFAIaBLJ
         ZXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781258485; x=1781863285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oInph8sZQ8Ma5X0t6VxxpBWehRn7abdgTsEpHVxvEAw=;
        b=djHWvspeynHi73Ct4ZtcQjSrfW8a3sU3+rHNLjVlbXE2x7rVRcMwn55e4KmcyIK/0N
         jOVEU0vLe/JN2AaoqO65XfaRwes8nVKqFLv+DdDELJJF2RnFH0Ka36qJQDngi/Yi4gL/
         VUV+s9f375gLQHProcBi7T1kYeN5RE70xaVZpGYBNPJiqmMfY/aAFEkEksomLzuxQKgf
         mQgXRE/NUrdxNjLHyTScCvfMS+BuxjFrRNnWUuhDzlLAgAFqP75XNPSbAbMD2cDggpNL
         E/PI/xX+38hVnckVkD5+lr/HxBxwQn3cSeAZiyrApVAxObwFrtyJIMFQ3RjRLRzG7YPm
         WCzQ==
X-Forwarded-Encrypted: i=1; AFNElJ9L/71nNlT2Yyn/ZnejXFCNNmLRv26x6rReGSkUJSArh6mJBT2Bu6jVvtQzNiIDkdGZWGR8DSM107Hz@vger.kernel.org
X-Gm-Message-State: AOJu0YzDb+JRXAqVgLwEKOuP6JAlC7CWt6/Ixn41CYVDj6+7ZX3ZZtLU
	GrCE/ZhynvjL1pNZvUzD5nhPQPHv76ojEAeahwtGvkXxtQfjKsokOkLifYEeKHDMCraYsqRkI7I
	LSxwwj7WeVT65Kq6Htkb8hy7mTQ3qhmK9mHrzW20wN3jY13biaYl0clzw734IovGNXnvPhNMftz
	Kzgl2oihTaFVsE1CxYdzt0rCPUZdJpYkimtkWbf3s=
X-Gm-Gg: Acq92OFdSYhN2JP/wXModYhWjFTsEDCE6rPGraE1lxyIibPkIWIEcGyg7QqaKOKd5og
	uIm+bmYTGHCuuw32OTTj1PquXBWwbAwtJoHHqju3SGeVP3SwHDzk1gggNYqRc9qH3JQ3nCQ+YP1
	heQHLNNjDdkxfnkC6TH/yxHA/8OvLTBr87oInA6UX0aTPFBAPpl+ZIlrD1WnexL/dUru0wdemQF
	JYiQMApZCv9cYDt+Vjpf03p1gp/083j05XZFuA7AJc8WsYH2wulw9kFD4LDDHOYpVh/WmR3/WhU
	9t4dt4Sf0i3D1dW2ZbcR
X-Received: by 2002:a05:620a:2948:b0:915:bac0:fc2d with SMTP id af79cd13be357-9161bc13cc7mr245422385a.7.1781258441028;
        Fri, 12 Jun 2026 03:00:41 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:915:bac0:fc2d with SMTP id
 af79cd13be357-9161bc13cc7mr245131985a.7.1781258430139; Fri, 12 Jun 2026
 03:00:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
 <20260609-block-as-nvmem-v4-6-45712e6b22c6@oss.qualcomm.com> <sy2ofvdbcxspxtmfdavjvdz7oes5ieuep4znf4ayknmuwhrlgk@7lp3bkegaeif>
In-Reply-To: <sy2ofvdbcxspxtmfdavjvdz7oes5ieuep4znf4ayknmuwhrlgk@7lp3bkegaeif>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:00:19 +0200
X-Gm-Features: AVVi8CcCaLmOad_JBtnFjekoAUWHpnzgbbLT7l_V3SVx5j2zNp67A6Sx6we9iz0
Message-ID: <CAFEp6-3Z92KNVv6hbG_zrzan4+cP-TCkoc693orKwvQyvP_YHA@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] Bluetooth: hci_sync: Add NVMEM-backed BD address retrieval
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: md3V8Khzi9eKlMBkxeZNbKwD3nLdXTcT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4OSBTYWx0ZWRfX+fRXrhdZ106Q
 4pBWOgpxWN5hONwmBi/QDSJ6NKv6dr40at5JywRboQdsEhAGWgEDl64qJtcSLliQBozqj+mAXmK
 bWskrc0f+i1bhHS/nPe/oRjC6InZ5us=
X-Authority-Analysis: v=2.4 cv=Qp9uG1yd c=1 sm=1 tr=0 ts=6a2bd8f6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=dtGr58D_ptlPQ1E9saEA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4OSBTYWx0ZWRfX9SP2rHz0rwfM
 rUO7tHD1+aw/DB8Od95LMEaAd2mTrMQG3Lqsx2UMLBOXekPBzCTEUhrfKyNRPObfaOaNbqv0H7r
 T6FE+V89DdRi+GJ5tbWHMePYKdN4/lDDLpf779UV1v9Pjl/88/RURi3coZo/jlIyMwR0tccjjgd
 6q8t7jQ9iJkGfZyvECtc8oT0hBwWf0f2NSc9bBEbkvE9Tes2uaNIjPhUUylsSH/fle6iGxWAZXl
 B3NJufYFHgoBnNYeYrNzUcJLZvgbq8ztRwN+8wsD+F23vH0b7Sg2+ukHiRxkBdccxr34JhhPlGC
 //QX9ktIVKqmeGifH1z/Yb5wauFVPntli4AhC7z7ut06TDj1nMeGtW/Yfe7XlkUoW6nuHrHSXb2
 RjDvnJO3DBN9Cbo1c8PSnCjNCIMeC7a7oXnsSwb12MjbhqNVNB2arCXNZJ86tPO7PvdW16Oa8PR
 J4eLLWHDj9T15/6S8Bw==
X-Proofpoint-ORIG-GUID: md3V8Khzi9eKlMBkxeZNbKwD3nLdXTcT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120089

On Fri, Jun 12, 2026 at 11:11=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Jun 09, 2026 at 09:52:31AM +0200, Loic Poulain wrote:
> > Some devices store the Bluetooth BD address in non-volatile
> > memory, which can be accessed through the NVMEM framework.
> > Similar to Ethernet or WiFi MAC addresses, add support for
> > reading the BD address from a 'local-bd-address' NVMEM cell.
> >
> > As with the device-tree provided BD address, add a quirk to
> > indicate whether a device or platform should attempt to read
> > the address from NVMEM when no valid in-chip address is present.
> > Also add a quirk to indicate if the address is stored in
> > big-endian byte order.
> >
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  include/net/bluetooth/hci.h | 18 ++++++++++++++++++
> >  net/bluetooth/hci_sync.c    | 39 +++++++++++++++++++++++++++++++++++++=
+-
> >  2 files changed, 56 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
> > index 572b1c620c5d653a1fe10b26c1b0ba33e8f4968f..7686466d1109253b0d75ede=
b5f6a99fb98ce4cc6 100644
> > --- a/include/net/bluetooth/hci.h
> > +++ b/include/net/bluetooth/hci.h
> > @@ -164,6 +164,24 @@ enum {
> >        */
> >       HCI_QUIRK_BDADDR_PROPERTY_BROKEN,
> >
> > +     /* When this quirk is set, the public Bluetooth address
> > +      * initially reported by HCI Read BD Address command
> > +      * is considered invalid. The public BD Address can be
> > +      * retrieved via a 'local-bd-address' NVMEM cell.
>
> Why do we need a quirk here? Can't we always assume that if there is an
> NVMEM cell, it contains a correct address, even if HCI command returned
> a seemingly-sensible one?

The pattern follows HCI_QUIRK_USE_BDADDR_PROPERTY, the quirk indicates
that the address returned by the HCI Read BD Address command is
invalid and should be overridden using a fwnode property. Without this
quirk, even a valid fwnode-provided address is ignored. So here this
is primarily done to align with that established behavior, although
whether that design choice is ideal is a good question.

This also raises the question of why an explicit HCI_QUIRK_USE_* flag
is required to allow reading from NVMEM when the controller-provided
address is known to be invalid, rather than attempting to use any
available backend (fwnode-prop or NVMEM). but this remains
consistent with the behavior established by the fwnode-based quirk.

So, I think these aspects could be revisited in a Bluetooth follow-up
series if there is interest in reworking the overall addr fallback
design.

Regards,
Loic



>
> > +      *
> > +      * This quirk can be set before hci_register_dev is called or
> > +      * during the hdev->setup vendor callback.
> > +      */
> > +     HCI_QUIRK_USE_BDADDR_NVMEM,
> > +
> > +     /* When this quirk is set, the Bluetooth Device Address provided =
by
> > +      * the 'local-bd-address' NVMEM is stored in big-endian order.
> > +      *
> > +      * This quirk can be set before hci_register_dev is called or
> > +      * during the hdev->setup vendor callback.
> > +      */
> > +     HCI_QUIRK_BDADDR_NVMEM_BE,
>
> Also, is this necessary? Are the devices which store the address in the
> wrong format in the NVMEM?
>
> > +
> >       /* When this quirk is set, the duplicate filtering during
> >        * scanning is based on Bluetooth devices addresses. To allow
> >        * RSSI based updates, restart scanning if needed.
>
> --
> With best wishes
> Dmitry
