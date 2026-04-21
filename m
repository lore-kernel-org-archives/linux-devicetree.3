Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C9B63CB
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 05:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776748185; cv=none; b=do96+v2VRZwwdjdFaS6Hj+yVWhkFR1SMFlT8qYc4Cxs0Pp4P/CNJ8BxDen7vPadQNKW+U/JDBV9BygHGq0Cxbyq3lIviAuFR25g2jVFQgBYfOLUySyuBRrcaVPUPnk2D31bkNTPoizrDLHvqgJRsAyyJoVhzWOAymIx8vfSeo1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776748185; c=relaxed/simple;
	bh=LWbUDF8zLPDJvcoOOhjN7BBU6qvabNr09FY+A7K2eQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ovbl2nj0a4JzO0eEWy7SLHiH49EZLblgt/UAk6OCF1m8Pblv9EoHev9MV8jEtputZ1wvZlKoT/IadnGBGeD6VhL2yJXn4mRtZN7Z7xMo2m37zvdJSwvZNAf76LgxKjlepm4Bzl5snCZ6tl7qgiybR3/2hYPCIOC34FkN3SRF3D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rouq8wys; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aS8BHFVG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rouq8wys";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aS8BHFVG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L0jhBK1599907
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 05:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	10Q3G+V9ehfOUUDW/m71updYpbuE6B32wIfyLJjFPFg=; b=Rouq8wysxdRS2xJw
	L1N9LuO5ezMtjd08IOol2WATC4R6WN2xP7Wf08S0mEPV5PbIG4RsPQqRlKXKKs9m
	A4rdtxv6uZV+kKGb9WUGzIDAyIIt2MuLtKuf/39jr0DlGMEYZY0x/4zA1aS2kMAq
	IJb+rwCh+wqFFrBtW5NIrsh9yEoLt5rQki4wd8Rm8gCUcZc0AWJLufW47/9a4uI6
	vcFLJivhtwlWwzOX7DnjdqL1hExGAn/NjHk/JkwxnHm+hdZXFWSbZnpJgwQ7wYU5
	leHWnrFtoQ/1skx6DK85NPw8vLWuZ2NN3m+BWHEaz1xNdscKhztW7wEJCBPkvggV
	GDpg7g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh89bsu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 05:09:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24af7ca99so51050145ad.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 22:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776748181; x=1777352981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=10Q3G+V9ehfOUUDW/m71updYpbuE6B32wIfyLJjFPFg=;
        b=aS8BHFVG7Plv/ggBnqR5xfXKpCdDZUAfroeiWfYfDB4uHRV83Po9iYkAXIslXDI8jM
         HhSw7tXFN1s3Icvfgm9SRlIPFxIGLu/qnNJvI80nmQhomApw4wQl9FCuxooN2WfRrPMb
         YsjZzQ7mrikwWd+8S24XViOlRmYXipgLqtcxlX9sCWGA7Oy+VdaPwX2VpIkYg442ScaZ
         mohEN9Q5R8l3tjpWkGMPCeqYnwjkh6ACoGj0Q5UenPpLUqYNQyjM3DdzE5YjD1kbWfTe
         Kg05JYj/h7uDRyhnXUb43QuTF/uqDeYUdITSUIb2CnDV2Afw2FJrqQWV1A5JgGwWGvUc
         Le7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776748181; x=1777352981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10Q3G+V9ehfOUUDW/m71updYpbuE6B32wIfyLJjFPFg=;
        b=VxcEwBj69cRdUFAoPgJNKFgaXQ5kPyvMKLiAgXx9MmHn3jWKIzWPvpjUlgwsDyjfny
         fSMPxyMX4xjlHNyPnfkNi3kfPAws6rPFo6Gg/woFQJd5dYBDm9FaAbheM/pqt7UgSneF
         FRQQvOL88jO96TJg+jVdAjUu1IuH1Y0oAZw9WYZJwfTTjOYLJEFnT4EGgbosXzyH8/lh
         CceufcrYvCstbdyO7AkO6xqULPi0KsRS3oOpoiTWUldj6WJKnSOjx5qCXl5pLX8mZWQa
         sPJTTjCcavZjKy66BZrdDJ/UJlrhx6gt9yaC1Dh/eg3kWutsC0t4vWSng9JKyNU9gWnH
         ROZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8pgfRIOiLsXkjgD7dKjrSj5dM5UTq2MkzVsMxmPzPNs45g+ZIh3a/uhbmyt+qR41Tm5ehbw+nComqO@vger.kernel.org
