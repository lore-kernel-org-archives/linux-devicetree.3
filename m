Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFE043BDD9
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813840; cv=none; b=V4eYYBoTNqlUx4bh3Us9pBz8BG6Ven92p5PIaW7ud5Owo/apkSPRfnIEsSoQgZtuZb48xlp9taesoaQkXJK36fbIRDhZC6wZlgiaHGAOBD1t5RFY/rCmEfPGVCgQW2rhZl56Z0RpoVlSIkt1WYQYBzhVoQQZw169dzCgOm/c0AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813840; c=relaxed/simple;
	bh=cX5RyP25LLZ1Jg13iKUkAoxbJ9vy0x/xpbeWmaWKPPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fCosXyiJPYLbBjW8I1I2iAfkrUGgw/pKRzyS0GOsCtmSaSi+25VRXkjjgnvDIT19RuDBV2TvGH0CEwkEalQp/4Ga9irJaXBAhcLjmcUqjVntKJr9vJb4dr/Uu14FMvBErBfVBX76jawIopwqmZGh1TVJbxxurZ4cYeNol/VQP0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SRGYiamr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cdybesjm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SRGYiamr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cdybesjm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvRSR4078246
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gHslaQdrIxXhoR6CTG+3KawG4L5eFPme/pRlS9V9GnI=; b=SRGYiamrXt0hgCk+
	WNnhRI8ZmDZgtZWVqW1gXz7GYyfDCE+Bwv0tbm94DH9CenByUSzUOayLRpZPEByi
	ObtqjIBg+Fu3WMkfH9hGp/12ej9FnHHk6rLTwHpn/Qbk2afuBbsKCsb46Ufqs9GV
	nNZgYZxcGHmZdOWD29oxeLnjVl2GV17+ivdpU1RqCKUdP6t1H9ZOZ2ZPl6QsvdOx
	3j8kW/6hckJUjTegwZ90PGymHVM207khRlCOcFcNgQ3CBR6ePJpeeNtscXxIjT8r
	bfPedFnEKprcj0f+eb/Z/HWS3P/7KK2RVvy+IPCsxDr4sHZoNWB6LjFWL7pFir/s
	MTqFIw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkg52116a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:37:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e57e56ce9so15539285a.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 06:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784813830; x=1785418630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHslaQdrIxXhoR6CTG+3KawG4L5eFPme/pRlS9V9GnI=;
        b=cdybesjmOignIavR+if/HB41IMZVrYiCnY8YeIkNUcNk3Z9TkNAJtlRVYSxU8HkhPy
         3j0v0z6fEgVGifrpPQzTu+ZCSNgARgiS7whZvkDN2AftVkssoSWELnvPLvEVI7x82c8i
         /EoBA0ia2S376UkHeZKtIy34vzZ4/oM9avYVXQarIFgScFg/H/v9dNuEvVaibZBBF7gy
         asMNt6cPOXM//80mSFZULzfjOQgfYybvcjT5WSvzsQIs/hyjIzC+zAxnEMc0HHi0I8Qb
         kEFiuuJrsPhEa/r4FBAomMDOu9dTQvFdTRbMIBsRUkpG80v0aVIg16E1HGcQEmDvjY5r
         k3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784813830; x=1785418630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHslaQdrIxXhoR6CTG+3KawG4L5eFPme/pRlS9V9GnI=;
        b=DDx46QJdWZh2+/yOTP2MpzWiuEeqRlrva10OdmcDb4PQbh9CXgxASOOZ3honiyZP/0
         CBiEsh1dVObwZbOgTUlpP24q+foC3V5Ducjfy+nV7BINsxetvFxGMxmbB+qoeUAHY3gI
         6M8F5VzieRYdezls5EvhjH+5mYMSgO15tx/Ie08QhiuurhACQJq3rA4yf0Ao31G+solM
         gJuxm2+ebluX1DQHTwlyJU9Omhjq9TJIeA/hZCDCNXRac2yQhhmzHB5FRF3aQzyrZkM9
         K5O9ZEz8KlypARdIe6AKJliRCRkyBulwtPlFnUfGwX11BIfPQheJ0rtjKW+TFhwb72fF
         sKZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/hLkRYC0SVnFASR9ee3gUh08AKtM6AeEDdS8P+5izQ2BsMijJxQyIrxm92dsaNmHfsd4Qi9FrO1ab@vger.kernel.org
X-Gm-Message-State: AOJu0Yw536MBZ+VGr9H5CG27ygzEIY+YCkY5F9Yu1olULHNDDMQbD0bS
	K8plSMp98BHTCkOoAwmUtPSl3Qp9/yZeXf+iLH+02sjQg2uvMJWRXVNN0i2/wSfAYyKe44FlE0d
	Q6VkedW7IinJYG+0HhZO7Z0iyW6qhGV0M0m9Irf74McPlEhhoNxTew0ipEC3uvTdR
