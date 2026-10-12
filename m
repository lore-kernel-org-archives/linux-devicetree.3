Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364E73B895A
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 18:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831408; cv=none; b=uyhmuSU0XR4yarQSKdYbzVkihBubOH7ZPyGyNoeWIzxkOxIu/errvmXDhggQQEXYdRSEmonS9KtQuC7GmVthNhUugwKrlytOPAdE25NvFoLBlOuia7O5N6SrusSmdIF9fXku4H7UNRty+fVM/6M1hzFmLu2M8xVMYDeKi24MJtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831408; c=relaxed/simple;
	bh=+64KFNSGBX7Vz/6dKUW4q2vsU2SoIR16uU37yUrhX3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbSInjNIi/etGFJcJyLXJeDZ+/yKv205rWmrGAk81zz5nQ3p9moY8KrwPd67lEIJZtEWbAsIhIrzTOlcnIvPHRncP+QdWNvrlB6vR2gbmF6aWxm8/IdthjN2mpfP3B19q3YvjNDGHU35hyqGEJsgJ0R49KoVF2SRrp2NkOA/G3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PRqmmG10; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KXT9JdyS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PRqmmG10";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KXT9JdyS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHv51n3466854
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 18:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vOEKkonEgbkbhRs6JRGz2EJ1
	ry/BUCqhg/c2vYmmoyw=; b=PRqmmG10IpnegtQtDCWy7NlbwqG4C02FXCkOjm29
	bP0zi3zxx3LzXRNxaOYU3hZzhplZctalnjV4yBhP55plnhPViHQ+ytNv5pbGHoke
	rFo7luCURR4B7jvLXXt4jxmPtJdtUsCJ80cJjxQJq1cwJR88dIBDy04trbmBQbI3
	GoUfCzFHZT6ClFC+Nc9laB1xAW7LYUii6P1x00Qirtem1Y7Aq7PhS9xITbdDjkcG
	f9TBiT8rrL9vGunvsAUYYXsPpgDbP/7+aZ1CilBAOhsXLGvMJ3T4FMJsJAxYNKqs
	g3YaAcA9e8sYl4JtajGxa6LJPRo/djTP013nbYqMVotzkQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1uk3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 18:56:46 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3515266f6eeso4148135eec.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 11:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791831405; x=1792436205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vOEKkonEgbkbhRs6JRGz2EJ1ry/BUCqhg/c2vYmmoyw=;
        b=KXT9JdySQM4OTCyrX7kQhrBj2Hu+uEHGNNxTcJawZhdQZhZ0jC5grQCbd5m9dw0kTv
         GUKYb2aKbk1C9o5T7mTw9rIPEoVZbxgj874YYWlS60QmMp4DQenbLVYY5J4lQF4IvSnP
         kerEQqnUUcO+o4fmCYPPfgkXRvWr8AvpCD1TViu52tyC3gc3uY6LW5rxpApAz9FM0BCK
         DHAWerFW5285eX8YSPhqUegwlbBoiLoK4XT6wYqCEiC2Zs9LnnjYC3gk1eyjuTDArol6
         wr/rLiDFcL8MfAOw29PuAeQqEAiFkuYvZ96taOn5sa7cSzIp1I5j4Jp4Jlj5KadtRsaL
         cuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831405; x=1792436205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vOEKkonEgbkbhRs6JRGz2EJ1ry/BUCqhg/c2vYmmoyw=;
        b=CgD24BgHQeMuHdOxwgxYcn5qQm7uvA1KBgNVH3++xwpbLd05/Qwm0IG5o06nK+o8w1
         JOK9BSEQgjKsMHzw1FvGFLHtUXKYV4sqmsxzz7IiWGYVU5BmBB3Ctxgm/iCZ2DWEAavw
         QxN9iBkBdL2wo78R1i8NrcHTkeEmReb+nNU4FYtPOqQ1Wor+6BffIOI216C/C35QnXIR
         snJWhtCixe2UmD9DGnWSwewYN+hGpyM3/JRn7Na4rbjIZV/ZAXqYrZmH418UiFKPCedn
         694+Wh8E9xllH+mT8KJtFnbWHPZv0lm9WKaKjn4bNc9Y+LQhxbHwhHjTkWgA1RwD6E1D
         F/jA==
X-Forwarded-Encrypted: i=1; AKwUvBxnHIwPjdRPOGEApmLc6LB7vwMNDe+uAmO6hQEd5XNPLIl0WyXx4DKvZeReoZM4y53XbLcA69L9FOqB@vger.kernel.org
X-Gm-Message-State: AFq9FYIcINEub+nu7w7U7wmmilgARvtVPajgjLBoax4UXxi8+1cwjdHK
	bqMRQ/8tdsU4MWrXgMYbNFQ8w/LHZN6j4mFxbK0+NbGc/l4jk4r6BVSp7q6zLFWG6WVjcWqTI0y
	d6L3mylyOpb8lKSCx3El+K/Tym0qCMb11o/QLQhKBgFn2x0F/UkbQB4+hMR0Sq9X2
