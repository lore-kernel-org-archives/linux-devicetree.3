Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7607C3B27F8
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870349; cv=none; b=iW7q5K5YFhegxEZTs/E3AFAsHZHA2i1f05y2MZ9AseN3ePNZc7WBgfoLwxrzmxeE83sYQiGv3ohDoCMQ1PAMvteBPACEz2tSCwslVeK4jFmQw7PrYG4yHWObP/5WYFlJYz8AxhbpLBvVkjvhP25gUuGlqqg2PsFy07ZG9Os8Aic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870349; c=relaxed/simple;
	bh=22P+jx0cCRgKBJdXU/lXLBOvBYmLNvB0It8vkQu4yRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WwxrczJd4rmKqPPT0BU65t4ARULQaBY0UzVyUSN0AGoatgvBSR3R5fwgku0TgGbIfEXytJ63JeZPSHfsW+JXjDe8woNgugNgug2EiedPb3onFOuKm4o1LgKQuTyVmJDcylDEiNLwTBRt0YekaVnj28iFVoCJk75C+oRl8eYIO6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TRu0VXaM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S0fsOl+7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TRu0VXaM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S0fsOl+7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9SATQ2952604
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aBjuPeHvl6MvjopVqIkxTFBhnqkYc2xa4MlTY2Lqz78=; b=TRu0VXaMWBu5cShb
	gNV4o5vS2jOMy4bDZIen5gDOYwOlvPoPgGg7uYnzroxFh9JDWa7AAacCH2TA1LZe
	pb/sZflsdZb9kobkAcSqliWWgGD5qfLU9aT5IVW2MfgonspL6X/qJKXO/nr4Rc0L
	qbP75ndVTMc+EGUb5rE+88kD1QT55z9lV55zE0O6vHxmSwesESi2l/ZK7WfkLInn
	m5KTY0SOvcM1RbitGrjzxTieYB62LaHE3mZSZwoXCB/IO8Vr3tx1X2nBfcFb0183
	V8RsXPf9BsgcmHsDN3uMexbxdut2QoCgTH8oBeBoHCb+Pef3ywrU0GyNZ5W+LhUU
	JxleEw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqekthq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:32:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50911c94db1so107386111cf.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774870347; x=1775475147; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aBjuPeHvl6MvjopVqIkxTFBhnqkYc2xa4MlTY2Lqz78=;
        b=S0fsOl+7F5xtDCLhwAqJzMWiQ9CStyXwCPxDN0sJQIWb7HpVY3g+vAyBBJt4MfK/Tv
         DssZ+ZxkUc5LQ5MeB40YOm4zOYjbGrhOOjUWXM9AJZOmQdEDHA3oVJRt7Psdfq1g3aoR
         QiqaHtINheHcVExm4ePuiHfa88N4sWhjn89grSya1bDev5wrjimHklusiw5qcOgqaweM
         KlPKr8iT2ZH3JjtL0hKe31K8Mh+2ageR4lV8MVYLwufT7SxO+L+sh46dufiAMj/8IUHK
         u6wqdJua7NWQjtMYketii487cB+Gf/MoRzsMVeU+6RLFZUBzRQpX3EepD5X72CTaOc/n
         pZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774870347; x=1775475147;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aBjuPeHvl6MvjopVqIkxTFBhnqkYc2xa4MlTY2Lqz78=;
        b=cTI2MOE06XjBKJ//dPkDHj//S3f8SKYmwiGeTK6z3tvqI87TudYwGMdGWtQ0sMfcM4
         aP0ee2Zw2406ckjVb47BChDNZ04t8QjLX4qeBAr1fbvUZrLfrFUY82o+kRsXbCPzJr5K
         0B/VBzkXe2DJkXEcPOJ1LrqkLQI8aSWorANrkZ3TbNn4bq9Qwy3j3CUsKwuWwpQX0txT
         NInaRSpP01VWgTa9MQpw/2ChA+fGnIOr4Vi/Jawi4pskvG+0o9db1PApzEeIP7+Ht9p6
         UUNx90CL00OoTGUa0eb9Eu+EzMOZz70hYYLRFVy0p60kZJtamIdwFSnsfid+WfJNBYg2
         VfNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXo4E37tH8cZKG0vqOcwae78CXjmpFuvhYC0uz2LNXrxHrWMIP13fLS8o5lEm83benBNiR/Co0CpzXv@vger.kernel.org
