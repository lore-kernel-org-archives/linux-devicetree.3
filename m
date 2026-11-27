Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795811582;
	b=Q5cewDr6sR5TQrgsDxZ1XpDYTWRskILbtGh5Nn5umBZIS5MMtQEazBXgCaVtfWX3mOm9
	 AUVhtL8EJJ6v8BcLtiUuS1nDe7gt+3PsgFvt1oPXCaRxTtwqjBfTZk7ztN8IL8kLO4DAz
	 UcTBnmaOBxouLUuiPXE6dZYfApFFK058ql8KNIwjBR4Jz/vEn7KRI9m3z8gl0ij66yu5o
	 zzF6JoDT1DP237Y7hMbun8+23VgmgJfuqmkcjvAXOF+54wjJDMl1PyFU5G9KZslB/Vf1h
	 D6h6EAC7ovIQStLCLGqRJlCz0b6xXq+7j1C0jry713UxAKl7a0LaEOdLusw5BgUduSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811582;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Kary4tpVak749MIykKPuUJuApttRdkpkDxBb1+9hRJY=;
	b=PKrp2B/S5jf8dC/Qh59eVy/+sOqpLc6n3rbmISPN1ORd+dmaZSD6dVxxjqsU8h2nSoWl
	 fFJr3I1IXArM9jWlThWjIwR4/CW6QfPMkasCi5jOE6rzXFJaTmygd+xwIqbvyq+hZuaIb
	 K1mcs5FLBKWjlYsxPlQHgbybvEWQmtUBciSFMo1cNa0lncCa3fwZ4qfkLgwIhWbgFjGEp
	 gf7CIrhe720KU4SfIAvFkwtP7f1MrF20VZ2o1Kav7Xq+Bm/wYEPVTwjLX7fIVOtbGEybb
	 Izjq/lpnq6x26QjuqEmtfyeNIH8LRUxXb5tm0qr7k/+3a7D/BegXsnIa4DWEKxc/ruQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KhhLuoXP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FliI8wf7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB376606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 20:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB376606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KhhLuoXP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FliI8wf7
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJAs833347210
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 20:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kary4tpVak749MIykKPuUJuApttRdkpkDxBb1+9hRJY=; b=KhhLuoXPtYKJmZ1m
	ZEF2K3cefasJIk4hiewimvXxiG0by+EZ7jIxX04DKx6DzyHuvzG1doxhJJmSOf2q
	Hu+4C5gT+1hfAMIllKkZ9bUh6Xn6ptec5k0SPMBDpD8wR8VRi36Zft3xC55BiQ18
	bHIUm5U4qKAxkYIJWVwPSyyamhQF5CxJhyJTTNq5E+hn5BqxBkud0rXpksLsFV6J
	nDv4bg44cpTQv3gu/PwN0Nx24hXHgkWBdssu6Wv+Vpuug2+PHoNtAmmA/zicYbdp
	IdufUzDYLgwuexZs5NeG268OCAap3Gq8+s3yCgnc3ClS39z/T9+bGRYqoE9vIydw
	NE0ORg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhk2ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 20:33:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949b0d3232fso1148881285a.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795811580; x=1796416380; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kary4tpVak749MIykKPuUJuApttRdkpkDxBb1+9hRJY=;
        b=FliI8wf7iVRsXcYLHXN/STedPr6r/6fRQeX/olhcF6/qEsDYPMycVSRzZbNg5TQvi1
         UU4dzTP/nB5MY8vykvBWHyzj8qInFTli9daP6XpxOGCZ7Ld72LSJwU+2As5l36BuWoTF
         zfwMB1YeyMbA4xmbVOierYNF+zD5RfMOg2YfosCAZvPbY+KqJxDbwfwl8gFQjQL6L1Qo
         6p/iOQI0F1Bmr98xhcmFXnK4DDJUe1SOxu7MolbKPZFoDbEbSftMniIRb4JSJoJvsojz
         6ITf5TFlMqW2CTY7iIGE1YtO421RM3EZKsXrNiigTjcVDXaVuqLZPCnAQKP/TZpYlLpO
         LPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795811580; x=1796416380;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kary4tpVak749MIykKPuUJuApttRdkpkDxBb1+9hRJY=;
        b=RxQh0Y5DtgrL5Vz0zPXhw3QiRIAWcVCmORwgMS+boWqn+qwPdo5N/Ri6xek7ft8SKE
         1v3mC5woJ4a8bu+s/vLKjef5dYZm/Y0fdjhi1XOuWG9IGO60t0X0UpIkjpePFNZseuxh
         VIj9iK1QnKt8Hqp2rBQbR/ofbo297xlZ5zNULNS/IPaoQ/J/3U80RsKYDMH+9kAU7cj0
         /KJyXjEo3J596FX4R2UMn2ADEKNhhc2mLXStzlT7d4JJObVfnjT09Z+TpvtIUqAT5lRo
         P8jtjLkfvSGP+Hr9aU+wknTREQE5ERjemw9JbVdoe3AnNvECN2pnlbwlZcCo9GA91MvM
         Z6Tg==
