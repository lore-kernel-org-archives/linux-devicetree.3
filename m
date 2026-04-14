Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F242359A8D
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776167647; cv=none; b=khnI5aKvhff5ve8uQ98jvRyGakPu++yJkxdDNvZ4zYJxsxnMjLRn5F03tCU3Qw7xtgDk8CmCPmqdBd7M1Zxp16hAhrtkzfGtEVECYF6zd2ts7nY/cfc2Ke4cJ6gFBRKD1Ug1w5tQA9tDknzlDZovrAH1/TUdKbOLV1bDDR9oLfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776167647; c=relaxed/simple;
	bh=GdMiS/Tl7YbnC39vU83u5nYmklXbOLR5AdPYf9UIsFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f9vRB0gSdNZY43KBUHLzTJzpUKvGGt4GgiEDUnckignjbspDYZ0A0eS2R5QbkcpjTh2ohJnLh/P59FD1ODy0Wai6iQ7eOTR3hx9ta/tXCdg5OsDIJxIT9u/VLSucvtchAiIjWOkkjxEh1fXeeD2qlIxgC9hOdIEMNbALUf6mDhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f534vb5O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZWRnc4s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f534vb5O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZWRnc4s"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBUJKp2386374
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yhT9Ri3SIupvnGrhBh2Yg8tT5ZZJLGba6sAUft3NN9w=; b=f534vb5OVkJcD+0G
	ExDI6HV9YNQKyms6AjI49wDJsme6QaMiKLmyX7VQuAppakFP7x0E9pdARMRF+mfR
	GpECIKDuVjrtP6HNSO8GuK64GVd7e3Eb8TM/BiC4OgP/o9yaZKXzDh3n6CevJbBJ
	c/znYdDiNioXBwFbK7Zdj/wliAgYf+UbSrfRQ/fsCkx5+s7qhORP7fg8D+/ecZp1
	OqF3Xe4BbB2UPELSVboackDenewfO2VBBtB9vuby+nO2myxmEXpxU7A2K2O2VgWY
	4Ta5kucpl0B0aSSP5+S9jNoMJ1m4XWKlIhn6UqQJqrdxi8uOJK1hQByhEQ93DwA4
	M89yBA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86w2jkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:54:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d0095b0d80so158213185a.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 04:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776167644; x=1776772444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yhT9Ri3SIupvnGrhBh2Yg8tT5ZZJLGba6sAUft3NN9w=;
        b=cZWRnc4s0nb9zroLOs28dV5KUL7QP6d+jNM1z3evOhUxmb+JMBMaD67wPzPxzLr4UO
         OZELmS0qgkv1kfhBXCSEEgcC5wUEuCK+4RQiIsYOP2sq0Hz7VWfKxUXp4kjE1I4xXcCj
         JSQS731TodYsGCUeFAC4KN8M0MKuyALr9vs/SC3h3nHsdvR3NxtNhMrJuRwhVAtuufA9
         0DsYmha7Vl37kGEwBSOKpaB6eJQXvjWL+Q7ei3gDGoMO3fRw/H/0sO6xOlXJ2x94w8/X
         TUTR0r9PGDIiVaMBCzyHnQk9xd5FbB9e9dygIZh0HVhsAnwqGrXxaVLdthce8UaL0HBv
         rSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776167644; x=1776772444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yhT9Ri3SIupvnGrhBh2Yg8tT5ZZJLGba6sAUft3NN9w=;
        b=BVj6fpu9xk6UBbhkC8wCZgqWSs5t2S7sPZ3VAt8kDMM+3eFPcJ95n4OKnoG5lfygHD
         s1EdCyi7oZZv3e9WukCMxaPr/Ca7+FNFn7AGxM12NLI8uWEP+qq1kldZqkOTN6/zBX3R
         A33I53I1TgFzuExfdaR0YswPmZtyhEh3CLq1GeW4rMQBGHUdqGvT29+9jIr9jPqeYiCi
         0269ZBQ7PFUujAowoDIUNTzE6YGZOv19zQca0swfnsS6RzemPGhSVwhF66g4Yj9hNHV3
         oPd7BwnMWHLYt5UHbsiuuy6ig8MOhSKxBOr1PbcP/nVyPnlxYpvZnb3EGxCIYSB4aEQI
         ss1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+J9hLQGc3sQKH/YQ4JAfA+AYivF0/iniNFnd5MGaxVpavMYDFIO7M7PDASU7GweblJj+rO4+mvxdo1@vger.kernel.org
