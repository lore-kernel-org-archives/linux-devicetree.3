Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9AC2475D0
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831405; cv=none; b=V9RU/Zl2zYAxcEElXUBxor1t4/lK5Z+BZ2CY+6I60sJg8KM9LX8nTmJNkZ+87SL//TbjjlVWkAK41gBgBKUVD3PKzKfNf0qWJPXEdxYkOrGTN6qjnIdgvnEibZedzDrglFORGaqGsUMap+6NEml94gu/iXr+qhqOXuEUgxZFhOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831405; c=relaxed/simple;
	bh=R3Og7UN2n8n9LTZTfx1vMc5jN8NgotgtqijYcSnTn/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pNWIhunHipYIoKeHoibw2kKm6LMqMtJRieCM+SNUIyxghYE2gR25DnX5NwbNL/MAqGeOQyz+63qNqxHSL8wu8qRSENvKWVGInKvqnyEvqeUBRCd0ILj1AdkScyaIHpyLqn2PO3KNEourmpOQLq/WxQQDk6+Uy6cvgggDWJ/U18E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PbDRoupy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fNiDibid; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PbDRoupy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fNiDibid"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDRIc2225679
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:56:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dgvL7NjSVUKBYdOnhG+1nuU7W73bphG+krxfU0rVXsA=; b=PbDRoupy8AaJpDHU
	v96GzSIeByyyMFP7M7jBSf99kw2LGPuGrK6Fy46NaaaWPKbRw8Uj/ru2/e+TUgUR
	e49p5XQRsJDwMvFxug+yjpfKAn6ea7Ob46kdR3NgwDecfEULxYYrxXXQexzJkKMe
	rW66xObHFDh/d1N1ANIk8S66/4gUEcf9AuiGPcKxFM18rmynOUOShQXcyu91kaJZ
	mN44BrCe74H5URuZ7BznmzOdLIkSe1UzzNSSfakMvdkz0/Xw5fDqO+2kF7lBDeFL
	iJk2Ccbbuc3pindVV5jw6vFHAjPgZxseQClnZg3VhNGz3CY+etIHOdU4/LTdyF6r
	+M7DhA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gu872-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:56:43 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8895156101so2153431a12.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782831403; x=1783436203; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dgvL7NjSVUKBYdOnhG+1nuU7W73bphG+krxfU0rVXsA=;
        b=fNiDibidiR5z5w3dtWU+I1/pLsQPybtmYNSD3oCVZrZDEBu7vWNwT8iQjS+zhq/e/j
         gVjoe4jOuy54Dd4dCzbTXw33fcJ3t8Wg/FNj7WXTlA+AbEjNJXVY/pFRr7Lu6yxmgbcz
         w75a7W/Krb8GoX2LknLYzZmsj3/2VplEOUP1klNpgjoBtrd10vf8RDfmP21L7Kr8zRlq
         hU9QqBHjFEgTV7H7asRUEp3UYQt6thbOfQXizZemqSmjqfHZQTxhY1Z1hbf4nnYiz6yC
         MKezsClf7ghNDFSmRd5rtq2t8qhMU6Pkof/dkLyvzVdqPuHYmijX+TWDQzgD4hRJdjjW
         sCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831403; x=1783436203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dgvL7NjSVUKBYdOnhG+1nuU7W73bphG+krxfU0rVXsA=;
        b=Va8jCa9OYkAZTcq1JcPWhNAQDE1E7xizacG8IXtXShPlWdONlO4WeVSVG/L7FByzvi
         JD/5CAQPss/asRnG/t92+RkyXwzJLrXiu/usWphYXrbF/0X6Ild75Lvv/lZ3sXBQiscd
         m2LJy3/FfPYAoYl+1t5NoP9+K2IOp3H4KTbcK7QPwIdvkLXIQBy37ZuHflS7++zYAak1
         qEhLyhgmCP6c+lLVoEiD/yBQI9Se7325fIwfjs8AGcKo8GyykwGnsD86lc9OR5dkGs21
         s9DU39m38TNwVxNXJ28eFqT3tLRWKhTcFtuyXeoJ+XC1VWH9UqB66PKFDUqqj6m2xE28
         /sxA==
X-Forwarded-Encrypted: i=1; AFNElJ8F114+afW6oihNuHsspPh2La9SLeqUekS0JHirRu8S1OHkvo2oKaW7I8hdNWJvgkIqwPxLRH6Rl3kF@vger.kernel.org
X-Gm-Message-State: AOJu0YyfCzujZQsNU1LG5Lia0+aeJKzpkRmZwHvQvjjLKs5sFNRn1GL8
	JuKGRpAQQfaUf1yJo46oQK/Y1gns6UmHF3OGBJ/4aZD4gJ1N07atiJdkfTDrFATGFkCmGgEsIEx
	ToxvXHB3fqhg6jVNVW+52eA8EQqTpI2FKGYo8bLlsxZvSb4HCaY5PLtJHarmDXBuy
