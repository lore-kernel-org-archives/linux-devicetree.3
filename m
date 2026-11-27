Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781618;
	b=N8/re2RyebUz3p/ZhXI+/i+X1k58oDb4maXaA0RAfTeqZDoh26qRuy7mszXuD4ynvyba
	 720hcTQwrgOFlPkViPPoHvGyIJaOMjplNOPw2LZ17jGlVq7HfuQN7TGET9LnrlIfVhg/c
	 uOr3/NUzTIhQX/Kbs6DbC5mnpG+98aSJyAV3PX/0qlde+lVzL1Zkt86rpgay1+jAZy1/b
	 71ZYUZw0FwXE3IvJIBVlFdlykCgdV+/icc4D3SxV+USawMWIlg608JyaPILGkfKdHZzWB
	 FMTby5njBI3vHQ7N3fD8v8hn9DKjk/8aVeM8tMvbUqfuI2gocwvvaxFKQmkHyy31Vww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781618;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GQRN6hMLtXmRb2agbnnXvDMdlpvFKVesL+5VYB+4UJE=;
	b=J1tJoxg1hWF57eS16nV4NQsw3t529EMUTAtYAhUWy4R1MFggnejwJAW985rCWD16iyvZ
	 agAzuaARf0ibKNQYtvGXb/+psSRmrVMcTkRjABJSBxVU47pI9XLbPXI3x+bXw89XHk0D2
	 nDQMSVtBZausjns3vOy45O/plqpQ4hGLiDFSzODgM/J6Nuir6Xdsyjd4aS336Og9y7Fid
	 TjsN2f6qbR0jxLmjnOjTZ6RVk9Eg0KSjR12FnD9A+dujWtmkBzl5rAmKKBZ+UiuOR9zhJ
	 ikYxBiysBR87eFFo6flO2lyAEcBI279AauWEDH79JGOBWeLu3fMnvVjQsgBDD1JhzDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="IzTcYT/o";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cKnZgQSD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87C3606A33C
	for <Devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B87C3606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IzTcYT/o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cKnZgQSD
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApNmT273544
	for <Devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQRN6hMLtXmRb2agbnnXvDMdlpvFKVesL+5VYB+4UJE=; b=IzTcYT/ozKMWXuJA
	qR2A1WW6ceB8r0S5rRexOAaw82FLGR9RGJL2KY1QkdqwqhxOyy8+EAURlkYrhvmd
	bjyzWZqkIEJQRryUt/C0tMhcxF/TjRuJdu3CpvRmL4ecVAtogGaVmu8Jno+f6yXc
	1D35w2HDNHULZb9fFmkEdlU/ey5qoHhGXXWmQ84kKqoOrd/u+VgeVOdFTzXHvTTM
	5tuCqikXS5HG/dFoCJ7o/VM5gf2SqaMLM0AI/WEYe8yHvUDuthglQhyNU9alv+Iq
	oT5NKBdl9W3LAoL5GNm96tf2LSb2BO8r3kIpeCe8oXIZs8fLvunOWPA420dvhkbG
	A4NYzg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49awvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <Devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:13:37 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ece1a3bf7fso340724e0c.3
        for <Devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795781616; x=1796386416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQRN6hMLtXmRb2agbnnXvDMdlpvFKVesL+5VYB+4UJE=;
        b=cKnZgQSD8br2MGLHVo+K4h83QIzyW0OkHXK/IcSJtBaa5Z4bSkpAUCioYjn07Yia3Z
         BPNeKZJDUB3QQ54qdI3C4nbCyov8n7yKrhWA8wqB7eRRAjDOmL900FWP5dt6XywAOMPp
         fW3S3Pm3lytDYqjEXwbAT7u/0Zx5NiVMjSWQo90ZNjGWzKQX7dvrbZaKo2Q5x47hdxJH
         EvXtFF9XsS51AbB9tZpsW1YTOvWAkSQQhCpI2rdXp9E1NRCP/niQg2Hjtte0bpUenfW0
         lVnyK3G9GZzr4TSvo7hLrejlYMqJtKE1dSZ5M0MQYjllKypzkwx+qS+STFUSAiXbIeEg
         Ktng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781616; x=1796386416;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GQRN6hMLtXmRb2agbnnXvDMdlpvFKVesL+5VYB+4UJE=;
        b=x2BTQUOLwZVmLqeHy6JYrMtxLGJMe+v7+A9P86QciLAzvzZtO8be9YbUg6XXTO7c2i
         bOdRtRYoVD4Pxg0ODfkY1z4WTIVbVd47nZiBNCW9F+io8Ty4yhrsiLUjdrrujiaSPjOW
         LQOTy7j5ipwg5AjJSl4Q9czgVAKEEn6FmiJzei6imhqrOH3g/B2p8Es1GHaikr7gZraz
         a+9itebyTzLlgx/WcPVGIj8gjamSV8Ta6eSg77L76SwyBStDqY1gmE6S4Ek3bIREYLsn
         Cu38iORN7pmtQK+mjlghqyk0AdbHG4cf6A9Iy2pc1BdH2sJ0DB6hEjF82rEG4kgFKWHy
         Ae6g==
