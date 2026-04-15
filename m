Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DC333506C
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244917; cv=none; b=l6bu8b191hW80/d2u/bpDj9aae7UwPuDtOIiHcDZq3bN/mHkJ1n8Wt/K7vNEXR44uHnrkGuwlB47Ck+nSCDsy7sXdcF7n4xUkgE3wes+Xot7tr38RBVzaG2S52962nbT5hP+vw0IHPfvErVRoAzn6rlF5KTazqMToWW3N33+qMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244917; c=relaxed/simple;
	bh=m1j5RrINyAPI/P/EuKGdbzHcBA/T6Nxv92BUQnlb+9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kIsPz13zUlc347ekNZhSXdOiCfU8wZWqPJUNiuICU1js+ux/gaA2Rguj5UHMdiRZN9tOGZPsOEUYtLw240j7Oncexu/IPNdhgk3CVM9vJiRFHgBHheeT+B6C+TeE5AtLp29YCP3SS3XG7eOZ7fneMfmQ9UenR2dT+jM2zK1CarI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nSkYBCz0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F4/1Tj2o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nSkYBCz0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F4/1Tj2o"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F4A2Is3126733
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hq9KsmafQwglhK4UF55U0warrVgOdBDQ7Wf2e8WsH4o=; b=nSkYBCz0PI4jpuLI
	03NG+lpyK94vsqez/9XUytSqMGZyAkrFBU5+j4baDy7CcrSNZCUUjEvmqRs5HcEj
	KSTy9aXUti2mIThk7KvCND61IzBmZsdNXvK3P5u5SOuPSL7GCoQriUNQe6NVJt5c
	y4ScnSy2epRuacXe5D5f3+SzoYeD4JD5E4f9i80BnHQPaGKbk3uDR0un8FbxOfLJ
	IAajn33dG9irrwwHQDnBUVUMx/iEWw1pxiKI1XlV6OM439A81f5KtEEyYJ0G5Cn/
	JEzd1hOcqqUR6QEUu0X6zO9hPRBa4+487jlaxK/sJ09TqVfLsHo2pibAod/2m5pM
	yoj5NA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht56tm8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:21:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50dec198720so11495581cf.2
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 02:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776244914; x=1776849714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hq9KsmafQwglhK4UF55U0warrVgOdBDQ7Wf2e8WsH4o=;
        b=F4/1Tj2objA/eNd8dodnFf4IL/mpYNtw/GU+LoLeJr5QMRP+RqhuVdbOI8YA0lzFKA
         MwxH3wLJ4cCe+9+nEerPszV89JFkKZobJ8HLg4NLLQiYqCXZJueMKpZm1Yj/Ir78c084
         gS58BUowCvoG3UNyxAjuGLfMdWcA4X5n8Zx73d5Tm0fBhgc0eFgihYqmHboEIhHVDHCP
         3mOzhvmcl7mmYYwgNn9LhvFIwi0SeZSHefONdDWzifK4/SZnHr17liBPsknBO4IyBJr6
         smdf3O2jDdSFiWe9ZDSMbvQdwQxAYvnzYrk07wAbm9wgO3u/r/8rCz8JEZw0E/EJJLGS
         V/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776244914; x=1776849714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hq9KsmafQwglhK4UF55U0warrVgOdBDQ7Wf2e8WsH4o=;
        b=Dp1REtttU/GgUJiUhv9Fz7ke3OyfgIKwPP/M6pE8F/8QgoIgNaxJfmH+645y+Vqz1i
         V+FPsppc6aee7GjAjYTY86wQHWimSVDA6rxLz8YclEbxNF8vJ5VKZt6UV0WanYPXlUfE
         zrKp7hVudOVjTfJdxE3BQnXRlBxg7kI77x2NvGvFujDPeog+/dnDH7yWHAJwQoR960a2
         QfuBcUSaagPDkWCV99+5bBit3+Cw2PsZFLmWoe0a6tJHbnDtU/QQhdbEWoLyE/2K5Zyi
         CmBb8EqPP0gYeaibhmLmfJC7A5H5FC0OiT6VRNRQK7+b4Ymrw8+naNipiNKB/oVGM/gb
         pxvA==
X-Forwarded-Encrypted: i=1; AFNElJ9EWF24/j3Wh6b8fMKt6ARtmMmZyq1Vj8Jdlac1XYrcYzMALWsJYtXF7YLsGIW6NPJFBgfzfFV2BI3A@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb2eCpt70KAbxyeFiZaNYlKp/bkJ4WU+UeGlcnmub1Es9XQVYG
	6Evmrt8Bj/9kQ2gP1UBqXuCkFsng4a6WtikDkEiNik95IdPglBLEs0qfK87pRW0DLgmd5QcSSG+
	Jb8ADcrZAz5OVp2LvqtLAfATKOr/jXjBrVEyJHV2rFWfYnmmuP8ZLQFtp8BmorXMv
X-Gm-Gg: AeBDietU2MZPgOzhfJjP6Vcvcs/v3b0uuWR2skKFyELMYjQUon+PeqkO9RpW7+NJhGe
	W1yN7nojj36b8BH5wvRnjeg89wvqFJ5wqPszCBeh2iZAPX0d62aO1DT1aYDpYZqAuFkh0eOifRC
	vWDmzoQ5wvJU2M2wZUrfCZmkE6Cj2nH7mPN1p496RTrjGQTySZqIbne0JhMsh64BMSYuEIRSmU0
	LZJCFGZ+mQ6UYwb+DD/wfRcn15xfEduLyjc7nTid0sJhyXFMNJcy2T4GhcaUim7/TrPSpjAqxed
	R2Kx/Vap7Rh2kosRD1mvqwkFpi68dEYlFH1uby0WqRmUBxxUaA9ADZyRebVvLvcmM4sLYQStsMq
	l3aMf5sICU/fTmqlefYIVzjguSjPleBJAZ7S1o5/b6TH6N8zvZ1BGZ/kTOCtxkz6y/DLunshIEF
	p8NCUVw9BtMGBBoQ==
X-Received: by 2002:ac8:5893:0:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50e1a703e9dmr14926071cf.4.1776244913829;
        Wed, 15 Apr 2026 02:21:53 -0700 (PDT)
X-Received: by 2002:ac8:5893:0:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50e1a703e9dmr14925871cf.4.1776244913330;
        Wed, 15 Apr 2026 02:21:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1773c351fsm36204566b.30.2026.04.15.02.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:21:52 -0700 (PDT)
Message-ID: <228866a3-ce00-431b-8408-95309033bb41@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:21:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] ARM: dts: qcom: msm8960: add SMSM & SPS
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
 <20260414-msm8960-wifi-v1-8-007fda9d6134@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-msm8960-wifi-v1-8-007fda9d6134@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LuiiDHdc c=1 sm=1 tr=0 ts=69df58b2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=wxLWbCv9AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=he1q09Cc-XUdRE8H9dQA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4NSBTYWx0ZWRfX7qwOO4MqjdBt
 xF4+sEj4djsxN8mg0yYbNNjvrngEkE4Zy6jagHq6ZACKATclGfqMgKg8tpq5IEByon7tw+EFydl
 syfG3m/RGOcZY/JsbAxoOhgf7UlXiAdGN3rM6E1Ou5tZ6zJoClw207azx1LYqksLwoy83K9lIKB
 /9GCLewLstS+rhtLdUTBCXx8D7CaRaIcgdwbn2XQyYOmzZeN1G5I34BQrOlHFibu+GatftrsNLs
 1TnUlJ637/82XrNjJEfrRKApO06SyD0nFlVuSzn1snMCLpD+j3LpSW0BerNAWMA/O0WAHjsqj3s
 4zv1tUE0XQn5VuCm8gee7Az5b1S/6RJ5vKrJYQaQRlQOcPmNCj8WoxlSazRFqUco99wAoJXcf/T
 VC2pZ4SbRJM9yqWGPc8GbgRjFikHKjy0bY7bBIvpFZj3l4hfL2FCMka35/qNC/XKbly+R0Vm/cR
 fFtwtSgn7lm7gBkbBNg==
X-Proofpoint-ORIG-GUID: k9FTKKs3TeC9PjCMU-N7kJH2fsyRHTse
X-Proofpoint-GUID: k9FTKKs3TeC9PjCMU-N7kJH2fsyRHTse
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150085

On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add the Shared Memory State Machine node to coordinate state transitions
> between the Applications processor and the Riva subsystem.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
