Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645D43ACF17
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 10:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785148948; cv=none; b=eKlZB1GwicDm8hMp0Z+mBm5KVgR2yFVXpCVjkRF4IrpZWxFET2TyQlGS2nRMYbRGfwjXyfKXITn8wzJUujM8AVdAt/UAHAytjSO0zDVwI6qYNUgB+4MVxlAk76N+/HQ/z8wJOPGzUUsUre/WFS6TXODQb4HhCxRCtqUeCR8sWQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785148948; c=relaxed/simple;
	bh=CtdYiuS6QtS3lif6AWyX2CnruS6hM8a+okkptYQVeAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qEcUSHYboxVVkuR4T+niics/mZjX/TvRh/RApTefRaGY/4iukVfCTEF2WODHBjYcfS+8z40GBUE2KrL8pBzAEUs9meTiWnUhU7t6YQ64LK6JWYn5Ad6HfRPDWlEBuFZWHzCDukOkVAX53UQ1z0XjONLF0q6Cv2rq53jkJ83azzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J4liDmZl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kLPbxpaJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J4liDmZl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kLPbxpaJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RALwJF3355497
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 10:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M4oHOytgcMdQhAoK9f4CiACxZmWlqT4sp/Gde6YdyeQ=; b=J4liDmZlG2B6WpZe
	LiMQMfoX5fO0dQ40W2U+TGYvRy2TKFtc+cd1vbTmqGo8rIBY91KNuXIUtQahxT5p
	0B3KgZqL+xA34IZYnYfvY0MrFWT7+vfRCeKM8F3l1b9uWIdz/fhssrveF73a9/14
	9Pk7vli9VcrjdDgIOiTeUBm5Z3fWFrYeSHzWZo/bkFwJdFPa3Up62i/EvnxAjLj4
	B5nvt7FZmw+DvsE1+H+V3cgBTVrP7kWP702YuZRUp80/hhATaxCBA3H/UJecod4g
	bQ9269C6WYu3TcrDRUHbZnro+aVcNhRzdNM1jPEm+EAQyTnh5K29N0juDmoviYJL
	LOoxmA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4nbraf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 10:42:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so40028255ad.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 03:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785148946; x=1785753746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4oHOytgcMdQhAoK9f4CiACxZmWlqT4sp/Gde6YdyeQ=;
        b=kLPbxpaJMt20WLVTgt/2I5Qqq/FgaCa1BSCtuPFZYwDUqDDYPZNRwNow2rzfgfMKNu
         oeOPKGtqcPwqYHZyKh12s5BeiDLxZxUvcaEn9FaFQubYAgBzM7OqbU8kg3CBcZZY8WIN
         iORsNFDaSbQYaqz9cqfHyRdSSUf7G3gTzgwB8FnwJ+enZurdVJSr1dk3pKBN5TljoKlM
         85QfPchG/UsHZrUCRID2ohQDJZSaecpXQ6RstkTCV+KAKmzAnEbZ9nrfzRJ38IRccfev
         eNAWyId+5nU6QFhZ1DJQvD6uVgAmXv1+r7OSXjRe0aNiexwhTdr7NCG76437QUc/4PIB
         ZtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785148946; x=1785753746;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4oHOytgcMdQhAoK9f4CiACxZmWlqT4sp/Gde6YdyeQ=;
        b=TbqRxcQCLVGOG0L/++wnPbLXUkUTpWRcLZgVyEzP8x4ITiJt51JUeHBKLzfAisq4Pl
         4VLMtNWDE0822i2sHKvfQanxRC9UYhUANBhkc3SyWUkynPReu5O1TlZ1m0FonYKjksP6
         fpCFmDez3tEFLYxcN8XW5WHtXj9AEbDBWk6OO4HM062Ouhjxnzu7nY9Wgmh0ewnQNIcI
         kkBYkrNK1sPZZa6pkZsq5AkHuG4RjlYwhaYH728xxqqIsiZm7MyokdXjMlB3LlmgY8Hg
         z/14/pIj+wfhiXxkJHZV2YjCQlRo28L8vwGglBBigjkdngAl2QdB23QlImRJPwT3fbgQ
         xWZA==
X-Forwarded-Encrypted: i=1; AHgh+RrndBDP8PpeUNp6fMzk84i2KnYhZSiRETo93R4zX4u6ZtP9E3hZaKvdIaB60rYc0PSL8xFFkCCO69Qt@vger.kernel.org
X-Gm-Message-State: AOJu0YwvQYu8lKj/pk6zf6TryphqKHrvIrhTbWXnhv03pqb6k68+TgSZ
	/fdexo+0iBkuCxoSlDTLcgyFzQpzSlUVX3bgwJtla7ob1Z3h8Qy4o4KNvduLgFx8bHjQrKSWPck
	2dxxukCk3oljKrKWQpKfpBh64ckYw7vkT6M74S4WrfNnDDclC8Q1W6dqR7MXcEM8h
