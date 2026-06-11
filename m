Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9933D6487
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781175934; cv=none; b=chNUZjR8rBJDZRfmTbiDZaMQq53861tdRhHzP87Iwi0kFL2maCvam2N77dJM2ZOwQONAZPp7vDpiV+yr+RPrJWWXv+8BfUioabm1rl4xIdGMM+hjztb1W1U0Sa6Rey7QQR3U1uG2RjNBhqKsx/hxr6Pbk/NlfGLr8i2ME01o1f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781175934; c=relaxed/simple;
	bh=/wxQSaRakumNKYB4vqjOTBgyQzqMLc8DAYpMLHYYAXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NwJoCYEoiyN9cP7FmZko5b+bsbfd80IWHNLZamGJ/b3rXCVeck3Beqd8L+Pf7c9sN52LiQWqzKiC8uHbNjOcNZoOt/r6Zb7Yq/ZKD+diR5oYK2dl9mM7jqdE3/52ypPVMTbzRJiDOtKEJ9qpeH7SwBtEz5qUU8l5VU64eEsfcRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2xWBKdv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FFavymKI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I2xWBKdv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FFavymKI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xx0I214646
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MaD+SVyMDIg2d/edNc/15/ePklSjOmExxWuDVzVekf4=; b=I2xWBKdvhWa3HVSh
	QJ+IsVIexhJqMUy6ElBfAfFWdp5vQS6zDAdb3s4+Ud8avq+JzY8O82W9FJRW540n
	wZoMLSObdhjjI70P2oXAaSOzmoMiXI1PcIodMEIWmbRRGv/V9fmPGtKGEzj7/SgH
	lfAO37K6fhVHofZ02qqIjv51qiaCx0Ex9rO95EFp87SYQDR1Zzr3sMl9JZYM5WdP
	5bvYjISYlxNGSnvggUKGLw4PPNgLNyFknKDLP9NiAPWMdCDDeGteGa05jUx0p9bl
	OE0itsiGObG3+PJlmSsZeTRgYRRFQnEmY2CPM3dlNFY3UdtY+/bOW98xzpv4gM/Z
	DNY4zg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sk4xg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:05:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51759082206so23295471cf.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781175931; x=1781780731; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MaD+SVyMDIg2d/edNc/15/ePklSjOmExxWuDVzVekf4=;
        b=FFavymKIHYJJwHUugIKrhSGRBc3MhFprYBZw6k2R3A+Ie1UtCG1nNgHJttQqmWKKPb
         EaBLaQsD8HOieM1VsI7XoJx3qn9F6zk7wzr5wZSWZsl4yIgM1T+1oNiPJDYY7McLmzOB
         MJrK3vmdeYRM+jmcRw1mKdphVEqyfNBWj6NF/brR4nnItcmc1Jml7d95x+x11GydSS3w
         8GZAX5QS/OFXpej36PfiUb1RkPCB22+zwizBnkr8KUMb0mgzBB96RhQitxkiWyRVXkN0
         I5tvVdLXRA0gW4QRpVdWsnP1QgmLO/tyQmzVGW1NWQ1H1ZI+bZY6JENvFkKa2oHbgUqq
         S4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781175931; x=1781780731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MaD+SVyMDIg2d/edNc/15/ePklSjOmExxWuDVzVekf4=;
        b=lFB7rnIRMY2SOG/+Rnz2daTlsGBIqh5LfhovKvnin3hgAkmYIPLouQCUERxTMCVYl1
         83jqhx2e/4b9KlsROKFgOGfrq0fkXH9TUPG2FgfZybP+mTMTORIkaEiTKfVmuAtFqrco
         j8I8QYJXwDNlEYHFTUY/G0K7COPYIvMPz2AaAfIxMF2XBJ56ffY/DvTofuC9oFydt5Vj
         AxZHy+jjnmtzNoIbsOD4Iu5NimsLKMz4/ZI/P7xIXjPT0vZK6A0uRWoW1Klf4zCKvKtH
         GC7CuC5UgMK4VjICSbpxui5XXcUDR14paFn9UeHhtNfK25tGB36X7ObZh5gGaqWDiqhP
         sbhA==
X-Forwarded-Encrypted: i=1; AFNElJ/guw1FizQGqvr+FL/6Drh3xruCkTLBOoVEkhbhXvf9bYaQg9yKwK3GP1vtguR+cDiwjoGZXqNh86rr@vger.kernel.org
X-Gm-Message-State: AOJu0YyaYbjHRvp+zwwyfCRIx4S4aXSsosy7zPH5uZ56UnGxU8+dsUj0
	MUdyLwEOBgWKvaE7TkSFLRujawZoUtkGwpIkIG8zDaUTOwT3uqefKTlDaxoTKzWJAIZbNRPSdcO
	8zBUXRBc7q/YBUUA5ZHmObN3/195JSPrYVL+Rfv3EvoIj5djq2sSzhE2IQfEzOKEW
