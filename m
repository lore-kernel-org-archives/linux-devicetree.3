Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E0734A79D
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 04:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780893341; cv=none; b=Gx32Rt6+6/LMvqNgQ0gDgI431QlRd9RDaw/4yvmZdBR18oH4j/h+CYXYNzpXHWCZjnEqXfMV5BEwtgtUxtcAo0NQeTXqX8l/oF+ICginHPYEdPNFjc2UQ5acXUykeKu/oxB0BArL11mVDdtagSp5zygy2Gtw0O87pTE9csul9jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780893341; c=relaxed/simple;
	bh=kD26G8uJeDiGn93yq3ONwoZDPErjIr20+ejuLcBB5Z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l0g8pSWBqnjhAqHuY3bt8vYiD04FAe6WwCF7qtqC2qdmeOk/fUHizwfgmlch8Vo6MQ9rOR/UX3sPAClkLwDA5XKLirKiI6a9MHXKel6X/DVLr9lu3rrYCNxi07HlqQpJaRd2sgZJVqtDuex41EeEqUUdrmnG9S9L8r8pGL0CKsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1yQn3+s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EC5moalw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R1yQn3+s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EC5moalw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580Gdfl1991629
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 04:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kD26G8uJeDiGn93yq3ONwoZDPErjIr20+ejuLcBB5Z4=; b=R1yQn3+s8FvlBOVO
	Cpw7APe/1PI73ssw382rmFFUqPPGvdFVRDD5eGwk3NHkinvZ5Ch4sMHIWd6cJkJ8
	a2uR1JvVD9Xa0q4D1R65I/AW7Wwv7DMUS5WRR9qTeP9Iia8lMivv9BwUxITOsN3G
	/w20jE2DMvQiQPCNoT2wnKDZseD5/21dO3wKYdIiR2SWfDSZVt1kph5dBlMB4NGS
	ymAQUXQGsKLsr6eDnwru+ngU4WBhznz3SRe6O/wZs4D/wcapoTElRAqsJ0ujZboA
	R6E+Ns5l3+4P9jWmdK+qHWbzMKXlUzO/USjhVK7hEFHoZC3TuVL3SFXnKeFYFDRH
	VxojsQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3p745-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 04:35:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d992fa39eso4840246a91.3
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 21:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780893339; x=1781498139; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kD26G8uJeDiGn93yq3ONwoZDPErjIr20+ejuLcBB5Z4=;
        b=EC5moalwOfHXBb49OmQfyI5167y92h+qMXydweiQw2+lUz4F/J4cI2Goq0MGCnkKi2
         gb7q7p9saz2d+Y4DPa2sCeXIksaE7qD812Xbqb41C8Qz5D2BuZg8PBVWm7w+jhm8k98J
         hWT1QRD5GKp0/YkwdTtPV+T2oTosBdhmHjhB16D4V+eDUuaEUUI4uNtGG4HPx4egA/CB
         aWhdWFGIcrht0EgfsPFbCzBIz7IiY1uBtGP/DB523/fEpGxIMEz+oQKobSIh8C9pZ87x
         Uu3XX8zFAvAM0NfhnSDJBLDYdZ+Qiw55uTD2/hacVLf2H9xthk2XSYDyaWlD/eYe3h+H
         lc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780893339; x=1781498139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kD26G8uJeDiGn93yq3ONwoZDPErjIr20+ejuLcBB5Z4=;
        b=Sa/xAsjYo56sDj9qZRctD1+2Ngl8rK1fncihlmQ0E7KCBvjcZRdI08tZxoR+hRiTXX
         w87TFi1jiUO+xpNXP/eUTy/gF1zUtQz4Xgp2ZR8fm7lhEZJYlChVdsW7NnNHrr0xvhAK
         SZtys1itFQcM8cuvfVlhZcGFzEFeYDa1mLfGNWMq2Nl+bB8f5McyTPDzUQc6y99/UZW4
         3u+iKAN0+BHIfcdNmq+mUS6r6flU9JmyRObqDFp3Q2NnQaSPV8jMkQbiO/f0Ufs/iHoS
         rgo5r0iOOMdr35ZxFj9wB5Ea3pYj75glrV+bou2SxatW0zoiY6S+9BoSfqBhIcTzYb7K
         pSYg==
X-Forwarded-Encrypted: i=1; AFNElJ9NfExHkoObK0kEk436ZP/KLd8j+ldB9/vjTTBlWAS/lmEW3ACa1cJSqVBBRXXfnEz24Xwef+nXrpQt@vger.kernel.org
X-Gm-Message-State: AOJu0YxfRrINUSpx0VIrx4v1ZFIFqgfJACrscZbhg3EqhiqN9gQPzE5p
	llecytbBa7mAISr9HTjWidP6o0CXCx8fYY8Xhks6n1NdSjyDWHsWYSjNOIfEa+lxBNwyHvOWphL
	2JfxBRqWxLzKnBaqgDOrEAqARwAJCxaD9QNXVsUPrT1rciwcFhCJQCMoPIi4UAEh7k02G7v1e
