Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0B0346AFD
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 13:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785677011; cv=none; b=IY2UrCdNnURX/nnfPgfj3VMrylKsZt+nEJtmGzbXpn/l75NOO078uyCm9E0B1zIaa9TMiRXjzXsMA1aUAXhjJKGq1oPTkbH+OHsj7DS7F2iBjdruyYGWNcZO80JozvetVMOnlIzJyJGeTANZkHj/F7W/THVRLXeFRCTeS5J3oOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785677011; c=relaxed/simple;
	bh=teVr7IdNUaL6HoT523oemvoGzAhZSzdkg4niNiWx0UU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=paJt/vv0hkmAzifEi/yTiyHF60FNRJMY9Eafq00f/m3ElAHkEG0VlAeIuvt8XGBWC5wQBFBMWzbjUvrbNqEShwf2KYjtGYOtbne5meM35tSdA4Wed1BUaZG6Oc6AxEPlXwwNTmZNP56rn7gSOIBmbtHUqNlhGzOye4jIH/FZru8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o8UEdo7a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpF+UH90; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o8UEdo7a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpF+UH90"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672B6nwi1318483
	for <devicetree@vger.kernel.org>; Sun, 2 Aug 2026 13:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YUXHqwM6RtCuMwiSufi3YELdEb3Cb9ksQ3xjASr+G1M=; b=o8UEdo7aAwO6oD8y
	rxQKDLjzQQZP4OlV87Xd+UTXjKlQLTDNCGpzjVr1zpibzWuA+ejyLuYwWa8Z7aKv
	8KLA0sA2l2Rs5VhrycStgLGVeBjX9kG7J2HZUWgBACmEsNt8HNny7bsqGsPTWlID
	pVQWy7eIM3ob/WqCM3DiCdqQ7DACmFYK0+noOpTXjaXGX/kZ9e2OeM7QYL9+FB2T
	uQ4LkVwtBTD/BisABJrOpBuYmiQVRyEgnG3DAn5bH0ChEgPijPGuqc6NqTZJuHwK
	FjVt2GtjJjdk3gUHpfP54Y8OF0gtY2y0HTNQ9NO8oEoLjTV1na1OmKtxDcPjvekg
	cl0uLg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs966au07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 13:23:29 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb6ef846b33so1770442a12.1
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 06:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785677008; x=1786281808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YUXHqwM6RtCuMwiSufi3YELdEb3Cb9ksQ3xjASr+G1M=;
        b=RpF+UH90goIUy1xw3QHkaywcCQ0818x2WxO9VvVeoaqzf3EryNgCuPa76Jnndt0u4z
         J6O6qwZmZgV7VUsIardBnkNmoBaHDID7/sSxjL2hfSRX1lq3sFjRXmAy+kvxe3SoV/Rf
         js5QLHCbZ8Lti2gum0IEk9Ku1H+YT/68UssBkI1VLEcxfJHEsyrfsvf1zSaLFADZJcrX
         VUgREMmxz1z9uGy5HRrFsSdxs4OOe2RS5QIw5FnhFiGnA4+snbFUKHN79ZDoz0kqiwxO
         BTEoh/viEBTFcEUyEp1T8T3PaLQgARLIC7ZkJYPd94KrdTvbtv0ayeCw6+E/kxJ28FIl
         SSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785677008; x=1786281808;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YUXHqwM6RtCuMwiSufi3YELdEb3Cb9ksQ3xjASr+G1M=;
        b=aF3ktFgC9YwjkYCEHp3CS4rjwLVtcAPzOh5VA1fxDNtqKT8zSg4SDBdnLBvW1JpIJZ
         jArewys8LqON7iGc8pBg77kWwLhZmzsjg37dp66TGx/koTFqHXSjWoxtAo5LnLrefjwo
         hN/LHRcpAvodJUqDZ3sb3/3TNkzqAcYtJp8YhZuhuqnq1w3/RGgQ1LypmR0ikZWhzVfK
         Sp8jNP+l5eXr7sLztfaZLBVwWaMT1l4pHhN9HtiZ3zli/mKz0x91hz4Is46B/msPGTJE
         WBCI/ZeCYVoDGNBv5woM+StYtCVt2OIcaSuuSWxXvgWxTHBKSWfEpcw7I1z5iMHdL/aZ
         W22Q==
X-Forwarded-Encrypted: i=1; AHgh+RqaBJbCpnzCSqlzs/eMleRbGH2mg/gGa/RFlSqVfFMIzOncERsFzLniUQSNMosppJWSBTffUtbnRFvK@vger.kernel.org
X-Gm-Message-State: AOJu0YyKP4s1x8VI1/3QsAu9MfKW3ilIjnjQ4L8aDNA0yGbgnsBb94sf
	WkNc/i5TjU1cQUlUVC7r0msuJ/B+7VwHOFbIqy3GG1eDcIm3Xhkj+9n3Pnp3boRPUe5xgI3fGZY
	ban2VLnDDMlGYT1OovfHIS0bfkytzS1ObSsXkaxBw/gbJVTLgNd+0YuBvYyOz16c5
