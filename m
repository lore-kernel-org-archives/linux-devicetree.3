Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48055351C1F
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 11:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778238004; cv=none; b=Ae23xcz2murIo7NFAzAVHKyzztmTHRox4IlpO2H7p+5qSdS9FU3hj52TzSK6yvkidrtLnwZsNborAOhVUrrwKCz68vcxWyODB01MPEutJ9KkyxRczYIWmAxkeuOxyxYiUCE/4TZiN5ef3UmVJOUqG0njRhZQ12HO3+ktK0e3kUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778238004; c=relaxed/simple;
	bh=L5jpUNwBaZZzyNBxeioiwQmFHy1H1ScehT/qCt+M3V8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KMoQbuGc5i/J9bQnR94JTxGs23Wg1r3+RWen59/NAK4X9WvGum+Wx4atSv1uupQdcTAwwl68/fusy5xPLFf4/hsyeQGniTDATGWxC+3Lr8Jb1k1zs9R4chWGmkE9NgViHRFbjsFKC94WQ8HFYq42Dl21ArO0GFZOcHhGLIQiUNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EVW9eVCX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YrvUCN8n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EVW9eVCX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YrvUCN8n"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6488FfkT2384216
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 11:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8bYBkyo6P7DuWHbTI2Wdk0OBp/BCK5aUC4Fu7EK5LHg=; b=EVW9eVCXTI2/qUbW
	To2YMMr4hIyat+sH/xNzOqGc0fAmclDhN/KzqpR4o6ooEQtDsXp2trM3jdfL9WCG
	/4jBXVrMG9zywGfp6s1Mmj9SeubGubNOoS8vOlsVtDRm/n30WqS1gAFAm4rDXXox
	yLCQaBee/XMhDO7cin5xVU4h1H7pCyVCkWP258xMZCFfqzbVq1wFstzvidP8eVOk
	py+KZKzqpLQl0wjjxbehtY5nT/ixY8neWe3Rmi9pSDV0EKFl7bxDAwzj79HBIgrG
	1d9r6CBw12rdM2r2fjDwhinSPHKFoIAryLO0Z4VjQYO5TXcr7poR8AhPS4D0sPBP
	xiLi1Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwukrg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 11:00:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8eb530174f0so45238085a.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 04:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778238000; x=1778842800; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8bYBkyo6P7DuWHbTI2Wdk0OBp/BCK5aUC4Fu7EK5LHg=;
        b=YrvUCN8n0ejznD91JFWrXW2R1p+dWStmQljzoL8WsSjFDa6DkjMhtkm5lVUOK55xmt
         0nqvjuLMZx68bn6v3C2KpOsx/AwylmeLKxAr0jj5KnROvtXdT+JrRSmsX6iC+whKOwHu
         DSTPhV5sFLiWF/dx4j8TJSBhe4lCVErf7qywFX8XkIbDnkvLGFhfWVOWh7kFUlOJH3O8
         /tyTh/RpXSzGfQglCua6bP9pCQornczLurdS0rsE8dcz1S+FdFdZ/wKsdDZm7KaviFWG
         y9p2o9S97unuAEIuHRCOmd2d3HZDqONL6wxN77DE12ZP2VetuSeRRY/taBnpu5umE8w0
         7ulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778238000; x=1778842800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bYBkyo6P7DuWHbTI2Wdk0OBp/BCK5aUC4Fu7EK5LHg=;
        b=PFe6uY1RidliLOt8xBn3SXG0t9LDWdok+VOyHu55RrOGoCNolkVwsY/aUpzKkRwQcH
         C3NZAUBSetskUouWYKdxhkqS8XEtl7oluZONMiuNDDvG6FjW8nrMOVOgwGhI7uBrhS2o
         Xh3u0Q1Wk+EPU2WXtQ8ABOSr1Mf6yy2192GxBSvKbev0Msl+9KSRdLh+xvWCF4HGmIYR
         0Rmyg87DIG+bHhhltc6k9ghbt087qCWkTGXbqU5y/O6BuRFbez/ZfZRO5LCsPFMk9xUO
         fZSU8V7ynNFCkdeU4PguIbz+HMrz4MMmoxx6kz36f2CkZvS9abCqXGLQV6p8HnI+flKU
         MekA==
