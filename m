Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCCC3B583C
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081544; cv=pass; b=G1KY1ypyJcmTvKxfYdXnWbINAUgULzbN543ZJUr8UeA94xfBmsa2Q2KfCXrVWLsfgKR1UOsmj821JFrooRfvkI5wiIr3q3V+YvheBJanz4pEJ+EGvqaU63nAbm6rmBha2YrDqTkRt+bEkpjmhwIb1a6neT1QorzIkbNVTUda56I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081544; c=relaxed/simple;
	bh=odqsSAUAQtXxk3E4rfFx1F7PpYVMO4kpm8sTZf4tAsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q5V1bLjbZ1VQpi1SqDPSNlrg+zABZYOTmBx/YUh6kVKdXk+RJ7CWwdOPgjo2I41rvowoYeh6Rnl6DLvVfULiYau+Ap2JDXmKB895VD71MJkCjwu/Bw+976vVH59b1OqfKVSoE0bXRFLzCxNh2IP7eujLkmDnX5PTfsAOMKZfk94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KL2K6x9a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xu/90YS/; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KL2K6x9a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xu/90YS/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iXCi904292
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	odqsSAUAQtXxk3E4rfFx1F7PpYVMO4kpm8sTZf4tAsM=; b=KL2K6x9aOJPTknps
	xPR9tz6DeBcKdJWBYO+U4UWcDapoAQRCx6MWwGVDZzGZW5pBZcf5BYOyw6GUMcmv
	3DS46ddwwWiWRSFEIHwfsqreNykCH4Dkj4vdzfDveDvx60JDhrx4RSC2Q1JsZBd9
	LRZA50k+0kJeoX+Svlee2Cd9U83zD6NcuZagD9TqgepoebxnT9D8f6JLziwQBgtv
	JdukJF4EpWQYxT2wLslj/vuhTTSSEAh+Dj8akglLet+wdzMxXOHkq4QTT6gI1W3T
	YD3k9nGMi9kZ+26I2f/9ICjujZHjadgbjyxNgXMBW/VO5Zw70W4i5E9XxxScA6qG
	Ec3A+w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epuket4m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:52:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915f6ff639aso131122685a.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 01:52:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781081541; cv=none;
        d=google.com; s=arc-20240605;
        b=UADCmFnI7xtclQSGRzETpCynXwVyPpUKf+J641GPv/tN0/u2m5H98METAzZUyDeqXh
         xPoBjlbgZcofVsl4hMZM6plVEhl9ig0D8KLCAPHTK7FjrjR70n3zIODqAYtndyrf8ynz
         bcSDajiHiB9dvlnlOjl7y9+bgjLrthwtDEy6t67803R/QwP0Ad+/9y3W0Cs1IKRm37Vi
         QuqhvaUl91p/kcp69WAmNz0eOH6IID7D1n7/Qjesk5XrHm+WtWfjXrNezJo3ySgjxCYA
         fdha5z3kFhg34thl9YBRtbxzGVn3HDNzt3f+ybjG0c8DA7BqsOdv55OfsaI0Ol4AwIVS
         krBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=odqsSAUAQtXxk3E4rfFx1F7PpYVMO4kpm8sTZf4tAsM=;
        fh=k7JLZ3nCpC2QwYFcTlaMvUXjfSWRsT5JiyxO4DiOU9A=;
        b=atJbdLqJqgV940pml66UBQDEjFfKW8kSKttQL9gilmVdq3Z1j4KqbHTBcspagCkjiQ
         cxVyDhuKbvYSMDRw0BNS1NHaGtPFFDgp/up6Oo2KhRIgG64H7ladwX+5Ez9OM2pRSa4N
         f7dEmciCYSmbkRMYhD156PXcti7j6UBBHkqrdsIGGP6IuvyW/AYHnaYDbPENfkaYXO6U
         NAYjWPuQKhTkH6txVP9vlYw4o7T1yvrpiq5pBcMfr1jr/Hmba40/dpb53wYqMRzkSB0U
         3gTBdvluJb5u+15rE878momxmMaUypQAs0l+SkRFINk/nYZjnhYAbcdoCJG2wSZgQFxr
         V0Zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081541; x=1781686341; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odqsSAUAQtXxk3E4rfFx1F7PpYVMO4kpm8sTZf4tAsM=;
        b=Xu/90YS/N64ythn9rkRa82Cer7FQEdpUTpZlbE7sKzN2NfGJg9iZbG1IT867r+zRAT
         /9RbObnLKnD47EOqPdv78PwLfXyX4QLIYylpVVDW8SOeblRpqVb4r2tNoDZlVNVXX9LA
         aDPLgFzcFQr4eHzf+zROU+/ceDlw0Yo4nuMcHs4ZkLM3FoTmC5xI8soCE5Z5umR4WXp3
         H3Tc74Nyyltk1Jy3h97BEZFjTR3XdHXxFRFgD+NBt/WdwhH5clkPrCb9LlLdvwEuVOk3
         J1SlqAYz/ZhUP08DCZeVQfusi5cT71dZ3rPeV/ahoj5qU4czwZtR5jHFmr5Dgb/rxE6h
         SRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081541; x=1781686341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=odqsSAUAQtXxk3E4rfFx1F7PpYVMO4kpm8sTZf4tAsM=;
        b=NdPNAgjuIp0nNpoEsHeNfz1i1N3YokPNZhiSwCcFafF+YQXcO/T0ZjRMVVZiTynVP/
         NcEvshHX4OwLuCPOTDfM7fxikPMPiVIRGzmdH018FstLEyBLne2aWpeabnPrPN0PJpfj
         UJKZGoKV0+UgeyDL4CV+/I+F6dBhVZHWtB2j/ghfCdIUfeMXW5rVLyZTOlULRTRw6Uv1
         F7IwyBtMmRla2bFQF2+MFY3NB68huSJ7u+UZBwCONgtZaKplMCXcVw++arpPWYeFSehs
         vMJ/MsBCMdFKb/V9RgKliLURZW9Nke/vMWjgQlvmHS/nqlmFExPnRumwXiMlaD/dxjWY
         twmQ==
