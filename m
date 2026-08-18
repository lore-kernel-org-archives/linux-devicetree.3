Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54104448CE8
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787046915; cv=none; b=XKocRvXurlxZPzFXuvVQpFgCtxL1hIQH1lDOaDhG04wWvIbFAFIwi5Ukt9tAH1HNCI/uraZLGYCcHhn0am0fkOZjwN3/RJdenXrqwCrcXsNDaUc9ji/a+HlPrHQspokZK4t5J8rKg9w88f7AugsE9n94W1x06opkdNyshoFsEyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787046915; c=relaxed/simple;
	bh=OMc49UYmUguEYzyKyIv2wi8A76vXj8J+ya6GNZJJ1g0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KBINPwPS8raR7HIZFEafaXEq++A2+Q7LkpHFJBhGcnfHpAJsHbCwfx2Lh01Ti2YePh+KQMRx3671Q9Wz2DnbERa9s6gTjGm6dpWOevJBR6+zNECCxLzatQ0yxKBThZ5GeAr/XBTzmmyq6pBPkfLEAVylaH9wheUq8ozEw+GUDMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZpjmYld7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brXCOkOO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZpjmYld7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brXCOkOO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BJ961270839
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6JfeiagCGXExL9jPLVYU4oyP0ixfW6Wo8aIWlrLOri0=; b=ZpjmYld7AMP9ZSy7
	xWnL1sO6gTN3wzp4BAEoeLdFKIacYJZ27ojLid9WHJLUdr5FJr+Itu/HUuLEd6DJ
	NQLKxhihJv9lYvUmmZq2F16j/GBSsEEI4mjmmkZpcVSD96H3SUsF7BckO/Z8ms4X
	lE+gG+N7wgJt27udUXq59hrdjJYD4NMuCyeMRf30S5Wiweq4DnIgCAzniup214Mf
	8LFtG1H5XFFGFebPUnyaXPHk3576+Nutgwx85hLbHwcEMAtPjvVmOY5YmbKIRUl+
	QBXFt4wWCkEn3KhqNe+Y4G3aHS/9JUHFuf7ouQyUScbjKHNP0TR1cG5MbdN90Jj7
	r7iJQA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4dcn21ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:55:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d35a38fafso3325251cf.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 02:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787046911; x=1787651711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6JfeiagCGXExL9jPLVYU4oyP0ixfW6Wo8aIWlrLOri0=;
        b=brXCOkOOiD8STcqBUzF6PgizfhoVAyo1zpvEPm2kPPtCccsnvZXCKqDUGmksoCZlxg
         5Hvh3tiGTIsW0IETn3QJSffBwuoHOskhqij2HrJD+YARxb5UWvKCZLLgKE466Rk0jVDK
         jWA1RXkczf7lO03lX85WqWf/Q+jwbOH6EqID22Awmfjvdrkb635PP4psNx+og9+LqP7G
         lYwRm91Ku0H+sfnk9WiWxxr5Ld97RhYbFfA1z97YoslaV0ZMaVRPPqdh96kWBhgvFAe+
         +s3yfOXHlLMPf7e+c/LERm8k1saTLbtmcp2ezCX9nPtxm1FxvX70+7sApriLZGsGzZiS
         OPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787046911; x=1787651711;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6JfeiagCGXExL9jPLVYU4oyP0ixfW6Wo8aIWlrLOri0=;
        b=SwRZz4JBAZh1BlNAMCH0GCo7Tn9D3bN7gAodtVAgqiqGZW4/1H+ZYI14BRVyqGSjD7
         QTWpR85Qp9ERmTzfsT2OhCxDaL3kou/BpB5TAIeWB0ZIk8k8EPYrYg7Qq1zW251apOy9
         cJcoFAUAOu8GChtZSsVhhRu95qG9H9wqzGsTMTUoYN8qWH59gWdoOaR6PvUgXAZNB+1C
         bmLWYq4e+0i4tuaRgIiZ0qkxkDlHSie6AAM4kADwGD6Wy89DGiOM3R5ioWv5RH6WcLKW
         RMR8+Oxt/NGitr8IeSaMfXbtAhEZNEtZ4r5L0FcVFdSZny/bZYhw1VL6JqzKwEGL6q8Q
         FDPA==
X-Forwarded-Encrypted: i=1; AHgh+RoBkBVQ7i8rurHTkNtKdJdGq+ikVibm7fIbvFeUnVaEHP3venUgZVMHXmeADfNT6NXj+Iz4E8aecvzB@vger.kernel.org
X-Gm-Message-State: AOJu0YxElyvyxO2h9nhnqPwENtHmaEIOmoBSSezberUhN/Qe9wt6HYKn
	q3WnHlfg+AqDn0H8qmR5WmlCGRqkeACpU/hQ4vy5HIjns/qU651Xmg+2/I5sWKj9F652C0V+8dR
	DmvJYBo9u52vxQDtdJku30Du7tSBxF0sxtHyy1Qy8AC0GeW12MPTwdoQo6C5YSRhs
