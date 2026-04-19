Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BF3227B8E
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 07:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776583401; cv=none; b=kBpH5sir79XzpGmVwN4ptizwEmdPVBVNSmEPC7gtS8RF5SieenpqOxiUJCEdehDPjCPg+QQ1up4RVcyCQ9vskWC0lR0buldBv7J/pW1cF50ayBWRxMLOD+9C2KALoJwFVIigThZemy4AZB2D9TbJY/MfxrGSnpRKplZosOLjVaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776583401; c=relaxed/simple;
	bh=257lSjm/Bp3h6Rr9izT8uBqkj1IsKYe8tuTbSZrt1gA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fl/FC1xXAN9LkXklebQfoJtR1jwa5o4XHS/72P78b70uRr4R0dOfu9fem0O1kLrjKL6kT/lvphfRMfrzlMc7AB/zYA/9oc1m6xYonQLUT0YnQixqkWRkeBuULzBZSNoJ69LfJH7N+4WLvNShbHAjNMuW18jVpRIGNPuymCPdOi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NCVBgF/t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KzTBaQva; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NCVBgF/t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KzTBaQva"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63J4MYWi3371400
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 07:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPPrZwGlL6pCdWsqU3Fqf77VVC9zY2wlw3bVM4jVITo=; b=NCVBgF/tDxm3JIE6
	fVOQpHdXD43OgkUMjkiJ36FEGt7qG8AoQUah5mPbjPo97f0QBnrhfqd5yXX9oxsl
	0ane8QItrJmDQJ1gNxf1zcEpnQ7rulMyPD4CQw8GJyOPPdGjN8izdvU1vgKcQ1KS
	XT0Epl1C0RDNXd4HUagBXiOSauzJ0PSLjCQ9i06am8PoEOaSKix5gXr0dUB/A16S
	naHHHs51a6Pz+1GrrQHUdACSrBSc7cZh44u9hG8KWAKxME+tdwcKG+OBA0+zKC28
	vOaKW/cwFE+7TPZVV1SzKDqMUvWxhTDh4j1U9mDzXSITthRqplP/cZVo+sPYmb9x
	NrcyOQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2b7246q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 07:23:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35fc22424d9so4012023a91.2
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 00:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776583398; x=1777188198; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zPPrZwGlL6pCdWsqU3Fqf77VVC9zY2wlw3bVM4jVITo=;
        b=KzTBaQvaclpMrSXzciKU3idKGYHYvKDDVgzqP3V0IwLcOudnTt5DwO7WHoyrwMB6XN
         Ndq/Fno+3uDjxOUGluKwN0e+aDuJ2GH9zvUmhaqm0n8OkeyZw9ImI1PzRvBwjTXvYfYd
         RQAks0D8uUyB4uobfUpmd4cd8Hy2e38poeB7wPNndI8Dji4/8gL4E5NZciexA8QvyyLh
         929VEMv28XfczJCrIkC2x4XfCnyyjcxlMlJ8/K1Biebrc1Mq+adB6epuX3xxTFpnXVlQ
         DeAgKHW6W4h5ty59WJfcci4ARq30Ke4/gDGUCGVtS9O+Bhl04pQGesXRc2IGNqWhYYxy
         6b3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776583398; x=1777188198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zPPrZwGlL6pCdWsqU3Fqf77VVC9zY2wlw3bVM4jVITo=;
        b=TLBY4UxB6fEegAyPJBNkJZ1skAQ+gM3zYEMUA2LhZ/spWGAfX2qPLo2yHrnvEQebeL
         lyKXVL1EyB1/NY07IRUoOD+kRz10iE8IrhtuANgecZt9p+ItPqy4jNlOtiCZue32M05A
         GGoeLGFdTXyVNBH2DkM5SRr8gYxAlI8dn72udjqLn+uAafzodzK1cCtJ4GFSxh9GH7vy
         uhYaO8dCOFr8kU4mg9N9+n9+nVjHEHQHmPd4gkx9luci6zgwG1YzZlpw5lsKgpretI9t
         b3vMgK/i9XnfpMk+6cMtwvGDTn6P5aifsuWIMKQmA2Nc1ssh25O3uOsblPmYE/y1nVRG
         vOeg==
X-Forwarded-Encrypted: i=1; AFNElJ8d1gDtd2Vrtjwj0DdBm1FhN6jzAI0IEoRB+21OXLpX30NOWIDm0/zeLFeQxRTGr3XZeNsYa8YnIu58@vger.kernel.org
X-Gm-Message-State: AOJu0YwIyRA94EYVzMko+EaK9aFISiulLOgT2C24bRN7buaEpb/EM3WO
	pamLX0M3QVazP9TLoUJYqtcpUVcT/FoATGXN9Wykzdp/QRdB7TkiM5nTLGWkEEvdVlEA7rJEGGt
	DYElSynj6PbANkezR8eW2gj6x+8ceFK/RMx3DRK59GxAa4YIKi1J3k9c9TF/jf5XP
