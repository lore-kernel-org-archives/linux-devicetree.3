Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8214544AB68
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 13:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157834; cv=none; b=sfcKn/9kc4X42PEFvrRY98+YtI9QGLSaLS8rJOkeC5a8Q9MOsVZXGPB3V+eCV79nOQsOo/TiqaEQXlzHSmdefyWsXBf4QgXUH9nhH9FdV1P5RzHMYuEiAgRA+zuV8Ag6eioELR8asitFT+fyQjCAWtra6ZvQ2pv4xPmFpfIJP5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157834; c=relaxed/simple;
	bh=gLufYT3FPW2NEJDqme0F2uoTEeuYJsbUQaqVrEZieuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LsAPiday+Zd6mDzlX9qKOZ/2UonELwFIFJ2FN1wypa6hrITnz3D0TTKLrxwW5P22Vk9h0XoHv3SVIv4Mgw2BkgdOpwN9qAnwipf9yftWLtyewZ/v9z9YMH0lx2btllEHzhGXGHQ+yqXNi08L7N98AZF6izvUHqGix49NrVt5OOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ClItlAil; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jd37xcMY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ClItlAil";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jd37xcMY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAH0O2998512
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 13:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vdzBxvayCpF4yq4HHRlx5KzhM9wzjUt8kSXAllcT6As=; b=ClItlAilPvUWymga
	4bPzxmJd0d5Wf2DHR2sA7qnd+kTqCwsYfAkfQ71INAWIYq6d4QGBAyrHp8DTxgLF
	8aYh/TOq+NY97z+YgapxkZZScsPtOBemN0ShZulD4ZTlgIpZ+dx+VLV0YwcgKJLi
	t9gBN9F+A29qG2qoZbjbdfGK8Rd3wHJ3LvEsVS15bKCcCT3TrGMqSH88AV7KHvEf
	1pUhJ0Ni9ElgSlAZ+wFwlKJM0smi8Wx2O5temgBDjNgXGJzXssWUsg3agG2nlPj9
	2qXgL/H4du2ys74yDDgYVsitTDAhj05DLP2qL44x2aTa4bQhCMLGIJbbzyjha/wd
	TY3OpA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r12sh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 13:37:12 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5e9b3b44aaeso96301e0c.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 06:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792157832; x=1792762632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdzBxvayCpF4yq4HHRlx5KzhM9wzjUt8kSXAllcT6As=;
        b=Jd37xcMYMTm4Agr6fO/EeHIiYeoSOvzx7Fi1O0zd4xhnKJTXDD2BFnWKzwyanyWoI4
         tfb5KA+zHJNwnLNLT6bY/9B3e44eg4C6Afel6EOJAjhI1b0uX4NbUYHVDskeVzlQ8X4y
         r1zykntSV3cVQ9uB7JAdH10q1ZGy04d/jtwVeKgz4VS2rmENw84BOfIYKqEkYRgwa8fM
         +XgFzGzLPCwVM7Y8RxTw1Yi5429+UH0OHF+RlZnUK14muukjmUDL5Kale/+gJSpu/VOX
         r+WOAaNTzvRHnM6tiP3Db3ugQZyDwv0orxeWlQvLr+E8zyFDwdVWUoFdqdnfto9TEQAQ
         NHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157832; x=1792762632;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vdzBxvayCpF4yq4HHRlx5KzhM9wzjUt8kSXAllcT6As=;
        b=Fd+cU8IoMK/2p+9+olu27KUJleCe5eB0LkDOLNBWrlJ7SSed0OfUhDf0iRchpTjnqv
         aA/thJ4X2OCrJBtUWs8uqQ8zo5Cp98XjkN4gNg2R+/g3vNWb/rTrujS2+iERabM7aFJI
         AiE83tKjJlbBIsgIWuWdYIvhrI7odEkY4J9DWqrWv+aaQ1RNx2mRyhxUQN3kKXhzeG2l
         kIbgzJswe6ctGC0p1Gg6tqGycc7rEzoes2C9eM9+VrGkRCQviGm/kv+OHeo4H5dFp9zO
         IwCMOC9DqIITqLdw2dPAnbXMZQF4xIrAPw7Ti+tmcUzGZ1uGm4DPiZ3XXuBWC/oLeEUQ
         MXbA==
