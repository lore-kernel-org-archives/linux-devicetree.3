Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633221;
	b=UzkWNUG4P9kkK+MzzkxWx/o5TH0Ng7Z1mi9MaciNc4E4Gz2Lz8NMgg67yEZcKNQtwvxu
	 NFnRejzwKAOYjOw8Jxq/znjE7R/CY0kv72Q8koXr27+troPSbIDtSrjjy2LrA93r/9l8I
	 H393UyqHb04xtmes527KLeteu53mFqWJaqHzSln5R/N2O0SfY3F3ESTzQGGGltbHQtrRF
	 LJlxmeO/7xt4hAtimu7dR8wgxS/yP/X7EKQ+D7L2K1lQDUnrWm4ofBa6WDOIZyjMXE0OZ
	 vF+SHuL1hSRbD8A74192iyyvMRtY2+SxZQsAk5H+IPg+/QE1w8Gu8BPg60a255BKRGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633221;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QSiY87GCJ01jUUo00oIPwsT4O4cpRXayBoqLLS+mkgc=;
	b=jQ4k/+LxyS9bRMMcyWr7vh0EPpLRU/vBhvf1NRC5sNfFhb3YlgnICAllTiYqLu1m5YZ6
	 sGGoZRQ00ck9yeJj7+JalfidGsLHwEqYqoRiFjjsgv3eWvRVQdFbbkCKAiZZZoTZjDjwH
	 R8Z1b17pDmjRZmglqdSvexDCBbBYRYSoyoi62R1mOcjj6B+iA/QufEhQrXkwk8CgP0GvO
	 VTo0KHcXReixWe/61U6F+fbM8u8mZ8LcsAqQpDiwbgrQdW/UNIYbykNMaSNj4mi9h/qMM
	 UQ5oJ1VkQALH9OUAssBjULteRh4hYB2jkFz+CBQbtKhlsApEmJ5dMgLVgcPbiocMupA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dq0fWTxD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z6rZ7cjB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59256083EA5
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 15:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D59256083EA5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dq0fWTxD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z6rZ7cjB
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpIBT2991827
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 15:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QSiY87GCJ01jUUo00oIPwsT4O4cpRXayBoqLLS+mkgc=; b=dq0fWTxDt2mNCh32
	wPDhaCla5iyxWbTdVBCLLVaoKZeU8xSrTislPzaUh2u97sOypaNvlq0ds7H8lpwZ
	n5PzAqmF20Jmh7Cv76+BS7AKto5ttjOvzfCBdVGqGY5mWJSRzypUQhYxZNa08EeE
	iKalu0g/sLkFYoQWJSdE3VC44HDTb+HQN3gE+2AvC9x6FV8IlQMTgYQwHxXq6u1v
	vkW3tavWX3rnR+NN4ZoB5Lwfzktwm8L2pqDsyiaJajsyAp4D6YtSAzE21UVJKjHu
	idEdCVZ7ptFv6PVm2RsrDBvyzorCL0rI6QX1SbbeLRFBgRTNj+t5YoUg/MMZHzqZ
	7t06ow==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavh15k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 15:26:59 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cba2460f8fso114352137.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 07:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793633219; x=1794238019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QSiY87GCJ01jUUo00oIPwsT4O4cpRXayBoqLLS+mkgc=;
        b=Z6rZ7cjBgFzIa3sYI1pptZxzJCSFZXzmOmZcRFzlp7Qw8pEdPCXbIS/vniz3ev6XWo
         4yFtTFOkWBY/bfeL0s2zQ1NzvZazlrg2bJG2G0Drd7TW/oByhkSpXCpMI7ZnLZ4nLLHh
         o/zye5RZzawYFTZxYni8w0rtYiq9NjIo1yo2CdEzc0CEtgJ8/7kBENg2FZ6c4ZkWxs97
         Rcfz26jhgDxOPOWW7U8vZ+fcyBZkOYOPavGol/GFmpS1OVuBnXtXrRNTNim681m276EX
         E6DcubC4NonjfujZf4FGw5BPBFezdXwu33jo91TJKEasFkMK1aOCdIvTUoLWMxPn4mYW
         9fvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633219; x=1794238019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QSiY87GCJ01jUUo00oIPwsT4O4cpRXayBoqLLS+mkgc=;
        b=eDjaRMNWERC4AB2tkvJPvunpa20C7NtCMeBq1udutlNrJL9fZEaoo/40nVd055STvW
         ybslgCsut4Hx2Gd+FKXmc0WA1vfDYJC0tzRFFrwb2+Dq7jp6605MOihiBI6QpDcE0mM5
         IKz16kQLV1jE5rw7N1jvhn+A1/HXeL0jFP8MQOYWd0ptGYGs35oRFXJCw765TaXiV5co
         4eR9sZnMfL8YYu9iYx+DYXBG899XjpXUajly7EZFJhPCplxlu3XZEdNN8lKBLz7MaUHA
         dgAy2PPWKkErOgsrtjb4PzrWA6jeXfQU0w5yXFXY6mlz3Du95tXml4HE0dRmQqh1cc3q
         gZLA==
