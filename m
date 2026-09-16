Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E5F3630AC
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570095; cv=none; b=Q1QS15pULtSVrmHb7I/CG28uKIM88bYtV6QQtmX1o4I0FhpvHcdR0YQF8Xe04vNF2evQwwRKIv5MmQ15dAW4Xwl+MPYMD0BcOrcbBrdjET9VgwQVOZT1xbOQkT2hTeLpWqHQ0H4ofW0CD+reCjQix2Yja6Hbuc3NmHD0DgewcHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570095; c=relaxed/simple;
	bh=ADERtoxYIOzXLRbqlsE2bdSO/yjhpvw3j8HbRBX/NXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rtOOWDDYPEfKlsKDsLTz7YUYsMAVzgOQH9gtCHelaZdQhMP4HUAdz7cgc5RtzwLE7Dz61Yx+dBHa4MEeJRRSQOvJ2n3EHwBkD5q2u4Gv1GwwAoYF9kUA+gAvwwV3JYoXZ9HjQ/HiUWnptl6pES+tzU8h43sk/BakQDDNAWIoQTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CErg3NHQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EBToJqWx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CErg3NHQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EBToJqWx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEYYA82279325
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F3Zk5y/DSVzAwqyVWlk3wiBDRckqt0orU3V64+Tdiko=; b=CErg3NHQ5/A/gFRM
	XuajNl4sOMsDLEvcvDIi7rL9Qd1vv0elLFlcPo0LmQ8RkEMZ79zQWnrZLF/Ccg4L
	53GC9x5kt0KOmWuCAcha8+5wIwDPBdu1CCXUORNoaK3su25gPyxmvL8f2WFkCuFd
	/FiBIE06xo8AyCZejnTFclez9AkxSbAekThQ5KqAlwtyWKdNkzWUg4OCstKwZJYV
	hKuQVkDj86IKHP7UGNMPTDClimSEJ3+kloI9QTrIjxJX+Dvv9ZrNaYomMPSw9IjB
	2xV2+YmrLF+HODBeZu5cluxFJzbvpLZhD65WNigavO+tS0qvNvJvO0Akm18wtRsl
	WISxXw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqthnrrmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:48:07 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c1538bc4c0so3550206eaf.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 07:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789570081; x=1790174881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F3Zk5y/DSVzAwqyVWlk3wiBDRckqt0orU3V64+Tdiko=;
        b=EBToJqWxuXBTXKW4MM4Fdh9ltiHXlq14NOBroRIrkjDsjsZf1bDM3iq+rs0gMuqA0F
         JCa1oMxmDUuuvtQYHSrpxeRIVo2DT4+zMbzji/WF+AajskmUZd+5Quhfji5Q5pis0iv2
         dRJ33HqR3pHTg0YovFOlEyj4BMqtB/anspaUmPbcZCo9+mlh6MtkO3tJNFToJGrBjpaQ
         Z1GEPRXmt1OxZY1CtNNTW+D88ZYzeOPQuSsYQk9L5nmh/5tDefAgxvVw2zUtl17yEF7m
         MbU+tGW6tFK7mXTkHqCojyh0ekqEIxTTajGvAIfRCHe6txS7xZ9LYPblI/YaKw8SHTkp
         NfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570081; x=1790174881;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3Zk5y/DSVzAwqyVWlk3wiBDRckqt0orU3V64+Tdiko=;
        b=f6/xNgK/perV1JCHht5JhdXPBGTGv/XgRsnrz4w8nnZY7JDWNdSq0/GE6oG9Yct12m
         bV8EuvP/kULX8yPiEE3nk0Fzb1mojukTI0HayrGUW9mPM7Fzx9Pv8rhOtJThvjhYVDzY
         YAhcLI3xjXyFd4xtkEgGfPia75PbxBj5GU4iXLCaid501XcRDeCNIAXxsWnCymIURxoQ
         bmHj+abYcgS8aadnz6ZzYErqAIEN6uvtUEPg9T5pfyJYf+RyBwQGCr4i7r8i57LVfk7p
         6X4b5vfe59SmpkPeCWgQyIMZ2L81aQrBvO87StngnhF4UvWYU/y1HDfdbqbJb5b6zybY
         kb9g==