X-Forwarded-Encrypted: i=1; AL+hErGlYU84GBRtWnaE+QzsBRneH8A3uA3G5QOhv7UhR8EqP2z074qNUBiGPTLMdKkU/W8s9sgAIDazZYQE@vger.kernel.org
X-Gm-Message-State: APuU4Z8AKhs0atXJcOfRaA4qFdnqVNMAxLoSP4NLQ1MO4OXfS6MfVfde
	EiIG4aguBGcslTIYvN71C7t4iozh2NhHdEDuy1tMVC9F4kRdGcgMrYJo9F5zmifYURhXSCswXBr
	vMz2MRqPTJ4TV5ecC1QMun/yOBZJH3+cFvFXhx1l4f5uwGIhKaXbMm6brxjU6/a60
X-Gm-Gg: AZFdTZd/y4oEhamkXotK56qGtWQKt92+LJiyWpgstEU1BKrlcL/dxEbCKncaHdwoW0u
	uVgRRVfcpSSMflzDY1J6OzGKLP0KFHMZyQnHAU5fNGcdHY/J69JtQYa9D0zhQQcdsLVx0kdR/BC
	luOUUyzh5Q4YR7HWdp8exgesGBl5R/faJhrcbc+THqPKp/RknRlpd2lZdtUpNzUD3MnT2dwTb5W
	lGaeCMQ6qqDvh+eWWka1tetDD38M71JcBThkvLMBqLVqDPsV+GNnJ7DrvdeIx2wgvOlU/3GGnCx
	DeOOMXKVMGJe2rpO39/xGZlwtw24geJ51e/MCyk1q2qwfRqQUPyWDW3DVVInHnsCO6qFLjUk+kg
	FY6AaInlcec/L6dzbcLS5cqbB2omtOHRnH1C7xAl7S7qCn91XqLfNw2ioudGx5w==
X-Received: by 2002:a05:620a:2a12:b0:949:7497:7c1c with SMTP id af79cd13be357-949bab5ae05mr4368927785a.60.1795811580065;
        Fri, 27 Nov 2026 12:33:00 -0800 (PST)
X-Received: by 2002:a05:620a:2a12:b0:949:7497:7c1c with SMTP id af79cd13be357-949bab5ae05mr4368922885a.60.1795811579603;
        Fri, 27 Nov 2026 12:32:59 -0800 (PST)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm803588425e9.10.2026.11.27.12.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:32:58 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: sc8280xp: add Radxa Dragon
 Q8B
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
        dragon@radxa.com, Daniele Briguglio <hello@superkali.me>
In-Reply-To: <20261029-q8b-dts-v4-3-e8e7438f5545@radxa.com>
References: <20261029-q8b-dts-v4-0-e8e7438f5545@radxa.com>
 <20261029-q8b-dts-v4-3-e8e7438f5545@radxa.com>
Date: Fri, 27 Nov 2026 20:32:48 +0000
Message-Id: <179581156894.3905807.15541615145912093878.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3018;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=Zw8CBJxBhIDNvajIi9kB0Fx30RehupBLh/bFg9twIcU=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBrCej4YHFMtAdwvfmFzZlObFpeRfGBDqrwzv0L1
 r1cfaxxLjeJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCawno+AAKCRBjTcTwaHBG
 +M0lD/9qyuAyJ9EWCklJW1SzcbV6KdpPMvLNQV6VWhRz8pQqvJZkA56ESN+sJywGWvf9De2xapz
 XDaLgv+mb383qfjVNpjEO8s27y0qQTJHfpzRSOE6eevld/3T0ho6fVY5H4dROzjzyDIdzRlbIqH
 8VkiISoP4UBDolSBwaqKYc4MNqj54IFVJKOz+UjBhumcPnViG2RJEHomj4nOZEx5LmvNILQU92h
 8i2HS9zCD4TLJMn/byvc8dv52DaR4197Gx43JBNtFGgNKFieAobvppaVnIZHU/e8cngYqBpmHla
 RMVQcofGoBecsyej9HTWidcqxfed/ZAm7N72jBYdGtPqSEcNyCXiRTFQuOYwxjPsI2fh8f2PDvx
 krfmeh1MU9wnjUzVwXuXZe2V3DAw1wm9zNr6u7b+wDvnWsUrVIhzk5ODGINcKCWiQP4uGj0qgi6
 opLFv+m4qU4eriWal5igLueVGwvqp/+Md7aSeOGVE9abeu2WB33gpwx/Qo5B9z5hOMPKp9COLd5
 1nC1ECz2tN2BMn/3WnmcVD/kBjM9GTShO86L6Az9CAkQsuVHknyBdbxmacm484Uoo4C5jY/wFxH
 aig7nEXFAPw1Hh3GJ1zN7exRukhfEv5MWybN46cZvNw4zyKU6uG5lwg84r3DFPeOs4fYHxgypLl
 nk5o4j6DoRlktmQ==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX5NLqyS1uVBJG
 9EDxZsqkU1qZH5H0hFDPi3HD5pQC4KbIlxcyBFlNDKyme3owyauCyNDFr0DN66DQKoaypk+P9qk
 U76bR1LbGdy1kaA/R//x1buGMBSobxo=
X-Proofpoint-ORIG-GUID: vX5jqX8EPMyu72-m4MYczK-Cgn5euC8U
X-Proofpoint-GUID: vX5jqX8EPMyu72-m4MYczK-Cgn5euC8U
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b09e8fd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=ksxQWNrZAAAA:8
 a=uG0LtI-mtgFhubywtQIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX+vDGyrpEMqLg
 SR4HlXDmMm0SV5TwCS1J74GCuYFGpgAgDZoDvC3k31SckcU95dUn2DPRWh7q1IJNZChUQfnkkOp
 pd8jAjPmC+GUf6uuYrmpnkjJL4N3vEBniAnxX+1ZYT4BOv0m+N9YvzHqTjdEGPRI/A15g/aD/fB
 xYOmsYpl66VzcGpW29aPr2gTLUwV61z+llo6HpLMopcsIp8N3GlHO7a8A/B2iEw3loilTA+7Sw0
 tSk2F93ed9Jc3X0fpwGbpn7mUOaJy8AdP1LXVMQP23S9MuiT8TMVbpXBMX1xMjEnYWLAaUvWCG3
 B8XC1LLqTWvkydzdkmOST3tUN0i2OZopPkCKrRoI9Kt7W9ospdaHmNIBi4noKF429UktomIrph4
 L4FLCCxhgeTglSoWkg+3GZ+vqHZ6hRXWFz3ouDz6+EeJVb+NIGBtk2514mEI6+eYgQtJ9sYFp4A
 XrVemtbaDrZC7VoC3ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270081

> Add initial device tree support for the Radxa Dragon Q8B,
> a single-board computer based on the Qualcomm Snapdragon 8cx Gen 3
> SC8280XP platform.
> 
> Describe the following hardware:
> 
> - UFS and microSD storage
> - Two M.2 M-key PCIe connectors
> - An M.2 E-key connector for Wi-Fi and Bluetooth
> - The TC9563 (QPS615) PCIe switch and its downstream topology
> - Two USB-C ports with DisplayPort alternate mode
> - USB Type-A ports
> - HDMI 2.1 output through the Chrontel CH7218A bridge
> - WCD9385 headset audio
> - GPU, video, ADSP and CDSP remote processors
> - RTC, EEPROM, thermal sensors and the 40-pin expansion header
> 
> Co-developed-by: Stephen Chen <stephen@radxa.com>
> Signed-off-by: Stephen Chen <stephen@radxa.com>
> Co-developed-by: Junhao Xie <bigfoot@radxa.com>
> Signed-off-by: Junhao Xie <bigfoot@radxa.com>
> Tested-by: Daniele Briguglio <hello@superkali.me>
> Signed-off-by: Xilin Wu <sophon@radxa.com>
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 88230c4e00ea9..cab70c36e420b 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -335,6 +335,8 @@ sc8280xp-microsoft-arcata-el2-dtbs	:= sc8280xp-microsoft-arcata.dtb sc8280xp-el2
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-microsoft-arcata.dtb sc8280xp-microsoft-arcata-el2.dtb
>  sc8280xp-microsoft-blackrock-el2-dtbs	:= sc8280xp-microsoft-blackrock.dtb sc8280xp-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-microsoft-blackrock.dtb sc8280xp-microsoft-blackrock-el2.dtb
> +sc8280xp-radxa-dragon-q8b-el2-dtbs	:= sc8280xp-radxa-dragon-q8b.dtb sc8280xp-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-radxa-dragon-q8b.dtb sc8280xp-radxa-dragon-q8b-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sda660-inforce-ifc6560.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm450-lenovo-tbx605f.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm450-motorola-ali.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-radxa-dragon-q8b.dts b/arch/arm64/boot/dts/qcom/sc8280xp-radxa-dragon-q8b.dts
> new file mode 100644
> index 0000000000000..e0fae337ab667
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-radxa-dragon-q8b.dts
> @@ -0,0 +1,2053 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2026 Radxa Computer (Shenzhen) Co., Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "sc8280xp.dtsi"
> +#include "sc8280xp-pmics.dtsi"
> +
> +/delete-node/ &pil_video_mem;
> +/delete-node/ &pil_nsp1_mem;
> +/delete-node/ &remoteproc_nsp1;
> +
> +/ {
> +	model = "Radxa Dragon Q8B";
> +	compatible = "radxa,dragon-q8b", "qcom,sc8280xp";
> +	chassis-type = "embedded";
> +
> +	aliases {
> +		serial0 = &uart17;
> +		serial1 = &uart2;
> +	};

It would be good to include stdout-path so that userspace knows the
default serial console.

-- 
Christopher Obbard