X-Gm-Gg: AfdE7ckntUEoaMLldCYUjWPQDl7G7aIeawLJrCHwT2PyKxKQQKMbG90yuqH8TcrwjkI
	rNuoOnGwYIHtU1kY/vZvEp0eFJAJMqJLLs3gfITTgHHOQIz8vu01cbJfPOkE099jXw0xjD9wElq
	csc9DW+/DbtQvWQEXLWAY/1lBP4LUnA0nlCan1bhLFPsZU42/NnAw2BHBVuvlxzZuf+fDZBWQBo
	8D8bpSywu0fWcVYYoSaMsiemrNQs5gLSATXHnNar6ig1vYfbLh5K4R6mvowND6D96F8hfco86gP
	De4ECzfg3wu9X64vbWq1YlEXStYMX3WftNUlvcSpunQWPsw9mFaKIF2oJp/fek0hJLl/LaHmxHj
	0SR3lsP6diOV7GxQyJ9EFOUC2YzjyiuaE
X-Received: by 2002:a05:6a21:687:b0:3bd:187e:2de with SMTP id adf61e73a8af0-3bfdc359071mr646904637.25.1782831402841;
        Tue, 30 Jun 2026 07:56:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:687:b0:3bd:187e:2de with SMTP id adf61e73a8af0-3bfdc359071mr646883637.25.1782831402423;
        Tue, 30 Jun 2026 07:56:42 -0700 (PDT)
Received: from [192.168.1.6] ([171.76.81.78])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bc02082ebsm1824121a12.26.2026.06.30.07.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 07:56:41 -0700 (PDT)
Message-ID: <68dc89e8-2c91-497f-a665-4a7a8ad2bc76@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 20:26:37 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add Purwa IOT EVK
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260629-ec_support_for_purwa_evk-v1-0-e082b70138d6@oss.qualcomm.com>
 <20260629-ec_support_for_purwa_evk-v1-1-e082b70138d6@oss.qualcomm.com>
 <20260630-unstoppable-phoenix-of-dew-9f0bd5@quoll>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260630-unstoppable-phoenix-of-dew-9f0bd5@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfX6K5DiRTNHqwv
 Vdu5a3VejwcmXBEpg8nZgCQbLUzqS9nRJI3SLZNYMp55vACOx4HkQt080w3pb/qPMFtP2ced0Ad
 4sbHPBurBNZfma0pKm1X6ALm7mjc/dA=
X-Proofpoint-ORIG-GUID: GO-tkFoj80vonQONb8tAkoMyxd7oZZA4
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a43d92b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Tlw+mRs2SjLwfDc/NrL+bQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=QOAcj8qZypVd95KNxhoA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfX0v4nrIOazIlG
 dxAo1FH7bgKjGdq2GGLztUoscsYsxj1mDu6b0/1+Th6Ji3MKAu7sQeUrjKCRSbygEm8KuVjqUnd
 cKSBad1LUDSITFRO3F4qCkOL/HCSodA3svRLfpax/2Razq5fHo9AVUdqlZWE9Yx0Y8elZZyplU6
 SiDbZjWR+YPCp1TurtU6QLzKRd/t4ywgn0NeuBJRIles0WbzKaZn1EagbDnIFzp3mebW2xNEe34
 U+JrHlfl20uvoP4B7neMFqSt0Y9bh7cUNpUSAnCLdEpr2w6RrclmS+S8P+CY9QteJ1C7rhHRWcQ
 aV8JIHrOohQ2X9Tft0eqm6EwbebHQUDKnHmTDAzcVI6OKzzqvqoOh5wMKkKRtzak4ok219GqLPQ
 Tp4npsYy4D/4wamk83jeaE92GCdyaaEjXUOD93trSrxOPJZjkzJhp1it0bQI3/A7FYwYymVgIjc
 Ye7Tb2APt9Tb8aKc/Hw==
X-Proofpoint-GUID: GO-tkFoj80vonQONb8tAkoMyxd7oZZA4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300140



On 6/30/2026 12:49 PM, Krzysztof Kozlowski wrote:
> On Mon, Jun 29, 2026 at 04:10:17PM +0530, Anvesh Jain P wrote:
>> Document the qcom,purwa-iot-evk-ec compatible for the embedded controller
>> found on Purwa IOT EVK boards. Like the other reference designs, it uses
> 
> EC on an IoT device? This needs some explanation of hardware.
> 
> Best regards,
> Krzysztof
> 

The "IOT EVK" boards are full Snapdragon reference/development kits, not
small sensor-class IoT devices. Like the CRD, the Purwa IOT EVK carries
an on-board embedded controller (on a separate MCU) that handles fan
control, temperature sensors and EC state-change/suspend notifications.
The existing hamoa-iot-evk board already documents the same EC via
qcom,hamoa-iot-evk-ec.

If needed I can expand the commit message to explain this.

-- 
Best Regards,
Anvesh

