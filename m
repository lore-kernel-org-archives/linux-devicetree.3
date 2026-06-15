Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CDE3E5A0D
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525593; cv=none; b=JrmBKF9CgDqClvwP5l2UcwnbMen7RpS+d6vR9wt/bwJfsuDx5Zf9Ix5eoKNvPIHJm29JnIzO/zQNf7VJauWh7CHvuXhiF/A6Ca8tVrr6gShpE5O7fIqJksSUMkHvmHCRNLHRSb6qrOWgnDoFcmdzZOfLgivcHTwKEvhqvtCnvXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525593; c=relaxed/simple;
	bh=7Ys8Ti9grjinNverZO6LyDQbqQUeDGQ2rk/mpwJcIlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uEKK2kqZQGlIsRFtCaoee/DxIibda0e0a42A3mA7gfjm/FVlEee1G87EuepcpBDoGX7t3qnDKopmRW7nR2qM9kdIIyD3j8FP9kgBIO3UtR5DvA0Dp1rRbo7fT2YwPHjTr9DakqslH9XCdOVtEiSx7RdcCzf/+b1D4GNkSjYU5WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YlKeDzal; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GoxgShiZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YlKeDzal";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GoxgShiZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAoue03886602
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:13:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6pmdA4NzH1jhT7/XCJQKYN+fSOrkQss8V4mYUPNsLc8=; b=YlKeDzalYkJqdoSe
	fGINnHiA8B1eAOMBeKM0mFKgS8Ze8pG9f4SrSLvvrdp3K57AXT/9H9fzje7Sglbu
	U33VTKhIujWwAUM6irCLHZhmnQQC7zusCQRDI63d2nlmn2j5TgguG5Lkw5Uok/Cm
	fgbvo8GZljUdavF2/2wbYpytbjei+Noe2L52oHgRaYABN0S6sL1LsyaqmGReCEo/
	GboBI9PwPM4kI+IkVMt/zH3ExF2EhfKNc3e1HnYAq3AFg2aJqs+r4jRQZ1H4e6y0
	sV+orMcgtuQwF1gec3r1yOnPJ3UDig5Ezp5+okw0S2cmOSx09wjGvXshWJqwYoXt
	Pak2fQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetjrk93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:13:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51968526a68so3187201cf.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781525590; x=1782130390; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6pmdA4NzH1jhT7/XCJQKYN+fSOrkQss8V4mYUPNsLc8=;
        b=GoxgShiZkOlXcEiHCZo1EewZd+iSJZQ9GW6Iiq8iRJwIVmXtv1sqEs9jxzvcl4gQzM
         J0uwcX5vJMjEyBNY7R7hS7Yn2kOSI6EtU42P25YU6rKUHCJEp0OpsmUuzHWTmg8gqHdN
         3RcFZP/QyvWK2Edywh7MfzVex2akjj8a4cSRXFUYn6QiwUzw3gRUm98Kn8SCCiWJEDbX
         qQt5eziSHlbp7D3S5YN8uKtb7csTHiWoBz71HxQ50ihSNR8V9rHv0R07jTcJ4SdTOMeu
         Twayu8ZASZdITBmFJOocbOoKrQWpC91La0givcn/JqJ8ELKN+nMW/yPAvcckvozSkLdu
         FNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525590; x=1782130390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pmdA4NzH1jhT7/XCJQKYN+fSOrkQss8V4mYUPNsLc8=;
        b=REgLHvzo8VEX8CvnzwYmlyqX/3B9ONqZNi06QbnE26shHdi6ZMaO80RRVJ9Hjlw5lP
         2e8PXPzDRaPXCC4IRqhWKStHH5vHvyGPqHLL2RClNYrlY5Mqv6fMMtf4M0vebuf/zhir
         XJvE44Ki2YE+vGPrZ+LUZnbZlzERGHDq/asGRF2xAevryL62ytExHbWosr3h4PH9wDR/
         VCk6rVsV1Zkf1YH1HctlDA7UYWgzMyCyGA3w83Iy7NCthwNqj0lUk3m0+ZJXEOz5c7YI
         n5reo6D1+4yVMt4szkAFMWb9NjK3lgurvC/zMY6vkw6+tVUjXJT344LuhSs1E3aVgoZ7
         e6XQ==
X-Forwarded-Encrypted: i=1; AFNElJ9rrsODaQCTp+GR0B7IVOENpp2oTREumT5bU1oGpuH+pJo5Z5XwEKTaWd+jfyeYD5S69EmnfXPK/nIV@vger.kernel.org
X-Gm-Message-State: AOJu0Yysph3ivcUC3M0+ndcjX4OoE3pxwj86LnY/OLgBmVDWZFiN9Qlq
	7+L5FeptZovgbGbcAaL4ntXr5fw5y3CXLbfkramXjGsFEIGqOe2qsb9I+oYxEHYn4FRYV0MLv84
	uNPMuExjWdz4RO0O4/5VIYHJTLM8RO2ombvTBecHRqGXqWpGdluPJGFk8NSgOFbnEWFxjmWP0
X-Gm-Gg: Acq92OEer5G4+UU5I5zjd2g894ks2xwh7sgWRNv9U4xPHdFwFmj2bhA6LGq2P50RFk9
	kE3c0XqvLRIEreBZix+8Cx1/WIFatnB5KYEdjo4aUJkJlYxG/VLuXNaZSI/Tnd38wy9z3lqN7cf
	7gOjeNwmAD2eYseQ9a0QlVY7/NnjNfynkr4f8Wxe5DdCtf/BfOwchfT1FgBJwcIpbT4Z7oZLQ/H
	acNkPyEMiXPFwxnE3oQ513slfFAKXRjgWLF95HH7KZzgFhJkKIL4pl2WO3cq57+EV4/AzjTIhg6
	uI3+9CDgfbQohB4TnPjtPKwCDLb581y+T89JfolVRPwNf3LXvgO8qfCDtOg7dPyZ2Pp8uh26WoW
	bIoQuRgPAz/dxMJ5SyuaJSjcTnnung99c0Ef7Sr/dNIcNaA==
X-Received: by 2002:ac8:598e:0:b0:517:62f4:e3d1 with SMTP id d75a77b69052e-517fde8985amr129458251cf.2.1781525590114;
        Mon, 15 Jun 2026 05:13:10 -0700 (PDT)
X-Received: by 2002:ac8:598e:0:b0:517:62f4:e3d1 with SMTP id d75a77b69052e-517fde8985amr129458051cf.2.1781525589661;
        Mon, 15 Jun 2026 05:13:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4423439sm459791666b.2.2026.06.15.05.13.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:13:08 -0700 (PDT)
Message-ID: <45d7faac-7c0f-4f89-808e-06129e8420e4@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:13:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/9] net: stmmac: qcom-ethqos: add per-platform NOC
 clock voting
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-4-f0f4a1d19929@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-4-f0f4a1d19929@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyOSBTYWx0ZWRfX0Leyozy2Au+l
 r+N1yRyYWOuYBfAN3Rq/UR+Tm3MUEKQhSYnMAFLcbd7exAfIxkaanx4duM66wuj918rysGOM5mv
 BcwCQU3YNldiH9spmA0TdvL2YX6yiZH5wd8L5EIX7tYI/5HsUpDRASetujWt3b7O6/8F1i9OlEY
 oiHcR/H9uw0A3Yc1gK7YRGvEkB6aRr7ZL0/2fNSxrgtama1VQ16c2s/e+qOFJkDQ0j1vFkbbKAW
 lDO1UkfoSeI5FTwDzmro+rayWiuVTi00/vcVkFYc/5aGCpt6CQEfMLUHDpYA/HAWby28Dpfkxbw
 PgFfR8pdUTMndPpRRUTc7uG/gGx7asffiLjyHwTZfDFVeZgRwOiDs10bzQihv2w2wXMVLQ8qVLf
 Rc5MuGg9N2v8+wK9DfrxmM1c5lbMh+p+DXjj4YlKHQpWXgJO/8qMr5DCjN6elFdb5AaxRW1bO7o
 WobzVB0S//vKa/rNnvg==
X-Proofpoint-ORIG-GUID: cNarMnmA9_ledWTqIBz0GTaMHiNSoAk2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyOSBTYWx0ZWRfX4yr+otxiN6c8
 An/1ZIebFbVCQOV0CcTn49xSOJMnPbwhk2pL/SUXhqGjKq30FiSrCmFJz1cZSjk9NmpFKT3W1UX
 jVq1+4OpFHBE4e9v61bTsef6zJK5pug=
X-Authority-Analysis: v=2.4 cv=HttG3UTS c=1 sm=1 tr=0 ts=6a2fec57 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=dCDc4JseV86iyfNbYEQA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: cNarMnmA9_ledWTqIBz0GTaMHiNSoAk2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150129

On 6/11/26 8:37 PM, Mohd Ayaan Anwar wrote:
> Some SoCs gate the EMAC's path to the System NOC behind dedicated clocks
> that must be enabled before the DMA can reach memory.  Add
> ethqos_noc_clk_cfg and the corresponding fields in the driver-data and
> runtime structs so each compatible can declare its own set with per-clock
> rates.  The clocks are acquired during probe and enabled/disabled
> alongside the existing link clock in ethqos_clks_config().

Sounds like we should use an OPP table instead, we can't just do 
set_rate() on qcom, as that will not propagate the required perf
state to the clock controller's supplier power domain (i.e. VDDCX)

Konrad
