Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B2F3D3CEF
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782213842; cv=none; b=KnE+OcyTQJUuNA9nnTV+qpFZDen2AmdgtbBhAMl5ymRbVNj/VFeybCAp0eEplp4px863uVyZS9BunSU5lG9wqUsRvc1GdTxm/myjzXHSGsJSwwQbuXvmXSHfyckkvZ2/nBpP2jZJ1Z8DUOpqJ5Hd6U1da8VbM4ESAvvRLnn4G48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782213842; c=relaxed/simple;
	bh=U3No7mwzLyHYxQXHWsBYQXeEGf2II5g9zdHV+6e5Up0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Id3s+oYxzf35wwiLMHUp8IstxVhmCYYrRfiLXWAF6ub72O1aD4ShaWxvhuOEWNxDOBbwLPUtl7DoSXT5f5ZrSRob4RRv3g+7NzTQX2JUoy7pASJWh+89bo+TJufKJiAI6oqnRC8ST7dHcSm8bjkHDuY373R9Uwl/3jXxDJH50Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IPq+qeqy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fH4YsJZt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IPq+qeqy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fH4YsJZt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsL3j4134478
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6etKF2hMA6eJILaUAeJ2b1krMb/CeFYqY1FdlDkm5dg=; b=IPq+qeqyGUNGovDQ
	kx+2aD87MN+8HoH31PFrPKnPqz0xDKddnVrv3hNBiid/6r9CP6VFhM8b8+6APgZo
	SrogivjLXUDuuJ7fhKFK2DFoyqpsOvdWLQMoE+RB/c4V/qoHR7To9a2DUjEEOefE
	SFzyRO/R6bzxW2133BJa7mvgF/Svb2AGRLaW6TFrfumCdk39N8bl0Fxi6/0AvCYt
	VSPi5BWiU0bGbqI+or6T3hHsH5FmRyzAMi/yovf8RRxQ8sQvOu5iXnF5FTzFPrTO
	sJQsDmdJ6kk9w/Ox0EAz5Nw8gqwVQaG6azyN9APhO9PNclxB/RWUgx6f8o66u1GA
	11Wbhg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe68h7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:24:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517bdeceb54so2190721cf.2
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 04:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782213840; x=1782818640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6etKF2hMA6eJILaUAeJ2b1krMb/CeFYqY1FdlDkm5dg=;
        b=fH4YsJZtpBOZVjRuE1n9IHVYN5utchqim/csmPk+1SeEiBCBMh9UU6jw8/LqVtifyi
         M5IPsDUzVX2IUAkgeyhrfWNjR0mD9r6rmVxevW7tt0yued+986D+1X1Aq9/5zjHZs+gn
         ZzpDvKjp99F//6akLdNZXQxq+MX31dyRVzGiZTT9hll/GnIwq9vLxAhDDHbm8cUhlNms
         nasP8s+qJMlPy7DwMdOay4APPZ+XnlTzkS8O5gqmwAs5LzkPLctI/vvdRwcd+WkHV0WA
         aT3bEC2r1NkXqYnXxYOqpkKUuz/HQXMVFXkos8tSA3xIGJmPVhRQW+AXwkGD4VKOM7T1
         QqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782213840; x=1782818640;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6etKF2hMA6eJILaUAeJ2b1krMb/CeFYqY1FdlDkm5dg=;
        b=XSo+AlnR+xqjtTMD8Qn+/cl6myLZyisiDTXuyxN15Oa5OjUoEd4Fe6/uhXcdbAxDNJ
         2dcmsgJL3JLBEBl/Bx39xeWNFGeusYegTVGV8pLxjxtzmJm6VYi8RhgdwU1uQhvY8Xwj
         DAJ4+xvNQHKzp7zy2CTRu5eKK85JUsFy3bUIbSVXEwhAw9Ar2X5Kcmnja1Q1kAYERLfE
         WOfATJDe8U0Xkz5f3gFcC9fhvgqueAGh/+dr2Zsc/nlCXPTm1TTAh4RATn+CZQ7Rn9rJ
         ziGcc3xLxsVhEWoyasjX3b5tpsCNRzqJ0GnzRtJgpiRUaYHltY29II/zgYyClpdMe6xW
         5M5g==
X-Forwarded-Encrypted: i=1; AFNElJ+gk8A3w+/2hjhARN7pjmSclo6qz61BBQz1BU7kl1eBECT+M7BgIPD6yqX2xMiTnVJsjVlIY0NmkN1x@vger.kernel.org
X-Gm-Message-State: AOJu0YxC6HQUcAOFsFhObIEQu5aTzBsoW+YqTOyK8ytwKH9w1hwVtsSh
	77sOr2yDI41oT7kulL6HessiSSgXTKX+j0WURRsUHGsLkVc51axPu8HGQHGzh4MuZ1Am44yyzKf
	TG1HW7yI8QFj1rDDCbUlonFBZ+h/uvx6HVGO8wk7bsEfvf/mmDC+Lquzc2lAFb3rO
X-Gm-Gg: AfdE7cnXwPOZ1nVfPytzOZHsXQSGyNTcZgVefBpYGhqirOvB1eRPKqdOfRkP4r+5DNo
	5T/djnJJZMSBxXIRq80tRRqgpHGtPL4uKUea3XFl0IaEFib7jru2APHgdrKsKxTmdqIhhel6CWH
	2X2CReFsXMvm2c9jOmfnz3gq3Q19D54C25TznvGdkc7z8GNswSvdPh+DO/ASfJfZ4Yf9tMat3S1
	BsSEYqD8R7yNNGzweVu0N6Jx7xsIHibk1tyH770uX+xBsMIMMjo2iWgP634hkXmbkVgDOBoSmDC
	f15cn2wQw8of12ypJAnCgt5o3Ntb9/UdPsZF9Cjkd2Bl/GJOVgl2Y4CYBR+aTfhluwv52+PTT0o
	3B0g+8H6U/2NP4I471vrav/mVTSc8Ixt0RU0=
X-Received: by 2002:a05:620a:4009:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-921805433f2mr1531959385a.0.1782213840084;
        Tue, 23 Jun 2026 04:24:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4009:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-921805433f2mr1531955485a.0.1782213839581;
        Tue, 23 Jun 2026 04:23:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e99b968sm493667266b.24.2026.06.23.04.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:23:58 -0700 (PDT)
Message-ID: <dfc8686a-55ee-466a-a1c7-af069b849e43@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:23:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] iommu/arm-smmu-qcom: Add SM8450 MDSS compatible
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-5-37e2ee8df9da@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260622-sm8450-qol-v1-5-37e2ee8df9da@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BttmLyOhpdISKVn91Yx0J1YjckKgDzEE
X-Proofpoint-ORIG-GUID: BttmLyOhpdISKVn91Yx0J1YjckKgDzEE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5MyBTYWx0ZWRfX3YI6AWiO8OvV
 NxLra68zlaqg35eIjM0tGHIFgMshknq3Xp8ipiXj8Cly77T3FvAaQIh09g/iLgCVdIEioHdukje
 AsumeeHn5iXVNi8gggH++axvUJRZXcw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5MyBTYWx0ZWRfX2uZ8ybMKgZKa
 Gw3BHZraccRGQW4HUtedvJ5FzOtkeNX9QBPO0v/IZVjbmh3E9PdW3O4bZktNr6uCiE4YbEHFso2
 f7RXZIgN05j4Wior2feLGvzbwh0ScV80GQK+VBZ/14J7MLlia0Yiz7nXAEstx6XSib3r1pAiK23
 8cdtkWyxYUYQtetAfwt4M87YWiiktgMZo3xlvmjaldVLMB/cS0bm6vfTOQuwhYn/weJlp9G91DY
 MLEaKDYrGhu9yLaPajlSftk3M0MqZKhviGdm/hv5hz5lJqG1Nfxm4X6gf2Ql1hESBfX2pVypPxS
 WWX+nE8dXbgS4WXqvQr8kz1hTgza8U56YcVZl4ZMI+hx6kJwO7G89eumsqpFvZQts6fWD31fzWB
 jsWZsKos67xWdUyORgjQR8XaVk13Ar8dNz1cEkvQhhl3r4BB0LZwz3ZvpkqxuX+dTflR2f3zMRO
 7mM6ialhSzEckUDslLg==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3a6cd0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KCxn9JDMVLvDjnwYN8EA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230093

On 6/23/26 2:54 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Add the compatible for the MDSS client on the Snapdragon 8 Gen 1 so it
> can be properly configured by the IOMMU driver.
> 
> Otherwise, there is an unhandled context fault.

"because the framebuffer is already configured in UEFI"

> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
