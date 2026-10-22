Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659674;
	b=iKpd4LZiOdY6ZjsA3dr6lcqNX72+vBRsJ6AGJkbUQMIBwebBV3ecRl0zj5T4azly9tYR
	 uFy5kRoh00yASjzxu2gJPp9y4AyFvmy/U8R2yiDQp5vL1vSwaWeHdqBuT5/EF9RVK9Llu
	 K1DjM2qjZNvULPryXFaBxc8dNWN2YuRvUZabIXelw72z04YAdfCp9DK9gjov1JYvGJBn8
	 ffN4xiCB5wrPXU2HFJ9bR6A4+DuX+uBJbnI6qAuyUMVwxGS9dqV/7hpO2I5rvEPPigoLf
	 T7nCfUvjdto2NThmDI8zuWoUvfcfgrtP2w2Amjq/qgZrTLNXlL5gTSt3sm8D3iBv0WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UTRFPblkLPdvoWYM9/wAHuv2GDi6sap0sAr/jdJeU4c=;
	b=fANsC3QjAKLJqrJzHCsdOJL8b5kllefXNaPadonHQ/l3Jdy5YPxdqRWv92UEzFvYw1Tk
	 ukRf9NYmMzu3OF8nAerb/GxSpJHmHK2Jm1oVm695LUncQMeUMr7Ad/5aY7byikCYsS/Ou
	 bg3kNkCpV9h1uZs6B2OFT29JdRoTq1taVxMSbiC8iK/0jfiaAOVX7rbMC3UWdT3dpMnjr
	 mhxs+ogx5Bo0oXyLHcUNcuV378b/cZzVqOIMq5qFkSkgmrNzQptdoY36rpQTzKkMUYvv8
	 10bBvUAUw5fjuWI/QJ7XEkE6mDUHGa7SoGgoi6ISkYsWcOitTHtRhmU+8FdFPdxFQLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4GcoDsQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I01lsz4S;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4C0606A31D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C4C0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4GcoDsQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I01lsz4S
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7Scb33654511
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UTRFPblkLPdvoWYM9/wAHuv2GDi6sap0sAr/jdJeU4c=; b=A4GcoDsQ3s1tLMOD
	93C9vquARc5OZFaKq6iSUo39AkrKSiLRQJl0ASUrpurgKJT2EXSCdBcxmc7bfgo5
	hgWrzVI9CK0P8ShQdwpezUPELk7RoqBpxpLdMEAEZZJHDmsUeV/693eIrvLOWZdD
	pyNbAdgrHeNRVqV3FTTn3DK9NtiRBi8pW2QryzxJjGKJF7KIeMjQQndxon4edAJE
	fk+dRl9VMn6XgAEfkYaFiUvgcs79+wdpBkM+HzCSqbyhkLfjIrA0Pl121T+ZN7pp
	HRwzH7FWIK0VJHojiy73L0ie33Un9mKRH6c7YPV81rmbbVeD539OvuJQAfa1Odp3
	nQCs9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93c9hea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:01:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8a9cfe6so43711785a.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659672; x=1793264472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UTRFPblkLPdvoWYM9/wAHuv2GDi6sap0sAr/jdJeU4c=;
        b=I01lsz4S6k1C/fgiDZ6qSLL39pagh7fCsa5rxqlwyEeQq3EAA+JznN1DDduVNp+OzB
         0J0Sr2OfJL8wNo7P1YdjB/I4bax8FeSQRxY8oU98/Gct0LTSaxN5PQXcZNm+DsRZzmyD
         tm/tEIEdOqFrCObLjhJoFGzgXDHka88OUBXbbZYG1xIgJErKi6gVjnZIcCLVtsTb9eXl
         WRsZ4DcWBMJUqpQXCbxsBI5cpevkZuhCbTFLEhHbV7MVzz6qBfSTegYJyXfessEJhGdJ
         YDfJiHetQhIEX6TKgmlZURdH2e/MP14HAIGBUfFfY6d4zGbfy/rsdrheOB9Onr2AsURv
         Jpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659672; x=1793264472;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UTRFPblkLPdvoWYM9/wAHuv2GDi6sap0sAr/jdJeU4c=;
        b=NJe4dqAPflpbF8pKEEtdYEeAcK/BDabExvjqhHcnXp24eDT7cQwpkqBscD+NieyCf6
         vN9NE5TpPETZKXziZozeXoMyTZ8gxQr2PxaKGp7DlqiE6raegSoxB3qYHD8MyPBnhtpG
         BQZx3/kWPUotroTyjkJEg91bqy61L2J0t9cRKxIVC52BjoY1SggXBaVUU88QCKB0GCtB
         Puf+mXUJmB7OpNO5OoKBm1U8ZFc3T/VS+BAbYMEFXXQS4mjm9lM99XD361NoL6JS1bbL
         T6BgJ7D8ZJgd+gqWweT0vacIR0zpFUfnpkC7Q7vMEDBfrAGVvUaH2LxFSIOsH6PZFs+Q
         Qf8w==
