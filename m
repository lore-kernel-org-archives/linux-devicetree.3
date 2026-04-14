Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F6C3C9EE8
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159510; cv=none; b=nQ+iGW+df2jTU9wz6mf9F3VnwMYt5V9RKMvSlfFXcvvElxwTQq0tDXdti9B6rlrHEKc/SWZrw+w+7j/QiKvYYv1YbXWInYHSYBFFVFiq0/2Gm0Wtc4wHrr4fS2mRfJ8IDYqdaixBlgYGyoYUzaq1pONSUO0zBNeo8MiIPK4ehv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159510; c=relaxed/simple;
	bh=KTvBSKVfut/C+3RayjBd5rK9yMr6kzjkGYNXJVsrWJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IxzBLmZH1hgA7ixRHOOeUQkpZwQ5v+lER651pFZRuS6Y1kRqH9FG4VZ9LrKGrdv2HNsEfjEUFhi9vZ4TGP6VQNovL7R89dAzFCkYL3SLoV9d4UAsoEult3Lr+sOZeWKjLMbsgLrk44Yv84jK4vwus17nqpC5R8VSUjV9eRk0Hnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S22rCgdy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FR8wTGFC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S22rCgdy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FR8wTGFC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6q6s12386357
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZXDrQw+KIE/ShzXzNGZMw84IS+1qYKv6D8NCeasacqw=; b=S22rCgdyk0Ksxxmb
	Ew9Th1pxGW7YLVdkyeHP8gH0X3S4KZI7lfVccM7bmNxkK6ziB9upigv2Adjhb7O5
	MOVqpaEKleG+wCZXgqH8ZYeDYn6TRtKFFVnmAwuOEawzdeqkbGzxYuI2zClAag1k
	YwprDNjzsSYZkqLf1sOupW7EQ4dShtdetCHJbswvDkkHdn7LWh5w00jq9bbjgF5h
	WZamGRJe12Daq2EtZsU6+wdlOuFF2ZLZ5ERrnAsZEJhSiZ1AGKCHV2ZYh/oshCoo
	aNjZ6RFDi4JmsOKu9qFZwel3OCVwVz2hYsVE5ai9KOHnR2i2QAZkwPYp3UvOsu4A
	gW/tig==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86w2466-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:38:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8a016b99579so19243046d6.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 02:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776159507; x=1776764307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZXDrQw+KIE/ShzXzNGZMw84IS+1qYKv6D8NCeasacqw=;
        b=FR8wTGFCcY8etnNmNhdDG+3XZnP7sTId8MPPwmFhT/LeaoIk1GGH0YheweIx26TqFw
         /n9Xzba4XhHag2ge/M606VOsrZEHa8yJmPal3ubY15oyhQhpGxV3Yhr9bK8L4uxVqBxS
         CFLvSqQP+q9Qsl/0jNYGi91ZQcdp8ZXgJ4jvzH/BMWxQpvxKHeSiOD7UTTVbAfpSbg+Z
         VRdH9ZgfYNt9Kj4/Pzr6pKRCNSR7zCS7oJiAsityO7KE/mFnUjV3O/X3wzCbGIxVDp3c
         HkMSiONv1mPnbpj/mV0jDPwPbT/vtYnXkhISlSPwUzZQnxIqYyr45jAagZbD7VXcg/3k
         ftUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159508; x=1776764308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZXDrQw+KIE/ShzXzNGZMw84IS+1qYKv6D8NCeasacqw=;
        b=b8/k9r2yWNjIE/1wx2lWZmd+KOpxKI0sCQGS5aBvws9BGevPVUwJcebC1Tf9QpKL8p
         /dgGPjhDAQcCGAdohPZGdFqB2ipkC68P47gf4JfcubdZUvZreMnS5DJjbNyADjmPhql5
         yXKzteqW44QRBmVcCMgcKAQetF29Nc3RceB13x2NLQ6s+w2aI3rI2HKB/ZHygw0JzPMp
         FeaFtuvmE6sOw6lMGMaubQsSCgh+R8nYn6SHU9hVGS44UpquWR86GhUzJ3h5sNgYmY2q
         UG+g3aoUq+fkDKXBnT0casRTEXBMlOpBjb5hXA79q2Z2uRcsiZaz4rIZE027DfLUH5iQ
         oJ+g==
