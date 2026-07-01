Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7056B481FA0
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 13:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912133; cv=none; b=Lsm6RzraZ1DWxr++NLR+FFaqJ5CKVv9FSyKJSP5+QY3OHDByIw3NiWw02IRUFdJ23cp/8GxiBhQcaAZ6vdhb8Oq5zmfGj+yE3xFS2djY0d26ffinvGoUQ/Qr2g8KnJ4pcLRq7bSFdlnEBICzbUmyVAEdu9jS8aRzfbB518dvkUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912133; c=relaxed/simple;
	bh=fC6o33yVMtcIYR9TGEh2aBJOZuz3UTNnUSTzAlE4OAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=soGN+qI7F6yKH0C1hW5XDIslQfgr7stobjkot6EOD3hcsL7QtIAxYNBKolKc/n+KRwqKEY53Q01dMt0S4K4g9fJutyARR4usALQKW1noG1yvkcKRPvhLjcL27kxV42KLv+tkG+r9W4ZlJVVQZOZqdmIRCGjkKfaftRYqDAW7IAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pb8ZsrfQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g4/noTjP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pb8ZsrfQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g4/noTjP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8hLR683245
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 13:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4EtLGdtoQuRHwGrQtERVgenV97LkHCFN0PODLn7CO1Q=; b=pb8ZsrfQ4g1e5br5
	/GWLrG34NMoDh8m7JyLzyPmPcO0D641l3uzdS9TZCUuIWVSv9bdJ0m6VrDZbv946
	FwF0J2RiXr1BrptUz0SNmKELGXRPX18v2k6Xb6lXp6SBhaxuHo3V67bey+B/tTEq
	+1egNH66jSwUyxPkmgnBA+mQ9mC76/3MXID/rRREh+c9NJVEu57FzT075wcOxIk+
	t5x6TQfQKzG2ytsfHVV7+J9xMZtkJM/uR2KV2CrR0084UmNOcHiWgyAH/PsdqyrQ
	/vrQKRCKL11Ixxvoken/SIDiP2w+XQyBlBBqDyHHhXQxSR8B+LnX/Q9YSGvnpxDu
	q5zPRA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jtqmey1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 13:22:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c07313be5so1327861cf.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 06:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782912131; x=1783516931; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4EtLGdtoQuRHwGrQtERVgenV97LkHCFN0PODLn7CO1Q=;
        b=g4/noTjPmyRMEuiMU/EKsJwDo3hZvTLAGbS+gyqxd5TtVn6uuoxkR/S+DTQ/MhlIL0
         bIbpIJpu2yACnSQ0laSQ7ajRBLERLcrfW4d0PiN19TACur9S21ywhX6lugxJacG98QmN
         KTYDaQZo7eJgBZl0rBScUeJs/4zrwm+WR4hg/tPWHRC1YJPTdGn/IqFQ45T/PYmp56ev
         ZOV1ms6MdMDbrDDQOSe1x2d92kkrNgL9V48dZNP1MkU7ouwUNp+sNoi9/CiSBV0Ot7IX
         b9/1erXujW5lZem/Msh8PjRfG1WZIuHoszOxX3VTEY1EgMYhZiwsB3QyD8LSMxwrsiyS
         rOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912131; x=1783516931;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4EtLGdtoQuRHwGrQtERVgenV97LkHCFN0PODLn7CO1Q=;
        b=QO0FzW0Rhd8pyGG2YwikBG715Mzz7Y5WV3iN2RSbPNLpBwsstS3ZMMcJf36MhoWEPA
         XyB3F06N6lHQlg0frNkK8pq94BMYTw4hujCEFt79f1Iu5VOIo80hvIaOo8PdmzkQled4
         neLS55A/o6W8JtRDxWzY/nVG/VDWEvSR0QpZzDJaOPlAJQzjeWDFAAJFshk+Tta6Y8bs
         em3YpZ1xD3YWUj3S7BiBrhzQ8j2dTghPtgIGjazjYeRKknX1/xNkCc/+KCYl+PO8ZvuE
         M2d15HAAya9VahNEex2Tub+AaTpTqOhzVDAvM10WN3msVG21+rMqpPbThUAbcYkL3z6q
         df7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/Q9eidpHygGtmDANwDwvoMj1bRzh+uCq9+rx7zK4NIMEqmPOiY7MzPFYEjdyphUPfNFd3RhGE+Q0iq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6TldH/3fn0RHKbMm4s4OGooHqqCSDpJlIuBHFDDrJ4GirHFOC
	hQy9GoiZbcNgR82aFYNkBvgbpcanf7uCBdmhqIJtpCTokKf+ClDs5qyi04Cf6rgaX2X+i5FeHel
	yoU3zSWeOe0WSPHJN57MeO0yi0k0+eXc0UFLg438UwRYBgWDiLWiIhRshmc9N9gj6
