Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7C24078DE
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 07:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839801; cv=none; b=kBu3JTQjApA50PhCAfBl9ay4Job57mysgm4lb5+6djEbCqJ8lKtkOhR3tIimPOP7yVv80H9I+KJgcpCeFbvTcmSBv627xCykd3MrtQm35/zaEmn99ILs+mqtf0elg40WabU2fJZGRmyK/PZt5yVdkHHDmn75s5LjLm0ZeM/RNHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839801; c=relaxed/simple;
	bh=aj90nkIktV90gsgtUkZ5qxQYTUJt/JYnxXvgLMgGLSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fYgTlV+exriWGPpGB7VKcs37Drbt+TBDBCwOOhBSxdBEX3AAXxlpJ3LfXJqNwpiHKONfKfD4uw7QKHQxJ80bnRjlK3siMe4s6XtMVMQ3HzZoR2MLxHWO+RUABly9z0Y7Hoz7xyyPwYGOhBHQcNkfbgquZbN5GjLfFB+8gwogcpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nrpm+rTF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hz/woWMV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nrpm+rTF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hz/woWMV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xTbA1289198
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 07:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DD5muIWTBNn8mx2AjPry+QV0pHh4Dfdo+7irn0HCbCw=; b=Nrpm+rTF70oa7N+F
	PF4GLVmPPz4AmekPPON3PltFte8dTNEBjoJzbdJi15QUFYkl42yX3EJa6tR06Mhn
	8/CwtWLy3hAgBvyKzbEcNFf+KBSZEtnEDMl0t9o70QmGOidymkW0WHYwQqJnx5RD
	jHxdaWiy/o/uA5xBcfV5eDBNSHods+T8j1vM+JIu8kS99s7q7SZL+nDrsdWVUZsA
	LH//cwVO8ZYjl9puCy7YkjdHdWpL3+vcYFrva5ZHi8nVVHg4qBL1xtbWC/HD3JQ8
	i1evEQXFnJzS2iKzuaUXheBh2pgkIqzpUZgVFrbgQf/56qZ3CCYVj9nFGPrCGC9S
	8SIQLA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pjakav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 07:29:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90520763ceaso9833776d6.2
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 00:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790839795; x=1791444595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DD5muIWTBNn8mx2AjPry+QV0pHh4Dfdo+7irn0HCbCw=;
        b=Hz/woWMVSgbN6cBnsrsQSwaMKZdzj7d3Qz4QNRCNXG8xBL4ClzJYYK2mRaYv3MVWfQ
         SjW4xJSy4wB/wPESulZwNxt+NQg5I5PC/Clxxj7fj4a6FxOXYsWTMA4zyLK8vK+T1EBt
         YfENVAhkf96h+GauwcNxlvEfxI1XhEH9qvQZBCMzohrwHeFIcsuU/LM93/y624jagfnj
         DKc53YjGnUVIWAUanBE8R2T3ZrQ2i6bdBA+NlqtyfJxByPoCZGVnrp/DRDn/mbIusPwT
         vBQZJw8PDeqvw9XTsPGy8e6V+pup/TgxzK+cjr8dpfKPcoQ2ZaH7TFa8bRZJP2mazk73
         vrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790839795; x=1791444595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DD5muIWTBNn8mx2AjPry+QV0pHh4Dfdo+7irn0HCbCw=;
        b=Mo2t8wbRcGMNy66rcSZSfr53aK7Wn97Zz+TKMt5N+6KZAcyCKjtaqv//zr5X5JUZcL
         ZFwnvkmOCr27vhXMbSIx+sTCG2cnVHV6KkNiFE+z/FMAAndmrdsKpVGLPH3siSQhTIVr
         UmlZd08DtDMAyQX7UJG+E8vQW562QkrQqzh07Fgw7ayFr9kSJzXHxI7uabp+p1guHG5Q
         dXRSGiRogvRytxdJ2niM3OXXGgAu+ZLT4AP6SCb9C43qgP+K3+fQo1gX7FUCcyyU1LHJ
         tC2Ezco4fughmIqwSpAG8VXWEvbpZLVm3yuRFUcVXTVK//wIGxOZ8VBBF85r1T2UEAQw
         obSg==
X-Forwarded-Encrypted: i=1; AKwUvBz/XngOJfc3wtCF8XNeZFclkbopzvS/PlA6HtNmA+RtZh1htxhbjyBJBSJmOd4J/lWC3UCH3qjqc3nq@vger.kernel.org
X-Gm-Message-State: AFuF++mfDIF2tbdGoVD9zpMoy5ffmeKZB6b4LX+z9BOGvus8h0i63YQ7
	KLbUpxA4GjhRZyTKE35WxjKaKh0Le91b5+K0CHEW8u3tggwjNIzbc24GctOHQ7kD4ppOUflx4zT
	lHuirIS/92rg2R8r4katjqwD0w1obUzwFGlO7X62KqT8JUE9dis0yhlQbr0HN4L1kJ45PPzWP
