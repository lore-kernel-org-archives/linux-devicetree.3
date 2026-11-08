Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143916;
	b=r81TOKhKfTFeSJ2GbqNOJjV8VnFotX0BfH1qYPuV98P2Qd/teR4Wl1wyV7ELlaPfsC16
	 RUdsravxM/43mzUCv5T+cPgfYG7U1gsyWaV9tZfTjCgawQBz+ofb1l5AHYpVG87goJYo4
	 dokvUYbPrstEXFbH/SFQ3JLsKVE1UkmhZxxx5N/nqLr99cydcwURU4I7+ApY4XTOBM9j1
	 ezmV72Q1eDtwNzcr0l/Z40I1gDjj7mXHOvWRnvly3w6a9cTg//jGis/6Fyz+ciHGKuhbT
	 z8t3PfYkPKt4w8oRYtyH2WLlrS/Koe5lrRbc04pBrn9UlxL8qlkwDieY32tDi3RXNlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143916;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7Y04tqt6QoAZDnmim+FnFs7Mh/95J1U07zdy+ADsQEA=;
	b=1uGi6GAVOAdY4vlu0zwkGNOiJukcJ52UhbwLXUrN/qSEoQCy0wyyb0GXO9tFRvllELh5
	 uBCJPsBVyyWfJpvgOFgYhBR+rNoZ0VbzxzYwcdytex/UEQ3xCuLAooRBXeCsLaf8bQgco
	 45/FAI+mViaNe2ZK3Wsr58+33Keh6vSICBXotiphZuJ1wZQDy3MuWv6U9kiCoJWWxwLGC
	 awNo4/YPv/JhkwwdV8wJMEIq8Jq6o9QExIQNW9LW33FHc/OpgQQd9wTdI2drJVCbcnT1P
	 vym3nv8PbfAKhXqhWZNJvc43hZtNoO7MYi2WhDVw5eDNUxnL72S/XUNdhh/S3OW69Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=INCH0h+q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZZnmEIjD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E737606A321
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 13:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E737606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=INCH0h+q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZZnmEIjD
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8Ag581283588
	for <devicetree@vger.kernel.org>; Sun, 8 Nov 2026 13:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7Y04tqt6QoAZDnmim+FnFs
	7Mh/95J1U07zdy+ADsQEA=; b=INCH0h+qeF4laeKeCp+7aqaVhTBbw0X0nK58Ur
	K8NEIPlATJ4/CqP8cDSXlcZxQA2pNptLgDq4tey47fOiiUln6pYTDvp4rJFjbROa
	U8/V/mOnol2EWaMQ4QbxsgiLsPOo+XZo+zVExUj1xdOe6lv9ENyB1vP0g4yyg8US
	tEPGNul/H+4FnoKWN/tqDE3dccJHVa1XDX2dZWgZvjjfuv0HJVTkIZLRExmg1yeW
	reaw1u8sANtVTznavSFLH2M50DHFtLe38nPkwuatpUmu4E/wM7laehVyu1FeHp0k
	xtORaPeJjgiXHfqNSVG9qutqqIKTqC2d24J+5DxWZuHn33BQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99jst9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:18:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso242440eec.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 05:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143913; x=1794748713; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7Y04tqt6QoAZDnmim+FnFs7Mh/95J1U07zdy+ADsQEA=;
        b=ZZnmEIjDFu6MFTSuIw+198uJ+HeamLIWvb3Xfg7Bj2Ih6wr+cf1EKhETuBird7HnhM
         V3vpDoeS8vtb7GxZpG3tG2FOidFQ1tD21OwIHDrhNfzZAE4JvC7WP1eUm1+4ltk62ypN
         acUFoIDgLsHnrANNHN95evC7Q5N98jTbfxbgyaTkZQUUFqpnEejWEzE3eoz+jtSo3xWo
         wZXlrahQq64HOwijCEeWcyVzNF5evwN2NdwkjGLbbeYKW1W44SbRVls50zVFNvkjqAdH
         Qompv7hjVE3MvWtA+QAfMYPCnftGcFc5xDWcTYaYJfTwCJVmg294GQkF/ZkqkOeMMxC4
         fkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143913; x=1794748713;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7Y04tqt6QoAZDnmim+FnFs7Mh/95J1U07zdy+ADsQEA=;
        b=xtAu8Q+2lYmkgRZ9MYYY1scyVAj1RlD6tUg2yC2OD6sI2TkuvsTlxaHYKwbJ+cSPcS
         FqmbA1mVJpyrQp7TMUnBItuoGLE3ZCyqk2Ynl9DfyDuUhhZjes1EBRoeymI5vAdJGOAO
         I1YG6h6zdK1U+++HEEQpdAlsFGkJqRN1BcgyoUcAyYlqPUzzNyiI6dkMApMMz7LPkByu
         hakX8DF2jctNXoo67ZgpqC/I2J41A6EFIRONrA0UblAJ7EW6Zsg+HsztwZV3zLAFAtS4
         gbYzsAQC6Fzzf4vF6jvJ9HfPJkch7w3MKsZxzmxEhFeRTAuUCtyLQsS45CaUKABELDGu
         IYLA==
