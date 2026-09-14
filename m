Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E0543DEBF
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382692; cv=none; b=NMir5tZe2ZYXjVmrYdTH/5tHvsZxGS7KpnM4oJ93bR5TCmvDotU55Mb0idkwzrMxkW5JoxILy3B+R1vfAnnsQnjJrXG4RGIYqhHpm/Py9e3qxgAUGeOZif6Tobl4KGD3KlSRrdvytEiLY4Hfeg/uQgacHSfuGGoJLdEZ6JozRfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382692; c=relaxed/simple;
	bh=812INHpCsKxdi9vRvdXLJbGGFeCf8GPj4h/s/T//r8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jA5WD8HNIs51FNHD91CebzOVZFNN2ymfGrpJk/MOTEj3+f4tu4MjXuMBCyGMsWo35Q4yy87KiayDeKjz78XaCmff0Mo83+oChs7oFpolkDyoRx3rVubvMnrh9XF/esVTh/jGe0mxA42LiwDQW2uoArgAUWRpq8JXoX5Im9IzTLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JLR9pzdS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TON8JA1R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JLR9pzdS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TON8JA1R"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nL6a1332101
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P4FJ4s9/QzAggJf/vxdGQVJj2JX++EHJC32Vcrso0Zg=; b=JLR9pzdSt1LTaHN1
	derqEsvRmrhNUQE3wpCgGXqmNhk6Iuq6zHMK30z6tpMa5x+oojVXTYaoNaAkaofR
	oMXm7AURNrbierc6Vc6cLCCSjgA9iTDhShw7zXE1+0zyO5+LMEBTu+miA2Tet1YE
	/DeXhSfNcrqspn2b9QGmoiFa/G3XB9Cn5wVFn270dRenQPnG7wMEEVi+Cs8A3uwT
	FJlzJ6cvJu5znQTZ9nrkdHlip72tmR0JdbD43y7px6h/6gkVu3DToRoeZcGl5CE2
	14+mVJxYT2Ek12n76Ibs2D9SSfvRLn0f5Xxw8t/2HNH+o6IDv71r4H9S06LY7W5r
	pUzF4Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex86tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:44:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f8e7ff71so34984785a.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789382682; x=1789987482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P4FJ4s9/QzAggJf/vxdGQVJj2JX++EHJC32Vcrso0Zg=;
        b=TON8JA1Rzir7SYiewd6mIzJ9iRNK/o6BMjAriRsZg77TkKUPQZyvoUjzYBHw71cmu8
         dGUwLIFtmeLJDPsA3P8VzliiMb286Wrn3+7YcFEy8AJRtaP4RFcODxxsK+Wa4ASc1zgP
         2Qpta5sibHCdn2evlao3jlncLyjXGBRMMmnLP1R6vkMXyxoJSr2mtTTY8y68WMr1GV6a
         xDMrRfBapwvSEIf6jb90mSx0xxNJ+z/d8mS3fuF8Xp+UcaJNpQYqjJEqrMBF8Zt179Ia
         dYQ316wsrOxq9CXb+SW0JAaF6tIDAz15PoGYbS/JDI6q0HPfnL22Sr44GMBQrd/+sRF4
         B0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382682; x=1789987482;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P4FJ4s9/QzAggJf/vxdGQVJj2JX++EHJC32Vcrso0Zg=;
        b=Klaal5VQplQwScVBPtZwNV38jJ8KiAiUUlpIvbwrNcDJt9rlE3aWgb5dGZ5qWjldOf
         slCGvg6++B82r7Pcgzv0T92VHZyBVBFkpIAKwy8fsI83Tt3WhqW03KvJmbKSx7KZafDl
         QS0ygSxXQtrPqLdgGuZSQPC1YFMGkF2Kw43EWtxTTnK9j6QXjJGnJdYkEriIduWTJCDZ
         BEAvA9/hBwsyxm8DGlEjy9vj2BSLRxTyb5qXASsa7UWapslHPI2fdLYoL8Shiyo9Cjxf
         PCscvjJeXq1AnOHyZglGEXN9yCxo5XkSUk/2zP9kaJZGxixb2g7AAyaZYvGWdi/7TNhX
         vCqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaEsb6u+vaVaBpn2woQ7R7D+n2rbk37IfsuoQwlfrciNTq6uw4w3rcqqNvr1ZRrpcpNJ00xCsS4XQX@vger.kernel.org
