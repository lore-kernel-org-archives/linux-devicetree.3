Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120273FE669
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 16:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781193677; cv=none; b=oHVtu5HxyJ/EUGVuh8HNKQaJ/FMx6Suj0xDB6co28+WAdSG9xghsRTesNliwgBOVe//CAqAHLii4FmYxP00hko9rcwb9qsgG+gDnjykfXEYDl6dCqCIZvllxZCqHwuQnl+sapYpfcnvs0M1qbLgjo3jw7gRxtCA4KJWwFdGAuJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781193677; c=relaxed/simple;
	bh=2FchrGodbYv/9qY2WYL8NeNKXHxKW64euQNt/BW9MZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FSgA04pKwI3niHcUv695swLRO4a3uTG570Ikl7m3/oMhvBUhxml2Bnm/N+UyZ3EhoI9k4AgClzVyHOnRhvEc2+x/2uwvXtAp09wZSFMoHZtQhFueJNr2jZZjTKY1THdxZ7cKpYsYbB8qeE5M49o0GuLisxe7ubVVXYkQEMLAStQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e17C5s12; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z8AtdzI4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e17C5s12";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z8AtdzI4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BErw0Z975480
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 16:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mpCQ9BJ8wTuI3Z6G1W3wDVgURRxmxkiof9xlWmEBr6I=; b=e17C5s12Z6qBA7eG
	IoZ/gx0NcwV/eosnyDeRMq9VGCfYcyN1Cpnm0tMFIarUYJmFrzI8xvCbZXUKUzdU
	rsuU9mH7WRtjSisvrTCt6E+bxVVe7HPqdRTRrVCXQHFVdytqiSAWh3SPq+75tUcl
	bzlJ79JHea4epdfw/T7oRLI4gjdyRFwF6Plu0V2dttgHFJ5unyjbUPGjohO6bnn6
	U7tyqShWbQ5H8ayUyXEe9PLMw7ndTvWT6cZ4dBIWHd1pzQp3zukTVdi7ftDvrwuw
	Tq4A1X0cR6oqPBKKKM00O/MFCfbhq4q9Hlrfiw7qlM7dutr9hOGz+la9IGjVCPr0
	by359g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6smbf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 16:01:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2beff6b6e74so83084045ad.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781193674; x=1781798474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mpCQ9BJ8wTuI3Z6G1W3wDVgURRxmxkiof9xlWmEBr6I=;
        b=Z8AtdzI4gRVbuPErnmNASk2AISZgydptjDa51fFR7WImrUtNzI0QrJnNf5Rlh00GKu
         OUq3LbPNl/PYsy+pdO+JEA3y5RUd2h/u465HaP51rwy2qcOdcGHjyh80gfsFOLlxUOoR
         CXh0PTszS6u1LU8LtY189f89id0xRuEcC2R2/UcwyrS5MDda/zoFz7gTdKeSq8KqHXJh
         s4Kw4tzRL3UAJ4yjQcKJrB79b/Trgy1pqkH0oa5BDyT5FwWvhisrmNPkoesfAJX9Fwml
         IljWhpY1px7nN5dJh0Fmd39N/lH63r5RLYqcE4yBS3BZ/y6snp14qX/4e/+/MiFo5kNv
         uHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781193674; x=1781798474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mpCQ9BJ8wTuI3Z6G1W3wDVgURRxmxkiof9xlWmEBr6I=;
        b=pcQu8bVv8k9I6/mFulhsZqXf08hVsBkzsIpF//baob3YM7FSWhbaaHvs2PUD6akeO6
         sQPsWHhgKO/YzQmp0xhRS82v4TdEvpLzHSDdsVMfFnWDzkJN6XvkKFH6g+DyrC9E1qq8
         EQGXcQhiwr37s7lsSejI0a1AZG4aDSUnAesG72d4qSxELAjCMSyVx9h7MkJaqLCPw5G4
         348hP++HQur2Q6oE0ST1zsw//ZwoKl0MMY6h53w0rDsIhzhg17fEGzO/4tKgJmmBUDlY
         lV4enUBGyRDP2OwlT3fSXsNcAhO+KmU2qlDek7/d8zY3FsZs12AgefIrauiD+odZxCVN
         Wbfg==
X-Forwarded-Encrypted: i=1; AFNElJ8s2EVxBZ03aUYvSxYSiVtskUxrxNO0N2d1JZfp53byMXHrGMJSVmiew8enkiUg4ZqetGkeYwfk3xFu@vger.kernel.org
X-Gm-Message-State: AOJu0YzuopiHbQmvgzhGZBrIL7sqTfp5/I723mIT640SzO/LSNc0kyJV
	dSbdwoRG61g1q+rwADIVMXq0m1uxZxj7/Ms7BiSATYYJatmXCsr9FdjzTM55VWSwW6FDaLDtZ4G
	mEOt5AhmgpAgBfpsRLtwYarK8IHdbsOTH8W6t/iLkQpEoMCfLxBzBwlvIXtEsKiB9
X-Gm-Gg: Acq92OEuByQInPK5UnKlFj8/Iex/pVHqfjD4kO+SxgADnKgnbbFl94d9NuUK00jNlSg
	fobfXU077O+87sMuahV2CgAOK4Z5Qp2WbA+/jczx6Ux2uC/WJJB809GfQnFOwNzjksfCFWRXniv
	DIbL9ekOOXWVkmeAzPQIZug3AfK55X+DN6pOzVJnh4XTGBhW7QPbU/VwCoR7plo0aNrDqZySCJs
	9kGfeoqlAW93vx+2OM8P2neFgp79RM7Frf3vURXOGBN/4W53hGQT4kmyDm6VDG0V/wHkr00DQvO
	fB69ewikuRYbxpduTAzY6DeiSUvvRB+RAVFvjG2/8E7RZeW3FeLhEkDCISd8J2At6lw0uGbfs4j
	57c/BA7qXDyobQRH/0MTPghp523wvFi0gMDjlT5slunQLRezoZoRO8uO1Jw==
