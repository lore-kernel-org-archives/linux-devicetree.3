Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC8233A033
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 21:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785619922; cv=none; b=iW0iJ9lUSiIdk3ZxhXtWJ0P3z2e7BemAl1XW4DtQk75PghMimyrutyq+4u4/ybnJ/yh1frTTs1cRbgaWgbTDyc2ZbuHlg3dS+koTtq+t7QgqUqQgvg/PlDznFkDCorbHa3ju13vP8xyrGrU6p/3GoAZ4FeCBui4Az2DggWCs/Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785619922; c=relaxed/simple;
	bh=9/50LSwQ00kegAsR4xcBTdY/nPpAPvTUHzPhkLRj4fU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fD5orkaqoAIqGVRhGV0GJsJswUBBOtYrhFQ8WsHte4rR9REIa6D3jjfXZTWkYQ/rBwcOJcDhhw2LHrJBAx+DY95+8MCwIN05V9dRmeSyd8Q7EdhrcZuvNwJ+VkQFIuiv1qx1kqPxEiHuWizbp5A9PmHenxYm+aEQmn3+C1V5y90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3qMTtSb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=To+eeEWH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3qMTtSb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="To+eeEWH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671J0R2c4034452
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 21:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cr7MRvs54SDsVpd2q+AMYbFqxdS0ZlCT2xHn7jfkAx4=; b=T3qMTtSbYxFXGlcn
	yOYqvz0urxIJnPNYWVFSFyJnaOjxj3YgL2YBSf2u0fmqm0sQj/JJ0XzD0013XdSw
	+ubhYGsfDcFMWWydebdHvnDt5y3Q1V6FIzT3bvGIU3rDkWejtB4B888Qh95TrhVI
	OD9i4KPin8tDIrfdJVMjE8GkgTF0SwhmgauA+w8mZ6cc36oyOLYnDKsC6l6y3R+A
	3iviNvWLcU6ljg+6+547lkWuxKSzqyUrJGd5sFxSD7KnbKu7ikEON35pom0sITAs
	e92118QFFKg+hyC5+nToLdV9yOJWYa+7xMdnXz4AoFGg4YPr3y+eLSArGgyMR4dl
	EPgP7g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8q51s7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 21:32:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bff5c7035so43443391cf.2
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 14:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785619919; x=1786224719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cr7MRvs54SDsVpd2q+AMYbFqxdS0ZlCT2xHn7jfkAx4=;
        b=To+eeEWHGywggiv8PG9eErEiEkKcJ8+4jgk6otRl1HMF9bIGiw0UDx5konbmsyAgT6
         0YJ/lQExBpTy3UChrUJCQ16UIPd8e6ntx6bbdAlKBIIJPWk5sTfMwDlQbm8Zfm8FVrqh
         hVqmko0JSUTL9LNqVsjNUQc0av0W9OdwQoTQny/EIXlVZavV9oXqFa4gXsISOxQZ4vBA
         +3BC58OQgNp+uDNejwXtMOie3A9g638xgTS+8XYypKp6ZSuslqnxZimGQuA6xkBoz7Ur
         hujPfRwtQbT5X4lU1CTnghm6ZWVPypFF4JqMIIwiH1IH2R6NHdDI9otdx082vkXF42kw
         JaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785619919; x=1786224719;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cr7MRvs54SDsVpd2q+AMYbFqxdS0ZlCT2xHn7jfkAx4=;
        b=DtJ64bc2Jy5fnD1btdNXEwQhOgPaRESpM7JDxTyPLh1a+VHcNTwaIFKkCGUSNg9tRd
         MelLWlfWPH6apJZxFVKGOPjVVdikR+t/zM24hCwX24JHtrLR8xMc/c9vIVEuExoxG2mN
         luy1OPgsRlvOt7NljTZIwS8qf0KprPUKc/UBvW2XjfU7qn/BuK9T0Ggz0SK6ZZuJG401
         gDL2JYX81gzFYJHCktJEWYkOmbM561R5Lk/fb1q6jyC/a++4qqsmz2Sdllwu8xQt5djC
         lOuPpwVqtgoIqwJX/NrFItN3eQ8t8BqmivgSKe9TcUX6Wh+qtU1rvLum4kc37za2NZpN
         7q2g==
X-Gm-Message-State: AOJu0Yws7RNv3Yei3kGWWOYZnRWRftIiR1Da+JoefBuiKCB9ObLQJXG9
	dKBpXsUB8rFOWmNsQlyOCz/RU0Tc2GCGOayJyzUbCFMCnkANrGHrZE2H1mD2dwByctJ2+0506o5
	afZhIqIZZgmJBH8YF6I0ojNtWGsvgNXv/cSHjrIYgrnHq5hR55y2PoYGPefOvLRnM
X-Gm-Gg: AR+sD13CclD/ZpO4RcVL+NDoNJeYGN62BDhi23qPum+ckREOgnz9NzXPSPOH6Lk42Vw
	BR6ClWn0Xze43h3Ko9fVYvubEY5QgatQV2wPJV6iK4RiPb8VP1vlD9MTOroF0L8d4OrpNOXsiW1
	rZaAluuatIqByj7WSUvz2Ru7t6qzwFjbyNGLKZu6Gvi2Rb698q20wRfbYhnUJvXzn+vcIskaedg
	SxSYBSrfYG8CHEmk6FRdv7PosBc+1JQsuZNhzHiI1PvB3IpwaUm6DyfbMyLln09VuCowjK9EoK5
	lFZTR11qIeLiiMuvfWUVpT3n/5PaXlCWJnAEYwuufKBimqDzFjMhiFMDgmEu16StD76f0E8GlXH
	Hjnrz2f6Rjzyt15ARGC7B9QrSRzuRPQ==
