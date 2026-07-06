Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EF942087B
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 12:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342754; cv=none; b=kj+ERoKw25y7DyIRRagVa8eWaUSE9tiAk38xcksLE+J+PBiGC8Sra77Eb9B4Q1X1v94L8yc0fiM/7eSMPLDVWc/HMo3KmTLUnKZOd+Hs8XPWbBN0ex9tKOl93Go3fCOFcMa3cmCNvktOk5OdQKs9ELtX1n/oT2zRugpfTvEumBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342754; c=relaxed/simple;
	bh=KKn2zvm2rcNis2D2EbK8Z1sJyEN8duirxQ6xonC8++s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cIN3xUiQmj8NwAWR/Z/PxZDt7jK0YsplWEtzj8gMQ6MAn5M/UdXv3RnggXCulecCNHjeZ5PogWpSNOjUbYp3dtEF0rFji9oopwh0xzb7s9ROUeyftNexP0EfjJacXpa8YXm+icXF2BOUGm7h1jluYyz/4RDe23fdGbJH5hILIWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kzexZGS4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yl8qTQPy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kzexZGS4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yl8qTQPy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666Ax9vA391059
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 12:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	06ybIebQ7zSA8svYrNVCDO//0q6cviw7P22l5olh35k=; b=kzexZGS4AWXCW6AB
	SZ82ftvDBbTq6EUo2nfF+Jlce7W52hr1rQSegyzoQwIqofC/GgKRKduRsMQE5dSE
	KSamLpv9aYHeJI1E5h7dts4ABHuODoOdWqeZ8Acbm90Ae1CN0YL9Jay4W+fxdF4/
	N8Tiea8k6LTj6Pjz1Z6Riw1q6K6//2PgpwtHBV7P27yz+NMbThx1DUXz6vBGDEok
	Avy+t4APlromIM1dt1KVGpJ9AhBuupF7A52OhagNPHlTJM1opgQL5UyBBjI0DXDu
	/wdeUBPyddiXxFkN2Qzjy19e9VfIjDP5h/geSN6rZYhBFeN7NOs9IND72Zx4Jmnl
	pEwrEQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgrt9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:59:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c298a1b20so6384761cf.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342751; x=1783947551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=06ybIebQ7zSA8svYrNVCDO//0q6cviw7P22l5olh35k=;
        b=Yl8qTQPygHOxMsJWzggHKPEU/O/Amuu2A+LhyXgPuAnddIUcu6gmDNyVhlq+MbDdtt
         asjkUsZobj8GaDf4GrtjQAKNg1SrVU40pBh+at4VBzOsrqG+pQYlAdyxh1Fx9r8M70L9
         RH18e93IVUok10AbsNOzw2DPMQskGIp1DpliHAl20dLirR03gchO6wMq/eB12MgHRoJ4
         8cSMSEhxlm7DUu1b5XR8YgqROlnbiUWZjBje14wl7yL17egnz2K9Q0yqyibrHZDuwqjG
         koSjpjtiyqnAsS+WVTKI2dPWtPAK2u6k7C3NFQmmkVWR9vi2D0bLll8eTE3KvwBCC9ov
         S5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342751; x=1783947551;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=06ybIebQ7zSA8svYrNVCDO//0q6cviw7P22l5olh35k=;
        b=gLQRb3Y/c7+EPTDydhTXfGugEulnJZKoygOoPSc1OPXxVg33KVYT5iMj/A1E4RDfMd
         rM5O0CbKEfiYdmaKIzWnPlGqFDbEj7FwS9cCIaa8ETRnt7lD8zmhywM/SSQSWaoTB1fZ
         R+XID97WP5UffxUhEXy8WdMPowKv1K/Kv++rsKqPMHQ+dW5IRGWRE0wfhYGIP328AzX4
         hkiEosbCqWsRQV170ueD0E8fQMh8/m5rxDUP/bBvH8G4XlvNJYt1jzM84ilP/Ea4tFgD
         2VH0mx0aA6ZC2NZE/VJg4AEr/oVDmqqofK/l6hDXp8ijGqBO4VnQP4Ud94X4Im1rHZ9w
         96Ag==
X-Forwarded-Encrypted: i=1; AHgh+Rrsvrn9CkQa0EKvRzcg0v/Zqo+HrNbCn3U0ZZrQdvwO0gI+PZgIghKWMwNV+Pif7PlH97ikGPjm4MEs@vger.kernel.org
X-Gm-Message-State: AOJu0YwyDgDBWEja1HjBdm+7F9mGli4aTkHrIqzoIC+1CF1crMi6aUZN
	vCF4OAF5OrMeYhZvwTSt4CyVZzuRaRTw9xt4VjAjiLhX7y3FpQEuLYxES15uESjFe291g0gi0qQ
	df79lswSgb9zBJtyegWVruMwV5HC3TWwui/h2dO2g54Yepps8p8/+cV8Vc3C1L9Dd
