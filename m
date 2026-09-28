Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0702D4E9C12
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 17:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616061; cv=none; b=Xb1w/8KrSGnhsvf1fYRp5MaomtS2PNjYRNxq8eKSvhYE6zHa13RpcVPldNo1qjtoBmy8evwrllqUn44wUlBPsZxp+j2ZbCaopnCM9FquJeu/y6Ruof6qmmBgBdlB37N46ylnuxKghJwdwodTu/Afdl4zesSsXAgpRSrflmyj/pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616061; c=relaxed/simple;
	bh=XQFUBGLVEd7XJVcqXhVSxs6Af8dTUFJdY6Ao2nWuu9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y4Jb75N5cXIx5CA/vLN+st3GEp488SNznNKVONWG8Cwgs245t9b9YEQ/7/3YFm5C8JkPwFFHb4CAD4Wf8nPprN/QcpIvUQ//SrSGFmrasMmPYCYmjLYBeoEDKBnPu8yQJanjvfzfjXeuG1/BIn/2ErTuinSrnNhfO/BheVRYpr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ga2yJxTG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b7q/RIcj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ga2yJxTG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b7q/RIcj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEdsxC1895242
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 17:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZ9Ubm2a8J1TvagIpXEzDc0W3zb1KHVr2A7Ld1gh9Lg=; b=Ga2yJxTGIPwToVHv
	BfmuO91hrbO5sWPxw4zC49K1kMY0PB4G6GnXKnyLjjqZ3YAheUQQNKsXV381Cm+9
	loYAiVzreurkNU68lNTNbioO+uqzZPDvtZUzlceRY4FEoFBspB6/phOyBSFoqmBl
	91FE8KSx5FmemdTrL7tEPLQJT4aJSGDtHo6hx3g97T3Hn3eFJ8RE/7htGLz8S+CV
	MiDJlebbHxISvefK+421PE+VMyE3EO1tkxoqwoRPEwAYwz/DcPR07ocOkzXtiINx
	InCh35dGTjvGBDsA/KuTzB2jqK2WYmd+3QvDAlj0p6VTyvq6uRenysib6f0zHctc
	N9nXDA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s2qet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 17:20:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so3291628a91.2
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 10:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790616056; x=1791220856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TZ9Ubm2a8J1TvagIpXEzDc0W3zb1KHVr2A7Ld1gh9Lg=;
        b=b7q/RIcjjpJhuMIjTAlUsRH2k2f6RRHRVFX/u7RoF2PdVthaV3IKbk4hav22AdFPke
         6yPkzH+G+gwa1OoFcTTKqhghn/Krde52eXvR3LC0sESrZ1cOKbc40dwYiBrSpCIQZZqr
         hYdkUVXdbGW6poxUFT3eC+n0OaMW0We4osSHBqweM/qX5X2gM5cutNJqSnt490m57ndF
         Qy8rrpU2m2cLBBuQpfDxUUw72uvW2FhuTIOMnk6W3l3fJu7yptzDuBW+7ZSSPFx2UFqT
         TQP5lDn9QndsyDqfvY6MgctRyxApcrSIjJ5NiVwvQ+9L5M8diQMHSn0dUFuabseFb6mZ
         pvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790616056; x=1791220856;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZ9Ubm2a8J1TvagIpXEzDc0W3zb1KHVr2A7Ld1gh9Lg=;
        b=zrlQm+N9TvrALk+jk3WUo+d3YZ3I0Cr9DYgd46c7wOn3ANeW2KdHjFB0Wsa5uBBeNJ
         nl8E1M5K4RKug1CP2BsGs0LlVtMEhJBl+QMeUWDFA5C7WITBlsCDYSOl6fpPYRr0CpmM
         IXiOGnvzzolIanQNpwkCsAW7XapWoP31Ly4mlg+sgb7PJL/Th4acYL2ioW0WHtbIpOkx
         J4o3D2ze1vc2v0/iZTOFCBfWReJa6XW+r23+InFkZtGm3tzyJ1jXPVixZnO0uKM4IgA8
         UKE731VyDiIzByEW0SFmCs/oopUbqpAVMbP5fHWZ70PJIY/F+xZ2N4iXhYkaMGlTdT1p
         DnMw==
X-Forwarded-Encrypted: i=1; AKwUvBymncLNFof8te7sbdAc4RVZyTPZGvZ4+Op+Rjmzvc54/Wl7J9mU0sTGTJOnMJEB8vmx6YG4Y40OV6Vo@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3gU1LFWjlZukgO9mIArzpOcGTf+PXf3ANn7bX5L4e9jgdwosP
	L6Jw1PAi/EwQWpqvfYGAJlODa+A5Ab/22n2nbiizH0GzVdzW2hoZjup307ildG81OFlNMHdCWb7
	NsMqYaMFDVSFeWjNgf29h87cx9pIPqqHhZNN5B50lDTE3V/xGISbpwMSdHNcIWZFZ
X-Gm-Gg: AYBFou3B0mmeqXyPVphUuFCzYJeUwFBdz6LPnbFwmxsvkal69soCpeJXUGrIelo51N9
	+bpbPGV6dj466pOmtBEfGf+F7KZaY1ccLcK0p4Cpvgz/JSa00EY8eIHg++M2shupnQfv259miLR
	2o8dBRYNRO346zo97k8Y6GU46sHnBc2qhLIwCieat6xrQpIGhPX19LcyPh8GfZWAXkqVZdRi4Nv
	tvdw1NSBzcaeQJSvMuY6BJDc9SMA6dHC+VM0pHPMWQTN+xvqtOipzOImnVV5qOrQD0AKIuXqcgp
	hBC/8jsPwLiZXJ5BVJEb2YJovK68Ia/YOJe2jMvAUOyBP9GECjHpbn/RMk4EmhKGHoiU7VfrC7N
	RtMhRKj69F1tSeOhgNolUiijJhdeivGw5+5o=