X-Forwarded-Encrypted: i=1; AFNElJ9XjEazm99QilsMHgcvRD4Y4jRG5Lv6eSAWsgpR9jJYdkdft3nryPm6vvd0HGLcR1z2gahDxTYjtJhT@vger.kernel.org
X-Gm-Message-State: AOJu0YyKquTIusVB/VUoflDv7kN8XZXlKRrabOlS4emX5vqOrYjDyNg1
	t6qxsxmi86YyDnE4IVVFNPRKRXq0eJDDTm+2Setd/ge5BcKb4C4hYKy/PyvNHh6QU2w0phfJ2wT
	B3Lh7sR0VYUMi6+9x8XhVgzkbbzAe4JBc9X0zUaGbFH3N1PLvwqiePRH8X1j0N2k3ewHlOu/r79
	GWiQ4fBNZ8OomwRxeavMeZDrGNbylPJyLNA6C99l4=
X-Gm-Gg: Acq92OEQbUWWoKCjcr8d64/wrrOG5nBqeBORiRG58OsuI+kXP4vqsfOMKW/AlrNhh/C
	I7pKMGzEAnhjT7DU20rxvQdfp6drYZxchyXripugNwcOB/VEEaUpTFZZBRGjNr3jfmg77QNZJCo
	pNJH9sZK3B81CeE7WPVlin08xFGpJwiBHUzwTogiD1ri8BLmXgZyE6nrxKvV2bqHMzwaOWRZJTg
	DZ7H6jfzEbGu0G1BgdSlRBBqysmtzm99j66fnP3dbZNyLXRA3VEU5ISGIBsRfcWZ3eyVgWfwPft
	PmcRqrd5zbIaVL+osUN/vlN1t7t8nX/N
X-Received: by 2002:a05:620a:4802:b0:90c:e5b5:65f4 with SMTP id af79cd13be357-915a9c35164mr4069133585a.2.1781081541444;
        Wed, 10 Jun 2026 01:52:21 -0700 (PDT)
X-Received: by 2002:a05:620a:4802:b0:90c:e5b5:65f4 with SMTP id
 af79cd13be357-915a9c35164mr4069131085a.2.1781081541056; Wed, 10 Jun 2026
 01:52:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-monza-ina232-v1-3-925b0d12771b@oss.qualcomm.com> <20260610083743.426C61F00893@smtp.kernel.org>
In-Reply-To: <20260610083743.426C61F00893@smtp.kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:52:09 +0200
X-Gm-Features: AVVi8CdDGiDMvfVhFz8byRRYQf-ubwBArYML935S-TUUtDcg5909zHFU_AmRQ2g
Message-ID: <CAFEp6-0vRdcc_MekUZy5zASXZQHNzYZC=UCVj2yYRzno1qE6ng@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: add ina232
 power sensor
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX4osPchyrJ64c
 XQd60uDkh4tAUY+bjKV6wc4ULHq1leLV+CZbU260DHwoW+kGMJ5SoFwHvKVKhbJSJSGtKE1KMh/
 j0R6uBqJmUVjT8b1NJk+KOkc9ZPlx4ckXq/qIp71yQ4L8VWEOf5hmlCJIGPxaTV2NsNk+8tixSC
 1s+yquoIFOdjsCXGDSOPJmGVz94Gyor2Kx9ZdUU/W8hFKMCfvIGlEEQ830iY25+V49ercNGPLE9
 2XcyXO8nsk+SFrwK6aZSKaJp+RRVDVqe6kXeTIT/arhqYcRA2wnvHBVTd3cSnXcj/yXFsCvI1d+
 6Krjt6M/LPtqtZNX1+hRfH3t3qavV9/3EreesiRmpwInFTuMRmVkJdD//FcW2cgg0L8nM4LOJk3
 GMDGw9jP7F814yvV4+ZCeTleuLYl9+hv6Bd8445p9JNMFwVWEjOO6sV4XHHGTjIaPG17fL4UyVf
 lkoVsjpGQU1qtaNKuoA==
X-Proofpoint-ORIG-GUID: ARJbkjseIcD4r2fI9raxPLGLWARUmzNR
X-Proofpoint-GUID: ARJbkjseIcD4r2fI9raxPLGLWARUmzNR
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a2925c6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=e5IIi1m1Uc3Dfl-nZHcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100083

On Wed, Jun 10, 2026 at 10:37=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The commit message incorrectly states the shunt resistor is '2Moh=
m' (2 Mega-ohms) instead of '2mOhm' (2 milli-ohms). The device tree propert=
y `shunt-resistor =3D <2000>;` correctly sets the value to 2000 micro-ohms =
(2 milli-ohms), meaning this is a commit message typo.
> --
>
> commit e207629f293c0c8e295115a6f01dea08156bf3e5
> Author: Loic Poulain <loic.poulain@oss.qualcomm.com>
>
> arm64: dts: qcom: monaco-arduino-monza: add ina232 power sensor
>
> This commit adds a TI INA232 power sensor to the Arduino Monza board's
> device tree. It configures the sensor on I2C12 to measure the board suppl=
y
> current using a shunt resistor.
>
> > The Arduino Monza board has a TI INA232 current/power monitor connected
> > on I2C12 at address 0x40. It is used to measure the board supply curren=
t
> > through a 2Mohm shunt resistor.
>
> [Severity: Low]
> This isn't a bug, but there is a typo in the commit message. The text sta=
tes
> 2Mohm (Mega-ohm), but the device tree property shunt-resistor =3D <2000>
> configures the hardware for 2000 micro-ohms, which is 2mOhm (milli-ohm).

It's indeed a 2milliohm (mOhm) resistor.
