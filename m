Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493591;
	b=tvw49HGxIz1lfhhQ8B9rBD5scQltcpaJoWQQhLu8q2/DWBtBy8uM8fQjzqKvb3qkKEDf
	 1kgaQkASSNbZ8hwn5PHpJU+T+xSWn//LoF/4qjIdaoVYs3Log73kAnK9ctm1mgLPyhO8T
	 eGJEswc1K1l/fD/yRaMGKpUDTtGUic8PIhfW0q6t3/9NxPx4dnGNEN/PXwBvgSOlhSTsy
	 GXifedJnsFzP/NPkavLhcKB+Mv9Ae+ST8VvbFqD8BFAqQrjcCvzAR20ETxrOuJP7+p8jw
	 hQGid7wX8r21ATfNkExM2/p1o669GMVH5pVPU2WetmeXFXfLdkZQUhJlBbs0uc1UW/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493591;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WMV8ofDDxBNdTwSP1aYc+u/HWDgqRDgvwAh8onkk2KY=;
	b=UjJm0D9cM/fFywmJRY3zM2j6uEXkOL1bfcm4q7v2930b0AEIK6XgA/+DRphdDpc8Up0r
	 oxLDvmNSAIcVk0TNf82Kzg6mypD08uYFBqxvgpPd/h6OilAE3BoFnNQ7L6Ep0/LVqk4o1
	 XeEvxN+4mLKeoHcZVyJyowt9097DAEN4Fh6dqezhv6F/nyt621b7zJQFlr/cUSWT9OMI/
	 /hWKB03qTlVI++A+uuTf3t5Z5pFMIquEXhOYk7HRETpLTWsODB375oUcJisbI9wE3AeSv
	 V0lRSJe81/ZB3IPY82nuzz2Mrk9ulDwnx94qTcBgmWJfvcnM0GJKq/5VZ3vydLW1amQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a09MkyTY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PwApjBuH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B21B606A31E
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B21B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a09MkyTY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PwApjBuH
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8auR62877939
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WMV8ofDDxBNdTwSP1aYc+u/HWDgqRDgvwAh8onkk2KY=; b=a09MkyTYoekj80La
	KfCkZdaIGY+uH9MenW+CzrmFFSde2y4GGW4aeHQUJo+RwLoaVDRS83MAuv1XMLR3
	MPcxLLJT5vp/qcrWPLSiWImyOe9lCbtEuDnRarXUZLsj0aVgur8e1M+neH3tk96/
	kMj5Z+jl5rB4C2pLqEJ2rjVyKFm086ZyBysnlYRWnZFQoL6w9tAF9Mv2UP5/xX7G
	AjJne7QZJdDkxwRPEO2GTmwjUkPCCkpFXzBuqaQ7LCdAqehqv6NJrzCnLCOC9KmN
	w4UNa+htDoxj617ourxVqPKG7ssNhD4KuyPecGA7/naSI1m2jIZJpDzbUgcuWGVw
	I8YwWw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pt4vd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:53:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2bdebfc5so101496085a.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 03:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792493589; x=1793098389; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WMV8ofDDxBNdTwSP1aYc+u/HWDgqRDgvwAh8onkk2KY=;
        b=PwApjBuHbaNbfFudvRQK1a0ttxkBWV/gnIigTlCLcTOIxbj8hZQIAofI7/PTwHuQTp
         i9cPChv/PQP1kQRlxg0XrzYFKkiSWrktI6FU+az4dTNvB3gHjTUxwI7UxJTWxFQv7crp
         taccO6jxr4T1EbCiyL8zRwaOyfTiGFIVcsHT+lNuHmEe91XoUWPYbcjcxbVjFIkgM63S
         gd5juuWGPxVaYvVkyzb9N8ADYLk6ek6Qzq269k7ya5AA8+wyldPIAiTFSuzOIwpy4Wqa
         X4S3xZneZ2payTw0sdgKsNS5Wj08TXQo+yUirRmXTWoarYz37hxK7W2gSXUtC3Tu20sk
         yZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493589; x=1793098389;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WMV8ofDDxBNdTwSP1aYc+u/HWDgqRDgvwAh8onkk2KY=;
        b=FYH70+MRC0glVlWm5axZfMQ1jVfvAi6yGEU2wWDHVBnW1SdPUXWHsGl1qZEwsUZi5Q
         mNI7I1M2t4F20OocHWUeEMg6I8fXgUUGWZs+Kogui9ad2ofvrW+OZK4N+j4AqE9RJ5C5
         Y2UTKpdFkBR0C5RFJJSZ7IB9YekKadvAlaRY/ZMOM1erM8hZyZ9gnorOJkSLVDaZsgPl
         cFEhbhmqipVS3h0LM8raKVWwaa1FMXYJVAbWg6u1CB1LrLZ3Yr4ZNEvtg5J/zbrMAxEw
         awOrkz3ZzDeqfS+nQrRh8Kg3tnMGIKC9yBJk4s8lUKP2i3S9lZBaSft/Gs5taZiGLotM
         cyyQ==
