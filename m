Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4707031E835
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784613907; cv=none; b=uCkJoTkaKQwv9n/vCk1cVnlDwjdOPUNm/+uXhBlFF0HKluZDfu6dRcdMGrWreodoKZAfE2cU2ujzg8VN52OFJkaFibG2KcdftLPzAYVBvk8Km8ec4osUUkAiw8rAj9uuPTn3GoVKUbGSThXRObV/LcTqUgrSpMX/4uXvPSy/Rb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784613907; c=relaxed/simple;
	bh=rJCJHYF5qksfCFU8hXrYHh66ad33rs1xje6QIf+t5vE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aKfoKMU6C9AyvSDBvRtS9paBHrcaqR5sSpkLQvcs05/q0oy2awrWX+GropCHXJIsmRio+CRHbo6bS+eIaB4nbDF8L73lyD06YUkiCN5JdSJYiRdtYGOmndKzVA7Obuh5rl04GPmWJCWJ4LQtpY1UAV4/fAzjyaauLW12Ulopz54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hacbZj/7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cvg3+pkd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hacbZj/7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cvg3+pkd"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCnnD4107224
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SWd1oTmkq5zMhFDmPKRzG6HslTzweIEq0sjoAwJFuIc=; b=hacbZj/7A3DZPG75
	eJhIAAMbcSocbse+DwrjWiwhbvG5Gm7PYig15eLHdy2RvZypY+1GjF3rcFpKqZo5
	pM6FN1RJs9LNpzRrPDjWLFdkPWiVBHWVBp5MUvQWJtWnoDmPrNdCb51ZaNnmarrM
	nJOZdDZ0DxJXxne/n1XOszhI3ygdxw4BksJgdcl939aSfEoO6sUMZvwabM8SKrdI
	M/kq/TtEJKbsxHVWYWWQEWRMlFt6MuBvClKdT3YkmSypSAMXpthfWJLsjzaJ56Tx
	0eoGd3+uPJbXYyBQ75aypEiLxQKLc8yE/375sAT+ptES9fk97PpQmtRfQGwSmqD+
	FY0cQA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhvqn9d6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:05:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8b0a08d2so159574831cf.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 23:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784613904; x=1785218704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SWd1oTmkq5zMhFDmPKRzG6HslTzweIEq0sjoAwJFuIc=;
        b=Cvg3+pkdBA38ebJbGirm3AEXopDxIKowsq8pmv6h9L1JiiIKPO6r5UlrRUoNcZ/zKv
         ib39la8U+KI+UnEzuO6Hxz0wbbEB/R8w5sMvX1xZ+FbbX8PCJyQfgVg5Vp/H4bApyQY6
         Moz1wkF7tX2OxKO9t1UjFtJhc351QrpscSjhqv2fKY/TCyuJICVaLJogc7GYdFB9lyNr
         Or710Tqtd2BTh4eGQLpPQyVmoS9iUM8q2729pjFMLYJKaP/miguVYubUTOjNUjgbDiJU
         OKmYl6voub1+ROZ2zjumHIndmJ2d6g8XUUhvpqRcFndAp/wPkoOLTzvjZw9lzRTqfP9f
         hzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784613904; x=1785218704;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWd1oTmkq5zMhFDmPKRzG6HslTzweIEq0sjoAwJFuIc=;
        b=biOwH3vYPDb5pWAkA+HjIAMbg972s2VgN8HZeDzEuE1bMP9O9lIngRozuUdq+SWrFO
         Xq7hHkjTeO3L5v0cWBm8PXhPDKqwqF+7uTaZUXbqlDitxtcEuD5XmsTv4ki3WYoURkk1
         R/bjeey5peZ8drys/iOn5et6BGU2BOn9Cj7xNFSJxGX3ws6ESG9bJo5C1UOIevQGPvFa
         4g42i5ubdn0wCLVmERa2vH66RdbhfIYxUsJmn5902Y4Z9wEJIRKQ0kEhFJT2WlF0lMEb
         c6JbxLyBfVqsfss1Exb7zBIS8QDdYLOqXU0JZMaZZpog8MGezdF6JidazfV2vz9Nkut7
         nFJQ==
