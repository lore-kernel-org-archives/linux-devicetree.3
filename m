Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C33736404E
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 23:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784504365; cv=none; b=k5CNuXjzk4M91eh8Ry6E6QxDcMme+8VCk8WGYvcYD1X1eWBq0/8glK+pcSGOJZmhnxfi4ORa6/4Dl2/19e49tuQki/axX8F3CQ0GDWlaK5+fUQrvpDXEN/dMCjpwJzEmy46v9i+lGKTPfxnjAkmwcIvOytgUkOIOhb7IHQRKsJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784504365; c=relaxed/simple;
	bh=8w4crvEmjR3oM8bLzNIS95cjBAOb3yWExJaES3mlcfw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LRGh0XIqciWkdUu1rm7RpQP/Lic94fb5pbBQ8hz9q1WJ5gM7Ko6KtxjVS4fOKxgh12H940UsmE8ASssaKU1icMKg0gdaCaTSlea31votdQRTEi576yuUT9yIrtS9i8vblcuNmNE6D2oXHGtEBgsazbArclxBFsPPMklmk7W95jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pe+6Ratl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eOV60XTI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pe+6Ratl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eOV60XTI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JLbh1f1630653
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 23:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lbG5223pAlCmJ0cHKAs6HSKraEFHrYbRDxsvzBFwDFQ=; b=pe+6RatlWfEbvNvC
	beBUvZYqbWgpf1RZxllZWpyQdYQjekX3/2dcpFjD1emq1/l42k44OubN2+Dn3c4F
	bG+qKvv1C5pXRu/z+mzPiBf02lOT2GQPOCWNBrMmaZNSGeZNGv9dLRIPZzjNCTmC
	jHwHFjNrc07Bhlz6Q+5af3RrFEnKwadFRsPZw8RbcotTljd67jnni7Tv8n/T0chl
	GMcNNn8Mh0JTYnaad5Qu2vRwMte4rV6XiR7FF15j66SJgu29BINB2U58tpFQ4+OG
	HkpTU6lk9S8FNlffGJA+FIVzi+0G10Em18oObBqdVQMZTslsrNtw7NG0FQ+oVMYK
	fQR0dA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2aaunhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 23:39:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc88e22f92so205944615ad.1
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 16:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784504363; x=1785109163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lbG5223pAlCmJ0cHKAs6HSKraEFHrYbRDxsvzBFwDFQ=;
        b=eOV60XTIJHpNLm/ZFZJaSGt2ssCVi0eze/sH/qJtNN7wpNHrTvRC0UOyi9xBURjkGl
         s0C322luYEsvVTUzx8h12b+hFIINhasFt+/q+A37Ak/VfdndeaIGEf4fzs36edY3XcPb
         kuwmDajNHf3aPdsrSgqkrZDgqEY+t+1zicYWYLgc/Hz/b0Aeo1Uy2MGn0CuZPbr9sbMY
         BBH1YSgGXOJ1KVQiOkkLDuHTQMwiSJmhxw3CaQ7TiaaKC35xPLpXf7wuyqOWUvKo0gN7
         L1SEh9C8k2lzcR9ZCgUz4TwwFwOT3j+4BJy6npVUY17jQQ7XXV0h74FSyU0uSuCZf4vU
         dKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784504363; x=1785109163;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lbG5223pAlCmJ0cHKAs6HSKraEFHrYbRDxsvzBFwDFQ=;
        b=MFjrQdoC4XyZVLgJoGwldeJDdqvDKTZyRMn1Oy+c0WuM4Mtc763GCJ7mOPw6BVtioR
         n/tlFRAXL8bvJxx+XdEDlOcKiLti0PHz08Wiw2GkuLNdkqJlbWrxuhIGtVi4sajvGDAB
         8MIQ234pgXHxj8smiBzt3Y2naZGvU+4a/PpvpOJLcSBgibjzemflcyRvv9u5wW7I1/V9
         tRqkVK88IydmkctcKPjLfRJCABjB81BAFMq3euDL9D8UuWcn0F74DF1lOCH01uTYWEG7
         vffR50tzjyWV+5u9jTxKTg7zdpgZkMy/7rYXCLu6+92nMraaVwBRxAslUFW3k4D9N+2u
         HXOg==
X-Forwarded-Encrypted: i=1; AHgh+RrUHTbx6sJUe1K2FTE32lrIFw/C5fYAJTEVuScHTKLNnqhvL740lXHS3F4OMLwX+L6VxfP3QoeQZmLL@vger.kernel.org
X-Gm-Message-State: AOJu0YwzI4fuMdi8F9Pw/vfuuGAmKn5RIVLsU1gIMuy2t9OcpRfCFClY
	29NM2RoZiyT9c4+E7oHT7hxwXQXw9fBXABK8fbCAvmfMUYNvKMbOPRL5J7Mlqe3BBJEMHwCfQV0
	43JU8uftIMb+zKnwB0BTJpJPTmHcmNTIpocvhe70R4p1r1kAVH7ePfVYVkc04BImu
