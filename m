Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478E03A2544
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781690716; cv=none; b=VBrBYdM15XXVHHCBQfuSb6BDTpGt6+mBXw5EKknOmVVH5+MEATO1YxNTa0RVpsjjLs2bZ5TpNd/UNURbJst1Cnr9V+BHz5RQDXG6fW/hlUbPd9X0at9et4Id316DQIGnM6R1pYQCNNHQDwxhT+2gNVXXbMVkSoUvNLr2KgxUtPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781690716; c=relaxed/simple;
	bh=5TxvZppIuVK4IbjAthVhCxutkqy3HZ+yhexbIYSVtPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V9Xb7EJKzC6rI1DysUZgCqct94RL6ZBXXv3HALxY1LUaLz7yh+RIKG27xYi0JRaKqJ5bgnXUi//OZBqYqqPoezpvc6yqCOV5SDYG/1x9+vbdGBxod4DCv2ANAIgdZF0ZrPrkB7M+IImyXJ4mdR+ZzT5CO7e7MgLg36Cdu/F3DOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TzyDBHuG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YvnwrA6w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TzyDBHuG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YvnwrA6w"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8VxRC2056617
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:05:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G/3xtJbSgpRVggmVdlAhVnxw+ha4tmbu5w4Ruonole8=; b=TzyDBHuGE0f1IEdm
	9V9NIeNbNQDb/0iqMZTyuniZC+ryNCgg1zPpFpCJCj/bTaVZhjC4IJAratuOuCJy
	ku9yMUEKH0bBi/jozOQUqItvOty3CIJwa7uxyN0UIe06CDzjCtkTI5pRk0WS7bOh
	ZfpvcKAaFXyPIKVs01ZjzNfp3HnlNGV9Aw7fGKr0a8Grg9L8gnmI9BWsI22e1JmD
	aScaO19J7tLldH4liU1GeFxHsgqws5ZV8ODpQJoGDSHZcUdKn/cbF5oH6PZaXh2T
	aP+BNQ8KBtOi7TpFmNeB9S/amPwszcJaSd1aKJdKAvdezqlkagqgaeBMc+6gYrMU
	kvHVRg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesak4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:05:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5178a632a12so13580721cf.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 03:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781690712; x=1782295512; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G/3xtJbSgpRVggmVdlAhVnxw+ha4tmbu5w4Ruonole8=;
        b=YvnwrA6wN0QbP1JS6MwoZKMlQMqcuJWg9yQxBiHoeooMle6T2HRAQc37SVauKe5iG9
         0RoPpQ1ubXcnYUYEQuOn/KX4etcMD0WOoUQfn5rF4rs+4HKJsopRNIN3VT8mVpzEe4HT
         BkN5xBujcut5smLgsHqwfznYOglfnWAlbUnzNaSBkVEOwmMYW/r11whYxj5kZGbHNRuS
         nMe+PVvajju9XGjW6D1s5vyHNJuSJw4e50kn5GkFNChfngQK8r7CVV0eE0SJBYg5coGI
         mZ0pFgf/5HSIoXAMv3ua1IFEV38k/CKJTXbWTHUPQqjlIVx8MwMREt5dOfmSYcSkBw8K
         NGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781690712; x=1782295512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/3xtJbSgpRVggmVdlAhVnxw+ha4tmbu5w4Ruonole8=;
        b=hfBYsAN2ZgB908JgIXDcptTM6e8e34Q1z8JhC3j3Ra3ZWxym/e0djA88bm89hQrdhv
         EzHkhR0xl70gvbk1/RLcuKQxcerhSxq7EBDSWNS6PrYNpiObtAUtTQdA2SPrch6Bf1bH
         z+9XKCOKwnBotWPnfXBy3fiti/y+V0kqv15yGO7sc+neJXqC0FIdgskz1pIT6W5K0H5V
         CNDOyHyf7EKEPsemiYgpMuGcUWHHoFyGKa8R3CDBcK8X/AVWxUe4se/2yjPxRF4k6MTS
         HhOVNSqMNFViJeIfLlYdLSzqwgL1VLOKTa1di8X8MD8QLan0pUEq5+h2EMM/RO82koY1
         e2ZA==
X-Forwarded-Encrypted: i=1; AFNElJ+AM1oOzMW1zCMMrdXMRgTn63v2K3dUXlMI97QLHvhsqKKMmxe8oqk9BGJdQzJaUI+FSlNBAvI4D1xn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy01m9igR/Z+gyaHoPSR8xjy8D4dE6LKgz586gxcGwL+K2WWTLD
	HHhV9pEhbrmMmWtC6iSKs/e1vF1qwHUOFKViK7V3x88UIlMsLW7xuntiicXBEayEFH5xDgn0eJe
	Dy+kNWAcFx98kSAeKcyubIlHiGUGyGuBUz+o/+3+ivjd05ShFGctJPYvl+Z5mylFo
