Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E844B313E31
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785415607; cv=none; b=dVfAidx8JDOqHFQUq0NMk0smJPdh89N0R/zNnz8Bg9MKyn0Pjimp/ajLxX3RoOB+U8M7jIqUCvrijMm898D/x0a2PUhX5Zhjajcf+Ynj71AZSBKuBYScmqkSAeDEyIASztAvKQy/JggcuVMVb1zPBWy5eU2sSyZkXxv7ZYyBI+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785415607; c=relaxed/simple;
	bh=fsaNZDBLc6AlfJCqkT8rUEVyYHFMd/H4nSPD9TYnfho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R4FdF6rXJH1nc/SaNjh2XODmGYo0IQWyf29HpGIZ36uj5YY71WL0FAkxz14TXTWvXSrkiRgGtt9QZqyp6sgl+CthSDm01yn/UVHh9NGs0ZdkS8G7ntgBMjhr6BSKhyFKPr51kcBgACHoUHk9iXsyJD2oXo9qqDDmGG6lBxbR+00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bZPB94rt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F63FE4di; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bZPB94rt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F63FE4di"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UBHgV1918163
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NPOmeG0lsjl+u2O4/DJvK2x6tYkD42+Z8Bxea3wDYyI=; b=bZPB94rtURe4HPM/
	zVW4N36L6X1Yd+Ntfn3ELGZMRWlB8d22Yz+LIR/qzj/bOhxxMiH/dBAcU7RTfgS/
	sURsFwx7RCAA4kfE2RsF/9PHkdvvvsjc31uUXPLqi7HgrKc3s4pCs3D0+9fdx7pH
	5LpmZRpNaTg0ROrg2UVhkSI0ZpTXqtyUMKdkzVMHJmGFFtHiln3kt71bsG2iKtNl
	10eNvmBneQMEOzAChpsScRC8XhDXMIpo+KwH5om+X2YP4vSqY3JNj6SgzTv2sEIT
	KxZrEVy37X+7Z6GJ8N8Go8xstdsI/pEdrPoWULz/Qio1U0Iayh6PPv944gFVY/2e
	KUMLUg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr5m08ay1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:46:44 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-74ab6065f97so44526137.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 05:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785415604; x=1786020404; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NPOmeG0lsjl+u2O4/DJvK2x6tYkD42+Z8Bxea3wDYyI=;
        b=F63FE4difXf+pDsRM5694yQ9ltx90mpEJSBv0rXGlriGUFusq+M61B0xos0nNNrZH+
         lxIMTNhICUjXaaC+rVmoqRmau/pT0rZlskX5yAEMEY0eYSWEcMT/BayQMWnepXlPc/qP
         pzke7WV40Y+yjjvsMGWmtOrtePxoFMD+Ibs7F1hPhRW1FVT/pw9hqRQ/440ebCE3UCo3
         g7oPBtXy0EMk/brPSh/NyLfuFmQBP3a/4OWxiDTK2iU4LENSqa9kjyFMVjLtPV3LbBLY
         Z0TnqNeUq59c8GuV3K5NXZEgZI2rLF/WIdvJlOupNN205kh2ShRfvv4r3XGhFLtwnTr6
         H4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785415604; x=1786020404;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NPOmeG0lsjl+u2O4/DJvK2x6tYkD42+Z8Bxea3wDYyI=;
        b=WAx6oH+/aMDtdi7qXblKcJt9lHoIaFWn1E5REPjkE99GkzHkBsWP2GVWbnPWAD9AAO
         d58Q0tq9UkKJz4joZpf+7OHiUz4I7x1k0tfmPPiPgT05qzsu8XEMAzRdtzTCw20mwclf
         elazFCrfpBYSrRgicQ56IosQMYJ4ytl7tkIVFOfypj9qS+6ggeQt1HR2c8gWpxFMEn2i
         NCQ6D24GjXR/5nnQEgjVUtGPDGwaafNKAKJ6Mq3w4Gc0/aQNEgL2S+qV8MxwDR0wgtGB
         Mk1eSfM/rOh/dxfsIMXl/bSrFRC2WFXiIZ1c/3HgvuA0I3FeeN4VOSo7WCi1PC2Itc38
         AKYA==
X-Forwarded-Encrypted: i=1; AHgh+Rq5fHCJCm6xmAy2Y+lrnnUFgFklfEo0T7H9eNoHrda5zbcv4Umx3Km5ErcxdU78DhIiLshExOrYN5rk@vger.kernel.org
X-Gm-Message-State: AOJu0YxEySQa+QZj3tY0JBdPrCubrdaAqzfHSgMEH+K3qtKDQfII7hsq
	6a4MRletNnJ54ly69hqLBNSU3WNCmyacofEfRr1uuQwH8x3R08eYfa+Na34TgcDlkUi/6HyvV97
	UhaapFh1orTUeVjCWLJTexcLaFfZ5lyHfHgkyYfSRYtte/Irp+pt8Lrk6jceePKGg
