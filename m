Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5475545D5D9
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 07:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582324; cv=none; b=hBoQofGqHbWQ/UBqUi6Sgy/71KJNADs/S1R44aa8JArUfkrS8J3gGyuDleX23TBrB1Z2oU/+H/AWcuqzqsXRlCptcuqEesHkXuhccTDfRcDh/qlvngQU6tCMu074B4FaUVUEx+w61ce4n8pMqlpLty2Z524CxnkaACfvIz9R+X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582324; c=relaxed/simple;
	bh=oINfMFzwgmFUF8JnPJ7Uumdy83saBkH4GJpPh/hFZ1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q5gQswrnO9bRxkLrH4yerwPQ4oj3y5FmEu8wnXo4SnnTtcICR07V3cIIgXGJqpCtYoGejNQyFdzMr10z3WHKTKt7bLGEReogqJsY2aTybq2jPi8wxE/nblgRMwQgzvSF0V7IY56Y81Cn689F8x0JYrC6lpQ5eNW4qx4Kn3YOT2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jVkk5pUP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FkAwyzIc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jVkk5pUP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FkAwyzIc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7Zehh3209649
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 07:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLePkQK14oDgXmWMoUR6/Kqp6Ke46jg/FT4UUQ96oBU=; b=jVkk5pUPMZuhdiWZ
	F6Ts7niLnMxiE/z/r9JIknubpWcPWU79Of7QW+39aHP/LNdcI9U0he9fc5CRPFAb
	VaYx061TaQymdzGjRBytgGU2wvzgGawYIjiFDHcDAHlWbVeIRjdbYDhRrg5tF6ja
	FWmU5rxFAb8euh5hrls2/aW71WotwuuXdYgr24B7riEDGbaYDCVjMuuRbVTIJv0d
	YGqKoh0eHKGekrE1MM7FkCnbNzuEmPODsQR9TRxJ1bvpTZeknWcA1WoHAGu0tzIb
	BioiK/cG8+rJtGKdIHfuzez05HU3hLSsBiflN/u9bVY58xQnBPgaRzcgGULUH8UV
	0sQXzQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav49dug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 07:58:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-533306413ccso22945881cf.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 00:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790582321; x=1791187121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oLePkQK14oDgXmWMoUR6/Kqp6Ke46jg/FT4UUQ96oBU=;
        b=FkAwyzIciX9L/6vapRnq+7ew/FrKTHkNAHUOEw79Pj06ZoDkxzjF0Wz2t8BMskV6SJ
         w7gago4Uoo++2MCsXHXqvaTwLOYLXT6UHY38ZSshrki0IC3rhSviCLBrYAWIFYevSJZd
         IwK/2kLCBSvtYjH9O+kjM5EA85XUcTh4hlJuUQ++AwipHtS+lC/QTYkKa7HJZ2k6Sa+x
         zfZbwik8p1tzLV98YeUFiDqYcmT+EOKPdbkvDb0sHhHIJ1fqrcCE/6T8rnmEft7vI45O
         HUv6htExKYJv61F4/pqOewTE3AQjRpqQAsrUEwz825s74mO7JdDnRrY+t8OenXMfUoht
         1QLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790582321; x=1791187121;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLePkQK14oDgXmWMoUR6/Kqp6Ke46jg/FT4UUQ96oBU=;
        b=xEy3c8TfxkM+9HSf5cJHKtbeRC7oAJXkjQL6nT60vlSBiBVVAY0niTYFJnG8BYd57y
         cdv16Iup1BaYSBr/wLM2uxP3t4KnYudjYly3glVYhcm6gpSKJ/uhc3b8OLHfWrMKtaK7
         6FmFKg0clkiWTwni7MEhsqkl+sfrB5NbxV9vxYFrwOIuRcTdLAdwZYOieVAVWj3Phx0b
         GCBIY7Fb5jwUMuFmR1FZ49j43pjBXSfFurNogJ3AHFhRm/9077xwwfHVC0wGNrbQWe2y
         FYPHm8Yr4EZRrRbhzkVao55L1aRN6LttW+vlx/NeYHb5N/h92kTXGwvdGZyhuRp7t0kA
         xgbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwym3pHBw0Sy+31QUDbCyfzrg5QvmtTHu1nKCbjC+AAfN7U2eeEhAgv/ADqtlvW2n0RlnHownvHwvFM@vger.kernel.org
X-Gm-Message-State: AFuF++kiblDzYqgzzwKgzqjwzTCMM/7e8VE4OEBJEWxgrqXyf7siHVae
	Xl/zjjrAjroCYxs5jg7JDx08qtGwGfcy+68GhNVkktTOOuZP/WTDQvQ420mlucy080RQBEjJzjO
	kFXN63+X+0SXAR2MWpPXotNSdlZo0SNOK1CaqqkUO12pMAtUbMI3YjHpYxuLYR9yb
