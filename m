Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5715A38F654
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789323913; cv=none; b=RSjRZXvWrCFxA6FCyfvAP6kRtf8dzffEfnvdG74H69DK6MsAjyFCk8n5p6wcXmvQ4h3+yYgtsB8g/s1i7zdlAr4OacQSwQ29JbDLH+qHGnGJUhIeAymXTGSBplxo5b+6F/JpUbpcF7WrU7GIerPhHM9ft+hMbfiX6YCNj4jZdt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789323913; c=relaxed/simple;
	bh=Oua4x0xBd8TZMilI1qAPMvSZRZQ82sr3amusq4fS9Bo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qc49Nch3wpdPE9FlR26EOOXo3ac85LjnQyMKwp2IcNKqNDlmLm83Rnln58+NTZWxJSf632eEzKgRYMeuFPvKWFLY/8gZTlZy3JrtpR6cAy48SbKYlALpWSRcHdQ36HWFcXxIGpphvuk0TcbBwYpTSGXqPWuHt6fa55087Tohsxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJB0+VLI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c15km01r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJB0+VLI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c15km01r"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI2kwO1192767
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:25:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GkLKYhzdmWx8ASPEw+bfyEGrvJszZcX0ihy3/m9xYe4=; b=KJB0+VLID+cSRmJc
	EIWHRn+VH954/zglrkOFq0tU03iOMtCk3ZmbQ1nHHCR7xGASsfHWNfQzFHb6SL8F
	hB3ePZ9kXc70wJrEGbmCVFCaTZxBtAWG9i+7hs/u4fTdvL7KmApI8X6QgmazBr21
	XFrx8wSTeIMym88Phf2iEdH/oPL/dSa/JBqgjxS3IyII/CBoFp5JGZ74Et9K3lgw
	rorHUMAZYOvgZ1fSFTdMKjSjX4cn0XaH9S/qLAaEMuW9JF3ufYY3whAgKr9Im115
	er5/s5kUXytHDQdXAOqKKibQnyFR2fLZGvu6YZmoPcODjCylab61rPc68nsMLyFJ
	8FSXRg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh3rvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:25:11 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso2492344a12.2
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 11:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789323911; x=1789928711; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GkLKYhzdmWx8ASPEw+bfyEGrvJszZcX0ihy3/m9xYe4=;
        b=c15km01rh9dxCgzbMwfau49BlN1syrlQyLvDsc/xWHMGUugH3kVZeET6GgLiNwagSP
         oLaRxzTeT8DLr06yGQ1Dzr59eo3w3wES2IMoTQ3tvwDZg7DzAyMUcvIDIvOdaZ4lVeMR
         KR+KSZA0XDbr2U1K+X/AujjS/V7o858TZd30gxZQykO2tFJLxlrGPxMtqGUYyeY+vv1z
         HLJMeHJoRBzIBNNq+aDzy7f/w+8woBFjWvi4E3Emb0PKQh0J/K0Ala04EUIMAG+H/p40
         lbwE7pedpb3w9+QRZ0hidNB6qev9xsY3GS/Vuh1aNaTBMupeGZUNyrQdFeAI3qyn1P4f
         1tmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789323911; x=1789928711;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GkLKYhzdmWx8ASPEw+bfyEGrvJszZcX0ihy3/m9xYe4=;
        b=D2jiPWHW+Xswx9PXNCtBVyoUjd4bhbndtrL0e1+ZBdbx1L6Y4Gt7hD561cOfiP0t2S
         mmASSo+QEfaG9DueiWxQQtazrsoA+jf/9fs5mBzP1h56mBcBfabqFoGi33bDV2QojSfv
         r0csuHEONWpUpRY2t6hZSmlLrt64YJdaFg+UEKtpqve2teyYbizj5p+1rPhEWjMWG9Wd
         RfDWIJm+s60u906uon9aaxbJ/6gFBxO6INMb2WTJAFMcn9Z/H023bZzkdsWziYR3TGV+
         9lp/7k7Vpp2ogLsJXYYKJG8qP7JEJCdKZCxfHcPOqLAzRJD8p6xbmFCDrxSm/3YOumDK
         WDmA==
