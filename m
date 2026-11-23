Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445971;
	b=m/rW5zGzyY4wzdg7iyig1Kqwdql2uQOhfvfZxdZ4EeSk6gHZn6T0LW0Qt2Owcjp5d/wI
	 pYqk0B5s/v5jgPYZgSBROHaBU32UXdzcvcsrf163ixwbRFGyTWPRsi6E+tmh6qxEA4iDo
	 DWY5FsB4QuKZUbcc+eqxbWyMFwPWkZweE67fveZsPLc66WpDzYrL5wEZUHgqALiEn7SiK
	 1vr0UmZeafjAEO0elLo5BwY1aIBv58HeT6QUysh6rp3hYyKRsCwqI98gZMjIdlnkIDejO
	 A84uTc9hZeNlM/giluLqvvss6FIIs7dNtjzUyJyjDlzoqD/wQ6pFPmIwT4ylYBh0Ywg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445971;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OZmoovvVA2nrKok0A8vpMJeVio+JChI+meHoWVKGIyo=;
	b=tabNsx56fyoRQtWYqhKUCn16FQrUvl6xJu6x8YeUdO5YL3VGU7HU5JdojvaVk3KVSYqk
	 HwnJcBPtayqCLOFYHFV236QA9BfxKWs3PKbFX+G3iJ2XdI+oAqVBnCEJJjVUPz4vKwZa+
	 L/VOqyv1xTWyE/RmDPnSWDqcQ9SSzxvqiGUaT6JYzUyTlYn2NyFNL3Pf0eoVHieRG7erQ
	 /6RGpvkOvz+5qNPNuxTFDq9c59/DC/zUhd2j8aFOOWpHVVvVYV+m96KoYqcQ5QGZv9Whs
	 RsUwHQb5QYw1t4U0qPBxgYnpU2XcsxSd1PJFk7AoY8w8YXiAxTt35wkPthf0L5V4FfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JFYq535C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cl9Bopec;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B3E606A6A4
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70B3E606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JFYq535C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cl9Bopec
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLFge4030412
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OZmoovvVA2nrKok0A8vpMJeVio+JChI+meHoWVKGIyo=; b=JFYq535CzhgqT6mA
	o8W5fOZNTh+Df+/7wEFvDoFAEuEQfgrOA3LPa1JQAFs33Ncb5vdMFmyqKJvk2+86
	h2rO6ojSm/2Fg5IiX9JU472VKCYdGPnVsrzHHKLOzOsEpMKhbsis4jMw+iRIwWQl
	925Zq6z5hJitR+W3iGbk90GhXKA+G4RxDJ1/8Vlp8ubtM+fG9kQf8W3Pm8hDtOMO
	Z3zLt8emIq2Xi3uvL7vPa/m+QYdiqtW2JXwr6oWhiwC+cuQqgDVZEnO+5j10X4CW
	piKMCLzkl0E7N4Pmp41WnXeQOnscp4BNp2kGfY3oX9UWNB3UWtc7w9E5uFOktY7x
	mqApkQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsj4qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:59:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so2580063b3a.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795445968; x=1796050768; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OZmoovvVA2nrKok0A8vpMJeVio+JChI+meHoWVKGIyo=;
        b=Cl9BopecwziY2d4d7JVYUVexL1HDWrKOeshcFzJ7yPlH5tPiUUBdhClCs4fKMtqU1F
         heM3Xbv/0k+dm57pEsqkAjyzNrvOkx2lEeYIq+kazCrVUdzKfpknMzTxGK73J0dmh7Rb
         C4O/RHttCAja1yTGgLh5N3bZPKZIuIhmmxdjVMH0jUzrR/MylUAtBt/F3rqxUNq8zJEr
         taZyA/M6Mb2wDw5VQXZ4qaV8h71LL5dJm66LwrSN0VDdTWBENG+VbWGnaLJO6OCY0tLo
         M50a1RDq7bDlz/bLh1VLrQeOys9gE9jHLw1TwpaM+ehXnavUQsIbQ9Z2uyQCTbtK8v8d
         Ntzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445968; x=1796050768;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZmoovvVA2nrKok0A8vpMJeVio+JChI+meHoWVKGIyo=;
        b=rcySL/ytZX7h0hLLlnoTwe3MKmTO2hqwqLw6KzIizgW4tpebqqK0UxDKFncsIxQ9tI
         Kdxo4VEk3wqPSoFLgtUb3u0qk0kRtxQLtpvfKNwhNmmkWYv5HTGVzJ76vQIcjDf1Kinq
         DOM3gLjqSfWS/A7HhD9vYj05GyYYMpCcv9Ht/Zu26c8B9ue/em1AXVgVoY5hiI+F4qy1
         s2DIrTvT4YAP/auL0PR3bGvoxUG8ZNCHKd32Lgcr0thPwee1F1pgQNi5O+0AC9C1RO1R
         kMnRtEI3tI/0ry3SOFBLE0T/au0/UAxEpVo9qSUNYfsVkr8whu7OysyyorvxTL1cV54c
         NerQ==
