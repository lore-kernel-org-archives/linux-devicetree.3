Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B244A3870
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 08:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842027; cv=none; b=oVAeEPF8Oi/8/RrtNVyoDY+df2LsVnPQgsvmRNStCun1XJRz84+kKLgx+XcsFyNYf9J8CmXT5AfKM/GrNYj2jGLt9fDPlOdXLdjj01HFGF7JzGac9tO9od1W5C8SSW0+bGIducXqwa0WEhj5Y/w8TvTInE1SB1lt1/4zg94S+bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842027; c=relaxed/simple;
	bh=Jty/f3HWkGXalx9H5RrUnfAswWl+v0AAg4ji2EBfru4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BY3xR7Y6hvLX4idMcvovhlVlTFb/uZFI/59+W5vEQzGV6Md8lokPPRTGOMN+ST6irUDfNh+6mXzUfaVjtFNpmcFtTY7SjLXts3sdrQRC9IICWba2oQqbl/zSGjD7lAIdQyBi/GLHR0PwpYAtjJ0csnzyKI/3rjRONdUhXhz/xrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j/byryf4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DR7nTxph; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j/byryf4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DR7nTxph"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xnAO396316
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 08:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a2+uakS3SXIfKHjN/Q0tB5X3dTaJ81nHOC9ZuhbU7rM=; b=j/byryf4F4l6haxs
	m3ZK3HLk5vi70FELPX44Gh35VFEFbtOEL2qNIcAo7uyLNg7G8YkIkevOvLzZjyUg
	Sk82MAdlqnSVaUXDAo3nfsmoCFcI+dlDt7UJxZwFqYs+RL/xf5f288dPaqGPE0bG
	SYu0dO1tus7/rih/JD/5qvhy7xbJHBr6ng/CulIZvm0VaX+EQNa8h8I4i3zGWhXp
	q3SmKQ2Vudla8OFuW+BYdlSpFl0vHgOIBUe96ZKSuwz5fbHKsku3mWrMdv2knM01
	fVZKl9279xgjp3FZl7+aq11BjTInopj1ZKT1pDORn6mxMzPca4/ckm2NtU3OEFok
	ueGOBQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh59q0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:07:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c29d85d0dso68151585a.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 01:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790842024; x=1791446824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a2+uakS3SXIfKHjN/Q0tB5X3dTaJ81nHOC9ZuhbU7rM=;
        b=DR7nTxphg+hbQgkyK5x9IXsaumLXlpugnQyfyMek4MED0SsYYxy4LBFSA82LrkZg6N
         cUI2eBIIgqN5DfeMXYV1VVmJuVlNP8jafKRnKmAQ43M/opi+fT0MKo899BtTUyBzmU0k
         ZkADGwuBy4pLMoT+jM/sYIvVRRwp45TAeYR2eUfwU+jf62Oql+kcbvLAqLLh1LwW3xk/
         wgsR19KLHnLU9SbAuVPsGWIVwY515bXsO2jc0hiZtW5MGVKmEKlvw8zEY1NPRMsezjtq
         LXe9peHzJVSeNJMA397l3xcDmwJgNcS3/5Xp+nFINWReZPXzHZ323bfyhiXNERIXTIz+
         bNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790842024; x=1791446824;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a2+uakS3SXIfKHjN/Q0tB5X3dTaJ81nHOC9ZuhbU7rM=;
        b=u2gD2xgLsO3VFrHwbx08NDKLa1rzzyff+S0iDHa0V2e9Svu2plUIJbEUqv8fb+8ipe
         jtxOtlGA0J0i2qbonYSlnkMqS4dXhgzDaobSGqPwZyILKa16nTXeOXffsCIwQnCUXTOo
         R2bwaakIaAC00JoKGoXE+gMnENJbS62LuKX/U35ZxUA7SgWXrOmZvUC67tygMUWLZgt0
         /TEJon5XExQ4eF5x+WhtndCQwFBol8i2Ele0LOC+da/elXbdTFU5s4mnnrHixZLs2URj
         qY5S4wCpVxmGTTd108eEXmnIurWRBYLAOaUEyFgR06yTwOButm2ogi2wCtUqf6l2RP13
         wfHQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8TDys7/Lsxah8+dzZHaML9kt5lyYc/el0V7ZDKpqgTsbIfGg7gSKhBui5mpBBt9/o1niEaBMZ4WeS@vger.kernel.org
X-Gm-Message-State: AFuF++mvvjn5PNykI+KKmTo0F3qX9IsO1v8+axSuTDSRfMGqYawLSHjq
	NwREXcY8kthO5IGKVNmTB/fKACBGISN/o9Qvj74AJEVJUEdLdaAvPu9GHEuqu20wpITkmqwYy+h
	WXXh/UrCb+aPNX5byjFZL47cDwKQ0CDqD2kmJerwxjxJoQhw/Gk2KuKMkrFPaqEzsvRR+M4Ml
