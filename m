Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF84E31714A
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781612576; cv=none; b=YBw0IpAGPRd60A+hjTAOn6aY1SkAM9D7upJPMtzdC7sNi0vHb1ATyH2fvBuvgHiDVeA2kYHccP3M51b3+dSEP8cmchdTgvfFDo4e0ZTASXJKtxx9uU4QjICC2ATvuL7fS3glBFYaidYdzix3hRk66pySOqYQQumVv+0UD8HKlWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781612576; c=relaxed/simple;
	bh=D7NXdzkCcINECpn3/BnF0aqzW8DC+JtguYIvQdgYpTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s0pf3ad4gjA8MhXXj8LNs73ckvMXr3Edfoz+VyYbkNUbTj0WAm7zS2obRRvT20tL4p3olX3GJnDxuC0Sns690y2Sa36sFszZ7lebbHStW3AwMlLEXHrjvxm/0a4lDwAKbHrHpCTvrY0B/t0beiq2TZL0ro4mfS8bWRkLUgIHpE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T5Ji00lZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JNZ7kJK4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T5Ji00lZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JNZ7kJK4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GABsAb3384266
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bcEkcPtMtutFQ0nojyplD+yn0BA2r3GEybBSJI5Xbag=; b=T5Ji00lZ0+MfQp6X
	1Czl+gt8xy30ur9IlOuLgACtwG82+77wZ42OSb4Xn7bndEYGfn7w2pVwuRWdW3kD
	fmFL9PnPEZQKtabuuqogfY2fRhc6bhe1FzoeORITtmmd0RNGMMIKyyWiZ6W2CGSV
	4uxNhRVOEoMRVFctwqkOt0mUxSzPwMuve5Biexe/SxIBXNB5uy5/87SjdpUKbQAa
	4LNDjsZB1HCpOvFGhMYWqhH1YQeniRk4gvip/W+pSEfUmhSpNruOr9Q626Q1ycag
	T4SQuxVAqRgEhaWL6mRcqujeOtuFj1Yuw1s32MtGxiuW9NJmrcIdnSSda65ZZqGs
	TDQOtg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1ep9btx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:22:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91571f0d3e3so18468385a.0
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 05:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781612573; x=1782217373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bcEkcPtMtutFQ0nojyplD+yn0BA2r3GEybBSJI5Xbag=;
        b=JNZ7kJK4AU0fYxQ1VJt/PgO3IbGIzCJ0aCf9/pXNEqd+wqGydnuJAGL3e0h+vGKvKl
         ZKUfFyuQjo7QvYclZ2XlsfnCK5BBSUb7LMOwDv/hm/Grywj/Th8eG/3rsuNCT3c+Ks1J
         aUpwBnkEOqnHJPREc4iXiCEM+GBCNNA+owhWVoDt6aNzZOZ4MfbJYRi+gzQRXkeR8kaG
         yFHEWShq94k4AFYG6um+al+Ga5xGj97MvrFXf8UXIUoeKjY9iR+8WbSX3wVelauGXeNH
         8XLimEvuI2tuhpzUBvLivU/oArlidhYJY8A2ECjfxezA9hHhQPm0EEht6hb0IQKBBx5w
         hy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781612573; x=1782217373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcEkcPtMtutFQ0nojyplD+yn0BA2r3GEybBSJI5Xbag=;
        b=KOPTKposWLY9obEvb7aBskEUeBd3khAE3ktNCBeVYNOewD6KtNiGY25rLQFfiJCFeN
         cfrCf86B+PPWvdtX2EeWVuu7BFuIRhF7rbuXIE0Vg2VerUO0koUKT5XAb7c5MoRFiwN0
         J8tqPyzwAwYEP54IXcD7k8FlpuKDBUSjSCkQ0eY5gIRUD8aiN3yhorhfx3+L31Q0MMtK
         SKpUZXfL54cw+di/XiS66HmtC6xoScmmDxnAykKcai3FgmpmJK/OBGI4S/EifN9MVKfu
         6VbmYIMdp6/ukHLYTfCnaJEgjoV8Pp9hEQ6b957XsZAGAUHWuVld8KFWfOTxCF4YQon2
         BfFA==
X-Forwarded-Encrypted: i=1; AFNElJ+B0uGk/k4bkFRKvWk0mo4+3YospOt+aYzz/Bpg+9exWJEX0JQeAm8ge655h/c5ald8kGqBRnV50eqz@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqr5VZpzZ+GvBrxtUALZcmLlX2VfXg142aTlyC0MLaMYagOEBB
	T7EFxgrEWh4XWCEaNa0e2uqEUh19AfjgEs2WmMRLKfS0a1MjhBd/dO0H84wcKdkGaDPTr57sJzt
	71gQbIsEF4uro409qi6ExHLAP+JhpUJXwLjdE4BqzzbuNSBFS363YyvzVNXyWZgrr
