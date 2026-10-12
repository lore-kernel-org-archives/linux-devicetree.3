Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971433D5222
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 10:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802138; cv=none; b=uOAmnXsb3oRYc4e9oAMW5e9l9qrPSWNDjA44vF3Qgn10Xa/t14dpkRC08JtRI4PNHLTyw/rxQQYg/MNhRwWWuUGfzypx5Dgn6S8ZJc/98+v+ro6p5LzxgNXwHWDXpYJV6MOdjVFVoit2J/p0x7w4GG7DAi5jQAtfih+EMbt+MSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802138; c=relaxed/simple;
	bh=ldnSnmgfiqhHLrw1xe3SYZXvRk5SS5NPzsBkf4l8bD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hn42FbmxQNLVNJHPkgUAeAIaetCEdMnNsFBdaNAoeFSRjVsPOHnkjaAeiqFi6JErR1Zgc4nCW/grwtnDqIqC8uiTkYdvZb0AOzBy89HIvM4XkQyf4+u3oOaZbMip8KOF7lUIrmYQvNR3zf/PdB+3+/aMSc62D5Tnmn4O7KwVLDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cTX0xXz9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ym2c3xOV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cTX0xXz9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ym2c3xOV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8LEiU1754766
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 10:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XJZUJeAzE2f1+m1hJgSo77BjslhwXf356FmXzxgV+bw=; b=cTX0xXz9dWXoCcHn
	iZn99pEOQSClfOF4quaaGMtnmsy9WW5NST9IAh7fYTknQv8MF6DJKD3t+fvvo305
	dhEIyUjdYYD9KP3izOABe8kO/8zwc6AdhaEWwAWzs2X0/+YJtmEl/XJQIaa4o+5G
	9z8qQh+XJz5Cx7EOZKPZNTqJQC3KQV/cRFQu+sKsRlhioN/FpRiAOHUJHlvY0g1/
	p5mU0YLfXBrZ53hLEk2BOCTYr5llbPdYWjhhSFMH2QrdCE6/pfEEUDahA8QSy1G0
	Ofrousf2LGehWFlAY74nufPF/RULQv9Z8KiIyluK8axnacheEhVxzxJIYfN1eP/b
	auftYA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j712gt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 10:48:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd3b9e70fa4so1521291a12.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 03:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791802133; x=1792406933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XJZUJeAzE2f1+m1hJgSo77BjslhwXf356FmXzxgV+bw=;
        b=Ym2c3xOV5P5je5ELqQm12S4SP8NiNmFFkZjvwfNpzB6nZC220DhTQsdaRVXrx0E5wU
         KtnzYSxTjARPo79MbjYKHqJH58mmPAUwvgZD7ngZ9ORK4+PCR2bkryB6WAL5h5ScTFYU
         R9WLKVZvrIOHyL+LHN6Mnx+2HoH7NFYTxcg+UQ7aoBokbqRo8iw/VykkI4kC7s2aT/r7
         EYMokBXmHBJctaK4AIG9moh5ZgNaCg0GTAhoRGQXbthY/yQ0g8gD0TAqouftkpQ1lpx2
         ql8pTG0C8pC/fbIf0Gnbvq33/6p1pd4r965jAFhDSTr/o7xf0dvhRDcyP3Yg2W7bYoio
         6tSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791802133; x=1792406933;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJZUJeAzE2f1+m1hJgSo77BjslhwXf356FmXzxgV+bw=;
        b=QTDCQjY1u6V1rZqTGbRD5g6o69gbc7MdO9c82MLJHDwkDVaKbf5EyMPsZuWwx3VpbY
         avap/+2WCmBWbj3jeWIqnLKmRInKZAB50mpH9jLzgK2uI9nXbYuA5T4Sj4+9xj0lIUoa
         DgLpU/WgT0XLONmgHUz4gRpgmOGbeXTmjq77O40DHcJoFks7pMAKrjJRAR75xK1jAkoT
         qNzPU6ZXrHzr27WMxReJ7yywx8yIkjd0sTEjdW9C8Vw4v2Wdg1aWn7/Zm5SIl14Aj6js
         V8jMXzRYIlSWuupDZW0uR44KaR2w8zxq00+YuaOl48sgnKQjXW0daUQWf09VFtp4A25N
         whLg==
