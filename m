Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557550;
	b=YUd7wfUnhfU8NnT4T5jdW+JaQeRkQaQHto5b37zxWZjmD1cYfaJ2P2Xz5x0wagPfiXMq
	 ZXeYIQpYprWhGujeh0BeWNDes17LW/hfQgq2UE+aOAvtFM5qFJXeXwSjM6YfJvCh1Iiqz
	 baUuQjEtIjp80kqb4T1xza3hRl21AzqLf4O1RLawYPaca3TgRX73Psp/TzqGYmUEd1Ioe
	 k0a+sMK+LBJFbCi6ilX0bVRVaWMvpLppvBPRWZtcrF/gDp2eCQAIVFLwXImWoA0due+O8
	 CMaKnYdC0lBDF15VwlvBZEc8x++PSk3eqS/oRTBiIWEGbWB1tIAg2qqyPz4NMPHGsqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557550;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yZnFjQJx3sTnKbIEHL+q7YpvIjJRoUyfbTVk26tE5gM=;
	b=EuxibfKkiRZVEoKjPra1FbITs/fMuTbcU0aVsgn08k9dADvyTzR2uuFTwh0bnU76+4uv
	 XEcJyjx73A/hOC2QgTegGFKJBxP7ZZB8PTJ59mxR9OGSMrqdC6sUgudRX8WMt/E5UZFVh
	 TG7PUv72hHQ+TcqRdryeUkUKtbgbvRAK3SCpQ3eZd3z8q2wLoNWb5+UTXvv0A++3O4A57
	 iCWiO+lfd+PzbpY2+FPETdfJWnSB0BTDrGLxuDh190Cn0DRyOnzMSLv4ZdThEzRf3s8kJ
	 +dLKN8+5AXqeN5Be2sg0KGvYM+Tes+3hntqzflWfB2IlmP1qubYPqIkJFtteT34uApQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ViMJ41Fe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gOFzVT4+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B09606A32A
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5B09606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ViMJ41Fe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gOFzVT4+
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD570lm2618629
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yZnFjQJx3sTnKbIEHL+q7YpvIjJRoUyfbTVk26tE5gM=; b=ViMJ41FeS78SGe/0
	E4ovvj0v/cC9Is8rJ52wY32sp7eo2LlUUKrtHm23+B1R7/0w6tdI84vAi1aBlu2D
	+AED2WpkjVZcQbWkEvlzipv/iwA7NAuZ1Sj4Tsy8suguFUrUgog8ubD3ObujsIdu
	5yLLUfl9mOZWal7m2u/760J5hO9YIkScltBg9+s3teWhbDqv7LlBIL+F/23dMqpg
	yczAG861+OpViXTpn+mMpR0YVFgNyUPtk1D14wkd/Fib6bhnYXfQokzMzjQ/QhYw
	cdu2kCZvLbV8bAsZskRQwD954jUBeyrKS66xo6IVagUwSmU0v7sMqWwFNZmzEIMF
	M2V4YA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mruby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:12:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea6b66e53so17506485a.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794557548; x=1795162348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yZnFjQJx3sTnKbIEHL+q7YpvIjJRoUyfbTVk26tE5gM=;
        b=gOFzVT4+wyHipGT85SdnE7Q5ptjGpFD+d7j/bxO9+mwDQ9OEIsQNWJrjM1QxdD+8KF
         A+og4fg7ru643Mm2SrNzvO1FQnVy54gw+1N8fJG0aX1Fa1KT/fWI8ieH9BQkkgCRKc3q
         MAurVDBxE1layqFWyAIDcDMxSnyVoLcmWedKS69CCehfGfQh0DPs/+lqhy/WnBn0etnZ
         LEKD+m16ZhZdhPXKZNuYm/OEqGaRCM3jFN8WmKTc28yLllpGo6TRlBj5QlIJ+/un2duS
         j45IyG0WsT9tSGNvCijs76cjbEiM2V9EX8FvKiyJ7/qEwHa4IihEHwbM1MG/7ophNPvr
         MGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557548; x=1795162348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZnFjQJx3sTnKbIEHL+q7YpvIjJRoUyfbTVk26tE5gM=;
        b=BnzfhzAKKuruJuIXQn1+ZNnxwOTpLxZn8ILENaUJQ6tQHpx3gsG4ktuluH6sB+gf/x
         kwbh72JxPoh00ZQ6JjXVUDWhWW8kI1XG+CeCWrD/1K1BIqxRf0uWYswDy7pPAfJXuE32
         1Nc5c5HhVq5rVtdCR+vJgAyYv8UGcW3oZYGh1EvwXMl6jxdXoQYGj/hjVhVfqYpaFcmb
         RZ/wwm9Ki3jBtMp2NdNpMWHzRynt+Lo7S3L07nsTvuP/D09xfIStoAcqyVQU/rgG1ntx
         zI+3A8/pqfoFBVlijZTACO0QX+hx+rrV1AeGvJDN3zlm2XX+rPB3IO7XOGru4ot1ppW4
         wmrQ==
