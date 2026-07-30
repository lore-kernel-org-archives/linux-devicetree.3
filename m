Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5B0400E1A
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785408206; cv=none; b=Qp1i2Y3auW0GItczyPY3t7K2MQUs5nbS//Bepusv4zhlZmymI+CeDmVIt/H+PIg88fEaUpHi4GNdEvkR34Mu5cqnslLppvQlcNE3EPSo/TQZCUWOTE9YWGIRlKJC/DJXitZEGPyZYUpO3/j5rTcBuyqpZsxBGEzAzuliGX3ng6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785408206; c=relaxed/simple;
	bh=fD/zwFkaswgd+l4r49TD230WvGaCcdIL3+nF3FMB5r0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RCiUuBOPPbifiOvQ1OrDU+jLKkBJlyCtHD00SLq5lEPE/jmqK+XLglj1jEoWH7rghfap/90q29TaMYR1lu4uMGI4ztgqPrhUN2f1TDePvgwADTQgD2mfIDqxTgctezK0OeiU3XsnLJNAhss7h0jT4aQvyieSRVskrUNtgZGqOHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z4XhgnlP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpgxYlmK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z4XhgnlP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpgxYlmK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UA2NbQ419013
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ptjyGCcSV48Y6wAMqJI+LYgqhlgd45Uqijkmu4smqMo=; b=Z4XhgnlPwLDw70SW
	Hvtx6Oubp+NQMkfN/LK+Ij1UoLwUCXqR7tSZbTVLtg4EkA4Rf2Et7WKF5oCHRgSL
	QDRZAObdt/Dpu8upC51KJALRVDbxQlO+kWCUEwNrHB3/2R/9OVFHd+TAPBwxWUiZ
	4Nji23zHWrVmWHGZxvJ98fNvRv8U2UWShyPLhN3euKiqTIQOQgc6jzJiwdL+MYK7
	Shh3JTWKl7r27B1J/y7DKIhr13Q8NGYL0LE4/dPE9HTDgG6mJvNzvzRwFGy7RixW
	bIq3E7wqGIkmNadZv5Tdz1VezqJve5an87CZA5P45fv2p0vN/57cX/9YcnNFaYwz
	/e+QVQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3hrgfjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:43:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8487ed7f7beso2152561b3a.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 03:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785408203; x=1786013003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ptjyGCcSV48Y6wAMqJI+LYgqhlgd45Uqijkmu4smqMo=;
        b=RpgxYlmK4vhaxFKvnSCx48m3XgaAdI0VdDNcEgXCmStfSvbEbjuWhS/ed2X9qtWc2x
         mC2MiAGk6l1r71JqYyahNHcw1OW1nMsmU62Uc7GLJ8OUIzsVuHzxCEiRq2nRLpobrYju
         7PzNZ6wVtuhH8w1dMcubAaOW7EEyzBpxJZEWYE9ADyv1v2LJEu2mY6zRg4uttWzjczvf
         XhxWJYvr8PKyxbvJpjjSCadB2yWaRddGG/u8LA9fFB1oNGQpauneNFhj/oZi2HfMv5YS
         JYphH/0JW9ZfScP/M2pquxmVstNPWj95YrFMwk7+cTTK9JBlQqnNivjeJewWpn3P89Y+
         0nMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785408203; x=1786013003;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ptjyGCcSV48Y6wAMqJI+LYgqhlgd45Uqijkmu4smqMo=;
        b=JxeHbJ02qtGVM5QmE7DPW1dadTrJYU9bzGINaQkAUts9k+nzZzlmb1BmTA+nZ3VnD8
         wxahkbnlEQsCIpQOroE6csXU8UiKo/MTQyve71zlfKaZkAPMlH5+Jlk8yVR/YQ8WlJeQ
         4iE2MJm/SY+1JwgMcfSVwjKiOP+ZvxfGo3RMrHklEd6LCs/S3suDxt0J9BdrgsZK0nwp
         aMe7bU1dwVxcoiIQ48YiFeQ8gsLkjh6X9IlEo/NbTOt1Vdrhqw/P9YP9k2pcDpjJ3QL+
         bQ/hVOwuNotwF9TqnO4/zrspSKmIGySfNotqrhAjOl8jEBxtJdqDcIlSQsgauCLqYu2j
         ugYg==
X-Forwarded-Encrypted: i=1; AHgh+RqOY5jWcnlDr984ziJ18mVERAIr9GaXVCPUa+PtKY2gA1Shj233wzmoCTsjLm+ekmi5DSfoOmYLXGFt@vger.kernel.org
X-Gm-Message-State: AOJu0Ywejz4gajrytBj7QLOPmIH1QzSgOlP3FhFHozz1qp52qYrV12kC
	V7TlT7VK61pSG4aEZ6QJU/xtoJ+m/ZoeXCkE+aHEeX5C1thvvqV5wL5dTlEC8wSC9FulXwDXih6
	WU9FmuqIbQAAOwL3IVr2U9/wSBsVpzStJJ+taRqOrIFTbuNkjtKWWKMaEaAZDDf8j
X-Gm-Gg: AR+sD12Shv6KE4iS+PvrfMgdLD/EbO8Ei+TA8h1Qrsxut9sYVYyozx80HkdbuNdzjdb
	FOI/wzUMtFVWFu1lmj5pzQ0p3fXx1vVm2oaTWmsoyp6Jg/4f2i6QsDMUkZ+JPxDVIy+L5sdus1b
	wKApxVmkneSolXvolRquGQVKXuUu+SE+VjXAnx6LLiGOv0oCln5eZHus57c5BTV26xCyWIufQ3N
	rpWfmyXmsCPiPjbN8Knt9YbSo6OurLWITjXcISVLV/k1Pxb8dpEx3Vf6QUJZnjZuaVWQ4i4NcXk
	KLjM21O92mr8MjaOstwykWW8Zw2BY60O1FSJNsBzjDZFWxtq6RV0mCQhOarqLeVuhCzTvNBHNt4
	kRERTWt1pAvev6NE2sWgwpKogJcgx//zeFfoYL85+Yqve5RmFkXKnG3M1tio8tb7K/3i8xWXmMC
	P1zIW6akld66vhHQhdtVjtKMj62ec=
X-Received: by 2002:a05:6a00:428c:b0:845:e8b5:8c49 with SMTP id d2e1a72fcca58-84ebc1ee580mr2019492b3a.10.1785408203338;
        Thu, 30 Jul 2026 03:43:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:428c:b0:845:e8b5:8c49 with SMTP id d2e1a72fcca58-84ebc1ee580mr2019476b3a.10.1785408202929;
        Thu, 30 Jul 2026 03:43:22 -0700 (PDT)
Received: from [10.149.81.110] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea037565csm2858151b3a.46.2026.07.30.03.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 03:43:22 -0700 (PDT)
Message-ID: <bfd403ae-97bb-4928-90ad-48e7e49e01a8@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 16:13:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] arm64: dts: qcom: Add Kalambo SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com>
 <20260727-b4-kalambo-crd-v3-2-25280faceece@oss.qualcomm.com>
 <20fd4118-4c69-48fa-838d-befc041cb399@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20fd4118-4c69-48fa-838d-befc041cb399@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ifk_hEeGyuPZ3D0AYXwGgxUGtwgLRkEU
X-Proofpoint-ORIG-GUID: ifk_hEeGyuPZ3D0AYXwGgxUGtwgLRkEU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA4MCBTYWx0ZWRfXySSj2rI4U9zw
 a0CCNKFyLzqIEYPHi0SvazBYF2SW7t9nt742DNNSzUgHSHxEOy6c/6fBesqg1hJ5FpYtYMInMe8
 TVfG+0io374ZVFQZvNx+ojLeYCvlsyY5af/9viYQAORCgr7Y6hr6OL1vicMuNYwRbj+zUp7YTe3
 8A/Tuqx3ul4Cd7YCPovFflzVNBqH8qzBrae8Omlpbn6BqcV8KNJWA039zapyo9t181nnMrm8X8/
 yFtvB5ydNoMP/+ahIMiyqC+mMO+JCSXSnPFxNg1+DONI2DSWPfeMY64TDbroxIR8WsuJVV1Z169
 ZH73DZ9QafncidIUOx3jkUVoLtgwpd/8eIk7MigU2+4GqYELe3K9ZKHeQOAC2cBCJcDktlBh3Wc
 1cpVOVcVOgpAg59mkGjUaQf+DqDd9INKhJCXbylLv6rk3a4GDxtBs9ZFmNPDXYUcJgt1JpUejnc
 K9hq2PYYYFFf7UeCm4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA4MCBTYWx0ZWRfXw082MARcFCVD
 u/K/U/gZY71S8oCQCRrg91JTJRFqDNdH5KywbVAv+nu6RTH6dIvD52qHsYW+Tcn4fam9bCT1Z0C
 DGoK/0GDbfuz7Wh4GvtDlHmZYHUF6wI=
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=6a6b2acc cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8C-iNrzhTtLVDKYCdeAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300080



On 7/29/2026 7:39 PM, Konrad Dybcio wrote:
> On 7/27/26 2:51 PM, Gopikrishna Garmidi wrote:
>> Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
>> with CPU cluster 0 removed, leaving it with just cluster 1 (cpu6-cpu11).
>>
>> The surviving cluster is re-added to the cpu-map as cluster0, since the
>> kernel stops scanning at the first missing clusterN index. cpu6-cpu11
>> are reassigned to SCMI performance domain 0, as domain 1 is no longer
>> present.
>>
>> Kalambo uses PDP1 whose tx shmem (lpri1) sits at offset 0x200 within
>> imem, vs 0x180 on Glymur (PDP0). This pushes the tx region end to
>> 0x380, requiring an imem size override. The rx shmem (lpri0) stays at
>> offset 0x0. The PDP mailbox addresses are overridden to match the
>> Kalambo SCP firmware.
>>
>> Add labels to the cpus and cpu-map nodes in Glymur to allow derived
>> SoCs to delete and redefine the cpu-map entirely.
>>
>> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>> ---
> 
> I now noticed you'll also need to override the PDC ranges. I sent
> a fixup for glymur/mahua (the map is common for the two), but kalambo
> is different.
> 

Hi konrad,

Thanks. Kalambo only differs in one spot: pins 109/110 are unconnected,
so <108 619 22> splits into:

	<108 619 1>,
	<111 622 19>,

Everything else matches the Glymur values. Will add in v3.

Thanks,
Gopikrishna

