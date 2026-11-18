Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999964;
	b=DH90UX6/c2VSCV4UqwBksDznmWMhmZpsPvwySx5SUSJMY1CkhFDnp8YkGJQjeT0r3zSd
	 m2BthpoXJlpwJ/Crafw7YfBpNuz2q7P2JiHmYwFrGqXAv9r5biPh4kf5yXJqFcuq38s9k
	 RClsKafd+fHaznGAJJi9yg+Kn02n002ua63aDrE31UZ46Kv9Nn3Fn4mLRQTBIScW3EDkh
	 x23oQgn1Lof984XmBti9jGJYE05Ii9Bv8waR4E8yP+ylCUFOSLgVPSJF4f4oLVCNHsRgY
	 TqENz+JkNFpg4lHnvaVc5fc/GpRJCHwlE/wUO28bu28VQsc0Al5feKGtr2GVyLPSqWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999964;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W6pd7EU4elLsb2y8Q71KyuCpGffI4PpHwT4j0EhTH1c=;
	b=lO8t+wQlAF2GvKhkMOSggcnYBzwqzx/Ptm1zj1oKpiFhfxqknsvHxj/i1slbOCnM7rnG
	 QNr0jWa4wUlSXqPO1UdpsIdsb6lL7TxYQOVjLSxvvsOR6JG3WKk2npSSshVPpTi4rpjfC
	 BU+KvUGJ/VH6jOVuBemPxt5m31V3SQ/YbSnt/sMNw4cNbo7RBlULiHmNB397WZU2Ttz0a
	 0yik1q3dNHi7z+FS3X0M/QrfoiijQFhNzj2JfNax6y82a1LQ6qfLD1gGWhKKYahT42RS8
	 0UmoMgXl34oeoJPbQQLl7GH0Xi5Jap6TaZXVhyd/mZLDf+jydYljOmRBrv+btkFEGgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fzSS0hsU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d37F2i1H;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A1B606A320
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 11:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4A1B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fzSS0hsU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d37F2i1H
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9kRmZ1736103
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 11:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W6pd7EU4elLsb2y8Q71KyuCpGffI4PpHwT4j0EhTH1c=; b=fzSS0hsUC/3DwuAb
	iryzlyAcSdMaZ7NzmnCtdiEVP4IjjIanKOLfyiBq4s/Y8LRRqEFU0Gg/BbAc7/zB
	cdNEnPM1eMRw6gGkNHEVNosnDPqp16tznAfp5rNon3mXH6QsMpvoXqKVEXgelTZK
	TB/bdjNvFEPKbr0e9R1AXiLvPxis2kAPXwEVtMzLWBZoN3IfEhOdGu5b1VKVF9t8
	7MknCtyhgs/Q2w5BLhvsDXIa2cXXf6rppoNiOKZ2xX4TTRTvE4pFW6yhqGAWXF8G
	h4KAo1oKxy668MOpN25r4FFjWhOR8PRgV9xFBDN9gZVaSJEZKMYJUiFtARUDGHv1
	f5renQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvbaq5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 11:06:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so522799a12.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794999962; x=1795604762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6pd7EU4elLsb2y8Q71KyuCpGffI4PpHwT4j0EhTH1c=;
        b=d37F2i1HHN4vWbrq78O4WNI6zcuP6S1Xb4+VhjxCCFalCGh9l7SOokKK7XG+Eu1CTB
         QX45CcEYS4tmo8HLXhBIRsyKfP2A+u755QM+ArHNizSR0qAD2UpHIxjs48TtOWMlQG9P
         PUu1bY1H2XD+CNUxqSoYHkOhCq/Qa/li1qgAj6jqfvoMbSXX4CrYihdFeNXy/u2OHFAC
         aj1oZp3264ENhok3d3LEd1/1dSY8DtjhwO6AkkMXl+9Wh2cEgHPRZ4622znA5sE4HIE7
         k1xYoLCCVsrIiQX4UpQrr7VbVu7ij2K0Hwzzi5OsX9rKX/p2i5miHT94tP5x9HeMKIm6
         HDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999962; x=1795604762;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W6pd7EU4elLsb2y8Q71KyuCpGffI4PpHwT4j0EhTH1c=;
        b=iXdVd0tpukAYuU+waX/O8h871vp4oAwagzNPKN8RFiXnYIRjDXIhAK5/6701mT9IlV
         wdM4zTUr3gXZFfUDmfsoGteJtefqWJHShgZxSVTafq/bc2i12ahihj/8yqryy2XDO9s+
         bzOg+A1ovQUl8MPufBT6a9s6KoypTmoOqIZrWxlynaR1i05RH93JpBm8TYNcSM0yV/X0
         SWaqm7L2UOhS3LuDkRtkmjd1ierY865p6t7csS1rQSzKfc55B7ZTVoq5ALETkvDk63HK
         VkbUJILxbAJEc5/peY39i7645RGDWkiVgcbrlL+kFXuLDdNywbHRWcKY2/h+wiALtB9N
         2Zjw==
