Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903022;
	b=vux4s/yLR7KiVMD8o6g9cJ/64/KLHZsCq8/kNeoJNMD/rC2kOJ+I4UHWV22vE1DiyPsn
	 y/kjKnIegO0BLndBtcH1+p04klaUCSdgiJGc+USWQQFZQPBXnJLJb/IaFTKhwntT7u/eP
	 zNoj6YtOy7K8iCiuJJ47tJZCyrqtPljRe4Nk3Pcg+2L/0CAuZonCWESWWC+H1lUPxbwu+
	 6FmDExLI526oVj11Q1N2J3igXWHuGN89HzZ1Odg4+O0YiJxuKnbyZEkHeB3H2jq+EhFUT
	 +3TkXsH9bSiKhzDIbQPXqOyd29wqbzwyoZZPH+lW7BPeOQFsG5NB6SfgWrBo0EFCGUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903022;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ywfuAFd/K5ZUKJsJaSHr6Wq47xa9wttISztoP/unkLc=;
	b=ypC5lHLvV2RxI6paP/1nOrmzBIRDRfKStpuahk8hP6zsKpWT1XqfRaeMJvA4YsKrnt3M
	 ansH0gkWuNHZ62aTlGgXP4UtuEckkv8Nk6ti6SOAk0kPCpXZtf+YniCZ3DKsUkc+fhLtc
	 Bm7L3TXHkzglnWFLOrcXSB1xg+B1rm2xPuyCjQtgVa8BE+WaSO7X7dsmRJyHXpFnU/nKU
	 /OatnmSXaI8A8y6391FfIcbpDLlVoczz0t4wUfe6WZ5uG4CKjq4b+akWH6HiaH5qKoXQS
	 AhvvpUzD3wg44aOz0h9KYKyF5xrY56IcMFOZQPHPc6KL9DXjygqHcFJA5goe0TT+RfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g2TQsKck;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HuGfjZBv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACABB606A32C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACABB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g2TQsKck;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HuGfjZBv
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aIdA4146685
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ywfuAFd/K5ZUKJsJaSHr6Wq4
	7xa9wttISztoP/unkLc=; b=g2TQsKck7ce39yLpfcRic140Te0EI4E5oDBeqc0o
	Qq6yLaKkluY+RugReFLf/qwujhtvYwHFo+CcSDi/l9lMD5zG/J96rul2KlrwfhFN
	Pyo1CY9CWypdPP6c62Shfre8J4HpG7MuQTr1qliDwQ6XSEKEhiE5902MnFT0dXkj
	e9IcXZ4/i3Z99haFWuCaTPFKXMPnWwo6XfgxKF59sKC6vL5y0ynpwPp6Q6VATdHW
	dKXmctcbZ2WxM3RzZWOPVMtHiU4Pk+lVaBEfv0/9xwdsLd3ypo6GtmJyHA1tiQXT
	5chLK0zBmPV4LSz3SaOJ27EWl2aSGWNs+9DvatbEQ2gXmA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfmff3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:10:20 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so6971039c88.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794903019; x=1795507819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ywfuAFd/K5ZUKJsJaSHr6Wq47xa9wttISztoP/unkLc=;
        b=HuGfjZBvQwN7zBcq7zFNygWl+Q21UtxUWx+XEAnPl36L1EkapFRa326VTS7zZAFoGW
         Z/ZlXdZT+icBO4oE6o/Qavixnv4V5uA465XoEOg/YcqKCLWfL4/iAmANxw8zv05giCSe
         vbsVMaj6mT4ITk1EPnMOU7o9DBUZ9+zbsDo2kMjk4SeoEVEWuXs610RWST+boLEHX89x
         lChN1dCcSvAUDyu0xrihVMZCqLWbvYXNCW44XZJMJHbNzeP2RcUY9BfhrG3jpOlQn3oJ
         oVEo3KRSfADvfdpZ1DTit7xSE3uBqfgYzLGvAC85CoiRNwl42X0u2zeOt6r6y77g7MOf
         xVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903019; x=1795507819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ywfuAFd/K5ZUKJsJaSHr6Wq47xa9wttISztoP/unkLc=;
        b=SNmPMmKMvHfuZkhJrM+tI7h+LD3K+9I+IuR/c1/7wgEqVl9I3YYB65/KW0L98ssILI
         ulLwE/ZFjqvA9/h5MfAp47y4GLiEiExKdIx+mmy2VXrVR4qMSWp4urD07Cci6DRWVBcm
         d0SLoh26qKyOTkMJh2M3BTdwwLeYPlVEzj5AlNTymCIwnKxd6msChJAxbF6nwTRRkZnY
         CI4p6FMwt4PXDkBaEswQrffzz3RTXv24uvjB2z+4vGIEZPeRuovnTdfKglB0pmaWICa7
         OCdY1PvKEK/rQK1RZ9xUsFFAVpsZiV+RHM2RabuhG+yQJJeE9746gHiB29WvyvzLcfm8
         9q3Q==
