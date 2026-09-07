Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2104AE8CF
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787279; cv=none; b=W4x0khetD1zYCePldsa4+m6N7OjCW6Vmvm07tCoBSy3ky7qrlO8eJ41SHHWxTAMgbG6FqKqcxnWd89HSwsNhYFCujbDcQ9YyOEfmaF5YE71qMu0pci8ePwXJw1WTOIyUYirEjwvuDKyRpl3IJNCiHp+aObDVAcVn7e7jeGt4kZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787279; c=relaxed/simple;
	bh=/XIZqFfdVQkuDvteTMW0O5cPAjeEEx9jLqyoOitZWbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AzhIf4V9nqEekG3iQpQelcpWqbI0sG9ST7wVArYGPWjCQHDzCHbg7OBG6rBLXoBvGCz2l4R7rUZVSzsEy7d3qzxgFWR+3XsA1h8BrCjQPPg9ynhnmDXqrq0svobtrAYT1h174/ARQ/W2FO1QId/YXaBn8iPNm6Hvn5DPMeZjgnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jh5M1pc4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jSIDuiRG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jh5M1pc4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jSIDuiRG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An3pQ3230477
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 13:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xudgVfXyg3OdcNE0RyNDSehp05AOljIo3nyACCtorEM=; b=Jh5M1pc4+HLHenES
	w+6+ZuFEQ3QKeFO927PD26azciMaTIo3shePfsaNN7OKFI7xRis2bqprMxvfqWga
	weRLB4EjBLeqBo8sXC71m0h/B3xk5eXzcaiXmAODd2ekwrppATljpbVHBS3YH0vZ
	0VkJ1WjShTx7y6tNICNpHxMeG1JWt32y2QJ+3G6I3wvqDGHj8DCH2yJVjqCAmFf0
	UkEZNEYgTJKTaYHbWaWnTZRVnZLC0MpCQeZgDwcalYsK7+F1AYFu8bTX9wtpmXZt
	9ZcDtaFWtUFAjM6V9f3D5zTzIFQtzXWRQP3SYTd3l7z4byCJp3TtJzKI7cDDv8iQ
	DAiRsA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxktvb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:21:13 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97caca2faacso306353241.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788787273; x=1789392073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xudgVfXyg3OdcNE0RyNDSehp05AOljIo3nyACCtorEM=;
        b=jSIDuiRGWTG6EA61hqKDJsjy8C3LK+GMAbBhGaSNdjPFv6hCF1gU5AUJqjr6R9wy/e
         boEp9Yid21UpAsQhGxQahThYg8q9K+VE+7kRF5Oy9+RkBX62awMlVXcx9sZ4Jxs75hUx
         qLMQdDERG0f6YaoWyanUCoSUGHjI2CLinOpbR/yKkhTBOfLH/Mr5iolBKzpIix6dJCq+
         iMtjJGH4VSbtx/nSZcqLd81/IY7Lke0lBHRxhiAcQNRvBI1rOLmypVEMm3Hs7kETqAv7
         hJmIxvhaJoc35boPV6fWrcz9RWs36HiUd+IdIAi7UHDdhNtNiIoJh2QhPwRNJKo4mTJt
         wkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787273; x=1789392073;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xudgVfXyg3OdcNE0RyNDSehp05AOljIo3nyACCtorEM=;
        b=dTMCy7gzYX5JaZimtjhmCb1ydAb/Fk6xoAndu52c584nn4yIBU5nqn8bU7zR0wDFmZ
         pqoMPnxouc3SEsIXDmSsYkhFLZL/iEvryi2wqxI0zRbMESSOsTjMwD5fYM9XCWWxHnMF
         8U609vaqa1z0GaIbKLDVXymXo2jxq538Hocx2iHhk0NiXnyuBFQzmE4ZTDcZl0T6yy6u
         QfcWtlpgEXHjE4g6F6g0uJhyFQKPCYlJQ7CxS2YBiFvJyZOXOGvpWa8Zi+PreobjndMM
         9InIFuIlZaH/9zVyOxXydndn3deLjxLR+o1e/C1ipDKxfumcDxTWZd6owYu+5yTgKU9U
         IOEg==