X-Forwarded-Encrypted: i=1; AKwUvBw18GRs78wFpQfj7ZHdHcUVDz5PRn3AFMEx1yuPNEQGSaNkeQyTqIU5CPPz89sTU3tFK9VLr3oDvtWO@vger.kernel.org
X-Gm-Message-State: APuU4Z/U7F8ofgA4UZeNeS3zTNcuUxGKzUCmz8djmQnhiW2/Fq+wGiwi
	DgUBgO5HEiEFn7VCfbKpU+7bCJo0PxpX1t/xx2Ck8qaaWNec8FBuTnCb+EgNTgWS63OuRMRY3gs
	HQ2sGxWr+G9p7cgJbWP+N5eo5pig55ALwhewKCQQAB80qQtjTV21y+vuIuZFjDd6T
X-Gm-Gg: AYBFou3xceNxOSps3fyL5cgvCdgrYDrzyG4KKIqnDSiewOYctW+/zu0XF9F7HTbiWd+
	8DfRGXxaR+lBNNprwmBawn00xduj1/HDp+s3lst0iGsMD/ULO2eRJ8WLHQypH2t1K+kv5LOkcHL
	X/K0hHm26vhZ3GgFUfvnNpg7UQmZi7TXEq0vt0s/jakf81EUKdagZEBS3etSPGkSBzz+46fRQLo
	O6vNrYBNFmNHQDEb7oDIlerb0np96gUAwke1hz/knJEWG32iswEI+5eOdmet+zc5Ecz1dMIumaA
	z0PENOmclC3tC+dZLCJPZtEvEiI7VjqQnZLXrbFlOy4efhtKMfICq0VH8QPNDDsOoddonT+7Ulp
	9KE/TDMH7bfjjGe3x8hIAdeE0yEt/ZTGgbXme/CxKs2/kLuGacGk/3ibtkELy9YKHDziXLA==
X-Received: by 2002:a05:6122:5318:b0:5ea:9c73:eddb with SMTP id 71dfb90a1353d-5ec6858c115mr5291950e0c.2.1793633219097;
        Mon, 02 Nov 2026 07:26:59 -0800 (PST)
X-Received: by 2002:a05:6122:5318:b0:5ea:9c73:eddb with SMTP id 71dfb90a1353d-5ec6858c115mr5291928e0c.2.1793633218512;
        Mon, 02 Nov 2026 07:26:58 -0800 (PST)
Received: from [192.168.226.93] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebefabf6sm1619366b.32.2026.11.02.07.26.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:26:57 -0800 (PST)
Message-ID: <ac07328f-63c0-42e6-b8d5-d3be4dc877f1@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:26:55 +0100
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
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: lemans: Add Vicharak Axon Pro
To: Ajit Singh <blfizzyy@gmail.com>, andersson@kernel.org
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261030074404.33517-1-blfizzyy@gmail.com>
 <20261030074404.33517-3-blfizzyy@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030074404.33517-3-blfizzyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MSBTYWx0ZWRfXy/VS8nOn8jaq
 pcuTMbAvInqnhiE9KdqeKJORZ97BC04yJ9B0NiVEZ8j6IDfqAvi6esfIY8gtV525oRIOxN1JLwe
 PwHY9Unl8cx++UXZ79Dx+O3k2dVlCFeUnC8URrlUhxH1OYKQk850Dq/p9+koDfcRZXwxoINfjIe
 hueBbnXfoTlRzw2bK6ymjoN3Wv6AtWULPJcSA5K/g896A8EC7diXvDdc+c+9+gom+qYH1hCnnUN
 OKyuOxFCujnrIYkoGXqChAMHyaDXxPAjjDmLeb9owFxU+bg0HXemPb7RGuf4iM3MhOlLgXoA9+J
 2CUN/PSr4m2NhXdcUPuwalE4066HLIB4RdrnmlxTsLluPNm2AEAQgtvRT1D4zGI5jS5sgAhDf/8
 fUKGg6U27HP94agJG6pPRMVXepAp6T97lKKZ9puzBnGjrW7qpJFlFcMlfeOz31kQb49kLIByGxe
 tyB8oG9mCIbdqvnrV8w==
X-Proofpoint-GUID: y6CChcLvjaaM7hyFV97YYgZ70Jgv4uws
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae8abc3 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ugbcvswmd5WlYt78kqIA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MSBTYWx0ZWRfX/DJVVpRgxGYC
 IfquX9CWtpkzLBpwHxauprq4rvg3SW3KskNOBeArm2LPlGBA0f8RG9HFs+EADz00g8uPrjNI6jD
 uqLD1LhK6pSNSkkD2EdH3o17l3u4v5w=
X-Proofpoint-ORIG-GUID: y6CChcLvjaaM7hyFV97YYgZ70Jgv4uws
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020061

On 10/30/26 8:44 AM, Ajit Singh wrote:
> Add initial device tree support for the Vicharak Axon Pro SBC based on
> the Qualcomm QCS9075 SoC.
> 
> Enable the debug UART, UFS, USB 2.0 host, PCIe1 (NVMe), GPIO LEDs, GPU
> and DSPs.
> 
> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
