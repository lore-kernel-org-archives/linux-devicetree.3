Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB343A59BC
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 15:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600521; cv=none; b=gkMeVuOe5VJORqA06xFc17LepcTlJaCsC7+H3n8YDhIAyyboOFIJ9zhrFZ0HIxWBK7zb7WDCm5g4AeoIZxQulnoNnlwSUELdquD0DzRtvukRgrALifnt/HXRWho5ZNOw+jGRQMLMCf/sa+Efts8BoQoi/w5Rf6OSozYVQUJaasI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600521; c=relaxed/simple;
	bh=ASNsGfdU6T1j1BVptVb2ZQaAVqQX9/RgVV0xy4hHAWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JMYe34dZiSq0x7zV2cn6nuQUlF/GuCdxbQ+yN+jNzOwm1d5wImG00yNy+laPq6Mgl6zfd01T1OaPAZ5MgJq0OBl43N6Usi5KmqYbzLFyGt459ULRrMKjT6YfiGBZnZ4iEE52nPhnP/lCK8Nyo4GAI8WRx6s+hTe/5dzfHLbynLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y3+m0Z5d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fJXvf3+T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y3+m0Z5d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fJXvf3+T"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB5Nwn591937
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 15:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mhVAp6Xj9ZdNGTiZn3SgC0uWIr60z6YXZup+UZ1L3Wk=; b=Y3+m0Z5djiUbsyXf
	SgAkhA6Q47XcObutVLWbH6y2kGjDt6faF6S/M4pXeTtB1iZN8VhNg0DZZA0/CHPy
	ePhQD5s3cRqHkIYKEGwqZRYl8T/yi0+EH9UPtXMdeIMu94O57XIcbfWlZyWyP6Xn
	IOzMu0gu+yrbmNFGk7JXxOlZnSG6rJSTUBnWbbH0/gJYf/QUT6IlnKMfsw6lefIv
	WDmGpODPqcy3XWOyyoIBPsCtD6N9Ue2hxdTIR1IPh/zPLeJgieaZPHcTt4t7Kof1
	2+vzDN5MNsZb26UK/9zaWjOsdvL1wFAKgCDkrpRkEDV+ZEEcQ1yJU706J+cKMam2
	+uHhQQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4319s482-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 15:41:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-366015bca9bso4605494a91.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 08:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778600518; x=1779205318; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mhVAp6Xj9ZdNGTiZn3SgC0uWIr60z6YXZup+UZ1L3Wk=;
        b=fJXvf3+TAp3Ut+vdBzUvSA9lj4gjfr7laZViDJBpLFRaXfXyTA/AZWVQIdkpUb2hgU
         HpB3dZYW94TrlTe7OpEZyqShha2aq8nX/acbcX7pdVocapLZZDi5+ewwlVGy2SAWexsF
         4VdMOtEuA+V/+Pjz7O8w+rIwGpwHd+C8UVvlkuMLI7WRY6NJRgoz6F4/WaQ8OGfnWS5B
         rHzLvedFkiJwriHGH3P2bAwwYtTIDpxHXDV9x7Q9PTNflVfKcB+eEyNcQTokW1PGU9RX
         rg0y5CdcW8xUdxSoFM5Bnu4keJTBrDWIyT2Oh5AgB8Mw2/szNHBblySzAxFy9EDKCWPw
         xMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778600518; x=1779205318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mhVAp6Xj9ZdNGTiZn3SgC0uWIr60z6YXZup+UZ1L3Wk=;
        b=fwzXEnihyJySASW1qudBzk6T+HbKr7lhgNb/T48jkIKLBJtg5MxtQkLBbeUytdERSL
         Pr51XJGom63+pJPhCVY7xG8/pa3nWeLKO2gQ3Lj4XGQ0ALjuz3UIPFIohfhtZeK5hk9Y
         APFAY9b/T9kqMeBlxNNZFanXRVOsTrXnuTPip+mKroSTv5Z/Q2cJvU6H8PLI9ns6ylMJ
         0h9CNkMnnEffwt+Yq/R61zQlYLkDVFPckUUQDfmiO6tj6gZSIBlg5RonjQhbJqiXe3Dn
         k2Tc7oIa+16ElwKIcmk01XB8v5UMG2rjF2wo/C7ahI4/maNdnzDFCEItCMOdcUq0Y/Z/
         Bi7A==
X-Forwarded-Encrypted: i=1; AFNElJ965vHUa1+SeItbbB1jx/DilmHkXVzLSnV3Ljim93xRPRv0EfIZ0MSeX0U1BdorMqknf1m1SxrFtj2P@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq+X+WglZ1PlRTlKIIqA+Sjlcdk0VYVcx8U+qVsQlZq9Wj+46M
	F9M4kcRFJheEQ3PdvKe7/fUe6wWx4PaKYjqx+qN1+TwsKxaRTIOmEhcfs2ugm/uJZ6Fn2bxoK8M
	2OTrl9GQMBtdEDut3861nhazNtkcbYo9vI8ohfHtSk5FCsYnvNIBfV844IuaULdoM
