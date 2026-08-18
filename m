Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD1F3890E3
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043638; cv=none; b=YFoaxi4duzArj4WtFKyZqfNnMrdPPBnCJH5urX2UoFeZu/JjprbqnLXqWyNL5bMGQxJvDb1qZe6W4d4fM9Vip8nfFJz/LcpIIcQ1R7kO9I20QEvdIp4Eyfs3Y6PBZ+DeZgjxLA3pLWXTRYwsYcghEZJxwrUqDJb0UJE208WZ1cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043638; c=relaxed/simple;
	bh=/ylqoGSHr6OZc2aQ4hnQQ8ZcxAh6qCEnKowInjzZGPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gwi/TTfywT9cHcKaUXRjz9awKw2Li4E8FpxTy7H94ikm1auMIGopdL50mziZrV8IESL2qIoKAiFlN9TQledxU5RpnA7yOrfJHHRw4lLWXn6hnmTwm0ezN9f21KB4RdsdkaVAX/hNuxOhBXiWKfWADMtPTxK73IIpSqPiNYAOKdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ECxShCjk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYYisWsJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ECxShCjk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYYisWsJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BKaX3991097
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ylqoGSHr6OZc2aQ4hnQQ8ZcxAh6qCEnKowInjzZGPg=; b=ECxShCjkR2GtPzyI
	32OZlQAIhQKIt3ynmLWUJFBAJBLcQl77htHF5n6IH4xY8YYxyBDbrDCrPjZOvDyA
	EP6V2KBbPpcy7zkQU6gqVgwNR3Kd3bu6QzIZebsPdjeZb6fq5joaGlWDS43iyKjC
	hFdoD4eNJXNy4hsB+BL50s0xMDzOmrjsXLA+9YVgl3bV4VkP4cqTJ794zj0UUDmS
	oje+pBALDhIwGEH6/SA6EsRDALuJ8Z3Gcp8gkdrMGOshNHtJvkFO61N50gjhVMZZ
	+ZdAaGIDTk6MjoiMmNi6AdXU+T3wLltydHSwjXQtmmEpmQ0HBYQ+0k4/riKMAVP1
	0/58xA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4f5psd31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:00:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5e21552dso30945985a.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 02:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787043635; x=1787648435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ylqoGSHr6OZc2aQ4hnQQ8ZcxAh6qCEnKowInjzZGPg=;
        b=XYYisWsJ5Kl41NHW2DbFRSgiER/NnmF4r+lbQRkAFhO5vbMTEy0uswehU7HDuVI7FY
         FeU/t3FbuKnIw7yGCTKLPgJ1Br+KvqL+1vlsx72nb0cPF2fDLCwvF1C+jIJO5kKbA0F5
         CQo+m1HkErHyCsfFlygp3OqxNxGeB/cmMw2XBmqmcrH3maIswhzw3YJjIRRaAXZWWQ4N
         Jj8rXRWUAsC70v/iA4XZB+eIhtSVrnCB5TyoZkpO9IJeUDT37D7O70ZsiIviGSP+xTLD
         NbV0h5chOkpWrDdbSzvGaeF8yF2FXR36DUbO4vFz0Zjb/D+2HgVTYoUX3j4AV4WspAZP
         CUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043635; x=1787648435;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ylqoGSHr6OZc2aQ4hnQQ8ZcxAh6qCEnKowInjzZGPg=;
        b=E8+RjX/kGCF5Af8pSulYgHdRiFErjM5kJmQeqNix+PVMje84HUPN6Ifj2S/+dD6BA6
         gSpWqDZNfarT6ZRxJB3cok02pMI6etEQPYflzjKTdOYfQtwN2yTWtKqEKs9GgWEIG8ZF
         14anlEVefv5F2tq6yeriu40coTfFECEdqPRnGU3Eqh5TnzOOcOwcQwxvhCccdGoPGnrF
         gBUeLlUAey27IleN2ZWsrZlEY3M9L/WS7p9tD6xblWkeYf7/9IzL+Q8fhqRKmHDpTPcF
         VnihPSfggtjDOgoJwwPuyXPIyeK5WFA+FANeElY0EGC+f3S2f/QgcB9AdjVxZh7LCIKF
         1eoA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7aejsTIWQLNeqjkZmW2LBaCFdED9bcjAf8/KVPiOkW18POUzGDrbihWFgS7RiXeXFMF1faFDZEkCB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx2bk09t67+9cUZadvQ/WgLk5xIAQuZmPfeqPGQuKgPLZjBm25
	eAlYfAFhP32nRHYUVDm1z/dqlpKU3aPLg9SE/V8KixBngD4yEjJaWypYljkMoY6xSD/o64bmLBe
	dsJk6OlTO7wAbD0zqZrm482f8XPoWtys6u6EELBGKvIyw6TtpEe6JF424L1tgHhe6
