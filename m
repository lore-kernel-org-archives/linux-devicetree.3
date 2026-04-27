Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F9C382284
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 11:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777287675; cv=none; b=TNkvYxFUSiS7temB55BkIxYSVnJzj4MRzIQ11qnkK8/GDp5smjXFBSdfVftV1N5sjoKRfzwNQO97PWufcNoYecex0BsmH07+rP9xA24RCsGR9Og6Dr+LYCG9WKQRYa6H/qCEcNPD2OuJ5ic5LjgLqe7lbiBavZy7p1N/S9qNXHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777287675; c=relaxed/simple;
	bh=BabRsBZEcA6X04PKKW4mSyEM/vDEC88pHSqElLuPR14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YzLcBGLDUTLsw85K8sIIOjyAapOqY4Cyrn+4RYK1CVf55DMqbNZsGJ2k055v3h3vtpwsDUron6FaX5Rwa3o0SmSgxRT4HCnTA8Jqktj719rDCREjObgxi+BZRr7QHtK9YRlKrcxY8sOq/cgPlA1rm2urQTJ64P1P2TjX+xfnHpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kMKZCFPr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=duSWpXSa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kMKZCFPr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="duSWpXSa"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TG5e3682645
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 11:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wbC+xY12QjdWnEgzBTXKckoouGSye0MOBz0vw/yCUBE=; b=kMKZCFPrEwZPxXJp
	IwADnGogx946/t5y+hFvx0Rl367AWOy1JvO9Oue4bVEejRnLxQb69ra42jh4Ra6p
	fMge8BAzj9Vceg6xgki4pBwQwFHIvstIMKdwoQeC41CLJD5S6sRMmJRXRSWa8Ouw
	NPQfvT18HDly7mv2h5PDmnULFT6jE6Zhxin8TsUEEAs1K97Z2KkIdAvsy+V1gG1Y
	YJukMS3H/HuvvGa1pYLRrFhtIR0M4+eZSR8hMF9MUvBE/yWgysohSImCUY7uzA0J
	AXb2/p7Zrs6yl61+eA0hhVEa5HYi+De0P9gv9O8Nx7PgSkoCYCKvZtk3Lfjt3vo1
	12bqdg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnmr5s76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 11:01:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7973e22399so3857327a12.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 04:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777287671; x=1777892471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wbC+xY12QjdWnEgzBTXKckoouGSye0MOBz0vw/yCUBE=;
        b=duSWpXSaSyBICzjyhDg8UOXm+6PRicdgceGMf/RwliwNdNnY6PtDn+UggkrQ9PcVm/
         mWDJBYbOKA0pkFX6kY98REo9bxRcjRTorTY9tDmBtXikVUXA1Z0kp/w4p2s8U8aVbBJ8
         kPCfa/QiYjYUm/REVIYInF98+9uACO2dby9xH5nraDEgjUbFEsIGXf+W8IdmXkVdm8Vv
         uBbZ2oG9nj5h6Y8qRMlhX/llcIFH5x16LTT9A0einuXrHT5/vYYIaB5HQ70CWSD0GzDF
         pVwk9wmQRSVrOcZ+HVudj/+zyRIXNWVy5teCvCeNSWi0mcmZoADiOEZoCJp83SJA5gQ1
         +OMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777287671; x=1777892471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbC+xY12QjdWnEgzBTXKckoouGSye0MOBz0vw/yCUBE=;
        b=NXjftf2QYoKLq0ADWyod7mly6C7WwXHpP3RyYed8/ZoJVjzATXfiTtbslfw0HZaZgs
         H7PKyjB2zp/xiF7ddVhKHBF4aHE6/UYO2MalaffSc7Eq8eAQpLDm8EGnhtfbirLrUDob
         CQhLlytNWrIgefW+VGoyZk1hv6fmedrqYEHgIzXr4GE7QfQuCMOjNqIgZyIwnEkoizjv
         X7DuKnjCP+yBqBcJFGG+69hsV0cvtqwcm1eibt6QwAzmI946TWNo8/5xBWTzq0th07N9
         TFdau+8c5oQchr1VEBo0bxZUVYK10yhbRHVejCKdIFQiFDuphlnPT9w6U5B5ax3IL8p5
         fZGA==
X-Forwarded-Encrypted: i=1; AFNElJ/o6/FEHn2yxCuIhB6tPopVCU9FjSg0zlWzWbrmGBcK3mxEHkbsv7OF8nilvoGPVz1BdKrhoQIJw0IA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/vOXWfedVi/1OwL6uZp9ts0I6csnTn+0mBF0fyUM+JcLcLk/L
	lDvKywp2pAwr18EZkPOfQamaYZVXip2odZHCR2Jf4t9jF7xW7bv71ZtDKP5ACWBMOOPCedG7CgA
	e9lVNlq9ySYe8vYT0UsoZZWEmMkRBeiUctgSe5lO5XPyjBxOENr5RahZclB8iR3fcbehqmoy0Hc
	Q=
