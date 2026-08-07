Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B4C30E0F2
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 10:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786098975; cv=none; b=Z91iIEwj7KXsl4FYZQIcB1P2c3v733PVHoGoYGdmZoR0Wg8sdOgXWh9bUdet5PdlkvK1QGSF+cDfZasJLz0VeI28h00wKF2qPmwJo8ivV7BBg+YwRwHgHrztjnl+O4GKgx4sw0Ml4D4LbJUb7hAYY/DEPhWjYQkgbuvmIKZyOKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786098975; c=relaxed/simple;
	bh=h4vDNmxqWQpS/nRG27iKo4nl420Z3STB/xeyN7S/ByQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pUYavtYdWE5SdVVb+DWsrciYg6Zrldm8Gr5o54lUsHqD5CHzxnreiMRG4oeDaC7Vm935ZNizFaUKiGD5Yy0VwM6JQwTbWC1Roxv80hHbs5CdZnRx24368+DMXLva7kaezQ0KqpthaL5audJvEeuMbR1U97cRKuUxMbHm390sUW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iq4Sz3h8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jZps4c6y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iq4Sz3h8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jZps4c6y"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67789ALN3477084
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 10:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qT+VbVgd7ElGKDWKKk/0ZRVe
	I7DqTKc1dfH5YJI54sw=; b=Iq4Sz3h8xOEaCr1BuwbInAzYOhaZHnvdh9aG+22m
	dzee5rD7E1duJjCfsGdGbZRhMSONIHNzEHQSJq1MkOW6lSVFxtyqFzyyv9hsQDoY
	U/572d1Uso2GsUi5suSbZ3kI0X5/XphGgQmMxaYyJQSO/pbv+2dVoH7it3i+41J9
	onSBXega5nHZ7riFW9wiIY9N7x2zLvApEmewBgt4sH6fx1uhVrXKN6LI/XKh9g7g
	8qp59klljCvN4NcaovFDf8Boux+zWsbydFG/UszuMxV5+WwyQz23zRZPFb6khpXs
	gfH0i7YyPRzUee8UKuPKFtZRVPZJvF3Y6icCBxHzW8BL7w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6hbgmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 10:36:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d04908139bso55987975ad.2
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 03:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786098971; x=1786703771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qT+VbVgd7ElGKDWKKk/0ZRVeI7DqTKc1dfH5YJI54sw=;
        b=jZps4c6yWBUREDeKy2I8/I0eXeesOYosXYSONGtBnywxitsWizfYtGkuEmFrHrl6hV
         0aCoI4b8t63b86LIH2yYm+/kROsJbw7x52xKqQF7hr3djfZyD/s5d+LaZrSsZqph+EGM
         YxiQPcnOFcSMePzBAawHABQDVh0QMixazjJZtvAYRIat+F9m7Y1O3scVuUH8wYmDMEYi
         KQuT13msFv3B3NEEwgwCmhNVlNxcoDQRqHpxBhaJRmpS7iU3kGrlyIO8v/7PtOl5/MuF
         sqm30jV7GB72kfL5CK3UesbT3O/E2n15RaPaJs9BpXPoyU8AFvsyVRuKiSTL615q21Gd
         xO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786098971; x=1786703771;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qT+VbVgd7ElGKDWKKk/0ZRVeI7DqTKc1dfH5YJI54sw=;
        b=LlczYwaeZAmNodZ+LmFRfeJSm5/RrITrt9PdJJlrjxGtFloGGCwjur/i9VyOVGBs+H
         bE08UgkdsYGPW0b1K6E8c+W9ih479ttDyLCoMYsayviVgv8gdM6nILvKd2Gfq1X9ZTfA
         LhtyTaGrG5qOh+a/PGblfs+/bl9MgGYtFbE/OurMRbAJ7LuvP9M4yNenIGvcwyB1sLp0
         TPY7v/vguLIm5Gkxac0hemxccjHnO7uyJhaXpKe+yQNk9XCHl240XHYoR7KsliBXBOQp
         pDaBJPX9/tXpI4TC4nDMwebyTfAqqeMzPBqgAXJORqYwBgTFGw2zk8TeORlSrY3q/PgK
         K6tg==
X-Forwarded-Encrypted: i=1; AHgh+Rq6uhRttnkPW7T6k4LyXkpuFuN0hg3ZWTjtjcOj7GLN09m7Q5/Xe0AO57TpqRvSany1V3wfyoK83E7+@vger.kernel.org
X-Gm-Message-State: AOJu0YwcL49zr6mlOvvtH7TfcIUmGvjPi8uylx0JN0y20eIzzX2e4spz
	l23RliMDf97sY6+uYVOmNkNQ+FACessE5VkzuIugKxh3WeieL1mLRwtR19q2iWny/+lNfFv/DIT
	dwpqzpVQZzFn+nMxBv6ozviNMxFLd1ML1MVCcK/Q1kYHZCyHW6jebstfj2DynrnqZ