X-Forwarded-Encrypted: i=1; AL+hErH+D8pUAwoFpzLfpHa+1u8tyKBkuGjriqZc/txcGoPDXg9aKe1SUGzITktpwLLenzpjDafiCginAQY2@vger.kernel.org
X-Gm-Message-State: APuU4Z+8hIdWyDNxDTc+K5s/JxHMcXrJ4NttiXwt/s5lZcdRPwsUJX9Q
	JyJ+9bc8edKPQ4STUOS+uLudWZXLqWDVoq5dqjYcRfGAQn7W2gYgSQiMf+ezBu9XS9Q044w010J
	raQQLKCJUYas0sq1dndII/ZPE5oKFkiGlI8u0ui6WLK2warJXj/waR4W4Hh6j18+o
X-Gm-Gg: AZFdTZfSee8nr49ZI+jz9sUDTD+naguxioLvso3iHt7KrtbrgAMVGPkzzWr1/r6Utlg
	oCHzE+z0/WKCJjVt5ICzIcfrai5SWSTEbYVydCPv+C5+MefFzyPZ4tlYzJyeA2h8E5ma7JTiP3V
	C4FUEteyZG1zBvCvMib6TVbVHJW5OdxPlhAbHb4TnDcjX0KePYB3NkidGDL167S8o2Jo6Q+Rf1+
	Gl84S1Ryh51xh9BwcWgkKrLTwYIEYTcbHy3ZVRZ0k9dctZLon04ngEXEGLxK7909tqD3IIZfO9I
	92t5xpRYCdVJ4dbcw5XF2Sqg7KoMO2S5RuX8ZgENi4p6rBCYhewF+gILrHvGOtUC0oj5aFiuYzr
	tK40k7qn0UFhf8ZIHKZGJe/3ZLxVDMy/q9TLoyl2Ntw12drfaJqXaTQ==
X-Received: by 2002:a05:6a21:3b90:b0:3eb:3b69:77b1 with SMTP id adf61e73a8af0-4014db62872mr12165019637.46.1795445967779;
        Mon, 23 Nov 2026 06:59:27 -0800 (PST)
X-Received: by 2002:a05:6a21:3b90:b0:3eb:3b69:77b1 with SMTP id adf61e73a8af0-4014db62872mr12164949637.46.1795445967004;
        Mon, 23 Nov 2026 06:59:27 -0800 (PST)
Received: from localhost ([188.253.117.185])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea7c38sm5545137a12.2.2026.11.23.06.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:59:26 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 22:59:10 +0800
Message-Id: <DN2OGZ2JLHQ1.3PK0UZ3K1VYKF@oss.qualcomm.com>
Cc: "Cody Kang" <codykang@vsit.ai>, <dri-devel@lists.freedesktop.org>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3 00/17] drm/spacemit: add SpacemiT K3 display support
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
        "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>,
        "Vinod Koul" <vkoul@kernel.org>,
        "Neil
 Armstrong" <neil.armstrong@linaro.org>,
        "Manivannan Sadhasivam"
 <mani@kernel.org>,
        "Haylen Chu" <heylenay@4d2.org>,
        "Michael Turquette"
 <mturquette@baylibre.com>,
        "Stephen Boyd" <sboyd@kernel.org>,
        "Brian
 Masney" <bmasney+clk@redhat.com>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        "Paul Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
        "Yao Zi" <me@ziyao.cc>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>,
        "Guodong Xu" <docular.xu@gmail.com>, "Icenowy Zheng" <uwu@icenowy.me>,
        "Jerome Brunet"
 <jbrunet+clk@baylibre.com>,
        "Sarah Emery" <sarah.emery@canonical.com>,
        "Ze
 Huang" <ze.huang@oss.qualcomm.com>,
        "Dmitry Baryshkov" <lumag@kernel.org>
