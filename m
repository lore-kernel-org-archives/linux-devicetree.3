Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027345;
	b=iKSD+Ssl9dispJBPM8uiJNkk4CglQvOIhiptO71opGmsXxsUmk6JMA37J1ie8T8LxfYd
	 PHTR99ImgdfEe5YiYmSyB3o93ixKzwFjq52j4621DNxZDqJEfKxCvbnm0uhOAYm1WBgpy
	 EfnzMEpc4L5bX2RzBMtWhZlNN5yS96EV1HWd7uVOe9KSeQBJTPZDXVs5ewbLw9PRggRW8
	 3vVml+QPTBUDeui3D5UXpIetAcPClxyC0HajqSE2OY/Za1SgMxz4leyDaSTCMEZhgyHaY
	 90P7Vn10JITYcnaDdEysWedEpzO1WWZxNpY0w/qKd0olrz5mQsLhbv1LDu5vtee7A7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027345;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KWMNpUaY5pYPifFWu/XjdFpZWwWZTStRMKXLqRxU7fs=;
	b=AjEJDJOFSx/uevhJsKyHzgWDubhafuBihPu1YuFGW1+AlMQmcz7gTdV3J264VxbByPax
	 AEkDgkIVApj+qkYkf8cYnuSu2Vw7pqutNQ6Nr6QRVnTnTuCTISRLHBNKXBW3IryuLeEnJ
	 YfHOa+//U08F86w9huWd5GJvl1RA3013qulE56JNt5kj4Gg+JN3tw38OugEpjeeYsofYG
	 bVi98hMjQYFHmHF8eJdb4KyVB4mDNO4UK5fAr1z85kFQXWIZ7ybGadZ6kvvMotYqv8YIn
	 VGgMcCPsmR9JFuExhlgytZ+JxeM9bZldN4QKdXDgvLielhwIWW3ggmgyMs6+/K+OCxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ihIRVT5v;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IuDxWcE3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1787606A327
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1787606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ihIRVT5v;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IuDxWcE3
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvbjw3618576
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KWMNpUaY5pYPifFWu/XjdFpZWwWZTStRMKXLqRxU7fs=; b=ihIRVT5vmXCv1SWr
	qXxBu0w5zJft9G1RPAp3A3HlGrvpZk/U8PBzPKBHZjWut7z3ELbI0NMoRCVUwd6v
	+QHH7B8A8Zxc6umqNjqRedI+ryjeB7aYD0HFesQmuKMzYetpgTEe0J4qkAbZy8yB
	fBSrPm3HglHIHR0Jo9MYBTtrVR+mUjLIm18bDUo/KMVdaXvBUljnQP+MXswXoXZF
	pzrrMmW2PiyRnaUZMLG0/NVCvPxAwtxUhNliVRCbZ8jCY92V6p2wvpKA+G0Qf2/L
	tyXCS+ERi5tb/b+Rn4a1BB9uXD8EKmAKaB0SyTsRiFOPfkQb2Wzm1oS6emdOmezL
	y6+0BA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj79xrhjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:09:04 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eae4d7ebd2so158017e0c.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793027342; x=1793632142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KWMNpUaY5pYPifFWu/XjdFpZWwWZTStRMKXLqRxU7fs=;
        b=IuDxWcE31f1sCReB/OsOLgJvAopz/3o52fw4rd7TUGs+fQnFo+o/pByTBJeh90kjt5
         GcTINtGUDWO1sGhvnBuCrwxRaOtuUbJOGi3OvTXw+ccpP03odd6JCmaUxdhlPOUMY9Of
         ivwOAvTjxtTrV9/1RDeFMc9h9Tkbm8I1MBtT9ceaAEriYQT8UYhd0IC/GcBASZKZXzTJ
         6Cf2jn8wgVAuTBT0bod4P2GQX3MCaSa8yiO7NnZpx4lOxryd1CoFPo8auNlB405Z+ZDp
         wLNDZl15mXDoYkM5b0fc/lJwqbKSnWkwF/1H/PW6gwjuWeYYdC0IvUKONlwbngfOGCD0
         6Y/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027342; x=1793632142;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWMNpUaY5pYPifFWu/XjdFpZWwWZTStRMKXLqRxU7fs=;
        b=Caiemb4YMON09W78h5jH86Sz9z/0kTL3G0meZlfzsbrnRGlyXmjNc3NSJkuZXpMrgn
         DsuPBOBSBNXhTGzvYNVwgXNpuo4VeAN1SUShmtOsnTUIyh6cozc1C3CHFkI5b8palM0y
         2tvDmLA+kgZLPNYn17aiMq3ukC7Nq5hR9rWGVxl6wz1ZKy0a94qJfChM/uSfAn6M9QVB
         SViQdHWfv3zMCLxSi6M428a3RV3nrRVVBMFh2nRrXOSdZ2L3afB9CRyg199Qcnrl7rvU
         ybKZjd/YzjiNQ0QslFdTeGzdQ+hRHAoLWjKtBzpLwo1Vxmb2XolDRP8xw5vbvE1GBXHo
         sx5A==
