Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490853;
	b=fMloY5H/cJbSK2dxarGrewYMVIfCxxlW3wEaHH2lCBQ9l2bSOd5HQ2xHGmS9lNjgCmqG
	 NZuM058aPqUMlQsGmE4rmyDekm444zNqeeGGVBTH9+UPJtDnJY6wryKTgvMeCuB1zhTMM
	 ftc7c6TxjG1L64XlgfTZj+dSkREoY0B6jRJHjHgoCHR3xvup4rDVclgfR9O/bf3XWWQss
	 JLx9E2NszZTIfBVF3WtHnoYr8DBcYloACiagl6BrD00875nVc27RFsZiFzGPygyYvIa5x
	 8OnayrNa6qdrMkvJ1L7M9MkJ5CHlWl7qw/VX5WaYelo42VZTV5//vc5s8VG7cj/w7hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490853;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qKf18yeaPGfHDQplZJqxsRf6LqNoo+87TaDvh3Wdj9M=;
	b=HoWlpEpjVwP/k7ZFvrHW4jxF5JI7GkdCYZ1iGpQjsGfYG37RvC2Fj8fSvJ4FxjZIk6ue
	 PJ5DxLadaMpag26+tQNwLci1YZ1wyKqrezFv3kNkHe4c4GKC7YqoC5tW6egRhSxSiYjjL
	 ro9B2b+u//8ebhHYleJi/T7Eu5hpMdJq+EVcqGsQHqNRCxJhdsWnffstcTb0zM2CVcYud
	 1s5gJq93PjeOpcvmO/QvS3U4s3MCPluLIiwXcyc1hhep0ckH26HGHOtDzmkxWqIy8NmGN
	 ksAVqM65gXPFrBWgRY+s/HE25aw6utv2GcfzJfOhsNHImgYVRzqkEc6+dKoFiVWhDwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MXJW4p4q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J1ka7+F3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F49606A881
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 13:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85F49606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MXJW4p4q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J1ka7+F3
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC8s1lt4149474
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 13:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qKf18yeaPGfHDQplZJqxsRf6LqNoo+87TaDvh3Wdj9M=; b=MXJW4p4qCPwmk/Nj
	siwIg8CGYz4mbx14lK8b/4E+PnycciVQXlZJAZ8KGyrp72XmYPlT6XINOryUMlVD
	nDORnlOrglRbxPRrD8Ce94CVNek//0daPypSbJ7FrPd+8429gRKZ31NGBbZDFxDb
	CQt1dWund3Qs79JYMVks4RK/cbVJ1/caZ9wFdGJgKC1/BXyL6IZ5rat16Vwp5mnA
	Ec60Smk3bCyg/RuP0INway6N9K9eppnWti6IFvRizqfIFbF5MzmukU1O7+1fLGpe
	z5VKzpKHuTBX5By+fOfQ2f41A0wbe/foYCdXKRmuYzDkNkPVbdMbfQsP3lTXjq54
	YLAyEA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc63mdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 13:40:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c6c1e082bso15249246d6.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 05:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794490851; x=1795095651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qKf18yeaPGfHDQplZJqxsRf6LqNoo+87TaDvh3Wdj9M=;
        b=J1ka7+F3vP3etLz821DEvFnAK9yZKftEAFZobn6gK8xarwo3HbMt7m0B+d+70dk5qK
         Z5OINJiz/T3nDrt9i8OhxCnZwOQIVdTEfmOrXTpjw3C6I5Orpf6YNyr5seinCwoUvj62
         c8K5y4yUDI9DGCZNv8Dqv4MJWga5zRsyVZ0dT0rz7dbEKeJOaNZKQedhfuIRMFLzIalN
         2d8JUbLgddFR1N6WpZEregESKUBxdWucqX31tTirsSCdvMa6POcAO2+Ii0q+O0ILjpvq
         VDKReKW2BKseBzoc21rvm+lddVyxfz5DBDAmOm7c6UiuEWip6iy/7G04UZH5aSQ4hqjF
         ILOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490851; x=1795095651;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qKf18yeaPGfHDQplZJqxsRf6LqNoo+87TaDvh3Wdj9M=;
        b=Zx+rIAvtKn6rdOKolbknJw+bwFerEoQmSjPBHnWSwkJRkj8S34VOqj7UF0FMvAG6GE
         UBIK8CfHoTpc4ZIw6yAguQNMdc0FWz4mm9zqi5QHJvtMecCq4tA0DYszfZAfkNL5woDm
         A/hCM85751mT+fuP+GixJ5srbt+Cf/Gj0VtYohsGw0ty/mq8KAfYTTu829+VMPppZWtb
         T2b4QF4mgD0GwY7gtdMzyMVINIrmRQpbo5SWFaRmzFTYJYnTLUwetbyVQdUj7uwn6v/x
         MnG65KZlLWK6OzyIjcRn+MG2pStBe9J9kJOqtjQviWMyt1L9n7WcFB64hxTb1n+BvIwr
         3VAQ==
X-Forwarded-Encrypted: i=1; AL+hErHMHjZPzRe7idDPAEitsRBvNxcEt8FfbQKQR9GLgMtrnR9fl6wPrnw8p6kT7BKvho1PpRb7wi0qmZhE@vger.kernel.org
X-Gm-Message-State: APuU4Z8UhkCmrUJbvXh35kZzS2ohHBPqBOR6Ul0Qxe5ysBY3RAHSbnWl
	RhJfNogDcKFfsT1AE7opw2yoYGXBI2WqD5/pk+wTUzv7R5zA+/DWBIiLjQ8HAox/2fBefNTNR/h
	zn/ARLocfpFRTwvEdgttxdTKc4pTS2oRV/oL3HR7zGtnlfbWEl40FCwPc3aoQxHkN
X-Gm-Gg: AYBFou297tT0wqT2j08pnHxy1HX8vbCMIX7UYWoh6NA4dD+n6O0sclA1nZqPmb5E3kW
	WiwY/jK22plkl9TsfeZGe+Utc0Is44kQ2Bw2fTPuGzHyuJSUvV3gx+zuP5AW2TJtX8u1jwH+PHZ
	wN+6G2YyOunq64S1k9Ti4eDEPDCVY/gaw9TTkXmOYiDWM+hm/qw/AvnF3foM0usJZkNQBNlcwLu
	nzjD70pHgmJNejt8rA+3kaACUfmJ4Y0GXLpm5EODRcb9ClFKt4saCE0nKaU1wOxF8XzKIb3PuyL
	0OG5gR32n8whNiQ4ZIgA2ndH2V40VtMKukt4phgzb0asEkB+23x6X2rqrJylSomKjfCAUI+daHL
	BF4NnWeLtfPyShrun8q5nFc7kORKTWl0jq91Hcl+SSZ6pNfCs40LAFYBdiW+cmaKmqV9YsGKavk
	M1lrY+
X-Received: by 2002:ac8:5d8f:0:b0:535:b545:e926 with SMTP id d75a77b69052e-55956e5d8a7mr45380981cf.27.1794490850610;
        Thu, 12 Nov 2026 05:40:50 -0800 (PST)
X-Received: by 2002:ac8:5d8f:0:b0:535:b545:e926 with SMTP id d75a77b69052e-55956e5d8a7mr45380501cf.27.1794490850119;
        Thu, 12 Nov 2026 05:40:50 -0800 (PST)
Received: from [10.206.104.93] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550b942e83sm74301171cf.18.2026.11.12.05.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:40:49 -0800 (PST)
Message-ID: <dd62aee3-4f23-4904-827c-7f776c4be60a@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 19:10:38 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] iommu/of: Make OF_IOMMU depend on OF_ADDRESS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>,
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
        Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-3-5c0f72083e52@oss.qualcomm.com>
 <yvkcq3zirv5tz2amfbk52a7smbsqs7jrzdisq3qxzw6xkoxklu@rplx3gvxhcoz>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <yvkcq3zirv5tz2amfbk52a7smbsqs7jrzdisq3qxzw6xkoxklu@rplx3gvxhcoz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NWmxskriCurnvFCT0AMpAsjP7cCMKwez
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX64kqlubVwKQN
 Mo2DoPAsCmyfFKSA4hvC+qNijlxtQrpUnXcAL0f610nFapetNxya7344b4WJ2mr9qbTF15hcTog
 cFtamyEgxw0WbKjk8gzY3Wk24tL3SJX0y0b6xZK/3hd6Zd4WVpOW4DHnOay33jAq0ODrRSGzjQp
 IXyBWKa6jHpe3VU0eDkDg2oaPIYpacLoUygDicM7zGMb5rWXH4U+ocxN1lG6c9BxzbnMXiPN3+U
 39A9edmt+OdhJNpFUacM2dZHAm9bqLftTZVEhF8fTh6bTv+on9odivUjL0Q24+jvVjt3As2vOxr
 sDWLakUL3Jn/aH3qYNQg7hpkI6Mey3k/0oVEkSRhrt8/snff/MCDSzaos3a6fiHNjDYRwTffrGt
 WWg5XKKzlJeRM02H9b5Z46wH4uXthXl9PNaThQ9O6CyXHnqtLV1DJhOY8rCd/27bUVD22Vv0Ayw
 9c2RqbkmOy/FPXwvBPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX9InP4wrtPwTO
 YuQPgtg76LdG9Cwb0iti4K+fKdh3Ghh4/817+NVTPazX2drItud94aQa3rYI0YSuAnnTcXdH9W+
 fd25LHpZhPiKqWnXODGkuH+vFOBD2NQ=
X-Proofpoint-GUID: NWmxskriCurnvFCT0AMpAsjP7cCMKwez
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af5c1e3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UM6UlptfRCpVODDSDqIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120054


On 11/11/2026 6:33 PM, Dmitry Baryshkov wrote:
> On Fri, Nov 06, 2026 at 10:44:26PM +0530, Vikash Garodia wrote:
>> The OF_IOMMU code relies on OF address parsing helpers, but the
>> dependency on OF_ADDRESS is not expressed in Kconfig. As a result,
>> of_iommu.c contains CONFIG_OF_ADDRESS guards and a __maybe_unused
>> annotation to handle configurations where OF_ADDRESS is disabled.
>>
>> Make OF_IOMMU depend on OF_ADDRESS and remove the now unnecessary
>> preprocessor guards and __maybe_unused annotation.
> 
> Why? What's the problem that you are solving? Why is the current code
> bad?
> 

The commit describes the problem as "The OF_IOMMU code relies on OF 
address parsing helpers, but the dependency on OF_ADDRESS is not 
expressed in Kconfig"...and instead the code had checks for config or 
__maybe_unused for cases like sparc.

It was discussed in prior rev
https://lore.kernel.org/all/20261104160346.GD3951195-robh@kernel.org/

Regards,
Vikash
>>
>> The only architecture supporting OF without OF_ADDRESS is SPARC, which
>> does not use OF_IOMMU, so no functional change is intended.
>>
>> Suggested-by: Rob Herring <robh@kernel.org>
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   drivers/iommu/Kconfig    | 2 +-
>>   drivers/iommu/of_iommu.c | 4 +---
>>   2 files changed, 2 insertions(+), 4 deletions(-)
>>
> 

