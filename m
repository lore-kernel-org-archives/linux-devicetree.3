Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600687;
	b=fXllRcARb2d6LYIgD9hvOjm46VJp56drGuKL0kyXOzFze0DZ1hdwXx07z0leZueB/zCp
	 q+Pk1i50KdiYWAi4eDN+ICghKUTuy5TjctGwI886Cq4MjoDnPOY17RnIYVwb99qPsu0C+
	 srVJm9vElC3KJnGA56lYKacUMq37HP+ZRqebvx36S/0HjZx5MMIfEOP3Ea+aQphqy8zex
	 vBedbbivUo59ElBr5FRPcv+IT/vMUne0dwA3+aOfSk5WACjAJcVPOCk1UZ7bnLwCm0xbZ
	 ugCtIys0kl1wVP7b34AYRY6BsgWrWHpU5jsiKdOAz776bXQYCvBTqLfCs8JJTkQubuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600687;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YOwEOQ04bwonMSZcPiNQPCaNKI8p0Mt2Pygdfegwx/s=;
	b=lcd5hawvw3XeFyDqA4i1i863/zF+e3wf2+ndlUaXAN3Rq8yRLuRSxgewkQggrJqREeHZ
	 rJmP46MYtJqWGwj2VKy5zpJhTyWz2BbluX2mGKQzIzuWa4e6EgQDg01QQK1NU8G+tXq9Y
	 Kb7rdTvYIHIumniEwtaXuvbInV8Oeh2otNAqTf+LDnqng6KpN9sbp+m14Lgih3Y7zrzwh
	 1EvtiUH8xjtMCJnxNp/do4qF8FODljHQxZEQVByX91tejuI6bbowt4zkI7NMX9LGtsiJH
	 10qNtxDdbDnrQpkXbm9hX8wkRVEIBh7Hy1jO0wepfW+IIG2c+IoivRYpeykQL5U/dBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F85xG0TL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S6vx9xM+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495DD606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 495DD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F85xG0TL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S6vx9xM+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mTCd4034158
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YOwEOQ04bwonMSZcPiNQPCaNKI8p0Mt2Pygdfegwx/s=; b=F85xG0TLwj6yUNqG
	ucMEqPshHe/Wxnse+cA56hPVXV2ZDsDuTG9HpYBGrYAByofS1d7eK7SKd8S4VzsY
	PI0aQA+oOb0TV0hcwkCuyCkyqta/jgXE90KjckSJnvmqVJJU+Ll6OeXI4iz5iIZO
	1WpFK2W6gcjn9R7xP8Q/H+UAG3vBuuc7cROS2auRp49Osb60bDPiIqjwEflIZffl
	nonR6bCondLRnRnUtK7dmxy5E85QuZHqct+JOG6CPpmFawXhOJ818ZsL8mP1twGI
	pQK8gcfxJMiIQKmMC9OPr+q4W60GJ0Licw9nxHYbZodIN8573690QWjTPMQeBPF8
	hIMGNQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbj5q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:58:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-949664eec1fso77239485a.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 01:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795600685; x=1796205485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YOwEOQ04bwonMSZcPiNQPCaNKI8p0Mt2Pygdfegwx/s=;
        b=S6vx9xM+/wr3gATMZO3qs03Ipew2Zi7C3cN3WQBZzmomXeGdYP785MwXQdqJ9PG60R
         6/3LU8/KNhbsuaQ3ZeB+UoJ8Q3vVmAtCJiPayK8cZT1kQNAwCLlBVxd33YqXjMxfhBFg
         Qy64eqWkqdgvXiMMGa0RqBQb+6r8jsAaQ5gFQ+Uurhlqi2CtQDR4vF29oOPGpKM24Do/
         1JjgtuozLLk3BGXikf/9ABGu7NtJC1UbY5iFyTE81iJklGxBxOFfQ7PeAT70TX8qHkDR
         1StQjP8WaTBLMUx3KzeOlXQp4WspjyP2l5QklFvl0WpiMx7XAAAtkNy/t98BmLQfQ0Eb
         igpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600685; x=1796205485;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YOwEOQ04bwonMSZcPiNQPCaNKI8p0Mt2Pygdfegwx/s=;
        b=TqqRqDTS9RRG+E4XT+CbB66tKseS+sVM+uMLm5JEFcHiI5yakyxB36XvfP0vF+LT7m
         np6SczhnPBNhcydy/BtdNtznHWkL+ZJCrLTTTIjjV9CpXP16sd6gSLQMkkgSd8ZTmXy3
         1v//t7iA9OySxsN4swMwxNniC5hJFlYYEOOz6u2Lav692Awd+7fwBBmK+knQTDjnuv6/
         Q5dejqbj/x3m2KbTqMCfgYiFbF8kntH/WcH5rPvm6GMspgApJmlPJNgDihyCbZC2eDiV
         k8IMJsXhNWuO5v0u4hQGGKNGikcrXiNvdgO0IvU/W2qyUxhsmVjir6D5rXCx+JbzaI8k
         Aj4g==
