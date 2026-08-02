Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AF83ACF1E
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 12:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785672821; cv=none; b=p8Olq/XDzPHDDAbrGfr19yGlJqevvc3oipvq9bmh1C8GwWMByv5DW4tI8jhrc/3pCyEy6Pay6rFcBPlPMNlAusvDa3RJeNwJy11Lz1+MBIyk3wkv/uMXYiYzxWSoprM3Q6m4ZytFiQp4ISWxNyfbzjNz5rAf2MjsGIq6Q7V9kls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785672821; c=relaxed/simple;
	bh=XFeIGXFsNj/WVujSMnVSiNstnvCrXXzQMeEwpldmIaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nEehRSLXAv94zbo0LpXlGvtxJh42nka3GGzt8bYoFr6YWZ7kh2ED5vF2l1hAcwaCC9vjY8GvFALpbBwUla0GiuRSqamBuAM3V10f8haj3wINIrJosUI65bNNXI3a4lMo56huUcUsxBVbjQzbM9AcgK/BLpW2XAzufl1rTDWnklw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sr344qDK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ikQ4HwRC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sr344qDK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ikQ4HwRC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672B6ZWM1278357
	for <devicetree@vger.kernel.org>; Sun, 2 Aug 2026 12:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VICUc6EzNGOKyJ+xiCMoB27j7InkVNcWcDFbYoB9JRM=; b=Sr344qDKenlylwcu
	QW12dK04T/HTGTHtx8md0DHOyguhO4W9Aq5wGla/22gbKm5b7FyWr4xEn+ZeUae3
	J100gZvlXFSR9HdhQ2wXefzpqfnoBbMjET3r600pZa23csUmhXnZqjoR12L+cz2F
	Y7yPP26785L6MScnfYz3Im7W5NEhTY+6uC+tCiIyGTL80LB8Zaf3/kIVPVJ29OOx
	xigCPndisZTU7ZFPtNUTdVL7JTmn2PCex0Vu1qPQPVouaWbEAWxMpuLKY3GKTZhb
	dvQiaST3Az8p88idU6FA7KPCxDDcvMWsq51r0GGl9ZZ//qx3mS58DDbfVlh+RGhk
	G/si6w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fsa382kp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 12:13:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-522de3c645dso50238011cf.3
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 05:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785672818; x=1786277618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VICUc6EzNGOKyJ+xiCMoB27j7InkVNcWcDFbYoB9JRM=;
        b=ikQ4HwRCcXBamYd6u7LopdPz35KgbXq1uR7RFaK0JH+kvdkhaesSP0H6wpC3l4OYJu
         LJlXEhkrINYrIOweFC56aQ/fn/ruKQ5TOgKpp8xNbhjRTTXLgAt+aBOlE9R4OXPYAkpV
         ia5CtUnM4+PgbdYlSi0K5PniD468J+ZxXegEnF+FR4xX2KyH90wAGicArkXQ9T7uMD20
         ZF9furquN+xpmMBZ8INxRJJ5PI+mXEPpERFjuPgMFoR1YOpt8S52wk59twG6JTd6ojFS
         weyysKY+z92Qg3ZaaiUrG8i2LpMAJZUjeD7n49jsU4lbr8piCSDL6JJIOvGpxYhFdOZh
         fqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785672818; x=1786277618;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VICUc6EzNGOKyJ+xiCMoB27j7InkVNcWcDFbYoB9JRM=;
        b=pBBHUSUfCrBA7qAy8kMvVu79AB0T+i56gOgSg00OF72MGJ6FZEg3xXX10wHQTYm7TO
         Gl34s8fDzcJVTIiUaTNHoPRFI2N1ScopBqr00kA30hoARBESsWT+CN21aB+gLpaIA6gX
         bA+pg2Q6RaASKUq2vc+TVJjTJ65+PfUYnfjtSZL1g4tKvmOb9cfNbRruK18OZ+XfdMCp
         sdz6tE5A99v3NWDs/5mmFR7sddvGDstAzAUbHbYLqLLcaH9VDj1u8R4kw2TYd++eg6cG
         W/oP9sm59QhUq6dAmrwVMIwuyZX7YofelwITrlmwxW+v9xuaznY1rWUNRirZ06ZW3id1
         DiMw==
