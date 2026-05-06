Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE6548BD33
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 15:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778080562; cv=none; b=ov2dz4OkTmYN6mubITomZBBkSii6mvh0zQstgx91w1XyuUdpb6kEdN59ugo5MfJm3s3L/JW6hL56j6j1TPt4FMzbczNB0eiVGLGZH4Us7glG1UDgdpwjB+zE8bZnm0fqNNybGbiERoglBvKBbi9OL0uk4J7mBZ9n2ugW/VLlqfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778080562; c=relaxed/simple;
	bh=xiDExUEeFbv36DiZHJNh/oOKhizp9m847cbIdiQQT2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=flouGxWl0J7g72HfNu0DWtqQY4FYYR4nFmZTsZ+hbu4c2z4iMSTpwqg7fEinqZW2STxKJDMsCmIKabiX8Qh8AMKtzVjQ9unB4UuW1qTAwbVEiForPSeInRxRBcbYJlCpEoV0E1XG5R5sl+T7x0qC1SIG2ie3oJCTnJxowDdDpEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dwz5rLWY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bPuF30Hi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dwz5rLWY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bPuF30Hi"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6468ZvUS443091
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 15:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	amk3hlK9MsS9zYok/WjEucM6TBX7QbEjYXyCLdMNkWU=; b=Dwz5rLWY775+4mgi
	Q22wMTS63ov5b6rPvTLceOc2RsuzxNkoSpkHl4HRGIuTiLJVY7PwmSxRgW/1LVDJ
	3yo020QHI8nN9zmje/+G/2eIhYHf1X+BWc7KssqN3GeISkjKqTtJ+MEepv04tYxi
	1LbBnw8Td4S6MPW+mWOJyPnYp8ZCtKg7jmU5MrnrJU3dd4l+FFj4Rd5ABDaPslMZ
	Y08y7c8NKBjBgfp0989Bhlcw0uOUpKb0WH/wvZ8SLcTHhzZ/gS66uAiCiKnq4SSi
	QNDWvlHCK79TRakYoXRci/GuzM7eS6Ore80vsYQYG2uw3dz5JfiAO9LjmmWehm3b
	zLhlUQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0299hf67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 15:15:58 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95d571db32dso181295241.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 08:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778080558; x=1778685358; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=amk3hlK9MsS9zYok/WjEucM6TBX7QbEjYXyCLdMNkWU=;
        b=bPuF30HiAF2Xx+sdOlUMCmgiuIQ/uuIl69p5Y+EJQzRCNWu2zcHlqcThpe+OIVZjMA
         Cb7+jrGjfQERrmtDD9fuIKNb0nb4HN8EuNwanXHOINIxw1nGUJKfWNbULE8r5y+gVHWZ
         d1FVEmG06KVeYeHm1POZb1Sy4k3az8hC6MgPuxJ78xSThzhJMMgDsr4KaIoPfVVm5wCc
         LspiwkbDPVtec4GIuETQhfXrTuAg1ld6L8Ftrk3cTQmIkm1fzd6HZVc0s5e4aeRV5+WW
         lCo5FvyVzVPIeWlpsPmV73HrhGkx1G4HlffKuAtVQYm1wl3cgGeCYiOvuGSGDJyD08k9
         PrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778080558; x=1778685358;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amk3hlK9MsS9zYok/WjEucM6TBX7QbEjYXyCLdMNkWU=;
        b=I70AmqF3XfACOfkFeV8lKiTFPsj1vo40/HoD+T4ziItr2nqX9iiiyXSzLqWUBThTZx
         laBGdbbVgbcVU6PngmcqI1RTihqT1JQMiC7sgPVVLRiKXXAAOJdmw3tCbYlgzMBF2QqO
         X0Y78KhAEXl/sJIOYmLlOCGlwb3XztAEBfnHTPChHJcrVr+EjNMjp93BFlH43m/5PC2m
         y+RukOIiQUvopOJQw//DiArzSjMiqPjzoJ5RqUj7B+kbDXRE68T5oA9TQlVtd4xt4QHu
         NHD6PUPgZtgw9QPQIyYe/Iags+sOQMz02cFziGLz9iNy42nOPfhEATrzWbWvhRZuzklz
         Urmg==
X-Forwarded-Encrypted: i=1; AFNElJ/kiWn+DcMRQG9AniAqR3CgszBzHt0d2yNL9T9mSjLmvtqZv5IN6QET9DnMFAgKKXvHAPQDCyzeZo9q@vger.kernel.org
X-Gm-Message-State: AOJu0YyThqoX6IXdnr/jrucpkqvZuX6giL1v3w5rA6PB3/LTKJ4B+n7v
	Ou72sdcfP51quqIvcPOYUPka7ghqJWI86hQJPry+2fzYTP6QjLeL6Wc02UHT+etbUdqtJLas62H
	YG4cIH249Q+vtaFZLD+UwoMrO89yMeKUKDfKxtQ3tN+ByNEtVbA1mqVOB051nOZol