X-Forwarded-Encrypted: i=1; AKwUvBww8CCbofPzFi3FkC/cAQcmMkLWnvwDZD/vo7k8OHsSLanEY2GVWxvI6rphxI76ev9C0aqMzqmavGfr@vger.kernel.org
X-Gm-Message-State: AFq9FYKyL/qs6w4M3z0hGL51m2fkvdqJdS4Ta4m9svFWuuAzToUpYZnP
	9sWG5aPm90nAqMJzUlcasZ3yS7iwYv9982uYDkSSFaDmG/ryeayFrKm02cNf+QjIAIcV0/yVxVc
	+EouSS5gxsFZCI6cNp93TtK2pJuewOVkLCrEt5d7vbHrR84rXlIhXvXOUYavfGHa0
X-Gm-Gg: AYBFou1zcJtuOOccj59vJr2X5hyRhDv/bAqyI2IJqQ3qEBSMtVw0EGH26RVPZkadQs/
	S9LBQfWpN26sPXd56YVGjV+uHwM9Vo7lkP0ouZDXCVz1OJ2OLydlDg9XQwa/Yz9oBPqt5GlxFcu
	lYWw7xHWGGZR8T+z9VznswShEbWMxLq7lKs4Yws4GEEinMEBdTiI9xwAoDoXf6FWvc8aFlSNsz6
	vtOBwvD95cQV+Ve4I3sIQ7y08n4KklTRcdXN59EfjzvRLHW1qcADaxUwRx2UlYVhPMtnTbQPnDK
	7OkL/ECY2rdIH1JoKm5lIIQJb+vzUNSIJmUs3q0lHsteTbaC1loFHiOEbGWG9zsuFECNET4HIg0
	DnCzHMb98lqalLTcOw9fJ5Q==
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1946131385a.4.1792493588664;
        Tue, 20 Oct 2026 03:53:08 -0700 (PDT)
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1946128385a.4.1792493588199;
        Tue, 20 Oct 2026 03:53:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1335d3sm5239663a12.3.2026.10.20.03.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:53:06 -0700 (PDT)
Message-ID: <69210508-5b08-4199-8d98-67685c8e90d5@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 12:53:03 +0200
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
Subject: Re: [PATCH v6 5/6] phy: qcom: snps-femto-v2: Move PHY init registers
 to config tables
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
 <20261009-phy-v6-5-50408e45bcc1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-phy-v6-5-50408e45bcc1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DrrDa2/+ c=1 sm=1 tr=0 ts=6ad74815 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=lPcTt8mPJekVWdHiCMEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MyBTYWx0ZWRfX88qT5JvrQ0lw
 rdfORUk7c11aFevLg2jsnmWI0cR4aQTo4y7CCneOdxHEoSwfSWLexvfbObws5swu3nGl+psp/+Y
 pnZ3hJ6jsvDLKMEfCwDhxkgOaY7MCbwOCqr1UxISqXNFPsl/OsM8JwB9nzMLfX/HgCeuIGUJgRY
 ynpmMUUl5MRFWHtKmQyQJoyncO5WbJoVhWmg8CI7wmVLQ9ClW64s4EJ484j+OBck3AF7W1g0pGR
 GvY+kHensuWeJxw+eVETFXWZ4Cei9BmqtO0Gv1BvF8Oq+J/KNzVI84LO0w5zVZCgXJACzuYTDpi
 jaJdVCUHFsnI7jTAFkl9W2ya6yfnE0PyO4FSy42DL8a02bCV7dLeYTVPhLHBIXyOjn8d3znazDe
 VfYlxckjsWIiNeX0zijhN/RIiYj41vikZPUQbL36QgMoU2+chJUKg+e7quQnjySyqmg86CZOGJz
 nAWkPKTsf9YoHki/V7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MyBTYWx0ZWRfX/IiedAPuV8AV
 JzlpvtuJ89BsL9KymSuG6Mhj3ku9VwNT5IY3LPREFcVPVVXs5x2O6eP9fS8bKEvJZNp2aajOJf5
 DKtoZmGLQn7Y3FbUqaNdM3LxWkYd4bU=
X-Proofpoint-GUID: BwkU3loCv3GaSTXJoEn74uqb5CMIwqIr
X-Proofpoint-ORIG-GUID: BwkU3loCv3GaSTXJoEn74uqb5CMIwqIr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200043

On 10/9/26 6:49 AM, Varadarajan Narayanan wrote:
> The driver currently programs the common PHY register sequence directly in
> qcom_snps_hsphy_init(), with the fixed register writes split around the
> override parameter handling. This makes it hard to support SoCs that need a
> different sequence or different values.
> 
> Move the fixed pre- and post-override register programming into per-
> compatible configuration tables, and keep the 7 nm override parameters in
> the same match-data structure. This allows the driver to share the common
> sequence while adding SoC-specific sequences for future platforms such as
> IPQ9650.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