X-Gm-Gg: Acq92OHtz/oawOKD0QReCT2bxmXBr5qWfm/1yoPyiDX27lr5uAsyxxxc08DFcDREi1f
	dOVNGmTPYbBbYvSK6fwNTsLJJ1MDuCdFz5bLzTMn2X+WZXKV7eZSsmLMmOBSgL7Fsc7n42/OIKP
	CacdvytEblx2//NbS3LmgfjpBpE41Q6o87OjfwPJ4ltr5rvn1xWZRlWKKB8EKgl82NOS/rwsCQm
	ePLxKk+8oi6EZakYSQ1854B4qsT/untPdbylRs4lgN+gS6iAW5jOYHnoodGJb8/p/QNSu0ZGSid
	qmn+IFQNVWBwJea0oDRbbDqyRxWuH8o5zOMm4gKhCsTTNqVlVGUqHVWl07Bi7JtX4xtHxG2Ko/8
	CTeVNe1GtzRNRBldqhrH9ZK+G11pZpBYEtpb7dOSQ+4OJnzdCEPtqOyYJ
X-Received: by 2002:a05:620a:1713:b0:902:daaf:22cd with SMTP id af79cd13be357-9160a4f660cmr192690185a.0.1781175931068;
        Thu, 11 Jun 2026 04:05:31 -0700 (PDT)
X-Received: by 2002:a05:620a:1713:b0:902:daaf:22cd with SMTP id af79cd13be357-9160a4f660cmr192684285a.0.1781175930499;
        Thu, 11 Jun 2026 04:05:30 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65867e7dsm10880036a12.20.2026.06.11.04.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:05:29 -0700 (PDT)
Message-ID: <73f700f2-7cba-4832-bd06-e82a7fd51a7a@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:05:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-5-f6857af1ce91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-hamoa_pdc-v2-5-f6857af1ce91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2a967b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=avOr_zNKPfybmo9zg3EA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Pwwa-fi3RbCPLZwD6hmsW_I-j66l4jXc
X-Proofpoint-GUID: Pwwa-fi3RbCPLZwD6hmsW_I-j66l4jXc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExMSBTYWx0ZWRfX6nFoVRWMIehg
 3vVUxcVkO9UMs6IAJWCCmp0ogCoxb9gzB6rsH8ldKHFe0BMylWxS+990wRWSruXeVLNhHN3uuYR
 kOrwDs55l+iJ6zzSYAdn7nlO4Jw5PHlw36fTH0vztyNsFlcs38QhcsoebF7NKZqq92EEhLPBZuK
 SfrrQTAwE5AfmxSKbHm6oWxxasgjlrnpxVa4xrHK6X3O5lBCTys3LIXyZ9MUo0X0SIRh94GJiJ+
 yygQG5KwRT1McF4WnwQpSC5Ooww9kfso1nJJV4CZK/wcoeb1CVfSzQQ8NPnPlSS/onpKVHYm+5/
 TTuxYMLlS3rY7MmnFiZBWkimwymC/n/xfMe5OT4b3JZ/cPCFCE7JI6YxN3v5KwMjQTH+5bZQXLC
 4e4K0troWp8yWvKHRxoD77bHp1CDFJUNgQs/2o9nxCCxPwmgHvPgucQ50FDgEHeKktN/eqGZoLs
 P4mV87c6+K3nYx5oZSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExMSBTYWx0ZWRfX9kUEATUXFxEF
 XqfJcxoDKJJwwIKosJT5fIxbb/cNw4BupLP25Jpgol2nKp6Whv9q6k7gLgzuLUVTAdqnDUFnm7M
 jtmbD589hJAwkKVf735kU0h4ezqBQ/A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110111

On 5/26/26 12:54 PM, Maulik Shah wrote:
> All PDC irqchip supports pass through mode in which both Direct SPIs and
> GPIO IRQs (as SPIs) are sent to GIC without latching at PDC.
> 
> Newer PDCs (v3.0 onwards) also support additional secondary controller mode
> where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
> still works same as pass through mode without latching at PDC even in
> secondary controller mode.
> 
> All the SoCs so far default uses pass through mode with the exception of
> x1e. x1e PDC may be set to secondary controller mode for builds on CRD
> boards whereas it may be set to pass through mode for IoT-EVK boards.
> The mode configuration is done in firmware and initially shipped windows
> firmware did not have SCM interface to read or modify the PDC mode.
> Later only write access is opened up for non secure world.
> 
> Using the write access available add changes to modify the PDC mode to
> pass through mode via SCM write. When the write fails (on older firmware)
> assume to work in secondary mode.
> 
> Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

[...]

> +static inline bool pdc_pin_uses_seconary_mode(int pin_out)

Please add a comment somewhere near here, repeating what you said in
the previous commit message (about the SPIs being mapped first, followed
by GPIO-as-SPIs)

Konrad
