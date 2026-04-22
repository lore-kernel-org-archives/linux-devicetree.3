Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB2C3C2763
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776850179; cv=none; b=CA1m3qeU5xyITW4p/XUYntZfW2R+JR0NqXdrXkkD+a5e3Y1/sVcu6jtexR5fhQD05pBpKs5YVD1/bsW1oRTWaiPIUZAt59eK5iEWZ9v1Myc8oUhLrwVbXja5kRB2BpfHNwYMxldfkqTZvJtByK4bHZ/YtWgsfLJbaUPxzMFGkes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776850179; c=relaxed/simple;
	bh=W1TxV0AzdNsAEIY1LUXd0/1L1NmsY3+g+MLNlWS6zLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lG7ihkEijr6eh+synXCreMe3mrMmz7Mb8Gaqyc/8+ZUu5N1uWK2Adt8UlyXlp4B82/zZiNrl3ry/QpKNu5PvBx1QGCvnTfqkihn1bJ8WbJH6X0sKPlETcqKUBegvwueN+lCsEWC7lChhlxCAIU/gXfNx2PukeYMFzSHU4ua5ToQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hx9ccA45; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eAza46W3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hx9ccA45";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eAza46W3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M4HngT2123518
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oQuZX27ltGNuPMEcg8XYzIQnb+j1FapnyW44Bx4mBfE=; b=Hx9ccA45sRbsO+YM
	qHjOCyNwRfs8WOWM21mcq1WAMy3w7R4AWoLNDn/oO/5jrv5wh4KL4aLy+DNCIGMD
	P/SCx5IC5Tn5VElvaClVLxmNJsc3LTQLSTZVTkPPWru4wT/o0x174a2771D2gwVz
	EWcDrfup5Qhpi2jGzt+0jDPgBF5/x/PaxrvmvxBkQxfcXZvXXkPA6MQ+nmRNaScr
	55lwOvyKP3bPNAU8toiWN4dcXwjTvhih+MvvxEjcsRZrJzFqu02ID5NcC8gT9mTr
	7Ji5i56B3MoUiztSfEU1C72MfaYvoBsnsE/S3QDCCjNwASPTdh8sUk+fqS/W7oM8
	S1h7fg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenftqtc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:29:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8acb4b340f4so14736966d6.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 02:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776850177; x=1777454977; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oQuZX27ltGNuPMEcg8XYzIQnb+j1FapnyW44Bx4mBfE=;
        b=eAza46W3HOXgsBEM7r2mhjVn0wlzmWf1xXrwKbV1PNPuAuBYRr+tfBqc4IWc+GzmhE
         3PItQZugjUOrqlcWYbQvPLRy2I2sXil5pknDIo3JulyadIoZg4qYQzTBkgh49sg9rk7J
         zIZtbaSHUa6JjMgB6t6aP4dW4tqeNHvUj1JGwmP/1jDhpREiIao+mHmr9wNNprOwOAvp
         vS4t449h8ui1/CjjOX6HV+9yXnL7kQ8JAkZNrl+sgP7rDLZaCAj0TAvETs/lgZ6wATB2
         AOGdaJ/FrnBYQzygeJvxwNSk1ARiMw67dM5eXawEQQtTxoFwUaUn1saT+ICp+5lfqU55
         vuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776850177; x=1777454977;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQuZX27ltGNuPMEcg8XYzIQnb+j1FapnyW44Bx4mBfE=;
        b=MJIT1Qd6l55D76g6hKM9vbHIgn6KrDNEmcXSZX5KIxCim4UMEDdGB3gnUFG8ZBqH1x
         Do6d9LXtmjSUTeRx02obvdCwCq1/Q7UBbNSJMC7vPIYBJeKy2PYkevq+0XO3oDhMQPxe
         txFOrdTXJpoTY1JH7ToZliV3NjsqFzCBXM7wWw5CJR9S5sFoDHl+4T+1ogil6s8QNAx9
         h7kcpJTCoWvfQtVr41rT3X8eMLp244C+g3pgmxAjop8Pn1dK0CLrvZkdY1hUbewFMifD
         VsL2s5vxBJz8fXHKQSCEcI7okIalI/deAGSV4PLN4WRMsMxC1mK67xIQCK4U9rUXzKZp
         5/wA==
