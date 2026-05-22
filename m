Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CC83A9D88
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442484; cv=none; b=rqNG9CSRP8Kh5gkO8ScZEMNTwnCV/orFSa4MeZCZDcgjtk95ZDkPaG4Fw0TQM7Rq31vuRfpMhzTIbqAycLDop56pDYxS7ygMgJRLUm2+Eivgi15FUEGtwfyiaVbA1DfkxT+IWwElk+vpt+TEyepC1xoCw78T+wcIZBwtc2r3nfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442484; c=relaxed/simple;
	bh=KZa7rVfKaLsvI+1EOIq2C0yqStQ4z0m3wnVY0OVHT4w=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=nLEIBG4hLswAOuIZJlcYs89fXs9AoanQzQ997rENAlexjXZjzrofjAFqFM8hN42NFz0cJdSD5w/Xpe0BHHJl+lKdESd9nBuGUwDIkI3K1fzyYtfXYCpMBGoIQUkRAEqLD47EVuTyeeDxFq870ubWvMRTS+8tBIJg2zjpO1DtzDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgqmzNmB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ctYCychO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgqmzNmB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ctYCychO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M7Wvp2778902
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pu55bG2vP5jws3ymKDZxbKEP/sVznBdilOK4Sk0Mwws=; b=pgqmzNmBC4s6+ANL
	acNwBNGkOyMi6NT5AOR6V5NbO+GMSmslfp3+IpYPpqxFKc+TrT8CWYq33RTyRYn6
	ERVe8KA9/wm3jDJOOWpmv/cyYxGElZZlFrgwfRTzHcZG8R/ePx3qPIzJrKniLnEQ
	zC5VT0rSMqS4Bz7VBxsww8yqrwrS/HjicNW+AnnzK80ufrL+jlQi4EMA1r0AsJhh
	vLxezwOi1YuHBhKLq96MUvL7sIzpxuaYddYwYz/8HNmBfKjVqkazF942rLL/CUY7
	gnn75EuqMKuBCSAqlcCu9ecSzFW9QbCvI/WXRMWfFazKM4UGB/r3WTRTzWf5PmO1
	Fmsq+g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7at2h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:34:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-83f7e7f7457so4146529b3a.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 02:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779442481; x=1780047281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pu55bG2vP5jws3ymKDZxbKEP/sVznBdilOK4Sk0Mwws=;
        b=ctYCychOs0r77XmPolVETUQKegZZd6/LJko243VX0fYzSZb+1bEBdc3er+pBRhKnP1
         fK2mK8G2jsUc4RUfNFUDLnegP2vTwdEUx0s9SqeTQrWDV2sFD1yZrQ6R1Rspqb6qx43V
         +OYBMnu/cYwk/V4Vjt3I1YorIq2T8dGPeTN8ywpla+nh+zFYIywhkVIqtaZuS7ttHJIH
         hpjJVycSyXjBdAIpyVTqpmovwQBGNAJHVTh5+JO969zlvrmnljJNy2JTdR/fdJX+WA81
         Opj+s76qU56PrPN5jQgw/G8MKFhN+f/v4Xif+JBfEx86XUnryHzsINsg60G9CiFdLaqo
         FaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442481; x=1780047281;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pu55bG2vP5jws3ymKDZxbKEP/sVznBdilOK4Sk0Mwws=;
        b=sBTKPssAbmy5/JR1e5brBD5BCxI5kRM7l8QcYwef8imYtcrC8H2DEIi4wSQf5dM5vu
         1bUzy9tHvaUsKM3rMTB+Ni0Ble8mVwKWgTqwJmDVZljXspAMtYIwI/RjdBeisLt27o/p
         H3hZepl5sb3Jv1WDQ4qG4y2GyI5N4E+XbvLdShBISgYq7tOSpmxM4tlri2JbBenZicRk
         9qsQphgenalwAurSOlvABy2e6J/EmtaTow+Y82eEr3jvDSvJSak9QTbFSLFcMTP85pKm
         ayAZHL2jxPpw4zZAqXvVqonif9iky90Mg5RE+7SmyGzUD2LwL0aVWc+/h8TBsDSGs4e+
         CpaA==
X-Forwarded-Encrypted: i=1; AFNElJ88LfkOLlVfyCz3+dwt5d8ICnLdZJpDfDbVB1m9a3EpRfi4kdI3Xocx0hxMb+WYDepc9BGzwCWUKxq0@vger.kernel.org
X-Gm-Message-State: AOJu0YwZZGEQ1P7YZNARaexKC31fUvpuYG1CnlLQB70jKxE5Gc7qD6EC
	ue0iZwY/hiRetF6m/wN2IakKdBMiTUCClJu7GattawpqWoON/AF443gNWsXUAN+DcqACE1qj/aa
	Q739YB0+6yE8n66aNs6mDdDnm6rxN1UP2Vwnr+YXPDWgl/bcOFkU18Cpe+RD6w3XmMXJ44p87
