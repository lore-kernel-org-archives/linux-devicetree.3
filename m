Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FC82E7F17
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 13:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787061046; cv=none; b=V2pzGhzCpCTLscrm1kIZo1Ph5Rl0xYt+4j5Xcjz8UBdK/1YkaZvMgQZ1glaOGZ9wXUArIQ9E/kwt8Xl8dmOFH4KGPUE3uEQ0RWbEVjn5hdG8ksb6CSUx++i0Ku/48VRkbbiG5wW8pTiSZucS2OXNjDlTlr5eHoeXI/zrY9TBek4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787061046; c=relaxed/simple;
	bh=bv1cQPvE1usaFuMV4D7AavM2f1Pk7YP7oR6rPVX74m4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b/yk+JZD0FOmb1/T+G2dLJOrvc8EgxY9d/RSp0GFENKYEpxEA41m3M714jgS9PdDp24lnmVoY/OeDX1lBGWJ7f/X5svGHA+/VgvRZEdw1U6i+ESn7h2+YpyRIar09sptEnuONtc9GHML9imsRVaHARgyq4pg1SKvwyXy4Mcnqos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N4xDDa7j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DhqirjxT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N4xDDa7j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DhqirjxT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IDQgks1450933
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 13:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hs28qDnlng8Yw5nmsuLf9RrGXLMnYQV961lVUHepMEM=; b=N4xDDa7jyOG6JjGy
	u6YPp7QzuXu+YEL94zxhSG/Vikwl0JkqRlBDBzPwHhVR4Ibujzyz/X0jVKQZlE25
	+QgxdaVfJA3kGP7cV8bqnMHVvuD4Qm6zTBiJjs4hETm2Fj4+TWsY1dGg8S/IpTvM
	lr025jCcV2FEEmTkCieSQFO/SIkrwnT4BFMNXSIWg+2ZEawkKEvDKDdto9K66elK
	WTqdFQJIN8iB4CPoN3tACsVfa1GncpHIsNPGRviz0qhDW6kSobJk2+1HZZV1/9Dz
	Qcd2gQwNidEcerq6XJsGxUuyLgC//JUNCYRbCfMffhsLBxC2nFh0KrAppStBkkAJ
	UVxiLA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4qyx0688-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 13:50:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9006b9c3fb6so8626736d6.2
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 06:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787061044; x=1787665844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hs28qDnlng8Yw5nmsuLf9RrGXLMnYQV961lVUHepMEM=;
        b=DhqirjxTut9K9vg7iWu6tr2Wh728ai+mdFwgIH6oahYI/WeH6FsYZ4MsBjw02chbQU
         9hLR1ScXYYw1I6gn/q4+mM8i/VLsOIdMiQ5pkk0RxPrJlqxrFAcoinlu04F8jubYTyCv
         qA2bxoDrgB9kwF+OJy7JnSCDQ8/udDDEan/e9qbtIL8LqDhbQJKPy262DrHpPZ2yjNET
         OHXzS4H/m0j1u9CfhJz/WIGXJpVOG3uVm6IltKKjrtEBPNJHKBeQyqY/HLjrFWSVc6qp
         ZXJHZ+6Z3XkXrmKTYUTcrxh0ROmT2rN+lPK63SOms4aCgyMZd15zy5JsSYrA1VDDYLKy
         4FuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787061044; x=1787665844;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hs28qDnlng8Yw5nmsuLf9RrGXLMnYQV961lVUHepMEM=;
        b=rupgAbEJPomPLLA2vzrIQs19GA3dYMUcCxubaW1BJSQZz9JE4KUQU/CAdKTFtEoPLl
         gta99BSnYUN/0Sry5xPr1HnWEjKFJUby9GP6XhpiUepKZebD9hUGWbD1Fd3vpxM1BYkm
         IMYuBCYLbCTH7ev6W6C+sfJzBiKzzSIr6oBA59gs8WQ8DL7OJFYzxIhB/XMXjlMZfa5Z
         NdtMiuHVtrIegKSgQsFAWieEWvSAa+lIg+0w3L4k7vlsxgY8wR2OY5EbBW52jFdx5EZz
         jK8BRutWl4I7VRi7RemVMUSXBP0LtjhvwD0shSH4td7wXISNAK3wyuWCxq5kGCvntyVl
         +iPA==
X-Forwarded-Encrypted: i=1; AHgh+RrqecVsiHKWdUU8aqKivOLtG4P4d6Qs1WEFfZwNWpCLNzfiHP6ff0QBv8voWJWLYggEXEi76tVqQEKz@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ0aoKfsvpNAw3qupf0Nk2TITspeapNkhochZ8jaLnAI+WmjNx
	HD1SNOS8QnbW2fT++SIBVJgAM01ouwBUEh60yJJ9QY1+AUFVIyVciPR0JeDsaibEzTcj3EcQSVJ
	AT8lPte0KzS6razv1qzl/kCm4TKey87MwMLR72p9knYOnYdIhgEHoecPy80iweS4b
