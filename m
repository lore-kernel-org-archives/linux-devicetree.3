Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD722989A2
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625287; cv=none; b=PxNxn+w8nV2UUyfliE6zaBI9iK8+X21WtWU8R7GjqGHy9rM9dQmcuWyeAuxlIUo8McaWGW3GAlGZS3rT1DuQishHT54OK8O8hi7BfYW43HaOE51MynmDpvb73FPpDv9+RTEJj3UVQKmnMP5uvjUgWwbKTFdsAZqH+BCSeLnV8Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625287; c=relaxed/simple;
	bh=of9T21fRZVkOWoQoDd05G2q4zDxLbmQAgk1S8SBDqgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2/cY8nsQzmKfjpXeSaCNX3fGlEyNwCyGNYERfyqRUuiLA889yYEfib+ZuDlsAUpDuuHVaJZPb/G9sGND5SNjXlQ/diOGUQR5mYMXdNVjGhM9GeiJ7YIe+Y/3q+y2qwLAgr1VDkCJojJW+rVxHlaM0MJdoDwka0xwodA8D2gp+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ppcDKH2F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gpYsQAyM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ppcDKH2F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gpYsQAyM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RF273Z3630881
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rl9NioBh97mpHdlYqyHknnjK
	G32/1QeD4He/706pcPc=; b=ppcDKH2F7Gqm+Ky+KADF5mz9pUo5rWXF0jfWFFqL
	Vbq3aHAImReMsYmhS/E9inVwYUiQjcr82cVWPVQ3LSG+qT/OYL1fSaROcpD0wYol
	rqhbYBhewEUasTOax2vvFp38Olz+ajC6dsOcIcO+lW60yUxdUg5Jayn92rg2Xxs2
	+YuefdmdDzebRZtVqdfaFI3qikl1cAz32WEEByx28AxxYsVMJmlflJBVfz603p5A
	+gEsieYNQyW5W6Xk5HzRQGphN98y2ulSH2GINtlaxdk2/WIdAoCWB+gONBEkBPvj
	cXNKoPXomuc2Go/XadzP68dnzuVXZnmxR5WFIHZyGm0akQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5v6b02vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:28:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b3544bc7bso33005101cf.2
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774625284; x=1775230084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rl9NioBh97mpHdlYqyHknnjKG32/1QeD4He/706pcPc=;
        b=gpYsQAyMKVroRf19cStoSLSdR/0sUcLE7JV/agdmiMv/OX1uHBX/1VVq5OVrahOsBG
         Ew7JxNnL6aDd2buEygxAw80AWRuDMwh0xnRymx8ijWxnaq34jWqhjLNgX7CH9x/acFYN
         DIIcsmnbVncsZsq5BWutgE0i7+pP1Wx2BquYl/TKsE5U8sE44cvd09BUsBfis9Fwz3Gk
         H3q5xdPacQGPMKpBV2ocXm3p6Yr4BI1ECZ6OfOF1W1yaQBKFFvx7AdsornRDzue3t97i
         k90eZO5yLeNRtbDWxeAIcEKSZ3AEtOwD1SfV7gLapbACZ57mbR3CfmBTEqnqZFiXdtgo
         /Uag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774625284; x=1775230084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rl9NioBh97mpHdlYqyHknnjKG32/1QeD4He/706pcPc=;
        b=ckO5o8A2V0KRwUxqZ49JNV7toz2DucvYxEEIbR+IE0s5ON50VGuA1x4yAomGu8Uk1Q
         cmbtZlSMG1vn3EksfAN41MqQWMWFaR20mO1AjLC8wHLqtI0rgWCUNaZIFKpLQ2/kSRHN
         OutwHfzWi1npnHL5ohhVJzuKRMYfCun1ELgs6eUURlJVrbORK9BrZxYL3fDeOyOX0wrU
         z+B4GICowR3t6UI8+wsjszdPIkwDrlnAqiNDwbTqaAkpv69XD6z4Sca18fGc1us5NeKA
         4regtgjfN05wlUW3nHCgKj1hrS88lRgaToBqWad6Rm0rEBjnVPovoOuL0o/Yzkx+wRCz
         04Yg==
