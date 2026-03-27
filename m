Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C736133A9D6
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 02:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578242; cv=none; b=kV5TNDXgRaeK1U3Fh06luBrHAuqmxx/q88QiAf1y4caxdih9Q5HPESNC/HA9xBQgxKPyJRkFMxbhhhFJYS35sbxk4BveLV9sefteIi9+yy4GPjINNgLS4x+cLnPEU+A6CmANbbB8tsEO6KRyg57yihz5HAhsU5/p5N4qNXuPKSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578242; c=relaxed/simple;
	bh=i4N0HAMPUm3zO7DR4evOSl6UDCHXGFgITARXSeiej4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e2qC8IdvpgKxbYayI0Kgj6N4pyw2MHlASzfj0pbd1iHhioHnp8Gooi4IAoqkTZZUtdXElxTlaVq6778tFA3gCXkTsShjQtG/0ODFYERLRQ6mkFx+QIxLcQHa6mWuacN8mCqfxNbgmBwT+k9doh+1N+yFFFulkqETomYDYc9DkpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pz5okk/d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ro3mAG6R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pz5okk/d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ro3mAG6R"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R0Bg0I790018
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 02:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ma8Dtb5mLRnOlanyBjOcRR4ysLdtbJQy/XPGvVqSw0s=; b=Pz5okk/dAmH6Xe1C
	t32tYr63p8GljDR73ywqS6Lbr94+QY0CQiBDiYkQdmOfAQzykOURiSoCOXMnFVOW
	rf6xmxkF5cRAwxh2cMpuTD+708LW2OXwk77no7XYJtptPG2g6XPG5TeBULvRc6U3
	TLVJn2Gqd+D+9vbG7E/I48sgVFEl/ddvoUJQcfCmqxlO/kdlGUtwxCrDccWF8D24
	II/Znf7nBHIocqkHMnhK9W2kTsI8+uzjNWA6sbJS3udJxHCAnEnsKaWR82cWryjx
	L2OfenT+zMMYgybkk6CifCl2ydNB63BerD3hHBAwT3z6EXyPl5RD8QMhg9vmmKvx
	HJKmSg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqjv8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 02:24:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so1159215a12.3
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 19:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774578240; x=1775183040; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ma8Dtb5mLRnOlanyBjOcRR4ysLdtbJQy/XPGvVqSw0s=;
        b=Ro3mAG6RU9l0Rc5+i6eoJ4SBIEZnDuhHo8pcUgVQTbRhvA4l8BAfw2PIwII5tBfxGX
         KSKIOliwBZZc5FXQWj2p+8Win/6sdiRsaHit9HYtoeusNP2B1soKdPcDE8Nga+/PU571
         2n9oUCxK3H6Bwz4O8IGDLlR5r6V3hE+UYALqN2c1KE7I+lN+X9ixLQMtu2uhWHDmlTsb
         CTaqC13dfhtaVBPEXWTjaNgWBUK7prAXTCuTpbhMo+N0PwKIsQCDVR/BCGurfES7wyf0
         DEmiF3ZYuqttLZ5O4ULLFb3c9aFZpSPAJQGpWt22VJrlqTDZxEVP+iqU9gWyXrvqbYoH
         GIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774578240; x=1775183040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ma8Dtb5mLRnOlanyBjOcRR4ysLdtbJQy/XPGvVqSw0s=;
        b=D1N2sC4Z35CqPaIlwvC++D7XD8oZTnCyWoRsxE/vGdbfv1IciLwD/j4Rrrp1WOyYDb
         d7bZRM7QD61NtMfEAkK0SQeaFHbhq4oUnM4iKn2ZXZCeCM6FLLEjoL2TAFunANakJ0iC
         UcZYRtGqumcSlO0w19aKoXDY5eJqNvXCHySekpAOyroGoMRQwZBPzonWlJOKPNBmOsyV
         hqo9CUymSFzvU7KSVesBtttWWmPLiDIviDzE8GtyLLjjeU0djv/tXQOdh3aE8ydazZ6R
         EkZFG1xH9HLbQcDrD1unFxvC61tC3KLW8v81nDkgsnU/C2hX0juhtVoN0kFBVIoyWlJp
         sh9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2TV5lXQLhQRxTuPzJQqK7hOdw+hXCPTUI3g+lu6UQ+5aJVx3atN9hHToi1Bvduy9FNoVK3X1jQ1fA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8njPTiPPDxeSMEC9dJ6cuLgPAUs5jFsXBbAgQC75SpkFReicK
	YCRuer/JJ0h9I0gjRY8tV1GXsrqzDTdSxgtjl3S7Ulr639yoU1+3PLgklv+o0HgTIVajbkBVpHg
	pwZiyo5npryqj55j5EDkvbLxRts/lDYNlala10zrsFMwnlPfVzoQwHJ2iDr6vfflf
