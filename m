Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105349;
	b=D5rvo524cBysAcWdAFQC0tyQigyOPW0AStVC9JkLxyqjr7dnxlq0Bz1nA0vzA1QJLQnw
	 tR38l1vGfN5yfIV+Xitnb1+rM5NRSlPOqR42qQYTi9Jt0iO+lnpgAsPk4c/Ltp1iTQTsh
	 7b0XQFW4+VPG/vR6swfJn1Jsl51LZ2A5Vfwz1R+0aDySG0XSmjryCKadnbaIe1P5kahY7
	 UnkIYvX/H4CuS9DCxN9jM+ynL7QiUGLO3mA4mDyp/IGkmUYN+FInhJH6uNwT3jnI+Q26d
	 5bNYsKXzSqN6EreVukYGREhl+mM1NxQtIhJ02Rbo8xhx6BYzANFgjekTg4EdQh6FFMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zzbrDyWSnOGElL5DcmC6jxVWyGgYuRbYeFCqB4uIPsI=;
	b=aZ48aJRXRFI2xksPPplruGf/2GSMLuPXie9q3MCm7K0QUpM1jkfzKErJCwiIx4Sg9awq
	 nYiE/diMevIXDj9V3/6FU9T43LT9yg/ZjqKk5b8QjI4wENXGYFe2CUe95dHZ2xD5bX9Wu
	 9LPjM6PkN6ImNji7PClWPaPLSi3iNJ9lJBe+kquiqsYJWiQTvImjK1K33AI0mjrKWLx59
	 V1fpK5BcFNOSZjpe+cH7oTV9bjjhHgfDTH93okKCTLPPiOm7b5IEMAKjByFpVhf7VrpVM
	 l3tSbJ+N6lrbN4bB2cQp2gjx8MPgYxDceNjDAZLHVqQQJrb9Lalt8UZQ1ce3H2Z+TVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jKqd7z7l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TBh3cAHd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8633B606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8633B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jKqd7z7l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TBh3cAHd
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeDkY433009
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zzbrDyWSnOGElL5DcmC6jxVWyGgYuRbYeFCqB4uIPsI=; b=jKqd7z7lNAPprlQX
	mu3s0vG8zOh5qYNYfgKH7+bQsRS/2HpxFPN/qGEcUFn0lKf5piWURBxu9AQNous0
	LZ4xHzXgnx0aMoVIbfcSoPBttNHNugjSJUAzHu4Qgq/w/mB8pjmOaCufba3EPD9m
	PlfiNZ8FaZ4FRUgyLcwsFiGAk1oRePuSGeCd9VhAQpC+0EIxX1fH8nMf0kTRrv1F
	hFqIn4tCnstj0ZrZIOBvBMrcfHpCuXtuHNtrllADsJV3T6Kevqi6L8Yq8GjhAmJr
	9CxcJqFmprPEoop4f42iWG7KYsueL/QhYaNx8OLE+YywsnwaQ4DBidh5lfAF1yuq
	0jXC1Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54kuce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:48:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e93e2f72bfso66721855ad.3
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793105338; x=1793710138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zzbrDyWSnOGElL5DcmC6jxVWyGgYuRbYeFCqB4uIPsI=;
        b=TBh3cAHdnTagZSh+/3AkLCCEERcBTHPQR6YFjeSDPTw5IyVowHySazw+hEElQHOpyD
         MEYuznrbSd17QVkOGq+xz9dZ0Omhqz4wlLP6lOm55U0ZQffFF0WpEZc3Io44E1HVRsEi
         yVDH3JLV0SYD5Mile9ogDFV+fkYxt891IhbI2aOorlvLAZXMx3UL8GbGsGU0/pOL2t4G
         7mmwF/MbtOIgkJrTGhtIM0sTNf7xJnAl4+gRdeFVQJbphVlR6GXAGsVXEdyNBvNdFujT
         QW3Qr88qbq17DGg6kDeap5Zpn+EBz6YC9gwcXWV3Yy23pUh0EFi8XF1g77lpQZoNoolD
         12cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105338; x=1793710138;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zzbrDyWSnOGElL5DcmC6jxVWyGgYuRbYeFCqB4uIPsI=;
        b=cmtHD+XSM5Yc74eQpWJo++KeSKA4n6L384Wv2xLjzP3zNWotNPoYfg/Cb2mkAOJNmI
         Snu1kcTGQmR7/zKahXW3h88OpTXdb92x40E/ayMnq/69lr0JxO4IPNstUT07jsSNyYFJ
         ZzUjjKmnKuqYiZWv2xSwuT7rfJLS3jU9TZ0qIqx4exHSnBOcogBFYVP7/bFa174Q19Ts
         NoUgQ13TvK0TpCavSqef3kpdNXmF3WiIm7ETbJwWdEnQq9RQwkR6ArLc04mh5Sjzsb3s
         WYHMJIxSHtoKKAF/cf261rX3ur3cAH9OnqYIrC9E/41Oc/7dqq7pLbXrpx3EbmQg0YFZ
         Yrlw==
X-Forwarded-Encrypted: i=1; AKwUvByCVByaXRROGCMIS3v+NpTUAYO/Nob4N3OBqYUZB4HPAK25/AfB1yxyCmn5Tyqp+Q+QuM8o2wwHXQaR@vger.kernel.org
X-Gm-Message-State: AFq9FYIFjK9cHN1GXLKRkhvekLhR4lqpTWlD+VhRi06QRqeuoS7b3DnE
	rKgnIXv68X1dm8rU0i6x4udaKMlPJod5xL6OKJbiIMMVMV7x/bAHIU8nEc5KGLAYoHGXR26shh4
	QcGxSYxxuof/l4LAU1wcQUvm26L/2plW2CSHpeGrNXD8t5rES61O5iEGfSf7inmAk
