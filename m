Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656019;
	b=I32GyHw1EusXoOAR8QwS4eu2DqppwCJv10I5cdrzeD3WUHIi0FoHQu7GDW8gWJyI/Y+W
	 YobXInqsOYWKOZ7r9Ku16/pujERYeea31r+09Xi50s5dxLNybAPcwv9/t6sdjLvsV+57h
	 kuOwghunjy926MLjK09BO6LtU0rwwj7EMXyodi4CmDGqgSapTX+p+kjgZtCrFwQD0sKpc
	 tQVHreXxZFfQdmckiA/TRaaXAn7VislflutZefjeoqpyWvtdVLpQBFpo/BHAKjfCts21N
	 B+6BpHrckLnJaBNJ6AxRnKYNba3DwB6C2SyXw4u2zLi/5SzsXYx/GkohSapYFyQ20nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656019;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gGTzRqxU3QbDVlPoai6od2YUpX8aDnQx42/nsurChe4=;
	b=kVNWLWdxpJLc9hadCaU9p60x2kmlX+cA5G2x4fDkTnCNYbjRKIKZtb/98sdmv7I4vuRc
	 0Nt/TYBafuMlPjFSCT+D+GF4/kw2RMIT/sWQN91DJuH03wJYz/b/gkunzu/a3GD9fq4OT
	 YfEL8gBi/lkfsiUUHSPYE5tPiik88OLjbtLARksTrOfFQ0wnSYRmxNRxB+pKoNopQu3B8
	 RbgoWMLNuV5x2CH5p1YmmCS4+6XYHx6tr0yWqtHX1/GSyIZONJPF4QQyJ0bNCQ9SJ598T
	 SdQPETOvOHwNFOn/UMZ6/SsKj9mpbU2ujKNzcx62odEbFk8Vgofn6k67W1Ww8/YaRew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DbYn2l5E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZP5fSx1l;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EDD606A322
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1EDD606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DbYn2l5E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZP5fSx1l
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7ScPi3654511
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gGTzRqxU3QbDVlPoai6od2YUpX8aDnQx42/nsurChe4=; b=DbYn2l5ECzA0c8dr
	36IFklgg/XGAnbIjwsSEhpgRRpQA0ygShiOulg5Qcnh/8l+gPm6Bb1mqVO1ENJYk
	mwCZq84n5DDcQqhdWruvjj8brAaoTsT+G0EqkQi907k4a56DbMoNFnOZXaRUVvdO
	w2q5b6iJbvz7jCaoluEcLjTYfTiYlLDxyR/HUsdrElLZR8eNeAQ3oNtLytF8ony6
	lLflDkMgXW3+tKHp5qVFMhmzOgMrMNanRMFr+yfgozIBGa2uP/Q9U70e7/xKZE5u
	o/Nrnl2fyyOUYzZKAfScUr48g7e6TVPsMr2lt+0Oxyo2w5yvoJWLQfdJzxZUFUFf
	RZnzrA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93c99nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:00:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934a8cd3a8bso20990185a.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 01:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656017; x=1793260817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gGTzRqxU3QbDVlPoai6od2YUpX8aDnQx42/nsurChe4=;
        b=ZP5fSx1l/0DpppjqPpZlak6Oht4rzsgGS6HKIx8c7RO0XtQQcwH9iT3CrLN0sPNAbR
         c2JIEKYl5h8XIgnJj8iqWByME1agrXEfHESZHPNu72vvntEoKBIu9gCR7beg7t5/lrQZ
         Fy6YnZba+ijO0dBmVcAgaY/NK3H/ZSkGGI3tNPKioO3WhrfYStpIgmVeYyLcbY/cM88M
         e8dv/kwx64Rq8ekQ2xZBE6PR8v9QoJiLLTnbNRJGAeFdzbcDeauVUtJQabQO2iinrKPa
         zqrwXM8P0Xu8gVVGp4A6x/IoUj3uWyZbcYovXgngX48TPDAr7z9zhmPjMLUaWk+04iOz
         Mqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656017; x=1793260817;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gGTzRqxU3QbDVlPoai6od2YUpX8aDnQx42/nsurChe4=;
        b=i5+A3faiX9JeiPNyvnVw9IctQUi5vnyGoIxYnGMU0lpxqksf8meEn41YhPHRWjnYJU
         ONGvtBrCJc+Dzj8IbGsWiQxi/CnlxsMkFrDPMc6pFausngTvDTfrN2EFqIIRnDALqma9
         7Vj2vqqaOF8xJtv0bxAUWeepDtSYtRsjWc8eypXKSQDTcZrEEYEoIdFuKYDzs44L4u8B
         Td+MPv6wCw7K6NdSb3Bu7U+Ss4pgj29g3B02ZbSWfQ+871fhqw+0Ygj0/pHtbV8VGXEW
         IfU1cys9HJPGDmP0uCM0+55NslHm3YrxkfhEknVHff+5z+0zWrdEoYKAPbrqXXpB3NI+
         CQCA==
