Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333B74AA40F
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051251; cv=none; b=a7vDU7+yQzOA+YxmDzvncMhjI1ABviyeMMzuvffLYNzDuIl+qTxyUhhl5UdFx6/iIc66N2zuqalLudTg1cKDsNRltFYkifkAFEtTIIRe1cyieFV1sLlre8qL6HunS60eoP01hdtzE7QShp0Fbz4Cz7sobZEiPqBvTajqkd9tEJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051251; c=relaxed/simple;
	bh=jiuVxvfeOFKBW07dTGQjnqjOJvsrBDeq6N7/q0zwQbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RBtU7gQ9WS/qtpOYxpLQnuR/FJ04SyPpiZ1ipTLDT24V1RYNxiGKa2P8RggOiKWP9SNBmUe505yPYf6sBoK0MktxZAzVLdJ4Ysfyq1kiUMLfglc1LEVVjqunOId4T9INV4sloMcneY4YJCIWB/jzRwZrbNpdWQyShtb0fyfQO8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TZVGxHaf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JRuqnAsj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TZVGxHaf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JRuqnAsj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6RMkE1682633
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LxDwWB+d/4qs5ZdRVGstKgvciW+mNZiI7MJTnjESahA=; b=TZVGxHafBuAaCKlR
	fIEcVLo57zngkTkrtOjKIQgD8YlI6MjjtvMGagK903C1Os266Cyx4X7VgV0M9JqM
	czYsGiCV6REm5c7XIVGw/J7h7UKakh/1ysEBxho8zUqdpokFgNOqsePemujQFlcR
	loI2I6UcLiRXhLdHk2T1ITNRJO4WQxgCfJrCE9M4qC/bBsxEbKMUUKpjLjqPQMjF
	FpLWpFB2dg0odmzNiNmRrXCw065bFmN3QWR87gA9uS4WgusqpKkzbD0gL8KB0+/Q
	LlnyXGoQ0YKh/bipl3G1MzsYOXJh9ssOD1pMrYZ1lqJtoy/y3I6wXvK1VlxfnaKh
	jVp9Ew==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacb03d40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:00:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5356c6d98cbso14005221cf.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 01:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792051248; x=1792656048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LxDwWB+d/4qs5ZdRVGstKgvciW+mNZiI7MJTnjESahA=;
        b=JRuqnAsjIx4iJ71uVF5Xzpr7WxqUgHg5iZuNLSOO+wb4MC3FpS3CxJGmq7CPR+IWCj
         Aw1TNprb89C3LVIGcCysb/NfFxsxw0X6FUzPi5w8ZFgJO5zQio30qHu0VIdE+HGaD1gW
         yZZrJh3bpqt2Q3f1iIMSWf08y9qqw5U9q8BmIhf95JBgL8nVHzcngqA7epzB85V8OGWX
         wZcC+XvB2gJC8HD0kakNSptcabQOA8WvtPDa6osIJZ5XGhQivONM5w9uOmwvcNcD5BQW
         zFgXw2lO9mLcYl3ntOu+ZGFRj2nC2NFzJUct8BhaLgvG1LABm6ry6jFtv0C90mS9b+uW
         A+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051248; x=1792656048;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LxDwWB+d/4qs5ZdRVGstKgvciW+mNZiI7MJTnjESahA=;
        b=KUFtRx/A4AyvyWe0mxim6RaYvboMT1u3XcPf07XNLj+loSJyzFIwl0ukB8wIui95Ei
         F0Od1rby9omuFrl1h2eekRfglfhKfRKFtV2bRXLyWry4+OHTv2Vmcxi4Pn12IRSdQdFt
         SSt3IZZ580pyWdhENnGsWRbHDozdSf5lqnEBEo7fZjzKzRFSYZB/7so4tlS+kungEDLc
         O9ZSmj2J/PaOKatsmGFfcyBihE8jrdu4wm5de8xq4x9aNbBwnKPvGzZ1I+yo0FGfchEV
         R68QQ7P/YxREVK8nTy2DpGbuwlSAiv432Fb2kAvDTVN1RgO51l/VVP8sxSmq5Cz0Usv/
         2PeA==
X-Forwarded-Encrypted: i=1; AKwUvBzYPi6OZGE1uHEtE7pq6acm1HhODAWv5JqvalJwBwb0qFQ0v2EK5AFdyl2hwoKJ4xoQ0LN14pObNuF5@vger.kernel.org
X-Gm-Message-State: AFq9FYLtCp7cKUGluInrn02CoKZCTTmx/bU1j485pVPRlNxLr+otc5Tp
	bc4dlZqkkClubBItEtY1QArRH7nD3ccrauQ0VR/ydUdcGY5751nEfvChdQxGkdZp0lszwDyKwT3
	WgC1w5hnfQjqhoFmy+euoPjNcNFGqYxIDUQ3g6YHdrLrb89s3LpXS70V+CmWoTfWI
