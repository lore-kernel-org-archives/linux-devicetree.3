Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190909;
	b=XBesvcEFokhv3xjzZJlpXKxNLEs0TxMunBo2dath86wfds+nDvKLSx2NA4i011lkW5zM
	 eCV/YzwUnAqaRZPwD3ojUvGJLAk6QuSCIHvMiGIi4RnoztvwZA7aoqNnigcdKVVITRQWD
	 CpRvRZvqUnzVPAI7J5nPd2iAEBlMC90e4+vU8IaEPuKW/1wcx7Y6vPF4wNvhnyhasUKNj
	 shh4CVg75XwZ4DjBb/EuIdE/+HUDBwTq83RuHsrRG+c0RXEojMZmOFebtWGZpbtL2gYQ0
	 eiNxaxyGh/ciAfah+u7w0/QqFgHkXWlz9UyKNR/NBTR0I49a7/AJEEQGk89vFVx0OWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FWMtzSvdd8NrJA4whQuRX82CTRfD/nN3EiWL1j0NOgQ=;
	b=Xctql9WWtSeIEe7XhTsLIfhMJxwKwtCv2XGdrKCj73MavZKFYMhq5tkQ+3l5tJC8dcvy
	 yGmbxH9wsJzVDfbEdJezGqTbwUI+W9dyBRO8/lUFDfdr37lMqPB3EH8CsV+Z8Jpeb/71E
	 idUVs8TiRsR03uH5odypMIeUN61aJ05Km/vGXPbGpYZZwK79scl4Jnx8v9K76PSfXfNm6
	 MXOIKeFtDSH4m8AJowTed3wB207gghd24PBJgF+FJbfW0fVnAb/GjWYnwzmrro7ezSXd2
	 SKdfg62gm6ycSDy4uwH2kOV95HQqq65xvPiH7zCPe5mRFwTXWioikZhn0o/lhL7ZNiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bwc1LhZH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A0wFTqm7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB7B606A31F
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FB7B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bwc1LhZH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A0wFTqm7
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2n91538933
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FWMtzSvdd8NrJA4whQuRX82CTRfD/nN3EiWL1j0NOgQ=; b=bwc1LhZH42cw8Pod
	f/hrDrg+ZPh576kYlnJOIdh97mX4G4bjwj1+8t2nJa0bJFPHwwktQwrXoVznJ1Y2
	UtDYYgnyHtyHuUTUZkLD6jgObTrvyXW0EIJUOH6No8DGWQCfNVTRJ0cMTiXzI4mO
	HnVdUtPsR4a6VxwoxdxAfue/CRlki3JB7LS7JuzgTWrqTeXeBdPKb5ScD0lfuIfb
	DTL70WnpTvnkFmsWm18U2UNqhKGrs+FIIv6yJz9kHLz5Ds4kmA8WE1feLy7rIyKN
	R9Oc7nME1izXfF8JSXcROZ3MGPQCH3vhI0Lj9mUpfqpNkrxciMOlWy5Z6dilZGVP
	hahW8Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7rw00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:35:08 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eaab6f56c7so66691e0c.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190907; x=1793795707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FWMtzSvdd8NrJA4whQuRX82CTRfD/nN3EiWL1j0NOgQ=;
        b=A0wFTqm7P6zGBoFvzCF3hlZibrIFa0JqTR4RAxVIUnpsBOADslurzJzCXSKgHvhS1f
         bODpYknziYOKgwiF5KVYvVGeutkeJyM1kNyc/kzy57qXguGR69kFOgeEp9xsgz4e189H
         s0C6CfJcDnq2scQKMS+nqC0/RmKnzUuxS9p2awiWg+cjfuWPdxA5VTSq4jcKZ1c3rPig
         haHg9vQemkno6bcAsqedYLKw6+52bQ5oO1QdZvfqS9PqNpQojqv1fjLoDumKmQTWkJYS
         mMhuBzzYn/x9eI0/iYM8aSJciAiGfRyswfEKAScDEvTgoMXU5dZYKDtTULUyTuRDwApL
         aBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190907; x=1793795707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FWMtzSvdd8NrJA4whQuRX82CTRfD/nN3EiWL1j0NOgQ=;
        b=T8Ri1x5DXjaB/uIwbqxob7m9b5grRE6Ux4YatzA8515UXysFVInZvSPsHh9KHxEzgv
         HJaoZQsVQ37n4LXY/x3xcAHemB3wCu94SEXBk8f8reHvAYwXlMiC1arPLusLg4ekhhhs
         6K9/fefN2ezOWdC+OPAGE1ZckWfw/w4RCnTdxnAbZ8O3RxYt0UDNaT1nqCf4Hr4AF/ru
         IFF49ZpYhLW6MYGZAaUJIAO73UEizTJQ59aVYIgCW6MfWYsqKflaEOhsSFrbGEG4lkaM
         lEUoVkw4db/3TfDY/WhYY6+MMIMrr9LTIc7FM8bbuHCZSkX5SNuQk2MoXPAXrz1fI1Aw
         Pd8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzJKqRQeuEx03KHx4w+agISEhavciSDOkQ50pnG7ziQg3S9qHEKDEdvGLIjAe2sLt8KSIJVML2D8ErZ@vger.kernel.org
