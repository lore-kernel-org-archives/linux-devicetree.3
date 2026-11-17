Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932693;
	b=KbDuGbyipq+qLNz/LpndNsFSQgZkvjmG0sYoOymLZpixh0/7+jXSZMnt6n5ozZz1LSZL
	 V5pVBX8ILC124WXLxSei/n1b+EISFARNKfE/5PgFz3GjEbVeziD1i0Av7T9jPBbn5pZ53
	 xW1XdTjk3yneEBHYeJnYLTNoJTwnMyanw4dNafm+1XEE2qrXu1hXwWwv8G2qpJ6wR8adq
	 ZiwH5TphG2EoVat7Pv8MnPpL/ss8WM8ndZ4fmvSdCp09C+KZstnwdXZ+BDbsNneMFIOUC
	 e1QaCmgId89lDNCMuq5yZiw5anRBq1CrnnkLbrIdGJy7slaEQo2hF3BVon7q4It4kBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932693;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=T3Mhl0Vqz4AuhABF36OZze4u1FZDWFRX6ORovKiY0zQ=;
	b=DZ2lRqfArRFT3vzzxFECbF7SVNTVpuAHpg7Lt9o3JmUBFKTXoVZ5+4XM8raPRiiHBbuM
	 0kLicea/iCgkSXPueF8cPcFTbSl3pTHf7a+HS6YwGVmQd9Qb8JIzwSAD1JfOwlACoqeKn
	 bg0PUhjfyJkix3BoaQdQa+AG97WCubbSc5KW1Nk7VrKDGVX6xqXzFp5UdwEcPQVOeifsA
	 PGnUmE4Ilgli49EQA6IP6jwjW4hGZ2D2s6+ndCEHwuuNTWuh14bYMEN35T40VafZ3dgwL
	 p7gP5vByieL84Tysr/6QUFKjJl3OxYUho4p4i6cbyCCZEOyPWG1uVRGdK/gdWOHhBlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TOQ8+lCU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=druVJ1EU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC67606A334
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 16:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EC67606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TOQ8+lCU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=druVJ1EU
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQvii652082
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 16:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T3Mhl0Vqz4AuhABF36OZze4u1FZDWFRX6ORovKiY0zQ=; b=TOQ8+lCUML5ZO5h5
	H/qF60e2dPbCcKHoYulEN4H55jM5yHe+56cu9z5mHWHJvDpenV3Nx8kiTSJ6jQHp
	bhh7xA0QexaksUp3Rqqb1lIlzXljRLnYmuNw7tWpcyiizbcPqOpo2hqTwloA5g6s
	IaovTRep/vtw6UMFwr6B2eV+EAwdQm6qYPEAvPTlxQHd1lzS1wzhOfJGBzi8jOAE
	rPdLUBbDbWn9VxP2HR6YRcotGmxxAwj7RiauSqrxOxD/Vqk7a9jikwbX8PWixTMc
	cqAGMcFJYiWnFHqMIe6wY6jJAjQr1q2n9s9/tDRnM9QAfNxNVyXdUyiCFV2xKFtj
	DC+G2A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0gehartr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 16:24:52 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f26e6abe9so63276eec.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794932691; x=1795537491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T3Mhl0Vqz4AuhABF36OZze4u1FZDWFRX6ORovKiY0zQ=;
        b=druVJ1EUXl11VU1FgJPsRuECfDj1i5wVqQsWA3hOmhx1rkPDOoiuhSpvy/64BoqTyu
         A+JJNrM15WxCYs0zBYnNbrL2yI2a9WC/GItF2lhKhpUI1Qy0a7tAl47wE+jS8shdV77G
         FT7oEGtejWvfHgo9G2lbR8y2Yl40FhbuQ1d7zej50s1jSoALxbclnEf6KKDMvhnHEzdn
         BhUzSYfJyPlDDL4jf7u+6BiyHVaSe4NNcASD96LCCB8pnunxRrtRinkbdpg4u2DqVOAE
         SnxXliS/w2o7T+vyhbx8OF0RxMyJpqZFU/KMzqWzSyHRb/zrqwapd0Gyyhr0xZtJOyi/
         /udA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932691; x=1795537491;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T3Mhl0Vqz4AuhABF36OZze4u1FZDWFRX6ORovKiY0zQ=;
        b=rK6o1B78/3zRXSfSZtIscrrprOc4c8YfBfwmxN0mx3stcH3qPQA83uT46aB35FkmXk
         2fmOyaUdB0Ttvfe721QQHkj6In6uDkimuGTBRrjlAhLylc3BPuGal/CtzZZZQ977MhBz
         F+K18eKgMGRJarZRISym5fjFSBPZdReWWLLNkiErC3mhnzA+qPRXVjxSAgkYnNBk5+Rm
         zpUrQpasGyCQ0EJUPHPq2jzP52cQYUeHAsDsmKjJxv+HL9VSSx7d6+Lg5XRQbCLPJ16o
         5mRsq0Sa4xyjWEvpNmgNGVC6bohd0fOLiniODwuw1/42JRQObAENDlmXmO7KblszXlqM
         CeZA==