X-Gm-Gg: Acq92OGBrcvvdNy9GOpYgqR2REYc3tC1mcEwhVD0rLZhZri6NiK2MgOANcrXfrbd8UX
	ldU643MkEkq+tHifwRGETLZNRiWDk5cDWFCD+pFpW10d9rCmyyVi33vwC+Aioa/FplsR7wgh/vn
	xK8v0RIDlwadiVqGmkEj8lS+uFahDSrmQWCy52tRBQX2DRG0RWaZ7XDErw9MNd+11uJtI6aRJDY
	g7sFcHcbEFVRoO3dXSR1vds275DqqzJoolc6hY0+j7RN8BgznH5GnPflIpVzwefuB1QXOrTbrK4
	Zqiiaq2ojlIYRieWnau82Cv99YsijsFpqte4X3ifJ/LZH84b5+gVlM5DFYSlsyNWWmmA87XU7kl
	h5xmXAvWIUUTAP3kdo6hEGrfNgqdTpGuwrkouxiI+AXdOsA==
X-Received: by 2002:a05:620a:40d1:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-9161bca6345mr1765205285a.4.1781612573377;
        Tue, 16 Jun 2026 05:22:53 -0700 (PDT)
X-Received: by 2002:a05:620a:40d1:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-9161bca6345mr1765197085a.4.1781612572365;
        Tue, 16 Jun 2026 05:22:52 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb5103710sm636854066b.22.2026.06.16.05.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 05:22:51 -0700 (PDT)
Message-ID: <38dcea05-581c-411f-9196-caac9562d412@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:22:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: x1-dell-thena: mark l12b and
 l15b always-on
To: Michael Scott <mike.scott@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
        linux-phy@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, val@packett.cool,
        bryan.odonoghue@linaro.org, laurentiu.tudor1@dell.com,
        alex.vinarskis@gmail.com, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
 <20260521010935.1333494-4-mike.scott@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260521010935.1333494-4-mike.scott@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I/ZVgtgg c=1 sm=1 tr=0 ts=6a31401d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KdsBoOkKT-vHJQxM7ZgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyNSBTYWx0ZWRfX9O5HUME7m5tV
 cI6eNogb8GBd4uDY9e0heWsbeBtSuZwaB0WubFmb6uVVsP3pVSsImHSx/WZ5LMY0NQwi3R4mj3W
 R22nPmyda6vzLnhkD525beLfhJ5Ftxw=
X-Proofpoint-ORIG-GUID: TOuFJhLnyyhT4wBTDSD-39FYDLrNqtuW
X-Proofpoint-GUID: TOuFJhLnyyhT4wBTDSD-39FYDLrNqtuW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyNSBTYWx0ZWRfXwmm6/wpvTvRW
 +CTm2KjiR64tJb0PKiVBBWr3+6UsxYsdAj4fnN39Ymel+k9ayipxl19qgOS1HMbbHy/6fWI2LwO
 WPs5j3aeq/uez34RF43CLfS91rQvn7C0fKC/kYLqilqxfiPQi0uJAF4lMmvXbw0pKPH7PdUvkZC
 7k5CWTWemphDNbzjsvKsmAokM+5RGnU8t2UXRzwQ7lnmuaLpZWMslCYGY6kqzv7+QGCdgyMYdcL
 qPHxYzp+0LPk5AhS0fuTTA17jw14vLZ0yyMbSSID8yBLHrL58oKQ8UhHHozggLCsztr4qW/gR6J
 FX5vA9XrC5Z9Aby/9Irgy8QMpilkntpf2qWpdb26v6ZZVpAhIHZt+KlajSTq8dB0WqxYMC0ZpEd
 nwdbT32snVQ+VO8XlV+er9uI8r9ABaKIvNVrKB1rprhb7xJFfaikLeXWb635rORzxDeN02dFphQ
 7j+s/s3o2I69s/F93HQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160125

On 5/21/26 3:09 AM, Michael Scott wrote:
> The l12b and l15b supplies are used by components that are not (fully)
> described (and some never will be) and must never be disabled.
> 
> Mark the regulators as always-on to prevent them from being disabled,
> for example, when consumers probe defer or suspend.
> 
> Note that these supplies currently have no consumers described in
> mainline for dell-thena beyond the audio codec (vdd-buck/vdd-rxtx/
> vdd-io on wcd938x), which can release them when the codec goes idle.
> The board-level gpio-fixed regulators that feed the Type-C retimer's
> VDDIO and other rails are not described with a vin-supply link, so
> the kernel cannot keep their parent LDOs alive on its own.
> 
> This mirrors the same change Johan Hovold applied to every other
> X1E80100 board in a March 2025 series; commit 63169c07d740
> ("arm64: dts: qcom: x1e80100-dell-xps13-9345: mark l12b and l15b always-on")
> is representative. The dell-thena board file was introduced four months
> later and did not inherit that change; this patch closes the gap.
> 
> Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
> Cc: stable@vger.kernel.org
> Signed-off-by: Michael Scott <mike.scott@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