X-Forwarded-Encrypted: i=1; AL+hErHmwoyKC4boS35iebEcKHMnPrOSUwAhzYnZppsibKwnVvXU+Ky1fHGPiRoEvQaWeJ3rAkYCWh2NYC9J@vger.kernel.org
X-Gm-Message-State: APuU4Z+4vpL6e+OmpARMCML45mhyu4Inl3p+VMKAtTL8y3r+5lgAhMO1
	6HW94V81TjX73l3iC2mrTmdQygR2zKFG002wZD1+Iy73dpZqo6FCGXHVJ3vRQ9RPtWNgsuF0Jqv
	bR0LlAmiEw0GB8Fjv7UmLEWV2Ntlh61Wg1onneEAt1+Qw9XuCVn/adY9sus/k0EyX
X-Gm-Gg: AYBFou1M3Zgu97OCoz7Yc+oOIqTaKDVkDxr9P8Uvk8/jr+Sy1rH33zCpV4qgXZSgy4S
	pKKzD+EthN8OrCT3CSdX60TY8HYRsVxNJCS9/4ZQ9Ux0B8kT0LgsPHgbBq9JsunhL8jXzyVJZhO
	SDRYRK6lvoKVPkPNQSvdnqMa9drOKVR0w1RaWUV2yKEIXWnr/LOVeEjimbko5JiovfetZ9ydfhy
	49V5IFtYfqy6GIO8Zks8gampeIPztvA8OxFgXkV1gEk6muK3G28j/Yi04E9HsT1p0LDiEog2rOi
	EUdYZ3JhgREUxgbDOXkQtNX78kAZyxn38XgTF+B+P9Oa+ADsKMdE9NuyUq65RseuGV25VP81ciP
	SdbIb6s8mQcEr/4xX3+9hH0rtKzzYfGB/a/6TygepEShzq2FhQao83xtlkSpm/PdQoX/HoYmdUN
	IF8hHnEvk=
X-Received: by 2002:a05:6a20:7d9f:b0:3e2:ac91:6bae with SMTP id adf61e73a8af0-3fe98af0f80mr2337725637.85.1794999962218;
        Wed, 18 Nov 2026 03:06:02 -0800 (PST)
X-Received: by 2002:a05:6a20:7d9f:b0:3e2:ac91:6bae with SMTP id adf61e73a8af0-3fe98af0f80mr2337687637.85.1794999961753;
        Wed, 18 Nov 2026 03:06:01 -0800 (PST)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cac8ffe6sm1040544b3a.23.2026.11.18.03.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 03:06:01 -0800 (PST)
Message-ID: <6965d3c1-1823-469f-8777-17fc52e132df@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:35:55 +0530
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
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark RPM message RAM as
 no-memory-wc
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bibek.patro@oss.qualcomm.com
References: <20261117-rpm-memory-non-wc-v1-1-e246fc6bc66c@oss.qualcomm.com>
 <20261117161904.2hecbffviqjz2dub@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20261117161904.2hecbffviqjz2dub@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Uz-IlB-DU49d-p0fe2GT3Fx1V2B2xFMv
