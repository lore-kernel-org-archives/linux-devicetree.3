Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530480;
	b=g3PUXzvx5kRyQ/DFlrdU2K5afZssA4mml5QnyL6HSkBftju+xGQRYrGj3KxKYwwydTuz
	 yWGKI164ryULdhUV5DPRkrsiBz9yA9D7yMzOqhgKgcEPJ9GCMoHfOu85FjenZKfrIOoyN
	 09qZDCpSlyyHxpAIHTV7+yGyAsO5s+Cct8KWifOBP9WItAlWyNlLPNTfwL542enBhXkMq
	 q82VDX8yJfGVlYvQjdTq4biJn2eE/JHdcy4+eG68NcTyJMB3XdVbApwnUtTPUEDvCJLXv
	 n0JCEe/6zRuOudJHfhHMjeJyYEgKty152w+VcVPhhJk0MzUopW1FMEv1cxXH0tDT4iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530480;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2e1f8mH50dVq3zUP41WlpUgQLkq7jx1cCFUDQDKor2E=;
	b=utu7l4OGMwzv+wsNQ8PW4flFonggncSO+qbcb/X58TrFnm2YOnvnfbgWrNV8CyRXtz3W
	 V40RUbPHhdhkf2MalJeYSocs6fAhyNqR7WFsjo59PBvlRaB25GiaSV2Kgi6XL6yUxCHCI
	 IQGYhP0gsQwWE0cv4GT/0dkBLLh7Vmy2CDElwUEVhs6cKB5mwmvmhuc/FM8SsZDEgpMxC
	 UjL+0QBqABo1ZuF8kAw3ZwPOwFhJvfXv69mrvzO02CkVWpigx5udsXhxqCIz1EHJIvRK/
	 +xWf9AOfDtNg7db9xAYDNNZrDJm1nW5iqYFlNi2IYNt4TzAFHBx/dlmnEf5XDSN4eMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ehHEymiP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PcmqU5zH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C0F606A326
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74C0F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ehHEymiP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PcmqU5zH
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAubCZ1025305
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2e1f8mH50dVq3zUP41WlpUgQLkq7jx1cCFUDQDKor2E=; b=ehHEymiP2vHy9XnQ
	ME9obw6CtHFbeMT2Aw/3n6M3lSRaUO5J5xly4qxrWUub6qa6o/aDmymIFsNuD6rT
	644KKRGOjTuyAx+fISCxw5uJzuDgb3429BOIaPk5s8uvOdXZDPyIGf5v6I5yrSpS
	eG9gVyRdOpcHf/yHojuxyBpiDDGpjCk5RAvPmX2bWeNF/QXJQ2UH/KPhZ0stBiD8
	+Q/roXCceCYAKGJzSpktDc9qmshL8ojn/FiFneH7pSJax52Y4G01J7aA9SwOoIlG
	s4sH3UhufW4ODC3m8EcaIln+HSmK1V1JJPL6M8nKYx8fIf1NBfGrXRsu4TGJXOla
	Of08Xw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt37xd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:27:59 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b4d1cfe3cdso43492627b3.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530479; x=1796135279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2e1f8mH50dVq3zUP41WlpUgQLkq7jx1cCFUDQDKor2E=;
        b=PcmqU5zHSjvRIMQaNxl7yItDrLmz18KHkmTGRDNXxKz2QDcq/YwLiNuiIwFk6c7qly
         REZ6ldKYWxdRd4q1Oaq4+5qYxb/D7uS0fmLwVfDoa5aGzuQNttN2wcflolu79DE35VWT
         i274p/5JosmQFRv6Sh7E0aOwlBWOubsNfDTVOso15lXWHb6gCfD8m/KXdkEFQqU46ljj
         ydUSTtnuyEz/3fmNnAEHP4t618GIvSoSSXPs2m2+tede7nhT5uyZm4Jug7cWIFOKsCUK
         dYw0C9bYhLSEmipDV8u8CKuinuk2pHYnOgCt8nXx8EI4oS3kj3RwAw/BmjW8clqAlzm3
         jNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530479; x=1796135279;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2e1f8mH50dVq3zUP41WlpUgQLkq7jx1cCFUDQDKor2E=;
        b=UoHETgHl8qG0q7ftEgFuaWG8Z+BEARhU0BHU2lOCpt0lcaCRowMxJi6EKhdZlc15Iw
         aPk0medrZv8ujbY11nLD9LPWu3446fmvKgHnLUDnHaJ28Boo1l7mGJMunfM8wXKsfblY
         QCAiGyOAyBmHr9YcQUz62GQHV0dS7iLIv1YVxeWdLPifWW6jyDar8Kgrpnb49GfLCi5j
         WWpKbs0VZAFcFtoWI6YanGyxrfL5E3CKvaTZ1Taa17UxD6VKxn/q7Noy1tP/dQm4Uz95
         Ex++CAJsHmYPl66flxRRuZSZRnNYqy3BPlhFWSY0oxJnXORzOkeacaytY6rOtnKFsxJ+
         lcJw==
