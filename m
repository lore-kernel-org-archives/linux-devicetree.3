Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B775217F27
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615102; cv=none; b=fYC7KAuS3AYOT5BViAzvhRpyp7Qetj/a/4W4Hs+eSXgZuaXCxTxfrun5fv2h8G9SVVKmKXYgXUXJN8CIYCuyDA9N7SM+qfM6HewJy+N0jcM1yVuamF9EfxlFfzeM6+gCYQNBBn9yoPyptFcex+xjAPxYHDkkqXMnsmQLGt1jACs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615102; c=relaxed/simple;
	bh=2e/we/OejT8jR7LpR46W/LqsBN/KR3kZ/VKrfYK5fN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=o91ZcJ7JPZD88V05QVKQQO074GLohnKXckQ7y9KB136E5PJYbUl8etnq77Dlt+wnEFJXEZa/3sc8fUD888U21NEYdg5cAx7eDYSlWqFz9sSEUr16vVdYDP1C1qFC3PkmSjCRvjDwyckI+AH4HOlYCpT2aQtsF3eoL2oORWe9J68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l/9oU4EV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hdiAeJcp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l/9oU4EV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hdiAeJcp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vtSb1226393
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8lTJiQQbjA6cM3TQhlJ9uuo3fVulj9CHLFEalD5HBZw=; b=l/9oU4EVMOsRLZbY
	+sqa8Rs5BFo+7OWNckvKcMt3JPLAEGkgelfNfeI7DcBi1DNf8dWC5tccVkmO19nt
	UrVbcbhEUH6HiUwhKVAKk2x2lX5bGbm1vDnyMveD3kNmULOpb2hMeyovgFMRs+Pw
	m4J5xWvlW17piiQEl8+nubxZlGIMjNkGTTvNjIJbdmJiTczL13Q6WCP6QuDyMVNG
	qp1uKB3PxMJoOSG9xamgtpDxJVDju8vYWhcUU04pucj/yG0n+vaPuJnoAdKD+87v
	9uxeuEcDb1N68N9v/hITo4L3Y9QG2LWPVGKV3lL3rJpcmpGthOu8oijaPyxGYZ+F
	KgTbOA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59r1bj3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:38:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b86b756c4so5960401cf.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 05:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774615100; x=1775219900; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8lTJiQQbjA6cM3TQhlJ9uuo3fVulj9CHLFEalD5HBZw=;
        b=hdiAeJcpszelVofEbQkTPdiMtkrCAix3Pxz3wyjK///p7wKgvZTTM6njPKxh+Jhh02
         regTfmSQ86SppPOTa95GnG36mKEf0YRBc4ZZdYnI+cXxXahEBsjihXstWzqDYQUw1K/x
         LFbotFYjYNC28sfS1UfJx0f7f2+4xW5CFHPpWp1vKbeavOjlJz7f6i8+Dii6/LpkgEXQ
         T/WPXax02Aai88tzRxcVSmmU6tb1SLEbwanPhymrRBFw4qTuemQAybrHvBO+ZMLOCuU2
         i14EuERgubSkevpFIeAnz3AdGxLPzOwXfqTFkQIVd0/owKGVnwpzV7DuSfFquOht04zK
         vdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774615100; x=1775219900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lTJiQQbjA6cM3TQhlJ9uuo3fVulj9CHLFEalD5HBZw=;
        b=lTqt2fVFcSnSslmm4G7+od/m3rpMroCufOrLkdtHPS0AEM3KshDF+cgVWjD8KWUhFU
         SQ3bnx0IBUpriIDW6B31a/i6IO7RK2eEHuUAykWTfSR4wUc/D1ugAECn2l0xtBlnBDcu
         077W12xW9gdvJZb6Efr74Cb8ZOl6hUTDQKMNuObdfgUJ2QEGNZD5xdXfEvOlETGN6BTE
         QGTOk5nBHKM3vttlVwfujtnfqlDfsRPTpCzSXodiT3aaCF+88O100NOpIUPLE6zjqOzs
         v1oJW6FnkDRtqLZaPav/Ovnl4fl0QlDUZaywvc+Y8qvWEbqa+zQcIVbyPz5mB+swCB8V
         PBvw==