X-Gm-Gg: AYBFou2xcQamThj328NvNbiVE6zG98UZENfZh7p0/FiZlV5amWTSqfEMuptl/viahA8
	Rltysmfk6GPMnk0wUgeecFWxFyu7zp4rC/Luf3qZRokGUSaHcDID5UMZ8M5v6DAGXVsmiTTFEks
	LKT87rIpabnL2kaW+UzDtHBe6R87NVG0qSNFYzQ5IJuR/3Z1KvrFID3/T6tSP8kjoZ9xz92bZcM
	BgzX2x14ns4r8lNduZ4uJTncog749ouZXl6xl6RDN9cmh7fQVIoLiLJftTnRuX4rltKbFMbJNKm
	TZOTxYLCdUyMC6c72DuhHWwLCbuIEyPKKdNdvK9g/LB++RDcWT2fRm5W+qKTbfa89wxt3ez9GgE
	uYVRhnlxFnS5aZnpP6d6TcWXK
X-Received: by 2002:a05:7022:295:20b0:151:6e80:baa9 with SMTP id a92af1059eb24-16a5e49fdaemr13126148c88.12.1791831404782;
        Mon, 12 Oct 2026 11:56:44 -0700 (PDT)
X-Received: by 2002:a05:7022:295:20b0:151:6e80:baa9 with SMTP id a92af1059eb24-16a5e49fdaemr13126117c88.12.1791831404198;
        Mon, 12 Oct 2026 11:56:44 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a32eb7ebsm37485490c88.12.2026.10.12.11.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:56:43 -0700 (PDT)
Date: Tue, 13 Oct 2026 00:26:36 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: defconfig: Enable LT9611C bridge driver
Message-ID: <as0tZM1OFsL5Lzld@hu-mdsor-hyd.qualcomm.com>
References: <20261007-master_lt9611uxd-v4-0-9986704e2a7b@oss.qualcomm.com>
 <20261007-master_lt9611uxd-v4-2-9986704e2a7b@oss.qualcomm.com>
 <701e5e45-f607-452d-8223-c987427fb34f@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <701e5e45-f607-452d-8223-c987427fb34f@kernel.org>
X-Proofpoint-ORIG-GUID: eZ4wBcRaLM1G1_KNmbAVRYziZWvW3-X8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3NSBTYWx0ZWRfXyj0XyQpBcBUE
 8etxVDCwHIxSKtFaJqvUF/uzMCVs34I25qurKZB7oayeojR64iYadSdZbaNPUox3Mn6+LpnjngU
 +1yAyK2xKC9HXzl/JBpJ+n57iTxQ4Pk=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acd2d6e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=9ZJ6AgzfprORt8VdnxIA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: eZ4wBcRaLM1G1_KNmbAVRYziZWvW3-X8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3NSBTYWx0ZWRfX7UHxJ2Kpur9D
 /IkqfAONSGk+MDUkUo/L7GRN3Z5k7AKgzsX3FXGz3W9CRAhffn90l+mBUiUPIEaf0+gktm36gCD
 EuwY3Xd9Bv9/SZNrxRcgdISi5Mm+SLXvGQmYASbn34DNL01jlpGuBJ9LuQwj9iDTeZu2FE0hkoW
 UP7mbdo24kquYxKzuOGpoB2h9m5T1wen5HYtxlX8NGo9ts/76BODPfmpz4BJBoRwzwCyZ0UVtsQ
 bQj8GMGB963AAVY/z+P1mBGUO0piO6zJA/S43Ne2kGRBi4BZ8RaIKKjNigxkbwbZk0LZEtCSNeq
 HJj1Nsnzb8H4Wo4lKOwxSKDpb5M3+I4TM4gLMvuuDz70dtKEpgGBcETvwtC5076q3eaRImToUxO
 XFEAt/cEwsY3ri6e6tFoXSajDGg9Rz/MzFlIle8D5WgJ8l35FD23d9QnZ/VpJG+g4kJLI5T8S6c
 HpoOVYDtdQMTgMPUJgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120075

On Fri, Oct 09, 2026 at 01:50:39PM +0200, Krzysztof Kozlowski wrote:
> On 07/10/2026 14:51, Mohit Dsor wrote:
> > Enable the Lontium LT9611C DSI-to-HDMI bridge driver as a module.
> > This driver supports the LT9611UXD chip used on the Shikra IQS EVK
> > board to provide HDMI output via the MDSS DSI interface.
> 
> Same feedback as v1. Why every second defconfig patch from Qualcomm
> completely ignores the fact that this is not a Qualcomm-only or
> Qualcomm-specific defconfig?
Sure, will change commit message accordingly.
> 
> Best regards,
> Krzysztof
