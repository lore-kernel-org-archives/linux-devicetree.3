Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3ECA3B3888
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 11:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777375798; cv=pass; b=COHoGzlNDIPiqE2BdgezyrzF5BXb/lE8KSrsgvwKZETQ/FOVbmM0KPxPrN/1waunsiORPoKah+hwmCUNYTnjPqyQjyNHratkVK6s4ht0G2vHUQeCT+bAX0MenBhsluYcF/pAqwx3T+MYvc2T+u0Xgz/fHtjHZ0qjatTIaqzahNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777375798; c=relaxed/simple;
	bh=gAOBAXwoIZgNjfV46XOLVfiLxyQWHRJZDpDieg00AOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bPUz0uC225Djw2r5MF4l2xNDtw3Q6dZNDkSFPNrggrtUnbQEZSMa3vA6kNl3aOdeVfKtO/ptStOXqzk1M8lawgTBICi3pt+kjzO8irMGgr1U+inHRz1CUbRX9LY9WhLUXBPXWnjfUjtCfi3skQlp5mkD1OzP9lUG1vSnOvJsCPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nidgTwLw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kON0cKc3; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nidgTwLw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kON0cKc3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S9hd1o2045454
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 11:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0hbXvdArmq7BM5rLKvOa8BUlGtAkO648SmKUpum84i0=; b=nidgTwLwOByEgLG1
	y9Txngz3OgjJ0joyQ5rcFFtKfd3GKGy+sITAj1oc8zv7FmS4Ru/PnACzKjMUpnNu
	w3HaqUHSmchzsNTpfll5aHGujziIkX0sbJ6I5bwMNsOc12b0tppaHztpb5Igfhii
	xAA9zFE2pea+weLDGr3rI+uroTC4Dh9Fizbsd76/mGcvjz3+RYa2WRnzxqwSZlY4
	wf2glIzspayJhRBZZWtbHJeIp66dqEe9MU9B6LUzJN3AwDj+W+n0SzfvXo5ru/X+
	lVP14UoBzpQcKNEJF7+U0oDAI/cgprHR4XaUQYazI9KUVFK/AvcwL6EoQhv/aGIz
	XOgnGw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttgyrbj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 11:29:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50edf01172bso230454141cf.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 04:29:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777375795; cv=none;
        d=google.com; s=arc-20240605;
        b=Al+nz3BlNpSDy/74Hr1R5SU7+Smzd1fvhNzyHLYiotbxjExtlWbHvMh7kB3mJbbZSy
         nyzqOFcAyAFbJPWd0/cmXBItkjuAXDZqJUVnmjJEeYl6OClz3dlVKIIQ6Flh+Q16Us87
         hHhNrwE+eI7yfQZ0vtkFWbriXQQKcyAE5+IFCF0xATXpXPTr1yTuNhebiLq0t73pWF+/
         lc0lY5B9TyNLFA0zSqIjwsN+cVDeMBtfULVT+ZREOsOdM1/zHz0yyd/VXXWAzIEHqS+O
         O5pDPgqvSFFtTMTqeV3D/AWLt5TyUs4FWfRM0ZyuWpPthdzkdhOyt2WmYH83thj54BuG
         Np5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0hbXvdArmq7BM5rLKvOa8BUlGtAkO648SmKUpum84i0=;
        fh=cajUhT9YME1qYPDsjb15iqFye8Z0NZDum78092qsdHw=;
        b=bs6j3Tm3quOF75BpyYJjGpBh/MzF0xrvnX0K4S5HLvseBByatLOQS9J2l0CFZvJpXG
         g5TQ+qy8XUCx/qt3taHbhlUt6fd7MrVQO24ULhacgDTXF5x76SkObDB/Kqz2KbkR74JB
         COmKaVRmmgIzSIV5mKxktqqKSsC96kdojx6adQKGTZfPrIFahve3o219+Wq1faahBiJU
         VgHL8ahs2DW96xapy/LVcWCNCuoo6JDnhKhxfqn5CFBIGcyhFMrvkHIcIVgHxOxPtdPy
         2gkSUMmUJVXoWvd2JQYn5QcbtcWxDOgDnc2ySroNVLw6/oN8w1wk367WddDOzkuI/1hW
         fdZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777375795; x=1777980595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hbXvdArmq7BM5rLKvOa8BUlGtAkO648SmKUpum84i0=;
        b=kON0cKc346i3f/W7/9eZUusBzMR5MIc1pDqusZmRkHAy/K+eb2XbLpWqXtjEZFHaT7
         1oX7GMqrWFWyOMtq0eDKxLc0/V3FB/1DaTp/tM44XEaKAUHuzi5tefVRj6xYk+utZHAB
         fGAjmaW1wP7aKEAXRZefCIQlPi6g7H/aV7Pif49cyOwTiOQYCaldSz8qnoTm3TXeU51F
         SC27CzMzG3pZ1mL1d2JNJHipLZoqP5OiqrCjXA5MnZ/DbFDXX4WUaxsXLRAOBcTqLOqq
         kQWYfmLybkXP4nGj3X4nS6qBQHsOI3C+yMQUDjfBxVTcmOAExNid9HeGPNBbtenno55s
         A4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777375795; x=1777980595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0hbXvdArmq7BM5rLKvOa8BUlGtAkO648SmKUpum84i0=;
        b=IyjraJ6xB6yvw/ZmCpo3X0DjcviNZmwIX4wRNhwobPqGjTRDssRd27wV9ZkjgLSUDs
         6DN7CVqCJO5xBsYCFUXaQTBiBEP7dMCANEs10W1GdNAgIeAAHSu4gTVHSQh5WccQwepf
         d1UcRcPfQoHju3s6EMEyeAo+plsUfofsABYXP2o4JIbCOSqRqwPago5gkOMzachXbfk2
         g1sywX0a6FEypLuu3d1sluaMFQfd6oOHwS2AsWwMryJiWWcCKrGv588KemeSvaf3Z0M/
         kIrekiG4rW/ZEc1HOAabL5Ibr1KjAxACn0lg2ViGXF+P0wzkV7iuKrnvp1NBtypSqLVt
         AFNg==