X-Gm-Gg: AYBFou2rH/gzmLJaxJAmwzjzuTDPvf+vMxL9Kl5LWkpF56n8RFY/gtXzlQzJTTnbX94
	RBpDpEML4fpZ/GuZ9kbLyaha7xhlJNqI+V0c85ZVB202cFZEcopUScZbLyAD/oFvevbTZQbtEEY
	LVSYO67li9sEJrA81jG4/EKdW/yfJ/ST6kvie3uMHwKcpPo/OflYi/kzYynvLRU/z1oGHCLWfi5
	dJ98VT3uxMoHeQGYvIeav3aPhqdAUZcOT+/wQYTeyjEVsi4jXidIU7jJ4OMuzMpfSia3mLhiICS
	9vCMUDxbKByBOCwqPvoV1yV8RgXJgjAMQ0E9wNHQKJAAr+aMbKYW0NAwABj/bXBnbsAafedegX4
	xTiVfTXt+3LW6LObSsRpq8w==
X-Received: by 2002:a05:620a:19a3:b0:93c:80d8:5802 with SMTP id af79cd13be357-93ca96ff8d2mr664521185a.4.1790839795501;
        Thu, 01 Oct 2026 00:29:55 -0700 (PDT)
X-Received: by 2002:a05:620a:19a3:b0:93c:80d8:5802 with SMTP id af79cd13be357-93ca96ff8d2mr664518385a.4.1790839795035;
        Thu, 01 Oct 2026 00:29:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae5ca64e84sm556505a12.21.2026.10.01.00.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 00:29:54 -0700 (PDT)
Message-ID: <284d1013-5bc7-4732-91c0-87a6c870a349@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 09:29:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra: Add WCN clock to wcn3988-pmu
 node
To: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com
References: <20260929-bt-wcn-clk-enable-v2-1-7a90902f3df5@oss.qualcomm.com>
 <ar3LTBFtF_qqw7U2@zenbook>
 <0eef230f-1db5-4419-91f3-ba220891e577@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0eef230f-1db5-4419-91f3-ba220891e577@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abe0bf4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=cNAZRwmMWnWlOyi72XoA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: ZmKoQAvAOYevwzvyy7_I2lJUCu93BqAv
X-Proofpoint-ORIG-GUID: ZmKoQAvAOYevwzvyy7_I2lJUCu93BqAv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyOSBTYWx0ZWRfXxle5iO9xKVYZ
 p2vGE9ZyqgbP/EbAvdpAUSCe9ks/Q2SNyiB/8jrAfoCyOm7d+qx70L2hohEseE66JxQXRhQZLuy
 cySJXW8EswFqZXsWfGHvJqTdv5teMvw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyOSBTYWx0ZWRfX5ss251L+bRfe
 2cvmxFPAUdydLOz2jeoetjvX6HL9jD/v4DaxMRWNy/adBDe2xS9m+/71t0qdroJDYaeoB4hS3m8
 d8XSsuW8ePVr3WcZYuEUAlgq9LbmOkJTHaM23T3BiJP0vTqSXdwk1tNWMt2sK1AGt/TDT3Mc632
 XazsPeair1UPRDvh3m1EgZuIK4ZdeQ1D111A+LeZVQDx0aJcqct7O4zCKMOy3bZtjd77c63Tzhc
 arew2FI7d/La1zxGKx+u9io55ppAcKC18xspKMnTHZQyb93+RXHfPoKt50WOMBfviBn0l2fFOB0
 r4fGt8YVAw7Sv5B+d8QxsgBcxw1EkVh/1/k/Q5PpGABdC6HT44xeDvGN0E8LYSEEOOYMpXS9vka
 5qdnfWiNWC5YsP3OSTQTTZnd6E10OMJdT/Aco8KoGaH9MNZCtiTk5nD/oF8wiObT8aJMUt9u5lD
 UJjkr4vJoZY/Cze1cqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010029

On 10/1/26 7:12 AM, Yepuri Siddu wrote:
> 
> 
> On 10/1/2026 8:28 AM, Bjorn Andersson wrote:
>> On Tue, Sep 29, 2026 at 03:31:29PM +0530, Yepuri Siddu wrote:
>>> With RPMCC proxy vote removal, the WCN clock must be explicitly declared
>>> so the wcn3988-pmu driver can vote for it during WCN power on/off.
>>>
>>> Place the clock in the wcn3988-pmu node since the PMU driver owns the
>>> WCN power sequencing. CQM SOM uses RPM_SMD_RF_CLK2 while IQS SOM uses
>>> RPM_SMD_RF_CLK1, reflecting the WCN clock assignments on each board
>>> variant.
>>>
>>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>>> ---
>>
>> Why do you have one problem description above and a different one below?
>>
>> The information after "---" is not merged so the git history only
>> contains the one above - and there's some interesting details in the
>> description below. Perhaps this is the b4 "cover letter"?
> 
> Yes, the detailed description was in the b4 cover letter body which
> gets placed below "---" in the email automatically and does not make
> it into git history.

FWIW you can simply ignore the "cover letter" for single-patch series
and leave it empty (minus of course, the changelog)

Konrad