X-Forwarded-Encrypted: i=1; AL+hErEjR3Tj0oC/vqhnjP0lgj7t0po2bIfY7yJdnqpciMMAaQ7+5xlGVMyNR2yRYDPwAsZScN3j3lS+8sNX@vger.kernel.org
X-Gm-Message-State: APuU4Z8RbocVtHThJSfSQtBu6irg/NzTB/ToP1KdghLzqsrMfz/RFZY6
	mATT7GLoNKRovsuIGBpDfMyzfi7djPVlXbYxoIUHOCb7sq8RMSN1QMPRKm9iSG7Lu8H4lFnrRUX
	+YFzq8lRWTU22iFCfBmI9rK4dN8O4s6ueTycjZZnd5CqV8zGDBW21Hz1K8Wg7d6ao
X-Gm-Gg: AZFdTZd/DBjcBuzBYjd+svlwwG0vPqc6cr/X3J0zTNS4iQw/Kxk4EF2joip2MS3BPFq
	ypJIA59Le0thL/MoKlwd66A37pGnkZ4hNoJ/qInngL+J8cEGA8lyLYCz0Gn2BECNb5H3SKdiST9
	/wppC9csuQoQZxPD2jaGRBw40Iih2IG+SFiyE3YRHKZQTmCLVwfWoVHO0uJLaW9JMjqZuTbzeS6
	EEW6O33ZmaduDGwIvnYIhlX8xBu66UYfL0bGpD5bQGwCwFFNjUBBVjaK5jbS5nJolNku8p6+qbL
	1SHphqPvXYWjYP99w5DQMDFcRNO0TZkDlt3jLO82VkRPEiMXz3xezaB+q6JbJXpAy4JGHmMBgRj
	YbrOHJQCFhAke7ujZSbGkexUj/wqJNtUUCx037OdzOFJxdCFj5ZwM1ZFA5lM27/YjMVKZOXM=
X-Received: by 2002:a05:620a:a914:b0:949:afe9:5539 with SMTP id af79cd13be357-949ba8e9975mr3259759085a.2.1795600685507;
        Wed, 25 Nov 2026 01:58:05 -0800 (PST)
X-Received: by 2002:a05:620a:a914:b0:949:afe9:5539 with SMTP id af79cd13be357-949ba8e9975mr3259756185a.2.1795600685098;
        Wed, 25 Nov 2026 01:58:05 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6872asm598736166b.13.2026.11.25.01.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:58:04 -0800 (PST)
Message-ID: <89b5d2e6-b8fb-4f76-aa10-4725c8d0c905@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 10:58:02 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: maili: Add memory-region for audio PD
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261123-maili-audio-v1-1-7dc0152eb70f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-maili-audio-v1-1-7dc0152eb70f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX1ahwbSoEY+Nb
 EeFAbmXcE2nkJaxPZX+TmCELIdUCOiwUPwNq4XcUzrAHHOiN3Fu2KR/efbqk9Qxkpl18c2Crje4
 2AbRMAZ9/cRyJxom65FAzqEVYqIbiSc=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06b12e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7uvYGeanNWfiNNmTFgYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX3gIpSrwxeur1
 n9+0BJXoGsvy9vDD8M7UaMihUATLlWq4cfCW6vdSc5noPXKrOaIsn/T9gvRbSZ0XIcIYHDEuqpD
 YqP6BTB3DHcxF1jAlH/uf0CxAy9s5lhg8d6rB9TAnSw8D0VcNg2Pox+7ngmUynHT2X5ZbA4lErz
 URJfa96T9f3zZcbVNa+DIM/JdCLdg1TB7d83DX0RGVx5PdFflcQpDgSmr8RTwO+YoZxA3n/fFVk
 QloDHe+bh/cBDBwDDhEQzcF0ME+9rRSDgjE7UuG4HRGZfZqY0dQHZR3M/ZvzhUOw2GtTzHsVwiS
 EZDdgUBbzAh+mwlorvonu+n9qnNyUd03djAT3GFxsF5vVQWfU9gdaQo9YqprHcjaqBe42Fsen8N
 OWFNNrLS0nNzW9vQW/tWRmXQ9tLi5feWQj/2354rqGKurOGWxOU/JrMj/+8DzGpgB+rF/R74mla
 EIPew7oTodRs81IGSkQ==
X-Proofpoint-ORIG-GUID: qf_gbwc6A2tWhZ32GMnNMO-HxGHDDvgI
X-Proofpoint-GUID: qf_gbwc6A2tWhZ32GMnNMO-HxGHDDvgI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250038

On 11/23/26 6:43 AM, Vinayak Katoch wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
