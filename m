Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CBC3C0625
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161504; cv=none; b=CIyq+bWV9x/VgwXLvapIpVTz0Qf+LoCNKoXHpm7a6BtGjh6t23Kg6Vqam0S3QQCfbPpuxxP5yFj6YqlfhO5lRHRejULWnGUM2JVrIlg/VtRBcJoOeQbxEsXk0vfGtxEVTCnXRW4NxTjbvQHVymbSC6T1b9HJzDbn0G0RkLgWu6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161504; c=relaxed/simple;
	bh=jlEKdr4s8Waz/f9/mLTk9IYrGDA2esVA2MdqiJB+790=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ie71bc7YC/iY+c/zMlio+tSTiT5SbDSInaJcu4sCiWr343UfY0sLBOc2/dKj4aq6Hw7MlrZnERdCpRkPpiZ0ds5V9djJoRVZCcEFWrD3bARRwTIdotlxFyo8hIj1VZHHIILQSfQluhOzAQu5GDpDf+Oixc/dFY/XjPYvjDmh16E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HGjfhpLv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NMgFTFr+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HGjfhpLv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NMgFTFr+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6Jt8f1479190
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nWiqz6dpgW2o0xfDaYnccn5KCh48alyf9JL2mYExWeo=; b=HGjfhpLvbQfVvclF
	wiWPS2QKuWCaGjgeJaSiT55vzar9hwyceMc6liY6UbQo9/Jq3CFHTTrM0XRKQJA2
	CHgy9sMUr4bDJVKp3PHr7eVofITr/CnKueri0pwmNFB/XkH6UiyOyla47vpKG5iv
	iJ0lFZziWWoD8GAF+zLMWJ1PzxPI7nAIsE/YUZ/SLdltOAd+tCEpEC4DlK2g4M7Z
	KZx9HpFZlCVq0zQaKMcHgHrN5LnM7jSUOe9eaX4bdMK94z4mKs4FsHljYE4VETws
	TWVoNfD2CZiD77i21ahLt13XhJBy8DWNeVxm4g9P2XmdiZLirULOQsPsCzlnaXXi
	exbMMw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87j28g3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:11:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8c183c2eso50841021cf.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 03:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776161499; x=1776766299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nWiqz6dpgW2o0xfDaYnccn5KCh48alyf9JL2mYExWeo=;
        b=NMgFTFr+JEjiiLa3dfr4VpR8yqWsFEijrVH1kS5eMlZ9DjzZQYTP3/tTkBm5Vz9Sgu
         xrkxgza357LplbOZ8OFQbfbsJBfoQfHVmVFufm+QAYVuhIFvaOcRJTXaEpQOgv6A9gPO
         wFjYZFWq55ormiaMWmygC57vl2h8jWOSsvEuih3oRuN7OxhXvvxmNyg0SnsFn6c7is0O
         kWFOsZZIGtGrejggRIYLZLDKx9kMDphkusPCMMah4ErsaaAlJAYm0bwNNnY5yjCurJck
         miq9DxF8fb4nZz49GPpwvIGSdekEuoRR5syksvsDwiQDiXHrL85eANkHT1qjtfCqYsPi
         8UBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776161499; x=1776766299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWiqz6dpgW2o0xfDaYnccn5KCh48alyf9JL2mYExWeo=;
        b=OQdLbVn3Pm+cgqbILmPPHXNckzIjspiYnwBg6nD8g6PUIHuVBE4zb5/XTM22WsO9fQ
         wRj71Vevt2MJbdHtdT7dJ4g4GG4Fk06q2+Ksgh1DZCYUjyprcC+NubsC+qKGvpCGJehH
         jGLBKULsP8mWC3aYosW/9m7P8cptf51sS7TRRKPosxHHDurewlwQs52Ytswo1B5alOCn
         2+6BeT8Rezjt09aDz8g4ObgT8TyUG57MaaZYVF+eyE8KTLFlU4YwXov4g8rFdFhD0P43
         SKpwWdIucDrp2zWgHHq+QxbDpHZsXTE3FfMWh53EMa8N55Nnqv8qr/QZEzIuxI0Pz9Dh
         9NJA==
