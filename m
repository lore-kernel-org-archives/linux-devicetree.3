Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36FE17B506
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 01:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782781443; cv=none; b=Xt7QZIQJ3xornefmxk0UQqBkxghOWjkiCqrBwpsUopJERxy8ZD2H33aXjJq14q9xDfPBSvBUVX1NTYgqdIbSvGEdzkMAlE/0qXzmQj3pt3RU7cJqNJgMOWMpLUN/dAtaYqYq+8puegfTpuxpUWUoW8vjPdi++4MzAIYaNO2xDEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782781443; c=relaxed/simple;
	bh=iciXgOjan6BYJjLtMXLTaWVJHCUP1lKj/nfBsXvowds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ctlu7J9unsJQuQyRfP0zViXRWfWYO+Dqy3hJZrUUzVNXN//VtuP9SuPw5LOVGrB/iu9Bj08hcG1JbK/YlXQKF9WWUpdwdxILiaIONPyvTp5p9fIeEc8Q+geiAap4ZsU1zyf9Rqiup6PgfLQtHisyFPM+QBAnEe/gpm0aCPArD0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gv93uNyG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZY2Kvf7R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gv93uNyG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZY2Kvf7R"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TKfeNB4018932
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 01:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uk6KE60QR/joKK0/Mcn8xnUgE8cNmgtGBQJrVzVbNLk=; b=gv93uNyGr4XDkHLW
	wnBYc4EtCkHhNCeQQaFsj5y2koZ8EduanBPw4E/GQeHkVE7EwJfhROq4iIX2UkCr
	2xDUUQJMcXFRhn5PpuWlMKUAVSerxjZiuHiPf4PQGblQQbR5CGNGP3eUUFIBRkwG
	wIMUXtdQfw97QAw7qbi8GMmzz+YSCrcM/uptFjF0TqZLEMaYdoN8rZY5HQGxRkxL
	J8t62A9unpII4tb6ZPlZ60pMTAdV7dP1farNzfkCx32xD2dE9pI2BqpRNFKLzx4s
	REh1wlqyVZiAwdntspGDw5dQ/fXU8f+JBzfTYtXXAo74rjkKL84ffwxmq78nHRoN
	AJSDIA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3pdkuefr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 01:04:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847950bb95cso676899b3a.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 18:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782781440; x=1783386240; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uk6KE60QR/joKK0/Mcn8xnUgE8cNmgtGBQJrVzVbNLk=;
        b=ZY2Kvf7RU/LP4amglPt0gZvGOkgIA872Tk0qSgip/SU/k8s/QOA33iD5kGgmoIV+gg
         zNWlN6H3Cp9mVPFqrKW+FFFpfdqOvcmAzcJt4CE0jI/Qz9gWXact+dlSrPVtIrKwLswV
         UM24FQy4qCN7Sfz1DzLEIErwxlAXqFOswf0icnuVW60geAB4FOwcHIH/t0iJDkC9vyuO
         hv0STuiLXAB2cXnWPrpWuIm1gEe2TRKPxJffGwVQCSt1oOqC0PjxmPmgXAqfthROTU8R
         JMNC7lX1q3Sc2rxOl2W1S+by/gJbvupm8viwwpr1PKd1nc4PjAz7UYffI/X0EnbTRHON
         5rZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782781440; x=1783386240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uk6KE60QR/joKK0/Mcn8xnUgE8cNmgtGBQJrVzVbNLk=;
        b=NF5Oq9qkfU+DhhoWS0MO9SQlZRJ0kBJCRf2G58ybS6wyCXvVGflPEENaQ6Mq9n/7WM
         UpY96VvanK58q9K9Hom7q7gPl7cWfarQic0OLHKVwNVGczn0UKpjAvQcGGoM7wcURQ/r
         hMD5g7FvV0hSvACxwdeQuVpFuqDK3TFS4qyiyZi0SuGofho0/b1UtXCk5iJovDeRJXJh
         zNHewgkw0rQsHpmtZ9zEo8mAzbJDI7l1koafWyyEUKYPFUoPJagA+VQtoxx0qbjNQNlc
         MHugaDrp8K7vQVQRyKShEk930xwn0iMVfdK/ClGdQgDPM5GbjX5PYUBpQqubbrVRtfAv
         TQOw==
