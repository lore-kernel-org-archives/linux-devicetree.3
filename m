Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC893914F0
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 08:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780993112; cv=none; b=jBgV0I0z969HY85MkRmfJjyfL3zcOViiyXGGquMlqD7yqSJUoc15hlXOxVToY1BmOK7g3LcQXzFcFevlTIq0kaEicb15/L3G/QsLGl2Lu+7o9g7S7vm1hQphT3M9zvHjHkTFEAh9lNDmHJjdo/T7tudU08uJmntaextMtGenU4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780993112; c=relaxed/simple;
	bh=d3GZnN8UQfkikNLz4vsXIpHvkczGRKdSLAEdeDoo9lM=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=t+wgBp9H3dpztouAtyU0lgidyRyKrjANF6y0dTd2XP8moQpug6mnxVNdsO5rCJxn6g77oC579wA3FZOXrA8gZPj+mVy6nEnsZZue0/Uk9qx10wsFGUosJkwVHTzpA47J+XY/KGbRbwwqO4bs9rFE5ewEF6uLjJqEA2m6hQGjfGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cK/DhW4j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ts7rUfTK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cK/DhW4j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ts7rUfTK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rs9s2001605
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 08:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1dRMGTV9py53MZ2FkCK9l45pziSarp0xLb3O9u+owlE=; b=cK/DhW4jUYza6lHl
	CFTV9GA+N+UuU0cQYAbgs+3575BGaAqUWCp9EIhv6lmlulEC7khNzgs/i8kXkcfk
	eNnH8HQF0m1a0Cxk4TiJ5LJ+Xhz/eA5yyEGi4XqRmbQO5LC0muD5q+SCLYCGFhxS
	5nXVXMe5IeUx4yh+GAWCR5PyIsuXNjaHhVuKKCrUgfSh78tMmr5ceXnpUJ1T6DX/
	KnUMz64IKgf3D12+utXcgpKjBg3W5Y+WN2hpBJ0KgOEU7IDhMwZyObOBbbxXmkkO
	m5LgQAmAjHlHxW9N/JDd0vIfFYgYs4yM1wIwsZVu4qwg6jKOuQQvRB6VpisPvr2Z
	EZ9QXw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25rang-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 08:18:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d992fa39eso6442653a91.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 01:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780993109; x=1781597909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1dRMGTV9py53MZ2FkCK9l45pziSarp0xLb3O9u+owlE=;
        b=Ts7rUfTKbzQp7bL3nVozi7gqQypRBE2dugvs3U9HDCAK8dUvFGFzZrexKxnRIqGv24
         bgeBakXQMuNx7fLs7IBSVTXK4wwCX7Xvc3cButTQ9be9c2lt4LBxJyeBYGDXmJZG6gCm
         XTT57KEod6BCTGCWq21sZUkXN2nkPUHFh+Cv20ZfD1bV6t8ey20BFlkqsuRnXVpn2KwG
         hARdCCVfmKfvf31RSaVFVB/Hzn4m4ceTHBAoTNsgQ5ANuVQaXF7TeBSta9oio11D8r6f
         VmBkrVjWoQ9TsCJcWi8PaDkygO8FtMhFPAIalk1cC/Gyz25+mzJsK14X5RLERQwRThuw
         8yUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780993109; x=1781597909;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1dRMGTV9py53MZ2FkCK9l45pziSarp0xLb3O9u+owlE=;
        b=pLxB/Z4jqVRx/dAno6SDbxzgCbcevRZMG5Wr81AZImT0DBzKp8e9F9v+/qYqes1mEC
         7043sOTMT5v9YgvWQZNr0dYgogluX1LAgEq+i7/oC+Sn+H8U516vmNRT+W+4I5sCXxZM
         Gn2msE9U80f444nsszHdTXaJCN4RrszuC32yPfSBTeNXusFT5KUAHd8K5ilAcucHYery
         voBZh0v/uKr00lSOhXwWWonS5hYb3gEYIXFRYvCt3Vu5jMPT5WVJCR2wwYh9SlviXk8H
         2L45QRxWX1RLrgChsloejbz5S0b8Tg9nuYlj+qDkWdvhS2vBdqMzRQ8JtHoSHQxhofro
         9aWw==
X-Forwarded-Encrypted: i=1; AFNElJ/TC7HjLBCs4Ogr1rrVsyjOcRyg7pJzFLyGHWPqJPbrGwJwhsihpV1F4NDER44D4ZtjU5ELi/7toT7S@vger.kernel.org
X-Gm-Message-State: AOJu0YybIJzkxP1zrJJXMaFuKTSX0HwogwU4F4OfJKKMmkYlpLrnVvVp
	+0uEGIfczX8fpksCrkqleYvGMt8VFOm07XBUFuZ02/eXnsV/P8F+Hrb/nxAqgRBhdxA251RSG61
	wXBDZKTWhL0ueN3pAhapmHh6zNzpCgA+LlsmMJCAJpuPZLrRAE2/9Zpeb9R32guI6
X-Gm-Gg: Acq92OHxt4rEQR1OGrlxN/xJGlShDjjAhoLILiFyiYsZufe9lxieriN/rsrP312eB3F
	Y3EIQCiomg8BiwlPH0W0yvuntN2l2OdP+y11Qw8Zd03tCYE/akejWbMvpjC9iLpz/DsYs0ijSNZ
	D6lvZU32bXdLRAGd1XFnssTui+yntL8de+Y+veo4Iw2lgHtl38Dm8ioOzYO96LVQ0eSf/en4JYO
	BzjpjyvSaeWRr5fohCjDjreUZqqCv1APqIPBgLE3iNSasQU3CqtWTa8u0OEA3KXYA9T2WkoJpEm
	SbC1oofyj8ZJAQ91dGbU4WKTOLJ0KrwNOaXqxeB7FAjse6d5W5d8AY9+hFn1se0xuU+ZlMvT9pC
	aI2u2jchQ3l4Ay5+dRhDRxBT/WxWqNrm0dU5AZIkodr3rvMxt2cubhRcx1+Ji
X-Received: by 2002:a17:90b:554e:b0:36a:8ce7:b879 with SMTP id 98e67ed59e1d1-370eec10e2dmr20921349a91.5.1780993108922;
        Tue, 09 Jun 2026 01:18:28 -0700 (PDT)
X-Received: by 2002:a17:90b:554e:b0:36a:8ce7:b879 with SMTP id 98e67ed59e1d1-370eec10e2dmr20921311a91.5.1780993108480;
        Tue, 09 Jun 2026 01:18:28 -0700 (PDT)
Received: from [10.217.222.63] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf90a32sm22515470a91.1.2026.06.09.01.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:18:27 -0700 (PDT)
Subject: Re: [PATCH v7 1/3] dt-bindings: mmc: sdhci-msm: Add ICE phandle
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, ulf.hansson@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260608041650.541502-1-neeraj.soni@oss.qualcomm.com>
 <20260608041650.541502-2-neeraj.soni@oss.qualcomm.com>
 <dc833e56-e127-47b7-9ea5-58d6d2cc193a@oss.qualcomm.com>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <c8da8a89-e372-ca87-cdca-396c754ef5d7@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 13:48:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <dc833e56-e127-47b7-9ea5-58d6d2cc193a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JwkeNGIKnqUr-rqLhc3Y00zyTZpfjSoZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3OCBTYWx0ZWRfXzmtE5ENs6HJA
 /NuezTP1d08FHt2nmBKkpI8sApNUuxUHON/gujXB/ICqNEAP4+p307mRRKalMwuYq2KZ3Uu841K
 3UpSutogUdrpNCQZdSHqS0eGQPU/2Ng2eLJO38w15X9qsMsZzH2QVxQENDRMlbERzsQ8dBpX/W7
 QdlCTkeV7QK7L6ibSicf5t0WfgXxu2bgsWARZNR9+uCQJP9BBjrJQH7CFnT9WpN17wimPXD4Ezi
 fkmj7wfM/TYXI3rAY14oMLQTrkhS+XLzYUj3qxX0ugH6h8l5fyvTrebBq9IRqg6esjVYm+8O7an
 RtUkbdvV40hOReqDVcTI3CBuDfl4F91Ji8XSFMeDujbNA8MncEP7bWaeI0Nk9ZDLBCzs0WuGkvS
 4jU0sDH9muKdcOkxfU88VA/EfNEhvLgcnqFInNnLb2TJQ7m/K1u6SeG6aecx7AvPUIORLYTdemr
 sZpSl+SKNB/ehWwqcmw==
X-Proofpoint-GUID: JwkeNGIKnqUr-rqLhc3Y00zyTZpfjSoZ
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a27cc55 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=KxNIBlHTTW4pjOSnca8A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090078



On 6/8/2026 11:40 AM, Kuldeep Singh wrote:
> On 08-06-2026 09:46, Neeraj Soni wrote:
>> Starting with sc7280(kodiak), the ICE will have its own device-tree node.
>> So add the qcom,ice property to reference it.
>>
>> To avoid double-modeling, when qcom,ice is present, disallow an embedded
>> ICE register region in the SDHCI node. Older SoCs without ICE remain
>> valid as no additional requirement is imposed.
>>
>> Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>> Co-developed-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
>> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
>> Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Link: https://lore.kernel.org/r/20260310113557.348502-2-neeraj.soni@oss.qualcomm.com
>> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> 
> Link should go below "---" to specify previous discussions.
> 
> Usually maintainers add link of patchset being merged here while merging
> changes in their tree but authors don't add it here.
> 
Do not see any such restrictions here https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Regards,
Neeraj