X-Gm-Gg: ATEYQzwi2sGzcsfyV80xaApQJZ8g7/zB9KcFQD2NlEHfW+HuB1OLoTr+gQ2Wis74GVu
	YVfiexSPuC9oyNkzD5bzApawsA1bgWkFaxncgcs7xvgjf+j2ICs13azWZb04m1nSOuFntHgCfyy
	axj+JY+oYv/71SVUo9Uc35KcvvQrrR0F/ST4xRzw3QtawntDNrKZbJSWF890koZ2RXCEm3XJ4zU
	SIBCM7wA1Sr/iqqMzu5OIOqh+uZP6pw+FLQqPIjNhdnMOMBADA0LKvK8QfPGnbQ0r3C1oLNdxWo
	cH+jn8bOjbB/UZmjYqSWrG/lkqSFXu2HTZIBn38NqoxzjUxtBTx6U/P5vhMEi0DVr/R4m1AB2ax
	NPQ7nGc6ZTCIVy0pfrV8CY9K5z440RS0yudjQhMScz6ES9N3C6N3WO+NMYJAr3/70SKBZchjluL
	Hm8pLFCflEdY3vgTvE2A==
X-Received: by 2002:a05:6a00:1803:b0:829:8c08:d1f4 with SMTP id d2e1a72fcca58-82c9605c95bmr685475b3a.39.1774578239909;
        Thu, 26 Mar 2026 19:23:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:1803:b0:829:8c08:d1f4 with SMTP id d2e1a72fcca58-82c9605c95bmr685441b3a.39.1774578239395;
        Thu, 26 Mar 2026 19:23:59 -0700 (PDT)
Received: from [10.133.33.251] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d3c2714sm3848975b3a.48.2026.03.26.19.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 19:23:59 -0700 (PDT)
Message-ID: <bc6abd24-d56a-4fc0-89e9-8986e8d8b3b7@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:23:54 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-2-0c0fc7f5c01b@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20260326-x1e-csi2-phy-v5-2-0c0fc7f5c01b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAxNiBTYWx0ZWRfXyQBRdhcK29Ww
 nHjJFZK8XunkZQSPgU+LuPEbBGdIYPST/eMGZ2Tfo90daGntTZh46BpSaVuheLW7lZrXRn6BAnw
 1+X2z9Vg3s6eH9vhVGoyQ0drcddHaluchm5rIolxBH945xT0yCcmNV4zJyB1XAQUhJTuVu0GojV
 NVG7tIfTgms4mT8/e2whnoE9eSdv9NlhkCZ+qO74KuLZ5ijcDBE0BsQxymOQgdLJKHx7bfvaiCG
 GzEvwByh4H3jsEhxEgKyEHvyhXMcbuL9vaDKFwKB+zQlsHbZhO1A6CtyXULybEFbb+L0oe2Lw79
 7tyYr/Z+HgnfcazG+Zdjus39U84v6nAGycm3z6eQC5/Fu4yNtjrTPIC01TLs1plXePn0dk4ryeF
 Mwb6CDNfI8cMVOfnHrT5ceNK6ULshbewSYMqOglFQxGBtH71BdwCS5khI6OwijPC5wd7NcllVq6
 P/oGwwPcVjrvu7OjsfQ==
X-Proofpoint-GUID: b0acnNWmqoC534WS2YryZk-P-evRZtDN
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c5ea40 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=irf8UKbSWqAIktAtPRAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: b0acnNWmqoC534WS2YryZk-P-evRZtDN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270016

On 3/26/2026 9:04 AM, Bryan O'Donoghue wrote:
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/time64.h>
> +
> +#include "phy-qcom-mipi-csi2.h"
> +
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(offset, n)	((offset) + 0x4 * (n))
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL0_PHY_SW_RESET	BIT(0)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE	BIT(7)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD	BIT(0)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))
>
Hi Bryan, one minor observation on the following macro:

	CSIPHY_3PH_CMN_CSI_COMMON_STATUSn

The 0xb0 offset implicitly assumes a fixed distance between the
common_ctrl and common_status register blocks. This holds for the PHYs
covered by this series, but on some other platforms (e.g. Kaanapali,
Pakala) the offset differs.

That said, I think keeping this fixed value is reasonable for the scope
of the current PHY series, and it does help keep the macro set simple.
It might just be worth documenting this assumption (e.g. via a comment
or in the commit message).

Alternatively, if future PHY variants need to support different layouts,
this could be made more extensible by moving the status base offset into
the per-PHY data (similar to other register layout parameters). But I
don’t think that needs to block the current series.

Related patch before:
<https://lore.kernel.org/all/20260112-camss-extended-csiphy-macro-v2-1-ee7342f2aaf5@oss.qualcomm.com/>

Best Regards,
Hangxiang