X-Forwarded-Encrypted: i=1; AKwUvBxIjwd7gfIR1gXrUTKlUMpu4+tdOqZiw+yzKEg3C62Lce2btRXx2tqoqujOBWeQ6BEegZ8wShwwCajQ@vger.kernel.org
X-Gm-Message-State: AFq9FYKa58TUw+RqsBtZLv7Wg4P08zfzQjXFz7xCzlbln7qCn7BsUN6T
	B1MO9rULTqY92i3NzX8yOiJl3BscDhFbh7R0M+ZeoeKWzALs1AulyfHgFQbHih8rKYByJEsp7QU
	QK8muB2OMf94g0Rz1tfLjPEXYOgh6SqF+0I0ZXJ9Bb+/JMJym8nhgnfkMZCw+KRJT
X-Gm-Gg: AYBFou1Xk2mhOk/+OA/UK+wjieq0kADmOMqT296d6mLoNUPFMyZmMsdBp/WUnFFU5Z2
	ls1zpg8+W6LkGXZkog+PLt8bBOoCFDr/PgubxeFAgfXM8BlgmUzgjBbwpQQsYCx1dQIXN0Rf03r
	03C/IN3iOSaRg2kAfFC3LrvBCiKf2NYoCyKX02NZVdOLSrSxvcqFJlod45zUxqpcgY4TgYO0o1l
	Vg/vr+lPuLZtv7v0DOGXkPki35VPetX7sM5J7rZF4d23/109ROXZk3lkEyPE6oRZ0DiFOVnVCWX
	kH6K+4bja0t5xdHnDWSusLpAGAAjHmuJPZf0IMzCoDADrjI/AQ+O0Q0txWT+WSKSBag+MpG8LFt
	J6J11ArKfXwDHqYQn2k/r3A==
X-Received: by 2002:ac5:c00f:0:10b0:5ea:e18b:16a8 with SMTP id 71dfb90a1353d-5ec22ec8268mr2282418e0c.0.1793027342332;
        Mon, 26 Oct 2026 08:09:02 -0700 (PDT)
X-Received: by 2002:ac5:c00f:0:10b0:5ea:e18b:16a8 with SMTP id 71dfb90a1353d-5ec22ec8268mr2282365e0c.0.1793027341885;
        Mon, 26 Oct 2026 08:09:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd798391sm332866066b.71.2026.10.26.08.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:09:00 -0700 (PDT)
Message-ID: <93418e3d-c491-4724-adfc-21e31904e815@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:08:58 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rubikpi3: Keep WLAN firmware
 memory reserved
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Roger Shimizu <rosh@debian.org>,
        Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <CGME20261022085853eucas1p1204878da3c0f519bcb39bf11ad84bd97@eucas1p1.samsung.com>
 <20261022085844.768508-1-m.szyprowski@samsung.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022085844.768508-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: egOJcQ92eTUPPip1T8nPWXmsiUyQ3RlO
X-Proofpoint-GUID: egOJcQ92eTUPPip1T8nPWXmsiUyQ3RlO
X-Authority-Analysis: v=2.4 cv=FPyOVOos c=1 sm=1 tr=0 ts=6adf6d10 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=o4Q9ZarbzXqV1QZr0XcA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfX06HmFYQ3CfqT
 4lzO6cwOnrfmqzOoEeWw1RF6FgDv6LMS2l26/r2P5/yIUSfz9zkAp9i/XSGgkjHahCQhhTRBZaK
 vpY+bf8neWhbSw2SjgreTvBZxP2bHTHZoTBQvOv4Lk2wLveVAgdGR2x2Iik4/5vCjOIk8fouRkr
 H3FSBnL93SP0HWi4qfDVWuHNbNXB3aaECZAvxnkAQLQT3doQ5ue3LEFAkJyUirKSFdBObqornFl
 xoSEd99WdVdlN2BSjdD5XgrqC9YFJrXlHPlEkhNu42IacwSR1UqpZPSxrT7G4B4FAL01GdiJe7U
 4A96FBiDDQRaJXg3cKlw2QFEGDDBOm1mvUdRbAVnXxqTiOz/cI1maNfpfeFj9oRSm2EY0kF3fjN
 vn9F8FRBtm5rWB1/jX2gcDEN04bPBDtf03II1Sz2ngdNv1mxEpYrWrL2GwAVfLCKKy6Egqc83YW
 dyf/h2cGPxZ6mxb0vhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfXxifE8MucSJuq
 vzPJh211SwAkGGoDAWxIqALiAutZwK5+aUdSh2PsKNpY5jdwlQGIjtXxn0lYPJj16sutfpZgTQS
 jvKpA6Ovm9PsZORw4z++bdCcyrzkAwE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260060

On 10/22/26 10:58 AM, Marek Szyprowski wrote:
> The board dts deletes the wlan_fw_mem reserved-memory node inherited from
> kodiak.dtsi, because RUBIK Pi 3 has no WPSS and uses an external WLAN
> chip. However the firmware still keeps the 0x80c00000-0x817fffff carve-out
> protected. Linux treats that range as ordinary System RAM and the first
> access to any page from it triggers a synchronous external abort.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