X-Gm-Message-State: AOJu0YxU3C307KLt4qqRpSKrk1VEjTODrr4bOzr4w7XeY9IqvpXbXblQ
	yxIv837+88nnQJGtDl+loW9K5XTVkgcYNSniGUBK46Ik4yb80pmvuKh+hdSFenIlYfg0cMDbAqD
	1ej3ECSHqISOEV08QNtgjApQMDu6L7gX5DM0nx3Rno1n5UN1+a+JpDqfPdytAuWn2
X-Gm-Gg: AeBDieucxwWnEOObrzkLPK5RvRJqoyK4FA6BmIkNKmPuW2gCCJNBYn+0TFEX3FXSsnD
	yJYb65RHaXq0uIjS/HI1xp0sHk9t0mJFfaWRvY/cI9JDI9szA1i9qIubOh03mSrmBe6r0pPY+5K
	IJC6Fx66hRQC+0SjOHAJJENfFTxUrgPske5PL/SSfZ1sUjDFwvmJL84UP3FXT6dySDeODPtyZvU
	D/88sMCmGPm52Uqsvh6na+oQe+tZuwCvxRjS8HAERHADEppllyrfrN0K+hcAHEJE9YWJsvcSR6X
	/szyI0993tSTuf6xFJdu49QjBO87I3v1dzEdcpO4WeXP2ed9KmCJBTXayRu6hkfQtQoKrUvqN59
	re53Mt0XzJMs15/aiAVL5DAtwTWdb9+V0AU76oegh46J6TU1P81ekestw31mM8Eymen7yw3ldVj
	1UGzEEDeiBe+Sm3A==
X-Received: by 2002:a05:620a:4411:b0:8cf:d953:b4ec with SMTP id af79cd13be357-8ddcf4b4a29mr1756644485a.3.1776167644494;
        Tue, 14 Apr 2026 04:54:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4411:b0:8cf:d953:b4ec with SMTP id af79cd13be357-8ddcf4b4a29mr1756641685a.3.1776167644119;
        Tue, 14 Apr 2026 04:54:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67070815d27sm2964601a12.24.2026.04.14.04.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 04:54:02 -0700 (PDT)
Message-ID: <07ff689e-39dc-4f3d-b68f-3f3942916283@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 13:53:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] arm64: dts: qcom: sm8550: add PCIe MHI register
 regions
To: jsandom@axon.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260409-rb5gen2-dts-v3-0-be736355d4b4@axon.com>
 <20260409-rb5gen2-dts-v3-1-be736355d4b4@axon.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260409-rb5gen2-dts-v3-1-be736355d4b4@axon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KSQwHMe1oNh2Y7uga61U3LrV8QK_PErE
X-Authority-Analysis: v=2.4 cv=HKfz0Itv c=1 sm=1 tr=0 ts=69de2add cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=h77gEMGJAAAA:8 a=EUspDBNiAAAA:8 a=mYbSqgcRFfY83x1HOF0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=PYyYjrCoJcZo81GydsRF:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDExMCBTYWx0ZWRfX0SXShaEsssja
 r5Hg81Gl+PFbG0Y/Rg2tQgwja3EBcUreUUGXzf7Vo83M7Uc2hnfS/Y5KzlRqN12RYcJe+Psg5S6
 vqN5oGzNgM81AlO8GMemK9r6djGaQCVo7wdFBzOxBHDCrV482n6czEVgbHtzns7BW69Lx3PzD6X
 zabhZbjn6P4X6LrWTG9VURxw9LWP7x7OSPnyg5OQtM9HwW2ncZxQmIw1YoiMIi8hCst2qhbYiGY
 iAuETC8WrPL26Gj4F0GkAUYc4kgaY69EkOeRwqbsYZZw5b4E6ShotINFthv3SfOLnQNhVlEQlmZ
 ozSE+jvucUHFjnPrVOSiSkuqitimzM+r1zmQEDBca6ceBFoTOJrBO1vqnBXLpLz05m74utr5WAi
 j31KYKl5xAAL+9ovUe/mMY0t6524T02vdQ1v3wzQbTfIxGjq/slxfB5d3txtTcXjpYWfUgS04a6
 amezhY15FuXdeR42Hwg==
X-Proofpoint-GUID: KSQwHMe1oNh2Y7uga61U3LrV8QK_PErE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140110

On 4/9/26 5:26 PM, Joe Sandom via B4 Relay wrote:
> From: Joe Sandom <jsandom@axon.com>
> 
> Add the MHI register regions to the pcie0 and pcie1 controller nodes
> to expose link power state transition counters (L0s/L1/L1.1/L1.2/L2)
> via debugfs. The PCIe host driver uses this region to read the
> link_transition_count from the MHI registers.
> 
> Signed-off-by: Joe Sandom <jsandom@axon.com>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