X-Forwarded-Encrypted: i=1; AKwUvBz46oG+3QgMWZxMd3z6gOJPqspEzbmBn7W8m0ZSZ8h3YfYSRBwkiIUENaHn93oUsgAcRvQpzEkePdbZ@vger.kernel.org
X-Gm-Message-State: AFq9FYKiPbRlAdzEqT17HyIWk6AOP92a5OLgU0L8m7yMyaE17p67/d4E
	J7W0xca2EtcIsf59liR640STLT9Xr4eWEFyyba+c1B8mqw8kaXzVDvIJb0Fd3qnPDXSVafkNxTr
	xUWjyl5BYloBtJi93uwPWWsHc+8C9nkcBH9NR1dqwPSKDiiqiWNXfvPqrH4lIRoIi
X-Gm-Gg: AYBFou3yA1Oaz4kBvFc1Z9YKSvhHZNFxPX6bqR7oM1zoaukIzYHriPGfnOHxx5NPaxc
	czsbyIHUnVJ1YD2CZ4W+YqU5VjmJ+AtGHdwmjBldWQ2RHwLHXkczBNV6KTjsLNok1HaMtRvANf0
	C7ejZYiiGAov4eRtzm0aJV+5aHNyll4u2as21IBHBvnBlnijgcm1aEydPUbTnBjIH8+B7zRv3N1
	C5zLlRuSQ/EQpN78GIgIqEq++r1FrKCNYjdVGhJzUeBkPoDIXtzqc6Z01cEgRJ55tUxLVpzj3ei
	cQBHoRuRJpvGqcYRz3ssYpeelnacEkIoDZuK1NATSb2ANanCs15q9anH9v8xi7PDgGVCqgIuYIH
	NhXmTzxIXLd6iFrSztoePpg==
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr984417785a.2.1792659672286;
        Thu, 22 Oct 2026 02:01:12 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr984409085a.2.1792659671687;
        Thu, 22 Oct 2026 02:01:11 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a4ffcebsm83458666b.30.2026.10.22.02.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:01:10 -0700 (PDT)
Message-ID: <6da23245-ce68-4b61-8eba-323102a5b9fa@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:01:07 +0200
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
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: Introduce Maili SoC
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-maili-dts-v3-0-8b499e7b9a52@oss.qualcomm.com>
 <20261012-maili-dts-v3-3-8b499e7b9a52@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-maili-dts-v3-3-8b499e7b9a52@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX+TeLy7gnpU5T
 50SVX940Vzx5P5S+qo+lv12z8eLqv5sYXGMdsSp0nGQypZtnIUxgv0HQrRgZq5VA3QwGtsqbMmh
 gSwTK/R1WSmThGaXzeEhh6rYM6kalgw=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad9d0d8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1qrlJkut239GXpouHx0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: unP8pOkh2SEHlcarvT9ENjm_Yg1_w0Y7
X-Proofpoint-ORIG-GUID: unP8pOkh2SEHlcarvT9ENjm_Yg1_w0Y7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX1JokCVyLTlYY
 iyRBlfyWyLEzULiuDsPMyCK+j+a/jmFbHZvS6VdAFlVPkWnyzVQkokup6XWb1NPC+URc8U5jcfD
 DD0BZyC6Jf6XACtPVsnAXG5n6swCwF1zadLN5nXcMDZnLl9evbpdzf6bEEZSLrw/BCH2N4YfKO0
 pE9PKf0nQ+OlNZDk4bgZYXj8OG/hq/7+iZMkA+Oy9pwCRNesSHFiQgAd5AeDdzHU/+kA9bCbQMq
 p6QDdmE5AnZXwb1ggYpZzW8W/ETnFW4bl+l/GzhOp1mmszqRBVlEcqA7sLZcbIFU0jco6B0HG3U
 lVfut/wN5NayneTMfPdEtlBLnZA4Q9h63fYPwNOPQoi4kCIbtLgC7PO4JvnBcr3QU4GIVE46E4+
 h4fyQhqpcuaMEt+CK0jlYZPWgQf8NTddBti4jBzy/U6YcN8YW6/A471l7OtxTBq6WZVgNXdBRmS
 DmQAyYn7Br9s+gVwTdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220035

On 10/12/26 10:32 AM, Jingyi Wang wrote:
> Maili is Snapdragon SoC from Qualcomm.


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