X-Forwarded-Encrypted: i=1; AKwUvBzl07cpH4vfGKQ925a0KhlRZBa73u+D/Lj4E9GKzN95/BmmAFYvkNOz3xb1J1FdxswJyIA4wtz2xFhI@vger.kernel.org
X-Gm-Message-State: AFuF++lW3YVyIUpcl/DCuX75E4zJE2rv8adFHkSuRFnkluGnij9/32oy
	ot1mtRDC6PZsOsEE7+JSQo966f+6/Mkuv9KYhzLhoA1iU8EK0GH/sYifx+Ko+y21hflp5lN8OSp
	93TLig7LMqCICI4UnfYewpMA1GGC3YZDjg2c7QjZcgC9WCVR7eGXl4gyc7LjEanlm
X-Gm-Gg: AYBFou2u17orSr0slM1EGNnFOV9sl4aFPBQVdZI5VBlNE30p46YFpL7TwNoEe5nfY6i
	uL9AWoypw4NplmOGNbqtioMtyOyOHAOSxSmVPtnk3wo5KMIAZnoVJF3VVynu50umU8w1zEg0dZF
	RmaiR5QDlbUgOFVgpn/FZSDTMM2YGO3fVC6ZmfdboZQeGbHP4dxqKz2BmYqo/Dg+U3+ZoFMN1Hg
	6XyDmKVRq10Rccc9hVFi5yiJMRQn/yk7fNfroP871U0k6cu5HsFH6EVWsv9z14Nv4jqBEgSi3ll
	9Ui7TxtOnCunZpJ7fx4p1GP/VfEXpsPMF+DSfShWPoDjd8p77C6iNaetsJUXcO9Asu/pSoZo0Ck
	Zdwk=
X-Received: by 2002:a05:6a21:6016:b0:3cc:9618:f51a with SMTP id adf61e73a8af0-3db0e0ea40amr13919552637.8.1789323910654;
        Sun, 13 Sep 2026 11:25:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:6016:b0:3cc:9618:f51a with SMTP id adf61e73a8af0-3db0e0ea40amr13919502637.8.1789323910173;
        Sun, 13 Sep 2026 11:25:10 -0700 (PDT)
