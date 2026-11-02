Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610777;
	b=dEwIaNlob3S7sUitnuYX+yNy2eWclyGeCZZLoh5Otv0nK/zeIKgPPdGweupjO8hiXkf/
	 hbT/8n40GB2F9IDJ8ueofV6XuCW/M+iBQ6pGegJoCnjLaE9rni6OJFd5kysrodGn0pwrm
	 lYHExf7s0/svCFcKSaQu7SMZ86aGky3Fb+eZlbQ4kaBL2+CZzz0RpDqTKMN4PslxLjOJd
	 01YzWA3YnbSGTzo7BiEhxD/0dJ4oFdCP/x+Perm8NAu7MajcjCDhLVH8XCUnXj9YLWB4T
	 glEe+LFPpCqBB/4NnuKJQp3bwz1qf+fpD+t20IXl3aKDJoiAbT5RGT1mvLzLzgTditg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610777;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YuANGxMXB18zd3C6yO64dyenoMbuafZrLrdBNYEuS8E=;
	b=XayAz6QAHYdeFwEagJBGZOPoGbyvBvA8Mknu0E0WNsCFYy7nYbePhsHRS/fm0uHAeSwc
	 GUx+Im7dQIZ44KHQDfsTmLUzzZFvTg1QuTKWAas/aQn6PbGoefieMRO9cLNL+NzA3i9qB
	 IAH6yb8z29U41BOCnbyAFmPAo6605uahf2dX3UeyQNDkALjeX4D7bnqo/4f9meI3CCSpG
	 fk91SipO3aAkcDN40Wgqt6QEBXmM+eNeGXe46BtDnePAs+seco7+nBMEhopiIpQ/JM8Wv
	 iaWmmigZll+Du2+bRGuGWZDMKcZhjNbw8+WRAHYaLc2OGHj0swa0XiczqSUkzGCrfhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cZQjO3hw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ea+RzVJm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E76B606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 09:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E76B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cZQjO3hw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ea+RzVJm
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMm61821123
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 09:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YuANGxMXB18zd3C6yO64dyenoMbuafZrLrdBNYEuS8E=; b=cZQjO3hw3nLs9dH/
	zSZV9+cgwxZAkEUaGEvBXzh/nOZyind3r8cQZEGYw2hzPJI232zX9ODU2MGqKIlM
	ma0z0l8zvC8ICQqrEzzWnCzmeLhoR3oBwPLGRJzQF05HDuz2tdKx+QHv44SxC9MP
	3XtFf4EeySzCImYOrWpbzaxTLbn0D0pb0oXEAlaPCxxpM60HAdghgzp1A75rXsGA
	9VWbacfWzQ4UeXEDcWTByyY8sd0hDQ58vvaHcY1vdC42pUt8ncFzQkwPoplSnj1N
	GOCAwy3GL/l3vQjWaXnlT2DXX4pBay68dxy80DjxzaBPWLJiBVZFK/TRMZafaHNC
	CClp0Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4gwcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:12:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a06da65d92so1776758b3a.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 01:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610776; x=1794215576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YuANGxMXB18zd3C6yO64dyenoMbuafZrLrdBNYEuS8E=;
        b=ea+RzVJma32TnAny7iHVVRikKChmRY1GfmKtYWbLtCh6Uu+JjIRgNCljUD4mlNmtA1
         opfNUod37jYOavbFg74FHYvc49yY7ZKUzNBLCj5MwV6jkzzlhKofcsN7c4rgdU5pU8D+
         VmlKbJuj+FGgrNpjQ6l2znNFLlPD8BypqEftvB63q3ueGryhifJRSLhSEhlPio81itha
         79pTXX9HswEVEytBneBDZ1/1Pfmi97c5ugtmfbgFlYTu/IkCAIbhrgcCtKQl2uwqxLDP
         EunkuhOnmnyuOrDFXCZgsprBb15WfcXXkcd/va/peY+V254n9FJKeczuKh2G+lq/uRXJ
         nPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610776; x=1794215576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YuANGxMXB18zd3C6yO64dyenoMbuafZrLrdBNYEuS8E=;
        b=1nMmC79/zRYyCFvrJzNDbQPcjDq3lvwNet9hqUckzQFo+3ht1VFHox3tqgiXx6u68y
         K/tBtbfSe/pyohiSBi9JRt9FZiaS9WZYqmN0qKuVEJ3XUHSjpir57JsuCpSLydlnQPNB
         8Yn0pL/YmnBMT8/Hy6rQSlmYVaqUtQMDiuLuVfq4IqbciboJrIB7oGa/KtOpUvP3Mvlj
         FL4pGXbmX2sz02vbJ83t4cxnGQVxQvZ5quno00sMg2TTW/6G8PACk+Gt+DcMig43L2kM
         D92qB+BSCwBP9UlprXs4hgXDz+Yjh9GlthXvsnqHn8qf1viJ/0vkWTCxgukFqxXxBGiy
         G05g==
X-Forwarded-Encrypted: i=1; AKwUvBzDiGK+Hui/ThEkTSQ+3Ap241ticKipGWNHGfuyVKWr2Udeaoa2OSWnxmWeOQhRQjrsIcIEYKmEf6h+@vger.kernel.org
X-Gm-Message-State: AFq9FYLWtRlS+xVSsFZvo58WNU0Ou+Xi4w0y1TnaXfSFOuFKt/XadmGZ
	Sgp/PA6f4sYR8c3Trf/3Ou7jawq6G1H6JQvnsp/EodpU9TFqFzoCOBjWywW9zAobwifyhW31nYb
	pgU6ovWosb59x6Y1zBZvIVos36eInJGOxx6sigpaiwGgViJnPEBL5qe/YZpSSrmCrs62MY6kd
X-Gm-Gg: AYBFou3IVB1AMX+nMv+O4DQFJvNJeUysO1tF9TsTSN6IG08u1ZC3KENakORAoCQLS5e
	JcqnDKG6E1Bf4hvH52PH55dUVV9HOsuEqz9R6QlLgZ758L+5jSW++pZ2HnnL91+DjRmpy0fXBaZ
	/uAg9L825DKD6BiMJGxiatmanqkE3ZUQPezSYrmvNbWzb5gfd3ia64Vxh1k8QK+IsuHbHiB0YEB
	FJsUvLjA9cVBXf9Y5OwvzrTmPcVEfnJXcusUnIe2t4VmwGzYDDrSg0fNMwpi1CvWAsJ758uCCK6
	6IVVMpvii3duQqpOsHkQx6P2t/Vi8qub4mW1Jx2eouOAeJ1K0TVlg8ipzc/qxLRwOkwLymedVik
	b/yPVlxcs3HDXZ7z1kdrD0DY/eBzLRPticYlzMdayNzCaxrbiWwa26CPzzvAfiNRomZSZLvwoEg
	xyzljDG7IFOzqbwRMurXbvUIMUJ2CMuJX9
X-Received: by 2002:a05:6300:48e:b0:3e2:afda:c37d with SMTP id adf61e73a8af0-3e928dfa35amr6749589637.60.1793610775612;
        Mon, 02 Nov 2026 01:12:55 -0800 (PST)
X-Received: by 2002:a05:6300:48e:b0:3e2:afda:c37d with SMTP id adf61e73a8af0-3e928dfa35amr6749561637.60.1793610775138;
        Mon, 02 Nov 2026 01:12:55 -0800 (PST)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb096b7ba2sm2983347a12.8.2026.11.02.01.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:12:54 -0800 (PST)
Message-ID: <387c4b13-718b-45c5-905c-31c8e441f759@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 17:12:48 +0800
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
Subject: Re: [PATCH v23 03/15] phy: qcom-mipi-csi2: Add Kaanapali support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-3-95f250b18612@oss.qualcomm.com>
 <z3oqnmse3plnnntqwxrpi4xozyuxn6a47qc54agspwuzb4djqz@hzz3lbcmkvlv>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <z3oqnmse3plnnntqwxrpi4xozyuxn6a47qc54agspwuzb4djqz@hzz3lbcmkvlv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wS5MszdgL66ZHTCQe8vVpQvotbD876Eo
X-Proofpoint-GUID: wS5MszdgL66ZHTCQe8vVpQvotbD876Eo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX05rLBy+S/LgL
 +OJjv4vvaTQEWyPMXR6cpYfBfbJnDqfhdWRwPxOlf+xJO5EsDV43Hc6rDTJkIurWmFcxm9yNkoA
 sYidfX5XvxMNh0iViR5RIAztopUJaMw=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae85418 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=x06h-Ri-Sg6DD3z3xmEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX84JI54xyKMrB
 xRf7TZk7llbPfoMvlYK7gfskR5MC3ljEvBdPzoFNM/SmwkEjKR2VzYGLrdoQ7ZjvNb0vfRo9woZ
 //YPuJ+bP90JQbD9ggpHMMOwHIYjT1etVYaDQSNlP6boALzzLJ32shCEYGJLnjc30EYN/tS2+Ai
 tSXuDhm/0khl1cSxLLZ8iTC/nVtVoOH4UO1UFzoGg9fATzvTIWVbmROlguUa+HIAlmX41to8CtI
 oRxa07mjLVQHRqrTuBTZq73OBLRpuP6Vnu4s4vQuXlHZTQUNpsztlEujlXMEZMcSDxe/pPnwG1V
 rNIGfwcJDhdF3G2enlWCFzkCHtb2dkB4TrmAKMy9g/eN07C7EsuC0yNZ4UjwQrb1SVelBWXbI2I
 kNmJX+6C2MCxq45cpVH4pFsD5lYI6+ISb5DJKcrPuyumxezLi6mG4Q8MmypaBBnca0q9Eq8CXwU
 A1HbWW8i/SgzV5YLB2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020036

On 10/28/2026 11:26 PM, Abel Vesa wrote:
> On 26-10-28 08:20:37, Hangxiang Ma wrote:
>> Add the Kaanapali 3nm configuration for the standalone CSI2 DPHY
>> driver, including the Kaanapali common status offset and power domain.
>>
>> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 ++++++++++++++++
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
>>   3 files changed, 18 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> index 8cd331cfb4b3..658a39463104 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> @@ -389,3 +389,19 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
>>   	.genpds = x1e_genpds,
>>   	.num_genpds = ARRAY_SIZE(x1e_genpds),
>>   };
>> +
>> +const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali = {
>> +	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
>> +	.reg_info = {
>> +		.init_seq = lane_regs_x1e80100,
>> +		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
>> +		.common_regs_offset = 0x1000,
>> +		.common_status_offset = 0x138,
>> +	},
>> +	.supply_names = (const char **)x1e_supplies,
>> +	.num_supplies = ARRAY_SIZE(x1e_supplies),
>> +	.clk_names = (const char **)x1e_clks,
>> +	.num_clk = ARRAY_SIZE(x1e_clks),
>> +	.genpds = x1e_genpds,
>> +	.num_genpds = ARRAY_SIZE(x1e_genpds),
>> +};
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> index c0a4fa20eaf0..aff9e66f0352 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> @@ -444,6 +444,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
>>   
>>   static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
>>   	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
>> +	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
> 
> Nit: Shouldn't we sort by compatible here?
> 
> The rest looks good to me, so:
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

ACK. Thanks for pointing this out.

---
Best Regards,
Hangxiang