X-Forwarded-Encrypted: i=1; AFNElJ+n/uo1hvQHrNbvjbcxIbEem8BW+QOr/7bqV+6OWaCiI9LZXBgGXmN0C7+53t6rrwTSEpvjgDAdQmak@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlcvj8nuTTjwIJKXgv27QJrVQJILPY0a3pcHMjsPAFEBl7r+fl
	1QTaSV6zqLjTSyjXLG7X9XhD2EuKCyqiWjo/+iIoik7yUcUmKvrOCwANe6oJ3YYkCmWYDrtbuhb
	ASlEskxMa9eaRhU7fBuX8GwxO1SWxyIpXY7QdCr6b8gzXuOCT0VY5fvbvk50DnAwRXQRdOuSW
X-Gm-Gg: AeBDievzqOJCIs5mUR4wU61GJCQ6EgIJHmk19DyodGO+H2/V3nSnp3NeoTmnJT2qTLl
	TFpjWhUbUFJOSQehJ8NiRIXCNpPqMbJ9HDFkX4r3zSC1yJOj1CgiYvau/Ra28YzUtg/hMceGW/e
	n0qqPZskgfblDAkUyBou6VWs9GGNBa0ADH9ZA0tqVfQW1XJD9kugJQB+zZ2ic6+ueFteQmhePRQ
	034xGHc1YcNo5YT8kY5PFlMq8udfjUhGTOUNKtA3BvvpNRgR2kGH5zRg6L0gLEAzc6OK0cPvwVA
	uHydB+x8FPnlP7Qc0PF7ccFUF8JSjXdfIYUGMG2iNp2ALcaCj9dsgH2yGHW91ImXZWrDWClncij
	7NePWDZEURw9xCLfSgEdDuSsU1Oatb7UZ2HWKFsGfOHtZyVrFd129+h0u3WEOFWN5U57PkfiePj
	TLnaQ=
X-Received: by 2002:a05:620a:4095:b0:8f0:7516:da94 with SMTP id af79cd13be357-9051b259487mr1128996585a.1.1778238000391;
        Fri, 08 May 2026 04:00:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4095:b0:8f0:7516:da94 with SMTP id af79cd13be357-9051b259487mr1128993885a.1.1778237999920;
        Fri, 08 May 2026 03:59:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b3b9ebsm517672a12.5.2026.05.08.03.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:59:58 -0700 (PDT)
Message-ID: <3973a67e-b7b1-4fe0-a907-0c806ddb35e6@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:59:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: qrb4210-rb2: enable venus device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
 <20260507-iris-sm6115-v1-4-0b082ad8eea8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-iris-sm6115-v1-4-0b082ad8eea8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bLCjmRqNxDXUnBOXlC3VxVGe71aKhJo4
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fdc231 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7yNcMj-pRB2AcvHbL8oA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExMyBTYWx0ZWRfX64t830HATECQ
 f68oCPFw3XTor1o38xrQt0SrcChFFIbQD5Q+iAJHXg4nXcY6iHuBIyEeC1PslmYFS4b1ARRcWVk
 7Iok0iNNS03AWc09Cy4ItaPnaSVoYzA5e7tFmT+uYK/O/qxvhSVe81im6JoglED3jAY7TV2mUin
 8qDgYXV9vcpPSAHpHteHM1xi/0RoLDdzpG7M1EfNWG0UK3UX80tdtp5q+z8IRRGOp1dki7yMQtd
 We1roG928eD+KDaNiWl/7U7CMysnywKArGQ5kAUc1sKe2kn9XESqcD7AUblFs2YPnTSTZZsfHet
 2A0z+YUXtpWGBqlcI1leiRpomR0Ie7GiuusC27Hu2vQ6KhK5FRo0GmCBfQc/Wm519X3AUgkoqHs
 D/xLbmxZl9RNaml+PdmZcYEK7jSN9BgPzx+SpQ3WAXGINn2OWxwfyp41C/HFNAMPW9me2OSk2Qf
 MAymPN3wH6XMqU+/X+g==
X-Proofpoint-GUID: bLCjmRqNxDXUnBOXlC3VxVGe71aKhJo4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080113

On 5/7/26 9:08 AM, Dmitry Baryshkov wrote:
> Enable the Venus en/decoding device on the Qualcomm RB2 board. The HFI
> Gen2 firmware for AR50Lt platforms doesn't work on RB2, so fix the
> firmware in the DT for now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