X-Forwarded-Encrypted: i=1; AHgh+RrZUHUR1+Zqn/DzcG/6LhzmATRg4f8wTiXpHd9yL6mIEwCVhDLBPTGbPfprPeUdIOe7EnjoMb1Wn/Nj@vger.kernel.org
X-Gm-Message-State: AOJu0YyZiJlVBz+VuSQ2BqkJoU5MpGrnldqnP0sas8guIwLLVEtFV5e1
	5PklKQXdMC5YTnSRovVn5iL0eADm4QIc5GHNayoIYWkYrihxktMGBFL77NaoNhbLehsFVWbegdv
	xVsVxiuDDUAAweuAEY6BpmKD76cOyISzbTpuXGRFgPibUqsIAIXdsc1t9qlo+MWPc
X-Gm-Gg: AR+sD132jV6m5qyMlwdSpGJHCknj91r/Hgl1d+ZJdpgSPboK/3dqCyEuIvMZg1Irf5B
	mVdDom1a4wOP0R4qgXY25F2MM+HtD03isZrhSNhtMf2G8tn+9bwTIkr8DACvCbo1l5gCwbcPVxT
	zHORmN7rshZH20vNvjoY9QepPwG2UqIDOC/8szx0lAL20/24wZe8nh8pPV+W7MlN/4ZFoTga/Jd
	/SSxLzzWbS3GyxJOZAszkgtBngAW+m1131t6q96TpLO8hEzKO3amjWYU/uQzl4WeinhnGH7cnPl
	fMFy1oMsgUVJQVHOTIPuhj4g7QmduHdXE9aiGdMjVV6PDJD7YNtNKuMWOEueiiHmoT9N2H0kDro
	SrK8QjY+Wx5GfdjhAt2DM+pMZsJbyuA==
X-Received: by 2002:ac8:6905:0:b0:51c:e6a:1b5a with SMTP id d75a77b69052e-52b5669e32fmr135294771cf.12.1785672818018;
        Sun, 02 Aug 2026 05:13:38 -0700 (PDT)
X-Received: by 2002:ac8:6905:0:b0:51c:e6a:1b5a with SMTP id d75a77b69052e-52b5669e32fmr135294341cf.12.1785672817629;
        Sun, 02 Aug 2026 05:13:37 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0d7csm20790289f8f.35.2026.08.02.05.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 05:13:36 -0700 (PDT)
Message-ID: <10760e9e-2216-4307-8c6d-2f954f9297e2@oss.qualcomm.com>
Date: Sun, 2 Aug 2026 14:13:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] dtc: dt-check-style: Handle root node in
 overlays
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
 <20260802-n-dts-style-checker-continued-v2-3-6c5dbd1ccfe4@oss.qualcomm.com>
 <20260802090158.577821F00AC4@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260802090158.577821F00AC4@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KezidwYD c=1 sm=1 tr=0 ts=6a6f3473 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HGhs_lCdnpNgy2Gi7pQA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDEwNiBTYWx0ZWRfX8GhachqfNSDG
 s89Zhx0HzeVXmxSfBCj0SxknSBE2y81uE4Kz2iNMR3/0ywYcawexZfbw1n6j7xPQIUHKre4mubV
 kZz0/X2VHosArsxVU0k32XlXoTFrzUs=
X-Proofpoint-ORIG-GUID: xBGYOz_kLLjRh_dEuHnejYx4-XwzCuVk
X-Proofpoint-GUID: xBGYOz_kLLjRh_dEuHnejYx4-XwzCuVk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDEwNiBTYWx0ZWRfXzWYatwOYy/pD
 lsZIn0RLXCraDFWO6+53bMFHiQx+x+IuxGkk1AUqzHSIFARvUUWMSaRJd/zPrGSCqRddMk3AWS3
 gI2rSbSTFSo1oCx8dc0nvoIFydNeb/7vTP3T2FqakcF+EBBirnLISlq1Y0EsoNSkMTlh+HQKuOy
 HbEbSyluKKtQl/RIE1W03HxHHtgi1Jic52fYMgYV4gDsiMc01uVUBhpXu9Gag6taqt19O+533y/
 xAv44VaKYOy0y7uz8iPOA+FS3G6SIgKqczsekFbD91i+l3remBM8p1nR8Dfs8gW8ezLBCuP7FMl
 GA4XxbjZotaq/O1jQ/DpC4j25C501Fz0V6yeiip3B/fTtJ3leKIC6CSeGpIZDDJ3q+NM2qfvCwo
 N0Jm9LW5R9GjKxqG0KvVFViWwLj0EThISmUjBst/JzHOnkZnmiwB/BjjZ+RdWuML3mzWxceRhTB
 RCaNIKOoJ9p2+z5rtew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608020106

On 02/08/2026 11:01, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The patch has a meaningful code and commit message mismatch and introduces flawed parsing logic. It claims to fix property order checks for root nodes in overlays, but only modifies child name ordering logic. Furthermore, the new string-matching logic for `is_root` is brittle (causing valid root nodes with labels or extra spaces to bypass exclusion logic) and completely redundant for its intended target `&{/} {`.
> --
> 
> --- Patch [3]: [PATCH v2 03/11] dtc: dt-check-style: Handle root node in overlays ---
> commit caf9c0103adaa0c528c36d5ac2f2a91738b7dbea
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> dtc: dt-check-style: Handle root node in overlays
> 
> Detection of overriding/extending a root node is updated to check for
> expected syntax before creating DtsLine and store it as an 'is_root'
> attribute to fix false positives for root nodes in overlays.
> 
>> This fixes false positives for property order for root nodes in overlays.
> 
> [Severity: Medium]
> The commit message mentions fixing "property order", but the code modifies
> check_child_name_order(). Is this a typo in the commit message, or was
> check_property_order() intended to be modified instead?
> 
>> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
>> index 96deffc0d8a7c..1937c6feb57ec 100755
>> --- a/scripts/dtc/dt-check-style
>> +++ b/scripts/dtc/dt-check-style
> [ ... ]
>> @@ -228,7 +229,10 @@ def classify_lines(text):
>>              continue
>>  
>>          if code.endswith('{'):
>> -            dl = DtsLine(i, raw, LineType.NODE_OPEN, depth, indent_str, code)
>> +            is_root = False
>> +            if code == '&{/} {' or code == '/ {':
>> +                is_root = True
> 
> [Severity: Medium]
> Can this strict string comparison fail for valid root nodes?
> 
> For example, if a root node has a label like "label: / {" or contains extra

Not valid DTS

> spaces like "/  {", is_root would evaluate to False. Since

Handled elsewhere, but I can use pattern here

> "c.node_name in (None, '/')" is removed later in the patch, would these
> valid nodes bypass the exclusion logic and be improperly evaluated for
> child name ordering?
> 
>> +            dl = DtsLine(i, raw, LineType.NODE_OPEN, depth, indent_str, code, is_root=is_root)
>>              parse_node_header(dl)
>>              out.append(dl)
>>              depth += 1
> [ ... ]
>> @@ -550,7 +554,9 @@ def check_child_name_order(ctx):
>>          for c in children:
>>              if c.node_addr is not None:
>>                  continue
>> -            if c.node_name in (None, '/'):
>> +            if c.node_name is None:
>> +                continue
>> +            if c.is_root:
>>                  continue
> 
> [Severity: Medium]
> Is the c.is_root check redundant for "&{/} {" nodes?
> 
> Because "&{/} {" fails to match the regular expression in parse_node_header(),
> its node_name evaluates to None. This means it would already be skipped by
> the preceding "if c.node_name is None: continue" check.

False positives, top-level in overlays is properly handled.


Best regards,
Krzysztof