X-Forwarded-Encrypted: i=1; AKwUvBzDP3RC5oL+cTMO/bHzONmTkXd0P8FUALGrVxD8HYjqNKuNcYpjyAEq8gf/fC2RbP1LiBJNZScZnonq@vger.kernel.org
X-Gm-Message-State: AFuF++k/dLSKB/2h48df1TZ/Snz69tMo3rgm1VVm8wLk20SSoL5SL9Tu
	63yggsfSogsP3IdaymgiwU/QwUxPEdjOyGds81VOlMAviPVPw7g5v6Uk8L6nZC+D6+HDbwHnpdR
	CZqQgVKqb16Gk+wKZrMOSYubLWBtKg4kUIdXSs5fuf7azC5ke9ZvVlMxvrW/4XVo1
X-Gm-Gg: AYBFou1wnr2WdZwfKvwrvDf5+TjXAi64lMQ52fOE/WtmZ4MDjG8XuQudCM5Srl/1bPT
	pfFjEWILJ2g5Ys9Ek8ftIyUzc6z6C/PVPVrFRSVtQE/uM4rgfnWUKB7jxSB3gam5eMZoUADppcA
	VllFmzLmF+Ui6QKiacB6u4Iu1r9Cno+pO1nLoMKRoZYT5nYbIwXXTWAzd8m2z2szdRgge3QIYLH
	WCc6KN80ugl0FXAG0BLqnMkjXieivzd6Y7y3NDIFabmJrNzFLCOD5OXy0KWZRg2+ONGcP5PvpJS
	w2jcFnKGcRdXP6odX3gga2DDtKPhyiUPFCoiqrNswQIyQz39uqYuWJodKe5abrBAIy5c60jC6HA
	0U1sLoVL1uwcnv7ElM/Zr/QANTJB6KMAUI/0gncVx
X-Received: by 2002:a05:6820:308f:b0:6b1:afca:5c78 with SMTP id 006d021491bc7-6c7d39f91e0mr2890683eaf.32.1789570081249;
        Wed, 16 Sep 2026 07:48:01 -0700 (PDT)
X-Received: by 2002:a05:6820:308f:b0:6b1:afca:5c78 with SMTP id 006d021491bc7-6c7d39f91e0mr2890645eaf.32.1789570080802;
        Wed, 16 Sep 2026 07:48:00 -0700 (PDT)
Received: from [10.216.41.130] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b030aesm8554016eec.26.2026.09.16.07.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 07:48:00 -0700 (PDT)
Message-ID: <109d7c44-f58a-4462-bdf9-7c22759b4569@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 20:17:51 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: glymur: Add UFS nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
 <20260911-glymur_ufs_qcb_enablement-v1-3-b9fc5e2ee99a@oss.qualcomm.com>
 <381607db-0e7e-4d27-a992-64cd722c23fc@oss.qualcomm.com>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <381607db-0e7e-4d27-a992-64cd722c23fc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HmVfSQBanZ80QpUXSnTmC3z0v3Ai1hU7
X-Authority-Analysis: v=2.4 cv=IsKL47/g c=1 sm=1 tr=0 ts=6aaaac27 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=GD_5qw-SCA1CiScccr0A:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE5OSBTYWx0ZWRfXxGU+oTMMBO/B
 hVw1wScN2Dq+0bEQ5jKa+Ge/i5ZBUEKbmZGZeZXs60YHwagmFFtDVqyvk3KRhF0hQbqulQlkLdh
 gZtQUugQyQzzFRlEgLiG7MILtBWhMR7ngwXcc0uTqxw5/VymaPfOc+GPDxa1gIVRUkpNvH8cg06
 a/YkbXzWN2qhQEbvG5D/TwNR1akkNUhpFVUSef5VL6S3/srpbvtzVo1msh2AwwY9IjvDQqjkM5b
 KbxEiCEEQJ4PD2b2g7mvI5kEfrpc5LpAWmGG7kRLcMO5cJqjadTRUSjdfanOXcBTk/PnnA9HZAJ
 xPCTki57h9XWUta7VIHMxagINMiwuTOCDX238dd5lhmH5L9n74vLsLhJNX/v6jXdU7cs5VGrf+P
 mFn5vghXLgzKw9yYO4V5fA8HMuUy9cFP9XwuBXpQQIyMT3bek91uG6Tfo4kPL+528iHTTCCSTtT
 GNQUnrXesrFH3PHSgXw==
