Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795758390;
	b=IHvy3FYQMGwZI8sHBWj4sXH89B42QEsSCzxc/EoxbgDNYJIFMxusgCgfJ2XOI4ZupI3a
	 6VEVyLmsCWXyonmnA4wfp3qkyn6xwCpa/MXSEswKw+D1G5H4jnn05Ws1jBl+OQucj+6qr
	 sVRpsd6qGieu/OLD1ORr/das+iibahJz4ugWXNZBIIYmoSOoUZVI3QArNRzRXNLTGK21T
	 fy61TwgiL0994Auyzb4xLHVqMZ42evxYiIFRJnc1eeRuXT2FQddIeu8BGaT1/aHpxQbDh
	 ckvQ8qN+1wC+3oIwvFHrZw5CfyqWsVf8w0n5utqweaeIFrsuSgEZkOdFWqsBiknNlpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795758390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WGnLZ8DZG579xPOwsWzbjQJacn9dw8FmTmRTeatVQG0=;
	b=WLTvWVsxNQgEiHAIhCnVWfhijxHX1CrkVPEkjhWKk2CsL9g08qWCVHNPnmr3boWEjBg8
	 0RajPxg3jvcgi7fui9qlRIp6D+GIkriC/bCH2KJ1qGGXbJ8RJvS9bbMocRw/SOIWhZmRS
	 jY0Zy9VUBBvE3D2W1mHY989bXBy2Jsq5lcQdNiY+rUDte42yQc20QUy2DF0jpjocx2qLP
	 S0SAjR0cv9EAHtBTuswA3a04Lp+p8QhokFxJ8w4cMf8qYCRuJ/Gd2zfVamTYrWuHaqrwh
	 2FI+zClWitaEXix2yUBIokfR5yaAQ+W6dnMRGzF/ElPIBKnD8m5BCbE7yhhVoWPG7Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p8qgH3EK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MVT7Bc+p;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A79606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05A79606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p8qgH3EK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MVT7Bc+p
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJw2b32573774
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WGnLZ8DZG579xPOwsWzbjQJacn9dw8FmTmRTeatVQG0=; b=p8qgH3EKZMLXjp7t
	fXIZwmqkWg4Nw1yR7aSkF41de3N1kQfUjyKlYwqyqWULdVxPLTokGNDiAbgjU/EG
	niXM6dKBLgaxMpr7c1oDnqlYHFOt103d9ivW9XPEt1S3y9zfNMEioFUL2M7aGJ1m
	WCzZoYAjHkV0aS8fVo3BVPcfgQDfLFIegxaYerfdH9+WCRlmA7i4TTLL0MEQIxa/
	mfcHi23IZR37w2yVd0BlTMwUXj3i0ASZHpZhkZ4Ksy+5GNRQ1sJozo7HoC7T0H6r
	uPDM80yj1tctDK5Vb/YYJuiOBg8ZGmajbDRkObu2TgMFHX/F9SbSvNAav6hggwkb
	I0+iZA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u499e16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:46:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so8892086a91.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 21:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795758389; x=1796363189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WGnLZ8DZG579xPOwsWzbjQJacn9dw8FmTmRTeatVQG0=;
        b=MVT7Bc+poapNh82MfdDxqbc6smDA9+uQJBIKnEcSg9pyv0q5uz3IuO1S3Iz+cB/ra9
         WniuSbloXe3yNuUff24OfdEHQsAhZtnZWQfS9Koxyj2GdrVzmqpyv5jytGXsuxK1yIB9
         daDL5ecqHhvSgrU1gshUyHZVdF6fic80P5Lekom91adDHJfgG9iw2r3WU/raJe9nLk/9
         8eeHQUAyOqM3m3ktfQsmfd2Y/8PqJj7RYF4+225/94SHseAm7FUy57zIuCi5IvaGTah9
         zPgCC7vpByf5Hu2DjjiyZHM9UY8ihFpmOqnLU9BLmkuHou1V2D85w7BSzB1+LHTP+dcS
         Qlbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795758389; x=1796363189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WGnLZ8DZG579xPOwsWzbjQJacn9dw8FmTmRTeatVQG0=;
        b=JIDYZAfTpbmpPCehET+wgcdcUm95o5U3G9h19ZgzjhoDZiKneF70oaOyywmLuXLxtG
         Dnzzw0KzXtBGbKEGk/0cG59gWjTY1UJeQY7N223BGClegVJlyxH/jn620XiDxRnA+Orb
         Hi50s6/ing7+KHWP2Yo/6E2oGZgOLzpsK1Jp9oBbIIH8TgElMmsWttL+LFGQhG87H6rt
         htc5xLmYMPx1bDCKPxJYiEVpSRu0mhtWhH2mPhPAFNJ0xSuze6Q4p18vH48FHVuZdwEI
         skwzDtbei2ynpXKTvtwQrGaZPLrmyLwZ+1R6PSARYg8idUmjHV3ZFQ6DS53QZpLixKOt
         lVyw==
