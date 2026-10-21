Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792560464;
	b=xdc7fRJE9aFbUTK1IvLXq+k+zrmQlkqVUk3MzCdEuro7n/wooWKky+fgD19PAUA1II9c
	 D4ImawjgaVZ2wApA8+FwxK/iQiTDy75CU2up7i5WBuP2hjGpVVV+Xf4akbxkFxcN32rWI
	 VlG3nLXg9/owRQD27FyqDo+3RWyY7Zo4b1EBbV0xCtVW34wANM5E617Fu0uI09NhiU/OB
	 l38xxYwhHsZPAtVonpcvJwoKyHh80PgWPpme/eLlHbY+7PB7cEbqUwv6qEcr0krvwN8I7
	 dS69+NIdgUlxGFytNd58Z8P2vLgYcp9t4zX+w1g44X4A9Ick5/4EMXIkOB4ASh4l9zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792560464;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E0J+zBC+eUWxbZgcBnl0PcuBy4H53M4vl5AH7OP7Ph0=;
	b=WKrVIUXKIUEIZnXfVLzL+AK6mU6FKlNdzxls8+QalBFMRCSwu2CFK+QpZ6M+MX4wCfK0
	 tXaUOtBGHmr1HpcKhFgH4d+8RThq5J23gr/iQ5wlurCgEuJmqRnydgEriGmS/saT3xZoq
	 NwStAFwpnxeWkDNlzyaQgWT2WcRILSs3uw5bc+o8mJab8kx29nJBWPPKF967Y/yLtTbCW
	 AMj1JrpmF3Sna8h17cAJvVvLE/0bt4o1nfWxbXnkZoN0fU1y8dmW/EsfLClSAhg8Foc5q
	 wVYm2JdsGSF4FZRqXhVj4PdoSC5SxquEqpPlvTaX91JrQlq8aV2UIoGQ/nBhtk6aSWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pI2HMskx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bHhIPOet;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C731C606A31E
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 05:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C731C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pI2HMskx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bHhIPOet
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2FPAc2394184
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 05:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E0J+zBC+eUWxbZgcBnl0PcuBy4H53M4vl5AH7OP7Ph0=; b=pI2HMskxRT1GNUqj
	g7QTRwzmFvczF3NswYP5+FHFRSdqLbz/K7H76B5fnvwzT/fWtg89gynspxrg+MCL
	XCyRbZHcx/X1P4z6jBMY7ieN4Up9yH7zy9K3dkfJzQmMpuvpSUR6FRwFrzieX9IS
	A8YVCLpCsrunBsigynp7PlaTI7Nw4NMhvYAZo9ROuqhHTZcvOGVkYNb715PwdIGT
	dSkQ3+6zYhkkBC8gwMiprZZ7kgS2WUWUSbfxWqH2wykT6vWUkl8T0rYDFz48qO9f
	T/zbOPfRxuVN6r7G6G1vHNIIODkLLm9L3DTiOZ0zxV9JWRCEBVw0ExMGFn0LN7+c
	rySxtA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb99wdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 05:27:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9572e892dso3057465ad.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 22:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792560461; x=1793165261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0J+zBC+eUWxbZgcBnl0PcuBy4H53M4vl5AH7OP7Ph0=;
        b=bHhIPOetakAydvYdOYKOIC48Aq/+ML2uY+s5MOKZVHhCo2NuLhW30aFmRI39MCChsi
         B4RhEKwqwC9K8GktjDyi91IsjzRS/8b1pwf1PiqoqCZkEKpQ/2qgOYQPdSzptc6EWdtq
         XSRILNRbGjl5QFU5uT7hwunRI31CqzEKiE2v/uLGRtJ6M/owb98kfpNDvYg0ohLKysXj
         0Dk9Dz0xG+xrb4AH3F9/7Ex551LY0ETKQKCFVr7KjXh/84T7EstWi5yMRHN/dIBKNgGq
         AJxJHgGSJVxxTvPjokH6dNWrEsXxkoH5oU+OR29IcgJ8u5bY+3wTimhzQ2u1XolL94sN
         VJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792560461; x=1793165261;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E0J+zBC+eUWxbZgcBnl0PcuBy4H53M4vl5AH7OP7Ph0=;
        b=tXNmAPIvwix+frM7kKpeU6ADW3EsJyaP56xHUS3woMRQhjiH+WqmNZNngUJ3665Xdz
         vV9uddCHr9uFryZozXBCyuOHHsHaC+rBcMAJ2/sy/UUqiCsa4Wxo/Y5RVPqfSWdNvP7u
         F6T3jSWZyu3+3nUmYC5gVi3GN80Pj0ebA9KdtwrA0vWH10h9PAMa7dxuuGUJi1En4Edz
         G5w/3ZtIV/VXCB015CXbJvehWyeYGTeSXMmVhJKa78cKy963BQ3Fjsk1HHzwaJTl3Amm
         23NL3SFkRX/1Q8NgOJAkIuoK/8PQZkVd0RbHVMAB3xp8E05KiGa0lToi2xePjF0bCFeN
         2/ow==