X-Forwarded-Encrypted: i=1; AKwUvBwPuRo+PwIFDuMEjo4KclFyGWYHMBHk5vPS53RvcdENhmC3h4svxY3Bo/krtx2x/A+3/861NbJbD5ud@vger.kernel.org
X-Gm-Message-State: AFq9FYJMtcy7Vfyn6gCaUq8J0Lw0iQEkbIwzVB7kzmmNqLQcoK3QjcSv
	cnoJlWuHcpamGRyssvs9wTLshG13AY1RSkWA26JNjzmRcw0ozLocUkozYA5/xQQuhjVi0BNN8a7
	OHQx6qOKxRXMa+hhfRfNWTSbtTlV+/4WE0e2kGkft3mcNyOIfI1rQ3dEqUnxMVSKk
X-Gm-Gg: AYBFou0orOjgDL5DujlwxE/HwuOU8HKyVGzOu5QPBkpl1oFNCM71zEMcDy+3ROda3sz
	bHBKk8WKLW4V4f41MlKHSLktfnln78znNFlbqqseQ0/ZYaImVF0vvsP7MwrL7T6yg1kCHmsK4l+
	ycInhbUKKwfVSvZ7EcMijIDs1rFRXHHgCiOOQe9X+QeTmXLYTLB84YIS5ywUIYMpIGUk6fpmftn
	1MLgGsTUznG7OlOkaMbVwBtRriVXKbskQW0MVw7ayHrLyJNzMrNC6OC8vZMRlJvIc3r7b0NUPy5
	6w4bVDzHS2RcppYr2YsinpaBrZLRAcisIceAERqKAm6m/nO/aQoA27DZ2yUlXeNzkxgbOANW5Lo
	YytZzsx3wpbLcGLuyuuBhsQ==
X-Received: by 2002:ac5:cd35:0:b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5eaaa0c8e21mr7163e0c.1.1792157831813;
        Fri, 16 Oct 2026 06:37:11 -0700 (PDT)
X-Received: by 2002:ac5:cd35:0:b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5eaaa0c8e21mr7133e0c.1.1792157831205;
        Fri, 16 Oct 2026 06:37:11 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c409239b3acsm73490166b.86.2026.10.16.06.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:37:10 -0700 (PDT)
Message-ID: <4994fbd6-9001-452c-9bdf-da5953a50a1b@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 15:37:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: glymur: Add support for AV1E clock
 controller
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
 <20261015-glymur-av1ecc-v1-4-448a476d54af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-glymur-av1ecc-v1-4-448a476d54af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NaCEAva7KHD1O0d4Ar2p1qihxGvNXAkn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NCBTYWx0ZWRfX7cFGFfM2KGeT
 uH4U2a2D3EFrEREArtqYAONRBpr5uxs7nYBeez/lYtVpoKJFhhAGbKABCswGqYSzSEvMEHOMjXX
 tR2KRHPWWVDpY2m4uFzi+FrgmJD6OyA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NCBTYWx0ZWRfXxLhD4mU0sQo5
 uJX469E91PIfLq+eR7J13mQYX73jKptgDL42clzXMJHssXWVl1ReRi/jtA9QJkHgFZIza+77+Ri
 MVgQpTQVwymdg6p9GrG61viLjZsX5F+BoUX2pS8r4sX3ZPDGvqidunUOHC5XaemUMILZiXa/D1C
 tkNfpsq78CL1LXjq4PTXzV6+sb1bS9FnuLK1KnZvdAgGfHcggVv+Fuho3XO421Yy626AVjPv7f5
 dctGb1isyn4/uv4wkiUnn9MGqdPaH96mzPFZgmXhMg1lZVqccb8fZr6IDzmLkF4T5X3TrfvsV7S
 oUYJ9zbxSogeLB8dXpVoPEG3TW1hAzi+ZVeg+zJyK+nV31nWEcq4KVx0/3EA328EuBCXX8FUYnl
 iuj5eQ7Xnanypv2r2c/Coji/UL18KKEp5r1SIrT5wCKbnOE+H4+rrV0pft/lm2Wsf4ql6I8Cmeh
 Wg0x/fW2Qa3ckt/fz5g==
X-Proofpoint-GUID: NaCEAva7KHD1O0d4Ar2p1qihxGvNXAkn
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad22888 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=IDncKmX6BrmM4lnx9oAA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160054

On 10/15/26 3:35 PM, Jagadeesh Kona wrote:
> Add support for AV1 encoder clock controller (AV1ECC) node on
> Qualcomm Glymur platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
