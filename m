Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD203ADBB4
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 02:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786674684; cv=none; b=bPRsRQu0Gi2kp5Hj3PkBGN9/ntFB18mgRIbZbdBXCFGZlj0VMa5uLxUOipnZMyM5M1vsCAF6LvNgYQrVVLffzbws0MTcPAa6/Glbwb4rxQyVuoWthbBLg5S1GUr27r3XTV/O7CltXB8xtL4w3oHJ8g2ukqZEzUEzyNq2XjE1YTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786674684; c=relaxed/simple;
	bh=HhWOBTKzXiXMl1fDzrQr7sosuadRo4H8j0vnv3wmWcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f7sTW2Kclajo3j8CvOA3Z4u1IOZG3ZBjFeNXmHCLyr+0doKqUWP0cg+R/yU6MO5T3kAQN2CYEQOwOWZRcNUGyTJlKRdu48e5l8c8ktq2uzNRqdeiLCKJkY6h02zWqYvqwGAt2bjC4A7PnUTyVr/BCmQXaai6mD00/+ig6NjSWFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cb5uATci; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NwhycD4D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cb5uATci";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NwhycD4D"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E19cLI551067
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 02:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OF1Hc5Uoa6cnyFrVjXhCW/ubLN+IGaBWjiwYGQl3IWU=; b=Cb5uATciTI3Q/NUp
	J2oUnd5E7hLpWVxMHGFTS0sVVFZKy8HS8eNbaGXFFNQNhNNpaZxSLKX8q25AOLWx
	IOkj7cF9wD0w8AfZ8HDeGYFlw7rjBXVwdyo1Ozi0qtZlixnorMCyZaHuqKbf9fZn
	1/TAuWmnMJ3dURKwJq5yka2YrAVUtWVngzt8fES2mhh9CBLkJU/fdjUPNDlsYbAg
	wqummnWO2L/JP3GBUKtyNJZf7+wSfmOGuodMviHF76Wh6xWYuTBPhQ+dGAdBF/AO
	HoD8enmJohJYMlZT2uIp3ui+4wpiEh8MNarCnf0OZ6+3LWKeF5T1DhrULRTCzjFJ
	4AH3tQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1pea0qb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 02:31:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso7949285ad.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 19:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786674680; x=1787279480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OF1Hc5Uoa6cnyFrVjXhCW/ubLN+IGaBWjiwYGQl3IWU=;
        b=NwhycD4D9E2QNyMknZzWR0BBFjHxU6zZlUb0p6vcyRGbmjysNU2G8p/He9m2UKszDh
         Li08BU9go9Kq/zRbegS85Ly3f4T+mxwYD66FUADZiWSuM8XWZUR8srffleMP5hdaWdIU
         S0hHAOy7Ru4kCbEKz7Si947NRyjMkyEiT6g4rUpfQGziwJR9QpWaskAcRmdjLENAmNRm
         1lUXIbw19g34jib1r50AHGsjONt9cAapIJ+desLl4oIAlno1F/anxfnDoX0C6BHSTCDe
         5PToBHqI28e7mn6M56t0u8fdxNAWwZuWsAyAGp+LPqULA8EUeLRazh3bsDpK2VLpWoMd
         YbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786674680; x=1787279480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OF1Hc5Uoa6cnyFrVjXhCW/ubLN+IGaBWjiwYGQl3IWU=;
        b=pl0xTL0zteNkAVkIqnmfY+J3jP2ON1cMZQaMCHhPaqQHAV983sIqU65ZWtptsfcqYm
         LBpVibYoeq99pUB85qsqjsEEhJ906ZCQrNfq/1/RLIX7KM5IHqYYnsbYFV/5Bx7KaXNZ
         tk+vufyLJYBIIJA+MkKWi7jaeBRLEFsoj8UkQPfoGQPhp5ssXyvDIiPdv5q4wvhN7zUT
         0rqUbLZBZdU3j3SPmHJ/1X1uhFuNGQ6z3HT7B5nPj/uVnMXKFGFMkLiuP+wM1qrdmL+1
         b3twDYYWL7InA4qQwfvxw99HkejMJK3cClEUPjr1ZvJde0h+j3atO7Ch08rjvnggwBLl
         LDEg==
X-Forwarded-Encrypted: i=1; AHgh+Rowo4MKXvxff8V3ACZjgPMP29m0jI1M0twXBOgOppx0kwYmTnFICEMuRo+wG0n0NtFWdc6q/t4M24nz@vger.kernel.org
X-Gm-Message-State: AOJu0YwHtfzuARNgko4KKJ0kiQbnvdvwKmT6fFxZ+FwANDofEXLTQa1c
	/WU5K6DetSBkJD6NyEHaWv+mksDNWpFMtxAg17pd0Y2qU/2tEdasftH59zCF5UtvQjWvBSQoFt+
	bcKQ2cOzucwznZUnX/dJ0zZe/kd5fpej6+9ZV0PbHIPsAQEDploZT/HXW/90uG+70
