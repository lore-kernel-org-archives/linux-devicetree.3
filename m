Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968154;
	b=u8+Ft5ktchGYxhh3NCe8yBb24LCCOzIbN4jyYgLQxB7pY5KD6DzFI20JfUEp8ilaOAUi
	 oS+oDazBaMVgxl2iIAAUqQNWPSCbD2caccqd02axZa/w0Sp7M/enx02ommBVpbbD/6a2G
	 LQDTN5n2t/1hlSMU4llRQlO3lBIcGEua51dLXh02466EUtQti6l0U5N5t1zqtvVhdTT91
	 M9g1HHHo3coMqxm/sHwMJzugEn5L2KqCi/aVZ/bapxpyhP61RHxDBoU63BU1MmTVielXP
	 Xz8Ej5W9lyGjGCePxMzuhglk2B2XDrd52ZDNXezmzNizbmzcdiQ1MSgAo+cbL79kTdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968154;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cTQ/P55IE3fl7mkbvBy9Aon27LSao1cHBb5tYdZpUE4=;
	b=SnsDWmDIbSTYec1MyZLPprawD6H9bAZt7KKs9bPwqt8X6ihzylFPmgOkTzINE7UgtS0m
	 IANnplY3EUkLjja8Vj2RyDXwiuO8Fq7iO235edqRkIMWR1Y4KLymLif6I882BCCdcYHgb
	 edNt5WMz56AnKxT6n52SxdaDURBMaQMZK1Y4AM0GXJEmRTLipQHnyPrvD/X1aL78qebGD
	 L5/nESjdyaHfgbiBFjsDL/wA8NiUd7km6zwP170nV3b2geVxgJ/nCAvO5s3TUNIC7Fhvf
	 /5mjFw+D7i5NsrCZrB1bdCe67Rue9AqoxFYsEJm0SnuGW5OUe/FeEJlISrH/O8M4s+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H9R4ngRU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VNtFIQsU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EA3606A32D
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 12:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44EA3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H9R4ngRU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VNtFIQsU
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APJrJ2593318
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 12:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cTQ/P55IE3fl7mkbvBy9Aon27LSao1cHBb5tYdZpUE4=; b=H9R4ngRUG/g+2djk
	gHAA5lg8qaVWW9tyBja1g1wFNgobzGjZCWVMAjcUhV4/x3e/qMWqHlhzk392Wx4R
	vVMNwLNbtJ+OvaSEAn/0ScW2psBHKujdJ976kCrVBtu14Bvgd/Xqow6hVBqVR7cg
	j7VsiOpSxkvJd2VuG2tzjm2yUII/C8r14LfzPeUwN2ijEJjcOlViJ4gGFL2erE4B
	+LpvDmTZx+UxPk+Orz6bKwYGAz+cxA4xI8jBnBCFA4Sn357bkYuQFZ8cIoVDHtZ5
	g4wFLd60ixA8Zza1fx75T4tXsaEeMYG7ATj5/VViT9bWg43JJH4zjKoMVJn6819d
	aY2Cgw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3paaqfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 12:29:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb1091fffso9886785a.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 04:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793968153; x=1794572953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cTQ/P55IE3fl7mkbvBy9Aon27LSao1cHBb5tYdZpUE4=;
        b=VNtFIQsUBPUhEV671uYAvctzXnB+AHgyTpPcJ6HYWFHSrBVDNOgbky4VR0IyG1u2wk
         Nfl6hKxac3d2PbwtI8YgVF3YyVykYIE+vSl7xSABYzJeWD3xaORwMFqejA6gQmir0hhN
         w5V7TjmVc5MMUOQJG+WktgJAxqdkl4qVrKuAuOSZDPnpDKLqVqtDd0gTNT7SXfSXDX1y
         Ck9FtMTZ+UN0haD7nHx1kVy9Fq7RMpmTsMwPX3i3FvNNOH0QG24WqFSW35ZYeG2eL06a
         UIBvd3GSWMgZ4j2AS/+iuvBnzSF5ZFoolMlPhYzSglFgwHoaYn3xG16HyNrGhxeC6c4i
         rNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968153; x=1794572953;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTQ/P55IE3fl7mkbvBy9Aon27LSao1cHBb5tYdZpUE4=;
        b=aLJhStTeNrYMulUsOo0eDuWdEb2i+eor96nUfi1BpdFPIVmPHVkV+rQ4644p1xkJ4b
         BJCejExxOtfgi/x5TB3sorN7kP+0QZ+cacoSp4kGrbwJwM37zrzKjqjlGtVmlGn0BRyv
         PKeoEUP88y02vskL/TPoO1BZZSx3ssuNbFX5l+vmzAoU9pzg7YGLOl2I65e71m9v4ue5
         kUFJlQlC/qlQyB9HN+uomZVctrJUxy2Ax3I6BShT9avOqgcx9LlTEOlYHA5E9dLuHSbs
         e4Ldr0Yi9+JbHA+V6TzwyGixkpPcR6/lIeo2VNMPME5XcgNhPlsL72wPmQXZG6Pijy6z
         E7eA==
X-Forwarded-Encrypted: i=1; AKwUvBwLLxtLsPndm9d3zSOReXnrYOA3CeUpR2MiGHKqqsr4qQgO+/PMzHVSkrX1GdheMsF0SBGfxrY7xNAQ@vger.kernel.org
X-Gm-Message-State: APuU4Z9B+gjLS93aktE1Mg6kxw+LQsA3gEwTVeDFEclECqwVxfgX40PM
	u9kjThKvzF0gYGvZ2u5R2xYXrV9HcFP/C/1dEGmQmUHb07d/mN99Rdn8+FrkiorBQC/G5mQqdvY
	VOFsUyJIETWBtcPyJWXG4yMxsY1YJP45kIMRniVVkpDGcW8jwS0uxtkMwhvqUksgI
X-Gm-Gg: AYBFou0SUWdHCygS8eTNXMlOpLtpXpZyqGrwpiU3y0vxfo4Z0MKs+2GqJufVQTMq4UP
	N/Rk9bzsL2Av/3pH7V9nLiw7kEu02YAISZ3VoOOAgDU7wqCziQ7CSq6a14/dVkdTspeo7gyDk9M
	q/XHmAA1U4HXImkf1EYbgfyW+TDSZSNBw9W8aMe06TjVjUQxg2KgqoNBejjan3qZ/K2G1txYJzX
	G1Z7s8OCROXu4j/Gd2lG12wSgZ8wJyrUB9KnzgfprF+qltt7u06ruVOXeE/5zQQKWODrxjkJnMG
	VYLlpLR9zhcF4fNKkTzq8tfQRo3H8Ry8J46wDSioi89BHuu9sP6UnUKOJOeahGj9xu6jND0jqfL
	2Iud7Fcek9Qx3T5/jArRlKpC93TxP6UA7TWmQ9YP7uQgxziZIdCuNoZvo+PJLdCbkH4aFxQ==
X-Received: by 2002:a05:620a:a994:20b0:939:8148:1e3d with SMTP id af79cd13be357-945f33c0c23mr325506285a.2.1793968152538;
        Fri, 06 Nov 2026 04:29:12 -0800 (PST)
X-Received: by 2002:a05:620a:a994:20b0:939:8148:1e3d with SMTP id af79cd13be357-945f33c0c23mr325502185a.2.1793968152022;
        Fri, 06 Nov 2026 04:29:12 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d354ac249sm78001466b.5.2026.11.06.04.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 04:29:11 -0800 (PST)
Message-ID: <be2c9147-1c19-4dba-a56a-aae47b838cf4@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 13:29:08 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: sm8150-microsoft-surface-duo: fix
 da7280 pinctrl state name
To: ivanverbovoy@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261103-a1-duo-da7280-pinctrl-v1-1-be1a6dd10f20@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261103-a1-duo-da7280-pinctrl-v1-1-be1a6dd10f20@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: G5q6vNBwwmEXZ8yR7ntEJnwviT_3AmkZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX0I5JLj1ZN9Dw
 8+P99a+q3orJeINONm60VQC9MjCUKrWzcDRYYatP2hZugU1zMwykCNGER9Df8DejaImK45LexHh
 KXk1hiJFLj4M6TsGac7ZQJcAticu8HBujwtGhXl+/b7xeopv8bCNpjX1toW8C62ATfqyl++wC+l
 Hnu3eDLI2es4EaasmA/ZvRvZYArRHFd/KHdx6Kx6w6VcbyI8OQN37234WrFm1m6TNvKfQDk6LZi
 NNm3QyYWh057C7O06usVpyvIzbcmd6ja8L4o9Vn3Bqlo1tIRsJ/Eraxdg62EGDsAU/vAm4p/snQ
 tSEwmifSH2zVxXICXU0Ci6/AXomoSk7hHKmK9O4NAoOAZpZdtJ1YRQgjyUiblwkejtWu4q2da+L
 9HaUxkmIjsq3H04Edn/KQ/dAh0rXB/vzR8VcEG4J9gmZNihlmoZlvMQHvGMoR+h/KB6+zafcWpz
 Da/6K78N6ZedeOanajQ==
X-Proofpoint-ORIG-GUID: G5q6vNBwwmEXZ8yR7ntEJnwviT_3AmkZ
X-Authority-Analysis: v=2.4 cv=X7rHu2Te c=1 sm=1 tr=0 ts=6aedc819 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=2dXNOmNVTs6F5e4hHE8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX5L1jxfupkoAY
 OxuLifOmQ4pbRQ6JhCrkzR3Qw1uZEjPUSbj+kif2AEolKtlVZpn5xw5mgUk2eFfvVf1G+2GC74v
 v7XejR2H4xGCCTBs9v/MohPlY5woJr0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060049

On 11/3/26 8:27 PM, Ivan Verbovoy via B4 Relay wrote:
> From: Ivan Verbovoy <ivanverbovoy@gmail.com>
> 
> The pinctrl core applies a device's "default" state by itself and the
> da7280 driver requests no state of its own, so the state named
> "da7280_default" is never selected: gpio42 stays as the firmware left it
> and its pull-up is not applied. The interrupt line is open-drain and
> level-low; after a suspend/resume cycle it stays low and the threaded
> handler runs continuously (about 2900 times a second) with no event in
> the chip, which slows the whole system down.
> 
> Name the state "default" so it is applied at probe.
> 
> Fixes: d1f781db47a8 ("arm64: dts: qcom: add initial device-tree for Microsoft Surface Duo")
> Signed-off-by: Ivan Verbovoy <ivanverbovoy@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
