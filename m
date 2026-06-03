Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0880A47887E
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488630; cv=none; b=QoGLYPkraP3K0/hG5UVC37ucL2hdq7oZIFsNwfvLnR8s+F+B71MjDyb0kL5cBbIZFXOeVIWudidc31p8S/Z+MPLArlGnKBMQ23/nOq2r77jxsmStfhW7V1gZVM3RbGlc8lRf9bIXhw/4XqGpJc83VlYLLnirwQFaxFH9R2pxRxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488630; c=relaxed/simple;
	bh=i6M7Je3OtasBEUq9EoD9yneuR3KuxwI1TtYTZZtwof4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HqutoGS7tnRkJ5l8pAW2UjHkTFKBnAAkVQjvMOYQXzSelmOzRBDL2vL3GYWdjuUUUsrayed+ZpO9+WgDw9ZiWS0tRCvn1JEzFJdW0GnKo/Z/RaFm2T5XbHzqKSo8Mk6F+DmrmWztymaQNiJa9eMrLP/DQtQwP0BtWj6LRCqJsxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rr+24RCI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gr37nqCb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rr+24RCI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gr37nqCb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653C3qGb1200369
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 12:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ATJtFTYaLad3DCcw6EHaR6UDZL2D5tB2SW9NzD1xdM=; b=Rr+24RCInsAvsXQX
	3+KhmLczGOqk6E0Onhh0aAeyNo6M1cBzQlYFI/MP+d3lgTJ/XwUdNqkpFcRCk7M5
	D//ro5U4qxJ2nfNjzPIk8lBRl/0ZO4tV4hl5cuFxPCEUhL2ZjF0ISSJqRtdaRT3h
	rFFrB6Gp6FNN8xQn0UYYzikBH7r/2pJipxrm3ELlmufBMRwmaM2StXntP/u5wzqy
	2+wohFpm59HvzZacrSEGQBZwyo0naCYVUwgwjrBmcAal7az0fkd+z/wjmsQGl1iu
	zGQ1ok30yEBiDmHojrCaxFHQc/WFeG3CG6Y25lIVA41QTNb0mvE5OEzEYUVDQoL/
	Titn9A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejckw1x1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 12:10:28 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cf37fe12faso1497076137.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 05:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780488627; x=1781093427; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2ATJtFTYaLad3DCcw6EHaR6UDZL2D5tB2SW9NzD1xdM=;
        b=Gr37nqCbnouKUYovwURfvyK0L8+vzBz8YOVsh1bWYQ0LEhZXeu04dBMMw7byQdGQo/
         nkHhtDynvLvuZAuH1nqSiq2t3Q+UKdwOlXWvMK3so2XuoO50ybAXRyWgu7JXSt9wHRio
         gS4bzbVKmCTkCCUAkwGOm+Tbn5umQwflycybNRLVmN7YpjL1J/9WK+6hAVXvAAuhU+3g
         sOhIu5tCoVIu3OHgkFB+c+aKAUDtDxBL6IVPK8q2uTBK8Ocv/NOM5VkdY/SK5NfJEBg6
         qAt+VEM/H9UlnVpVCQ7nsclIfy1sXbv4oQBdYJQ2crLEAfyO7jb68wp7czQPAU+gvurl
         LGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488627; x=1781093427;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ATJtFTYaLad3DCcw6EHaR6UDZL2D5tB2SW9NzD1xdM=;
        b=lJ70eQGyJs4so1WKkpCsbZo0O7qSsnc53bL9yDLjKn6Uwy2eMaaISgEPZlyRdJRJTn
         OZui7Pmy/bcsw6gLAjPzyMc1rpM9cer1kSNAAYDChXlQyhaJPrnN+sEStwqZwCerW+rM
         qjuSS/MA7CAHerEA4iG4056DQSaMKh1/9/WnfUXAz2vY9erc76jcuV7hIi+yd6qqTfry
         fzukZINdYvGeWViOcBZKwn1Yt/chG8ajrdqE2PgKZCvU/UKRqADhixnxGbTAYSbDpyOh
         abBod1jOxRwuy6bZrSUot/KjYeuYI3l27p2+Lp1/plLmScpYPGtYWzi9jFeWuDjZUZoD
         ExLw==
X-Forwarded-Encrypted: i=1; AFNElJ8nf5lFDUpCxejkTU4ctsOYG96YxgiPxVR/Pp8oYGnbAIAgdRqkKdTzqwcEWwRdOY2wrr7qoOrJ8Y3e@vger.kernel.org
X-Gm-Message-State: AOJu0YwYO5qR/nuT/GBrRJak6RMYKgc6FIkWzqiJH5ix4x0IxNGGR+k1
	WTmlRl0R2dNGSFvUczHRDBKhQVhMUeGx56xWl4ANwz87vnzDu+6B9QF15yVlb7TYCK+kb3ITymp
	wNNOw5Daek6OF/jxd1UJAK7WhhyVmsnj4zDMisjmAjF6wGy3y/4Wy7NIt7mI+YahEBUGdZCq8Jl
	E=
