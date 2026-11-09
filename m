Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231017;
	b=xrm0zhI7mN6ckr2GPJKmBP+vOaAFj6T5Q+ojn46qh53qdwT/P8OYhYYPNWoj99Nr7kv4
	 uI/npJCxgj9BJ/rd67EpUnvJN7sBLuGN/nS2UAUDRKRIp5vc5WYv6JyYrh/S9zNhJ3Wbv
	 8KHWNybJj6glkduMVauCyoaZMu45uUBrfk4QI/9lFu5PBqsogqvx7FIDSwl/zMngzIKZE
	 p9yBvyjZjc2JtaJTQpbURlgD7pqp+vp+2ZT3bGIh3Z9AM6OkQGpYR7g707e7AhxnpFmZd
	 1ve64xp8u5D0orqQZjm5HAAJdZQg0izaQQuIH/zFJ5svTuAEdWjabmegU2Aq+gaoB4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231017;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3xWoTCJX7g0Ymvrlgv8LUIarTuXZICxScd6KoWd+6ds=;
	b=Y77caQH8s3kj3oabX4xkw+NeqB6e1IwG5uJEfo+qvJqUREoTUXXBZaCZHxrHdnuwhDVH
	 jbGemVy+tNM+V6d17XFa7I91nSL8ciYCzl3QAeshhzL6NHHbanAHW7amvQ9/SsueadzrQ
	 FKkM41ctNzlokZWxTqocnE7jLCOPvKLde9BWNpf5dVH/VB5IsOG8Yzp1pjysgxcJy4c/l
	 pHwcpJzWGTwK7HwpFRKzeWZJRhHh56R0HzZgrDmWVAIyRU+bm+7sXIoG22bNxkbflAs/6
	 clJbEAk5QXPB4oTiiIsDs0HVjY1VU9gsYIaQYLiAiO3g7bj3YW63nfXEvCXNtu/SAlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HbinuI6i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NoY695KL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA81E606A326
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 13:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA81E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HbinuI6i;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NoY695KL
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DEpcZ1322917
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 13:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3xWoTCJX7g0Ymvrlgv8LUIarTuXZICxScd6KoWd+6ds=; b=HbinuI6iFwunE/J2
	ndoJp0ER76Ir2F3muz27Qg7Hip0+kV8NXThoG+/nKdcIcW1t6F+Msm3rHsIpQsZo
	om+eiEB7uW1kUdA4n98FK/I9MqtIh3er0T/5ANmFhhrjbv5HsW2qFI5db8T6fTB7
	YYy4JGBXcmP3mu604L8yKJ7EB+tezNWVqxlAt35Rmo2RjSkfAykzCf7X5TBom8AR
	CzrTZ2H6W6i0/wr9eTy5nJ0EvidNXbp/YBKnkfmx6a4KfRufAfLHi8OdqDf1RboW
	6NsBAb2VChWi6J0A/7gb5d5nvxoR+tfc2uWMVIa55LO7ILcf0GZAL2ufZ9EiNXkw
	7BFKGA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0qr7wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 13:30:11 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-998f1ee9698so13892241.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 05:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794231010; x=1794835810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3xWoTCJX7g0Ymvrlgv8LUIarTuXZICxScd6KoWd+6ds=;
        b=NoY695KLpf0/jKbuflSLGuUrmX7DxBwa5NQG0BgduFVVv+xlLz4G7swACOWhdauLmK
         lICreJJGh8JOJbkb2ReTQ9cjzCI1pb7eho+BlrcNn2OxKppP+WsQrxhleCtag78kE9xv
         G+243yRuiF9ejGu/0XWTzmP5ig1bcc6WQGhmNBR2ceiEGkSmis5vN+QLMn7Ro3nzAxlG
         dqNLiuBDPTYFZxc88+rXLG3CmQFJfDbr9L7Uy6vzfvJ4cZ77wqyehN+KiRV1/76gD2IJ
         XIcG71UyEwU9xSKlVMlZoepA0EHR6wyDQXjM+ccq8P38E/MLfjEHlrH6yxHpQStT3zl1
         TP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231010; x=1794835810;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3xWoTCJX7g0Ymvrlgv8LUIarTuXZICxScd6KoWd+6ds=;
        b=qOQf2xBwD6gfUtv3JcG5J1t+ZJHBjYjwosm0XPo+ZLJR8VysGiF3xETZPLLxyI/N3a
         0Gc1RQ4QfNpDAN3gMg4qgaEviXD8l6aAUFG2hfpoY4bm+3IwOSdYW/x6TzmT57rTU1xY
         zJ1vYd1/m/4ABxRM+C5+4LOxLkLMCGNt65/z2uknPyAiJqtXU3cC/finzudB3itck+st
         KwxieUVmrpf52U1NcuWVlltINflPtbNZRSb1aUXrk/IVVa+lyxuXh062GrzReVZ3GRux
         Mg3XdeFWrp8kLOgFx7BGU9CObBtLGUsB8RJ7UivAO0S2l5yWxFohK8GPk0pN5MoZaO/+
         1yQA==
