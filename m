Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8AE4A92D0
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 13:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440813; cv=none; b=s/bjSQ2h2nTwN91YmyE8SvU9WOK53U9dw4npkpXiC1epNPxMTch/tzxuLZbDjj7XkUjnjgblzjvD6L2rnYlyCKXzrI2YAsaJQS/cJeTvfaeysIsq/RQkNHSKU+9ZVqPMGYqfYWm4KaXrmGePQYpsWaf3sfmDfzBHGLacw3fe1Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440813; c=relaxed/simple;
	bh=uC5pdAlea6LMnedwQM0PGV+JAkluCoB5iEpR2eQXpZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S2t4SRp73U2anp2CqpWlJwcrUda4b8f+sqOGf3F/8fSuMfXElKXPH8dfiiKzYd1aofKdg636M/BpGn5QOqG5nUcVTKUA0kS899MORQv5E4zqqO+15364EDHRU6aNwnEe9SVI42iJ7bh8gcaHalvp4mP61Tu2VQ4CZuWOSXGHjBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRUwjl2S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jQh3slqi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRUwjl2S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jQh3slqi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHAnb3782251
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 13:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L7FTCZ/aByMpjCgQDlXO7TQNA6LL4vCUqNXUxyjwvow=; b=oRUwjl2SEK+mHr3E
	1TXajAMLofOfaDwYYs/WYpX/pLre2StPysibiKYKi7DxlCYronRzN3jPKd7tIjkq
	2BBAGVOh+PF5It0dtHIaIlBqfkXNbM3UDYTPfj1PVbAU5ZkAex/5BRSLPJDhpAu6
	numPAlvY2qkVXW36geDJRex6X5SDRV/czdbAJrYosgEGm5dSt8IOPE/hhlXnHdQ+
	HrrsGqzycw8vC9tgA2v8l9egk1mlh8T4VoeIQjKOjyDoP79n/2HhtJJwrodk4SR2
	34c7lOiDTdvAIWKdrP+pRTf+2xIUHQnVVusJ59rFDupIu5arDfeb4l24EYSPLymR
	ktm+zw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5pds096-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 13:06:38 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c39b4f3229so128810e0c.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 06:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788440798; x=1789045598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L7FTCZ/aByMpjCgQDlXO7TQNA6LL4vCUqNXUxyjwvow=;
        b=jQh3slqiCNnGXYE+D0K5mzkcsJ+VIGsY69fwZKJqf3bFrUAdNRQEUbUckH4Juglqs+
         1GmVCCbHRie67oE4bVn2VGteZLtOFwU7Cf+wS3juNTCfZV/m3sMaZ6H31vZUUZn7JI1t
         VvW/oA+0WbDv7dtyFH8qa4tof2M5icTa6tbHj46ADmfyhbIEksrgC0CkpiIfGw/ZS9kW
         UVQvBR2v/NNjPoVMcOLjJ0Ennyti2D3nc998P2J8jiV3I7YMq/GvIPZGAokPg1MPVumB
         clJ7uQ/z7zBIO93S3oNDchJNHW+4MYU1/b0x6gQgGpF9kt9yUOF73t216QMlWloi0GlT
         WJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440798; x=1789045598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7FTCZ/aByMpjCgQDlXO7TQNA6LL4vCUqNXUxyjwvow=;
        b=ovAeqhxH27IQtnZNkC88aFE24X9ATKgOFDV3VR/RUdw/n+O2/V732l0jSbxgXjWXRV
         ZsBhzRGXjjqJJyffvJ+TfVjgqovmCiR9fceY+iM4ukjLaNLkFwoAbYbEXDK5SuCBdW1X
         NYRWhQcDbdEUpuL7+kTaU+CEL8P9ujExc9ISX7x6RiJ8Ff4ic5F5boBL5FuVec3hDpHL
         jPnOSgB/U9VjlEdtNvantSERXBRf3jNPZ9JPGICfZ7zsotF+aT0qWfP2PCDzUukPu1KS
         zBSIk1WxXHf+judvJy8PkQRJUP1YLJUdTQne8sAq63bW/fP3gTDu2Io2HcwAxt4AallM
         1vCg==
X-Forwarded-Encrypted: i=1; AKwUvBxoeczOnmjw0oIZGIhFdIKRao/0HYZAfu9O3KLSW/k1/PipdcCKq924X77aqlQjbqAurG7KOILAe9xj@vger.kernel.org
X-Gm-Message-State: AFuF++kGc2IXJoPLOAehspFAXcffz1VolrR8kEYcb2lSQxsv+Eggrx+7
	H5A/zk3+MPljCCFC+bsjjyeT5s+3mklLBnzQ5rxdqplLYZB6+0vTwJFAO0rph9Z1UyrYUcZLyBm
	lKst2uPl4F81Qc3tdGDnET9JhVVXhMWxc1BdonReXy9I4DyjZyNrEWTF/OltOB0Hh
X-Gm-Gg: AYBFou37a8n0x4IpNIofYgrKt6KmEG8ApHOBdWjFjgG+YVBaJrqzs7zyYgyHihpJaLe
	hE2ixwhHtUSaIozFzJ6o6Po+z34X11wj1+S+SDLq2oYKnwkCd7hywNiOA+WU7KqP0vhxQTXOh8e
	u0sCiaUY8enBVEhxDW0Yk6ZpwS0xQwuLaJZBybQirkkmeXJQxvtO3VWiy1T1z3TXmcGdt3FUPiZ
	xx/eBCoI1N0lHEjF58cNZ/3pNGZlnjuaW9W2i7y4CoAxvHLSIt78H4L7xp2q9NL2K3z9oUyLa0L
	euHHnP3Q7swGpSnWGCTJy2emARFttVpaGTYxu4j5srCIgABcpCV7HSAD7vIY7HJC1DWCve3B/FL
	9JQCEyV/GZ1DoHY6uTjiUOA==
X-Received: by 2002:a05:6102:5490:b0:789:3ef2:1da1 with SMTP id ada2fe7eead31-78a1f2db6b2mr1904415137.1.1788440797700;
        Thu, 03 Sep 2026 06:06:37 -0700 (PDT)
X-Received: by 2002:a05:6102:5490:b0:789:3ef2:1da1 with SMTP id ada2fe7eead31-78a1f2db6b2mr1904386137.1.1788440797263;
        Thu, 03 Sep 2026 06:06:37 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f8b53edsm2193707a12.10.2026.09.03.06.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 06:06:36 -0700 (PDT)
Message-ID: <bac552e0-8d21-490c-b628-8da860cb9371@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 15:06:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: monaco-evk: Add LVDS display
 overlay
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
References: <20260813-lvds-support-v2-0-6b11035e8ab0@oss.qualcomm.com>
 <20260813-lvds-support-v2-2-6b11035e8ab0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260813-lvds-support-v2-2-6b11035e8ab0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX+cnQS8+H8UkE
 BUeCD2QgFjmWDADyhX4TRu20Yz1g8A4yAceHnplCnGcwz6DQT4BxhBrilpQT8a+e/uI4pHAvB3H
 18amaWEkDpNKkYIUTCAxyMi1+JszWxk=
X-Proofpoint-ORIG-GUID: RBWBhtuyFdlYCt7jN1vff5exZhmSVBdF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX81VNahC1mYur
 MTOpd6y96GR3l4PoAx0olTYgcbHY8Q2Ws31qA+xoJWXWEPabnK58zB7vNpeCSSe2ON7BxLKGQWq
 Nnd+5c8s88mGrAX4aUjHxDyqe+6mxxcCQiNWnneCwCTlVRPOPZozDszKIZ0ax8/GxsB+H5DO0iN
 eRqJrkLTxoll8wHa9ZgPg9vV1IHg3DQv3H6oK0pyQyad3doxheIRSvMgw9xSBzMtQRfDb3/9sO5
 xAzHPAYZuHv9e37mi3LMXfI9jOWYmsbJBEWF2bHIDcAfVuV18iK6DxgLmF7aRwZViuF4ZjKF99B
 go6GYn8ZV25ijIYItdC9p8lGvpvciz8UVPf0eX6XlzPoNilWD9TgsyEo11tkbP1dhkQ0SNZzdYx
 tFoewwsWQk4K0wE+1HXKpKuDRcieAwqNQ9EbaPkRcb8uI7d+idvDPae1YiVqyotRiWkyoza7fML
 akjSvd1K84s6zTyc65w==
X-Authority-Analysis: v=2.4 cv=RsL16imK c=1 sm=1 tr=0 ts=6a9970de cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=DIbA0zq13t_FKQmREx0A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: RBWBhtuyFdlYCt7jN1vff5exZhmSVBdF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030113

On 8/13/26 7:33 PM, Vishnu Saini wrote:
> The Monaco-EVK mezzanine supports LVDS display output using the
> Lontium LT9211C DSI-to-LVDS bridge. The bridge is connected to the
> DSI0 output and drives a dual-channel 1920x1080 LVDS panel in
> VESA-24 mapping.
> 
> Add a DTBO overlay, monaco-evk-lvds-boe,dv215fhm-r01.dtso, that wires
> up the LT9211C bridge on I2C8 (address 0x2d) with reset on GPIO66,
> a panel-lvds node for the boe,dv215fhm-r01 panel (matched against the
> panel-simple-lvds-dual-ports binding, which supplies the panel's size
> and timing internally), and an LCD display bias regulator supplied
> through the GPIO expander. DSI power is provided by vreg_l5a.
> 
> The overlay is built as a composite DTB combining the base
> monaco-evk.dtb, the IFP mezzanine overlay, and this LVDS overlay.
> 
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> ---

Same comments as patch 1 for patches 2 and 3

Konrad