X-Gm-Gg: Acq92OFe+6wzMonw8EaqBZ3ca3HknaEoZAthDCcs4GyVTxHn+uTlDAP2BobxIAr3lpn
	EhA2pf7VdlSbx976BYj22Bj/ImEbtsZLNh5cDUIZUnAdpWo/gac0Bk2s99xqNxScSWuqj2z+0b/
	XxSoK1MrjdNZ1PkMExuHfHdKSEzcsOw+m7OzuGHs1V0GFk0ukQ2YjDuGcwrETk09pFKRr0xzJnd
	elAfE+UGteSSUn049yH8wHNXaKnwv303UOLwTfCMCKy7nzVPFoEEH2x1SD2pI0MyTSMBdpF+gfX
	he637rLxbf5yjGW1QtYdlfgVY/kqO0JZY5wje+ts8RPSfDcJ1sydhVP+d1o37KZ5eMKAWgAB/7L
	fGkEAQ3YYkrVvlfyVvnRVJc4sjXN8yA4H7z16d99gbYYxkUaovJvFaQSkkVW9lQ2eeIl+Cg9ejX
	ZQWYvkKwEbbioZv0ySspgZUEELHVuv+dMqU/IBiioObo3ymw==
X-Received: by 2002:a05:6102:32c4:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-6ec4881b223mr1353317137.25.1780488627177;
        Wed, 03 Jun 2026 05:10:27 -0700 (PDT)
X-Received: by 2002:a05:6102:32c4:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-6ec4881b223mr1353307137.25.1780488626732;
        Wed, 03 Jun 2026 05:10:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d503fsm8633201fa.34.2026.06.03.05.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:10:24 -0700 (PDT)
Date: Wed, 3 Jun 2026 15:10:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Message-ID: <c6aetoiz3dcedlxwjmt5cqh2mngswtmanf6p4s2molemnviwdc@btotpaqwcsoy>
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
 <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
 <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
X-Proofpoint-ORIG-GUID: mnhCc27mDgntApasIuHFbY9mwnwj4S5N
X-Authority-Analysis: v=2.4 cv=edUNubEH c=1 sm=1 tr=0 ts=6a2019b4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=tcGPitenHjrlTjGvCv0A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDExNiBTYWx0ZWRfX13pkFnDPv5Tl
 3pEjHn4JbEDKEVWkP1JH2K2KhMVzvqrhydsM/8MySSI7CUoPSUYiHH07wBW9hD/3AaRUr7s1erd
 //c8InF/qLr+J/YHj3kSzc41uy1gWG7FVryuanV20Cl22kodKZ0R60h/dSfyF1iMqWvEwGI1WjK
 L6q9xtfl9KzkNjGXKTgS+EtAmo3uWd/tfLXawf285fud/KrvWGB3aiAqqtiri1cfrvGzo+pPCiQ
 nRS/TJNBpc2dWur/n61Jd2WMmrEWNLcqUKYBzY0WLAV4slrH7UiSrCTBkeE+qG3k671gdVSrCDf
 TSdMvkpEM+waWO3QmerDpdqzdhXUvh1exAaiOQtk4UTzOwkbg+8vilQiJgsxlqFHPegT7ER2ANl
 3kij6/kpfKVemaoP9qUEWu1Nmigpj1Ywz6755GjkdTkRrNh6OU+2PIT5KkZVclzlsRouUrF1Bs8
 lV8rEi3K3yAN6NeQ4KQ==
X-Proofpoint-GUID: mnhCc27mDgntApasIuHFbY9mwnwj4S5N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030116

On Tue, Jun 02, 2026 at 11:22:41PM +0100, Bryan O'Donoghue wrote:
> On 02/06/2026 23:07, Vladimir Zapolskiy wrote:
> > > +    ret = fwnode_property_read_u32(ep, "clock-lanes", &clock_lane);
> > > +    if (ret) {
> > > +        clock_lane = CSI2_DEFAULT_CLK_LN;
> > > +        dev_info(dev, "Using default clock-lane %d\n",
> > > +             CSI2_DEFAULT_CLK_LN);
> > 
> > Why CSI2_DEFAULT_CLK_LN is set to 7, what does it mean and how is it used?
> > 
> > Since "7" is a meaningless number in the context, I believe it's
> > practically
> > not used at all, and if so, 'clock-lanes' property should be just removed.
> 
> Documentation shows clock lane at lane 7.
> 
> Truthfully it makes no sense that the clock lane would genuinely be locked
> to lane 7 but the documentation does seem to suggest it.
> 
> Yes in fact I agree. clock-lanes can be reintroduced if someone can show
> hardware that supports/depends on it.

Konrad and I checked, Hamoa supports using other lanes as a clock lane.

-- 
With best wishes
Dmitry