X-Gm-Gg: AYBFou0P96ykg0v1Wu9eznjuOZV1gOz7K9pFVSEBXjC36CZPSZVD127pV2SmMbwMJNU
	30W9k/Th+92jAznW7ggYYj5rbCfSPm/d+CwGt1ljLGTuHxJmZ/bt/HE1oXXSJ2UQD1FQFnnIjxb
	4hu3FzzeeYoWo7CIdZuGy7IbyDTSg5wLavXrWcO1zr2tAozG4TdaGdHOoi/wdLH4X6+8rzPIjyU
	6lX15Cn6EG+4CQcWBpIFptCYS1WEioymNHdhryD7O0rEenyw98C0eSikMMefJQgXrM8GZcph32Q
	sdPIJsCb3R90UgtYKOtOK2AGMTf8roilAeYiS06tai9+2R473a6rT5gFOGls0CIp9q4f+8DjvIi
	qbjGU67LbZ6xlICVYtrmIhc4zL+o1G+rX
X-Received: by 2002:a17:902:ffcf:b0:2dd:ad73:c93a with SMTP id d9443c01a7336-2ea9c68a7f2mr78521555ad.27.1793105338059;
        Tue, 27 Oct 2026 05:48:58 -0700 (PDT)
X-Received: by 2002:a17:902:ffcf:b0:2dd:ad73:c93a with SMTP id d9443c01a7336-2ea9c68a7f2mr78521345ad.27.1793105337603;
        Tue, 27 Oct 2026 05:48:57 -0700 (PDT)
Received: from [10.218.10.175] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6455a00sm9086305ad.2.2026.10.27.05.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:48:57 -0700 (PDT)
Message-ID: <b1097812-c7e8-4c02-9fbe-f95890425917@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:18:50 +0530
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
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Add SPI3 QUP core
 bandwidth OPP
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261025-qcs6490-spi3-opp-table-v1-1-d0e0be6ed1b7@oss.qualcomm.com>
 <2e928aaf-0659-4bc2-b6f7-e2a0a5e8d3f1@oss.qualcomm.com>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <2e928aaf-0659-4bc2-b6f7-e2a0a5e8d3f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX4eXbE/6qcapf
 Ki15ewBaBedULAyEOysn0ZHBYoU0UT2Z8ST1aalSffKM/D3XuSU7QNwBhE6k8Q1VWImY3Tkw9xq
 rVhQfKtuBCO5ajsfkhWFISJunGcrz/s=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae09dba cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=XweFwc6cyJz2eRbsTccA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 3x5h3ukkiD0l7898-OXBYuQsXOk0uY9N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfXx1m7rB1MToja
 /D5R2H2ru7IJVyyF6vkSEw6AEcXs84IJU/1F3MrQKgxXoErY7b6amDYAaeWhg1vD+D4BjWdFKWv
 FqosGVgCiSH0Z8t+AM4PSs3rrYoluvrA0v4esTdmpsJMXUjdMFSNC880I6eophQG1gazXiRb/xn
 0pVx8Ldb/GkeS5lrSxHL9CboFwp1jGtXPf5mEz1YhtnCO9OFDaL06ILYJm6Dvh8dnJHmd+l9rpw
 nFHCOhZKUkstURBgyoBL6sux75A4j+4NsLuTAwaKnrmTVcPsAkmamq378Ph30NbC+nXG/30fcmQ
 7+QhIX8O1lIAxa9kMgIcss1iOnTHN5TluCPp5i4fVJ/XlKvKuVwMz/lYEpGok17n9jIGP03OI1N
 CgCvHC5YhQPPHhVZCfqUO/N/KkCPmZs9SJKcBQHRzrXUnHGFFPOTD1pYhw2/eDzfqpjQ8d7JRW5
 vsZMKuEySoVufNCfqSQ==
X-Proofpoint-GUID: 3x5h3ukkiD0l7898-OXBYuQsXOk0uY9N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270050



On 10/26/2026 6:19 PM, Konrad Dybcio wrote:
> On 10/25/26 2:43 PM, Viken Dadhaniya wrote:
>> Short SPI transfers are sensitive to the bandwidth available on the QUP
>> core interconnect path. An insufficient vote delays Serial Engine
>> register and FIFO accesses, increasing command-dispatch latency.
>>
>> Add a dedicated SPI3 OPP table with the valid 75 MHz and 100 MHz
>> source-clock and RPMh power-domain OPPs. Add a 100000 kBps average and
>> peak vote for the QUP core interconnect path. This improves MCP2518FD CAN
>> payload throughput by approximately 38%.
>>
>> Limit the vote to SPI3 on RB3Gen2, where it serves the MCP2518FD CAN
>> controller and its frequent short SPI transfers. Other QUP/SPI instances
>> do not require this vote, so avoid raising their interconnect bandwidth
>> unnecessarily.
> 
> You can solve the general problem OR you can do what this and
> create more work down the line. What if I connect a MCP2518FD
> on SPI4? SPI5? SPI6?
> 
> Konrad

I understand the concern about supporting this on other SPI instances.
Moving the MCP2518FD would require a board wiring change and corresponding
DT updates, which could include its bandwidth requirement. On RB3Gen2,
it is connected to SPI3, so this patch scopes the vote to that instance.
Other tested SPI clients do not have KPI issues, which is why I kept
this change specific to the current board configuration.
