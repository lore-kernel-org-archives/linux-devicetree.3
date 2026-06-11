Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA063ED3CD
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781178361; cv=none; b=sESy6JqxxyK1RPNGhoS8n9vc/KARrKZtCzMJmJMKrdJZ9wVKGPWj/MH+YSLdIZC+RWI/apFevVzU+fIu7lcRfLfZp4tiuiG5hOv9w9e6UT+JFlHqmc4mvnkhngO8zBbkBsUIiITQuczoYeYfLfQxdkIHSUa41kqyuxYkXZUnPys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781178361; c=relaxed/simple;
	bh=abYrsQg4er/DWvcjBUneRpAwhi7Z+PK0VEhY+4Qtu4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tdUo5/0bzyIPmMgjfRuUkxAfi0SEdaMCnCImMZx4wwqQns3cEMYtyjLiXKwSQWH6Av3XeO8Rol3S8Qwt6TLX3z7qy20WMYYNYoRsisEfdTTIgzb1a9VF6D/+i4rYbURBV2Yf+w9Hlg4FZcutRc95U9HrwiXdRNfcw6m/BR2y09k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DNIkXvKN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xp4MLjep; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DNIkXvKN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xp4MLjep"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xBuk242641
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3GoBZuDQQVTCw6DoD5D9JhCuK/QhexAtetwEQkmTanE=; b=DNIkXvKNr8QfzWJY
	F6Ed3/DgN0k+TX0AjDzZjTrJKbmR5bwqmyn+vknmJneBj++S2ItjsQbQByDkHF0V
	Kvxo/byNnZPCGJqltyS2z5IX+y17c6vZz6rKzNHTZWen1VElUHM2CS2wXKG4vnMY
	/UAxnP0vMr7hglKS2aT75VsHjMqwQcXE79oqgY0Jw+V8OULdP0lUX0ELU3cIPeiM
	WXEPtHPpNEjNGAZ4JEgo2ExV/hch9dNNlZ23z7m+vOqpIIwpP/r26mD6ike9YCN3
	Uk4gpOT5lYw10Rqjg6ETFohtiOH9yZIbOzjMYJz51MeckZz2gi2nO5aRDW+D2OiR
	CAk5qA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe70388g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:45:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5176891d0a9so20064671cf.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781178357; x=1781783157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3GoBZuDQQVTCw6DoD5D9JhCuK/QhexAtetwEQkmTanE=;
        b=Xp4MLjep81OYisa5sOdnLAV5+m7svYo0EK+FEElzX3/fw0nsY+gmkz39AmJY38Kyt+
         G5UzXyLS2Cj37PrO8oirhcZAU0Z8v7WW6pCAqMQgq2TipC2W0OxZ3jtlOUz0ebi7g3Um
         HxKHmaPmoMUS+BxGjyg2qff76SAlvA+CDvVnJWME8CmiSlpJWjby/5AsSBam9aaJS8LV
         BK1k0eG8MNtrIkobESgyp/qhX78G3slGfQXklroWoZVEHQDWd6lThIVsqzSda+8ki9Cz
         IRwJqgA9ZV+E+6E0QWaL1xRcDFMiY4RUDp6A2qD7GUuNOiRjYW7URvvSU/4QslFwZ4ct
         Bz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781178357; x=1781783157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GoBZuDQQVTCw6DoD5D9JhCuK/QhexAtetwEQkmTanE=;
        b=RQ6+iSnsqmL6o5x/y6zh0wmRXXJDT7fQqOh+BFpMbNY8goHyk8MTUw+Hkpi140gpsB
         dUOa5gz+CiPSdQxznLSxufXw1qGTN6NXYurDH0kLBKvNSeiVvgXyJkl4DNB0yQOQEMI/
         kMEsTRYIv/oNJXDEFl08zqdxHv/vBT+Cw4c/AcUoHuGfI+o5xy7x10ApPtNA/BLjXL6c
         eU1J69ucQU3vpQNXyNuP1kHBVYZ2k/JoCoLOExX/RtA/547scLT20QyLQQA/OQeS4uYU
         siMkTlPzMhrmmFuw2LBbdPus6s5xQgmjyGFgnEDCm9+SINpYTuERRjmrmK8PBhLXtgIp
         WsGw==
X-Forwarded-Encrypted: i=1; AFNElJ/TBXDyuGmaxNuQGz6BcKPAITbvAIguBjs852JUkd+JAxaXrXJLcmYPWJ2xCOSNgDb4KHT2m/xaBXAJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyW+eY5ZmQrRNsHeBH+mjM1fKqF/OqOr7Qwu6+CDEbKLlXF1CZ3
	VbogRluBJYzLq56/kiA8bhGwXaF9FcT2Q0AvHjWIMIwMQZWIyJX8Stup9LL1C06qh+NbscelCE3
	QB1vvxODuDLS4x38jIX8T7wCD6yY9JG056/l8JW+1fpD6TYFYMQZW3E+O+qcyVjBJ
