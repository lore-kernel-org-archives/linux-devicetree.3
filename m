Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7355E41A798
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431107; cv=none; b=mv/nun21zvlpl5q5wBhvj5Kz+0FJPSK7f50c9t2NrtqN7qY75E0pLsQ4I+UZ+1SkpNvIltpjTcFzUZI+ju2a/vWuMdSgAzhwVPbWTBY5AY36uY5919nB6SSC2UZUM640d9X8+xpZ0ZhMStCvUPfUAjgEESOHJ3p1eTFVFV6inf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431107; c=relaxed/simple;
	bh=ULfQe5MuSmG/ChyJXgBYdASy+MulJK12QmcjURkE4Lc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W2rtbxf6QsRK1KKSdszdmgv2seLe6H192iNLbRleDGIlQE9eO9e9Y460ucNap7R/CgVrFSuG/GwpelaSswEokd2MPMGzf0Y8FI84HtLU2tlh/gFgTCizc4X9oAmp8++eunGYrt+XyztZHiTvsV6oj+VF3m8xOehEIPruFSOH+cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXEWGN9u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dGl43/vz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OXEWGN9u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dGl43/vz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8kZ23606205
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 13:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bo4OHvStj7qVIcGrqBnjjOWrOPC/PkfmhXpPZFgogYs=; b=OXEWGN9ujeVewVQO
	ZxGzSWwFLbXiMpbGzgq+udpJbIbjNjKFaClgLIOWKEYj0S8GyNe4/YS2ZZD+VGbp
	aHpFHMJJUO7kk8LiDnNqPTYciNd1antTggsy0V1KX7t6ztJ5Q+88PGy6h5J4vnYX
	Zl7fQpS6bjcLbt8mE5V6gzB9u83B1WCwHD1CGU2U9iXQg81MtLWZGjkQPkun2PLn
	7zzlOxhREP9MbKUe8NfvZGPAqOgqGJAoHHH3avBhfgQByfFJ9XIOwhecrc+TOnsL
	AexAEClabFs71WPeg8JW1W4g5NeNFNQ9DeShuRADRwwuRDqAp7xAXxqN3ql4wvcA
	+7pwsQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8j6vx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:31:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so7009842a12.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783431105; x=1784035905; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bo4OHvStj7qVIcGrqBnjjOWrOPC/PkfmhXpPZFgogYs=;
        b=dGl43/vzkGrkQ9ztbHfYolBl5f5SmVsfyvp4IyeSL8zVzH0Xqkea27T4TlrRGtdCCn
         EgW2/uDuIh8Aw+IuZaCAY3CR4vKellhdBBQpaDpqFp019Ct2yZLPkuElFK5zTrUFUI46
         T4xDtnXcypgMorVAkP+gnvvobd5OYSTpBlHvQ0fUHbi4Mdk83AX0/ZcuTe1x1Zwm4Z0H
         aLDO7pFAvqSnCFWhXjfOw8ITfUZKeyOgqcFEOE469Q7PdGil+Xeb/IwAaIuHuY2OjezC
         Pp/vEK0h7ygVMut8mPTLGWOtlXB/kiBU/XB+A4zv6489L9/KMn8q2A4kpjzB4yyMMVCi
         h67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431105; x=1784035905;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bo4OHvStj7qVIcGrqBnjjOWrOPC/PkfmhXpPZFgogYs=;
        b=HHb2oCiIP9khtH0sQvxZw3Qk/Y+8N7lTWOub6EQhq84SSg/HD+CWmT2Z6iTMZx4Jkx
         dkVh2zoUggEig4IUiqLm4oBb8h/OLITlmdD3oHEc2RLfMy8qWJAqZAbtlWwxzgygiyk6
         OpxgA1GyGipBKY6C0/Zu8QMQSX4I950s5B3yMg1g0jCnAZk+xoc/5ObUSD50jbj9CwdW
         rgMfvmruJscasKWoUGY0DjLVsUR7w8on7C5yA562+9TDKfmMfbU32qUWBvQWqCzlpy+w
         w/AzNteh2YQBJC7iJmnvMOxEUBsKTafjckiVXM2FOdmUvFngCStevUmzfhumDRSWEVKP
         UmKg==
X-Forwarded-Encrypted: i=1; AHgh+RrVm6jybfxckZwHdif6j9YF9/ZL641/MhwS5TWNwav6Yt15kcc2TGX82JZh/qoN1fG4aAkM+6W+EVN/@vger.kernel.org
X-Gm-Message-State: AOJu0YyVxA9DCXzG13f1pMsCs8kl2o/9TZ4uMyesvgEzimqpTT81aV7v
	xCZrXB/47+3b24kL1Gtlo9xng7elWBDI9d2WGGtuukov+MHXQEw0OMBghOapZU1anP+FZ7ciHx5
	I2bN4H1LWh+Wu3Oi2XjJq/HAyH24CjSzdKcwKxbYun4+UfQjtRRh5wjyZqfRSz3RK