X-Gm-Gg: AR+sD11v7H3Be8W/cypasTQ9nBuVLzokq3r3H+VR6I1mMCxvBVAB2q67nOvw7N9cyEZ
	FZ5U7NJXLdOOqSzesOzr4hDgBeKNDbzhnF0Jh/CHEO24ak5nPoiVy57/FEuZ0fVra+LF57eMUEX
	TB5jR5jdVffNCzkfNTo698mSEDuMvjiG1ZR6302pyjYKsffFlv9raxF80+JQHG7aBW9J1s/eycv
	8YxwOyXSSM1auBE8breXrH1I9LDOdiV3JFKbkVkxyx2IeAXFEVRnZrfh7tBxwWXjhRoT9wmqc+o
	zxDPApUjNlUx3GPNOBsQksI1ls8MwJ6QnCGNt7r7tWHfJOXcNU0NRUsic7nUuu1kGkiTYKTV3kP
	PvpLfK+yw3pBe6wSVK2ty1HVy
X-Received: by 2002:a05:6102:e0e:b0:738:9abd:9ebc with SMTP id ada2fe7eead31-7574af0542bmr616371137.0.1785415603881;
        Thu, 30 Jul 2026 05:46:43 -0700 (PDT)
X-Received: by 2002:a05:6102:e0e:b0:738:9abd:9ebc with SMTP id ada2fe7eead31-7574af0542bmr616343137.0.1785415603302;
        Thu, 30 Jul 2026 05:46:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07d3937c9sm592673a12.20.2026.07.30.05.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 05:46:41 -0700 (PDT)
Message-ID: <343332d6-2a63-44fb-ad5e-1058444ec8ab@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 14:46:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/22] arm64: dts: qcom: Fix the PCIe iommu-map entries
To: manivannan.sadhasivam@oss.qualcomm.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260730-iommu-map-fix-v1-0-83405d37ba41@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260730-iommu-map-fix-v1-0-83405d37ba41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: c9W6wjUxqK6qZVuq6dSj4cRWCo7Yfdyk
X-Proofpoint-ORIG-GUID: c9W6wjUxqK6qZVuq6dSj4cRWCo7Yfdyk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA5NiBTYWx0ZWRfXycHQm/08jjat
 Cb/Z6T7U5bYLEfVOvIp0M3fSCdbBOHrDQ1bXXiC3ss6QX+s6Ic2p70HeFSgziRdeZEWnmnpK947
 CrXYLBp7ywRcmxWkH6H91Bet82OLjTo=
X-Authority-Analysis: v=2.4 cv=esPvCIpX c=1 sm=1 tr=0 ts=6a6b47b4 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FIRGNMdoUdLwylqrcp4A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA5NiBTYWx0ZWRfXzXkxXPT9qV97
 IjUYF9MGhxu2xDxdREiBEKuR7XMFQIHy5IZBP5fnq7HdldGxpfKA+SEppVqlDi5SEeZkXRCbci5
 fSQS3Z3q6JBlFcWRTOG5UXEIhXOJokTM5rLfjhtHdQrE/yV/dkpROQpaVpO1GzcEbR4EsEWVB7N
 53IbVIZxQWVYVnQG2rEQIjmdynhF4tvnHPw8bcCP9YG3KLQTPDY/azLOOv41LUzQLh7qYxKXBhi
 GpPvIt4jM5i/gLgOR1xBcmX0PMb/AJBsQxSU4VCTWU9gAPmuNiGdsurZ21YSEXGL119dwXxPJud
 i/CJRkZRUh7ig9JXF0EgUpRDmYhIwVkUiwDiBcPJpski25Z1sxb+y/93AIBu0GC2HMbTpZ5ctyG
 fJAw1teaE296qqyyeMlpFCmTgPogvNSVvTjGFuJppYDLGHLx3aY+UK73JhPmRZIcI7T38zZq58s
 lk30Y0GmHR2o5+B71Ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300096

On 7/30/26 1:55 PM, Manivannan Sadhasivam via B4 Relay wrote:
> Several Qualcomm SoCs declare their IOMMU providers like apps_smmu and
> pcie_smmu, with '#iommu-cells = <2>', where the two cells are the SID
> and the SID mask. But the PCIe iommu-map entries on these SoCs specify
> only one output cell for the SID and omit the mask. This went unnoticed
> until the OF core started warning with commit
> ccb2fd725d41 ("of: Respect #{iommu,msi}-cells in maps"):
> 
>   iommu-map has 1-cell entries targeting 2-cell #iommu-cells, treating as 1-cell output
> 
> So this series fixes the iommu-map entries across the affected SoC, SoM, board
> and overlay files to match the provider's '#iommu-cells' property.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