X-Gm-Gg: AfdE7ckWcJdXdUdgDV0bQIhijLCEgqabe0Dqj4rzCarEy9wp2MPFhOQAq/4JgcdfFaE
	MoP54AFrRdtaJeCAcYkFEiI49Sx0q5ZdkxkeyNmAupspUVdN3iSco+rko6hmmMjgv425z+cAplg
	vcbFLrtkiGxui2CCczNxG90FccoUD67a0OUvDA97X4moUSQ4WUArxm0UULCuzwdkk6+yAgVyGQa
	awQQPXYuHjC+Tt9+ziKz004jabGkj5wvYp+x6N6Uv7QWNHlVJ8M9fdw7R4/PDZjDA0jDMiPYNJg
	3usm1oKRN2R6tiCPs3LO5yKW+VZNy1rRRxxHD1zL1RVVfS0agQ4s4ry+e4c0GpTjLoq0t5SYqDg
	8Gk3n828JxAiQtjGsjpdgiyv20veczVQrsx4=
X-Received: by 2002:a05:622a:58b:b0:51c:d8f:d77a with SMTP id d75a77b69052e-51c26a560f2mr13436251cf.1.1782912130445;
        Wed, 01 Jul 2026 06:22:10 -0700 (PDT)
X-Received: by 2002:a05:622a:58b:b0:51c:d8f:d77a with SMTP id d75a77b69052e-51c26a560f2mr13435061cf.1.1782912129446;
        Wed, 01 Jul 2026 06:22:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288dbf4b4sm274203066b.28.2026.07.01.06.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 06:22:08 -0700 (PDT)
Message-ID: <2d0d3df1-31ae-439e-9970-f7d3f589754b@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 15:22:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] clk: qcom: gcc-nord: mark PCIe link clocks as
 critical
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-1-860c84539804@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623-nords_mm_v1-v1-1-860c84539804@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 47uF0Fr4xQB8Yf1BYKY-Q1gPwp8ViznV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzOCBTYWx0ZWRfXy/nb+rI4Mv/l
 CX4+RATEdg0W0+MHm1Bx1McgabKfbj/shqcwWY+k1SoEWcEKkGnWqEH5m3kFfhR7REPwHGC07Og
 JSBTs2PixKTZ7DQzFQbGDD/NDDGqp2BYy4z3A+YA891Q7Cav0X4uemkLPSOepuFXU//zTyMrQGd
 8p1ulv9Z82SbmFmc6sQZpkCWcaE25n1vI2PZ36lU7gZa3lcoZbw5iIaQbOyxgw/ip29kQg2jfbH
 YbdlHJG6WVvv9s1Svuo8XmRfYgcTTvPlINEzHxXDYuhufLTmgOIKyxvStmBDP3oBKcODRDQpHiV
 tlAVYV0Vn2rYvnBPXjxyPbr8haWBKwI8TfCD/hEpR3LUgVKEWOk0xoi4HiqlQBMj6DC77e5WvTi
 a9WaiZPe2PWM5/FFjwgv+C8BrdRJJKJlzqp2cZ/4x5BliFP/TQTXiLtNEEJBmk8Gpv6W/5xr+he
 EQahLEptWx6w2CWl81w==
X-Proofpoint-GUID: 47uF0Fr4xQB8Yf1BYKY-Q1gPwp8ViznV
X-Authority-Analysis: v=2.4 cv=LIZWhpW9 c=1 sm=1 tr=0 ts=6a451483 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=te8iVueUN0VzZH6eLK0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzOCBTYWx0ZWRfX70RmlC6QSJ4m
 1PXEIx/t4XPIOTiJ29FsXafza+oNdVDmsxyE7LQc7t7+gQ4HOGEMJ0o7sE8tYIvG9xztiqtA0B+
 My0RhWDSgLWKi4N2OLQkAZ2XatwUSv8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010138

On 6/23/26 12:54 PM, Taniya Das wrote:
> The PCIe link AHB and XO clocks must remain enabled for proper
> operation. Representing them as clk_branch instances allows them
> to be gated, which is undesirable.
> 
> Remove their clk_branch definitions and register their CBCRs as
> critical clocks instead so they remain enabled.
> 
> This matches the handling of similar always-on clocks in other
> Qualcomm clock drivers.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