X-Forwarded-Encrypted: i=1; AJvYcCW4PuMnoq56v6icS5IQvI10QuEdNf7QpQ6cMBExCvMEj7LPZph3zOy3GgeaRpAaHvMf3zZ6GXBmBYJX@vger.kernel.org
X-Gm-Message-State: AOJu0YzxTps5Q9WH7oSjoGbtQlSN13YKhESxMZ0hXMtargIrF9QgZewm
	dxioxIseyDeWcxBTixuz9PhV7vz9pwoMPj+HCUqdjjXDtsYu43LNZCCeVS/l4kOLxKdL/iQX/Il
	N6FaavFtYAp7pD5SwAq3b9VZg0itkLJRer4SyMJZiB7ekSzzuKxB7cjL4H9ZQIqak
X-Gm-Gg: ATEYQzx3EH4AIk3HyJlFJXV1kKkNn54csVaApZtelpDqAlBm9oL3a/G1Qwbx4vomTuc
	1aGDfycCEyKDmp8VLh7/4aQl0z6rvFc+GcueGWETDikG2EBZLmGg4xsycBXyl5VxSn/zKE4wR5X
	NL/27P1l5cHqtiyLl9gRoFgucq+V/gJ+eYCRgJIQ50d1lkJ4g0JtEYW+bXIw2MQ6F+60Plw3NV5
	NpZr2pgKN7f90NpK/lG4KG404X2FVDKlcIRdC7F1b0i8OKanzcAgKqgvolwgORwonAcVw1jD8bk
	qbzluMAmrWJ/2Eim+bcD5spV4hazTc3yv2vzHkHeMCQjA2Vy9fWibZyNuT6Wkm9ZJdhPeKvyK0+
	b2VZiw4w52Xn+SzQx4UhNBeuuI+x+gS8eA+MyYV90cNJeDJIhrGENOC/SS5rrjKWjCQRTFymQsn
	q0CKg=
X-Received: by 2002:a05:622a:1e1a:b0:50b:2972:4bec with SMTP id d75a77b69052e-50ba3858ba1mr23296201cf.3.1774615099686;
        Fri, 27 Mar 2026 05:38:19 -0700 (PDT)
X-Received: by 2002:a05:622a:1e1a:b0:50b:2972:4bec with SMTP id d75a77b69052e-50ba3858ba1mr23295851cf.3.1774615099232;
        Fri, 27 Mar 2026 05:38:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20445b9esm239458566b.62.2026.03.27.05.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 05:38:18 -0700 (PDT)
Message-ID: <4ff355a7-bf1b-45bc-8a72-aa773dc95582@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 13:38:16 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add thermal sensors
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260327101225.382493-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327101225.382493-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4NiBTYWx0ZWRfX5CROgXzAGLQE
 dXAsB2+Q3pcmlKJMpmgNr39+s3LRvl0DpY86FQXgsg9ws72O/TpybKuvpmsA1+nrSxkhAJTTJFo
 EJh8ctlFrH3V4CUtzB0o73itAuOuQ0hB6jLZP6yh3j7NkoLqe7x6l5BLFbzfcsIxxVVD2GvuEzl
 VoONTZfnS3xIhPcgZXmvQ2drUs2REFDv+1FpBJLsOi0x9giwrSEHKgkEePaW5r8MmVC8wD0R20S
 5kPnEEzeItlh8kFW/Xia6owf3touKGkKT3Oa/hScT8jPgAwyuD/G10pJOrzCaXyTVIPw7ff+O14
 Z73VcZKLzrtjlArwrCFgAB4ZLcCzpUbY3MtmuB4ivRIbbbRRlZwJem4iIuR2ndARziIq6Yh2VkM
 mCL2eTVKt+zKx1rVBT+TXc/xbk1in2NV8+ftjJ9yZFD8Y35Er7DtoXqrR1wN5CKBb9c+BtJJbrj
 jpZryGeOMVOzKWj4fIQ==
X-Proofpoint-GUID: q0ZwSocMU8TnKQOCBECLCyO_VOBpc181
X-Proofpoint-ORIG-GUID: q0ZwSocMU8TnKQOCBECLCyO_VOBpc181
X-Authority-Analysis: v=2.4 cv=JaCxbEKV c=1 sm=1 tr=0 ts=69c67a3c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=imO6bpS-6So6pA60xL8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270086

On 3/27/26 11:12 AM, Krzysztof Kozlowski wrote:
> Add TSENS thermal sensors to Qualcomm Eliza SoC among with thermal
> zones.  The TSENS is compatible with previous generations.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Binding was waiting for 1.5 months on the lists. Eventually I resent it
> now:
> https://lore.kernel.org/all/20260327100733.365573-2-krzysztof.kozlowski@oss.qualcomm.com/
> 
> so feel free to pick up the DTS with the binding, since it is not being
> taken via thermal.
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