X-Forwarded-Encrypted: i=1; AFNElJ8ll94mohZSFDeSlDXvff1IeVEKE118x0uy6cmPFuLLvd69ceoc/Ze1rHAH/RnqeQgdijBiFfwoS6j/@vger.kernel.org
X-Gm-Message-State: AOJu0YyZAW9xBKbZegF8tp4n8MNeCkTjVRRtsSYIMyFNs8NpJ7R4Dbev
	gLVkn/HBfiNWjPWb4ZOG8c7suidOB4MstvSovwScuOi1L1sepWVPYs7ruZ+GqtDQQhR9TIdLqca
	KLo1B48l+ZLB/4TDnWiHpKKI0qa7+gPU63ZZ5w+AAqB//IfxsPRYuD5dERnLJcfs1
X-Gm-Gg: AeBDieu3P1qL+/rokgxELDqfLgy1X4/d+cY+pUQAWcfcX8T1lli2GldE0bfVxhjPci+
	rS17+RaXI9pJQZrqnznJAdN06/Q+gbS3lP5G0Lnvo4Lf8DmUgNoCn+kB148/8FDTyq9721lx9YM
	aji1+1u8pnqca4p0uvLqtK5hCs/s23A7S+TMRdj42szxOAP/mv2OVKOI19GVl3M7jfphl8+Mi5B
	RvN5xjflppjIpU8rpsGEqYxg4Va8KbBhEyJzXr5z1xvfwYIPUcYOYW687WGxjkL/M5EJ/rlXxi4
	zUL8WxtvpcbSqgfwaZziTnVcTQp7JkZPObgDWkrqqgxkwjc6Nog+VRS+WMPzOoUEErmu/PQVulp
	w5BDEV5B9vgn+CxIC/SpO3AUJ1JxRPeWX5RRTO3PgljEyXNZh9wYeK29ioKM2M6EahW3yybAX/r
	DcI290LDnOwRWIrA==
X-Received: by 2002:a05:622a:260f:b0:501:5260:51e9 with SMTP id d75a77b69052e-50dd5bfc32emr174420741cf.7.1776161498625;
        Tue, 14 Apr 2026 03:11:38 -0700 (PDT)
X-Received: by 2002:a05:622a:260f:b0:501:5260:51e9 with SMTP id d75a77b69052e-50dd5bfc32emr174420451cf.7.1776161498201;
        Tue, 14 Apr 2026 03:11:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dedef77sm392310566b.15.2026.04.14.03.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:11:37 -0700 (PDT)
Message-ID: <ba1afa27-c3d4-40a4-aa7c-6364ee6f86d9@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:11:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: qcom: kodiak: Add label properties to
 CoreSight devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
 <20260410-add-label-to-coresight-device-v1-4-d71a6759dbc2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410-add-label-to-coresight-device-v1-4-d71a6759dbc2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TIGjCjiOVcX473eDid2tl_j0GAQANWTX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5NSBTYWx0ZWRfX5fqdD6JHofEJ
 AtgxCkwaUtthdToji+HPf8HCQIzhEj4oSPl4w11eAaQuMm2eXQcozrwCVp3xMY8Wt8ocERyvpJr
 dZsK7yBYgt0y9ANyJK1+5qQuRYA7FtEnAttbGPlORy1impflIMkv7Asc5lrSEW+SWzD0Oc0/pds
 +6zFVOcWBI4etltFQNal/qJGlz0FmMZ5PSThMAXmllwlHLcv/QlhLHs57R47oLeU4HjHZxaAzfh
 nSYX35azFUeJhPmjfJMyXCnXZ/RLwAq9smk/N9oCjNKOW+EwoEEQ8od1k10YnGqwQYxr80WplDn
 6bAmw/SD1qtQTngs2m8q+z9Bny6jhM9/v8JpXIIx4N5d6RXdUjqDiy3WIBtjjLpi8HKTS8wmfKo
 d5AoBtveOPppOFOwnsLnLzZHpHvPgKOsI+AMlhQtvyLKApOxeze723lkJOzO3nhtDey0BavqNmr
 4m/Uf/c8VciAyEcL/Fw==
X-Proofpoint-ORIG-GUID: TIGjCjiOVcX473eDid2tl_j0GAQANWTX
X-Authority-Analysis: v=2.4 cv=DrpmPm/+ c=1 sm=1 tr=0 ts=69de12db cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=uGyuuOI-cJ-b_BVNecgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140095

On 4/10/26 5:08 AM, Jie Gan wrote:
> Add label properties to TPDM and CTI nodes in the kodiak device tree to
> provide human-readable identifiers for each CoreSight device. These
> labels allow userspace tools and the CoreSight framework to identify
> devices by name rather than by base address.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