X-Gm-Gg: AR+sD1123S5DSzBeKrfEV4lBIba2ZJZZop87am4v/EJBCougLBBim9NiIcEvf8GbSCR
	iM/CTsnp5hx64CI7DAU0nbJgWL7EXuHyWFMTdHRhKtAJ2yiWyGZo1t6pGjpT1clneXJCwSwRI1H
	e+/pkbHu4UPZtXJ6d9cEEUeWl2ZLkzX2IM4tqkj/jRWgxBBoAf06KnayGbBew3/8l/B3l0LdX2Z
	8rUMXQHgaFq4rlPgJpBTVvpKE81Bk8UQk+is3AVKhi4QSCgoXKAqTe0G5CPUa+DwH/Rdmz5JTs+
	2Y12oT8+Gjep6x5Z/W3DYJXvV7keDBetVxX0uR6FTLwUbN+k4IeTw5sssPy/lLBBYeOYyHPggft
	hHZSNp/ToFnBsfphARqn+Z8PEeieeztzr
X-Received: by 2002:a17:902:e945:b0:2ca:d820:b9a6 with SMTP id d9443c01a7336-2d0ca98f8acmr266420745ad.23.1786098971545;
        Fri, 07 Aug 2026 03:36:11 -0700 (PDT)
X-Received: by 2002:a17:902:e945:b0:2ca:d820:b9a6 with SMTP id d9443c01a7336-2d0ca98f8acmr266420195ad.23.1786098971111;
        Fri, 07 Aug 2026 03:36:11 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14dbedec6sm6868925ad.44.2026.08.07.03.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 03:36:10 -0700 (PDT)
Date: Fri, 7 Aug 2026 16:06:04 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com, vishnu.saini@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: qcom: Add eDP display overlays for hamoa
 and purwa IoT EVKs
Message-ID: <anW1FM0kQqNtYfXZ@hu-anantiwa-hyd.qualcomm.com>
References: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
 <eemtq4i5xgilmy2g2ap7d3vnvgy2yucttwbujyhnn7otzavbrs@nzg3zbsbcszk>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eemtq4i5xgilmy2g2ap7d3vnvgy2yucttwbujyhnn7otzavbrs@nzg3zbsbcszk>
X-Proofpoint-GUID: 8Vrgmsx7hljEY7LtoeHqpqKL9JEXJuxm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA4MCBTYWx0ZWRfX9jNK2pzlpkut
 04puKKldkKYuP4soIzgyOsTDnX3GY1STtqnkve5UxDsBZ2gNd58pAwa3aYfkuDFyzwckyn+iq2q
 HLqQIAYd2Ur1mdizNBjfuonzuS4j0c1a6Mi/a3VuyUyYT31pdMD/1zS0Nbw1El8UvRHc9QR1KBl
 axgszB5turWHhoBzuVJoljnJRiltI7aSY4QZBNpXnsyozuoNZpBdlWgl5ubRCN59syInEZnHINW
 kIlVAO608vHEqk2jG1BCV0CZrQLP5oDGlTe8jiU41PE16+XXqaSnQ3vcnd6FZatKAE4XKY315W6
 AUV2tdiIuA6eQkbCNPdKhfEdMA8t2M4Fj4gqo/vHIVXAnkGqbTZbchvR6KinK4a+FUyEBm2xaRy
 5EdMcG3JhHmTxC03fahc9NnZ/miE8dKOHQuc2CXC2RxdyN4kf9g9Sx20X7WF+zCV4UNz6bcdk30
 TcGWSESJfOGkXsIGBbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA4MCBTYWx0ZWRfX1H3cQUGeVv+8
 XisHkm264GqQSDCKoE9JtiDfGnmdZ+BczUPgEaq9fBLvFm8/tAKkXDmcFSE33i1az9J9yYV6zH2
 RhYRBocz41HPUMZhEWOCG6x/8dpaO4Y=
X-Proofpoint-ORIG-GUID: 8Vrgmsx7hljEY7LtoeHqpqKL9JEXJuxm
X-Authority-Analysis: v=2.4 cv=MbpcfZ/f c=1 sm=1 tr=0 ts=6a75b51c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=9R9NyJZTvOm3SHl-YisA:9 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070080

On Fri, Aug 07, 2026 at 12:22:26PM +0300, Dmitry Baryshkov wrote:
> On Thu, Aug 06, 2026 at 10:01:19PM +0530, Anand Tiwari wrote:
> > Both Hamoa and Purwa IoT EVKs are available in headed and headless
> > variants. The headed variants use an eDP display panel connected via
> > the DP3 controller, while the headless variants do not include a
> > display.
> 
> Is DP3 routed to a connector or is it unused?
>

It is unused in headless variant.
 
> > 
> > Move the eDP-specific nodes out of the base DTS files into separate
> > DTBO overlays for each board. This allows the base DTBs to be used
> > as-is for headless variants, while the composite DTBs enable eDP
> > support on headed variants.
> 
> -- 
> With best wishes
> Dmitry
