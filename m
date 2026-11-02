Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611194;
	b=IPQtR28T4Itxs0GUt9XhrJhalb1NoZge7KsduUqgfjJAm3fqkB0PVJKkNpDb+F2FfsLS
	 cgEdcahT/CrAnihjwzjW8y8WTuc4GoC5worWsjNfcogyxFzjJETS1d4cMXj2lL0rbke04
	 ZN5urfGWdAVzKQ1N1afKdR6gVmWLK8jhwHQM8lCX8F5KWqTIYl8D5td2azFN/QtH0+Etq
	 OIcbHD5uH5pbO3WAyawlRH7UkEx28LDxbUaWDUd3vqVhhOdZzJaOm62N097u/Mls+fR2y
	 4odLJ7RgQGGarWWBCr9iF+5esoD7WOGc5At/Agpgwzg0JfSZgUNdW+gZXmK8oubIocg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611194;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dM+Oq09U0gik6VMseiUnNNkPS3lC70s6n7NCT9prtKE=;
	b=PvLZTdKg3qaT1JSa8BUfNAWe1Ev8QBpZg5KFMArVyxGcKfvMkHnh5K7/WtsV85P7TTay
	 eNXEdaexmjJvR2zOrF0CyGAHuIpZ4urrnze5Pb2RaLueAsxITToywJglWbPl82pNQqa8n
	 7/LlDHHvFW0depJuupSTUjPzpz8fRxLZDqB/9xOFNzhSEribEcgvSZSCiO22/QUuHPyDS
	 fUF9gTQSuwZGxWiw6MqkZOLO2f+44SnZQJV5uWZWI24K4jxPQY+aL2MvYhglh/twk+Gie
	 QXYYSRETnReFgkUPfQyFIk/ZR4Wa3PhfjaIEFmnJiD0yATRfhduHvTyR1ERCvr78alQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YNGjC+uw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJPAFWou;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE01606A32C
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 09:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FE01606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YNGjC+uw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJPAFWou
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29APtO3086563
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 09:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dM+Oq09U0gik6VMseiUnNNkPS3lC70s6n7NCT9prtKE=; b=YNGjC+uwSIOe6IL5
	XYWV8m7UJxqekJmwv8ib6Xq+BPVZHqvll9zDlwCVSrMd7OiSrPXOCvuojNJa0glH
	fbbXSXHylWnKOaHacVw2hg7AtOmFftSoxfEOhXWf7nTO2J6VKmmYdX9ApjVdXBus
	fGT2oKTkFf69bkdk7R2EvxQyVNw0zYXuNQiBhD1FfETdyLCY+ZnHpMGNodAdyTG8
	xvPxK7CdYf0uWKZs89QVfiTvCEnGbDtjTF+5Plp98yElAvuBIT6T885Sc6cH6BF8
	MEJJejp28wwIqo3/L4y+Ak0E9H6DtcW7IyqXoIc38tRM0ppnw6Zvi71PNIrn0+e1
	CkLSMg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka612r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:19:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so2031904b3a.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 01:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793611191; x=1794215991; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dM+Oq09U0gik6VMseiUnNNkPS3lC70s6n7NCT9prtKE=;
        b=TJPAFWouXKHoLZoyyMYoJP/rZjVcDcHtJBoi0zWFUCHbdnIgaVajXNyhnHxTc2h3c7
         TklQm5QKu3U1DHbguIdiE+F7+oD6Ij7rGibd1MnK0InY0yoIdfKGHDVznsbc/xpvODo4
         9PRIYn3czMIikIRyYkr65KfLDH7X5tA+RNGeHRr0JhITPYwq8D3z4uh9TBKu3O1dBoY8
         7S7R3qSejR9tuqebNiXZuJnc17SgHc9EpH2BkeEuaBovO3PouXKH6abQgUqMfcuWE+tD
         WOBkTiQsaLeQxTee0utEr7csKfZ6w28M2E7CnNwSsQ1J0oTc19SNgp2l99lNHRi5n/Ma
         ehcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793611191; x=1794215991;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dM+Oq09U0gik6VMseiUnNNkPS3lC70s6n7NCT9prtKE=;
        b=px3AJhkEUDHc+NgoPj2tip5eoSMC4XbeV3tsFb5HmdoUwqiGats4JbhhMrEANC6tqf
         6HFyl+BWQDBDwnShi8fIgSnVq5SyjxBlEaKuIuGHC2ER+Jru65lI9GcQz5uQOgb7JDMo
         bOPKKFymTFal7engCM7wbAe4RUbwfctjQizm2kf9ie/WkUXlB7px0ErSAs8kgJM9fpmt
         rFdmAbAyXQdbSwDH8Otf6BDRLNGOAcnikTzT5VyysjpHQCNB+0W6jOKZRDOOjEW6vDuD
         XNh6EUX4q+qL3pmzHmBh3pYjP3wTG9wEbTgCLxl7O3MlNxl+JuCZAIIaMN2b4e5FIFZS
         j7og==