X-Forwarded-Encrypted: i=1; AL+hErGW+pt4GQbLeTO6phD1Dk5RPgCMjxced3eQgWIswFFlhUwInlqjwWZCp4jsuCvN8VOG1JDZbmwgQPTK@vger.kernel.org
X-Gm-Message-State: APuU4Z9pTYgZFpKCt0zJOT6GrzyR30MysNyC5kytCE74j2cxbktHr1tC
	6ubzyOOX86FrrCz1BCYdLpte6eyctv1JDxQImEK1v+K3FV/mWVjnJlCESLIubqDdy8D380i9tj3
	RQiXnBI/viXZ6v9KjBR8wu5OqKkYdECNEKko9wDkwYe366/IXuF5FQ1Tkgx3B7FEF
X-Gm-Gg: AZFdTZeGKo795tyQASMzzFYJ/L7AFqv+U6KRMb6QuX665Ge3cajhoapYYP0bn/36Rc9
	QXwKOKDvFVZRMYXWaPTvcu75XFqLe/h/nEI5BWD8JzgjGV16ikGK2NZZCJ7PH9A/f+KEmWxsD1/
	zsalKGGsDf13YT/V+lMRbH0htM0FMEwnO6GXXU9FOjBVgFdrcdXQ7lnm74IRsBLqyszPb8yCjAk
	kaywQ79AnzwArpbysA2wwAR7mU8XtCoXuWCfq7NfUpkweEkE+9tJ7MbE8HIcQbMdzj0khzKP1HI
	xcGICgBQYcsL+oRwk206MsohUuglF+l1E3caXjB5hoVI7pmAWCX9iP/dhkiGk2v23nyfSC3uwBv
	2sgG6TCj8HVcMIDoaOaGVydq8YW0DDm1flLGJx+/tKTHiDtNwaqq0LqfSY8eTbY/2zIjEoJt2Ki
	0kMFjA6djDo0tXizWOvd/BvrVI8VPsxghrNw==
X-Received: by 2002:a05:690e:801:10b0:67d:bbf9:11d4 with SMTP id 956f58d0204a3-67df44b7404mr4067709d50.78.1795530478736;
        Tue, 24 Nov 2026 06:27:58 -0800 (PST)
X-Received: by 2002:a05:690e:801:10b0:67d:bbf9:11d4 with SMTP id 956f58d0204a3-67df44b7404mr4067679d50.78.1795530478139;
        Tue, 24 Nov 2026 06:27:58 -0800 (PST)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33554b5sm7035521d50.13.2026.11.24.06.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 06:27:57 -0800 (PST)
Message-ID: <748d38da-fb00-4f76-9b58-87ad0fe9b770@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 06:27:53 -0800
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
Subject: Re: [PATCH ath-next v3 01/15] dt-bindings: net: wireless: add ath12k
 wifi device QCN9575
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v3-1-9875d2a3953f@oss.qualcomm.com>
 <20261121-lobster-of-unearthly-variation-e75ea9@quoll>
 <f2f50403-fa42-4ee2-bb22-c78309590196@oss.qualcomm.com>
 <f513c601-ef8b-4524-9c56-d3d121c8df2a@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f513c601-ef8b-4524-9c56-d3d121c8df2a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfXyIPP0VVgB2xh
 tQ7UPL3olCTZu0qJ2InKaiNvT1I7CHVELWfcq9e6ah9McJia3ry7ctnLLEHZQPlHyvsDkPqZACN
 rr7faPlnQYmOogK9O4dwb9mOJiGiyco=
X-Proofpoint-GUID: pShIhrSE86xiYVUAJf2sCbx1M8xVfILK
X-Proofpoint-ORIG-GUID: pShIhrSE86xiYVUAJf2sCbx1M8xVfILK
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b059eef cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=UQl-3I4BsUNNjRoNwgMA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfXzo/dbELwTi6z
 InZIfTKyqY5Cod0TakNQO+xmEQNCQHtX0vI+tQYU1oYdhj+Ucv4Z3AXuig3nP9faRnSUlbhQNuF
 CqRhsTrgr2GOEgZ1vNGDvwDAg4Zj5H9g4iMn5kJxWxfPjVlOLQi91/aRpGZhWY2P5hg6QjlyZqg
 6VcE27lJ0cBiBg8BJam//r3RS1QwQhXoDIB9R04TvYpDLq+fMbztJlUwXVAkXZv3oMP5GUTmKZ6
 OdeGimifbPdU6UtPUsAlLF59w14kE3F5z0MqDW0jcNVb7k3fUJ8vIOZIaGP06fhelX23msMTjtd
 sG+euQx+/5sMUGIekRLYkNnHmetBBmYgXRexkSaKrr2fRXuK+xkEJfh5CMAXRyzrUEG4IIXtGl0
 EsORp2K0xG7oBnpOc56vLzBenC3Q6TZ+0Mec77RV+rUXuwV1V3ed+gdoJIohY6ZkY6xAW0P1kyT
 kUidZ29ftkphlg9FKIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

On 11/23/2026 7:59 AM, Krzysztof Kozlowski wrote:
> On 23/11/2026 16:54, Jeff Johnson wrote:
>> Specifically for the DT issue, the original version of this series vetted
>> internally did have a patch to add the device in the PCI registration table,
>> but it was decided to drop it from this patchset when posting to public. We
>> can also drop the DT patch until the point the PCI registration comes.
> 
> Still does not explain why do we want bindings without users...
Concur, and I've asked him to drop the DT change until the series that
introduces the user.

/jeff