X-Forwarded-Encrypted: i=1; AKwUvByy+sFBsoN+oz6qPvlJ9ry85kQe7U4px9L2hoQ3iKdUYpAXuSqvU6ZGATYB9tgCEiN8VETD0ktZyy1s@vger.kernel.org
X-Gm-Message-State: AFq9FYIPjQGWnr0NMvgH2X5MnlAct9kr8RoIMpAsUbLqYvI6jf8hMp6r
	vdn14UbhxySapWbgvoEii/1vzE5+Kxksz34eOgfC1pDh3BPlduGzlsUUD7tc+FHPEP0pc4xIjBg
	gV6nsLgYG7dpU1QVPUd0nmxsMiOb6gIJD9y2fp6vLS1OlpQdTEqy79pLhvVitfMkf
X-Gm-Gg: AYBFou0ZlmTMiNLZTnOoL5uMzTZ5oMox0FSB5nWFe0iPXuCB3IiLlvxd+aLWw2anfrO
	QbqOMPBfskUJsg6uNoJHbvBMqgP6op00rLlOS1AzfDheBCyHBzkBYvSrKn21a0uoBBEXlG79hwm
	dHBIoU6waJwMdB7KNe/FpP0SYjmdsJUygv3GAdLoRyQreOoafgWvkZKhkQBJOLV95ibSOO8dcMn
	QcGY5eaknQRR5HrTBg4gvR/FmB45j+IVTwcEwv4hA3GX4TAlO2oGe5aDoD0EaLzF+DZ8gADv3Wr
	PP1795ntdfe4pc2erTiiGQxWBa65EIGEABy5aeLH7EgxlcWfXIRtiqrBQ0gh/CVyHKhYy4ieIp6
	X9AA0WjATXwht7LXNYA==
X-Received: by 2002:a05:6a00:1f06:b0:87a:23b3:1064 with SMTP id d2e1a72fcca58-897c634e069mr7068363b3a.11.1791802133419;
        Mon, 12 Oct 2026 03:48:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f06:b0:87a:23b3:1064 with SMTP id d2e1a72fcca58-897c634e069mr7068328b3a.11.1791802132846;
        Mon, 12 Oct 2026 03:48:52 -0700 (PDT)
Received: from [10.64.69.36] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89a0724a045sm1581695b3a.45.2026.10.12.03.48.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 03:48:52 -0700 (PDT)
Message-ID: <1d764a3d-7935-4e26-b1c2-92537e1d3811@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 18:48:42 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
To: Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan
 <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
 <20261008210004.GA1318789-robh@kernel.org>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20261008210004.GA1318789-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MiBTYWx0ZWRfX/QzYxKllc5vt
 ebP83d7rpH+0fp+ka7GjiMeH+mqGotbF/hfADZAp8X0eq8fHWYY6CD7tyO474tKGJYC546dpmxL
 UcUOdrw4x05u/AI8dF0GnLAlYZV0bKI=
X-Proofpoint-GUID: eOI2fq7i0D8wf4SroB1AaLl3DOSpYm8L
X-Proofpoint-ORIG-GUID: eOI2fq7i0D8wf4SroB1AaLl3DOSpYm8L
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6accbb16 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8_2XKLfCnFwK6P8hJhkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MiBTYWx0ZWRfX25apflbC9W93
 0XvAqUs2gUw7ii3UlYJhaKqzfvqUzANGZJKTNCTqU+cHoytVmAlJVENLpIW6oS4j6dCd8akUx9O
 287nfcbteiQ4mSSnB8CeumgKnYtNXA2yGM1wlDVZmoAuWppkxaqsu/1NKU2Esj4jh1CsWDQ3TV5
 JpWYAaQ0B6o8op9ZcLhgXElRgh6QFzsmxaCt309wmROtw1lHnIhPmwIvWEnLi/zr6QLQWYcTm6X
 NDdVr++z12AFqyBnQW6HHDsch3lSehjamv2EHpjXxOE3z7xMvVVuARGI0c2ewLp4cz7tnjGVKm+
 IP4pqwSrxDS751CYgY8BITebuQ8OfWwKcB2TUGDk1H4GglFZg0/rE8auDPL8RZWfGYVBVXVP1FL
 evFntVZ1SyGCfGmVVUzw3Krpe2mQW6nLf3Ji2Fa1cX8Tzdxe6LfP0IO8QA6ru6yiarivFyyRJch
 XYyu+6vJLr0tsPPaZOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120042