X-Received: by 2002:a17:90b:288c:b0:3a0:d651:3957 with SMTP id 98e67ed59e1d1-3a0d65147cemr6223586a91.35.1790616055585;
        Mon, 28 Sep 2026 10:20:55 -0700 (PDT)
X-Received: by 2002:a17:90b:288c:b0:3a0:d651:3957 with SMTP id 98e67ed59e1d1-3a0d65147cemr6223566a91.35.1790616055099;
        Mon, 28 Sep 2026 10:20:55 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.235.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2bb1fc996sm6864525ad.62.2026.09.28.10.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:20:54 -0700 (PDT)
Message-ID: <043a479c-7ce2-4dca-ab9a-4a3b11e43005@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 22:50:49 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 05/10] dt-bindings: arm: Document reboot mode magic
To: sashiko-reviews@lists.linux.dev, Rob Herring <robh@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
 <20260928-arm-psci-system_reset2-vendor-reboots-v26-5-b24e2348e8e1@oss.qualcomm.com>
 <20260928062613.7BB651F000FF@smtp.kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260928062613.7BB651F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2OSBTYWx0ZWRfX8Lwah0xOErwO
 N9fVT19CeYVjBbWZ/vz364seR02oaEbJ4RClCA0So/GXrbIEXQBOuAMhqOcREDBYKYVgRpfvx5/
 Z22zulNKgCp2BVk6xZC4976XFWo82kA/m5l0K+G1yeSPsAyHgMJrbLCpHYxBAnhP5w0hMVfdhPQ
 aO53MpLizGJ33SeS5p6imtsG2j1ORg1f3DgnJymuIs+fy6pNhY2R7Z070BiWWuuhWU7H52NIcJR
 WTyyyJFWHUyIY1xUBiA0XFFlSMU0YQv6bqJOtXRPVxSkQLHXYNxQPGRUdvMqkWSF+Bdibq8yEFK
 we4EfFSJzrrhESCFWKokK/EugCvnCKiit+nyaBcgDyk4Qpj8QrReGwnjHLnAU0yULrRichzZdXc
 buTDXSrJX9LXH6cNo2ydkRWvW5987bkvhjHDLBmP1cD70X4mBOtDor3bbjj9wFbH5vFOmRFO+EQ
 itwXaSb0Rt42FcUtURg==
X-Proofpoint-ORIG-GUID: YYnY51ooRK_ZjZW2W98xge3H2OQ_OVXc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2OSBTYWx0ZWRfX5VcDj/zoLEoD
 iIztPUj3TJPDKSWzn/r+I5cv4X1prdU3OEKCA8FHuXftRvZdB78Rqls7C1157u7pf3kAoeewVq7
 4ylRaRx8WONu92tsVoSweBWCSiIH3RQ=
X-Proofpoint-GUID: YYnY51ooRK_ZjZW2W98xge3H2OQ_OVXc
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6abaa1f8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=0iu8UVjuSkuIMUlAYuuJCw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_qQNA3pjuplG1EYRU9IA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280069



On 9/28/2026 11:56 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] dt-bindings: ineffective unevaluatedProperties allows undocumented properties
> - [Low] dt-bindings: missing maxItems constraint on mode-* arrays
> --
> 
> commit b385b6956b70c623850aefcc8ceb50fda4b87cc0
> Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> 
> dt-bindings: arm: Document reboot mode magic
> 
> Add bindings to describe vendor-specific reboot modes. Values here
> correspond to valid parameters to vendor-specific reset types in PSCI
> SYSTEM_RESET2 call.
> 
>> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
>> index 0d04389c81faa..82ae25e7a3386 100644
>> --- a/Documentation/devicetree/bindings/arm/psci.yaml
>> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
> [ ... ]
>> @@ -98,6 +98,39 @@ properties:
>>         [1] Kernel documentation - ARM idle states bindings
>>           Documentation/devicetree/bindings/cpu/idle-states.yaml
>>   
>> +  reboot-mode:
>> +    type: object
>> +    $ref: /schemas/power/reset/reboot-mode.yaml#
>> +    unevaluatedProperties: false
> 
> [Severity: Low]
> Does unevaluatedProperties here effectively restrict undocumented properties?
> 
> The referenced schema /schemas/power/reset/reboot-mode.yaml# has an open
> additionalProperties: true. Under JSON Schema evaluation rules, this causes
> all properties to be annotated as successfully evaluated.
> 
> Consequently, unevaluatedProperties: false in the referencing schema becomes
> a no-op, allowing any arbitrary property to pass validation silently.
> 
>> +    properties:
>> +      # "mode-normal" is just SYSTEM_RESET
>> +      mode-normal: false
>> +    patternProperties:
>> +      "^mode-.*$":
>> +        $ref: /schemas/types.yaml#/definitions/uint32-array
>> +        minItems: 2
> 
> [Severity: Low]
> Should this also include a maxItems constraint?
> 
> Providing a list of schemas to items constrains the initial array elements
> but does not intrinsically limit the array's maximum length.
> 
> Without maxItems: 3, a device tree defining 4 or more cells for a reboot
> mode will silently pass schema validation, violating the binding's up to
> three 32-bit cells requirement.
> 
>> +        items:
>> +          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
>> +            minimum: 0x80000000
>> +          - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
>> +          - description: arg3 (cookie_lo in 3-cell form)

I would wait for Rob's review on both comments.

thanks,
Shivendra