X-Forwarded-Encrypted: i=1; AL+hErETUhEpEQpZZ8ILcl3RWTn6y1CCglrSnVp779mSOdjUWYu0j+IDA8eqsdJWyL90FsOp3OEn41wkRngs@vger.kernel.org
X-Gm-Message-State: APuU4Z/U8YbOUygyAg0/4zdag5BraC/ncY8OiR/zDMRqpseO2ja5qFZ6
	1crlVM2rhZnYDr8o+qYsBq9XsUyT6wXvZOcthoB7B/jhs+IPfSCgy7MGav68zBBX/B7FgW/snLT
	nbUPINtpCjQ8RcS6sYhpGHTTTFR138VqnKXzEdBxhA/JNAj5O2WZNFkbTP3kJHbOh
X-Gm-Gg: AYBFou3yOl8bzV5Qa8VHskci8AP0aVB/GitgQdLCnSd6jOMTBJT9IeIenWmbkUjkBNd
	rrT0S1BurF3awydF/j/oQKN36G5i5YBPh3r0BiNgGxmg6IrOMKJKmxFaLRLpD+Cg4ymp+w2QNwI
	YoLvOb04nMd1Xu3bsUhHOl2NIitmJA61cn1byYScsxMFtMgHfgq21gTWlqsQj/xrZvYOovhUcSN
	xjIDJZb9pZH4ulJ8kYn/Qg3yDB37XEM8ZzGuTxDOBc615Szaeck923Pccr+KGWaewQh+CERts4U
	plg/PTHgzIBqVdThRq2vLO3cEYNaH8ONQ76LxnE/I/A2nWqjsluZ4dYUfLF9Bs5KrONE9hPOyNM
	+ECPEkgX2ePGiWCuHB3YAsinC6HDeBaWdb94otnXy/CAf4qfMimWjwkvpMOqlmKMBLeqUrA==
X-Received: by 2002:a05:6122:84c:b0:5ec:b681:f4ca with SMTP id 71dfb90a1353d-5ece73a16a0mr924060e0c.4.1794231010055;
        Mon, 09 Nov 2026 05:30:10 -0800 (PST)
X-Received: by 2002:a05:6122:84c:b0:5ec:b681:f4ca with SMTP id 71dfb90a1353d-5ece73a16a0mr923985e0c.4.1794231005511;
        Mon, 09 Nov 2026 05:30:05 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a999358sm170236466b.78.2026.11.09.05.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:30:04 -0800 (PST)
Message-ID: <f942043d-a46e-4792-b8cc-a00280eef29b@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:30:02 +0100
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
Subject: Re: [PATCH 2/2] interconnect: qcom: Add Halliday interconnect
 provider driver
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109-halliday-icc-v1-0-def7cf786f75@gmail.com>
 <20261109-halliday-icc-v1-2-def7cf786f75@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-halliday-icc-v1-2-def7cf786f75@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfXy+eVPLHKDSFA
 EsUucYPeyyIDR22pbA4RovGfJ2IOTItwAFyRDWsc5hLyJkzg4TePp0I7VNBBR3vGWqA9jxw2UXY
 BD1A33T6CYw3C33gFYVsWc6affhIsHGI1xrmTtMDZlwBew2X7Qt0IlK+QRCcnEmd4W2ljoiBbUX
 7z3UJT2Vf2B5vqyPpwgVQnSlCKuahUhXGaqYXoz7FmU0V4GStEw1Kese+9YVROjURMithcp6Ek+
 kM49/dr6phZhJHCymorjA/pW5D38PjP6BcXIGMhVcvjrwg9rGUFdpy75IbDO3EhftS+BT62lHYH
 TGzzgYIuYEW7Lz9aWInNO6aj51xDPk9rHc/QQ9GghLNeefq5rglkRnd1ueimGXaI6e3y7tQcWTw
 0zqIMUHtjzt3/K443qsZIEeOMCikoGFuOrP8XIgRmRG/SSdr6fow3XnazJzzdGyk1HTFHScFBZq
 wXr1jdVlew6Wn/9f5og==
X-Authority-Analysis: v=2.4 cv=DZuCOftW c=1 sm=1 tr=0 ts=6af1cae3 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=s7ymY0F4v_VPunFmiH8A:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: Cvg703RtreqORDo98AIpGuJfTshmdLth
X-Proofpoint-ORIG-GUID: Cvg703RtreqORDo98AIpGuJfTshmdLth
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfX7cWRJnqy/nnP
 Ii3D/medfsasUseS/DFwM6ZQGKOjjigXKoWNZdothDqetmqtIyIIA/rJHyj1f2Yir1QwGN3cy9S
 apK02Tga0DdNhIocNrXLodkwwRMoZHs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090053

On 11/9/26 1:29 AM, Stanislav Aleksandrov wrote:
> Add the driver for the interconnect buses found in Qualcomm Halliday
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated bandwidth
> for each master-slave pair.

[...]

> +#include <linux/device.h>
> +#include <linux/interconnect.h>
> +#include <linux/interconnect-provider.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <dt-bindings/interconnect/qcom,halliday-rpmh.h>
> +
> +#include "bcm-voter.h"
> +#include "icc-rpmh.h"
> +
> +static struct qcom_icc_node qhm_qup1;
> +static struct qcom_icc_node qnm_a1noc_cfg;
> +static struct qcom_icc_node xm_ufs_mem;
> +static struct qcom_icc_node xm_usb3_0;

Please take a look at the newest files in there, you can remove these
forward-definitions. Otherwise, I think this looks good

Konrad