X-Gm-Gg: AfdE7ckG8aE7PkiWog4W0DuPh89f28ymHQt7w0SRRjMALbjwaHvOVWuMPwjwqGk5WPk
	DlyXl5aYluou1f0194uL9C/TEJeNRX3UTvjwDxlOXggWnCeClOg6Or4FUn9RTONE/yoaxdK6PNh
	jNUfCTdPRkfsn84w6uBc7rKHj97sGX42wbdpq3xWNS+7fNEAicwCxDgNAZ26F/iBTw8gTkt4NQn
	2C1vroCPb2Gpo3r1jsY/PSy/N4xkWaipc+utlhOfjwcL1LK/banYETSomm+7Dw1UxRH5bxxuPM8
	s3N3YzeBc4BcQ8ST8XFdmzMkjmH128wI9WlAXWVnMf7V0LzZTso6BYQf6dj5y4TkPhJAZgS7oF1
	XK7LpTQ13IGQiBaA2
X-Received: by 2002:a17:903:244f:b0:2c8:2808:3ec4 with SMTP id d9443c01a7336-2cf3497ab8emr123925545ad.24.1784504362802;
        Sun, 19 Jul 2026 16:39:22 -0700 (PDT)
X-Received: by 2002:a17:903:244f:b0:2c8:2808:3ec4 with SMTP id d9443c01a7336-2cf3497ab8emr123925255ad.24.1784504362378;
        Sun, 19 Jul 2026 16:39:22 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344f12e0sm45849815ad.31.2026.07.19.16.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 16:39:21 -0700 (PDT)
Date: Mon, 20 Jul 2026 00:39:16 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "David Lechner (TI)" <dlechner@baylibre.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Chris Hall
 <c-hall@ti.com>,
        Patrick Edwards <pedwards@ti.com>, Kurt Borja
 <kuurtb@gmail.com>,
        Nguyen Minh Tien <zizuzacker@gmail.com>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 5/8] dt-bindings: iio: adc: add ti,ads122c14
Message-ID: <20260720003916.0e4eea01@jic23-huawei>
In-Reply-To: <20260714-iio-adc-ti-ads122c14-v4-5-25f8e3084485@baylibre.com>
References: <20260714-iio-adc-ti-ads122c14-v4-0-25f8e3084485@baylibre.com>
	<20260714-iio-adc-ti-ads122c14-v4-5-25f8e3084485@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: l6Q7GPf8ZGIchBXPmu5lqwo7Iruk7_tQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDI2NSBTYWx0ZWRfXwmVydLDmh4AG
 lxakU9uV9SX4gR75Uj95hLLvFs1U+xA+ebc/et+jytHrUGjpnEad4P3bnl4VhXMLAg7w+U2/NId
 qFl3PUzhlog0LpedWeZxW3vmvPlEYJo=
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=6a5d602b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=IpJZQVW2AAAA:8 a=Unddr-AOr8soC30lnCYA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: l6Q7GPf8ZGIchBXPmu5lqwo7Iruk7_tQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDI2NSBTYWx0ZWRfX62zWiymdRSZi
 yYMH9Q+5NWrJjI7TVqbqKd8sjJoWmkwr0KAeE0FcvJKkzc6li4WfDVAWvCd6w97REb0BJqp1pqg
 gIQLYE66MK11PpbK1twjNzQtDWm24jBGS39bsLwaLh+lcsLnC+5Q+mceiwEJWTodynYfjmDbCi5
 51YWvu4LccM4CnJwvfVGcyogA8cxbl279zu7TwQC4LnzMwO3fkk5XRtJMyGAk7h7fy9tiF6fRkV
 XCGsarpQ93WBGnJH4Qpyd1V4b0YX5knwJZPnxLUtpLzC8UTVLPLSDiumbMtK8lQA49kqHvO9IIY
 uUmI4zMYqH5is2KLIE6tPurUDZICmefYr8isBj+pp36d/2uSQ1cTATea4qBGvpDJwkBZwd7KAyP
 QK8xm1Wq/TE6qEq0WZ7kjGcASeEwx0DI3ZISWsRCMW6gukjE+oBmet/X5DXfDrGztQ1a/axuA7l
 ICsrop9mm0Db2VwMTdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607190265

On Tue, 14 Jul 2026 18:21:27 -0500
"David Lechner (TI)" <dlechner@baylibre.com> wrote:

> Add new bindings for ti,ads122c14 and similar devices.
Given the binding is named ti,ads112c4 better to use that here and
in the patch title. 

This briefly confused me when I was looking for the file to apply the
fix you called out.

Jonathan
