Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7136F379C33
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 07:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852090; cv=none; b=KQfrozN4pnlnveEpzi1/p72AmOw4kz/z3wgEWH/uNz+liXDP2hEM7qX8IYByFXEqugupuJTMh5duVw/sv/K3IhLc5fwgoOwcZJgICTEMlspuFY6FblmrUmXtCif6Vxi/h5RlRO4QG262sf4mxslbjvJWBx66J0LEz68ppmR7nCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852090; c=relaxed/simple;
	bh=UbArGawaOLt004uiQzVxVKoD0CYmXsvOoyStHnCjaBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lH2W8irTqSexikgFGmgxgPpbpuLBhXfJ6uYJotxij+FmpaBxSGx/r3e9gM0gfwx+k1jr9jKNzgLJuY2NUiCDCNocYd0NhSF5qCwXHQq7fTfiXCZ2y3jI2EZnEI01jjBPQrroeKE06CkQieBuGbGVGawKn/MdYpVXCsw+tSNE6lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M46hdB4n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cUTPpF4o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M46hdB4n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUTPpF4o"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LsUC2154268
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 07:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CT4nJKvnmHwXrIL3UMrQ8SXJ
	kJUib8CpEc/1U78sn/4=; b=M46hdB4nERfHRDmec6ezX877heZmliZM8niN4dK8
	NxyNFZLj1flK58vXQMnYrRXusgYM59w13QMc9YZ8U02VsVHYbbYRIhcBk+rntBD2
	z/aGikmrhBM+NIOuggGJY5lkTfWKhc+kGFUL7s8S28EiR2PTHQFEmsh7JODngCoX
	iPBN6tCD8/7R9DXd2u4xwlN9JU+3cWkZouJnkBPi95pYhPYfiJSQUVBpQ5rk1LSj
	2HX2SAxtgKXguEiHgTVJr51Og5+A/MiMl35hBPcn+BD0wa8BaAHzo+Myf9yMCuLz
	hJ67l1Eg1h+YQfgqgFNFRGvUIzZcwTfsHVIcvvfNGkqVgQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rwj7c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 07:21:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939a00c45easo305365585a.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 00:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788852088; x=1789456888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CT4nJKvnmHwXrIL3UMrQ8SXJkJUib8CpEc/1U78sn/4=;
        b=cUTPpF4oI/6HKS9ArlIDEnjHdvi8HIXnDq39YX/i7cU19hHGrPR6DVBY6FTIOPFR0F
         jjHhLK0up+PvE1a4QeYvBsQU7/kv8nMBqVhfrY+AaQD2l2cqso4RFycqZ/9rSaSYOx6d
         31fD+JRUsnvfFXjXzA72o5xqoFbTYzGQS2ZRQBFEnaTZKysUMBZmNQSytvvZQ9E0qKQM
         BrU/Mor00Ioa7Q+oyYO0X6Mz5rGtdULF5hVi3Xeh41JmUbHzPdhXDVvfIGbm6ARmfFDU
         4s7iK7ENCohc7uyZitL/GshPqKHW94ILTfoK8G1rXrMrvwsGL+zWQfMnBB/v6dxqeTUT
         VEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788852088; x=1789456888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CT4nJKvnmHwXrIL3UMrQ8SXJkJUib8CpEc/1U78sn/4=;
        b=lo4c4NBP2DL9iEpyWI3A09/eupuTkGQ39+D1NbcEkNRSWzAMV/+QuuDcq/HI+Njo5a
         LtZ2qXOqHE3tUqg1uo2F917odeB+Fab2lEmRPHRupr2ZQxyxcW1NZUjpUSJzKcyVluJp
         njuwO94q0brj5K5L6TdCHxtvf1kmmeddUC4VeYSOWPCnl0NBSYMd80aqm/3ZRYo4p0xb
         wvdH18JwaX1v93xO039hAby8vlVzLHubQlqqE5MZj/abVtdBBOlVpBHOgDAPiPVbfZV9
         ysvj3g9NoiqLFgZcP0fI7x54ZrPoq8ci+8XkEAp8Bey4opKIR3ij1rsVc9yqyU8AQQXQ
         c9nw==