X-Proofpoint-GUID: HmVfSQBanZ80QpUXSnTmC3z0v3Ai1hU7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE5OSBTYWx0ZWRfX+wkgZtRVtrh7
 e1MCHUCfowFo65MWmE4c5ZkXuXxoFB7Bn0d1CNHE9+CSFRFC8051TMgOGG1NDQQpI211HgB5BvA
 x72wUtVbU1bDp/BNC834u279ZoC0onA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160199



On 9/14/2026 2:44 PM, Konrad Dybcio wrote:
> On 9/11/26 6:47 PM, Pradeep P V K wrote:
>> Add UFS PHY and UFS host controller nodes for Glymur SoC.
>>
>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/glymur.dtsi | 114 ++++++++++++++++++++++++++++++++++-
>>   1 file changed, 111 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index 624a9edd602c..7bbc804ed340 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -812,9 +812,9 @@ gcc: clock-controller@100000 {
>>   				 <0>,				/* QUSB4 1 PHY RX 1 */
>>   				 <0>,				/* QUSB4 2 PHY RX 0 */
>>   				 <0>,				/* QUSB4 2 PHY RX 1 */
>> -				 <0>,				/* UFS PHY RX Symbol 0 */
>> -				 <0>,				/* UFS PHY RX Symbol 1 */
>> -				 <0>,				/* UFS PHY TX Symbol 0 */
>> +				 <&ufs_mem_phy 0>,		/* UFS PHY RX Symbol 0 */
>> +				 <&ufs_mem_phy 1>,		/* UFS PHY RX Symbol 1 */
>> +				 <&ufs_mem_phy 2>,		/* UFS PHY TX Symbol 0 */
> 
> The comment is no useful, please drop it
sure, i will remove it in my next patchset.>
> 
>>   				 <&usb_0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
>>   				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
>>   				 <&usb_2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
>> @@ -4103,6 +4103,114 @@ rng: rng@10c3000 {
>>   			reg = <0x0 0x010c3000 0x0 0x1000>;
>>   		};
>>   
>> +		ufs_mem_phy: phy@1d80000 {
>> +			compatible = "qcom,glymur-qmp-ufs-phy";
>> +			reg = <0x0 0x01d80000 0x0 0x2000>;
>> +
>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
>> +				 /* UFS and PCIE4 shares the same clkref on glymur */
> 
> s/shares/share
ok, i will change this in my next patchset.>
>> +				 <&tcsr TCSR_PCIE_4_CLKREF_EN>;
>> +
>> +			clock-names = "ref",
>> +				      "ref_aux",
>> +				      "qref";
>> +
>> +			resets = <&ufs_mem_hc 0>;
>> +			reset-names = "ufsphy";
>> +
>> +			#clock-cells = <1>;
>> +			#phy-cells = <0>;
>> +
>> +			status = "disabled";
>> +		};
>> +
>> +		ufs_mem_hc: ufshc@1d84000 {
>> +			compatible = "qcom,glymur-ufshc",
>> +				     "qcom,ufshc",
>> +				     "jedec,ufs-2.0";
>> +			reg = <0x0 0x01d84000 0x0 0x3000>,
>> +			      <0x0 0x01da0000 0x0 0x15000>;
>> +
>> +			reg-names = "std",
> 
> Stray \n above
>
sure, will remove it in my next patchset version.
> [...]
> 
>> +			ufs_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-100000000 {
>> +					opp-hz = /bits/ 64 <100000000>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <100000000>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>;
>> +					required-opps = <&rpmhpd_opp_low_svs>;
>> +				};
>> +
>> +				opp-403000000 {
> 
> There's another (201.5 MHz) OPP at SVS
>
acknowledged, i will add it in my next patchset.
> Konrad

