Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A4E37754B
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 12:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780317556; cv=none; b=mhS1XKsPJaL6SNuGVFijS8+HUwQ21HbhcT7toqEkC+9JJ8lECbtJgiqdgB2a2LTWVA8PKndy6o+G5BTypAzG1ZduQ4qZuG+DZiMmD2qm9npqy7DCIqGEn0OKR1G6HaCa4zE9+vfFuhib2BL5+XDQ5TnvrGVobgHDUdj0mJZ14qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780317556; c=relaxed/simple;
	bh=uZKAlzf7H00gfTJ4zkQUHuksFx23Biv8PA7xoypBD84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcJEnJJcdt2dnYKFnluypyYBYAJfC2wBZyLcXK46MdURCEjZUrNsLNZzvTHMoHWJMFbomz34/5JpjVsCXjTgvZ+ACDo3/Ubc6Vh9QyVah1JrO0LaF4fQMVOoWzBb6KOAsIm1rQwVNrwtg4N4FPlvi1tVSLqRfoqvrW7lmdzuKgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C6DgpAca; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cT2RevEZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C6DgpAca";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cT2RevEZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651AxFN9334638
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 12:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JRiALWW1q4VYFGDWLlQd3Ej64Mgp/dDEtl1c9ayDqEU=; b=C6DgpAca07JGRfj0
	YSHsXLqytPOD6Mr3amFxTGlYV6lEFh7yJ2F7nfLAAMoPoztiODAXI93CY2EXGSoM
	oYNXJDgfagsgBqiNV3OOOB2+ZrLnXJytydWv7lqOZkER7qZ6n1TkFNJPhg6zG4tm
	SnXANb/HMfb/TvYaYRlTOPhzXPcdDFbcMG//fHtz2sgWucp5+v9pUAhAc2wF9HcZ
	2TcKCglsm0GS08bLFvxZza0K5W0xMHf0g5RRDON+i3ZiauezmLk4CfQlMtLGXlPC
	P4RqCvkieHscuXlF/KRPPyR9VDl1HBEpfVUNpbcxVIiLolzcSbh3w4PFdKKAMaHj
	NaTtkQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh8tfrdbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 12:39:13 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfd47ef988so1920602137.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 05:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780317553; x=1780922353; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JRiALWW1q4VYFGDWLlQd3Ej64Mgp/dDEtl1c9ayDqEU=;
        b=cT2RevEZCqPU+BbEyVVj/z9HK2d2ZkZi/gefI3J7IBDB77VxRD5MYkxB6RuDI2Gs8v
         Qs2U8efvxmr3+PhIKXMi+Lp07zEPL7dJk+V3K0OaLkMnJ39JGhOKRj1r2X0GzP7sDJ4L
         pX5ydntbS9z7nyccOwsmSAb5hJxGGgUcggcLiH6NlhqAXoYuuDPYRe4E5vDY19Se45R0
         l2H/51KqTgyeZrupxxH/CwnPEFlqWm7u3OXmU5IcCwT+tI3IuKSdJe3yAFP0OSX5mFqT
         DnT7MW37RmoVxG8LJqaiKXRJCLM67Ft4P9ISAhWwFx79Uaqwnkf0E1UQi8c1BmD8p4Nk
         a0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780317553; x=1780922353;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JRiALWW1q4VYFGDWLlQd3Ej64Mgp/dDEtl1c9ayDqEU=;
        b=AYmcn66iyVxq5CN9dyejbD2Ls5IGiq+HIlurrrt14dseVH6T/XPp3DLiLgqDB+ESer
         ZJdMWmKcXQkGvBsNcMHOhx9xyvka/pewrb7tziJbRVRdIXGhuK7t7//8w+ZqRnxXzMgh
         cKZtImMCvyVUaBTGvJqMzmW27fFQ8Q96NqyRupN80YuJU8FhfN1wWw9XIHWLXDIoD63C
         bARM751u0f47HGkCtmq6f8z3XUD1GwCey/TKDB9ZswUREkK5/NULBpALjgO7p/maVCI+
         4M0Uty+Dkljam0hqepLmY8PIgJJwfPfmisklnnEhKtkrCnvHVbGXBuz9FLDGqOEgD26M
         3bFw==
X-Forwarded-Encrypted: i=1; AFNElJ/rYxUq0QhJWu2rBuWEMwbihYzkX5XbzNQhDJgf4kUmOMDbemm675BNfFZMdi/8KHmd8VsQAMrlX0hX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8sQgerpnD9MPpWKOMOZhFzl4F3mHgJRft87bDI4F3Ae5YmWtG
	KM7lmFEB19u/JPRQsii1HQJLhX+/TkAvFSyZ1N58lr46sHsFpd2hYKiRGmO49FChe+QKv8EXo19
	T3UiHXV7Hj+9DeDOJEHG17lPrUKOLpnJpjjFeTGAqImDCt/qc0M4yl7ydcBV4VftE