X-Mailer: aerc 0.22.0.r49.g9313f0f0
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
In-Reply-To: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b0454d1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=RQ3dwY0XcLBFaqRX7rIGyg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=lv0vYI88AAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=danhDmx_AAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=E54iUL8AAfIq5j3bQbgA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=9qqun4PRrEabIEPCFt1_:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: Go0Eu0snzmPN6gtB3UQfcv1vs1TTcU6m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1OSBTYWx0ZWRfX3x/+DC9RcYX1
 +0y362GoIfCb5JhPMaw/mqeNGOuKpZiV7H8q1WcSXBTFzryFu8jH0pkaHIVZ8VkPHhmW1Fz2VUJ
 HsPXe9cYfTby1SBxsrid4D2hlv5rFsJLv/2ycnFM8hxsRk1Zm37yL6MFeDp4mmI9dTtLUt/3Iws
 F22Hr3fsV+6mgUJg4dE8JrUM63iNhkI+IOABqm1Y4WAvzedRst5J10pxqjBS714FAnMx2ty5Wk9
 y89lnTGYe73hGT3I1/l0UNLew0FOSdJnDchdju+1E8K8PP61ybeOvD3A4jTQyLMLQTUdaIAN2al
 An4G6EisKv7MF5/8drao9kmJ+k6M22Sjwloqg1IrjwTP/VmIVkurheX+DDQJnH9x0keIXu3oxsz
 A6lF3yijbMsvZdgY9xmbOzQId9SyQeJRbPePB+5GorVpTlPOzXZUfkaIMNYzsR0vE8yUX3qCTu/
 ml9aa+ACCu2JwF6v8/w==
X-Proofpoint-GUID: Go0Eu0snzmPN6gtB3UQfcv1vs1TTcU6m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1OSBTYWx0ZWRfXzG8YzPJGrXzI
 RfGHnWQ4I9ZnSjwRhZpB2UcI94zyjp+81Mxb0hrfExapaKfO7LAl3E0QzI8ZApBF29CzEk7nu/Z
 hjXS57CsGrqQp+0+gpbydv7+06/+pV4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230059

On Sat Nov 21, 2026 at 3:40 PM CST, Cody Kang via B4 Relay wrote:
> This series adds display support for the SpacemiT K3 [2], a RISC-V SoC:
> a new DRM driver, a new PHY driver and three new bindings.
>
> The display path is three blocks deep:
>
>   Saturn DPU -> Innosilicon DP/eDP controller -> Innosilicon DP PHY
>
> New readers will find an introduction to this hardware in the v2 cover
> letter [3].
>
> In v3, two major changes, thanks to Thomas Zimmermann for the review
> that led to these:
>
> - The DPU driver lost its internal layers: the callback tables, the
>   tracepoints and the command-list grouping are gone.
> - Page-flip events go through the vblank machinery, and the DPU is
>   powered through runtime PM.
>
> The rest of the v3 changes please see below, with details in each patch's
> changelog.
>
> v2 ships in the Ubuntu 26.10 RISC-V kernel [4]. Thanks to Sarah Emery
> for two fixes found there.
>
> Thanks to Ze Huang for testing v2 on the K3 Pico-ITX. The Tested-by is
> not carried, because the DRM driver changed too much in v3.
>
> Ze, Sarah: if you have time to run v3, a retest would be very welcome.

Thanks for v3. I tested the series based on v7.4-rc1 on the K3 Pico-ITX
with an external DisplayPort monitor.

Modesetting and page flipping with modetest work at 1920x1080@144Hz,
and kmscube renders correctly using Mesa softpipe.

Tested-by: Ze Huang <ze.huang@oss.qualcomm.com>