X-Forwarded-Encrypted: i=1; AJvYcCXSXU/t5H0ZYWku22NaGPD2RMsu4/h4vkVQd2VkEQs4Hsq7NOSxClMbeKUSN1SlHv6rTpuOrqPia7t/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6ocj3t6+NrtrHnyChcc+XrY4i9Gf4KgWoFYtAhUe/8mf2kdag
	YlyfEHU1m7Q2Cwo7PFHV6vUQEzkFK7OfEvt8QE2yw789kdR3xyaR7cwNGuVvpll3A1bo1WTquun
	/wlAZn7HR9VoyVfkS5haTP3G43OUgp5jnSatl3+n+IAZREdQcWEe7f6/Ose0mty8/
X-Gm-Gg: ATEYQzw3Uj1l+BivApy18LKKyeZEhvtXczNUAyWvzN5X+VWzcklMdh3pzjsTtdkeH9A
	eDzUWTgI45NY7IunHt+LofQQCbysO9GxOx6LRXzjYyscX91TdXKIZStSUodYAKyYGk67tdnQTyj
	a33hMRBKjP26rBJG+zj2GWxfMdJuHV7BQhetVopToPoh+oscxIdFiq6DaXGmJ0rmYMnbplrkE3n
	5fSyZudX2Y3br7FcKxl4FH99XRXRK4rx85Hff1Ce81ux3R/us6iRxVNt0rbP4bp6mA2gNlbyEU/
	gudiEO7v6KfIEzEb0YMduOo4Kcw6KrSIqzMK4iztvf+S2e6jh7A/LDNY1oC4CyHdwF9YfyeC7AS
	qpuqHUXto3+WS/LeYnMdOKV43kXWUNgj+LA==
X-Received: by 2002:ac8:5744:0:b0:50b:42fe:d2a2 with SMTP id d75a77b69052e-50ba3836e2dmr42094921cf.18.1774625284269;
        Fri, 27 Mar 2026 08:28:04 -0700 (PDT)
X-Received: by 2002:ac8:5744:0:b0:50b:42fe:d2a2 with SMTP id d75a77b69052e-50ba3836e2dmr42094071cf.18.1774625283511;
        Fri, 27 Mar 2026 08:28:03 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48727189cd1sm17513285e9.29.2026.03.27.08.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:28:02 -0700 (PDT)
Date: Fri, 27 Mar 2026 17:28:01 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add thermal sensors
Message-ID: <opfy3ekoo5phtdnf67k2usspi4vhb27wzrxpjkqzdovjbnirjx@qyym3retvffj>
References: <20260327101225.382493-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327101225.382493-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: l98TG3zTSKD2bTlcBdPYPXC2jq_DmNJp
X-Proofpoint-ORIG-GUID: l98TG3zTSKD2bTlcBdPYPXC2jq_DmNJp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfX1G6T7yP9hsfS
 dxvxPH+pUGkSCJuDdtcdR5e320mZE1RTWR1lpD3+fbSFADcInYbvcB99SlMUdZAAzL7tvFm7YbH
 oo0TTXGOwFACs96yk2IN0/F8xGIb/WtkRwV4jf73kPnSPbZHc3GxIOXaM7hHcj3WB8igieoGk/f
 r0JcBaWZAXOlN3jc6fcf2K3S7zWIFliOm/f46yj/dNfNqzV4/2GhC8RjKhEJaxODXgZs6NXxcjv
 4YwTjj+UQcjk5Es6JBHLnkwv/TcSWZPTLw8w95+mf5nC55h28elMan3pLgYVO8YDzNkKldDI3yc
 V8uO6cNifuVMT/hGnGRRF7dJAMYgdie+pkPJY188LCPfmINm8pBlaZRMVrLYgBfZ4c3zI+NAyPd
 aRZDuiBMUhvbDvzypBpQZi+umf5RZWkPMG06OO0awfMUEiHUt/Bx8HvDIIEgAQ6gBkIqDXPcO79
 STAe2t6oU4PEZO+tlFg==
X-Authority-Analysis: v=2.4 cv=JLs2csKb c=1 sm=1 tr=0 ts=69c6a205 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=imO6bpS-6So6pA60xL8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270106

On 26-03-27 11:12:26, Krzysztof Kozlowski wrote:
> Add TSENS thermal sensors to Qualcomm Eliza SoC among with thermal
> zones.  The TSENS is compatible with previous generations.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