X-Forwarded-Encrypted: i=1; AL+hErGHq5F/14JRGeGwSnVd+/GcAGdYjU1q+EOj1BU2ll1W4uLy7IxTPcchE1rVPuRC2j2HqDV4o+ycIktD@vger.kernel.org
X-Gm-Message-State: APuU4Z9mlSCKrMJtU5dD/lFwfSMRPXO3wwGhZbtv3hYzxdW7GQf+enBv
	xphnad3znS++Q7FPbUbjDGlcLp7G2FY9JYR2kalBxPOn8XcP/qc5XT0Xwb5rm2lcPBd29kmZUMd
	W+YwyyiB9xI1lFYzprLbgRIZs1KK539BZajUwRTkZhjshBL7Xo1QTS9PjxrR9u3Jd
X-Gm-Gg: AZFdTZdWmwdWm5PZov6kr4Ct3zu4bLRcNHvQqYEHxC5BWWvSAH56KtpiJ9C03o15aQO
	QfLgzN2tKJaryn2PbB5zYIhKiF6892ZVoVLKFDMVhUslQgF8b67tWvsPdvJ13/nxzVXxuI/mosV
	8ZZlC2lhp38zJkTP2gA5TmTeWY9ddwfV2G9DxwXOPs8Uj3jEOYNbHvjG3+FLzp7/j5AbspzgMYD
	LMlw+iQc1/ksmE9i0HblETA0ZE3YF0E7jNOIvKLpX4/B8BEErAruk/VcWvrBLq0OIOuVcvVKauX
	9KPmy3ARIqKydhODolHZpk1VIqcr6ewzyuymFhozxQdVSZMwJiaGyrufDTVLxK8VMG8KVP5M+2t
	8ggfxYwXNbo/+IqJbwAH8Pl9wD+oCCylPbDVi+fawaE6382ZFKk7Bo+gqUJ+20BM=
X-Received: by 2002:a05:7301:d189:b0:376:2ddd:2ab1 with SMTP id 5a478bee46e88-37963660405mr14266846eec.4.1794932690938;
        Tue, 17 Nov 2026 08:24:50 -0800 (PST)
X-Received: by 2002:a05:7301:d189:b0:376:2ddd:2ab1 with SMTP id 5a478bee46e88-37963660405mr14266785eec.4.1794932690165;
        Tue, 17 Nov 2026 08:24:50 -0800 (PST)
