Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE5F30CD9E
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570120; cv=none; b=QEeaXv9S5xgzORbMYqNuHw9P7pnRIg6Dwm3YIRm0Kc6x7GsigffdXzDeQcMZaChW6iUeZAOE9S6EdVEC6rFl0ul6j5sHYPdxZY+jl99EKDIL20w0x9X0SFgqdUZPS3Nso9l19Jx1YrY49/hrHQAmpyEBB1pyQKTJQ7qrtsOSfJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570120; c=relaxed/simple;
	bh=LFLlCZ6eo0An+zqE3d/JX6cVTgZD9Bf/pdv6Mf8v7Jg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZBeqKVBq2cZGi1c+n3YpwknpkL3VHzNdYX1zdgq0gF/KeyVwnT+w3H2wmI+183Z7PPTdqSpocOi1T651e4daI9qfK7yekIL1edYr9XZ6fbSKUrrkgQsCTyBjYa1AgSGQHXm8Ffl5l/4gJ/xid/k25rzp7PQ33IYIBBS7ywzZmJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mt/+REEc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IVR+NeoV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mt/+REEc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IVR+NeoV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEYx3K3391035
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MClUT4TtavLkI7XCoEvk0+UCbwWQqhP2+uEc+y3ikwQ=; b=mt/+REEc4uj4Arpu
	s7vtuKUSHba5OAClDsfs6CGNm7/nRvrLP0LgtOa9LE4hRVDHvWtuulEZB6LY4sGS
	VtQS7D2mFYeOIJ2JbJ8vUBuWnFVxmOHco4w/XwSpWOEDQHDJyewbAvY1FsvWC9bC
	4houCnKE1u9gz2etICFZDjqsmCgU8jDvH2EROJtWI9R+AUYpZAdSxnNwna7yLoNK
	1mOiNUGKpMaq2zP4xluLwWZLy59+zViuX9ww0ADgX5Gi7cEJmE10Dv8ibdEvuxRW
	YdxBLiKNMtymqHT8hZ0g1NWP0O5gBIfe0mn9GE+bzND71F/iL9APNSfeyQuUlScg
	kOmUzA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftukc1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:48:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d001671a54so109922575ad.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 07:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789570117; x=1790174917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MClUT4TtavLkI7XCoEvk0+UCbwWQqhP2+uEc+y3ikwQ=;
        b=IVR+NeoV76uh9pO9qHWyOnve7qF6jUovXnqvADIlPP51r2I5BIOCLfZQiR8va2s43+
         9tflBWzrBTFlVX80VpfUCTxBO3RHGoh8Nbh5eNiJjNvHUGScuqEVyjUQVTbKU9X2WZ8c
         NxFiPSRc3JrrGJr9FxoWPmprR8d1eoZF5oeqBR9T5lK4XjKIIcdYzQwoq9X1iEuzwAGs
         w1s5YiI9wwa3XS0Qyb1Q/NfFQtIlgdeFL2sbCtz3hQgEGSKuS8YDeC8Oc3LAFRa0n2BI
         qOKkOC/hiy6wnzX3DCERuZDYAqg1IQNZuIIfV1xbNJ85aiSRG0H7pAAcObvZNba/kGin
         RRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570117; x=1790174917;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MClUT4TtavLkI7XCoEvk0+UCbwWQqhP2+uEc+y3ikwQ=;
        b=fdRvLwz5puYZvycobsFqGTipl1X8MmVQtqguCWpu0tOklfe8qXW7n2XUns0PQ5w9BR
         1tzzmlA6K5bOpkEYxKXlRWEJdWwY2ytCOwgdLF2G9a7O96LC4NFJm7xswXrUUnAtNtyA
         MS6GRIVejkB9UaLI6rUizrSOjgMZah/tIvYt6kGERdRCYbRor1j6Zs7rVZdImJzbn604
         veRxG0tSTm1JtupjvaGcvoZCjutxBkWOhB1uOsFDmX44My7M8skqbSHTxl4CeKDb96MV
         hJXS7N5HUI154uw+koD/aSAtRPv8xjk/rFvWp12wLGJHv4qKX2RlOgs4l4V7rDaEHTrr
         Z+Dg==
X-Forwarded-Encrypted: i=1; AKwUvBw7w5AUW2QK08Eyb1jlmVACdn+Rx4vI+tE36UEH9YwQjQoa5z6zNJetz0C/4RJ14Hi+94nx6PIycNji@vger.kernel.org
X-Gm-Message-State: AFuF++mjYoKf1tjz1NGRbf/sOHLka2+uy9vmq4NSyhcBvMZV81qfVywv
	4tzElIw2kWNZSV29mW5NNTJv8ghCaKpphmsVq+vo0PrLpz6Vs+t4u3Eyr38B47v5NFq0JUyNHnA
	JhE01bCOHvtSps56himviNRFmrI0Jn7lqqQ9vJHIfEC9MLR/cfV1FFCoZH9IneWRo
