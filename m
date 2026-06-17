Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E533A542F
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781693245; cv=none; b=orLZhllVCaUh91JbxksSefs87mzZzfXGoGBH+V1dPjJNx++eTMl+vgFW2r9mBp2LIno8tKWE7Wt+VebeH+VEu3mjdBJIA1biam/JUVCJ2BnJzMVJansj67HZdr5bDSvBaimFSN1mfSV5BvJwEU9tRrnfLXgfJDIUDIMT56JHv+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781693245; c=relaxed/simple;
	bh=3H7FmkjCkWwwgeEGWRP7x/C3R8Co3/Fe5TVbE2aRzZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AjIIWpRd8we0j/OyYt6ZUB7Av0UAQf/dNQmE1soTUr8kXYzHIn9k49xANNG2aahe6CP/3g2GkPXFvyQ9kBldR/6/xj5TWjyEnX9rcbl4tAgrPtQ3zUVSW8Jy3ZuS1IYJLaT7jl2+3l283FJeuIMr/RGjEv7CpQkBLMCphuNRb0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UylOKhJz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A3v9lY1t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UylOKhJz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A3v9lY1t"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8VcNv2190970
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lGnwrht7Xh9Kn+cD9XO6GFVpkr4FiE5ro5RtFRSjrXc=; b=UylOKhJzUfSuFB2D
	tszaAHPBUP0fkjtDhquWDQBrzIBgBygm9V4IEiHWj5Ow7BuDFqdlgO9WOhdJ4dEG
	7kkPE1JL0AcUUSNhq7KXm87EYBFBry7NhbWIgMkteBvd8dzkGiCVE8wS0RtBEUPz
	QFcp7usEXQUbWr3jLTAkYUS2T+g5Bdj+rxNTSCbhJxM+k+sMqzP0ZpO8B14DnyZ4
	3a5maNV7yzeqsJqhkJws61J1Zr3WOvvmHc83fQsLW004Atli16FATFSY3gixzezU
	2bf1VCBiBq2l4023uX0FwaSWmeYpuu/0It97rRrGGBDMwxsrW8wfwF1Zj5g1IWcn
	rm0JkA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesjrfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:47:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-914b9d0162aso62910085a.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 03:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781693242; x=1782298042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lGnwrht7Xh9Kn+cD9XO6GFVpkr4FiE5ro5RtFRSjrXc=;
        b=A3v9lY1tVNqSS6ASn5fg//3hqxnzqfE7T+53vYsKTBsbFZpK46bcHf2VJ9rxvPignK
         kD1IaC4vfSWkbtiVrQiC4y3pqciL2PDi8fctHkPDqxxyxurDNyu/4d758TY7G2UWXldV
         wzEHUuTxaPg6jRe7BTA3Ecpk3wAqM0zt4W0IRCJVXJry7jIHTzlKY3RwLam26G7O2OwL
         SiggIlTh1Rz5RxHEI5FQc3xhgWULuTe3M8RQ+obLS86qxieh31I6z29+jKUyxsBJw/rU
         o4GRzkKi5vmEn4elkXiIVqsoU9UaioNLE/2DFAuMzVS9MHUmduUbdj3ht1bnva7teR2n
         wicg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781693242; x=1782298042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGnwrht7Xh9Kn+cD9XO6GFVpkr4FiE5ro5RtFRSjrXc=;
        b=OXa0HDLfA8Gfh+Rg3HHMlOXfxlmhDEquc5DtULRPOCiu60kbiOTUcbEx8zmpJpzo+s
         bRbAQv3ZAHF821VOUi9Q5pVqWSDdbq+wvphuPxSqG50X36wwWnI5yltMIE78pvzsXMDa
         bbkQk/c6wnUPBt/EU/XjXfIONGvIpVK7lUuW0jW8ARGIIGBqAqds4N3iS2eY6P7DD7b8
         cJigIz4BmhKlv6kd93faUorcooeLqlBSCHFrq4GYDP8JIkOWRanMCzPRBUc8/Xxvy4XT
         P0isj41wxsCmxeH64bNvicOZkiPHMv5y+4WfiIGObY+4NlS1SXCqECkDjM5VhnJNVLhY
         mSxA==
X-Forwarded-Encrypted: i=1; AFNElJ8xNXuL2KHiT9zDAuKUaVmZC9bshy5gjL5hePR7vkuB7oUIrkUDcAlJgN0MKjGMkzcdjkdgRmtCGefT@vger.kernel.org
X-Gm-Message-State: AOJu0YyxRPQKWaK01AobZ0qrNK0vz79hiTiPLNuP9PI63HcaifR9n8G8
	wYBBBhSvUCrPJaf3cOB3KxvcXXbUlc2gSGih4sKWFCkbkVvUWhqaI4/ClBDLFUVC5HtraNxPMlA
	YFnotD17mwGO9cACZJ9eeNretvdH6KuAG0dMcQKRP/e2D2fVJ+s/Cw2QJqd3DG0KH
X-Gm-Gg: Acq92OEAmCWElO5S9rwuarmNQN6z8D56ANIc451+9Z+rttqmsED2At0eR+3hKMWX1Eh
	sJywJEZ3+LtFJ7a0k5Qx2v9/b0HiNiEAYgKy4nbqFTri/iDdnxk5aG1CsfsUew4vqxtFVA4pirK
	ZdBbfOu8mnqwsvjMM/vnVC1NyVH2vOOsBs4s7Kgh8+r+W51zbjLxFcqgxb4xPYLb2PcL35i8u5D
	JxRrod4JffDgQ9M1mRB/tINuTp24nF4M3MIJjlcEbJ5kJTlhFgpKcOpdmR+9qWU1Arfer66WK5k
	NwhUNFf5pDjzhQO1WKFw0tPHnezAitDWKtYrYP6UKaz5g60M0oceGqZ47yKQJT5ok5F9LMiXx6m
	53icA+AYcHIv5SxfBL9bEzpxdIweAe3gJEr0=
X-Received: by 2002:a05:620a:31a3:b0:902:daaf:22cd with SMTP id af79cd13be357-91d876acd3bmr318134685a.0.1781693242433;
        Wed, 17 Jun 2026 03:47:22 -0700 (PDT)
X-Received: by 2002:a05:620a:31a3:b0:902:daaf:22cd with SMTP id af79cd13be357-91d876acd3bmr318132985a.0.1781693241992;
        Wed, 17 Jun 2026 03:47:21 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c06d0179a52sm8349166b.42.2026.06.17.03.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:47:21 -0700 (PDT)
Message-ID: <f5fd3f31-9e7f-4f49-93c5-b0a6dec9f4cb@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 12:47:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5210: Enable PCIe support
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com>
 <20260514-pci-ipq5210-v1-2-a09436200b35@oss.qualcomm.com>
 <dc7cb371-e94e-4f42-87d6-70f0f94d0d49@oss.qualcomm.com>
 <aiFhZsaZJoXzuMSk@hu-varada-blr.qualcomm.com>
 <d291cd03-ffd1-43a0-b4bd-bbad6a4fcec0@oss.qualcomm.com>
 <aifGReQQ12BdgCMb@hu-varada-blr.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aifGReQQ12BdgCMb@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwMSBTYWx0ZWRfX3YemBkxPYb5C
 /OSJ+yRg1d0iS/VYTjQG1SJu+Hun2jsOLQ7J0k9qGjtJsmaxvIhvE+m5LJgOClOU8O/h0ZZuhed
 683dxgAiZNIIFkATe7pipLJq4DAgWlJvJ5RcpeQ2TNQMhJe3Qkp+H3Dw3VWpTSGQbiHM12uHU/p
 ytQASvuEugYJEWvxM9XzVdD42/IczAQD7j2wF1bD0Cq3AOLmSH6Wa16TxD8oD8A+JmJ780thJ3e
 puf3PWyks2/umzAPCjXNPiIrZj5vmlP4H9Azfhibe7rtnLwWtYUfhmgwfmzB6ecgtx8EoIZh0b1
 fmLjiMuLnOJEhZw7f5LkzF1dmVDPDq4VLtTXuWo1UbSeg48Syeswez+wSLVV7CSbtwv/bQJoEbi
 VaL/4iUos80M9qF9DNbOgRwOX+47UpQ6wnqaeexRymDpqVZtc8Y+JMbCE46OmqFB+RqMHgK9TuI
 38T6mlzlb0RyGjN3KcA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwMSBTYWx0ZWRfX1J00DJt28wVn
 qrZD3jVFc0Krnp3tcCwHfYASXpGVHxEtX69LQmueh88OElR3MAC0YMlYMLgD9TJm0Vc3nx8oAld
 S4BFRlApOWvdxMZ6e3TSvzJ3/5uBZFU=
X-Proofpoint-ORIG-GUID: 4zQBcXmTNkvQr2_x3iYQKX_V7EWs8f5f
X-Proofpoint-GUID: 4zQBcXmTNkvQr2_x3iYQKX_V7EWs8f5f
X-Authority-Analysis: v=2.4 cv=ePojSnp1 c=1 sm=1 tr=0 ts=6a327b3b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=MZvN4AuqtkzAMa8ueUYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170101

On 6/9/26 9:52 AM, Varadarajan Narayanan wrote:
> On Mon, Jun 08, 2026 at 11:44:56AM +0200, Konrad Dybcio wrote:
>> On 6/4/26 1:28 PM, Varadarajan Narayanan wrote:
>>> On Fri, May 22, 2026 at 02:24:45PM +0200, Konrad Dybcio wrote:
>>>> On 5/14/26 6:13 AM, Varadarajan Narayanan wrote:
>>>>> Add DT entries to enable the PCIe controllers found in ipq5210.
>>>>>
>>>>> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
>>>>> ---
>>
>> [...]
>>
>>>>> +
>>>>> +			resets = <&gcc GCC_PCIE0_PHY_BCR>,
>>>>> +				 <&gcc GCC_PCIE0PHY_PHY_BCR>;
>>>>> +			reset-names = "phy", "common";
>>>>> +
>>>>> +			#clock-cells = <0>;
>>>>> +			clock-output-names = "gcc_pcie0_pipe_clk_src";
>>>>
>>>> Having a gcc_ prefix here smells fishy..
>>>
>>> Followed what was used in ipq9574, ipq5424 etc. Will remove gcc_ & _src.
>>
>> What is the name of the PHY's output in the clock plan? I would assume
>> it doesn't have gcc_, but it may end in _src..
> 
> In the clock plan it is called as gcc_pcie0_pipe_clk_src and
> gcc_pcie1_pipe_clk_src.

Let's follow prior art (glymur.dtsi) and call it pcie<N>_pipe_clk

Konrad
