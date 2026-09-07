Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC15B43F0B0
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 08:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770182; cv=none; b=p23n4834a+xitlG5j8Wk6KHFH2aFq5ox2u9ks9a65FoVdliqlLhUU3AilKr7ijMjXDyedTXJy8vkZpe4btmxWLb6xD6YtTExTHAOMRm/g1WHk6h5yDxpw988HsXpCZI20uqKTp4VPziqt33EgbaIZnCzAGId1gqQg/Z1A2Jxja8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770182; c=relaxed/simple;
	bh=EpBUO/pktu1LI8wvjTUn06mzyNUlC5RiWOtI6lhLAN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W6VMq+jdtNY7KZ9RFI8fNJ+i3gyiN3AOm7I9Ty49Sd5xdRzTDxm8k5ycOBxWQSdnMIjADV8DE9sntecV/NM/+2u9pjA9LzqgcM26C5OPN46jrm8yVqpXp83byzqOmX+AEDhexsXQAAIt+58iROUQNVwgmZzFRxsDatZSh+Daa0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a4/mycc7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PJK+SZB1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a4/mycc7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PJK+SZB1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777OTh3352529
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 08:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32WO/Xjsl8YBeCXk6vwKWTCZYT8FK+KYc95D1qtSyg4=; b=a4/mycc7VI8LHTRW
	PvnoRVwH/wOGERBA1yQa40Q/RMmfXKda5WqR2myYw3gu9wdSrE69ojWYoF2JQo8K
	THtCUfpQQMxPifvZATjjGLQEwolM66QXDJToEVZD40jAdV/vopAfkhXMpulOLjR6
	44MYbNdVqeW2ZjYF7uMqbC4oanrz+7EW/lYbrssJOUJNTeacBKALNDvX9UGvM/6x
	m6jD8W6N3HtMVfBhdVVAQOvDo0MhmbcQ5huG18ziEn8OV1yGUjthJqFJDFDo7yEF
	kt5AaByK2nJKBo7tOy6Pp8iXjU4hA+CLiq0PfLh/d/XxxcOwY2VSmVGQ0qG3XDfE
	sKhhIw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66gumj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:36:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c9e97b626so4687361cf.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 01:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770178; x=1789374978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32WO/Xjsl8YBeCXk6vwKWTCZYT8FK+KYc95D1qtSyg4=;
        b=PJK+SZB1wd4Q2tCQVle1fQVf4ID+feyIU/SfAuNfpZ1GH28mYDVvD8IMW+XI0Lunx1
         10no1k+G/1ieS1+VxFYwoWgPULo/V++sP83j+2tT7VMuIoH1tkn9R8haAejrDGr44Shr
         Ry5cUizHrYYcN43CU7nkoDAKJgfaqsXPQvtjTxk2FMv2C1/5R8zp4hvHMrs5uJxsVO5L
         6wEYJtaGLYUj/DuGV4wkpQD0gIDZFi7ytLyiOL6eWKsRYn3VhAyz1mee1lcOOCDGnCYK
         UsImCxy7GyRt4CYy7d0J5XNJFrImjpfNXvIPt1STXqn0rJ1BdlS6bSQYPw2bJKReXS3D
         S43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770178; x=1789374978;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32WO/Xjsl8YBeCXk6vwKWTCZYT8FK+KYc95D1qtSyg4=;
        b=Jrbm94TsHKFV0QnKCtGcFuJkyTUsKFEpVfvJ2IeExyJp8qcV4nJ8kY2dtQzU+8l3UV
         EeTsa7clTW0jXioRZ3mbn+SK7e+9pgQ06/dhVUnNsELqSW59amYKua8jqN6/N0GYRy1p
         TfrKqa5zmRd+6IRYpgYk98Z8r4lnOKQ8PXRMYZbJGw/By3zeQYWozc8y6dYQpovDLJdP
         V8sPcKOr9KM5c+AmsapahpqT6OjN0xgBBSLLZhcyonkIkr055IxWsMlaKGDLdnwXZg9O
         yYxfoXioRqUkHgPRhwLsIZ1eDblm2kfT8PYyX9mhXVz/DOqjekqZBbpFUlR1UrkY3QXe
         VJLg==
X-Gm-Message-State: AFuF++kVE3cw+SO/okkH/n7PBOnwkBlts/5wXv6Pq31EWfIejP78kxZ3
	XpSH/BHOuXNC5yhS5ApMJvW76YjaiOJhS8iz7KeqBuDrh4LY4R0oB8uX0oQR7V7CCO9lhKD4b2B
	h2DnFJ38/EisxiLPq2FliYYEZkamjEThHZ6LOIl9PHuvFA4odT0JJqiu0d16t1JKz