X-Gm-Gg: AYBFou25igH1KPcY4uW2O1R/4OqTYHlcxgN6WYij4AY2xbQH/IHKgczEpTpaQU9SKVN
	5EqR/NgTgWox5kU3v4DWnwwTGGb/GbE4LvGoWJCr3Ph+4Bzr32Up4HbvJ73Pg55kJv6iEsU1eFo
	qMSgvPv70dQTb2gLDC81WWonganqlqo1yYimv4+WC63asA5PxEKqLJXff0RTGx3+yfdwTFZ4bu9
	IxNRRS112Gc7sGdls5khxPuMIGbMJ8HulhGcGlRJm+bvhLgLQVNdtRQI0c+VCqva2YkdRErOdAm
	BAL1LD7+c5xUypkZwLUdL5u14RB8B6vKmxv1QkoYFez5sDHpP32m2yOKqmM8Svue4FzCP2cly8E
	V6VQPmrdLCXyVK2e2bk1Dq1+O6qdT1R7Fkr4o3s82
X-Received: by 2002:a17:902:d582:b0:2d8:d4d0:7932 with SMTP id d9443c01a7336-2dd8e7aa6eemr64251455ad.22.1789570116669;
        Wed, 16 Sep 2026 07:48:36 -0700 (PDT)
X-Received: by 2002:a17:902:d582:b0:2d8:d4d0:7932 with SMTP id d9443c01a7336-2dd8e7aa6eemr64250545ad.22.1789570116191;
        Wed, 16 Sep 2026 07:48:36 -0700 (PDT)
Received: from [10.216.41.130] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f02fc2sm13008905ad.59.2026.09.16.07.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 07:48:35 -0700 (PDT)
Message-ID: <db1414fd-2202-4dd6-a420-7dc505b91f77@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 20:18:28 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: glymur: Add UFS nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
 <20260911-glymur_ufs_qcb_enablement-v1-3-b9fc5e2ee99a@oss.qualcomm.com>
 <chmhun7dqj5flvbkzpsoz3pdbjrcbplel5rqfvj3fc6ztaw2sa@4o55fods7yaf>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <chmhun7dqj5flvbkzpsoz3pdbjrcbplel5rqfvj3fc6ztaw2sa@4o55fods7yaf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE5OSBTYWx0ZWRfX50xChoDo6aWw
 /tNcAvBABYx6VROpSBjSw/BgcmTbDtClLiI04zGnPR8pnqlDoixEcABZ1GnLETza/LANN0vVypx
 wNYQ4dBFcww5whj7ie8fRMsNimwQYbpm5o++Hzt/UUFHrxstM7J+9y3IiuJ61SmfX+pZYrWoVKp
 Z+x2DqRA70WGsNmZtEsgoG15ySb0RwCR2GbggIaCXhyjT6En105PKcncXbQ5LpE9kGqWvR/zTZF
 2bwrDlgc+k33Et9W0eV7V6svhNpDXhyQoZQShMoZHsJPRhCqXXy483D6IUPBc/hIzI7C1vGah4X
 rLCPCgO5zLu4YoNPfXBMtSHhUY2kpsoPB+8k51dnLfLx2wzCTSDBxNdj0OrgJaIlCzZHeKNWsqw
 esCaTTZe2tsnPP6cJcpgxN7Bg/w+4Lc/UXQOoAt/lGKlPDUXQdHgwaTF+nU/OACK+7tYKeiVFKB
 aq07JpwHVMaZF9eUwgg==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaaac45 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VTBryuNdlAkkI53dnxMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE5OSBTYWx0ZWRfXyznrD0E2kvGc
 70bgI5EfPlc3sk4XqdygZfev5vqtkQyFw1fMDTzYPOrZ13kzX1Q69ZG6Kz0buXvr4PfCRuWxx6z
 9NZNubqEG7E7Td6XrcGrJgUjgOt0IOg=
X-Proofpoint-GUID: TcA0moHm4_NGUMTrmMgXSgKQEJ__s1_5
X-Proofpoint-ORIG-GUID: TcA0moHm4_NGUMTrmMgXSgKQEJ__s1_5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160199



On 9/14/2026 7:36 PM, Abel Vesa wrote:
> On 26-09-11 22:17:07, Pradeep P V K wrote:
>> Add UFS PHY and UFS host controller nodes for Glymur SoC.
>>
>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> 
> One nit below.
> 
> With Konrad's comments addressed, I think it looks good, so:
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
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
> On top of Konrad's comment, I'd drop the "on glymur" part entirely here.
sure, i will remove it in my next patchset.