X-Gm-Gg: AYBFou3KLJaiWQ1KLZiMTeRzG7o8OUaysMyr0Pg7GcrRJGgsP324mQPxgxxScDaBtBD
	/rd0CzR9aIdnvPrsAtWmH/AX0kySprFfvIDYAZ1D+iSW6c0VL+pDp1xWc1MiLqgqTKgWAbMc3aX
	O9Leze7wHGCStOkJG6EpVkEX0wrMqbaxCw1oDWiWxN0itcCrAJzRSpadY43sVaYHe2bLnekw14W
	eMRfWqtITTnyYdF1HMC3BXx/kE9yQb3mMHkrNfy2bUVytOu87Y/EB32MrQvuBusJrWTFkrDl5Lc
	LtmYpNGUG3gVVes965OntQCoLZACNGTRaqZYbnV43lnZXmwuTFimHsRqvafvGOEXsk5EWtVKGCW
	NH2wvfr1Q4YjJdVpyVVx/xQ==
X-Received: by 2002:a05:620a:84c6:b0:93c:9e43:6807 with SMTP id af79cd13be357-93ca97b92eemr630028185a.3.1790842024130;
        Thu, 01 Oct 2026 01:07:04 -0700 (PDT)
X-Received: by 2002:a05:620a:84c6:b0:93c:9e43:6807 with SMTP id af79cd13be357-93ca97b92eemr630024085a.3.1790842023633;
        Thu, 01 Oct 2026 01:07:03 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae5ca72d4esm648046a12.25.2026.10.01.01.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:07:02 -0700 (PDT)
Message-ID: <12e76437-c2bb-40b5-ac9d-a6f89f5f3999@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:07:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] phy: qcom: snps-femto-v2: Move PHY init registers
 to config tables
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924-phy-v3-0-088e7be0cfaa@oss.qualcomm.com>
 <20260924-phy-v3-4-088e7be0cfaa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260924-phy-v3-4-088e7be0cfaa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzMiBTYWx0ZWRfX7/7mRdNbliZJ
 5b533kZMad714u11ZaBhE3hnUZijbhnbrn9nUiKB/p1m1A8rXw748UlfQRVKniylDyhRJoQL8Mr
 vY8IgZoGX0Cq0BOmEJB6jcdG9KpUuTCTlTeHIHLRfrApDz16cLKl17Kk9V6BKllgOyBdeve9gVL
 ekCtnEIkEHtQOHvfgJCLA9SeVGnMw5kx40S/iIK82i4rISfA3+vbwvQIC7beezIbnquUb3nLB3Y
 OZmFdGiDlx8/VS43GuvUQ2MNn+OqU57Rqe85Q5IW/8NlmOEpZet8aJWlNqRBKftEVroITlDKXXw
 6bGCx3XV7tgumrIRH3opP2/Eao/H1aGGFgRVvef7QoH4dKcDkbIbovNOk/6Ur6Gv+YKBojg89nX
 SzDpye5gqYJxHPffVXu6CVF3K5H+0TekFz0n3I8G5PmFe0ITsJ9+wh2NAdQMCy7H8OgQ/x8k2Bb
 whbLxRO6ql2PhdHLSMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzMiBTYWx0ZWRfX6oJTcOaOPBJz
 KKfZfLYjwcAJwqfeSEfrTyjjjG5U2K8nc0YDkS4hrzsc0PX/65dDIWO22aJEc1N4kZPki/oStaN
 Hd/H/L/uzYnauf068dQpXuOFGZuIuU4=
X-Proofpoint-ORIG-GUID: Eb67Zr6E6HDyd9rIntyHAuBJ5SHv2V67
X-Proofpoint-GUID: Eb67Zr6E6HDyd9rIntyHAuBJ5SHv2V67
X-Authority-Analysis: v=2.4 cv=NrJE4MdJ c=1 sm=1 tr=0 ts=6abe14a9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=lPcTt8mPJekVWdHiCMEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010032

On 9/24/26 8:10 AM, Varadarajan Narayanan wrote:
> The driver currently programs the common PHY register sequence directly in
> qcom_snps_hsphy_init(), with the fixed register writes split around the
> override parameter handling. This makes it hard to support SoCs that need a
> different sequence or different values.
> 
> Move the fixed pre- and post-override register programming into per-
> compatible configuration tables, and keep the 7 nm override parameters in
> the same match-data structure. This allows the driver to share the common
> sequence while adding SoC-specific sequences for future platforms such as
> IPQ9650.
> 
> Additionally, address the register bit field mask & value mixup for
> USB2_PHY_USB_PHY_REFCLK_CTRL in qcom_snps_hsphy_init() and USB2_AUTO_RESUME
> in qcom_snps_hsphy_suspend().

Please separate this out. Otherwise GPT thinks this patch
looks alright

Konrad
