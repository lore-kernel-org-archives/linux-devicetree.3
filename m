Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41408421247
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 11:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791025823; cv=pass; b=Fw8uK7wM1/QNgzpvsvbQNq9ENsYfEHdDjHe27PiMndzyh02pRvonltvLHAugr95d7iDHFSIE78dnc2TBkr9xy/niO2PfAKoaCM5F/hrfpAIsgFfEdbhuDOQniVUQ50LjHhFvRiENxpY2US8qwvF40PfKXfhQ3xdSMcvWGcUe+80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791025823; c=relaxed/simple;
	bh=/TyCH2CXZvLBL1T153w5Rwq/pPzcUlb0eHwPAnKYBro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VVG4hJ/QvjkmA1DjIFm1M101QIjTJcR96/XRBAA7EgxE3LqTIQ0KWQiPmLbuVzYqiOon7JDt7reQOkr4ZlIAUdOVNRYF7aWMLyUReELOVjfcpfahaOcXSyL3e/9EBwWfi4Za3zlFbfmazlAOYsmibQCflgbWVV+6QxOZrW8qncA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B+q4x8k/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Un6V/ug0; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B+q4x8k/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Un6V/ug0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693Atr7X3312916
	for <devicetree@vger.kernel.org>; Sat, 3 Oct 2026 11:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=85+1ADe93PSs2eP7hA3ohcdP
	8kQhajfqUw+b9HPdrdc=; b=B+q4x8k/s39Tqf7JKVELof+A8TI5U3NFV+a55qVV
	/LJzDuS6jn0PZcKafDCat3RUAC6bPV2Tou3BUqWORGDhDLf9IBWi2sri89HGRS4Z
	OMTMbCPNrvdZyUBMp3/dCZYxIjU8WORChaWWoolZqu7ypYvAGjxT5asd7JXqIcLu
	KEpGoSVPpMzu/00Rt9m3fmj5jd+V+F64PrLNVpzm1iLvYHJOIvP3ioD2DMToc72H
	6Dns/BhLGupledWcCItOKkJ1KImA5L1i7/ud3I8kTuOppWuW7GBAxSbL3LRp9oJM
	ojBkewKjgw5dfI+koALUfyIRnHchRh8z/gaJnWwWr9ni1Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2t36gpar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 11:10:18 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c0f07b4e97so283627137.0
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 04:10:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791025818; cv=none;
        d=google.com; s=arc-20260327;
        b=YA2kZJUQat/4yfiYBhxa0d34b/4xYlhYjkboEj3G//qrRi11z9Pb2VOaMmVe9x0eEI
         4RWhTQ71dA2fKdgvPwVZSvJPlUMR+Xo0JC0//KxKnrmeaYa3sF9k0Bb+v6gb2kYoOAOP
         Kvue7oUyXNsIxNtuZGdMbYJGRibDCRQRcHx772GeQ4tTQ8c07Wdwh1qzGMM3l5GE5ZUh
         h/+ihdaYhTYP71+lOiIB4X0GLZ+J2vlmKCJ0wZwHZHwcb08fpFmxTbfEpLU1sz0TlR0y
         +ATYt6HmiWy7pFsQ1asnjJlD4TyEbzAGb1xy867bUDL+TBrwFS74g4Jd94gbwUf1rUsE
         YSmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=85+1ADe93PSs2eP7hA3ohcdP8kQhajfqUw+b9HPdrdc=;
        fh=e3Lh9XpjoVJbBiBhpkragq97GkfROPvAt4w71xgnSVo=;
        b=rrW5SFRYzSi4U3kHfTviESRRHXupz/Y/O+df33Voq19PT3kZJewI9WycY51OyiCt45
         s270NLxboyeDuexfrhTvdfJ/RQHs2tpabVJ/dbxII4SNz4AVYsyz3KLfU2ZHlOpBxBT6
         U+7H6ZsBrhbk6b2lABs6GGCApMX7+RBtprTS28IN+BATMadAPufClfPS4EMpGU0hgLpK
         sDkZ4r1UKBPG/onXz02hnUQp0adPnFu1Tgk+xxYEEp3YWoomoWCoy1MbTnhRUXqj27ac
         7Dbgb/BT+81Lz8rvhT2AwY+XlE7TnkCTgvFb0swoOR5JCjSxkweSg0/b/flW67sAz/0P
         sYAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791025818; x=1791630618; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=85+1ADe93PSs2eP7hA3ohcdP8kQhajfqUw+b9HPdrdc=;
        b=Un6V/ug0xwA44d3D3wJdE5Agb8PHhJwkcIV3Pp+U0lCqt7cmbki4G2IbiOA2LOz2+U
         LIqxoGtHmJrzNVEX7+qNkqpDwAqx8HACbLKaT+z8M7VenmonpCiVPRthLl2X6DD1CAxZ
         UVmRzXX8QC2JDobqQNXcDMLF1fSR+6Yo8nV6yJ9xVFee064IJVwXVb9WFQrzdEkUt0wt
         jxYWVQ3RsnDgauWMDjAwDlKXHe833iNIfCUB94ttLXW3U4sd5IzVng03Dvp78z3gDeV3
         /jUpyN3c09RNM+SE0ss0yZKktkWqH6tuofoOVYjrHuh1r3b7U1cfgnc9dN6vN2XnQQKw
         i0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791025818; x=1791630618;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=85+1ADe93PSs2eP7hA3ohcdP8kQhajfqUw+b9HPdrdc=;
        b=c6NV/H34ERBX5uuavnTYeQwUpX08he8pTc1lfdJQwORdV9wzaQWsMn9MQxHfkfWKcV
         q72iOtwvF4QKT4HwgSC5rWgjoqoE2VWif1nDeRLYq1VBRPzcF4n4BVtfIVB81NI4DM2w
         GvecTcdDdjjM2QEwHig+xVdu1gW35BIMi/ILEkJhjVyNQHSjS1dQRVHgfwV7uJ2Ys6nD
         eLmc9EXEfpi6DvkFVmEPCDMQVhLsrgOyCxpUrsQnx5cTwnWfoCey7bai9VooDFGMkXvU
         7o7CAN4kd7Im2VkCnniqQbnAdy+t6RxTOEAXe1vVPNtcYSj5l2x8CaOhGnQ0auxfSAEo
         V9vg==
X-Forwarded-Encrypted: i=1; AKwUvBwhC5sndsFkGz18ViGBC+9QKdsNTDz1c1myQqlcceKgwIE+WYWGvxjayPyRgMGAkk1MIg+3o95EvuiZ@vger.kernel.org
X-Gm-Message-State: AFq9FYLMt8jUkKxAsGS+Uc5d+76QUOzktIlhNLHZnIYG19UA9GF0Pjv4
	92tj01cMc0uaHhw2U/s1yIldGoTD7/hebomAcXasqna0N4we0JJp9wBuLbMXVDlYpS95FNZP56y
	+gf4wECtY4cXl/LInpqMPg49/kzKmoGrpad18SA/5a3NxWhRDMvUPZW4+ICebsCNMlwB+M6e9wC
	Cld3/fLTfW9zUlrD+ewVB7N6aVCd2XDw8II/1zAwQ=
X-Gm-Gg: AYBFou3WBnVA5dDBDO6QW4XJp5nOR9cmBxAMQ/IttsUXxxmZ9T1rl3AQ1/5/X32xkdU
	JoVC5MgIT1zc2pOBrLrAI5bSWHvA/NHRiHAoIajIKrorqvnS0HB6xNWLDPi35ee26we9z9Bo729
	PbLrZeofGnwcI6iD6rN3BcfqyDUxRrMQ0J8wCLNPuxA1fh+UxnBKgXPySd7aRr1R1kmAad4Z8yH
	7PpKpBTy9HnAODgJw==
X-Received: by 2002:a05:6102:1490:b0:7b3:72ec:95c9 with SMTP id ada2fe7eead31-7c0f1ade126mr1808332137.5.1791025817582;
        Sat, 03 Oct 2026 04:10:17 -0700 (PDT)
X-Received: by 2002:a05:6102:1490:b0:7b3:72ec:95c9 with SMTP id
 ada2fe7eead31-7c0f1ade126mr1808325137.5.1791025817163; Sat, 03 Oct 2026
 04:10:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
 <20261003-kaanapali-camss-v18-4-87ba4ebe0db1@oss.qualcomm.com> <022c47c3-54b1-43a4-9161-1d0acb13b736@linaro.org>
In-Reply-To: <022c47c3-54b1-43a4-9161-1d0acb13b736@linaro.org>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 3 Oct 2026 19:10:06 +0800
X-Gm-Features: AclHuK-_DZZ5UAanpheGEwtkxas3xxOMP-L2JQ6TTe_v9IAzR_FdXx_rGiRb1rM
Message-ID: <CACbMrhr1srrcz-c3w1VgzHjdCEiG+6zRGZpjm9qMO3dt09YbPw@mail.gmail.com>
Subject: Re: [PATCH v18 04/11] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA0NCBTYWx0ZWRfX7edEbVfhsuta
 ShnJXVKfD9qhEh5T5EmbW/kP9vNYjaUmGlpwJtpq/cpAus7KKEc//S+BTF/7A9SWE9u1lU/gegj
 eSPf8hWnFgTB6EpR/GyQt+kSIM91zII=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA0NCBTYWx0ZWRfX4F8Uj0vHYNdO
 Qn1d+bK5rbaXj7OZTsSQ4MTMGnEMahdVpcQDFQcP6naAlI7YO5ZhKPld6J1emy3YPKvwm9kHdH+
 pyBQF73pRN9w2KPtmcFkGuXKHBbZ3NvL4U6lZGBlEKQixHQwoy1MODjxHmPh7oAs2xk2xORRd8c
 /Mv9yz7M2SKQjcQqRwZxuPAtOjjxkIprhqdx87tEttszZkPyq5PMUXUN9JUL/bzsiFubMa2nFF1
 GM5CnX2m69OLx+V0hpSmcl3qKU0WLdFRe9Y9Wax8C91hoydtfmgpC05OAWubGyajP4lIxNMjxMu
 I5tLhiP3OdFLylvX1dAMi4h+w7u+71m+75Mgqncdzav5gG1xjtxYO3XAEZIYpmsYVAeOcc6Youp
 cpxX0PGpgHm0G4kaQeMAvIokenSyMPDOhUhj1kP+pInjOi5AmvfXLiVtoJY4QV9WLUI81xUKppm
 zKjemojCNag5nGD0ahw==
X-Proofpoint-ORIG-GUID: B24Pn6OEO1c2LGoyK5_61D7rSBKtpoC0
X-Authority-Analysis: v=2.4 cv=UpH2pOwB c=1 sm=1 tr=0 ts=6ac0e29a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=gaIY05ubZypsO8VhkkgA:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: B24Pn6OEO1c2LGoyK5_61D7rSBKtpoC0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030044

On 10/3/2026 5:08 PM, Bryan O'Donoghue wrote:
> On 03/10/2026 10:02, Hangxiang Ma wrote:
>> The CSI2 PHY common status registers are not at a fixed offset from the
>> common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
>> v2.4.0 parts differ.
>>
>> Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
>> a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
>> initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
>> no-functional-change preparation for describing other SoC offsets.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 ++++++++++
>> +-----
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
>>   2 files changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/
>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> index 966d79c98f9b..8cd331cfb4b3 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> @@ -19,7 +19,8 @@
>>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B    BIT(0)
>>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID    BIT(1)
>>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD    BIT(0)
>> -#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)    ((offset) +
>> 0xb0 + 0x4 * (n))
>> +#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset,
>> common_status_offset, n) \
>> +    ((offset) + (common_status_offset) + 0x4 * (n))
>>   #define CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(n)        ((0x200 * (n)) +
>> 0x24)
>> @@ -176,19 +177,23 @@ static void
>> phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2p
>>              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset,
>> 6));
>>       tmp = readl_relaxed(csi2phy->base +
>> -                CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs-
>> >common_regs_offset, 12));
>> +                CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs-
>> >common_regs_offset,
>> +                                  regs->common_status_offset, 12));
>>       csi2phy->hw_version = tmp;
>>       tmp = readl_relaxed(csi2phy->base +
>> -                CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs-
>> >common_regs_offset, 13));
>> +                CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs-
>> >common_regs_offset,
>> +                                  regs->common_status_offset, 13));
>>       csi2phy->hw_version |= (tmp << 8) & 0xFF00;
>>       tmp = readl_relaxed(csi2phy->base +
>> -                CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs-
>> >common_regs_offset, 14));
>> +                CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs-
>> >common_regs_offset,
>> +                                  regs->common_status_offset, 14));
>>       csi2phy->hw_version |= (tmp << 16) & 0xFF0000;
>>       tmp = readl_relaxed(csi2phy->base +
>> -                CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs-
>> >common_regs_offset, 15));
>> +                CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs-
>> >common_regs_offset,
>> +                                  regs->common_status_offset, 15));
>>       csi2phy->hw_version |= (tmp << 24) & 0xFF000000;
>>       dev_dbg_once(csi2phy->dev, "CSIPHY 3PH HW Version = 0x%08x\n",
>> csi2phy->hw_version);
>> @@ -375,6 +380,7 @@ const struct mipi_csi2phy_soc_cfg
>> mipi_csi2_dphy_4nm_x1e = {
>>           .init_seq = lane_regs_x1e80100,
>>           .lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
>>           .common_regs_offset = 0x1000,
>> +        .common_status_offset = 0xb0,
>>       },
>>       .supply_names = (const char **)x1e_supplies,
>>       .num_supplies = ARRAY_SIZE(x1e_supplies),
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/
>> qualcomm/phy-qcom-mipi-csi2.h
>> index 7e55ae007370..d6366f809e51 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
>> @@ -51,6 +51,7 @@ struct mipi_csi2phy_device_regs {
>>       const struct mipi_csi2phy_lane_regs *init_seq;
>>       const int lane_array_size;
>>       const u32 common_regs_offset;
>> +    const u32 common_status_offset;
>>   };
>>   struct mipi_csi2_genpd {
>>
>
> Aren't you using the CSIPHY driver in drivers/phy now ?
>
> So if phy stuff has to change then that change needs to go into drivers/phy
>
> ---
> bod

Since v15 the series has been based on the new CSI-2 re-architecture,
and this change is a prerequisite for the subsequent patches. The main
reason for keeping this in the Kaanapali series is to avoid introducing
an extra dependency and keep the series self-contained, which should
help with mergeability.

If you'd prefer this to go through the PHY tree, I'm happy to split it out.

Best Regards,
Hangxiang
