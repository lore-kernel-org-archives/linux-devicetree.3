Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993F649B5AB
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818557; cv=none; b=ulcj/S6pRhcPww6bN3Ta1n/++mk8LjKUlrAkk4V9VUxTQAJ5yjxVtGtjgCozAh4KfxGU7b3o5Qd97/2M50b1u/Ie24UN51bZ1UIngFSGmEj005HIyE0TSUtHd5qHrQzCyNDA3xeLp88Mn0uwAEUo/ziNZYvG+NaBXED93P2WhOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818557; c=relaxed/simple;
	bh=IJRoYw6sJZ0+0l+od7X0+0OrpYFWPVf9diA5uu82KIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8cefKAl53oNhWyzZYJRKku16FPqD4AEA1pgWjAmBuqJOFQxH+nAVt3hFmYVprjNHNMj8bZVWMF/+m9T5uhzCZOZXQ0MVLbAIOc4x8V6efw64Dp6qZoj3XJXeCnCYe3H8evH/WFZb+9T37LPhzJGEAwUq5YzjhSjDgSWbpuD0gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EnWCosfu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hs4u+6Yc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EnWCosfu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hs4u+6Yc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC01kO1404997
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=; b=EnWCosfu6+nUWUPy
	QD2VB5TCDmHoXtxAxBzaN8iPhIqe+T/ov/ezfWbNVjk186VpXldNJBWJNktH6Wd2
	DI0etNFUP9fsLR4oB4yY8dad1Mc8+Q2tRXES5Jk5gehApPwsa6jGsyLOvpT1a/6m
	QcYBdsFD8l7WrbP2WbhmiUFsm5Wmxp8qye0nhxBMpgbvppzXkQWuYorlmdIRib8w
	UbPcgHCzKan0KGeie/g8wzjvGOn3ydXMqyCld55ZWEhvWiAI2pLu0poYCzvMxP6u
	0LESE6CEu2qZypwrn2eB4pshtxgJj+RlwxSLTIa3V5T8V48G/T7K1SbXgyXOGwlI
	y66/hw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7kssh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:22:35 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5d44237e2faso57423e0c.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818555; x=1792423355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=hs4u+6YcZqDg6wIRzaGoT0hrK8KunavCa/2BocddX+4AzFl4rh2f7qUq/5FBqFqZd2
         fyP46WzkR5kyqS1EGnVUkF4bkSXhb5TH/1quOPz/AINMUUpzRF3uWdmbuKqyY00a/7+x
         IxmLZ+6ptquO74wXPtgU3h0Lw1KVtoHBsSPsKtr4HbsjDd3ly+1yMqIxjXHUAKEiJvq5
         Xk9bvtKbb/pRJBj7Qsqi6s6xdx/FyghUxldbaD2RGR2isSX5QjVgdhsO98dsL1/36fR1
         QknPgHlFANc8G0HuyTSkDV3Bg20PGGZE93M+VYzNCjIzG29NdNQTYgBxw6zFasJ104G0
         LrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818555; x=1792423355;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=XF3DtNVVUs6C9bC/XYMEy0GpH4Rv0yJZlJmmO0wPzf+B9vBVZkL1FJTRHqsrS156oN
         JmgOzl/M0ghSEXM0QZObcNx8tI0UwA3QzTAw11b1/AfWA/ykE4jFLTa24WN7JQVmaWKV
         Gn/HSSxcgV+zDMR0fKpn9AmXnLBKgo5YqPu8X4XNhElJfIVV8xBjhB3IwqepQnxpsRo8
         zRdDoDbYiEUsjL8nZ567kdgfXkmnmNB949CFoLiATdnc6qef2gZ+tYSniX6eTXcUa96L
         OZrEMbcXrCzOKQK357+hVos1zvtRiVZYHr+r+8pZesw9QkeAJfzHDoHzi7m1xzdoWRtK
         zdzw==
