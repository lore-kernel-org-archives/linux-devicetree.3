Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A434390608
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 08:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995213; cv=none; b=s3eGK4oCgd4QIKf6uXp1yWZcq8ui5SL4QIq0xw458YZ8/93O/B5R7tFw5R7FxF0pnrrmKEdrBjFkokfRX7Y4SZJ8Q+DCmh1+xTobZoUHw9gNLMiLIMyoKXZCm1euZdnastDbfd/A7+h8C0x0ZtyjNn+S/cn9KLC9b/tfLnlmWn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995213; c=relaxed/simple;
	bh=/FSMGn29BC7ORLv22Sa7o74cNNiRrr9HIkI5/qYctTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aFIrezelmLK4uw6QEhGd0d9aCexVJtepVxwZxlsDL9UnSUVvm4OiGSV20PA/4jzLPX6vwcH1A1KAbNtbPBeQwcdKWRePwnQ5/A9R7DwC4cgup8mL6VHB0D8PKJYz7iuxiIs9nn80HRjRMVECTyqj48+PgB90hbJ5yVlaCai6GF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LIyAsMac; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OFLrqi5u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LIyAsMac";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OFLrqi5u"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65985SIY006855
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 08:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qxjGI4Ozh3EujmkmvmGGntYY6me51VER/HBizqF9uJk=; b=LIyAsMacW+rW/x2u
	estfjDemu1BZ42GBzSHJdqmU21fmxHPLGKjRC4SlLF7oQKWXf/yVujEvfu1jowFV
	cPdwzyXeSH7Kk9vJu82dszmJqiYdqCsIdJqau327Gw0YKbkCCcZS/OXOF4GEkvCB
	bYpOT3INz80BBdrBUPdM/HczOIv8K8CoPUVHf4XAIWvNUmSzkc6jrKnZKc6PBRUi
	y9+rIezfbIcJOQ6F5tLo2VEaseDgSRR1QQTnFmkxLTigtcRF7MUDEzPBWJzHHpfN
	5xHwoeGx3kbdeLFGfv2XpEFgMkGT+RkcZGizDszN3NReATOyOR00qrDtwXdByHJt
	jQr0Bg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0sr682-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 08:53:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517a00fbac6so55179171cf.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 01:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780995209; x=1781600009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qxjGI4Ozh3EujmkmvmGGntYY6me51VER/HBizqF9uJk=;
        b=OFLrqi5ur8HypNk3cWBf0Y4CjKJmmCt3XmtPscmM8UPQnF2KNPRkFoolZuiKQSZEEb
         O2P6Lx45acp3QvJT3PSgPut8LqV7xcqSMdH4I1lSS8y7kXiVMotCFODoy5+0kYT0wZOa
         NDxh1QV1Bif7ZnQYdzzuZNi0u3mFJ0Dtj2KdKQD0n66yl0xupyJKixidGly0vGXQUe3u
         VA1ewxc0s4q2LMRe3DZhfeOlHaSnVG8BmnXxUQ2HevFfOiuzLbRvI3G7aQHD4c0vfoNB
         C17/roqkuwsZUo2lPsT35HkoLeTgOITf6mtwye8Pq4ooljogLoIySHPsmhVNYvaeUjl8
         J7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995209; x=1781600009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxjGI4Ozh3EujmkmvmGGntYY6me51VER/HBizqF9uJk=;
        b=jUzXgkPDk8/PmmOHSLdgMlLLi3Kat57kQl8dLvlM65xYc9RpzY51legatw8C045weL
         xOgX7e4rlLIQkdVRZp261HZjeFOj11XP3BZhQPvZDNfOM72kGbYrCEmDzgUSO2CoQaDq
         g3UN/VMG9w/7n4uOIcrceWESrRZsPARSe1gC5q0tgiRYwezuxB49UGHZo/nzEEJF3YWL
         XAZ33El2ZXWFPrlAihwLkB+6V0mE0BQUuR14HyyFmC93Ve9yt/pfZ2slHKAcs4Ahc/mI
         CnSXIdR2dlKt2oXgBoEiTa5pVjXRpyxylBy/i4KKjzdNo9c8+REvoRiAcg6evYWfZVPz
         BYrg==
X-Forwarded-Encrypted: i=1; AFNElJ9/op2xqPb58OL6xDFb7Wqjf04W4/3T482Dv619lg2b4t6GdUc81QuIvP2olQ1POP2hlkHpt5p5lxJn@vger.kernel.org
X-Gm-Message-State: AOJu0YylCoodB2KLuFj5u1EMK4ocf+f9xFO6epA4AipRTnfDI0vLxrB7
	qrn7QIi6JLKQw0NFKAmEsm8qMHJUgHWCFpLy/gVZYiugA3561l0TxgHItbEX07mC9R+BoDrjjIt
	upPntcIYY1+YmkVMFC6munR4vy+Y6X+A0MJ4xzKzFMcxCptC7/54N3vC/bvxotdN0
X-Gm-Gg: Acq92OGO/3trVWV1bo99pX263N1YRQM++6cfJ+o+PEP8WBFVwuq/9e8Cy/qdbHDWvew
	6McBlVfhTsrSVM9is3WWD81PyAyTXM2sqV26GPg3eUv3XL7oePO5aObOeBc/lFC9kIaIiqkUo/M
	S8EaplhumWRZGi7gFFaJmkqh8u6v79ov/fxqhTa6+u5NecOoRtXfHZ0WyRtMCeXakg9h1LLIHJc
	LehWhbzeLWKHtC6fisvJs8WjLt/qvMQ+/pnYS21BXMm1/G7t73YlJIGDOquhDICMxcFZBVl0/Ty
	OR29zBi/vuBKeKT7e4oir5UEL4zWwnZHGgq2Nh66Mby8IT7kaTsFXlm5gOs/bmNpBqrOhD8zPAM
	YLdiSfgmRa4lysPbodfDgiAmSK5OGU4/fnS/qEBQXhMt7kVxbcFFFnPdt2N8=
X-Received: by 2002:a05:622a:2489:b0:50d:66b6:1564 with SMTP id d75a77b69052e-51795b8650fmr177165301cf.14.1780995209412;
        Tue, 09 Jun 2026 01:53:29 -0700 (PDT)
X-Received: by 2002:a05:622a:2489:b0:50d:66b6:1564 with SMTP id d75a77b69052e-51795b8650fmr177164921cf.14.1780995208906;
        Tue, 09 Jun 2026 01:53:28 -0700 (PDT)
Received: from [192.168.68.125] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6912365bd3fsm4736019a12.5.2026.06.09.01.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:53:27 -0700 (PDT)
Message-ID: <314beaa0-3dc4-4cba-a37f-c358532e90dd@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 09:53:26 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] soundwire: qcom: add EE-aware register layout and
 cpu selection
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608175345.3118060-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260608175345.3118060-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4MiBTYWx0ZWRfX5S3/PLEX4fmW
 qdjgo79Ngo9Wi5NzZJptegAoyBBPnZSsSmflFodXHFtTtzkkY2cyDBe7SC67UKmFcWU42LE4Cug
 XMxkN2FYa27qFi5pnTT5c7TnalsIG5zXojWbG+zAKM3EYRP2LYo3wAxJHq+MuS2wPBb1Iw2ozaK
 xbixTkC/6RVJiaw3km+UdMhMZ8Xneywmq64EcYgJj8wdzyWzEAC0tJkFFo9yR9v6Nxacn+r0wqH
 qWndqFU37KYZvcwp6MNYiOAL258PBRHF2FrggUATcpkFPJHLi5YuzA7IxU9Ec8aqRKZes1aYNHR
 O/+kSTdr36oPX9fkyKG6IQlGsLe63oOkFmZyEKHlDVKr8Vt8UcI8ujyR/MECqhWgjP894BIclRX
 3/lSmu19lgkQCs8Rc6rQnynFf0yrOsta7k389Zi0YlvVSPIii4JfBrrPnXLgs06Qrd/n85MDy2s
 CsPav4aZ+/zAat/2l6Q==
X-Proofpoint-ORIG-GUID: bXPPJTCHbMoiRkZaKcKTTHJ0stKIhXJi
X-Proofpoint-GUID: bXPPJTCHbMoiRkZaKcKTTHJ0stKIhXJi
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a27d48a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=nzkHmdKqgOy-9w5VjhwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090082



On 6/8/26 6:53 PM, Mohammad Rafi Shaik wrote:
> Some Qualcomm SoundWire masters expose interrupt, FIFO and status
> registers in EE-specific register windows on v2.0 and newer hardware.
> 
> Add support for selecting the SoundWire execution environment from DT
> and use it to program the correct register window for the active EE.

So this is integration details, which can be derived dynamically based
on version or compatible.


> The driver now reads the EE value from the new
> qcom,swr-master-ee-val property, with qcom,ee as a fallback for
> backward compatibility.

> 
> For v2.0+ hardware, the IRQ/FIFO/status register layout is adjusted by
Which exact version, do we have minor or step values for this?

> the EE window stride so the driver programs the correct bank for the
> selected EE. The interrupt enable path is also updated to always use
> the selected EE window.
> 
> This change allows SoundWire interrupt routing and register accesses to
> work correctly on platforms where the master is not mapped to the
> default EE1 window.
> 
> In Shikra, the soundwire execution environment is set to 0 unlike other
> Qualcomm boards.
> 

Can we get this integration details dynamically.
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  drivers/soundwire/qcom.c | 78 +++++++++++++++++++++++++++++++++-------
>  1 file changed, 65 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 3d8f5a81e..f4b8ff77b 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -26,6 +26,7 @@
>  #define SWRM_COMP_STATUS					0x014
>  #define SWRM_LINK_MANAGER_EE					0x018
>  #define SWRM_EE_CPU						1
> +#define SWRM_MAX_EE						1

Can we not make the EE_CPU dynamic and everything should fall in place?
isn't?

Is the register layout changed?

>  #define SWRM_FRM_GEN_ENABLED					BIT(0)
>  #define SWRM_VERSION_1_3_0					0x01030000
>  #define SWRM_VERSION_1_5_1					0x01050001
> @@ -118,6 +119,7 @@
>  #define SWRM_V2_0_CLK_CTRL					0x5060
>  #define SWRM_V2_0_CLK_CTRL_CLK_START				BIT(0)
>  #define SWRM_V2_0_LINK_STATUS					0x5064
> +#define SWRM_V2_REG_EE_STRIDE					0x1000
>  
>  #define SWRM_DP_PORT_CTRL_EN_CHAN_SHFT				0x18
>  #define SWRM_DP_PORT_CTRL_OFFSET2_SHFT				0x10
> @@ -202,6 +204,7 @@ struct qcom_swrm_ctrl {
>  	struct mutex port_lock;
>  	struct clk *hclk;
>  	int irq;
> +	u32 ee;
>  	unsigned int version;
>  	int wake_irq;
>  	int num_din_ports;
> @@ -222,6 +225,7 @@ struct qcom_swrm_ctrl {
>  	u32 slave_status;
>  	u32 wr_fifo_depth;
>  	bool clock_stop_not_supported;
> +	unsigned int reg_layout_local[SWRM_OFFSET_DP_SAMPLECTRL2_BANK + 1];
>  };
>  
>  struct qcom_swrm_data {
> @@ -328,6 +332,36 @@ static const struct qcom_swrm_data swrm_v3_0_data = {
>  };
>  #define to_qcom_sdw(b)	container_of(b, struct qcom_swrm_ctrl, bus)
>  
> +static void qcom_swrm_set_ee_register_layout(struct qcom_swrm_ctrl *ctrl,
> +					     const struct qcom_swrm_data *data)
> +{
> +	int ee_offset;
> +
> +	memcpy(ctrl->reg_layout_local, data->reg_layout,
> +	       sizeof(ctrl->reg_layout_local));
> +	ctrl->reg_layout = ctrl->reg_layout_local;
> +
> +	if (ctrl->version < SWRM_VERSION_2_0_0)
> +		return;
> +
> +	/*
> +	 * Current register constants map EE1. For EE0, use the EE register
> +	 * window stride to access status/IRQ/FIFO registers.
> +	 */
> +	ee_offset = ((int)ctrl->ee - SWRM_EE_CPU) * SWRM_V2_REG_EE_STRIDE;
> +	if (!ee_offset)
> +		return;
> +
> +	ctrl->reg_layout_local[SWRM_REG_FRAME_GEN_ENABLED] += ee_offset;
> +	ctrl->reg_layout_local[SWRM_REG_INTERRUPT_STATUS] += ee_offset;
> +	ctrl->reg_layout_local[SWRM_REG_INTERRUPT_CLEAR] += ee_offset;
> +	ctrl->reg_layout_local[SWRM_REG_INTERRUPT_CPU_EN] += ee_offset;
> +	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_WR_CMD] += ee_offset;
> +	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_RD_CMD] += ee_offset;
> +	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_STATUS] += ee_offset;
> +	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_RD_FIFO_ADDR] += ee_offset;

Why not make these registers take the ee value rather then doing this way?


> +}
> +
>  static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
>  				  u32 *val)
>  {
> @@ -904,12 +938,13 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>  	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
>  
>  	if (ctrl->version == SWRM_VERSION_1_7_0) {
> -		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
> +		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
>  		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
> -				SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
> +				SWRM_MCP_BUS_CLK_START << ctrl->ee);
>  	} else if (ctrl->version >= SWRM_VERSION_2_0_0) {
> -		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
> -		ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL,
> +		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
> +		ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL +
> +				((int)ctrl->ee - SWRM_EE_CPU) * SWRM_V2_REG_EE_STRIDE,
>  				SWRM_V2_0_CLK_CTRL_CLK_START);
>  	} else {
>  		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
> @@ -935,11 +970,9 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>  	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
>  			0xFFFFFFFF);
>  
> -	/* enable CPU IRQs */
> -	if (ctrl->mmio) {
> -		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
> -				SWRM_INTERRUPT_STATUS_RMSK);
> -	}
> +	/* enable CPU IRQs for the selected EE window */
> +	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
> +			SWRM_INTERRUPT_STATUS_RMSK);
>  
>  	/* Set IRQ to PULSE */
>  	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,
> @@ -1545,7 +1578,22 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	data = of_device_get_match_data(dev);
> +	ctrl->ee = SWRM_EE_CPU;
> +	ret = of_property_read_u32(dev->of_node, "qcom,swr-master-ee-val", &ctrl->ee);
> +	if (ret)
> +		ret = of_property_read_u32(dev->of_node, "qcom,ee", &ctrl->ee);
> +	if (ret)
> +		ctrl->ee = SWRM_EE_CPU;
> +	if (ctrl->ee > SWRM_MAX_EE) {
> +		dev_warn(dev, "invalid SoundWire EE %u, using EE%u\n",
> +			 ctrl->ee, SWRM_EE_CPU);
> +		ctrl->ee = SWRM_EE_CPU;
> +	}
>  	ctrl->max_reg = data->max_reg;
> +	/*
> +	 * Defer EE register window selection until HW version is known.
> +	 * For v2.0+ the IRQ/FIFO window is EE-banked.
> +	 */
>  	ctrl->reg_layout = data->reg_layout;
>  	ctrl->rows_index = sdw_find_row_index(data->default_rows);
>  	ctrl->cols_index = sdw_find_col_index(data->default_cols);
> @@ -1623,6 +1671,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  	prop->default_row = data->default_rows;
>  
>  	ctrl->reg_read(ctrl, SWRM_COMP_HW_VERSION, &ctrl->version);
> +	qcom_swrm_set_ee_register_layout(ctrl, data);
>  
>  	ret = devm_request_threaded_irq(dev, ctrl->irq, NULL,
>  					qcom_swrm_irq_handler,
> @@ -1733,16 +1782,19 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
>  		reset_control_reset(ctrl->audio_cgcr);
>  
>  		if (ctrl->version == SWRM_VERSION_1_7_0) {
> -			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
> +			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
>  			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
> -					SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
> +					SWRM_MCP_BUS_CLK_START << ctrl->ee);
>  		} else if (ctrl->version >= SWRM_VERSION_2_0_0) {
> -			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
> -			ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL,
> +			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
> +			ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL +
> +					((int)ctrl->ee - SWRM_EE_CPU) *
> +					SWRM_V2_REG_EE_STRIDE,
>  					SWRM_V2_0_CLK_CTRL_CLK_START);
>  		} else {
>  			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
>  		}
> +
>  		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
>  			SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET);
>  