X-Forwarded-Encrypted: i=1; AHgh+Rq3y/2RefNKAZlscDikVkFvC/iFJDfFJAfcPkoOwE1Exd9J9u1YEMhd2j2BcLZ6FVLoAt6QNLS+nTeg@vger.kernel.org
X-Gm-Message-State: AOJu0YwY0lfE0LCL0+GuTWO4cgeo3FyOoj4ar4v3Sss3oRxg5ERPRYNd
	ww6LzgtipHuoa1dITzU9RpSmH2Kk2USMsROQWD9iKnVGj7pXsgmTq7kIqkS1jPjS7x6kIn7BG/c
	w905XvWC1yrvk1KO/VS3xCOsBDnE+xzvzJv6NH/YUHdTmQb6/Poqjvdaf+A82JEvJhW5lww+dXb
	0=
X-Gm-Gg: AfdE7cm9mAn6IdO2jU3DTqQ13GxGYJ84eTqo/6RkyXKzo+ggWCfvsr+LcajrsLsNAm4
	3xS1ynlxqObvOkw6L9tQJ8unPBEO704YTWg/Sz7gaC9bqgC8lAP8CXO9baic9pYDg4waqFhWZYC
	teEo+7YXn6jF5DbSzmNpZ0qLsjGPjzYnPUTeSkqDsk6CGBTTFCexNNBUOEnW9Qd1+9mCZBNkLux
	dc515PJ3ULTeKfveiCbL4CoWk5UoVyRiAuOSeYKHziSS8E74jTCFrgWkutQeVjnlPc+zGt4p+DT
	XujzJwT57XurgTBLvgnhrMVptIC64R7k0FyXvRw6RWherrN/3icJ8wHeegi67lt+UHrQtAawT0V
	1LcmuBS+eXQKZBOyxHPukX0c6K4+33KHTgfWfoExoQobU7WU3Zj6UQXqE4Wj7D9E8aqOBUCWFeB
	8=
X-Received: by 2002:a05:6a00:f95:b0:845:c6c1:2e36 with SMTP id d2e1a72fcca58-8479f2b7e03mr1230914b3a.28.1782781439739;
        Mon, 29 Jun 2026 18:03:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:f95:b0:845:c6c1:2e36 with SMTP id d2e1a72fcca58-8479f2b7e03mr1230883b3a.28.1782781439252;
        Mon, 29 Jun 2026 18:03:59 -0700 (PDT)
Received: from [10.133.33.20] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02ce355sm650340b3a.37.2026.06.29.18.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 18:03:58 -0700 (PDT)
Message-ID: <adb45638-1787-45cd-b4fd-d957323cc608@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 09:03:52 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <471d7a92-3629-4274-a303-8906d3626037@arm.com>
 <25d7d3a1-58e0-4f25-a73a-59a978130c47@oss.qualcomm.com>
 <20260624151610.GC575984@e132581.arm.com>
 <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
 <20260625085643.GD575984@e132581.arm.com>
 <065853f5-b11b-4316-814e-202f07acb6ea@oss.qualcomm.com>
 <20260626103015.GE575984@e132581.arm.com>
 <c1ac3ab4-f214-4947-b42f-cbc635be6bbb@oss.qualcomm.com>
 <20260626154949.GA1812158@e132581.arm.com>
 <9432df20-08bf-4134-b4b9-e6b5d618af81@oss.qualcomm.com>
 <20260629142848.GB1812158@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260629142848.GB1812158@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a431600 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=_zg4NCnV7t5pwXkA3fMA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: LYxysFKhys4a8d3WQ-TdYFHzZAL_McU0
X-Proofpoint-ORIG-GUID: LYxysFKhys4a8d3WQ-TdYFHzZAL_McU0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDAwNiBTYWx0ZWRfXz1wStkjlwgXD
 pamJVYwT5NuUgRshmBc0wcRjnYkDtqk7iGiBoke5AaymMLRdDdQtDUGQC71wAPCoacQEyK7zkIG
 cPUyF41iJ6sf1/dn1iZWWi2/GCDcejh+x83sIU3uJ4gcRzpZFsQeI9q2216vGXCduFVfZTbBkZ+
 FLgvzO3Bf85Beulo7B0/PJ7qjnBjTFQ1liAdeL7vZeEg9njKSDQxtLkxwk1sooUHjObo5eyoWPJ
 3r3Nlqf2U8jDlphf2cOlRB19N5Te4hIm2P63o5zvBfpKw4P6vACFGHtMIbATylot2yV8W57cyA0
 RBLCS1JWWrzoU+WO5sa69DjTPTkceMMKvQB7mG1yeiBVipUewEpUJIyToAgKwKCavts23PnEr91
 yZCrhzZJ3hJCf2DZKOguvlz1GJZEQ66FbQ9E9eYe5w8v/YyexPBZiaQBV/l45/cj5gayoBJSlPa
 YB3Ajm1aUB4DuWP2yqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDAwNiBTYWx0ZWRfXxbm2vkgIFAut
 1C4VN9/X603wWbP4zTonWKAeham0/3nCyKQ/IwRp588QcCW0NM6bpPOKHf4AJ4trGvrZ6SjgsSU
 LpKRNgj2wN6c0Jq0n9zpi34hSPkCQKc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300006



On 6/29/2026 10:28 PM, Leo Yan wrote:
> On Mon, Jun 29, 2026 at 10:08:17AM +0800, Jie Gan wrote:
> 
> [...]
> 
>> Can I fix the issue by adding "arm,primecell-periphid" property. That's
>> would be the best temp solution as it avoids breaking the original design of
>> both the TraceNoC AMBA driver and interconnect TraceNoC platform driver.
> 
> Before proceeding with the "arm,primecell-periphid" property, could you
> clarify a bit:
> 
>    - For an interconnect TraceNoC, what would be the consequence of
>      enabling ATID? Would it simply be a no-op, or are there any side
>      effects? Or is the concern that the trace IDs could be exhausted?
> 

TPDM0(or ATB source) -> interconnect TraceNoC0 -> Aggregator TraceNoc -> 
sink
TPDM1(or ATB source) -> interconnect TraceNoC1 -> Aggregator TraceNoc -> 
sink

We only have one Aggregator TraceNoC and many interconnect TraceNoC 
devices for one platform. All interconnect TraceNoC devices are 
connected to Aggregator TraceNoC devices in the topology, so the itnoc 
doesnt need an ATID.

That's the design purpose from hardware perspective.


>    - How can you guarantee that a interconnect TraceNoC will never
>      require ATID in the future?
> 

The interconnect TraceNoC is primarily introduced to reduce routing 
complexity in the hardware design. It is typically deployed as an 
intermediate TraceNoC that connects to an Aggregator TraceNoC (AG TraceNoC).

For example, a modem subsystem may contain many TPDM devices. Directly 
connecting every TPDM to the AG TraceNoC would result in significant 
wiring complexity. Instead, an itnoc is placed within the modem 
subsystem to locally aggregate the TPDM connections. All TPDMs first 
connect to the itnoc, and the itnoc then connects to the system-level AG 
TraceNoC.

 From a hardware perspective, there is no fundamental difference between 
an itnoc and an AG TraceNoC. They use the same TraceNoC hardware 
implementation and share the same AMBA bus type. The distinction is 
purely functional: an itnoc is used for local trace aggregation within a 
subsystem, whereas an AG TraceNoC serves as the top-level aggregation 
point for the SoC.

Thanks,
Jie

>> The TraceNoC device here must be treated as an AMBA device and I am
>> continuing to investigate the issue with our hardware team.
> 
>> We aim to fix it from hardware perspetive for existing platforms if possible
>> and ensure it is fixed in future platforms.
> 
> I'm concerned that all of use end up repeatedly fixing similar issues
> whenever hardware configurations change or modules are reused in
> different topologies.
> 
> For example, if future platforms may require ATID support for an
> interconnect TraceNoC, then the issue will pop up again.
> 
> Thanks,
> Leo

