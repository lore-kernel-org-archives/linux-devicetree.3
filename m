Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C7D3EB0FE
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783335555; cv=none; b=eIDU9dDP3090IH4ioeq/KOHF/HOf+BD3LDyxwQp4Il4D8putRGEi5NLKoDqe4o0iPPQUbfjuCSuE97J1MtHm64T2hnxD+egv4nbKvShiCL9Oey1o9nykCensluqKvts075VvSc04MQ42ebzeQjrjFuMRBV+JK/XMBU3KsrexYY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783335555; c=relaxed/simple;
	bh=qGk4JEA9zX7+IqCMcPoW2yFwuDrGak92O0jlzYQye4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jA5Hhb8kvDNEsb3uD50AA/bvUj/j3/cYPLJbffF3oHlSlzumZMv1eb0yz3cEKz3HE/d/u0NGr8C+3iVcpixQsTfqQ8wCBsz35TSG5Jx7E0DcqxlCkSequBoLErjLRLGFGv/d3/JiMWXbdHYyOvarzAyK7hvPvMSAqJECnXsC588=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mqXVDrH8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WCmA8Gmq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mqXVDrH8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WCmA8Gmq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxD2C366713
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 10:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	clGJ1VVkCtcn8+Xr390x8/3JkGKe7Y66Pv3Op1UX5Co=; b=mqXVDrH8BbFkOQHz
	e6ZHFHcaIK5a1xu0dtuRQUgGS6eY+UMBVMTKymmIWLRj0vlK6Ub1wD2q2Ya/oIsg
	HAh2/F6oQEpbcsT7O1cXHKqB3lMzko3AqRMnNytnpyBquxP9kwjlqkQYWwri0Esm
	SxQBzQkNigQWPeBPl2lZM4z8FN1OGlBBG91d/UM0jhvkdWrEaAogdUmd6qqqhmPO
	k/Jqdp58P995bdYIiGagdqWRxaenLb8QelPpUnw1z25nJi47S1I1h14NL7gtf0Gi
	RIkzDsNdDMiAX6qMsqBIqtKSztAl7R3XgzIOU+odjW8rzoX85Qry9TQvLT6O9G1e
	XKtM6A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891urh20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:59:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e69a569ffso10959985a.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783335548; x=1783940348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=clGJ1VVkCtcn8+Xr390x8/3JkGKe7Y66Pv3Op1UX5Co=;
        b=WCmA8GmqhsIEcWdSXWVhPv7uh851gbgU6pzBUJ8S+tgVbY5+HWxKmtx4lHYzrS8HC1
         jF/FKiXfhpsZgh/k2X3xmhn5Nvs0yB5T2W5BA002yoCvQti97AyxmBndk5rhTSBM8aV+
         9gVIMw/TGVgv8jzPqZ1sgtScTvQg2fSLfQw6zv+NJoyPlNTrE8WP72pA3uPXeW2WsVBk
         LdJC/uAsReUmph6nSXimLK5z6Ly7TUYJfC6rzKpFthIAK0t+/UBU6qzgyM5jjE+mi8Hj
         SKiXmnr1/t9L+YVbLSZCTxiAyCJJ4LEaK3qI+eyy32HV+isqCz5N44JFHHqkZpzqnvVT
         rMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783335548; x=1783940348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=clGJ1VVkCtcn8+Xr390x8/3JkGKe7Y66Pv3Op1UX5Co=;
        b=SRoccg8KQzYI1qcUHRdfrhDE41IAAKeS/CYjOxARBamLrzKW8ji5wk9XYCu9Ihz8DU
         uBILTdbxOW7d+ujfIlB0kG2/k3AxdG5GL+Tl8J9zkqvfT1E8NbSV8CYTuGiCpXI1rYz8
         u6iO0rjviGqSszA+R8ZO5MykW7Eu5VGArIYUQkuuRMvyySJrmHea6boMg5TBo/YzYBgZ
         zpDDbRdm5SGqAAeaL5fxeJkLX5SfK3STV5DD2COBhb/bcJziBOHZWvBsK3ICNj6iZk/B
         ggbzky8MuxLTOx0D4y3goTIWEkV9D3Q6MlWzbi7DEvtSFpjKan94MBWmSdJrsLpkECdN
         y+aw==