X-Gm-Gg: AR+sD10JYwjpjWP356qjR/r2rB/d/28aN4RqK3JTDGRhMLV/v9vjAEaATSWzeUvO86v
	tsuvzfLQsxy9+XPQ/ThEcdV+knpK41uMPbRlSxUAaL3iyRwD3VLJfyzkG5hjotd1dgKj8FnP+AR
	nZGD0wDQOki/TYqoRfS8nvD1dRVPhNCk2Qy3Uc8ZSUrvTR5QwlSc2vDDnOp7J9yQmj6rw8hQ5aE
	XXKubSJpOctZWVmXW3VNhJsP71sskE6lUDXbBUCgTJ5UADoPSI3z0TlHkgRuG1663hMeo6EQ41q
	kQ8+c+ZrDKOJClPAQqdiN+Wg6kck/tQ+NUEtaPXxriaT4TzW/wlNgjJaEnDCSCuIiW96/L/da1c
	tmEi2vkO++dosmf4XH2n7BWuT
X-Received: by 2002:ac8:5fd1:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-52d852d1178mr235156341cf.1.1787046911146;
        Tue, 18 Aug 2026 02:55:11 -0700 (PDT)
X-Received: by 2002:ac8:5fd1:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-52d852d1178mr235156071cf.1.1787046910745;
        Tue, 18 Aug 2026 02:55:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b9f47bsm126108766b.52.2026.08.18.02.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:55:09 -0700 (PDT)
Message-ID: <23470e04-eea2-413d-b055-7451fdfa65e9@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:55:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] phy: qcom-usb-hsic: do not run the sleep
 calibration clock
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang
 <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-3-e5f93ea76ffa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-3-e5f93ea76ffa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -sckRjutbO627vew0u3h7Qqxdk_vX5Ys
X-Authority-Analysis: v=2.4 cv=Gs5yPE1C c=1 sm=1 tr=0 ts=6a842c00 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-c7pCBK0zC3Ie-k0gBAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: -sckRjutbO627vew0u3h7Qqxdk_vX5Ys
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3MiBTYWx0ZWRfX3/B4Hq6KoPfy
 beuEM2WrphQh15wRH77qmHMTGRNBjGvw700zD5woy1EymIhz/4pqi3EY0+WiYtgqSQwwuuhJCku
 lb+Keh6yazFgHSpr8hVCKPNDE5s4wYumdPLV0QG+lP1aeCzVp3tAxYmrqZk5W5k3WBgaZRKegJo
 FHYVD67CgNC88ZNHzHLdz6f0JBh4NUWzGKkzk4P2D7IRLyWaeYcR4SF1Gct06lUd+z4SfKvpuL0
 pyK2B0SzN1P584/nhxsUfJ/HlKleaW7pfqk+tp2gKTKVzVGNbIcVKPddlnWbTFfcqGyl0HSQzES
 fHXAoGSYk1ugNj0guhMXs+AdSnyEDkadyOUPs2nVqQvMSqS9pa9UY1heKKjVndDVamNFptE3RTY
 Jyfohy/V8ie1LmNfA9zPAXA7+EB2OaOE+WrA8xtxARj/f/T9cerhAF+4mywG5WnK6gUYCkAd28A
 lI+NoINpRwdMsS24FXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3MiBTYWx0ZWRfX7sM+XfvV/ZoN
 GlpZ40eprD2MfN7LGI1lNcth/Fo+DJ2+VB0p3xXkHco9SuDM1+Ij+/rn5JWcY8KEFKA/jlatSf6
 +Hjx0eVb1B3bkUXcRPprVsdhQagFKSw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180072

On 8/10/26 5:42 PM, Dmitry Baryshkov wrote:
> With the cal_sleep (32 kHz IO calibration sleep) clock running, the
> HSIC PHY engages its sleep calibration: the strobe/data pad
> calibration converges to different values than with the active
> calibration alone, HSIC_CFG reports the sleep calibration state, and
> the port no longer detects a device connect - an onboard HSIC hub
> signalling its attach after reset is never seen (observed on the
> APQ8074 Dragonboard against its USB4604 hub, by comparing the ULPI
> register state against the vendor kernel, which never enables this
> clock: with cal_sleep enabled ULPI HSIC_CFG reads 0xab and the pad
> registers 0x0f/0x0d, without it 0xa9 and 0x10/0x10, matching the
> working vendor configuration).
> 
> Stop requesting and enabling the cal_sleep clock.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

it seems to be used by the slightly different xhci-hsic driver for 8084 

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