X-Gm-Gg: Acq92OHfBBRuvRXkqPhS+BqDLSFPbVudcjoMxVTxf7qyPkMx7Ma0YbPFhMqhH1LBRDA
	V/kz8OgNYgxN2mDpfoJglkLHGpzx+79G17zJpwwctQ7/Sa8ftzG0FiA7QqRwP/2FC4BsKHyMmwt
	Qw/vxQZ2yvjkLl8ZoSmYHQXCGRGi838okRVFizswisRaWRc2nEwLy6j0nlcGl2opDRyqg8k5/b0
	zoBgkLDLZKkvbwfmgsFKfZHyA1K4VV9Y0XTjUj0ZXELmNrsJ3NDWKAX/3uGVg60q/EPilcBqIye
	9qLUbXJLodamSdN38hzP8VNjog7ckNHPoalkD4vKjRTZFW6T9GyFrNxw1uTdQHwZAT2bLVeufLm
	kLPs851JyvTdx/XO5iMTklJWyMuMOWz+pQqWvNWDZZ6976a0TXHLQtVUbt70OZGYj
X-Received: by 2002:a05:6a21:2c11:b0:3b4:81b4:9b74 with SMTP id adf61e73a8af0-3b4cd0cbd08mr17473632637.42.1780893338666;
        Sun, 07 Jun 2026 21:35:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:2c11:b0:3b4:81b4:9b74 with SMTP id adf61e73a8af0-3b4cd0cbd08mr17473592637.42.1780893338160;
        Sun, 07 Jun 2026 21:35:38 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8630b2fa83sm897691a12.10.2026.06.07.21.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 21:35:37 -0700 (PDT)
Message-ID: <aab3d70a-4939-4f55-a343-4cdeea8915b8@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:05:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: PCI: qcom,pcie-sm8550: Add Eliza
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260601-eliza-v2-0-6b44c9c23d5e@oss.qualcomm.com>
 <20260601-eliza-v2-2-6b44c9c23d5e@oss.qualcomm.com>
 <20260607-devious-active-bobcat-1078ab@quoll>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260607-devious-active-bobcat-1078ab@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAzOCBTYWx0ZWRfX8caZlhvhzyYl
 JIj5eSfGPDvkuE6DbXKRr0wSTfw1TR0tXm89Z5YFCnC9pyGrUU3R9x/erHkBNI8HjYbgkD0kUxa
 tiWsUrrXGkRDgwdO9UpZVqT2a8aZfcaqDJAFJzcJIJwxXOf/zIxG23NvLzgCYBfI4BDo04fnjqC
 JstaDlSBbuu9Y0+TK/u8W2pP/SvKjiGRqrNESOKVvSOHdYxt4emCzYYOEfhnTbODnujPdebGPfS
 X9DqUg3koGbtAdTiq+gPoOSOtCA7xdFU6m3s8TZ/S1Nqb/ag/P1i9tq3CXBXGcFRGZpxlEVD4Qw
 g9ScOxzFQvzONsqvDaBHdZpH9RCSoxR1zNS3qnXsX6w+NkV26q9retmuBXR/6TS6HOEqN+xp36Q
 pYtK7E97HcB5HKVB5guqP3KAdC50ovfaMeQBXXyWaRM+lCgTPIoiSr2U1ceVRJ3OS/Ubw2Z9PTN
 tERHtBShRZn2HJYooyA==
X-Proofpoint-ORIG-GUID: pM35NJXA-IM0L6rSbkDGkPi2SMo6ge_l
X-Proofpoint-GUID: pM35NJXA-IM0L6rSbkDGkPi2SMo6ge_l
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a26469b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EOzwYm5HH2NjlfyU_mEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080038



On 6/7/2026 2:18 PM, Krzysztof Kozlowski wrote:
> On Mon, Jun 01, 2026 at 10:59:45PM +0530, Krishna Chaitanya Chundru wrote:
>> PCIe controller present in Eliza SoC is backwards compatible with the
>> controller present in Eliza SoC. Hence, add the compatible with SM8550
> Eliza SoC is compatible with itself?
 Sorry, that's a copy-paste error in the commit message. It should read:
  "PCIe controller present in Eliza SoC is backwards compatible with the
  controller present in SM8550 SoC."

  Will fix in v3.
>> fallback.
> Why reg, clocks and interrupts are flexible? Are there different
> variants within Eliza SoC, e.g. one without msi?
There are no variants within Eliza SoC. The flexibility is inherited
from the SM8550 family binding and follows the same pattern as the
other compatibles in this file (kaanapali, sar2130p, sm8650, sm8750)
which also have no per-compatible constraints. If you'd prefer explicit
constraints for Eliza, I can add them in v3.

- Krishna Chaitanya.
>
> Best regards,
> Krzysztof
>

