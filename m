Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2802EA47C
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 07:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783410668; cv=none; b=fmStJfKzha6hBA+IfmToaO/cgaNds9zTA2Ybvkq4nIupnCA+ZrHx0AkdL+6LWXIAVXul0gxaLyL070AG1+voaMmTvhtjsoMcwNPCbGz185HLQ82HROWf2wpIZ00YUaltU8EbjqES/Ku5z75B2lLxZi5zPqnShzmpbsegg7jY8Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783410668; c=relaxed/simple;
	bh=Maxo1860W3v7cOruvNsebLdIGgVgbGVgvp0cEF5t6ho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCr1kz1IHiqTb79bPy1BLQt1hE2xen5wqHTkmf+90RYxK0DPod6x+CdbuxQ7RPLE2DcIPIXIrybcFVr3vhW8PADSTYcIPIGLIkMUmaFG6OcHcZmY+Tricw0dJiFH9K8m0gVq2J0qm94PiSvMsrCF0vYg3nlOyYRNWG2/0FH0lrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mI0scv5Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VhUUumMb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mI0scv5Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VhUUumMb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6677BKSp2935721
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 07:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bnZ3rlISTDjYOEAxPA/dNYNjWT8PUBILAhglC5VQ8wg=; b=mI0scv5Y9oHpnFaH
	1jrVtGsFXeuDRR0M6qUoakxnVUc/NPEmENught+XeNsQHp6IHxNauA6l+z8Thka9
	JyRAjZHxtZD1fRaNvq29pbzqkN+jk8g+QbgaSGXeTZ31KK+ppvQAzXpYwlgIq4re
	mIhKqXl180y2e+dZJw3huTKD1OGlsfsBfOYxD96QrNkyMY/39zLirZnnFWj6TZVE
	ceevLNtxdmZlHJYAIujU2NcIXDYpwxIMeNg76RsSdDCZLtsnBzJ1wmsAMUPQWtV1
	mlQ6/0cAvBBc8/PtKsIjGAZ6NfPD/2hbv+MpZJxyXeazOQeUWSf5icwm9gnZ8RSy
	iCqr1Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun04yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 07:51:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c08e9c344so15468581cf.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 00:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783410665; x=1784015465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bnZ3rlISTDjYOEAxPA/dNYNjWT8PUBILAhglC5VQ8wg=;
        b=VhUUumMbjdAxPAgWZDstwMf5kGdcayox9MkQQO1atCtcjRR/sGkna0IQIF1W6K3LJu
         bs1oZMyZ0sVn1NzRrY/ucF+hmarfuk5SSMDdlA0vSMSg4/9dr4h1wuMvg7DtSvqEBYCc
         +94D/f0iNZcLlvKPlg1Qg034Am2Zs6+3mJYKY2gT6KRUYQ2SFIRgcEEZsNj13j57RvIM
         vRB9Wqm/ZUZcx7ck0L9D+DOgnUfrprXMSgyOEKmAjjO1cc/lbdp0cBKChgZ6QvY4josv
         V384mzLSXonu+OsQaTPvCLFC+LV9YkVnz6AT/kMePfIeBgbHQf2REWJ2c6d0xhiNc5rP
         /jbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410665; x=1784015465;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bnZ3rlISTDjYOEAxPA/dNYNjWT8PUBILAhglC5VQ8wg=;
        b=WKI6yrXWeGUDQDZx2RyEd/EyNAOh5YH2v4vxmWQ7N1BZdDXhSAhdrcKnN4wSH59U8Y
         Q17be0MRD+1TeOUcLcC62V5iwMPTAtkIBdqFVOk0qnS1qRSOO4OzDF8C/+sMal3iMGrG
         2h7eLKRxcrxiuEv6BvAM7K7Mr+eSU2Dshy3NSGhRVd8sz5qAUVDMQsgEeU7Q61T+TUX9
         Yh0Hn50Ulvu9uhYxqIWI9hrUbDe0QozyaLTvfvwjiGaCLK6PLO1CeHBCCHnEqkUDpMc1
         bHkTDLrUd508o+3LeuA9JpzmOycEz4UCPriZf4KcREGB9SL+FnjSGMLssWEt2byU9J4u
         es0Q==
X-Forwarded-Encrypted: i=1; AHgh+Roct9FTs+blxupqSCCe1SMeIpRdu1pQ3IRBJEMpmGATznziMdA+eRFgrOjOhYqCvr3y3F/dmdaQXlvZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwwC4QlhLqd3tmby3EKNdR0aBE33QwXSHZxVdYW2OWDqkyDQlnd
	xxTwPFHSHP1DzJOWmx1gIYAmbiv8wcoqtiEWS84CIXHuSewvLE2QhHP9m+CzdZFgcgeaGQrCRAC
	bjKnZJiQtxaHaH01FzfNbsBhnZFUXzAwL5EunIFZg1KzOIZ6EU1DYSP/RAe4l0A+w
X-Gm-Gg: AfdE7cnceuAu4l+MHHtgUk9HTT3yPAWZ2MyCgFPZWNgobhObJIkVWk5qBC6gCPk6KpL
	WltbqGTN4lhFNMcxO83ODrgkRVSVAFyBhonfol15wFHJStD463dQS0Vd+ay7Vq22Kjyz9c7z2hS
	LP+UdiehT93cGmQ6U6Fs7h1aH+fKLuLH5KhW3fjp3nLigNGtKB3t0HVR6N39A9oTJSdZ5oawMht
	I5brqUvCOtU1gWzPFdcEiaKC/CJJqMQaF8SDfShwBT7dtWZUEKSnSJY8wkJWXe3QIcUCWiMQ9Mq
	YQ5XTANoD+6ZSH3/lyvR2TMR0te6R2EWNqrmOa65su8PVCouVifSa4mKQqlnRVxkJfIF8Imy4+w
	4MunbWZeaNcRYgPUhFhJ7dpX4F3ezab/BoC8=
X-Received: by 2002:ac8:57c2:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51c4be98f79mr125903071cf.9.1783410665278;
        Tue, 07 Jul 2026 00:51:05 -0700 (PDT)
X-Received: by 2002:ac8:57c2:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51c4be98f79mr125902741cf.9.1783410664424;
        Tue, 07 Jul 2026 00:51:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad82311fsm75025366b.8.2026.07.07.00.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 00:51:03 -0700 (PDT)
Message-ID: <6d8c0326-1b3e-4eae-b528-22ca77dbaf6d@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 09:51:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: ipq5018: add nodes required for
 Bluetooth support
To: george.moussalem@outlook.com, Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260706-ipq5018-bluetooth-v4-0-350262a30959@outlook.com>
 <20260706-ipq5018-bluetooth-v4-5-350262a30959@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-ipq5018-bluetooth-v4-5-350262a30959@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA3NCBTYWx0ZWRfXxTDoJa9yUFTR
 JWwBfGyF64cT6y+bKUgxA/+0V+0C7U50Mr2g8amIb+awRS0uDojTXTi5G5wztzvyvMo0uiPhjVr
 MP7PvI3+BTVJaTK+aVjQA+uiSGusS4Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA3NCBTYWx0ZWRfXxt5+O1K/2uXH
 vo/zn5TPzZrysEKaquThvNCFLynX1GULaIQ+pDFYtSEinNf5hfilMbouPVTD0M3D31UazzwUFZZ
 1FSNsGPYP1NkQD8n+rM5oLzRlfsVe2UxdqStEjB+eL3UIGshfxCzIHwI39hajfy7DuaaYmJwceD
 hsegYbbWvX1MaAGk5ogXbg6qbqMgCndVw3vsl9mo1pn+ZuQL72V6bCPKO8oWQc5iwOxfjx4160F
 IxSCo96eyUd8u5h9cm8moyQH8Tna8s1Ewej3Rhu+8eynRFzsawjmBJxL5tntK7C/RWLZ63hao7I
 VvAlFT4PgbHwGd+GLlSQfVHhfqZGN+39louI0mVuXQcXdRP5Tzq5f3rnCujbv4x5I5P03Rr3tDD
 79S8XFYh42ZrI4gES0as2R1cjvbCjP+S9NLSDEA+Lyh2Qkbg1d6tvpkY4qbYY7tU37aPF4I7C+v
 ikeakEW0tCKRx5Scwlw==
X-Proofpoint-GUID: hW_iAU0aXVALu65Bne1u1E-bJ7MbhRcy
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4cafea cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=t82OjkPGvLD1vuDj7LAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: hW_iAU0aXVALu65Bne1u1E-bJ7MbhRcy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070074

On 7/6/26 7:26 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add nodes for the reserved memory carveout and Bluetooth.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

[...]

> @@ -136,6 +153,11 @@ reserved-memory {
>  		#size-cells = <2>;
>  		ranges;
>  
> +		btss_region: bluetooth@7000000 {
> +			reg = <0x0 0x07000000 0x0 0x58000>;

FWIW RAM starts at 0x4000_0000 - I'm thinking whether this should
just be the 'reg' value of the bluetooth node. This makes even more
sense as you write to this region using I/O accessors

Konrad