>
> Sashiko AI review contributed total review comments: 51 items, which I
> accepted: 19 items.
>
> v3 repeated the full v1 test matrix on both boards, in built-in and
> modular configurations, with the module load/unload rounds of v2, plus
> page-flip and DPMS rounds and unloading the modules while a client is
> running.
>
> About the series:
>
> The DPU driver arrives as five staged patches (7 to 11) to keep each one
> a reasonable size. It becomes buildable with patch 11. Bisect safe.
>
> This series supports a single primary plane per CRTC and linear RGB
> scanout (no plane scaling, rotation, YUV or writeback). It does not
> support DSI, DSC or DP audio, and link rates are capped at HBR2.
>
> Based on v7.4-rc1.
>
> Testing this series needs a SpacemiT u-boot carrying display support:
> the branch at [1], or a later official release.
>
> Tested on two K3 boards:
>
>   - Pico-ITX: an eDP panel and an external DisplayPort monitor.
>   - CoM260-IFX: DisplayPort only, no eDP.
>
> Note: The eDP panel DTS enablement is not part of this series; a separate
>       series will follow showing how eDP can be verified.
>
> [1] https://github.com/spacemit-com/uboot-for-k3-display-verify/tree/k3-b=
r-v1.0.y
> [2] https://www.spacemit.com/community/document/info?lang=3Den&nodepath=
=3Dhardware/key_stone/k3
> [3] https://lore.kernel.org/r/20260809-k3-display-v2-0-327d7910bf71@gmail=
.com
> [4] https://launchpad.net/ubuntu/+source/linux-riscv/7.2.0-5.5.2
>
> Changes in v3:
> - drop the tracepoints, the hardware callback tables and the
>   constant-fill path; the Saturn register code is called directly
>   (Thomas Zimmermann)
> - one command list per channel, allocated once and submitted by its
>   owner; the grouping, sorting and chaining of lists is gone (Thomas
>   Zimmermann)
> - deliver the commit's event through the vblank machinery, armed from
>   the CFG_RDY interrupt (Thomas Zimmermann)
> - power the DPU through runtime PM, and stop the boot loader's pipeline
>   at probe instead of at the first modeset (Thomas Zimmermann)
> - add prepare_fb: the display MMU table is built once per GEM object
>   and the buffer's fences are waited for (Thomas Zimmermann)
> - program the plane from the clipped rectangles, and size its line
>   buffer in atomic_check (Thomas Zimmermann)
> - wrap only the hardware access in drm_dev_enter() (Thomas Zimmermann);
>   release the drm_device when the aggregate unbinds
> - map scanout buffers write-combining; fail AUX transfers fast when HPD
>   is low (Sarah Emery)
> - reject modes above 3840x2160, and bound framebuffers by what the RDMA
>   registers can address (Icenowy Zheng)
> - let the panel supply the modes on eDP (Guodong Xu)
> - leave the DPU's pixel clock at the rate it has; on DP and eDP the PHY
>   PLL is the pixel clock (Guodong Xu)
> - do not advertise a gamma table (Guodong Xu)
> - DT: order the display nodes by unit address; the Pico-ITX message
>   names the Type-C receptacle's DP alternate mode (Icenowy Zheng)
> - clk: the commit message names the binding that documents the two
>   clock inputs (Jerome Brunet)
> - MAINTAINERS: add Guodong Xu as maintainer; list Cody Kang with the
>   vsit.ai address
> - rebased onto v7.4-rc1: atomic_create_state replaces .reset
> - commit messages of patches 5, 7, 8, 9, 11, 12, 14 and 16 reworded
> - picked up Rob Herring's Reviewed-by on patch 4
> - Link to v2: https://patch.msgid.link/20260809-k3-display-v2-0-327d7910b=
f71@gmail.com
>
> Changes in v2:
> - unbind: keep the online IRQ alive until the teardown commits have
>   drained; module unload no longer rides two watchdog timeouts
> - bridge teardown on devres: reset via
>   devm_reset_control_get_exclusive_deasserted(), pxclk disable as a
>   devm action ordered against the PHY child (Philipp Zabel, Yao Zi)
> - all five DPU reset lines behind one reset_control_bulk_* pair
>   (Philipp Zabel, Guodong Xu)
> - bindings: port@1 is now required; the CoM260 board describes its DP
>   receptacle with a dp-connector node; redundant minItems dropped
>   (Rob Herring)
> - possible_crtcs derived from the input endpoint only
> - EDID reads through the AUX I2C adapter; write-1-to-clear interrupt
>   acks by plain write; assorted dead code dropped
> - picked up Rob Herring's Reviewed-by on patches 1-3
> - Link to v1: https://lore.kernel.org/r/20260725-k3-display-v1-0-6de34d80=
e86c@gmail.com
>
> Signed-off-by: Cody Kang <codykang@vsit.ai>
> ---
> Cody Kang (17):
>       dt-bindings: display: spacemit: add K3 Saturn DPU controller
>       dt-bindings: phy: add SpacemiT K3 Innosilicon DP PHY
>       dt-bindings: display: spacemit: add K3 Innosilicon DP/eDP controlle=
r
>       dt-bindings: soc: spacemit: allow eDP/DP PHY PLL pixel clocks on K3=
 APMU
