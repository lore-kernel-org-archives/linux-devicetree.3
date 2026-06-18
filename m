Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255113E6DD2
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781776155; cv=none; b=kOkSqP3k7V+Co/cs2CheRMW6RKrdy3j/FENCOnfkiMPoIh4u5ZNcY1JkeF4ZJxrjMU7dmk2jRPz/w1AxwD2ZJlhfV9N/Fayo96s2HDpj+Sfh4DP0L1spDIjB/XYLiRT+XfH7+z0kBjnl2ekHoUMH8bke1uQkzS3FXK/YV2YbumQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781776155; c=relaxed/simple;
	bh=CqOnzpYUZ8jTECcLckHB51CXBNWr7PZ6ZzF5YP4P+74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hVUhUt59cJR1u3DwqH9tqVyos//DERh2iI3z+mnv+DZHXskB2+UAwuGOeL7zLoaCAxxdc6Qbc9bW+3xzbFQw8651SQWv1uZbHbg5II+JNzrK6CpuJLPVCJ1SW4EQuRrkfpJmMBVT5EdnUkoIrHYE9Y1M2QoYrqLoqKB4ywm8sIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aQFd8ZVs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZVWok5VW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aQFd8ZVs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVWok5VW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8Dwvw2247132
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rvIyhITEyAEOhZ65DNKPLUJIvhMXvypBUBYo4XJWBDA=; b=aQFd8ZVsz0D6yGsv
	fxnVX2h5MqNYRkCRULpH519JHRTA+ug1V9C9aqvcqyLTgsHYk+iwB8pGxuoTO8vT
	s+oBCLAm9IlieNsyIkXWaKq9MN2Xyw8i8T7r8+M/WNlA77+OUjYHsLIsl2qfDov3
	ZNVqisZIBwsleFaS+nmHO3VxCfPw+5hQQWSeWYe++na9O82l5NIWECs4YFKyuy3D
	oybKgDHA3OHzYdCEa+eJdLihuZhdQxKMc6OA/vJ3c++Sni14xxdUhNgapXSK6HJE
	8HW02CvstE1lrm9t/dBFYg4vDjLG5c/BnuOJh6I3keon+eENpa7ukpk/iSrYLa1O
	VlZJSw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euw9vmark-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:49:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9156dc90fdaso21778885a.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 02:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781776150; x=1782380950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rvIyhITEyAEOhZ65DNKPLUJIvhMXvypBUBYo4XJWBDA=;
        b=ZVWok5VWVtsi8Ljua1P0NHO5Hry6MGek+BlBKRUwo1zZtPVP5zIXEgLowHiEb1sN/U
         gNe1B0upoQf1WZ8dCMEO0+snUHlWPDhD4BvW8lzJrjlklrWTnTkAPEf5Kg8D/e1uxjUt
         Ri169WJhl8BvqrwemoTiQXcI9IZVHZZ3xHqUlblsKSKPaUtlGsVPfOE54I/nhmtJiiGG
         k+CXlo25QLTvK6BRY6q8H/gQyxnxPXetzUGU8UjbuYeY/lO00TRGKPzBBvwP975dILUQ
         d74NooesONLE/MRH7jwerfm4N+MRqCnmrJhZUwMoqMg1PujgStLBxIRIsswhTAkq65jO
         +OWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781776150; x=1782380950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvIyhITEyAEOhZ65DNKPLUJIvhMXvypBUBYo4XJWBDA=;
        b=NmGEPKgHgBTrvQK2mjGCsDleaoITVLlysTqKTceTTRacihAj/aV5VgdZCouwaNhvl+
         3OTTQrkFywR+iYlkFctedaYEzp/VPjjrD1GthUB743fksUYPgXJKsiSXJ5lKf/43pTHb
         poJ6U5aWysCZD/hVj4B3QNzRNkUfUhWnbTD5sTJsqHe5cZ5I71wm2R+hMedWurDtpxl4
         xMLAvjDwnBiuuGlvq0inhp9/NtiW34zm8tA/+hwpiCgOjd9tgGIK7A0Vt5UH7ZDmXxF/
         dBYYPkOKZMbFJsJSCehj2M7PfYtSOOlKKwQZbqYtEvrD7Cwj3BzLFvT2ix55JrB71ZLW
         IvDw==
X-Forwarded-Encrypted: i=1; AFNElJ+95mWKFc4rsk8MRsk47KZYKlcBU+Njm54FQnhxx/tpjIAbktV/wZGaghpCtMET009jJa4nQJGsXOPh@vger.kernel.org
X-Gm-Message-State: AOJu0YxpjSiAUzom9sWgLYKnAMz7Dp5SBMex5plYpioVEvlpBptNuckS
	K2kK5LHvFRzKaxos+7QEEA2LUoOMttOYOVM+sRH5NEgG+I/i09JWcVIdwn8LZPG0MCOtEPJ3hen
	PUVV1XaKNjnZZhJWgZzuqzxinb++IKrw/4Ec+HdVBF0TZRZog0dtNvU7zz9JEFSfG