X-Forwarded-Encrypted: i=1; AKwUvBzjDsCwaeYLJseGji0lvju9Zo/CEPGMwJcZWUmDQIH9XC9Lg6RapwccA4A5fQn21eor9HnNIpJrKpkN@vger.kernel.org
X-Gm-Message-State: AFuF++mlEknuOgZys+pgos+ayv9FnhA9Kzj+7EyF6C26DIxRO47N37Kh
	q5HQaCGZ/5S1cgoFHhBiOHy62uQjtSQak/b+OPXIlKShXF0C9BRgeWF1updvDBLL52qd8yz5pNS
	7v72c+5leMa2iIM53bX2Pq+ok+OToDQBRxQIxsvy0ylyYB5xgXeiQFIpA43m1yhFn
X-Gm-Gg: AYBFou0IbOmwtsHGTv1vf0Z0yVHqxDh8SE8HRWctrBs9og+dtiX3KFqMGJEUoT2RJgB
	g5Uvne1R1K3tZcBw0qCcdNynQBko9xobtnoh5GnlD+YW078OvtBnoZP6CX/bLgnLoG6TTEdY8Qe
	inRWOuAM7Dl/vxk/8RmRFf+aTgfvVat8rQUf4GSlhAJjW3Jx4wLheVHZYZ95CvOzpM5NO9uCtqc
	NhvrLdG1lh0ocnFfnXEtPYeowNY6u9R8B4suuLeO60b8Y2qAnkofaHMHDtoKq1FC/v6wFZC8FDu
	R4SS/0N9I64f3EoEIFGbc2CxPK/xCckTaPwA0HLPf1631nOjQP+IWmrFJmJ7A7PlVq0rL7OZGg4
	NEND0RGW8MaUq+WvyDfrmBdo+Gl9P
X-Received: by 2002:a05:6102:a19c:20b0:78d:31e7:e02 with SMTP id ada2fe7eead31-78d31e73347mr920599137.4.1788787273314;
        Mon, 07 Sep 2026 06:21:13 -0700 (PDT)
X-Received: by 2002:a05:6102:a19c:20b0:78d:31e7:e02 with SMTP id ada2fe7eead31-78d31e73347mr920584137.4.1788787272846;
        Mon, 07 Sep 2026 06:21:12 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858bcefd59sm23951535f8f.19.2026.09.07.06.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:21:12 -0700 (PDT)
Message-ID: <9d03c776-b05e-4037-b7c4-6ed817882edb@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:21:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] drm/msm/hdmi_bridge: Correct poweroff/audio
 cleanup order in post_disable
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
 <20260907-drm-msm-hdmi-fixes-before-eliza-v2-3-b097cf1eac77@oss.qualcomm.com>
 <20260907131153.34AD21F00A3A@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260907131153.34AD21F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0OCBTYWx0ZWRfXzSBygL7KG5QC
 4VIzxSxp9cGQ+zqXkULSeCahnpufWx3wUHUD25JcuVY6ECgZWTduwkiT6CE5Qz0YQpfHZIOF/W2
 DZztFUak7SQZyaveFc2VRQaQYYr2e7xMlKI673JFjz6SA+YJ2ccYLRvOFbAt7xV8sAiQPpHbWMa
 3uYQKtf7kvWH2R96tmUWtsfgB29EnWWBTjYdxCoXBkB1u4kw/VX/AmwPxbn6KldPTmcyWn/FmRY
 vLdmBku2Yw1VXVV8Rp8zsBVsXmAOCZz2062JyQ8UdI8RW0lEDdw71bYi91cbjaE1931yHJ1bEoY
 KgDPjXRPk75m6Kjb4E/RKRTM0ryE3VbVfb2L/ROGwjHFviX8UhcAED4rzgbDfo1RQxfbK0kdjwe
 M2uJOizzqzAdVPtFLybytpId5A51POJfIIo93TP69SUTFbZ3Er87OtQg2BLNXy2aYgTZT9axUhl
 tvQiAuQcefOPzYuC3aQ==
X-Proofpoint-GUID: 5fn1ppC5ZVIeE-Y7nTc6xv3LeyHWteef
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0OCBTYWx0ZWRfXweUBtJewCiEB
 imVEYuY9V9m+wzYJTsY/7B/4ClFVAJlQgB9UKQME3WLxO9U6jwXELyhtlbHVvgMGi+ihCmVK80g
 zTlL5mXWDo3diwad6Xs38x26SQT2m2c=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9eba4a cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=zC86WEiMApjGDmIPK9MA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: 5fn1ppC5ZVIeE-Y7nTc6xv3LeyHWteef
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070148

On 07/09/2026 15:11, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [Medium] Moving `hdmi->power_on = false` to after `msm_hdmi_audio_update()` breaks the audio hardware disablement logic, leaving the audio engine active before its power is cut.

Ack



Best regards,
Krzysztof
