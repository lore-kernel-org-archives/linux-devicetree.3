Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB692F5A12
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 03:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775447765; cv=none; b=Km76vlbQi89TMKCT1a5QOieM5/G5a85+c1tgAP6JIVe6jvHm9oZyyc6/8pzTSNCFcGEQ1a3gnYx2/RU6juM9ZkHY15AADHoKc8N2Wu7sZ6RUzVmaoOjTQC51S3fRDeqgrrfrgEq0aQlMkphYi8Mm0I6S7eS+hvp1v7sI5w9a+4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775447765; c=relaxed/simple;
	bh=p1vY483HycGMnejrqOpyVYB4eBSMq/pYkl7XqVTVeQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IuoYHH5E6IUXCH/fnJiZ8vRsdBupfNWMtDRLX/ke7sNgPalWpKllO66AIYcj8KB6jc3kES7dgBcuVNrFyshnZVzkk1BBo95dItaf4B4QJEhkFmOzGhMYLAVMTkZVUerVys9zzD6fPjHs3NRxx5huvdwmBKBQPk50Xh4M93zVVhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c/nE2zdJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e533O0J4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c/nE2zdJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e533O0J4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63622aPN3989217
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 03:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJrcXiZ7T243FVJ3L4ZcD67EASI1BaR85JnQX28OM34=; b=c/nE2zdJhfqKWlI9
	Z5jpxNAaFSJkmwq85a6wevjR8GRgyE8cx+mEjHEHZ4jS4pMWvNZFn4hBFZvs0xI3
	VSKYm+DQP3EQbu7I+YaTLZQB+0dJgHfirE4fwdnuhtEOlfXHM+b33cHyAQWFQ7JL
	r6GC+GplkgCY9VPvAELmOkfBrJKgIdcUyBm7H6YMbsaOOGMP1HMyOnqUzG6p7Kfy
	r+2EaLzUVtUdyKRrAcS6GHrcBw0uInaddkMBbZ5PeOpMfOVRdZdyf3LfK3ThCdzh
	7YOUPg5pA78wDpO3NcpfaTD9XiEB1a2uZP85i46ApAia0rE3ETSBaU4Y3pa1sZql
	Cnj7nQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasyfks1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 03:56:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82ce50e6e28so2455974b3a.2
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 20:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775447762; x=1776052562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CJrcXiZ7T243FVJ3L4ZcD67EASI1BaR85JnQX28OM34=;
        b=e533O0J4AvU75kW/tPp+QIEnZmqz6e7Qr+IJdNuKEIhK35KNd8g0Q4INuxNcq72W6Z
         mEJLMnue9yQhOfXI50dP9QWZi7cMvIZphmSWKGXqmMo+zt7Dj0/PnOftxRG7bpBHd9YT
         r1QRms5G7my+nmybY0zf808DtlMGd1VEv4Pn+pYiOQnPU3MWcpaxaG4JobRbc21WTKbe
         cyyyBdVPFGULQiOKPCiYTBv7WWM6y2k1LFYmIbcRlWhUtUaH8q114pJxyq0FxxTm5m7m
         +3DLX4En1SmlsFX8fcN+EkKA0c4guY79WP+oa0UrYOiY2h2vQ/ajAhptLIE3Etajk4Vo
         AQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775447762; x=1776052562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJrcXiZ7T243FVJ3L4ZcD67EASI1BaR85JnQX28OM34=;
        b=h0+j0M39RyQSfzOg41Zt9OCr0uhpCzQ9ykPcO3iHCQI1I7eElFG5ppdR55MXmIiP9r
         zKuCsWPMrmq1m3GjqTQPcOmrCAOmts599+lF6DOHe4Z+7R0WIg4ExRXJz8rkFgtsYRRx
         rbkyghR7Nc8vXy/YOc0NDXDdbGvDNupYKTwYSjHIZ1+GPI05X8hQYrHFjzgqcgZamys2
         aB7Wie+VqJ69KA/PO98ohSgrkrSHG0/+8vhjYtXMS1kS+CooxKwKUmlEnAVAwR5xN8RE
         ImyVYFhsUveI9ZnICK6WXQPPEmRtJ2ak4EhvSi7K7aBYN4G/UR6U1lBXAbtIBJ+Uh9nc
         3miw==
