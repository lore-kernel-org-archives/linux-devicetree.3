Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE40941D63E
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119013; cv=none; b=KFrxf8dZuByK7ueanhmjh0biHb4YXPHFMM3763Tg7+HIa8lUmR5CpAy+kzn86DidFi/qM3WYh8snGaMUOGm6/hj3OBdRcMw+88qGzYfv7uhPQryJakoNW9G+VKcGWS78pAWraXEAqn+ZF6Czf+ZisX7OxfuCAZaZRn+Nxs0OGqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119013; c=relaxed/simple;
	bh=hjvVC7CVaTfy2PncDfkDrgy7powP35HIB9c/DaIkc8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NS45PmzPymaNHFRvF0aR8EuAOFbQQx1DlRD5OBBbRLbza0UWqCptJi3wAmejzNdWBcmcbhlIc5cBYfKIR1/OAdHB3ZqgZquB1QRxC71b4md8jDYUf2GwMwQv3groShE8VkVHW6fbNBu+fvnrOX4mUAZjmEflFJ68SES8vTzNkx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTgWXq/O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eTgIYvGk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTgWXq/O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eTgIYvGk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBd0rU3579164
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ajU1XKkI1sZ96O9t2VwfoWy/XtKogCNLhpo+YWNMjgA=; b=hTgWXq/OM8o2BInt
	ebG+XSDhV78KD+Rv926AuY/7Z4cSYaTTiDCdF5UfA1viAWBKm49HsrUf/gwvBmzn
	dYMHRRZjrRzRiw+u6YelOXmL7XyJXFStidBRV9SXtTm1YfvFIrLZ2RzLDWZam2Kk
	sUXz5jh1j6imtBWPNXVq77T3roU9CqYqshw1FWGTxgR9FOv1VO7uZnf1lGqrNXtN
	HorCtdMJrjGFF+GvXcOQpLnMB0ZpnyYD5zjNjFyvMtBoQclI5H76bT7kJNfiDYl+
	iQLVmdSzhOFO4fDlrEPYJ0eEJA7zwygyDMETyF3vBEZ9+Y6rtKPfbIYzSmW6i9bA
	KlKKrQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdwk32tx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:36:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3811ae55313so2106686a91.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 05:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784119007; x=1784723807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ajU1XKkI1sZ96O9t2VwfoWy/XtKogCNLhpo+YWNMjgA=;
        b=eTgIYvGk18flM2rwPF4kxC30PrKZtMdOj2KOqITO8QagHifZqG/atARyul8rHDj2fk
         xMVBP+n/aBUOOOVzZJ5bzr5OVZuQdHc4da3FOb688RR92gU7DsOHKd0w/dafQ6+LsT7+
         wQXo3hSriib9oVZacsYYf7BOFmkixrdHAVe+4deUP3h5EX23SHHO0RY15g3qRc7tOdNA
         HFCNHdr23I4hLcoMZ2wXCUeV2t3vFVA+fDBdtBDrejzjXRMURiE+2idgeGntafP2xu+o
         BJNGDylN6V8oZ2tm2WWpbHLxbZ9JzkwS7JifzY9eASpwp5UhS1RaE+HdqAJwojmTqJu+
         ufBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119007; x=1784723807;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ajU1XKkI1sZ96O9t2VwfoWy/XtKogCNLhpo+YWNMjgA=;
        b=hBAMVUJNj9O8IACjDECZsdPnt9e5PARYhu+1IXhGx4Qb6n/E2dCZQW8hALdySncOQh
         Kd1IVpY/xby3KlW7lIyAsqQGdGPoD/5nDJPWQATnejDhiLn740wuPVpzZbcaXZ1k4NZx
         iL54H8iVj6VN/pVnMnkr9kShjGwRXMWsNUwqSX+xepeCYElx+DiygvyZ8TfwAbqGaUUo
         sZcudc298R7x09oSnHIUu/MvidlRy8W/VMMpPDfOQ9RbUyQGiV4IRBfICzjfk1j6iScU
         p0g/zqIwf8icv3+RZlfOehfgONuIue8xak22MWu42Jj0u/2pGpVOwXqy/6Se60FhjISC
         8OZw==
X-Forwarded-Encrypted: i=1; AHgh+RrSGzTjw9lhrlkdqzCPohdDHLm8uTWfnMdcobbACOFLtJdCtQeYllZyAOwiap/kFa8VMTVkDEwO+Z6t@vger.kernel.org
X-Gm-Message-State: AOJu0YzGHUC0WxQvBxn9Q+vUKqjD6bnGQh/oJvN1/jUeD1W58vItU6k6
	o4SmWP5ZfswZrKQrWIZrE/FlEEFYk5F2sSjGXIsXhzSXhTtnvTDiE4B2c5ObBJsyEkmYFpOXs0q
	hue7o8Tlc4GYKuN8sKJarHyhp4D9o9WG1OhHMd8aJGf3DFdrV2+VLnOinLDQ0sP8G
X-Gm-Gg: AfdE7cmfyc2593+QS+TpxCwmhTvLVqcMvD1NJLel+v3yfE1FAHCa1SSdhz9xzfRZhag
	UqXYgkr6vKmFT+k2d0m38Nnn3sca1uMbE7YPFWFRgbx8B2oj7LMqGD1NNdl5hrWnVcf7P1aJMiK
	5hz9d6D9N5SzCHn8/Ewswzg1omsn3YXdtlKc65X8i7ePzYzB9CYe6YoRaqflNw2Vkic+fsOE+tx
	N80MyxadK3LBKx4HJjw9BTxTolViujsSyBHxM3Aem5kVPXVh7cwl5ivV14i54JBs7OQ92/n11pn
	OlQ56/duWgqPK7zqvCupSXHkyVhi7sGl46XKiMKQ2I0wzIS9XPlbfwiXMp9/WG0mWk+W2D+MHNb
	f/fxW5vRSA4mUcOmalyl2qdtJ1tccNDHcwtf4R2iucn2hhg==
X-Received: by 2002:a17:90b:224a:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-38dc782c68emr15134103a91.7.1784119007535;
        Wed, 15 Jul 2026 05:36:47 -0700 (PDT)
X-Received: by 2002:a17:90b:224a:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-38dc782c68emr15134018a91.7.1784119005125;
        Wed, 15 Jul 2026 05:36:45 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e530689sm1491453eec.10.2026.07.15.05.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 05:36:44 -0700 (PDT)
Message-ID: <f06056eb-e7ef-40ef-8840-bf4d5d3d5f91@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 18:06:41 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 08/13] mfd: core: Add firmware-node support to MFD
 cells
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-8-e7453c548c21@oss.qualcomm.com>
 <20260714173004.447F91F000E9@smtp.kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260714173004.447F91F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yc6NIQRf c=1 sm=1 tr=0 ts=6a577ee0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=v0XS7ZgMM5NP2KeBKikA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: E67j6iW6W0np2gBCsPIoJ-8I1YaqyViE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEyNSBTYWx0ZWRfX3qy5KgoqBRyZ
 LBtgtSrizG2KNcq0EAGUXLHbfe2+6Ebgp+tCdIaeAgtf8p2VUsw0MRG2g9+WVHU/67Ltytka1WF
 fLQoLZvGENQYFRIrS161l2rmQ4v21JKCqv2GXC+5FaMymCTbCgL0kaYanrPscUVuAVDyb9K26Zn
 ajGSvCZyBeU6cfTlMjrFJOgyvNPCTK0qQtYwtaURNeWxN9iCSTioXi27cwcOuAOaGZGxet5ow7E
 9HkmHYJfr4Qj6oIxh278LDaOpVHckdp8Wb6fdsx05boGe7q6781RupWUrZk2bpMjMpq1Gx3V5Gb
 8ukqWYJSWtTDIHqH02/Q9OHZCGRk4PztMMe/WnmBiC4/txEVrE07sRoD25T3ZQDj6Pe9oeXXDNg
 6QWFu88pcU2QApY4CNvwptnCZVK5BAuPx8Yp7L2EuRFfy6zVIgRBIfpQ8zhvY22l8bLhb+GcPLS
 pASey6R6C1kSDRAGRbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEyNSBTYWx0ZWRfX7U0/LiOxkNxE
 XHWuaOIe3bH/FXm5bdIh36EOt+dMnnnqoVZ4Aj1AQd6JBMp2gsgbYl1vW5CBv1CrXxb8nU1WhCg
 uIShNU3gFZiTk0T33xTDkSidWjed+0g=
X-Proofpoint-GUID: E67j6iW6W0np2gBCsPIoJ-8I1YaqyViE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150125



On 14-07-2026 23:00, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Strict enforcement of `named_fwnode` aborts the entire MFD probe if the node is missing.
> --
> 
> --- Patch [8]: [PATCH v23 08/13] mfd: core: Add firmware-node support to MFD cells ---
> commit c957d9fd3d002c62018221b0f97f57bad5c0b519
> Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> 
> mfd: core: Add firmware-node support to MFD cells
> 
> This commit extends struct mfd_cell with a named firmware-node field to allow
> registering a child device using an explicit firmware node. It uses this as a
> fallback when no firmware node is assigned by device tree, ACPI, or software
> matching.
> 
>> diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
>> index 7aa32b90cf1eb..ba9682ead2cad 100644
>> --- a/drivers/mfd/mfd-core.c
>> +++ b/drivers/mfd/mfd-core.c
> [ ... ]
>> @@ -224,6 +289,37 @@ static int mfd_add_device(struct device *parent, int id,
>>   
>>   	mfd_acpi_add_device(cell, pdev);
>>   
>> +	/* named_fwnode is a fallback only when no OF/ACPI match and no swnode */
>> +	if (!pdev->dev.fwnode && !cell->swnode && cell->named_fwnode) {
>> +		struct device_node *named_np;
>> +
>> +		fwnode = device_get_named_child_node(parent, cell->named_fwnode);
>> +		if (!fwnode) {
>> +			ret = -ENODEV;
>> +			goto fail_alias;
>> +		}
> 
> [Severity: High]
> Will this strict enforcement cause the entire MFD parent probe to fail if an
> optional child node is missing?
> 
> Unlike the permissive of_compatible match that merely warns and bypasses
> missing nodes, returning -ENODEV here cascades up to mfd_add_devices(). This
> causes a failure that unwinds all active child devices and blocks the parent
> driver's probe.
> 
> Should a missing named firmware node be treated less strictly so it doesn't
> disable unrelated MFD functions?

We can allow probe to continue if the named_fwnode is not found. Will 
wait for some more reviews around this.

thanks,
Shivendra
