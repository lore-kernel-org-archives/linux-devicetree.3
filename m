Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792715633;
	b=DJa15q/PCBJniKjciwy+VS8efp94Z3ZZ2LXe+VVy4RQvSUgD6kNtyGMr4yPHbDRMUbIC
	 pQ5KNCOzP67yoFAv+81veyvQrcnUekqSEu3TUyL0davk315ZSF0Wg+TkKu7xjvHtTAWqf
	 LzRELHGySN7DfkNY3x4Oljj9jH9Xen0/2S4PN+5yZMtH1vf2Lh8sFEYEQfaN8OiV+Lt64
	 lXll5nN9fP95RHSpFLEexkV2gMA4VRCxpfEXooW2VcCrnkrXdBnGCTcOte4c6bynQig+9
	 phARKArJXSJD2xpaofPOysvLJ8fhrIbenMheLJicz4l0R4j5xk+LDrnh/rxA1tY4x+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792715633;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Bcpdyh2Rch8ZgMuzB2NI7c22cVcvgZ2KSRIeKtslHpw=;
	b=MPliPNKQse8wuDS0FEn3ld/9kScdZu+wLCD61n9ZP3d4z8p291h+L+83PuVaZ7WddMhv
	 0v0pqXo/ykN4xq9u1ctzb5ciUkpWGQrJN3Ny5A89QE/0gXIdvp1rn+pR8h7LCXfpEjGHn
	 icvTjvDaAC0g8PtVJV288oxdJFgCI8l6xWzchxznvttfuuX+AeXrNcSL7JbeG3/18pmff
	 HdCtImhwpiWipW5na1xJuKdbjt5KokBwCV/smByZ01cbL39EcIWgC+Htqg04adWTKniwI
	 wYH8yu3v27cZpSnAr2OY02GacA4dmTh7RkC8xYtX36UNvPjuJuWrpDrMPeCzLrU2O3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fcniAxqi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ClqrqH4V;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6F2606A31D
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF6F2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fcniAxqi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ClqrqH4V
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MMFEMX1412609
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bcpdyh2Rch8ZgMuzB2NI7c22cVcvgZ2KSRIeKtslHpw=; b=fcniAxqiAREpru5+
	idc0NbAK8O75LU6J5O0fAOkf16ay/zqAoI8/cLH31J+0crCWmfY0+f324QfZU42P
	+k3kNkW3/rZtWiyb4REkHsPmHh5Bgr18AUDG2r6lNt7DH9PWks2CcT2pMAya2r7/
	i4yYX6t2fn07zJ5ogfMEBy+tK8WRyMuWCjpms68GR2g0ZffeGC/kWAnMr7Ei58FV
	e3CbgJl9O3WAkjHlRv4qN8BvrSm3+64+xbJLSylBsAxNa5Ouliq5Uzs8Rx5sUsVx
	4uKlMKdi44t8/U12+xf8/ILC/wY7qXzjop+ypfeEnvJqAPevyq0sRuv1ZqlX0zY0
	ZBVnDA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0hraw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:33:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36998507c13so379720eec.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792715631; x=1793320431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bcpdyh2Rch8ZgMuzB2NI7c22cVcvgZ2KSRIeKtslHpw=;
        b=ClqrqH4VoL9hbXtTXfbCEvL6qVVbdz8rWVKktEBb4dsvG3mU4wTS8kiJcQdU43VVWp
         TEzMRCqQX199fLFWYPOjtXeonp5x7W05brGiyNX6LHpjzSNyCDMm0aicKMpXu0LCcrqN
         catOBQjAIPp6kOvxqv5y51djpFArf1toC22/jlEtNBlCf9mDzWgvQzZlBwrfat3Nsy1W
         tOZQtQty/31aa6dOPYkQchk9kM5FnU9CQcvVrGh24XsqNw9u/J1CnTqlxop1LUZgZbvV
         g+eJFSeCDel8pDgxkb4JMIOLwDfu2PA4GhhFpvP9P2uOSxHeiWR2cjrFxg/VkQMsix/6
         ugOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792715631; x=1793320431;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bcpdyh2Rch8ZgMuzB2NI7c22cVcvgZ2KSRIeKtslHpw=;
        b=YvX6hb5fshJ4dvpNxn3Qf0aW0Spe3gfmRx6HfTGBj7LU0knLqEjVEF3OLmsp+CJ1KT
         ADV78BTYdsVeXlhaRRBtH0vqKjvCh03OHlEdxYTCNA7Km9ogaE1sB2xDrWB17KDnPdF6
         ikf3HxlDjHHgYMtFEtOi2NJrLn6dzBEsGUjsroQWhfSDVKLSpGxigvEhP7UUbCMWoOPI
         NOkhn1jGARDNFGpGk0Ly4194XBvC9YitDPOSOqxiTolIK+3bbNtc5l8qs1a6i1cZn6hB
         JQz2RIIK0O/Vx+R9Sxyj3jHE7o57PNjLte3AAxjAJbIca3xq2M/iMjyqP4R9rePCk+HA
         /wTA==
