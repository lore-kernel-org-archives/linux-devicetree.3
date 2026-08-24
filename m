Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE074399F9
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581018; cv=none; b=IBXs0JF4LJag08t1aFSa0pPhgpPTWVUROKaaU5eoFphVNSudcP3HNBz+V0zouF5dCeTmEVeMn+DDhSMl6+o5xklvR0SoTKrD2MgiVeZyUO5Y5nq/mumbQyXb/S/gHY/Rkm3/3e+KBXiqGxfDgaS/2vWJg+skKYYmqDBm+CuSZdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581018; c=relaxed/simple;
	bh=fuz1AwDiVrmz2H6qeqwqyHnsETUV/yZMakfR4Wcq4iI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nZem7+fzfjEXDbf1bsMNzQcG7m21YOhrTCp5d0CTqqvB5qq5+D86ZyGijtEeXvNF+dWcPqdnqD5S6TPFJ28uQumo5is3F+l+VHs646m8/55VN6WWwxNiSH/PbhtwKNSe4+g7orWCOt1IkCBVSmpKS1ojK+LhjtSetTxQCok6KCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gUykcsMl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gbe3dMYu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gUykcsMl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gbe3dMYu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCuoIA4077588
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xcI9eJLymLtY8QiSEy8OAOxzGxCvQ8zOPHqU1Dbx/ZQ=; b=gUykcsMlJeSHlcUm
	/1k6rbBHbuQ/FVBh1Y3GazAmQq3shBdn7oVi7sPnJgLdyxUqwrpk6e0Tbuz74jS0
	YkHs37ACHPQ4Iddobo7q2Cmk9f5pr6/y0cZ5ICn/xCaLKtTmbzcitfnB38S1v0Jf
	J43vMfL29dZY7SC9g1200OzOBWTo8v+dPwAoWnmNqXY3+/LqbAj4QPocFZuWtRTo
	D2WpbNTrijfQhD5yagBvG9YrDrS1G7L87cefcJgYxolOhukN1fSgagIeUEXzs4lw
	w5+0bXASnkEUU9ohV+6ZLaLMe77fUsxmNheJ/k85RMHomwFTtWy/RcxodXaNZTwB
	j1AlvQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jpk4xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:16:55 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737ddaf8c57so61101137.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787581015; x=1788185815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xcI9eJLymLtY8QiSEy8OAOxzGxCvQ8zOPHqU1Dbx/ZQ=;
        b=gbe3dMYuR/Rnfg+5bhYPYCN3r8i9lyPVVTSG3XqQPuT7gMoXX4h56n+4p9AyAjGcZ7
         +hIesCOGkRGDLkkC/9uYe35lZqgSZ1cHPECTbovfKZzOU/GozrILgBXVDnRMQWWanG6r
         Z9W20HvXBzDzOah0G2tkZyEJkF5niPvy62A/ABTcTwcGgSoqrDcOl/Tb8MK/3wObBhAO
         hueO+V/LYl6jrEKPuDAWz20z64ljzK2b5afR6s96M8uo7SmVzp5X8pNoil7C6tOrVPd0
         l1HwbEw/p0pIIrjAx+SK3FPYSBqo7aPyha1/SUMh4yECUYVYOZmfkpyuTwv39D8mMjqy
         9GjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581015; x=1788185815;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xcI9eJLymLtY8QiSEy8OAOxzGxCvQ8zOPHqU1Dbx/ZQ=;
        b=rn+yS0mtTLphbd5xjEzTywQy9GddqIAgXEsBr7LWHt9WE+03JPl9Ir8DkcjSFGEU12
         Pq3bQkkt7RRXACKe01f6rZhT1z1BA89k0fERTv2kaZpnTr05juVrogh3OIeuDhr93RkP
         8jozoJK+0KWMkbIyAcDVtybYqIdUku/67Nl0maCv8/gUt105OhiT9Egsz59h88IqUj/l
         wK2EcFVSKiwyCe0oWQj/LX8ZWFluWsjVwJh3+LyCcsURjIkZ9pJIspwvfr1URzBvWM6X
         Y+p89VujP2kzQ2GJq2bU9pr+arFbvzB5U4OEtOpvYhORz/ECNxZm4aRHqyYg8xux+ZEP
         peLA==
