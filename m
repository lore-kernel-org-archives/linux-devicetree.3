Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D00F2C11DF
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388779; cv=none; b=f6jqGOcsM+7/9WzfXFSmF4l87Wz11yiChBPLzY2SnPUaGTUuJojzWavzQM1iXNLR8A7Nb6c6nekEr/drojOzKeoHOgRuFSYQH3+zwr9col7BKx9cT/AFH/YooXu5VW+w9ZKBA7L50noe38Me0DhyGOxpBiXpyDNykgIVKhH0z/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388779; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tFdXa3v3kzMRsAcGBc2RlkVGj0EB3YLldMjdUA+cHHAU5kipelne4vPr2YRbMYnDlDnoNWd9NBX6eiCuuJEKcL4G8osTY+kN8eihftlNa6K0BozRcrNAgieCQzXn7tQKN/fO7IeKytAJPM1CI02FF4Gw+Wk/nf5cuNeOyinuAOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VrP3BJj1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AgDsyvX9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VrP3BJj1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AgDsyvX9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm8qP531013
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=VrP3BJj110vimTQ3
	c8H8MYjqoWuEJZz90FbLkiKt6ycOs38D4SdQuq4D01DwnMkbslGGz2Hoao5hpg9l
	Ga/gYA3P7S1W8qTgUVXdQgtYXHyjyl03m1ElfX2ZOU19o88EYhakk5KhFRy+dRXe
	iCqqUEvKitUyM+jWI3P5KnFPSL9bt/TGeJ3OtUHXqO+vj8Kq8AEtGQY3VtjkwC1o
	OelRbTadjSpMCmkFWQ5SX9glaRGTfz7WDNw5CaZlqHxB/ZkXMqdCFQ9SE8favH4Z
	M4H9u+/pcEAVe4dw6l2zuwuOkxHxqLmpJZPGL3STErLI6lXn/ozVf0x49fx/jh3P
	hZcxLA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hstd6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:26:17 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-79750386c59so23769137.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388777; x=1789993577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=AgDsyvX9mr1wblxq28xE0Xw9nGDvLn4lETAIq+sVl4NzgJambC/JySqlZoFC2Ay7SM
         CbYRa0Qi562bNLLs/5b14QxqrVJstrDLfDR2gJROhtiyK65g8xlNtAFC88OTZngYtZTY
         xh4CxfAYG63h0k/+xrqOo0zAhPQBuFseZRMtdzOpv3kssK9sphLjzXsWY9oxP5Lo0erX
         m9rpdJ9XRiq/gBxiBPLBTcM3u7boLw3Dw1PTEhWD6AY6XTxng6HA6/MFn+I9hQYlxQuB
         QYTxP9I77Tp5Qiwf5MHWsAwJHW2O4wYiyXqabM1dFJfC3/1apet+SLXRGh3c9z7kezJ3
         qDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388777; x=1789993577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=PbNZ3Zji/fDwihnp4d1dVpBFtO0UWE8K5thwns/GhVjTHaBhJVnru+3V3+ve2RYH6U
         U5Qpi5yfpnaSyTWw5RJ3W+LReynKo0aOYA5ojcqKUAKAPvxDKCQoygq40AJeiqZmcp/A
         DiADfLtUJZutkG6UtwMOyCH0Yooju3lHE7sb5JWowlmZbnE6TL8lYO9JjbQspeR9gPB/
         60+EQvK6OdwJBDAP2SOJj/D795AfdY+jXwlQANAaGGw88oEgzBtTIxYajAhYpmzT8VTJ
         gMXfedlbcbR/LVNrlZ+9xAXMcnAjyv/vlXwt7sYr7rTArV5Vpb7fMr2OXjdy+0eaM75b
         e6mA==
X-Forwarded-Encrypted: i=1; AKwUvBxpWvEFfw8gZhFXaiFipg4UzmINTUikVsB0OLNPxFZd9ARrIGVeVPr0/OrW9qORi2BrFffHsgnLtJI+@vger.kernel.org
X-Gm-Message-State: AFuF++lAwDt+ZNthaKzqGqJTy+DBQtKI0I7TxNeGjx5J4Q+6KjjMBTrI
	0Jyd1u5xNh4/OndHi/S18fciVe3JlTQKUjlAyCVNW8MHhsTqSrsjxbojkvXVF8GLVPQQPyee2NW
	xZWS0Iafy4njdKonyREpxx7lXo6rnLrXTT62csUV97XqmoLq36p2alFYa9CM5CAWq
X-Gm-Gg: AYBFou0hGl7n9eNuL9QFjbyf37W7+D+C1QWZHUgiqaDndMjey/WPqKNqCTl5l2vIlKU
	31/yRS2gOYZD6MDVzFpIYTzcKNTxmkXRRZ8Lg+isHR93vykMHoROF6EBQ2/qiZtTVlpcSI1XzdX
	kZlUm4+ReearXQpA4BhKr/modLlJHvoEi+ceD8fv6w985IxQzaCJjlSmdSpPznKqsYI7rjED+lF
	Rfh9Gy1BzCqRV7v9qo/SBY4BDMvUfYmj4X10XyUkjsvCRRmyLNSI+xUryosW1Fv6eJLcDUTJ3v9
	lmTk5MWAHJBEX6zHx/DvR/HH9DR4EiwBFnqfnS1H68CyoRgWeW1KFLpvowWnjik2dRccFQSzILB
	PfWicjpgb7vQTv0EZ1Mii3w==
X-Received: by 2002:a05:6102:54aa:b0:795:41a8:ff58 with SMTP id ada2fe7eead31-79b53156063mr357636137.0.1789388776705;
        Mon, 14 Sep 2026 05:26:16 -0700 (PDT)
X-Received: by 2002:a05:6102:54aa:b0:795:41a8:ff58 with SMTP id ada2fe7eead31-79b53156063mr357624137.0.1789388776224;
        Mon, 14 Sep 2026 05:26:16 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0472d02sm2502050e87.62.2026.09.14.05.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:26:15 -0700 (PDT)
Message-ID: <b13be329-3cb4-4e1d-b355-a63fe23fc091@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:26:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/31] arm64: dts: qcom: sm8550: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-17-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-17-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX/LAtip2uND2p
 FzCEIVo6nfxX/x9BItYrVOAxeRbQcURXDOgVY/o5ZS7Omf7JPfZs7n8XN3CkFvQezJSfbPtibQV
 uw4MSWfRFYnRFj27FCLCtPvLIps6WCnE80Xi5Vu9glB5VjNQNo9Nemyqaf/ZSZyRpggqaZ2iDYa
 ztPRcwxYxIhf27D+WtXzYIOLE9fa7bXGhArkzWKfKFl/amHAOx0eTZsuxhzkE9MNgRbM+MU61Qh
 loqZ+gjIKjb9PUzDOfSiCwxpmFgqxzC1sflN9YyFmFmuVTIyf4s+1veGRj7W0ImpOO6xC1Xwy9k
 u8AGZw5tgHxh3CsPZzGaJChewh9XeRzA8YEyslPp05ib1EGbUxUnJ0b4xUkoaYql2GYK74KQLLK
 EEaOSLTBs2cxeGNkQtR1s4eFZDNAcglrdciDzaNi7N1nE89oFcySVjbuVM5Nwl1WSdhs+Wee9v/
 p1++7vcC7cVDAFrxdkA==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7e7e9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: mG7G9gos7OfgY8Y79MzCwb4nX7GL11aK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXyZFhfFsoKcvT
 GzKhqCEN9JaDkO4DCIcUUl00BBL89qtxE2G4BxtEgYrVoBVw8UyEFVcYCQ54viTzOVH0El0T3/N
 0JQef+ChnKpFqoTq5MKdL0y+anW9Oos=
X-Proofpoint-ORIG-GUID: mG7G9gos7OfgY8Y79MzCwb4nX7GL11aK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