X-Gm-Message-State: AOJu0YzTu6f7p0DxW2Hkq8iS9Q65gAKfkyMOJAOLJzSxSXIl/GcKR3gG
	5Ue90DF66dT4QdWvozsKTPLgPgS2r/Lxix+AIkHwPdos8+9iRWbkIhQijgyGVGJwrsC58IqzWz3
	fu03aiWjDQzqshRKcVUWMlcuy7KCm1IevUwQ6Te5DzXpdtKW5Udfbeb0vPBEBe2gz
X-Gm-Gg: AeBDieuN7B2Qcu27PqmQaneFN1rHKGIsgpUknB2bL3XVpKQKE2ijtarb41GUl8lxxpv
	4CGb1Yrm/ghihwObG/DTiTls0svTrFua49Qc8pop0hoYzWyExfv4cYHwdrxwqDeqxvx4mWqC62N
	xs9f7ux8P+Mvejl5eoRNC7yKsnhyiB2rWdRQEYFPvygf1rP8SOveXESBpg5k9LuUbS+jTsOXpsD
	c1yMEdAwnsCmJLXJ/I4A5gN/t5THoi/UonUXXFC4oyng1v/u/K+DbMkjCpUqYl09r9KfNpVCNxP
	/onX16oV4gb+igf5xpqADZlykKfVvb+xxSq8D19vgOgHm6lqY6ROb2pT6gVAECsokCnrcn1zDw7
	xognyBHDud5JJqULoZvwVm/rDeszvRi9yEMDuani/TQfddJ17WaUOknfjjRFU1Lub/cIWoXIhMq
	DTgM+OqDT6Aes/9AMh36OCu2iUT5Y=
X-Received: by 2002:a17:902:7592:b0:2b2:4029:d77c with SMTP id d9443c01a7336-2b5f9f51fddmr113101365ad.23.1776748180976;
        Mon, 20 Apr 2026 22:09:40 -0700 (PDT)
X-Received: by 2002:a17:902:7592:b0:2b2:4029:d77c with SMTP id d9443c01a7336-2b5f9f51fddmr113101115ad.23.1776748180458;
        Mon, 20 Apr 2026 22:09:40 -0700 (PDT)
Received: from [10.133.33.243] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cdbbsm118563945ad.48.2026.04.20.22.09.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 22:09:40 -0700 (PDT)
Message-ID: <b2a5ef92-f312-4e0a-9772-4d430b80a46e@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 13:09:34 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Add LT9611C(EX/UXD) DRM bridge driver and device
 tree
To: syyang@lontium.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        maarten.lankhorst@linux.intel.com, rfoss@kernel.org,
        mripard@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, tzimmermann@ideasonboard.com,
        jonas@kwiboo.se, jernej.skrabec@gmail.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        yangsunyun1993@gmail.com, xmzhu@lontium.corp-partner.google.com
References: <20260420061644.1251070-1-syyang@lontium.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260420061644.1251070-1-syyang@lontium.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA0NyBTYWx0ZWRfXxsPwtoYq4W5B
 4Krio67kp8X+u1r5TBIIEdwiH2byO91C/bZkElJQNVg7sWZiiRvpQy23QiyBadpoJ7f7zcowEyK
 FicO6N24sOMhqZn3Lgkn7RyYaOZ1yCs4f0Ub7MdYmI7rzlX2GBDeQwPgbqXd/WH8CvgRsheygbY
 U/bBNyuakC6kzzREECEgdaIYpHwEnQKTnrTMlLMJ6DdSrk1507DPsGbREyNwfAw48hdyxmCBKgB
 XtDaw9AfwfKOOc8EkN3x7YiACuKAXzzE9/2fQnaAdLbzR1w6axC1c1XbhKAAed9t7SQirWeZddD
 rKF/DXHT6KuCpckhjvyJfYhQebzrybAGLUkDb3l3nI7jR23ovxwVFvLOof/K6sqKWkOFphwu8ES
 RNHc7vnXv6RlGVkAGvLr9UIb0rKi5Up1raJB7AXMgPtDCrp+uyWLIIdVZfM+PE9d61NRyC6XdE8
 vQlxbzsjSdbovwgRbPA==
X-Authority-Analysis: v=2.4 cv=D6B37PRj c=1 sm=1 tr=0 ts=69e70696 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=Kz8-B0t5AAAA:8 a=vv69z5vQd5diBoytfGwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-ORIG-GUID: zrchJD2MDemMkBTNJkI6EWFt4Lde9xzD
X-Proofpoint-GUID: zrchJD2MDemMkBTNJkI6EWFt4Lde9xzD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210047



On 4/20/2026 2:16 PM, syyang@lontium.com wrote:
> From: Sunyun Yang <syyang@lontium.com>
> 
> This series adds support for the Lontium LT9611C(EX/UXD) MIPI DSI to HDMI
> chip:
> 
> -dt-bindings: bridge: This patch adds new content to the lontium,lt9611.yaml
>   binding file.
> -drm/bridge: This patch add new DRM bridge driver for LT9611C(EX/UXD) chip.
> 
> Signed-off-by: Sunyun Yang<syyang@lontium.com>

"This patch" should be avoided in the commit msg, begin with "add" will be enough.

Thanks,
Jingyi

> ---
> Changes in v3:
> -dt-binding:
>   1. lt9611c(ex/uxd) content merged into lontium,lt9611.yaml
> -drm/bridge:
>   1. Drop the licence text, only use SPDX header
>   2. Sort the headers
>   3. Use library functions for crc8
>   4. Drop i2c_read_byte and i2c_write_byte
>   5. Lowercase all hex values
>   6. Use paged writes as implemented for LT9611C(EX/UXD)
>   7. Drop dev_info, use dev_dbg
>   8. Modify lt9611c_get_edid_block, don't store EDID in the long-term structures
>   9. Use HDMI audio helpers.
>   10.Remove unnecessary flags,Implement proper cleanup path, unwinding resources
>      one by one.
>   11.Replace devm_kzalloc with devm_drm_bridge_alloc.
>   12.Remove extra kthread.
> -Link to v1: https://lore.kernel.org/lkml/20250903123825.1721443-1-syyang@lontium.com/
> 
> Changes in v2:
>   1. Forget modify code, operation error, Please disregard this submit.
> 
> Changes in v1:
> -dt-binding:
>   1. Submit the first version of the code.
> -drm/bridge:
>   1. Submit the first version of the code.
> 
> ---
> Sunyun Yang (2):
>    dt-bindings: bridge: This patch adds new content to the
>      lontium,lt9611.yaml binding file
>    drm/bridge: This patch add new DRM bridge driver for LT9611C chip
> 
>   .../display/bridge/lontium,lt9611.yaml        |    8 +-
>   drivers/gpu/drm/bridge/Kconfig                |   18 +
>   drivers/gpu/drm/bridge/Makefile               |    1 +
>   drivers/gpu/drm/bridge/lontium-lt9611c.c      | 1365 +++++++++++++++++
>   4 files changed, 1390 insertions(+), 2 deletions(-)
>   create mode 100755 drivers/gpu/drm/bridge/lontium-lt9611c.c
> 