X-Forwarded-Encrypted: i=1; AHgh+RpeqjwH0zhmAb1hvkcblAuTXPOvwAnz53p+n6uZi3vDeQxbJP85MK3reLbE2mCLDBPGTDs969+bEmaV@vger.kernel.org
X-Gm-Message-State: AFuF++mSld/4c9lDkDPGLtugr68A9K6+538kPw/zmZBx2VYJOB1ywRE3
	jLbABQUUz/k6itSrPR+86W3ZlwvKFOw2K6NFX7nLm5P9iL7nR60WSOPJgpfnA3S/kwTcrf+XR6w
	1IMajJTaxxu2grre9OB1J/dCVub+vUiCkHHou3g6FCxHWdRW3yb39RUNWi+0Nr37B
X-Gm-Gg: AR+sD11rdt96bKCsfvlU9zWYLkBwOAN/KAZ3Tc4qbkzAQXYvSposlR8g/K38DwJ+RnV
	vIOqvcKcSCVONx2emORyHLJBzV1HqS38SMmqMJaTzgBKRarWfgUGqSYKE0azZvtKVDEli+WNhjO
	l2MTduHGikvZBK3FWZjwWfVwUrZrBb5Iq5oMhB+hoPG3VMnMdVXvhLledE6tXvTghMav9E0unyL
	7Xk4OtARoFqvqOpdBIKX3YDYKPjttoN2n0Bti5LbR0acPHR5qBdQONVB+8US4BtUl7ys9cy2cTg
	XxUZHlEEQctZVdU7p6lRlsKAgL0l15ehavo8n1lJZDTTbSPwMa3SGvOSSjCpccOoEUk68uwrg/0
	4gOh9Fl12QMuMaNYDsshshuph
X-Received: by 2002:a05:6122:520b:10b0:5c5:f164:b3ff with SMTP id 71dfb90a1353d-5c5ff7b3acemr3109782e0c.2.1787581014767;
        Mon, 24 Aug 2026 07:16:54 -0700 (PDT)
X-Received: by 2002:a05:6122:520b:10b0:5c5:f164:b3ff with SMTP id 71dfb90a1353d-5c5ff7b3acemr3109753e0c.2.1787581014362;
        Mon, 24 Aug 2026 07:16:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e00129fsm10832671a12.1.2026.08.24.07.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 07:16:53 -0700 (PDT)
Message-ID: <993a82a0-875b-4b1e-bbd8-05fcc576cfa8@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:16:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/9] arm64: dts: qcom: lemans: Enable CDSP cooling
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-6-b15d47adc379@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-b4-qmi-tmd-v8-6-b15d47adc379@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEyMCBTYWx0ZWRfX/BlVE43NWXKI
 RaEh0+ATyTJ3nhKc9q9Ptlk8+RsWxpxd0GQQ9ZcyeC6hzkC6wXlxbBy722bL+0zjj87ExED5wVw
 0qAvV2m9/FhcDc3ZdRy1hDSlGUvG4u5qkoAY1Nt3cqvUvdxQfqE9Z++utKrw2Q803zPnMGBuloe
 p3xqxhRdweay2ZDyWlyrDAwSYfz1+IiE3/UUYEYItfaryEdnbQWgx52xEmMC3EFcruKLTctwZ2o
 t/ssT0VBWb/HNrFAcnxDoHbzWduKc37LJI3Jyg5Xf70RkSKQ1WBBXAXA6qHa+bz4k/YgXFOZlRo
 6EGS16eMQNlMCXzVcx6gP7gj2Tv8f3YXl2INMpGvzrIJMSlqlVOGHXZMKx7ymflsrVFaAxaYMc5
 3/IgpPQw/nuYHaqrk0pXZEga59qJUj9vRiQHqPBcNpeyydD1OhDt+IvZApcAb5ux7lXrdHPgcZg
 4Jgw6YGo6HuMxrnKyOA==
X-Proofpoint-GUID: rF76J-cOfnTkDN3BenAJHXzSYWoGJVaF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEyMCBTYWx0ZWRfXzWLHTTDVXMed
 3ztS+a/FHhECxNrS5oJZVcF9LA+097IGsxMos2czUMHFZ004FO+jsNFZl0Ca7hKuN4FRz6QsPVo
 hq3FVuLgSdN5SugT3fO7bQU43Bn/w/M=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c5257 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=GSCxQli8HqGggX-HJQ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: rF76J-cOfnTkDN3BenAJHXzSYWoGJVaF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240120

On 8/9/26 2:29 PM, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in lemans.
> 
> Set up CDSP cooling for both instances by throttling the cdsp, when
> it reaches 105°C.
> 
> Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

> @@ -8760,7 +8765,7 @@ nsp-0-0-0-thermal {

P.S. kodiak has polling-delay-passive = 100, lemans has = 10,
any reason for either value?

Konrad
