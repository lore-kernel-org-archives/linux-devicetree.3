Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116532;
	b=mmOtWFfzudm8+xNOaspjmVUeBhkexDW0JHrEYC/kv4e9IDHzzPPRfJ6IGKkSZrumyHTf
	 GQ+9MkVav0I2tNcAJ7wd1V1bJRhlBMwrwIxoFQG0/Y/XW0F3+nAdZiCSnro87AmdQOsoq
	 3v8rkWKbjuGE7jKEbTKFeZLVrpGK8ksJB2VAtyVHfG9nfAmanunD+Ms7q5h+n5nZIcerm
	 bGfLIth6wFIdGlSCfbvJlDkfGf+v+GmkJFFMdwHyn4m7Y4SFw8ALul5mYE/Yq3EThyiXg
	 XsP79/zko6LIeIQm6/37SPrwE85qmBWg4XzUxwS6AGVg0IPhKBhWQBf+ALIIOwN1Nyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116532;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GSWYhomsqnrchx8poiEzdLXzCYm7bD+QXUY8UH2ekeY=;
	b=vLAuGxdBc+BXWWpF5C2ZIGWkdvb5lg22l01ywrJtIcrfmcOrlAImTLqcgbZtJQL2hPcY
	 nZ363kuM5XWsvQNRVXU5c4nlV8Kxp/Js3xiA++wRcqasRoEBHefA/BD+thLvT7dnylTGQ
	 jJ5y/EMSV8GK109fA1FehFcpbOfn8FIeCIwguI8xP5RdJOsnrvO2o5om1k8eWKgD4/Ani
	 HARh/Wa+l2cdGhHJ0EZ441mvAz9TjwPKPkIGR5lPnf0Q491cSQiRApDZUPYe76Vxc2gf+
	 E1lmWDIwooyu7e97FfVANadw+XDt/4s3U7WNiG5mnKHJHePeDE6NvB94lfWyzC2lGjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ifyqD/Jz";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JoP5WzMn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CE2606A31B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 15:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08CE2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ifyqD/Jz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JoP5WzMn
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFLHns3086670
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 15:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GSWYhomsqnrchx8poiEzdLXzCYm7bD+QXUY8UH2ekeY=; b=ifyqD/Jz5Qg878rG
	wDdiMTJvQFZT5tsyzXWQsUoM2yM+9QbW1sU+klAmkdNTv1Dh8hvM8//OaUaVDDxV
	AZpAAz/jKyqluTrdcbkmWbhk/p95n+dsa5huSrAZv5IESjTVJTt11dLmJ4TxmVBp
	ZZGVJvhPwp+zRGdVYISB8C+RwWSp0bEoIwcnZ7PtTNTd1//M/cD0BYFe9iKt5kAu
	GHQ+n+d0GOmRwuxVsy8kCCiAQo+FZcbdzS2vJPSCWxj0t51jq2H4AMKLWwy5hZjW
	nwpEfmOEfuWVlmvEjYE+7mdfWUZeZcJK1iDzRHPLkP8b42eSCn3S7WjALEq5jbRH
	0Nds/A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbtb59w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 15:55:30 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-988ba2453abso5553241.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793116530; x=1793721330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GSWYhomsqnrchx8poiEzdLXzCYm7bD+QXUY8UH2ekeY=;
        b=JoP5WzMn+6B8L3Pg6e8dFIxaC7tyE1nz2unP7C511FtHiJY0Qb8rlMAaEaHLc7wk+t
         lvB3Av51KHg7/mMJ4FfLCK9KKS8OHseD4kdTEr6kZqnVA9vmxyqMOGwYRipRrN2y1znX
         BSYCDGKojWR8cJlRX34tSwCQLO1bmHCuPX9UekwCEKtUSVKX50i/GY77lEseZIRtfPeg
         YYdGBpTxG7ticANCBbTPOQk5Q5zEWSFjdVfTDhDuItp5p8I9IoRdcs2ohs0iiWNqtuTm
         ag65U0OTFn7jR07feUf/hGi/I7SuIyV5ocGGZmaOBtnF3YkvFtz2lai+EvGbuFptiBNw
         kjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116530; x=1793721330;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GSWYhomsqnrchx8poiEzdLXzCYm7bD+QXUY8UH2ekeY=;
        b=wMrUeX/tyWklfJJtqlP1PfoBgxMliwAcRMRnm7qNzmPaBdLgqltGmDv1XTkUTnXdED
         /QM3QRrqaBaUnY3693gJXuB8eQ68KDj1z30B6OphmBb1wd3BgI68Jca+6RtYa0o0yXNr
         w9B1TapSGyeaovyRF+ZEgdgfN77Uc2MypUWCcmTK1zF6+jd/VdjnSz7eqobCZx4XVnTc
         IHeqS0RP64Im4tzPwTdy95CIT6qS9AcR7adf+HCRsPB+b2r9UaBvi031FJlzrXLsvEKT
         egagk7i8YKsrskDQ0SNmEke0RLG48EWm2fhhhmJqRWUwGSGqqqJ4qRzFqXuljKOVzpnW
         ZzPA==