X-Gm-Gg: Acq92OGzUtzF2B5z0C8YHETIbeCkIJSUmRTagFV/PNAb4qRJLWXCLm5nOL91y+P1VED
	f9pBk70tnikaP5x1wGJ92gyntCP3gkXcL2ejFh2DWUG6xH/mgFTvDdwVjnMuiaUE5oALDyyPK/V
	jz/yuzfH4SvxC4l2alTwp9z3l/xtzSdy8utLY85AJprtHBuPAABscXC1BmU6lmOjsyyCGp5yb3H
	CNO1wAR68YPGWRl2S+WkVUFo+/8QigKqIbMu2zsjs36MXsr6J8gFam3Nt4RIkOO19gQ/rNbLYxO
	6nYnggE4g+xLF03sofVE23HNrMGv7huMGmMhk0EgiRFr9xX4CJk+egsAhRaaRggPpl1Mqgk2F9Q
	vsXG4JVzSGIS2mvBzCT+4RObEI9Tb5RZLfgI=
X-Received: by 2002:a05:620a:17ab:b0:8d7:ed38:8189 with SMTP id af79cd13be357-91f24ff5a51mr281467685a.0.1781776150235;
        Thu, 18 Jun 2026 02:49:10 -0700 (PDT)
X-Received: by 2002:a05:620a:17ab:b0:8d7:ed38:8189 with SMTP id af79cd13be357-91f24ff5a51mr281464585a.0.1781776149836;
        Thu, 18 Jun 2026 02:49:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6de2dsm919473466b.37.2026.06.18.02.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 02:49:08 -0700 (PDT)
Message-ID: <580db7de-321d-4f4e-99f9-3c9a1cc5a3f9@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 11:49:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: lemans-evk: Describe the PCIe M.2
 Key E connector
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <20260608091702.3797437-1-wei.deng@oss.qualcomm.com>
 <20260608091702.3797437-3-wei.deng@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608091702.3797437-3-wei.deng@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dS1qsI0AcXnwpLKoVK7lNXzUMnl-kVZB
X-Proofpoint-GUID: dS1qsI0AcXnwpLKoVK7lNXzUMnl-kVZB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5MSBTYWx0ZWRfX8qA34y3hm9hF
 Mrc6qHB6INNSGcYEz6PgfdTPd/m7eI8OBWq257Xx733QjbL/iJCQwtD+FtYCm004J6w2bh5Grbr
 B9RE7ukJ4XyWcF1Wf31WsbrDhD9G1vGMlU2WMFqtLN+ie7gpnMK2nBtyHzz3vrQq6IB4Qj4D9QK
 EKa+jn1O+18PMwOsX2iLT5XtXAM+EmneVEcAZgzRWPuoqiGgM9RTtdt1SQE8S+/bMWuhuSyXVLF
 LDti5xJi7Es57HZLySUSliHlTQ/z673ppBXGALw0SyWhwPxLuIs6UyUk79vCteHrqw/SFrCcQPi
 l2ta/K8I4GNjt6cJ8xC+/Y2d1xjJOXiXaV0ZReLXSy93SxRpCAtDbRVyNJeGSuKlfWQC3gXVUai
 Zc+U/tM6q/Q3nBA6Q7lBfgJyjxBOWKaF8G4rZL1YgeLh7fBA2uh0e7DVgygSPAP9gWb80mcIXhB
 VmvnUdQYBMDxNnjnQzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5MSBTYWx0ZWRfX6Vy9elE5qBER
 +y5mIDT7TvrmL07hJ3UlQekMFN5OAIOHk2c4jJL9U1gBaADDH03bTC03mqnaZnBKdZo087bZc35
 boPWVC9dLDzt4x64AnJB4sHW3Dh21lI=
X-Authority-Analysis: v=2.4 cv=YJKvDxGx c=1 sm=1 tr=0 ts=6a33bf17 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=JePoLz6rm3lXWa06D34A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180091

On 6/8/26 11:17 AM, Wei Deng wrote:
> The lemans EVK has the PCIe M.2 Mechanical Key E connector to connect
> wireless connectivity cards over PCIe and UART interfaces. Hence,
> describe the connector node and link it with the PCIe 0 Root Port and
> UART17 nodes through graph port/endpoint.
> 
> Also add 'compatible = "pciclass,0604"' to the pcieport0 node in
> lemans.dtsi to allow the PCI subsystem to associate the DT node with
> the PCI-to-PCI bridge device.

Ideally this would be a separate change

Also, b4 can't grab this patch since there's something wrong with the
threading (multiple series in a single thread) - please switch to using
b4 for submissions yourself to avoid such mistakes.

https://b4.docs.kernel.org/en/latest/

Konrad
