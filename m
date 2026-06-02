Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7243CA4B9
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 09:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780392488; cv=none; b=Hclm1+PCZ1V56SnbFx0GWoT9qVKstJBpMeEc/9p7QjL7wt95rTR9O35H75Zazi2jzh+/O/IPwhmEgXBRRQkznYv78cJ7Cjg3rVYlBtHKyKIlNaMgWf9FBg84/RQA8JoPEZ+IHUWA1Vg4PRMUOI13p1qZi4aMctnBhWu9/VRo2Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780392488; c=relaxed/simple;
	bh=KOv9YH+3FUbVV6ZbzGnVEusvGbPURLmC4FhUS4K2pMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jzqu77whXgbMrcLo/yqaAcJf4WR4XD6jHTqiO5bigkXrVSoHY++1FwtK9zR9fNCBvwwt6EFLoFDpmJAgZKKb2CdMuUwRhnGYKr6d7+lSpFoA1LiAlm5DdfejJ3zM6OHHF1hWVF3vMjOIjxZoFnAa41Xh/yYDaZiLUGrJtekqumU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YwxFHEsg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jpu5r88+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YwxFHEsg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jpu5r88+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6527qmjs3134052
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 09:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NvkSp804GhdyyZxMLRn3wWP/E8RApPPQQ9Kgdfsxspw=; b=YwxFHEsg44bedKWL
	GumsKAuUMyork49N72gk66HyaeoAg9nAmhZIequaFKa/ySrtHRWHFHEMszXDKksA
	3WiImZS14pa1B0HgA71AX4S+J8ds0w3IXBDgFb3KkBiUEnlkIoIFy5QhIisWd1Sp
	hj1uU4JRZ/QHuo9TZQUV0H5Ax4JLbdBYkAE28tN6M2mqbxarttAGEChnZXOlNXqS
	r0t7vbFu3SKRQZc3HXAsB3DDIV5OGd3wIn1f66qKItL12Y5X+1plsW75oPZitXrW
	EHb0bs/NzLRl8kVWYdQEB4WC1fd9FQPAEs4ZMoyK6NgdvfQKe0SG7C6sx0kPyOPL
	aggZwA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehu5wrdeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 09:28:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-842278a630dso4126192b3a.2
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 02:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780392485; x=1780997285; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NvkSp804GhdyyZxMLRn3wWP/E8RApPPQQ9Kgdfsxspw=;
        b=jpu5r88+TxdJ7JY0v2W/iDf2BpMDHQFS+y9jTrvP9E9fdzKZt2fDDpSsW+XKM3IKG5
         9viqUuPmP+SdoWk5hPaa83beg6t9dNIQFS3PcMLhdGJ1fJuY6COUuOFJZ7qHDmE62c1O
         SOHYHlxFRpa01deHmcRqbZ+2ElYbKr9eMVJC2msA9DN+kj61+fpl4ENexdYE4huptmQu
         dk+E7YfySSLPRcUreBVejRcOtnykfTxHR+RGYadMu3lskeXEVylnH4Sw5765UULS5ImL
         aipxdUnsNGlFdKefZCsJ7Vd2/mQ5oqD3DnMvW/3EKgRhTXMzhjsQeOVehUZSXhwPXnWW
         LqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780392485; x=1780997285;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvkSp804GhdyyZxMLRn3wWP/E8RApPPQQ9Kgdfsxspw=;
        b=eZCr7D/6bueM1LsIyG0Mpe7RqSusZLCyL3a2Q/TJWAvqnoTVM1iWQ0PY+vJFG4QbYb
         ecKCgDt8Hn5d6vLaPIAoMd2O++zlxexzuEZZkfWfo1T7yPSNivjwYng3gqvknuiwbCx4
         qfB0aUYkdhr13t1zVN8kv6u7MOBQyhUjNxIdcd7v6Ti+UssIs5vMtbAJXPTcs0sCTQe1
         KkPTJn5vWeCRqgXw8joWigO9HkhiphgjBgol34p2p+QaAEdrHAf6/FbmJVY9p6YcALgV
         AjPk2fo5h7yl6wXMlsgErK1E5sExSWQkxo15ONE7ahG69R2FJEsYxmDIr408m9KxrYX7
         14Ug==
X-Forwarded-Encrypted: i=1; AFNElJ+TeRMBADaWsNL0eLi/BZgKGiJ3NVByW9kz3480/q3TRkneYmNqPTqrN3AEQLN9zDqVJmC2UClveoSZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxlMcDOI2RzR1wtphIzdu6sac3BQgnBF3Z6TYIfh/rzrV2jsRjD
	NiKC7DzfwUh9f4cj41so8fOBVkxMr50HJxK/okC9fdGvuOXrsZqCS0PMadEl5wXxuEsJZVA2s66
	gndRfA6DphDanqpq9AQltle/5Um7K8O6pb5jQGVuhAjxktrXB95E0PfdvqXMGzSyb
X-Gm-Gg: Acq92OFkILBT8PnV+tADRQhUloFf0y91COCcHi9kBanDOkZr3e9AOrJYcmdWLPtB8Eo
	kgSHmEdcLf+IGGuMRhUyagL5QK2VFACToqpti+G1fMyr33JgfBftS6S8X1m+JU5rxTn+nzpiyMn
	v9thUo4e+iysoxkPZaqJa0QSw4T+cGh/S+h++hgZPEijhTD8BgskWq7BmfTaDO9NzaisdUc4ORo
	JgMT23s+3uLaSOe8WXluLhd2aj7QJJ6N1gjMkdghDgbnwVECYJA6Cl+pcojxnzoLY/wSTQIdLk7
	NjJL2Z7AjxOOHh6t5dJqq76hcbuaj2BIFJLQBu7lTXqNnrE2UVPKvpFLszDtBrodCwEAbkCAQoU
	QM2Qc2LoKOpMQv5jk51xAup3XyzNE1WG9Gsr0XJ8JhFDHZyxx5U7SXBxXQXLgWZqknNRlK0bp0y
	jY6gD0ZATCC7veq/AgjeFn9E37Ytla32LH
X-Received: by 2002:a05:6a00:91e7:b0:842:277d:f72a with SMTP id d2e1a72fcca58-842277e030emr12603228b3a.33.1780392485067;
        Tue, 02 Jun 2026 02:28:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:91e7:b0:842:277d:f72a with SMTP id d2e1a72fcca58-842277e030emr12603205b3a.33.1780392484581;
        Tue, 02 Jun 2026 02:28:04 -0700 (PDT)
Received: from ?IPV6:2405:201:c416:5052:81a2:4375:a071:12a2? ([2405:201:c416:5052:81a2:4375:a071:12a2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8421bfec5cbsm11760197b3a.41.2026.06.02.02.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 02:28:04 -0700 (PDT)
Message-ID: <afeab8fd-6951-46a3-8b92-9c3b7075949e@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 14:57:36 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: qcom,shikra-epss-l3: Add
 EPSS L3 DT binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com>
 <20260524-shikra_epss_l3-v1-1-b1528a436134@oss.qualcomm.com>
 <20260530-victorious-resourceful-muskox-cdeadb@quoll>
Content-Language: en-US
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
In-Reply-To: <20260530-victorious-resourceful-muskox-cdeadb@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4uZHIcCJjWfE-TkEyyBgWOdvnzUhRs92
X-Proofpoint-ORIG-GUID: 4uZHIcCJjWfE-TkEyyBgWOdvnzUhRs92
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4OCBTYWx0ZWRfX6n6vop29Mwp4
 kOX2BeSO9h4gGtHTAKXuoBHxLK7QzYBM+2eB/WnmiR1cbP0zlGH2FYKHDl6mlrPvfLHJqVHFKZI
 nSwZ7oVVi2kUH9AW3artf15FHG5cRkRD3D4n/KtNh1tLDILVTjC+XVxE7J0UOsPaQzJcke/jVxv
 ILZZH0wAStClk8Xjinfkct/DIou4Y/4IzS5SmzwpeI0neIYmxPcnjX+JQi64fMnwYhntVQ5ciU6
 GNlA5dg5bXS8z3zo5SDqt6AXRFRYU5M/vj+aMOrOYot39s7EA/Z6yg8JG8VdZv2cCN06BOwby0q
 DTUynHxkwSNG9EjaD9aapjhLdCxegSWK2HIVtVdZaQ4lqpUYPIkwlb3opxlX/gn54XTfz6kotZk
 Pv/pdlspfKtbdUobXFO3+BQuWM4rTwZ+L2xQGmOceaaEIehfpKPG7yHkFeqSGGphQ5L+8C66jnx
 9jNqQW9cw8HTJS36s8Q==
X-Authority-Analysis: v=2.4 cv=M/R97Sws c=1 sm=1 tr=0 ts=6a1ea226 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=NjHEnLPE2D3hUEva9SUA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020088



On 5/30/2026 4:38 PM, Krzysztof Kozlowski wrote:
> On Sun, May 24, 2026 at 06:03:35PM +0000, Raviteja Laggyshetty wrote:
>> +  '#interconnect-cells':
>> +    const: 1
>> +
> 
> I do not see any differences against OSM L3 binding. Why isn't this
> device there?
>

The EPSS L3 on Shikra is similar to EPSS/OSM L3 on other Qualcomm SoCs,
but supports only twelve LUT entries. Due to this hardware difference,
the generic compatibles are not applicable, so a new SoC specific
binding is introduced.

Thanks,
Raviteja
 
> Best regards,
> Krzysztof
> 

