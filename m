Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51354A841A
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 12:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440353; cv=none; b=VpynnsRjtlehHbgevsWvQ3tAc+RpMEKcfsFpPdz0+JWZRifgB5d4FU9Jmz3zMM5UnOb1v+foY8rNSbed4krKpttLRzJg2copJKD+MlkAXJ4uPRaoq7VUTWgQ58dhzM76viks4clw4d0UGTVrJwkLmzAF/vCec7Qy20JZx9+sUl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440353; c=relaxed/simple;
	bh=P3oqE7kNOKYXZC77rREqImAKkNuKIUdIgCpvmUwQb1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kuCDQ9/+e5L1S34XpGfcivDpHty7MsCo86igDahI8IBwa/8WsP/wuyMW4Qu112aM9XGsILtaf4cA/5VIazNjRBbpldBoAVU91ljC+zLpqT7yucFbTC1acS4EJQg7jVJP1/z4ja83Dvh2anlFOAaAk1hNNbNaMtMIrKGrEEDHThM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IxhXbovA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H7AsVTSA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IxhXbovA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H7AsVTSA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AH7N63203903
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 12:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jFo7UPkeR8d8/1YANdOTPXiQ
	CruD4JrYi8Y3LZR29Qw=; b=IxhXbovAJoeP5H3m0RYajdE5JWEfs3WvEaEnUkoF
	YdXvQ0EpLeeVDkI3ReNCXn0ivET/bkl4+J9hnscGfTXve6gLtjzKbnPpUyxspQIN
	YZp3cD/upBuzBLmuqp15kcuS6vqmGwryXoEy5aPZieYtiUZY8IsiZNO/n95a77MU
	gJb0HeZhVAQ9Qofd38A3wNo9fufsaTG9lGq3nNangZpJKFuIMjF5qY1TFwjgDYFp
	njN2I1nfUMijaLyrXsl7R+HOZ3sR6TVbZnhNh7/NXrHwF3Ai68k44QCcr/B4WMcI
	i9bcRtR03FOdhGy53Epwil8mgWrK/u4ft2MhKPTGKWUxdg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d110f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 12:59:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494cce712so431819285a.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 05:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788440348; x=1789045148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jFo7UPkeR8d8/1YANdOTPXiQCruD4JrYi8Y3LZR29Qw=;
        b=H7AsVTSAUwUKXpMBYrRUtqIfqMtOEUXHoTolUViOEwVSbP7ndhCaFJ5PmOk1nU8F55
         GynmBk2t7omQDI+CFcvlDAmxGBzdeQMZRDU7jDbUxG0pioUp+KVHXtQijFaPBEaIyJQ6
         EpgR+yjFKIgdj+QRccYmdDXd6EzdvA5lfFwN7SwHa3t8SPkqJyFpY/OrlBFd/a2ExVyV
         KIuf8G5iFljeC2+yXc4zzY+/KzI4MNLZa2kQVTlHHnuOCxXME1zcnVi+0LwV5YpLlAHO
         1Hu7e0US4KUGTrazU0mHkdknrEEa6+23UlnWJwHg+zSmtjLFV7RafdXqRZnEvOyRJ6Hq
         HkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440348; x=1789045148;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFo7UPkeR8d8/1YANdOTPXiQCruD4JrYi8Y3LZR29Qw=;
        b=dvcVOsN0cebsRnHP+0Orx1ycGgDyOjn2/NCLaGo1FoZBDtXuJEpEQIgAbLjkqEgYLy
         1eI5nBL2NGXE4gDmbtkUZ+fKhHMNrLzdIAVlNybkoAOTaeqmRxllQ383mjiXGg/h7PVH
         zJaQz1j+oSZLo1Z+KpCP1MJKtYzGIu1HUL6Cpnp2Hv2cWYbFonfyWnVKd9QR8EmSlavm
         xNyJdz2UwGIQxRq5hkadLh7XU0qrEM5cc6RdF+1tOcVVCu68DWWVGfp0r7C6MF1bcLL8
         RyaIpSzfZYdxDXmtUooy77j2neouD4Rm1lD2M0r2kQ59F/TpDc11GRt7uGodYxhUgO38
         YpOg==
X-Forwarded-Encrypted: i=1; AKwUvBzOsSiCF3xfMjG9wcBz5/Pz4MIjVuW13aXxtRV3CwEgyb6tHsbAEeOcWh6LMaQn5U92eAZYBR6uaEVe@vger.kernel.org
X-Gm-Message-State: AFuF++nNu9FII8BlS4cW/5R45lOya2dPXZe75gddXbsdsATDDBeFCnpU
	T3dHoqGtpYBj3xS2enRkffF1unvklzREjlZe1xtb65LFThYutjP+C4Eu3nRhaZcW51R8MJ+u8JJ
	W5gluKvwQQRHmcic4p9Yx1jGLA02PiBq4EKkmY0YvGZL8PwEtyCbEcyIMfNWRZ1jp