X-Gm-Message-State: AOJu0YyLTdZFeff94Ur2pDZBYrzLI7FuLzrqSOSoBFBEc7lhYsL+QT+w
	js9m/2arI8LRfJkzZO0FDQTgKPbX3G3XudavE2yD3auUfz7On4okZ3gAgrLBtZf5AhISellnRmL
	990/r39MDwQqPGV1KFJc3X4GCMHubtYFcPN4y+7thvcJVuEnPcQIe9clvyjcECRAM
X-Gm-Gg: ATEYQzwLhc7jGLNwrQiuZ8cPE2xO9f4be/7/LlDsc4UZoyZKwqUzXpwFkM2qxxWCIoR
	+kwnIDhDK0O8QcSzARMBEb4wOpAU6wVY3MbkiVGbnEUbUmv9++ExPvPkcPPBV5EHJEJBJH5gbIV
	frllj7Kk/tzQTuQMTsD6qZWFqZUkrbp1Z3uBgL0X1dpt2iXLzQI47V7I+YC8DyrCFLWU+WiMzuM
	F6z25tl0aNU+GDhwlS06U3aPWpXavfA8QW6DXhVuvoIOUBqJtNMypi6IeCcHjSnVmPN3wWRNoad
	mNO1Ek0SWd0HAxkOw1OXM+nreGVD0CetzBulARvX2/tsXleNvDu2d1SK7ZizebzJE7AVyj5wKyk
	Adze7AnCOiC5yutM3U+6g2VWLdR0L0mqpxyT3DUHm/N9/Zz3YwptYg9d0SVYTf/D+7VlNezdqKI
	3Fr4pXD0d0Au+tzFDjoaDhN5J9akfLiAT4f9M=
X-Received: by 2002:ac8:5a11:0:b0:509:379b:d4d with SMTP id d75a77b69052e-50ba38167b2mr166649801cf.16.1774870346581;
        Mon, 30 Mar 2026 04:32:26 -0700 (PDT)
X-Received: by 2002:ac8:5a11:0:b0:509:379b:d4d with SMTP id d75a77b69052e-50ba38167b2mr166649011cf.16.1774870345944;
        Mon, 30 Mar 2026 04:32:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f426csm1599765e87.7.2026.03.30.04.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:32:24 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:32:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Aaron Kling <webgeek1234@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Teguh Sobirin <teguh@sobir.in>
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
Message-ID: <fbpk7dm72aiy673r2776pudw2ydpdirr6bu2rwvceour6lgwdx@melipr4mhv5i>
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
 <20260323-ayn-qcs8550-v4-3-33a8ac3d53fa@gmail.com>
 <7d6c2c58-310b-4194-8159-8ea56ed9465b@oss.qualcomm.com>
 <CALHNRZ_tomry+tJh8g2mCZBM1XQcaA7p1ycK03GH1gPQy3geqg@mail.gmail.com>
 <78d7d85e-ecd8-42ca-b59e-b7fbcecf1502@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78d7d85e-ecd8-42ca-b59e-b7fbcecf1502@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69ca5f4b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=5tAmg9hwAAAA:20
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=ZNzx5AqL15oOLpdYr_YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: LFcV_tS-XwItLi7HXPw_1xZMKiCuYcAh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA5MCBTYWx0ZWRfX2sf/tshx6j/+
 KgWorWucbYLHMEnduxT1vWAYyto+TnNMh32pSHNDSL8qWq0g6xwY86oQcEmPIBQjclawehyyIu/
 aO3WUQRSCsh1GEOYqad+R7CgsdeHP6pNcAuWnPBTHdTSVn08UMqbV5WM4NCGPnb7sCwQfnntpvx
 cvXq7r03e/1sVDOkRkrd9itd5WZCXMZ2GFYTQKSrNc2oWsFOtsGyzJz3Og3eSzeZJn/SkwUqti4
 n6ALb1NAdmSU/JOIuZ742ioPUADT8LBZHSQ9KAdHbPUmKhsGoJKF1M/jcJ1CVR1fWfqL9/r5Fkx
 shJJuespPCEPJ89pIJ3i5tgcNLOkBxi43VrNWSS4M7Cxia0VITBpjQZpk3Lg9LF8Lh4oLYJTplq
 RGFkc7S2zZZF/ZrwFuS+i8C0jEH2YOQFtr4z9dM6uP+9LKuLp7UQYPOvp4deIlTw9Xudd1sY5JD
 sOWVo7VWfHlyu7XgB2w==
X-Proofpoint-ORIG-GUID: LFcV_tS-XwItLi7HXPw_1xZMKiCuYcAh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300090

On Mon, Mar 30, 2026 at 01:00:55PM +0200, Konrad Dybcio wrote:
> On 3/27/26 10:26 PM, Aaron Kling wrote:
> > On Tue, Mar 24, 2026 at 7:36 AM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 3/23/26 5:27 PM, Aaron Kling via B4 Relay wrote:
> >>> From: Teguh Sobirin <teguh@sobir.in>
> >>>
> >>> This contains everything common between the AYN QCS8550 devices. It will
> >>> be included by device specific dts'.
> >>>
> >>> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> >>> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> >>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +     sound {
> >>> +             compatible = "qcom,sm8550-sndcard", "qcom,sm8450-sndcard";
> >>> +             pinctrl-0 = <&lpi_i2s3_active>;
> >>> +             pinctrl-names = "default";
> >>> +
> >>> +             model = "AYN-Odin2";
> >>
> >> Is this enough of a distinction? Do you need to make any changes to the
> >> one with a HDMI bridge to get HDMI audio?
> > 
> > After this quesstion, I tried to verify hdmi and am unable to even get
> > the connector to come up. The lt8912b driver complains that the
> > connector doesn't support edid read.

Looking at the driver, please drop lt8912_bridge_edid_read(),
lt8912_bridge_detect() and lt->bridge.ops assignment. Those bits are
lame and useless.

> Which per the current connector
> > node is correct, none of the devices list a ddc node. I am trying to
> > investigate this further, but vendor source release unfortunately
> > appears to be missing pieces related to this. And no other current
> > qcom device uses this bridge to take a guess at which controller the
> > ddc is on.
> 
> Go through the I2C buses that are enabled on the vendor kernel and try
> inspecting them with toos like i2cdetect

I'd second this suggestion. The chip doesn't support EDID reading, so it
is (hopefully) handled via some existing bus. Does downstream handle
EDID / HDMI at all?

> 
> > 
> > On a related note, I'm not sure hdmi is covered in the audio topology.
> 
> Since this is a DSI bridge, I'd imagine it needs a separate connection
> to the SoC's sound hardware. We've had similar occurences in the past,
> e.g. this on the SM8250 RB5 board (qrb5165-rb5.dts):

Yes. Unfortunately, the driver doesn't seem to implement audio support.
I'd suggest pinging Lontium for the information regarding InfoFrame and
audio bits programming.

> 
> https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/Qualcomm/sm8250/HDMI.conf
> 
> Maybe +Dmitry could help you out
> 
> Konrad
> 
> > What I'm using is here [0]. This is in a fork of the topology repo
> > with aosp build rules added. Speakers work, headphones out and in
> > work. DP works only with the pending q6dsp fixups series, which I
> > should probably narrow down and ask for a 6.18 backport for. The ucm
> > config [1] I'm basing tests on doesn't handle the built-in mic and I
> > haven't been able to figure that out yet, so that's also unknown.
> > 
> > Aaron
> > 
> > [0] https://github.com/LineageOS/android_hardware_qcom_audioreach-topology/blob/ad67f3777b1d4dec5289bc7117f2ec34521be7e6/AYN-Odin2.m4
> > [1] https://github.com/AYNTechnologies/alsa-ucm-conf/commit/d33738b93e9560e8d9e08a024cc84c8055bb7eb9

-- 
With best wishes
Dmitry
