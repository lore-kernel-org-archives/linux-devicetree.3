Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577133;
	b=dFZC3b/69pyv5FzMsq0fi33L0TRr0URH6aRJSTu2T0IegwuH7NArwxVFJFIfjNInde+B
	 dNkojijWnVzsN8rd88tSSjYzoRexUEChDt6EroYF3kHnQYMz6p+yWQmGxeVHO6B6NSv1k
	 MUdYIDWrjgTwukKXaUbADddA0J9E8OSwMAFA8dPbpvtdr4Kr6wJr+lrf8a33CCCcoEic/
	 FujvEGeDaCaoMk+ma9FctoupMHPuQpIBLKWdas61a/Ev29boeeksPuhk4cJuvUxreV7ir
	 b65c9NqqSTrx+tRqZZlbZroc+4Un2kqqpe05mOBOIlWZd0HKlcXXLWAZI6ranEvOZQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577133;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3k2GQpfyrf50S1Og3Onht9ZyUhGxFZcHms6etOpKY5w=;
	b=2OFojAciSIm6jHOaGxgwPak1HQde3M1RwnMtru7zv+p74Qz4GgBzOF8kiLYXVW9Cg6cC
	 sM9OzwowYvCQIe+m9s9pvTjO2HRuuzdBBN7aqTuhXsho4yZ7vdERXqHcWd3NZFK2jVa4G
	 zZ1WZn1xKlhhyVBj9+AT8zjxbXay/SQAEJ3WmRosDz/4MyCucuHm+J+obBwhNTSdSPA+m
	 qC4sYj4BaY4LkOUmGa+uahO4SNSC0PTwa+QrYYWAbPtq8ETW/GjhkfQc6A6fxgBvtZHQP
	 2vy5yExoqo26w3H/rhn3llOODaRpkOse35jMBzaNS9LRKLHkgX5no2wLWnRb1hh0OqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mnha30I9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JQKA542l;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C07606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1C07606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mnha30I9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JQKA542l
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L8rbLO684067
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3k2GQpfyrf50S1Og3Onht9ZyUhGxFZcHms6etOpKY5w=; b=Mnha30I9XBjqyqwa
	VwBDAkT63M1Sh3jOTM8rJCKL3Fb8ryU1L2SsZ+sfKA1wav03soyvan2ILjpvRJbL
	smBfLJAG9M4NqKlaAXTpNUq0IYe+ZeHukXEMfTUYnx6LNxGR0AIpB547ZbuL391B
	Ae7vJrXcyP0qdePMxnUjEJV0VCbLEoP0tlG0C8h8jW4IXFTBptI2g7KbC+BA/ziE
	mDAPFllhzBn0pu69kMi/0mqnv9kPTJbvcHc/wNZSZWcK2xGNM00tPe30iAZuIKx1
	5U0/DbYfyci7jvveQ7TRcMaf57EiHmpvRMwd8r8ZrbDmPWHJisLeQX/yBOsFZLXn
	50GC7w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajkd0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:05:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea8a9cfe6so15723485a.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577114; x=1793181914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3k2GQpfyrf50S1Og3Onht9ZyUhGxFZcHms6etOpKY5w=;
        b=JQKA542lIk1uORq0LH7N+aPMRf0R9FTN/BX2xAP/PXiV/Z79LbFAtQ+iLqSpPvUJPB
         oEiK870jvr6fkEgCLlW+IItGldYNb7BMNj3gMEomA3ISnsGw0mXW5yawskYE5jq+J9FL
         lcZOLdVUoJ0WqC8TOQgBZQnKlAQIKMKvYKMsyKV52i3GSIbsLQOflE47SUId1g5beVJn
         KToNfBUo+sYWbBqMWzrNtmW0A4+ptITimGtNzsWLtyIM9besU8by7SrS++fvpxjj7ptJ
         j7cpzURJgPbhumI0/HsM1hq+inaczRtA7rx2c3Mftd9qEG1M+1UPgjAdQMhtyQ/jy7mz
         bu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577114; x=1793181914;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3k2GQpfyrf50S1Og3Onht9ZyUhGxFZcHms6etOpKY5w=;
        b=vMSBVEjRlfSOOjNMc1pdb6mK4vyfVkAiPBWyMVDSNXg7P0IgpWcCTSs27mMcjYAn7n
         n9JSSyuQo/v9zCinic7WAEgbKiWQn5ArWjZSYfrXbam8acVphmtlpanmr+1sVylVGM9s
         +4BH+Rjf7iwry7QmpJvF6fdpZ3V+LUTawEH1SLeDXaFNOwyXql64OYjh+PbPN3UwQPB3
         oW359Lns+YhoWR9lTsDM7ukXegGvpWSahHyf2DAA9LGvqRhgsNGlVwu8E3XjjpyYR5B3
         T0UwfM1fYB2ffElJxDCs6wSdpkRX9UMZ4maGAQbyayGbwdiyNZEgrOkh84ASR/S8CXzw
         j1qA==