X-Proofpoint-ORIG-GUID: Uz-IlB-DU49d-p0fe2GT3Fx1V2B2xFMv
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd869b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8YGeh5X12gIyrkFA4RQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0NCBTYWx0ZWRfX4s4jZS2pyqiK
 CrMMfUyWNVhfv22XyiXb6oSh2ff0uEp9YuuNCA+pM/8JJfCmEpmZ0cptOnJexvyyGQ0ArTTsyUo
 bZ8yacPnk4RMeSxToTlKVTAWOWp0GfI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0NCBTYWx0ZWRfX/3LDZdbhFYX9
 1wqv7CRSoXXxYsf9oMnJzMr5uY7nDtCqyIMn2kvCcRc/WPPyjQXTHiXAgF/N6qsO/94oQUd2Kj9
 7OCgJZCH1gyt23ZaoodRWcg3d5IZb1CM6xhntcMactI+0d90zLUYBX/S/BhBAr+RUl3iDSJoTTG
 +p2K9e18fc3Fdt16UVTMRo8u5QmA8FXEqudrYmpdYyjg6xQY2QD36s4QX2KO34Ibh05+rAdIwE5
 nojzY9volkKovE0uNvsWq9yKzMx/eNSmcrpPGBBSjcpbGFLT0JNlkvXQVUoe5lbyF3PDY9vSVfI
 CMP3at91b0WavVFh+Zpu9rkz9GFusENs8AWKAkT/83BAaoajIfoE6jI8e5mFhd7f3K3uggpOX5r
 MBK2O+erHYjVGrCF+TSW7PYPwYSzZi9piFoPHCsMdfs3wANd96VIoDsR+JbrS+I/likXTXBUjsU
 0bS7r6Hu3J4HrLucR4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180044


On 17-11-2026 09:49 pm, Mukesh Ojha wrote:
> On Tue, Nov 17, 2026 at 01:35:50PM +0530, Vishnu Santhosh wrote:
>> The RPM message RAM is shared with other subsystems, and parts of it
>> are not accessible to the APSS. It is expected to be mapped as Device
>> memory.
>>
>> The "mmio-sram" compatible makes the SRAM driver map the region as
>> write-combined (Normal Non-cacheable) memory instead, which allows
>> speculative reads into the protected parts and results in XPU
>> violations.
>>
>> Add no-memory-wc so the region is mapped as Device memory.
>>
>> Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Why only for Shikra ?

This XPU violation was seen only on Shikra, and only with Linux
running at EL2 (KVM). It is not seen on Shikra when Linux runs at
EL1 under Gunyah. So, I kept the change to Shikra.

Thanks,
Vishnu

>
>> ---
>> A similar issue was fixed for the Tegra SYSRAM in commit 61192a9d8a63
>> ("arm64: tegra: Mark BPMP channels as no-memory-wc"):
>> https://lore.kernel.org/all/20220622132300.1746201-2-cyndis@kapsi.fi/
>> ---
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index 2623e139196f6398c57b616879a37f84b83d59ac..597aaf490519e605d50e24c090bbfb1e47b1f28c 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -1347,6 +1347,8 @@ rpm_msg_ram: sram@45f0000 {
>>   			compatible = "qcom,rpm-msg-ram", "mmio-sram";
>>   			reg = <0x0 0x045f0000 0x0 0x7000>;
>>   
>> +			no-memory-wc;
>> +
>>   			#address-cells = <1>;
>>   			#size-cells = <1>;
>>   			ranges = <0x0 0x0 0x045f0000 0x7000>;
>>
>> ---
>> base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
>> change-id: 20261117-rpm-memory-non-wc-c93a6ff3e432
>>
>> Best regards,
>> -- 
>> Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>
