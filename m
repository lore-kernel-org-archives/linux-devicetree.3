Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795811580;
	b=CNo4L0JivjQ3vABmieFC3V/rzStYe6+TXiMKysO892oNz27VuA1FvKp52A1NpFB8AKNW
	 Z6fnvP+22xkTtMrtSAQs3VrHeVtqsS/Cod2sS6m3UGx0Bq60UymmSSECp3TqLgCKJaEmL
	 Q4fvQTokZHyFYZvcG82+DQqM8yNuF2vW8iB3uYCXHzrUnJQkFpxs33QobtDdIBuNEUky7
	 kCLdi/VE2MRmpWo1FL8/WU/0IfRZdf5VTa0/CxYhisVZEz0/tUJnkYoW+vQPap/wKpUWT
	 CdT7iBk2YSe7pBhC/J/Q5yD8ZoUVZoW+DsH/P+6nKETie2LZOgo5pDTe1vXmNKXG9kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811580;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RdbGxG6smopZOWzLypq/6hlFg6tVOfBxaUqDNkzkyXk=;
	b=Ivc0aqg+HBC/ib5+J7QU38FhC3BxbIxX0mJsW8OQrtagT4msOtxnJ7YCq95KA9js8EOm
	 RExssZMs51H/RnUnlfrm7B7vHrK/kYgmUi4ycstmcjwIZ8hbWHjwLSF0kYW2hmoqvjHaq
	 uxoIPLzq3CRT2Fj6EeXBIJhTULrOM7zmaKhXPVnMTYi6GdbH7neSApVrMS/17DZvuzL6y
	 2Co3FyCqLJfv9kwjIT8lZtxGzbpH8q/bkf7+mtOwqQQeQAWYiK0vImPrmsaCPJy+4T12+
	 gOmjFe3SVn8ezgDZi9l+KryGcmgJx5p95AkGExzYDP15MZo5LdwnX2vOJtcFNnpFH2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=opzmeyBk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g48J9c+Y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BE6606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 20:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8BE6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=opzmeyBk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g48J9c+Y
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJRaVa1381587
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 20:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RdbGxG6smopZOWzLypq/6hlFg6tVOfBxaUqDNkzkyXk=; b=opzmeyBkNRaTl6Ip
	vhb8AXh7xDbxZjFujumTPew5ZdjDSgWczgXMZ6P/fkbwsBRocrkAhbRbLFw93LWc
	ZQc6dtb2704fOdLQM1IlRnNk6FQhg2OY6y1UP3hA1iKTvAQ6UCd3kbhBAbBcqoHJ
	Oke2YxFTSXrc2zlgBFk1kB8FDPnY1V3aWxF0soS6meoxuEO8sVVqDq2nhoW/Xwkw
	q30c6AuR7CHjzt7YG28ioP3EKAL8zbNsjN7iYVj1BRU8Rm5RXQFkCfWSA758f3Uu
	Zrn18arN+XsUwkTjKn5bFU2BoZIknSL4PFql3w3IecpHTa7NCG5nv4mbjzuw4JFf
	pQzFQQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7g1s84cf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 20:32:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949b0d3232fso1148876785a.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795811578; x=1796416378; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RdbGxG6smopZOWzLypq/6hlFg6tVOfBxaUqDNkzkyXk=;
        b=g48J9c+YPaNCituTlhvAkTROtSCEsbUmU3xgh5hsBHy0DncpUX+l3cfbBmIvIVCps6
         iZZHceaBKmAwuCWS5UPyPtBF9sE4ZpiC9HDM1JXl8frU/x3yKLub1d+NF8nV8cXm/XkD
         eskW/Fx4FmCzBBts7EvK1aaB34vxGeaJphnnTsKTRGWi5fvHjixt7WVL6cNEwD7m3BMP
         vPQLlOkfYaNiF6SdLR8MdDMlzGTR2fKajx2+t1qRpS0g6vAxPL8n6PhaXbbheqHqxO47
         kWzuo5RTasexOzju1hoz8rIWZRe1j0PCfNHtMgkkRwwnvihljHNNvb7k5yS71FRi12FZ
         w7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795811578; x=1796416378;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RdbGxG6smopZOWzLypq/6hlFg6tVOfBxaUqDNkzkyXk=;
        b=QbqdXhtR7MihhLQuAiii/0oN27rpWvYKEMXj5hUj5m6xIPxrfmT4pnJlEYI5iHPOyU
         3D/z9DmhJNphx11BqGE3yfaOvpEgTQN+L7Nr//kFQVKDLoTuSIptl938KWl1W9MeWqdT
         EAPCdVhVDjiiD7jGFsXr+KDALgi9quSRaMHaSu+786mqHEK0TliWYrG/waSR57GPU7bx
         h99yiGL/yz0jQ7jmoPLzoJxuDUKaqbXQ+resRvPxPVXOBtzKJy0srKC4P64vfiAD/Ff0
         0XknEDP93D0mwfA8c9tMBsW0xelZJZVx7KL8IQQxJlIaMfhnquk44F8Nsf1/wxLiw9Wy
         r1tg==
X-Forwarded-Encrypted: i=1; AL+hErFRXLXTGUwDzTQ1+wKAvpvftFn8aCAVrMs3Kj50YXzIXK1cwFDr7DslvjI0g/dHnazjAeJ4gvwJ1Uh8@vger.kernel.org
X-Gm-Message-State: APuU4Z/5+Fjjb5HbwcJN69Po9ybVf1jXS3rnt7tEETJtr0m3uw/7Gjte
	1Fw1aOPByXbbzIfF7ZtHFT+CxR2QJd/X/HAz9wYm4Lb5BZ7AbeOLAAWcIheLafiZnfWM+o9zov8
	d461BcQ+V2c5D///0DyLsq1igzq5RjBxubXHtYskn0U/Qtng091ctnrv+xI+qx/am
X-Gm-Gg: AZFdTZcaUe/amWkQ5+Awrgx1z/Ul9liHHf+lYzLhmQkxULJqQF9gtmQceLYkteaeRsf
	+1rIBQGKBkmQkhPabrlHPMiZWqKUm8lbYTDnr2Fun8eU/9RYngYm5dJ4T0aBn1coWJxaJordHsi
	xk5iH8VNkrU7OdWx4qV9GUH8+9IdMKVpMEpCsuWNiOTkFXeytSG0WoTnsQlhcRt+dYJDSNvPWPS
	5+WPB3uKDcHzUGM81yU+haMpZpPqgApb7gFE3FFz0Y7XU+sNy0FO0hG8/6zgvhDqk/RYYtXJBIg
	+6e9ZaCskQBDeK1pzXZ/e2FtMju+cK8wYzvI7LKKzBDyhHLCXBnjNJYFZOw6pQW8o5UA/m55eDe
	MNW3GWcgHSSQrwkPOokNR+Xg3mCLrhlHEi42gDOtneO7psOgMoVC0UnqEkHaGmQ==
X-Received: by 2002:a05:620a:28d5:b0:949:6d4d:2396 with SMTP id af79cd13be357-949ba9c6ac4mr4407928585a.27.1795811577983;
        Fri, 27 Nov 2026 12:32:57 -0800 (PST)
X-Received: by 2002:a05:620a:28d5:b0:949:6d4d:2396 with SMTP id af79cd13be357-949ba9c6ac4mr4407922285a.27.1795811577441;
        Fri, 27 Nov 2026 12:32:57 -0800 (PST)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm709585635e9.8.2026.11.27.12.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:32:56 -0800 (PST)
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
Subject: Re: [PATCH v4 0/4] arm64: dts: qcom: Add support for Radxa Dragon
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
        dragon@radxa.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniele Briguglio <hello@superkali.me>
In-Reply-To: <20261029-q8b-dts-v4-0-e8e7438f5545@radxa.com>
References: <20261029-q8b-dts-v4-0-e8e7438f5545@radxa.com>
Date: Fri, 27 Nov 2026 20:32:48 +0000
Message-Id: <179581156894.3905807.8399699622838832226.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=364;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=uTOlrKK3r5wHlu4GNa7hytHvMz4ce38/J/1xbEGeX68=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBrCejzTK0vY8gwlDXzGRSZrdDk2sadJ0Wm183Rv
 cxZQ1XiJSuJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCawno8wAKCRBjTcTwaHBG
 +AxYD/9UsZNT7/FLc955HpspGxAIsT9gvOm/npB6eyd1uICYgQQa5CMdp03G7hw6lorCfcHe5BM
 A3gtWHV+8rfD+AVTMvNdEimJwVR+bQ6Jv5+SoXxZRbw6Dhjvuk5JeDjQCYPSJx8OkQlwe4j3g9O
 4JgPJeSThp0kFksAAjHOVrbxWmekg0WR45tsFX5+fzemIlOxNguBPxtLDzoRFV5jV9+uhlGjUs7
 PU4G/f9h2+t5PZIBoJ89CvaCzh1mRl0eXDXz0q77PYyPYoIlHMXeDADxgvFMCgN0+GXR2g+IBLf
 supvMhGyrT4ItRqqRU9nl3Pu/xMLNMdegq4kKRNCPRRYvDC+jci4KSBTAHx93tA1pJKT8byI3aq
 0KBC/IHH+xt03QLOOxCMsaRI/ZX/NcTYo+1AgVnaD3m/3DY1hYC1QLMlQgja3Va7F5Egnwky5Uy
 4LLp80n4YpNrpMiKMoiJK1ubZwRlhso0hN7j6gUXjJFCmF4FWpj7oydhXyMrsSS55NdiPwjurj/
 zXHmsq8moGAE98cGq7IxHI/Q0Tw632ztNsQVEH93jo1EVNIkZw4ZvHMmGxf5lzo9Viu9xf7Kf7z
 J9Nbuj9ILpohAHYi1FVAI8gQDGZ1eFDGJEviLW6Oe/jCbGtp1KvfD/VR9gcRP7PKO3YtKkMyMcC
 pLsFwktxzCIc4VQ==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Authority-Analysis: v=2.4 cv=FYOiV5+6 c=1 sm=1 tr=0 ts=6b09e8fb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=bUWDG7REKp_wvTPU5MMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: P6rU2QZ-Vk9FWUlx55wZxfOJ5psDtWAA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX75h9trQWQIRB
 yDEksdh/9dHrJdoJ2o1iHJZINAn2aBx75kzukChyYrt/ZU4L38MFaidNJHLX6CdTFiTAfkLptA1
 VN6RU6t3xmVMJYSV5XStGAwvsxIwiCQ14so3ALoITfkVsv3HCzj2gR2v5mw30mel3j7vGGw98+T
 cmME3S98Bbf2mZWUwknB3EOYA9wJZUyGeWIvas7TuwJM701LH4oGvbBjKfJ44Gz4C4ODWzYV8V0
 TEKh1HZqZ9aNRbd5swjbP4vWQgmiLTYA6oOXXTKEQ0QtKAM/aACjeRacN7/73WCGScl/VsGcdjH
 hFk6BiZ52POShhhpCKgpC/z0EQ5pVvVek8R9hig+ksQW/avMDOLi8v0vtcVP4g1EbgSFibMWdc6
 MPMxVto0N4ef6PKquVCAzzZ2KJQ0W9ynmxYBQiF3m/Q/+ZbbYfYRKDdFyCiTme+IJRk5ZIZgJTv
 yoMhHFpHCDL2mC+aidg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX8/iMw7KtKCGD
 zvaNsQzV6mxSETvgc8UZxb1sjnPLP6K17lMnwMLV3FVgy1B7+wsnPKTJ7X3H0aNZbxzYROC1Dpp
 ieVFhOIJk4GP5QOrtITckNR4VPSpuII=
X-Proofpoint-ORIG-GUID: P6rU2QZ-Vk9FWUlx55wZxfOJ5psDtWAA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270081

On Thu, 29 Oct 2026 18:13:34 +0800, Xilin Wu <sophon@radxa.com> wrote:
> arm64: dts: qcom: Add support for Radxa Dragon Q8B
> 
> Hi,
> 
> The Radxa Dragon Q8B is a single-board computer based on the Qualcomm
> Snapdragon 8cx Gen 3 (SC8280XP) platform.
> 
> [...]

Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

-- 
Christopher Obbard

