Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D594472084
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388879; cv=none; b=MHxa9b0KeyuNmyYaMGdUrKkRPY950PGng4BKA5OSk56Fo7qmTr/WRvXj+6y2tuXx336aunF41BcgWlKjhIswnpGpr/w6+20CmsIKx5SXbv6D49xOOGxOqseXemAw19bBN2eX+708W6swu3eHqXHdBjUz8JQ903dCe3DgdO2r/SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388879; c=relaxed/simple;
	bh=3dvdlqTCgW0xyjqmHY7gt030XSmXBe1FOIXQX9wJJhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m+o+GILzGX088z4QG0Ey1Tafwqr6191+yIlOA6iUDpXZiPxt+RtdMGQjZ3KK+A1KfGN/c89r5Y3MgIwB8p/9I3gbzqZYRbUUjPYAaiPPgVFGLOVvjYwIdY1IB8mPcGPMs7F0A6R4Z8MV3ZsYsygaQIiExwxaOupnwYdMq7wrPRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JYmFp61l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UaGzqARf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JYmFp61l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UaGzqARf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRSeD407302
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uZIdKSxfOJ/PI2RORMPMKxcyGG3r0lPC/XwjPbafMnA=; b=JYmFp61lnN8mJ1Wy
	S0emWZM0Y4RrjaJxcAIM8sn5hI5YAB7PcCR6ldmSnWKHdPDIcLTouqHl1MXXY0Y3
	HfzChKsWk8bf9yl78oPKbMSKO90TuHFbkVhr76qSg3ZYhMMvgO25hUbxGvcnkt17
	Giir4KWUQl3aRwx5dRSY3r6kXXY03q//qPG8RKYM0HPpTuO5I6VoRHZhbOPPVNBS
	OFkkOOJD1GaTpUtu8KfuFGo7jxA9HirGXeEx3FsFPg+DChkRZBwpF/TLqCc3JPN8
	He1nHUvgtQJaLO7ijY7cUqqhVQO+egG0EqaUN/rcY8QAmoWEzhaGwuYZO2uD6xJt
	jXxuAw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr5wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:27:56 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c6e562b059so123958e0c.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388875; x=1789993675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uZIdKSxfOJ/PI2RORMPMKxcyGG3r0lPC/XwjPbafMnA=;
        b=UaGzqARf9trKvdNG5UgEt0DmhdV6jgBfmPVb+S9Oozi6UkvL+v18ajwfF5GgUmeB+K
         na5rAoZaAUP8Lj2r9h06HQdbU565IZDZtcbT5kbGYDzM97wmN9gMs7V9O5ygxyJ8cFm6
         DZCYArR6povZ4LSCWWYZwqqoJie709aLFnT9kdTtfuwKHKQbyvC9JzbsPpo8fxVrvdoV
         kT+LZrkjUuKFYpIFRl1m73x61Gh++oTCRA2wafdgvKZk2c2GThJj8wudipEeYKKqJJ8L
         UzVLbUvUEeYJ1p74BAW9nD9EIjLCkDIulZ2CeplgEr8poapQZXTA0RPC6vI1tEaBXNd/
         /JvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388875; x=1789993675;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uZIdKSxfOJ/PI2RORMPMKxcyGG3r0lPC/XwjPbafMnA=;
        b=Rs72Xy3iodkJFpiChABX26VHTUM34JP6rG6xLYjXEldLY7ePZDZUcIDSILA6z0fJzl
         pzQpuQYdXSrpnFdQ+O9zDBapFq9GLx6LEt4ULjIwVwfRorQMkIFXuXMYtQhGbFqFUjib
         ep4qSggX0WSFL/veQr8VxQ2mjCEH5i9VbmyTpKqQQ4+7Y2v8v70sL9CpO3XwW/BO1K4Q
         /r6VHYTyvVqxt6gMw8wAejLUTuACOyrpiRnZRrn1DTMQq/W0m2AvvVedEv3ZzmnN6qJY
         A9l6zuBCL440o+a7Z0LhwKzvPqlswuq92NA1/X/LTnS2086X7CTxjuaxa4W0yPlTW9P1
         Ju9w==
X-Forwarded-Encrypted: i=1; AKwUvBxaHsRht7c0l1JFeYuHaMxU9jgGkl04x+7ISiTbSgHrsnoyy2AO7IXG3sj2UMDUPxKuyY7s7uIHtNMQ@vger.kernel.org
X-Gm-Message-State: AFuF++lu6+bOkRtW7oqmgshdBdiFvtNTtJDGvPOCJZpXsXQ73B/ms9rx
	yhGmHvOF1VGRP4JVGxXSFVoQXwkMmtRyXQADSOI9VqePThTExrbuKcuyXPxQJmm2HaqRhF08VeB
	GzvcUKUrh9NaPxkHjkrHOlQawoi9XVImXxzJHsiQK3KiwkY6DUv6LeTe2YfjvCrBO
X-Gm-Gg: AYBFou0ssXwvzW+C3JpgoELFpr0iwNQRdDBREC6hIoAcu8Od9g7+vukO2mzMVP/ETgc
	Ky2q1ww3k/uAiIcpBAtaugkpVP9+Ovisjb4JporYFUB9WNviHnVFgBg6iWkzWRee2fAFZgV+OLD
	Nj+x3h3G+Y1LgegyiNt2W+Gb+LMmDW1yZo94uPjRTt0c7lAge9b2UqZmCztXnvoQ5bodvxXiMUS
	/YnpLDTEuh/4xNULRjNi7BHOCvwlEDiThwSYec05PgOjvu+svoUqmzIVE02ir63Tej8ObhjqVdj
	ksWh2YUUu008EZyfBIogVkcDAIwyvBJwGDDtLW79U0fDf4zd+iqhXSdUJTVAWxNP47bTaQU3N6i
	b+pMaY0LliKgyPOjMuXoy+A==
X-Received: by 2002:a05:6122:10ea:b0:5c3:b339:7b19 with SMTP id 71dfb90a1353d-5c981a8de22mr379845e0c.1.1789388875645;
        Mon, 14 Sep 2026 05:27:55 -0700 (PDT)
X-Received: by 2002:a05:6122:10ea:b0:5c3:b339:7b19 with SMTP id 71dfb90a1353d-5c981a8de22mr379832e0c.1.1789388875181;
        Mon, 14 Sep 2026 05:27:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a046c5fcsm2388912e87.52.2026.09.14.05.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:27:54 -0700 (PDT)
Message-ID: <4c28e436-513a-4c1d-9cf7-3aa89cd7b819@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:27:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/31] arm64: dts: qcom: msm8917: Add domain idle state
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
 <20260914-b4-idle-state-name-v1-24-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-24-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Y7JcvSWMVDeqxzjJsHEbho5lNw_tdhVA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX6zYBfziXvyro
 4hj0c3ctiIUxjPZu4ONACI47Cp9SDJoYMVjA3qXJUhKokuNKEBXxcwtXVSxHFdBh2SqiTo7/1Cw
 N4nMO1vtdWIMQFYvQMQUVNoy/6tnlPHzjA8vqOQmQEYSZUyVbopl4ZroRoCzeP3ZoF1/0SKWLjf
 W5dGEEYZk9RV59s4ZoRekzpA+FpRcO3frguwMyIyuErFJTiyfSQ8l+gFKiaF924c1FlzZXmpHCh
 Ja3BAwvyw5u4b/Yi2+L/twMN7L9LVMx2QeT5dvi9dpZwPvAAbLJtPafLc1HMX5lQh8XmyQbDIgn
 FLplgqZJiglPHGJH59qQ8B8h4XJ/6aMjaUOvcFVaKsNLA7nwghWVi2de304yNeUfeq8pZe7+7hL
 YVoMnXUpjOgJjjeDQT8Akf3Uc+3YAGaDZkbF2F8N2VPcUiDikfbfI3KpRqQMPrymc3ceiHLQ6mb
 Cz1pjbx6n03R22B0wSQ==
X-Proofpoint-GUID: Y7JcvSWMVDeqxzjJsHEbho5lNw_tdhVA
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7e84c cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX8tKkd+NdwUK0
 C0BFDm9mqnRO52UvGTP6/qQp9JbCHxj9QHBqSlUGyjQzs/KKZGAZ80nPhj58zwswU8VaeNZB+gQ
 wId0eFObGRI9wQS6diwDJm9cGl7Yc/g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update the CPU idle state name to match the low power mode
> it describes.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
