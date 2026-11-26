Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671684;
	b=cpQhY6A3atybcHqNSALwqt7CvMTyBO+VEzWkCGF6jdIUesXDMFomhKJUMMIFET7K0EbU
	 e27EBdWrhmdYAvnSemmFJv79z2d1EdvtMr8228Osn4u24F4L9ld3LK9FK55FqMDyGWWW5
	 j2EZs13bO0GB07kmNvK4ub+4HdyWdZ1nWCQeO/15P+QCCqDaNN7JF50uqtY1aohhKPFRV
	 uNjiblBS0HXoZvX9Njen+Fjq07tbOAfe+FPva7A5ONbslUsBUzEKIHk1FWXYsCCQRZDnY
	 SxBBYo/L0urohuNTT+xLKLqRSwnrwxJ8nWIbVMiR3GKETX9SJWse7L+u8vKcaOE37Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671684;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KaIkBumHdEKKdnazl1dkdI7RsBJJnknjh5eFZLYyAK8=;
	b=TRaycN7G5Z/m3E+WLS3YAoe7TFgUIaRfWfgWOdmV1reGPLMtOzdrYXOcErp7/FkEFiHH
	 e6aFaBdGuySNZ/rpmqvS7utEgJxFxjZ+MmppoHZxknmFF8rJkxuEzJD2R0sU3VBk4w9Bc
	 wbq+Mp3BUueVqSdQY69OYGy7Y4f6PWAVxgLEk1lyj2LIO37E9wKmI9d0RJSBVFJ5jLfHG
	 YUZm/WiVqV3jCqzev2OJivf2n7Oc2KTsp3Ge233T6qQwzcRqk20GkY6M+TibyDtOPQEY8
	 MpRT7OlybmoPsCrpGuq6/F49yGXmSYWXIBn8D34wH6C8TJvRNocSMLJkK0raDj2u8zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XHbdAQM2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="gYkI/hat";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF41E606A32A
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF41E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XHbdAQM2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gYkI/hat
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36Ls9394050
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KaIkBumHdEKKdnazl1dkdI7RsBJJnknjh5eFZLYyAK8=; b=XHbdAQM24AiJSbus
	R9doTO40p6club4sn6vQEj4a9nZB7tEZwXJl7ZBUiVq3KVrTin0EEyYqyLTMBix2
	FUoNg2y48oSp/+ujhKn7jSWN5sqKGucDTXffGKMfVPmYfWg6pLsu024bNiT9QOc2
	aSyNbANF+QMDFSMGO4C1jkUa7CzSFkXefKO5QgLidvf74XOHFitpLl/QUUl9HAJV
	J1LoFcK2AyM1YX6fPvMLkwlYTHVHJpc0Ak0jRlQqPIUAmKrgZejygEi65NObCmrM
	VFm5Ijgon/b8GdyxEhPMXUDPJsv0XgGzFnHR6bzzmrWLcxlMaNDxaIsWy4hoamU6
	MRttcQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y1j6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:41:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so6354488a91.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 21:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795671672; x=1796276472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KaIkBumHdEKKdnazl1dkdI7RsBJJnknjh5eFZLYyAK8=;
        b=gYkI/hatiBmPXLGsPcbb3jeDbEFgaUC4qtveRJrp2bSNR45Hir5JVjCAVZlx2z7vlt
         7Kv3sW6Qlzh0+cER/Rs1RXj6c33h85FPPGq2MUgTEv7CzdPRlaQ3F/THNgxk09gSMer5
         UEIwNu2vsP+74DApaddlDeM3P++L0bR7C4Nly4h7njB06zeA9R9nIgWB9joEyDAajdHI
         KM4gtxwhHofkTkPJAw5D4YO71ruDmXusDUzwcDaSufiDgWUH0sek1P5b9aKw+RrYRfhr
         iLDY8INI+JvolOItUZr/qXDR9tlqZk4N2pgAZ5Ak/zvCLSjNHerWxF5rn3uP77hcsxXx
         XB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795671672; x=1796276472;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KaIkBumHdEKKdnazl1dkdI7RsBJJnknjh5eFZLYyAK8=;
        b=ovi8dSDtcw7uIdaIg9mdQphdWFiheU/1Q0Nb/lX0Zc2EXH8vvlPKaswnyKxMbGKjm/
         t6okyLaswgLMuCduXQtVLtvnO4oTYis3wwg8wXTcUP1D/tuFrr3cGKFiwO4Xm6z6sgkW
         c3C4rdUPAcTZ+y4+vA7g0pgxAnDtv4wMMeaBdhIJJxnPKgvPndeyv/asUmRnbSIlPEn0
         UonvC/5H+iTJgtNIHRnifCH2NkQ2aEQCUUHBnFoCOcU/swZ9LDgyuvGGSdODT5mjcW+A
         Mf/CepTqij0MvTyDjDLsaylIIGN9J25XtWxYvOJHtLEm5uiYgxqhHDK4ZlrORVeonf29
         J/8w==
X-Forwarded-Encrypted: i=1; AL+hErFi9by1IkyVIBY7z//PMy+HPTJTwfaGOg2P3ZBp1pyEMIUvJlSoV0B65ZDesqQuzQBYOGKggcYB+1XC@vger.kernel.org
X-Gm-Message-State: APuU4Z/7Q0lFasyNAyFXC7Rj8K92kuFZ//KuCBoSJFoGChArMbtnPcTz
	enOW+sJfbAZ3HnizeFCn6nQgmLE7GBlwbA9+3d/j3BtR2HQ51B67EjGyMHYMK5R1RCsgmxPj7L6
	Ng3QA7ftpzN/pTVcSw/TUJxnAitPuWwa3V8jbNT9RZUW0H2ubFjdykQqQhPrMfqmYFNddyYiS
X-Gm-Gg: AZFdTZdooyff69XHNjGlhqdxYYxZNBaabuq6JMbG9PkLn7Fb8JTpIkaQ+owbK4VIygV
	N6+l8B6a+wf1yS4JQuwS9ijG5LMftB7YGPV5EHAZ3+4HQpelsiQuYgAmTz9fwSPIeXH964Jp/rZ
	0HxP1TVNDRjdMfmrsy35vkbR4E7GQACWm69CgW7+fLk2iMwPjJnA93cRGHWkWFv/VmDgOBGyFAx
	zzpjclNmBknFAc37YE0rY30AkcwjVRkU4ZA072u70Ept2oCru0ifk0StBA9ZH3bmZh0PaBhKo6Z
	rFzSl4ng8dGqbuCdRJOGuYrz4WtM6dIeVAgUaHf46KPdPXZ2ioyVBxmveMBUB95p/ktE2x+sgYU
	vFLAa/MvvRxQhgIj4Entp2m/PeyqIvN8TJZYC4WH9QjeeBlpbG7Y3bCMwwmDwnKMbZrMcI1KZiW
	qq
X-Received: by 2002:a17:90b:4490:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b41c7bbef0mr12554571a91.1.1795671672152;
        Wed, 25 Nov 2026 21:41:12 -0800 (PST)
X-Received: by 2002:a17:90b:4490:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b41c7bbef0mr12554548a91.1.1795671671671;
        Wed, 25 Nov 2026 21:41:11 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm33365160a91.14.2026.11.25.21.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 21:41:11 -0800 (PST)
Message-ID: <238a552a-ca4b-4997-aecb-fdaa278ca1c4@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:11:04 +0530
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
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
To: bod@kernel.org, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-1-d7c2983d6d7b@oss.qualcomm.com>
 <179561294019.462348.12092000419789488599.b4-reply@b4>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <179561294019.462348.12092000419789488599.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfX/pKbSz1uC4eQ
 UJaHp/XfDNKWA/EeGkJGGIn4oNzeSb2gtSotGRSlNlk+t14G6J/pUTDoZD/eq4N+bxQBnA8WYMg
 cVQxRMY7OKE14iEBPst2vF13YwGChGgg+a+ofD1ssEB0qnoDV4gScDOgB1sCcYE6QquqP6dreEC
 +jPY8rVXiX3WkB2nU3f9Uzm5U3bWowiwcujfCgbX08FGyVyhKJxXmFMWW7uxas0BODT4VNJyEMC
 rPyiwrJMdF98MTNedVlA9lKaLYTXJ+sbMP1UsRhsL4w5UhpRshV96SahVyQYilgZH2bQvKPGXeV
 LvxWgVA4mCSYhqsYHXns/7o4OQ8hD615ouecjJZH7LElHOQCma8/uK/ZCiVRFDofPkCv3WT9Axn
 W1HvSGRh1NCbU/GI8qd2vKRetO1gWcCoh0bjeRCQvb2aj83aPM+cQMEwvQRBcXAg3aDK3pWewsA
 4bB/2JAvCJfo2Wbe3FA==
X-Proofpoint-GUID: 1YaekDFP5Q1AFWsoHvjmdU456NfIZfDe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfX9OE7yIB6Af3w
 Sy5qHVN+bVyp7qR45pXyTbDzW0phd+FXkgeOGt5707+3wKeVnmXmQwmHzoR8BxOlJqu0Gjveb/H
 TXmnf2egpRkh30La/EhXWsk+wjUSqzw=
X-Proofpoint-ORIG-GUID: 1YaekDFP5Q1AFWsoHvjmdU456NfIZfDe
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b07c683 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=CZpgSDYph55k4HqUXiUA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260021

Hi Bryan, Vladimir,

On 25-11-2026 18:52, bod@kernel.org wrote:
>> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> @@ -16,7 +16,11 @@ description:
>>  
>>  properties:
>>    compatible:
>> -    const: qcom,x1e80100-csi2-phy
>> +    oneOf:
>> +      - const: qcom,x1e80100-csi2-phy
>> +      - items:
>> +          - const: qcom,glymur-csi2-phy
>> +          - const: qcom,x1e80100-csi2-phy
>>  
>>    reg:
>>      maxItems: 1
>>
>> -- 
>> 2.34.1
>>
>>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

This series is already present in the mainline tree:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml

I am not sure why it appeared in your review queue again.
Can you please review the follow-up changes instead?

https://lore.kernel.org/all/20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com/
-- 
Regards,
Nihal Kumar Gupta

