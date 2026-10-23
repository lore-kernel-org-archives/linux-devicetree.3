Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723614;
	b=Nh3G23q1dctJnnmDGhrvIx93d3luXg0ZdzRGLmBLRqmmeMfXSxs82EUxXmeOudcVbPR/
	 Nln0vaCjOSLZCP3ALbBHsYPg1BsH0U5wm3ZPF0/RKM2/+JbEJgR8iYTLowwfllUIpz5IF
	 rNHa9KZAxdQLiW+vI/ZrhvQ1ReMoHIkDHrhi+CCqcpbfHDk/BBVKrYV3O0quX9P6u/MaU
	 FaeNH/zRb5nvJRU6UBohyfqYTQsHV7NR53il72ahb2pOAmLmIPGqropGmO01orKRt0ZWD
	 2CzlPEwwNIwR2uxSs6La2ifba9F/zhUGSORAXS4caSR7AkkF0YLeT9ji+jc+CyG2Psw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723614;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jZGakksiT16L7VwD3yU9IXONc38dFFpjtCK73vPsBFg=;
	b=RES4bfu7+37cY/q3Xqv2Z35WdjsfAaXLlimnHK9C3GZWcxq7hk44btWVMQBJRsEPw0lV
	 4QFBPNrOzScG8vquXDKIlkluh17vV3iGGgWunnTlly9yKIYo37Sro5Wwa9iH3izlTl63J
	 AW6eXVr/BW6etyjD/5xIk1vttDjkdizE3XLtZbH19qi+SEE//VGAzUkrHzjPbf3xzK5yt
	 rns1lOe0NZAR2gmOtgJsH6mTKK7QP/nddL7j2oMWRL5oJbNYrU09RVbjZdKo7IDC7iP4v
	 PPuBuFXkFFWJtZqlkMO4DopKpb9KQuBY97bhk9gvM5sB21qJcuJC2LRF3Ue6g3kv7Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lCyHy7qZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GejysvPz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9A0606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 02:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A9A0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lCyHy7qZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GejysvPz
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1Eubt2376082
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 02:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jZGakksiT16L7VwD3yU9IXON
	c38dFFpjtCK73vPsBFg=; b=lCyHy7qZAbrfgvxkRgKTcON+7ExWcvBcBqfN+dyc
	VtUDL25cAEUF1PPP1l1l/gzWg/myL+jGg6ZTeh8rSzLZ5lv11tqgb1KanvxSh3x4
	WuJYQjp9hrFjsU57LumEKuXeL94eIQqhelPBaFs878O9eRH+s4ggN4DuT6M2B9K1
	TlxuRwH89IVWIIZboZwqFzEumvgFGbgZ+/8niGm36VaU0Ubnd/0SAdGheFZ8uwXZ
	Z9YxJG1wsuL9vNZozXMua12Nkz1kSjUxiXo/ECmF7zd9bgRk/gtceMf5de48HwG8
	bsYH1b0IqVomT0TpgfEX4zbtPIZJOZTAzlP9/V/hQNdX7A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmr9gx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 02:46:53 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso630585eec.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 19:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792723613; x=1793328413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jZGakksiT16L7VwD3yU9IXONc38dFFpjtCK73vPsBFg=;
        b=GejysvPz+umkrZWuiMJmqtrKZV6dfa3Ivos1Z94HH/zFvkgRAz44MhLeIGkis7K32D
         ZZ74oFG6WpchsSEocSf/i3hHFjAL+hnr58Baxuws7DrfUe5zNp6A2Bu8F3LOMQb9wCyN
         5fFIfiNGjSYPB9Qs3OBehABwDkxQASd7Fj6ymg+7fX2MbtPbYb6f0ogFN6JlVNLDC2pu
         91VTlOqhSFYzOqH25jDsAXJ4yrGUj5BMo8G/nMQkYhxcEuCVKWhS544JWz+pjigvkqnA
         IZs5MAjDVBtKDw2nutW4ahtS6jiA/ac9IZFTW6jwoPdgfA3X5vSf1VS1HgT2hwFylcGX
         yorg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792723613; x=1793328413;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZGakksiT16L7VwD3yU9IXONc38dFFpjtCK73vPsBFg=;
        b=bfC+PydG+8vAWu4mx5vnwAvqMrN9H0BKa+OIgPJq4MDyQWrWLOgQJlYSl4Mqyunu3M
         PWlpepyDcealZ0Tzo5X5lgZ9AheFinUlNySqdk3S3DY5+4siV56lNvzNzCs33CWgRLsI
         GJJ7PH1qvJSxd2mqzSledHBXzoVwvsl7agR6ZLHuEGAW3ukkgHJYJ0TITrEp5bLHkCn+
         /YbZ66MjCHtP2LGgMnraa01RdGXCdu0nQl2S2YkmW5Kgt/Ak3pTP+SVkMd5oFa3ky14J
         tlXl2UJF9TdDRmHLCe7tKFoWGgYFRTZHwz+wBwmZXqB4hD360JxGcuZmNnanOauHfnmk
         f4hQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnlvjBkENPv+YY72xEmLpprqPZ+QKdmxYh9gwcZe9Xd4tsOaMp5T+wKfOb48cyoX0IeonvjPfMWxUP@vger.kernel.org
