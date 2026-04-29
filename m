Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EAB38911E
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 09:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455052; cv=none; b=EJHKlwcOH4RVS9aJh6ngjTF3XIsPjEfthMiF3wlnz/u1/yvQefs4A4STAcjQ6h2RwWjl/q8sFsgTdQUQeQvOrGcEoJzriC5LhJ2gWMPOCKFpgHaYyh6aAtJMgK6xddCI7rtjJhL9ExRpdphdDy9pEEK3G1UdrTNXP5S7QPDT4+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455052; c=relaxed/simple;
	bh=wC9jrPQBmpCZbW2mnXn6p/4PAelbyjfeh2Yka1RlPpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f1mjdG4NFuepuYY6H6XAjGv7EOZWpTZsIPQIKX3hfBheyRkxsru0RbMZ0eZaoz1iWH1v0JTGF+ma7E7MMSbjUf2q3Oon4dBJ/rk8N4Rb07V3WxEPClZfb7cqsWIp50coFuUaY0scULTUs+0vbM/oMSNmT7L4PG2W9C8OOrrTuhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9VWA6S3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V4Wf0eoQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9VWA6S3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V4Wf0eoQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qFNL3067025
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 09:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gTbNCeRSUqu4zDmkAqRY6ARTuww7wMu5rx1tnXDAf20=; b=W9VWA6S3iqRyvA7f
	IQsLcQMaUAo6MrX9KGt2ltCHppKvhII5yVDzVpDzHK2kuP0AaZslI8qh0v3tmdex
	IHtPapbJQePeiqdCjlTAhAHyEtwfT+4h6Zf8mY9rL59hDCZTT0mB7QUXD6jK/LEX
	YPlvGlHt/g2oCFgtmk6x9RRZqHkzt+idAJZfRqmiEEqUOF9drtciI0/PpY5w+sH2
	wGojjqWxaAsCUJXiE3JP1jCqQkACKt3T6EDFIM1KBOrrB9G53FbimPaNVhoSbKrh
	h3vOEeWBL3aHeQUyDP5coXfAtAd1BplIgxkVknbEbhHroHuyOjpgWPgJcKcqpcyx
	cjXoQg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du7sx9tuw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 09:30:49 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56f71af9dddso903392e0c.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 02:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777455048; x=1778059848; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gTbNCeRSUqu4zDmkAqRY6ARTuww7wMu5rx1tnXDAf20=;
        b=V4Wf0eoQAMEva3tDdlrX9/Zl9AZ1bYSngQg/oYmbri4DFawPnSwKNq3piwSd9kYUpE
         wJMOp9YezrpOeC69LdgSX/znAt2WaolwaiJKh1MceLb025yYmwEvSmSta/Jcq35nK+WP
         wBjGkelpYxRvdJkqEWpA+vLyGKMxCRc06xoyTg6Erw8FT1e+87RjsjHtDXshS6VNG2Kt
         Vfw6sTmLtrIWtP/Jrl+IbgfcTIJU+GcNoDXYWEx8Bj3C7x33mRyb6OzLQHgUhwZUN3ui
         dNa9CIjrWBJ9N0vDukQG8M/ieGF6fxPlbBSG3TD1Wc1A6l9DWi40S3VcUuWjfYoECdMb
         W28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777455048; x=1778059848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTbNCeRSUqu4zDmkAqRY6ARTuww7wMu5rx1tnXDAf20=;
        b=RUP6JHDGCvew96aD7AUP4qqg5/2MOkCVYO5pc300aDr70P9ntbFU2np1xW2aM+b1TK
         oBHrxD3p/cDfJlkUyvVf/TvjqyCfKpd0O5E738koAsdGAA9sPNdjcayhADgXmNYaGkE9
         cfqASy3u8+9xeG2ppBRNp1tCIt3HduO9ZUpfxgdAt280UJrIsQIs4845FVwE3Gi2NKPQ
         ds4fj4JTRaU9HiULl4fhLQYVkj4XguJy9/EMbJ/Pt9Fm0Wm7xInvp9PYiYZX4LnPoT1P
         egok1WMIjvQopDKtTLzh5kP7iU5/iv+UCCZaXJgzBBfcGW8mA6Mk7S9xaq+rhVqFOstP
         Cx1w==