X-Gm-Gg: AYBFou2TiCLctMwxKyWO2lUPkWerzu3yHPhGga64lnXr/xUlKwrXyG2NgfWPetIRfjP
	lFcfl8TGsPE9snFJ3MlDAejc9JBYkcW78kmR2eNJLk/7ynx6rJTSoHvEekn5nHvrfr+Cht2J/vH
	s3ofofP6j49Lfj+NqBwf/Bo+EastnyKmOr1SraTKSTd2PdNLL0iLWfCunYhxE9cV7yXG/dY+1cO
	7OJWKpjQuVHYifZVQjuf0Xi8mqLZ57HNUmTP8f0N+BJjLw67/wExS7Y93nv1FQqvBtVO5NSZ5Up
	74wrnhStYZ0UdEYYjKD+6ZvYSebvQtRuB+aSHX95UwEBesf5kAb/3lK9YNoYHZJ2UhbQ4SDzWJI
	s4zucP20siaNocVTs5t0wtQ==
X-Received: by 2002:a05:622a:3ca:b0:52d:8270:8e36 with SMTP id d75a77b69052e-53064793ba6mr120480021cf.5.1788770178002;
        Mon, 07 Sep 2026 01:36:18 -0700 (PDT)
X-Received: by 2002:a05:622a:3ca:b0:52d:8270:8e36 with SMTP id d75a77b69052e-53064793ba6mr120479771cf.5.1788770177667;
        Mon, 07 Sep 2026 01:36:17 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68c3d88sm3973687a12.15.2026.09.07.01.36.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:36:16 -0700 (PDT)
Message-ID: <b84cb955-2ee4-4865-9bb6-3fec074f451a@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:36:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/4] soc: qcom: Add modemsmem for Google phones
To: david@ixit.cz, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Petr Vorel <petr.vorel@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260906-modemsmem-v1-0-a3634b553841@ixit.cz>
 <20260906-modemsmem-v1-2-a3634b553841@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-modemsmem-v1-2-a3634b553841@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e7782 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=SIia9Xva6E6vu_7LpCQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: qeMYn6JRWzgjbJmpEWspTzkJtyYyeLwr
X-Proofpoint-ORIG-GUID: qeMYn6JRWzgjbJmpEWspTzkJtyYyeLwr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MiBTYWx0ZWRfX2pJsjyAs/3LD
 vuVPkwpTMye/e+m4UZflt3YuJi0Zu1UbPc858Qvt37zPZcLd/BF2pEtQnyKQ8/FB79jKinW+k3o
 c62jEokgx5YkewQJHhSspd/wujXM/1s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MiBTYWx0ZWRfX9TFmK+YIdJI7
 Z1I6vzgEDU3+9hKDCPiq9bKhGaEZc1lgux02p0W+8XurOGxztWUwVG9rR8NIGI0v23IQ+e+xGBK
 fjz99i/uMfw6yVYUHfyYlZEeEYlEkC6RcxF9vroXDUWLe7YA5/fMsTg+QgkQi2bozYx+WmmqKnh
 5Qhog4UMD2HG0M5oAw8DaD+xNzl4btGU/K9x20iL2E/3swNhnIRKV5XxvK6f15Q/T+lsRTmLSNj
 VvYHwMDwRJDezpz5e1gj+uzygUY3C4ssxw6oqj3lEU7tHBZQ7VnAWJsQYL1ANMAXlbVSz5pc8wf
 iVR+3awWtcIvq0kUOGisiqj8+ahqsMYYuIVVB3P4RZcTRnWzGYr378rFF3zNeL5KNw6rKT0Vrog
 /fO5MAAn4Gu44wO9PTOXkFVQwXQEKedpz/j/2YOMaUCHgQkoAo9QVy7VoJZ7eqUY/x8OAmItDlD
 pPfE5KF8+OAaO40vsVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070092

On 9/6/26 2:41 AM, David Heidelberg via B4 Relay wrote:
> From: Richard Acayan <mailingradian@gmail.com>
> 
> Modems on Google Pixel devices require extra information about the
> SoC to be passed through a vendor-controlled Shared Memory (SMEM)
> channel. This driver provides this information.

[...]

> +	ret = of_property_read_u32(dev->of_node, "qcom,smem-id", &smem_id);

Is it ever not 134?

FWIW you may find this useful:

134 - SMEM_ID_VENDOR0
135 - SMEM_ID_VENDOR1
136 - SMEM_ID_VENDOR2

which you may find in various downstream kernel used for various
purposes

Konrad
