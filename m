Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222390;
	b=hISf8IRK5flzs9+//IiqSZtEnTNMI3zaecCqN7w1KWbyGqynCvtQOv8Rh9lLgJy0+bWh
	 zYJ9YbEfgQ6zi3IrSnnhD4OzQXVPpAJjgkGFvpTM7cxdPX7aeUN3JrqXoi7IJ0UVKLDEe
	 XjZxtbhcDh/eJyuIo9uFj20tpsMCREG+VWTMpkCkooYE1QAu1e1AuewVkMzfRTZz2NLJs
	 vITpJG0ADR0hlhcGFChEs8eKFPn9ObYatsaf6WAhP6wHwUz970R4klYJgXjz3NC9Ux3/q
	 kr5a18hCsQ94h2pfUiFRcw4/HPYhT0QC4LtrrG3GmtWUa0Ch2QC26ysBUIAtCDG2f1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=S15BuGKMUQC8qFDCp2KNUw6LJAJP4K8rlyz202knk8Q=;
	b=G0rlvGPDpcV4xT/zLWmhgLE+Cvm9lwHhcUajR8sPGkqOyWKDg5a6tfLo0wuDiRjCVRvt
	 Fdlccx+7dHz3jKcGpu/Ep4M2cI/tnHZbtZl+5pGIidQSyy1Ovja1gddqQEu5s3BpYZ/wd
	 T3xns+RSLMvupDIyGG1/m9zTHrNlbBzcsJQLZGod4wv9J8/K6I6QmELjojSOWkBtXadeW
	 xPJTvtA6kWXiOuZl4j6C0HziUOa8r4gLqUwJ5g4d2qCOlhlcwHxQMKbeaptm277gyeEI/
	 LHPMR3Yu8+Gb/uUeysTu2hqVStG1qGeO2lLoJWzB7q+AJrAoz09hmqYFitWm/tjSVvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nRkS0TO7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FM7RtreP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E073606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 11:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E073606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nRkS0TO7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FM7RtreP
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99un8Z899272
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 11:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S15BuGKMUQC8qFDCp2KNUw6LJAJP4K8rlyz202knk8Q=; b=nRkS0TO7MF+qY2hN
	q4vCsuWAzCc3xJRHF0iM01cb48E0wsANfmQtjKGnq15nZajIM/6EvDU4w38kw53c
	vU+Ma9dPr2FyvtGtDkzox4rs7CIrgXT1pKW1zIdpI6SP4COcwu2Omh97S36EN2HH
	mcasD5tJCOZLFJYbuxW58x1S4RontuFyuV+/LPO3XWCFK44dRlPJBrfUuEQ2nU6u
	MvS37Ftn4N0qk/MZjItIp7r2X40E50qNFatAdxSdW3NhVPPTnlMt7MQxZmat4ysw
	JrAfd4j0KyELZeyBmVkaEnci+/ebl77WFmFt9AYItBaujloW3SvJgj3N2MFw9Yn/
	Ll9hBw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf6c74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 11:06:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-943fffbc5dbso17195985a.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 03:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794222388; x=1794827188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S15BuGKMUQC8qFDCp2KNUw6LJAJP4K8rlyz202knk8Q=;
        b=FM7RtreP0fF0YudoAfpcz6PmoIkct9fSqvdhXamOp/pb2OJ2jlcJquyaPQ/FePvvK1
         FuRyweIZhpAf+UmWAtLt/aT8wZaMUhRyw0i+l9FgdqWmsGHo1XLdr9qyhbZVqkGRsErk
         K2KN8ZJzj37HopXNnuh0RmKM/LMGyHnq06Ty1F8iRuNFU5R91sziFGrsXOF3XZcK348d
         eM/lGsSXXkjO1vzkzRHo0PRZiS0XtlaBfZDxss3aVJzT7IaDe45Br9xBBX0H855v7tk7
         btaf2vuV1uCzog49Gt3nJc1vipibYkKbf+PiScLS9+P2rxPXHWqvXVT+5q3psDZZyWfg
         GldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222388; x=1794827188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S15BuGKMUQC8qFDCp2KNUw6LJAJP4K8rlyz202knk8Q=;
        b=nkRNqS8rUYoclvv53bYRume6zC3hbM6A2p2NJk5Btwp+8A8VOnIwPk5rZnGRxcEhmG
         BFoSwU+dNZ73Ea3VhG5ujrMYh0dC5gAV/Z3l7hQeiuAVRKFXqSajLtymrLfdtE3zmVK8
         BEAV1367aGAbQankr+f2vlyTBLrn2Xuq6raiT+T0Eagyw1ED+0cjlsTYw96Tt6s11B5o
         POAwRoLCkOFnUbhHErHZixCALAV5LCU5xSrb9iDBoHHglw7nrLbflpJtFrzBNrGZthV3
         p9KfGMet2PrLPH+mWWfreCTwasSNGGsMoKo9Lcxy0d+DRwd04GL/EHbAzdApXIFMBOMO
         KIsg==
X-Forwarded-Encrypted: i=1; AL+hErFGbWuenPnwMGfZ4YJbewzvu3n21sFVQ/zxSlKEyxajjRZcOqzC6Ik139Nv7vOr5NG83PvNJGPjVceC@vger.kernel.org
X-Gm-Message-State: APuU4Z/W9IseXixyzYLiocPYkEyK7/SUsKG7YgYpsEjxkOhmoBf7q6as
	/N5iLkBGTUUGKArbBS0Tg3hP4nmHdoYMGYo+7FyG3zVH6RezUTqd5TWywcQw3NuLV/j6RFS9NnI
	rsiFRv7EiW/uvsbs2FU33yRdMa0R5Le6bp+PdLHn5JHOA3tihwCjL8f+uEPjS2qad