X-Forwarded-Encrypted: i=1; AFNElJ+MzGJdWE5c01016lMlRSVnmruZvWGLJhzvcMitSSiqlpZQi1f8KCpGISsF2GrlbRiwYjuqzimXW46w@vger.kernel.org
X-Gm-Message-State: AOJu0Ywffh37F/7eiRZiJWcuUAsEM00Ztt7c03OYhuhq1v3Zl8ufeJLf
	k6OspvzSwVMaysL1ULoMPtK2MCJOPE6HxTX77+CmFUDkdP1MOxs3kOLUOJsmELjD7EWWgi3TTdI
	NC+oLxRA6yoFBWNBec9BRzYFNk6sr4zE7Na0Xz3s4r5vTURCAp/p1ennDQm92RUOF
X-Gm-Gg: AeBDietfN+y7UNkXyzlN0Y6iY8JMBlXeYZhBeL1t8Vyg8DCuO9r+jURsWfH1wYjxafN
	gOokAeCrixpZwA7p5DU8CZztOCjghcbgKR7DLNCJ3bG1BSaNY8ImkixXpfak3Qw52nwrA3vdUB+
	rFPk+kzuN/4be0nqGXTG5ZJeaeKVRXHR0o7mwLN9AXOAjhsDUZxl69SaReD+Cfuqdx1onooxGgN
	vPJ7fRaXgYxROYKgb9V68jqI0HdmQNo/ZtuLkKCzv0riO6c14IHPcGu/yOu2E0+1WWRUi5xbZv7
	+hhmA2cx+zjpm1wgBJwPLHZfAg1cXDns0TkwEf0QyxRGXwDBj53vjvEMtV1dzE17u+mkzhLpIRA
	2n045TgjNPqur462Z47pWHmO8mVFGf9Z5QSYhqz1vccKH4xm350uVrPZC6SkcG0+kBlef85DwG7
	9WmUBUign90rVHFA==
X-Received: by 2002:a05:6214:260f:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-8ac86ea9d23mr177075016d6.0.1776159507680;
        Tue, 14 Apr 2026 02:38:27 -0700 (PDT)
X-Received: by 2002:a05:6214:260f:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-8ac86ea9d23mr177074966d6.0.1776159507325;
        Tue, 14 Apr 2026 02:38:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f1810sm379610666b.55.2026.04.14.02.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:38:26 -0700 (PDT)
Message-ID: <5d3190c1-e09c-40c2-9ba1-df332d9f7aed@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:38:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] ARM: dts: qcom: msm8960: add SMEM & hwmutex
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-7-007fda9d6134@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-msm8960-wifi-v1-7-007fda9d6134@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2JTPLBNqOXBMnFYVmJda806CC2V8T7EV
X-Authority-Analysis: v=2.4 cv=HKfz0Itv c=1 sm=1 tr=0 ts=69de0b14 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=wxLWbCv9AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6Xm4nHdHo4a8rT5D54oA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4OCBTYWx0ZWRfX9BXMqcL4U+fs
 oxbJ0u2IzrCEd+GzVsZ+xDt3TTr2BLDwU8iAfRw5lB3qtQ6ywzHWcpCmetYu+aP4VZrdLKfWyYQ
 b/OSE4AlI435fHSUC1VKBrk+Pm7yKeHLb7pNgu+BZgtqtTlVvqlhO8w+KbzNGj+J2yUDX7he2D4
 n5pKi0Ns5gwUaw4HkcTtY3yGxMoX0y4hGj1JPvrl6Y0Dy0TnKWVFY9G1Y08vKWY3+DJDJqKVJ/a
 HgbejCCyWkh7ISLDs/YKTPCYabu4vCxDxysFmveqhfuazj1SY2her8tudzoSd+F/105jgRf0S/1
 UVnJU01nlvyZ+yT90QT0W3z7F8uaAnb/F/Ycs+f/LhC8rLIi877ej8PeK+Ja+zR0kjg+YEkuwxS
 RFNim1ZG4QwnuBffozg1Y+PWw4ICRLDPah7pukR7UXo+21E2elumBA0al1/W7O1hFtQVbSJ/eyd
 oxhuWgOi9YTMD8ReK+g==
X-Proofpoint-GUID: 2JTPLBNqOXBMnFYVmJda806CC2V8T7EV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140088

On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Enable shared memory communication and add the SFPB mutex for MSM8960.
> These provide the foundation for inter-processor communication with the
> Riva (BT + Wi-Fi) subsystem.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