X-Forwarded-Encrypted: i=1; AKwUvBxkvYp+4LvVehJ5zd/39pnb4FvvZtiSpMuWqHp+nwwWzdqbvUjCNja5Y6D8idN/1eZUctH/fLEPgtbC@vger.kernel.org
X-Gm-Message-State: AFq9FYJZm1XPOZzvM1Zp2pR2QgmUThm0ZtGGwJx4qhotm5nWKkohQuPk
	Xf7ACLZT4AgbuejIh6kruGUZFX7lc2Hp1fbNnjWBk4soPLtiKotMwhnjGlnp131T73QLE0Z+cwx
	I1hJSGac8P9xOTCnYYME8QzAhgIGbNXwecOD55TvNOw6pGw/RI8WfLV7Y5ZZT4P843tlPRTIG
X-Gm-Gg: AYBFou02nopJ/LBAYAtGSdgeLczh/xkjpqP2BeMXySnav+HQIoL7p/w9IOtBtoUsFNI
	iJH/G7eN7NMFebLGHyJCjOGlHQtmG6WcebVf368m5u3Ze0Agc49Y8qpbOb7IyO+p0fO3MqvfZsI
	1otTC/kGl9p5V7nSBjPzeEmeG7x9NQi41UsB6ypVuKMDiWjXd00Pj5qZ6g4Dy0rRyNicYzmqYf6
	JxV5fvoz3qwsmiDMfqfjltL0s6QOy10a3Z/lOSF4UzyVZlHaC1jTL878Qbnq5+AwUKXqBs41Mqd
	x0crBWd0/5qfaVlOPybatW6ENujhHqJEFGHVFxyx4sSNUB7klGqLdEYEVrpFWBUS3ddYsTucbcc
	nnWTGT03HMHtYLeuBdwIAdITANdD8U+IlWsmND4mOIcMKgsr1/zbpU3Nn
X-Received: by 2002:a05:7301:6f09:b0:359:818a:df2d with SMTP id 5a478bee46e88-369d9869323mr785141eec.31.1792715630111;
        Thu, 22 Oct 2026 17:33:50 -0700 (PDT)
X-Received: by 2002:a05:7301:6f09:b0:359:818a:df2d with SMTP id 5a478bee46e88-369d9869323mr785110eec.31.1792715629330;
        Thu, 22 Oct 2026 17:33:49 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d8978csm2283102eec.13.2026.10.22.17.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 17:33:48 -0700 (PDT)
Message-ID: <f689ccfe-4adb-41f6-b492-97a48090413d@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:33:47 -0700
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
Subject: Re: [PATCH 1/3] phy: core: add generic MIPI C-PHY configuration API
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
 <20261017041733.3946816-2-anusha.nandi@oss.qualcomm.com>
 <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rd0QCthnjRveDY4FMxpqMYUyjQDl-zY2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAwMSBTYWx0ZWRfX/z6euk4kFtHp
 VyKiXpaRygUyH1UFWKJt0bTafXCJZtZ5tSduJvArtMbJL9LN/8OnKmKDjWgvSVojbxpm0G93CHX
 IYLbZwlHnPP5QAjjouuMCxapQKf4HyFvpeF0p+s9mHtBZQK0w86XivKuSrpFqX9cnFu4xyH2tiO
 oguQEtb++sSZBLryblJfMHtWcHH9/7y30r52JYoqcFNyVINOievB8PyiYwYjjXs3KLST8t96KOx
 /cg1zxuI/gLFTUUMDWryYlWxGEjjhu1IX4GnCf/rrV9QtfssKHIA4LCC/6HQ2ah1c7iY9sVee/x
 EwUUgq0HU0K50yCWZLSviOvQNPCSIrimWJbVTVWbpkaaRGGe9+kCpOF9lzCKizePrJ4p5qIAme5
 NOINTU1/84kd1kskMrumusW00m2w/mDgTiwXFdqYygI814XrQlBjEDPRqulYJm8MhLDOg06uKqO
 UbNI7m5vXZSWBOsb8TA==
X-Proofpoint-GUID: rd0QCthnjRveDY4FMxpqMYUyjQDl-zY2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAwMSBTYWx0ZWRfX5lQ53sIP3sGW
 clCOWA2xJagiKCnx5XEw6Rn99z4dHnJdbIRe53VjXtlR7VmXpLfZnCNurpNbuF2KF20CeVyRmXp
 +pPQiknUVJRx0MDOnKQ70lFMrBuxmr4=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adaab6f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=dOq9m7WOZSnMFsiCC74A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230001

Hi Bryan,

Thank you for your analysis and comments.

On 10/17/2026 4:00 PM, Bryan O'Donoghue wrote:
> On 17/10/2026 05:17, Anusha Arun Nandi wrote:
>> Add PHY_MODE_MIPI_CPHY, struct phy_configure_opts_mipi_cphy and three
>> helpers: phy_mipi_cphy_get_default_config(),
>> phy_mipi_cphy_get_default_config_for_hsclk() and
>> phy_mipi_cphy_config_validate(). These mirror the existing MIPI D-PHY
>> generic configuration API (phy-core-mipi-dphy.c) so PHY providers can
>> be configured for C-PHY via phy_configure().
>>
>> C-PHY encodes 16 bits per 7 symbols across a 3-wire trio; the default
>> config helper derives the required per-trio symbol rate from the pixel
>> clock, bits-per-pixel and lane (trio) count the same way the D-PHY
>> helper derives its HS clock rate. The timing fields are filled in from
>> the MIPI Alliance Specification for C-PHY (v1.0), Table 18 "Global
>> Operation Timing Parameters"; unlike D-PHY, these are not data-rate
>> dependent, so phy_mipi_cphy_get_default_config() fills the spec's
>> minimum values directly rather than computing them from the symbol
>> rate, and phy_mipi_cphy_config_validate() checks each field against
>> its spec-defined bound.
>>
>> No existing phy consumer or provider selects GENERIC_PHY_MIPI_CPHY
>> yet, so this commit has no functional effect on its own.
>>
>> Co-developed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
>> Signed-off-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> ---
>>   drivers/phy/Kconfig               |   9 ++
>>   drivers/phy/Makefile              |   1 +
>>   drivers/phy/phy-core-mipi-cphy.c  | 131 ++++++++++++++++++++++
>>   include/linux/phy/phy-mipi-cphy.h | 177 ++++++++++++++++++++++++++++++
>>   include/linux/phy/phy.h           |   5 +
>>   5 files changed, 323 insertions(+)
>>   create mode 100644 drivers/phy/phy-core-mipi-cphy.c
>>   create mode 100644 include/linux/phy/phy-mipi-cphy.h
>>
>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>> index 19f3b7d12b7d..a6b0749a40cc 100644
>> --- a/drivers/phy/Kconfig
>> +++ b/drivers/phy/Kconfig
>> @@ -46,6 +46,15 @@ config GENERIC_PHY_MIPI_DPHY
>>         Provides a number of helpers a core functions for MIPI D-PHY
>>         drivers to us.
>>   +config GENERIC_PHY_MIPI_CPHY
>> +    bool
>> +    select GENERIC_PHY
>> +    help
>> +      Generic MIPI C-PHY configuration helpers.
>> +
>> +      Provides a number of helper core functions for MIPI C-PHY
>> +      drivers to use.
>> +
>>   config PHY_AIROHA_PCIE
>>       tristate "Airoha PCIe-PHY Driver"
>>       depends on ARCH_AIROHA || COMPILE_TEST
>> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
>> index d7aa516bcc49..a94dc1b352e1 100644
>> --- a/drivers/phy/Makefile
>> +++ b/drivers/phy/Makefile
>> @@ -7,6 +7,7 @@ obj-$(CONFIG_PHY_COMMON_PROPS)        += phy-common-
>> props.o
>>   obj-$(CONFIG_PHY_COMMON_PROPS_TEST)    += phy-common-props-test.o
>>   obj-$(CONFIG_GENERIC_PHY)        += phy-core.o
>>   obj-$(CONFIG_GENERIC_PHY_MIPI_DPHY)    += phy-core-mipi-dphy.o
>> +obj-$(CONFIG_GENERIC_PHY_MIPI_CPHY)    += phy-core-mipi-cphy.o
>>   obj-$(CONFIG_PHY_AIROHA_PCIE)        += phy-airoha-pcie.o
>>   obj-$(CONFIG_PHY_CAN_TRANSCEIVER)    += phy-can-transceiver.o
>>   obj-$(CONFIG_PHY_ECONET_PCIE)        += phy-econet-pcie.o
>> diff --git a/drivers/phy/phy-core-mipi-cphy.c b/drivers/phy/phy-core-
>> mipi-cphy.c
>> new file mode 100644
>> index 000000000000..303b9a02f096
>> --- /dev/null
>> +++ b/drivers/phy/phy-core-mipi-cphy.c
>> @@ -0,0 +1,131 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + *
>> + * Generic MIPI C-PHY configuration helpers.
>> + */
>> +#include <linux/phy/phy-mipi-cphy.h>
>> +#include <linux/errno.h>
>> +#include <linux/export.h>
>> +#include <linux/kernel.h>
>> +#include <linux/math64.h>
>> +
>> +/*
>> + * C-PHY carries 16 bits per 7 symbols per trio (lane).
>> + */
>> +#define PHY_MIPI_CPHY_SYMBOLS_PER_GROUP        7
>> +#define PHY_MIPI_CPHY_BITS_PER_GROUP        16
>> +
>> +/*
>> + * Fill in the C-PHY global operation timing parameters based on the
>> MIPI
>> + * Alliance Specification for C-PHY (v1.0), Table 18 "Global
>> Operation Timing
>> + * Parameters". These parameters are not data rate dependent (see
>> sections
>> + * 6.14.3 and 6.14.4 of that specification), so unlike the D-PHY
>> equivalent
>> + * this helper does not need the symbol rate to compute them.
>> + */
>> +static int phy_mipi_cphy_calc_config(unsigned long pixel_clock,
>> +                     unsigned int bpp, unsigned int lanes,
>> +                     unsigned long long hs_clk_rate,
>> +                     struct phy_configure_opts_mipi_cphy *cfg)
>> +{
>> +    if (!cfg || !lanes)
>> +        return -EINVAL;
> 
> Lanes must be a multiple of three to be valid, at least for your three
> submissions to be logically consistent, this statement must be so.
> 
I will update the name of lanes to data_lanes in
phy_configure_opts_mipi_cphy struct.
I will add more sanity checks for data_lanes > 3, as C-PHY supports 3
data lanes only.
>> +
>> +    if (!hs_clk_rate) {
>> +        if (!bpp)
>> +            return -EINVAL;
>> +
>> +        /*
>> +         * Total payload bits/s = pixel_clock * bpp, spread over the
>> +         * active trios. C-PHY carries 16 bits per 7 symbols per trio,
>> +         * so the per-trio symbol rate is the bit rate scaled by 7/16.
>> +         */
>> +        hs_clk_rate = (unsigned long long)pixel_clock * bpp;
> 
> 
>> +        hs_clk_rate = DIV_ROUND_UP_ULL(hs_clk_rate *
>> +                        PHY_MIPI_CPHY_SYMBOLS_PER_GROUP,
>> +                        (unsigned long long)lanes *
>> +                        PHY_MIPI_CPHY_BITS_PER_GROUP);
>> +    }
>> +
>> +    cfg->lanes = lanes;
>> +    cfg->hs_clk_rate = hs_clk_rate;
>> +
>> +    cfg->t3_prepare = 38000;
>> +    cfg->t3_term_en = 0;
>> +    cfg->t3_settle = 95000;
>> +    cfg->t3_hs_exit = 100000;
>> +    cfg->lpx = 50000;
>> +    cfg->init = 100;
> 
> Whatever about how DPHY does this in upstream Linux, these values should
> be defines with names that mean something WRT the specification.
> 
Makes sense, the v2 series will have this addressed.
>> +    cfg->ta_get = 5 * cfg->lpx;
>> +    cfg->ta_go = 4 * cfg->lpx;
>> +    cfg->ta_sure = cfg->lpx;
>> +    cfg->wakeup = 1000;
>> +
>> +    return 0;
>> +}
>> +
>> +int phy_mipi_cphy_get_default_config(unsigned long pixel_clock,
>> +                     unsigned int bpp, unsigned int lanes,
>> +                     struct phy_configure_opts_mipi_cphy *cfg)
>> +{
>> +    if (!bpp)
>> +        return -EINVAL;
>> +
>> +    return phy_mipi_cphy_calc_config(pixel_clock, bpp, lanes, 0, cfg);
>> +}
>> +EXPORT_SYMBOL_GPL(phy_mipi_cphy_get_default_config);
>> +
>> +int phy_mipi_cphy_get_default_config_for_hsclk(unsigned long long
>> hs_clk_rate,
>> +                           unsigned int lanes,
>> +                           struct phy_configure_opts_mipi_cphy *cfg)
>> +{
>> +    if (!hs_clk_rate)
>> +        return -EINVAL;
>> +
>> +    return phy_mipi_cphy_calc_config(0, 0, lanes, hs_clk_rate, cfg);
>> +}
>> +EXPORT_SYMBOL_GPL(phy_mipi_cphy_get_default_config_for_hsclk);
>> +
>> +/*
>> + * Validate C-PHY configuration according to the MIPI Alliance
>> + * Specification for C-PHY (v1.0), Table 18 "Global Operation Timing
>> + * Parameters".
>> + */
>> +int phy_mipi_cphy_config_validate(struct phy_configure_opts_mipi_cphy
>> *cfg)
>> +{
>> +    if (!cfg || !cfg->lanes)
>> +        return -EINVAL;
>> +
>> +    if (cfg->t3_prepare < 38000 || cfg->t3_prepare > 95000)
> 
> T3_PREPARE_MIN T3_PREPARE_MAX etc I'm stating a preference of course but
> I think its better practice to define your constants with names that
> mean things as frequently we end up reusing constants all over the place.
> 
Keeping in mind to rectify this as well.

>> +        return -EINVAL;
>> +
>> +    if (cfg->t3_term_en > 38000)
>> +        return -EINVAL;
>> +
>> +    if (cfg->t3_settle < 95000 || cfg->t3_settle > 300000)
>> +        return -EINVAL;
>> +
>> +    if (cfg->t3_hs_exit < 100000)
>> +        return -EINVAL;
>> +
>> +    if (cfg->lpx < 50000)
>> +        return -EINVAL;
>> +
>> +    if (cfg->init < 100)
>> +        return -EINVAL;
>> +
>> +    if (cfg->ta_get != 5 * cfg->lpx)
>> +        return -EINVAL;
>> +
>> +    if (cfg->ta_go != 4 * cfg->lpx)
>> +        return -EINVAL;
>> +
>> +    if (cfg->ta_sure < cfg->lpx || cfg->ta_sure > (2 * cfg->lpx))
>> +        return -EINVAL;
>> +
>> +    if (cfg->wakeup < 1000)
>> +        return -EINVAL;
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(phy_mipi_cphy_config_validate);
>> diff --git a/include/linux/phy/phy-mipi-cphy.h b/include/linux/phy/
>> phy-mipi-cphy.h
>> new file mode 100644
>> index 000000000000..7627602eb57f
>> --- /dev/null
>> +++ b/include/linux/phy/phy-mipi-cphy.h
>> @@ -0,0 +1,177 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +#ifndef __PHY_MIPI_CPHY_H_
>> +#define __PHY_MIPI_CPHY_H_
>> +
>> +#include <linux/types.h>
>> +
>> +#define PHY_MIPI_CPHY_MAX_DATA_LANES    4
>> +
>> +/**
>> + * struct phy_configure_opts_mipi_cphy - MIPI C-PHY configuration set
>> + *
>> + * This structure is used to represent the configuration state of a
>> + * MIPI C-PHY phy. The timing fields are named after their symbol in
>> + * the MIPI Alliance Specification for C-PHY (v1.0), Table 18 "Global
>> + * Operation Timing Parameters", and are all time values in picoseconds
>> + * (microseconds for @init and @wakeup) that are not data rate dependent
>> + * (see Table 18 and sections 6.14.3/6.14.4 of that specification).
>> + */
>> +struct phy_configure_opts_mipi_cphy {
>> +    /**
>> +     * @lanes:
>> +     *
>> +     * Number of active C-PHY trios (data lanes).
>> +     */
>> +    unsigned int        lanes;
> 
> This statement and how you go about using the data aren't consistent.
> 
> In CAMSS you do
> 
> /* Set data trio lane positions and polarities (no clock lane) */
> for (i = 0; i < num_lanes; i++) {
>     cphy_cfg->lane_positions[i] = lncfg->data[i].pos;
>     cphy_cfg->lane_polarities[i] = lncfg->data[i].pol;
> }
> 
> where num_lanes == lncfg->num_data;
> 
> Let's assume dt has data-lanes = <1 2 3>; => num_data == 3
> 
> Then in qcom-mipi-csi2-core you do:
> 
> /* C-PHY has no clock lane; all entries map data trios. */
> for (i = 0; i < csi2phy->stream_cfg.num_data_lanes; i++) {
>     if (data_lanes[i] < 1 || data_lanes[i] > CSI2_MAX_DATA_LANES) {
>         dev_err(dev, "Invalid lane %d\n", data_lanes[i]);
>         ret = -EINVAL;
>         goto out_put;
>     }
> 
>     csi2phy->stream_cfg.lane_cfg.data[i].pos = data_lanes[i] - 1;
>     csi2phy->stream_cfg.lane_cfg.data[i].pol = lane_polarities[i];
> }
> 
> This specifies which physical lanes will be in CPHY mode and what their
> polarities will be
> 
> =>
> 
> lanes specifies the number of pads in a trio
> data_lanes specifies which pads are in those trios
> lane_polarities specifies the polarity of each of the given pads
> 
> To my knowledge the C-PHY specification doesn't mandate adjacent LNx as
> required in a trio.
> 
> => lanes % 3 should be invalid
> => for each trio lanes must increase by 3 also.
> 
We will do calculations based on data_lanes only.

> 
>> +
>> +    /**
>> +     * @hs_clk_rate:
>> +     *
>> +     * High speed symbol rate in symbols/s derived from link rate.
>> +     *
>> +     * C-PHY encodes 16 bits per 7 symbols across a 3-wire trio.
>> +     * Consumers fill this from the sensor link frequency and hand
>> +     * it to phy_configure().
>> +     */
>> +    unsigned long        hs_clk_rate;
>> +
>> +    /**
>> +     * @lane_positions:
>> +     *
>> +     * Physical-to-logical trio (data lane) position mapping. Entry @i
>> +     * gives the physical lane position carrying logical trio @i. C-PHY
>> +     * has no clock lane, so all entries map data trios only.
>> +     */
>> +    unsigned char        lane_positions[PHY_MIPI_CPHY_MAX_DATA_LANES];
>> +
>> +    /**
>> +     * @lane_polarities:
>> +     *
>> +     * Polarity (0 = normal, 1 = swapped) of each logical trio. Entry
>> +     * @i corresponds to logical trio @i.
>> +     */
>> +    bool            lane_polarities[PHY_MIPI_CPHY_MAX_DATA_LANES];
>> +
>> +    /**
>> +     * @t3_prepare:
>> +     *
>> +     * Time, in picoseconds, that the transmitter drives the
>> +     * 3-wire LP-000 line state immediately before the HS_+x line
>> +     * state starting HS transmission.
>> +     *
>> +     * Minimum value: 38000 ps
>> +     * Maximum value: 95000 ps
>> +     */
>> +    unsigned int        t3_prepare;
>> +
>> +    /**
>> +     * @t3_term_en:
>> +     *
>> +     * Time, in picoseconds, for the slave to enable the HS line
>> +     * termination, starting from the time point when the A, B
>> +     * and C wires cross VIL_MAX.
>> +     *
>> +     * Maximum value: 38000 ps
>> +     */
>> +    unsigned int        t3_term_en;
>> +
>> +    /**
>> +     * @t3_settle:
>> +     *
>> +     * Time interval, in picoseconds, during which the HS receiver
>> +     * should ignore any HS transitions on the lane, starting from
>> +     * the beginning of @t3_prepare.
>> +     *
>> +     * Minimum value: 95000 ps
>> +     * Maximum value: 300000 ps
>> +     */
>> +    unsigned int        t3_settle;
>> +
>> +    /**
>> +     * @t3_hs_exit:
>> +     *
>> +     * Time, in picoseconds, that the transmitter drives LP-111
>> +     * following an HS burst.
>> +     *
>> +     * Minimum value: 100000 ps
>> +     */
>> +    unsigned int        t3_hs_exit;
>> +
>> +    /**
>> +     * @lpx:
>> +     *
>> +     * Transmitted length, in picoseconds, of any low-power state
>> +     * period.
>> +     *
>> +     * Minimum value: 50000 ps
>> +     */
>> +    unsigned int        lpx;
>> +
>> +    /**
>> +     * @init:
>> +     *
>> +     * Time, in microseconds, for the initialization period to
>> +     * complete.
>> +     *
>> +     * Minimum value: 100 us
>> +     */
>> +    unsigned int        init;
>> +
>> +    /**
>> +     * @ta_get:
>> +     *
>> +     * Time, in picoseconds, that the new transmitter drives the
>> +     * Bridge state (LP-000) after accepting control during a
>> +     * link turnaround.
>> +     *
>> +     * Value: 5 * @lpx
>> +     */
>> +    unsigned int        ta_get;
>> +
>> +    /**
>> +     * @ta_go:
>> +     *
>> +     * Time, in picoseconds, that the transmitter drives the
>> +     * Bridge state (LP-000) before releasing control during a
>> +     * link turnaround.
>> +     *
>> +     * Value: 4 * @lpx
>> +     */
>> +    unsigned int        ta_go;
>> +
>> +    /**
>> +     * @ta_sure:
>> +     *
>> +     * Time, in picoseconds, that the new transmitter waits after
>> +     * the LP-100 state before transmitting the Bridge state
>> +     * (LP-000) during a link turnaround.
>> +     *
>> +     * Minimum value: @lpx
>> +     * Maximum value: 2 * @lpx
>> +     */
>> +    unsigned int        ta_sure;
>> +
>> +    /**
>> +     * @wakeup:
>> +     *
>> +     * Time, in microseconds, that a transmitter drives a Mark-1
>> +     * state prior to a Stop state in order to initiate an exit
>> +     * from ULPS.
>> +     *
>> +     * Minimum value: 1000 us
>> +     */
>> +    unsigned int        wakeup;
>> +};
> 
> Should the following fields be included in this definition too ?
> 
> - T3-PREBEGIN
> - T3-PROGSEQ
> - T3-PREEND
> - T3-SYNC
> - T3-POST
Right now, I don't think its required. It looks like synchronisation and
packet transmission timing. I will still check and add if required in
the next series.

>> +
>> +int phy_mipi_cphy_get_default_config(unsigned long pixel_clock,
>> +                     unsigned int bpp, unsigned int lanes,
>> +                     struct phy_configure_opts_mipi_cphy *cfg);
>> +int phy_mipi_cphy_get_default_config_for_hsclk(unsigned long long
>> hs_clk_rate,
>> +                           unsigned int lanes,
>> +                           struct phy_configure_opts_mipi_cphy *cfg);
>> +int phy_mipi_cphy_config_validate(struct phy_configure_opts_mipi_cphy
>> *cfg);
>> +
>> +#endif /* __PHY_MIPI_CPHY_H_ */
>> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
>> index c480d6cb42c5..f12337834031 100644
>> --- a/include/linux/phy/phy.h
>> +++ b/include/linux/phy/phy.h
>> @@ -19,6 +19,7 @@
>>   #include <linux/phy/phy-dp.h>
>>   #include <linux/phy/phy-hdmi.h>
>>   #include <linux/phy/phy-lvds.h>
>> +#include <linux/phy/phy-mipi-cphy.h>
>>   #include <linux/phy/phy-mipi-dphy.h>
>>   #include <linux/phy/phy-thunderbolt.h>
>>   @@ -42,6 +43,7 @@ enum phy_mode {
>>       PHY_MODE_PCIE,
>>       PHY_MODE_ETHERNET,
>>       PHY_MODE_MIPI_DPHY,
>> +    PHY_MODE_MIPI_CPHY,
>>       PHY_MODE_SATA,
>>       PHY_MODE_LVDS,
>>       PHY_MODE_DP,
>> @@ -69,6 +71,8 @@ union phy_notify {
>>    *
>>    * @mipi_dphy:    Configuration set applicable for phys supporting
>>    *        the MIPI_DPHY phy mode.
>> + * @mipi_cphy:    Configuration set applicable for phys supporting
>> + *        the MIPI_CPHY phy mode.
>>    * @dp:        Configuration set applicable for phys supporting
>>    *        the DisplayPort protocol.
>>    * @lvds:    Configuration set applicable for phys supporting
>> @@ -78,6 +82,7 @@ union phy_notify {
>>    */
>>   union phy_configure_opts {
>>       struct phy_configure_opts_mipi_dphy    mipi_dphy;
>> +    struct phy_configure_opts_mipi_cphy    mipi_cphy;
>>       struct phy_configure_opts_dp        dp;
>>       struct phy_configure_opts_lvds        lvds;
>>       struct phy_configure_opts_hdmi        hdmi;
> 