X-Forwarded-Encrypted: i=1; AKwUvBz511T8iQcTAIzUWWf3IV3XQY21f/AqTg66WEZS/Dw0xK3h9TR0rGe9TchgId1D8bWUbf+3JCeTMB+C@vger.kernel.org
X-Gm-Message-State: AFq9FYILLa/3rO7TYJ51jDtlH/52vp3rCQUf7yzirdZixAbRRUWgWAH3
	kpI9a75HJTN4aX42N8B7PywBRZZ2obOWeENp/Sp3RcN52073rZBeAKva7Lqm9fEB1mZsCoxpILZ
	uoJ56xgfMJG9VgWb5d1JUUdf1K4wtYSrCy9wCmqgAd5pXBpyChelB12aehMxfqeks
X-Gm-Gg: AYBFou0bXPWW3lkMIhMLHt+b+fGY/naQd76R4nIdHy4Ws87Usn5nYWK0N1/lS2kLuVd
	LQszODWHsMfxlqxOnrjUOotGp/EoXweWXhm/kkUiwoOcIn9d+h1MX1yXD5TC6nWimKRE/pgkqo4
	oUyLkd/Ungp0IKo0hCIQCcOH0EyRPgQZM6VzPDYs/Jr5c1TMJkfzrXEGmxUszDsYIQBfBB0tmDG
	eVIq2kwXqJ16GKDSajVXGuORm4Uvl3y7wvu0BLSX/4uMVDUkcwwEJmgML0/jJ4NaopqkPTQRPEE
	VJSCryamVhBlz6h6lvMhTEpKzz4yDu03y4OePhaRDhVfUEPMzcOUl8OHSxkKyPFMw5oDa37kRv1
	Lb6ciWRxYwhvONw5vIU/XBw==
X-Received: by 2002:ac5:c5d3:0:b0:5e9:426f:33ed with SMTP id 71dfb90a1353d-5e9426f4394mr982843e0c.2.1791818554574;
        Mon, 12 Oct 2026 08:22:34 -0700 (PDT)
X-Received: by 2002:ac5:c5d3:0:b0:5e9:426f:33ed with SMTP id 71dfb90a1353d-5e9426f4394mr982825e0c.2.1791818554124;
        Mon, 12 Oct 2026 08:22:34 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a9f776sm472745066b.48.2026.10.12.08.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:22:33 -0700 (PDT)
Message-ID: <af06bbb1-0068-4d8e-ae90-a1097ce6cf05@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:22:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/38] arm: dts: qcom: apq8026: Add newline between
 subnodes
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <9484f72d6da11bd98bcb4f93e24c44b6ce2b8035.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9484f72d6da11bd98bcb4f93e24c44b6ce2b8035.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX6IZm8LM5TDYP
 nUlmkneFYEPoFBo+O86fgFBoyv3MlzX3Lb2Io2L+lLzoURJCjKw2Tqn4OZTC+EQfr8azBmAxw2q
 EM9mpDQ8TJyNOV+u2GfZwe+z15wcA6JHw1l1F/Qd+5wecw7oC1PtX3V1fDbur5E7NcR5aSzgeHc
 LYQthvFVyQCrcUbWgGwHviA9CzirQLwvs8m84zJiFWI7iyCkQLWmebwh/x61jVTMVh6YXvZONFJ
 mO9DAD9zH9tXw6rXNCKIZN//22RJ3MqN4JvRgeK/vvkfMglYphkddeaplhhSSM471ZrzM8WEFBe
 qobqaJIdEnoVDvr1qpZK3iTR44WwXlFTn4SdatEyti05Jwmcgn8MYVLUZA7u31gnkeo55lC0Q2g
 WiFNmQsMnJ0Fori1ATiy5/dpTjOePQdt8HiP51gFyERa/R2mZ9eqK/AFj+HsXb1tOD1wHHWheSY
 nGR8fsQpf5YcZiycp0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX5wmRC8l0fMax
 6eAD7riypiK7Jz0dg/oPcrJkrUc5Zv9V4VPA3JDyBRWZ6PqaoajmUQx+ftF6//7UZCM0T99k4Ca
 zWTd7NQ/uVyD9cmrgO5VSZkiu7l1v3k=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6accfb3b cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-GUID: javOx_Gdj4wbujtoNLhPuhWQuFB7QRC4
X-Proofpoint-ORIG-GUID: javOx_Gdj4wbujtoNLhPuhWQuFB7QRC4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a newline between subnodes. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