X-Forwarded-Encrypted: i=1; AL+hErGpU0fQY2aVfRQMGq7OqFSJjWtTBzGBYJyYL8KR/59YdZLsQ/Q2s/Vdv8KTG6VOV6UVgc1WXzas+2vr@vger.kernel.org
X-Gm-Message-State: APuU4Z+a1v6Nwajv1pYgw4zJ/AAYA+fa6ZDUbVikm5Mu3EHtxNFuXsk1
	ZtZPfncgYacbxWQ8HPeGTOzXcCcIMl7TS/XfDtBjhKwTdpZA4gR0ZngnLfiA4URYHNDe8lgeBR1
	4WSjr7x+TUcVSgn8/kVpbOij55LkXsZXQSApvEgBW8tANx8pEyAfEBj4a7NVqw/0d
X-Gm-Gg: AYBFou0ACel6p3+YgWZygVmiC+8gm+gA1q5PdptoUvNZBNZO74dc1l6ESts6/q6c9U7
	2MvKeldm6J0KN35fnmMWWugjF47QNmdhahUDu027DnCObS+sG8qUyIckM0RH86wtDDTKvKzQQ7A
	mO1sbdUdY2ysnyIVJ8ilz8hk8g6+0usIRCOQmbpm4/RiorWqm1juEm+RmhfFX1MsHEts2k3s8aa
	zERtKoI/wmnuz6QLO4nF6XxC8rmZnOJSw+fJIJh8VP2JZIv+hRHfiMeJlFLQW0tMAqsWifMbpzn
	aHwG7289J2XPFOw0aKEQzc3/3jqNeaRoFFTZ5bLeQyRVO/LR/jGrOqzz2fhaQY7FAZCzJ423rtR
	hhklT1oPVZd76N5HAd+W02P11YK/uzBF+rIYqfKS/YFqjFzwcml3nnNcKQf2gWQ+zPiI1uMbxCE
	fA
X-Received: by 2002:a05:701b:2202:b0:1b5:e9d:c641 with SMTP id a92af1059eb24-1b50e9dcabfmr9827918c88.18.1794903019124;
        Tue, 17 Nov 2026 00:10:19 -0800 (PST)
X-Received: by 2002:a05:701b:2202:b0:1b5:e9d:c641 with SMTP id a92af1059eb24-1b50e9dcabfmr9827891c88.18.1794903018317;
        Tue, 17 Nov 2026 00:10:18 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm42451898c88.14.2026.11.17.00.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:10:17 -0800 (PST)
Date: Tue, 17 Nov 2026 13:40:11 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] remoteproc: qcom: pas: Add coredump support for
 secondary processors
Message-ID: <20261117081011.jcuxog7ixwbfbyce@hu-mojha-hyd.qualcomm.com>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
 <20261015-oob-support-glymur-v2-3-715435f52dd7@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-oob-support-glymur-v2-3-715435f52dd7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afc0bec cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VTWUisejw7g24Mmt_jYA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfX1booFl9jH1E4
 IY+XBA+NDqSspbRKHuWcWtKzs5y6DOJg40BElcjBdO39G5b8LxYkG05kGm3GUUu0bC3yEl2N+Gu
 lmf6JnSCDZtaNI1wFiTa0HijcEseP1Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfX06kg2qKX+DoR
 8b9/v5XIh4QAbiM0F3IrKd9W6JFGAPyiQO7tdRO9OEbCizthupTu5R3JFk7wGZFmQBz1Q69gEzX
 o27XxeD29rlYa5NWBOUBpUwVWb/bBPgdFZWIa8Gnp9J8AQLDVXqwz3OOyEvoUnp4F8bWVrB05qZ
 TBozhTryWqCdooqswgf6433xsJISs3+Cmjlg4SuX1Gkm9yPjmip2ZfREjm0KLmX9afJxCXch83P
 4UzCEapN6er50dbyAr/3uTePt1OIt8xsB454E5yQvBjaL3SCnHuV/8rG3Z4rhVDMqfZQdyjMBXx
 5VtyioYRLvtP10Z8mk99fq5jfCKhBetJTQsUuUs03DcO94mGlie0zdEjZ2Zpil39vZWlsLVS42g
 t8UwfdH0g9D7ZggpjL31oU2GqOIxoQUeIEcqvpV7cVhfX73karyiaOw5uDoZANE6qk4Qvu/MvBe
 7kjCyxdfZjyx7Pj3csg==
