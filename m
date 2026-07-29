Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2481C3438BC
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322878; cv=none; b=ik5CT2+4MGKmpZujPBeGmxfG7xj0vFAkGSfj+cpAQYSnpaXeAHbXHJKez/pVoVwsTlZPdjkhLfm8nHGQQvCUFp0mOhSmQ9xSBqYn0iFbQkx5h1Jvqq+QykzRrV1YiR/WI3cbKIUX+pKqe1ltyCS/Ct2R1w3gZkPz10CHoN95qdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322878; c=relaxed/simple;
	bh=0LkBYfAZsJhifD4zPW/pw4O1lnq0kFjI4F2kXScG2Ww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FkM0RzbpZ7Hz9qgHVEYCJQelu4D3k1bzQSjwbb0GlrXgxQeSF6VFyUn0l6CkMips50/2sXRlrZEkOw/imVRiPAVkzkDC1qPcOCVlTVsj+peFhfgyzlhKyN38YxuLbW9VkUyzGU/85r0IipXqInNV+hA+YzdC/tuZsKoWG4/SDMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NeYLVEjh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qmi4snkE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NeYLVEjh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qmi4snkE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7fHq71310100
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0LkBYfAZsJhifD4zPW/pw4O1lnq0kFjI4F2kXScG2Ww=; b=NeYLVEjhcVvjgyC8
	Qw0yx1EgRkr5w7rXfko95cuXAe5ephuRwZkCDm5CZNbpDCgNbpLYU8ac1ayi/emu
	crLVhW3JkVFYOVH1xuRb8EL/3SkMeqtdRp5RZLrBrbKZdL6Lm0V/ocxWZY5sLiaE
	/HcZKarqMwB8i0tbvsh18Q4mXYYlD9JwMFnfosu5akSln6SeQ2TdHS87hOSbzSbN
	nZISupus4n3KpSnTCh6/Y1V728gPEamNNWfsR7rjJt88oW3UBGxGCkQ/B+c5X/yR
	is2p14iTAlVDjGRj0gC1mHqLeyAitRQNcyqj1HAKTZMseXDDDk5HtlqGZpEPuLYu
	7OE9jA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqa331mvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:01:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso868652a12.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 04:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785322875; x=1785927675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0LkBYfAZsJhifD4zPW/pw4O1lnq0kFjI4F2kXScG2Ww=;
        b=Qmi4snkELKIXNwLyPuBF59YhEf/WO5bFwPhzlZyXp0zPgHXFjWvWWmdYZlIedcZNmG
         MpK4398JbqygNG7QtGk+cvZNaaix6OYZozrbMadk6IvLyC3TxbzEuHDewkcJVbtOWrgE
         WzRC7PQSPsAsLe4xkuKdtIfW1JPEIdnK127Q4FYvmDqvodGCgAssTek/XSYHtN5eulAI
         Vy2hS4xHalyn4w1JAxcwgGUl3fhi5EaFkojtS3seuj3uXCpf0j/CatkdYwNwnYmT277I
         kE1gjyep+gsKML+hUbt8OR2iiqxYmrhC46scm1mPfX8AWD9pWAC2yN/+cR9YOaLr1Zk6
         AecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785322875; x=1785927675;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0LkBYfAZsJhifD4zPW/pw4O1lnq0kFjI4F2kXScG2Ww=;
        b=N9a439aCwSpKMFUXT9a16u0jvf308dWt7e7vjFQqMrzYExq7K61XlKHG+BYYyTJQM5
         1vAXZI38O4fpsAzHR8Re02VHio/ZbF3y945VCl6/ZlBrVD7LYlIFNoHyjJnHRl5QMkZQ
         loLa3qzLbJbUVEmw6u7PH/92pFADdfWxjSDiA8V7SeWl7BvA+xRLkCB1+hk7JYO8VHUv
         xp9vCBJol8FFS85ORGtuNPSA+7BkPZRVJEIYfyfn6dNytCGEDZPI2+uuDJrJb+anZZ8b
         MmSXJSvQhgs6F9d1Qe3trnPvuMvirAJNrycvHLHSdI6nZug4V/p9PmeTA/R6St2q/MDS
         yeGw==
X-Forwarded-Encrypted: i=1; AHgh+RqZcexFmmSO8M9Ify5YTpANKTuraXMn9dGCEwca+mMzfSQk9YMpCOey9D69FRcCpj67h5mcl8spMxra@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb+UzOo6ENIydVedYHZBgJtQDWyetKHeFTxl4VeNaCwRHf4dyg
	xxWRu5AzNPpwj2BqVwodU/IqLUpMAyGtZs0dgMexPKmqpNYyi3FcH68xalBJ/2lKgHuq3N9TfA9
	GawF6WADHBcuhd7NGoWFZ/keqxqCOlOlYbNMrNwuRzpJWDhiNIlYH5qqLNNUjdqB5
X-Gm-Gg: AR+sD13PCBuwNN9Ks4oS5zAzIwB1BPQtOIqAzFhQqgkEKHhvJ/riliWfXU56mk4orfv
	/9OPB6SLq7njnHSNWO50x+GyCWGhPog3ZyvQXihpJam5a+5BxSH+rEPkEt6HxkZoZlFklO/lj2P
	7xIxaMgCCSGwWCvNI2vFPPm9AN2eLoe+lt21FwRmFaARZyKl1q1WuF1ii7cVhJlssDbgOInJUEG
	RJyU1LsVhx8wrfGPB3AP/+fJhllJsYHXVMXXwAtm1qDFJt0ndh6pz/kONbFdRp8sogD7SRhS6yD
	ukJNZNdhlY02KDawybkeFVNfFt3CT8CdRan7tW4n9bcHvJSa3HrpZuYP1gGt/oRGvXUo6fRKCLY
	s1J3IEJ7HPq5e55g+1iOziKDuYDEGs7Gp
X-Received: by 2002:a05:6a20:9143:b0:3c4:2fe1:fa28 with SMTP id adf61e73a8af0-3c8ba63c421mr7492114637.71.1785322874601;
        Wed, 29 Jul 2026 04:01:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:9143:b0:3c4:2fe1:fa28 with SMTP id adf61e73a8af0-3c8ba63c421mr7492019637.71.1785322873871;
        Wed, 29 Jul 2026 04:01:13 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504dca6a8sm8990545eec.29.2026.07.29.04.01.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 04:01:13 -0700 (PDT)
Message-ID: <cb344e15-28c1-16de-b871-a39c01d52345@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 16:31:04 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v10 01/14] dt-bindings: media: qcom,glymur-iris: Add
 glymur video codec
To: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-1-de451559e88b@oss.qualcomm.com>
 <cTyvVlG4njDAALGERZCnJMS54r5ZomPQ6aLejsdTWw3ifNJ3yuz38KU4j9_PrlabOH4e0Oo4XsuftZkODeXPg1ecfCRdlKHTLkw_JWXWnRY=@nxsw.ie>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <cTyvVlG4njDAALGERZCnJMS54r5ZomPQ6aLejsdTWw3ifNJ3yuz38KU4j9_PrlabOH4e0Oo4XsuftZkODeXPg1ecfCRdlKHTLkw_JWXWnRY=@nxsw.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA5MCBTYWx0ZWRfX65BxXvG2Hato
 JiNqvnRPeQavINDEqAgmTXHNRch65YB9k0Dt76DGaUodM42d0U7hXreEZptORjPecB74socT/sl
 Ht3exZCEfq+NowomwamYSOuKQqlwTQnUNNW12+22/PcJSrnaoWPxLmnIaQ07QYy8lTWbmoiAozA
 2Lm0iUapBLG4fsP1I3gOjCyfxT0gGfxg4965hyD8drKeDZso3Tqpd6BJ1Vl0TTP9RKvEA5W48Sv
 u/CDwjiRLHuXcyJHWPz7PZcmYjF8A8mKCcQrjNqs7ZhZB1eTvXmCICwXbLD4QVoUax/W4ZWfyUb
 JcfiYbr5RHgAHRsKpXw6gbdUsJGv75+ofr+jzuvrx6XYU4Drf/VK/d1eMWkO6oFQZRy4caDHrpF
 r49xFdB6nk+m0MF3Gs1O0hML88u9rphgP7nv60I3KYfQuTYPgoIDwaVmEA82XhzWUfrykZaOPI9
 9nNU/eYqApFnvcLBdTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA5MCBTYWx0ZWRfX0oXeGqOT1+P2
 9hp+RtiuUfLaH71TDXXjj5suv3NzPSGB5PoSkLZ42ht7qbA1TYVjdkQM/I8Fq8MX/uwc7qSYBso
 cjTZ4PDPWsM4IV+SDG5OxcA8Joy3O70=
X-Proofpoint-ORIG-GUID: ck55n7joFVovRQw31miSRAS3mCuwd4FN
X-Authority-Analysis: v=2.4 cv=Ap/eGu9P c=1 sm=1 tr=0 ts=6a69dd7b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Mf6ET5Z485SzACLcFDwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: ck55n7joFVovRQw31miSRAS3mCuwd4FN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290090


On 7/29/2026 3:38 PM, Bryan O'Donoghue wrote:
> On Sunday, 26 July 2026 at 06:50, Vishnu Reddy <busanna.reddy@oss.qualcomm.com> wrote:
>
>> Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
>> is a new generation of video IP that introduces a dual-core architecture.
>> The second core brings its own power domain, clocks, and reset lines,
>> requiring additional power domains and clocks in the power sequence.
>> The current maxItems constraints for clocks and power-domains in the
>> common venus schema were sized for platforms available at the time of
>> authoring. The glymur platform introduces a dual core architecture
>> that requires more clocks and power domains, exceeding these limits.
>> Raise maxItems for clocks, clock-names, power-domains and
>> power-domain-names to accommodate the glymur platform.
>> The glymur platform-specific schema have fixed constraints for these
>> properties, so the common schema only acts as an upper bound.
>>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Krzysztof's RB has been dropped from v9 to v10 here.
>
> Is that purposeful - all of the other patches in this series have the relevant RB's retained.
>
> Using proton mail web thingy so my email may appear weird idk.
>
> Anyway please indicate what is going on with the yaml RB's here.

Krzysztof commented to drop it on v9 as the binding was updated significantly,
so it was removed in v10.

> ---
> bod