X-Gm-Message-State: AFq9FYJcuTRgVCU7xqrrGwLI8KizRtatfZDCoKH51ZjGM5exBhFepxA4
	gx6TVk5fqznQqIhbLN87dXvQsYaue6XVUm8ZhasH87UG2ItVlCndK3Cs/xtozQd20M9NrncmFc4
	x6U3iDV8MCZh+AFOmPudMwnVKO0Zt7uRXzoQtcXilSuUlqK4H4/ui7CJ3ZtcB1KiY
X-Gm-Gg: AYBFou2iOVVDGxXgolPd+pgB4n1R4qK5laUQ+DuGO7N5nTwVKYjmS1yjtnj++mviRq3
	8ilc91lCH5Iu8gidIsZ8GzXkTU/flpjzE6UxPBGAjabOKMSeroJKNEjoYYyIOG/sqQUzE4hIZvS
	YAzZgR+79KdlpGBjh/tAItGk7cXfOXJwth2ZaQTyJY3biTGrN5cISMwIhO+4tNnHioWOye72q6h
	BY7h1o9ENYiO1d5jGC0tw8at6wErGOdBFCEekW1aFoZd1kXsGkd29yOVg28n4cKn1VrsephCW/o
	mg5Zx0SgjrearC09S5oPx8X3RykChY51QLmk0l0IvxUBe2VUp3MqQc/1n1EjNHG2JvfYdHK6LY5
	eGkwNkZJfZS614ZMN9wuIZXGejmz5GZiAo3GpyiZP3p3tO144c091Hcl/+9m4EiRUhWpdR+A=
X-Received: by 2002:a05:6122:4a51:20b0:5ea:a8cc:e6fa with SMTP id 71dfb90a1353d-5ec4cc4da04mr663972e0c.4.1793190907325;
        Wed, 28 Oct 2026 05:35:07 -0700 (PDT)
X-Received: by 2002:a05:6122:4a51:20b0:5ea:a8cc:e6fa with SMTP id 71dfb90a1353d-5ec4cc4da04mr663963e0c.4.1793190906915;
        Wed, 28 Oct 2026 05:35:06 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd649f69sm594674166b.43.2026.10.28.05.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:35:06 -0700 (PDT)
Message-ID: <132b9b95-6788-4147-9b0e-3b31af80a60b@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:35:04 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add Xiaomi Poco M3
To: Amir Hanip <killdeath104@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261027205146.16384-1-killdeath104@gmail.com>
 <20261027205146.16384-3-killdeath104@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027205146.16384-3-killdeath104@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae1ebfc cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=jaAT0nVXb5hwA9ITj8wA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: YtCCoxUfZO__lnFnQnQgubr-FWFbEi2T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfXxc1NG8jeTHxp
 0F+dsKVSwQ0Hy2/TEfgxir7BRpgwlWcBSuylE+1LijzQ6YUv2iHKXC7qxbpyE1w/hVBqJ1OPqW5
 lUYGUaRFIFApyWSbGcx9Q9CtmAgNMqY=
X-Proofpoint-ORIG-GUID: YtCCoxUfZO__lnFnQnQgubr-FWFbEi2T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX73d/nPL0H8rJ
 L/N1DH8fSPip5EeuT1xr6JXJ0StXJseoY0jGK/1nw/sC6YtnxifSpqX3vP/LMthjyx91cyolky8
 VCFl5Us7iP/QHJogwOiASup3GuO9wrkuSbO8mHXrendIMgrKisah0b2kVnPMbu3t/u2/QXUNmyc
 /i/xJvAhcB6f/VauaZqT5Q6+/OU7058A0PFFAvkWb93ugerE8mljDttep6t5swBSglAzGyUrbSU
 0BYoP8qNBBgbYxsBK/4LO6fE+g/o41/A9iTBIDrqBGE+w7+poX6IS2Vy7BU+7ycAh6ahT5ut9Mx
 ApucyUYaQX7h9QJwm1bACBQeBRl78AEXGLWZc7tRpN83QqHmMUIz7nnocAzAAKG6YpOTahTcfV8
 MaWY9nwJR15PskKjPrL9CDF7hIDMHELjImfN2kzCaM7L4A/pidU6Svcp89JBTGRA6lu98ssOg5k
 kj/g44gtifMY53Ph7XQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280050

On 10/27/26 9:51 PM, Amir Hanip wrote:
> Add initial device tree for the Xiaomi Poco M3 (codename citrus),
> based on the Qualcomm Snapdragon 662 (SM6115) SoC.
> 
> Currently working:
> - UFS and microSD
> - USB host (OTG)
> - WiFi
> - Bluetooth
> - Remoteprocs (ADSP, CDSP and modem)
> 
> WiFi, Bluetooth and the remoteprocs need device-specific firmware,
> which is not part of this series. WiFi additionally needs qrtr,
> tqftpserv and rmtfs running in userspace, and the Bluetooth
> controller needs its BD address set from userspace.
> 
> Display panel, touchscreen, and the GPU display pipeline will
> be added later, so the display is currently only available through
> simple-framebuffer.
> 
> Signed-off-by: Amir Hanip <killdeath104@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