Received: from localhost ([155.117.96.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm23050289eec.3.2026.09.13.11.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 11:25:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 02:24:58 +0800
Message-Id: <DLEEDV17BW1I.2QLKNNOLNOTGS@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <spacemit@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 00/17] drm/spacemit: add SpacemiT K3 display support
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <codykang.hk@gmail.com>, "David Airlie" <airlied@gmail.com>,
        "Simona
 Vetter" <simona@ffwll.ch>,
        "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>,
        "Maxime Ripard" <mripard@kernel.org>,
        "Thomas Zimmermann" <tzimmermann@suse.de>,
        "Rob Herring" <robh@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        "Conor Dooley"
 <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>,
        "Vinod Koul"
 <vkoul@kernel.org>,
        "Neil Armstrong" <neil.armstrong@linaro.org>,
        "Haylen
 Chu" <heylenay@4d2.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        "Paul Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
        "Yao Zi" <me@ziyao.cc>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        "Guodong
 Xu" <docular.xu@gmail.com>
X-Mailer: aerc 0.22.0.r10.g73f20125
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
In-Reply-To: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
X-Proofpoint-GUID: baYLr9eyO3Q_6rmn5y-1DL4DiMGTzIi9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI1OSBTYWx0ZWRfXyjjmMqyRV+q3
 kD6Wjp4aXwf7+AApgBiOrMkQ8zwXkkY1vscp7+s3CuUe4oAZPajQ7TYI/L12Iftu8skgAwn/65O
 wzF4Z678BGqFxBbKSoOzhMOWdpoJGFDH7+qtGXI2BJgfqEIXdeDzukq2Z2f3U2E9AijUacaAJpX
 hjdW5X0UkhVFI0ITPPJmSICl+iBNI7yCL7c294+R++h83wxWptYu61V4G6H6UywC8eoocG+p3mO
 MowxKGm/AJNeDEfM/L0CleDjOqzegDK3LIs6OBczb+lyCZZhdbOin37bw/Zx1SgWdAYAIyASYVY
 Mf1iHXJEZsCRbrNOT62LytmCbWTlQ4otAeFRTTu71iOuxdCrmoMMeZpWCg5JSCEQNSxOXiV7baN
 wMhjM+B7fpVSiRR1S8P0QI8anJ+RRxJ/WNvyzwQN7/of5MRGPYyFOgd4PZ2wsCXDWIbNb3Ygg6w
 05A5n10gJ5gfJkF3Ffw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI1OSBTYWx0ZWRfX3UdQCccVIek1
 YZAT/2xPTgqc9OCEUXKLFpyVE94Ncj/OLY94TQU0iSySTmElUzTaoVeOd6ntAWg4N4+A3m2zzGb
 B52R/1YB5hZUhApWR3G81pTls9JgWJY=
X-Proofpoint-ORIG-GUID: baYLr9eyO3Q_6rmn5y-1DL4DiMGTzIi9
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa6ea87 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ilsi1XWDFcrB9FjxRIUvHg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rqWh80hda8-QOrsfWKMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130259

On Sun Aug 9, 2026 at 9:14 PM CST, Cody Kang via B4 Relay wrote:
> This series adds display support for the SpacemiT K3 [2], a RISC-V SoC:
> a new DRM driver, a new PHY driver and three new bindings.
>
> The display path is three blocks deep:
>
>   Saturn DPU -> Innosilicon DP/eDP controller -> Innosilicon DP PHY
>
> In v2, two major improvements:
>
> - Module unload is now robust.
> - The bindings now require the controller's output port (port@1).
>
> The rest of the v2 changes please see below, with details in each patch's
> changelog.
>
> Sashiko AI review contributed total review comments: 57 items, which I
> accepted: 14 items.
>
> v2 repeated the full v1 test matrix on both boards, in built-in and
> modular configurations, plus the new module load/unload rounds.
>
> The v1 cover letter follows below, unchanged, to provide some backgroud
> (I can remove them from cover letter in next version):
>
> The Saturn DPU is SpacemiT's own display processing unit. It has a privat=
e
> address translation unit and a command-list composer that replays a batch
> of register writes when a flush is latched. It exposes one CRTC with one
> primary plane. The K3 instantiates two DPUs, one per display path.
>
> The DPU driver arrives as five staged patches to keep each one a
> reasonable size. The driver only becomes buildable with that last patch.
> Bisect safe.
>
> The DP/eDP controller and its PHY are Innosilicon IP, also two instances
> of each. An instance behaves as embedded DisplayPort or as external
> DisplayPort purely according to what its output port is wired to, so the
> bindings do not distinguish them. The PHY's registers are interleaved
> with the controller's inside one MMIO window, which is why it is
> described as a child node and shares the controller's regmap.
>
> The pixel clock is generated by the DP PHY's PLL, and the SoC's APMU
> pixel-clock mux takes that PLL as an input. Rather than let the display
> driver reach into PHY registers, the PHY registers its PLL as a clock
> provider and the APMU mux is parented to it through the clock framework.
> That is what patches 2, 4, 5 and 6 are for, and it is also what keeps the
> APMU and the DP/eDP controller out of a devicetree provider cycle.
>
> As a first posting of the K3 display subsystem, this patchset supports:
> a single primary plane per CRTC, linear RGB scanout (no plane scaling,
> rotation, YUV or writeback). It does not support DSI, DSC or DP audio,
> and link rates are capped at HBR2.
>
> Based on drm-misc-next at commit 5b9af25f2d0b ("accel/ivpu: Remove
> unnecessary min_t()/max_t() usage"), v7.2-rc2 based.
>
> Testing this series needs a SpacemiT u-boot carrying display support
> [1]. SpacemiT expects to add that support into an official u-boot
> release in August 2026.
>
> Tested on two K3 boards:
>
>   - Pico-ITX: an eDP panel and an external DisplayPort monitor.
>   - CoM260-IFX: DisplayPort only, no eDP.
>
> Note: The eDP panel DTS enablement is not part of this series; a separate
>       series will follow showing how eDP can be verified.
>
> What was run on both boards, with modetest from libdrm and with kmscube:
>
>   - modetest -s, looped over 1920x1080, 1280x720 and 3840x2160
>     on DisplayPort and 2560x1600 on eDP
>   - kmscube, on each head and on both at once
>   - hot-plug and sink swap on the DisplayPort connector

Hi Cody,

Tested the series on a K3 Pico-ITX (mainline v7.3-rc2 + these patches,
display drivers built in). On the DisplayPort output:

- modetest -s: 1920x1080 and 1280x720 OK (native 2560x1440 as well);
3840x2160 not tested: my monitor has no such mode.
- kmscube: OK.
- hot-plug: unplug/replug detected, output re-enables fine.

Tested with the stock vendor U-Boot (2022.10); DP works fine with it.

Tested-by: Ze Huang <ze.huang@oss.qualcomm.com>