X-Forwarded-Encrypted: i=1; AFNElJ9we5kuhFvMywDup36vbP325mD33vs/rksUa3BpZ9t7KxXoJUHJfz44QSiR/rgz4GZ6SPcJJ8RnrZ+r@vger.kernel.org
X-Gm-Message-State: AOJu0YxowPg1viZfdP6nRLjhY2VFN4UIeTzFF+9WlT36zu70xhwqzAmY
	qvWV6Gyv44YOGhGU9w6GTL8n06D876sFqV6jrlGNi0z7ZWTJiiQIJM5ugAvMqeEK5Ekl365IOjK
	tW7Z4q5mc1SnayuuQ3rKJp2/+mYGkBNhx5nXZWjDuDGpG9Hd4U+geqC/6bmhcAnyc
X-Gm-Gg: AeBDieuHyE4O5mEQmUDeONecZHisyeTSWJn+9en8au+nEXCn76aTub6ySPgxf4C2tsi
	1XzxKmP0mMQ/vAQnClj+47vzhGOnqhjDNQEl13UK2d5u/k3GsuhdiJbL1N6vfWc9qLVcaM0egzh
	l1Et0MUFMr8GQ8YxQwZqMkK97XX84x7M+mkpjJmx/g71/5zThewUvEhpW8U/zIMXz7j4XgsYBr2
	LIsW2wcqwb2s2bXkk85vMIM8SO/w3mQCoM0C6Q4ZYMb41aX7F1/ThxISt6qj3n9Jz27kxrQ37ky
	yeewN8Dyoe3gJzKwDV8VljZ1CetlcQQIleLm8lVEEoedrgwh+da9Mg2onjbkarlm4Tqb6lu82eH
	ErQaTuqomwyyh6byOUoH2fMTO+oKnZxrxif6vqEZjecFgNW+ZJ5DhhijCbt+zkquF7qewU6j1mQ
	zoxEOut/8LQOSjeA==
X-Received: by 2002:ac5:c894:0:b0:56f:6edd:77ae with SMTP id 71dfb90a1353d-573a293d531mr1234273e0c.0.1777455048473;
        Wed, 29 Apr 2026 02:30:48 -0700 (PDT)
X-Received: by 2002:ac5:c894:0:b0:56f:6edd:77ae with SMTP id 71dfb90a1353d-573a293d531mr1234254e0c.0.1777455048034;
        Wed, 29 Apr 2026 02:30:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb985e1b108sm65753866b.50.2026.04.29.02.30.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:30:47 -0700 (PDT)
Message-ID: <aadfa862-a99e-4214-b19f-6854672dc8d4@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:30:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] arm64: dts: qcom: arduino-imola: Get WiFi MAC from
 NVMEM
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
 <20260428-block-as-nvmem-v1-5-6ad23e75190a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260428-block-as-nvmem-v1-5-6ad23e75190a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: F2rWrYgNK-GxEXiMJy_42tVeqx7RmKuw
X-Authority-Analysis: v=2.4 cv=eeANubEH c=1 sm=1 tr=0 ts=69f1cfc9 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5NSBTYWx0ZWRfX8n7sct85Gvi+
 xAuurzRN+ykc88kn0lDp1giNHslRSQv0Go6UCw4hnFvmW0REpY3KG7AhJQGE0qrKcTOAbLsQmoE
 bxDgELnwnetHrauBJ3/HZbx4DV5jhReHykhT0/L4YFZzLkzMidaXeYM4tFgMFtWhmPCZryoS2vk
 WRNFv5xkUxEWiQzAQmDQ+IscqqmobqHrfl2kj+oMBYzSubGw2wFx41fiJnRpIV5NaqrgH/sx0K1
 Ih1WZzqd2wb2pN7iW4GZ5VtRX/Ny82REHlhM7ciyGHwiiTahWf6imQgitQmwVPgyQP742I7tbxt
 u+YlD1DN9ILUE+klt1r9rtHac4xSlox3wSyyT/qXOqZWISGjvmClvPpFp+mGJ3DtCo8SJvco5eC
 HvEmU524J/gzDWMFJkUHtQ7fKEznwND33BFLIRu8nv4E4q0CTGx2VW+j54RwWRGUmsSofPYeS9x
 nIR4C8SOFzkD7DmeFTg==
X-Proofpoint-ORIG-GUID: F2rWrYgNK-GxEXiMJy_42tVeqx7RmKuw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290095

On 4/28/26 4:23 PM, Loic Poulain wrote:
> On Arduino Uno-Q, the WiFi MAC address is stored in the eMMC
> boot1 partition. Point to the appropriate NVMEM cell to
> retrieve it.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