>       phy: spacemit: add Innosilicon DP TX PHY driver
>       clk: spacemit: k3: parent eDP/DP pixel clock to the PHY PLL
>       drm/spacemit: add Saturn DPU register model
>       drm/spacemit: add Saturn DPU core types, cmdlist and display MMU
>       drm/spacemit: add Saturn DPU hardware backend
>       drm/spacemit: add Saturn DPU KMS pipeline
>       drm/spacemit: add Saturn DPU DRM device driver
>       drm/spacemit: add Innosilicon DP/eDP controller bridge driver
>       MAINTAINERS: add SpacemiT K3 display driver entry
>       riscv: dts: spacemit: k3: add display nodes
>       riscv: dts: spacemit: k3-pico-itx: enable the DisplayPort output
>       riscv: dts: spacemit: k3-com260-ifx: enable the DisplayPort output
>       riscv: defconfig: spacemit: k3: enable display driver
>
>  .../display/spacemit/spacemit,k3-inno-dp.yaml      |  141 ++
>  .../display/spacemit/spacemit,k3-saturn-dpu.yaml   |  132 ++
>  .../bindings/phy/spacemit,k3-inno-dp-phy.yaml      |   48 +
>  .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |   21 +-
>  MAINTAINERS                                        |   11 +
>  arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts     |   27 +
>  arch/riscv/boot/dts/spacemit/k3-display.dtsi       |  166 ++
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       |   11 +
>  arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi       |   22 +
>  arch/riscv/configs/defconfig                       |    2 +
>  drivers/clk/spacemit/ccu-k3.c                      |    4 +-
>  drivers/gpu/drm/Kconfig                            |    1 +
>  drivers/gpu/drm/Makefile                           |    1 +
>  drivers/gpu/drm/spacemit/Kconfig                   |   37 +
>  drivers/gpu/drm/spacemit/Makefile                  |   15 +
>  drivers/gpu/drm/spacemit/dpu/dpu_saturn.c          |  353 ++++
>  drivers/gpu/drm/spacemit/dpu/dpu_saturn.h          |   36 +
>  drivers/gpu/drm/spacemit/dpu/dpu_saturn_hee.c      |  670 ++++++
>  drivers/gpu/drm/spacemit/dpu/saturn_fbcmem.c       |   66 +
>  drivers/gpu/drm/spacemit/dpu/saturn_fbcmem.h       |   16 +
>  drivers/gpu/drm/spacemit/dpu/saturn_regs/dpu_int.h |   25 +
>  drivers/gpu/drm/spacemit/dpu/saturn_regs/ops_hee.h |   47 +
>  .../gpu/drm/spacemit/dpu/saturn_regs/reg_map_hee.h |   65 +
>  .../drm/spacemit/dpu/saturn_regs/saturn_fields.h   |  312 +++
>  drivers/gpu/drm/spacemit/spacemit_cmdlist.c        |  198 ++
>  drivers/gpu/drm/spacemit/spacemit_cmdlist.h        |  133 ++
>  drivers/gpu/drm/spacemit/spacemit_crtc.c           |  589 ++++++
>  drivers/gpu/drm/spacemit/spacemit_crtc.h           |  133 ++
>  drivers/gpu/drm/spacemit/spacemit_dmmu.c           |  119 ++
>  drivers/gpu/drm/spacemit/spacemit_dmmu.h           |   80 +
>  drivers/gpu/drm/spacemit/spacemit_dpu_ids.h        |   26 +
>  drivers/gpu/drm/spacemit/spacemit_dpu_reg.h        |   99 +
>  drivers/gpu/drm/spacemit/spacemit_drm.c            |  204 ++
>  drivers/gpu/drm/spacemit/spacemit_drm.h            |   62 +
>  drivers/gpu/drm/spacemit/spacemit_inno_dp.c        | 2186 ++++++++++++++=
++++++
>  drivers/gpu/drm/spacemit/spacemit_inno_dp.h        |  328 +++
>  drivers/gpu/drm/spacemit/spacemit_planes.c         |  332 +++
>  drivers/phy/spacemit/Kconfig                       |   13 +
>  drivers/phy/spacemit/Makefile                      |    1 +
>  drivers/phy/spacemit/phy-k3-inno-dp.c              |  951 +++++++++
>  40 files changed, 7680 insertions(+), 3 deletions(-)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20260713-k3-display-e8ffed67e936
>
> Best regards,
> -- =20
> Cody Kang <codykang.hk@gmail.com>