X-Gm-Message-State: AFq9FYLz9YMo8QpljxH/0rTQLxEF106vcoEY5B2ax+CPC01YQsT3pd8L
	2tuumQ7SOTjMKjsdW3SSUpD2w61AbPCddhJc09OC1NyfFx1qQ0nuxgh8CTO/zMJOxGdTxf38y4M
	tyv65p/F6qnRawqAuZnfVwk6Ek4HciO62zz09sPJ2QKfA39ZExGJawLUcIyR+wcsS
X-Gm-Gg: AYBFou1XhFWL2/dQVP03rcYb6n96kvTEOuL9Qg8o3hM++a0Rse4vJYq2aSL7z/7m5TN
	h0lInr3hleueW35x0SyngsKQMs1SfTe/eKdFeXMUCL24auu9WYcMocRKT8RXr/Zmy23SmEagj+K
	qWOqJ2RWuhjDPKKxZaChJIx5AreZKomq39ar5vABU+SJbQ5CAt6m0ckSSvwE0lFZibiadG5fWCI
	5qOhfDDa1c3DNgaL7FIKGg50HEzYDxA5ErqB6SxHnGBm0djSHuROBHmz9h2S/SAPUc3unjtk6Iw
	enJRntCWV4jJAdZVztJAjZwmLsBfmI1l3X2exKmJKxCE6E4KmspUuHnkKC/opuxgRMiaM9Kx1/U
	03CWIFONJE5aTRVRsUJetKg==
X-Received: by 2002:ac5:c8af:0:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ec232688d9mr4623220e0c.3.1793116530145;
        Tue, 27 Oct 2026 08:55:30 -0700 (PDT)
X-Received: by 2002:ac5:c8af:0:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ec232688d9mr4623179e0c.3.1793116529658;
        Tue, 27 Oct 2026 08:55:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66ca8asm483938666b.57.2026.10.27.08.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:55:28 -0700 (PDT)
Message-ID: <f165e4aa-e6d8-413d-abb0-c2e5045109f4@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 16:55:26 +0100
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
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add Mahua QCB
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
 <20261027114955.1266499-5-sivansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027114955.1266499-5-sivansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfX0M5YvGzRqm0b
 yLLIiUeJdNqM4ZDMdNrAf2NAOEo38aEdTZqNyJgS5UXOcoOO3KVxaIqVeb3EMYiVBjVI57BqoQo
 LVxVKPPilcNYhQ4bTJ+LTSWk+M8fhD4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfX+XrgwZhnOcr2
 MTftSO/CXHpfkxwRaLcF9nPd78U9XWVI6lSF+sq+x+ly56glUaIGzRGnZ5ZjPbJikzGHjstLK7d
 YOq8ILQYYAaFGcaZOTZ1TE3h2LXSvMwUUovuWdLVsQBIyHBDTMGsRZ+G1J/UeOHWMsAzsIKvHWN
 n9GrMrzqzo4gXCFgjRouz5bAZsKyMuqzVj6f7ooFqaj5CwXZhjxgRJiVxB7VYOn5VO9SYH+eBkP
 kauKI4k3ZuiuQs2ba2Ii+kR5+Tu9O0RpdH9fsEjCRnd6JlAdmyeDTATOGIobRSlqcwHWRoXKuMc
 BU3jukBQHRK5Etw9lCLn8+NYlY87Fj4QqU4Z71WWHRuDt8+gCTQDGvgiWwne2BU6UcBqhcWwUbv
 Ev8LuXlrcmJayMhk4PqbUHaIWQj925ALOodLPyHmUgh/6fF5OnVyF6MbMj13a7LndWO2xgjhiyS
 ZnMIENndMwMhucFv//g==
X-Proofpoint-ORIG-GUID: prUymBpZrlatb7ilFMYhShgYixr5Ao72
X-Proofpoint-GUID: prUymBpZrlatb7ilFMYhShgYixr5Ao72
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae0c972 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=q8tHnqZ0nZ31iGzolrYA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270063

On 10/27/26 12:49 PM, Sivansh Gupta wrote:
> Add initial device tree support for Mahua QCB. Mahua QCB is a variant
> of Glymur QCB but using Mahua SoC instead of Glymur SoC.
> Mahua is a 12 core derivative of Glymur SoC.
> 
> Unlike the CRD, the QCB is suitable for compute workloads, power
> measurements and oscilloscope-based hardware validation.
> 
> Includes glymur-qcb.dtsi, adds Mahua QCB specific board compatible,
> adds tcsr regulator-supply properties, removed cluster2 PMIC/thermal
> nodes.
> 
> Co-developed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