X-Gm-Gg: AYBFou0t9/ONnZlFgEfL9oNAxh5h60+gYIHeLxd81GTybRapCm1cCgzaP4S89KfrmOT
	b6eB+IqlAZ9UqrFBalcACK91kzy8Vcl46n/Wwu/frTmsdFx8ZfbLufZFT8NZqbd4Kchs2+yXEFh
	RrCmAHf96o1hG9xPccR1MPJ7dCGoQMtBlQV6uqXe1ntZnMz4uLceoOWts+tORiGQSjc+xQdB8iT
	nGiR6g2zVFihE9SltvgiGyH70hMgOoUUl0mDV9B8cILhAbYNRh88pNY35sIlFaetBwpnclFn/ja
	yRKqe396AbRhtoN6evEy3b26frabdpU873f5PAq6CN1/s3/Gx0PEgZ05YnClBA/bB43NlAqPXxj
	EXoWZPwOWK2v7BgtxgyzCkZmoa1V1khYPbtwZ4XvVE1EwFAJV6iJVFBFSIy1K4RgB
X-Received: by 2002:a05:622a:1341:b0:533:36d3:1c81 with SMTP id d75a77b69052e-53336d31efcmr76941861cf.2.1790582321086;
        Mon, 28 Sep 2026 00:58:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1341:b0:533:36d3:1c81 with SMTP id d75a77b69052e-53336d31efcmr76941681cf.2.1790582320648;
        Mon, 28 Sep 2026 00:58:40 -0700 (PDT)
Received: from [10.111.171.191] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533223efcc4sm57093321cf.25.2026.09.28.00.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 00:58:39 -0700 (PDT)
Message-ID: <c6a4a9b2-b7d9-416a-a4b2-b669bcd52b74@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 15:58:34 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] media: i2c: Add Samsung S5KJN5 image sensor driver
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org
References: <20260914-sk5jn5-v4-0-386e84cfb2b3@oss.qualcomm.com>
 <20260914-sk5jn5-v4-2-386e84cfb2b3@oss.qualcomm.com>
 <f653e9e3-6426-4e20-a095-5e2490afbbb4@oss.qualcomm.com>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <f653e9e3-6426-4e20-a095-5e2490afbbb4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: b5JJ9N_X7wk13vwrljP8GJ7HDyxfV9qE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMSBTYWx0ZWRfX6i36f+o/5Lzk
 ozGaarRYL4LrQ6oTI7JfrlFGpcoB7/zCzAuM+mci5stQvok4zHn9YBQ37hppiQAYV4YSrgmWp0S
 PHsU9qF6S+FvHzy+FRkNHzUnZ+W6Pn0O/daPzW3yqyIV7OLyTLizU0xIcWPfi5maPcwqtLH/C2t
 nO6F36CeDUjcnhSdAkl6H+vql9Eqm3YuiC/Ok8nAl1ZI/2XUEmjKKqsK1U2lhiZsIjPIsj/1Jjz
 sxvume0Q5UnEzC0guozyTEqJKUGtKUucX+giT/nsZ/+lW++ayggqhFwJWTDk2cshQ1y0rAgG20M
 G+0MOCOnlyTyIg+w01RonnNmGE29d4HOa5XYFGzO1rL2py5MeWjI6GT7E51zDCZdUY3ZsWcQTbM
 BAKY9J2Ym3nRsZlLB8aICGXS/CyGw/SoL47ldTHeWOsHsq6oiv7YWChj+vDJRUjjyohV2bQthEM
 mJQsBZxrNr55hO2TMBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMSBTYWx0ZWRfX4RCt8uTrmO7m
 2kHqpoCYkz96ZBX2K1GpyzP+YLxxJLwTEsvKOoiZmaScLpJDigTHhYLuwGFn8TZ66wIRVorJzBQ
 lq3lvEUU55ewd93OaHcL1F4GERJSvy8=
X-Proofpoint-ORIG-GUID: b5JJ9N_X7wk13vwrljP8GJ7HDyxfV9qE
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba1e32 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eETrMs8bDw3qfd9Ur1UA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280031



On 9/23/2026 7:11 PM, Nihal Kumar Gupta wrote:
> 
> 
> On 14-09-2026 16:40, Wenmeng Liu wrote:
>> Add a V4L2 sub-device driver for the Samsung S5KJN5, a 50 MP 10-bit
>> RAW MIPI CSI-2 image sensor. The driver supports the 4096x3072 mode and
>> exposes the standard controls (exposure, gain, vblank/hblank, test
>> pattern).
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                |    1 +
>>   drivers/media/i2c/Kconfig  |   11 +
>>   drivers/media/i2c/Makefile |    1 +
>>   drivers/media/i2c/s5kjn5.c | 2861 ++++++++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 2874 insertions(+)
> Hi Wenmeng,
> 
> This series fails to build against linux-next(20260922) after:
> 
> 7eef49c16461 ("media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad ops")
> 
> s5kjn5_set_fmt() and s5kjn5_get_selection() need to be updated to
> include the new 'const struct v4l2_subdev_client_info *ci' parameter.
> 
> ---
> Regards,
> Nihal Kumar Gupta

Hi Nihal,

Thanks for point that out, new version has been posted:
https://lore.kernel.org/all/20260928-sk5jn5-v5-0-19aa0a0a68eb@oss.qualcomm.com/

Thanks,
Wenmeng