X-Forwarded-Encrypted: i=1; AFNElJ9vRZbth/6KIidSjZmWZV37RLCTZWqRLTPPEfCLWMEFPJ2T5gvFJPmwHSC4lz/3dXWXTDz6KGL9Fpc8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9HmOLkUMiq4UIpSNzbP9xvuFEetSaV2hlAJYAdB7sNM9hg8R6
	t84R9eRc+jztHbBQkl4S9lSu0XMjsEKmr8YOp/9bcVlmJqtCvM6DjdIIBKas3KtW2THBU7Qgzlt
	4My2EdP4aUW13fcMa40LVJAIjJfHxOABNCYeZmJtkxMtMObA+pC3a54DCN1ey862QXzPhU3dBQS
	pASq8JK9X5XAP+QVJC180lzVk500hW9dSdqDxmMs8FMIxBhFTc7w==
X-Gm-Gg: AeBDieuiakyDolFeTz2Qo/B0rAhNAAHSASROev2gEU9UG8EwdEnKL4A/ykvfeBrtj8A
	bs3A4Cle2f/XBtsihnU7faRVU0BVAISUb/7a3APXvHpu204wDM4NOMV8JAEB+5dwb74qOrYmItA
	Ez7IPugNapntTvcJ8avpdTUjNf9Szr4ph4vtkYlrmKSnuVy9ZXshGr2tknXY8htbc3x73TnKLlk
	yX8Rf2UkVWmYqImD9bOaIlZrIl1xNDF86nyWYjVEJYfeTtxiw==
X-Received: by 2002:ac8:7e8a:0:b0:50f:135e:d68 with SMTP id d75a77b69052e-5100e1fdbebmr31893291cf.58.1777375794794;
        Tue, 28 Apr 2026 04:29:54 -0700 (PDT)
