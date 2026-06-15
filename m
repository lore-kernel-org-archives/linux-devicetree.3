Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E8A23A562
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 02:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781490906; cv=none; b=Qyp2UNE9gRu2EKEiCcpmS5OxC2KT/kAxVT3NOzUweZoidprQJ+xD0VO5OJpzkyBqUs/hTD3ak3fMmB5duVEreQ8Tmav1tCzgaXNK9S+TIiSwHmIrrmWIrbF45U++n4U+csBdfLd5yzvR9k9roBsdAefWMb8gb18d/D+ch+eRpyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781490906; c=relaxed/simple;
	bh=W/7n9BTsGPXhC0kfTEI8Wgc1IM06yj89XCro17EXdkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GL8YZxWhXkUDC4yOg3sxYsQl9GDN0kFma+behTrgJysGes8VrdJXYJsne80PKBBD3DDT+5NpgCMqy7L9MZOZngw8gfqn1u7N2pksstkWuzSAEqFWEDzdRAfys8dN9xrx9F9yiHmZAvihYubJaZfuid2ewJyhd5MfjvufHVb1myA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djcq1xGx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hmovp1d6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djcq1xGx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hmovp1d6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1htb32741821
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 02:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K+xrAMAdANe2IWoZAt1HoeNb1ap2Q5xfNcWHP37qP3c=; b=djcq1xGxm+uCJfKC
	OhI0aQux9VkqjKfzDrBf/QPCU84kQmsZTVG03jWAgqQIgU2NaXuHHLblHdRmTx3c
	D0RdjBXidrixAS9QpEOiZYlu5vU8UkK4muVbNLoRyTmjo9kqZOC2dqfQNWerzVF8
	HsNHTKxfUYjMpKIt/w40D8ODJ2zZIQhdgyI75PxlnddmnOuOB8rJTbi+4kmsNkiV
	6cIPjKY1R+on1GDuH+80t/GziLm7MKJ6ysRVIM7SCbLZNzN4zXNRMsFS/SK3WUD2
	XieavoyNbDeThcgZL2DfoZjguKpPhQLpYnn60bIuhUTqQynIK7xqZCCsqyVWOv9Y
	uVYJBQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0g8550m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 02:35:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c36f1cc0so50671865ad.3
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 19:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781490903; x=1782095703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K+xrAMAdANe2IWoZAt1HoeNb1ap2Q5xfNcWHP37qP3c=;
        b=hmovp1d6RBPNClxxpX9TNYZT8/R/FfPCVBT4CSm+yBCXCSlItT7v2MvYCd6WjFahu3
         i26NkJECJn8A9esSKcco+NtCqXyAjE2Rey921YQB65FSW/wp67v+eqkbhTDXubF1C00f
         S9ieaOfo8adje5KmjFkdVKNXNc9/g6W1Glz/drmgGNCHNspsjkGkIufko49pKLoRmQqP
         um1Jgz+pe3aBiEoU3O1S9+Kgxu3QoLKJu9iS3kiV+3gumQn79knWoPO1gjF0hnAPLpix
         wn8WUlCkwSFBPcsptidXGvzgfIfKcCzy4QJIrAahtGetciGSX17mUi2wADqlCVNTDsJR
         AKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781490903; x=1782095703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+xrAMAdANe2IWoZAt1HoeNb1ap2Q5xfNcWHP37qP3c=;
        b=ptuiaCDhtDsvvhzZrBMP/FyXkzQ/IRL4RrfP1rSjZ8tneLAipfAjgWJ3WljlIUPlmv
         rmXLl4N2r9O6zwUfM2h5a2FsLDOLzrJFqhIPYCh6X+3WTpXDN7DckTd2CvGNQbmCqFpb
         QpBKzu7KTGZNl5H9q7UJs2es4s32f23BFsek/+GL1adp7ZC5Fs+au0eV4qBxPde/g5Hm
         uJggvMv9lVwGo/W6umSNpbTXlKSzyj0koXzB75t6Pta6UdiUv9YL9MIxZlFSaTPwZbJs
         BK1xrw48G5WNDhLlkgcIj7agpuoI0CQF+CMY6tWhI8H0xROJ8IOQdXpA9dPwuIuGEdl5
         1Z2g==
X-Forwarded-Encrypted: i=1; AFNElJ9NnvtIKe2nl80rfxfgx93z06+PssT9TplvAt1Dvff246Sbizvk20PPhS+j0Aj0ABMxhSyNVpxcEFN3@vger.kernel.org
X-Gm-Message-State: AOJu0YypW6mlcwzZ7oMnFukMsh8sqeKDV5Skb9aQ1t0KpCR39I/OGaBE
	aktmRUxLQQMl0wVU3+ui7HhCBYw+rkG8iVSY+Y2ghDhMEucJ0LFReGM84Qp7gagyUZJpv8KqoVQ
	4aetxzDlBHbiVn+eF6ExTNip64B0DtUNM3vYoxSxsiKiyxpEHmrpYoLw1le7bRwPS
X-Gm-Gg: Acq92OG9KMVYtpD3YMFjFgZsnyLZwL7dnUR+zO44wFzVK7gU4VsRCgGKSZH6guX7QIK
	Vzl3cKJTMlRnqYXlYSsSnvVzAlI2f33zY24yb5v0EyXDlVf+hWa6GN3L9rRicmYaoULnsvC6HWm
	wljuvpynbzID7teENK6HskQtfyr7/exi78w4q/SP0VzKIRwBpsyfE9ocJWvqxj8BuZWU5lgvfnN
	LQ5ggTI8ykljASc0Vfle2TTZ3qcLbaGxcVLBd2DOq8hGeD20DUQgXPvAJPLg5PFMVdSN7Bb110E
	sNUHkSX43d3SOAND0CmyKoSuBCnZY/LQyfMAQNEYB3rvTaXJUt+fd+9N2541w1U1n2V9DsFL4H7
	oxRDSbKgehcNzVxtz9/zTJBk251516D+HihdJIA0gEncJzd7sjmoBYsvP7a6YNO6eaTBt++Ema0
	unuIjLQtgYnrfvrGU=
X-Received: by 2002:a17:903:1aad:b0:2c0:dd75:e834 with SMTP id d9443c01a7336-2c41050af58mr148068115ad.5.1781490903536;
        Sun, 14 Jun 2026 19:35:03 -0700 (PDT)
X-Received: by 2002:a17:903:1aad:b0:2c0:dd75:e834 with SMTP id d9443c01a7336-2c41050af58mr148067615ad.5.1781490903072;
        Sun, 14 Jun 2026 19:35:03 -0700 (PDT)
Received: from [10.133.33.21] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e52c0sm84925985ad.13.2026.06.14.19.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 19:35:02 -0700 (PDT)
Message-ID: <d98e7611-4d85-4559-bc6b-79b85bf8dc23@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 10:34:58 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add the tlmm driver for Maili platform
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260522-maili-pinctrl-v1-0-0a6636f5c277@oss.qualcomm.com>
 <20260522-maili-pinctrl-v1-2-0a6636f5c277@oss.qualcomm.com>
 <feea89d3-3f71-4ad3-b5ac-35ac57f2fefa@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <feea89d3-3f71-4ad3-b5ac-35ac57f2fefa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OOoXGyaB c=1 sm=1 tr=0 ts=6a2f64d8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MkT9_aAdxBhyvtWCMUwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: a6R8BREdZZ5CsV65mYr-M6pbERibVlru
X-Proofpoint-ORIG-GUID: a6R8BREdZZ5CsV65mYr-M6pbERibVlru
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDAyNSBTYWx0ZWRfX1SEdfdVfBK+N
 l7JB3UqCJfv5g4Vfd7SAXznhVYQQoxmKjSkGdv0GP6cC/WIHifpMrgOgmlC9uv5tD2d8dsJVaI5
 KouYx5ev6beeeKk+zGVRMpRUg3CNcJS/6PYpD7k8ebZmwgJuaaf91vfY99kZFUkbPikX150bB8E
 hhXQHVoesaxuXJRtDPz0JoJtYm7jVHTRv8bUJQTgvu5+0geX99An3gDLeVdcVkfPwT1C+k1ZNau
 UowAN8atHbT2xiFoZVASonCHQaKcI2Y7N6j+r7E/PsYsm+TMHLw0e+0a6i2YW3OFEtDQOQmLmer
 I8OEqk+16ZY+cjWKdQZRNjKfM/f7DoF7QoVepd7DDy/S1SOEmhAEK4w4G46VpX9CkqYpg7HxqHQ
 G/bG9A4lZCPgQJ8Zr8rDsqc326D1JhstEsbGPTnt1H0whucsKF/8AD4UoCe/xr3ML960AFTzP2B
 v8Y/wio8jVNJbZmfhqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDAyNSBTYWx0ZWRfX4uIPTzYhOSnP
 iaQJWDMR9DWctMUfzqngWAINw/j7u3djbOxgND/Ur0BCAXW5trspuXsymkfw8oBoaeoJkrkrGSw
 WFa2MuEaEurdCSfDI7R9uCd3X1Kibmg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150025



On 6/10/2026 4:08 PM, Sneh Mankad wrote:
> 
> 
> On 22-May-26 1:12 PM, Jingyi Wang wrote:
>> Add support for Maili TLMM configuration and control via the pinctrl
>> framework.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/qcom/Kconfig.msm     |   10 +
>>   drivers/pinctrl/qcom/Makefile        |    1 +
>>   drivers/pinctrl/qcom/pinctrl-maili.c | 1630 ++++++++++++++++++++++++++++++++++
>>   3 files changed, 1641 insertions(+)
>>
<...>
> 
> Can you please move "MODULE_DEVICE_TABLE(of, maili_tlmm_of_match);" to immediately follow
> the maili_tlmm_of_match[] array definition, grouping the array definition with its associated alias declaration?
> Please refer [1].
> 
> [1] https://lore.kernel.org/linux-arm-msm/20260505093444.61336-2-krzysztof.kozlowski@oss.qualcomm.com/
> 
> Thanks,
> Sneh

Will update.

Thanks,
Jingyi