X-Gm-Gg: AYBFou1LYachvcdg8qr2Ea9vJizeIbJq3UqcNdLqvijpn/vRIoz7IEsYPQfTbCiLDZv
	xdpFin+rkzNaWR6M8rDhi5ByuqP0MjDWBu20qiFInZQc5qSJ4rJ0FE5A1WgIETU7ZKc/VeKlMGd
	s691+7R8qIDlr4J0VA1NkW7SDWWxPOaUTBggihDFll6XPKzlzM4pR42VFaR0IqsB8gGHwxlpl9E
	jOFwEWfNsck7DV3++piBegpXiABpQ7FP6QsnY7Wz4AoCCevtBFpItgaaH8wjWM9cXW6Kd/UuOu2
	543wCa+AvqD+sNLyDcOxD+Jeksy0yTjLdOm8A5J3i6jSOlPeT3HQHU7UdgxokDjrIDYasvlu13e
	whzKwad52OwS0u3liqdWvDcDyJKtmYDs7PzPBStLABHSNR0rI33D9qoenlasHJKu9fXbe5A==
X-Received: by 2002:a05:620a:a41b:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-947842adee7mr514317985a.5.1794222388180;
        Mon, 09 Nov 2026 03:06:28 -0800 (PST)
X-Received: by 2002:a05:620a:a41b:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-947842adee7mr514312685a.5.1794222387596;
        Mon, 09 Nov 2026 03:06:27 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a999b01sm150435266b.77.2026.11.09.03.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 03:06:26 -0800 (PST)
Message-ID: <09cbc285-1ea7-4613-a638-6921afce71e0@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 12:06:22 +0100
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
Subject: Re: [PATCH RESEND v4 1/3] dt-bindings: arm: qcom: Document OnePlus 8T
To: Frieder Hannenheim <mail@fhannenheim.net>,
        David Heidelberg <david@ixit.cz>,
        Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105-kebab_dts-v4-0-c6bbe6ded92e@fhannenheim.net>
 <20261105-kebab_dts-v4-1-c6bbe6ded92e@fhannenheim.net>
 <70454ca2-3540-4cff-a051-758625be3278@ixit.cz>
 <040883dd-47a2-4401-9eeb-45478cbd05a0@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <040883dd-47a2-4401-9eeb-45478cbd05a0@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfX31BGX8YtbaRj
 apsczwE1IUpWZ5lUeay/KXMEvVfI6EzPHc9Ij/F8MtXLeaxoyMFc98r1AW7LMCrb/4qQ9koK5Zh
 XGFLWjLj2MxjDIw3t2yFYmzB0a939OE=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af1a935 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=WE8o4AYwAAAA:8 a=pw2Kr8DMFsTuVtHO7YMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=6aV5INxNnvWGCTbEtcBN:22
X-Proofpoint-GUID: _FQd4Yzh6sBCUK1C-CjG967kgxjLpQbb
X-Proofpoint-ORIG-GUID: _FQd4Yzh6sBCUK1C-CjG967kgxjLpQbb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfX2fskwTgLl1E/
 7G1kI4R3UJZbfP9IPgb48/h5+y1Gb9t6d9zE3WNoTD7AlYgcY+RZRRX0XCqk9QxlwmbRft2D9v6
 VqVu1hHmQUFiDXfZFkkQfCl6kZHdshhy5ka09+n1i0XUxcrNYJ/N9smsfqaUDFi89y3DOBNATCw
 QN5TZzd/ERYKNxsFMrQ/TJ2EDagHWs1Zf0EIaF9o92hTJ22NVXsBqU4jNOrAmEvJfh8Z0Gyds16
 BVmwPo5pNbVzzmXtQ5ZbPGvlyCUPSdw+CkX7ZJ1YGFHEUHFzS4/xpe8tjsM9HSz8oo25E75xREX
 Esevi7A3lnJzrbuJF1/mFk1E7X+HZ1CI8tEyrKyNO1Uaem5Xsr+2albvet/hi1KaMyjrAH8ZJ3i
 837/Kt1OguycDLhjZgqNzHqTEFAfdtEQjHN0uU5mMD0LhyHeby8iYLtoSUqI9/gPrVLUY/ZfR39
 8UocGh3qdeVgaOSU8ZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090044

On 11/8/26 9:58 PM, Frieder Hannenheim wrote:
> On 08.11.26 21:52, David Heidelberg wrote:
>> On 05/11/2026 20:20, Frieder Hannenheim wrote:
>>> Add compatible for OnePlus 8T
>>>
>>> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
>>> ---
>>>   Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/ Documentation/devicetree/bindings/arm/qcom.yaml
>>> index 50cc18a6ec5e..c21ef16e9ac8 100644
>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>> @@ -1067,6 +1067,7 @@ properties:
>>>         - items:
>>>             - enum:
>>> +              - oneplus,kebab
>>
>> How about oneplus,8t? We can use the non-so-much-confusing product name.
>> Looking at existing device-trees it seems customary to use the code name 
> of the product for phones. Examples include:
> - xiaomi,lavender
> - google,sargo
> - oneplus,cheeseburger

Indeed this is the precedent, I see no issue here

Konrad