X-Received: by 2002:ac8:7e8a:0:b0:50f:135e:d68 with SMTP id
 d75a77b69052e-5100e1fdbebmr31892841cf.58.1777375794214; Tue, 28 Apr 2026
 04:29:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <Ptwba7JmobZufdkgayhAhPOOjZhv-yUkZSIMcQYJbKrrBFOdsdG_QI2uUof0EibbexBxSGC4drfA8J1zV2zDRQ==@protonmail.internalid>
 <20260427-camss-isp-ope-v2-5-f430e7485009@oss.qualcomm.com> <d4f786a9-3cd0-40ec-b499-8185e867af44@kernel.org>
In-Reply-To: <d4f786a9-3cd0-40ec-b499-8185e867af44@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 13:29:42 +0200
X-Gm-Features: AVHnY4IR6P3xmdEgm4g7wjJg0q93e62a-0qdxzDCaWk2GqaeMpyePeTLoKno4rQ
Message-ID: <CAFEp6-2RxaL4QgdBk4jrX3iC8mE8u6PvP89CD34x+Y4oAcwFdg@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] media: qcom: camss: Add camss-isp-bufq helper
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: AiGKx0xQZvpeUBwaGRHfiAJc3Q-LFwyI
X-Proofpoint-GUID: AiGKx0xQZvpeUBwaGRHfiAJc3Q-LFwyI
X-Authority-Analysis: v=2.4 cv=cb7iaHDM c=1 sm=1 tr=0 ts=69f09a34 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=XvfFUYa5IQhs_SHw49QA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwMyBTYWx0ZWRfX0is9GPPYDPWR
 LN/6iXWDgnEXNUDWMnlXhWQN9o5DcoxccR0JmqDxV17GNvesx22AJwRoNH8GElmY3h/cTYwbbE0
 QhSjigqOxRngULEARan9xpupTSDsTgLqIwTY0/wRhSDjWGxvxGm0dWIy7SZ1MB7xhXem9PvFON0
 hmRc3gPijpdVdO/90Vvw1Zsq7y2XrZaDeNXfvvfjzTUoxTcO0uYTn3lWadiAHtAJL/Lb3ksQAtR
 /GBL+kD0CJQawq6tDWkRdSh7rw0ctJll0Z/56yTrSq/QCCnEbwCekrbFOsXJFvSgkF2MiOa6Wn2
 Js60GqqiHGSQo66sKiHi7lgqanPbdYyj2LDPy49zFZKnncrKYvGEXAx3wAKfoIY6huhUex6yToD
 jz6sNXuLm3vGEyMxMp6MUfLlQdbrot2rfwCT0cBtiDFr8r1ZV7MrCWP4dcwQtQOk+/rW/Z6qg/D
 tm1SjOCC05/LlNSGKhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280103

On Tue, Apr 28, 2026 at 8:56=E2=80=AFAM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 27/04/2026 13:43, Loic Poulain wrote:
> > Add a per-queue ready-buffer FIFO helper for CAMSS offline ISP drivers.
> > camss_isp_bufq provides N spinlock-protected FIFO lists of ready vb2
> > buffers, one per queue index. This can help multi-queues management
> > and synchronization in ISP context.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/camss/Kconfig          |  14 +++
> >   drivers/media/platform/qcom/camss/Makefile         |   5 +
> >   drivers/media/platform/qcom/camss/camss-isp-bufq.c | 101 ++++++++++++=
+++++++++
> >   drivers/media/platform/qcom/camss/camss-isp-bufq.h |  85 ++++++++++++=
+++++
> What is the purpose of this and the next three patches - why not just do
> it inside the OPE ?

The goal is to improve reusability and avoid an complicated/large OPE
driver by moving non=E2=80=91OPE=E2=80=91specific logic out of the driver. =
This would
allow it to serve as a common framework for both offline and inline
CAMSS processing engines. Looking further ahead, some parts could be
further generalized or refined to fit within the v4l2=E2=80=91isp framework=
,
although that is a longer=E2=80=91term discussion.

For now, since OPE is the only consumer, and to keep related logic
localized within its respective files, should these components
initially be built as part of the OPE module? They can then be moved
out later if and when additional users appear.

Regards,
Loic
