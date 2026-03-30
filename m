Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CCC382367
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857739; cv=none; b=gol3wdNxALPt6F+8EuHndq+ccNXbLeP9gatPi8UaXk/Zfi+HEz88YswdfZr8u4IuoWXTLW7GS0xnNc9nZUC8X4yFLo8wa1QPREADBQ2cCU4AtSNM0KJ2C7ZMs5HPBtIJ65Pt3Ylj5CuzYGfkgDrBzcNL/6krQEteQWgIfgm7JZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857739; c=relaxed/simple;
	bh=u5OPZFw6uTewcCwEAP3MO5eNUtHgT7VXCa4HLqbTtDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cpEBewDX9XXdMvXcxxO/mBGAmf8avKidnP5/gzLoJT8UgEHwUmwlSigX3Lh7jmWviSTQhyT06tEBI93b0IktAKJ7a9OzUSd7eh4Qbv+TdX9iPHGGyHOXneeOIII6/fUkFAGUeP0mh9gvvPsitglkyntYTIk3yKitAVB5Ji8BuZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lZV/YVhj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dH27mBzO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lZV/YVhj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dH27mBzO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4p6SJ868020
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hDTSMOGlUSoGnSk55MnV014+n+c+NRgq7zKWtSmXJMw=; b=lZV/YVhjVeXylJ8p
	rmaXgDctrQdalH984eJNIp9N2rSOWVaN5XXh5Bnr3XHhyJIsCqDUuTm2j67iC806
	Hf1yUoSbruXVRDbSG6WYX6fT6GmIDy7F4InwPMBnBbhofUOojjR+7Qy5YSHIR83s
	gD+q1bzb3yjQC7cp/oroFPjDC+TnQBkFPOOyl5lQyy5fooDErRVOMCvrczS5RWcx
	bZLOqjHqQ0aYP8TSW8Dvh+WTrYU6z5bjv9KaSHpOu94Q37DguVbQSVYi7KUdKMR2
	kU/f5QmKl4vj8LzhTugLvpl1RT4jFKLoKxfYQ3y616z9aeTkZnwkgKGoFuZZsanS
	9ATiow==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d685hd10x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:02:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093a985e21so86391241cf.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774857737; x=1775462537; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hDTSMOGlUSoGnSk55MnV014+n+c+NRgq7zKWtSmXJMw=;
        b=dH27mBzOn/AM4t50lrstU2ArrGlIBjGpS3CgCUjdPida+zXtB3IF3VOaujzrmdxrXH
         mbqcaHyW1RQgd4BD1l396pZCnC9OOZwGPNpnarI1h/dduUZQ7HsNWorzx39zyLztzo5a
         b3UF/hge26O+SkC2ip7J4jRJRMkUSPUI2o54QqBDsACnGNON/prJqGBECZODQj/ctmQE
         BDwybljPzanXi2Hm4qfrQCcpdYFIIq6vrF9LPmxqGK47bubMmXJOvbqp0sjaEeMc6W45
         vFuALT+rEc9LSuxdyFo9q6BrWzSjYaJHKpjkgLIfKTigH7OlukxSxln0iQo/pnOj++aI
         hnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774857737; x=1775462537;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hDTSMOGlUSoGnSk55MnV014+n+c+NRgq7zKWtSmXJMw=;
        b=r7mSxzzhl6BxF5YWKempLuwG8MobOxZ+MZjSG0mvHIeWf5xSnVtV7XMu+AHVrHXsVQ
         yToj19ufCrjK33B/nHwC5XzojOO/0/10CmD0G45OApaTwrVURu5lk2tYeA5MXf0GU7Q1
         4Pehka3hp2IvCRUNHjO93KydlksoU8asxCbnwxbPr0CSaKUJ5Tzx05MbXarHxNmsi6u6
         j2RHnFmzb0bRr6LkiyRHh/pzO8S8UeQsObEmxhAr1EvMsFvGdVp6HLBrFxqUwS8c6/5L
         8R2q5dLAaj0MjBFaKa5LJBnp52aDiiW9Jrcipl3Eq8pF88foK1TysLVpFNSvvVYY78DX
         C4ng==
X-Forwarded-Encrypted: i=1; AJvYcCXHvFzhiNEvuJBkp/dM3uC4lSLjjXkBjm/IbBomUgiusQ6lMoG0cj/WK1Qj9HpLdWwDfNZ9o24o6d/v@vger.kernel.org
X-Gm-Message-State: AOJu0YynXfHG4p/mN/XwtbQyhNF7WKfHVL1dLmQKdSQX05G/gOawN3h9
	HCqcvMcEAGNch3/7otRKMvLtjWRmPHdfepSU01Tz1lJwW71JihM6dAXg7sjLTu7EfY54PnLnM8w
	Esos/Qoqrr1IuOYV/X7fKmkVkGIXG5cc7GTTf5WLFiK9dXuu43sO4KKZnoEavMEtK+Ya1Ea8v