X-Gm-Gg: AR+sD13X08FjW0ACcGEhqkRAhIf5wBFw8Pp/Yc+lqMRxlPlo04ilz8H2xmG59Gdx/Cy
	ceFVTKbKv1T+V6zI/KJbpyylJYjp+MhvMqEZFcyr6NtNNacizGLX5I3DJC45lFLrSAEXxIVnia+
	2Y18/lYnY5Y5M85laOnPIAKTspasJRzQ8kYI7S+xIZM93MYJtddl5l/vpyoq0HQ14FwPHHCpkjB
	zdd9iO1MoXiLA5W/KEHLydjIk22N+CFy6xf3HhsgHIUfi9hWg8zJfhQzqdk9vsva2ucUp/b4cqK
	2VmCDESLxZoy6NIy+rBUR+o/r0yYKbajvEkeCbLJyyJt7YJDg1OmZvfk7y2jen5vg/covJoeyVA
	kPNWlOu1qRCMwfXleAUKuU18u
X-Received: by 2002:ac8:5fd1:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-52d852d1178mr246438611cf.1.1787061043449;
        Tue, 18 Aug 2026 06:50:43 -0700 (PDT)
X-Received: by 2002:ac8:5fd1:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-52d852d1178mr246438191cf.1.1787061043009;
        Tue, 18 Aug 2026 06:50:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bab858sm160067766b.53.2026.08.18.06.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 06:50:42 -0700 (PDT)
Message-ID: <dec3c7f6-b76b-4f44-9bba-f168b859efa7@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 15:50:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: purwa-iot-evk: Describe the PCIe
 M.2 Key E connector
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <20260804-hamoa-m2-dts-v2-v4-0-1b5ceac74538@oss.qualcomm.com>
 <20260804-hamoa-m2-dts-v2-v4-4-1b5ceac74538@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260804-hamoa-m2-dts-v2-v4-4-1b5ceac74538@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDEwMiBTYWx0ZWRfX074JLNPk8+Nx
 E1CqsWDeXGDJ6MO4ontQfYEoAaH54L2AkA1mKOxjdKQFr+gt1fDNa6uCts2KjsDVpbUDRT8Wt4S
 1UlBo6MvrINSx7MbWyl+sRzya4Lt/O4=
X-Proofpoint-GUID: I0Q2KoWedxuWE_WKp645t6K1sEwCOdg2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDEwMiBTYWx0ZWRfX18QTd4AgymL+
 yA4hpzl76ItPg03iSbJ2jXruteizcYotWb3t94Bsni6aAcNZkUDOS5j07ACqmzXW9Z+hRfSATjO
 3Mb3FyPexWgSHrJ461sUOfS8kpx6EE3GmI/r85Mu4N2XUVRNk5AUwDxHXk6MuMimuPMQMye2pmg
 bmy1maLoRvl2WGqqbSIDTj1JxOPh7zEBmgwCO5JoNVTrCDGLVTfhI7WYssSF0i+9+P2W0EGuM+Y
 tDSlOImhPeODdwc3+ja3n/2qmXqoXnCIYWYKvM710CvEl51hv5IdxHgo543E1jcHrXwaANgDXWO
 wkV3v4ePhhW2asBr//OmH00gPgBA/FNHR6uJNDAhWWuawmLEYignVPP3D0gmgSuZMVhmCqxiP9X
 3FYdsLjVba16TW59oNHMaHlfvEDPNj68oEiJO2Unl4ILzz4DC9J/mQpTKIciDsX6FwUFM12FC04
 /7eZyGNU3z6p8WzCSsw==
X-Authority-Analysis: v=2.4 cv=Ad+B2XXG c=1 sm=1 tr=0 ts=6a846334 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=k_qKMVA7-xR1wUiAkAcA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: I0Q2KoWedxuWE_WKp645t6K1sEwCOdg2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180102

On 8/4/26 2:32 PM, Wei Deng wrote:
> The Purwa IoT EVK has a PCIe M.2 Mechanical Key E connector for wireless
> connectivity cards exposing Wi-Fi over PCIe and Bluetooth over UART.
> Purwa inherits hamoa.dtsi via purwa.dtsi and therefore reuses the PCIe
> root port compatible and the uart14_ep / pcie4_port0_ep endpoint stub
> labels added there.
> 
> Describe the connector node with:
> - port@0: PCIe for Wi-Fi, linked to pcie4_port0
> - port@3: UART for Bluetooth, linked to uart14
> 
> This allows the pwrseq-pcie-m2 driver to manage card power and
> dynamically create the UART serdev for UART BT variants of the M.2
> card.
> 
> Remove the chip-specific wcn7850-pmu node, the static bluetooth
> serdev under uart14, and the wifi@0 PCI child node, as the M.2
> connector approach replaces WCN7850-specific power sequencing with
> a chip-agnostic model.
> 
> Also remove the now-unused vreg_wcn_0p95 and vreg_wcn_1p9 dummy
> fixed regulators whose only consumers were the wcn7850-pmu node.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
