Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4756D3A6B8A
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787053450; cv=none; b=ki9Er5yZXosKZ4R/oUXCM9TBlIlq21M1MhSqLaWTJRFqoXvVuOeVm1BEQMPLqzJhcHbuHWIlf/yRawZ52aX4AgPjz5CP+flOD46T1syl6hZUuastW1dPdwMZiCL9/RnYCtD7tg5+Y2rtQYg//kw1asRwVuPVAujjJV0PqhP5qII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787053450; c=relaxed/simple;
	bh=+2pwNFiiyN0lKuCdv1OZf1UR0SWyla/bjbrwODVj6CU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s3fyF729oCnUwrgFO4POPu5/UhBB8CUalCBEYpnviDxt8TuiFLjjuGYZeL1KptfiYv6H/ejfGAc+NPbyOPDOVAeVLt7fWFYbMVW2MLTYDK7HbJMRTn3PvddvMOvFmi3hv1mC6SHbQHPlUan1ntRzAmfCvW0NvUnTEFQ1FSgVFfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a5NWV9io; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NV+tQaJd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a5NWV9io";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NV+tQaJd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABVfk1544806
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TXd5j6SL2Xi/34Tfz1UjGNeCoI3Dt3uZsl+9ugBQmTU=; b=a5NWV9ioIHbw/nHJ
	6hix+YnVLwr/VsTkYJYrMpjm4rBA+pqAAqkRCMxSffb0TcaJCtS996Z+nIEs9Vj2
	7boszWp+z9xNRiiPoQtvPsT65CzId91s/Ua2ULs9I7ZtsjjWxiZVVAwdwU877XHs
	08fGzZ+2APfc75WcosttQPkTE8Xp+wMAwcZ6hVbwposnhMl69MjfUQHernk1TY5t
	xXFDsdxYmq5Je68YDoQxRiweht80WpROAVyH/j5isBw5KNTpcqXcE4y6WvajMGTG
	jF/p58B+M4SER1MYoaBN9qJ+l06JypnDbMaeGCny1H/wL7h31feVy2tEh5rR4ask
	0zmhQw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4dcn2es2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:44:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51e9d892f0dso12989651cf.2
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 04:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787053447; x=1787658247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TXd5j6SL2Xi/34Tfz1UjGNeCoI3Dt3uZsl+9ugBQmTU=;
        b=NV+tQaJdYpNvzAh5iG/GDNBPlJOkFqGrHhViFb3Zhbt+tk47u7E7X+sOn9vw8nFRx2
         8jQ3gHsYtDWbsyyWJUWPG+Ib/3Y1a7iYgw2FxR7zwBKel3NiQx+rnYDNDdWWl86kDwkG
         rzfyKxv/U2EdXOp0h48VafCIgubxSrn8eJFv7t1ZhZx6SOSyS51Z7qYv8LAFpJVKWYb/
         SQmbRIdqj1Yuz2Gyt4F0EPAn3fz67B+Wl+Lq3FEQxYg9mUhVnJ7UJ0jh50GVRNFBPKvu
         9JpqY5FJWw52loWLLDlAFAgwzgmtE/vXYPrchoNWl7+hxLqpxv634vUYiEOFDMKV6u1A
         E35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787053447; x=1787658247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TXd5j6SL2Xi/34Tfz1UjGNeCoI3Dt3uZsl+9ugBQmTU=;
        b=DaevybDh+WLhOlnzVALMxjXM9TYovf9bYOQoXARlJuWcp+e0a23EdmNEXYftupy0vm
         E9nEwvkw0uQSRVQtp0Y37Nw5Gcx73eaGIeX4YqfdrZFyP6xGZ4T+OxTSJbxXzzwhMTI7
         3Hm8wEP/PSOW8GAgbx8ZH37/6f1nq/ENaztG08r/hUz3lIfrYCdQtjpt1BHuK32Ha/Fq
         lfr7uGSKNc8WoWO2ACN0vV2xO7weiCsdZHcDUAvWLmzjQPWa2wJ2N55qvQXbQv1ih+cZ
         nY8PN6Tw++ugJbaDvq+fO5C720L5ggygXvzcTe9+f3nAelNsWLMK7BYNZBaGdaY1M19j
         YhOA==