X-Gm-Gg: AR+sD10zv+hn0u+LTpTjza9Gs18xJM8g0u2fUkQ3WBEJ+SRTCZoXKLuOLJ10d0nTebH
	w8FVktOxxvCl6CwaB1yFGZbgUyuSL05kxckjWocrI46IOnvEuYlx7cCKXjoxdj8LcFPgTl8T/3s
	x71OyW3TUS5Lz76vf5ix/9Yy+GX9FWLSAZ8MVjYqIsxkquVA/rQHu98cnQXY7p5NubH5gXdtjfZ
	Ehxsn+umsRiMlENVxG8ming3HZfvHA3Zl/OIi7P/roWDXKaVJhbyohAIaPGUOfKHxxOFDCoz+9L
	SjXTA5vr5PRSUUkk+Csh3CoawKecuE0CfJ+b8TiAGeF5aFpSZ18RVuYfcyn4N0zqm3tTqhFWKKx
	3E+VOm3tVxd/ojL8iY8wQSfxNBIlmIIlvlnrQiwfrffl7R12qEiU0nr/a/8qnLYzB7y/Drz4=
X-Received: by 2002:a17:903:1850:b0:2d0:cc92:f7a3 with SMTP id d9443c01a7336-2d3b0801491mr31372795ad.2.1786674680301;
        Thu, 13 Aug 2026 19:31:20 -0700 (PDT)
X-Received: by 2002:a17:903:1850:b0:2d0:cc92:f7a3 with SMTP id d9443c01a7336-2d3b0801491mr31372055ad.2.1786674679694;
        Thu, 13 Aug 2026 19:31:19 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3ae7a4521sm3575675ad.19.2026.08.13.19.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 19:31:19 -0700 (PDT)
Message-ID: <c37708f3-5043-4ad5-944e-64ceedeecad6@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 10:31:15 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add QMP
 UFS PHY compatible for Maili
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>, vkoul@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org
References: <20260814004725.1368027-1-nitin.rawat@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260814004725.1368027-1-nitin.rawat@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TbGmcxQh c=1 sm=1 tr=0 ts=6a7e7df9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=F2GsAIeIfKtvr_1J208A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: FLa9u4gI3ttQKE2yArBJOiQQSQOaIN5L
X-Proofpoint-ORIG-GUID: FLa9u4gI3ttQKE2yArBJOiQQSQOaIN5L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDAxOSBTYWx0ZWRfX5J5WqL0oacj9
 ZBAqjKAr+DOnSxcsuMRNGyOvZN3bRw9ki4x06Wboz4uQ4xvWXZA+Og+vSecO5TysF5HFxNuqwRC
 XbhVdspTHR32xaiohAMKlX8B+8D7xmNtuJwj9GvOPDtNOA3eZUwS0TvxNW3rcrVzOgc9x9pDb1h
 Ec55mvbzsdU292nP5riUdQQNaJ6LWyqZStWw5IyHTnq/4UDbSGNSSHjr0569OueVAgKzczyGY/1
 srzQjOWS/u4EXeFLpuxrT6Tnbi9fctW9/ciZY7QUQjVHbU5M49w1LlxoRMqMVwu5BPfe0JubjLw
 pZXmedbwHbPIZsQwlHtPX9tWZdgDPQ/XXmnn/duLAPdRO0J0L/+rTqFCT/+f1TVYHd8ffxknv6r
 lCZKI0w7LYmKna1G7uHYuaQcAZ89PpVSiC/r6J+atVycVYc05vBNcovU9MixZwhG9hGHpUnbe0C
 0z2tIW7dor4bbjDQ4Ag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDAxOSBTYWx0ZWRfX7/3gKc+vd8RY
 VyktLuZ94he6+VVjM+bmQ61V/XamYMTIJkdMXKPpsw3VkJ/lE7pQ2Q/NM0kQtF7/bCGSYK09FZZ
 ARa7r8oSPiIXH8kgta0hB0rt+78XmSo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140019



On 8/14/2026 8:47 AM, Nitin Rawat wrote:
> Document the QMP UFS PHY compatible for Qualcomm Maili to support
> physical layer functionality for UFS found on the SoC. Use fallback to
> indicate the compatibility of the QMP UFS PHY on the Maili with that on
> the Hawi.
> 
> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

incorrect DCO chain, the last SoB should be same as the one who
send the patch.

Thanks,
Jingyi

>   .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> index 7e83cb3238ec..d94503fc26e7 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> @@ -16,6 +16,10 @@ description:
>   properties:
>     compatible:
>       oneOf:
> +      - items:
> +          - enum:
> +              - qcom,maili-qmp-ufs-phy
> +          - const: qcom,hawi-qmp-ufs-phy
>         - items:
>             - enum:
>                 - qcom,qcs8300-qmp-ufs-phy
> --
> 2.34.1
> 