X-Gm-Gg: AR+sD1030qWlpj1b4zaPfCdeSzvKcwR1U30rdrq6stOYFp+fbKRhKZE4jRZF2SkwBjN
	pgurEmbjhujwQMwZNPTDboKuN8izFZ2sBS8HRtVmcAbEwbpsMwdLYmgQq1uTbBRP1iJmjmWval2
	Vs5pJKnK90ixN9WNZspxeudrPSsAK5vY/hdSIl+0nqaiQUPl3rs2khhYUm6azRCrfQUDAZXH0do
	yZTuPj3bwFpCE1DT5dO7sRBSu439mCNCTXXRlkutWMKWhVqzf27w4cq1B/Bg8ShQo8KQtiSTN5n
	WZ7p6wkwHa3Uyyou9JQK0ZMgR7i0xQ2M0OnvJGUr3u8pjIGwzBCx1Wob1tJ+QeSdlxdmnSsz//D
	NHJDdKaZ2FyfDn6HqCX96RXyR
X-Received: by 2002:a05:620a:4049:b0:936:5a34:7a6a with SMTP id af79cd13be357-937071938a9mr358147385a.3.1787043635126;
        Tue, 18 Aug 2026 02:00:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4049:b0:936:5a34:7a6a with SMTP id af79cd13be357-937071938a9mr358140885a.3.1787043634620;
        Tue, 18 Aug 2026 02:00:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46d00b60asm1026805e87.61.2026.08.18.02.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:00:33 -0700 (PDT)
Message-ID: <161415a0-58b8-4370-81ca-dd26424d726b@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:00:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] phy: qcom-ipq806x-usb: parse the tx-deamp-3_5db
 property as documented
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross
 <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-7-1a47e1185524@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-7-1a47e1185524@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S+/pBosP c=1 sm=1 tr=0 ts=6a841f34 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=MF3fq9KJeJn4W8AoZ4UA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 4I9WUl9MzlYja4JoVXubYKmqZwljG3GP
X-Proofpoint-ORIG-GUID: 4I9WUl9MzlYja4JoVXubYKmqZwljG3GP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NSBTYWx0ZWRfXyrBpJcvL5OUj
 kqibVkkdwXWYEbzs6wo6yBRG5LKlBclQT5mRKH3ajSA9ppoqgr0jY7OcNE1z+Z925V+/BR5Frc1
 CzgtncKw7ku6kwkIkrm997K2BRXeTJdpW+YmU/MBJ75gLUHmAx6+0AcNpi1ENyD3NtdzLI4nfs3
 jarzs80e/osuYnF28AoRndHBqirOUvzMsylZ0aDommRj2qbJPjwLkjVQKLZlpYl947/Pg2vT34W
 L5R6mM61JO9b77DYFbtFy/rzV6Ip5e8TZBRfa30AIx6ZjL137fdPqPe5xlbm+Jt78qmlGV03W/U
 5fTHTwlwAIWjwJUgH1GyCeltuBH0Cqf3Guyak9TWm0GcEFq5B6QezOROuH1HNDVtQyFfiUm4aC0
 FwHOWemt555pzPgFeMIirz/uWQCt2k0U8RLiqLp95+aeuQcGZA12wKkxWgq9s4EBSLhAEOKcYGK
 P9NClUP1gwKW6hYyC+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NSBTYWx0ZWRfX3A+L92UWFWHU
 gcMf8F/65EE2Gk9kEwsHerQZ6+yXH1vuJkYjhXSbgqz20ljDXhjhSZle22fOC4RkaxzBXo6w9uu
 GzCqW4Dd9FjOp/m17xo7ufNPM2i+q3o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180065

On 8/10/26 1:42 PM, Dmitry Baryshkov wrote:
> The driver reads the transmit de-emphasis override from
> qcom,tx-deamp_3_5db while the binding documents qcom,tx-deamp-3_5db,
> so a device tree following the binding is silently ignored and the
> default is used instead. No in-tree device tree uses either spelling.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