X-Gm-Gg: AfdE7cnXwoqzU5VDqECOIEdEta/QY8N9I0+cSkS10WUqhinoazR8r5k8LZ6xyqo6tMj
	aOgTfSZCRyfqIp+BJ0AS4O+07Py7nirOvTHMihn6hSjqxLEO9ffOtQSEDyUi/eUBEEjzbu1Tmfb
	wZAJw+U3ztkxtezMty1kiCNLpl6v9UqWoUZ0kUg17oZSlojLbnBBm4tz3ut9U2YVTgpis5dGTFj
	UEPbm08MqYeAXtQvbKD0DZY1d1oHPU70g6e3SMUADIevgmcQP4XwI3/S/mj4a9gw44pQ+0G8LK8
	xT/qVmmWpR8tH19U18O+r3seH8NegGYXnwIuClYyHUjAbm2EnPzZYoiPKoVD3GOJLKmc3slkbWe
	yUTX5zGUprIX0PK01AYzxZonmgjFiplTjwLI=
X-Received: by 2002:ac8:7fc3:0:b0:51c:a85:bf91 with SMTP id d75a77b69052e-51c4bdda37cmr96835751cf.3.1783342751288;
        Mon, 06 Jul 2026 05:59:11 -0700 (PDT)
X-Received: by 2002:ac8:7fc3:0:b0:51c:a85:bf91 with SMTP id d75a77b69052e-51c4bdda37cmr96835481cf.3.1783342750772;
        Mon, 06 Jul 2026 05:59:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6055039sm749735666b.4.2026.07.06.05.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:59:09 -0700 (PDT)
Message-ID: <391e87cd-6352-4d38-865f-16f04e4b307e@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:59:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: shikra: Add MDSS display
 subsystem
To: Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-1-56fcd1659ea4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-shikra-dt-changes-v2-1-56fcd1659ea4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3MXR_7ecyBKsUosIcDlrmkYHxkOZIlXj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMiBTYWx0ZWRfX4dnGr91OBqXb
 ACUSSHWaT/IjJmRavTX8GjTClTVwh819Dlc4Vg9OB1IfhUjTPUIBHvpzDxosLKUlunqMtc5h3ap
 pRjDzqvd+ItjKqAu7oXiowLPMFqmVw7oAvwgDWYbsRINFlCceTXNJhQaQohmr50C0Kygmlbc+mp
 jhJXCRuasoADSN53RWuhhF1vXOmKPZx1uRrPEC/I0AVaWOUYzRGeB/uXt//57KCNHP/Y2TjUD/v
 54j619WIhPqD7Cu6YtQ9Pev0SuIj54n2nlocGSso/kb6R2nJThXM6rz1GD8lGEv9FlJc74v1jTZ
 lw6d5FaCdD+zhefJM6bTXQmoSiclcOCd28+bGR4JE9FTg8nhu5/CYZuuZyQVgAyLvfsFCGa8n60
 ML1HOTPxbeTRku1sDqB6NU2QAKoZTaV0z7coENB4zGXSv2C96m78hGTIR1MD9bNapKHKD1slWOQ
 TK5dC4mnjlxijUy5vdA==
X-Proofpoint-ORIG-GUID: 3MXR_7ecyBKsUosIcDlrmkYHxkOZIlXj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMiBTYWx0ZWRfX0tHvXZpZdQS3
 jAEoj7yA0ppX2WaTFfs3COy/8iRHnBJKqpjyi2ofSnfaySXV/b50hn6d5C1PWFZ4PHI4rD5SfkX
 f61JiuEbUEfEbqKEQhJjZBBRpamdYEI=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4ba6a0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VXLAdwoOgdXhmVkI5jAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060132

On 7/6/26 8:04 AM, Nabige Aala wrote:
> Add the SoC-level display subsystem nodes for Qualcomm Shikra:
> MDSS wrapper,DPU display controller, DSI host controller, and
> 14nm DSI PHY.
> 
> Qualcomm Shikra uses DPU 6.5 hardware (same as QCM2290). Platform-specific
> compatible strings are used as the primary match with QCM2290 fallbacks
> to reuse the existing driver support.
> 
> The dispcc clock inputs for the DSI byte and pixel PLLs are wired
> from mdss_dsi0_phy.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---

[...]

> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dpu_intf1_out: endpoint {

Please keep a \n between the last property and the following
subnodes

otherwise lgtm

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad

