Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599226;
	b=ZjSnDNtP6PPRvnTWyAdHQzqO+wFJPtN7MgfZFgmJO2RlTSqt1rovf1v7NNTudT9duN3T
	 EBHk6S7VDDFk/0lj5P7DZYFlAv9M/xP1h2j+1HFf1UQP3Eh4zj+rMmT2DQ/NSfSN3mij7
	 NYIRp6peHzMorQyFqPh7RXMGgulPElQRTFvfjapiRe2X/BwJ3MK1JlDznj6gIz5zBiNyw
	 JgEUtYNrMceEFvTuwXzJodTlqNpB8frIqWu6SMVpp7SSfxdPpQEamb7aHtDAPaz/ogLQv
	 rkk1EXN0o1Av/FB81hmSzG7PPj0GyNPWErxkvNf5+TK84b2U06LU2E9c29kMQOy1yCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599226;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MSdcI0cnwQnio07RIHd1iocjpv0ki/XQsjKsPjSVD6Q=;
	b=1Pra4/q2dWIbIJ+2lScBQ1kL8FfdO/Al6LVCm1GmWpcMDsjXDO7Te8cr9a8XOgVajZuX
	 oiQHvbQAy6g7nW5VylAlrmknWoGvRfhtaEf1p+1mYOG1CbXplZaQDioCvSYPGei6ZRng+
	 QL/Gjt0D/A5H0CGJzDWiyHnrCU4YGi2ebJo9ITSNTEvk978LVORHErNSaNyrXYP0dcwK6
	 BlHmRXmmSP6MxEIG+tpnYwKY0giCoF6KRd91CSf9KDdZSuORTmFoZTOPixXmu2PcIQBVW
	 gLtXjJPP/cXFfnzDbGfvGfYhPTjHla6UulzZVQHM42wAOe5LZU01BYBCLfXpjmEiyMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X49dvhdm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="dr1KX5/r";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C64C6072B36
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 16:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C64C6072B36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X49dvhdm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dr1KX5/r
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LG85Gf1076577
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 16:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MSdcI0cnwQnio07RIHd1iocjpv0ki/XQsjKsPjSVD6Q=; b=X49dvhdm1Xdk9Meg
	9iHEBDxw43T+t+syX6G+w9CK0ke9rlD2iuQJ7VKforUmMpp+3PKkuPZDHmRAdyxh
	G9YlvJy7Y8ouNQNSCYgJoBhc+QGKs4AaNZxMky2BvaZkfN5lh6UAc716uTroUOc6
	G6jnrHZlJMo0AeAJt1AVsgoC8jZvOTc7AYYfD0gAG/V8fCxEray2rbWCZvYlhBmv
	QgbM3ymx1r1yW43oNKf5TY6tiUQYzQiGEgvbeJO+GG4UOMfP9gRHPeCXJ/G9KCxe
	DTUAhyjp2tvAoqYDps53mEraBd17e7MTDhkNVbbECCwqOIeAYEsXLQO5+A/5S06A
	0RFFCg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r3yer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 16:13:40 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a0589ff620so623934b3a.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792599219; x=1793204019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSdcI0cnwQnio07RIHd1iocjpv0ki/XQsjKsPjSVD6Q=;
        b=dr1KX5/rRpnzD0AiYJyQtFsFn40szGv3RgP12tlvt+6y/gRTKkjavOiOsKf8l7QlKw
         Wea+NFd9zdOGVrtWxXqAv+MBlA1u9yxYTAqEnKfADg0OtUl49xDsviOnU4/LlGrm4jnG
         RUKNONj5SOBqVdb9CJn2VHbzrtbpLPR9806cXZLjTm3FrelNfMlwp1VkIy6wQYSoRFT1
         d6Vpg+nJ7Tlg/bwsv8wb5SyN1KCczGKV9Ta50TicPxkw/UdR+ltCkYRdelEqtqYGCamN
         frYpty3ezp8aZBM9I6j7wIXYGqvfvDZzg3Lt7EvKMxtp+gAYNX0htyKeGw74um9qmk54
         +58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599219; x=1793204019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSdcI0cnwQnio07RIHd1iocjpv0ki/XQsjKsPjSVD6Q=;
        b=CpXn+JLJ47fmheyzEWPzqifUDgov9OxuFYo78qTr+5a6SLdfrbcxfBHSwaE9dgCFKH
         5PMAM8mdIDzArBZkfxLC/1BfonxS3LBi8g1X1hdDYhlRB+9oc9u3xuAAsBkeHnoo5O+K
         12nrIPc/AjQS3wYHOmrcrug/S7mwtCK4y6xkrbo9qk5swTJY6O1NXaBJZg2AcyPMMhsz
         Kh6D+GkcWu4wzF8UXtx35KWKQ/pl6qI8jnevkyrA24UUAxzg9kKdc7TuB/8O96MrE7UO
         8t/WgyBWvCjuT2cTHzI/+Enb5ICmn7+tOrh8DFBRoqjPaS3y0gqJVvOPhkl520f+Zzgj
         wb/g==
X-Forwarded-Encrypted: i=1; AKwUvBxAr59thU8Immv6QY4tq57jvFTUZA7rOeeiRHifyCz8zXj1IGKYkDxaMquM13u4qUW9rTmGY/rmU3Cc@vger.kernel.org
X-Gm-Message-State: AFq9FYIiKJKSJWvdH6/6Z4jW0l6MuzGQTryws3Gm2t8xDBBbyx+w+Pfu
	9Fwg8L6EfzTFL6yHmHyjJGLQrToemzEqlTLs4mApXyGQs7OfkjsSY6kLXnVvPlx9L1Uk7LTs+VY
	rOrq33GbjtYijK3Yp9ypvHLKZ7nfTd4bcy6HesJtcPLDKugXbETC+4HpQuBKStg6d