X-Forwarded-Encrypted: i=1; AHgh+Rp+TOy9m5j02XX/M65AgX3TllH0c7ilwT240hXJ5uCsaX08P0JqsLr9GejBJgzVC1YLTnTMin0Iqeuj@vger.kernel.org
X-Gm-Message-State: AOJu0YyrHzhEm7M9wbhaGlI6ZfGoloya8RbnGrDgMaJkQTqOFw/zjdI3
	G8fLejEVtY+6pdteQnIS2mTtjW/RnxDk9H03wBKlz1DRZd9tCmgbvnVqE3PuL9d5Nv8iL/hFVOt
	Tnpt4uARrnjPpx+j+AeUuZmb36NRplM1kwikVwrCLf3NXpZOo3yP3e7N/WTKyZkRUtpWha8n4
X-Gm-Gg: AfdE7clJbAIyE5ySe4gI1Ss/HA6WNm2mVmCPCAP8PDYN+i8HHt492sZCC0JYIun2xHA
	ewvaXR+APdRS20GKS788OVZq1o49adoFsM6hJWphPFk+1oIOkOd2EHNa0WfQ/0tmKnipUo0Yhtz
	P7xvipTawpR+nFkRpxDGcPGEtLuu4cUaKTqtcVbQUrq8xTPNhCBIkAmS6hIp49j7bL0w2o0jSP3
	2QHSKM9Kh2xAQuwzg6MV2v7YgBS6TACzYH7wcaPrV45v8oSDTF1aZMhb6n/kwYp/wvlYpDQ0hRW
	ji7CFnHdJbqjUV7R79JeUosODDWIZOoeDWGESWvvWr/l7M9Uis+8ajTCX0E0Y/YyPfyKO+cay0o
	xyXNglHdRI0peFF8FuzTr8Y1SajyqK4xF2Zc=
X-Received: by 2002:a05:620a:1a18:b0:92e:5023:78b with SMTP id af79cd13be357-92e9a076fd0mr808863285a.5.1783335548144;
        Mon, 06 Jul 2026 03:59:08 -0700 (PDT)
X-Received: by 2002:a05:620a:1a18:b0:92e:5023:78b with SMTP id af79cd13be357-92e9a076fd0mr808861185a.5.1783335547766;
        Mon, 06 Jul 2026 03:59:07 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b629a1d4sm707084666b.39.2026.07.06.03.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:59:06 -0700 (PDT)
Message-ID: <8d025adf-e943-4e99-befd-40f833d8045a@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 12:59:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: Use tab for indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-dts-qcom-style-checker-v2-0-90c781ae0417@oss.qualcomm.com>
 <20260706-dts-qcom-style-checker-v2-2-90c781ae0417@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v2-2-90c781ae0417@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _rcQhzoK-LsXVy9jGH9iFhwu8n-6pNKq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExMSBTYWx0ZWRfXw4LGuLwYqZDD
 IfsitsLeYWV2bcu9+o3KntgHHUeZOQf1E6kNZCvGtWivfzYDfdiesPiOFAU9LqHEAW/u0M6Vb67
 scRloeG1KqyGfcRNQ5PffAnWgG9jKCQ=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4b8a81 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=AZJ-QSGf8ivbqnDstL0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExMSBTYWx0ZWRfXzygrZTPL1TLY
 WhTED4K+WyCwqYnki32qA7WqeDXHNpdZM6pJvPMGT008HI3sh0We2BCksX286LWgJOjkgumgxvp
 k6OlxiMd74Llm+RZstaGYwU0JmouD5rZ3FXENvVEp9ygd0+o3WYZ6/SnfvQN1dXezJqcYsK+sJG
 9tYmrzkxMHElUulUL7qJNXZ0FLDjGgqDR8GflY3YAr5RJJnnc2PqPw2QOYdqy+klg+7icYUmu40
 xXmiROjQirfwg+GX7wMq5leTJg2w4Zm83IImrc90nMJG4x7zSwSDeCKxnufoHjvTGveuTonpgqJ
 LuZ+V7v3nTZ39/7DN50Bvkysiw+1g1mM9nffTmsNCobX/4GKfiAwOqcc59qptQWjGvPsercU6wJ
 IeDWijrJ0EcwPWHovIAfsBlB1aPRzzn5mY36bXf1jDXbbIA6b160t7L3bA/pg6BObq/Pn6Tgr4f
 p5+f2oWQ85Fh3EeXe9A==
X-Proofpoint-ORIG-GUID: _rcQhzoK-LsXVy9jGH9iFhwu8n-6pNKq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060111

On 7/6/26 11:39 AM, Krzysztof Kozlowski wrote:
> Correct mix of tabs+spaces into proper tab indented lines.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad
