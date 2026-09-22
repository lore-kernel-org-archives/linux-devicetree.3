Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96A0495AD6
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101781; cv=none; b=FyHlEAmWa1i0XEeBV3aNkv1bDQGYkfyoPCH9Uux+bNqcFP98P+ni1998bGTUrBx7kIdeHz56HGF8UYxU0YnEpw8EX9R1FaeVl5fQpJVyJJwVjIih2maA/+U9UimniCQp1/szUIQyM0xtPXrBf9tDL+q7cJBAi/C0sTPSXo5LkXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101781; c=relaxed/simple;
	bh=z6vVIQROk52rZMGJLFlybPY7chX0rdujZPO2jegWweM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gj0Ikl76AHG5n9cU+qbZ5Benre+9egjA3N4AtWfmnc8QOUjbcm6LIPdmejT4/iW1+QnDrGjdg7YX2VP+ATBZpA62tSrXXM4+PUK9cxDyLrloMUIT50e02ELZ3rb80L9RX7xsifierEYm/AeymsdJ3JnjXpOawI1YpfD619qUxhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QUEfJEia; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJsls6Mk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QUEfJEia";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJsls6Mk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI74ui1509178
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	35SesrfLA70Pb575Lmwz3KSSxa/20NLRjs0pbwQY4r0=; b=QUEfJEia/PgOT1KH
	zQrOYm9tNKssdWuu+TKixH4cCu+12ET9VihcJGoqbTjtB8CJgK/6ILBdArG5Z/Ry
	A6KuwLfU50YKpUtmgWHn6+/xfh2ej8786g0e6k+eyhUeuF2bJANZ3kAJkkFuPNxK
	01WqcjmSwk7jHiWCPTzgBwaD2M/3s51Ifd1A4DJep2OEySOY2IxDdDMAtg7dttPK
	la3M4/RWxevrtQWiEud2pW+6Uyb01iuvhO6V69QqD1xK1rQ5xWTpt+PkV44ATIWT
	t4R6LKlwrD2aiH4E/wg02lPoMJC7IGFOOB2F+pQ/lky5EpY3EkfNtlS2p5hLvfS3
	5sVxvA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xr8jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:29:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so110943eec.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790101776; x=1790706576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=35SesrfLA70Pb575Lmwz3KSSxa/20NLRjs0pbwQY4r0=;
        b=OJsls6MkCdwwJx9PbZ3uFUOueCP75i7a0yeQ1f/poLGcrY/m/Op/mErWbjvH4OYAZK
         6J+bUK0NO4yf+OgpFGaRRrJ/F00PM6lXiloIQdesfS3Qws2xunmvW6dMKZObDa+ctC8b
         LQDGQpQWp85YLp7R0Hy3uLwvNyEWnHsvV0hcqKebY6/R0INN4X/aWiRdL9QLQP0fVoKP
         DcZdz786VVt19oN/z2f20KJ430WJo++1LcY9j5MJF2EtQDZJFolWFBW8VLwNeE5sLD0z
         qDnuYz2ZN66TxjLBcNdnaHmQ9iohlN4kWbfT/AVyGinXgZmFqcSwL2OG/aT2qvdEnjnp
         0UYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101776; x=1790706576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=35SesrfLA70Pb575Lmwz3KSSxa/20NLRjs0pbwQY4r0=;
        b=db8JMRs5Pgzaj31+I4K4sQvQtFisOjEA/PVn8yw87KV3lbgWdJ+KRCQTIp7vzdLtOn
         2hQGOJvGmnJb/w6Y6NGch2IGMqwepCmw+I58fFdSupSqiOdPLcJBfWBmL2caqDsUAETp
         XrkY2a+apawihX7L0pkSd0L7g2BbQWYhKZFKsJfOcGMV6RglYxvMk6ifSqUiWubl73CO
         HtTsS0+AGGMezIG2g+abZt74Yj7cRJdSqPOWWs4sZpkOoEeb6u0Fw0WCArLxfKNoe9GC
         iq+/lzRdJWAs8azyMVmJlssAdhOBQuI+CAHfW5ZFbLn8fKwPLD9p0k/45A7221gE7moB
         VE4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzygmmf9sieQaPoIVFUiqi5YmKwRi3qb1QiEGbH+tvxVVm4/aIg5IfruDHoleVogPwLMuG6asX+4dfG@vger.kernel.org
X-Gm-Message-State: AFuF++llyudntNllP9x2En0pBI9FT0xFxaU4ZnQU0GuLzRQmlAAzVNhe
	6pkG9Y4k5n+Qq6T69XJzvvSSg81T7q6PjNVIMxWQbek8h6k85SElo+7IPYeH5ulU1uY55I7gZXO
	1dh6MUG3Osn7ZDD+SS5bYMijJsRA/tKlPIsZvy899uEcyk+QXjd7wnsuPLys92dZ+
X-Gm-Gg: AYBFou1BWKevabP9sDyA8TGsbniJpNRmD+Lrhg/HMTToLDgQNdJET7ftudzV7DyIplj
	qm/5fHFSeI6cAwthbJGcBhN1Kgr5bYUehC0is0jrmX8BkuHJQ8goeE3tF3uvmUSsJcHYMbWpv1G
	wsDl0hTB4sh7B9ws+UgaiJaXEaTby7zWdrQ3+HffYBCsfPJmpmJQxg4oCVJu1Ql1L3gyFyPTxRr
	RIgqU0w2y25OpVW8cOoSSb8YYsKDTgoboiewIi47ntVKAp4cxjWXJ9TMEvKXtuAIORcT07pcudC
	j7swdkbnu40++kIoXOG6w/x1Dc6IYmH/+pU2x8oaWmbZN38B1IR5Sq3r0XlO2swJyi7P7aTIZ7S
	lS07WV+43FYMs1pQtPIqWL7DtAROc07mMUA==
X-Received: by 2002:a05:693c:41db:10b0:33e:6b65:5eb6 with SMTP id 5a478bee46e88-33e8dec45f6mr125671eec.30.1790101776341;
        Tue, 22 Sep 2026 11:29:36 -0700 (PDT)
X-Received: by 2002:a05:693c:41db:10b0:33e:6b65:5eb6 with SMTP id 5a478bee46e88-33e8dec45f6mr125637eec.30.1790101775697;
        Tue, 22 Sep 2026 11:29:35 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.143.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625921asm109954eec.15.2026.09.22.11.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 11:29:35 -0700 (PDT)
Message-ID: <be1ca5fa-e537-4b77-974b-d0a0ab0965f1@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 23:59:27 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: eliza: Add iris video codec node
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
 <20260921-add_iris_for_eliza-v2-3-5fe7be8c0230@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260921-add_iris_for_eliza-v2-3-5fe7be8c0230@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WMzK2m1XfdbVWeBXmLnJcCvyeDhNNphr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3MSBTYWx0ZWRfX82USrsC9jR45
 5LOnyvhaaz8skHALfbyHjs6X1HwvPsX6daUuhlSsZmMpitzCTgELn5WrIoVUwfZXeHEQ45Z2xeH
 +hDmM6AeE7Twku+DKCFsR/xpk79MtUrfWv4Aa20lN1F7PPyYdgiuPWovP4+tmjqsWDvbb5lLEx+
 P6j6YnYaKZOAgGRnIvZT+FmUUW5GdQ+lLijRj3CZaLkPX4Djcgrfw2/tELOapTYaGHyy5QNNRAV
 tBbtCSO3TG2lBYBQzNZP4XSXQKpAvl0LGfOxFTD9UI+/A1BQ/WVbiD5D8UjILFlnLP0rsVI5wAX
 cjBB5VVd4EYDXikyIG76rDXpmtW1ffC08VaxKrksAF60lDr3t7GNVHrQz1bXL6iilOSRfAZjqlT
 JYlcqYgNnWQmoD3wzxrr6pba9G3Fe/64f/iCdR20xlewCtpnAuSJKTve5r3WOEFe/8qMwM7gtGv
 5en1czsKkSELVP/QL6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3MSBTYWx0ZWRfXyJoFprnmQULg
 jB6GAq+uqYg+l0W1dBRTmBFpfrIqQQyIjNlAy9uxwr3CZvfyUWzfslFoItadPBrRe3IFd+XsOdc
 XDSNOLGtiEcrhjKuIowZxRnD7Fp9fuw=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab2c911 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=d+GKXRUq2vCLDWIvqUj1TA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Db7omukDTCqXEX29fTMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: WMzK2m1XfdbVWeBXmLnJcCvyeDhNNphr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220271


On 9/21/2026 3:21 PM, Wangao Wang wrote:
> Describe the Iris video codec hardware found in the Eliza SoC. The iris
> node is placed at 0xaa00000 with VPU3.3 hardware capabilities. It uses
> GCC_VIDEO_AXI0 for bus interface, and VIDEO_CC_MVS0C/MVS0 for core and
> codec clocks respectively, along with SM8650-like AXI bus/XO/core reset
> support.
> 
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/eliza.dtsi | 98 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 98 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
