Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58509B67E
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 05:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774848713; cv=none; b=gT6ZMvQKuSevFTO5HlePUzfGnj5yS0iPR/GZINA7sYjPqhmaSpzj+rqEJyfDxbLSmwAyQ/yAUdZ5kp2XcBmha/b8w2XCBY6I1w2nUzwB5qQdrZK7TzvIjm0gIuBaASXnsbiCZIj58L1YrFHOFNatUDpBRr9I5Vhi+HP2ufPOBAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774848713; c=relaxed/simple;
	bh=YAvMqsLOEoWoguh5Ey0hOxWmgZ9/1mN/OsIr8xnCnq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=me8AJ52tCwNJRdarFNO9OzLCMYj9SX1oPhK7kAtdfJUjxCsOiEFLjC9+NoP8xxga6IEAgR8hyZqhPQYp4va6VV+K91sxSexgcFk32H6D15mICkOLzdhL7zak3D6usjyOyJvp3Zt6Bam1EANVgbZD3jXVXOYDCKmZR5SToeP6pvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OH8638Y5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YYJAxYUm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OH8638Y5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YYJAxYUm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U46Ove2952983
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 05:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	foOsuNB5DUtxFKfyTgqO4ub9us6BpqOMMltVaNK5Gds=; b=OH8638Y5Wqg5Q9gL
	4MT7nH5F+Ffk9jw1gpRpl6U4oppStdJp/Aail19nfsYwkXhinsljY7oYuc9Y+e/7
	f82YSPLW4dq9o7D/cNWwvYpF3mK1EjG+PLFj7Lvtq4AqD0JnfVLL4phSPHmsspxP
	boSEp5i2KuFCFeHNCdQVXZ5Cbhh8ghd0B/LaDj97CLsRtSbVVz5Crjhpp1URf7Gt
	1pXBVom/WHWQY59vdV8fyJnANWabcRuN/XhIe1U8mK52m6Bxrnmj6UPBQSZ/hMdg
	0GqHiJlM54PYMR0sLngjmO+Bumcs55CAoccltoZaqvC5Kl3igjOdrVCxMd4knCE4
	l+/xlQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqejdyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 05:31:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c7ec40f92so6421275b3a.0
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 22:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774848711; x=1775453511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foOsuNB5DUtxFKfyTgqO4ub9us6BpqOMMltVaNK5Gds=;
        b=YYJAxYUmV4mMfR6lMPdTQ9oPGc5TleauB/EERcpZdDBT0o0N/ijPegO/YGwg0bs55V
         zI3tWPJ08tiN1B3/wEoquF0ARLonwTN/79Sk5jSyOp1G3ZOaGdyCqzt7pS9NV+eaTzbD
         SbRCvNoAjeIGEz4CkrUtZmlzo0HcjaFXTc8VgL3TIWw9t1TdmtUG20sLcaePdXsFvlZk
         2eHRa4baM7SGsADKaZEavqnBkrsk7LxopwF5fruao4J42OOtWa8bNBQ2fTAnsVv7DVpl
         kBjNEQtlk3jR670ExnxgbX/DVu0C2VOUOv+XWMp7qirHxrMpDjWdVmRmWdafWKhP/61Y
         rq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774848711; x=1775453511;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=foOsuNB5DUtxFKfyTgqO4ub9us6BpqOMMltVaNK5Gds=;
        b=Wp5c+Q0VlP6SId3T5QKDHxD9rZL5A7P4gVdICMv9Q6AGo+QDInwoYx59paWBmIY/EO
         3BpEpDt6/7YJey1dCTvc+yL6CIflyZJk8ja80us3GMfY9LkQod8ahR2KGVc6usDEoGab
         Mw1oyh21cW8wxErv2iBrg5Y21QjkKt2jsc9MO6ogS3Btx9yNIFX1Jh4bgOggDvchm+4+
         JxiZhJ5pDQfuYFYNsPcHAFfVK2PhX47TiVKcgSa04WEUuU3oMIiMYz/H5IBQgtZWsl/O
         WIEq1mCRoLCSJ6vU3Cq621jEJs9eVLSBGwSN8pxFFFFvt5CnVWgM6sKQ6u2Znqf9bUz/
         ul4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkPof+TdT7vwXvlDuyu7Jedc0xaqIfbbfDA+rl/umSQtLNkP9u/ZlXDDqV/Kb0BJdXzhJMZjJZKUi/@vger.kernel.org
X-Gm-Message-State: AOJu0YwdLlckXJBtZp2gFBo4nYKoJ0jf+YaRPiGwKJLwsOgwoz6wcmZE
	H3+ORYj1DE41I7pR/wDUMSsDmkD6JF/D7Y4RazybO4ASHQztvNWdSk9DpJi548XqIRR9XTY0lCW
	jcvHmIZyUHKjVdkVvGmizPGzMadAwQFwRNkVuwFIVyZy4YBwCJMHkribGQEmxg6j43aFpSAPHKy
	s=
X-Gm-Gg: ATEYQzwoKjfrI5EzSKi99rBMkEXCs7IujVFyFeaQQBk/Z6Cfha4FhJyO1G5y99NsgUP
	v/JZiGa1VYIKpUSglMPU0xvyqRX2NjbOk8wYYDG8By6qj/quNTH8kxfswlYKA+Gb1rSbdZaSn46
	HIGGdu83I/en+AlPgu5hCmIif9pS6i4ZyxfKLktlq3k6Avmnz0hgRHju0crkM68LK4k+t7DyX8N
	WT/lvh9rV8OiGqPnPyhMWAn+IywNZ77Px+3XDEv3MbWavFiUGxhHtkYNgUmctXyWFmCdPYM4Uzh
	kLJF5nqDRTkoOHpR74AN2Ld0t9Ox09YVR6xKr/42kbRlR2M2yVrfSGx2vcoGreBobwN2uz+w+B/
	NAs9lf8ymgw9gB3JuKnzQtNCAtffqlvI7fTTnzEn9sJgE
X-Received: by 2002:a05:6a00:2d9c:b0:823:1252:9428 with SMTP id d2e1a72fcca58-82c95c199bfmr11169611b3a.9.1774848710865;
        Sun, 29 Mar 2026 22:31:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d9c:b0:823:1252:9428 with SMTP id d2e1a72fcca58-82c95c199bfmr11169584b3a.9.1774848710384;
        Sun, 29 Mar 2026 22:31:50 -0700 (PDT)
Received: from [10.216.1.96] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca86286dbsm6043459b3a.56.2026.03.29.22.31.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 22:31:49 -0700 (PDT)
Message-ID: <92bbc947-4212-4608-aeda-927cbc476e69@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 13:31:42 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: hamoa-iot-som: Add firmware-name to
 QUPv3 nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260327085318.2771771-1-xueyao.an@oss.qualcomm.com>
 <p5soauqkqe46zt3ejtpxckvqrfymudvl7kpbjrh6mlmvkrbahm@she7lps7mlfi>
From: Xueyao An <xueyao.an@oss.qualcomm.com>
In-Reply-To: <p5soauqkqe46zt3ejtpxckvqrfymudvl7kpbjrh6mlmvkrbahm@she7lps7mlfi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69ca0ac7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KbYPcWELwFK7O2jxHYoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: _cTyL_FFaVm6Do-gFtUTTiVTZfbXfg5s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA0MCBTYWx0ZWRfXzkeSTL3FF+BD
 NXLjhvWXb6yC9LbuOTxrYmUASOQFHa3rZIZ1PKU/okq5FlDBjQeIo0uX6QP8/z9Qw2gFDs3FcMN
 hBFlDfX5tE1jcJzivRwrTyfKoefCsyvcfFnkFRfktupWs9RI9bSYhtP4SYQe6U7H2/Qpy0QrdYw
 fJ+9h414wBS16uMtIP6y/a6YwwNaAZbt9wsg6HAnmtLsphoNJ5qYcGhssXXmX+dzhSFtOr48lga
 et3OUdLF2XM3hJEAx8SNFquFyMikd1BYkkE2ndKFvHLQ3xYrMXEmLbQpNbbqZ4vlOsZsXOTkaHk
 i3mwWJnrUnWar2pUD2yUrz0k2xHdB7alB0+j+3yCHD/SL5E54CAeh5Ay2qHkxvc2BbTbMA6Uo0e
 Q0HGgpm57IZP5AI+uliWXvEmxieQ378LjmbCKefn9odGR7IV+uN5mtkBM4ao4rYJollHCBO5caB
 TtyZ1YEbScxFdlNI3ng==
X-Proofpoint-ORIG-GUID: _cTyL_FFaVm6Do-gFtUTTiVTZfbXfg5s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300040

I sincerely apologize for the confusion and any inconvenience caused.
This patch has already been upstreamed, so please kindly ignore it.
Thank you very much for your understanding, and sorry again for the 
oversight.

在 2026/3/27 23:21, Abel Vesa 写道:
> On 26-03-27 16:53:17, Xueyao An wrote:
>> Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
>> of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
>> ensures secure SE assignment and access control, it limits flexibility for
>> developers who need to enable various protocols on different SEs.
>>
>> Add the firmware-name property to QUPv3 nodes in the device tree to enable
>> firmware loading from the Linux environment. Handle SE assignments and
>> access control permissions directly within Linux, removing the dependency
>> on TrustZone.
>>
>> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
> Hopefully, there is a DT binding schema update that goes with this...
>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