X-Gm-Gg: AeBDietDPnLFLrI/OiGwDQfZty8vqDsoXH1csLNnuBP6UFnXikF6nSH3hUAfdAWdwBi
	9jSxCZL435F7CjqHdzn8elwke9zVKmsVoTGiaoZTvD+8A58D8gv4syy55EQ+/btPN+2H5YhCjDw
	5fsK18Ap2G+vJE2d8/gHq63dS8m0ks9BoKd1rSeYkS5b7QjjQgFpg5qkbYD6NR9GUsYx7+Hl3Bb
	oRjqzE+B1mJn5g8flZwIhXXDDtNKyVO7WibIccgynO8abR7kz2+Dk5vIBE0oLwpLKywtzKnUp/9
	kfZhCaq/82xOHTiH+uik0CI4Y/8v1fm0yyeDkSzdq9PMe8VysB4Hy61rul6aLGKfaqXJagti3lE
	7w7ROZFqL0itwZFBiJuu/IxPhphEMMFHg90o2VltE4LX6tgwaBQV/IvF9OsqUpPrY
X-Received: by 2002:a17:90b:3b4b:b0:35d:95eb:879a with SMTP id 98e67ed59e1d1-36140463601mr9620989a91.13.1776583397753;
        Sun, 19 Apr 2026 00:23:17 -0700 (PDT)
X-Received: by 2002:a17:90b:3b4b:b0:35d:95eb:879a with SMTP id 98e67ed59e1d1-36140463601mr9620966a91.13.1776583397272;
        Sun, 19 Apr 2026 00:23:17 -0700 (PDT)
Received: from [192.168.1.10] ([122.179.227.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab55062sm67374365ad.84.2026.04.19.00.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2026 00:23:16 -0700 (PDT)
Message-ID: <54edfe36-ebfb-47aa-b71f-6dbe10eadb1a@oss.qualcomm.com>
Date: Sun, 19 Apr 2026 12:53:08 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos: Add memory-region for audio PD
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260418-talosaudio-v1-1-585ab22faaf4@oss.qualcomm.com>
 <v4nqsxnapoyrfifcrjjunhu5s4ggl444nj7gdonghqmhbijiej@fzafvs2igmeo>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <v4nqsxnapoyrfifcrjjunhu5s4ggl444nj7gdonghqmhbijiej@fzafvs2igmeo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KZridwYD c=1 sm=1 tr=0 ts=69e482e6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xJoAcIQ2wYp4krwY+vXiHQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=uf7FzbhFphQq29a4HVwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDA3MyBTYWx0ZWRfXz+A0MBgX8eaR
 l/sjJpBzAzVhTdFcN877OCdlOAJ/2DnTb/y8zQfQnDaFHioSKQH8LWhC9koCLP7wTA/8Hy92gcq
 4S8WFHyXJINlvvzukbRWOVYLhDwcyqEhi6xac921Uj622xnDc8gW6T0O0Ai9LahUmMbsX7m0Sn4
 3CtPYciBYqwXiASYzepNKTocCzrOsxXzuo0oRD9lWpDfEdVL7esNY1T37mKbYx7oZEb+x/39oNG
 nXL3Gf3g4GHYkGQyvyRrRczL1SQTEUrdoqbio45gMlNMYxuJiUeLovAfBPh7l+Ur163pEMEYbZd
 dLNyGrB7e5pi7w1GIzLjZ5pnM6VHCccQW3Aa4ZnlhlRxF6QE01sEIq8cgfc/a+gwVmDGavoD+wy
 2mLsCYw4C2iJ9YttKzwOb/rTXDLPQcV+ebmoOYYyTcj+bSldM11XTjUPi118UuEa4LPj20i/Rrt
 MvnOkTQp26VF165NOVw==
X-Proofpoint-GUID: njhu4Aj9o1JDjhecvi9uFCTAGotlcJhz
X-Proofpoint-ORIG-GUID: njhu4Aj9o1JDjhecvi9uFCTAGotlcJhz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604190073

On 18-04-2026 20:45, Dmitry Baryshkov wrote:
> On Sat, Apr 18, 2026 at 11:18:01AM +0530, Ekansh Gupta wrote:
>> Reserve memory region for audio PD dynamic loading and remote heap
>> requirements. Add the required VMID list for memory ownership
>> transfers.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/talos.dtsi | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
>> index ff5afbfce2a4..c36917d6e0a9 100644
>> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
>> @@ -11,6 +11,7 @@
>>  #include <dt-bindings/clock/qcom,qcs615-videocc.h>
>>  #include <dt-bindings/clock/qcom,rpmh.h>
>>  #include <dt-bindings/dma/qcom-gpi.h>
>> +#include <dt-bindings/firmware/qcom,scm.h>
>>  #include <dt-bindings/interconnect/qcom,icc.h>
>>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
>>  #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
>> @@ -657,6 +658,11 @@ pil_gpu_mem: pil-gpu@97715000 {
>>  			reg = <0x0 0x97715000 0x0 0x2000>;
>>  			no-map;
>>  		};
>> +
>> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@97717000 {
>> +			reg = <0x0 0x97717000 0x0 0x800000>;
>> +			no-map;
>> +		};
>>  	};
>>  
>>  	soc: soc@0 {
>> @@ -5100,6 +5106,9 @@ fastrpc {
>>  					compatible = "qcom,fastrpc";
>>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>>  					label = "adsp";
>> +					memory-region = <&adsp_rpc_remote_heap_mem>;
>> +					qcom,vmids = <QCOM_SCM_VMID_LPASS
>> +							  QCOM_SCM_VMID_ADSP_HEAP>;
> 
> Align on '<' symbol.
ack
> 
>>  					#address-cells = <1>;
>>  					#size-cells = <0>;
>>  
>>
>> ---
>> base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
>> change-id: 20260418-talosaudio-b8ecf8b9a1b3
>>
>> Best regards,
>> -- 
>> Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
> 

