Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704706;
	b=lMzqK8phaHdSWtrmtvlGlYwQdJv1jlTWoNmW1sEAWIbMQ/Xg2gIOOawKxJ56NSIjxAoo
	 JSVNleJ4ZgEWQ+qO23FVgn0yrbE0m41Gh0ic6ROJz8znjylmfqCPLdE3J0lywhm+nUUmF
	 aMVOq04hM5GUUFCI+t4k1++fMW+crd4vfOizXSmMHLQKH0YHdeFp3hKtf2MAl/Dsyce8G
	 pjXo47BEmd6GM0Nzon9XymG/jPL4//LVIkAdwI9tukS/wj60EsTq6Zfxt5hy7FOY2GGDb
	 AdqWHTkNGENKNf7p3sM0Sj68OT/F3TYi0URQ9bqd9Eo9CE4FTV8SO0nXrCdo8ZRMqIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704706;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=p3SN1D4sjrKdWgPAwPandAiNpKuWV/CzGULwNCRR7as=;
	b=zTFrRwQP6a0FdDryjy6ROrmarALjSAEo8c4Bx+xSzKnnHEC2nC1ijtR27cITUSzDARab
	 vAWrnH1FZh7GhRAZopZnVS+pQOIhJreVFv31byMG3aJH4N8U8T50F/Q/Y8pEPd/JocTMx
	 D3ShQf8jx0Pd1Vv3JNEhQRtDA4xEntSgIeg+SNCoWl/VKG63ArWwmxTZMyIyRTw8mTipq
	 E/OO+GCv6sXXTTP5DRrLFKT+4vpYIENTKOGsNBWmZQ33HEK7K0fWPh1t78H69qTen4dvW
	 QMbDclIzp5ME/pm5KLwV3Nip4Yc1CnWKMtu94FHvY1poAidTzZ4zkzX0UaLhAVW9crg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hC2qlaFq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="D6m/f5rK";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE37606A339
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BE37606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hC2qlaFq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D6m/f5rK
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEUmTV2649306
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p3SN1D4sjrKdWgPAwPandAiNpKuWV/CzGULwNCRR7as=; b=hC2qlaFqZwOOa5OA
	3aGWxXcsDHzEraTeaGDfzyVTeTWUwlvouNbM1DCReSmw9Q4eEm8ud/urX0nE6Ezy
	gCGTi6s4+r5f24n5AJUp+f+Xl1xUVmBIzQSkJ5LpixU1/3C11B59JcmhslIf+Gpw
	Dl64cbtu3rRIYd5h8mLuSseKlvZit9wa79dQMfY7LObpWJnY3hKaUp7Q0BcI7G+A
	4qrxQuXbkT7g/LJoJidVkJ+VWxhDsQ2BSmcTx/1tyVPWVyIxyoG00cDvSU08SMU1
	eG16GORB0Xm/uzwBXfYkJ7/JImSVk23YYwkuNrXaLskSRuAJCrVJVVDCrwtKK97y
	ChElFg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqg2wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:51:45 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eae4d7ebd2so258644e0c.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704704; x=1796309504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p3SN1D4sjrKdWgPAwPandAiNpKuWV/CzGULwNCRR7as=;
        b=D6m/f5rKmw359YmVBhAgoSjuDalHZx91kEPGZ2aOKFRd+40+ACxhpLyutKiLkYEwDW
         6vtE9x/pX8DXVms/c9+ei3U/CzCtk92DxswT1tVZyP1aE8QSV40B3Th8fLSeSUysjo2l
         S4Ga7DKw9R/HPw8w8GRsSb61P9aBU1zK2LVrW1R0SIsi/pv8A19Cu0R/xKl3BJqNkMOn
         ZPU/FqN/wH8Bj7R95HHDsoctbdJmxC7oYkSFTUt6LRoef4+SdRBX+YGvo80tyU21Yw9Z
         BVqsBX8oBAYqekSY07u6GOPKYcH8Dp5JeXjRjadxXgAi4Y9YeDf+v2EUWaTEwfbjSd4F
         y7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704704; x=1796309504;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p3SN1D4sjrKdWgPAwPandAiNpKuWV/CzGULwNCRR7as=;
        b=2PSW0q8TG2vRX8XmMiZRYY+c72LGflVBAzyxZgp5qr4ICD0CUyRwqs24Q/2GRhkYV6
         773mGFqLQ2ntwUoCApkDtURNxV1Vb+FoyiB8hhauG3e4jdphVh7JgaV61+MztfN4ZblU
         2R+Mk6DkCPh67g2nw18IGXJNjVnDCV5t9Mxk8HkDgPyy+ErouHEW3AI/o3MA5mjdADbN
         edwgnht2PCrOsDlkb3Os5EqZzyjXWa2XwGS3Bnrr88RfFJ+89rRl3z1nFdY8AifFhJYW
         izmiNlfikVbRI0fmG6GdKdCyJZB4kIsx2ouWw8Ds8ktBpQNnnf5ZwjWFm0tNZXNgrNQM
         2lNw==