X-Forwarded-Encrypted: i=1; AHgh+RoKrgcPGcTamdSlW/2NPbdItvOac9v60nrgVJUhh517/LmdBNQbwsbl/I2BCT7XAgrfJryEbvFNE1JP@vger.kernel.org
X-Gm-Message-State: AOJu0YzAOIJ7CMzOU8kALCG0aty8Ioq5vYuQ6SYcrXXVAQ5WyopFk6QF
	IfqIASS3vfu9o3OG/NxJ2CIA6H2hHD2h/O+8/SEmvF9kXdQqJMIQsR+DHttIh5gMN2iegXTP1zT
	d7BQT9lAe+hjnYrbqLVoW3TzpF+VukQ0NL18Pv8xhKnu2twyIsKOSWg/s0uHJ5FSr
X-Gm-Gg: AR+sD115PVFhDMBjXifYK62KwY7noD5pEET0dS+z5dbP5ln/eOGvJOGlyNm3S8s5Bam
	Ogmf5C0UoYw9VX8NrDepXkxouxWuk7OGywZY7Oh86mJrABOFxSkV2z7D041vUU1LDdlR/w1nugB
	RmNrYe9YTYofv8GmSi+ra6kRrqIr2PshHNA22wvuxw9UFIWlxmbhEnvOu7T6b3c57v9R7D8Q+mB
	okkVdhmgNoIs5Bt9a/MbucSIw97LX8dhvtTa/bcSfqrNTcYoxTSFC3zmbVC6Lgt63EFlZhOM45h
	y4W89x2WsdxMqXkOTqrYttGGRZhrNncKFTMIYGcM8dC42qMzeKX5pD75BXAvXqvm9rm+QDUYBk3
	GnXCZzf5DPsXROahRKbM2F9Rn
X-Received: by 2002:ac8:59cc:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52d85478387mr245384911cf.3.1787053447405;
        Tue, 18 Aug 2026 04:44:07 -0700 (PDT)
X-Received: by 2002:ac8:59cc:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52d85478387mr245384631cf.3.1787053446947;
        Tue, 18 Aug 2026 04:44:06 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2187c83829sm118450766b.41.2026.08.18.04.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 04:44:06 -0700 (PDT)
Message-ID: <44c59c12-56f6-4526-81b5-11ae8734cc2e@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 13:44:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Increase MCP2518FD SPI
 frequency to 17MHz
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260811-kodiak-spi-can-17mhz-freq-v1-1-1d99e360a7da@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260811-kodiak-spi-can-17mhz-freq-v1-1-1d99e360a7da@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SHdmm1luaWs1YG50pXI70MFnYHLyArwN
X-Authority-Analysis: v=2.4 cv=Gs5yPE1C c=1 sm=1 tr=0 ts=6a844588 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Lp0PEPXvkPng5LqQ0PsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: SHdmm1luaWs1YG50pXI70MFnYHLyArwN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4NiBTYWx0ZWRfX1Zeocey6hgZO
 jY6XLVITSR2dE6PiZqvNDzzgftWlchbmF88zUvugvoMQ1n/b/5PnXgYydh4daChPVMXURixSKIa
 7InKainhjzgUumdtp76KeSI4+9TaviMldj82kIYQ+K3Uvl9kdflP8W8tFdgtiCOKr/n/4BqylZX
 QVt1gRQLhm81H5Eg6p0xhrSIggDfLj3Dhw2gURMrUERYauLYumXWSQ6V+jEVbS/rghfbyEcklVX
 RoYpKg4KOJ7vK5z6PkNoUqUfjiSXBuXm7uD2P/yRF7m5qgciRj+LIyfvCJsZDiy4aTYzbA7OWbm
 1vhkSMITRN+2kQgWRIdkWDkUWHKbSTNfwETxrXKFuDcHm9oUTCUr3aLRIra7EYKzGRAgEMIY1iw
 QfQrvQd23oNhYEARZ0BIF9dgfzBViCQqQMpYvtpLWKDeFXve8bAQzm8JXThUkVNXlkqTTmiW7sm
 i+UuCM12Nv1ccf/9dBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4NiBTYWx0ZWRfX/SKA1tfSUZ2P
 RfadmbibeaKTsxBKFcCzp6E9gNDdj5dUg2MNv8NBctQV8xRSlLUgFvP7wnxsirfO7ALqx5rRQus
 qiQvPktlqXvyEWFL8LCuPHXAXU7Z5jY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180086

On 8/10/26 8:30 PM, Viken Dadhaniya wrote:
> The MCP2518FD CAN controller is limited to 14MHz because higher SPI
> frequencies are unreliable with the current SPI3 pin drive strength.
> 
> Set the SPI3 data, clock and chip-select lines to 8mA drive strength and
> raise spi-max-frequency to 17MHz, the maximum allowed by the MCP2518FD
> errata:
> 
>   0.85 * Fosc / 2 = 0.85 * 40MHz / 2 = 17MHz
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