X-Forwarded-Encrypted: i=1; AL+hErHkVrn0+UMBDzgEF4oDKigiukj/kg87lKWGLaj/Dx/WNwAw2B5L68csRbSi1Z9Bsi2lMhIbUS1r/ujk@vger.kernel.org
X-Gm-Message-State: APuU4Z+zWgQNmmXSExixgwOhhA+jjnVPYqMoJb2XP/8PfwpRPc6MmfyZ
	o0++clJYnVZqedOx2nMKPNmZvsWzg/3yrie7274txUTLwBNtC3Ps2+JP2XwogQ8rmDGtoyIRwVz
	5VhODmVT7hHRXNx0csydIKGwFgcc8zA0pmVPuoYrgZAODXDDX81jYfwY3axhD3PSZ
X-Gm-Gg: AYBFou1ILMpH30L9e2+xpXIQ1EWMWZ7msDB5ivr7KuX0H3xtTrb9h5JqiVdIyi4cMJN
	HfB68JXTC/xoeqeii8miRhg2SmbWEm91GwFVCiGutHQf+54GyFEdIdLI/35dF99wBknwfDEZzmJ
	2yB/m+rE+u9RPKwjAEzaxqGE2ckFb2snBjircnSfB9yM5UqsOb/ZudwSGeiT8AuAD2DVG8PxvVZ
	xMCaiegkg5GAjdRwAS3dN/AOZgO7PtJOZoeHewD2nEmTvDmP45JdarF7Qz3mZskWWQN4MP7ZsPt
	TRyM0W28pxxfK10u4kUALCW/BiT9agjmRkUUMEeAQxpxHq2ZVncEuqRXYwBHkCKDH+UdJ3W8fvK
	YhMJhwoOCUUTkdWulpnti7d+wt7VniUezNiofDzEqWUNzQDLDY8Qcd3w1y22oolVaLQSB/1A=
X-Received: by 2002:a05:620a:818a:b0:945:ede4:d247 with SMTP id af79cd13be357-9494b9e03ecmr288682985a.1.1794557548103;
        Fri, 13 Nov 2026 00:12:28 -0800 (PST)
X-Received: by 2002:a05:620a:818a:b0:945:ede4:d247 with SMTP id af79cd13be357-9494b9e03ecmr288680685a.1.1794557547702;
        Fri, 13 Nov 2026 00:12:27 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23db711sm629005a12.24.2026.11.13.00.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 00:12:26 -0800 (PST)
Message-ID: <11036baa-7dee-45d8-9319-311288ca267d@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 09:12:24 +0100
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
Subject: Re: [PATCH 0/2] soc: qcom: Add SoC ID for SM7550
To: Aditya Choudhury <mail@inferno0230.in>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261112-sm7550-soc-id-v1-v1-0-57299906d81a@inferno0230.in>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112-sm7550-soc-id-v1-v1-0-57299906d81a@inferno0230.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TZSeuROYHCmGqBM3JPDjclfDmfac-r6L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMiBTYWx0ZWRfX57CY5N0FrdI2
 ewaDZJjpQjp31/XVUFisPHt1EJOkGjeYcN/xfaAqPWPeDVw2ehLpP0+ewIryTXNMVb32Ypgkk1U
 CgZQotOpV1I+yWZ/0+ATBSbx45dHAwija12Bb5PVkFbNy146Zl0YkZciLIw7vk0Jk1dN6oSFn7r
 194WbCaBSK6S5/ndzk//BYjGKyQFZYQQTgjN8hwEIqElAGas34XjYu7ezYm/NVX/eK0KXHCL6MI
 xaVl8kJOetgTf87slAKitgV1nMlGZRu4leltg3jnYi6uQTnHjBeCsWWnLrQipiKOPrVIHeqH8N6
 ReDkmecaNxmLVC/xt1bSZ9CMXjUQSXYK9Xtzo4FZJeEiTlHqwjpq72ReWP6iCa7ZiobhvfoDF8f
 SiQ5vz5Vik/fJd17XIIj55IKWdJaMG+FJDkbNrDGwxuZVf6jiFzarDBKDfX2MFQcddbc1jHGRI7
 LOyqxcMlaYyhFoW7rwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMiBTYWx0ZWRfX+aQqQxX2Wxgq
 FuovqKuD/kS9sM5FHqL0Dk5PhrrWeenU7eXCDMgctlGXA+nEvKVWd85ebdTqRyJp5iLHvRkYkB0
 +7hqgGSdHjVeuAE+FwbyIJaAIEvHtYQ=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af6c66d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=E87KaQfuVDw1DwplJSQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: TZSeuROYHCmGqBM3JPDjclfDmfac-r6L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130032

On 11/12/26 11:30 AM, Aditya Choudhury wrote:
> Add the SoC ID for the Qualcomm SM7550 (codename "crow" in downstream) to the
> dt-bindings header and the socinfo table.

Please use the real codename of Camano for the following
submissions

Konrad