X-Forwarded-Encrypted: i=1; AL+hErEyO9WerF8pMCez1J6smDEckWvuHhJ6HMobNrmlAqMXtDBwahO3pln1ARKkBVRGQ99W8tusBUrLMca5@vger.kernel.org
X-Gm-Message-State: APuU4Z+Tl+t3w1foMeTkvyBURgx1RE4EJOx3/mXP+/q15gAH9rgbJMcZ
	q64zQtMBydVaYqt/J/LJQvCku9TKT1aXa4iIy6D21YFHgY/N9ezZZIomGNN3Q8W3ks9WvVyEvRc
	ii2OmaY6zaYNhc474LTpYCEk9ikre83FYkRroFYDeZVez/r1PV4QQ3S/IzYa4isEB
X-Gm-Gg: AZFdTZcuhkcYXNwaP9Zk/LzgcRpIUUQWeBgZfbdn2H7StVzXT4xRApO9wlfevbFP/8M
	mzaU72UPlIAdCCoVo9NjFXBT18X/r4ZaOTI4UATWTvcIiLZILxub5rRgO9UftirrFnIg7HXMdKO
	hdPHZA/050nw21Ov5USvWo6wcombe03QzbARn0lZukR9bdmDajsI7kuW4RRPldZCdRZxCx/QcaU
	GnLUg7humrl8Qml29vLWw0ggzNks83lD89x2FDa07vc8CvHyhIs9DhzR06J+drcQwA6Pl3Weyrm
	wUH0aNRL36L3i/5G6HXuL7jbsBlEJmJf5rCUCnBZ0Pz03YM0pwkvDUq6E81R3TrqL06rfhRSPOf
	pzx8+phjrfU/mxwoxs5/Dhho3rR/Enecan96KD8wrx3Tb0Ant1su/1aXEbPhjz9pF9z5QS8w=
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr16376785e0c.3.1795781615915;
        Fri, 27 Nov 2026 04:13:35 -0800 (PST)
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr16376707e0c.3.1795781615471;
        Fri, 27 Nov 2026 04:13:35 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea6e29sm845002066b.43.2026.11.27.04.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:13:34 -0800 (PST)
Message-ID: <c3ebad86-3421-4941-bf64-e400dc8f14eb@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:13:32 +0100
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
Subject: Re: [RFC PATCH v2 5/5] arm64: dts: qcom: sc7180: Add
 sc7180-trogdor.fitconfig FIT config file
To: Douglas Anderson <dianders@chromium.org>,
        Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Julius Werner <jwerner@chromium.org>,
        Michal Simek <michal.simek@amd.com>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>,
        linux-arm-kernel@lists.infradead.org, Simon Glass <sjg@chromium.org>,
        Peter Griffin <peter.griffin@linaro.org>, linux-kbuild@vger.kernel.org,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Chen-Yu Tsai <wenst@chromium.org>, Will Deacon <will@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>, Devicetree@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org,
        Saravana Kannan <saravanak@kernel.org>,
        Brian Norris <briannorris@chromium.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
References: <20261113210918.356261-1-dianders@chromium.org>
 <20261113130858.RFC.v2.5.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261113130858.RFC.v2.5.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TGtKu9fxTQgiqIRhRo0qBi2hyABwBcBg
X-Proofpoint-ORIG-GUID: TGtKu9fxTQgiqIRhRo0qBi2hyABwBcBg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfX3FOu0Qb5v7VP
 0Z7Gc5m5NVJyWZlG8Qhjikn/Jcyz2YNPR2SBfUNHBvPuVldAe+XPPyS0rcKM0eGCmII7Dbf7UmE
 O9SusSF1Y6U9oqiPPu3G8IDh+mjc7SU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfX2pSYGtbXfuxw
 zkwtCxvBeRrDn0MLefLTE5RNOb6hVfC6ssxzxHJU+bHdoGIM326+3h6ZZsXa0rdbjlV9ENpRZ+A
 K7PU+pAn6oREBf0Epyueiy7b6DkdSNYRYh8KoBQL/BBJOtbYYAikfsHwluwSyYjBkzcfVp/NyPm
 ViewA6wzitGzMtnFhkpRXMe2zdjg2/2PeSpFMcs90Hnh68ryFzRs1wdcLbmjZYxMvfCa/pGdN8X
 HiTNKxnf4eyurgDqTJTbo37s59iTN2DjeSO3KgrcqFgVlyt18h7lBMZTL2vsmWHzcJSCll3cxrU
 rtzwy4TwY7Vl0VttATGDTrOodkxuDCK/+mdlRcaxpSSv+w68b1tAaqPPyqxqoF/lcvF0v333p5U
 XtZusgUMhADU93kCE+Ua8W9OaLAZimWHvupvyMHeY6EqakWJSD3MICv6mJ+RIOdy1AltHLKZ/mo
 UEwLku9upnYPwLPF6zA==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b0973f1 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=kMGPIAtnrfzpPBabNyUA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270048

On 11/13/26 10:09 PM, Douglas Anderson wrote:
> Add a FIT configuration file (`sc7180-trogdor.fitconfig`) listing the
> SC7180 Trogdor family board DTBs, allowing the LZ4-compressed Trogdor
> FIT image to be built with:
> 
>   make \
>     FIT_CONFIG=qcom/sc7180-trogdor.fitconfig \
>     FIT_COMPRESSION=lz4 \
>     FIT_FACTOR_DTBS=1 \
>     image.fit
> 
> Having an in-tree `.fitconfig` configuration file for Trogdor produces a
> FIT image matching what downstream ChromeOS build scripts
> programmatically generate, makes it easy to use `fdtfactor` on the
> Trogdor kernel image, serves as a template for future Chromebooks (which
> could encode board/SKU matching metadata in configuration match subnodes
> rather than combinatorial `compatible` strings), and helps community
> users building upstream kernels for `sc7180-trogdor` devices.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