X-Forwarded-Encrypted: i=1; AKwUvBxgXFij1q5kHhUllOtTm+wUdMccPWNau7yTeG/doXSSUEC8CC4vGgiQ2ov5+BQqPWs6Gu4yuyqywqzN@vger.kernel.org
X-Gm-Message-State: AFq9FYISfLdzJ5y0OZK/rwM3+oTLj2+9fKOggTahYUUAErlmJ06oBCGJ
	aZgWqoaKbZ4lXEfNG67qmd127+FIlZWifaaEsyQd/zOeD022qXgiAFrx0uJmO8ds3Rb2cIf/6j6
	Qi6KgKEuZ0551wZcJilyCsJVrjUKiLQdRn5bbgZXOIzivQp2Uc/RAVOuWtiZR7oSX
X-Gm-Gg: AYBFou15uNNXVik28HQXHvvuFj43lgISORLmQsUIj/hmdoZifbQpkHkHUKzkbAgrP+z
	goIsKZeZI5eiLYQCGeVv/RrjzOHAycxwIAtwns27lpDLpQbxaHWdrlK+hZdMJrHm86bEMN9Ea03
	0mXxPsQg95nF7j5nSPDq+on0MUApdwTO1ikjKh0U3Kb5DKgOqZw9hnX4knml8YueUlkU2M4nBml
	CuF12ckT7SVXs5OdSgtiEkwLv7XY6hQdXn3CnZ0F4qm8OUc6x1lZmvRN6MEseJbD/3bChSUsaSM
	S1Fw2dXJEQEB6sNeTtQ7LdFNEzBiK/taEps1eMgLN70R/xV5Yc+GmVQw1JSrtsR5tXvlQYt3y9d
	/0bsdfcciRXgejpwNVM8uYQ==
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr947764085a.2.1792656016681;
        Thu, 22 Oct 2026 01:00:16 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr947757685a.2.1792656016097;
        Thu, 22 Oct 2026 01:00:16 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403130703sm1537552a12.24.2026.10.22.01.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:00:15 -0700 (PDT)
Message-ID: <f5d77b3d-a6b3-42ea-8b20-939a301ae331@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:00:12 +0200
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
Subject: Re: [PATCH v4 0/2] Add device tree for Acer Swift Go Pro AI
To: Kaipeng Zeng <kaipeng94@gmail.com>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>, jactry92@gmail.com,
        andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, robh@kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com
References: <13181dfa-b92c-43b5-ae12-912abaf79c41@gmail.com>
 <20261013015728.43307-1-liujianfeng1994@gmail.com>
 <74d7c3dc-0880-40a4-b056-f9a089a0ddc4@oss.qualcomm.com>
 <CAHk8ZdvrVt8TkZrSd7qyzi5AirL+FtwUpHT0QLcUd5qBJmhy+w@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAHk8ZdvrVt8TkZrSd7qyzi5AirL+FtwUpHT0QLcUd5qBJmhy+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfX5M0Ul8zgGwtS
 nvERQqLiqxzGxF4Fzz0TmqFtclsQ/KkNXreHIuqadXZviWCxakHJHe61zQbL+2XWkjazBFgM9/8
 u0N8NEVMVEFS4TCgj58nDuI/Q5CH/M0=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad9c291 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_MKHsu4bIe8qKVLab3cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: dl8ksLX8skWkWOImafQAarUExN39fnTq
X-Proofpoint-ORIG-GUID: dl8ksLX8skWkWOImafQAarUExN39fnTq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfX9UTecmRWpzeY
 9getOXy/1LfOJblpnl5fiGxAFv0H0rysUIJjcKQ2CAOB+9FBRsDZNfbkbUL63ol1xl3lMgxQM29
 ZM0DW57uNsM+3gQNWL4LjbU4FSfMTB6QORc99IgNQNlwuiOSWphKmn2pxhIgYaZN4HE6J3QD5dC
 yyN3FVGMFlSMAPei0guv13/YpzHqgFV1BJjuA+p8SmHh1Mes0bwbkAIyPBs8e66Gy1wVPuVihBl
 G5cz38NLDi5oAEwd3vefVpKcAju3ah7UzveIA1Om5jRnoMoIMxM9WxnDsYshHtyG1j6fqEfC20O
 FZ3JlWlLkof3ScZyvY1wnfCG83A/XMEj2/cZepgyuuhnHiG7Pw7YFhMmeJdljhvyceyMzaCWhxq
 Zl2c/9kQs+C+BCTq0iird2myYH4ygR3Gq4Z2MtH0FjIQXycoDNIxG2Gbhc6q2XHnmtbyDJ8Tv7c
 5fkreiWhkt0q/TNickA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220031

On 10/22/26 8:15 AM, Kaipeng Zeng wrote:
> Hi Konrad,
> 
> Thanks for your reply.
> 
> On Wed, Oct 21, 2026 at 8:48 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> This makes it sound like the retailer made up / confused some names,
>> let's just go with what the manufacturer says
>>
> 
> Just want to make sure I don't misunderstand anything, if this is what
> you preferred:
> ```
> model = "Acer Swift Go Pro AI (SFA14-11)";
> compatible = "acer,swift-sfa14-11", "qcom,x1e78100", "qcom,x1e80100";

My reading of Jianfeng's email is that the "Go Pro AI" part does
not appear on the Acer sites

Konrad