X-Forwarded-Encrypted: i=1; AKwUvBwmMmqueWMMz39oRBpe31ZJDoyQDiDT17l0OprGCMN3hEsZzH1+IW+eyKxK3PVIZQmlwWwKtsp8pPpd@vger.kernel.org
X-Gm-Message-State: AFq9FYK29EWHUzwOXsq0T+Ft46QNL+OIeVjpaBJGtxKrb/5i5jBn5nvc
	kKP+qwQVME38g9RiCufJ1S89GoaI8FOkk6gkHkAIU5u5QUswqML2oiyGCxksiNQXXnD4FWAtMgZ
	pi8D9/d2D+T4gcjq2Kqvv1G+jps6BqGMMkVGn7TBokv3/ZRiRzsf4lGjQYCLWhCS0
X-Gm-Gg: AYBFou3fIr66Uy/qRe76mjrtEi4dLWqw3d1dh32ofYAkbPO5AsmktPKbJ+3BIc9cIB/
	sqt7fV/x5L5221F8AOws+lYvrbkyjlDCSfc/ltxTfWFxAJdBNSyFIbKgIhQESl/wXjTtAj5mQRU
	hTUytd1nHjTDQmYvhNyDH2/K4B29VhkcsR8qR2nQgYKncyG5jY7huZ8kS+SdEAHDJkeayO6RF/F
	sXc+htt+8HdQE9kjH+GJCQY7lS9irFO1UcTRfRkdk3H1ESxck+qb8X6heL4kxjEf7wN0BqL/eky
	Hu8rBlytBOIaJ/aSMXyLSHmwHiMiSrdms9Wbi66fts+xOIGIa8/2WvKsJCm8ptf2U0aCRfK1XRD
	6YeQ1JLIKKfgerCynovDK4gk8KKOBnUDOEA==
X-Received: by 2002:a17:903:228b:b0:2e9:4b65:369f with SMTP id d9443c01a7336-2ea43c62ce5mr8191745ad.34.1792560461583;
        Tue, 20 Oct 2026 22:27:41 -0700 (PDT)
X-Received: by 2002:a17:903:228b:b0:2e9:4b65:369f with SMTP id d9443c01a7336-2ea43c62ce5mr8191605ad.34.1792560461167;
        Tue, 20 Oct 2026 22:27:41 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b49caa7sm5949415ad.69.2026.10.20.22.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 22:27:39 -0700 (PDT)
Message-ID: <4dbdf8a9-8a91-4a95-9d53-b707666b28d4@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:57:33 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 01/17] dt-bindings: net: wireless: Add QCN6432
 device tree binding documentation
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
 <20261016-mpp-bringup-v2-1-f510c33bfcf5@oss.qualcomm.com>
 <20261017-exuberant-benevolent-gibbon-86a45b@quoll>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <20261017-exuberant-benevolent-gibbon-86a45b@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyMSBTYWx0ZWRfX9QTOKPzMX5Du
 OXo317HAqMqGsC/WFn8uTjXsaMOnSGTVdeB5icW4B+MmUzoJfsekw4sP/mDGqLejcw94cSA3v3V
 wOYLqkG8Lkw8VuVYAQXoVydQjAVFXV0=
X-Proofpoint-GUID: Yk7WmkW2yXMDvugC3rMfgNzdjpGMPrwZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyMSBTYWx0ZWRfXxBIjzXG7YS/S
 exqAsErEvrfOoHlQ9Hg2qyTUy/PoMJJHtsLSovG1v3Ibkbw0GSxzh6QNhGarJ48WtUGGbKpSf5i
 8P+IV1cjZwnugdstYqVgPLqXppHvNe+2gz1YIZ7Iq7gRc6XNRs/s9g0C33gWDSydXZLTEEJ9C7Y
 UZVgpPFHq64ITj7wp6h59aliXv/yj+e1vdndqVFKqmQw7k2RDQUMpAhyuea+6CIIyRVDPs9Hdgu
 FmomDQwpilyJGucNeuVU/8JLG2Few1/z6HjApPES/TVasqLDqWMncIbEQLiI1M5gXerT5/k9wLS
 Gow9TVK03HbHTAPhYOPi4vqBoYr521QFDTFjtPy/eTPNB7K/A5jyxrgM6CrmvCmN52QzQAAwtVG
 kJA7MBnk10x0iBd9LCj7Hir7vNCp5St1Oq7zNZpXd9mBMnVgBu+X0OMrafCS7p6Y4Blb2ctcrX+
 4pDWGjQjS/taKq11+7g==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad84d4e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=86XGhZ5msFO19tOyMwMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Yk7WmkW2yXMDvugC3rMfgNzdjpGMPrwZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210021



On 10/17/2026 10:31 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 08:51:38AM +0530, Aaradhana Sahu wrote:
>> Add Devicetree binding documentation for the Qualcomm QCN6432 IEEE 802.11be
>> wireless device.
>>
>> QCN6432 is attached to the WCSS Q6 subsystem and is represented as an AHB
>> platform device, even though the Wi-Fi hardware interfaces over PCIe.
>> Document the compatible string and the resources, including the Q6 remote
>> processor phandle, MSI interrupts, SMEM states and memory regions.
>>
>> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
>> ---
>>  .../bindings/net/wireless/qcom,qcn6432-wifi.yaml   | 149 +++++++++++++++++++++
> 
> Heh, unfortunately need to retract my review.
> 
> Filename must match compatible.
> 
> Best regards,
> Krzysztof
> 

Thanks for pointing this out. I'll update the filename to match the
compatible string and send the next version.