X-Gm-Gg: AR+sD10vvsCweWWLPYTnb0Vtt5fhMtniuz40TJyPlfm/qBOx+LKecEIiP7V3hXMFyxf
	tx2rM2l0/Vpyt8Ko5PKjymTplieeWAD9CPqnSmzu2nv7503Gs+i2NTlnyvlBgEjsBphxE68PNkv
	0c+8d9M3+8qsdYwWmNLeiJ2p4DBgA/gMUbFLbEuB9hkUTfSzDKZWBOGbU1Apyx31xtNSLq/L7Ij
	TpmSJBBt7eW+TmTO6S8cweAsEuK3rhsJoDjRSQnxE76/8rKO9cQsZVQWeKm26O7LCje07FBgKIZ
	IkA4OgPq6RsgwCnCmAtQ7U3HvmCBcrRq5uw5ucHaLt5RG/3ybAbY6AUDgdAREZ4/Sbit3qh7uxP
	u3dxjDdJx9nwpKwHkFQ5GGsY07xpO3ac=
X-Received: by 2002:a17:903:17cc:b0:2c9:d56d:afa3 with SMTP id d9443c01a7336-2cfd717a2a5mr95672515ad.15.1785148946095;
        Mon, 27 Jul 2026 03:42:26 -0700 (PDT)
X-Received: by 2002:a17:903:17cc:b0:2c9:d56d:afa3 with SMTP id d9443c01a7336-2cfd717a2a5mr95672225ad.15.1785148945526;
        Mon, 27 Jul 2026 03:42:25 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b451sm33396585ad.13.2026.07.27.03.42.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 03:42:24 -0700 (PDT)
Message-ID: <5b72725e-dec1-4f66-973e-d7620109800a@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:12:19 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: crypto: qcom,inline-crypto-engine:
 Add x1e80100 support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260722-devtool-v2-0-d7e609ef7388@oss.qualcomm.com>
 <20260722-devtool-v2-1-d7e609ef7388@oss.qualcomm.com>
 <20260723-impossible-invaluable-sturgeon-3b2ce1@quoll>
 <0971c95d-d848-4688-b67a-87b8488fc9b8@oss.qualcomm.com>
 <674753cb-f208-456a-90ba-a767293a8935@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <674753cb-f208-456a-90ba-a767293a8935@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _jr-90mc_k3Qc41IE4agpsLlMh4iY6LU
X-Authority-Analysis: v=2.4 cv=cJjQdFeN c=1 sm=1 tr=0 ts=6a673612 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ULJ7MOq4zP4UxKEn85kA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEwNCBTYWx0ZWRfX6u3cZ+dWBh3S
 iX0O84+xnct4PvMhwRmK5YQNasXZX+wNUWS8xbh8TdCjnnIB52f5ZKDdYkp2mL6+oMHHOyEN0jp
 r38m8Km8jK3vvPVC+lWRRibhJGPBmC4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEwNCBTYWx0ZWRfX3KqtGnJeEE6Q
 EjQfwYY8c2PKDwj3p8Ee/OUb4CNNgRGODS+FgRIflKJiu/ov5fHCi1BtCBhiu2+zeFKoeA5DVVV
 zRlbrPA5Cxjc7KbheCH6WD1qhMW4XL3KbLtLKLNnfa+NoTQdlge9xWFPoccsQ6v8pEWIPdD5KSf
 1cTuFLnZANQFY7hR6ez/eojNynijOVsfksP6wTErZTIoRonximXFWv31KDjfSxrdgIS5rmijkuU
 s9kYd2nq7iVG5M1CD7cvSuhsRJplLyG6jJRizM+HEmQYSMKoH2U9732DDUPFhW9rYPrOUFXHJso
 kWuBh8+3Q/iCKH8nOttNUtDBm71quvWT9BbF1EFu2ZZ7zTF7P1NCn9FqKI9OQ10o3fD+RGV5Kiz
 NoGl7It8LF22hhCUTDGMoIyt7wjEsX9+3slszcs4aqEXpni8mCQmNSb25+dn4Yz/kpabOIkHB3b
 d/JGDJ4Dg1QLeINnqvQ==
X-Proofpoint-GUID: _jr-90mc_k3Qc41IE4agpsLlMh4iY6LU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270104

>> I added the prerequisites and note information in the cover letter. Here 
> 
> That does not count as it is pointless.
> 
> Which maintainer should include these prerequisities? Both? Then patch
> is NAKed as DTS cannot depend on driver patches.

Hi Krzysztof,
Seems Wenjia rebased his hamoa effort on top of my work[1] and as per
latest update, Herbert has applied the dependent binding change to his
tree[2] and should be part of linux-next soon.

Please note, only [1] is prerequisite and not the entire series there.

With this, the dependency will be resolved and rebasing to latest
linux-next(with [2] as part of it) should make this series as standalone.
Will let Wenjia drop v3.

[1]
https://lore.kernel.org/lkml/20260714-b4-shikra_crypto_changse-v4-1-06a4ea97c209@oss.qualcomm.com/
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git/commit/?id=3360fa7604259a0341a9bdbb0a8cb0fd7f3109de

-- 
Regards
Kuldeep

