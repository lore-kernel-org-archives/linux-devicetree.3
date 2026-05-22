Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663C936A372
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451876; cv=none; b=rONTQ3NbculJ7b60nFvBqP+nlMcfbxhJy+Kqr7F8nGoxuW+ZZMzVGIjINABE6v8Not3GM1VBrmZlljQzHGi5l1YfrxLQAtzzix2ZobH+i3efuPhAQFzGZAMbDz1kO1MObRQ5VQzJwzzMw1j0OveB+W0Am6ZVYEQsUIZj+2CslAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451876; c=relaxed/simple;
	bh=dgICMZZouacgWo/0FnvpbjBB2Oow4yk6QUlpKIKFJKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RFYwByUVCY5V2AKm6R5TN8jMUN7ya84bR99/vyI1mwebVwUsl4+CHQzoMoD6EfbVLpsV+3dzH6PZ19B/SckoiIUusJlCDLWy43m3i3xPo3jvt69UokCTL/KqGPv3sbM/Cd3KG2VMzBddQpMMSqIz93BIjydNxwXRmeS4v7DBCZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BIfACR0W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZJ/hUbqN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BIfACR0W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZJ/hUbqN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8i0Wd3532248
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uDpdwUQzuuhK5MqHY291He1R+WgUjp20dwFlqgkIrBI=; b=BIfACR0WuyItvzrU
	lT/rH7e6w4pOMOXTf2plcOXx2+sDr8HQQiQAexT6NiqH3vhSlRvCx6ffEH4xjw1R
	LC+LC55bAuhbqDke4k9RA7KBC9kCBNLcHeriPabyNcz2X2lrtuh+arNWycXuJ7ew
	v9wMC0948oSiRIJSi1fSJh92oNBfkxnJT1kLkXqNr0RqFC1UmgXGBclBwFmf+nHs
	yLoi7sturUX92+f/xlCqkAFov6NQZ18YrvQNdIBJT8F+2RwSG4ye03EVsH1WdLEV
	i1c3nIvcjdudPsnbdO0hfOTQ9BMqqaWKiEKKfaUBxFJDTSWprukJ5MkwKOG/AYXE
	Tdp/sw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea39gvxt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:11:14 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-575296be5b1so545754e0c.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 05:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779451873; x=1780056673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uDpdwUQzuuhK5MqHY291He1R+WgUjp20dwFlqgkIrBI=;
        b=ZJ/hUbqNsRUfZI1GLgDtSCJPeIDU2R2DNE+d2nw6Ob01KkwrAmLK/OIGvBgwG/cK2A
         wI1+LCg4nSBuXJdoL1sMzu6AAllYomN6R3rQVkVT4r6PKKLEtZVUaAd/spNR9y8zwTy9
         wFod6UpzpvDLr3E3QFSHf/1mk1+R+rzlXy3y9KhcByYp89BAx+pw6S/V7giub7l5QcnP
         UGiQB59CuvQ6PG0oCjXXOKkmeRUtl9S8WhzkI0tm+3m+G0jjliK8P8+r3DRCqWxSJR6E
         Gfb2E2LUuS5r/YfWF9kD68xCm1FUt5XTjdaRQ/xf2kmufCU2SGMU0J5eWeXQd2zNxvL0
         ox9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779451873; x=1780056673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDpdwUQzuuhK5MqHY291He1R+WgUjp20dwFlqgkIrBI=;
        b=ixA4nUIrzjfOY3+h5VDFlDsfIBNNU+0X2ozeJ1/Ee1JY9Oi62iy8zfMar6Lgq1o7jM
         NKhlcudDM8WHlHuaumQPnDGQddIxOG2sHYvKhlaN67Itqn7vMOQW9CxGMULJVsDyG9ID
         baghP1e/9MEPpMxfcnDPKlnODTmtQqVn/NvLAEYoVEtL2LUF/iS7JRfUxSzkkiE/j8Nv
         37YKksu/kgrTg8uPVXA08W8pdxgN/wSz1QHSHAZgbhJEZck/v2pfozs0DTJq3YyLx/K+
         q4xQakdBcXc7ywuTJpdtcsMJegVY/fCYIDS0jNUOg18zp9KjwbIOgxg7CvwD8wp370Of
         xYmg==