X-Gm-Gg: AYBFou2dD9NM+7vx7GWdJtYPKMm0b2XzcYXhAX7z2qPJjSjk5+dpJKDyK70mRhQNaFF
	YZSeNnYYY4XH1RQXrYVSjuW+iD7wVhswK3HWyt4YD0QJQefzjWnFYdh7q9faaTEeOMxp75H4zfe
	6D9BELz+dvqmWEhOlQpyrSylafvwgs3RZf+ebb8zWcvjK0l5tBW15WkHDbWa2AKEppzu8DEZPyf
	QX9R7m3xQz5E3KjAE8oyzFvG/HXfJ130T0rWWpL3/cSarthkgHDwD/l28MoQa1HV4lJlVifhg6T
	zbOiI17uUWFGMRtyolPzk6n8raawacLfRP1iSjMbk7i51wBkiDT0acbT8sbTaJ3/CxKU7sVaYQV
	PMnSUoyPLO1J3Funyleer5uNkiXutlAP9TymHHkT6SesD
X-Received: by 2002:a05:6a20:9150:b0:3e2:1a24:fb7e with SMTP id adf61e73a8af0-3e287e21a6bmr2249890637.40.1792599219121;
        Wed, 21 Oct 2026 09:13:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:9150:b0:3e2:1a24:fb7e with SMTP id adf61e73a8af0-3e287e21a6bmr2249869637.40.1792599218635;
        Wed, 21 Oct 2026 09:13:38 -0700 (PDT)
Received: from [192.168.1.10] ([122.164.81.208])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm1131642b3a.41.2026.10.21.09.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:13:37 -0700 (PDT)
Message-ID: <4dff1a97-8c44-449c-86a5-5eac047ab909@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 21:43:30 +0530
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
Subject: Re: [PATCH 1/4] interconnect: icc-clk: support N:1 master-to-slave
 topology
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-1-fd4c2b3cbdea@oss.qualcomm.com>
 <21a95133-eba9-4655-95b4-9aa947c081f9@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <21a95133-eba9-4655-95b4-9aa947c081f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8e4b4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=rZLzW5DhxuwyX7/NBrPT8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=L14mbm2-ywthVrTR10cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 0zrzO5v3ZiAY3QexLNXlNhx-GKdcUytP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfX+oPnpTyLHXMy
 NY8WrFjqHnUqtrYY4KKYM1cSMEOYxDo+kT9jsOxXWnuIRVLzPdfNoZT2RQymXbEm4z3oxBG8Z+V
 KN46huHCMHC+gwOr8s33WY3OHKG3/fdViq35VDL0AW1t6VS00qh98hrRbiVn92CIIaQ/TJ51H4j
 uqAkWjFrFFCzWOvlu09u6yLKYlqzp5CrB/i7USLVdEpYKNp4umRSQmW3iAGkFS9WjWUo8au4z3+
 t7MTE1GQQZyn5dYgXrCP0SdMglAV5qP/5pupf3x22m1GVjj0qdrEYieJwhGsWrwMTcjKIDJYyqX
 HxgQHx0z5aMrbEqvEZ+iHTt+q/j2kDVfU/1NCwCqnB3Ria0+k6mqXa+hTUGftoBV23iiTsKNGpU
 2GgB1z64sHVNeDCfu8x0NiMP9pdA1tGNWXanPpeFS4eT5PtXhcyQfxfxYhgDnRtyX7v8gWxry3H
 5G6sZqRIz4T+osCFqaA==
X-Proofpoint-GUID: 0zrzO5v3ZiAY3QexLNXlNhx-GKdcUytP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfXzaTIdBFOdqQT
 0JnaukmpyWS8uRxtWPNQLTLK3CfjuibbZlOQvo7RXZSQD/hVFdRD+PYUmtIt6K1u4csW6fYnMDw
 0bIzKRm2dIIFpGmzq3st89iDuQfZNjo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210064


On 10/16/2026 7:42 PM, Konrad Dybcio wrote:
> On 10/7/26 8:50 AM, Kathiravan Thirumoorthy wrote:
>> icc_clk_register() assumes each icc_clk_data entry describes a unique
>> master/slave pair and creates both nodes for every entry. When several
>> masters share the same slave_id, the shared slave node is created and
>> added again on each later entry. icc_node_create() returns the existing
>> node, so icc_node_add() hits WARN_ON(node->provider):
> [...]
>
>> -	return clk_set_rate(qn->clk, icc_units_to_bps(src->peak_bw));
>> +	/*
>> +	 * Multiple master nodes can share the same underlying clock (N:1
>> +	 * topology, e.g. several CPU clusters voting on one L3 clock).
>> +	 * Aggregate the peak bandwidth across all of them before setting
>> +	 * the rate, otherwise the last caller wins and can undervote what
>> +	 * another master already asked for.
>> +	 */
>> +	list_for_each_entry(node, &provider->nodes, node_list) {
>> +		struct icc_clk_node *n = node->data;
>> +
>> +		if (n && clk_is_match(n->clk, qn->clk))
>> +			rate = max(rate, icc_units_to_bps(node->peak_bw));
>> +	}
> GPT has the following concern:
>
> [P2] Recompute the shared clock rate when a master drops its vote
> drivers/interconnect/icc-clk.c:36-42
>
> The zero-bandwidth path returns before the new shared-clock aggregation.
> If one master had set the shared clock to a high rate and then drops its
> vote while another master still votes, the clock remains at the old,
> higher rate: the remaining master’s icc_clk_set() is not necessarily
> called. Recompute the maximum vote from all nodes sharing the clock on
> this path, and apply that rate when other masters still have votes.

Let me review this and get back.

>
> Konrad
