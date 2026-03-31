Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582CE3F8E03
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 16:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774973200; cv=none; b=YOX+Wq8WJLOfsj8Yiw0pT1xuinSXFWNH36hvHl3grLDx1LBA9aPiqUcNlUJbpvj3oqqPAOUprTgNAcceFxvkbB7OKnuF5W2sewTqLDbWk+YszkC7G8keyPe3+/d/M/Ts+EKH7Mp+JoLBRLdN2zkRWadl30zWxTklBUMOLLw1KVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774973200; c=relaxed/simple;
	bh=pi0dDbHJXEJVbZJ6ZG5ypkoytcd3rnY23wb7RUCjHYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vEuRz3AHlgIBFbE2UKZy5ybX006BB+/LdKi7P5N7K4ZMywh5PB2AXE0TJ4nRaNGs8brc7eT1+LpOLQQhYHqFZ2t9X4Pq8iL0XIr8ajsYYLzB/hj/1boAKV3MOWVUfRMIfG6h4Sx/UP8qwqwUPPCt3iRo+GKMBM4bKzDescQPyf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=anS9yjmU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ib8uqUBa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="anS9yjmU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ib8uqUBa"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VESu3t2761505
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 16:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pSWb3pTaeY95vdPxjX7UY7rGaPSlAV+QyyhLsGlJC9U=; b=anS9yjmUXJ5FvfR4
	6JeklTNPPU5LPXvy3e3FMSrPqN9si7uIUzTuBAMNeK40EZSeR/Z/0ajVMn+ioIWE
	PjSAePKV5018ajkbs+LMRLuudMch+v7uWIFchBf74zrymrStIqCRqc+wj/F7VH0V
	5j3yVgKltiFxio1cxRX0iifjFEdZ7ZOnZdlkSb7j7XJg3W/4Ns9dNcQ8T/xf45PM
	3/JhFFKV2dU3qr60NR5wgzuvtgGq5aOaI8zlD6+DN9HoXDl/x4ajnlgugx0AHS/l
	EJdEw0ZkSbL3cdJ7UBBzYrTbleWZbDE6n7Tl6U033LpsIXxQlTR9l9cBL5SvmXBY
	iaWmhQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b931xhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 16:06:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354bc535546so6186413a91.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774973198; x=1775577998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pSWb3pTaeY95vdPxjX7UY7rGaPSlAV+QyyhLsGlJC9U=;
        b=Ib8uqUBaQ2+k/XEHrunDHa/hYfkGcHLYTZVblVy5UHc0muJLIDaBivFjzlhM5ZheX8
         GcMqyvaHKiUI+C2lbHmExRju9EvuuDwUm7ArmmmV/RY7hq59S8SmxSCRY6ZmwoVG1qYj
         lngS/N9tSl8lae8B7M1JEZKlerJtlODf47ldt1MDnQPX7XHxS5usGsNQa66dDeWEKrwI
         JQKeN9vRQR+jnMSurYrF9u1n5Jaeh1dAFZnGQovWe+OcMxzFE1dMf4j1l5afsYDvgY3L
         /07sKshHi3rU5dvzyp4snwP3vJgte9NQzg0p8OscK39CRXqorZmErAQF4FoM+F1ROttc
         ZefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774973198; x=1775577998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSWb3pTaeY95vdPxjX7UY7rGaPSlAV+QyyhLsGlJC9U=;
        b=BcMNWI//ESNfYBEZzd+CJfZkGGHuY9Up3EOgmGFaIe7xBjdZw86TUdkGc20aV7hblj
         fGBecEyvbUtH+kAjfxogyhPTp72GOOmBKcjHp9UmPeh5LOZd8QqZU2PGMQlYCOD4Z4Eq
         TH6Q0rkg1euDO43wpXqFv/NfkP3qh/NRcD0Qh8M1Fbn0n7ZtMB5MTkapOdvmErwLui9n
         QkF5AIfMk2s7plPrtOyWmgps8enGOehSc1Lf5nOGMSnTRIJqM9EFjrRtqN/wBAbFJByq
         BWDyWtw+osxRlKPTxLhGBHndHev96vp6nuCoUlhO8xFirsU4O9lZHwYS5iSAizcb/0J1
         J1tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL0ZI2mhpGcFepygAj1xfV3f8ogm+jYLodPpQxcZsqis8HtcHUoiAa1hkHaqoUJv33DwWB+tRqFuKg@vger.kernel.org
X-Gm-Message-State: AOJu0YxO2N5PwXMD0Qyvo8fhk2nZa1wofVD8AMWZmXWw72IMNpncdxSe
	6cZMoFwB277EX66BvsCciU2uIE4nbA8zDjDsTAFEkjE6Gcpkf6BBcrGWGrAujHhUkUNhKZhgysz
	4aC64pQje/iw0F9Xrb+EPWSLYTNvv5bSRdPQCO40iI0nzCmxYhx4m4LCZTiskAblG
X-Gm-Gg: ATEYQzyJB64vLJi6OgheFdunN9KWdyMdl7fXSp8/1Qen2xLs4z/ibf569xRJzoCUezJ
	KV4NBcO1M4o2ZbteqjkjmEA1dcR/g/9oMfVREBmy8gWYRniTe+in/SU0JHyi+jVfrT3bxyOulTE
	c5wrY/wqMQZ9v/Psk5otdji4x6fNe7BH5Yj+tfdFyH1LI+83WQb9C7luEMRamcWZm6Bge3Nn49r
	+ZTXwHiiuhYgflOOSIqd5A6XA1tjRzZ3nxoW1BFyuN/6kUpaWzJQlz1EXSNLxsXkbssT/+jVo7O
	mEW8f5wqPEJ5uZmMc/bJ32q83NJLw3g1mGhSuCW+H+NfCHFH+gc9VEdZmudvXS66zW6ycROq1Bj
	9gllLMV1+9KeXUxY06FwCipDZXl1sp0rTNgGYzNFdl/K01a6A23efnagpWsGjMHPtx0IXTHQ0
X-Received: by 2002:a17:90a:d404:b0:35d:9d6b:9d8a with SMTP id 98e67ed59e1d1-35d9d6b9fbemr9871496a91.15.1774973197873;
        Tue, 31 Mar 2026 09:06:37 -0700 (PDT)
X-Received: by 2002:a17:90a:d404:b0:35d:9d6b:9d8a with SMTP id 98e67ed59e1d1-35d9d6b9fbemr9871430a91.15.1774973197319;
        Tue, 31 Mar 2026 09:06:37 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.193.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe66f7b7sm2094541a91.10.2026.03.31.09.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 09:06:36 -0700 (PDT)
Message-ID: <1dc85067-df11-4236-bfdc-e2117da493c9@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 21:36:28 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] ath10k: Add device-tree quirk to skip host cap QMI
 requests
To: david@ixit.cz, Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>
Cc: Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE1NCBTYWx0ZWRfX0koSoBmxjdid
 1ttc+qBmIjFWIu29O1vd33hfA7S1wf9lcb8u2eXZF8Y8sPfwUnNtw9T9p/HrCW0zvstE6BKu1jt
 ZasB6ow0d3AC9IiADRU7N5XdfsSfcVRTsCqvHfbXCx89OaLbWwskOD2yJMQqBBrKtovlZvMkgcg
 A4ZrBtQgFZTIcqDtEJOzr4HLjylmvFadpj9MR1FC9rNfNkGPpxmnXl3+Plx+XBTZkKMJ3+9amP7
 soUXRybr/jFU26hNlt/uDjQGz/j4tAZjwbctf6oPZbsCyuyqm3wG/v/UyKdm/JZ3vjU4C55hLy3
 vHrpvyBLjFEp6FlXwqs3hePvy7xZIHPipVItHpM+OCQvuP6blS8N0RBjlzt/BAJYXp8ACJhylGZ
 3pb6eyXtI7+TycZvVvdtE8ybTrOBFwtEr7MgdO9/5Y7v0hWM4aCGr97RPJW+NZ/32WSec43Hupu
 vci+5KtjvAbmKOl28nQ==
X-Proofpoint-ORIG-GUID: 7hgOLdAW336WMZbFFpAzQJa9qvxEPqSf
X-Proofpoint-GUID: 7hgOLdAW336WMZbFFpAzQJa9qvxEPqSf
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cbf10e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fHzH9zTiDFanLkNeTzv53w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Jr6ivFuIO4VC9FIHmAQA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310154



On 3/25/2026 11:27 PM, David Heidelberg via B4 Relay wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
> 
> Some firmware versions do not support the host capability QMI request.
> Since this request occurs before firmware-N.bin and board-M.bin are
> loaded, the quirk cannot be expressed in the firmware itself.
> 
> The root cause is unclear, but there appears to be a generation of
> firmware that lacks host capability support.
> 
> Without this quirk, ath10k_qmi_host_cap_send_sync() returns
> QMI_ERR_MALFORMED_MSG_V01 before loading the firmware. This error is not
> fatal - Wi-Fi services still come up successfully if the request is simply
> skipped.
> 
> Add a device-tree quirk to skip the host capability QMI request on devices
> whose firmware does not support it.
> 
> For example, firmware build
> "QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1"
> on Xiaomi Poco F1 phone requires this quirk.
> 
> Suggested-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