X-Gm-Gg: AfdE7clXqYJqrGzlIhkI3Q1V35c5XLyuDhGM7az2ZLxz8qA18KNctL4WF/KCKouN8fL
	3vbBQFM3Q+3CLFAn5yIkcHY51Z+ZxdRZWDbdHoLLxQRaHChNwRvwEBelImdJl9XnmgG/R+Yd0Zj
	JAkhHisGbyjB1u4YYg3qeBmGYuSMFRAzhLoY+G/LRUahyEfJywJZTJg7mf6KYu1Rkdav7gqVoUV
	el2DswS58QJ/arnpy2yDKl93KUI0KEvmHiP1mVDU+zQu7ZvNHX2jWCaa7NsPJDCx1McFXrp7bIJ
	JxLOV+EzCVdINZQB1ajBSFleTz3INrbSQUJaYopPfrIwMQSeG3hrAjjWuALeJRbXN3vid1lTYCh
	NvT9tLYUDbFdHi9k9NScmM2apmGhoxLbBbKeIDvmbnWU=
X-Received: by 2002:a05:6a20:2d23:b0:3bf:77d7:667d with SMTP id adf61e73a8af0-3c08ef0525bmr6078133637.28.1783431105087;
        Tue, 07 Jul 2026 06:31:45 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d23:b0:3bf:77d7:667d with SMTP id adf61e73a8af0-3c08ef0525bmr6078091637.28.1783431104586;
        Tue, 07 Jul 2026 06:31:44 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3b251eesm974409a12.31.2026.07.07.06.31.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:31:44 -0700 (PDT)
Message-ID: <df99766f-5c5b-4e29-8672-1dc3dbec8905@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 19:01:39 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: lemans-pmics: Add ADC support
 for PMM8654au
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
 <20260614-adc5_gen3_dt-v2-2-32ec576c5865@oss.qualcomm.com>
 <4571c6af-2a5b-49ac-903e-b158d9cbad16@oss.qualcomm.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <4571c6af-2a5b-49ac-903e-b158d9cbad16@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX0mUt5wAiGlQb
 jBTwLJ8IPcUl1PDMWqu2VCpfzpnaIAWR/fNOd/FlCHjmugrcwaL0OMRk1kSGPK5jWZNLB/AnYiA
 iteEQDjS74/KxUIq547wshgt/xBqitsPkcos3Yf3jH8kFg30G8aF4tJTZLRbrRiEj4Y5digX7By
 LbyejP4lvL+JNRFgiSR9k20w5XurSXzUZ3tdpaq6iR001GBNJrOXi1qq4fqrV3FrY1vdNW75h+O
 7ro/Q+IwkQt4SbL/I64Y/Eskjya3ACzBY/v6t7Ney+ogDRv8uSs6/HmYyhp+CdJ1zkbuaN7LFv7
 eWuwZ5+NyTDuuscicymklh1iThN5X+FipCXwKf6uxvQvISA+XENmXMXAoc9x0fk1LxCe6IsW60L
 p2L34X/jnUFzNoPe26Q6rSOmaL3o2mu8FpTJCqHQQHcUyY31Kmfrm0U9kW3g2Yb7OwHHFCC5jdc
 aSS/9apL+RlviKD/5Vg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX2/DbhMOjWJNu
 wJwJur13iY4sVIJLc0cqYooEBYVO2RxOGIy6z8Eq+ALG2CNDKhFoPgvrqbPWmkQDfCcZj/kYTB4
 NBLAOOPy8TwXOMms7BmftJDtglFqerY=
X-Proofpoint-GUID: zo01IqGHv3imeEhwqcaks_DFcJrcJ6cv
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4cffc1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Tx_GAtjeg8paHK5gnVgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: zo01IqGHv3imeEhwqcaks_DFcJrcJ6cv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070132

Hi Konrad,

On 6/30/2026 5:34 PM, Konrad Dybcio wrote:
> On 6/14/26 10:05 AM, Jishnu Prakash wrote:
>> From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
>>
>> Add ADC nodes for the four PMM8654au PMICs (pmm8654au_0 through
>> pmm8654au_3) on the Lemans platform.
>>
>> Each ADC node exposes the following ADC channels:
>> - DIE_TEMP: PMIC die temperature channel
>> - VPH_PWR: Battery/supply voltage channel
>>
>> Also add the io-channels and io-channel-names properties under
>> the temp-alarm nodes so that they can get temperature reading
>> from the ADC die_temp channels.
>>
>> Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		pmm8654au_0_adc: adc@8000 {
>> +			compatible = "qcom,spmi-adc5-gen3";
>> +			reg = <0x8000>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			interrupts = <0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
>> +			#io-channel-cells = <1>;
> 
> Same nit as patch 3
> 
> and only now I realized - s/interrupts/interrupts-extended - this is
> necessary for !Linux, see
> 
> 2d5cab9232ba ("arm64: dts: qcom: sc8280xp-pmics: Specify interrupt parent explicitly")
> 

Thanks for sharing the reference above. I'll update the patches as you
mentioned in the next series.

Thanks,
Jishnu


> with that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