X-Gm-Gg: ATEYQzyOLz1+5CX+NDnPZAKAymB6GAjMeHpWPIeRYhpm1reyR7cc81f9H8nEIsUHJQ1
	4JaqLZx5T+bQBkeexRSm8NLTWOpScIYPdZgYP1SWvozSuxhv5sD/NfDzzbAJiI0fGbDgFGod/Td
	/A4rjFhh8Fxoc8hzI8Crz5nWzNekreiQWd2fYTfSUa1rxC3peT7aGQpASy/11PZhriIb3zj7WrV
	nsffVDSDwdikFceRXgcMQVseGOUHaulFtx/bl42qzvJBmd5m8dalJ1ii1dsJ4nzkkZQQhqUwvUS
	qt8w8Miw4a2ytK/1OTZ1KJ1hzcMWqZBYTa+aZLW4tN7RbZCrtcoUv1bJub7aCTQzKaxfQZQkmW9
	2Y4i1EBId2PP9zHbNHdBikE61tYfkfELroMetBM8D+va41j70LPKrowFLpyDANKZWA7P7WABZ4J
	cXZRWEhl4z
X-Received: by 2002:a05:622a:180b:b0:50b:6b39:4df9 with SMTP id d75a77b69052e-50ba387aaacmr152131291cf.30.1774857736814;
        Mon, 30 Mar 2026 01:02:16 -0700 (PDT)
X-Received: by 2002:a05:622a:180b:b0:50b:6b39:4df9 with SMTP id d75a77b69052e-50ba387aaacmr152131051cf.30.1774857736352;
        Mon, 30 Mar 2026 01:02:16 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:1675:c176:3ec0:ea8b? ([2a05:6e02:1041:c10:1675:c176:3ec0:ea8b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873068858bsm153678045e9.9.2026.03.30.01.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 01:02:15 -0700 (PDT)
Message-ID: <6391971a-46bd-4ca2-b629-be0b02e48481@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:02:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: thermal: st,thermal-spear1340:
 convert to dtschema
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, rafael@kernel.org,
        daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, vireshk@kernel.org,
        conor+dt@kernel.org
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        soc@lists.linux.dev, daniel.baluta@nxp.com, simona.toaca@nxp.com,
        d-gole@ti.com, m-chawdhry@ti.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260329123449.309814-1-krishnagopi487@gmail.com>
 <20260329123449.309814-2-krishnagopi487@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260329123449.309814-2-krishnagopi487@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=csKWUl4i c=1 sm=1 tr=0 ts=69ca2e09 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=a0Vft8LJKfaWkH7qTSoA:9 a=QEXdDO2ut3YA:10 a=nnjH-3LFHp4A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2MiBTYWx0ZWRfXwhRm/4YGjDOU
 uLTlFZ8TJlMLX9kVGn7VgSsVbEXnwx7xWtfjbI3I1yJO+Vv4O4fwNADWfpE8cdld8BJyTybl7UJ
 x/uB2hNoyPF3XUAp4M/gLJA1CRIJZ9rWo8z2RK7ws1ovMVWoDUdmGoYTZ4V3vP55fCZegen+bMw
 CYl+YY8IK3qBOZqNjpsAqqADk64EUom6ggMVm6kiehJiEgiNY17KNq2P6NQJgdNRpS+SscNOjPB
 Q8z3tI5DBq+j+KrZHAabcWNpik7Sdf68Usn/+6tZUx/Ry4e6I7yHHkmR/qgxllKMjuUWDhCIIIi
 nhQSXY6d5mMR/Ay/sgenuZJqRwUZx3l58XG2Q5xMyxfllHH4NUEi0r7LY+4rwF4A0mmnAXxIO3b
 ZJxW+qKgmTNslcIZoHAmjqVA23ULYHefJvoGAQkWXPBWHMXjIA1PE36g6npczFlS8vUZEj7126/
 dlZWpT0uMMvHoypQSWA==
X-Proofpoint-ORIG-GUID: mBvlbtgxnSZ9StqnTDjz0mxtZD9FlfQP
X-Proofpoint-GUID: mBvlbtgxnSZ9StqnTDjz0mxtZD9FlfQP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300062

On 3/29/26 14:34, Gopi Krishna Menon wrote:
> Convert the SPEAr Thermal Sensor bindings to DT schema.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>

Applied patch 1/2,

Thanks
