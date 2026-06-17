Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FE838A70A
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781693711; cv=none; b=coQs+c2GUzUnQnIzNo3OsTaKaG484IcB5LRa01Px1XC+TVsv0rcCxf+LFs/856NkteuerB5pMeUBhUhGe4GS9N09/bSkHLW6f7JKdN7yhsmGGzLPaHVuUFguX/24RKnfBiAjLhz01BP7bFKzr+WWYJcEG8uOEt5tR1hL+D39jzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781693711; c=relaxed/simple;
	bh=YUa77FnAohk+h2BuhAniXUueyl5U6lyKWto0NVPAQr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OW+n403Z99oxleJk3bj8UT8P4sox6zstqlZZKoLGR7FXJ4NM79cNU9Kdu++r2IaQOa14zpyop1GP2MyDq6KcefBymRjy3yS/vPO/TFtvGwYPyvC2IzDneS+V8u0hrm4sZOS4FtNVAMa5mL9wmKmjE8vfuMitXLk1hO34Il2Rkvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DdOUdzRn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z4PK1Hpf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DdOUdzRn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z4PK1Hpf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UUIP3273558
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t8RsLVGaT0m3Vl94xbioqtjwZapWMhUeU0FezKWGyoo=; b=DdOUdzRnL3Xx7aZR
	XOHzUQ3K+aql8bMOvR+VrW0oAOXDfO7kSsB+vgJVeRH09AQNSCJFebEoJ4mtJtxq
	7V1yCjbPwdBBIwho9QsWGsRUIi9+MnBUsXTEvqRsNMY0QAvf/kz0IyUTQSo0xNWC
	5vkIoLke17BYnjQm/Qnt4E9FY1NXE/pUNJFK+mnwUq8iUuxWecZwyJwjPGb/TRG9
	x93lWwrdZn7PfztDLkueR3DQaiZtoUeqNaLOvZUDdUnsBh7b+XUTdjP8cd4jNCLg
	YZt1qeqVEXqCJ6bu2sJENQr5akv2eXPb22JiZZ4nLSxm5YtI/RWJhfgq3D+7pG5z
	GNQRBA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euefbtr73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:55:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915737aaf0bso40885285a.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 03:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781693708; x=1782298508; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t8RsLVGaT0m3Vl94xbioqtjwZapWMhUeU0FezKWGyoo=;
        b=Z4PK1HpfBBoOOUNt40QRvEOys4PP6mpM0lOYpgUmXNgkADQHi0c2IzmUbGYm3u7XpF
         Ga8kky6BFXbaiPwQCqSGt9MN+NYBSkWnLJ7AVs/L/Ef/XAe1zSRT823xcLwtGdHLEesr
         /prwlOCqUx9N8bQRAXGUl166XSNujrIGbackD44Biz4M9GGms4P1cqvfKDnrdpCYRYZv
         ZCqcnKbPMSjwGECMc+y3wPu5IodP5svxI28RMS1jvtKWIwTQ2YDADlHy9GLKGqzRGAuU
         7ZM9Og8XkgzLnNUXuLK/YttBe1XPaOJDRi0roZerEyop1ZPwmRBNpIBrZgXeTW0CbG4c
         3odw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781693708; x=1782298508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t8RsLVGaT0m3Vl94xbioqtjwZapWMhUeU0FezKWGyoo=;
        b=boNJ6JOQ6hc2wV+q+KxCRlaq1sB2skMEAvDm5KTpDPFGe0IWHxkE+FwHxE67IQFZ0n
         QvxUYukpsepkg4DZpBmXCiTLvStnu7FKY4pRVD39/EzZAGbYE6H1qvHi5uhy/IvSf9yd
         kXweF0uT6ClICyrT5gJY7n7uY5yfp505LmJv0T6Y01U6usRDX98xWqIEqsI8TdTjgpjh
         VEF8K03skDIjXdJwZTCKD9PLy9zKZIPGDmr/78GWWpSs7zf47FiKl7DXP6pXQn8jGbYK
         HejIrUfc18LGRDnEUZelRQ9HIFGf7CWfyjzBoeX+xljhCPFrK2iyhbQ89JkB/Z2IM+cH
         5imw==
X-Forwarded-Encrypted: i=1; AFNElJ+l5oK0fmWR1X8QdqPGpm1eGo7gecoquM3H59wJmKlqE99ysDRdo8P3Ejz/sl9MLf+qYEm5xKtL2mpK@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv47B/g5peVXiKhBjYEmiCczT/EXBuqdpI8o1QyQAT5OGv2HAL
	g2me3oTJ3CzHY/avKMQXUcdfpmN85/pldTagZX6eA2FZ+mFwZ/gWGPyfmBgPVr6JvYTsjnOvy+M
	S9JcFOdyMZlEs9LFTZ1Vx1cD2h7q5NbH8g6DBUeQtwR29E5KPZkgDlz7SbjoKtbpg
