Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306284A13AD
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 19:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790104605; cv=none; b=UY1Mktq93KL1GFmiYK0wgtPUZYWWD4yf9qpJWtBq1sIGLcu87/khLXFEO9quA4QT5px8d/6CBXIjZ8GjprGdxBuQ90Uyj0mF1RYhzErPIFMUySlRggKTLB9N1Y6m4QyxupVxIEPrgliBZGFWcQ+QVNLsoYUV4jCKLc+ngSvAMRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790104605; c=relaxed/simple;
	bh=J/1lIjFGeiNqfLjljJDLTbZDhxthd7iJm+KP8BBIn10=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uYfD++s+HqZjXYXv3bWFqEhY1CUjN3TQl8Ab6Xe3+Mlu+sqk+51ucTV8Qw3ld7tsJ18vM9XqrOuZXhJV4GwTIJoiTvN/cVf8SnYtcNxpjySmTrpeJ/LygUwEPQunhxxYL4G2pInD46H1dzsdMN20YXSENINAXYfst9FYX8rF7uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G1ADCi8k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+D/fczp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G1ADCi8k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+D/fczp"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI76cb2033340
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 19:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1CLHSThQF4YpDbixBpn7NIlnhlNb47B/KiU7CmG8zbk=; b=G1ADCi8kpSlVZNY/
	wy4USVl13QGfszXumugmn4e6Gr7BjqN8TZmtIYSK8IE7EuVVBV9A0Yv3rc40jtYS
	26xcDOhoXXf6ygzoy6/iNma0NlKVst7wSvXHgAjP/RLh4l7EZLKscHh6/o8pQrYU
	bUlYXtiH7C3H4nZGe6kJZ3WNtTyvi4Kwd7sz7MD2cD/ej8nBjr8cbPOqbZa5EBTo
	Haz7C3JHMUQkhkIiUBaYxHEueu3J8m4Mftqm0fHUek26gNBjkL2y6jhz7KTBQMlV
	wdX7bvcJthgfO9pXlh1/wJzdDR/OQ87+gLpEqZdOMtD7p/J60DFWIwVudAGFhr18
	RkwEbQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c0f6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 19:16:42 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1438719cc1eso187534c88.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 12:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790104602; x=1790709402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1CLHSThQF4YpDbixBpn7NIlnhlNb47B/KiU7CmG8zbk=;
        b=W+D/fczpWgLG5ZyoS0+C2wQjM19KbDmTB8Y8MCGURKXjsoASRmqI79DDqpZcJi8pVR
         77x6/vOt5/46G402u23QlhZ4p68qabD4SikUcdISVuNrSjvd4jXFZzx3QClmg7yRGzj4
         eUxwEBBDOJuO2yvWU6ArbINaCJpG7ffnjr/KIYAYnYsrWFeo/xTa/ZE/AuATN/DKu2hr
         r9rFDxEGXtyt2voq/gWmDF99mB10E3F8aVn6vGQyvayRv5Lmu0Ft5rUkg12AMSNdOvuO
         /tIJIXESAj8Rh0w2/hJ/Z4wp/WeSwMeb+vlykgk8fw26eIbQt3AiBWnEwXT2iWeojuo4
         mC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790104602; x=1790709402;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1CLHSThQF4YpDbixBpn7NIlnhlNb47B/KiU7CmG8zbk=;
        b=jV9Wvl2k/VD3/d3zpmGzh0M6tbp6dJTUaWME6GOX2q3R4v7DOQ04//CtTusOsE2ySQ
         8tDAkclJaQ1hC3l9NZkS0x/RBrjWqz8VkJSqU4Vi7hteojlgKaoGEPkCF/oearBz2H/I
         ZMfL+KUIPYVvQNg0ZvPB8FByfIJcZ/9sbvmkUOWT8Ijr/vMTB85HMhvmyzc9IdRZOVyx
         q2XbIA9PDausxm68uBJWj5memM8jRLF6pYl/B4zRvmrO795b8eeYYjVlWGg28mlkjMYN
         KXVAi+KLvJNbf/XLuXvFQ6E2Y6570HD0vtJFSNM2gyxsN+QM3kkKvpjwX/Ixe8CDYKjz
         DRgg==
X-Forwarded-Encrypted: i=1; AKwUvBwDicJBZ7QVzzkNBR6FmftMZBe6NgNZmP31J63szH533t6TEGnoIbbcPLmblDoHFRYB78jrCjkPAD6l@vger.kernel.org
X-Gm-Message-State: AFuF++n32oYT3uE9WTc6+z65ywXO09pf5Zdm3xGOzZS200YkPVt66QCv
	V1tY6asFJrOTJAuiDvscyqzc6LLFt3YQrxC9wT4jH4aBtxF6BVh5yAEqGULACsKWmQouxKsREy3
	7sk8IyQrJoYfPpj0u+y1zwc76MUpAw7rL/aBS2Hqw7UMfnMYQydY1mCii9mQE6mYE
X-Gm-Gg: AYBFou0VtMcmUaywJ6+ojyGG+bCWtzVX2GF0XtTnZ32ymx5nVxXkrpdSBJMHz5xTs6g
	JZWLkqnmqhTUm9cs/rO7MJ2pKPF4dmYCS+7rEAENiX3Tn/IivMCfcJgOOSEm6a7T2VJiVsbk1/8
	pH0niUpy3PANsDxZVqQNBdcDzcm/PtrHcb1ht9CTz79TxaGm4G5xaXrP5e06QIaU7N9nde/hwIf
	vXa8BGNq/tmpTRcB2zBQR1fSfxO40w9wG0hgQXtN3R8f7fa3Cc5v3ZMLzJ8rNy8CerB25K6FCDT
	F1jiuuByY+fUQXn/3eosNoPfPH8jYOUj331kzA3jIOdNXX5Ncegd52nZpSjClyz5sRIhk2eZepe
	GDTLNa5iVNI4g3TQYvhRAg1fzF7f3h2t/YQ==
X-Received: by 2002:a05:701b:428c:20b0:141:5281:8a41 with SMTP id a92af1059eb24-144f91377b3mr374875c88.9.1790104601474;
        Tue, 22 Sep 2026 12:16:41 -0700 (PDT)
X-Received: by 2002:a05:701b:428c:20b0:141:5281:8a41 with SMTP id a92af1059eb24-144f91377b3mr374847c88.9.1790104600692;
        Tue, 22 Sep 2026 12:16:40 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.143.245])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm521798c88.13.2026.09.22.12.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 12:16:40 -0700 (PDT)
Message-ID: <318f7e47-8a23-4253-860c-0e9874864a13@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 00:46:28 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: Correct white-space style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Keke Li <keke.li@amlogic.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>, Bin Liu <bin.liu@mediatek.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Xia Jiang <xia.jiang@mediatek.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI4MiBTYWx0ZWRfXzGsqM8T9vyJY
 oYt0EpufOtS2gkckuNCxFf88ttE/aVm9GsuWKK7jkGYmRD/0EfkoXTpN9S+HeT3eBXPvvfHTAXO
 hullYm50e0UGV10hHchPmwfUl7ZhdDGnQO3uK1Uka3F4Du6B7y4zK9Q7OdGebNoRKmimELwlAwR
 iviCuguNzdudBDD0MEU8PiVY0590S+w9sK9AQOJE3ycPVs7R+R5Hy5YbsYcqDSkbJYCXImOkrme
 qRBJ2P+luGZz027Hd7wHQF5M+k1NnVKChTs5Nm1hW3UtYdDLphEMu4Zr6QIvfS4KsZLU4V9hqIh
 FMWLOBftAgA5LdlZcTPZvLR9OK1Cg9zOhI3k3cjdxBhaSAl32kgMa4hlbfxX5BmWOeAThUMUzwN
 Gsg/le3lykPM6/D8Zh9gTgk44mNbLO3FjtCAjY3NrczgsHAdCXllt7rQuD7tZCsTj7VNMi72P35
 LfMfcaxU5IZtxxJ5pXw==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab2d41a cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=d+GKXRUq2vCLDWIvqUj1TA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=WJcS3fml3CefRcin8NsA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: aHF40lSI6A0j4u34wSe_UXqWf4o3bofc
X-Proofpoint-GUID: aHF40lSI6A0j4u34wSe_UXqWf4o3bofc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI4MiBTYWx0ZWRfX8hKnnsu//FX1
 zzR2DOJQISu26prFN0uzEYsyfYU0s4lGQtUftoeY3q0uYWEIPln3MVaRKaf2u6HpLNKBz5pjCdV
 TGLmhug/D1YuplmTtkWXOvonukWgUPc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220282


On 8/2/2026 1:25 AM, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like double space after '=' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski<krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   .../bindings/media/amlogic,c3-mipi-csi2.yaml  |  4 +-
>   .../bindings/media/i2c/galaxycore,gc05a2.yaml |  2 +-
>   .../media/mediatek,vcodec-encoder.yaml        |  2 +-
>   .../bindings/media/mediatek-jpeg-decoder.yaml |  4 +-
>   .../bindings/media/mediatek-jpeg-encoder.yaml |  2 +-
>   .../bindings/media/qcom,msm8996-venus.yaml    | 40 +++++++++----------
>   .../bindings/media/raspberrypi,pispbe.yaml    |  2 +-
>   7 files changed, 28 insertions(+), 28 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