X-Forwarded-Encrypted: i=1; AL+hErEX0O1ji84egKCu/a6Xt/ZxTdMwo0QZdU2VRHim5KI8JbagBCXMxhMxEeydT6DxI9al9kVzDeB6abmt@vger.kernel.org
X-Gm-Message-State: APuU4Z/iN3G67Pcqvz6O2oErJhP5w4zszUA0vN/lwC1eD3zcxayCAQgL
	/WzieO7foe8e02/ZJWc983/utdshOcaGZ5QwLmWj3yaa+s+ce+9LgMeGYcfb/2xhaNojw0pdu6c
	iVQZr8ypVfbKhvKZVlNVGG8RsqbzsU2+CAP9ysxlr3kxKBy/AzKYo9TNKgikX9xuT
X-Gm-Gg: AZFdTZcNv8qqLv97W9vCf0k9/jGXGA+JpwNfaIOiO+sUgN87234bNbVdWtrY+QsenwU
	t7eB9C7BxZUqc4EHArSbkLgsgHakLPYKHgqa91yzhg24FFVXGS6Pq6qJZbkS4H/x+jYPtNKmK2L
	JadK7y8DJJeAgnLm9L4WBe0WtCbuT+57CzBFuL3jgswF61Hc6MLke81MFqP3WTitZZGJs1T/B14
	qPj0IZeoRiYh4DVq/x1Xz4qqOGP1gU/qAgCnAnfk6dxAEcsoL8nUx0izM3i2rpX7gokVNpZY7JR
	49q8oY7hd2C3nLY6tYerjvFuXHB5qcQYxQD2CVOms3Dh32WXMzP94iCjZ43NZPU9razhCKlZjEO
	lTTCu6WnsAeyZip2wXaNLW9hPZJ3vzpOuHx9iIIKVtz9u7kYDePA5aJoeibiUYITnwYxm6Xk=
X-Received: by 2002:a05:6123:424b:20b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5ee8adf2d02mr13329293e0c.1.1795704704205;
        Thu, 26 Nov 2026 06:51:44 -0800 (PST)
X-Received: by 2002:a05:6123:424b:20b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5ee8adf2d02mr13329258e0c.1.1795704703707;
        Thu, 26 Nov 2026 06:51:43 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbb80sm9784877a12.9.2026.11.26.06.51.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:51:42 -0800 (PST)
Message-ID: <8e071cda-92d8-4583-975d-7f07cdd783ac@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:51:40 +0100
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
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: glymur: Add ICE node for UFS
 inline encryption
To: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261118-glymur_ufs_ice-v2-0-7ef4556eea15@oss.qualcomm.com>
 <20261118-glymur_ufs_ice-v2-2-7ef4556eea15@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261118-glymur_ufs_ice-v2-2-7ef4556eea15@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yLr5I-_RMw7RLbXaClXy9PIqmLHFRzSq
X-Proofpoint-ORIG-GUID: yLr5I-_RMw7RLbXaClXy9PIqmLHFRzSq
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b084781 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ayT878WuGnbjg-ISTX8A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX9tRUltCAySsP
 ojAcL7aRkLxfotemX7qFWhJjTbJ0kUJRCELZWpv2l5nvQZQN040/Z/2GnaaLHhAgE79NlddJ3xp
 5KN9nXTFSfnVAJEMpo+/uSvELEUJ1mQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX4seXbCAPthqQ
 yC6FtJQSqD0M8U50nlxkn7O/nN3dLpIdM46SVLQIqCg3vUINNEZaCJMaNnf1rvcZYZG9J47TsT6
 lReVJohyI+mQ3v01xgZkAIITBgHQT30SbNZE8T3yNUKMbFc6+7R+dNLg6xdICiatBK4e/i5o9zO
 yTmVH5SEugcCoUyQMQZGDfTpA4NwK1fcxLPMQZMEpfFTfNxhBdsJ5JuQJCuNVeLIqmwUiGkwwrj
 jq7fImRJgyG+PWqrUORGDtDVHwK9EsYtTfB+Fx7IPqKT+IqX73pI9akovxPWCAEsPbNjSHAoI3Z
 oQ4GmopjoS38HFciz+DWUs0NIz3MU6g5ioMlBPyY9aCNrUNFSi6JaGvTyEnpOGUFkE5rzm4qrTb
 YcBO7RiicMc8BUjoYAXpcpKPtRs0ZYPn968Z0xsUY++mWyieXwrv5xx68/ofGsQQCjo68KdIVgW
 W8QgX60Ru9kP1HL4bLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058

On 11/18/26 10:08 AM, Wenjia Zhang wrote:
> Add the Inline Crypto Engine (ICE) device node to describe the
> hardware-accelerated inline encryption for UFS storage on the
> Glymur QCB board.

This is overly specific, the enablement of the block doesn't have
anything to do with the QCB board. Mentioning you tested it on
there is perhaps what you were after.

> Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