X-Gm-Gg: AR+sD10QUzcUpMwix7w+xwIu1P/DrUBMXu7IIA7tdDHQhY0G7zdj+5ShJErQWvEm9ue
	R0SpUikw6xuiGbSM2VUP3EtknmQduhUBj5MpbMFlYMs6ByOqxYnV6rVqz4+88l9kMLrs5R5QGRi
	mTtFuRa4nOl7WFm/efwN6DBL3lMg6dzqdz0uN/nkI2k4DkaATyap0Ojk08ohC5VUwInxn6MmQ3p
	UJzptGFFOF2lrjLzm2SvCZFgb64px62bNFTIyHuo802Ow9eNCuQZto6PBfmH/lpw4xr9tQQrYfC
	iSMmcDyfznV7fcIjCSMVHvi10G3W3ro6Yo+327UPURdWPMzgqlqiFx505SRMtiPFAWO4xkgwuS3
	6yhsrIy469UXcYoL8L0p+i9MN
X-Received: by 2002:ac8:5a4b:0:b0:51a:d45e:638d with SMTP id d75a77b69052e-5284750cb61mr5096771cf.8.1784813829677;
        Thu, 23 Jul 2026 06:37:09 -0700 (PDT)
X-Received: by 2002:ac8:5a4b:0:b0:51a:d45e:638d with SMTP id d75a77b69052e-5284750cb61mr5096461cf.8.1784813829187;
        Thu, 23 Jul 2026 06:37:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f19c4csm231706066b.63.2026.07.23.06.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:37:08 -0700 (PDT)
Message-ID: <fb8d3a44-0792-4420-aee6-e7559eb9ab70@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:37:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmaengine: qcom: bam_dma: SCM-assign descriptor FIFOs
 to a remote VMID
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260714-qcom-bam-dma-vmid-ext-v1-0-cef87c57b7dc@oss.qualcomm.com>
 <20260714-qcom-bam-dma-vmid-ext-v1-2-cef87c57b7dc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-qcom-bam-dma-vmid-ext-v1-2-cef87c57b7dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DtZmPm/+ c=1 sm=1 tr=0 ts=6a621906 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=jWf9ImQ_av2cyXA2soUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEzNCBTYWx0ZWRfX0cfoKxwl6Qly
 wfcxG77ohwWoWQISK+n37k/aSh1D5VY5sszJLVDN5aF8zfcJhgcTc9aBp5l6lbrHaqN49f/8Sou
 BRbwhZQ1Ht10ciIDM9/NGJmLHgJk+5E=
X-Proofpoint-GUID: lp3k43v8YTIgTvXoETOLxmfXlgWcHb4-
X-Proofpoint-ORIG-GUID: lp3k43v8YTIgTvXoETOLxmfXlgWcHb4-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEzNCBTYWx0ZWRfX17mMwlG8TV2V
 szVlnPlt0JJrba/+LYkJQB84XEbBFSKvQ9cjb/NmmR1QENcgomhCzm2rmeT8U3is5dpoGWlN5Eg
 MFGB9gx4xNWh9N2E0wH2q6Qknechg+Mhgvc0y6/LuSiFbsaVD1ipuWPEflqjfrfiXQeT/d0yD62
 N2ViwjIofx/C4DpuwKiWxB6EFa/imv9e1DsgomM80xBlhuAl7ag8jSYEzk2sxIWY31BgntHqVwD
 QtV9+ac4x3u/jWpgCvFEHbd/bFAQU/KVaPdZ/8otVe1QvCrbLBTsevhovdwgukYhJvLVyQFFLsl
 munEfrpSknDkbKNAprShmnrp2806xRpTVsGXnAUMGDflq/VhU9q8js/ccXMjevuIsqX5e8S0bEE
 W+WUqDTQngy4qbXmmvpSPIV5ddRMPQSXnfCGtDx7bNulREOiqYPyMPYP/HdjaIQIW31f8Dajfm4
 kmkBPe2hO9u6hToG6pA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230134

On 7/14/26 7:00 AM, Vishnu Santhosh wrote:
> On Qualcomm SoCs where the BAM is powered by a remote processor that
> enforces XPU access control (e.g. the mDSP on Shikra, VMID 43 / NAV),
> the BAM reads the descriptor FIFO as an AXI master under the remote
> execution environment. Without an SCM grant for the remote VMID, the
> first descriptor enqueue faults with an XPU violation.

[...]

> +	ret = of_property_read_u32_array(dev->of_node, "qcom,vmid",
> +					 bdev->vmids, n);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < n; i++) {
> +		if (bdev->vmids[i] == QCOM_SCM_VMID_HLOS) {
> +			dev_err(dev, "qcom,vmid must not include HLOS (%u)\n",
> +				QCOM_SCM_VMID_HLOS);
> +			return -EINVAL;
> +		}
> +	}

Please switch to device_property_ instead

[...]

> +static int bam_assign_fifo(struct bam_device *bdev, struct bam_chan *bchan)
> +{
> +	struct qcom_scm_vmperm *dst __free(kfree) = NULL;
> +	u64 src = BIT_ULL(QCOM_SCM_VMID_HLOS);
> +	int i, ret;
> +
> +	if (!bdev->num_vmids)
> +		return 0;
> +
> +	dst = kcalloc(bdev->num_vmids + 1, sizeof(*dst), GFP_KERNEL);
> +	if (!dst)
> +		return -ENOMEM;

Please reshuffle this to follow

7c4c14ad3d8c ("tee: qcomtee: mem: Fix confusing cleanup.h syntax")

Konrad
