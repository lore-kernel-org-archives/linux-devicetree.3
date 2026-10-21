Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792581840;
	b=Om24LMHYmSIYiAjqRTMKrxjIXtOAHCq3HFrrTnXfeYYhBOtEeIcBYElcdlDDHxwAu7YK
	 yB4ZGvag6ddnK59NAvPm7UJyVgTkAZtu/6MmjvfLQZrmXckGFHjEv4Vm2eU2YSZgOQt1v
	 BWr/fMkkp3yhRzm5pidw+9gets4QjTmLxtJm6lk4bdsTBkvl3U6xgw71zzQddDa3lUHB9
	 jwBIKxlytkPzaB9KhNjeaSdbdV9X+jss8SyLTyTXw5jJMgP4PGBqzWG4Nrl0NvKxaRC8Z
	 n3z5+K3Xbp1wz/H14sBj0hOXwNrZy4Ks/AYeFgkktUX571aowpFaylM87OMbu6SgBaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792581840;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uMOgubZ9POR3EPQUnP7Tc2q7GElsLYo5uPzAB2RExmQ=;
	b=MhFbNnDB2MzPBMQg4FFb5ClMTTLIg9eV/8yfKcvTpz3e+bF/sm94SRmOgmHx2eUq61OD
	 gFraYPGnBUIx86tqVfIZXhCwN9tXGt0dQMTQ5YdTag1l92M4NvRIBbCUZAp7LcCR78KgE
	 nLSYadN1fuLNg1HtihKwJOojurKrI3X2NwCMV78KjvcOyzL79tHjS+X5kN49EBvbD2f/Y
	 F+UzNQuvOaKApd0XJOkeriJOICIT3ncxVZAI2qMIb5C4Il7+GQPSG7gkcj0kkjAvvyK5a
	 X3BGechXYFgh2qDiKAdgiCN6bzgx0e4wfDTJEoLSBzt5+rl/b3KngQXyx5Vxr1zfopg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dNSbFL1D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IJ1KZ3zJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8B8606A323
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED8B8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dNSbFL1D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IJ1KZ3zJ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBNc0c1014599
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uMOgubZ9POR3EPQUnP7Tc2q7GElsLYo5uPzAB2RExmQ=; b=dNSbFL1DE56q8Ruk
	R8M08kmvVdNhGeruKLN+Upj6jQNsDs+EaMp905UWYV4osNRX7NE1owPx70/BfzvJ
	Zu3We+Vsck6QDewQFRBwChkCyMNDYZTCelnthSS5YoR3RDjv4OWFt8YF7TLMtsRB
	3Daoa2V8xHSY+uS9og7zB7PueJ2vbAb7TWIqaU6F/P8U/rdHMUiiepEvx4kXHJBU
	kbVbgnw4Rx6kP0z/WcoOeKViKxLGvlULhVcR0KIb5VJ/caVdEhZuMuBd6Wd8L8xj
	pCzF12xEoNHS7Gk/6IxOWohafUvy+WcuslN9KkzEgAyjrWKIffZ17Xa/zSBxlk7Y
	f2hqTw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajkmxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:23:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso1008985a91.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 04:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792581838; x=1793186638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uMOgubZ9POR3EPQUnP7Tc2q7GElsLYo5uPzAB2RExmQ=;
        b=IJ1KZ3zJs4hjudMevbxqwpwZSE9e4CCApSRPH0CiT5YD8lc7xiPEpqDGe4u8kbymUZ
         I2X7RdOc5Dh6W9aX7uEkYZxyrVCGyL2DElQ2tty7r2PS+wypRNWmTUWOZiSkO2jmBLin
         x7xFaHxs0itCV7XHCEWO3cn+SWjc+RLmkJcV1cHfnuKQbzE0rica2eodSAkNB4vLWTJv
         E2MBU2IPFQn/9uAURRFqXPRLYyJxu/vRBBn7U0Lzz0aBK5ujRyEmQS2wpcjFiqHo0z2f
         mwt/brULrj8bpRJ+SAYYTStqfuFt6TFYqshf1yUuVLGIqhat2VvA9R9dIk5uHIQzlBQz
         d9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792581838; x=1793186638;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uMOgubZ9POR3EPQUnP7Tc2q7GElsLYo5uPzAB2RExmQ=;
        b=BIj32Ai47LZPl5whNx1WQieIAE8fqyksBvBIcs4786SVN6ayH7hmKBF3OUYiVc1inN
         WY5UJQi0BU/Bz5Th0fUyOFwWpv1sk1CyjjvycIAV2ZICbJ3tHn8Yb/NMfBsmzqfwVCPg
         J9XOHbiZ8CUeRIysYOVPPZM0YNv3UI3wjcwuIXGUB6of58Clqk4ExfLDUPgrtw5gint2
         s71UrpnGRkvneD9V9vVHBkLOe9B9a/W5JDnNCIadhhvHcJRyvI3n98L2S56Mp7QVO/UV
         cyjTu4+sVi7+tMsUiNA3FSBwwf0psivBmnNP+KJCOvFFlB5dlmiivSTZFf8YfpPqGzNW
         pamw==
X-Forwarded-Encrypted: i=1; AKwUvByZjdDAD8mffgb78X9grcJCI02NUFeGgngJ9OEuFzUmFX3rI6lgDUrsWydU0KklXIfZasO6dwkdMwEX@vger.kernel.org
X-Gm-Message-State: AFq9FYJY4A+GOIxa7WcDCS9csT/I3HXE89/4V0tlk+qTdXu4nARDOUU3
	4CegMgZTsN4adHqodM3TcD4HnNivZhrpK0kciy0ZV6Ai9Ro0B++7//DmEAypZgPnHpvAxqydYu3
	5iW8k2mIB8cTIdFgmKeS8H38c4pezzcJXKsi0Tncj/3x7C0k8L2X+I97+jN94Dkgc
X-Gm-Gg: AYBFou1TS05q5281U2mqg5NPi+XXcG0N2uHYhGkMZyFrYGg+md5QY5FAMDD5hwbIyrX
	i0wmTidVSUrA2lpaiR3E1IX6977wOagApd0GRSt8915SnZHZLsrKkEJL8DqPOYyRbWv+gzuF5ay
	gOkQ0F22j4Ws1SfZjM5ZOxRyQOKXdULYZJRJSF4jHUiHQT1EXXCBCOF0PZncF2lOvwKCWBu9E9b
	a5Zaw85wcUuHH01jq5LqbRNUB3Vq0AW156rmwrzYNtd1r77E4oUB0aJDrOw/XeozMJ43sh+s58P
	YZT1y1CliRz2E/woph8aU0ySuAVXQVsSoi/swznpxjC7lHkaR+NrYsQPHtQwdQTrpAd6BoSMtja
	G852j0Nekkz1IZlmlzQLtdqr/dGKl
X-Received: by 2002:a17:90b:2c8d:b0:3ac:7406:b49 with SMTP id 98e67ed59e1d1-3ad86e96741mr999959a91.15.1792581837404;
        Wed, 21 Oct 2026 04:23:57 -0700 (PDT)
X-Received: by 2002:a17:90b:2c8d:b0:3ac:7406:b49 with SMTP id 98e67ed59e1d1-3ad86e96741mr999941a91.15.1792581836958;
        Wed, 21 Oct 2026 04:23:56 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad811c515fsm3765832a91.9.2026.10.21.04.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:23:56 -0700 (PDT)
Message-ID: <e127d06a-2c1f-463f-a30d-ee7815fe4a75@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:53:46 +0530
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
Subject: Re: [PATCH v2 07/13] phy: qcom: edp: Add Nord-specific register
 offsets
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar
 <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-7-a2ab9af954d2@oss.qualcomm.com>
 <q7riz5qxge3gqjqz23xz5aecfhlg7bry5w3wzgblnyozm7ac7y@b5s3z7vk2k2w>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <q7riz5qxge3gqjqz23xz5aecfhlg7bry5w3wzgblnyozm7ac7y@b5s3z7vk2k2w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NSBTYWx0ZWRfX+JRrC5ayzSvR
 5gKldrHCNTSxde3wZa3rR+znqcpZNdALtEaY9QOBi2Sv7QxXovkqaKGcA4nDT9OubweJTcqkOl6
 marwh97ZBw4UCvoH+1YQ+8kVBAAjU2ej83Ho+lF3VxBXy9SEI1avxl268MJQYjg5hpg0wk3kYRv
 SY8EM0zgvo10fRxykF5uni93x06coGdajkYplKrSQA3HGH36EL904Lnou/9SFuUbIj8XuLIco9x
 KEChybm85jfWKnafP6ws1KJ0dlmzx55euHMTCEb+EQoJNDjbTO2GR7X4WPFMM9xefNq4AZRZUd8
 XemirRuoQ6FLwh6Tg20xgXUi/0OjXzgJ8/8KYxTTEv7B5kJP3xYTyibIQQWl0kwg7Q7imp4kgYW
 9YanIJ47oldbrVFe8Wq2s0XQG5I7CrDB4mNAfcQyqjxdcP3DUE2X00JNGcTG6m1If5YIVPomljU
 yWa5oZb9yDxPntMOhXQ==
X-Proofpoint-GUID: j-I3xVk2hi_EYkBRRoY3eUPtaQ9gmW8Q
X-Proofpoint-ORIG-GUID: j-I3xVk2hi_EYkBRRoY3eUPtaQ9gmW8Q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NSBTYWx0ZWRfXzORjZdrywGl2
 j0r9yIBS0CGu6pH1i/Q3FPk0WotvZ74cU/SvCW5HEktXxI+YVBz/U+QGWFLsC8L8NS3fjWIBnt5
 qh52jsAIGHNbcBF1dUUyDPvzJWx7ppI=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad8a0ce cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=YZ6MeopCirwGMcWCqvsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210045


On 10/13/2026 3:49 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 12, 2026 at 07:02:17PM +0530, Nabige Aala wrote:
>> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>>
>> Nord relocates several DP PHY and QSERDES v8 COM registers relative
>> to existing SoCs.
> Why?
>
>> Add Nord-specific defines for the relocated and
>> new-only registers in phy-qcom-qmp-qserdes-dp-com-v8.h and
>> phy-qcom-edp.c so Nord sequences can reference them by name.
> Typically we don't do it, If something differs, it should get its own
> set of headers, describing all necessary offsets (especially for the
> QSERDES). Otherwise it's not obvious if other regs (without the _NORD
> counterpart) are valid or not.

Ack,

Are you suggesting that we introduce a new header file for QSERDES?
If so, we're currently using the v8 header. What naming convention 
should we follow for the new header file?

>
>> Assisted-by: LLM
>> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-edp.c                   | 7 +++++++
>>   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h | 3 +++
>>   2 files changed, 10 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
>> index a3c893f72908..d5c6835b6c70 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
>> @@ -42,8 +42,15 @@
>>   #define DP_PHY_VCO_DIV                          0x0074
>>   #define DP_PHY_TX0_TX1_LANE_CTL                 0x007c
>>   #define DP_PHY_TX2_TX3_LANE_CTL                 0x00a0
>> +#define DP_PHY_TX2_TX3_LANE_CTL_NORD            0x00c0
>>   
>>   #define DP_PHY_STATUS                           0x00e0
>> +#define DP_PHY_STATUS_NORD                      0x0110
>> +#define DP_PHY_LDO_CFG_NORD                     0x00f0
>> +
>> +#define DP_PHY_TX_LN0_DRV_LVL_NORD             0x00e4
>> +#define DP_PHY_TX_LN1_DRV_LVL_NORD             0x00e8
>> +#define TXn_TX_BAND_NORD                        0x0024
>>   
>>   /* LANE_TXn registers */
>>   #define TXn_CLKBUF_ENABLE                       0x0000
> I'd suggest adding these together with the actual users.

Ack, I will update in the next revision.

Thanks,

Nabige

>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
>> index 93edabb830af..008b17222a8d 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
>> @@ -48,5 +48,8 @@
>>   #define DP_QSERDES_V8_COM_CLK_FWD_CONFIG_1		0x2f4
>>   #define DP_QSERDES_V8_COM_CMN_STATUS			0x314
>>   #define DP_QSERDES_V8_COM_C_READY_STATUS		0x33c
>> +#define DP_QSERDES_V8_COM_SVS_MODE_CLK_SEL_NORD		0x17c
>> +#define DP_QSERDES_V8_COM_CMN_STATUS_NORD		0x1d0
>> +#define DP_QSERDES_V8_COM_C_READY_STATUS_NORD		0x1f8
>>   
>>   #endif
>>
>> -- 
>> 2.34.1
>>
