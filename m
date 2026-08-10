Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45472443A8E
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 19:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786389824; cv=none; b=tEgJpdeZ9I2MgaA2L7jqRQtaf5jqSsOFUt0ksnUcy4Z76p3homPkCYY79vzg2yQaXvHtffDc0Aaw6HpGmiQSSO1J/UutZLbZlzXTc5cwr03GIz6lZvzRRjrM6i7nMyN3kvv+hmP3hW+cqpqYnC5Dyq3WbSXFjdYHZK8KV1vD6Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786389824; c=relaxed/simple;
	bh=aRDV4NQWV4NsgjCi9yU3FrOsRVicWQRjtrrzW8lU/pY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GtQfLeYpZUbu2d6wVlTkAvdvvTHnVRUMT+w+y42PeHUqgBXs2hJgL77g1K59+O5YreYHEjQBafR0R0NxFtKaSfeK+18FsyE+2/NbVFLYGy5aHoPJkdKGb/J17W8X69/iASr12slQNnt+ekhaNoFVW0pqMmiYt2bMocce3t8a1fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iGiimiNm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VzG6wj/N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iGiimiNm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VzG6wj/N"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AIwceF1249815
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 19:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UEE6eSLV/vfoLlOy7nis2uUfvC8WaM6ptAHuOkuMCto=; b=iGiimiNmUw9bKts3
	5QOSmQe6o4VlH5+n3AWthUul9VWWn33sDrZy/Qzp/UhzdmWjHAxBOkN3jR/b9zfh
	jeBQCAfcgRzshqrw/YORCOe2Sn7xvkq4gvzl+++UQOWkfvp8B+GBcdOeQ6gSC+K1
	CKSaK+6KjIjGA65B4OSn0Mp6OVWSm3+vdB+59JCieNyVmfWyY/YRkuUdLtN63JCb
	0jJoZsd8B0sIA8BFsTGZQgnmC1aF37FMknngEXyYWXdfJPshC9H5T87G+74Ox8LL
	KTMzSAbXTnZP5BCrJrCzIYH2VfepJAwgvBJWgTSxiOU+WPyupchIVGKNmCBYh1Zq
	ZDVH7g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fycgeted4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 19:23:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cea6a46766so43586715ad.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 12:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786389814; x=1786994614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UEE6eSLV/vfoLlOy7nis2uUfvC8WaM6ptAHuOkuMCto=;
        b=VzG6wj/N9eVhRv3Z5dF2wZmVOKcDJ27kVRDObDUVNAo4i4INf246G3o68Gp7SlJiM+
         aiCNqf7o381htAsrzIqSXMZtW+8eG0O8RpXqv8+DaoBStevhMA0SmWxxDoowOKul+ZnS
         DKg+BBjE/7VH3+fbiTpmed3oPZUmQz/Vl3t4DnSYsv4RTL1NH1zatSTzBJ6Q+wIk1L+d
         z1u+lirFrBA+oQ6QgZkp8SYlHUVECkO7FXPVKyf/qqDrlVp1hPnAynkJ9fbT6fVBzdHK
         3fTuLb5Exdhmtf1bWcDVUx5VqAXl9EobtJtKsGEp5BXaa3AujyBgoBNXcOlHSpyzDKr2
         w0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786389814; x=1786994614;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UEE6eSLV/vfoLlOy7nis2uUfvC8WaM6ptAHuOkuMCto=;
        b=cPWiVdM9Qt3wrZTmQbZeREbsAvK6zn9VWPExAGYv+ppppLTZLmd8JLIx1h9CFlb3S3
         JHjev6sQSutPuWDmTl+Os6KjR5dxo+HX9BkGXW0Eovy33Ga+lQB4UFZaFtMtNV5oFBQn
         yMKAnFgTqaemmXYGKTqe3kpZHyx+BVu403Obb0ORz2DGuhg8Lmv1e9z/YAX4/MelnvmW
         M43JA6vy40WDoEtLC/AMKkwwKYQ39uB+U4PNpWky/oMGfJ0+6aP18bxjC4YySGX+zoCb
         0k+rm1eFz4s1zJLw3ik41F2bdT+eoWiBnPbQvy4X5LOv7BTThu40ISCTuioCvK41yWex
         xTcQ==
X-Forwarded-Encrypted: i=1; AHgh+RqIc+hVY/Fa/KVAaynix8uQV++XG+13nRqhCAYSl1UUsNYzPStFSI9j+pOUHNteSlR4uvXUMPBtk1cr@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd6g/cntth6udx+C4fryeMtixhY2gp2MHvFqJn5+tzlaZ6Q+Xg
	SBOGC8QUj70YK8BM3OmKxBsrdRvbGSn4/QfeOZKSgKxBTlmfwBuVq6lF8kIQtB7VxDHOHufLZbX
	2eZVwxym+6jfV6cHFuRaUfotKBtP8H+C3wTxTZQUi62KiyzIKl81kXI1x25VWvD9W
X-Gm-Gg: AR+sD13q9w2YFuNzOvmN2csjeVrXyu1AjFmLO5OCVHwJyQlbvP+XOro4vvVMdPcJfYB
	M1/LrKqqlV3eq8HUSsMzr22t1j58EQRwEK8BhADMT7Ebu6YY7C29hS9pvy7KiPVRpAnpc47HgEf
	yh2jIwWnun/8yFL7aiD8d1AbywjaL5MPKOPvSaVDRVEOK6u+OZx2tzGN+ur4MQiRCeWOCTzhK5O
	uiHdtrtvw9zD7yoEOK9eKAruNN+8g0WmpKtjLZalbfEPLxDmPI+4VNFVtpNFY34LGQfYOSQqR8/
	5A55P8w3JzRn5bOUEhpWQDCpa4r+rjwTn84hctg9v/GocWy0k9F4oYWk9EwFSP9fRlFTFy6cVhA
	FFQcqxna3gYhygnJhaextPKUTzgqMDg==
X-Received: by 2002:a17:903:3904:b0:2d1:1a28:10d with SMTP id d9443c01a7336-2d3004508bamr47137785ad.18.1786389813558;
        Mon, 10 Aug 2026 12:23:33 -0700 (PDT)
X-Received: by 2002:a17:903:3904:b0:2d1:1a28:10d with SMTP id d9443c01a7336-2d3004508bamr47137255ad.18.1786389813150;
        Mon, 10 Aug 2026 12:23:33 -0700 (PDT)
Received: from [192.168.1.132] ([70.95.199.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb88413sm79472110eec.18.2026.08.10.12.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 12:23:32 -0700 (PDT)
Message-ID: <cb5b70bd-0dfd-47fd-9544-a2c505c4f415@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 12:23:31 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen
 <peter.chen@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
 <20260803031534.2942628-2-elson.serrao@oss.qualcomm.com>
 <20260807-shrewd-white-mayfly-a8bfea@quoll>
 <20260807135239.GA48030-robh@kernel.org>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <20260807135239.GA48030-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8kT1BSZTYkxrdLoDH1AESes69AN4pbxv
X-Authority-Analysis: v=2.4 cv=R4cz39RX c=1 sm=1 tr=0 ts=6a7a2536 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=uHxescsG3rBdxcXwcPaeSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=3weD0my5navHwqW7PqcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 8kT1BSZTYkxrdLoDH1AESes69AN4pbxv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE2NSBTYWx0ZWRfX/iYd1mFahEAp
 7/3pJr0Ws06I6Xrs4anAGvUHSiWxjKw25+2Ytnu/Nj7mHSPK5FjVmomR+c21ls2x0xb6AUUQb+T
 3VT0dd3+xRKXAm7/Aait//XkbQBhd88=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE2NSBTYWx0ZWRfX7b7WJKghppJm
 wbSpazb8fBz/89awTx+xBXXa9aA7SwaHCF9ysEpe6vWv5TF0m5jB6sLJfCglv4D4YHBUJY7dHje
 h8FW5vOYdaFq/U1Sqb3Dv0TJUkSZ/l1QpkkM5W++tUzkwcQicdUT0VqoWfJDpE/JqS2DfBEHXMs
 EDCI1q0kJr92148aecsoxOfMGvPjSzRv3GZgXpjIa/INFqO7UJO5ZoRGWvoZkBFyGsDyrguaZr2
 3pRoOYUMcaR7MTdUZoFHepCZZmVPjIByZ2DfUkYoFeyen5DulJbi1QZogDmKlZyBiHoIDFzqe6X
 Er1Z9UdQW/a1Y6wZYkA/NYWubEHPgHtWxjeykDQ+RO5OS6Zk5U+rnmcVPZX9gLj0t6vfH7HCugt
 sICscg9IaiacbTrqWnTf1OXu3oV9/fvNA9JPli4x+IQvLlZEQbPEIB5Wu1HWnIt7gktdw3EKUN1
 0qoJVWpllvMP119euQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_05,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100165



On 8/7/2026 6:52 AM, Rob Herring wrote:
> On Fri, Aug 07, 2026 at 09:20:26AM +0200, Krzysztof Kozlowski wrote:
>> On Sun, Aug 02, 2026 at 08:15:26PM -0700, Elson Serrao wrote:
>>> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
>>> High-Speed UTMI paths depending on the SoC. For example, SC7280 supports
>>> EUD on the primary UTMI path only, while SM8350 supports EUD on both
>>> primary and secondary UTMI paths.
>>>
>>> Each UTMI path connects an independent USB controller/connector pair and
>>> forms its own role-switch domain. EUD routes traffic based on USB role.
>>> In device role the debug hub is inserted, while in host role it is
>>> bypassed.
>>>
>>> The existing binding models EUD using a flattened ports representation.
>>> While sufficient for fixed device-role configurations, it cannot naturally
>>> associate a controller, connector, and role switch with a specific
>>> EUD-routable path. This is problematic for role-switch capable ports and
>>> becomes more pronounced on SoCs with multiple paths. In such cases, each
>>> path forms an independent role-switch domain and requires per-path role
>>> awareness.
>>>
>>> Model each UTMI path as a separate child node with its own OF graph. Add
>>> an SM8350 compatible for dual-path EUD topologies while retaining the
>>> legacy ports representation for backward compatibility.
>>>
>>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>>> ---
>>>  .../bindings/soc/qcom/qcom,eud.yaml           | 128 +++++++++++++++++-
>>>  1 file changed, 127 insertions(+), 1 deletion(-)
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> sashiko correctly points out the oneOf logic is flawed.
> 
Thanks Rob and Krzysztof for the review.
 
I'll address this in v6 by making the two representations in oneOF section
mutually exclusive.

Thanks
Elson