X-Received: by 2002:a05:622a:5805:b0:51c:9ab2:dfd2 with SMTP id d75a77b69052e-52b56791f4dmr111381191cf.33.1785619919607;
        Sat, 01 Aug 2026 14:31:59 -0700 (PDT)
X-Received: by 2002:a05:622a:5805:b0:51c:9ab2:dfd2 with SMTP id d75a77b69052e-52b56791f4dmr111380821cf.33.1785619919069;
        Sat, 01 Aug 2026 14:31:59 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4980878dbaesm141573405e9.12.2026.08.01.14.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 14:31:57 -0700 (PDT)
Message-ID: <2e52b5d8-9499-447d-a329-166d50723bba@oss.qualcomm.com>
Date: Sat, 1 Aug 2026 23:31:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] dtc: dt-check-style: Handle sorting of top-level
 nodes and properties
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
 <20260726-n-dts-style-checker-continued-v1-4-b05b8f897670@oss.qualcomm.com>
 <20260726155702.DA55C1F000E9@smtp.kernel.org>
 <7177d789-5544-43ad-977a-faf64681788c@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <7177d789-5544-43ad-977a-faf64681788c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE3MiBTYWx0ZWRfXwfVVGmLMQ8oi
 UIYlHQ77ZKw072xhj/P9dc3aeB37X2GkxJMTcHActs3Cgirnax8uloOclUYRfgDO+VLBF6lduOp
 u2FYTBVLeEaTQdTGUPrEU89zRXUg4aU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE3MiBTYWx0ZWRfXzNsD0BtyAcQW
 hQHq0GUPJ98O1cIQKuv4zrjvPmT58ldxNrgNNFMjd6uIiQm54/7Mf+zyfKgxEr4XJKQdO9D7/L1
 xxZOMe6dzz406TD0OIrqe5ifGSQpS+cYhjUcYJpsP1lHYNgFDsDSCiWJ59IhXqxs+rb2PuiE30Y
 W6J5v8Bpfbzr5ckLwkRulbgGrC6nc7NaUPrFXcXyeReLDx+l5FuSdU6FkW3AF1+SyckuCtLMLPM
 UQtlVZUq/ldbu0i9q5SuqhwmzHEq+lek4Ur5xvxY+Db/bbV+g5UeiNNw7y1ialVK0o7uPx11i4H
 2Zhbe6si0DHUu99IqWIonq+unar+XQiEV6OIaBqfriRt+y4LK7vWd5Bfdc8ttcwfY+c/MSTThv7
 AogG9Bg6eQXZ8jXD75cxmqKSp97N6GcAM0JmdmuY8uXXdhC1P7Hyowmr7NkWXQKHKXS+tVKieTA
 navCXQpoLnSRPa3EiVA==
X-Proofpoint-GUID: CVyYybB2uI5b_khPgimw6RMTU1wseZV1
X-Authority-Analysis: v=2.4 cv=IYC3n2qa c=1 sm=1 tr=0 ts=6a6e65d0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=W8r6g5I5hucPXnWxlx8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: CVyYybB2uI5b_khPgimw6RMTU1wseZV1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010172

On 01/08/2026 23:19, Krzysztof Kozlowski wrote:
> On 26/07/2026 17:57, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>> - [Medium] Tree hierarchy tracking in `_walk_bodies()` is broken, incorrectly assigning closed sibling nodes as parents to subsequent siblings.
>> - [Medium] `_property_bucket_root()` collapses standard and vendor properties into a single bucket, breaking canonical property ordering at the root node.
>> - [Medium] Top-level addressed nodes are exempted from address sorting but are never subjected to the node name sorting claimed in the commit message.
>> --
>>
>> --- Patch [4]: [PATCH 4/9] dtc: dt-check-style: Handle sorting of top-level nodes and properties ---
>> commit d752014f34dc3d4a2a9f9617748ec741da0cb1c5
>> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> dtc: dt-check-style: Handle sorting of top-level nodes and properties
>>
>> This commit updates the DTS styling rules for top-level nodes and properties.
>> It skips unit-address sorting for root nodes since they mix unit and non-unit
>> addresses. It also adds a special case for the 'model' property to sort before
>> 'compatible' at the root node.
>>
>>> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
>>> index 1937c6feb57ec..db4451e30dfbc 100755
>>> --- a/scripts/dtc/dt-check-style
>>> +++ b/scripts/dtc/dt-check-style
>>
>> [ ... ]
>>
>>> @@ -496,15 +497,21 @@ def _walk_bodies(lines):
>>>      in the input. Skips ref-nodes (&label) since those don't have an
>>>      intrinsic ordering."""
>>>      body_stack = [[]]
>>> +    node_stack = [[]]
>>> +    parent_dl = None
>>>      for dl in lines:
>>>          if dl.linetype == LineType.NODE_OPEN:
>>> +            dl.parent = parent_dl
>>> +            node_stack.append(dl)
>>>              body_stack[-1].append(dl)
>>>              body_stack.append([])
>>> +            parent_dl = dl
>>>              continue
>>>          if dl.linetype == LineType.NODE_CLOSE:
>>>              if len(body_stack) <= 1:
>>>                  # Unbalanced; ignore to avoid crashing on malformed input
>>>                  continue
>>> +            parent_dl = node_stack.pop()
>>
>> [Severity: Medium]
>> Does this pop the node that just closed instead of the actual parent?
>>
>> When node_stack.pop() is called here, it returns the node that just closed
>> because that was the last one appended. Does this cause subsequent siblings
> 
> That's intended, since we go up in the hierarchy. Current parent should
> be now what we left on the stack.

Actually this was right.

Best regards,
Krzysztof