Received: from [192.168.0.6] ([183.83.140.41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm48642584eec.23.2026.11.17.08.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 08:24:49 -0800 (PST)
Message-ID: <ce05d74a-58d1-f605-44c1-ceb9b9d8b9d4@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 21:54:39 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 4/5] iommu/of: Require reg for iommu-addresses
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Joerg Roedel
 <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        virtualization@lists.linux.dev, devicetree@vger.kernel.org,
        kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-4-5c0f72083e52@oss.qualcomm.com>
 <3e4b6491-2b58-4b9c-90ad-0912f47cb217@kernel.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <3e4b6491-2b58-4b9c-90ad-0912f47cb217@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OVrRu89rL08C0JWA6PK5tNNcakFFo_vY
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afc7fd4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=jbSCbZcLpKDW+DqD08IedQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xx2vz8YcUDPT77_BzWYA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: OVrRu89rL08C0JWA6PK5tNNcakFFo_vY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2NSBTYWx0ZWRfXwkf5Z3i33VNc
 mulXNW4YVkz4uT/a06czayCxNV1XUCpDYZszCYvNx7eTosTJIEuymTHcW9aD9oTBfcR12qv92jL
 z2UBgd5W2nc7GcIcsHjFa2pPB3Q97G4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2NSBTYWx0ZWRfXwPkV38Y2fEYF
 9LIB2u5HS1g7OB4jobdpxSr654e7PCS3VBIJXBp6vlZd8AKuYU6Qv3fYcuiOAMttQbI+pE8eIpb
 mybeIFf3D0S8s3zK+sdG5x/I1y/D5Xw5lQIjkqIPq3A3sBXVgFR41ln2x4BPdw/DFxVIZtD239U
 IumNXKFXLHvB5896qG5oiMQa9oU2n/ffUeYxReocwkTEPNWQ3mt+WUevddyTn9V8pFllwnbqmhH
 Z5gHpryReDPbSQjpJeM6pZlX4LLbAkY0qIFvWvjXYcVgx61ZWEQdEWjX7UzXa6scLieOcWH6mdv
 lRPNs7i4AVB7bVdflrzex9+NYuZ/7tG0SPgUkWGYqP9biwnks7cC4seylBEyhzd52ijG2nQ2afx
 C9YyHWdh7Cpq9Fc1QXF57VbrVsYVDY3+zwOm0XICqRBlBUi+Bl8PPDUD0FeEM/j7rEpw7xnm9jR
 TgROxi+yfFCsvjUZuoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170065

Hi Krzysztof,

Thanks for review.

On 11/13/2026 6:41 PM, Krzysztof Kozlowski wrote:
> On 06/11/2026 18:14, Vikash Garodia wrote:
>> The "iommu-addresses" property describes an identity 1:1 mapping between
>> an IOVA range and the physical memory specified by "reg" in the same
>> reserved-memory node. Without "reg", there is no physical memory to map.
> This looks like ABI break.

The original discussion was to avoid keeping iommu-addresses in the
reserved-memory, if not backed by reg. In such cases, it is more meaningful
to move that entry to corresponding device node.
Given this direction, the schema was defined accordingly and the code is now
updated to match the dt-schema. At least on Linux, I do not see any client
using iommu-addresses without reg.

>
>> The DT schema now requires "reg" whenever "iommu-addresses" is present.
>> Align the kernel implementation with this requirement.
>> https://github.com/devicetree-org/dt-schema/pull/207
>>
>> An identity mapping requires matching IOVA and "reg" ranges. Reject
>> mismatched ranges and report an error.
>>
>> Suggested-by: Rob Herring <robh@kernel.org>
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>  drivers/iommu/of_iommu.c | 32 +++++++++++++++-----------------
>>  1 file changed, 15 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
>> index 6675fc900e6c2d55b34c61dc9effaeb48e24f18f..00b02c19f27e195fc36c4bc1d91253255147c9ab 100644
>> --- a/drivers/iommu/of_iommu.c
>> +++ b/drivers/iommu/of_iommu.c
>> @@ -174,19 +174,12 @@ iommu_resv_region_get_type(struct device *dev,
>>  {
>>  	phys_addr_t end = start + length - 1;
>>  
>> -	/*
>> -	 * IOMMU regions without an associated physical region cannot be
>> -	 * mapped and are simply reservations.
>> -	 */
>> -	if (phys->start >= phys->end)
>> -		return IOMMU_RESV_RESERVED;
>> -
>>  	/* may be IOMMU_RESV_DIRECT_RELAXABLE for certain cases */
>>  	if (start == phys->start && end == phys->end)
>>  		return IOMMU_RESV_DIRECT;
>>  
>> -	dev_warn(dev, "treating non-direct mapping [%pr] -> [%pap-%pap] as reservation\n", phys,
>> -		 &start, &end);
>> +	dev_err(dev, "non-direct mapping [%pr] -> [%pap-%pap] is not supported\n", phys,
>> +		&start, &end);
>>  	return IOMMU_RESV_RESERVED;
>>  }
>>  
>> @@ -211,12 +204,14 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
>>  		struct resource phys;
>>  		int size;
>>  
>> -		memset(&phys, 0, sizeof(phys));
>> +		maps = of_get_property(it.node, "iommu-addresses", &size);
>> +		if (!maps)
>> +			continue;
>>  
>>  		/*
>> -		 * The "reg" property is optional and can be omitted by reserved-memory regions
>> -		 * that represent reservations in the IOVA space, which are regions that should
>> -		 * not be mapped.
>> +		 * "iommu-addresses" must be used in combination with a "reg" that provides
>> +		 * the physical address and size of this memory region, for an identity 1:1
>> +		 * IOVA mapping to that physical memory.
>>  		 */
>>  		if (of_property_present(it.node, "reg")) {
>>  			err = of_address_to_resource(it.node, 0, &phys);
>> @@ -225,11 +220,11 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
>>  					it.node, err);
>>  				continue;
>>  			}
>> -		}
>> -
>> -		maps = of_get_property(it.node, "iommu-addresses", &size);
>> -		if (!maps)
> I miss the point why you are moving this part. Irrespective to actual
> ABI break, why do you nee to check for iommu-addresses before?

It is more optimal to check for iommu-addresses and then read the reg. On the
contrary, earlier reg is read irrespective of iommu-addresses is present or
not. So in a way reading iommu-addresses first would ensure that reg is read
only if iommu-addresses is present.

Regards,
Vishnu Reddy

>
>
> Best regards,
> Krzysztof