X-Forwarded-Encrypted: i=1; AL+hErEPZlnyJ+ky4m6KtUAOkxvmWm2N0KGJiNoEnwjMSsW+mACGaa0FvQMCzgFeK5fmtD8zW0nl+qQA8RQb@vger.kernel.org
X-Gm-Message-State: APuU4Z/WMjsIV2P52GaxCB1Cdig7kKcFBN3SWJmSfozC3/kHrQGw3RoM
	XoYySoNPjkQrM4h/NnIl89h9oLSdT4tuOqyUTAUxvLxEdY8/A+T4BZfZWeRqpiwAaPqOHFmb0IE
	fDA/r7vsqeaXm7fgugVlbWr0S+aCPjGJsvt5hyCrE1u+AT5im0rZUhFofI+N8zIhm
X-Gm-Gg: AZFdTZfBwuYg0hw+941fz3g51YUx8SEWSEinCTNnlgjmnSiWqTmf9pAa51wWHe+LVdt
	YU4nkLPwv2lHRpyPvO+8eHn6TJjr9ai02IO63a3Ubwo+spSyKkxRcu4G17FGjM0KlyMHreqZQLV
	KJ5O/yPlUooHn72wMwEBTyyq3nFmfvry53XoaBopIPIT+iKeOT1zRrCwGDPO6u3EiUvSfSgptfp
	3xEBE+2D25xvJE+rKzHCTAG7Z09t/9JRfA/c8nrhZVnqftyopQVm4drjDf6yCERbvwlPLa09u+Z
	ulPLhEZUJrLoNdMrf4ucyGAJ2qhJG3yaGQj0fIapRYCTW13Doo6OlC2lyTgUIcoiamdopnLVr++
	vtLvyS4Vf4ltQiTaLBmiS1bGpPVGolFl+J4xyFbjSiS8ny1zB1q7xkeNQr0LZB3d4TeMc4VnUk0
	zlaAE=
X-Received: by 2002:a17:90b:1f87:b0:3b3:ca9e:9e22 with SMTP id 98e67ed59e1d1-3b41c9b2667mr22035589a91.17.1795758388551;
        Thu, 26 Nov 2026 21:46:28 -0800 (PST)
X-Received: by 2002:a17:90b:1f87:b0:3b3:ca9e:9e22 with SMTP id 98e67ed59e1d1-3b41c9b2667mr22035548a91.17.1795758388034;
        Thu, 26 Nov 2026 21:46:28 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7c6513sm17422749a91.4.2026.11.26.21.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 21:46:27 -0800 (PST)
Message-ID: <aaabe6df-71e8-4f53-a416-60d53be48c05@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:16:22 +0530
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
Subject: Re: [PATCH v2] arm64: dts: qcom: lemans: Enable the Inline Crypto
 Engine for SDHC
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261124-enable-ice-sdhc-for-lemans-v2-1-0bfa9ed6b4bb@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261124-enable-ice-sdhc-for-lemans-v2-1-0bfa9ed6b4bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WZUtJd3gafYh_vq3bUp5Bgt-7F1FkWAn
X-Proofpoint-ORIG-GUID: WZUtJd3gafYh_vq3bUp5Bgt-7F1FkWAn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfX+04kXjrC00q6
 alZaGLL5x9krA9XatVfI7O/eMX7w9tfLf6qwqTwlzd2+2JjtKC/0YtbiM0kiK8yBJGLwv8uHMvG
 LWiyfVZnWkqsppG4jDXW9o2tMlzTOo4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfX8/wbLcscTAVk
 KsXyDPe/M3dji7v/4v4SSWqWCVh4jjNVNtZNUsjTU308Ctw0pulTSn3+u+gEdjTbpadqrZXOx12
 XOuRVfPY22klQIn0UPtl80wxVa1ISprQYevhwM7wAoM0Yeh6BwZYeBAmxKCGTvcJOTqd/4+9K1Z
 LDwvYdYl79L14XtuikuQFuKcNEtxqoiKlHJxu8UO/xaPHetpQDAvPild+KTQrA7gaz3thbBJcYB
 8Nn4mj37zH+1bFFdQs5IXccRyVNHdFXwxtzJk5118pHOE7wIWeCaUH4ZthpDei/I/oCSAhiYfEw
 9x+GCg1pYdfUHFy7HEM3PekQBffYntq1SySoa1TPySWUWGn1DQBlyulG4PPCgkPptIG35S4ENgu
 R9gwpCPkKsx3gdGMmUEKVD/ZQgJtA4hvu5klT2CeBXArAdFcLiA3My0P0Ogs2g8JR6zoEw3jMrt
 CaW6v9YkDKSly0r7Q1g==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b091935 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qZkeo8UN3jEFniS6j9QA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270022

On 24-11-2026 14:43, Abhinaba Rakshit wrote:
> Add an ICE node to LeMans SoC description and enable it by adding a
> phandle to the SDHC node.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

> ---
> This patchseries enables Inline Crypto Engine for LeMans platform
> for SDHC storage.
> 
> Testing:
> * dtbs_check.
> * Validated on LeMans-evk with custom Mezzanine board for SDHC support.
> 
> Dependencies
> ============
> 
> [1] Enable ICE clock scaling
>     https://lore.kernel.org/all/20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com/

Seems "b4 prep --check-deps" won't mention this dependency and also
dependent series is v13 now instead of v12.
Maybe next time can you update dependency with b4 too..

-- 
Regards
Kuldeep