X-Forwarded-Encrypted: i=1; AKwUvBxLLR0cveN2EgKqq4YxGMUKVfSsnzkWqCfbZrmJiSuZjkfraI1XAVvJmx2jqBDUK5826jKTOA/W2TBf@vger.kernel.org
X-Gm-Message-State: AFuF++l7wG12Sk7wz+n7hqtfUX206Gz2aFC+OHxmqJlBnjUbaEbmRuNs
	KP2GcueQKK1pFnH5eulqaYZJECe7yL2tsasLkiskFvLlIQ02JIFSir54yAB61hziTOOtoUSCvel
	1nK1EjPZJwao8JMvNIv6FJdDrgIGqTeBzQn+WkTX/m1eety9xEbauVd8NJIfBonFb
X-Gm-Gg: AYBFou2nA0wtyYnAZHRRC0KQ8RlDcYlYRRh++kUrbgenLUZWK1EYgRy3uw5pcOAvNkv
	osEalmXLDgTTBy9AdjM5349nAcKn3V7esK3s6uwfwybwhAMINvcJBazFyY5WuRHBlPuEcuB80Hu
	JJS4ZlYsVMmueyPQSi4td0QnLZbTo2WHtz4Moz0PXr+Jp7N/wjrpgbi1U4gVAyOkfxS+W7hVYid
	RHT4GvBnTxvONwvbjOb0Pe/jW/V7Lg97koIphbjRonMSWxxtSQ0Yu8J0tu9tBn89F8iJJcyJQGB
	oJjCryOHwrIVCXCTOqiUu/vUYMcQWlc/KnQQIyr75uYFjYJLEBl53AKTOHfO/a/L+77xogbvyy7
	xtNdm7L9crgQ=
X-Received: by 2002:a05:620a:4054:b0:932:ddff:123d with SMTP id af79cd13be357-9398042e263mr3035263185a.29.1788852087792;
        Tue, 08 Sep 2026 00:21:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4054:b0:932:ddff:123d with SMTP id af79cd13be357-9398042e263mr3035257985a.29.1788852087230;
        Tue, 08 Sep 2026 00:21:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c5bc5sm36575044f8f.24.2026.09.08.00.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:21:26 -0700 (PDT)
Date: Tue, 8 Sep 2026 10:21:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v6 7/8] arm64: dts: qcom: agatti: Add OPE node
Message-ID: <jncyxiupuqadcasf7te2eugg5jog7yg67h6oilw57q2hblnz5u@uw7jbabkauta>
References: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
 <20260907-camss-isp-ope-v6-7-6b915b9c5131@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-camss-isp-ope-v6-7-6b915b9c5131@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ga8nWwXL c=1 sm=1 tr=0 ts=6a9fb778 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=I_ukrOqQsWpVYGr8uL4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfXxEgcZ/o8z/lj
 FmQhGCeBbej8YHEtSjy9HtAU8PPBLDEKbr7a0CJ7RegWk1S7pHlsbei0eJndCSPdmcqeFbbmu/o
 xrX7Y5ps4KguKqxYCxvd946PQnttM7/ynro8a+1U+4bBIz6ghiZmyiPfrjj9FTRSRxI0OXdRuMU
 cym447z/r13Mk1GrxRF820pdqQBUiY7W59wjzvIpd3kUtb31HXHze39Rn5kAQrpItXP3VHkhzI8
 hCmMQkhOfLRCQdaW03g99s+UsWfC0L6k47qEZLmcmnbWHod9v3yBk1WMwQ5BEbC86mxqxnIvQ4f
 3KzIkg1fYATZnhU42rtcvImAQ6hC69xv8lmf36/TzYbRJprofw05HaGvkiuFaLpRIMs4s39nUnj
 1DOWUoC2ixVSgSvjyh7tSyuOigzBNZWTuN2wPgslrg5zbAtAN4C85IjC9IJ5ZgqSsdIIN5mASnz
 es1gM3PQTTbParLIbBA==
X-Proofpoint-ORIG-GUID: d8C_OenxGtTsncdEffo-45SaNeNe4yZm
X-Proofpoint-GUID: d8C_OenxGtTsncdEffo-45SaNeNe4yZm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX2wDx0emxA/JR
 Qem6wseVMANm9ILqWHZkE+ikf6Ys5uG6x+tYgvRKGdGhOiYA8x3w6mqE/hf/Gi9aqqvC0Xaj0Nm
 S3WFjVUUOl6+AlAoOdmdQL5WOxIBAUs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080074

On 26-09-07 12:51:17, Loic Poulain wrote:
> Add the Offline Processing Engine (OPE) device tree node for the
> Agatti platform (QCM2290). The node describes the five register
> regions (top, bus_read, bus_write, pipeline, qos), clocks, interrupt,
> interconnects, IOMMU mappings, and OPP table.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