X-Forwarded-Encrypted: i=1; AL+hErE2JRic/PzQDxXf+6UoabaZO9DakUo36gu4LjAVZV6OFL/PXv8vi6gZSjISVwqY6Oj54ZFT92JV3rch@vger.kernel.org
X-Gm-Message-State: APuU4Z9veslfjjlZbcGajEqMUuNW/6CSWWn1yE2IpL24Qzlvxh38ZeQO
	37aigbxgUxGHfoUtlgUbAlpqn2p7yo5e6MscOr9K9xWxTainrcGKCXtBXGoNFAi8Yzufhm184Zc
	8VzpLhURYzkb+PZrBp61riqSiW8gwx12QkibEX1hOYn5PEE9e69h+Yn13AjZC2EIs
X-Gm-Gg: AYBFou13RlndckkwD2+G2mTuEQiqZabC9Jf4E3RulFQWJ339ae/Jl2TTnZoH736P0hi
	J1P+H6WAz4XsW+/8AM6O8oJpVBoNuV/lXJZnUnBg/K52o8XIIVCyL/zSlRX/PF2pY3acE7Pnnjs
	R5Q7QfGWNSsNiZYVWmLCDEKKjT1W6YT+zq/ovUkUlo2s5TR0Pobm+yYReAOy+YBJeEMUP3HGVxN
	EkVbxekhsFO/fS4SonMmbBBkrhHxAilHRAcIrw+vul/2cEFBTf+ZvugaoKIBA0HcCrY8v9aL8nv
	sLnMFD+k6CEsz6jNl53zgoZuMy3hTljiSDmVtDFOb4W1qLjtAhqav2yL7AwSBAAskHO/YLnzXsr
	R7PnfI4O7vlAYdeXOF/EnJ1lu3rhjhk8IJfqPBpwm/KafSfG9e6P/rfILWVyc9GhgsF2oSoycsR
	9/uJM=
X-Received: by 2002:a05:701b:2214:b0:1b2:611a:89fd with SMTP id a92af1059eb24-1b39feda27cmr1957825c88.45.1794143913314;
        Sun, 08 Nov 2026 05:18:33 -0800 (PST)
X-Received: by 2002:a05:701b:2214:b0:1b2:611a:89fd with SMTP id a92af1059eb24-1b39feda27cmr1957781c88.45.1794143912612;
        Sun, 08 Nov 2026 05:18:32 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:18:32 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v2 00/10] Add support for Qualcomm TSCSS hardware