X-Forwarded-Encrypted: i=1; AFNElJ9rl7OFIoIK4BeFRzlFe7IZYUHxHU2WcdALS3FV+i6bU81vhEpWJHcOzfR2mJYeRUgBk6pXjwNB03bQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyvxhOdTUC8m+9IbsR+LjhQIyzphOKgukZWDxZuRPLXhBfXSib5
	ir7hRWdN0u5qVc5QUzcWNPbI8JeHdpJyZesM+QvULolzjtRw3gAoUu5DrGiAKL/0rfRwb7VgWVZ
	9y68hcpkjc9xrD0CDXupS3evhP1pMmz5vI94ER4iYI/Ft8mrjZqK78yfA01P+rTTxoWApqvTP
X-Gm-Gg: AeBDieuYItkxUgnB6F68TVUyuMmDESY1WJo85b/fo6OnbZhhDkrXSNFrXM2FFe0hXa1
	aXK5I7qwMHLpw81E8FnihuMjJ9h1JSa4T9P9m0+lyzlX55eFJ5tnjL18cTy8BkP0jPbyX6QJEAj
	uZgAllektzSZcmA/DKRMHREMgOw6GwKhEHORaL0uZlpDgLA8bOzhdeVCPf5qkcTgHNk+sE9Qt8i
	yELWjAKCdgexPsvqFFvCS5ZWu0zYH8xi0FzWdlXBREBIAHc8VWtgtqZKW7f2zvVDzD+esKtTVQi
	2O8tsnFnMvGfn958ATo7jOiJNAtRQNKerqPZGWsscIZLmrPJgT9OL/Z9hmxb48RgqlRTP/iw24J
	pZyP/J+Zp8ghs8VI5G2tAKQ28emAK2CVMRUOQtqXvBzbLT6hYTdP6RYgH1NL0Cd8CF4WuDCQVE8
	yFyLvh0THm1iW3Jw==
X-Received: by 2002:a05:6214:5082:b0:8ac:afca:a68f with SMTP id 6a1803df08f44-8b028066d24mr239446696d6.1.1776850176830;
        Wed, 22 Apr 2026 02:29:36 -0700 (PDT)
X-Received: by 2002:a05:6214:5082:b0:8ac:afca:a68f with SMTP id 6a1803df08f44-8b028066d24mr239446586d6.1.1776850176414;
        Wed, 22 Apr 2026 02:29:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455046223sm525033566b.49.2026.04.22.02.29.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:29:35 -0700 (PDT)
Message-ID: <1dabf57f-eb2a-4838-9ac3-9032da4c9623@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 11:29:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/3] arm64: dts: qcom: eliza-mtp: Enable DSI
 display panel
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260421-dts-qcom-eliza-display-v2-0-67f8cf155331@oss.qualcomm.com>
 <20260421-dts-qcom-eliza-display-v2-2-67f8cf155331@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260421-dts-qcom-eliza-display-v2-2-67f8cf155331@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OdioyBTY c=1 sm=1 tr=0 ts=69e89501 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=WxTsWmAM6NDjCx9yuA4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: MbCfnoywWK6RBHTs0X4fIcvKtM7V4uh0
X-Proofpoint-GUID: MbCfnoywWK6RBHTs0X4fIcvKtM7V4uh0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4OSBTYWx0ZWRfX8PFkyxKSahcj
 D/L7m8AA3I7bats5xxYyJc5I6+5Hyhg8s73famCszRvJsdi+MneEBvu2pZsOhn8r5jsH1/GCGal
 WTyJO65ezCLEsGkZHSLKAJrmxF7qRYHVhHRC6u8DQvEBymxxi/Iocgl0f4Wg70cTi06eW9gYALV
 hor7s7Cf1mTSnFEwUyKCKWn3XctkxiSIwJiDRdDIc1/WHKzyjkmiMj/3SsLcP0QqFlr3v1M6xEf
 2V34NqUzzl03v/xaKW0r1GcRGWfRPprkSYVve2tUZ+2Z0RoMuxwBn2kdOZo0zlOz8h4B+P1bZt1
 D0Z8k+oHpBTdoknhFsKdb+LmtMWdt8NluUfUSsPiTZ6zQ7zEqarSenTgjiMjywrPG3AzIGivLTN
 tLwYdoKWOlANdjD7cSJU716+GhiREdDdQ5dLmP7DH5mepj0TAE8pXBiEzYuaQqY+UE6sYCzEhwq
 yiOak6ZF8TMABtjqDgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220089

On 4/21/26 3:45 PM, Krzysztof Kozlowski wrote:
> Enable display on Eliza MTP board with Visionox VTDR6130 panel.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