X-Gm-Gg: Acq92OFxLkHbqHP6uMM0oXXLyeKsNt3DwYZZesYY05gJTkMDYoi8jul8yXm9C+fglnp
	ZcgOcCEro3qytfjYazPj08MPRgm6YIyRfjEu5Udtek4yk9ndobfEfIJX3OSEjYP3/0WqVKHVVd/
	isExLC1GVZXBT5wQmsrjo1Q+MT65xMr8wWf8dGZmqmyp9T2JxaRQ2vf9EyierCH8Dn4u+VBdJjv
	d/d+U+ZY6WPNzibQAcJUJD67OJTRQV90UT4R/X06ofBbGgUFeD3vjJvX6sUTZuqA2thM3xcE9ge
	jvyh3qhEzJyxbfGRSTLIbE+oEUlBjmUBhSb2aJBtfDetr+w/KaMgyN43cZBou428H7hKcAaYpJ4
	gSe02ptEOlzT2UN87E2UN58e0UanjC+KReys=
X-Received: by 2002:a05:620a:4408:b0:8ee:e440:fae2 with SMTP id af79cd13be357-91dbc52bf48mr250786485a.5.1781693707579;
        Wed, 17 Jun 2026 03:55:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:8ee:e440:fae2 with SMTP id af79cd13be357-91dbc52bf48mr250783685a.5.1781693707107;
        Wed, 17 Jun 2026 03:55:07 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937938ab02sm6094751a12.17.2026.06.17.03.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:55:06 -0700 (PDT)
Message-ID: <ec16c184-2e0d-4f9f-af9c-d551fc114754@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 12:55:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/6] arm64: dts: qcom: Add AYN Thor
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260503-ayn-qcs8550-v8-0-d733f5e57446@gmail.com>
 <20260503-ayn-qcs8550-v8-6-d733f5e57446@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260503-ayn-qcs8550-v8-6-d733f5e57446@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6KeBWT8Atsyefu2xWlm5VIHMgmgLBF3x
X-Authority-Analysis: v=2.4 cv=IeC3n2qa c=1 sm=1 tr=0 ts=6a327d0c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=SMKPoOfwHAVbGl5z8tcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwMyBTYWx0ZWRfX8nm+m8RW5pYL
 17KCGAufoHgVRv62jnuH4ExqFgg9GXBrAkHYihlxNLudQecR4jqI0g1RdDCfB/nNGt6ZUVAcNNo
 Beuq3gkniviRAA3FNGHsj9mQM0gF1hw=
X-Proofpoint-ORIG-GUID: 6KeBWT8Atsyefu2xWlm5VIHMgmgLBF3x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwMyBTYWx0ZWRfX5hpU3JXnLtWm
 rJtVrODhBW1V5AqaP44tw+eZ4nAEC/KCRfIG2t9S+STSnyKN4L6lTjER1tObZ1MtOzIM/frTGAZ
 EanQS7b6U0lDL7lQ6dQO32gQ0qzIEhwXgQvb9FGv2DZhJH5Z2Y0w03ChxCQxPapXZo5MvOzG2Mm
 t8LdS/T8ZiTixAU5vXJLjbARyd7AI+0Nxh9sVRS66fvFuOly4A6ncqjmUiZv7OWerltfOkBKS8d
 H5AhL/NnWNDY5g58zSiwPkctSmvZa4DjzBR0p9tk+f79Ho6tG4gT/UfOCs5aUjQ70orbJfMO5pm
 wVG+AMvzZy9Sjv7kpWXjpjMHCUZJlvBNe/d1wIS9jHvMfQHdIt0q/Q1iFubGnKIhYPvMgMWfkW9
 aGBK5uEPavF/U24ayk4d1O0btGe7C0G9/vXegE49AD/kbrXiDFDB9s061RvReLVuyu5cpoyyz6x
 isNEkEOks1qc/3aoIpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170103

On 5/3/26 11:48 PM, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> The AYN Thor is a high-performance Android-based handheld gaming console
> powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring dual
> AMOLED touchscreens.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

[...]

> +&i2c4 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";

'status' is generally meant to be the last property
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;

especially since these ones are already defined in the included SoC DTSI
(and would only be necessary when building a DTBO, which I know is your
ultimate usecase, but which you aren't doing in this patch)

Perhaps Bjorn can fix that up while applying..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