X-Gm-Gg: Acq92OH6bus4tTIJV6l2CY4uCsbnu3MO4dpmc5PExM3za0KnwAmDc9cEOP8eHnedvDa
	so8K7519y/mGw4L19VYfd5FO6KkLN3me6xyH/e82GuIWQsOJJIteywIBnctWEccrm/O09rKAYXA
	NNcSFcjnumk+0QhVviXhx89BrYv97LudCJi/12r3bgR5HRt4Jl0iSi+Nf7Bh6jJTr0IaEslVK1A
	/fApCIc9XBtWpp7IK0dr1YH8YPwXZWssBedSucIKapS1GNL0xzNfVRCNHvwYeQi5066UFsci/f5
	AAwzZy7Reb6lzyFWHMdGKe3lA5nvw0VR5JBhH91HB/Ee2WSKKelwDI9KkiD+ZPXupr2JtGKpp7k
	XDODitpHf8dLNztdaVaDyWxlo4TmBCVudb+06Fed2BO9SEvCJqw==
X-Received: by 2002:a05:6a00:2388:b0:82f:9a88:9092 with SMTP id d2e1a72fcca58-8414b5d1e03mr5245770b3a.33.1779442481058;
        Fri, 22 May 2026 02:34:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:2388:b0:82f:9a88:9092 with SMTP id d2e1a72fcca58-8414b5d1e03mr5245748b3a.33.1779442480588;
        Fri, 22 May 2026 02:34:40 -0700 (PDT)
Received: from [10.217.222.63] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841648a2bf2sm1335125b3a.0.2026.05.22.02.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:34:40 -0700 (PDT)
Subject: Re: [PATCH v6 0/3] Enable Inline crypto engine for kodiak and monaco
To: ulf.hansson@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        ulfh@kernel.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260310113557.348502-1-neeraj.soni@oss.qualcomm.com>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <07a7d2f8-4a6c-d9f9-71b5-49a1dae693fd@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:04:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260310113557.348502-1-neeraj.soni@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ric2tXZLznS7vCv8v4iA6-coda1QCDlM
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a102332 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=L_mIoDfPuTR8LUiAGlcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: ric2tXZLznS7vCv8v4iA6-coda1QCDlM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5NCBTYWx0ZWRfX+PjcxbkOJg5q
 9W69WqcT3FyUuTYLrftNETDRrjWEwXchgxAUQ7vbjYcaKah7Qg9YIeB2jzkqPE28sc1O0Wit7bx
 dFk7H0k9p6dfUI7Z6o+Lon8wNGMDEdJesg48oar+oQnXTeHqqRoXrQj3sJvK6BW1C9hFkkcq7tb
 UzkQ2HLD8AgDKN6UqqMMt5HiPZcPzIsC9yvivgAmdDLN8yr+VPg9Py8tKbg64rcZvzDQwpgax4R
 u5/KMv92Dxe7KWjJwpAPO1Ol5DYNp8NoAh6u+aZox5DVy9ZAgvI8GSPZ8hqujiYMZXuMGjcVLXH
 VFSn9ltCClX+KWWagorqe9f/lgqMnLtiKfCqrTFWfMqedujO3BsantspABYX+EugbDX+3EkpmBq
 t6+9/MhaqjRguKO7Ph1dPJeZrfLoM5A/VujiaEfXOCS1ORxJDdlr0ht83UGjlL207JRdS8tvr0Z
 DXvnGok+PfBG9pMlNCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220094

On 3/10/2026 5:05 PM, Neeraj Soni wrote:
> Document Inline Crypto Engine (ICE) handle for SDHC and add its device-tree
> node to enable it for kodiak and monaco.
> 
> How this patch was tested:
> - export ARCH=arm64
> - export CROSS_COMPILE=aarch64-linux-gnu-
> - make menuconfig
> - make defconifg
> - make DT_SCHEMA_FILES=Documentation/devicetree/bindings/mmc/sdhci-msm.yaml dt_binding_check
> - make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- CHECK_DTBS=y dtbs
> 
> ---

Hi Ulf/Bjorn,

We are looking to target this patch series to be part of 7.2 merge window
if there are no further review comments.
If if is fine, Ulf can you please ack the dt-binding patch (1/3) so that
this entire series be picked via Bjorn tree.

Bjorn i hope this is fine with you.

The v5 of this patch series was "Reviewed-by" Krzysztof for dt-binding changes:
https://lore.kernel.org/all/20260307-llama-of-massive-downpour-2e512a@quoll/
but i missed to add it in v6. Requesting to please apply the tag while picking
the patch series.

Regards,
Neeraj