X-Gm-Gg: Acq92OGAKwes11dcXy44VpQuGQPyw3eMEQ+PQZk5aLy2maJOkelIv+tanXh6mr4hvTJ
	CjHzgbBF5feOZTctFPnhhPevVkjUR/w4gTxw8m3JTq2Yksy9HW9QfvY7Fvypw82P0w/9TUmQMn1
	8B+Ugj2BSajz/RjCEwZcJdW40FI5vnfemU1Jv+vMw8KF9ak1KIlQ4eElFTiYMBtphLZKzVscuS0
	wHJwgEfXnT2zEDsFP9KxHSJ9uBHvsKrTGz55dB3cGko6sSXiaoCARLklXXBMpv90Dh4txNstCJk
	13LSeydRAYps25GvLC2+2DAmC8KrYXLZ6mihwataoSSO+mVrOf7Wn7eBO3kLn4N+cPcLvvVywMC
	z0Nb+bje3SGcaXXzph7HXIqwutQtN8tNp0Jv7qotEpFbKHmlsstO/qiTn
X-Received: by 2002:ac8:690e:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-517edcd71a4mr23729161cf.1.1781178356888;
        Thu, 11 Jun 2026 04:45:56 -0700 (PDT)
X-Received: by 2002:ac8:690e:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-517edcd71a4mr23728891cf.1.1781178356421;
        Thu, 11 Jun 2026 04:45:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb60b771bsm51473566b.54.2026.06.11.04.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:45:55 -0700 (PDT)
Message-ID: <004d6bd1-2800-42d5-a6be-1fa69a06194c@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:45:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/18] firmware: qcom: scm: Add minidump SRAM support
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-5-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-5-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExOCBTYWx0ZWRfX9xKdI/3Kj9me
 HEnyZm6KscSBhlnB9K4KeACZWpUc1a3YzgcEiGRpr6U+iPt1LcTgx11Afv0a7/Z1buAxXtEMPnN
 p7DWHF4am87FcQV0EElwClDFFH0HgiwLq4jOFYFOfZE/WdnLg/SFdzjT0g3k9cDRiB878NCBLyN
 gnjET/HE176DXnlafQBgfiv22hD7P9ulpGmd6Yhqpms8uE9xMxFFz0UjSedQMVa38Vsu0lSOzuA
 2eARnCsxn2hJp1KNVqX/+yATWbNkN+Xm3kXFcrS07ecwpHSIP1VT1xjC1SwRRZ/Q2mlUXvgn29l
 RD3cxybD2PiNpRNwYinzSwUjlgcnJJtQl9dobMoaizUPz4kJlTIeX8lXcCCjAS3mj+7safWtTcd
 uhYu/zp/PCPCqx3PraQFXsnqjIUgYVO5XlbjcGz4nNwjKgB2HlNrBhwCwwzluemiqPNzzXpob5f
 IfqKYcdM+SpCw205JaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExOCBTYWx0ZWRfX7WH69IBdjBb/
 oXS91V6ElRBJg59V6J/rVFX82qEYxlT7IxS3uJCVi6ddJUdb4lQeedzU/zDKBRNE2F1bwH5iOGu
 Y8Mmdqwtdai3qFWFQ8KO6WgeKS2df6Y=
X-Proofpoint-GUID: wdsm8eGPa7WUVL1IGmlE_fjZPIg-7kNs
X-Proofpoint-ORIG-GUID: wdsm8eGPa7WUVL1IGmlE_fjZPIg-7kNs
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2a9ff5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=y6rW8TDjuTIuaxCCkQgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110118

On 5/22/26 9:49 PM, Mukesh Ojha wrote:
> On most Qualcomm SoCs where minidump is supported, a word in always-on
> SRAM is shared between the kernel and boot firmware. Before DDR is
> initialised on the warm reset following a crash, firmware reads this
> word to decide if minidump is enabled and collect a minidump and where
> to deliver it (USB upload to a host, or save to local storage).
> 
> The SRAM region is described by a 'sram' phandle on the SCM DT node.
> If the property is absent the feature is silently disabled, keeping
> existing SoCs unaffected.
> 
> Expose a 'minidump_dest' module parameter (default: usb) so the user can
> select the destination. Only the string names "usb" or "storage" are
> acceptable values.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

[...]


> +	for (i = 0; i < ARRAY_SIZE(minidump_dest_map); i++)
> +		if (sysfs_streq(val, minidump_dest_map[i].name))

I'm not sure about sysfs_streq() specifically, but otherwise this lgtm

Konrad
