Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF393955C4
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 18:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791484355; cv=none; b=qp5iG7sSpt1mVu92CxrW0RdMirPcnCne9+lzJ8WTEZFyoL9Ksy1wsLa6NLBZB2OaN2FPAeXcgHig6XLwWcSTko/XVZOHqyn2iTXHkbj5qcGpYCh5/SniXStn6hYTxT0U6zPUOs1J5WAdzKVvXP8HvXYgqSJ+Vdxs75QblmpJlxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791484355; c=relaxed/simple;
	bh=V/Mhki+IKGFDNKPPkP2QiTxARd+2PFHNzTO0JdJnWrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ib4GMjDXqbO377XQJOI7YEATHYtvcWTV1ANwDKmYFwpzeUfYLiKmy6H7YGfSAAHIRF+B6v3kTHAs+hWGH46tJyQyHV8TI97FrpZptdwfwO6pxLaKFktVXRd68QWE5gakI0LxTuGhPkmpaxmlGyc26N9sDdwCG0rBPksvoWXAAL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PwlJeFVH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GauJ3TdC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PwlJeFVH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GauJ3TdC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698HpNIv395427
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 18:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VYRZCqGGraVpeg761p+cfhz/
	OtuypLCZYsOWQkYDTr8=; b=PwlJeFVHJ3ip6Lj/RZu20NHt2C1Qvn31jbRfrbaB
	t9JyF+EzrbUe/ijl+weam6oUwFd9Vuxrh4Sk9VqI38zr9rkkXu5A+b/5Uec94esk
	XaRUqjhbsZYgY2YdFNkBjeywOJ5aA2dEJiVSlqhjt2+W8nhU5WHWZlt9RQrDuQbz
	cD+j5Eh3r5TYRx9b2gsHvCxyv87dkwWrAktR8ceyFmHU/UnPXnhhQVwIRQXxf4EK
	QGHE51LBSRAUao4dzBPMenzNIteJcT7eirio00RL9z+x6ueu02eV1mdIl1f2yKPM
	FQVuMlB3kprUkRowxp34QVQmTcBgGyXQNeojUlqYZ7ADNA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxp05n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 18:32:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab0a814c67so714245a91.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 11:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791484352; x=1792089152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VYRZCqGGraVpeg761p+cfhz/OtuypLCZYsOWQkYDTr8=;
        b=GauJ3TdCp5svwms9wIkCG8kxXIqHQ7ClnJpf6ViIVPuL7Tr3NYDc2SzW1I1dwwA4bm
         JUVdFIgs2R66FnSKAxADz+uKjmLbJ8dXJvcPYKaNnD16ZphbkQbxC4q/Ig9RmL72xYel
         33sQ9orBZ7WVjncP2SV5by9E0zYhtWgdj/r9QkFFf2dYNPBi7cm5OytLs+Gi4oN9c/xR
         KvQHuZ1ihQujvW581/AIyGANpDhuhd2tY+b6oYSdaj4MoxJjUXG+xIlPO2rqxz5Grfls
         Qza1haEOBCeDtFT9KLI0g8+2dXd6sCfNP3bNBVTa+DZSzxBrLA3eLQBBEc44ADUJTndi
         8Z9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791484352; x=1792089152;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VYRZCqGGraVpeg761p+cfhz/OtuypLCZYsOWQkYDTr8=;
        b=dATv7CuVw+RxFjJeY3D+znLsGzJO5RDIpVWACPVYMqOcUITFvCQmNmE6v5AZwILP9v
         VNyevJj1VrKU4iRUA6zsBV8MU8vBK307kRIKpTqCt2SSind0WSBZGD/T8thlW+UIgXmH
         Za7hJjw3wLQy9xo861q0AcJfTeEvD/hT4DYii0CXlH5H2zdAXdbUX6uONwRYlTKwyij3
         i/Vf1wWNLK+mku6inaZm8tU0Net7ipkXlK0GhGoh8CTtRS6PxLhHzNEF0mG2XBrg6/+U
         XrrhJ+p8NFUlaqsNhjVsMp0HFI2rp3TpruF+CkbXxzZQKLuYIDmhyZcFwyyJIpd22721
         jy1w==
X-Forwarded-Encrypted: i=1; AKwUvBwUXMN+vaZl7ce3oXnrlHxESP+wLV/aHFjMhVTYNPj7qzvPmvttJLJXNRsXZCVvaxmuTlfF0tD8E1hO@vger.kernel.org
X-Gm-Message-State: AFq9FYJVWNtOeewyrhDckh3FCanVKv9RGF/R+i7WLfSys1IxJSo6+YNK
	Yqjcb5UMZ6Z1gjcBzKj97+mYAEVJGv7Fi/plJ0Au8q6fUaEQwEoZgc5+D90sJt0GhDdpwNzPD7w
	CUhbR1QbBRaQk6SHVDb9WRNNYNzJmWUr4Zmj3eWsRE70xSS1kxAxLfA4As0XqdXpg