X-Proofpoint-ORIG-GUID: -fyuuXpoSaQ7iOvBjA_tjEGCmiT0TIet
X-Proofpoint-GUID: -fyuuXpoSaQ7iOvBjA_tjEGCmiT0TIet
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170032

On Thu, Oct 15, 2026 at 11:25:51AM +0530, Anvesh Jain P wrote:
> Add coredump support for PAS remoteproc instances with a secondary
> processor by registering fixed dump segments for both primary and
> secondary carveouts at probe time and mapping them during collection.
> The attached-state path is for debug dump collection and does not
> provide operational device recovery.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 102 +++++++++++++++++++++++++++++++++----
>  1 file changed, 91 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 0bce2f0d5b4a..374cafd04b62 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -117,6 +117,7 @@ struct qcom_pas {
>  	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
>  
>  	void __iomem *mem_region;
> +	void __iomem *secondary_mem_region;
>  
>  	size_t mem_size;
>  	size_t dtb_mem_size;
> @@ -162,6 +163,28 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
>  	memcpy_fromio(dest, pas->mem_region + total_offset, size);
>  }
>  
> +static bool qcom_pas_has_secondary(const struct qcom_pas *pas)
> +{
> +	return pas->secondary_pas_id && pas->secondary_dtb_pas_id;
> +}
> +
> +static int qcom_pas_register_dump_segments(struct rproc *rproc,
> +					   struct qcom_pas *pas)
> +{
> +	int ret;
> +
> +	ret = rproc_coredump_add_segment(rproc, pas->mem_phys, pas->mem_size);
> +	if (ret)
> +		return ret;

Why qcom_register_dump_segments() already does this ? why need to
add entire region ? please modify qcom_register_dump_segments()
according to your need.

> +
> +	ret = rproc_coredump_add_segment(rproc, pas->secondary_mem_phys,
> +					 pas->secondary_mem_size);
> +	if (ret)
> +		rproc_coredump_cleanup(rproc);
> +
> +	return ret;
> +}
> +
>  static void qcom_pas_minidump(struct rproc *rproc)
>  {
>  	struct qcom_pas *pas = rproc->priv;
> @@ -577,16 +600,38 @@ static int qcom_pas_stop(struct rproc *rproc)
>  static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
>  {
>  	struct qcom_pas *pas = rproc->priv;
> -	int offset;
> +	phys_addr_t base;
> +	void __iomem *region;
> +
> +	if (da >= pas->mem_reloc && len <= pas->mem_size &&
> +	    da - pas->mem_reloc <= pas->mem_size - len) {
> +		base = pas->mem_reloc;
> +		region = pas->mem_region;
> +	} else if (da >= pas->mem_phys && len <= pas->mem_size &&
> +		   da - pas->mem_phys <= pas->mem_size - len) {
> +		base = pas->mem_phys;
> +		region = pas->mem_region;
> +	} else if (da >= pas->secondary_mem_reloc &&
> +		   len <= pas->secondary_mem_size &&
> +		   da - pas->secondary_mem_reloc <= pas->secondary_mem_size - len) {
> +		base = pas->secondary_mem_reloc;
> +		region = pas->secondary_mem_region;
> +	} else if (da >= pas->secondary_mem_phys &&
> +		   len <= pas->secondary_mem_size &&
> +		   da - pas->secondary_mem_phys <= pas->secondary_mem_size - len) {
> +		base = pas->secondary_mem_phys;
> +		region = pas->secondary_mem_region;
> +	} else {
> +		return NULL;
> +	}
>  
> -	offset = da - pas->mem_reloc;
> -	if (offset < 0 || offset + len > pas->mem_size)
> +	if (!region)
>  		return NULL;
>  
>  	if (is_iomem)
>  		*is_iomem = true;
>  
> -	return (__force void *)pas->mem_region + offset;
> +	return (__force void *)region + (da - base);
>  }
>  
>  static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
> @@ -598,10 +643,21 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
>  	size_t table_sz;
>  	int ret;
>  
> -	ret = qcom_register_dump_segments(rproc, fw);
> -	if (ret) {
> -		dev_err(pas->dev, "Error in registering dump segments\n");
> -		return ret;
> +	if (qcom_pas_has_secondary(pas)) {
> +		if (list_empty(&rproc->dump_segments)) {
> +			ret = qcom_pas_register_dump_segments(rproc, pas);
> +			if (ret) {
> +				dev_err(pas->dev,
> +					"failed to register dump segments: %d\n", ret);
> +				return ret;
> +			}
> +		}
> +	} else {
> +		ret = qcom_register_dump_segments(rproc, fw);
> +		if (ret) {
> +			dev_err(pas->dev, "Error in registering dump segments\n");
> +			return ret;
> +		}
>  	}
>  
>  	if (!rproc->has_iommu)
> @@ -716,13 +772,21 @@ static void qcom_pas_coredump(struct rproc *rproc)
>  {
>  	struct qcom_pas *pas = rproc->priv;
>  
> -	pas->mem_region = qcom_pas_ctx_map(pas->pas_ctx);
> +	if (!pas->mem_region)
> +		pas->mem_region = qcom_pas_ctx_map(pas->pas_ctx);
>  	if (!pas->mem_region)
>  		return;
>  
> +	if (qcom_pas_has_secondary(pas) && !pas->secondary_mem_region) {
> +		pas->secondary_mem_region =
> +			qcom_pas_ctx_map(pas->secondary_pas_ctx);
> +		if (!pas->secondary_mem_region) {
> +			dev_err(pas->dev, "unable to map secondary memory for coredump\n");
> +			return;
> +		}
> +	}
> +
>  	rproc_coredump(rproc);
> -	iounmap(pas->mem_region);

There was a region it was unmapped once done to avoid speculative fetch access.. we can't keep
it mapped all the time..


> -	pas->mem_region = NULL;
>  }
>  
>  static const struct rproc_ops qcom_pas_ops = {
> @@ -1133,6 +1197,12 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  	if (desc->early_boot)
>  		pas->rproc->state = RPROC_DETACHED;
>  
> +	if (qcom_pas_has_secondary(pas)) {
> +		ret = qcom_pas_register_dump_segments(rproc, pas);
> +		if (ret)
> +			goto remove_ssr_sysmon;
> +	}

For early boot, we don't even have support for the primary image
itself for the first crash as we did not load for its first boot
up. So, this is new and you don't have check why do we need it in
probe whether it is early booted subsystem or loaded by linux
Also, not sure if it is right to dump entire memory region.

> +
>  	ret = rproc_add(rproc);
>  	if (ret)
>  		goto remove_ssr_sysmon;
> @@ -1144,6 +1214,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  	return 0;
>  
>  remove_ssr_sysmon:
> +	rproc_coredump_cleanup(rproc);
>  	qcom_remove_ssr_subdev(rproc, &pas->ssr_subdev);
>  	qcom_remove_sysmon_subdev(pas->sysmon);
>  deinit_remove_pdm_smd_glink:
> @@ -1169,6 +1240,15 @@ static void qcom_pas_remove(struct platform_device *pdev)
>  		of_platform_device_destroy(&pas->bam_dmux->dev, NULL);
>  
>  	rproc_del(pas->rproc);
> +	rproc_coredump_cleanup(pas->rproc);
> +	if (pas->secondary_mem_region) {
> +		iounmap(pas->secondary_mem_region);
> +		pas->secondary_mem_region = NULL;
> +	}
> +	if (pas->mem_region) {
> +		iounmap(pas->mem_region);
> +		pas->mem_region = NULL;
> +	}
>  
>  	qcom_q6v5_deinit(&pas->q6v5);
>  	qcom_pas_unassign_memory_region(pas);
> 
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha
