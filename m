Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D29F43A7E6
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784108374; cv=none; b=BnJXXe/Tb1FrBw4/H9zL2G0aRpDX1I8KpkWsmyYcphMOztP6nZRzXVsTWlJhm256QN02U0M10UdvGIOjoXtLOSkrmEhZE6gtLGgCZiriih0MoS4oElnhWbwWPHAX7Ky6MHxV/TJAA2a3B/4TzGIYck/ggtyiIG7UQhxtKnHZ1es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784108374; c=relaxed/simple;
	bh=ixLEFnjEUnUP/bMh43HQcEjBt/HPh/e2iF0OkDJb3II=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f30j1k8zI/aLt+npQ8HrNsy+QB/1JHfV5pXRStOCRGVbEMrVAdvruX/CQtjD5yNh97i5r0GGPY9ZLb0R3+cebpFujIzkCNQJJ/mTU2/cT8h5mI9q0COWfY/w4Z+4fBcUNlJLzk5IJ1OsjLpv9JBXe1iXpoORXPuK2WiLLjvjXv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l0HhCGOY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SYNmD+6T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l0HhCGOY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SYNmD+6T"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lGWB2555502
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+LZXf3ywPBCU19wa73bCd14XBEQ1wKxA94809Eo2JXI=; b=l0HhCGOY6WxYSmH8
	pjPumVNADQd1h2MWMyWzUBX2JbURI9Ce0FaLPOd8AodZ/DUlbSKHyAey7r3+yiCk
	W0t0VGCM+SpQz31gr9+xLg3qIpsVwEF7dG3l0XlUq1ZBBxn751ypJAIaWCqrgrLI
	BrQe3JdzcBHVcbHoqqjA7qx3E2zq9g+INTdx0ZPELYYGNKW3eylgqhBkYFUzPpu6
	+dFT+jDEZ0tp06U6cYKyYIDoFEuxX+pglKRS8f4C1tmIbYjVVEoUFEo/mSUVqN2o
	HLDp/6w7U5kegfmSVjFxYlGcwQ/Kx7eCzeLTydMZVzjpZNZMemdOwqWxZaREGiqg
	ic3KaQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9ku0wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:39:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9309b0f05fcso5846785a.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 02:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784108367; x=1784713167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LZXf3ywPBCU19wa73bCd14XBEQ1wKxA94809Eo2JXI=;
        b=SYNmD+6T+sIYCMhF51ZomncJt1AnbCsbc5oIrpuV5qZvnz3xiMjOZJ1l0o1HZnZRgS
         4oFJXPh0bef2pZUzVUO/yPfmgApZomX0EQ7T5s9a0d0rDBc2bQWkpJ67rxRl9q9dwbMm
         FgV0n6YZCe+rVC5NcxpjcG3oviaPQFJUN9OFsa6FoEHIDA0NtmU7b89649M1ui2drlOf
         OMbZkQlDTb8NG2Q7g0FC+0nmwvCQjaTWxfmAm68B6oOOAZaluikhR7Uw602/FOo8XgDM
         wucuVIjk3+jrDOEZvSZnY0VqjOdjKx3QgBX3f+CST8cCoSS81Znfwx9sFv/E3+2muVAy
         SDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784108367; x=1784713167;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LZXf3ywPBCU19wa73bCd14XBEQ1wKxA94809Eo2JXI=;
        b=MeFHG92SMwcG3d5SuYIHmMXqdLeYDSWkJz1e0d999GU69NIlIMrqTtk0tN6Z/dDEZM
         zrHjvAibcO9t3gIU1IM6A6qH/dTWoKdVIEI4jEV+dmAhu53qXTdoTSktoOnneI3UV2B4
         ch/m5veMaLrekDe3wBkLdaSLhZFo9pPOAA/y8FVCrfV70txuob9MviRzuVfX/HmnyKFB
         RPOe3g7PJ7mD2cOuneZUFWZkVcyP2D/2ubx4aUAvHKoAtsGct6xhgllXbyIDfgzj/MF3
         rvQKzIbrEz4pKmmuPIBD3tA+Bl+7YpZzmHwmf/jIsygp8TwZRb6TZ7n8uKErvyV35LDe
         ccwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpMueri3MJC/H67hMCQN63LyazhnG8LoyoXwv89s3Dd5p4Zj5CFNZpqTa+g5SqSbzr2D3uMPS0WKlEL@vger.kernel.org
X-Gm-Message-State: AOJu0YyfeVrcfGwSp7qmAiM8aqnu38dALua9zrmb7NJJiF5TbV5KmXoA
	WrzJDI871z6U94Blsg5/zoetLPhSBHNOw0X/OmBtPjdqyTTc27gYIZ3jyodAgQND2OulVCqzeCZ
	14PTCRmNmlvOZoqKmIaoh7HsVnYcFFrIHck4OKBXZKiAWuTg5lK4dYjFNaSAn3XPW
X-Gm-Gg: AfdE7clh2+UZDHmUVlrbr5IbinjG4sCC2N8oRNcw/0mB89PNbWSeiUtncQK6dtYwFYY
	VDKQ7WCGAaC03oldzHWqU7Og005EXR4KFoP0LJVapNYXzU+OXuBj8bgJJ3x+3wJiMHpS2byizAT
	fv4kv3aL2uDDxbh2KyiD3HpHgQlj8IdJbvJTP0B/e/PO+RFvGdXsObDWfoEH7hFfyRsSu74Jn0y
	RtBP+aUK1Hn6Cg8mSmcuFHZShVe2Xt6b4WntYaG5gAwLlmFF4xDI7CumkLoFuFQZbLTzJRS0HUJ
	Oin/wmcwVtUdFLRQJe9dTMceTQr/rRecWxw/4bkvNvwz3Z7xxo5EqZbjWm/Pqjeo0dyTw1nx09j
	o9y2mNGW4hiCfd+qTXqogT5XoVbolN8J97QM=
X-Received: by 2002:a05:620a:1a15:b0:915:6433:2599 with SMTP id af79cd13be357-92ef2b10cafmr1314739385a.1.1784108366838;
        Wed, 15 Jul 2026 02:39:26 -0700 (PDT)
X-Received: by 2002:a05:620a:1a15:b0:915:6433:2599 with SMTP id af79cd13be357-92ef2b10cafmr1314737385a.1.1784108366425;
        Wed, 15 Jul 2026 02:39:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15f272141dsm862326366b.59.2026.07.15.02.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:39:24 -0700 (PDT)
Message-ID: <b9bd5d63-787f-41c6-ae7b-8543a7b6c4c6@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:39:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: enable ETR and CTCU devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260714-add-etr-ctcu-for-kaanapali-v1-1-be5cd7a3c656@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-add-etr-ctcu-for-kaanapali-v1-1-be5cd7a3c656@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Q63iJY2a c=1 sm=1 tr=0 ts=6a57554f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=iWN5h_POgodqhNU-qcIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: zl3c-j1ss9n4OF4aZESyDm78jKj1HVl2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5MyBTYWx0ZWRfX1dOEBRwaczoB
 bJsKIugEn6QYw+7dl6C7g9vdVjTw7Dwg0uIBo75t+q/l2U7qksjYlC0fALp0r9Aelt1+dnsolKw
 okicequuyROHokzh3x+xmO4J2Ggk66U=
X-Proofpoint-GUID: zl3c-j1ss9n4OF4aZESyDm78jKj1HVl2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5MyBTYWx0ZWRfX1oWNIYi0p13r
 W/73bmLxY/FM395HozNdwD5h9p1rNoiLCpimZHaOCA8NpADSELewfMIQyf0YJOTxOZhE9FJDAxv
 IGwB1+sX+dvDDVcU5AgW6wnulTXRgxn0QTHXUfC/rjbTpwE6ZSaRDdfZCYTQcxiIV+TYkIWoJpg
 UT3T98D9yg6Oo+hKniYwoVeDTJwRMMLL9jdSUlVgp5GKjg3gWZwE7eLi7kMc38+Is5rusH0DgAP
 ByxMlyFwtDCikYRad9GzZjXbam0UfOrEx0faSO4fHycnCFAl0NrzO0Q5AweLVKKiHKUUDEgWpRF
 v8L1FqQD0XegDG7tyQDyStxj7KIq3Qu3igfejBza584glBRuP8C0ki9UaCBdtdBFwC5KgksEFcF
 WmrmdbwqO4UaCnVMlZRbPoq01AZu1a7791d8c2a/lzWmBpjIeKsrZfJflQvxaFLuxRZiGgjhY3s
 Gpc0QOGARN+hDyATsWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150093

On 7/14/26 10:05 AM, Jie Gan wrote:
> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
> tracing data from source device and the CTCU device serves as the
> control unit for the ETR device.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