X-Gm-Gg: Acq92OGq+tkF7ArYySiTHn/JMV+0V2L35Tttlo+ySnKy+CY860V8QZJ0VdKhTTHT236
	mgdCB1MQVDlauvkoJKoSPn0neBEBjVXRQgbQITmZ4R26WBN7izh1eXCLeSWGCbBkTTP6b7DOtUM
	7okHDptnpapRfehL/BMLv2/XK+34dP/O8XRcX6wgX973HVct5QpgX+RauS/kIGwe4fjoZH/VSKr
	g4XNskivVV8Me8TTUKxpNLOl+PUM2CRylOGdYa3KYL7jC6FrYyeaXzF7MKZCmx/hhJ8kLa1u+WW
	fMOj07IPM+X2vHWxllVaGgaUman+QBkUJnCtUhoTpYjSAdjkJhscd1WFmphCqTGpJ2yjZi6/gED
	TbA/nJbbAyJpEFzrZn1neZcbtrJz9Qdino/FdTNs2Y+ytstVoxOp8c4emMZT+qpcDwA==
X-Received: by 2002:a17:90b:3c06:b0:368:4a6f:28f8 with SMTP id 98e67ed59e1d1-368ab827fabmr3941280a91.1.1778600517898;
        Tue, 12 May 2026 08:41:57 -0700 (PDT)
X-Received: by 2002:a17:90b:3c06:b0:368:4a6f:28f8 with SMTP id 98e67ed59e1d1-368ab827fabmr3941235a91.1.1778600517373;
        Tue, 12 May 2026 08:41:57 -0700 (PDT)
Received: from [192.168.1.3] ([122.164.84.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368edf7a1edsm232693a91.12.2026.05.12.08.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 08:41:56 -0700 (PDT)
Message-ID: <e2633ae4-9fa0-4972-904f-102c139966d8@oss.qualcomm.com>
Date: Tue, 12 May 2026 21:11:51 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add the SMMU and the downlod mode support for
 Qualcomm's IPQ9650 SoC.
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260512-ipq9650_more_dev_support-v1-0-c4c627351d80@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260512-ipq9650_more_dev_support-v1-0-c4c627351d80@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE2MyBTYWx0ZWRfX3YwEBJPJpV2Y
 BHO+Xw6lfKDouCBZevMRaMcNF5qr/M2M1rit0/0qQ1BCf4pqFwInIF4IycLNI3WwrSmwm+IvBkx
 JmMAMpwG8nF6Wqxd1vW30Ecij/nnGWQGB6D6mEW23mWHBWOQB/lJXI7ES9ksSOODxwWju3pqrUO
 n9oNPNesBZ3PTwqIiJA5ZQrrDTQ6oxqnOuzv4Ck6aD/7Wx9bZnOaIkswy5fwM39XHyJIwi08AVN
 /QCKLL+ntEuiNt/vG2rFP/WK2fKPQ1T3JIHSA3Ffx+Xid6K+DwmZ4eLp54Bzh88DA9y9B+GALVe
 uCWTUu4EIdesN1Diju1apldcI7KfIfd55fwnNoxELKc5tIdhbWp38wehCoFH78AlSNDXzak0X6Z
 qf0mqbqgMd1LQUzFWn56stvOOLb4g17hoqBAuOzUxzqfFFfXUS0xaiomeEfFFfmn0pXKci56C4X
 3nwzOHSEtGSkMYoB/0Q==
X-Proofpoint-GUID: 4uutNH5uT6DUubyeo6stmx61dIZ0d01T
X-Authority-Analysis: v=2.4 cv=bp98wkai c=1 sm=1 tr=0 ts=6a034a47 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=trKcrno5vQlz3joPFEC71w==:17
 a=_3c_48eCv6knbha3:21 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pR5C15jJDmVn8rSoiLEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 4uutNH5uT6DUubyeo6stmx61dIZ0d01T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120163


On 5/12/2026 12:34 PM, Kathiravan Thirumoorthy wrote:
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Kathiravan Thirumoorthy (2):
>        arm64: dts: qcom: ipq9650: add the SMMU device
>        arm64: dts: qcom: ipq9650: add the download mode support

Please ignore this series. I have received some updates from the design 
team and validating that. Will post the V2 accommodating the latest changes.

>
>   arch/arm64/boot/dts/qcom/ipq9650.dtsi | 48 +++++++++++++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260512-ipq9650_more_dev_support-b64369bce88b
> prerequisite-change-id: 20260330-ipq9650_boot_to_shell-159027d548cc:v4
> prerequisite-patch-id: 16dd91c965e8c4e4c9da7c077f5f6e5f56624149
> prerequisite-patch-id: c74b31333eccd4eba783b927b7eb0bdae27ec576
> prerequisite-patch-id: 940367fceba083009275adfbf26cec848e676915
> prerequisite-patch-id: d00248eca6cd1203ab16aed75a6932581d90321b
> prerequisite-change-id: 20260511-ipq9650_tcsr_binding-70d665950fdf:v1
> prerequisite-patch-id: 12a6b83739dd22ca8a25507dced2e56e5cd2fe4e
> prerequisite-change-id: 20260512-ipq9650_smmu_binding-36dc05d39860:v1
> prerequisite-patch-id: 92f58d1b58fd36313dd488d024e7deb95fc35ce7
>
> Best regards,
> --
> Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>