X-Gm-Gg: AeBDiesi+8wH+FfzJ+TPNweZILX1bjSSNM5yBjsDpVeBjdRB4S1EPsHUtcg7Y2KC2Yd
	IpwfYSNfPXZy4WtOOiwhmGDlcW2slfvZmcG+F32G0lM4/kARMi7bqYsQHccfYFodMn/uPhu3E7M
	pKuJvz49b5jGSTKhrwzuzOlR26hnhATrdJU23focHLEh0xdpuV6wZYplQHrp9XGC+PEbPZUEpqZ
	JjDVzsjA9qw4E7qoGfzaLTcqLGdwg/RpL+/5n1h2p963GSoZJAEaY90Gs3Q3aScuvidRCQ2R43a
	pWGqD/xP1K+PAC/uFPtbrQe15nvEKhtZPrp0aDC3nFow46J0nXmU5J5AzKUp1Fc9Ix0oI8MHObT
	6db54d9uGqOFrqtsl8xAYs3jTRX/U3+qH9t6Dvw2GU9nspoyICZ3B+QbHZsqK
X-Received: by 2002:a05:6a00:4c86:b0:829:7d31:dd99 with SMTP id d2e1a72fcca58-82f8c90b7dcmr44778986b3a.38.1777287670809;
        Mon, 27 Apr 2026 04:01:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c86:b0:829:7d31:dd99 with SMTP id d2e1a72fcca58-82f8c90b7dcmr44778932b3a.38.1777287670285;
        Mon, 27 Apr 2026 04:01:10 -0700 (PDT)
Received: from [10.204.79.32] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ea02ef7sm29711481b3a.25.2026.04.27.04.01.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 04:01:09 -0700 (PDT)
Message-ID: <48ecf277-da46-4994-87c7-7eef66956cda@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 16:31:04 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: talos: Add memory-region for audio
 PD
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260424-talosaudio-v3-1-9e2ad5d78a2e@oss.qualcomm.com>
 <jjnciedre42mqllwoe4mkmi7a355itmbcmuhc3oyrpdjyitnkj@mntkm4zonfdq>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <jjnciedre42mqllwoe4mkmi7a355itmbcmuhc3oyrpdjyitnkj@mntkm4zonfdq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aqCCzyZV c=1 sm=1 tr=0 ts=69ef41f8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-H-FHYqvV_8G-EK7XNgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 6Qd7aZ1AQHOqAPzowXS_mkZoR9M1O_Mu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDExNyBTYWx0ZWRfX4ACPHuutODai
 h1OghePqm64gt46BYZZVX20s/4ruLtwfF63ADjSUuoKAgLYVBxhXiITNfE0Uym1NjL3bY4BOH2E
 taRTW0SF33Vn5MCa32YMvd0bS+/QZYkvVrZa1jJZPoW0t6FOJpNH2wMbtjAOT60PojfrkwxRGDa
 6/aRUm8fmBLfh/wGtNK/hDptltoKxaZU/s8yJ8PnOINmMiM3q+SZAbrKQ1wmbSHuQpkYV9GMKFb
 OzzURQB6gVSABG+oopd+GF/U0i3GbkF4UnPcqFqFTidzw2ePK81Qo0QsLkrjBRzt2LoK7jQFPbC
 lIHwOupY4TIXX1NcZf8is+prjWi00jIy2QXPhE9kezMgj4XFptoICgL7A37bPM8VaQ6nu2vNsAW
 epUaX8//zBZnzeOsd0ItDiSQYxduQLjqRm57gbYr1sVKLqx1SWzfyoqHsy36koV+ldlr1LGnBkX
 TIDkwDrfj7uuChtDqjA==
X-Proofpoint-ORIG-GUID: 6Qd7aZ1AQHOqAPzowXS_mkZoR9M1O_Mu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270117

On 25-04-2026 20:43, Dmitry Baryshkov wrote:
> On Fri, Apr 24, 2026 at 03:40:22PM +0530, Ekansh Gupta via B4 Relay wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> Reserve memory region for audio PD dynamic loading and remote heap
>> requirements. Add the required VMID list for memory ownership
>> transfers.
> 
> And what happens if there is no such region allocated / assigned?
If there is no region assigned and audio PD dynamic loading is requested
for any offload use-case, it would result in audio PD dynamic loading
failure which is the major purpose of audio fastrpc daemon.
> 
> Also, can we please get the remote heap set up for all the platforms
> where it makes sense? I see that it is only currently set for a very few
> devices (hamoa, kodiak, lemans, monaco and SM8750). Checking the
> downstream sources, I see the remoteheap being set starting from the
> era of MSM8996 / SDM660.
Noted. I'll bring this region for other platforms also.
> 
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 

