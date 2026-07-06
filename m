Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9C442F6ED
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 16:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353666; cv=none; b=ldlcefU3WilgCqrtWoxI41TmowQD9QGPUWreApiZfc9mNeYDkyvs1n9F5Y6X/ahTJ8EsFVf4PJMJ7eXfSEjs0zSxzlYTqdDMBL+LIU4/xl2AD+0Z1rNyShVRYdnBqh6PQtYdpfHIyXkUdUvwpoB19fO0aA2sbyVYHTWo3hEBnWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353666; c=relaxed/simple;
	bh=q6nNbzXJtETtA6xrrhH1irWB4lBSMDLulBIzGK3K88I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FemwdpJtnuG860E7gdT1+DKbZ9EejD0cbNk13GiBk0mEg33uw9Gv4esq93cOaVLUkfzaxfsupYOaM8FLaLKb3KvvD1knXMWrXDibYsiXsn+c7vHc6G3pvPR1orSxzO3GAe8qaIVpBkgqHrVG91oddfRM6U4CYSRs6GAtfwW+yVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zt03F/XO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K53LSRzo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zt03F/XO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K53LSRzo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFIc0958831
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 16:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J238hFNtUNH+dPXx6/ncG4WP7PkZ567N2sB/Wwv0aCA=; b=Zt03F/XOM8coNTRx
	gXiNYrhCDjfYIffoLzBJFSaF4PKsQY/1nSO2CFwo/rej+olh/Ku6yLm2H9ADLIxx
	c6hItf4vXwKC1Aeqw1hG2oT+37vK0F5j7cB/vE+lGopNmixECslQX+bJAmQjFUB4
	MwaK8P5TBHHH84V8oU+wr0f+5/KCpuv2zdPcBZ0Nxem8jVYmjcR86RAgE+IN9aA6
	44X4N92CjFG+FlDYPUp0WYaCgfiS0mqjE3tyWjMuM7cO48LwRxbAEYj8BPWYEuRv
	SFmcQEcDu7LJJBhYL9ziEzfnnpHIKOB/I40jclwKWrVNA9N3KBawJNN9hOUE6295
	dYOLJw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9a4xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 16:01:04 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a0c02365c7so4019069eaf.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783353663; x=1783958463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J238hFNtUNH+dPXx6/ncG4WP7PkZ567N2sB/Wwv0aCA=;
        b=K53LSRzoTXXhhdjUJhqYBxfGqkIvGbMisjYAMaJlBTh9s1jcqVx2g9sp79wOBBCJMT
         58SgMvDA42NKO/2yP71yqd122lzSYPBjdcygMRbClxntsNM2naZ5AKEd//LjzMR4u+JY
         lltQdMtAm44UC5N+/9CeR0CgzfaqHlu3tzgnlc/IW6nR0vC6PzGcT/sX3cd834ajh6gR
         BS5OHcUwPRrKf6GwlE7Ka7P7rtL0Dqhqb1T3Dih4r6KQ9Ew3irdQiPXvn7ehbouDu+2n
         h4WbI/gG0FnXv7nWp6B5rqixraOEHw1XiIFvUMozds0GDmMURPGftrfiVFHNbs2zh5nu
         wGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353663; x=1783958463;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J238hFNtUNH+dPXx6/ncG4WP7PkZ567N2sB/Wwv0aCA=;
        b=Ai6oECGRDmQ+KrUGGvp4G69/XGIChFzima+2FrnrFQHQfgXXzfEUWCxyJXdOzameOI
         6x2oPE4C9QhYg60g2JBANVpItKlgaRu2bIQ5xyNWwZ1aqvUihu9vopitkqVbbXs3P0gD
         QJsEfTKLatrbhLJpo2fpiRVl0rlVoG/gabRYJqNP36cMLgSaJer7UWBwsEfDUt3o/RNm
         13zPkn8zXpGJtE6bH3eXdKaMwG8qLoVdEJCo2rK3O2z1gXQ8vdSS7IpREMRmUH9a/Rth
         lZkT4/33hbQhUauGXDCcXUNp5dounm8IWXOeOT+A1Kq66c+XNqT0xb/I0cML9ref0alm
         2hxA==
X-Forwarded-Encrypted: i=1; AFNElJ/Kwz/88PNCyITwIC+kN4HOqSE2odLlx0W9aQSWGEtaTO5hT8dO2YSJzTFEGA9mbvYBSxJo7c9QdXuk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh+ha/whbsLAFy/mXCBGRCHeCDuiRnPtvfDB++UoZosyQC4Zk/
	WKvd7zNCYujporYkhTxFXCUXduODjKOzoe6/fiy8wlln/2NFnQfyPH//nVHQ8QTEmWbJxsL2jmr
	osLU6Osun7VWdKB50tOp36zJIMVwI3yUMoifJZiP9mjWl1r9rTxTHL7sfQS/CM53Y
X-Gm-Gg: AfdE7cn+QTHqAkcGvtkJJ8Gqp27dpQu0INcicHa0alt1jhpXXHvfFRPIk00Vf5TvhWA
	LlDYpgzXZcsX5mbrkAoRRLGq8RM1kRXDTq8DmLsoP9yF1bi5OKOuDc9tjnTbIfLzwTz5T+MGESD
	s0VPFa5c2ogAyeu1FbpUoPNsESdKB8uFxT15Dw7ijRgtUdk7H+z6cmuOXgHQbDAF5F4hcS+oFx8
	1dkzBqCHB6Jeh5v4XL7geFMJlOvHjh04uhto1QK+We7YBS0pLcfs9iWtz75sQgq492Jgwf6mo0x
	VCcBmlMVUO3Nf0dYQ12FyOg6X6wQZyXeHueArQCvnztPRnFJUsw/HDbqoSGPsJmjHHAIr8xTmBw
	0DoLfXJzdI7IVN3RmNzxwZuIlumgO3VS3wYfZhE8Z
X-Received: by 2002:a05:6820:190d:b0:6a3:9ce:5412 with SMTP id 006d021491bc7-6a35559b66bmr638257eaf.38.1783353662838;
        Mon, 06 Jul 2026 09:01:02 -0700 (PDT)
X-Received: by 2002:a05:6820:190d:b0:6a3:9ce:5412 with SMTP id 006d021491bc7-6a35559b66bmr638190eaf.38.1783353662024;
        Mon, 06 Jul 2026 09:01:02 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce12c40sm488436205e9.13.2026.07.06.09.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 09:01:00 -0700 (PDT)
Message-ID: <4e4b3198-ac0b-400c-a595-ceb025570e93@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 18:00:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dtc: dt-check-style: Narrow disallowing of tab in
 DTS only to YAML
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com>
 <20260706-dts-style-checker-v3-1-03ffacff9226@oss.qualcomm.com>
 <20260706155903.9827E1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260706155903.9827E1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QGsoC_6uOwXoiVCD98Xng76L698fN5XN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MiBTYWx0ZWRfXxszhLYnGmjka
 amKml9ojzmn+E42vK8mRWR6wpxHSxP6eMi15CYBKiFC2g7HmOhSVjhDNZ2SmM7VchqzkKw6saqD
 R8bWZKLHgphiurG0wSzcJIbA3r7KtV8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MiBTYWx0ZWRfXwzxrbWjAtZhj
 nBTm3MrZV+Au6XYVHDcd10AFIx52OIoEIX9Ai87VAv92UlCGwva9g1r7rSVRaiH3+usW26S1AUW
 tjbw4Yfac3RfUPnIpl/KQM6LaONg9essr/xFUkcZGQOfVUJ5gbiJWpMuNoqmd71y4Ep0ESvyjgT
 Pr+yMXHhXv3AGFUrGkq688ueoIJjyIMkgyqx0eBW2K3ZB6OikaYqtZQNbMkq1RAEQra1/NrytY2
 uSXoZmFKO2GoKmpbx/9vHafqAescqqJJJgOWnN2aflsbXJ8d4QHQmtWGpd6SAD+xYEu308JhAh8
 92XS8a93GAtt75FDH34KDX4TRM+4qQQNCjjvuRIczUxFcVmgsS4u19zaeB0/nrSDAEdDiVfZ2wS
 z1DD4uKhqCfMuV3tRk4Rj8uv6HmjxVsPKz1Y7IffibYMSj79KBrOY6jDdDtAkBQEWlBfwZDxLmK
 kKYOSivAfawkXH0d5Rw==
X-Proofpoint-GUID: QGsoC_6uOwXoiVCD98Xng76L698fN5XN
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4bd140 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=wuZ5MT4SbBbAavK90vAA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060162

On 06/07/2026 17:59, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The commit renames the function `check_tab_in_dts` to `check_tab_in_yaml_example` to resolve confusion, but fails to update the user-facing rule name `'tab-in-dts'`. This introduces an inconsistency between the internal function name and the rule string.
> --
> 

Ack

Best regards,
Krzysztof