X-Gm-Gg: AYBFou2Dqz9guZGx4emEqx2WQ+7ImK8argkl2KK49Ctbw6ODj2hRhNtfNgM678+HYIE
	QraGFr6s7nUe/gx4A1WkGPzGCFqmvs2cBABMXuC+fQXoXMXPq/w7rbWeKEeuSNChp++5wQsd3JZ
	QOc0LC1OOfVsMF8yGpmmRMg74yaswbVz/SrYBV+Zi3cOzYM4cA6yqJA3U9+Ho63mscUMnbfSSNC
	vgvNAUiOP//4FXBsTAHr5CXLx/cgmOMLn0QKUbpbNUnBAdyqinLPAZXC8FwcQ81UUw6ghzGCtPH
	9cM125uiIg2XeZiTaLOLo9S6fpp0JCqeMK9WIkRC2HSjs2yR6cjJdBtH6dv7ficmNZ1CcSFjY76
	8f1IknOHRk9DNLw==
X-Received: by 2002:a05:620a:88b:b0:915:688b:aba with SMTP id af79cd13be357-93960fa7c7cmr419289785a.35.1788440348165;
        Thu, 03 Sep 2026 05:59:08 -0700 (PDT)
X-Received: by 2002:a05:620a:88b:b0:915:688b:aba with SMTP id af79cd13be357-93960fa7c7cmr419280985a.35.1788440347334;
        Thu, 03 Sep 2026 05:59:07 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60bae6sm85687405e9.9.2026.09.03.05.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:59:06 -0700 (PDT)
Date: Thu, 3 Sep 2026 15:59:04 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcs6490-rb3gen2: enable TC9563
 embedded GPIO controller
Message-ID: <v6dqcdbvtindkh4mosfbwqeqxooken7aynkf4z3q4craoamywy@elg3bjn6w6zz>
References: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com>
 <20260901-pci-tc9563-aux-v1-5-dd9b80738e70@oss.qualcomm.com>
 <33t3reowiellyer7bc6ipp3n5jhchf5ozbj5imkctp7mcibkq4@w3jbhjet4w6z>
 <CAMRc=MdH4jQjO2GfAnQsvgnEnC-WJ0eBKm2tvXgyWg38TyDbXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdH4jQjO2GfAnQsvgnEnC-WJ0eBKm2tvXgyWg38TyDbXg@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX9+Dqfactk1HK
 N0Sn7QDtRR0dIJIk2KnKpKUyk8AzIqbvjsvgsDIzXlUZbH9yt3w5sUFpD4YnEVFjj8jirg2qOVE
 jH8/cnJ5gl0yHJ5WzPrEwU8G+np/IjRhwcFLXgo2wDBW5RHBxnfPXOZ/bJmHk8FV8Ltk8lXA9kY
 TOmOkU/O7r4I1LVPH4H8pPrvzAKPY9IMDNPst28bRbtmhFcFXoOQqgXaI3DMMatZjolMm7tJZpV
 WaqJL4ippEs3P6uVbwKXh6Bskul+EO7h3utNSoCQjQjGvZRoqogXmrUD5q3vZ6QBiiNeYBv+yMD
 Vg2yiKAPJvMbmlzDR2syVlW8WOywa3RWYvKp9QfPhfIYOIiO8fN81QqStU45b8nbgoEzCRhNMMV
 c5vyppK/ov2qi1GBdW/YbvdTKuUHvTI8pR1LO1Fmp3o33MVl05Ezl7PWNWi85MwrZhtqcCzahv1
 gjwyfBhRV93L61iJx2Q==
X-Proofpoint-ORIG-GUID: Y_02wRWK49id5kDU4HDmSAhM7xFywj7q
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX7CgRL9q7s2ZN
 8JocDx/0NnBPzWUfxT7vWf5a/0y8SZ/WteWHS5Kp30cI5L6JYiQojD26TX5GrgVAWcbua35MszZ
 uqQOMbemC0oWhd3cE2FdiAutCmsyojs=
X-Proofpoint-GUID: Y_02wRWK49id5kDU4HDmSAhM7xFywj7q
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a996f1d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IPKyqwG9_gJUVIbFT-kA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030113

On 26-09-03 08:44:12, Bartosz Golaszewski wrote:
> On Thu, 3 Sep 2026 13:05:28 +0200, Abel Vesa <abel.vesa@oss.qualcomm.com> said:
> > On 26-09-01 12:27:57, Lorenzo Bianconi wrote:
> >> The Toshiba TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
> >> lines.
> >> The controller is registered as an auxiliary device by the TC9563 power
> >> controller and accessed through the same i2c device.
> >> Describe the controller as a "gpio" child node of the switch and use it
> >> to control the PERST# reset lines of the two external downstream ports
> >> (pcie@1,0 and pcie@2,0), as expected by the TC9563 power controller after
> >> switching to the GPIO descriptor API for per-port resets.
> >>
> >> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> >
> > Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >
> 
> FYI There's a v2 already on the list.

Thanks for the pointer. Will reply there.