X-Gm-Message-State: AFuF++nW6itaqY4zSWXNKpJRyInqspOMvYpueyILDmZ2graAPBOlRt6z
	gxMYhy7b5Dv05IlQJJntccYrRTL803wN/bgLjvPjpEP+EHsltjEtJdE7+BZ+hddR/f5JRa4zkE8
	OP4akVLH9F0aTFpo+tOZfvs8bMCSCESZR4qPb7qYrrIHxcXuIOuFtwxc2/VdlnHLs
X-Gm-Gg: AYBFou20wrGS/jPvc0LVJJquz3XgjBfAT1gk0F2xZN+os21nCb3S9NkmNKTIfZU7hEa
	ykbft1B08+n6kx0YN2ffBRdUSx26CL2P8pyEf+33BUtVMbvpRPK5rvr7Ovf7PFnWiLXCUloEXRx
	CN1Kt2rVF6uxRxwViyQUdCo8WVsCgd0mwQ1nGP/8yH2lSERnHl5T/9IgNhrv+MSeg9NrIaAzMA3
	n3/W+afgUh7N5nmyfFpQg1JtZeXzbfgQkVm8wr07ai259QbJAyW8FV2NNpqXdl2Ov1SsMASR2z0
	m3DkE5F86JmKJ3kiKTuhMeFwOxM1JKydlNLoZXpMDOrkyLlQ/2PZbZZGEWui5y5Z5Lj9yDurnMD
	Ctroo6o15s/wfNjfn6XODCQ==
X-Received: by 2002:a05:620a:480a:b0:939:c8b8:4639 with SMTP id af79cd13be357-93a29c029cdmr224874585a.4.1789382682329;
        Mon, 14 Sep 2026 03:44:42 -0700 (PDT)
X-Received: by 2002:a05:620a:480a:b0:939:c8b8:4639 with SMTP id af79cd13be357-93a29c029cdmr224872485a.4.1789382681869;
        Mon, 14 Sep 2026 03:44:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9ba8f3ab9sm3782645a12.15.2026.09.14.03.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 03:44:41 -0700 (PDT)
Message-ID: <9a072680-c06b-4255-bece-bd20a90a1e14@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:44:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: nord-ride-embedded: Enable PCIe
 controllers and PHY
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
 <20260914071944.164217-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914071944.164217-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX4M+6q+EJ9OPi
 JuOyCtkdkL2bEALMljsffF1hjonwifkWR8bm2JL83ZQyHd+KJRRYgzSgN+EZJAx+J6ao64XIX+v
 McJ3GPT6YQN8EX4hPYlqniRMLMfDryeUTXY/1OFV4UdH8lKutXmEVxoV/xN4An23kLaXEPqpF/8
 DwOFjXlUhuFDZFXENRLRym6yJNDG5+4bT+XRpFrZZlKIy7oxah/0kRn2LiLvKOU+k7EYnKtP6vB
 H2copw7Bfcz1i4cJ2EzIWfPg3yNMl0VE0EdnJOr5xXDnpwapYwPo5fwuXPSLK57ErsRsf7L4oRN
 PHzfmhCP2FE3v2ImLeE1rE/L8ZfNwg0SUxBW1+OpwVzDejs4OpcBy8+jwp2AvyQwU0lDwNJ01qH
 d67T2z1CscSEoHKaPsAlLXPiJtShyFcnxygmN4/MsHnMBp2nyqrUkJ4kNivnG9kPoK5cpvU4fT8
 bYa0LHYIIfXRAU+CnKQ==
X-Proofpoint-GUID: q8eapdO_M1QiGlSpEpgJjvqPez9Wwhsb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX03z6eMNgMx7t
 8XjDlKLyZna2XYbnxLuk8xnIcqqVfHRsGiL4XXe4DRCM6T73TFk3QHdOE6cec/nKIRnVg3y1hw8
 F713dxPMr1yC3r5GsvHi54xDixvC5Lo=
X-Proofpoint-ORIG-GUID: q8eapdO_M1QiGlSpEpgJjvqPez9Wwhsb
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7d01b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=393rYoDGjkx6UDgLgWgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140154

On 9/14/26 9:19 AM, Shawn Guo wrote:
> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 
> The Nord Ride Embedded board routes all four PCIe links, so enable
> pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL rails, and
> describe the PERST# and WAKE# lines of each root port.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