X-Received: by 2002:a17:902:eccf:b0:2bf:e5c:d90b with SMTP id d9443c01a7336-2c2f3541affmr37502605ad.32.1781193673452;
        Thu, 11 Jun 2026 09:01:13 -0700 (PDT)
X-Received: by 2002:a17:902:eccf:b0:2bf:e5c:d90b with SMTP id d9443c01a7336-2c2f3541affmr37501885ad.32.1781193672779;
        Thu, 11 Jun 2026 09:01:12 -0700 (PDT)
Received: from [192.168.0.116] ([124.123.151.85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8429fsm348802935ad.18.2026.06.11.09.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 09:01:11 -0700 (PDT)
Message-ID: <17bfa853-d0a6-4f83-a164-a17fb02f67a6@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 21:31:06 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add BAM-DMUX support
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com
References: <20260611-qcom-shikra-dts-bam-dmux-v1-1-43d0b43d41ef@oss.qualcomm.com>
 <aip3_fyE8tMtJZIW@linaro.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <aip3_fyE8tMtJZIW@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Cchz_uwn86si_JtPSyNKRWv6aSmlEBuk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE2MCBTYWx0ZWRfX6n6VtVMP9ioW
 LE7F1MSIjBYxEOR1TQ1RKuXTHYJt3tPzdTTj1KuYm6zW5nym6FAYp6eJEORRjfszJOfXz4jYi7I
 lKZkN7K/GMd1a4TK+Ur77nnMIjI/aM8=
X-Proofpoint-ORIG-GUID: Cchz_uwn86si_JtPSyNKRWv6aSmlEBuk
X-Authority-Analysis: v=2.4 cv=Kux9H2WN c=1 sm=1 tr=0 ts=6a2adbca cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ziBI+Y3eO/H+UwYWWny9Hg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=O-mRS134qTPuZNobniAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE2MCBTYWx0ZWRfX0iSFmPb23mXs
 UUhGeH/z6pCMVNnwn8Xia/rMuSnYf6HT93aGchfy7tnl+lp76GaAAfUsVY8DSt2M5c6tIkeFTVp
 uPs4n2Pi1P+VW1M9Y9l4F5nDRB5scFXQeBPdhq/1AMtV1xENOXiVFqey/zODa1quXvyC/OdgIho
 ADKyCg8woeZAJdYgK3vjiTlGUch2f7aZ5OplDIWmg9CMHFlSN3vG4wx3qHihlSZX65Dh6kBwRO9
 LEZIkne8O16NC5T9le0AVXGYl7yztRj4JkxDHCxY3/FGSOH556HIk6q2Afr4Ah1ahccoi/ceSv0
 BnbK/PTy24wOCRa48heU5L0ICV51yF3F77L8KFZaHV6qQoRzg2oH4nhcrD7MM3I4yMkPqE2dmc+
 dofqjQXVlCnydH8dwdq4XcL1vNvtwho4dncIPklN6vzuoukQzAs/pOSe+7HaDcGjUTeKDst6c1L
 EuUyV6AqulZT7AsCV0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_03,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110160

On 11-06-2026 02:25 pm, Stephan Gerhold wrote:
> On Thu, Jun 11, 2026 at 02:11:59PM +0530, Vishnu Santhosh wrote:
>> +	bam_dmux: bam-dmux {
>> +		compatible = "qcom,bam-dmux";
>> +
>> +		interrupts-extended = <&modem_smsm 1 IRQ_TYPE_EDGE_BOTH>,
>> +				      <&modem_smsm 11 IRQ_TYPE_EDGE_BOTH>;
>> +		interrupt-names = "pc",
>> +				  "pc-ack";
>> +
>> +		qcom,smem-states = <&apps_smsm 1>,
>> +				   <&apps_smsm 11>;
>> +		qcom,smem-state-names = "pc",
>> +					"pc-ack";
>> +
>> +		dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
>> +		dma-names = "tx", "rx";
>> +	};
> This should be a child node of the modem remoteproc. See msm8916.dtsi
> for example.

Thanks for the context! We actually referenced msm8916.dtsi during 
bring-up and initially placed bam-dmux as a
remoteproc child. We then hit the issue that the driver was not probing 
at all. After some digging, we realized
that qcom_q6v5_mss.c (used by msm8916) explicitly calls 
of_platform_device_create() for its qcom,bam-dmux child,
but qcom_q6v5_pas.c which Shikra uses has no such logic, so the platform 
device was never created.

There was a prior attempt to fix this generically by adding 
of_platform_populate() to qcom_q6v5.c
(https://lore.kernel.org/all/20251223123227.1317244-3-gaurav.kohli@oss.qualcomm.com/), 
but it was blocked
because GLINK/SMD edge child nodes would also get spurious platform 
devices registered for them.
That series remains unresolved at v1.

Since your driver already manages modem lifecycle independently via SMSM 
state bits without remoteproc dependency,
we moved it to the root level where of_platform_populate() picks it up 
at boot, and everything worked.

Would love to get your suggestion on whether this approach is welcomed, 
since it needs zero driver changes.

Thanks,
Vishnu