X-Gm-Gg: AeBDiesOJiy1zLAlX9NutlGabinvNNQIgdKQsPF8HWQxUXUBnwxiBUBbeYdtUuF473Z
	vZ7POF7fMkbdc+4EIXNaB8W8fc5HmY1cJE00ExXxBv2mcrvgqi0xUWFb3cwi+Lhz6xcDCOV18Dz
	Xr7JjfGlYOpa6HM7+JE0u7gAH2e8NUQhkp87ozkRc+oIZNP+vXYP51f/G0DXtw59huaP5THEfof
	RNdfnh53c4e9La24jKNhUBQTfhJ2shODkXLmv8ZpaGpuyGAAQ6xqkr7kJjLBjlhv7D0RvCNKdjg
	MtlW36EuN6vYhgoCWq4lmY6qfnXDadxFVp7mhplRekFlGufI9O4b+2CAZMkiJwlDgGlP4pXNnqF
	heeXeWOATcTGPh5f18O2iPgz8G8pRNMLxiGLKeVoj2b3rPJGKz7AN/5cH2b3tzui/U5jtQRFEqY
	Y/tMzKwa+Vt1TMpczvvbw=
X-Received: by 2002:a05:6122:243:b0:56f:2aaa:450c with SMTP id 71dfb90a1353d-57559544547mr2328157e0c.1.1778080552312;
        Wed, 06 May 2026 08:15:52 -0700 (PDT)
X-Received: by 2002:a05:6122:243:b0:56f:2aaa:450c with SMTP id 71dfb90a1353d-57559544547mr2328082e0c.1.1778080551814;
        Wed, 06 May 2026 08:15:51 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a? ([2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5312daf8sm19383045e9.20.2026.05.06.08.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:15:50 -0700 (PDT)
Message-ID: <c10e73df-4850-4507-8c8c-5e1b5e24f99b@oss.qualcomm.com>
Date: Wed, 6 May 2026 17:15:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Add hstimer support for H616 and T113-S3
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>,
        Conor Dooley <conor.dooley@microchip.com>
References: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl>
 <9ca77795-ebd2-4157-9e74-1fa1001e750b@oss.qualcomm.com>
 <z4qz6flhdnwdpmpcr4ufpcbjpor3x5pc6xw3vdjl5efqssayn3@jzz6vt5ux7te>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <z4qz6flhdnwdpmpcr4ufpcbjpor3x5pc6xw3vdjl5efqssayn3@jzz6vt5ux7te>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fMMJG5ae c=1 sm=1 tr=0 ts=69fb5b2e cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=1akvWiwmLSqBbBFyMusA:9
 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: 6wA58zhsRQNWx4OQ6T-kObZGmBRchsNg
X-Proofpoint-GUID: 6wA58zhsRQNWx4OQ6T-kObZGmBRchsNg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE1MCBTYWx0ZWRfX8VaKGK6fPzco
 rsGjq14QiC7AOpsxrmf40xLPvRkmOU4XxutK4K6MMvJB01RvjbqskLhHuql1FJnfABFGoErY898
 wcuP/oV1hThjULa2iTNDhH7s3+pRzWn3KF5NJ3CUy3GEq2Gk8zhIDPpGwBGjhoD09kR2EaQQLha
 8wPKL+ie0ZrhPB3OlSbCAw+ddSA3ffrl2F05EM95kd/G6RoCFmkjhIzqIwkFXI0qRVa8RBtD98d
 sR8sjjqpkaFnJlREnJqy06b5NFjUkhGaC9DLu2sRg7NqVkCOzacm/+0tTbwWGJdFFmqO+LAfyvO
 CrnIZr1CZm0QTE7Ov0qMxUkbv5oI80aAuctjhaDGZ5h7BVpcQogtY4VwfPdQdUU70LuqrZCJlCo
 589YOmHXmkXKM8DYfWa5ACb3mZgXBlloC21nUEEfjWtlAfDsQTcbnslYtf5vH+RkrDOWf+ArDk1
 Mwwz0+F7A80tYZoxMLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060150

On 5/6/26 16:41, Michal Piekos wrote:
> On Wed, May 06, 2026 at 01:28:22PM +0200, Daniel Lezcano wrote:
>> On 4/28/26 18:26, Michal Piekos wrote:
>>> Add support for Allwinner D1 high speed timer in sun5i hstimer driver
>>> and describe corresponding nodes in dts for H616 and T113-S3 SoC's.
>>>
>>> D1 and H616 uses same model as existing driver except register shift
>>> compared to older variants.
>>>
>>> Added register layout abstraction in the driver, extended the binding
>>> with new compatibles and wired up dts nodes for T113-S3 and H616 which
>>> uses D1 as fallback compatible.
>>>
>>> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
>>> ---
>>
>> Applied patches 1 and 2
>>
>> Thanks
> 
> Thank you.
> I will spin shortly next version with suggested correction for patch 3.

So patch 1 and 2 are unchanged in v4 ? (missing reviewed-by: Chen-Yu BTW)