X-Gm-Gg: Acq92OEOy2URU9rxqWOaZMyDxk0yjWBOV8YmY1UOMXrQ+m9o4+ESd1G1KYSod0sWiq5
	QHfl7u6SFF9MobNAA3g/ObyAaSWeh/2x1d/dGdrTscyHWxe5fqvv35+lJjgV0T4py5DrQrAUjRV
	HspAHIguCvn0zWi2ZpSeZeu0ps0biCBRmKpbY9aefK1pJUGfzs39XMzwWIAVGR7DOOQ0jjanVoT
	t06gRiX1GRWs0t3ZRHtv19wb2i9/AIRMV0wGBxc26STy9MjaBUC4a0VBoUdaZL8M2f+sSidSxDa
	dRhrpxMOT4piynifM85S2Zq/Dttwquc5OUoISqYwfcT8ZTKoP+/YH03i0+pKf9rFKZz0s6UTom8
	hgrxeR3OJyucMnMIhdmLrJTV0keKN2Yu8ifMiivHWdqDQ+EITJqcrvB8/NyaQhOle0qBIVf3bH9
	wwXMFLlfZ2ic/CNd9vQKcRODXtlhDEcavo5qG+dd0MrNk/zQ==
X-Received: by 2002:a67:e717:0:b0:613:e996:3014 with SMTP id ada2fe7eead31-6c687525a35mr3992797137.20.1780317553276;
        Mon, 01 Jun 2026 05:39:13 -0700 (PDT)
X-Received: by 2002:a67:e717:0:b0:613:e996:3014 with SMTP id ada2fe7eead31-6c687525a35mr3992785137.20.1780317552813;
        Mon, 01 Jun 2026 05:39:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3968a6389besm4815341fa.16.2026.06.01.05.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:39:10 -0700 (PDT)
Date: Mon, 1 Jun 2026 15:39:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qian Zhang <qian.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B
 WiFi support
Message-ID: <hrqzdro3s75sf4tfphmbzswiwquflrj2krm7e4bkohn3zd27rv@mra5xbg55qqa>
References: <20260531071409.3557734-1-qian.zhang@oss.qualcomm.com>
 <vvnecdwfbpzeuo2zjk7ajkfwaay7dexjncjuuhiu5ldqlp62wp@ybhqbzzj6x2f>
 <CALC2J1MXRygj9oRwEBsSPfhLjpRZi1T=_E14vkbOkGKKTCz7cQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALC2J1MXRygj9oRwEBsSPfhLjpRZi1T=_E14vkbOkGKKTCz7cQ@mail.gmail.com>
X-Proofpoint-GUID: gCn3xaXhHEwh57OstYjqFEkQxIklS3HQ
X-Proofpoint-ORIG-GUID: gCn3xaXhHEwh57OstYjqFEkQxIklS3HQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEyNiBTYWx0ZWRfX7keRgL1B+Gm3
 HAtT5iCupQkMGfx9MvytxjpFGawdUKNNPGaePf4g7fZ75+XVJ/zKTz845DFD1niIKLNEp6IDW7u
 7Fe6pfFVzIEwrTMtmvH/ERd4eBX9kJ7+/EOaAs/1Aawetoblfv/LCyJnVRW1isUq6nBAh/FvdKK
 8ZOe5+AyRfbHuy7EhptBNIgXvPvvZxJ9ISf05cPmylYVoI94CKEGxvD+1jQctvuIOwFImA59kYh
 nYWlALnnp9+PdcblOus/cc+ae2/D5X82BWYv4dLPIKVG1Ed0vTfi2JJZjljSQ2HjCh4JuWqyvVt
 kLlA+Qzu7LR1zS/ZbBPCpw/yg9G6HRwktHULskI/aSbPrdYKrCfbc2tVyae/s2LL6luBEeJlbCp
 0pfMckNQumuV9ISrbxcHP9ikqVGpxRudeb9AuMOLu+EmEU9wa/zVpYZiH55gDBGgNp7BaiftQkS
 AYFRTG62rQpTf09nNXQ==
X-Authority-Analysis: v=2.4 cv=P4YKQCAu c=1 sm=1 tr=0 ts=6a1d7d71 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2XjUwd11z6YVZfdrUykA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010126

On Mon, Jun 01, 2026 at 07:46:49PM +0800, Qian Zhang wrote:
> On Sun, May 31, 2026 at 5:09 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sun, May 31, 2026 at 12:44:09PM +0530, Qian Zhang wrote:

> > > +
> > > +     wcn6855-pmu {
> > > +             compatible = "qcom,wcn6855-pmu";
> > > +
> > > +             pinctrl-names = "default";
> > > +             pinctrl-0 = <&wlan_en_state>;
> > > +
> > > +             wlan-enable-gpios = <&tlmm 56 GPIO_ACTIVE_HIGH>;
> >
> > No bt-enable-gpios?
> BT is enabled in node uart10
> https://lore.kernel.org/all/20260429103537.1282497-1-shuai.zhang@oss.qualcomm.com/

The BT is powered on by this PMU. So, if you are adding PMU, it should
be used by the BT node too.

> >
> > > +
> > > +             vddio-supply    = <&vdc_3v3>;
> >

-- 
With best wishes
Dmitry