X-Gm-Message-State: AFq9FYJOIR1PbmX/kdmAhsxGrjSclAqecmS1lU1oyYb0+ePWU9atOrJH
	rwLXXXxYyWKC7NohJIaoOEG1Cyy8333bGcURVtFuYOy0HFTo3TFXjoFBVyaGeG8xeUD23VMG2NE
	Phx/WRG1OOQ6yHjpq8gNQY41mvj0fyJPpv8UWJoe34K+BmYSP275hIiNsWkJqH4fH
X-Gm-Gg: AYBFou13KZ3Xpr/4652J6pyV8mJItmsHOWNdqdhxLLiABp67p0teLHVOfrGdEjwtFdY
	eh72JXGKhjBl8zmcmfXvumXrUXcybF4adNp1dwPMrTU2wtYwoZmMxYDY8Ppm4Arlpe6sBbkvFKr
	B11oPCkcKdnpynYqNuNhOrURHHT+QmxJXE0C2iaH0zyoXyPhM8iaF0YFB6gjS5+llAAK+eJkxw8
	9d2cv+kZdy4OE7ObqUYHrQFMNG82GC+QzMxyWUYSIioPDuzwX2brdvZsezincvD4R1GYJqsJDcU
	ERw3Z8BSkAwPcTUp4v+iLkZ5aH9osszFpdvgybUsGrRVABA0etnIU767+/t3oBFqDNqYTT8KMvg
	R0OTd/+/ySw6LYQMK1Q3GRNoeC8x3pECCt20QJNuIwQ==
X-Received: by 2002:a05:7301:6183:10b0:351:4d03:c6a with SMTP id 5a478bee46e88-369d96dcf19mr1233580eec.12.1792723613006;
        Thu, 22 Oct 2026 19:46:53 -0700 (PDT)
X-Received: by 2002:a05:7301:6183:10b0:351:4d03:c6a with SMTP id 5a478bee46e88-369d96dcf19mr1233533eec.12.1792723612058;
        Thu, 22 Oct 2026 19:46:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d5e9edsm2112066eec.9.2026.10.22.19.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:46:51 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:46:46 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3 2/3] arm64: dts: qcom: nord: Add SoCCP on RRD board
Message-ID: <atrKlhwKcQ2n1v8U@QCOM-aGQu4IUr3Y>
References: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
 <20261022-nord-soccp-dt-v3-2-1a69a4d54c42@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-nord-soccp-dt-v3-2-1a69a4d54c42@oss.qualcomm.com>
X-Proofpoint-GUID: FtESeRAsAMy6ISSvoN5w9L7y2Z6qbM1t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAxMCBTYWx0ZWRfX8pi7PVdovDSI
 AdG4SfxAvCfhzf12YFs7y7xHErDnP0IuDK31jSiUmgXTo6lXuavXkLReLyzkPMqXRG/LuvGZIV9
 zItPDFWpQpzAX11/QepNbbZP0r3apBo=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adaca9d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=8VUF_Pxp6yIriAAkYdQA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAxMCBTYWx0ZWRfX9A72uLvI+ht3
 UKbd40qPPKeOHA/i8DZeq4o3Ud3TJyZSXuvkvdn3lQ3OG1TKx8sVGHSCM+D/AF1iC3Gqf9HIkhA
 j+Ny1StL/b+cllIk07Tt0uXW2pFg+k6gqgFdOnd6YVO8LbbYOwzH30H2A2/cu1NAELIDOHjwzvC
 ePCUL1Slv3rvMHnOsCpcEJ6DE+W9p0KkHBPcTq766quQ5Pyp0ARVUxZnlcGcMp2Cahpys4EGxEh
 M96lKviDXJFVa52TiACk+3kkix7RRgfD3cGwcYcK0yJRCfi/TkNc6hXsiYbYY+0r2fpWNAiSR6T
 St5U7oqWBPYIwIDo2oVeM2riktPnUGDctiaTz5sfQR7bk54KmbSVDQiW2d0tk9gG4O/c02KRqJi
 nt5OeL68Up/WUAJSexEcmzKpKb0UErCKnBybc0VboAGJuakmLu7ALmIB608kbIV/tua/H7TFg08
 Mbi+UCEUrOuZUMwu/PQ==
X-Proofpoint-ORIG-GUID: FtESeRAsAMy6ISSvoN5w9L7y2Z6qbM1t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230010

On Thu, Oct 22, 2026 at 05:27:02PM +0530, Anurag Pateriya wrote:
> Add the SoCCP remoteproc node with its firmware path on the Nord
> RRD board.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