X-Gm-Gg: AR+sD13sI+9EmPrmtPDDzAqTy1GbcgO/G5YZ3YYl87/DFuRYgyTJXQouqIrMrT+KtJR
	mmoc537gd/LVX43FLeKna1LKiCwxMuJuK0kBsKy2x+N1kPEe2vl0vGJAlbr+cWFtAk0dXnL8Ouw
	9/Kvs3HrM4dgMO/DrLyody+XFzT6F2j/pq7m81dl0xw+JUD60XNqg1oa1jUQ17XbX9eARvfmdMe
	z7yTsC8JZNHSTPPZG+Qp8AtGzAtoYQbZ8f5OHQWcKg3eoFcObWHv0GsbaHkTolFeRlL6h4BPMxA
	UBYTtn4Qn/L8CET24gzW+rB5YiY7FbLONa2M0pxhWsy+NBj6HtiCVzKjQJQVFLDGT6YwC3/mIl3
	eaTx0YUaxjUbqMlxUBr2DzZ+g6V6cgmtUiek=
X-Received: by 2002:a05:6a21:9984:b0:3c3:6e84:ace8 with SMTP id adf61e73a8af0-3c91a9099b8mr9194985637.23.1785677008354;
        Sun, 02 Aug 2026 06:23:28 -0700 (PDT)
X-Received: by 2002:a05:6a21:9984:b0:3c3:6e84:ace8 with SMTP id adf61e73a8af0-3c91a9099b8mr9194953637.23.1785677007896;
        Sun, 02 Aug 2026 06:23:27 -0700 (PDT)
Received: from [192.168.1.15] ([106.222.229.58])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm27661888eec.8.2026.08.02.06.23.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 06:23:27 -0700 (PDT)
Message-ID: <ed076cf9-b687-40aa-a1e4-c12b7205a818@oss.qualcomm.com>
Date: Sun, 2 Aug 2026 18:53:22 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] MAINTAINERS: Add entry for Qualcomm I2C slave
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260628-i2c-qcom-slave-v1-0-8b0a5c01f9f6@oss.qualcomm.com>
 <20260628-i2c-qcom-slave-v1-3-8b0a5c01f9f6@oss.qualcomm.com>
 <7183cd4b-833f-45f9-ada4-1392152680b1@kernel.org>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <7183cd4b-833f-45f9-ada4-1392152680b1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: F4-JY6Ojzb2YPoh6BAH3cPHAoOdinal7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDExOCBTYWx0ZWRfX4E0QqfkEd9iU
 6prqskuYGv0BnXUqJqnT/qFqlu3qLyXzWc/iyo4hrvRPTNLyYC2U0woIggaP4ldQC/G320aH4iK
 Aozrc8nBh37TkUnpwWOgUBAaUvxCS2Js45fbF1ppKxq8BbbeKZorkwSlqeVjhuqgXQPdbhAfats
 zvUlCIVpfzMyIVbPhHog4EA3obB1PktUR8mf99rx8RvSRR79E5VSpH19SzZdcDNKuPawimsfq67
 CE+71CXxX4OEa1FEEiyQ8CBUT4dvAKNu9XIDdG9Vc+z+sPTo+T4+LmH6bE4/6YlJZTLS3pGDg/0
 7Hgj73kOhTXCK6546hHGtlswcOG4ls9G00Q/e+H17cjMrDsl7DrmwUNgb84XGSH3kn2rU0SEkd8
 lYjD1Nyjpy8yy7RPBKFY62cM32bri9Cor90sKhU92ugLt0eSQLIN1GU03soA9JOhGQUO1TwXN6+
 cZswgQE/spwVWMCPSrQ==
X-Authority-Analysis: v=2.4 cv=TpfWQjXh c=1 sm=1 tr=0 ts=6a6f44d1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=9c8ARojF9RoukzHm9jbkGw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=WZ9ViHwJSGtzc2qvcnoA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: F4-JY6Ojzb2YPoh6BAH3cPHAoOdinal7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDExOCBTYWx0ZWRfX1W7ijqGlqk+q
 OxxqUb6eR7v0uBhgkm1QcqodPM/NekV1qLqjA1FxLQpT4+x+d4XHLC4LAcsWnEdvNL82FWamGp9
 TCuWWvAoYFchls/gVQTbVGBLE5zU2Nk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020118



On 6/29/2026 12:05 PM, Krzysztof Kozlowski wrote:
> On 28/06/2026 16:39, Viken Dadhaniya wrote:
>> Add a MAINTAINERS entry for the Qualcomm I2C slave controller driver
>> introduced in the previous patch. The entry covers the driver source
>> file and the associated Device Tree binding document.
> 
> Squash the patch if you cannot say here anything useful other than
> repeating the diff (which we can read...).
> 

Done. MAINTAINERS entry has been merged into the driver patch in v2.

> Best regards,
> Krzysztof

