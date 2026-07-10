Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDEF24BBEB
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691535; cv=none; b=Oyjt3j9OFqWVm/N4acGuxUOo84eBhZiRTFZCFNnpqUUCVQAXfZz7nkAUMSbU0+65kteMU3tSFNFM4qDwdMttpl8w7E/syPkrPCD6BtbuOfrDJu57xyWlPOrP/xIoucra1gBtyJnS8oRjgoBZKiOpqdF2jf+s2vmKRk7QaY8Phl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691535; c=relaxed/simple;
	bh=T+94v/mhf1HExZVucFMd2pkp5EHL9rqN3VfCf/LbgQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kTPYv7fHqiXtikKNcA44oxloLflEFuoWjCSBR248vi4fsLuHpJcrey+qiXjOPeMRTutVJDYb0FuGeOqbRcjbaGub1y6lmWC7guVjS0GAJp3Xl9x47UvMjUorwRdQr0wtThvGCXLFWgLSxpn3P6axFRwlo1tUAAYv0ny0aDBPQ84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZVJWk4u3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJPv22vK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZVJWk4u3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HJPv22vK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6NUc873467
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yr1He9a3vmYU9JrgMvIeXSpzOub1puB89opc9sNrrRI=; b=ZVJWk4u3iCSvWRz/
	Lqg5zphbwuuc6Wb76ux+UZJtxl8iD5dxHwZCc2OX/pFc3PHPgilSwSvlG1Aip7g4
	dLkY6+4IXbvUX4/201DfdZwukoU/cR5QQ/KrBpBBFXpxLXhlGo8/FJTKx/Nso/fk
	4KJylCLpcdWp57tSY6rvMIrBb3vPTzEniK0q+kjhXSR2y35Td9/ta5vhVTCZjUW4
	mm1+mm1xfeJRBJlR5oogf/jDSS0l9ipfbTCCBGmsYg6bDGrV1SuMrL3+NjEG9ISX
	oLrTAU4FVuA2s+PKVYxcGFOJfnr2EhYy9VEWq0EvlhyVQXbrG92UqsRFLKIOsXLa
	PJHEjA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5f8wr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:52:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8fd356ee3a4so2874706d6.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691533; x=1784296333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yr1He9a3vmYU9JrgMvIeXSpzOub1puB89opc9sNrrRI=;
        b=HJPv22vKe6K+jpFUYhKLNnYXr/cPeaUI/TvzDpVVwPVqmx2ln/YUrRYGvNXREzAMX0
         qdSCkooJgJIq2XbwttUsXsSUHlAZXKR4ufJyLXbHGkfc0oKojUssVzgroxHmvClpFEye
         GzhuQZ5O8ixDGL5W/RvHZR9AQHz9loQbNJvaaInrc9w3uAjB1JpBv4F1xpBL5oCEXYxy
         xHKyrHLpa2xgsBYY2CKNCfOCW+cKLbFdCqkCaNSturu3Sa1JH6jqvfARQilGjZN+C3EH
         YZXxu7xwqFBAR5z2BNtylBZbQnSh+LW7Ny9ODXb4eVdgco9+UTLOlSnNTeBIGF+W7DfQ
         pfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691533; x=1784296333;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yr1He9a3vmYU9JrgMvIeXSpzOub1puB89opc9sNrrRI=;
        b=qoBRSxQsjeDKRCrkW47SCM1fL2pzdPmJXD29nVnMg3W4ipjGMNLWejkbjqNMP1PVl6
         OxdmdKumRBt1WrlFiI4XoXB6qV9qvp9lFL1q/2WS+RytDhQ/ztm74RmBYRmYGjPy5rNn
         79N0TMoEfVrSl/HuZhHQihdPVcwMB8uJ0kBIKqloj3q9XIoisqQBndnB8twA7Dfdw+oT
         luB/n8Vgm2VVpXaQ7NFrvJNMYqpultE+9bjFnMbmUZsRosqGgCylHfMfvRSk8ydDZW0A
         kBZ7DBu5vwvlfLKiHunZa2e9Ar7/bL8EIVbPfMotd9icC7Voj3OmE4QKguZpdGY3NFJU
         tYgw==