X-Forwarded-Encrypted: i=1; AFNElJ9QrCJIevvJ7D5B9lLk88L6GKqjO4Mpwfospj7oN8W3hypf54GGD14nSru1rU8BmCq66paDNqFjq9iJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz18DZKypUfb/vkrVHgXlztMXeFY6LQI03TTK03AR09TuBx7Vws
	l46Wlb3dP1FHlD2KlMsZSdlF54wh2ATN9ZP+ZOXg44Wpxqu6c3vnWGZhEfLHnbTX85eNkdHlf1G
	1FUzPUUK4H0VbqkUv1h5gCemq8b6+LRo2wElTxWIEYz+fzAny5MnarsyQBRP/5vvs
X-Gm-Gg: Acq92OHqZdAtB2QEAQlCxiF7aA8nICb4B259uTdG90n34RUJHbXrL9/ZQtL55n3cfCk
	+MwNBMGhCrqCysg8gwXFWzdE5S7IozfzAolh1HIvjTcfLLrT9PIefp3adSQsAGxQSmInzDRxAJL
	vOmxj9KZcUq71uDczYWG41LVdGchvybApD1gOMX7VQ+r3qtSBI18w+CsaawJlwrHsS84062R5Iu
	df5uH0r8L+uG7wyK65YdmUdfZmAv278tHuJxTIDV2XwZjU2rZg8gM9XFaGHnrT5a2Z7qGG+5ITe
	Pd/rl37GCsbWuL1wnWBT0KSRc+IEX++JLTyj6mVOfL0h89py7d8uoCLDBGiNokdVv862dSXKnJ0
	9ySfq1aziHzEOq/2eN2y77E6uNpfkkQxRrNucV5NfNO/mkF5oFtZVKkqq
X-Received: by 2002:a05:6102:17d4:b0:631:2be3:b6e8 with SMTP id ada2fe7eead31-67c82ff508fmr407877137.6.1779451873495;
        Fri, 22 May 2026 05:11:13 -0700 (PDT)
X-Received: by 2002:a05:6102:17d4:b0:631:2be3:b6e8 with SMTP id ada2fe7eead31-67c82ff508fmr407871137.6.1779451873168;
        Fri, 22 May 2026 05:11:13 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b72cbbf3sm605052a12.0.2026.05.22.05.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:11:12 -0700 (PDT)
Message-ID: <c6ae47fb-b7f2-47bd-9e63-80e6d66310a8@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:11:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add Eliza CQS SoM platform
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com>
 <20260519-eliza-dts-qcs-evk-v2-2-ad7303659d24@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-eliza-dts-qcs-evk-v2-2-ad7303659d24@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yr8/gYYX c=1 sm=1 tr=0 ts=6a1047e2 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=l6izLxsmSAxkASaVBewA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: mWNqIkPRaf6CYTXDsOPLBj0brFIDMz-7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyMSBTYWx0ZWRfXwb86sT2fTdoe
 N1iwGrqc/wC+ZBR+fWkyxuoT5szLajLSs8lFmtcFTghRz1QDdGLv0Y8Zu1I/I2Vw4uS0I6uaZ0r
 m+FEK1cQugyWKOF7Of3WVo8DXbFT1LmkG2NKKu1VpSk2lKE95bd0O4uGJPaGMNdUvvvVAgM0SF1
 5TFE0mo8dpvvnykdharTq2P1f5HRTArOjGHxY6VIYH0JJzE7ryHaHz8SCWifn41NfU3rgQT39Pf
 MQq3Gl5AiGSSIa1x3ITS6JFJPZc6Mpv10jc3wfmCawVoLaLIelCmfDmbQ1UtO0IgC4CijJ8Qnd5
 96OEO3hTNJljdX9uR/K4ttQxDJGMFuKMjaIqYzmCKOpsIOA9EvZ/Cd4eg+Xj8xiyDOXaiX5GyH2
 onyTGzt8idYSEmr9TpxHcXRLXNwyTSiUdAlCqGtNyCx3EfX0Gbq9o2U1C3PaO1XjRk8xKb1wKy0
 gGXo5cTVF+39jWycBvQ==
X-Proofpoint-GUID: mWNqIkPRaf6CYTXDsOPLBj0brFIDMz-7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220121

On 5/19/26 6:09 PM, Abel Vesa wrote:
> The Eliza CQS (CQ7790S) System-on-Module is designed to be connected to
> an Eliza EVK base board. The SoM provides the SoC, PMICs, LPDDR and eMMC,
> while the EVK base board provides connectors for a multitude of
> peripherals.
> 
> Add the Eliza CQS SoM DTSI so it can be included by the EVK board DTS.
> Describe the regulators and board clocks, enable eMMC support through
> SDHC1, specify the ADSP firmware and enable the ADSP remoteproc.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