X-Gm-Gg: AYBFou3DAOrKD7IQBNEkSjOqQsQzMIcU48ie+C5hQ0WidVs9Olp72bmjU/oh1wyEH+l
	CR3qQ1jJucyh7E21EOZY7Ola5tQpKuUgGulqxUgsSKVp08zGXKGt10pIDDzSMiIkEXtm1A4ZKkX
	XIbALDPf+Hh75acI3VfPbpFJYl1khGN7j2JkY7E3oXFpl5SXQ9qnIUmKhMcw7tsvmoRliMznY1J
	N9R5GvQa7s/KpIg5ppZhwGXfR3z8d8r8iMbCuYOYubnMZZ1XgcWi3nSTGz7UinOCNCbVtNw9Hah
	YgFmG87Hp+wGrzgzOj0ml9aYqkhYl+SMvPOxmEh4K0s+Doad0f1QilyODE3dNGOerud3MkhCzb7
	BOb108KG0qv+zWMIbNHeAnA==
X-Received: by 2002:ac8:59c6:0:b0:51c:2324:666 with SMTP id d75a77b69052e-5359fa50f67mr350337891cf.3.1792051247938;
        Thu, 15 Oct 2026 01:00:47 -0700 (PDT)
X-Received: by 2002:ac8:59c6:0:b0:51c:2324:666 with SMTP id d75a77b69052e-5359fa50f67mr350336971cf.3.1792051247255;
        Thu, 15 Oct 2026 01:00:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda044aabsm91788766b.57.2026.10.15.01.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 01:00:46 -0700 (PDT)
Message-ID: <2f296811-cdf7-4f87-84f6-3561cabfafed@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:00:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] arm64: dts: qcom: kodiak: Make the ADSP remote
 heap no-map
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
 <20261015071511.977-2-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015071511.977-2-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VKpIDNPX c=1 sm=1 tr=0 ts=6ad08831 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yc9GWqZudGba39dWNLEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfX2TcY/TKNdDrM
 SbPkr0C/ix3lkSfxHBBJuVmWNH0HHF8BtvKaV/tA9fQwAKAOMLO6KDXjYknyYeHcQplwhs/g7EY
 hUpK6MMbWBPN/K+2/bDLzyvFS8B38Vw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfX/Zo+S/RBM/Fl
 cAw8SavZGaf4/i0jh6u2Gkw5HCW1WUfWyzyHtM7Zm5iUuVmML7Fel2gqm2mMopRkCrdUzZbuEZA
 /TSOrNmzl8E09USiOqK/FdLLIQ8kYz29HIJ/wywkM4UIjLNdnWK6wVGK3s7GcklmNhhu0VdNrXa
 eCda8Vduh9h2gi3TgpcHq+lW6dVorcHD5iJoFKUmTnH8nNTVdQZ7zT0Y3/JRHoBq+b13I6v2dR+
 gdgF5xqbfdOIoMlwCHMeiXd4E4hqFs0/4tYmmJKb3tSJxYQ5KYSp5d/dQLAH42LElZ8IzAcIydJ
 Qzd0a3kYiesqH9sUNJNtnBzf5bEkarvfqjtYXqTLPSnrm4mbX5GPplE1vB6Jp8A2Cf3Dxrypa13
 ndWGQ236KABzxe54SGoxemabuWITQFtfDcYyxewGwO99tgDRDUBZ/XptQEYhQaMzJpWsl+HsqH8
 Ln8P2Yf+d5HLP12+ynA==
X-Proofpoint-ORIG-GUID: vD0-rNJZS4JmtJAk9mELTlzKqE3Kmzd3
X-Proofpoint-GUID: vD0-rNJZS4JmtJAk9mELTlzKqE3Kmzd3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150031

On 10/15/26 9:15 AM, Jianping Li wrote:
> The ADSP remote heap is declared as a reusable CMA pool. FastRPC
> assigns the entire region to the DSP through qcom_scm_assign_mem()
> during probe without allocating the pages from CMA. Consequently,
> the pages remain available for movable HLOS allocations even after
> HLOS access to the region has been revoked.
> 
> On Kodiak, a synchronous external abort was reported during storage
> testing when the kernel accessed memory within the ADSP remote heap.
> The faulting address was outside the HLOS stage-2 mapping.
> 
> Replace reusable with no-map to prevent the region from being reused
> for normal kernel allocations and exclude it from the kernel's
> standard memory mapping.
> 
> Fixes: 9d7d847ff1c50 ("arm64: dts: qcom: kodiak: avoid EFI overlap for ADSP remote heap")
> Link: https://lore.kernel.org/all/20260423063502.484-1-jianping.li@oss.qualcomm.com/
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