X-Gm-Gg: AYBFou0bAmNgi24XgzvmDT6BYscurpj87LXpIHPGp8PwFehzhfwZj30pP4jy7KCzdrw
	ZNG+c/BG+I5bsXlKZjpv2ujtANPyunvAVMxh/Zpu21Mod3AT50ee9+ZETXJK+WsQKEkHe5O2YHS
	eMARj3MhCrqNlkEUmlzPeJOwUZJMQ4S31vIFELUz7fDFFwbdZNGvfZcpWcdznxZlcCWOoi/ZDmL
	Rkirbt49e00GNGmjhuJGT20QhmMYpvbmo8/ZtVRan+6ahNgqu6zvGKUchWARwTVfzwzD/P5nHx+
	yLYIGaMClN8QBXmlMFLDGLXUyKFhNpQ+5mlsJKvPeH/4mdp8Sq8RZNol9JFz4lcyQiAm8augU+x
	CFQvqypVnowsEg6GY7avK2y6ryALzz10OFLs=
X-Received: by 2002:a17:90a:e7c3:b0:3a7:a463:54c2 with SMTP id 98e67ed59e1d1-3a8a1aecb9fmr5592718a91.35.1791484352360;
        Thu, 08 Oct 2026 11:32:32 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c3:b0:3a7:a463:54c2 with SMTP id 98e67ed59e1d1-3a8a1aecb9fmr5592664a91.35.1791484351171;
        Thu, 08 Oct 2026 11:32:31 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32d5a429sm113929a91.0.2026.10.08.11.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 11:32:30 -0700 (PDT)
Date: Fri, 9 Oct 2026 00:02:23 +0530
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: monaco-evk: Add Raspberry Pi
 7-inch DSI panel overlay
Message-ID: <asfht3z8O1MzMufs@hu-ssmaurya-hyd.qualcomm.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
 <w4vltai3lbzu3dq4w27jjotlu5nobc6vfnuxoo47g6mrkhr5ta@tmmd4ug4gzyv>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <w4vltai3lbzu3dq4w27jjotlu5nobc6vfnuxoo47g6mrkhr5ta@tmmd4ug4gzyv>
X-Proofpoint-ORIG-GUID: WofetONtUV6VFBxJEIsJvCL1N648FQmX
X-Proofpoint-GUID: WofetONtUV6VFBxJEIsJvCL1N648FQmX
X-Authority-Analysis: v=2.4 cv=LI3z05W9 c=1 sm=1 tr=0 ts=6ac7e1c1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FWuPlianXOF5sMIjmo4A:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA3MyBTYWx0ZWRfX3VkHQSt0Slwh
 17bmzHeCzPrgXwDaElkM+RSiHwogiqNZvd9uSwfFFLmUAxZJX6DH6sLRwrAuaB1ZHva75RHIUb8
 9/cyC3kmp6c/MAxvxlyPHqAqp1zTjfM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA3MyBTYWx0ZWRfX/r7dbEJ51Iw8
 R+C+He54thlJMC2iM9lib80O+DkOM4DCfoVX60WPsDuWtUqWWK2lVulEtIj/+TWRR6TYKbvuVG8
 MKflmvxe24Uc3tVJGvKflYe04VoqZoHKBBH/zE3NfSYbjr8/GM2lrOeM5uIjtM7wkTDzms+WBiE
 QKMfRUILXEX23htUHbUqK54J1GA6v+YU+XvtYytpspwpgDMxY01wtfekPyb5c1v2rUVJ7o9LYYk
 VmrhEyNZxkcViNRldX0cTHwSM5fK3hi2N7kFKlTOzQePF5bpT9k8dSXx8RNOLm4WXnDSUSyokFC
 6xOzY7hBvdtdM196BB4CGO9ip33X5szL+2nJKthtUVfp46UwjkzFYvBHqZ9UvYMrZdSoF07QEXb
 8YMAqZ1a2DWJ9ednvLjVJ1qKHoGT1bGFrxIizs49qohTI9Y2Hq++nloZh+YVArfKwIU4FCROpXi
 YrkFZM8LjyxKG5wXRBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_06,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080073

On Mon, Oct 05, 2026 at 09:34:16AM +0300, Dmitry Baryshkov wrote:
> On Mon, Sep 07, 2026 at 12:03:53PM +0530, Shashank Maurya wrote:
> > Add a DT overlay for the Raspberry Pi 7" DSI touchscreen panel on
> > Monaco EVK, using mdss_dsi0 with 2 data lanes and the panel MCU on
> > I2C8.
> > 
> > Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile                  |  2 +
> >  .../dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso | 82 ++++++++++++++++++++++
> >  2 files changed, 84 insertions(+)
> > 
> > +
> > +	reg_backlight: reg_backlight@45 {
> 
> Can there be an underscrore in the DT node name? No. Is reg_backlight a
> generic name? No.
> 
> Use regulator@45
> 
> > +		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
> > +		reg = <0x45>;
> > +
> > +		vcc-supply = <&reg_dsi_touch>;
> > +		gpio-controller;
> > +		#gpio-cells = <2>;
> > +		#pwm-cells = <3>;
> > +	};
> > +};
> > +
> 
> -- 
> With best wishes
> Dmitry
Sure Dmitry, we will take care of all above points in next revision.