X-Forwarded-Encrypted: i=1; AHgh+RpWzXDQ85jtfRnaFoo00ehhdG2VT0NpzXwYqv7TZ95fXP3Eu7GTkDfflSldg67pJ5wL5hzMNeuIJmto@vger.kernel.org
X-Gm-Message-State: AOJu0YyhzG0Il78hgF/MYOsdPu20sgFrnFJsalQAcigx1B0qWOb6Gbzo
	SZoapqZBk50lVMrZEBKNwNfyJXQERf+sdDUaIeqBq4U+hp/4vhjO47kIQLFXIjVsYL57oUAsAE/
	le44MUGks+PWBSLCMCkL4jG/G5c7pd2c9KuiHMDHn1N1KO9Ox2DAYsOGeTwO5silq
X-Gm-Gg: AfdE7clpElSy1JpOEzgS+ZmPDI1OaxGyD7Y8UHlrmbRZ43KNPZ4XJ+6+6SFpPULqLkp
	+FKhmIBqVYrD7iDjb9o9794jStwd1d3QI4zVuTOOqbo3MXt2t+c5FHjhyJ2G+9nyXXZNbULzOnr
	Z4iRNC5m7rpdHV/mfPkFw1m6rdEJ3ESLN3FDv2hF2cOd36ZKbz59HqpRfIRy8+pC4TnckoG9W1/
	FPS5hVyQk4TS6HfyvyyJWB/L6Q4hj3n3h7Jn3VUpzQ2YojJ8kMhXb8ZVnuN6IAd26iOe+48Hbco
	mizfruP9iAbJJrhUIkARQJl5vaO5d1jVWvjeJixGfgMo2TJ1PvWwYZKJ0zOf0obe6ivc5y+80tR
	OnEk6JEGSDDwHQN9hLxaJG5+khJEXYJvIYsw=
X-Received: by 2002:a05:6214:40e:b0:8cb:e65c:e527 with SMTP id 6a1803df08f44-8fec5b45e37mr105778176d6.1.1783691533030;
        Fri, 10 Jul 2026 06:52:13 -0700 (PDT)
X-Received: by 2002:a05:6214:40e:b0:8cb:e65c:e527 with SMTP id 6a1803df08f44-8fec5b45e37mr105777816d6.1.1783691532523;
        Fri, 10 Jul 2026 06:52:12 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4b42sm10856614a12.9.2026.07.10.06.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:52:11 -0700 (PDT)
Message-ID: <917ae005-7499-45f2-82be-db7341ee5dfb@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:52:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza-mtp: Enable touchscreen
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260708-dts-qcom-eliza-mtp-enable-ts-v1-1-372020a7a86b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-dts-qcom-eliza-mtp-enable-ts-v1-1-372020a7a86b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a50f90d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vCPi8hDJYrjmXadnq0oA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: nX3f3jWf_slXZmSEo8Be1_UNx0HvKyXJ
X-Proofpoint-GUID: nX3f3jWf_slXZmSEo8Be1_UNx0HvKyXJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX0Ty5GFWg69lu
 oYYN8QX1jsge5yPVlLGAuVH4A/pbHxV/cUv+n0Q956ZPR4HIn2JqSoh+PiHD0x4gVaMxO8h0vZK
 dh8HTVWdw4calFcpBvVJm5N1FBjuJRE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfXwu5S7M5yS894
 JyOETXcZesNPNk+Egt6mVQEIaJeHLWpOWyMIqAIHdCZMNIrYgJgLMZS2P2eTqUC09SfjZJ2+cL3
 kwhONgXmZ9yuz4237vjBAgc8soaFPExxPeQz5dMTVBeRCNvBS2eBhfQ7kQXm2m11NLdL48OA4Wd
 i6g3vVuRKtRxLy3Cupaj2NkSwY1eXWtx5aY9uisLriFKHrOV9e88hammR4vtG+Xyanj+izz4QOU
 i8cAXS2kVFNQ9g4hpGi3VZEZ++HhMNLcA4NLoBwm5eWQc6oUPJeGofuEzUpuq72eZrCFYrpIzhY
 qAV21CbuVDJKsDywjMa2TQ2UHsArceNH+N88EihSvYC8a9u5LAxppcotoZB3qi4T3MC374dLRy9
 x1vc4T0SO1wPouh5fk9/wgQ/HWlJUXTp+W9HoeKhlFdXvkmLA8gVvaADsf50YZ8VnLBoKk5h6FA
 mqA84Ga9EXVaqCXrRUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100136

On 7/8/26 12:18 PM, Abel Vesa wrote:
> The Eliza MTP uses a Goodix GT9916 touchscreen controller connected
> over SPI.
> 
> Describe the controller, its power supply, interrupt and reset GPIOs to
> enable touchscreen support.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