X-Forwarded-Encrypted: i=1; AHgh+RqD4S8K0H+dVPkgASRMZI8KdUynm0oM6nSVc559yo2CPsBCmuV5Q6GLmMX46Nw7937AheUis+FY4jB0@vger.kernel.org
X-Gm-Message-State: AOJu0YwYImzkPcilPK1bWt77vbtw41z9PwuJji5XE3695k0pIBjq1lE6
	toOH7BuBTOH2ewH3TGAFvsygYEch9jBPMN9yr7ZGl9KWbIdsZGumLkX03wQyMsRgA7zX76SQ9gJ
	J7pyWrT9P/rj1p+DmE9ixXQNpSJ7Cm38zkeKkdAvN47W5wI/2MGVV7iyco2qix8tW
X-Gm-Gg: AfdE7clVBF5HUhUFQ2iPxN0SwzDW5NvkSwrFQsUWl5PC+QUIuhNwbwMvOstPzQohC0s
	qpyhpxc/RRXMeDQe2I8OzSaQTQCwXA6SoMBHY6fonSTyL+sT5e1yprKy/lWLMofslwUx2zlkYa1
	Z6Ypdvmmsfb+nviKnE8ICaxp9+KP+3Aef8tqnWv33WeCLVorxEZC7JQcvlWL9CUFnUH8ak8FdJH
	ny4PF7CJVFzsgzqVP3yTEGlkl2PSSd99kpaoE0LBIqxOrIDnCiAgVU2lCZfmx04tLqWastwzVpS
	rWy2Wgg2RpI56tdboZBUHR/zrFdn+KTX1+3es3b/psMvIkKECpaB+D83FTWcU2QKcMc4Jacwdae
	L9/cGo7OEuH9tSnkkCdySJRJL8lWRuw==
X-Received: by 2002:a05:622a:c85:b0:519:e020:6087 with SMTP id d75a77b69052e-5213c013438mr166392621cf.11.1784613904387;
        Mon, 20 Jul 2026 23:05:04 -0700 (PDT)
X-Received: by 2002:a05:622a:c85:b0:519:e020:6087 with SMTP id d75a77b69052e-5213c013438mr166392401cf.11.1784613903854;
        Mon, 20 Jul 2026 23:05:03 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49548e0fcdbsm288078675e9.2.2026.07.20.23.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 23:05:03 -0700 (PDT)
Message-ID: <bd1971cb-1c32-4b89-8678-6828214b12a7@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 08:05:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: dt: maintainer: Add Devicetree and OF maintainer
 profile document
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Saravana Kannan <saravanak@kernel.org>
References: <20260720184040.9870-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAL_JsqKkxVTVE=o-uar=JEVvqw9NhBAQcBrJ0ukf+RBXCwFZJA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAL_JsqKkxVTVE=o-uar=JEVvqw9NhBAQcBrJ0ukf+RBXCwFZJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2MSBTYWx0ZWRfX+83UxZ0/YcKF
 5QHuKHnrLvReDrwI1GLw+9iGK27rZ5Ux8uxzL6VqyJ3fDJhm4elwmG0DNNistcDj3Idt6iFsvSi
 m2NKGP4PfrEtxSxOaYGIe2vUN83A4vFNZ847paiLpcIKFB9uU3HRMXNGc1aJXBQ0203UVVCWkU/
 UtWO+Mg0UJl9CTajmaD9PHyAYd0dQi4KlFnWfuYyxQCiky9Ws3Y8+bEvpX7gRuVfn6HQJaJmiIc
 CtlI9Bvm2rATqD4YhVynS7buOqgg95SYkZVhWgc1fHmPf4ymaEJoOiXlzsJWwHL4VtdAx5J1SA1
 mMvIVaDxZLeCg5D85cPPOZERABwdNQ9nmVbhmbKxBVPnYhuNFDEQSl0oczMgA/LbglPqsxU6cDy
 QaMOcXe+0/g8xdhRgkq0qQ/XaTjA+pQtlPH7K9WxcEo8TWwXOpw0mhdQYiWOLGhNDo5oHkLK8oE
 PRzSWnB7lgOK5H8VCOA==
X-Proofpoint-ORIG-GUID: MemfVBoOINOjItMyEOg6YoXYbsOX8oxs
X-Proofpoint-GUID: MemfVBoOINOjItMyEOg6YoXYbsOX8oxs
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a5f0c11 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bwanYSbnS09AELdfzVIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA2MSBTYWx0ZWRfX5V5T/aC2LIML
 K+nI8BeBk/B3CvyvGwA1HWXwuhhoIX/1tqmKIfUA5cfrCReIbKbbZ9FpFe/TlCcunyv/+fKg/HC
 t2f5JTeX2G43pp4grzGSqGLiWKuWu5Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210061

On 20/07/2026 22:12, Rob Herring wrote:
> On Mon, Jul 20, 2026 at 1:40 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>
>> Document how Devicetree and Open Firmware maintainers handle their
>> subsystem, especially focusing on two caveats:
>>
>> Devicetree subsystem handles patches with a minor difference comparing
>> to other subsystems: while DT maintainers pick up OF code, they only
>> provide review of DT bindings without applying these.
>>
>> All three DT bindings maintainers rely currently on Patchwork and due to
>> enormous amount of emails per day, regardless how much DT maintainers
>> try, they cannot read all the emails.
>>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Saravana Kannan <saravanak@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> I expect patch to be picked up by Rob, after review.
>>
>> Changes in v3:
>> 1. Add also F: entry
>>
>> Changes in v2:
>> 1. Correct typos and trailing white spaces.
>> 2. Fix order of P: after C: in maintainers.
>> ---
>>  .../process/maintainer-devicetree.rst         | 70 +++++++++++++++++++
>>  MAINTAINERS                                   |  3 +
>>  2 files changed, 73 insertions(+)
>>  create mode 100644 Documentation/process/maintainer-devicetree.rst
>>
>> diff --git a/Documentation/process/maintainer-devicetree.rst b/Documentation/process/maintainer-devicetree.rst
>> new file mode 100644
>> index 000000000000..d8ffe752bf5d
>> --- /dev/null
>> +++ b/Documentation/process/maintainer-devicetree.rst
>> @@ -0,0 +1,70 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +======================================
>> +Devicetree and Open Firmware Subsystem
>> +======================================
>> +
>> +Other Process Documents
>> +-----------------------
>> +
>> +Please see the documents in Documentation/devicetree/bindings/ for information
>> +on how to write proper Devicetree bindings and how to submit patches.
>> +
>> +Patch Review and Handling
>> +-------------------------
>> +
>> +Patches handled by Devicetree maintainers are processed differently depending
>> +on the patch type:
>> +
>> +1. Core OF driver code, e.g. drivers/of/:
>> +   patches are reviewed and applied by DT maintainers.
>> +
>> +2. Devicetree bindings:
>> +   patches are reviewed by DT maintainers but, except in certain cases, should
>> +   be applied by subsystem maintainers.  See also *For kernel maintainers* in
>> +   Documentation/devicetree/bindings/submitting-patches.rst.
> 
> I would reword:
> 
> patches are reviewed by DT maintainers, but should be applied by
> subsystem maintainers except in certain cases.
> 
>> +
>> +3. DTS and drivers:
>> +   DT maintainers might provide comments, but review is generally not expected.
> 
> For DTS, we expect to pass schema checks or at least not add new warnings.
> 
> I can address these 2 when applying.
> 

I'll make a v4, no problem.

Best regards,
Krzysztof