X-Forwarded-Encrypted: i=1; AKwUvByaRLAIBkXmGPDBcOzazf/j/diqlmg+lzZT8YBN+afXPve/KvLDKStKAl3MzYJLB7zooFUj3xN0GItD@vger.kernel.org
X-Gm-Message-State: APuU4Z9iz9xpOFBhp2k9+v1bHFsHMr/Pr34OYtfXODKF0q76ZeQq0cY3
	WPMGiQKp2EenDQIKBBZ05nFaAKuxjcRhUUX/le/taLr6mRx9PsYsWjddez6rhT+mXFJn2e/DzbC
	l1dhhc6lFswF4pQ0mohbIuTB5WvW2egnWUdeRXIgj30caPxoAze82wfA8KXCEMkxo
X-Gm-Gg: AYBFou1u0tY/hLIxGSAwAS04JpdLgEe/iqB+n4QVSoglZV8NLwx8o8bJDRTSbeyOadL
	z4Dv6GIRotHr3/9rQYFbiLrlpXYKxNACtMrOVCtnWpdDQ8RmD+khYzavG2vARgAGqHQTmxC98Vp
	fgCPcPaCiTFVTgJrsl+d5UnNAKuHhKzFvkP7+TWOr6wg8FLj5dB8cQ5VAVWysuZMVz3PvTTjsqI
	8MllAkQOL1ceEszDkySyY++S+PUtMCiyZnfusl7E8+Ya1OOciQT9vQyGT38oLLC4/FLVE8rGsOc
	ozR66dX3H/6X3xwFf4eAO1RM1EMFySvm0oeLAS5+uc7M4KfcQ27skI7fENYWDWMXOUF8EP6/5S8
	WxgybarKrVjl4jFdBCFl/+MbFjAoqGkTqN3rq0JqBdR07N4W5UrlP6qvaNdce6s4WtMJxuvtdw0
	ZLBAgGivmyKdIWnHLWdnC8X1da148dJCLQ
X-Received: by 2002:a05:6a00:3990:b0:886:ead5:6d3b with SMTP id d2e1a72fcca58-8a9bffd29a8mr7141349b3a.53.1793611190857;
        Mon, 02 Nov 2026 01:19:50 -0800 (PST)
X-Received: by 2002:a05:6a00:3990:b0:886:ead5:6d3b with SMTP id d2e1a72fcca58-8a9bffd29a8mr7141327b3a.53.1793611190336;
        Mon, 02 Nov 2026 01:19:50 -0800 (PST)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963cfe7sm1780249b3a.19.2026.11.02.01.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:19:50 -0800 (PST)
Message-ID: <d5531292-b2e4-43eb-b931-2b0f72d5a6f2@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 17:19:43 +0800
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
Subject: Re: [PATCH v23 12/15] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-12-95f250b18612@oss.qualcomm.com>
 <55aef663-254a-4d36-b9ec-3ce7f4c4c74a@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <55aef663-254a-4d36-b9ec-3ce7f4c4c74a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HWUp-WbSqhsAHu3l_dM4bJ2zBcRuLi5I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfXwmOcDsuUYbEt
 YQ7MXtpyHLw2jrIw1YXbR2+8KAlCsvzJxR0HWQuH6GRg9tnd73rqZM0ow1I1BERzsm2YzYpMVfE
 wG2MMIghvlqMN6Wb1LWw0XFUgmqlc58=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae855b7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=iN3j4yL-2maCF0JdeDkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX1U70vmds5aYD
 9i5kE8R38/OA3+8Xt0M7HGreVyCszZq75l0x+e7JhaXba+2Cj3icEcN8Vez9EmxK2P86GmT36At
 tdjUypKts40KdffpQ2Zc2at9r4NWheLYJscdJTbrg3aALIjWY6Zk7Sp18WiHmMkNkF5I9rNOn7K
 B3VF9dXW4NUDtThTpecQ8/yAPto7Gkd8wxzq8DEwMxCw5YlyDFinOSNPxejEGcL+t28nzf/RX4a
 wGAFWKkB+jut7J30OEcZnPFcpFXvP7060jlLOsq8//3LdJ7l7+kPGo5qaxpUMqZvOTc9+0FOzTD
 TcMmg/q5rC27AOOnXnbO8upwryqyu4MSzb5tcWZ1BSqOJNGPse42JTqHwegdSR9DcAazR8BkBcE
 0da8KalnGdsOCBTuouV8L4F8fEnms52X7UzgMUR3JxoNOyDzrXX/Y1wsGkfNvx1NuCUgEmLoz1K
 KcQxH+jTAKTMje2Neyg==
X-Proofpoint-GUID: HWUp-WbSqhsAHu3l_dM4bJ2zBcRuLi5I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020036

On 10/31/2026 7:46 PM, Vladimir Zapolskiy wrote:
> On 10/28/26 17:20, Hangxiang Ma wrote:
>> Describe the CAMSS and CSIPHY blocks on Kaanapali so that camera 
>> pipelines
>> can be enabled by board device trees.
>>
>> The camera subsystem contains:
>> - 6 x CSIPHY (CSI Physical Layer)
>> - 3 x TPG (Test Pattern Generator)
>> - 3 x CSID (CSI Decoder)
>> - 2 x CSID Lite
>> - 3 x VFE (Video Front End), 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 401 ++++++++++++++++++++++ 
>> ++++++++++
>>   1 file changed, 401 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/ 
>> boot/dts/qcom/kaanapali.dtsi
>> index e48a179d0722..0c8fd7da55b7 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> @@ -20,6 +20,7 @@
>>   #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>   #include <dt-bindings/mailbox/qcom-ipcc.h>
>> +#include <dt-bindings/phy/phy.h>
>>   #include <dt-bindings/phy/phy-qcom-qmp.h>
>>   #include <dt-bindings/power/qcom-rpmpd.h>
>>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> @@ -3597,6 +3598,384 @@ usb_dp_qmpphy_dp_in: endpoint {
>>               };
>>           };
>> +        camss: isp@900b000 {
>> +            compatible = "qcom,kaanapali-camss";
>> +
>> +            reg = <0x0 0x0900b000 0x0 0x1000>,
>> +                  <0x0 0x09253000 0x0 0x5e80>,
>> +                  <0x0 0x09263000 0x0 0x5e80>,
>> +                  <0x0 0x09273000 0x0 0x5e80>,
>> +                  <0x0 0x092d3000 0x0 0x3880>,
>> +                  <0x0 0x092e7000 0x0 0x3880>,
>> +                  <0x0 0x093fd000 0x0 0x400>,
>> +                  <0x0 0x093fe000 0x0 0x400>,
>> +                  <0x0 0x093ff000 0x0 0x400>,
>> +                  <0x0 0x09151000 0x0 0x20000>,
>> +                  <0x0 0x09171000 0x0 0x20000>,
>> +                  <0x0 0x09191000 0x0 0x20000>,
>> +                  <0x0 0x092dc000 0x0 0x1300>,
>> +                  <0x0 0x092f0000 0x0 0x1300>;
>> +            reg-names = "top",
>> +                    "csid0",
>> +                    "csid1",
>> +                    "csid2",
>> +                    "csid_lite0",
>> +                    "csid_lite1",
>> +                    "csitpg0",
>> +                    "csitpg1",
>> +                    "csitpg2",
> 
> These I/O regions should be named "tpgX".
>

ACK

>> +                    "vfe0",
>> +                    "vfe1",
>> +                    "vfe2",
>> +                    "vfe_lite0",
>> +                    "vfe_lite1";
>> +
>> +            clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
>> +                 <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
>> +                 <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
>> +                 <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
>> +                 <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
>> +                 <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
>> +                 <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
>> +                 <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
>> +                 <&camcc CAM_CC_CSID_CLK>,
>> +                 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
>> +                 <&gcc GCC_CAMERA_HF_AXI_CLK>,
>> +                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
>> +                 <&camcc CAM_CC_TFE_0_MAIN_CLK>,
>> +                 <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
>> +                 <&camcc CAM_CC_TFE_1_MAIN_CLK>,
>> +                 <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
>> +                 <&camcc CAM_CC_TFE_2_MAIN_CLK>,
>> +                 <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
>> +                 <&camcc CAM_CC_IFE_LITE_CLK>,
>> +                 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
>> +                 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
>> +                 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
>> +                 <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
>> +            clock-names = "camnoc_nrt_axi",
>> +                      "camnoc_rt_axi",
>> +                      "cpas_ahb",
>> +                      "cpas_fast_ahb",
>> +                      "cpas_vfe0",
>> +                      "cpas_vfe1",
>> +                      "cpas_vfe2",
>> +                      "cpas_vfe_lite",
>> +                      "csid",
>> +                      "csid_csiphy_rx",
> 
> This clock should be named "csiphy_rx" like on sa8775p and a number
> of other platforms.
> 

ACK

>> +                      "gcc_axi_hf",
>> +                      "gcc_axi_sf",

Will remove this unused clock as well>> +                      "vfe0",
>> +                      "vfe0_fast_ahb",
>> +                      "vfe1",
>> +                      "vfe1_fast_ahb",
>> +                      "vfe2",
>> +                      "vfe2_fast_ahb",
>> +                      "vfe_lite",
>> +                      "vfe_lite_ahb",
>> +                      "vfe_lite_cphy_rx",
>> +                      "vfe_lite_csid",
>> +                      "qdss_debug_xo";


---
Best Regards,
Hangxiang