Date: Sun, 08 Nov 2026 18:48:21 +0530
Message-Id: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ528GoC/0XO3YrDIBCG4VsJHq/FMRqzOep9LCWoM2mFbU01C
 buU3vtOf2BPhE+Gh/cmKpVEVQzNTRTaUk35wkN/NCKe/OVIMiFvoZXulFNWLjXWKo0B7I2JQOQ
 E386FpvTzdL4OvE+pLrn8PtkNHr9vQbu3sIFUMhAhGHLagtrnWnfX1X/HfD7v+BGH+0sudF05b
 Hnx/12cySaAcvIY45h0HNke6zrPuSyyM963VmMbAAeOYCz4SvLhp2VoECeyEJRXk8X4SQZsjDr
 2HnsM4GyrEY3uAnfc/wA0kiO4KAEAAA==
X-Change-ID: 20260705-tscss-441d844c1ee7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: D3zkSglkoMcMaJwpKi4iTCepIuHhwzWv
X-Proofpoint-GUID: D3zkSglkoMcMaJwpKi4iTCepIuHhwzWv
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6af076aa cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=J1Y8HTJGAAAA:8
 a=20KFwNOVAAAA:8 a=CLs3rlwnB2RECI_rIAYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=y1Q9-5lHfBjTkpIzbSAN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfXxv4xC5fj8x9r
 s60+gZkM0XBKg/Ol9YMw7koAcOQkm61CA0oAhR1nZon+Pq7Ex6TN5zoh3Dr+uCzebaOtWyfkVme
 MclYtRz0QEXizo16n9MZQ9wgEd392rELqrdlfGBaND3HEoC+i4nxMe+pFqAMvxJrSCFArm7CxOH
 d6H33sg1DjKkv69Po+Md9oWfGf5PnxLauZm2Y3RboC0QgVy9yHgXmo60WcYMHCczT14089sDwu2
 JoQWfbj0fQ/yc6mbisA73VwZ0pdwrXFaXmMKVBw5lpE6/hpZ9A6CIOQkQh9zHlVjWmU2qF8D+GM
 4jQHEMkIuUuEpN+dIevkLlyXRfIhcxbpm8Ep+83qZH3XRiBe35nBprAI+gfcOyku9uSAHNIQzv5
 HM1yQsu6sw6s8nkoIOcl11gHXQcaocfJ5Rio5AHKjBunSrvffJ5R+lkMYnfBY799QSK9C6/8C7H
 SePwtQu1nxpNfwwsK6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX9GBQM1VaVQZi
 oxaXGCT7+otFK2aqZRuKBVWH7m+SycqyI3AxoiR2Z5ieOHErlMn/v+QQoT34jWnJX/LwXsv5JuO
 3ccRO3YfijvscwJk9mHSEJUSfbNduuc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080052

This series introduces support for the Qualcomm Timestamp Counter Subsystem
(TSCSS) hardware, a time synchronization subsystem present on Qualcomm
Lemans, Monaco and QDU1000 SoCs.

TSCSS is composed of two main hardware blocks:
 - Timestamp Counter (TSC): a free-running hardware counter that provides
   continuous timekeeping for the SoC, and is functional with a GCC TSC AHB
   config clock and a global counter clock. The TSC counter resolution and
   supported functionalities vary across SoC variants.

 - Event Timestamp Unit (ETU): It captures TSC counter timestamps against
   external hardware events. Each ETU slice binds a slice identifier to
   an external event selector, and the ETU additionally requires its own
   clock, pinctrl along with either a per-slice interrupt (QDU1000) or
   a single summary interrupt across all ETU slices (Lemans and Monaco).

 +------------------------------------------------+  +------------------+
 | Global clock controller - TSC AHB/CNTR/ETU CLK |  |  EVENT_IN[0:15]  |
 +------------------------------------------------+  +------------------+
                          |                                  |
                          v                                  v
 +----------------------------------------------------------------------+
 |               Timestamp Counter Subsystem (TSCSS)                    |
 |                                                                      |
 |                   +----------------------------------------------+   |
 |  +------------+   |         Event Timestamp Unit (ETU)           |   |
 |  | Timestamp  |   |           0x01C90000-0x01C9FFFF              |   |
 |  |  Counter   |   | +------------------------------------------+ |   |
 |  |   (TSC)    |   | |               ETU Slices                 | |   |
 |  |            |   | | [Slice 0]  [Slice 1]   [...]  [Slice 15] | |   |
 |  | 0x1C80000  |   | | 0x1C90000  0x1C91000          0x1C9F000  | |   |
 |  +------------+   | |                                          | |   |
 |                   | +-----------+------------------------------+ |   |
 |                   +-------------|--------------------+-----------+   |
 |                                 |                    |               |
 +---------------------------------|--------------------|---------------+
                                   |                    |
                                   v                    v
                         +----------------------------------------+
                         |    per-slice IRQ  (OR)  summary IRQ    |
                         |      (QDU1000)            (Lemans)     |
                         +----------------------------------------+
                                             |
                                             v
                              +-----------------------------+
                              |   Interrupt Controller      |
                              +-----------------------------+

The address offsets shown in the diagram above are specific to Qualcomm
Lemans SoC.

The Qualcomm Nord SoC additionally has a timer register region used to
generate a periodic pulse in sync with the TSC counter.

This series currently covers only the TSC block driver functionality; ETU
driver support will follow in a later series.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v2:
- Fixed SoC names, and updated bindings as per review comments on v1 [Krzysztof]
- Added ARCH_QCOM in Kconfig, fixed the probe() and remove() order, and
  used dev_err_probe [Krzysztof]
- Dropped the unnecessary "inline" keyword [Jakub]
- Added support for Nord and Shikra SoCs, which support continuous dynamic
  dynamic drift correction.
- Updated the clocks handling.
- Link to v1: https://lore.kernel.org/r/20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Richard Cochran <richardcochran@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>
Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org

---
Imran Shaik (10):
      dt-bindings: ptp: Document the TSCSS on Qualcomm SA8775P and QCS8300 SoCs
      dt-bindings: ptp: Document TSCSS hardware on Qualcomm QDU1000 SoC
      dt-bindings: ptp: Document TSCSS hardware on Qualcomm Nord and Shikra SoCs
      ptp: qcom: Add PTP driver for the Qualcomm TSC hardware
      arm64: defconfig: Enable Qualcomm TSC driver
      arm64: dts: qcom: lemans: Add support for TSCSS node
      arm64: dts: qcom: monaco: Add support for TSCSS node
      arm64: dts: qcom: qdu1000: Add support for TSCSS node
      arm64: dts: qcom: shikra: Add support for TSCSS node
      arm64: dts: qcom: nord: Add support for TSCSS node

 .../devicetree/bindings/ptp/qcom,nord-tscss.yaml   | 186 +++++++
 .../bindings/ptp/qcom,qdu1000-tscss.yaml           | 170 ++++++
 .../bindings/ptp/qcom,sa8775p-tscss.yaml           | 169 ++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  12 +
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  12 +
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi        |  14 +
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |  13 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  12 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/ptp/Kconfig                                |  11 +
 drivers/ptp/Makefile                               |   1 +
 drivers/ptp/ptp_qcom_tsc.c                         | 598 +++++++++++++++++++++
 12 files changed, 1199 insertions(+)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20260705-tscss-441d844c1ee7
prerequisite-change-id: 20261107-gcc_i2c_tsc_support-64aa352d3b1d:v1
prerequisite-patch-id: 8c93973348ea4b80f1dfcd445a8a3afb8a530d21
prerequisite-patch-id: 5a3418fa67b14fd6b67e00f8c21ee699fedb320d

Best regards,
--  
Imran Shaik <imran.shaik@oss.qualcomm.com>

