Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B371D48CD54
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331580; cv=none; b=r+JoW/3hUTfWZVR6lU3QTbo6dyJAyNC0S96KxiA8+gIBjWueWM4Mfji2PVAjHIN5kH5PMHYlq6rXaRQOcYbbOhbiRSLQw+v5l7MO7XgdQqdslqsSs7tMX04CoJvhqXbSvCLr3DrzAocgadeUv1sPKUCAexya7laCMtIFpuPPmI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331580; c=relaxed/simple;
	bh=kuiriOcwrhUBkH+cFmNQEkfBDUUYBrctQFAqrwLNkHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W0GSUv2HTGgHOFbssCXj2U/fgrJlYCqTiLJ42f1Js02kf6z5xIBR/c6+J631Q47w4n303P9XAvNDrdHRhFTiMJDxPvEJM414QKGwZwOD3IZnlMJh3F4uzuPSzascCw9uQLnLWb0thEqGFT89iWumVHHVGLlPIwmcCqz/mVZBx6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hjm9Cc0k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GMP+L0xW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hjm9Cc0k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GMP+L0xW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YVtc289457
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJosBlRsssotpYc76/kVdKbiIQG2FpE3LuJTADYjC68=; b=hjm9Cc0kwqVAAJaN
	byxMTIXx8CjId+Th/N6Jj8le7ClwnLsiFbz4PvDp5UJbOz6toe+q40WkShgffNwA
	GEPgdVK2lisIxS+alfZm3xb57By8QmZpxIild5HuWVc9pEVxncz2e4ZFkIFbXpBs
	gzDjZClF7t0IKXHTaHZxizpVW+IhgPzGUw/8UHNxt5q6aB5W9tP+dnTQyoO1O5V5
	2pnhR2NH9FHnHi5z4C/E6XFmFwOEiDbMG3YuIRWk6WJ+TqYYPOVoDhAmWmYerzpm
	K0GcMFGuKDbUIWKGla75UTYOV1IbPXpaCsS/0TXYkrELP0exuc8sZsjVFCSiavYH
	EoYcJw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881u37q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:19:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939fc317691so20319185a.3
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 03:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331577; x=1790936377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iJosBlRsssotpYc76/kVdKbiIQG2FpE3LuJTADYjC68=;
        b=GMP+L0xW1+U3dWs/2A+u+9GeO3Oa9YRR5YqjGaO17naTbyXuJUeagqoYhdXNlII2yr
         Pv4TwykFrvwYJIixPyghWWx3R33Q34Omo03zkyD3swtLOwPlU033TdHo7QBc/yapv840
         utlObM6+2VlU7pPTuvB1kM7QgCPAM2GFE6IvHVEQtA9kzdkX+myTVe/I0SdCmNZRG6YL
         dNOpUiNxUiBPgEXSy3g5mS5X8Rvt51pdxVgYKHY6nr7ckaFZg/rtIgfqEIZBxuJIMrqW
         +fy8p9rtY2VsAyt0oFQ3fIXQtQDBK3JjpyjUUOb5f/F7C9qSJ3+cchRdezKZqGW0xu3x
         E8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331577; x=1790936377;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iJosBlRsssotpYc76/kVdKbiIQG2FpE3LuJTADYjC68=;
        b=om9OpPzbSGvH+MBIcXE9J5a8ut6m1+d+njKE4P9pq94v27CtB/2o20qT7SkafDnQSG
         9qkBspDnTXh51FjXUkrVM9iIWaJvpF4IZtqNyBUPQyZ7yv6weFp/ZXD2Mz6F2u/U6omL
         am8jiGw7mGO+JSIyf50NngmAl1rFyZMIbrhk45qegv0Ctq980m/SUliF3qHYkIVOzcK1
         eHIw/zzr/avZXdCXI8COj+g+cpO9sy9XAFwMAUwlAI1aHjY6g2ROEfpnqxTPsnmHUYNF
         GimHvSbsXJczLo5HJVELBTzoTV4zkQ9Nul0jthe94Y7p9g1asKVYzcJc7yK3Rv13Gs6S
         GB7A==
X-Forwarded-Encrypted: i=1; AKwUvBzjBV+gNJ/IQ1Sg64CUw3gL8pJJoYRzQGdAwlV+qM5scAWvDzrgUGCymhpSeXU9259F9W/jpVk8Pp0H@vger.kernel.org
X-Gm-Message-State: AFuF++nhSqKUkkOYqh7Peb6DvzdObBCsMIJz74P0ty6uuzc8Y36oNlhQ
	snVjtrM3E46kqAPzd2ypiS34xfp+WkgzUrGOcv26/Z+stapIX0FH/IItrYgX1RBOwStZccDrsfT
	HZZ5TXKA9M4Js7CPqN39zpex42YBgBvz3eVeSudO3jl4npGB8aNERMa8Oli886TUK
X-Gm-Gg: AYBFou0pE75L94mjpqEX8UglX/dpkU/u+Um2ECTrimljrxaU+F1DUxP/yYwQSedXPX2
	uYsf0smj25vqyauFyvUyZtxPm+h2HKcodwTqjch+zZ+FMFrvae3LiduAOLjNSyl0TWXvXQQBaJt
	UeXIB352CLJgdpIkmh5DYfpqvfntIgC9sj4i6+KtKWCCfMjx5p3qUAbpfQbd/lGZ2LXMhv9QAmc
	RwDcw2Rl0KsQAsMc8RhkQCkx3lIWgxMa915LJeOTcT8RY5U4p8qAw9Y9P2gnMeOK47I0F9VnkoX
	un0lfyT8N5wTrxU4/7i3u/Wihn7D0wK8jQfqVv/10h0xFB/UADWTQKYo6A9R2eO5+ISH41Kn1Vm
	ohjBdvVNJVdoyC+NzykmMGw==
X-Received: by 2002:a05:620a:1a15:b0:939:9205:4d78 with SMTP id af79cd13be357-93c43d40617mr340523085a.3.1790331576880;
        Fri, 25 Sep 2026 03:19:36 -0700 (PDT)
X-Received: by 2002:a05:620a:1a15:b0:939:9205:4d78 with SMTP id af79cd13be357-93c43d40617mr340520085a.3.1790331576328;
        Fri, 25 Sep 2026 03:19:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae74815easm93578766b.23.2026.09.25.03.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 03:19:35 -0700 (PDT)
Message-ID: <d7db3b98-a44a-4e63-8ca7-c9fbfac70f28@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 12:19:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: hawi: Enable SoCCP by default
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
 <20260925101309.3826038-3-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925101309.3826038-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab64ab9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Efl7ekKAViBeap_CtEcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX5lkloWFhY7tC
 zOFaysqDpdX06hKsjiH3LkJVRskdh47bUvJNi0SenFF1VCtO9R9S70g7UIJDDEYQCFwxd+1+uXH
 029JBzMM7fdUW+LwVYjQhRflKE2V4frs1F3A6CxH5Kaw0S66yDqSdhXolWnrtcRjctth/6X1MSL
 /2Dg3wP2FSovlrHqsG0KW8AMx+BJ6WbuiHepKC9vbgenyvM3qEqyn3YQNTRvudfLPmYOvCwexBY
 uJbMPgwa28yuyfdNBVf/5uGJ+EMJQ+TQX1m6sSFodObAEsaWt1QrFOIwajMR5qySttCkKh2NU2y
 nn1zNS1wn+2R5V/SqBWh5LFfFo8NR07hnAHhvYf3IppXOV68JOaKv1BPgsLIc89RvgB05b3eC6F
 gFaiVHVeiAt2GRP9frXM7ycAYA8Bl+5kuxyEJr1T68Ot02ARW9NgUEo7jN65oZMUlmqay1sIi0l
 ruDBTlXKqHTyPd4ZykQ==
X-Proofpoint-ORIG-GUID: F9jqJbl-YhJuod_MP1Ytlu69wJXl8zdD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX28bqC5AocxPY
 D3GS6ptiOC9Yvw+0Aougp9S+EEy66W10/57UME5bZy+bbA2rzfmpvrgIySXxxUnRn9reaf+Z/0b
 ETNkOAKuyzkEEplRu8wQS7MVzD5Rv98=
X-Proofpoint-GUID: F9jqJbl-YhJuod_MP1Ytlu69wJXl8zdD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250041

On 9/25/26 12:13 PM, Mukesh Ojha wrote:
> SoCCP remoteproc is marked disabled in the hawi dtsi and enabled in
> hawi-mtp.dts, but that is not the right approach, as it should be enabled
> by default. For Hawi, like a few other targets such as Kaanapali and
> Glymur, SoCCP boots up in early stages of the boot chain before the OS
> takes over. So, it is default on.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