On 10/9/2026 5:00 AM, Rob Herring wrote:
> On Thu, Oct 08, 2026 at 02:41:17PM +0800, Yin Li wrote:
>> Add an MPAM MSC device node for each L2 cache. Each MSC is nested
>> directly under its L2 cache node so that the cache node is the MSC's
>> parent device and its CPU affinity is derived from that cache.
>>
>> The L2 cache nodes are placed directly under the root node. The root is
>> the root of the physical address space, so each cache node only needs an
>> identity 'ranges' property for its nested MSC's 'reg' to be resolved to
>> a physical address. The two caches use distinct node names (l2-cache-0
>> and l2-cache-1) since a cache node has no MMIO unit-address of its own.
>>
>> The nodes are disabled by default. Production firmware does not expose
>> MSC register access to the OS, so these nodes can only be enabled on a
>> local test setup where firmware permits direct MMIO access to the MSCs.
>> This DTS is therefore only an example for other platform DT authors and
>> is not intended to be merged.
>>
>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 50 +++++++++++++++++++++++++--------
>>   1 file changed, 38 insertions(+), 12 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> index 131fd2a16c54..b1dcb1e9c570 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> @@ -48,12 +48,6 @@ cpu0: cpu@0 {
>>   			power-domains = <&cpu_pd0>, <&scmi_perf 0>;
>>   			power-domain-names = "psci", "perf";
>>   			#cooling-cells = <2>;
>> -
>> -			l2_0: l2-cache {
>> -				compatible = "cache";
>> -				cache-level = <2>;
>> -				cache-unified;
>> -			};
>>   		};
>>   
>>   		cpu1: cpu@100 {
>> @@ -120,12 +114,6 @@ cpu6: cpu@10000 {
>>   			power-domains = <&cpu_pd6>, <&scmi_perf 1>;
>>   			power-domain-names = "psci", "perf";
>>   			#cooling-cells = <2>;
>> -
>> -			l2_1: l2-cache {
>> -				compatible = "cache";
>> -				cache-level = <2>;
>> -				cache-unified;
>> -			};
>>   		};
>>   
>>   		cpu7: cpu@10100 {
>> @@ -531,6 +519,44 @@ soccp_smp2p_in: slave-kernel {
>>   		};
>>   	};
>>   
>> +	l2_0: l2-cache-0 {
> 
> cache@19870000
> 

Hi Rob,

Thanks for review.

Good point, Will update on next version.

>> +		compatible = "cache";
> 
> You need a specific compatible here for your implementation.
> 

Will add a vendor-specific compatible:"qcom,kaanapali-l2-cache", "cache".

>> +		cache-level = <2>;
>> +		cache-unified;
>> +		cache-size = <0xc00000>;
>> +		ranges;
> 
> Are there any other registers for the cache other than the MSC? If not,
> then:
> 
> ranges = <0x0 0x19870000 0x10000>;
> 
> If there are, you need 'reg' here.
> 

There are no other registers under the cache node besides the MSC.
Will update ranges and the MSC reg accordingly.

>> +
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
> 
> You don't need 64 bits of address and size here.
> 

Agreed, will drop to #address-cells = <1> and #size-cells = <1>.

>> +
>> +		msc@19870000 {
>> +			compatible = "arm,mpam-msc";
>> +			reg = <0x0 0x19870000 0x0 0x10000>;
> 
> The MPAM register length is 0x321C.
> 

You are right, the MPAM register space is 0x321c per the specification.
Will update accordingly.

Thanks,
Yin

> Rob

-- 
Thx and BRs,
Yin