X-Forwarded-Encrypted: i=1; AKwUvByr3vxgmMK4pxp+D53TpTRTniARmOsX8B23VQeJgyVRDl28POFcKkID8Bxd3X/jY3qVwiIkpMeAm1eI@vger.kernel.org
X-Gm-Message-State: AFq9FYLZ1wZSksqUI18TlKzx7pklYKfBer7VZrHs+h3lYryZp0usBCzq
	kDmEPWuEVrwpzjVYLHTyBl3FNPZefNLIT5xyy1HvfK2eOcK7yLLNvQXteBCuH49qGkV9k0/SAGV
	Ceh4wcHV8QOFNqF8n9dyC3WuYJmRF8uQNDA5oJYTBo2g4rwKzdjF51mO3lAfuNEo9
X-Gm-Gg: AYBFou11EGoi5jCaj3ONiyDBmsKD2mDZ6VOOs6qLpxvNOlKOoFJ0oJQOjhc+b+31QCH
	tq2hBNUoxmFhYjBbvBq/jv9MROy8h+p06mcZOXoC5b+xUR/e/vkL/IvMLTjOXIFv+Pz0cCqcvu5
	hXUfTEnR7K50hEvijsz2Yi7NfzjCkPPGDiBVtY3VEKlfmmkroGsbDbefLW25RfjHsOt7Sh4SYzC
	HRTK9D4TFkpkkhXsN8Pk9QD9nYrRzPLDhTcp5K8IioQVUjHVIXjgDfa89DbIBd1d/msry/ECC2c
	qw2Pv/EAGLsbA1k9VpMFT4RcJGqpbGvtn5TzUQ/prAVLxLTaS2xBr0O/xLdf4USTdofDsvXOZ68
	dHQDpybNsXc8bC745BiSAhw==
X-Received: by 2002:a05:620a:19a0:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f57f72681mr365326485a.5.1792577114402;
        Wed, 21 Oct 2026 03:05:14 -0700 (PDT)
X-Received: by 2002:a05:620a:19a0:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f57f72681mr365320585a.5.1792577113705;
        Wed, 21 Oct 2026 03:05:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679005390sm59881666b.70.2026.10.21.03.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:05:12 -0700 (PDT)
Message-ID: <aac44711-c2b2-45d6-896a-540aba9e3500@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:05:10 +0200
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
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: hamoa-iot-evk: Add eDP display
 overlay
To: Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vishnu.saini@oss.qualcomm.com
References: <20260922-edp_overlay_for-next-v3-0-2758d46ee174@oss.qualcomm.com>
 <20260922-edp_overlay_for-next-v3-1-2758d46ee174@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-edp_overlay_for-next-v3-1-2758d46ee174@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX5r7d74sS3LS4
 6KRiVtPATjYwKGy81ZC47OdnwV9O/42XAGtaytJn/ofi7aWIsTb1TSaKd4Gv2Z0W+jtLgky/ngP
 BidsLs4sqSIjstHzhOvtdO3jlWV8MuOOGWYGw+56HcgI/RbEIp6/QB7fWqV88FFWeqNOj7K9ssw
 jWCW4GP8UJ0AH5ODFbY28Wy/6XUEHLt4HO1QcHx4YsFchsBdtxDhtGU9/8ERBeU0tOFgSljUlXL
 Dx2Mo6E0F4cmzQWqH3M0GjDVqzDNNJz1GKp4bTNgdqRxofMLZ5wUY2Yra/VlnvJblZS3hl4IE5J
 PW0RLJCTgYt5FfExJvpWVlT0tRz729qITRER6Mb234qc742wa0GyoP3uo57Hzu/2XCPMAhFGuJ3
 czcuRyhk10oVZfeY8s/jMnvUI+cbsOJKJGEaRXxGoVSqFr2JAA/5hi8Cdh+SNmYkAcfB1oxVtkW
 XTUWjG227dEsQFkkiNQ==
X-Proofpoint-GUID: oz3E-IvtKHqvyVIe0HsmtONBj0bIW_hL
X-Proofpoint-ORIG-GUID: oz3E-IvtKHqvyVIe0HsmtONBj0bIW_hL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX3rxiiZqOLe4e
 o1UEm3rPqdjWj+aEXSBuFbeee7bw7L5wgyBeocnOPT+lAiV6yyCSRDhgFP9SA1ZpkGKeYYr3DMe
 AWWm9uO9NQxFdQRz/Sqh5j5hB7q+b9o=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad88e5b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FpWcO8zvdDYuGJGNxnYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210040

On 9/22/26 12:42 PM, Anand Tiwari wrote:
> Hamoa IoT EVK variants are available with and without an eDP panel.
> When the panel is not connected, DP3 is unused, but the base
> DTS still describes the eDP panel and display path.
> 
> This causes the eDP-panel driver to probe an unavailable panel, resulting
> in AUX probe timeouts and missing display modes. Userspace then attempts
> display commits through the eDP connector, causing repeated DPU vblank,
> frame-done, and IRQ timeout errors.
> 
> Move the DP3 and eDP panel specific nodes into an overlay so the base
> DTB describes the configuration without the panel, while the overlay
> enables eDP panel for boards with the panel connected.
> 
> DT overlays cannot remove properties from a node defined in the base
> DTB, so keeping the /delete-property/ of #sound-dai-cells in base DTS
> where it takes effect.
> 
> Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