X-Gm-Gg: Acq92OF1JzhB7r8Vm+zPeFI2+jIM2JR8isgIAiMli7/hIPXYGFW0UtUl0cllHxbQ8AL
	7SKYnX2N1tjfujlYXgfXPzGzHpRs8cWmKkY5cSqi3950KORk5/FFBc40guq02GYxb0WUur6+jN2
	cnTBvARo7bUsshtS9pVtt6Z53Pr/FsE32dk0Bih9tq/5lkbKSSS81FN4Xn5L08N0QZwbGwU5FPe
	QRaBnzuzSi6zQttvGNFGzRcUtProI3Ie2Wwj+M5DbMrxXEk3saaD/AE8lU4zkJRwPZDLP+L0PJc
	W7Um7CpBtKoKIWa1lh2QMPqjLI8K8O8y3thTjdAfbkIx54WATou5Fqd6IxUckROe+qjKGOXdGkJ
	wPoarguMWtvaQUZ1sNJ11uz3XSR3fPM4ZbQg=
X-Received: by 2002:ac8:7f91:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-519ac25db63mr22095951cf.5.1781690712303;
        Wed, 17 Jun 2026 03:05:12 -0700 (PDT)
X-Received: by 2002:ac8:7f91:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-519ac25db63mr22095711cf.5.1781690711861;
        Wed, 17 Jun 2026 03:05:11 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c01ee8286c9sm484557866b.5.2026.06.17.03.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:05:11 -0700 (PDT)
Message-ID: <b39e4b4f-c166-48e1-901c-51694cf8172b@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 12:05:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: Elite-ify LPASS macros
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260522-kodiak-elite-macros-v1-1-487661ac1270@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522-kodiak-elite-macros-v1-1-487661ac1270@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA5NCBTYWx0ZWRfXwy3LWDa/Ecw5
 OLybDKDWWleRRa7VI5LbqgYqC8UEYQ0zssYL6/2E/M9QsjE0CR+/YQqkYP7HZ+GC6EJWH4j1439
 CXOqJM1LY4fVJIIASuQFef289MeADHs=
X-Proofpoint-ORIG-GUID: p2wMqYFWuzE7InggiQDOU91e1gHumony
X-Authority-Analysis: v=2.4 cv=R6oz39RX c=1 sm=1 tr=0 ts=6a327158 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=UVdh9-GTA9LMwvOUMncA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: p2wMqYFWuzE7InggiQDOU91e1gHumony
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA5NCBTYWx0ZWRfXwwiBfQxaNUOp
 HQAVVItJJ7/zA5jWln/HncWDgecwFWp/SLxrulPssZUXDy2YMPkJHiGZap5lPHZHJgCg7B+fWem
 Top3BsqeFLUupzGKIaLI1fGcpHZ5KtZRK0hgfkVMk4fXckVH2Q/b7JC4xFEk1EXEeCewUyOswXB
 CNjg0jmjKD4LOtflKzIkFHNzwikX2HePS6HBocKhS4T44Cj4BBtIjV9yQp/SLzNfRLllDxDTzeq
 7qjcTySCHQrMGQEwu1MDi3BrvtvZoW9IWcgNevhpUDiI47cW4yZ8hbqXKBY+N9hHN1xlKwPNMYx
 Jt5PdHAV3iaITbmTCVHWvmLyfo5VzH66EH0FEYHW8tt9TnLPYNzy0lf4AdL+AjOGZgF6aKREy0N
 mJFDT/gAtl7N1L+3nM6+zD6/HcSMYZxgsOqs1WxhQyt0aIoMCZ2YIyGBP7zLjT8n5iIBYMev9Sd
 mPRJZeTPf1VY/SELdbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170094

On 5/22/26 4:46 PM, Luca Weiss wrote:
> Due to initial kodiak/sc7280 bringup being done for Chrome platforms,
> some Chrome-specific bits still remain in kodiak.dtsi, like the clocks
> and power-domains for the LPASS RX/TX/WSA/VA macros.
> 
> Move them to sc7280-chrome-common.dtsi and put Elite (q6afecc)
> equivalents in its place. The qcs6490-audioreach.dtsi file can also drop
> deletion of power-domains properties then.
> 
> This follows previous commits moving Chrome-specific configuration to
> the correct file, leaving kodiak.dtsi for Elite and
> qcs6490-audioreach.dtsi for AudioReach.
> 
> No functional change intended. The clock-output-names property will now
> exist for both Chrome and AudioReach devices but this shouldn't have any
> relevant effect. And WSA macro clocks weren't added to Chrome because I
> don't believe this would've ever worked given it already referenced
> q6afecc and the nodes were originally added during AudioReach bringup.

I think it's better to keep them, if only to make sure that the result
of dtx_diff isn't outside the expectation of a commit that claims to
only reshuffle data for these platforms

It looks OK as-is for Elite and Audioreach platforms (for the record, I
checked rb3gen2 and FP5)

Konrad