X-Forwarded-Encrypted: i=1; AJvYcCWsXRLmUQ4Kafh2f/1CAJn7a2VlSF0au5nX7+leERRuNzcYvr7bkfQCSNm3It4+OmTNjZ5fKUPJFj11@vger.kernel.org
X-Gm-Message-State: AOJu0YyWdTiZVTLrXRkAj2juPAxGzrfBoe9jITiMn1CXN7V9UZtPNWj0
	Ayk6P0U4wgak3mozwMkPl8s39oQtncVePa06Wlm9658p6CArcdBpyYz8K3TiOxsO6VfmnhBUR39
	OGmLIL99DQrdIuytgZDes6bv/D4Xzm6omOz2bCUWJcPlVc5MQZ9qwOfH/Lx395S4b
X-Gm-Gg: AeBDieusQWC0GnUCAEb4WVfsmRueY0q7hBiAjlYnNv0+/fSYdbxCVWwk6gZMbvMoff8
	qvl6+m/4yHQldZ0Q40/vZhkImxVtYiUkZKLhbWnvDiLH/SsgTG6k2DzuzCOs4HqEi/YPKHi+tBV
	cA1KYo18kSSd2YxkQ//fy2/Q54q4RoU/duhVuK1ksDQvZ4tGvwTssv6SMxaCu8B3lvOQtl7IRWY
	+TGVWW7Tpto1Nkbk7rNhZPACmQdVBq4Fr2evtXLc3weQMe4y8AyRlCa8jrNJt5Uwf29UzADfnO3
	x/a62rdcx4ksUJb4mLK8ExByiSQ0alyB5hh9T4ebioRsS+e/D5wRBe2CqePTbz8CHHIT2Kftieh
	ZRDjBVMKhRpXVkuGwicfXVZPDGGHrNf7sF1kdoGmykVhLbgVxng==
X-Received: by 2002:a05:6a00:1950:b0:82a:153a:c133 with SMTP id d2e1a72fcca58-82d0da4ce80mr11068326b3a.17.1775447761753;
        Sun, 05 Apr 2026 20:56:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:1950:b0:82a:153a:c133 with SMTP id d2e1a72fcca58-82d0da4ce80mr11068305b3a.17.1775447761294;
        Sun, 05 Apr 2026 20:56:01 -0700 (PDT)
Received: from [10.217.217.198] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c41bc6sm12799494b3a.29.2026.04.05.20.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 20:56:00 -0700 (PDT)
Message-ID: <ac3a08a5-8eff-46d4-b1f3-5d98a951d637@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 09:25:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: qcom,kaanapali-gxclkctl: Correctly
 use additionalProperties
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260404105436.138110-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260404105436.138110-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDAzNCBTYWx0ZWRfX5DPfNSHZm+x/
 bxNZfRSD42KF7aSjKPG15Em04fPoRXrRyocVIoAWX6JzcyKPE4lw2Spc7zjp7nng0CveziCxJ1E
 ke30/JgHuW3+p+6c67Zxugvrl0gWs0B7ED3K3AzYKXdhxKrjmbv/nPnzwt01mx+2LrYAS0YtrR+
 RXCrpLxXhEQo1Ife0aowviwvy0FKjRvraeD974BLhGnm1Wg2sV7dMtfk+tcY9suTsxu7oqrVZpB
 r6IqJtDljzb1D4DBu1GJbG7387xFIbocLg1lrDB8845P+JRpPnALmO2wJdpiumIV0SeN1JeT6H4
 lwgiLmQxvY6AFWcTGfPjccwqI5MecxhTAYCT3SIUDPs0vy8iG0vY0+EAEAL4agiPW1t9LD59E+q
 s634WUgL6n7z7rcl1m+RnVahfFtRovnDA7IjwD8VGnbjOnIR3ff4EDjwb5oZeyyUR6c1SNzjVhP
 gmgozgiVMnOXrwaIdEA==
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69d32ed2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Yt71NFteXPjXTNy6dsEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: icuGf8et50cPnZb8DS4Fswxr_rfGXXL9
X-Proofpoint-GUID: icuGf8et50cPnZb8DS4Fswxr_rfGXXL9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060034



On 4/4/2026 4:24 PM, Krzysztof Kozlowski wrote:
> The binding does not reference any other schema, thus should use
> "additionalProperties: false" to disallow any undocumented properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

